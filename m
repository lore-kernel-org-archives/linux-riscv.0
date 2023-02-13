Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE826C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44QVniVauSMQDtKL2q3NjoMFkYxBVpFYL5i1L9bnaVA=; b=11lEyFgoGz1j7+
	LHavV3fH6WbNH+xpWxZd1vCvGBy24As2c3yZWmPzcQV4UdZSTOVIOCHZy1W1w4MD+cRoRaa/ahNUD
	xuHgpD+ycs2GNjquozxc+++tjvVeDAZzc6FrJdFkpxe0rlgFAugyQEgqp9wopKN3ulhngrCIuBpD1
	tRWtfTM4k/lr01RiVGcAAjsU3yviPmmBlqQxJJaJYsdn2sON97y62Fb7CuCQ9KoySRhuHsczqt5wk
	SZCBsvsTasQcQWHsYCIW3WmfoHmFUgMcrFkFPKc2xIpDFzqlWvKxmZG+z3QWhbl0RQ++Nv9WloU8/
	+w9srjtfTnk0v4L94W5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr8-00D9Rg-1y; Mon, 13 Feb 2023 04:54:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqy-00D9GN-Pe
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id e17so3444672plg.12
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP4wZ0K6nVayFSsIwI2M/qbAeCayW2BZaB6BdNSazd0=;
        b=kQCkDlkhAa4XVmRG1hxXFbpWGlXPMBYAGXgy0L0uPsR9g5pVZDofnEGhHEJYmp4t70
         GThKDRHlZLQeCmf3sShq+tYAdJikORjaEoHzhV8XPsEC3fuBeKmrypEuXS7bnM4Hr1Mu
         ejAuWJdj4rylP7L48un2eYEoyEM3T/HgHUJ+XVCnMOro/vM0ja9j4XcrCb2wVTAb2ykU
         VVkETKJNdrlyLnPFCjstqmRxjQbAorY6hbHg6u7JiS4XZd2HNWZ+rc/s5B7cfxPqGP5E
         y7sCTgg87DvCTzj8NBBDe3V2Zk1icq2em5kbBEcbVFNjlxLiW6d6zxFc1ZAJ17l5bZV5
         /rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP4wZ0K6nVayFSsIwI2M/qbAeCayW2BZaB6BdNSazd0=;
        b=JiZgWfZ7FYEdnkVeCzAqXPUe1iZKvpwqHxKSzlKWscx2f2WS5/WwgKk+AOW5D4szOo
         eOlma85lFkeqVh/H5SwgEMsudXTvfa8kgNGGgvNf1y4f5Lsiw577DCPgAY8lBbaNQJx6
         ag+gfoFy0VjbFjaWLpEvNiCZeiWla3Xh99ctxukl05+bE/GLMopdt2N20LriOy0CCgGJ
         6ZgvAf1IyaAeV1p7Lc1/I7ignygsx4DT2Di1K7MPo7rIGa31ehDeKYB+JltJfh33xZLQ
         HcISf3UxbHh9N4BSf/GEfFymWkSbDqh3wcqMsgYxUzl8lmYnA2cILLnIs8CnmpadnO8d
         gHvQ==
X-Gm-Message-State: AO0yUKUhWDZod0j1S4V3bxvTX949AW1tAqO0T+H45qjJhNxMk73U2uBz
	vjsXqE82+Kzd1VLJQvCYREaOAUAHKil0MvrV
X-Google-Smtp-Source: AK7set/Y/udvpjSPyiRHvzVVe58rgU9SM3O2saFl6KwR15sjL2H2TEzdTJbI8CgO0QDxGQ+4+3WsRQ==
X-Received: by 2002:a17:902:ce86:b0:19a:9580:750 with SMTP id f6-20020a170902ce8600b0019a95800750mr5863992plg.16.1676264052424;
        Sun, 12 Feb 2023 20:54:12 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:12 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 RFC Zisslpcfi 07/20] elf: ELF header parsing in GNU property for cfi state
Date: Sun, 12 Feb 2023 20:53:36 -0800
Message-Id: <20230213045351.3945824-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205413_060276_35CDBC61 
X-CRM114-Status: GOOD (  12.06  )
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

Binaries enabled with support for control-flow integrity will have new
instructions that may fault on cpus which dont implement cfi mechanisms.
This change adds

 - stub for setting up cfi state when loading a binary. Architecture
   specific implementation can choose to implement this stub and setup
   cfi state for program.
 - define riscv ELF flag marker for forward cfi and backward cfi in
   uapi/linux/elf.h

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 fs/binfmt_elf.c          | 5 +++++
 include/linux/elf.h      | 8 ++++++++
 include/uapi/linux/elf.h | 6 ++++++
 3 files changed, 19 insertions(+)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 9a780fafc539..bb431052eb01 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1277,6 +1277,11 @@ static int load_elf_binary(struct linux_binprm *bprm)
 
 	set_binfmt(&elf_format);
 
+#if defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+	retval = arch_elf_setup_cfi_state(&arch_state);
+	if (retval < 0)
+		goto out;
+#endif
 #ifdef ARCH_HAS_SETUP_ADDITIONAL_PAGES
 	retval = ARCH_SETUP_ADDITIONAL_PAGES(bprm, elf_ex, !!interpreter);
 	if (retval < 0)
diff --git a/include/linux/elf.h b/include/linux/elf.h
index c9a46c4e183b..106d28f065aa 100644
--- a/include/linux/elf.h
+++ b/include/linux/elf.h
@@ -109,4 +109,12 @@ static inline int arch_elf_adjust_prot(int prot,
 }
 #endif
 
+#if defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+extern int arch_elf_setup_cfi_state(const struct arch_elf_state *state);
+#else
+static inline int arch_elf_setup_cfi_state(const struct arch_elf_state *state)
+{
+	return 0;
+}
+#endif
 #endif /* _LINUX_ELF_H */
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 4c6a8fa5e7ed..1cbd332061dc 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -468,4 +468,10 @@ typedef struct elf64_note {
 /* Bits for GNU_PROPERTY_AARCH64_FEATURE_1_BTI */
 #define GNU_PROPERTY_AARCH64_FEATURE_1_BTI	(1U << 0)
 
+/* .note.gnu.property types for RISCV: */
+/* Bits for GNU_PROPERTY_RISCV_FEATURE_1_FCFI/BCFI */
+#define GNU_PROPERTY_RISCV_FEATURE_1_AND  0xc0000000
+#define GNU_PROPERTY_RISCV_FEATURE_1_FCFI (1u << 0)
+#define GNU_PROPERTY_RISCV_FEATURE_1_BCFI (1u << 1)
+
 #endif /* _UAPI_LINUX_ELF_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
