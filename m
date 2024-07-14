Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5FAC3DA4B
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lz4rPAuJfTbIJ597lAqQX7MsyNRencd8tABYFfzCvbA=; b=X3scF/Hf8zTy0A
	vHYq+NDlEgrHO0zkBfRiVi66o0ElgvBNW8rloCX6srRVtgwe7iKJDlqUJ7UFVRd1SKZb3yqL1TWUq
	zOZ3pa2FP8ctKxgcweOO3loJ7FjL+EqZjvNN7JenEU0VHB4VTIfu3HaUXG+E7MBeqqAZGyLIovmqR
	NkJefCuVN7p7tx2+RTg+d2G6DeUolm/Q3ZMc5yUMLp/FhKPWiWGrMEn53KjulWm87xN6YO6Ars6Nu
	yj4ujTAdtjMxxIbc68g8YyyzGJiJZLm9HcCkriCtrj+voW/FO/4YlR7PJKf2OcLJqyDKusKEpSYjO
	VxjjsNaECw9egagLAHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSv4N-000000046nC-1TFs;
	Sun, 14 Jul 2024 08:58:59 +0000
Received: from mail.envs.net ([5.199.136.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSv3m-000000046bq-34Db;
	Sun, 14 Jul 2024 08:58:25 +0000
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 58F5638A399D;
	Sun, 14 Jul 2024 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720947486; bh=B10Vnlot+2ilvHh7OCvlmhyXD6mosKAEgX9C4cq3ecg=;
	h=From:To:Cc:Subject:Date:From;
	b=N9D5n6GtwH3qiq3p2Rzh9SVuJAnEifqgMQyqesEqh+rAcGqNpZ6q9N9b0nhJiPNlJ
	 PEDPoE3u41YojQH+7XAMCQEKnXMRTlqFjGrhy6MJDDh2aIb+VtL1gSthA5kxqmyOyN
	 3ZoeWdceL9TP/JWEe9pIZBQbUIv00JAlxRpCZNniJHRC6CQDRSr7ufL4DGpth/2sdO
	 TEKPrwzRH4vqz3fxgS9PMoErT2yNwY5ghdNNkfH+s2/E9Uk/VRgScWp9ABq71z+so2
	 asZZh8t+lH2mNxDjZjOJgF5i0V2/C8imuDXoi6qWCA5tKfNPRnRKJ7tg78BDgQd8M/
	 kGYuUOGE1KHimjYZSAJ2kfC4vmYtdT4BCjGSETK1ZNOKD6d0/4t+OXI5E7U5cngxEF
	 fvDsbR9PyEOBKuB5EcBlKliQEg/mzXJ+g3oKKZ5SdHREM3MBmSi3Tcs0B+iHVyHaxp
	 YIH+agaGkHtPkDO8eVN50i7feX/ovB73Wfbf5dR347DlCZFkVn10UTktYSoa49yWIt
	 cVyAS01Y4MLkyxd6ca04e5RNOuVjIWdecu3zBmhqmWWdmQrTb9HaJN6nTqhaw5V9/G
	 uDtg+M5JyeT/e16lqkqdH0tT55WGB1DA5XlwzgFl7OSD/keHJq/okoE19Fl5pNpdhM
	 7a75ulRRnKxBl8Q5K22HnnqU=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fJoepO1z1VH4; Sun, 14 Jul 2024 08:57:55 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 08:57:55 +0000 (UTC)
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
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [RESEND PATCH 0/2] kbuild: Fix install errors when INSTALL_PATH does not exist
Date: Sun, 14 Jul 2024 16:57:49 +0800
Message-ID: <20240714085751.176357-1-xtex@envs.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_015823_564248_AF44CC9C 
X-CRM114-Status: GOOD (  10.37  )
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
