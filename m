Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DD2D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykTVdHm4hEqM94YOm4BVu78Ir7yynM0sGb90EbwOb/s=; b=XxUPKNYhbwifHd
	hAtUr2lBPB+lajSRAeZAU9Gt5HspQJOqN7KVUl564MvWV6EnYLIDqKb24MpqQ0m98S9XxY3Z5sGW0
	NNI1UCPH8921kE8fFyykc7YryZgqlPjm7kEkEQbFhgfh1u9EcUHlQwHxN12XjewZxgs0UIaZgjlm/
	8yjFv1iBwmOxbSfy+NKsXA0TFXfcBXYU7gFwIJ7bqBzdh6lV/nodpOORTX/YweqOs6jTv1ObjipcL
	UnIYQbxITEhpqgNn/Y3FYAGY+cwWsLKehdT2W25JFQTfMQomoL2H8ML3CY4P51rgRVgIxmrsPFHy8
	/ZQ5gMytZRIKs5xW4jxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcir-0000000GkFp-2ECn;
	Thu, 27 Nov 2025 14:11:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcin-0000000GkE4-2Sj7
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:11:46 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-34585428e33so941961a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252705; x=1764857505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPuxDa0NXAL0s5rvqqEK7cssEYmk0gHTIqKy/7wy1IU=;
        b=CXeRVAB2u/gjoYif7Sa/PFU7H/r3vHP33au9MJy96psYuldYfdkPuvEKPmJ10bcc8C
         SurMwjYBN5Llu4hD7Ch4E2l3fYVgpB+wysjkre6/qI253tYM75d1QgdMLe6M+wRzw//2
         usX7VghEMvA8ldJBbWIM1R6O/wnK/045kjBqQr4I9MrbXdAy/sg2jThdARSQ7FiGhfKD
         ice2CZ/h3n4ac9iD+XKL6auGuOpA7bHCT4CIEsCrJH7iGC/MkNJTOYjc6cN1w/2NIOac
         VWJfLqY04nY9wpDTGRalSBOtrHLjGGQNx/SLGShF3RXaAUN1XakWUr/FqZDCvZwQSbRs
         1G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252705; x=1764857505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPuxDa0NXAL0s5rvqqEK7cssEYmk0gHTIqKy/7wy1IU=;
        b=P6GYONp3RN8tNL4dHYqAfA6s1/DF7aY6UIuxnSgwCJXR4uZsJK2Cn2ypsCvRgYCIIV
         heeFQXUpgxYGizOg7Y+9wyWeA7Yj/Opm9xbMWSGfQW5D1LrP25Bx7nf876sSBumBd/T8
         4gA1PxNUtz16WCxPwZxeaPaH0mz944+8sdNlAfmID6KJ+f8/c2stBTFi9/QHULsqsa8g
         V5AD8ERM7e9LkSctbI1Unb6m+KljorNjrmQisOjM/GgPQiHRI7R14u+zHggJz8Bjxhyl
         L2JLLq7Z4lbXi9m8j651K4HyJBOStNr+JHG3PnbyGRe5XE/LHxWhoBPEFRIEOS46jj6A
         HPSw==
X-Gm-Message-State: AOJu0YxsPXlnUiruRp9MnrcdBRctgpnY5xy3veiSHxFKRKkavbKQAJJI
	jHhGWSfLAh6uzRwCuVdBNaELkiggw2j4N0K5akdHNKfVRubC6LrytP6M/DNS5sKJtPQ=
X-Gm-Gg: ASbGnctvIlfiCp5zOWlePLeUWB8ZlTn+QulqhnEoHgEJYWzZ54BBcvw4TUyKQv0Zwu9
	7+MKxNIzyW//8JHjdzvUBETxTqlxFWsoy5uJ5iGd2l5vJcGkaWr36QDDtjqKlCq0pSDHls5ho5s
	zewu9z3w7oW9+UCjrY/UkCghMwIo9VnkDlXh4Gti4qp5PYzN7YtBNNsEnsPIu763Ay8HZmK2Q0W
	PKB2kvZCP9lgJMehcjjEJ3vBA8o7CY5nzpIBBuXwfllWVId5avly2QfZW6+lg4laAef08fSgR9g
	2IMA9LtZFBGuAXIvTdiUze6PGoDVRMMpzGKlDOzDpIvlgWUJHkfQTpmmbq63ns63p28Il6DvqpE
	lWR2gvAFEEvMvKg5l8Sb/WNVoSASqAHQXd6ckQl0FMHz0VWgouGPpCYMALXjsq6A7Vl7/O9CKK9
	c7ax+QvFUbCyBmJUaVVyXr/Zna3fexehGzbAnJwYGWkVNNmoyyQCj/CLFPiBlhBibPmqEXAqK6r
	6MpMFSbG5AJ
X-Google-Smtp-Source: AGHT+IHJ1zH4LIr+8ggxAx5kKu9ExeGv2qGaiXw+0rzT1l+A7YZxhx40PkhUi9yrE8Oc+3HdrnQIwA==
X-Received: by 2002:a17:90b:38c5:b0:343:6611:f21 with SMTP id 98e67ed59e1d1-34733e2ccf1mr21792000a91.1.1764252704720;
        Thu, 27 Nov 2025 06:11:44 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.11.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:11:44 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 1/9] riscv: Introduce RISCV_LAZY_TLB_FLUSH config
Date: Thu, 27 Nov 2025 22:11:09 +0800
Message-ID: <20251127141117.87420-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061145_628006_E2768506 
X-CRM114-Status: UNSURE (   7.26  )
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

This feature avoids unnecessary TLB Flush IPIs. After memory mapping
modifications on certain mm_struct, instead of sending IPIs, this feature
records the TLB Flush information on percpu buffer, defer the TLB Flush
to the moment when target CPUs really load this mm_struct.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22cda9c452d2a..d219c7f4b129e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -925,6 +925,18 @@ config RISCV_VECTOR_MISALIGNED
 	help
 	  Enable detecting support for vector misaligned loads and stores.
 
+config RISCV_LAZY_TLB_FLUSH
+	bool "Defer TLB Flush to context switch to avoid IPIs"
+	depends on MMU && SMP
+	def_bool n
+	help
+	  This feature avoids unnecessary TLB Flush IPIs. After memory mapping
+	  modifications on certain mm_struct, instead of sending IPIs, this feature
+	  records the TLB Flush information on percpu buffer, defer the TLB Flush
+	  to the moment when target CPUs really load this mm_struct.
+
+	  If unsure what to do here, say N.
+
 choice
 	prompt "Unaligned Accesses Support"
 	default RISCV_PROBE_UNALIGNED_ACCESS
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
