Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E09CA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8AEkZEWIe03YswgBWon0z6tXJU+j8m45AcKT8+7QGU=; b=L8tiQHPJbvOQfa
	dr9VefIxJ0q0mAgPdXJhKgKAqU2wWpz8wgaQx6eW9+YXezjHJGdDdeRrp9ctrLE7sM8sO4AbztxP6
	MSBGjyCp3PGN3kdwku7EnmX3xfWkngZc3DRm6xgRG4uzzCcmxgQpUHh9J83CcXK3GOc1awaTIqIVI
	Qy6NzWBI/NUtLlqe2Z3Mn6qCIFMa8qdx53Hnl/rey94h7Pjn7lXscEc+WZ8Iz61n6eS1i0R8GoQkP
	pwSM877zyPPAdXzdpNvDNKIqOdvSgDilHab+0mKMuc+XFs0qg9mF7DK1/zHL4xpQv4M5GTnZl2HOa
	4/BeaPcFjv7U9zxq4TNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn3R-0000000Ag4m-3A0z;
	Tue, 26 Aug 2025 06:21:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0e-0000000Af9L-1QqQ;
	Tue, 26 Aug 2025 06:18:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	b=EoHq8It+802uE8/W/ZgT+WU1MhU30ljvVJg6J8CsR2XdSCY1W8iKO/0yhuhlIWg93gjtVN
	yjsiguKOCe8MXqL7t5b5NeIYigkWxr9EZY2Mkn3x2W0dIf65A5h/s69Jx20ZLL24VmAnXl
	wWm91dlrX8UnePleqQexNGzu9SWDwlcPXJ8DztYUIGGk65aJetDl/MNeXhull8xcLDd2T/
	Xdhztn1zm0BL6qd7sdPVV8txFwrP1lt98FW2I+LmBrQOqG2Iv+EpggKyKaF35t2W+WDCO2
	x4LqgXrpkfrN62Egk6oQBRYWy9iOgErie977mytBr36Yc1c7jJeu3fV2/Qh79g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	b=eX2IPWAG+DvooY6YzvBNYPIk4d7JwL6SQGjcVcR/3nVRkZUD/9wZEdubuxvUX29zgYJ6tr
	+6ncwJ9ZGLDV8KDQ==
Subject: [PATCH 00/11] vdso: Various cleanups
Date: Tue, 26 Aug 2025 08:17:03 +0200
Message-Id: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF9RrWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3bKU4nzd5JzUxLzSgmLdtBSztKQkY6O0ZENLJaCegqLUtMwKsHn
 RsbW1AHxpxT5fAAAA
X-Change-ID: 20250825-vdso-cleanups-fd6fbb32fc19
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=3008;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OKdbTtNFiNAfKDCNOTVL/ZRLmxAuqZzdXzmwBIqDanM=;
 b=xXLb28HhyOp2V5PAl7NV8Ih+DLTz+T0EwU3m8mTK7t+YdB+1/WbVwG3q2LXi/d5YbmXMM3lwS
 UE/A4xDXG50Ay40TUaB+Dz47MZKMYqchu5q89DYuvoo2r9Z3sDlnSRd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231820_523672_E54F54B5 
X-CRM114-Status: UNSURE (   9.31  )
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

