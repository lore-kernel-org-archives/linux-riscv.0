Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560B6C678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Pb18rFFblamJO6suPLM7z5aWv09ytduk8CgOjnQIyw=; b=vTOumozPSupTSZ
	0HMVlgLTh2BKx/CG6g6xqgw6z/IPzkRDAeg8qNnwiQVfhUu+jIjvGj+yO+F4Ki5bUzPK8YGYaLABn
	qfHK2gpYFoJW98rKeIBfHCuI7aOQQoKA4nOk5mvNk/NtytWrj9R2eumeRN76KaXUu2kTm1j+YSZPN
	FI+/ORpSXm03nHD33NrJZJ7bHh1qfdrdmnmv8cndegwmhLkgDmU5lq0RvqnlsD0VnbHTxzZE3U0Xx
	7zWmpE6kLwXLjejM8yAS1PwEj9PiTYiQaAZkb0Gl7uKllfEZjTHpxnNl6+o7FwSHG6sfByC3Y/bzq
	6rDzG4Ilt+bjm+f2F82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfeh-001XmX-SZ; Thu, 02 Mar 2023 09:55:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfee-001XkY-HQ
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:55:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v16so13095624wrn.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulDUS2iJXFm2m4kQCMOaQjdrnpHm4utsIFq2lL+6C40=;
        b=POzlmxOjJt+vUzjHgKiyLtmHF93D8dc8ElKS6QtpjXdmUesEpRKPxKBAc6zrtoOf9F
         EfQUD/qQ0T/79OjBhJTE8sqLESK1usXr+OZUB2gpyuSHrXMghaSar4AmmQZS9otBXuOq
         bezlKuZXTOXIIbTaLdNhjqLE7JHQMPI0R1ZZBygS0Z0KTGxwcz7LUmZ4DZDaZAkpBXGE
         dR/VgZ/ExD85vcRYDVvp/KOCY/q4r8EobUi6q81RmOCzdt+OmumHCCFVctgWhbWvZpIp
         kpDLSIqzyWoyofHRT78OAMPZFHo1dnI+KtFcPsNtH0oOfHFkWRZu0lLSKZB8FaA6knok
         i2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulDUS2iJXFm2m4kQCMOaQjdrnpHm4utsIFq2lL+6C40=;
        b=eLtCrkX+wX0EudVe9pgoZzyy8lEECAi23AC2+kc2/uX31l8LwvUjvvuzYbANKzL/M4
         3SmmBl2IHUJuIboyobiScx0b/5Jiu9zv7mvGP02rF9DzuB6NsbCdb4d7NtyJP+NTgWF2
         k30nTbUinlHqGjvx1qET3I7UH1QE8FgIXiOhHv9eoU7a43pOaQhpxUTnZDB74KMmomC/
         bmWMtYzToXa5JsgLWGqWv0dbqLUQUIRDjR1n4P5unt57tz1yu6MXtRtsXLp7rBrZk8WT
         A6D6/rJl+D0ZxsaND8Zrhhq6L9O0NVjQnk4gsZSkEMrs85MhRSguYl7yekuwtJi8EuVj
         LkWw==
X-Gm-Message-State: AO0yUKUKbj/FBh9BsNWC49zSy4XMsSXzxwTTMau9Gtrm4ElgENAQ8J+U
	zOnWsm9Bo0f20fCxfZNk5Ujfbw==
X-Google-Smtp-Source: AK7set8Navb3iBc+2hpEMWYrWKHhP8mttsp1Jdp2Zbxa1wHwXxwyR7TH8IQILh9g0msJIIvsN7M/vg==
X-Received: by 2002:a5d:40ca:0:b0:2c7:4ec:8d79 with SMTP id b10-20020a5d40ca000000b002c704ec8d79mr6522449wrq.21.1677750914917;
        Thu, 02 Mar 2023 01:55:14 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d45cf000000b002c703d59fa7sm14611580wrs.12.2023.03.02.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:55:14 -0800 (PST)
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
Subject: [PATCH v4 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:34 +0100
Message-Id: <20230302093539.372962-20-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015516_652002_37E40D34 
X-CRM114-Status: UNSURE (   9.95  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KQWNrZWQtYnk6IEhlbGdlIERl
bGxlciA8ZGVsbGVyQGdteC5kZT4KLS0tCiBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3Nl
dHVwLmggfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBhcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKCmRpZmYgLS1n
aXQgYS9hcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3BhcmlzYy9p
bmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGJm
YWQ4OTQyOGU0Ny4uMDAwMDAwMDAwMDAwCi0tLSBhL2FyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9h
c20vc2V0dXAuaAorKysgL2Rldi9udWxsCkBAIC0xLDUgKzAsMCBAQAotLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAgV0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8KLSNpZm5kZWYg
X1BBUklTQ19TRVRVUF9ICi0jZGVmaW5lIF9QQVJJU0NfU0VUVVBfSAotCi0jZW5kaWYgLyogX1BB
UklTQ19TRVRVUF9IICovCi0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
