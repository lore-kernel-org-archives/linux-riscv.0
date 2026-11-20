Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19775606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbhqctiR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iMNTY+gP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kZbCIl3cB8Ad9F+RB52Sp0dHwcJULlOVk9B3otwh9Y4=; b=NbhqctiRnbuw91zk5YgPooFJFM
	Ngh+RT4Y69kNPox75AMH/SrL1wFV/jGCGfH0dFqwCkSZFMceQ5+Ul7o2/Q/TS2E9Q6MBHC7h3l4sx
	WsaqDkRTc9FFVy4KMPNT5RmAhhRGeTK3lkn06HG9jlbJGDYLRWlcKJjvMGYxWhSClkoJ7/Gxeq3df
	WRfOKicoyhr33LfI+GZY2WQH9YmddJNc7IavuD5dxhU/BqNNhhKaDxRzmcTKiiuTQvLJimqQq5oOs
	kqSXi9eCoyqzgZR1DJAQoROj7iTjeog2TsD9xSiqmz2XxPe9FYZXkPghRUURo4HN+3aM01kpocaAd
	HhyikesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNrG-0000000EyiI-3aby;
	Fri, 20 Nov 2026 12:36:50 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNrA-0000000Eyg0-1Zeu
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 12:36:49 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-99bf7b97f12so442203241.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795178202; x=1795783002; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=iMNTY+gPl4ECYL6hhk5ieZqme8TaVG+LIma1AznpEcnXShLlkQxKoM+VYZ+TFyhPLH
         MY6eZRCY2xPxPfN3HkvGR7t4vj3hQ8NfNPEXbN8fMBVQnfLXXvxN09FIDlonGLqXoruO
         z10rZfxFEiEitORVqaPeGyDwYCpYcW7LcdosD5FN0/XSgzK/t39tqyBHGTReQWb1OLnQ
         tHhwvMOOB/DO2voajomMPGdul+MPHP1u/eFEnu7Nw8/49p2GSsisETa+OAvx1p26Tx3g
         D3Oii4F8xjhSHoP5+vOebmam+ZmhqqWqdYxera/zZD66xieGxyvmUjndYQolK3qhGyrD
         EYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178202; x=1795783002;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=UzyUrBKwsn93t9IppZmIWND4HLRKWpM3qI2aPhVpRcC5x3tRkvf9sXAvRo9JvTLZFb
         OTshChcQoLi9JCiX6gMg52Q5hGYFfjcnCPseBB9aZc/VgaLo8+yjXFbzvarZz9HsrYHn
         1CgFqLuztFuJ2obIT8a1kx+CjWlSUOE5XsrUGHRBspBy+mrPba3iI0SbX1gvlXqTcFzr
         sIxEqQIUbx5VBnz5PV9ox1+SoBSe8IZVJFl/lZVM6USwdVNnLzUy+sxJuKmPmC+UUFUS
         csNcnbsfe6HllCgKuExE0HsIGS4ElB0U8rwlbXyFuAHFit4+pE5TdYleAdOoqvFESsla
         Tg4g==
X-Forwarded-Encrypted: i=1; AL+hErEmpw78uXhRJo8KaHHLxuAlOthx7kf/6bToe7DfrX96bkie8mEHCb9do+U8RaGewCv64+yDxhqC+G60rA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+HDjuhP7n5bUz1gOXJlEagt2q3iD+AiPCQcM/F6IWnZxzCbK4u
	IjEtE73RF+7dKUBVzauwVEHDdVkosvogjNSj3BeOpCB35vX16VgWFaX8K3XL/hgMavY=