VmFyaW91cyBjbGVhbnVwcyB0byB0aGUgZ2VuZXJpYyB2RFNPIGluZnJhc3RydWN0dXJlIGFuZCBh
IHBhdGNoIGZvciBBUk0Kd2hpY2ggd2FzIG5ldmVyIGFwcGxpZWQuCgpUaGlzIHNlcmllcyBoYXMg
b25lIHRyaXZpYWwgc3ludGFjdGljIGNvbmZsaWN0IHdpdGggImRzby9kYXRhc3RvcmU6IEFsbG93
CnByZWZhdWx0aW5nIGJ5IG1sb2NrYWxsKCkiIFswXSBhbmQgYSBzZW1hbnRpYyBvbmUgd2l0aCAi
c3BhcmM2NDogdmRzbzoKU3dpdGNoIHRvIGdlbmVyaWMgdkRTTyBsaWJyYXJ5IiBbMV0sIHdoaWNo
IHN0aWxsIHVzZXMgdGhlIHJlbW92ZWQKR0VORVJJQ19WRFNPX0RBVEFfU1RPUkUuCgpbMF0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDgxMi12ZHNvLW1sb2NrYWxsLXYxLTAtMmY0
OWJhN2NmODE5QGxpbnV0cm9uaXguZGUvClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjUwODE1LXZkc28tc3BhcmM2NC1nZW5lcmljLTItdjItMC1iNWZmODA2NzIzNDdAbGludXRy
b25peC5kZS8KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3Nz
Y2h1aEBsaW51dHJvbml4LmRlPgotLS0KUmFzbXVzIFZpbGxlbW9lcyAoMSk6CiAgICAgIEFSTTog
VkRTTzogcmVtb3ZlIGNudHZjdF9vayBnbG9iYWwgdmFyaWFibGUKClRob21hcyBXZWnDn3NjaHVo
ICgxMCk6CiAgICAgIHZkc28vZGF0YXN0b3JlOiBHYXRlIHRpbWUgZGF0YSBiZWhpbmQgQ09ORklH
X0dFTkVSSUNfR0VUVElNRU9GREFZCiAgICAgIHZkc286IE1vdmUgRU5BQkxFX0NPTVBBVF9WRFNP
IGZyb20gY29yZSB0byBhcm02NAogICAgICB2ZHNvL2dldHRpbWVvZmRheTogUmVtb3ZlICFDT05G
SUdfVElNRV9OUyBzdHVicwogICAgICB0aW1lOiBCdWlsZCBnZW5lcmljIHVwZGF0ZV92c3lzY2Fs
bCgpIG9ubHkgd2l0aCBnZW5lcmljIHRpbWUgdkRTTwogICAgICByaXNjdjogdmRzbzogVW50YW5n
bGUga2NvbmZpZyBsb2dpYwogICAgICB2ZHNvOiBEcm9wIGtjb25maWcgR0VORVJJQ19WRFNPXzMy
CiAgICAgIHZkc286IERyb3Aga2NvbmZpZyBHRU5FUklDX0NPTVBBVF9WRFNPCiAgICAgIHZkc286
IERyb3Aga2NvbmZpZyBHRU5FUklDX1ZEU09fREFUQV9TVE9SRQogICAgICB2ZHNvOiBEcm9wIGtj
b25maWcgR0VORVJJQ19WRFNPX1RJTUVfTlMKICAgICAgdmRzbzogR2F0ZSBWRFNPX0dFVFJBTkRP
TSBiZWhpbmQgSEFWRV9HRU5FUklDX1ZEU08KCiBhcmNoL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3Zkc28v
dnN5c2NhbGwuaCAgICAgICAgICAgICAgfCAgMiAtLQogYXJjaC9hcm0va2VybmVsL3Zkc28uYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKy0tLS0tLQogYXJjaC9hcm0vbW0vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyIC0tCiBhcmNoL2FybTY0L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgLS0tCiBhcmNoL2FybTY0
L2luY2x1ZGUvYXNtL3Zkc28vY29tcGF0X2JhcnJpZXIuaCAgICAgIHwgIDcgKysrLS0tCiBhcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vY29tcGF0X2dldHRpbWVvZmRheS5oIHwgIDYgKystLS0K
IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaCAgICAgICAgfCAgOCAr
KysrKysrCiBhcmNoL2FybTY0L2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUgICAgICAgICAgICAgICAg
IHwgIDEgLQogYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyIC0tCiBhcmNoL21pcHMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgLQogYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyIC0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTIgKysrKystLS0tLQogYXJjaC9zMzkwL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAyIC0tCiBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDMgLS0tCiBpbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vdnN5
c2NhbGwuaCAgICAgICAgICAgICAgIHwgIDQgLS0tLQogaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICstLS0tLS0tCiBpbml0L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGtlcm5lbC90aW1lL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogbGliL3Zkc28vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICstLS0tLS0tLS0tLS0t
LS0tLS0tLQogbGliL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiBsaWIvdmRzby9kYXRhc3RvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDYgKystLS0KIGxpYi92ZHNvL2dldHRpbWVvZmRheS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcGlkZmQvY29uZmlnICAgICAgICAgICAgICB8ICAxIC0KIDI0IGZpbGVzIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKyksIDExMCBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAzY2Qx
ZjZiYzZhYTA1NmNmZDMyOTQ2ZjljZTBhYTNlYjNkYjE4MGU4CmNoYW5nZS1pZDogMjAyNTA4MjUt
dmRzby1jbGVhbnVwcy1mZDZmYmIzMmZjMTkKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnD
n3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
