Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9EDC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 18:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG6TID1tQ1myQikyHNrHbbyO/WYkSnc/NKfhnZUZaw4=; b=3ydvVhsGGjGSep
	i2OY8cP6DG7k0cI1kawCr+cIIx8RiMRFupsvVINyhLUPMpfNDjWvICdnH1tYRpjhzjnLPis7xawF1
	ODJr+ei8Vom8x13qp2VXi7HvCCOfoj2Fat3Hgu/rD7mNxtM3qNrkngq2pqwODn1fUqaOW3YFUdt4b
	CP9L+45GrFw1tp2AlECM/ALcoFDTJG2rHhGeoMxgj/I0iZlWFCbyMpam62+ddXePuPOomxX2ECCgD
	Na+Eb3Wtl0+SdzWS34i2PzY2XBB86nvGzTYYyXS5MCV3n+vdD/G0ChvIDh+s6rlbGgpzA/4Iuf3I5
	rU6JNrjiijQH56lcAiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mJn-0000000GaUH-2wBq;
	Wed, 08 May 2024 18:47:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mJh-0000000GaRx-1lpc
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 18:47:05 +0000
Date: Wed, 8 May 2024 20:46:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715194017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q6o7L7QXNQvx0xNXZVcYSLNmrfCQqLomfxFWX4xHH3k=;
	b=QDlqL98lFh60txNqqltm1jSCSe1xNNpupP3cvpljw2mRkb6R7qLm2HNoeT+B6uoiujRA6m
	ulcw4/SrYRftc0zqWJqThQHT1CYdJKymPSpPawo9QWxVSFLoCyUJX/TIP4/9rNPYKSw+yj
	G7vlhK5heF5/RFsVvDsTo1mA1Sbkd4ZiZbs5fWwPuF1uap0gQbB1ZDHu0RZXzYxQ2mtUen
	gkc/M8RlXLGtQkUFT+5HoZYmiQiHnXcsfv18/FMNdLQC1g6BSKYeRLI7VOapYHfYye4zzY
	JAHVRuvSvvflLm7ZSGprEy90tef2bV/8d4pG7Y8+31vu/0qMYyTxTniM7JHuWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715194017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q6o7L7QXNQvx0xNXZVcYSLNmrfCQqLomfxFWX4xHH3k=;
	b=0MhzSA9x0EOPrnFl/KOGroBOQUAMqQV0jrCVc0bIBA+Vx8Jul/sryS53O7hGT8AbFSWnh5
	gDEIhEFQt+G9IMCw==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Don't use hugepage mappings for vmemmap if it's
 not supported
Message-ID: <20240508184641.WP8ok_Hg@linutronix.de>
References: <20240508173116.2866192-1-namcao@linutronix.de>
 <43829e94-98ae-46a4-a3e6-dbabbe94d7c1@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43829e94-98ae-46a4-a3e6-dbabbe94d7c1@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_114701_825509_B63FE357 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 08, 2024 at 08:22:43PM +0200, Alexandre Ghiti wrote:
> Hi Nam,
Hi Alex,

> > Commit ff172d4818ad ("riscv: Use hugepage mappings for vmemmap") broke XIP
> > kernel, because huge pages are not supported on XIP kernel.
> 
> I don't understand why XIP kernels can't support huge vmalloc mappings,

Me neither.

> so I
> think the right fix would be to enable such mappings on XIP. WDYT?

I agree that is the ideal solution. But I don't want to send any new
feature to the stable trees (stable folks may even reject such patch).
So I intend that to be in another patch.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
