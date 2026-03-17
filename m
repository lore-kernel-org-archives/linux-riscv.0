Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F26FFED9E3
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 15:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tysi6xlEq1FxNlW7y88efeZ/EAWVVunkIhGe9Kz4arU=; b=CEeRSitAjIyzXE
	SoM/M+VQdAKLBCLROO8EintgYSPmDOApXaobZcZQ+GtmsDRqzGDTDvTYed5KfVuImhhHWEFNG3OY7
	RKrxbUMBviqMt6roieURTiZZ3P9CaJc0lzMEwPuLK203i2//56QUoj/n9wpc/m6kE4g/XPHcKCoAG
	hD5vAsGVVlYFXlw2DSWP9kgSrNj4+km5FMOrHWDxk3anPThzzahbR0+DHvetZK6P+2ccQLi5+BAot
	xpDW0Oenicfe4tWeYcWr7sCiiCkDlHHaMNRnz/SToaL4YpVfK3FTBqDF/Oqe1zhxjpRgZ7OePRiTZ
	UTDClUAxxSGkwrsufTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WHN-00000006jeF-43ER;
	Tue, 17 Mar 2026 15:24:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WHL-00000006jdL-0IE2;
	Tue, 17 Mar 2026 15:24:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7E1A1A2DE6;
	Tue, 17 Mar 2026 15:24:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C52B60050;
	Tue, 17 Mar 2026 15:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4159410450618;
	Tue, 17 Mar 2026 16:23:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773761051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rawTxtgvvbkzzbH2UV4s1WHUqEhvtXowvJ2A1NK5Dfo=;
	b=AoIs2DBUSiP3+bDh8ceDZ5pucIsCr73r049SuZ/HJKLAXGmyad7NTpfKNSaNVk51NUvTIH
	BgPqPlr1rDNIoyNmYsJc8ISuC3ycIUVQBissA6PEINJzL6N8BH0o8JqMgWYQdBCgi49zvl
	Rl36ZnNiln6rG+QQTga+S6KU/OOWAfvfLuGWL19TZHwCliPsRxvb67701TK9QVVKGnTpoa
	j3Xvy3JqNEig/PiitIwS73AwutDLx9LIw9v/asnkWmeV/tuNISa5PJ8YUSBzapnrkc2NV+
	NRS8gndZVMreSkSC8PDnKgeiyjCRU66WdvwKgyQf+/ugl+MnQb1DhlIwJ0DqHw==
Mime-Version: 1.0
Date: Tue, 17 Mar 2026 16:23:45 +0100
Message-Id: <DH55T20W6ZID.1O0R8EFW6R5G3@bootlin.com>
Cc: "Alexandre Gonzalo" <alexandre.gonzalo@arm.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-alpha@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
 <linux-sh@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
 <linux-samsung-soc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-renesas-soc@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
To: "Vincent Mailhol (Arm)" <mailhol@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Mikko Rapeli"
 <mikko.rapeli@linaro.org>, "Richard Henderson"
 <richard.henderson@linaro.org>, "Matt Turner" <mattst88@gmail.com>, "Magnus
 Lindholm" <linmag7@gmail.com>, "Russell King" <linux@armlinux.org.uk>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade"
 <andreas@kemnade.info>, "Kevin Hilman" <khilman@baylibre.com>, "Roger
 Quadros" <rogerq@kernel.org>, "Tony Lindgren" <tony@atomide.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Sven Schnelle"
 <svens@linux.ibm.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "John Paul Adrian Glaubitz"
 <glaubitz@physik.fu-berlin.de>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Clark Williams" <clrkwllms@kernel.org>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Pablo Neira Ayuso" <pablo@netfilter.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk"
 <piotr.wojtaszczyk@timesys.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Helge Deller" <deller@gmx.de>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "Chris
 Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Arnd Bergmann" <arnd@arndb.de>, "Heiko
 Stuebner" <heiko@sntech.de>, "Kuninori Morimoto"
 <kuninori.morimoto.gx@renesas.com>, "Mark Brown" <broonie@kernel.org>,
 "Eric Biggers" <ebiggers@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Sricharan Ramabadhran" <quic_srichara@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Guenter
 Roeck" <linux@roeck-us.net>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>, "Rob Herring (Arm)"
 <robh@kernel.org>, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Anna Schumaker"
 <anna.schumaker@oracle.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 3/9] configs: remove obsolete assignments to
 CONFIG_NFS_V4_1
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
 <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
In-Reply-To: <20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_082419_244065_6050D88D 
X-CRM114-Status: UNSURE (   4.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gVmluY2VudCwKCk9uIFR1ZSBNYXIgMTcsIDIwMjYgYXQgMTA6MTMgQU0gQ0VULCBWaW5j
ZW50IE1haWxob2wgKEFybSkgd3JvdGU6Cj4gQ09ORklHX05GU19WNF8xIHdhcyByZXZvbWVkIGlu
IGNvbW1pdCA3NTM3ZGIyNDgwNmYgKCJORlM6IE1lcmdlCj4gQ09ORklHX05GU19WNF8xIHdpdGgg
Q09ORklHX05GU19WNCIpLiBIb3dldmVyLCBzb21lIGRlZmNvbmZpZ3MgYXJlCj4gc3RpbGwgcmVm
ZXJyaW5nIHRoZSBvbGQgY29uZmlndXJhdGlvbi4KCnR5cG86IHJldm9tZWQgLT4gcmVtb3ZlZApv
dGhlcndpc2UsIHRoYW5rczoKClJldmlld2VkLWJ5OiBUaMOpbyBMZWJydW4gPHRoZW8ubGVicnVu
QGJvb3RsaW4uY29tPgoKVGhhbmtzLAoKLS0KVGjDqW8gTGVicnVuLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
