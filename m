Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6DEC83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 03:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyK9muvEJ2TfYVYMoeaNkilL8vDozvMlD9xwlYGG0Gc=; b=FGMU59fSbf+phG
	nXSGuxyUoHBurhLzAwGLD2nocVudh2SRSaXFU2T0Y6BwZGO9ttyLf4dIC0rJ385VI0b0fy+YwAwn0
	92zzTm72TPdIqnSyN5OEVf0+I3UsH8FXDu1o/PrZeK1PfrQBtFFEwatVyxgI7VAiSl8RyUKhVDD/b
	QU3fhottjpaWmdZP4VISGNml8JYfeJyZ3VaiqJ+bV9ZCBGfMModLbrtf/0eiOknEa7tWSCsixB5sj
	OACEKWAqgOQyANhy+Y4HsxVED4Zjet9juspZFDvB20z1cp3ngDaUiIE+8jYC2k9UVtvfYixq1djiE
	riLstsasokkMkR7wuK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVwC-00000003ptW-3xCt;
	Tue, 15 Jul 2025 03:02:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVwA-00000003ptM-3uIn
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 03:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E300761483;
	Tue, 15 Jul 2025 03:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A7CC4CEED;
	Tue, 15 Jul 2025 03:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752548553;
	bh=5iBcZMnLTgHM9MfCl/SxgkXgSxL749d/lCzwTN6LZak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqEiUlXVD5AeZdBDRBxLaOQn+hgXov9fxSBQWT8uTYYp9vsKO8QSR/jXjgQvkuV+d
	 fRWUiqqP0OP9IqNCtfEGF6CrMA+zwkF5xl4wKjhfrAB5Va02RH0uEEmu2EEaUdQalw
	 y/808ihsaNg2b+792mzTtvNFN/cwUEK512qwUdWJNrwNW/rwGaKF0vZ+M3Im9bJt/T
	 QJhp+KNq38KcN8Cod4FTuRFHV7Cp32j628ZfME0aTdzMFsUiCrx6UK2Sh+5+oZeIsL
	 dYGGKkS3B92CI+tGPrnKxRwPeL2I7X0DGnq+Vu4pS93YxPR4aL4F6Cvw8cMRHGbFAK
	 nSlIokg2F//yA==
Date: Mon, 14 Jul 2025 20:02:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, alexghiti@rivosinc.com,
	paul.walmsley@sifive.com, bjorn@rivosinc.com, eobras@redhat.com,
	corbet@lwn.net, peterlin@andestech.com, rabenda.cn@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <aHXEx2a0qgiPXhBS@x1>
References: <20250713155321.2064856-1-guoren@kernel.org>
 <20250713155321.2064856-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250713155321.2064856-3-guoren@kernel.org>
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

On Sun, Jul 13, 2025 at 11:53:21AM -0400, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The early version of XuanTie C910 core has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> This problem is only observed on the sg2042 hardware platform by
> running the lock_torture test program for half an hour. The problem
> was not found in the user space application, because interrupt can
> break the livelock.

The first paragraph states the problem was found on both the SG2042 and
TH1520, but this paragraph states it is only observed on the SG2042. Is
worth me trying to run lock_torture on the TH1520 for many hours?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
