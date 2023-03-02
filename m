Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05313C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2SYwLT1kvcy6hdEOVSe5FJt+BjwI0pH4VFM8jQXrko=; b=QYdAazQQImjBvJ
	ZGXn9oqJjdl8uN9YfoemtwnthmD1gRqqHej4qb+LZD6YRR3xoxiIfV9xBGj7fTVE8CpXL+wO7M/Dd
	YQKrnbvcAWuloHnbEwr8NH9x7ibrILKzEq7FsN2F2qkKi3e4zYpFFs3MCoCQJ7T8QCCKlQLhmfk/V
	Y4K0C62Flrg+nxesENZoToifE8x/tyxAzGVQPtiQLH6+VxIL5o9Mj4mdYPm21EXp1mzPDDW8DWlZu
	plADYavHeIPK6K017bClBNfZsNdCPzh6ErLnJ43VfrXK63VgTBX02TARQJlsvtdJIzFzfVcURFuME
	LQKI9rbndeGBHEzKYUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfMq-001RTx-9I; Thu, 02 Mar 2023 09:36:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfMl-001RPb-Ku
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:36:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id t15so15854033wrz.7
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzM+xDlvnOMEGzjeXRPSkpQm3q8SwokJ4gg6O0qi4nk=;
        b=2pKwrvWIyRi1OpIA1AfAvL3QfUnAmkzXMVZnDdYszZoGfKVRU7Y7Cg00FyqlVMAfzR
         8KlQggPnGWQzsGSEwXZKdlUAPPE/CzI6mENSGPUNC7TJzGm4piwA2sFuDu6AZk3OrPZ5
         jUTsjMfkhZt2pEIwEO00Long7JrfP10J+5zHSxBm8gOp+WEHDzueNJcprrOdnrLd9geN
         /fMRarw42gqFzn7wEDXX9VYME2EGY62hMrCuB2dGWNTpfH+fHchkHWK7Xi84tVLWepzD
         ug8wKExaiT/HyV/tIIiv8zBp3497WkVWRWojXOWeIiWOgBYuevFlPmQ47yK7c/rvtU27
         cpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzM+xDlvnOMEGzjeXRPSkpQm3q8SwokJ4gg6O0qi4nk=;
        b=brfIvQw1xb+QXYrA0CEOsaYc7DriR+MtJXnFg81cqi3HPZeZXeg9mi4nGI5PjZI03X
         jxEA+BhiLq/Oe9ymyNBGT95KjvPmd2tSQan+6veqHPslkol3MV/sLDb2j6TTSSy1dL6H
         0MyEhBWG73JuQVbBXZYrJSxT/KrUsj6VqY924pElvFkRL3qCYj/CGVl0KVGS7XT9DSYr
         jpPjuNn/0ifs1kb0Uqz4jbEITh1Af9vIz+JbYnfxkI6noODxyuBA8J5iIyAHB0ZCzOXg
         LaEx5Kj7QtXG92fGn0BJzdhRvY2f+4FzLG46aA1qUEelVDfKksAMmUaw6kepJQFa9TOB
         lwew==
X-Gm-Message-State: AO0yUKWCqu5gSopsKSqGBAhGzqeZ0zz97dwRISpaFJv7noxWHtooUqCC
	FXnfKt+s/6H7OscCNmwFztwCAQ==
X-Google-Smtp-Source: AK7set9S0WvRgB6m8Y5j9Er6rP20ohMkWZVlQ7kaeMx2hJnOK1ueaGS8lSOcB0Pgql0gAxTneTtghw==
X-Received: by 2002:a5d:4708:0:b0:2c7:658:f835 with SMTP id y8-20020a5d4708000000b002c70658f835mr8108283wrq.33.1677749803806;
        Thu, 02 Mar 2023 01:36:43 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p8-20020adfcc88000000b002c55b0e6ef1sm15340416wrj.4.2023.03.02.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:36:43 -0800 (PST)
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
Subject: [PATCH v4 01/24] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:16 +0100
Message-Id: <20230302093539.372962-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_013647_800999_FF38C6CA 
X-CRM114-Status: GOOD (  13.75  )
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
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL2FscGhhL2luY2x1ZGUvYXNt
L3NldHVwLmggICAgICB8IDQgKystLQogYXJjaC9hbHBoYS9pbmNsdWRlL3VhcGkvYXNtL3NldHVw
LmggfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL2Fs
cGhhL2luY2x1ZGUvYXNtL3NldHVwLmgKaW5kZXggMjYyYWFiOTllMzkxLi5lYTA4Y2E0NWVmYTgg
MTAwNjQ0Ci0tLSBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vc2V0dXAuaAorKysgYi9hcmNoL2Fs
cGhhL2luY2x1ZGUvYXNtL3NldHVwLmgKQEAgLTIsOCArMiw2IEBACiAjaWZuZGVmIF9fQUxQSEFf
U0VUVVBfSAogI2RlZmluZSBfX0FMUEhBX1NFVFVQX0gKIAotI2luY2x1ZGUgPHVhcGkvYXNtL3Nl
dHVwLmg+Ci0KIC8qCiAgKiBXZSBsZWF2ZSBvbmUgcGFnZSBmb3IgdGhlIGluaXRpYWwgc3RhY2sg
cGFnZSwgYW5kIG9uZSBwYWdlIGZvcgogICogdGhlIGluaXRpYWwgcHJvY2VzcyBzdHJ1Y3R1cmUu
IEFsc28sIHRoZSBjb25zb2xlIGVhdHMgMyBNQiBmb3IKQEAgLTE0LDYgKzEyLDggQEAKIC8qIFJl
bW92ZSB3aGVuIG9mZmljaWFsIE1JTE8gc291cmNlcyBoYXZlIEVMRiBzdXBwb3J0OiAqLwogI2Rl
ZmluZSBCT09UX1NJWkUJKDE2KjEwMjQpCiAKKyNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUJMjU2
CisKICNpZmRlZiBDT05GSUdfQUxQSEFfTEVHQUNZX1NUQVJUX0FERFJFU1MKICNkZWZpbmUgS0VS
TkVMX1NUQVJUX1BIWVMJMHgzMDAwMDAgLyogT2xkIGJvb3Rsb2FkZXJzIGhhcmRjb2RlZCB0aGlz
LiAgKi8KICNlbHNlCmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0
dXAuaCBiL2FyY2gvYWxwaGEvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCmluZGV4IGY4ODFlYTU5
NDdjYi4uOWIzYjViYTM5YjFkIDEwMDY0NAotLS0gYS9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9h
c20vc2V0dXAuaAorKysgYi9hcmNoL2FscGhhL2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaApAQCAt
Miw2ICsyLDQgQEAKICNpZm5kZWYgX1VBUElfX0FMUEhBX1NFVFVQX0gKICNkZWZpbmUgX1VBUElf
X0FMUEhBX1NFVFVQX0gKIAotI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQkyNTYKLQogI2VuZGlm
IC8qIF9VQVBJX19BTFBIQV9TRVRVUF9IICovCi0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
