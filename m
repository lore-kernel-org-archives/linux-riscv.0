Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B73FC48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 12:06:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1B661164
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 12:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1B661164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wtv25xUEihBZ+wyzSM3NGpJ7BVElnH1RzJadaPlxpYs=; b=NdaxasLsuxrnxhYa54YAaYeUZa
	28maAOQ+oH4xDIaS2E6KiT2SSVq+nljS9pumzBHue30QJQdh/nCTJvN2el1fBJJCgpzzdKlPULLph
	hmG09f6j+d1zMnDLyYniBXNU2oWxlq2RJc88HiJbCEsAzc7o3psV7wcsitI91zV9VJdonAShjgrZA
	cnjKsC5oW9IJ9/CfwMRCJz1VLmAbZCa25osABVRKkwckHha8Zjmlk2fEIMH1dcx2yVX5uru/pp+4+
	gvtEsseQN3FUsAQz57xK5eVxvSJ34YaqkDG/3cAFG8JWxNR/y/v47Fv1GrKP2E5StWiKruQlEwBQF
	PhwXcsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvfA9-0074PE-Hr; Tue, 22 Jun 2021 12:05:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvf9o-0074OT-RS
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 12:05:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id w71so6218910pfd.4
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Y5Xd78GOu9lf6VGo75b/TA4qnuHXHBd8W++bq5LOH+4=;
 b=NL1K7FSeYlvZGEB8KXoGhN+/g5qyYPDTIiWCjGX5UcORupJdb/yXhs7Z5GwVqaX8oY
 oho4+RSnvmXCojlsxXcfaeS+oC4Hq/t1ehzUg/nQqDX9TWksefnRNlNnSej24o1H09gI
 AfKJXYQX/y+MtrmADeEe1OuecTCzOffJsLGxMYDiS8PxjF8e3cK6VFct1RMI5HUrmaz9
 nIzl8Bh4Xe+zJGev9J5Uy/zvW91o0q3ugJqfmsYM7S4hcMdN2Gavowv9KmTkmTaWL1j3
 oWlbzbyTOlRfXYnefMMCM0EOKKT6s9IbVBzcfkQBlxWE7blqdEMi6zgwBkj8jsALWAF9
 n/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y5Xd78GOu9lf6VGo75b/TA4qnuHXHBd8W++bq5LOH+4=;
 b=OYhzX5u2ImuINW8alW701sSaqhN2xH/0quzPlBVK9vMlbe4sWAwAXsYiOTi/RkDIVi
 wKbpElRbHGUpwyhXzDmKlPI9J3+QeH/4PYFrJf49KRD3ijj3I7Q/0W8L29c9iSgXjz9s
 8DgcM+ob92Ejr2+UuFrXzjwgPlhSfkqupli1CgKeos2D3wOIs4WXkHofFrE79x0Ij5PH
 DcEVvyiLHOP2btvwlcb8i4vTiJBAdNlsV3FgIsL5ElnGVABsc6r94EvQdqYGUAbnJFkl
 usddTzHBUocEbi6ybtYT5PwjCCxFNAcj6v3Bo6MSPWjTef/38U3lzZkg0zSr1xl9K0Er
 gEdw==
X-Gm-Message-State: AOAM5329Ngcsy9I6+c2XfjMyy4W2iirmDpsM88i2MxM0BlOJQfJmfL5x
 H1qu2sLMOBbEKhW6VYkSiGPiYYzlRH18nw==
X-Google-Smtp-Source: ABdhPJwEmLqFurG6dRqn42RL70KDNQxGKHpGZp9KdHcv3WBMTCcNa734K58EiVGU/y+UeF/BvFcj3Q==
X-Received: by 2002:a65:5c4a:: with SMTP id v10mr3456442pgr.142.1624363530586; 
 Tue, 22 Jun 2021 05:05:30 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id c68sm5923987pfc.75.2021.06.22.05.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 05:05:29 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] riscv: improving uaccess with logs from network
 bench
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
 <e7d5f98b-5e0d-19b3-08f5-a7b49d542a85@codethink.co.uk>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <f54ec904-2bf5-0c29-d467-7465993d5d6b@gmail.com>
Date: Tue, 22 Jun 2021 21:05:27 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e7d5f98b-5e0d-19b3-08f5-a7b49d542a85@codethink.co.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_050532_942862_C88F0E6E 
X-CRM114-Status: GOOD (  15.62  )
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

On 6/22/2021 5:30 PM, Ben Dooks wrote:
> On 19/06/2021 12:21, Akira Tsukamoto wrote:
>> Optimizing copy_to_user and copy_from_user.
>>
>> I rewrote the functions in v2, heavily influenced by Garry's memcpy
>> function [1].
>> The functions must be written in assembler to handle page faults manually
>> inside the function.
>>
>> With the changes, improves in the percentage usage and some performance
>> of network speed in UDP packets.
>> Only patching copy_user. Using the original memcpy.
>>
>> All results are from the same base kernel, same rootfs and same
>> BeagleV beta board.
>>
>> Comparison by "perf top -Ue task-clock" while running iperf3.
> 
> I did a quick test on a SiFive Unmatched with IO to an NVME.
> 
> before: cached-reads=172.47MB/sec, buffered-reads=135.8MB/sec
> with-patch: cached-read=s177.54Mb/sec, buffered-reads=137.79MB/sec
> 
> That was just one test run, so there was a small improvement. I am
> sort of surprised we didn't get more of a win from this.
> 
> perf record on hdparm shows that it spends approx 15% cpu time in
> asm_copy_to_user. Does anyone have a benchmark for this which just
> looks at copy/to user? if not should we create one?

Thanks for the result on the Unmatched with hdparm. Have you tried
iperf3?

The 15% is high, is it before or with-patch?

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
