Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567B5C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r++/RaxtokvRrxS+5WMi8V2P41RE6cC/ts3WtzChue4=; b=udv9k5eJMrMBpT
	1TqXnbk08oQvLJLUGcYd1SBqGBBfL1yY4Kgw0AyhWHDlWEEYSnFbwjdYRZX5oSExoV5/O7L6WB/dB
	Je6601FmmzmVFj6IFUbLQwyvSNGGcXvwbzC88uRkb9O7GB6tVFvH0bNOwg/QNHFXEHwJiGJ2f8K12
	k5dWP2HNujSoiRQJ8hoOQbw7Al5iwZxgKIVgzgzBc+xBxCeAqxjbJ+F+02Cvzc6zQOG5H56hUSw8Y
	kH34lyHinmiNRhsnrXnLbjkmrqR+o3iOHjfvqFLQlqynzNdCfmh7t9hTZqLd061sK7xH40ygKXMDJ
	UEjLBD7TMUeJh4UZ+sKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGasf-005J93-1M;
	Fri, 22 Dec 2023 08:27:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGasd-005J6u-02
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 08:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703233657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aLqkaq/CNNYt4l8d0bCD03noyF1tDxxEcTb0gpcUAAQ=;
	b=HOCT57UzdQxET6SOCwFW/LOj91cb+K6xehUG43+nD3p4IREJ7Y6nIOlvzTE6JvwKlBFigy
	0swVjXBGDR4kNf+v3C6gTIPey4BI7BB4C908CONPtsX9NOlgBZnbZcT5oaUMHJnGSX8hDs
	gSGzxKCKGXxv0JQKZz8QH2UdEO6ZEKg=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-j6OJcFuCM42dj51-c5g3Pg-1; Fri, 22 Dec 2023 03:27:35 -0500
X-MC-Unique: j6OJcFuCM42dj51-c5g3Pg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3bb6d341ed9so1964404b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 00:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233655; x=1703838455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLqkaq/CNNYt4l8d0bCD03noyF1tDxxEcTb0gpcUAAQ=;
        b=JayQLTsBu/PLVSotdcl75OEFSdgJ/bxnF6lazq6QW+gztEydnQTJfpLoik6qUKdg8E
         w/p6c6z5AFy8n684xll+0vIEePKIBlPSr4ClUEyro0XrsUAguaMDRVr1r7IPdnAXIlQO
         dzn6IwGyP2N2z/+Q0RlKDGS/41HhvzT4rvDuzYHyl87jjFqBOK8ugT3eqI3LkHVkvHkd
         6srRRQiFUDYxVe+g1hc7cRR5Hu6fyEMG3J/rQ+IK25DLnCi11xmouquWLAZ/bee3dMMR
         YTGsJ76dDLgEPLnNv02lrQTPjdfoO9z2Yvl8CRVOF5wlc5zuxvyJO5HKByEiss28H2eT
         YAbg==
X-Gm-Message-State: AOJu0Yx5D4/82l5CMNJYPCkoG9aCQbiBH1od70qTkW2E02J8uQ3kPnmi
	zLSoJryCSU5Ulimu0IuWBe4GGiHS3g4X+6BhHeQg5EdfOWgsNAnkIR98cmSbgQLrZLiokgCbsmC
	/2YVTljj7uFtilJa8hSSADuM2Ev4kH29xjp8hwK01fL0B
X-Received: by 2002:a05:6808:d4f:b0:3b8:9025:57d7 with SMTP id w15-20020a0568080d4f00b003b8902557d7mr974237oik.3.1703233654969;
        Fri, 22 Dec 2023 00:27:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGXA84hVEKQncls1irexm/1G3Mh7Drn2jkvk32WK/o/u+YrtMDJC7riH+R2H6QuE0XXKePmg==
X-Received: by 2002:a05:6808:d4f:b0:3b8:9025:57d7 with SMTP id w15-20020a0568080d4f00b003b8902557d7mr974235oik.3.1703233654771;
        Fri, 22 Dec 2023 00:27:34 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id i10-20020a056a00004a00b006ce273562fasm2871150pfk.40.2023.12.22.00.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 00:27:34 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Leonardo Bras <leobras@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] riscv: Improve arch_get_mmap_end() macro
Date: Fri, 22 Dec 2023 05:27:10 -0300
Message-ID: <20231222082711.454374-1-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_002739_121075_4DA08A10 
X-CRM114-Status: GOOD (  12.14  )
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

This macro caused me some confusion, which took some reviewer's time to
make it clear, so I propose adding a short comment in code to avoid
confusion in the future.

Also, added some improvements to the macro, such as removing the
assumption of VA_USER_SV57 being the largest address space.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/processor.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda549..2278e2a8362af 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -18,15 +18,21 @@
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
 #define STACK_TOP_MAX		TASK_SIZE_64
 
+/*
+ * addr is a hint to the maximum userspace address that mmap should provide, so
+ * this macro needs to return the largest address space available so that
+ * mmap_end < addr, being mmap_end the top of that address space.
+ * See Documentation/arch/riscv/vm-layout.rst for more details.
+ */
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
 	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
 		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
+	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
+		mmap_end = VA_USER_SV57;			\
+	else if (((_addr) >= VA_USER_SV48) && (VA_BITS >= VA_BITS_SV48)) \
 		mmap_end = VA_USER_SV48;			\
 	else							\
 		mmap_end = VA_USER_SV39;			\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