X-Gm-Gg: AZFdTZc2hDjAF/Jo7rZfZ5YJSvQo6K609ySxb8/VPRuEB3en62kynu7QFBcp0TlNUS3
	FCIBT1sLYoCSEGo2wG5NQSzBfP3Rh3FF/BYy+qhOWMbMWh/LLSC4TeYDrOASe/vhdYjz54HSDVc
	8IFj+N7qBgdNFZ3DtHJ/dWotBzd3OO1/0IuLaJb+XnqhsdWfjPZz224krkHn/26luiFGAJoy6z3
	IdI3ZeukHtQdKkGfccMSTm6OnVGOkh54fEonFxAceaiBh4eJZdlvC4D9nhL1CZsizRZTwR+7CPH
	Nnr4wiSEGsF+Wj2RjYmKtLGyovu173S+5EvuRwDzdvgrqMRFLK+DsZ/nQIKBy2n5ir/7MPe2rbE
	7TWxQv9lU/0CVrHR43wP9za00Q7OqS16m5M4crLOT2uiDsG8uVJbMrlKj0IZIIdSFYQ7w594kJg
	B+7dg/VSgcbkMQ1L875RpWXCTBdqlurNe5xVHg4zsUiaXYwLRbK7cOiMZcm77Zvpc+2+KpRlR1+
	xZagWaYaOvyDgfa4ibc9u6Xr0n05vKSo4rGy7dMyX8hFleLu6NvkhlFEYhR8T5cbpnAENB+834X
	7cdbrC9VoXo78J+bqYuKpGGI7Ve9xo8bV4vlw1GYQElTzDxcdFPJZ7d4gTM+zsySOxm4qhfnl5j
	0GJqAjqEejJu8OP7CIl/B/5dwvlq3kgHIqv/G29GEdRlrY1o=
X-Received: by 2002:a05:6102:6441:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d739660c9fmr746735137.14.1795178202521;
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm2765262137.7.2026.11.20.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] arch, kexec: declare kexec and crash capabilities
 in Kconfig.kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
 Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 x86@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev
In-Reply-To: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
Date: Fri, 20 Nov 2026 07:36:31 -0500
Message-Id: <179517819160.302903.17107992182494080507.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=6sWQl9lmqjTJk3yxh91YK+fuuFKvUf1mQEwavRJAVng=;
 b=owEBbAKT/ZANAwAKAbt3KEzbc3reAcsmYgBrAD7YSNYHVf2cFGXSq25iXRKWCRXN4f0ixFmnf
 ++ItKpA2qWJAjIEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCawA+2AAKCRC7dyhM23N6
 3tiPD/d31VAJSvGrL/uVfmPyx9aQ56Xv29nKPQ6VnqwxP+xMB94zunEWD8SU+Mc33Jsi99L7q8T
 EfGGkXbTCSoGd7NQv3bSnhUhMQVXfpkd18XOnWbNd0iZdBWi4KwA6+/bOhxsYpO/vNSV52HyHUl
 YH2tsnNB0E6EUN5P7dsJ2PqcWD6QjGrbW/xN/5ItrxWqVXu7AFWAGG87321F8utMVUAjMd5pbNX
 gMmicb9aVIU7JY8k0q7PhcEcRAKBjeq1d52NlSDCQyaltHTGY5+29RgVN9juLHJk/Aqy3s15ERG
 gm7x8LUDOEKOpRB5wWYYeKgpWsUscytR/AC4OBQTujXKhQIWBnWrzxr6tjgdacQJt/i9O9RHd1G
 2mft4ocO42XqcRceZtQr6UzRDuVwoDTDwn7Tgr1GRPVmpKWKbzpatvf9WPoIEE1p4+zITr10dGz
 r/38wDLPSJghOgD31RGTysREDXP/fCAYar6DdmmMDK63vuMssMRCUOe16Xd0DOIZIG4FAZ7iix4
 P8e8ny0z7tfxqx4vm+6CsIaWgFvVAxYu7Aw1xAruadzsWe+u5UqQLLBY6z+0k76JoRaBMkkcS25
 JEuj8uFaMFXD2ei4JRlUNt57apqgQNCbvhYb6KUTHwP7pocn/UNfKH5JCi9KQCFr7OzuMoLGVJq
 hED2RJ/U2jV7C
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_043644_455099_C7F16C8D 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 08:16:56 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
> 
> The intention is to take it via kexec tree.

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
