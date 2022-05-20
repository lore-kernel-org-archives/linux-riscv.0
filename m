Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3495AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrJN6trXBnwsDZeg3oFPO0issDXDNVHzHQNnIgDqE54=; b=fUq+enTMEsnVeH
	B619yPHerR7hmXTWZvc2lYNHSIiy9RtlPr365leVZXBXX1Omg7XeT1y60GT2blPIudMstQIM3Q15s
	goZLeAStFzPC3xIWrnlYihdnBIoJbdfOLpK2WxhIYgKTdqi9VbI3Mq9itZKnZx0dor5HIZwJixug9
	N5LbCGf2AStyWM/25ikYOhAJLjjbllFwNHfznotCAY/ztlxaCAgppOhAoPPhoZ+tewINhEyNBAJZQ
	ssxo+EO7AXC3aC23qs3BDo7Qa9j0SyfYzc5QCg9tXuox0lVonxrXMPIHas3La1WX8YDn+q2bXCSiH
	pt8eLGhWVV6b41gjGhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4p0-00DJvR-U2; Fri, 20 May 2022 15:45:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4oh-00DJjh-69
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so11811221pjp.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=VE2vUXFOy2mJkujHyFNt0HPmwfcDu8WrrrqGHwab5YA=;
 b=tuEF1onridrYFom6GHGoVmHMvyrHQV/Jf6B0yeiPYn43PWuCZ4txpDmw1dqIEPI397
 t5iPNCMjW7PoX+tc8jbAUuH+BtaBGhp84qL41HRaB+DxQsJQC5EubyjCwjzedw8vRa0M
 DOZewV7xP26BcxzG8nNBVz/1ZAHv+yYAEcqmwxfbbXeF+P45JlXSS2N9YAx08Gm4/53w
 jkQMCSJDbP6WMAnG9MJccNFyCBJ6Bz0WlkimSCCLCsYlwwcNmedJ2b3qjgTg30qXLW6B
 y3T1P3I694ihOLCY/fCBx+g/6qUP2n1uyx7/SrJKVy53gR9qE31qHY2VU7Q+nBgZveBu
 z18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=VE2vUXFOy2mJkujHyFNt0HPmwfcDu8WrrrqGHwab5YA=;
 b=5WHFZNQbLc07jreeUYnx6j/wkrz0Pty+4Gz+lz2aZWY3Vxl/mzUfHM0H5S7WKV6le4
 Iy4ohllNnD4DCZjq1KunP2TrAnrOufAaCVpeZz76MH2Pvp6wv41/TpOzlMKewN2PAtIo
 TbV3SK8vo6tgLRr/JVCR2zxq68ts11cFGZvemqHVlL79iu88yVpBSIygw5K+dFm2c0qY
 IOJZ16t9vYdYbN9JytZX+s87iWW1XHG/jWv3JAyybWv7sOrv2SJTzi8sZlj8ZIfgiWjn
 /rC8tbZIM3wQbThbpJ322HM2DtkykC+PV101y8tbsCSJcWTvBBJ7NEH1dbdK4elLNzHo
 WjYQ==
X-Gm-Message-State: AOAM530j2Ri6myzBBZf25jWRQV4/FszcdHO5NOJ/hViGSOJNSrMeN5Hf
 wY1VX8Ez6Nv3cmIexyWkCjZOGQ==
X-Google-Smtp-Source: ABdhPJxutQunHuqBnSDi1AyU5l++uXDUp12EI7aTjzru4LJnptzsRLuteBJZfMF6zOk21wIEpEwfSA==
X-Received: by 2002:a17:90b:4b02:b0:1df:d622:dd07 with SMTP id
 lx2-20020a17090b4b0200b001dfd622dd07mr10203411pjb.160.1653061526701; 
 Fri, 20 May 2022 08:45:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 a12-20020a62bd0c000000b0050dc7628188sm1982140pff.98.2022.05.20.08.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:26 -0700 (PDT)
Subject: [PATCH v1 3/5] RISC-V: kexec: Use Elf64 on 64-bit targets
Date: Fri, 20 May 2022 08:44:29 -0700
Message-Id: <20220520154430.18593-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520154430.18593-1-palmer@rivosinc.com>
References: <20220520154430.18593-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
 zohar@linux.ibm.com, 
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 liaochang1@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lizhengyu3@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084527_280577_F16BF0FB 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Most of the Elf macros automatically select the correct Elf type, this
converts the one explicit Elf64 usage to depend on XLEN.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/elf_kexec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 9cb85095fd45..4532e3cf17a5 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -342,6 +342,12 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 #define CLEAN_IMM(type, x) \
 	((~ENCODE_##type##_IMM((uint64_t)(-1))) & (x))
 
+#if __riscv_xlen == 32
+#define ELFN(T) ELF32 ## T
+#else
+#define ELFN(T) ELF64 ## T
+#endif
+
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 				     Elf_Shdr *section,
 				     const Elf_Shdr *relsec,
@@ -367,7 +373,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		void *loc;		/* tmp location to modify */
 
 		sym = (void *)pi->ehdr + symtab->sh_offset;
-		sym += ELF64_R_SYM(relas[i].r_info);
+		sym += ELFN(_R_SYM)(relas[i].r_info);
 
 		if (sym->st_name)
 			name = strtab + sym->st_name;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
