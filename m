Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62371C678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQP9LwNOyLn4jMufHei1JrBX9IwNMAIQn4HcXICHcvI=; b=XQVmN1Hiy5Kgks
	HkV1Hj7kUb5vvwahCRWzxlHUmu1H1416xPOYRVN/k27hVOGa9jSQEetNcwMWE9nmBs5NnpR8T5veZ
	Q5p1YGCE+lBfBIchtzkBzl1pK1h0FfhgrP8i0oLk+I0NcBSPp5wyfjsTv+edjzbhziNvId3bJltzW
	KuP4/rTMdsWbENNpfn6CwUjRBGCRof7S3P8ODJc+ztjR7C6f1vdXpWkeI60dVZAluVud/oxqRHDdl
	CqP5Je9EXmYAwFqPBpcSKi8gqUc7XvreKbrDXDHkjZn9GeATVDIYCb5xdC2qJzwYKEf8+8/TviagV
	MPcOUGThOR4QxeQarpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfZi-001WIP-Od; Thu, 02 Mar 2023 09:50:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfZf-001WG2-R2
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:50:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id v16so13080772wrn.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idYCXIp655Ab81Nczde08CzuCRs/GqKbYJdOtnXaBl0=;
        b=dY4nMA6MIJG3fqoZn6cWV7Von83Lc0x1Euxe+EWA3PM9Nn9Pxq0mUH8Uydkm4CoZ2A
         1TRBkgnyUzTA4XgHfPMO9mU9xcWLmxnFKybR0v6WM5MRkJf65egPQvN3q2unssWMYZBx
         u3WvHFGbn53G3b4wnHX2ENZa3SUAAh81J9n4EkQi7fI3lpY8Wyvcz3cyZ8C79Mqrlot4
         XiYcQ7a+Ql66IcBdDbinU5Ah5bQRXBJDeBPKr3WJ9O+X+4v9dc6xbj7kgEgUVsaJoqFk
         XMjbLNtmIXlOx4LEIeUYXzGZLdODHKjjTgWsgrEYeim3IwWT+mUOIS47OCKGx5SDTOwZ
         Hvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idYCXIp655Ab81Nczde08CzuCRs/GqKbYJdOtnXaBl0=;
        b=XKu8wQ+5ekIsatEBYlvYqA+MgWVnQCwkhTw7q8eopg4JlS1UMvI93i7bzUi8gswnYs
         pyxo7od9kU2nI65DkcIfTpVT1AIcVOUNQQAucyTGKkAfPYmrk+LZ0jF5uJ+i/h830E2E
         W9BuKRrN71gK+ifGp2qgbnxNLbHMWr7klZgeW2GyW+3wy95y3Tj2gyY/N0NC6BnIvP3L
         TU5VseZ07p/eKdwBh9CW0y1WKSHZSWAErnP9dSEV12Q3Wl4kEh6AQmTnjDbZZtQfF9HS
         u3L+BZI1dI9hS3+mcUZ9c0M8YUOlTt7CbjN6MFvbrm/hBgdBky6JRHn5cf7ShXGfeFEg
         ZmpA==
X-Gm-Message-State: AO0yUKV7DH8DBHMbyPWjpH8QHC3H8Qm7TxQWG1sieP9j9WAjCVtiuzbG
	IJ30fRdvPsvN8AIHkf/EIewOOQ==
X-Google-Smtp-Source: AK7set/Z/nu62r61HIUYvdDZs4gz5GwOOC+pnLkKj34Io66Ad5aUaKaZBVv/KVU3q1Rm1U0D/wyDRQ==
X-Received: by 2002:adf:e745:0:b0:2c5:a38f:ca3a with SMTP id c5-20020adfe745000000b002c5a38fca3amr975140wrn.10.1677750606279;
        Thu, 02 Mar 2023 01:50:06 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id hn4-20020a05600ca38400b003dc5b59ed7asm2400563wmb.11.2023.03.02.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:50:06 -0800 (PST)
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
Subject: [PATCH v4 14/24] arc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:29 +0100
Message-Id: <20230302093539.372962-15-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015007_922423_D724BE24 
X-CRM114-Status: GOOD (  12.00  )
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
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL2FyYy9pbmNs
dWRlL2FzbS9zZXR1cC5oICAgICAgfCAxIC0KIGFyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCB8IDYgLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC9hcmMvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpkaWZmIC0tZ2l0
IGEvYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL3Nl
dHVwLmgKaW5kZXggMDI4YThjZjc2MjA2Li5mZTQ1ZmY0NjgxYmMgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJjL2luY2x1ZGUvYXNtL3NldHVwLmgKKysrIGIvYXJjaC9hcmMvaW5jbHVkZS9hc20vc2V0dXAu
aApAQCAtNyw3ICs3LDYgQEAKIAogCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KLSNpbmNsdWRl
IDx1YXBpL2FzbS9zZXR1cC5oPgogCiAjZGVmaW5lIENPTU1BTkRfTElORV9TSVpFIDI1NgogCmRp
ZmYgLS1naXQgYS9hcmNoL2FyYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL2FyYy9p
bmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE2
ZDRlNDQ5MzhiZS4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gvYXJjL2luY2x1ZGUvdWFwaS9hc20v
c2V0dXAuaAorKysgL2Rldi9udWxsCkBAIC0xLDYgKzAsMCBAQAotLyoKLSAqIHNldHVwLmggaXMg
cGFydCBvZiB1c2Vyc3BhY2UgaGVhZGVyIEFCSSBzbyBVQVBJIHNjcmlwdHMgaGF2ZSB0byBnZW5l
cmF0ZSBpdAotICogZXZlbiBpZiB0aGVyZSdzIG5vdGhpbmcgdG8gZXhwb3J0IC0gY2F1c2luZyBl
bXB0eSA8dWFwaS9hc20vc2V0dXAuaD4KLSAqIEhvd2V2ZXIgdG8gcHJldmVudCAicGF0Y2giIGZy
b20gZGlzY2FyZGluZyBpdCB3ZSBhZGQgdGhpcyBwbGFjZWhvbGRlcgotICogY29tbWVudAotICov
Ci0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
