Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF76C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7kQR3Ac0xgmFIESXsi5zwC6b1Moq/H666xon+g9G88=; b=bp10W+IG+bN1bC
	BzNmLLVsnpc5v1CAINCoZoqLdMWBJxV0voe7yy9R46nypwLdRK6nVHjRt2GcrBf03DQYiSF0vbsIo
	884mJ7lFV7c/Bb46T/HE+4iSeTYvebTiOspYq7ggOEI+GVs9I9jBlsZooYU5spA1qAnKysUHV2rxl
	c4E4o5IuE2GshIk7fFkYwf6FtXaA/PJPvuHc+zoEfe+0J4cPWSKE71YTbHKnddlynf/PhQgd9tesl
	TXI44ZUTBRo6onf+io8gYfvMeVb8s0LYyN6amiOKp3DY/mZLgMc9E2fSQt9/VApZvSD1vOTdDgADm
	wVrZPVc+gJdKgfNBtl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfTm-001UU4-3E; Thu, 02 Mar 2023 09:44:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfTh-001UQM-FM
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:44:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id l1so12823904wry.12
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbz3qPh8Vf4E5t0N0jLkvnNCTDzRiNZiABy0E7ku09A=;
        b=FjcjeTZjTFaxH4VHm9vqzy6q58OH/HkCkp4eeNdmlVQohDZjtISKbQ1rDciJiVlhMb
         Lizr950uCsVfkEKNzL+/Ylk6nUWJLw7DQMP12nWoF6kjfP2umysCluiKZTHYQjZoEsI2
         Nhobim8XluTR4y0sVzGtdOJuXAA9BpfOFm0DgA0ygsO8UPqEpSpBMutzyggFWOmflinv
         BSFYwW3JULWxccPAPxFTRvX1TdQiZwPkgTlKoLqvH5F8ChwjZPSaggp1/t0Rnh/ejd5/
         iYy+4kl9dd2bd8ubZ+wAubF9VKZ2j6jItvpDWAgN8xfGg3XJbrjYv5byilTM87U+vsII
         czqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kbz3qPh8Vf4E5t0N0jLkvnNCTDzRiNZiABy0E7ku09A=;
        b=s5TWQ73/cNLfMYToA6edntROHDyVpGGf6A3OSawNijJ9SzLX6EUQkj2HFRJY0nxPlQ
         X5qweamPhxvvOyMODAqS14OGhgYl33OiO5QbYZSbXveh+Xkhv+q53dcQDR3+hrVOtqaP
         m74eprGcj9cg90hPlYK1knKhwHjAKXZd0ix76tSmiE17CxB1hMcfqaT1/NQxoMIilu54
         eV+d+WG7qcq3ZwCTWAG7KGIFJFcW8SHEAGGwdZyt8CRLohDL+N+cv1FnOste6wAkhG2G
         Vdcdi269q9jZ+7FTkmtpI8ANuOCiE0D/CD/B+3Uoos2SNdLZxf/5ERgQJ7b9/bSNlSfu
         gUZw==
X-Gm-Message-State: AO0yUKW8o6K1RjRBwMx4cgghVU5fhUcFL4IFYXW2P+WQB6gOwGPpo5eK
	XzJ15IbY5eZ2w+00oVYzj55HMg==
X-Google-Smtp-Source: AK7set+lZ7FSC2o4iKI8nuwF9t+GAc77tohtNIx45MEJkzo78fuSiMTvrDatTRm4UxHWNwZvRfNOQg==
X-Received: by 2002:a5d:6805:0:b0:2ca:6442:c817 with SMTP id w5-20020a5d6805000000b002ca6442c817mr6839399wru.57.1677750235863;
        Thu, 02 Mar 2023 01:43:55 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d6691000000b002c54e26bca5sm14674065wru.49.2023.03.02.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:43:55 -0800 (PST)
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
Subject: [PATCH v4 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:23 +0100
Message-Id: <20230302093539.372962-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_014357_613722_6B0AFCBC 
X-CRM114-Status: GOOD (  15.21  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpBcyBmYXIgYXMgSSBj
YW4gdGVsbCB0aGlzIGlzIG5vdCB1c2VkIGJ5IHVzZXJzcGFjZSBhbmQgdGh1cyBzaG91bGQgbm90
CmJlIHBhcnQgb2YgdGhlIHVzZXItdmlzaWJsZSBBUEkuCgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KQWNrZWQtYnk6IEhlbGdlIERlbGxlciA8ZGVs
bGVyQGdteC5kZT4KLS0tCiBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgfCA3
ICsrKysrKysKIGFyY2gvcGFyaXNjL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCB8IDIgLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQgYS9h
cmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20v
c2V0dXAuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjc4YjJmNGVj
N2Q2NQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3NldHVwLmgK
QEAgLTAsMCArMSw3IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBXSVRI
IExpbnV4LXN5c2NhbGwtbm90ZSAqLworI2lmbmRlZiBfUEFSSVNDX1NFVFVQX0gKKyNkZWZpbmUg
X1BBUklTQ19TRVRVUF9ICisKKyNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUJMTAyNAorCisjZW5k
aWYgLyogX1BBUklTQ19TRVRVUF9IICovCmRpZmYgLS1naXQgYS9hcmNoL3BhcmlzYy9pbmNsdWRl
L3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgK
aW5kZXggNzhiMmY0ZWM3ZDY1Li5iZmFkODk0MjhlNDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcGFyaXNj
L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaAorKysgYi9hcmNoL3BhcmlzYy9pbmNsdWRlL3VhcGkv
YXNtL3NldHVwLmgKQEAgLTIsNiArMiw0IEBACiAjaWZuZGVmIF9QQVJJU0NfU0VUVVBfSAogI2Rl
ZmluZSBfUEFSSVNDX1NFVFVQX0gKIAotI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQkxMDI0Ci0K
ICNlbmRpZiAvKiBfUEFSSVNDX1NFVFVQX0ggKi8KLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
