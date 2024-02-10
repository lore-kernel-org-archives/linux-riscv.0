Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22EEC48260
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lz4rPAuJfTbIJ597lAqQX7MsyNRencd8tABYFfzCvbA=; b=Dx35/6UlpXR8LF
	E8LiVJB5lWfVwrFDSiTiL+LJT0a1HBJ/xEPBtS1Ic4WuY48rO3Fb2QbaR7YU3aWkTBExntJSwgh/A
	wrqTvtUz3G+7gpOKuLKRivvtR0AcCyHfydg3paDlcfye7LY9nmFJoYY/vkErlVqM3yeoxBdgmYkLm
	aHs1amN+bxCnEzme7h4bemZQb+8TKm/UzvRZRGUnImeWNeKu80AelHZCfXybucwc2ITOyb7j9b+wi
	sLxoofs8Rk38Iidl0/3sfe/FipFnVlN0HB4fXuGzZl4K9ZAquIrRPEzRZxtE2R6txZEWmJ08GgOTj
	eBqLTdGHCSOZdHumaWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYi52-00000001O30-2nE0;
	Sat, 10 Feb 2024 07:47:20 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYi4x-00000001O0c-0MKo;
	Sat, 10 Feb 2024 07:47:17 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id EC9A538A0669;
	Sat, 10 Feb 2024 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1707551218; bh=B10Vnlot+2ilvHh7OCvlmhyXD6mosKAEgX9C4cq3ecg=;
	h=From:To:Cc:Subject:Date:From;
	b=BHyKVslwdL2RbJki6trr7V1cE+cbklBCioJup0TiYv412ptDhgE2fjt9lYE/d/fFA
	 Cz1w+6hkQ8cXPkGa1zFHBj5Weha9RyeoQClD5I+GyKxk4wlSFDcW+myI/UlJVWNIG9
	 hmKB2RkGQRDC4zEGXZENTHKaAQiISqv7dY7Ua+QI3j+OLEUs50+gi4SYvb+FLTicGh
	 rrnQvy+DDOQX66lzlVh7+KRjVTyhgRUnadkv0y0oty+cgAr9g7iMjE+gKqMpDt7kPp
	 ZoS6KtJdtrkI2e6ECI5s6CWMJ+fSz/DtZwJgDcF80COmLVvRuOYJ6ROnUFo083lh4B
	 QfjTvAn9Ejs74dyGDoe6zJ91YPkgNi0aGGAZny98tNCoQEdQfXdYB4h0+l2MUbWIDr
	 iueWpVRix1LCQXJ57a1Nsm16givXVaSyhXkeUWtJj9dBgaBSDPzxn2k7DUZsJBeC6s
	 MCgwofjJSxeC0ZHRmhqoc0erGdJlmGI54cFaNOKgQ49n6yY2YOq6LBFhKgfPZCiGCs
	 ONXpAgkORRJQzNqipwuYpdNzhEYr8NJ64k7v40/66WQZwi7KWrrtdHFcr5PnVgOEZW
	 NChobvVcTbpIyWw2B0RCN4q5bm9KJa5fbZyrcyzCda7DEWj0hraUQ+I6558RXGLEYS
	 I4Cq2Emxz6uouFP7bmdIqLPU=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7q0JDr8gKqlZ; Sat, 10 Feb 2024 07:46:47 +0000 (UTC)
Received: from xtexx.eu.org (unknown [223.73.102.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 10 Feb 2024 07:46:47 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Zhang Bingwu <xtexchooser@duck.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 0/2] kbuild: Fix install errors when INSTALL_PATH does not exist
Date: Sat, 10 Feb 2024 15:45:59 +0800
Message-ID: <20240210074601.5363-1-xtex@envs.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_234715_895856_F503811C 
X-CRM114-Status: GOOD (  10.51  )
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

From: Zhang Bingwu <xtexchooser@duck.com>

When running 'make zinstall INSTALL_PATH=somepath'
 where 'somepath' does not exist, the install
 scripts (install.sh) print error messages
 but also return a success status code.
This will make 'make' regard 'install' (and 'zinstall', etc)
 succeeded.
When there are also other targets at the same time,
 for example, 'make zinstall dtbs_install modules_install',
 make will keep going on and other outputs will fill stdout,
 and make the error message hard to find.

dtbs_install and modules_install creates the target directory
 if it does not exist. install, zinstall and others should
 have the same behaviour.

If INSTALL_PATH is not a valid directory, we should create it.
If the installation process still fails with errors, for example,
 insufficient space on disk or permission denied, make should regard
 the install target failed, stop as soon as possible,
 and exit with error.

Zhang Bingwu (2):
  kbuild: Abort make on install failures
  kbuild: Create INSTALL_PATH directory if it does not exist

 arch/arm/boot/install.sh   | 2 ++
 arch/arm64/boot/install.sh | 2 ++
 arch/m68k/install.sh       | 2 ++
 arch/nios2/boot/install.sh | 2 ++
 arch/parisc/install.sh     | 2 ++
 arch/riscv/boot/install.sh | 2 ++
 arch/s390/boot/install.sh  | 2 ++
 arch/sparc/boot/install.sh | 2 ++
 arch/x86/boot/install.sh   | 2 ++
 scripts/install.sh         | 4 ++++
 10 files changed, 22 insertions(+)


base-commit: d0f86d080e3d7d5e1e75a56d88daf8e5f56a4146
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
