Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAA0D3CC84
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 00:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOUqigYQPNsqjHcBhSuNWLhRla2a2vOIr8ebX/afxCY=; b=c3TXVT3UXP0uV3
	9jKNOqujtt8KXFJ1Jw64rfphORG4DGCRjXYGQsVTibAtsOpKRczNrDBJeJAXxbSz2v0BVgicD7p/E
	IFyof+SnQZDinN6a8lGBmvn6do9mHb9uhzmtTwiIy1ju52qp15QEKl4hBf08FAYrI6FEuATw/+Mcg
	1J8OdwSQWDsH0h8HwV+Ebtl7gXdS56hSIe0WgK3yYMne/4WVNcGdw4P/0Ly7urD00dcoy74co/Svn
	de2/mb+w1174vVcHL0IcLmOobz3d+1l9swrBeJB9vm2x9a9DKv2w+0NmHQ2mrtIp5eb3HbCzOuuil
	q2LgixlMP9FKWrbx3znA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgB5o-0000000BCnj-0NkL;
	Thu, 15 Jan 2026 00:20:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgB5m-0000000BCnb-1j3i
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 00:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DC3D6000A;
	Thu, 15 Jan 2026 00:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99073C4CEF7;
	Thu, 15 Jan 2026 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768436401;
	bh=2sEhA2J32gRYLjlaKzp2VoItieVdGTof+LBqHBRNaFc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i9JITMSuW+iJ2XKztzLyY/cUbvn18pN+iGQyTK1b6uaEVN/sn6oGJK6+KsTqOyltD
	 B8eGPCGUc09KdFq4GahQdX7YPz2tdCVToEOcht+dxEXX8mmDdDSmNfvL7dtS078+gN
	 +rdZHP83ZhxmA0v/n6U8/mJBTn6CRnwwRHf9xJ8OuJ930MgSJmLLFXkLiR6hEL24oh
	 6BtVqrCvQvC9sWyqdYIRdDk0sGr/yqZw/SXwk3WyybArDwEsaky+FVQU9wMdSns9Mm
	 WcaTPh8A+2zTceO24vMyW8+CSPWq4Vtu9mn6Emn9qjCJ07vwJd1h8l6ndsJ9D1K/b/
	 xfYZLER9vk7/Q==
Date: Wed, 14 Jan 2026 17:19:57 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: enable NLS_ISO8859_1
In-Reply-To: <20260111-nls_iso8859_1_y_riscv-v1-1-2c992bb2c00d@gmail.com>
Message-ID: <345da49c-b8b5-8538-6231-c614792c9092@kernel.org>
References: <20260111-nls_iso8859_1_y_riscv-v1-1-2c992bb2c00d@gmail.com>
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

On Sun, 11 Jan 2026, Javier Carrasco wrote:

> NLS_ISO8859_1 was enabled as a module with commit efe1e08bca9a ("riscv:
> defconfig: enable NLS_CODEPAGE_437, NLS_ISO8859_1"), but the
> NLS_CODEPAGE_437 counterpart is selected as built-in. The commit does
> not explain the reason behind, and it is not consistent with the
> defconfig for ARM64 that also enables these modules to mount EFI system
> partitions.
> 
> Select NLS_ISO8859_1 as built-in to provide both requirements within the
> kernel image.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> I stumbled upon this while scripting commands to launch
> qemu-system-aarch64 and qemu-system-riscv64 with debian no-cloud images
> and -kernel to provide a defconfig kernel in both cases. I expected the
> same behavior to mount the EFI partition, but it failed for riscv unless
> the modules were installed/provided. That didn't happen for arm64 as
> NLS_ISO8859_1 is built-in.
> 
> If there are no good reasons to keep these configurations differently
> for these architectures and only have NLS_CODEPAGE_437 bult-in, having
> NLS_ISO8859_1 built-in is more consistent and the EFI partitions are
> mounted more easily. This is the only configuration that had to be
> modified to boot Debian 12 and 13.

Thanks, queued for v6.20.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
