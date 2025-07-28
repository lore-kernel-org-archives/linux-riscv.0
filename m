Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9843C87FC9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GCptDvt/FkllJkCqlRJvwQr5yv/To6r7R4Jf6nkYoOk=; b=hq+78+l+5TwArP
	VyplW8aBa3XQLvWs+p+BmGn/OR92ASEOFaDTfFmYh23IViCvzeMzKCRErY04sb4TRPfSPm4NTpc3Q
	PeJuQ57GnKln0sNveH5Jx7kbkTICxK+Qgzns0xHG1WqvPZpOBAcpvfkVcIacR02ZNVy4wZn8/QXj5
	YD89yuewsnba91yh6/g4CxSI7boPvrv0D2E/z5kZQNtGVPEJBQ/akmoTGGhI+5HO5dV1sRf3/fuGw
	nWdE/UkmA0WQXZ/8t0FVFtTY20vztkVFMbGq0HIDvW+dYj1We87Tr0GvaHRTo/ctJyYjJe7/qGNvh
	w6NTk4KxoQLq3mCL5oQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMVl-0000000ENw2-3hJn;
	Mon, 28 Jul 2025 11:59:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMUE-0000000ENf0-40pF
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 11:57:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24003ed822cso7565395ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753703866; x=1754308666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QH1fCvQmnSC89vnVLs/2ja8LbLIAQjyBUi34DkOfb0=;
        b=E+tIO9fB8HSaOxqWPtABEzcFsPIJL/59IYjz+/KI9jkcabdC0dIAAs7qrcGPqqd2Ug
         3UTqUa3T21RnwX819fn50PajSxRJRWK3UVIZJTog1qx9RVuBTdQ/kjlOCuQxNje9QTgj
         sMvWNxpWdcqgwBMeu9wGxSzy8lW+arHSo3AvilClBLERL4xjoL4SuUrph+vmjaMxPA5E
         y0N5mOngdDp468MKRHSibulNHb7KXKjpb/gTDw2uaLiYZp5Yeet9JVwCv3xe5+SElMdO
         mAyqw1X4Fs/UhnSvTrw882d3kbDM33lbadIwEpSi97wD79ajhezzWu5VzPvgWYwR2V6Z
         GfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753703866; x=1754308666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QH1fCvQmnSC89vnVLs/2ja8LbLIAQjyBUi34DkOfb0=;
        b=DTphBJQUFhCtNAoYt7IX8C/ZU4eCozTDB8s+0qQRxr+i4yA+LWEDXF+jR+XQHAUkBD
         1ogQcPnAbBizYdKq38Lm+OPgsBM5BhSmZiIozdpP10z3mwxrGJ+lq8xEpZTqyEzKkJk7
         Lkp8yMOwiqz6Y32xSTN7yVhSr2fNcwIxNOFBzHVBuFWVTrIFaK4WFrf7bboNqBKCOB7t
         F8tBP5B7JK1qe/+y8d31ycm5hgnoR/CBT9NSbe2OzeuO9wsKcioVx95CQGBMG2q5uvwa
         yfqIbLZN3EHSpN62hJK35tm3GsDS5Bm745VFsOSkeDtm88DU8gJHz2tL8w1QUc1Jqc5H
         c+gQ==
X-Gm-Message-State: AOJu0YwRwDMA/8RQp2AA3p6pjOZVk9M65L9Y0IuSDpkKVPP60jK3AEWD
	EG80572/XcLc+w84TFeRNfmMbNtmkxw1vcNPx3tDVzlG3TEKmgNfU4+3
X-Gm-Gg: ASbGncvwKldQ1E6SodsC3gjdv/hEkwSHmt8XPgcpKrJ0b6hUPt4Uz8PKcbOvIyRV1Sz
	sVh7/JXG/sl4jxumOnf74BhBd6tsUyKffWI/jLhO4fHTlQrTyftX2erfFJW6TJ24cFaxQJ9qIPB
	KbM+b1VYz1WhfmaZYn5TLhALup81siBSlj38TD0cSGHc45mXtXefBwiT00uR+0SwQvv1suaYgHH
	ZIeGzvxRwmUtF5F+NfzfGSgySgEYUZ0W8KIDzHxprOgMH9JtBGCBhL+ddSiYBMYdZXgVOoAOX/5
	s3XJ7sU7uy9v2tZGqyHDWfN1mhByRxEh1qvh28MV96dUBRMleLMSVBfgMNAeKLBAuie8v4jAifj
	a4tzF0cKHYjxETDF79SBJuVHF9x03AxnOclsBfBy1TMiPVvph3tCBkowq
X-Google-Smtp-Source: AGHT+IGVkxhzM4QAYwzySEvOd+NXUqVS/Jgx0EE1xymZXd3jvGCDUW6EzJ9xB7Zw08erZmtjmgDO+w==
X-Received: by 2002:a17:902:f546:b0:240:44a6:5027 with SMTP id d9443c01a7336-24044a65233mr19422635ad.15.1753703865413;
        Mon, 28 Jul 2025 04:57:45 -0700 (PDT)
Received: from localhost.localdomain ([38.188.108.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24007d98b25sm30933685ad.97.2025.07.28.04.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 04:57:44 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org,
	atrajeev@linux.vnet.ibm.com,
	kjain@linux.ibm.com,
	linux-perf-users@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
Date: Mon, 28 Jul 2025 17:27:19 +0530
Message-Id: <20250728115719.143372-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_045746_994343_832B6AEF 
X-CRM114-Status: UNSURE (   8.48  )
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

Replace the fixed definition of TYPE_STATE_MAX_REGS with architecture-
specific values for better accuracy across multiple CPU architectures
including PowerPC, ARM, x86, RISC-V, MIPS, and others. This change ensures
the type state registers array size matches the actual register count of
the target platform.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/perf/util/annotate-data.h | 45 ++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 541fee1a5f0a..0dfb12a8f1cc 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -189,11 +189,48 @@ struct type_state_stack {
 	u8 kind;
 };
 
-/* FIXME: This should be arch-dependent */
-#ifdef __powerpc__
-#define TYPE_STATE_MAX_REGS  32
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__aarch64__)
+#define TYPE_STATE_MAX_REGS 31
+#elif defined(__arm__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__x86_64__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__i386__)
+#define TYPE_STATE_MAX_REGS 8
+#elif defined(__riscv)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__mips__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__sparc__) || defined(__sparc64__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__alpha__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__s390__) || defined(__s390x__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__sh__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__nios2__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__hexagon__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__openrisc__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__csky__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__loongarch__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__arc__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__microblaze__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__xtensa__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__m68k__)
+#define TYPE_STATE_MAX_REGS 16
 #else
-#define TYPE_STATE_MAX_REGS  16
+#define TYPE_STATE_MAX_REGS 16
 #endif
 
 /*
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
