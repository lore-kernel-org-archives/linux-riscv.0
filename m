Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF0C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IykZlo1BXB7RXrnMnHpLD1qvQKSpD6mvNqkO86R8iYc=; b=hgx23YTAl8/5qK
	xhjpFkTmBtGi1DPir+9GqDn/BhH56gKZsTIvnIUSTUaZIM4sC+AJFrIAvXslRrO3j11NBuQUIYEjU
	T2ZfKBRFPFWVqXmHwOI7ToCmOsGYgVUm8BHkh1FiwUySCHflrNs4JIyiK7Ctc7E0qQ/82qcswv6lf
	jPo5g6w73z+k25B4FPSEEYjFUnuf38gcvSjfIVjWh/zz1mIGg0HjBa4XFrPoEdWX6xicH2gfFvTJF
	aGXm3PiV/jAzDr3RYDiEiX0HTp/9sMK2wnyQot9DP4O6eii0BeooTiCuzYEkCH8hWAbu8Kx6faLoU
	O6UFTTo7I3dF+xglzNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CL4-00FzxJ-2f;
	Mon, 05 Jun 2023 15:41:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CL2-00Fzty-1g
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:41:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b026657a6fso43036985ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979702; x=1688571702;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vWfWpcMCj1+Fb0BnBKmql7KJ370X51psXYGnDJmV9XE=;
        b=aa2XcqtZLW5iqnaCW4Qqr1H+Tzlig3YdL5foi2KV8ac0ghkespqXccDGXXKNl67dzp
         ntoXqcpEbUNXvG5jwzxqIS5KwFz8xhHNWI/SGHmvcSQ2teKRNuv/u+rgbNtYZ36omA6S
         0gqzwlRCz9zWjL1DPbymwwynFbAGzjHY5NEUVVXmd8WETn/AzMuXGLvdBcqDSf9KZ1j6
         v+X+RAJpugMnSnGeorxLAmIlpnxsjubdP5Udp40y6rMZhN9bi60e6YQ2sdLGuMjdvoXz
         TMfX2v3MjkZ4zJh15+lPq3UDK3JH4uglzBSdGlRDu9xCy0w27inNr0rnqfpXqvQamCjY
         JT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979702; x=1688571702;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWfWpcMCj1+Fb0BnBKmql7KJ370X51psXYGnDJmV9XE=;
        b=QFr61/zK4HY3hsrHIH1GlrYmdmETjCDA4Med9hUqtSKhuprCWGoMEYSCP/ZRz0qfe6
         bBm81eMzZardeyiq8QZzrdxdzLmBQ1S7Tmi7YsUhuOA0qqgsorjysIBJdUeOl7IF9hLD
         3r4QuHCyd98CS67Z+WiUAS1kBEDZYBgjn7VTyZt1H02aZYKMUwQqlFVU2H9Yll3ddLVj
         LnSH3P3iBl8USGAZBDVFEVwNdFsgz428hyDbI4dASd7UbBwWHz42I4ltVjnixrTLrVza
         ScowsHIeZj0IkEfIrujyw+Axn8blKKe3XkHFqHaEF7DwHFYrbzrJVLfiADs3PjjpKBUZ
         pPSg==
X-Gm-Message-State: AC+VfDxXUF2xRtWNSeBS/fGP0XG2oWbJHP+F2uM8/H890qa7U9WBHCRj
	jDD3ds3j35jAfJRIWyUpQlqcVEhwlKXSi4hAW+DQsBWYUxLy1v6mxDTHwJ5+uEDdwaekSKB/iNo
	uLZPaLdofDrSaj8BsUB7RkPjiOWjR6qtLT91o1p0YZgUVdCMCTY0bXX/U3A+OwFyo9+wCWc98lH
	lipIV1W64+CBQ7eqE=
X-Google-Smtp-Source: ACHHUZ5ALSUm1i1u3l9MlL1FkN2klEz94jSTED1PaH9Zd5Uees8rVfXo4MbbiVQ0JqYoJeYPnONJ1g==
X-Received: by 2002:a17:903:24c:b0:1ad:f138:b2f6 with SMTP id j12-20020a170903024c00b001adf138b2f6mr8809583plh.16.1685979702314;
        Mon, 05 Jun 2023 08:41:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:41 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v21 20/27] riscv: hwcap: change ELF_HWCAP to a function
Date: Mon,  5 Jun 2023 11:07:17 +0000
Message-Id: <20230605110724.21391-21-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084144_560200_D478C98A 
X-CRM114-Status: GOOD (  13.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Using a function is flexible to represent ELF_HWCAP. So the kernel may
encode hwcap reflecting supported hardware features just at the moment of
the start of each program.

This will be helpful when we introduce prctl/sysctl interface to control
per-process availability of Vector extension in following patches.
Programs started with V disabled should see V masked off in theirs
ELF_HWCAP.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/elf.h   | 2 +-
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index ca23c4f6c440..c24280774caf 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -66,7 +66,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
  * via a bitmap that coorespends to each single-letter ISA extension.  This is
  * essentially defunct, but will remain for compatibility with userspace.
  */
-#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
+#define ELF_HWCAP	riscv_get_elf_hwcap()
 extern unsigned long elf_hwcap;
 
 /*
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 574385930ba7..e6c288ac4581 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -61,6 +61,8 @@
 
 #include <linux/jump_label.h>
 
+unsigned long riscv_get_elf_hwcap(void);
+
 struct riscv_isa_ext_data {
 	/* Name of the extension displayed to userspace via /proc/cpuinfo */
 	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 28032b083463..29c0680652a0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -293,6 +293,11 @@ void __init riscv_fill_hwcap(void)
 	pr_info("riscv: ELF capabilities %s\n", print_str);
 }
 
+unsigned long riscv_get_elf_hwcap(void)
+{
+	return (elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1));
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
