Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E46C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 11:02:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE0260FED
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 11:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFE0260FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A9u/PJGNjPv3eaNqg9PwURR3qqmf8mYnFxhuHNTIrb8=; b=d50RhXvOHAGpIcjvCZ9JNyLSEd
	644p7LwJVITnj1mTtXL+SaBWpiZpKt8mAj/fhPR0S/vRRcG0+6xDekupoJhoIYmdK6e54/W+pjVC8
	ICA1hp9K2LFfZOlGH9VUf9VPyuAKUL/EKaTOP9cbuC7HLpiP+jiSaz7sbDRL+guh/yfVM60Dfa+Nc
	cTqg02Dl0vnsorvMaN8EK33K1Cj0yRuxgoA0VlRCAF1D+0F6/2qAtOjE+3UPsB7MyFHy2sLKgQtCr
	oxkouPoch3EQc9WFy6sTbVhvlCo94bxWqmKGV/ntfYBV4dbW5mNtX+/V56uyVyIpxilowLQb1Wfrd
	42nvLLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE8Sw-009j3i-0X; Thu, 12 Aug 2021 11:01:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE8Su-009j2z-2P
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 11:01:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id l11so6799035plk.6
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DDhtQcuUXCKgq8bSzq02Y00UE56X0SuRgSK70Eim4XM=;
 b=d4sdlcw7YE/VfJgcdlLPCBuC2gCpccfOHVU3kK6kij74jirpezO90YeAtR5Q1CIFRQ
 htiiMsgQar06AZWvqJQCfMTiLaytxaEqGCOE9eO5K5vAPWIYdOUR5L6jz16/gxLKYvR4
 hXNaBP6bM3rMR6IVH8rcCdFhQM2NK04hdskqEiF5QtP/rrU6SDvVJWAun9UY368b+Ozk
 F86drh6ecc44tL4P/Uq19ndgPbL+MJELVPtuQTgtRETtHWMNg0z0DWBdgKqIgESicRBK
 fgrxBozUc/CbSLFU8y638qymYfHXEl7anT5U7n86lhJPG2DjHRzy4aGZEmK4mgvHS7/7
 814g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DDhtQcuUXCKgq8bSzq02Y00UE56X0SuRgSK70Eim4XM=;
 b=FvEU0aYF9Ra0x6IbB1UGqaNHuy0ADN6r1p1gNGcixIuO/u2t4yzppH9EBN8HaiTTHW
 ERBIThr1KcvDHUMnP3HHvelWcx8tJqFyBF2Rf7BjYm25ti0dJCZdRUF2YzX+86J0HRMs
 mJKtI5e1fm2qI1dnOEdSjgZbFE2sRPgIZ26c76fBSBh5WhDExlFKA7IubviZ54jGnvFF
 9TqVf4oZlts+WOPL+STs2hoKxXVhx0lrB1ySbK9Bn7QOWGyMYFt4kjBe/Vd+Mj4lTEew
 OGZZDiqKADEjd9rcZuKZ0r4xUeLakVz4cY3OQeVNPDp2DTawgNhj3uykVy1r3zZbI2Sq
 ecug==
X-Gm-Message-State: AOAM533WR6TDKEApITgv/TuA8OvlFvMfnmW6RVSryILzY+vfTC/oKGCC
 K0nMC7m0xArUj4CN9UHWhQM=
X-Google-Smtp-Source: ABdhPJwhTGWJfHP1L7Xsaom5NR39UWbE+gu2q5ngSMcRIsKLOHmQ0bilIejQVi5Bx8Cf80be8fUtPg==
X-Received: by 2002:a17:90b:3a8e:: with SMTP id
 om14mr3750992pjb.73.1628766094047; 
 Thu, 12 Aug 2021 04:01:34 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id p21sm2915208pfo.8.2021.08.12.04.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 04:01:32 -0700 (PDT)
Subject: Re: [PATCH 0/1] __asm_copy_to-from_user: Reduce more byte_copy
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <a70451d1-57ad-6b49-24c1-6408ef94a959@gmail.com>
Date: Thu, 12 Aug 2021 20:01:29 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_040136_185675_159DD8A0 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Guenter, Geert and Qiu,

Would you mind testing this patch?
Thanks,

Akira

On 7/30/2021 10:50 PM, Akira Tsukamoto wrote:
> Adding none unrolling word_copy, which is used if the size is smaller
> than 9*SZREG.
> 
> This patch is based on Palmer's past comment.
>> My guess is that some workloads will want some smaller unrolling factors,
> 
> It will reduce the number of slow byte_copy being used when the 
> size is small.
> 
> Have tested on qemu rv32, qemu rv64 and beaglev beta board.
> 
> In the future, I am planning to convert uaccess.S to inline assembly 
> in .c file. Then it will be easier to optimize on both in-order core and
> out-of-order core with #ifdef macro in c.
> 
> Akira Tsukamoto (1):
>   riscv: __asm_copy_to-from_user: Improve using word copy if size <
>     9*SZREG
> 
>  arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
