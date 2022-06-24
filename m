Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9810C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+ebNH+JGT5ryJ7KBqf++sFRTTBl+pVBNgmb4TR6HAQ=; b=qp+iNYSyH0tsvQ
	wqHoYsar0itvqaC5vEn36F+39jSb4YIOm/swgfehB4CVh45XAgmqyTVFuUPVURHCzxKpaK5PahDvW
	pD1UI+8cQ30f9Xq4mI0pC1s6QFbqg7YfxcYyhUMhB+r7B/etT5ls/EYC5QGQdQKtJjYqXa2j0rrtt
	9Uv+BTJSG6VWZCbdzsXJ5vqqQMD7vOVtCmet6NP+xe+0mc8DowWjxj25MUVePSXCmhIW9q/HY62dR
	bKrSuxJYyaXawahcXRGT/5Yt4hWAW8jAa1qTXoQFha1r/sCxDsOTtx+UqpKfAAmdc7QARXFu03JhA
	SQDSuw7NFrBLMldiGyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bWb-000S8N-3R; Fri, 24 Jun 2022 05:06:33 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bF9-000HMH-6R
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 04:48:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 9so1349191pgd.7
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 21:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=jMCGTpB4qORgO/HAj9/J+wYW1m5dKZO1Y3zKxKtdM4E=;
        b=vKrF/uHWOix1+6Rl9MXcsk8W+kFQn6mM1CVaeA0uQogMNrgp1k5wMZQey+aLu9X84R
         BHXhsOPoUF5SO8RkvrBFWIykapEklgV+UwvVqywVNBz3I1je7hl1nHH5FqCv2/bTn5gE
         b6zmsjYCTjMu2DCbRqxal23S6foeAxjvZ0I9Vb5h7bTIL5rTPNVCdmhSv3BwnpnzJ8+h
         sFU3SoJoaQ9pnSxUOSPWi0V0Q5O82fR6fWL+FaNZd8GLx4embxn/u/LXoRJYHDE0pb8r
         gD6DJ+Rd7qA2JTDGwJ+L08FUMO2kUJU+iPqZ6+nAFU93FeYZs3QiOusK8ZsB5m3Zx5Bw
         TQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=jMCGTpB4qORgO/HAj9/J+wYW1m5dKZO1Y3zKxKtdM4E=;
        b=olyQbLVbq5TMp4P53YWB2qaQeVjKJuJIV6C65XEwtxzTyG+Q/C9YRZ5STpiglgh0Mk
         JqKgSbj98KJh/foAEe7vISaov8rV4lcIczG88rx1KenYs4Ed9UzD7nVrqP5UPG6LCM+L
         777N2vzWwGxfEZHZNtEtNlad+ty7ELEBqFA5gOBJt2hymfRdrR7/1IZ/oQLJZhIEcaAO
         +DZjlnjicSTqveYAKArnaiF1ib0DkqTQizZb5hPxgCBRIiH9K/ONdTC60DYejt9TF8DF
         OuzTcR42kHrcPysdujEMVoEOHXMYZbzP4TPos5gxJQxHqHVb8gK9WBn0GxwvH1dUVRYD
         IMzA==
X-Gm-Message-State: AJIora/W12jIZHH7vXQzO9bd1D14w1L02pw7YOOt7tspn+4oEgi9cgCC
	zLpeJJ8Ly6BG4p+Ouisa8urj3cWxulPwUw==
X-Google-Smtp-Source: AGRyM1uXZHQEpXqpNCieCPKUs298Zc7ZlsXzMC3KKqzIqfHMvB+F20JyDbM4hFNh9MRoTPgZTKoG4A==
X-Received: by 2002:a63:fa41:0:b0:408:9d1b:2e57 with SMTP id g1-20020a63fa41000000b004089d1b2e57mr10364962pgk.102.1656046108122;
        Thu, 23 Jun 2022 21:48:28 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id 64-20020a621743000000b0051e7b6e8b12sm579926pfx.11.2022.06.23.21.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 21:48:27 -0700 (PDT)
Subject: [PATCH v2 3/5] RISC-V: kexec: Use Elf64 on 64-bit targets
Date: Thu, 23 Jun 2022 21:48:09 -0700
Message-Id: <20220624044811.9682-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624044811.9682-1-palmer@rivosinc.com>
References: <20220624044811.9682-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214831_279532_1E52557F 
X-CRM114-Status: GOOD (  10.13  )
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
