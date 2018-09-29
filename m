Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4472AC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 00:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13569206B8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 00:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kEj1uVg5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SuMIzlxr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13569206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9vZalgwG9xnT1zEIeJ8ilZqCU2AuXb+F/RrgiIdayA8=; b=kEj1uVg5rY/R6CWIHuMI9j4vk
	A+Y6E+DL6MttzOctZ56mYKGgt8AvjZ1aPIm/HHP9ly1QqvHvZOlbxbIuWGpGyNUjkQPzN9NngBVA7
	EUdHDVV8VfaP9zJCgqt2LZR/9i7YGJF2ifcoR8ECh0GF70urNdqRDDldfsOUYy+mAOw8gSZAnUAzk
	R7mdRRbPV+e3x0CibNkYT/G8/oR+NeChCPHdpS0pd/sBRkMzrql7A+AL6NJNKWgoGPZHOmU4xUbbr
	RIc15CvBWXwNHLKGzaxBMsskpyLFhfzZ0JCQ7AWSFGC3D3X84PG8FI4ohgfwxLhc2D4xvea2zLfNO
	zjwmhoSDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g630Y-0000eN-9L; Sat, 29 Sep 2018 00:21:18 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g630D-0000aY-7T
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 00:21:15 +0000
Received: by mail-pf1-x444.google.com with SMTP id k21-v6so5314895pff.11
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=wfmKKXiwNohAQp1lrZp1NwcNw71FTSlA1awGwDmJ4nM=;
 b=SuMIzlxrXoVn2wWlTc6Z7xspq6QVsIkqCg5krK0WyVKRnrBq6cQlRX76qge4Au/S7j
 rzvcVEdc45couju6vEj0b+RdIkG9ngFf43Im5HGdyAjSkmPas5xLRWdmHx/XkoBO3SYn
 mW7N9Hu5+UeD6njV+azurghMqimYVF75WvD/7Dft9M2dHWjuQYR2aXDjfQC/8k1pbFtD
 ENNojzuGAmbh0tI9YwVGgzYBc2WhFwHrC4XYYZDwKS93cIi0d2d3AX3GhiS8RrHIoZG3
 Os5Z0/U7qh8Bc3ohmia9bUleRqnZTu9SII8I2hmLfSE+ihX0rW39zoiIeRZtwIQXLT0x
 YsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=wfmKKXiwNohAQp1lrZp1NwcNw71FTSlA1awGwDmJ4nM=;
 b=MdZvYF9hIHVnn8F604mJb5MPLpMfjcrV/3QMNM+6NnJDVcJULeaKhMMMgEPZONNn7H
 Hjcwth+DTz79cVGG4PMtI9LBvHHSBik7MvSmwjvpQS8PT1yaB/uqP9u6RXKNg67fioHx
 qnAOATPIKaKMNmDMBgT3Gw0JIzaDyRdoGA0r5mdeViSK2tSf9N3ArA1lNhwvEhG66AH4
 XrbTSePNwxMDhk3i+Sn+dHc2F8yly2W+/1oqrJeaM17j5AqwWEWe0qHJylbzqXEM3D9P
 7bc4C/tb5NYlR6CZtCkoiqSEa/J7yJvosfy6SdKPRevI45vPv3IRmr0pkhLzuWhJiQOo
 Rbxg==
X-Gm-Message-State: ABuFfoiP/eJm2miWVDt811DLYFv/rLjR2hPWRTer7Wm8t/sTZG9CFz4a
 Bs4WINmgyf6zKRIYCRxYrb8Yuw==
X-Google-Smtp-Source: ACcGV62dKiwIjya9GWKlchDzn52kKgoOS+FbJKccNEYspsST0RMqqKTRXVq2zhT5pUYFjgbcBiZf3g==
X-Received: by 2002:a17:902:7842:: with SMTP id
 e2-v6mr401522pln.104.1538180446414; 
 Fri, 28 Sep 2018 17:20:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s13-v6sm9855903pfj.105.2018.09.28.17.20.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 17:20:45 -0700 (PDT)
Date: Fri, 28 Sep 2018 17:20:45 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 17:20:27 PDT (-0700)
Subject: Re: [RFC 2/3] RISC-V:Support per-hart timebase-frequency
In-Reply-To: <20180917142308.GB15588@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-54e4fe3d-12d8-48c7-b1ea-df317fb3ff3a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_172057_293218_4C3C84AE 
X-CRM114-Status: GOOD (  12.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, robh@kernel.org, Damien.LeMoal@wdc.com,
 marc.zyngier@arm.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929002045.vwUFCkwJAJ1FiKYHSYG6zW4jYJ1UWF3eeeZ75K6Ulno@z>

On Mon, 17 Sep 2018 07:23:08 PDT (-0700), Christoph Hellwig wrote:
> On Fri, Sep 14, 2018 at 02:54:55PM -0700, Atish Patra wrote:
>> Follow the updated DT specs and read the timebase-frequency
>> from the boot cpu. Keep the old DT reading as well for backward
>> compatibility. This patch is rework of old patch from Palmer.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> This setup looks a bit odd because it keeps blindly overwriting
> riscv_timebase for every cpu found.  Shouldn't we at least check that
> they all match for now as the rest of the port assumes that?

I agree.  There should be at least a warning if they don't match, but ideally 
we'd just support per-CPU timebases.  We have those systems already, they just 
don't boot Linux (at least, not yet :)).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
