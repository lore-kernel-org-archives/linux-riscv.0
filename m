Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A626FC6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIOgRuoR0z6xvN/YsDw0YDkC+HQ3ryB/CTo8VuoXU/w=; b=zQ5wWSGqtyUiK6
	k2V3pbrQA0ZDoL9bYniq1lQIXysniyPi5y9LSifefx8FPEd9f1Mh3oKPgMYCX8R0zxjdMDtRO25IJ
	WZY7fXKMSPYzvK2r9HE3yAHlc1YNN4FOZEjDH3q+dk99W1ghqpB1sAzrQzgfflm81iKnuHmngEpWx
	EFyM76+RF5lsfu7E7Ttn6PeeBsnQX35hJfwVCgRmZmDclTQBww3g6ZG8qvMBSA1GQXR3YFc8IpkKG
	D81xrT2yh3I2msNNOFoEbAtSlaNmHdpDsRnMbZh5MtzzOctVpTv7gThyym7DjfV7t/YD7TxwUbvKe
	HCU2t2S5UGSMXoXZp9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXffi-001Y8h-2U; Thu, 02 Mar 2023 09:56:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXffe-001Y6N-DT
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:56:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l25so15929502wrb.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEs3yIz8iEmRFY8PICbSYz9IDFM/n81OtFDX6/s/AEc=;
        b=knISX1iT2rRR106GIUlbJC06fpznhY3A4dilwlF3bmeod/OcRdwY77WLBaAulDxb61
         Pk0zUhuXMaIpdVWHqDXDoQZZ3D3QzpQ3Ruhv1clqcbP74yLjtq6jpqGX6eesH+6oHzeO
         3cFNkLpsLel0/ACtssFKIJ3XeqH1VIntoI5WTyMPUBcqLkiJqxc6DyFl45oy9ffoLcB6
         I5E/cyonnx/gqVU4jjtrDPhZyMePqvpZyhm7gZHvwM1XibslkBs+UwOXQFGzPPAsdzYb
         KpDXTSzIiVWdMGKpc9SW2D4U9Q+S2OqdMYO+45EVoUwJ0dpEVpNAY2jfr0NIemdeGfl+
         h4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEs3yIz8iEmRFY8PICbSYz9IDFM/n81OtFDX6/s/AEc=;
        b=oCRT/L9lxNgmuLgtd/igf84+Cp91WwXLA9XzJoC917Ug0NOtiqHIca66x78TJFOhCk
         RQYGInK0PGDfZt0ExqMjN1t85Ju/wM3v5IYJq0uT5sdT8yhy7XUKJgP7yPsJ7dAaPgio
         S4FM61rr3fS6Icry/LTrna0T/rX/VJeHeRfxGFUoErvQpUnv8wqATUnalI/xlSynpCqi
         GlNgMPoDu3JEVmf/g0swwcG0qY9wuIRRt9wF9VE4kDlSk+WD1XIQWuiGC5/hF/xtXHie
         n+LpWhKIg6qYr39JVkkBmJHLr7VsHwJhAORY0bTYTx4xq7Nw9oh8zDfovQHUUqIgwJOW
         Kkug==
X-Gm-Message-State: AO0yUKWK0UYY+qByGtMZTXqN4r+/99j4wUO4M5NwXH+JPG8wmSXNE+Ah
	c1YAljhKO+rBOPXZEXomT72ndQ==
X-Google-Smtp-Source: AK7set+NmzGCXmV49Z+yuGoqtBuUh6WsMHapZ5sjWJvg1AxjPSuRMcddn6CMUFtPpYXviamzMTzYwg==
X-Received: by 2002:a5d:4845:0:b0:2c7:7b7:ee94 with SMTP id n5-20020a5d4845000000b002c707b7ee94mr6581157wrs.13.1677750976700;
        Thu, 02 Mar 2023 01:56:16 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b002c5d3f0f737sm14703514wri.30.2023.03.02.01.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:56:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:35 +0100
Message-Id: <20230302093539.372962-21-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015618_501310_725A9F82 
X-CRM114-Status: GOOD (  11.03  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9zZXR1cC5oICAgICAgfCAyIC0tCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmggfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0dXAu
aAppbmRleCBmMzdjYmZmNzM1NGMuLjQ0OWI1MGEyZjM5MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXR1cC5oCkBA
IC0yLDggKzIsNiBAQAogI2lmbmRlZiBfQVNNX1g4Nl9TRVRVUF9ICiAjZGVmaW5lIF9BU01fWDg2
X1NFVFVQX0gKIAotI2luY2x1ZGUgPHVhcGkvYXNtL3NldHVwLmg+Ci0KICNkZWZpbmUgQ09NTUFO
RF9MSU5FX1NJWkUgMjA0OAogCiAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oIGIvYXJjaC94ODYvaW5jbHVkZS91
YXBpL2FzbS9zZXR1cC5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3OWE5NjI2YjU1
MDAuLjAwMDAwMDAwMDAwMAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgK
KysrIC9kZXYvbnVsbApAQCAtMSArMCwwIEBACi0vKiAqLwotLSAKMi4zNy4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
