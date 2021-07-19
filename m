Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E187C07E9B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B245610D2
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 14:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B245610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HYFlyV6aEt3HusScfS0cfXipQpH4tDFVsyGr8UXct9w=; b=aCKC/Wk+bYAOiLZmhK0JWI4SZ/
	nRgtIMBARasWSizPz98K+RX2ha0mDWYDeGAmr8DqToIC8CEVNMLTxCfQgEPca/ZnDdtfTCWQpH5kc
	BjXXtRm2JEpeIbCElwDDiIdl99fB+gW5J8C845DxrKZ4IPaughu+Sypeu0mNKMTCDPfqj+Wl7oygU
	Wt3hV63OpixF6JHcwBz0yyUgEMghGNr7PdZQSphSBnFMMfI9hrpgcIXKa4BTaaTQIkiU/vbUyuoH2
	aUMyCjMQ8gJiol7IpHcaCSGv0vgpuEieVyQCC7KoTpJc6w9ZzBwMl2M1Q7lRH5kjKxI2KRhChd2Q/
	/dsxuyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Ufl-009xuv-8B; Mon, 19 Jul 2021 14:55:09 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Ufh-009xuI-Rn
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 14:55:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id gx2so523131pjb.5
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j4n25LkU4CnK8pwnLWimZ7Sa+0IJqfeinuqyN2R3e7o=;
 b=iLSOt+G9lkCGU+d5/lqsILcxRWOVieMwPb5T9+VJCUgBU1AZj7AeA2Az2GHSkIE2FX
 BM1d3VhKGfgSEVemgkM1GYi9by9mx6iYuEll77+4JtAwUnsMtOmu2EdJRe86++7dauaU
 w+sk89qtXOPkcCZ+3spGwAR67ZTzIQT8NkPtbzog0GDqSPeishdlkOYSMtBh0me15gnR
 PvpJQHo2EziXRIGrltlJT4MXNpesSnst1GqJADlOpFJi+iHJLELE4ILxrpyhcicnIdKo
 BsWgQPqzXb0GzH+CS6u55qSZ0G3oJkvH9BfvRuSlZFAy30BkFPZI0wqTWjiq0UsFh2D4
 aPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4n25LkU4CnK8pwnLWimZ7Sa+0IJqfeinuqyN2R3e7o=;
 b=rxgG1b8UIrS0EHIYvcZsU5b7wMYcbv0XFOVKOYeO6972lsy4KmePTH2MsNVCoVPHXf
 wge1p8K+mag1cjW4ZoduE54hVbT70rvnIXLfZRY4CbwjQbFV/zSdA+uL6CRHgREh1eHU
 kNhifuLdNCg+EAeOWvD9TrW+H+1R3XEzv9mroe+vfn/UFxdTtIW31HdmDnYt7olrAG29
 gvt5cR4XAuZpF61tTlOuOqcwheeUbCXPuhDrMd1SsyFN+LdQsYNeVcDdw+ZrF7Qljrpq
 33xOcKgAtGUZ4ZwFKNz1eBLFsZA8q8I9XPID1DYXvDMtNzawfoBD/MKA4Yr6Ei479uJ8
 lIEA==
X-Gm-Message-State: AOAM532EgrQuddg0BhAsivklqHVkZQqeYkJuFRgp5usD3sd/xo7WH+zu
 a2OCnG9x7p19pA8v7I6pXvE=
X-Google-Smtp-Source: ABdhPJziBxO9jKYosKBpaD506GGx3R4/n9hiqLQjlkpwagdiRsADMfGyZlJ/I13T13nVeE6pgQrlIg==
X-Received: by 2002:a17:90b:378c:: with SMTP id
 mz12mr25784888pjb.122.1626706505061; 
 Mon, 19 Jul 2021 07:55:05 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id w69sm20640149pfc.58.2021.07.19.07.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 07:55:04 -0700 (PDT)
Subject: Re: [PATCH v4 0/1] riscv: improving uaccess with logs from network
 bench
To: Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <afac7502-5de9-1fec-10c7-03dbb06a3f67@gmail.com>
Date: Mon, 19 Jul 2021 23:55:01 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_075506_479098_DC0A8A15 
X-CRM114-Status: GOOD (  21.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Please do not bather with this patch.
It still have bug for rv32 reported by Guenter and I will regenerate the 
patch against v5.14-rc* since I made the patch against v5.13.x for this
patch.

Akira

On 7/19/2021 9:51 PM, Akira Tsukamoto wrote:
> Hi Guenter, Geert and Qiu,
> 
> I fixed the bug which was overrunning the copy when the size was in the
> between 8*SZREG to 9*SZREG. The SZREG holds the bytes per register size
> which is 4 for RV32 and 8 for RV64.
> 
> Do you mind trying this patch? It works OK at my place.
> 
> Since I had to respin the patch I added word copy without unrolling when
> the size is in the between 2*SZREG to 9*SZREG to reduce the number of byte
> copies which has heavy overhead as Palmer has mentioned when he included
> this patch to riscv/for-next.
> 
> 
> I rewrote the functions but heavily influenced by Garry's memcpy
> function [1]. It must be written in assembler to handle page faults
> manually inside the function unlike other memcpy functions.
> 
> This patch will reduce cpu usage dramatically in kernel space especially
> for applications which use sys-call with large buffer size, such as network
> applications. The main reason behind this is that every unaligned memory
> access will raise exceptions and switch between s-mode and m-mode causing
> large overhead.
> 
> ---
> v3 -> v4:
> - Fixed overrun copy
> - Added word copy without unrolling to reduce byte copy for left over
> 
> v2 -> v3:
> - Merged all patches
> 
> v1 -> v2:
> - Added shift copy
> - Separated patches for readability of changes in assembler
> - Using perf results
> 
> [1] https://lkml.org/lkml/2021/2/16/778
> 
> Akira Tsukamoto (1):
>   riscv: __asm_copy_to-from_user: Optimize unaligned memory access and
>     pipeline stall
> 
>  arch/riscv/lib/uaccess.S | 218 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 183 insertions(+), 35 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
