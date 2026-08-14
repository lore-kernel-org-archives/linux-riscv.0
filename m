Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8941C5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZ82sqPSmYRmERMqPL40Xfh4og2FSHTEU3EqyatDjic=; b=fBg6OjnSPjIdTp
	V0qqUyInHsFtsbJzvb2Hy96n6AlILfevOW5XTA+C6eGtzmOhp9G2lCSJ+aHyCXioD9AO/bQQwsv0f
	5Zfg5kp3BeFVk3f6j3cZ6Z3sXDwb4f/m7JPSoT+wgawzGAgNdbEmyF7xCF5YWXj0CcRsR+CsNZIjs
	nc0tfPiXlrdvOuC8SjGo1NyqlKAyt6s6NNSlhq996pRfaLAbtVzv9ks6N+Cg0juzfXiPcmHEEwKv1
	2ZX0NAwjQUCqoBl/1O8+MMmfh03zJ1eXbOYfiL2G7iNldN1EX0WJMGj0VWCyFiElHXLVH1yNhN3gl
	+wFt6EnF2X6B5gv+f0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyLy-000000038by-2FTL;
	Fri, 14 Aug 2026 20:18:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyLw-000000038bK-0meZ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 20:18:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D05144335E;
	Fri, 14 Aug 2026 20:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251B91F00A3D;
	Fri, 14 Aug 2026 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786738687;
	bh=pveHsKdz8gG8JBaNaiMBJjqdWpme2EapoXdhRL06JAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CPNwwRaU4usMAhjJGFQi1xSqpKOi00H22jbPhK8odmefHDMZtFXVPIWIg9b0WGund
	 1LA0M5D3tN7bg9nEV6iFmQwKeDt0CfcBV1dbhuunIKiCps0S63BLH3FjT8OoVsloiQ
	 FvVyXK3Pzhql/7dlBpoqXn8zrE84KBzNPP8UIEw5XH5iYcqM9fEuyzo6t3SW0qPJnR
	 ooS9lSh/9uEUkn51ivmCwy1v3BKgrzGZm0+DeO18pNKQ7GK1n+AyGxwMDk30Z/61jN
	 YRrBmR45mBVm9P3cpBZ4vgP3mbAtl81INMe3hPH3PceanrjSLSoFgYWDhNKxEzV/+F
	 vJ5xN/uu4Vu2A==
Date: Fri, 14 Aug 2026 14:18:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Xiaofeng Yuan <xiaofengmian@163.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nam Cao <namcao@linutronix.de>, Klara Modin <klara@kasm.eu>, 
    prabhakar.csengg@gmail.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] riscv: fix text patching on minimal kernel
 configs
In-Reply-To: <20260814082742.148403-1-xiaofengmian@163.com>
Message-ID: <df715feb-c3ba-e277-56ad-6c24efd534f3@kernel.org>
References: <20260814082742.148403-1-xiaofengmian@163.com>
MIME-Version: 1.0
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

On Fri, 14 Aug 2026, Xiaofeng Yuan wrote:

> This series fixes two related issues that break kprobes and kernel text
> patching on RISC-V configurations where CONFIG_STRICT_MODULE_RWX is not
> available (e.g. CONFIG_MODULES=n).
> 
> Patch 1 makes the EXECMEM_KPROBES range writable when
> CONFIG_STRICT_MODULE_RWX is disabled, so kprobe instruction slot writes
> do not fault on read-only executable pages.
> 
> Patch 2 makes patch_map() skip the temporary fixmap mapping when the
> kernel text is already writable, i.e. when CONFIG_STRICT_KERNEL_RWX is
> disabled. The module text path is still gated on CONFIG_STRICT_MODULE_RWX.

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
