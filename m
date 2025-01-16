Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F6BC02187
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTKZWEHFwJPHEGU1hh4l6ST+Y5g2dEzimVAw6Avqxqk=; b=U4hy32ymptjhE1
	kC41jDY6a1Ma+fcB4xPYqQVPKsHWG1d7q90KeiaCBtwb3n28giHxgMEz/xlKYF1ai5T+fj87JYFtd
	nRAbpG1LeU7YGdnMitwTZLvz882JAEm4GOvOd2zjqtBTq+NjBRwfVOaKuoH7QvJ2aFLGG+VmrhE8k
	5lVJ6MCl2iEhbgbtEu1/EbfUL0biXmeHCZMPurICQskXDtqsTFAdb+DIqOmJRQ3Xg2jC/1qRLMvUL
	bFqBE/T3Bnxuy/is/OVQd0bg6ZS/nKw8H7pULfV0brClv9+DCM8+8EvennAzvK6q7qJCXBbAfuNpM
	MOEzDLuQuiIM+1sZ1Kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0R-0000000GJgo-1ZGX;
	Thu, 16 Jan 2025 23:10:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0P-0000000GJfG-34h3
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385deda28b3so983896f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069028; x=1737673828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih0D7I8XCBuUn8cwCzLwA9EVpPglV1xp5bSahtqmwB0=;
        b=mAbKnUHl06iJxcEHDIbUuDE4+diTi8QRLrvwkRK2yIY0V9xyNYIJRLBMfJC3bQRE20
         CvLI0Tj7nxuFB9JYrc+W3D74rlq4Qz7jgxvmz8zKujf0BLUeKhqIg0EYwB2SaNItUBne
         x6YLwO/xc5DgjdAWF4ckkSyFuoocS0ObUeVSdT4Yh7GP3QzC1pIcHHMkVsZ68y5qFN4y
         yMmj1mG94mLPKSChFp3jUCDn7XeBsiKmSAytyuCRDThSG5Hpl2UNIJI4OS/J3432Ufdm
         38c5ogcd++pY8Q8xStolhEAyaSs0M5ENcP7NfNTerqKCP/Cg/tsBc99xOw305kJ3SoM9
         sVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069028; x=1737673828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih0D7I8XCBuUn8cwCzLwA9EVpPglV1xp5bSahtqmwB0=;
        b=BKsqoTDWUydjMpSl58mhdRB2x9utQlHqWBMyGgYbaesGhTOR7oLwZ4yjVvd8Ead1Np
         sg/Y3ZXoaqdhvWppNjP75ErzaD9eTcly0NMAzdQJwyaM9gwRsHgH77zv6zRV+VitGK2X
         lN+zy7DPAfEIXBOuLxOudVHAL+whXpx+s8YaPsiLUqZrGg+PY+7IDImXYwWPWt2rBqG6
         N6naiBwisqpO8sDvCaw46P23qvZ29iRA8V8QlYAzXLx/76fsK3mL4l9v5+AvWj7sQWM+
         SJuGXCvo90LJnkuL1UWG3FfYyS8YzJmrZHqQ19M8Hs3sOGfIwRMjxVieon259yd2f05R
         DvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrA3sT6sP/RX5I8ntoTuwnU72ob8WaQAl8aeOCBYGC3aIgG0leqXLl7zSaZJ4cnzz7hkxMfO+/Tr8dTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEvI7h+Zk0XBBjt++M90JwxR/TNredB5QaRUqb/V9/yTXW6I4r
	0I9zDzWpwHPhgxGaBY5bMKa+0kBGUBCGdcsM17XmjEFlMMJioLntZ7kHu8jEqmg=
X-Gm-Gg: ASbGnctupmiDJRkV8f5orTVrTkTm12+2VwhEs5H6ca3eOgM5czeI02aEhIxHTcuwclJ
	Tditz/DipFRrjUFNxDzCuwdTI6pxkX4yOy3g44/M76mLT5U8NRm28oDPKIZyY703MSfKsmOfGGw
	1z7Y4ElJDj7wotY5G8i7pYjfP0gTqW+shjH9RDS0SuCN1ZqVS7e+sBk+ooyhLY2r4mJCtXefJx3
	dy5Qr77jIDNle3sz3iyjzSsmF/mP7aKTLkd9symdwrbRBLlfI9icB2oHhib9I8gaWGfXl/VuJ+Q
	1iBKmRs3dVMvQfpw
X-Google-Smtp-Source: AGHT+IGZkSeIeWLg78b7QIySnUPbuLbB0vhAavzUj7u+Y4mZGnlfT+raQ/EoGquZ508s9+cVypWC2g==
X-Received: by 2002:adf:ffca:0:b0:38a:88e2:e6aa with SMTP id ffacd0b85a97d-38bf56745bcmr243859f8f.29.1737069028398;
        Thu, 16 Jan 2025 15:10:28 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:28 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 1/7] perf: Increase the maximum number of samples to 256.
Date: Thu, 16 Jan 2025 23:09:49 +0000
Message-Id: <20250116230955.867152-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116230955.867152-1-rkanwal@rivosinc.com>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151029_772917_ED9F8615 
X-CRM114-Status: GOOD (  12.94  )
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

RISCV CTR extension support a maximum depth of 256 last branch records.
The 127 entries limit results in corrupting CTR entries for RISC-V if
configured to be 256 entries. This will not impact any other architectures
as it is just increasing maximum limit of possible entries.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 tools/perf/util/machine.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 27d5345d2b30..f2eb3c20274e 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2174,25 +2174,32 @@ static void save_iterations(struct iterations *iter,
 		iter->cycles += be[i].flags.cycles;
 }
 
-#define CHASHSZ 127
-#define CHASHBITS 7
-#define NO_ENTRY 0xff
+#define CHASHBITS 8
+#define NO_ENTRY 0xffU
 
-#define PERF_MAX_BRANCH_DEPTH 127
+#define PERF_MAX_BRANCH_DEPTH 256
 
 /* Remove loops. */
+/* Note: Last entry (i==ff) will never be checked against NO_ENTRY
+ * so it's safe to have an unsigned char array to process 256 entries
+ * without causing clash between last entry and NO_ENTRY value.
+ */
 static int remove_loops(struct branch_entry *l, int nr,
 			struct iterations *iter)
 {
 	int i, j, off;
-	unsigned char chash[CHASHSZ];
+	unsigned char chash[PERF_MAX_BRANCH_DEPTH];
 
 	memset(chash, NO_ENTRY, sizeof(chash));
 
-	BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
+	BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
 
 	for (i = 0; i < nr; i++) {
-		int h = hash_64(l[i].from, CHASHBITS) % CHASHSZ;
+		/* Remainder division by PERF_MAX_BRANCH_DEPTH is not
+		 * needed as hash_64 will anyway limit the hash
+		 * to CHASHBITS
+		 */
+		int h = hash_64(l[i].from, CHASHBITS);
 
 		/* no collision handling for now */
 		if (chash[h] == NO_ENTRY) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
