Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722CBC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 16:53:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4206A218FC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 16:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUpMYM6k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="F1VZ9JvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4206A218FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+3oRn5CRL9KTU6+3n6sWV3pBc+/vbYdb5lmnUMHIS14=; b=KUpMYM6kDF9Iyu9buA2Qju0Ss
	JQULo86YlPz2U/HZ0l2v44INEO4ORa7OCBrZgxHgmNYf7SmJpkJ6CcwJzrNFX5zt8sud+fdGVjvew
	x/qrkgi9GYyj6nrGHQbNCxj/BNptaXgo3IkFtK3gC5m48Q0AEYlneagKKgMN12xVmXRtEKO1B5mRT
	h1da9vl2WkCJX456luuyQODBUyg2iMAAk5bkrAEbGP+21KBhjpcVZxwnpj+zpGVrueqCi1bSQ4sm+
	/UqDxcn/QEEYCqLnJAMWAoO7ATwlYuJ4rNrVI0RR254jHHyj+G29+iwJQrGoRCHDSfbQCjFv0grMD
	oek+jtvwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcCQa-0006Xa-7K; Wed, 26 Dec 2018 16:53:04 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcCQX-0006WF-9S
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 16:53:02 +0000
Received: by mail-qt1-x842.google.com with SMTP id l12so17734687qtf.8
 for <linux-riscv@lists.infradead.org>; Wed, 26 Dec 2018 08:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KwMLCwUPmTyjB5Pj1lp5mz4Va0BflBJ0qIj28Vl0AYs=;
 b=F1VZ9JvABZHl0spaxH2eIKcRy2rGKk48H4bG+bpEEY8FbuHPaFkODM9Q4dOoi/eYi9
 6dPfETCJ7pNBpZSMCofZIGKP8I8Mahx3jf/HDWUp2m0UlpBp6+PCWrQQyngSPiA/P8GO
 1gYeVvFFg6TFfNEdrBC2NMm3wdT2BGVCBHvNVtt7Fp6HX4iReVMyrAyqC5wVvJorq180
 foE6YeRZA51+vND9CEy8xgtW8pwVkRHwmiBokeGDUKJvnMcF1Nhf5ZXMpKWnJ6IaEyPW
 cCRXiQeCGxJ0Y0CN0i5s9hP15DX0dYl/ntquyGGUN1xxG4OznOk+YToKSWoBNNtTzCzR
 lX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KwMLCwUPmTyjB5Pj1lp5mz4Va0BflBJ0qIj28Vl0AYs=;
 b=LN6lD8Hi9fgShWs2eZVIzvkP12yBRSwyro/0pHVs+rS2RlHBK5fOLhKLydGjEAlG8d
 c/L4Q5MP4NsNSDTY2kbUcUIccAN6Y8y0bgCvzSjMWtNviH6fKw7wLZoR5k9LYi6u0S4j
 QBWUXG//wmIm0iC5tdCKwfJaimkkX1TG7ofkoUv84melNKokSfENIZQKLQ4ipkvnbLRH
 WHWnw2qRnr1TRsWQHwLDa2Rxp8kIlW4mpZNL/Wl/8UfVWoxS7xu49NARC0hIVOvB3sPN
 Zn+2SelNhY+re63c+kkZboiRGfuKbEohPizi9gxR7LHgLsFfx2900u0ggZ6lt7n/u2kY
 1TWw==
X-Gm-Message-State: AJcUukeGzei6ZZdCYcOBApprYOiYG9C396seStkaV3aiHUgVD0aemBsX
 BcUq8fCjL40sZOteVFo5FPZ+GQ==
X-Google-Smtp-Source: ALg8bN67X9W5Wk0k3HufO7fWRbaVLwDavt0wOU/+w4ECRENWrtR3oRBfqYTX/5CnUad1duSCmNXPGA==
X-Received: by 2002:a0c:b0db:: with SMTP id p27mr19603568qvc.73.1545843169671; 
 Wed, 26 Dec 2018 08:52:49 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id v22sm13500839qkl.27.2018.12.26.08.52.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Dec 2018 08:52:48 -0800 (PST)
Date: Wed, 26 Dec 2018 08:52:48 -0800 (PST)
X-Google-Original-Date: Wed, 26 Dec 2018 08:31:47 PST (-0800)
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <alpine.DEB.2.21.9999.1812211124180.777@viisi.sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-ceba7c1a-7334-4869-a7d4-2326b59f82b5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_085301_329130_CDAFFD58 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 21 Dec 2018 11:27:39 PST (-0800), Paul Walmsley wrote:
>
> On Fri, 21 Dec 2018, Alistair Francis wrote:
>
>> When the MicroSemi driver does eventually go upstream this will
>> probably have to be discussed though as either the config or device
>> tree will need to be edited to ensure only one PCIe device is present.
>
> The right way to do that is to have two separate DT files: one for the
> HiFive-U board alone; the other for the HiFive-U plus the expansion board
> combo.  There shouldn't be any problems with keeping both drivers enabled
> in the defconfig.

We actually need at least three:

* One for the HiFive Unleashed
* One for the HiFive Unleashed, when attached to the Micro Semi expansion 
  board.
* One for the HiFive Unleashed, when attached to a VC707.

We may end up needing additional device trees for the newer Xilinx boards, 
depending on if it's possible to probe for that 32-bit DMA limit on the VC707 
or not.  Then, of course, we'll need an image-specific device tree whenever we 
put an accelerator on the FPGA.

Ideally we'd have a discoverable bus, but that's going to be a bit of a way 
out.  For now we'll have to get by with different device trees, but that should 
get significantly easier when we get a proper bootloader working.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
