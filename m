Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63028CA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yO7YAb4wnG+qLy0qcjoUwSaogNkTy1EHKwD/Y7OiZgc=; b=lrFYAVw7eEXsRd
	9JfMcDvOeIVLG5iJQHDJnIhtVEFMequiD9Bcw5+UGBTy50KR7IA7y8kGGLRLGaYTvop43aGVl7oNS
	2piklbG1Pxcpq+hK0XDa97kEWlQGJN8PDpH/UMxkU27AsUM6XVi0swNLTrbCda/8jMO5qHUgfxpvx
	mVQ/LJxIefh2NlkdeRdVIl2QZFoifpJVT0mU3SaC1Kf+2JDLQh9hrkwXhTKtCq2ZB7qAaFe0YP1pj
	XTsWTzGCZ7oXvOzahnJ8bZ3Nrzyiuibb5+t/f4PnWF9ZdhpL8cO/Aat3yYp1UKU/IkdPl13A87H8u
	8RSMiJQ9z/ZPdAvt96CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnJa-0000000Aj0r-28ga;
	Tue, 26 Aug 2025 06:37:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0h-0000000AfBM-1AJK;
	Tue, 26 Aug 2025 06:18:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfAvYUxv3s9XKBImIakj8GXd2hgk5QRNQQC7FW4cjt4=;
	b=CffaJqA5rsLpXWqtw3f39vxIq72rtPSbTis/OEKKsYWwPUec05NUKa0lPRbguDeq+uu38S
	3NFM99Ki94UQstG1VMY2CGSg+hq7AbvA6zg+C+bP9sSvPb/lmNV1XcXNvGv4NO+gdCJiTJ
	F0vKD5/RKqooZcBm5Qr6sSNWUp0GY9+7LT/fLhaBiLyT/PbkrhazJkqrptqY/TUmuaFrPv
	yHOJtuEeTW57C+suLl7kDyfOZdwa3rDWpoG7e4q0vO2W/nJMjiWimAX/qJJmgt1JVY6+EN
	ys8w+2HNfxqGMLJZbQv/ICj0IcuRaCHeepjdlNgKkGD66gzUFpCGgSG9JqosYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfAvYUxv3s9XKBImIakj8GXd2hgk5QRNQQC7FW4cjt4=;
	b=q6BWF05Q67M+a3SeKYmCy1eWKcKb5dNs+NjtEBA+0XviDim16s93yYLfPQLe33toJrC2Vy
	I8vMrv/opXDeLlCw==
Date: Tue, 26 Aug 2025 08:17:09 +0200
Subject: [PATCH 06/11] riscv: vdso: Untangle kconfig logic
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-6-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2848;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2HUR3b3XiF14rTZqp00VBNDZFgL9jjx0Ea79UoT5jM0=;
 b=2hMcbjqMUE+qJLwmgpoY1wgcMoYGpME1ZDwZAE0d5fqg8MI8j+0QAYV7x68fNUjZIXMNYkZj3
 Hx9qICkN7nyDHu5XdS8/Dovk5FCyrPAbpK6r8pqP2D3CWdV/qVtsIiM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231823_669872_A3DBB296 
X-CRM114-Status: UNSURE (   8.59  )
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

