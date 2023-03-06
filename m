Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43289C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6TZXVytG3/ZtUKynd6tKKUrKPS+eeFefpNjFlfkIHY=; b=pv6H7SledvjaFH
	h7gmdE7dNqLS1xlNYw8VnHK61ufaF9tvMzXF2Qun0m7c5dvxVDOd8IBEX5KHLGcYGxjpXP14WwHnM
	oB3QazghNw4be11NzF76I6xNilk79EZZk+/Niuh2Sk8QAYTJDoQpSIiltYbTg1+LbCjR9EQUQkI8p
	tDV4l0GOv9/R8RWM2aXhLKlcBp8LD1/RdPpxHi+bvmwFMyLYvQ4e9HyMgdpaEXmHugrqmfnRmmXsr
	uH79mxdQAmvpYzu4JX+pMO5ueOc5IVfJ6KfW6YfSz/hXXCt9xiZGk9pab8JqY+1EJjrVQI5ZlZJ7w
	74lWp0B6cxNsN89z0daA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ87v-00CKU0-Dq; Mon, 06 Mar 2023 10:31:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ87s-00CKSa-7e
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 10:31:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id p26so5280557wmc.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 02:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBrHhQ+ENLcTDHZblgvw5cJviEIcUkQODsWe9Dpzcfk=;
        b=dMG398VnS6d7Sp/v2WHmOoLb1Pl0DUkmJwFGFlaFFE2NBSpl3bfx7goOgx/bA/e+eT
         JlGXkZ/YKC5/CAaUgrAgf2hwRlXoi/w09fk+d6JbzRsi1xEOvnET1ZtQw1GHTDzGO9Kc
         4tpVQXj5bbt90ZEPTxaGams7zZPu/WPnuP8OFNZQ10jn8lYY76GXgznimwmVX0LnUN36
         +jRh0o9oGjoo103N9nKFb3gVEbdh9sBKJ7FOEhJBNFyEiOBkSLl1OpmtwlekjwfER05t
         fJR2GSWXVNdO1/cuJA3g80GcEhaj/voiZrBUwN52fql9jSz5wH4gJd9Czzz14Ra75Rbq
         MY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBrHhQ+ENLcTDHZblgvw5cJviEIcUkQODsWe9Dpzcfk=;
        b=NJh959yffonXpU6qA23PDaIvwn+Z3iRUPyfK//d0bPq8BNVrnai32v9ihxWt6v9cpr
         66IkR8hemPsYasSW1FpHfzBJfSFA2b2x4Idl6H+9reXI/UCZXn6FqfCpD7AgJaBmDmPJ
         7yNgBX44pB5rmgbzkeY7/fWRfDu7O4geHxZvwYdnQ4XyhuExGwJ7VNHoS62aziYJ9Yvn
         LxRv4UXhKuCfYp7yo7j38CcvWqu1q61P/LaRNiT8WLL5U7KoN+n0cL0RNh1Jdp6kBN/u
         iAmXQrif+owJ1SlbOUWIgbVQpCmkaUprs+J2jHz4+HbZfV+8wSM2lfmZSEAr6CQF+C+2
         TTiA==
X-Gm-Message-State: AO0yUKUGd1X4DHtOBZsE0Jyob9xoAhBYBeHXYBp/dcV4NJZiqbFy9EAX
	hbeGGNZ/n883I9f8paZlFTOkUw==
X-Google-Smtp-Source: AK7set+mfsESm6FhCUVbPpBS4o2ZwfEIZrHS0GSjjE7LL6WnlaHBrOa5vkgBJgbjhYrNsG8jr1kFSQ==
X-Received: by 2002:a05:600c:3550:b0:3ea:bc27:6a64 with SMTP id i16-20020a05600c355000b003eabc276a64mr8765213wmq.10.1678098686828;
        Mon, 06 Mar 2023 02:31:26 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c351100b003e4326a6d53sm14498645wmq.35.2023.03.06.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:31:26 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 25/26] s390: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:07 +0100
Message-Id: <20230306100508.1171812-26-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_023128_301680_7CBEB6F2 
X-CRM114-Status: GOOD (  11.61  )
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
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogSGVpa28gQ2Fy
c3RlbnMgPGhjYUBsaW51eC5pYm0uY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgotLS0KIGFyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXR1
cC5oICAgICAgfCAxIC0KIGFyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggfCAxIC0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L3MzOTAvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2lu
Y2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCAx
NzdiZjZkZWFhMjcuLjk5YzFjYzk3MzUwYSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUv
YXNtL3NldHVwLmgKKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3NldHVwLmgKQEAgLTcsNyAr
Nyw2IEBACiAjZGVmaW5lIF9BU01fUzM5MF9TRVRVUF9ICiAKICNpbmNsdWRlIDxsaW51eC9iaXRz
Lmg+Ci0jaW5jbHVkZSA8dWFwaS9hc20vc2V0dXAuaD4KICNpbmNsdWRlIDxsaW51eC9idWlsZF9i
dWcuaD4KIAogI2RlZmluZSBQQVJNQVJFQQkJMHgxMDQwMApkaWZmIC0tZ2l0IGEvYXJjaC9zMzkw
L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDU5OGQ3NjllNzZkZi4uMDAwMDAw
MDAwMDAwCi0tLSBhL2FyY2gvczM5MC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKKysrIC9kZXYv
bnVsbApAQCAtMSArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBX
SVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLwotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
