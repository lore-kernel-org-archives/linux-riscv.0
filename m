Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E39DC61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vg19X8nYEQXIOqnYa3a+j0b8JRlzAnfXqQJnixUTfAY=; b=jhN2ujEXlQKjkt
	1Ag6CUumkTHV/h7Jjz0912J4NeaT43yOWN8oEcQhAWt5N9CU8y1TiY4U4hBJCcdc4l1WwOXF7Yqit
	R4I4vOxTiDRpIz6pBN63K8V71yj1NPeiZ1ZT6QLktCD78WUF9uqIytetuc3gd7Pqgf0vxboMfUwzv
	rRPg1Wp+gZ4vZzRi//AW6/6H2W0/E00AsNCE0RllYh+Ae2ceCZmxIRf/830Byo5pXajipGGyDtoy9
	txUE0o8x3D6X/I+ILTvbBiNZgzHH8UoQzEWPk7odV7LOXI0zQoLil7NE2efMIPv9cTat0/SBlEwfe
	AAJwyVRb/ioD2aNpqEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Yw5-0000000DaQW-43CO;
	Wed, 02 Sep 2026 00:34:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Yw4-0000000DaQI-0WaW
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 00:34:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BBC9600C8;
	Wed,  2 Sep 2026 00:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0361F000E9;
	Wed,  2 Sep 2026 00:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788309278;
	bh=OdJylGa78WF2doU9FXC8lzmhghGNL2Y5XclAhve2yqY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=F+86Z2NMUvxCho1lNmTfOYrl7CDzh/k0LLIca39sFZCvi4pnrf4P6b5jpV9bcOhGG
	 heDkjqkj9SH+JnsZTlDT1JES7DWQcOpZ5sle+yrlPkWCdzBRvjfi37pNH44u3tN7Xq
	 UrJubsKos2Mct70Ip5SlWmXdonwRyNM4Gg615N14Ud14I9rLLVOdYCLJaJwLoAxVgU
	 qFx/3N4274mvIWUqokbZ7lzSIwiKWDna+ov6SwAnLC6cRuVukvtRRORRKIqQXrigKm
	 1rkOIcWTbCYmj4TGlkKXjTzfsmz3Dc6K7d6ix4k0PmS9l2LcbSa6i8xKq3uo+uw2eZ
	 NSRf8OsrFd4Vg==
Date: Tue, 1 Sep 2026 18:34:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thomas Huth <thuth@redhat.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Nathan Chancellor <nathan@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with
 __ASSEMBLER__
In-Reply-To: <20260813075304.75988-1-thuth@redhat.com>
Message-ID: <93f5f872-5d81-cab1-7231-a9da03dccc7c@kernel.org>
References: <20260813075304.75988-1-thuth@redhat.com>
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

On Thu, 13 Aug 2026, Thomas Huth wrote:

> From: Thomas Huth <thuth@redhat.com>
> 
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, queued for v7.3-rc.  Have you considered patching checkpatch.pl to 
catch this problem?  Might save a lot of time.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
