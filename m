Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59482C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFSdW7bQPMs5hrHc/Zy5NFH8lrMAHLaED0SgICWqzVY=; b=bcYYSTnZGd5fU/
	V2Q4lOAIMQ3xNZRWY+GL8/MBy6cD07sAu8oVM8eV8csH5aidX0wejMLAgSXUMN31wDeNFZUigCZN3
	KMkrAL/+3bkOW/N3hnkoebaH9tarL0Hjr557hRn07FyxWc/yepAe0SfPi+BV5nyZ86veCh6imxVWU
	lySlWMhnFrxuUsjkb2jovvG0903VXfhlQ3d+3nNc2QLhkWiMk7Tqp+yeM1ee50scPSYyF1pieMuEI
	N59Hq+/QuXw3eVkWK63aSaB9qlAIoAjKuZ5MZJfEww9sN73Hq8klJB8HTSrzH4WLJJ3vNMTwJUM4P
	sz7146SFP9wfsihs7kqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfSn-001U6H-OD; Thu, 02 Mar 2023 09:43:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfSj-001U2O-Vt
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:43:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id bx12so12711424wrb.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEfUyHhSZ3oYgL6bFnxkvE0TCBKNcLgB/+iPRr5Nmfo=;
        b=THlbw0f7YBDWzcp/D7jU91zoK7h+sLtdoKT4dkUxCfNC7PHuf6+xLX1U8YBxxphqv7
         SLKjiOegBsh3QW5ueV3X6lOfAmYpWoOP683+Wd3yzsKexXlrzQWdfzKTHW8pqqspMFWd
         wyysgVMQuZqSpGcd7XWqJBaI/X9IEjsYMQiF7DJjchBM+PeDCPRXaOMvhS73l+o9b+pk
         PByonJmlUdc2j9xadwPPHavP5X6OM0XAlddx7GeWel0hgjNx+cXSk4XiLYDXt0gQv25g
         blcIBuzunKMOcfdHuG4/AZbEI+cqqiGwwt5wcUbhD0LHAezoTL50NxN1le9xQZUVW4vT
         21oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEfUyHhSZ3oYgL6bFnxkvE0TCBKNcLgB/+iPRr5Nmfo=;
        b=lRYDbybIZjROTwnqDIUyX9vQjqHcWA9bWCfkhV+krAcxFqUPW+0tITLdDCKRIwW20N
         y7tggdPVOfpqXjZ4OXpBglplmVtLVVp8OPL0IUFK4bs3t4Uc5/k10g4RcHm+Cy309Au1
         shiev4C3XE31zz4K5xPrLqgeiyvN2Gza2emS9mEyPxxGBTKqkW3XhfMoKxYS0uHlOspp
         GXIaEtuhTmz/4DEBBjDrldQk2CThkJTsCqvrcZn+n0pexfD5RkcVP/if/sJSC5UIeU7H
         AjzpEQsXk/leSsA8DlHylBpginvI2lMf8StnTPRvqH0pJbQiyv6IlbE6rHmDT1Op+W0Q
         9Cqg==
X-Gm-Message-State: AO0yUKXdScg7chh3jE2TlP2bPfE9ZpqsOAeTY9eZbAK/hfUuvCgvDmhc
	vLxz5GYnP2tHniQoZxHF3z+BVg==
X-Google-Smtp-Source: AK7set/F94zZ8y7FiH0XLMUcsTDHA/cQVmeboRfi75ZoQWq75QeIoOfllfRsQw/U31Sx77gqBykQyw==
X-Received: by 2002:a5d:604b:0:b0:2c7:faf:af32 with SMTP id j11-20020a5d604b000000b002c70fafaf32mr6686722wrt.14.1677750174151;
        Thu, 02 Mar 2023 01:42:54 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s4-20020a5d6a84000000b002c551f7d452sm15080709wru.98.2023.03.02.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:42:53 -0800 (PST)
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
Subject: [PATCH v4 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:22 +0100
Message-Id: <20230302093539.372962-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_014258_087228_A4D95FE0 
X-CRM114-Status: GOOD (  12.48  )
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
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KLS0tCiBhcmNoL21pcHMvaW5jbHVkZS9hc20v
c2V0dXAuaCAgICAgIHwgMyArKy0KIGFyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgg
fCAzIC0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL21pcHMv
aW5jbHVkZS9hc20vc2V0dXAuaAppbmRleCA4YzU2Yjg2MmZkOWMuLmExM2I5MjU5YjQ3NiAxMDA2
NDQKLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3NldHVwLmgKKysrIGIvYXJjaC9taXBzL2lu
Y2x1ZGUvYXNtL3NldHVwLmgKQEAgLTMsNyArMyw4IEBACiAjZGVmaW5lIF9NSVBTX1NFVFVQX0gK
IAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Ci0jaW5jbHVkZSA8dWFwaS9hc20vc2V0dXAuaD4K
KworI2RlZmluZSBDT01NQU5EX0xJTkVfU0laRQk0MDk2CiAKIGV4dGVybiB2b2lkIHByb21fcHV0
Y2hhcihjaGFyKTsKIGV4dGVybiB2b2lkIHNldHVwX2Vhcmx5X3ByaW50ayh2b2lkKTsKZGlmZiAt
LWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggYi9hcmNoL21pcHMvaW5j
bHVkZS91YXBpL2FzbS9zZXR1cC5oCmluZGV4IDdkNDhjNDMzYjBjMi4uMTU3YzNjMzkyZmI0IDEw
MDY0NAotLS0gYS9hcmNoL21pcHMvaW5jbHVkZS91YXBpL2FzbS9zZXR1cC5oCisrKyBiL2FyY2gv
bWlwcy9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmgKQEAgLTIsNyArMiw0IEBACiAjaWZuZGVmIF9V
QVBJX01JUFNfU0VUVVBfSAogI2RlZmluZSBfVUFQSV9NSVBTX1NFVFVQX0gKIAotI2RlZmluZSBD
T01NQU5EX0xJTkVfU0laRQk0MDk2Ci0KLQogI2VuZGlmIC8qIF9VQVBJX01JUFNfU0VUVVBfSCAq
LwotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