T24gcmlzY3YzMiB0aGUgZ2VuZXJpYyB2RFNPIGluZnJhc3RydWN0dXJlIGlzIHVzZWQgYnV0IHdp
dGhvdXQgaXRzCnRpbWUtcmVsYXRlZCBmdW5jdGlvbmFsaXR5LiBUaGUga2NvbmZpZyBsb2dpYyB0
byBpbXBsZW1lbnQgdGhpcwp0cmVhdHMgSEFWRV9HRU5FUklDX1ZEU08gYXMgYSBzeW5vbnltIGZv
ciBHRU5FUklDX0dFVFRJTUVPRkRBWS4KVGhpcyB3b3JrcyB0b2RheSBkdWUgdG8gc29tZSB1bmRl
cmx5aW5nIGlzc3VlcyBpbiBob3cgdGhlIGdlbmVyaWMgdkRTTwpsaWJyYXJ5IHdvcmtzLiBTb21l
IGZ1dHVyZSBjbGVhbnVwcyB3aWxsIGJyZWFrIHRoaXMgbG9naWMuCgpSZXN0cnVjdHVyZSB0aGUg
a2NvbmZpZyBsb2dpYywgc28gSEFWRV9HRU5FUklDX1ZEU08gcmVmZXJzIHRvIHRoZSBnZW5lcmlj
CmxpYnJhcnkgaW4gZ2VuZXJhbCBhbmQgR0VORVJJQ19HRVRUSU1FT0ZEQVkgcmVmZXJzIHRvIGl0
cyB0aW1lLXJlbGF0ZWQKZnVuY3Rpb25hbGl0eS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnD
n3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvcmlzY3Yv
S2NvbmZpZyB8IDE0ICsrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwppbmRleCBhNGIyMzNhMDY1OWVkODBjMGViNmIxMThlYThjOGRiODFl
ZDNmZGJhLi5lNGFjMGU4MzNlY2ZkYjk3NjEzNGU5MDA5YTJjZGZkZWE3ODlmMTNkIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCkBAIC01Miw3
ICs1Miw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBBUkNIX0hBU19TWVNDQUxMX1dSQVBQRVIK
IAlzZWxlY3QgQVJDSF9IQVNfVElDS19CUk9BRENBU1QgaWYgR0VORVJJQ19DTE9DS0VWRU5UU19C
Uk9BRENBU1QKIAlzZWxlY3QgQVJDSF9IQVNfVUJTQU4KLQlzZWxlY3QgQVJDSF9IQVNfVkRTT19B
UkNIX0RBVEEgaWYgR0VORVJJQ19WRFNPX0RBVEFfU1RPUkUKKwlzZWxlY3QgQVJDSF9IQVNfVkRT
T19BUkNIX0RBVEEgaWYgSEFWRV9HRU5FUklDX1ZEU08KIAlzZWxlY3QgQVJDSF9LRUVQX01FTUJM
T0NLIGlmIEFDUEkKIAlzZWxlY3QgQVJDSF9NSFBfTUVNTUFQX09OX01FTU9SWV9FTkFCTEUJaWYg
NjRCSVQgJiYgTU1VCiAJc2VsZWN0IEFSQ0hfT1BUSU9OQUxfS0VSTkVMX1JXWCBpZiBBUkNIX0hB
U19TVFJJQ1RfS0VSTkVMX1JXWApAQCAtMTA3LDcgKzEwNyw3IEBAIGNvbmZpZyBSSVNDVgogCXNl
bGVjdCBHRU5FUklDX0NQVV9WVUxORVJBQklMSVRJRVMKIAlzZWxlY3QgR0VORVJJQ19FQVJMWV9J
T1JFTUFQCiAJc2VsZWN0IEdFTkVSSUNfRU5UUlkKLQlzZWxlY3QgR0VORVJJQ19HRVRUSU1FT0ZE
QVkgaWYgSEFWRV9HRU5FUklDX1ZEU08KKwlzZWxlY3QgR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWYg
SEFWRV9HRU5FUklDX1ZEU08gJiYgNjRCSVQKIAlzZWxlY3QgR0VORVJJQ19JRExFX1BPTExfU0VU
VVAKIAlzZWxlY3QgR0VORVJJQ19JT1JFTUFQIGlmIE1NVQogCXNlbGVjdCBHRU5FUklDX0lSUV9J
UEkgaWYgU01QCkBAIC0xMjAsOSArMTIwLDkgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IEdFTkVS
SUNfUENJX0lPTUFQCiAJc2VsZWN0IEdFTkVSSUNfU0NIRURfQ0xPQ0sKIAlzZWxlY3QgR0VORVJJ
Q19TTVBfSURMRV9USFJFQUQKLQlzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMIGlmIE1NVSAm
JiA2NEJJVAotCXNlbGVjdCBHRU5FUklDX1ZEU09fREFUQV9TVE9SRSBpZiBNTVUKLQlzZWxlY3Qg
R0VORVJJQ19WRFNPX1RJTUVfTlMgaWYgSEFWRV9HRU5FUklDX1ZEU08KKwlzZWxlY3QgR0VORVJJ
Q19USU1FX1ZTWVNDQUxMIGlmIEdFTkVSSUNfR0VUVElNRU9GREFZCisJc2VsZWN0IEdFTkVSSUNf
VkRTT19EQVRBX1NUT1JFIGlmIEhBVkVfR0VORVJJQ19WRFNPCisJc2VsZWN0IEdFTkVSSUNfVkRT
T19USU1FX05TIGlmIEdFTkVSSUNfR0VUVElNRU9GREFZCiAJc2VsZWN0IEhBUkRJUlFTX1NXX1JF
U0VORAogCXNlbGVjdCBIQVNfSU9QT1JUIGlmIE1NVQogCXNlbGVjdCBIQVZFX0FMSUdORURfU1RS
VUNUX1BBR0UKQEAgLTE2NSw3ICsxNjUsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9G
VU5DVElPTl9BUkdfQUNDRVNTX0FQSQogCXNlbGVjdCBIQVZFX0ZVTkNUSU9OX0VSUk9SX0lOSkVD
VElPTgogCXNlbGVjdCBIQVZFX0dDQ19QTFVHSU5TCi0Jc2VsZWN0IEhBVkVfR0VORVJJQ19WRFNP
IGlmIE1NVSAmJiA2NEJJVAorCXNlbGVjdCBIQVZFX0dFTkVSSUNfVkRTTyBpZiBNTVUKIAlzZWxl
Y3QgSEFWRV9JUlFfVElNRV9BQ0NPVU5USU5HCiAJc2VsZWN0IEhBVkVfS0VSTkVMX0JaSVAyIGlm
ICFYSVBfS0VSTkVMICYmICFFRklfWkJPT1QKIAlzZWxlY3QgSEFWRV9LRVJORUxfR1pJUCBpZiAh
WElQX0tFUk5FTCAmJiAhRUZJX1pCT09UCkBAIC0yMjEsNyArMjIxLDcgQEAgY29uZmlnIFJJU0NW
CiAJc2VsZWN0IFRIUkVBRF9JTkZPX0lOX1RBU0sKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQ
UE9SVAogCXNlbGVjdCBVQUNDRVNTX01FTUNQWSBpZiAhTU1VCi0Jc2VsZWN0IFZEU09fR0VUUkFO
RE9NIGlmIEhBVkVfR0VORVJJQ19WRFNPCisJc2VsZWN0IFZEU09fR0VUUkFORE9NIGlmIEhBVkVf
R0VORVJJQ19WRFNPICYmIDY0QklUCiAJc2VsZWN0IFVTRVJfU1RBQ0tUUkFDRV9TVVBQT1JUCiAJ
c2VsZWN0IFpPTkVfRE1BMzIgaWYgNjRCSVQKIAoKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
