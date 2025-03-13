Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FECBC28B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCxvFZSfMDu5NNSQzBR3YB/0huyXmm5OU83X+xlFEVQ=; b=yTPkuQvPjHEYDM
	5BsUuEK4dPI95Qb7MXG8KXa95DsfvVTf8JR9766hypN8wh3agoP/ha/BetGxHibhAMPpufQASamo8
	sroy8sacd9Bq5EOsEliK9hzThd/VxOq/HTQTjc2cIKWsv703sQFWJzO0tMoSqQL/5Ob/Qy+eWt9yk
	TnTwnGh/H0aILeYypJDjgiOoEOh8XD9rXRvngHV7Zytqw1S5nLin/vEqC2ZaL9zDEbsxmzAjhcwjc
	4iJUkf6FFehB81FcM1+TXpqKpllpjg9iW6ZltjQDY0bt89aG1x1YYtf7CW5ddhqZKuyNAvdKPpX4F
	lF2U7E6ssG/nSJbN6bnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB1-00000009uso-2J5b;
	Thu, 13 Mar 2025 02:20:03 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYAz-00000009urq-0vt5
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 02:20:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-300f92661fcso847434a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 19:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741832400; x=1742437200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM07y6mRejtfGVMen1h/wSs59kI5KFRRXlr+zYZ8+Iw=;
        b=lqKYUGJR1lOtcnqHHneIF/fAdspzVU2dhTLLIwWwurN/nsuS/AdGNX0iCQ8BGi3QDz
         XLq2ayVBcvv5iBw3iVi0bHEzJYAUW8ecfU9BNqUva3fRgAO4VEy6gv7YhnMyPPglGz8U
         T4G+wNREW5x+lIEAFxYOCqbVx2IAUKUMnPnPouXNsB4dQ+OrTu79u75OHQ47bJxKLoT0
         ihg3YIiMT8Vmpihc20epVxIDuOfU44KtkpCJBefw3HxjmfncE/k9eGVXgbdQNlC62/yX
         rDtsRgUZndvTpVH9ckR6dzdq6SALnTJUGXGdgQydBvVSP++ImC58HGxIGOpnfT93mx/m
         TKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741832400; x=1742437200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM07y6mRejtfGVMen1h/wSs59kI5KFRRXlr+zYZ8+Iw=;
        b=hgxTFfQpAAzvCU9ON2tFN5yg7lPw5tqCHocO34+avVgVC9g/RG+u6lTfxW7wh+TEVQ
         G8tDWNBii/DdEyiZhvPdyPkoSHRLpPojeJRzaGOuqMVTH9QWUjYruqY7IjipoZw3mvMY
         XgJIPb2EFyEAz5cEn8/SGQ2A6F8FWFQkKlvVxgOgh5D+7KRQmpE3fqTdy0ECbQ8OWVHL
         WAYflBn9x7ZBpKvSFeZ2lizEM7OHZaCfGvzHGQ3+kjbQpXIrOj0RqfJWzKSnzBmPeu+u
         WyHbuAh36/pXsn8QchjiRJD/boaySayXslFoCRba7cKNFtmvAQR3NTX9wgDC8JFB4ueU
         fMtA==
X-Forwarded-Encrypted: i=1; AJvYcCVqA2diZXmxAI7wx1+KlWRyLpChUwIw0Vh7lImUoI3vqt4L6BAn7VzSzwNopLCQvRP6wn3WcqwCanGp1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAieOLYchQRNtg/txqX+ULpNstme1ZG8rARg8RZEhGwVltdXM0
	+pde1s6NZEoGgxq8eQNQrt7to6yaQHro8smt2sqQsiOUWI4RUzOA
X-Gm-Gg: ASbGncuj9kIIcAfqVeCpgudGgusSvMD3N+LNROnS4RMWQYFfMo+Bnx6+MZNKKOrZO7U
	JQshntcj4D0rwxy6S/EU9YUp5yJajp0JEeANfMKiZL5L41edrPlbJeFmUQ08w3ohMjotjmGgaZY
	KBJbU3lfyj/zS9UzQVpmyluR1EudTGeYOBgyUF7+4mUZpjml607Hol7UaQvoWZJma65PPZLOuQ7
	+FINkUkDgpSXtlMnRQBeP96Do9M45rt6CsZepbuY2JK4ky3ThjSFENzsjwl8qGDjfiuztpGllXb
	5BdG1RVue68KVgc140OD2O13OAf37HjIQoyJgcv/UTgwmJBNON1yzWo=
X-Google-Smtp-Source: AGHT+IH9h4gO1h633yHabDi56gUwUKc/1ei4QrFAgLV1x3b/3cKCpZ3eVwq4OVI4qIBzDVM8XCyTpg==
X-Received: by 2002:a17:90b:164f:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2ff7cf13a9cmr39914901a91.33.1741832400202;
        Wed, 12 Mar 2025 19:20:00 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301182181c3sm2651251a91.5.2025.03.12.19.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 19:19:59 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH 1/4] nodemask: drop nodes_shift
Date: Wed, 12 Mar 2025 22:19:49 -0400
Message-ID: <20250313021953.86035-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313021953.86035-1-yury.norov@gmail.com>
References: <20250313021953.86035-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_192001_273497_F2F39D2E 
X-CRM114-Status: UNSURE (   7.06  )
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

nodes_shift_{left,right} are not used. Drop them.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 9fd7a0ce9c1a..b1a26ef5912e 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -39,9 +39,6 @@
  * int nodes_full(mask)			Is mask full (all bits sets)?
  * int nodes_weight(mask)		Hamming weight - number of set bits
  *
- * void nodes_shift_right(dst, src, n)	Shift right
- * void nodes_shift_left(dst, src, n)	Shift left
- *
  * unsigned int first_node(mask)	Number lowest set bit, or MAX_NUMNODES
  * unsigend int next_node(node, mask)	Next node past 'node', or MAX_NUMNODES
  * unsigned int next_node_in(node, mask) Next node past 'node', or wrap to first,
@@ -241,22 +238,6 @@ static __always_inline int __nodes_weight(const nodemask_t *srcp, unsigned int n
 	return bitmap_weight(srcp->bits, nbits);
 }
 
-#define nodes_shift_right(dst, src, n) \
-			__nodes_shift_right(&(dst), &(src), (n), MAX_NUMNODES)
-static __always_inline void __nodes_shift_right(nodemask_t *dstp,
-					const nodemask_t *srcp, int n, int nbits)
-{
-	bitmap_shift_right(dstp->bits, srcp->bits, n, nbits);
-}
-
-#define nodes_shift_left(dst, src, n) \
-			__nodes_shift_left(&(dst), &(src), (n), MAX_NUMNODES)
-static __always_inline void __nodes_shift_left(nodemask_t *dstp,
-					const nodemask_t *srcp, int n, int nbits)
-{
-	bitmap_shift_left(dstp->bits, srcp->bits, n, nbits);
-}
-
 /* FIXME: better would be to fix all architectures to never return
           > MAX_NUMNODES, then the silly min_ts could be dropped. */
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
