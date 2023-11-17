Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBE8C5ACB3
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqADXD6P8WIjsbzOkZ1Lta42iBkYxuhrsyMSxGL8a3I=; b=B3vTs0UohAjp0i
	d24aN2vQdLz/yrk5glqCTL4PyUzcbkUsJ8aorj/zD9MSETFIg5/0XnLut7GtvCxLE2aggh++yXXUR
	Wo/lkpgSTk418XUnGlECRjYeTqL2lTK/gSm1sMd2v+pbyxd4ZqQDGAhs1LIu4X0t1MS7Fz6Y+vbVb
	bzLToVHkxxdftCeNpM4cNrGW1QjfRvX/ooOAVnGY9IC84NaRzHccTOuqYCOrV7Fq64gz+hOxgmnBV
	cazD7E/BJ7LrBXbLNj6yw1JNAPEAop/wlhkeK+ahIBMagizlAs0ehwHFdtBAkEYgKrmqMwPue0N4m
	ujAK9zN9dGty/Tz0d4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r451m-007CNR-0a;
	Fri, 17 Nov 2023 20:01:22 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r451f-007CJe-2f
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 20:01:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc131e52f1so26385355ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 12:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700251274; x=1700856074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PagaqPISiFMUN5ZfGlzy9E8bahGMoCf4MLBDz6dwo3U=;
        b=ZvyBKgtkzHTkUqPLdpGBvawZK/36E0lkpx32HC4TfqjykNSbzvSch5r9Vr2QaSkOAj
         kCFzy2OBQv8/8MSh/AKO1jCnatdgivb4fHsjSpReDCBBc482QMh5P77K5GWBI++eJpmh
         ZJpOZF5iSnTG5IPU74VV/FosQxFGh3qOW///sJVlLqdsDy18nT/qVrfZhuDsfmOO3Vev
         eMNloGig7bFHtalY3NM2h8fVR8lWG8Z4HCnA02gUJLNBVk6ZJdY1V55gSIWy/iXGVi9A
         S9a6a8xcatbnqoiCl2w6A4wZ1agiLn2A3LWjx05d3izQMGzXPbt54Oh+6mAUSPg2mN25
         kK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700251274; x=1700856074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PagaqPISiFMUN5ZfGlzy9E8bahGMoCf4MLBDz6dwo3U=;
        b=NFwUKRucO98hfSjvpBkB9zOAOqLEqrfobVgSD4CvqOM0bCcp+iSmkzXx1iNU7S1Po+
         2MH0mrk2XOSFXZEs2eg3ReNIOBTexTf87zkw8LIyjuQNkndudwvEJFaP+lpRSQcU7Qa+
         qDD71lH/zNWVAeL6/DC1GVu1YQJGw/rD8laOSLBbP93JmdQt48xqocu63LQq2nWgAi4q
         jFWPW01tNdTAR+qhmFkXyA/anlfMuFNNIYitFCY4iSgTj2HMrpuWAq8nSXB4hrBbTaeI
         zAZodh7wsnnaDkfSuov+lyv+mHum4aTFnOVCHi5WInXuy73P/kjkoQVeftF5t37VYMfb
         sNMw==
X-Gm-Message-State: AOJu0Yz2p4LxZ5z7AN0bkZXMvPMeWffG1fjC+LR+myWe4HOD4XZvbITG
	oNOMnldcC8jWVDJ5FHizlhUWb584Cgk6SVpwlug=
X-Google-Smtp-Source: AGHT+IHWyullGhPD+gZObx6KM81Mz06irM+FIueUcekK/sxdqjmscsmQoE/71DHzli6umycW8VRUeg==
X-Received: by 2002:a17:902:f684:b0:1c0:afda:7707 with SMTP id l4-20020a170902f68400b001c0afda7707mr127578plg.34.1700251273779;
        Fri, 17 Nov 2023 12:01:13 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id bf1-20020a170902b90100b001b53953f306sm1749737plb.178.2023.11.17.12.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:01:13 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 17 Nov 2023 11:56:12 -0800
Subject: [PATCH 2/2] Correct type casting in module loading
MIME-Version: 1.0
Message-Id: <20231117-module_fixup-v1-2-62bb777f6825@rivosinc.com>
References: <20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com>
In-Reply-To: <20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_120115_882081_8EE5239C 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Make static variables static and use __le16.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/module.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 56a8c78e9e21..9f2dc2c0e436 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -45,9 +45,9 @@ void process_accumulated_relocations(struct module *me);
 int add_relocation_to_accumulate(struct module *me, int type, void *location,
 				 unsigned int hashtable_bits, Elf_Addr v);
 
-struct hlist_head *relocation_hashtable;
+static struct hlist_head *relocation_hashtable;
 
-struct list_head used_buckets_list;
+static struct list_head used_buckets_list;
 
 /*
  * The auipc+jalr instruction pair can reach any PC-relative offset
@@ -64,7 +64,7 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 
 static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
 
 	insn &= keep;
@@ -77,7 +77,7 @@ static int riscv_insn_rmw(void *location, u32 keep, u32 set)
 
 static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
 {
-	u16 *parcel = location;
+	__le16 *parcel = location;
 	u16 insn = le16_to_cpu(*parcel);
 
 	insn &= keep;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
