Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1393CC25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSlPSnNKL1ButvBG4Y4ZLSWd3S6G2pDqzpR0BrpYB9U=; b=2MEgLJAB3M4Gtj
	PO3QCV92ZgqHzUiQIkCL4f18d5FXcMOwhpolpEkuhiMWA9qkGwUMTywOkOYTihSKn4PpoeM0bAjyK
	R3zl+Tb+kj52Nzdx+oOucrpqPS0hpScT/kypXtqwbuzdQjX7UtlMTvznw4KDXtYWwe9xl75oPNKvX
	EgLowcintDgc6YrPluWISX1xRsNKEbyi2YptoBNPoK/ubJ2N3mWe5pES6rWn24utsBAuGpLeGLkrO
	umGkt8Y+LUJ7ksJKv+4mDZjcR5l2WhOZVYTLl68EynaORrwMlCeUhCDHV4CiZGuo3r3/gBaiTyoyi
	SbJ9qkqq81FqZm7am6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSpP-00H8hw-1h;
	Fri, 27 Oct 2023 19:49:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSpL-00H8hD-1E;
	Fri, 27 Oct 2023 19:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x0iYI5oenjIZgr5Ea1ttq1u1uXaCUnuC+gyTKvhjOBk=; b=Ibrs5OOIynLh1ZqBHvo810vT2q
	eZ2nAuEC+K8WhADZyxCD7xKQ7OjuqkB8rNWbweBGcKtCe8Efu7z905xSwkmaFhMWLogTpKeKp530c
	y+snwDCtQLvQDi8jIBsm//i44Q6CVALD1DuRwOCHIrexGbVrRgcuPC0+OBgc0ect2BhZQxjhCQYj2
	MSiZAfwX7ZMLxY1tPkBJ/kabOPASmDIlm14+ujvKWv7mtx2AMBdzfungg4OSeOdSvSQNubRBDCYW8
	Wb6MfUkoZIBWsMA4dmC6oIypgl/PXBefZx7wAkV/9ynOow1ZBq2mVcMm41FTVxyfegcHh4AJBlsxe
	Bi32VVuw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59754)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qwSpA-0008EM-0T;
	Fri, 27 Oct 2023 20:48:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qwSp5-00018G-6R; Fri, 27 Oct 2023 20:48:47 +0100
Date: Fri, 27 Oct 2023 20:48:47 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH 4/5] kbuild: unify vdso_install rules
Message-ID: <ZTwUH0uNESuWeKPR@shell.armlinux.org.uk>
References: <20231009124210.1064021-1-masahiroy@kernel.org>
 <20231009124210.1064021-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009124210.1064021-4-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_124903_481184_49136F8C 
X-CRM114-Status: UNSURE (   7.07  )
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

On Mon, Oct 09, 2023 at 09:42:09PM +0900, Masahiro Yamada wrote:
>  arch/arm/Makefile                      |  7 +---
>  arch/arm/vdso/Makefile                 | 25 --------------

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
