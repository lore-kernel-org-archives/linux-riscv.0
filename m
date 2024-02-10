Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D127C4829A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqkeFwo/p4LTQm9/2N3XFEpqaQpcyy4fHgOnH9LJQhc=; b=o75wkuXKa018m4
	7YZ5Qp+Yxf3Cfe6cVP/Xj8Dzro8jKQeggMd7P/AYk/2/kyLdKUPskM1yNYZGJLToAJ9+8hJoR043V
	jcOMgrsrDRImZZmH8v0o2qgQ0EdJtUa1S+2jhDe1kaoM4kjtYjDwsi0jjdYdkATmSeAR0tZbtVASM
	DQnAbQkHmnK3mvHS4bfsXKOfLi0mVzhG17USTjsQRl9lNpcsjOtOfrAoDbc3n9oMA8euLT6e8vwBb
	5OlpcVUHfCFa2d67jaz0UTR99iMfj6WuStp1pNdaEZUEw5UF/pM0t/VPDTl4q6LvYXI0ppxgiCaJ4
	jVyIA4mxtQbX8J7PWOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYkch-00000001VxQ-0gUs;
	Sat, 10 Feb 2024 10:30:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYkcb-00000001VvU-0QGS;
	Sat, 10 Feb 2024 10:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ph4jzB86nHaGBdGyQlHwPpxZccThyM3+Io4W8gZIxGI=; b=T/mPfRyuRFUl8GCt02nw5hF8m8
	Awp1djpMFwBhecelf0XDJm5aDEs/HFqx7756B0bVepr/IJfGnj/mDwY2ntorwNMhuX7PNwkVwgiOs
	Vo0wg1FUKUe1QsAW95tmiDTM0/WP/VecHW4kPFzjiebWPfx/akDPQAN9lTy2Xp/2xXX+IbY8KnVwk
	MgbJRMZIRSjH+kI3aucCRbMHAnW4kOdZf765ego1yIRs35nz7bEpVbQLqzKKnVgwsNeRfkoMwTEpr
	nQVW3vHN/FJOwHxxSdheb5jdA9FltDBf0iVdtYybDa44bHMN/9CrHW6PvlCMexy63eQf+bCpkOJr8
	eiPfQRGA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rYkbe-0006qq-0m;
	Sat, 10 Feb 2024 10:29:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rYkbU-0007Ja-Ln; Sat, 10 Feb 2024 10:29:00 +0000
Date: Sat, 10 Feb 2024 10:29:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Zhang Bingwu <xtex@envs.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Zhang Bingwu <xtexchooser@duck.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
Message-ID: <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk>
References: <20240210074601.5363-1-xtex@envs.net>
 <20240210074601.5363-2-xtex@envs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240210074601.5363-2-xtex@envs.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_023010_080613_26554385 
X-CRM114-Status: GOOD (  13.97  )
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

On Sat, Feb 10, 2024 at 03:46:00PM +0800, Zhang Bingwu wrote:
> From: Zhang Bingwu <xtexchooser@duck.com>
> 
> Setting '-e' flag tells shells to exit with error exit code immediately
> after any of commands fails, and causes make(1) to regard recipes as
> failed.
> 
> Before this, make will still continue to succeed even after the
> installation failed, for example, for insufficient permission or
> directory does not exist.
> 
> Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
> ---
>  arch/arm/boot/install.sh   | 2 ++
>  arch/arm64/boot/install.sh | 2 ++
>  arch/m68k/install.sh       | 2 ++
>  arch/nios2/boot/install.sh | 2 ++
>  arch/parisc/install.sh     | 2 ++
>  arch/riscv/boot/install.sh | 2 ++
>  arch/s390/boot/install.sh  | 2 ++
>  arch/sparc/boot/install.sh | 2 ++
>  arch/x86/boot/install.sh   | 2 ++
>  9 files changed, 18 insertions(+)
> 
> diff --git a/arch/arm/boot/install.sh b/arch/arm/boot/install.sh
> index 9ec11fac7d8d..34e2c6e31fd1 100755
> --- a/arch/arm/boot/install.sh
> +++ b/arch/arm/boot/install.sh
> @@ -17,6 +17,8 @@
>  #   $3 - kernel map file
>  #   $4 - default install path (blank if root directory)
>  
> +set -e
> +

What about #!/bin/sh -e on the first line, which is the more normal way
to do this for an entire script?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
