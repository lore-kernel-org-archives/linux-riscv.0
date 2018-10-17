Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15660ECDE3B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 19:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D2F21476
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 19:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ven4qt7Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ItfbfREN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99D2F21476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=AQ9tcW61gTLMhm9cCWDMs3ilROi8tcg3n4kuyBnVsvM=; b=Ven4qt7QtzlJvtIU6ydsOZzY2
	avij1GVwBj68VoDvQiN3fUmmVG/9+3wZvD66EH28sjgasCSLwksa7zMdnCIeLVTyd73iu8gVgBL3x
	PS0NPXhGrkjfYWop7/WfxvBGxTs+FUGQG36rbh8rlFANbBgOCdadgoPW30z3iCluEp1QaCSpa23UI
	0quMkZHf+Wjcq1K7hqkldz5XXz7ylqv8wL3v1IRkupE0kREEcLU1eCORZ/RzYAAXomxsv2wDUSUCE
	CTI6oqE4iDZV2iPle+ZrQRbiquqpN2SYlwNhSMy5GdNv/zETEWaFy1o5KHoebD1agLZUjL1TjrYVv
	lTAccSnOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCru2-0002eQ-Ax; Wed, 17 Oct 2018 19:54:46 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCrtz-0002dL-Jj
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 19:54:45 +0000
Received: by mail-pg1-x529.google.com with SMTP id g12-v6so13028431pgs.1
 for <linux-riscv@lists.infradead.org>; Wed, 17 Oct 2018 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BJr1/C70JPZ/Ve+JVtN3HHUSCoGyV/tGS4Jdf+5I9MM=;
 b=ItfbfRENhfVNYNwr2fxZmwTITjQ0rvFvX7irJynwuFT5dB4RbQKJFQA9DCgG7qWHsC
 uyVnxEBJBqt/PUcsftWvunVOveH2cT75Tr+UCnU5N01dlrInDZ7NrTJMOg4pjLN/pWWj
 7i+oWFYAbG7DRsoLUNNJzparQKm0ThUOiSjMdNNRA/nBDlJLmA/Dp/3Mn7iUecuJsf+/
 LckdXY+Qx6R5nYPXbS3f7CcFz8R/kacga6dNLcYjRTHMzBgsjNkkPQmVV3HzfXKgeVU+
 y18Bjuln6/2K2HcVFGOYyZvoEtCVLcMoRE/9xq0rrJXGvl5w7XBpM5h5VQUNv07lRN+H
 aJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BJr1/C70JPZ/Ve+JVtN3HHUSCoGyV/tGS4Jdf+5I9MM=;
 b=piZlPeIy6JIx0vXnJpkstDoJthaFDbrX6sRukV3rg3C7lX7iF/+AVjA5NMCzW8dgjC
 XLZLrv2VHD8CApA423LUkasBSlOF7O+pE6UnuL+w/x7cJn+aVqxtBcokJUXLJNnuMOKt
 vmu8gwf9wBwvNOz3FFIp+5/NzTSqh8zvDtI2Uqn1+k/ptNDR20WNCvFxndDaN54WNsKj
 fXFnUALC+HFeHeKn6S6wOpc/cu6SSQ1udAjPANqKehC6GoAt5TS7GfRcwiQSvDqkOE2Y
 cdQGHwiXxPUKBpb+lekrHKQhXarI/X7IdFEfQuy+jg4G63cD+Q1uWz2A3kxVPWjMO2YM
 71YA==
X-Gm-Message-State: ABuFfohDBy7aXTHF3jFbpG+Ez7LWhjjDxd+izlDRL+EA2tTqPj0DOpyI
 9Vf64gw+tYfcU7E2S4tZjZfzBMBXVzM=
X-Google-Smtp-Source: ACcGV61yvpGBHsm/ndW6faISl2ofPNJmmjj+RcpifMQrYE3gmiA1lmm8k0NRbADa/ttk8ZHmIjHa2Q==
X-Received: by 2002:a63:b95c:: with SMTP id
 v28-v6mr25544586pgo.221.1539806070639; 
 Wed, 17 Oct 2018 12:54:30 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p1-v6sm28084953pfj.72.2018.10.17.12.54.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Oct 2018 12:54:29 -0700 (PDT)
Date: Wed, 17 Oct 2018 12:54:29 -0700 (PDT)
X-Google-Original-Date: Wed, 17 Oct 2018 12:34:00 PDT (-0700)
Subject: Re: [PATCH, v2] RISC-V: Add futex support.
In-Reply-To: <20181017171528.GA5834@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-8d09cde3-412a-47f1-b964-ad6c70af26a3@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_125443_678690_B65BD664 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: linux-riscv@lists.infradead.org, Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017195429.a5P01Gdl_h8Y5tamF4tCD3GJ6Tp2jBuRuKWVPSACZuw@z>

On Wed, 17 Oct 2018 10:15:28 PDT (-0700), Christoph Hellwig wrote:
> On Tue, Oct 16, 2018 at 02:42:59PM -0700, Jim Wilson wrote:
>> Updated as per sugestions from Christoph Hellwig.
>
> This tends to go under the ---, but I guess Palmer can just snip it
> when applying.
>
>> +/* Copyright (c) 2006  Ralf Baechle (ralf@linux-mips.org)
>> + * Copyright (c) 2018  Jim Wilson (jimw@sifive.com)
>> + */
>
> Nipick: the /* should be on a line of its own.
>
> Except for that this looks fine to me:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

I fixed the comment, cleaned up the commit message a bit, and added this to 
for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
