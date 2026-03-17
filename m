Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD46F3381B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hr18qgWLd6zsZyN5ZulmvjnNUWcKa1wG5h+EmSorwnc=; b=XcAUiy/bTuX/xc
	YbAfMI+2/DD/8iMv5+4A5l47l8qs83PwQheI8g4bB27X7rbAxSIOHR6VK1p7gEHmSp8MEhb0EZHSK
	cp6mknn/fh2y063VfprIQHbvIT7JJJHTz7x4sLSY9JiwUg9TLr7R0IwceT/FPgnMNQslkwD0MjGH0
	ftd88LS4DT61RommoDoSmqgptjNcOofsMmi2UOVbEogAf2cNZ+b2Pov5VBzL/4xJF1WhwfE/IynOU
	DwQyN16xxwwmNZqDJJJCTkbZmAdIT7qsOsNbYoNmT8pE7r5PhRi4zAGtqs6cDwk0/F34zzrF7Jy0C
	KR/lSN5dm3PV6JB9VLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QWa-00000005pHc-2w6s;
	Tue, 17 Mar 2026 09:15:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QWZ-00000005pGz-1eYE;
	Tue, 17 Mar 2026 09:15:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59D7760103;
	Tue, 17 Mar 2026 09:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB006C4CEF7;
	Tue, 17 Mar 2026 09:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773738938;
	bh=VtwIJFaAMtn3jd+K8dDJBU0osBe2o2s5/drNSAn7k9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m2wlcrZOnT6ruu0EkE7CrHumOKWf/Ccs5o02wUUHWmxJDIOykEqO7DiuoUsreowvt
	 rk9lyCON7+jd3Nid1i73VmGzZmdcJJtauE+06Ctf5O9i8g3U6EQ06nxo/sPgYMqmg5
	 TKZZ/xspyslC1RROjAOcbwrUWOfypjcFoHKeRim8agJGMO+DZ7vFx5eUexFgNd/r3Z
	 AGrIarG+IxKeVlTku+i6skiPuQb6QGl9Z8fU6nVvUBWJJtYKD+CWJ/TK8gowuubm7g
	 UbTa/A66JzN3waKAs0BH1NU5aGVzUlet0XKd9eYLVPiQlsOpwVSg2ZtO7hklB2Czf7
	 VMihWP3RPDy3A==
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Date: Tue, 17 Mar 2026 10:13:37 +0100
Subject: [PATCH 1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in
 test
MIME-Version: 1.0
Message-Id: <20260317-arm_defconf_cleanup-v1-1-8eecb7fdd24d@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
In-Reply-To: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Pablo Neira Ayuso <pablo@netfilter.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Anna Schumaker <anna.schumaker@oracle.com>
Cc: Alexandre Gonzalo <alexandre.gonzalo@arm.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 openbmc@lists.ozlabs.org, "Vincent Mailhol (Arm)" <mailhol@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=VtwIJFaAMtn3jd+K8dDJBU0osBe2o2s5/drNSAn7k9M=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJk7pfu+HZl6j5FzYRHL1ZNqVklTPnDu2XNEReLBtve7u
 l6VrFiQ1lHKwiDGxSArpsiyrJyTW6Gj0Dvs0F9LmDmsTCBDGLg4BWAil5UY/mkUh57/O5/zXYGN
 gfhnKXmOH/ffllwy3PKX631ajWdeVT3D/4B516cfiVx59kGdb1TlBo8G3snCiz9Xla9czntrgUr
 /dk4A
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

merge_config.sh yields this warning:

  ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator

This happens because the script runs under /bin/sh but compares
strings using the '==' operator, which is a bash extension. The POSIX
test command only specifies '=' for string equality.

Replace '==' with the POSIX-compatible '=' so the script works when
run with /bin/sh as intended.

Fixes: dfc97e1c5da5 ("scripts: kconfig: merge_config.sh: use awk in checks too")
Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 735e1de450c6..073c6bec5245 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -381,7 +381,7 @@ END {
 	STRICT_MODE_VIOLATED=true
 fi
 
-if [ "$STRICT" == "true" ] && [ "$STRICT_MODE_VIOLATED" == "true" ]; then
+if [ "$STRICT" = "true" ] && [ "$STRICT_MODE_VIOLATED" = "true" ]; then
 	echo "Requested and effective config differ"
 	exit 1
 fi

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
