Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A43C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXRxlVStz34JCwaz+AsTCc718K2qXOwpV4Jh5UaWQYA=; b=Q2SBW7dVbhvvdl
	i6EcpiLczARZqvd7EO7wZn2vDA1++whqY+oaz192slV1ABT09sFArRD8vOCs4mshcUcbPIpWfxHUy
	oJqnNE8XU/T3L+NSl72/kwffYlYu+TYUER2drnIbDp7nvrk/fkxS1JCN9ke1nVgKwseVf6+t0YSlb
	4/njpFz7nT8I+Aj6DfxeI/p+kvk7UR0cXGetv8kj0mbuLgbdp53JyQtBSwTcUhQe113cD3o0nlwFS
	IMrqyjBKZZm2LRVtsRgj5/TN2alJuKYAhyZaAF5AxpgEsm+LyqZy5SlgqHLjWZ/bWDCoh274Fgq5E
	DKfZ0CsfY6lpJy8eVCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORc-00000005G8t-0AHC;
	Wed, 29 May 2024 18:54:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORV-00000005G5c-3R85
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:54:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4210aa00c94so429335e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717008871; x=1717613671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=688BMYms93lIkdSUxmL3fbJu+G2/bRYi5WNxrC0uGt8=;
        b=NY7zLlbwxhbXUWaokDRn6A/gs+32Hq+rprblz0y4U6yBxvXOs02XuXfmObgFugUqSN
         7wKG5u9kU6s+pVp0Rx5pMEK6KSj4zvdF6fMSQVDcfjfBg9HHCj7bNCp6UPFCVDlBmGji
         K4QF4w0LqF/HKVV4kagoRIWiE6NTkbPgvL8CGjeYxuIfB+KrXNZacmjRX23bBLUfpy1S
         rJCBlmJ6a70r4V7FPLow7xT2lb6AHGVv4zlgjrFgpoeDqY3PlsepGIcUX+ToK44/xpqT
         +TbUZMORnN5Wjfz1043xANy18RPVB/YT7EGZ2VHsNg1HCiS5ymDjEXUwW/V9MQ/R/np+
         km3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008871; x=1717613671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=688BMYms93lIkdSUxmL3fbJu+G2/bRYi5WNxrC0uGt8=;
        b=lO1kCi2si13JJ84IEl3IGgCwmwGA1amgQVLPBzQdfvBKpOWMzzfNRm9JCXcoGJRmli
         L2nmEOgnL8WVsgdM/FFgCLjNJk6Y2gbCH0cac0mKoiJdmV6eqABqAPmhvxXO7GHtjUCe
         jNOlBm9NJWFCOGGrpjvezzfmMWuh0EVeUfwzgOX/6LB1xXlIzCsRSTR3yP0T/HkjxBKd
         pOc3gz3/axQ1Now4rTDPkPSqn3auHfDvrsXmWHtDxSt1WcJPqnwMbtYeYTr+vg419ox7
         MKQnBn1xKIvAKOGfWpAgJkGOCVAkK698A86/qqd/dqaleJjn6qeT+uK4pT4SEL5jyLu3
         c0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOq28SGYyVkeAkZiywpjdL0DCZlFFR7ch98eqQOR9C3HLNJ4Qr1ipkaC/Pl9r1IICDKzqSgWGK4eIAWqo6oj/LAM9FgSvE7hn4QjZ4xrks
X-Gm-Message-State: AOJu0Ywix+GDJDjkIDy8fBBpsdOosm917D5uANimhyB3KB7zyivwxMsL
	cta9tZ7liPhrec3dd3EltjjHp03SeE7LXEvyW4YxbGJ8CO/64bEIJNpwUZ7GOZ0=
X-Google-Smtp-Source: AGHT+IFXjh/sO2hf9fpunrpzb5/Ur0BabTosyM0Or0Urw/4lUp/bZLnXNorWqgLPv7xYyl4q0uveYw==
X-Received: by 2002:a05:600c:4ed0:b0:421:22c4:db60 with SMTP id 5b1f17b1804b1-4212781b273mr404635e9.23.1717008870867;
        Wed, 29 May 2024 11:54:30 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706a23csm2787885e9.27.2024.05.29.11.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:54:30 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
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
	tech-control-transfer-records@lists.riscv.org,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH RFC 1/6] perf: Increase the maximum number of samples to 256.
Date: Wed, 29 May 2024 19:53:32 +0100
Message-Id: <20240529185337.182722-2-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529185337.182722-1-rkanwal@rivosinc.com>
References: <20240529185337.182722-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115434_201368_CE17523D 
X-CRM114-Status: GOOD (  13.74  )
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
index 527517db3182..ec12f0199d46 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -2254,25 +2254,32 @@ static void save_iterations(struct iterations *iter,
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
