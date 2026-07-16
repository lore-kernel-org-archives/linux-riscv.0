Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F262BC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spWYDYP4EtwxVnoEMAIfKorvi65UU0pl108SDqydFTA=; b=W0MX/XZxMH0l/H
	OLspVdepafcnbce4DjxkWy5JzZWUr3iJ5gldxqGGQfTrZ7CVABmQooPR1Qa0ZcYAbQ4zc8ng9z1Uh
	pEg+aNqiVOx1J8WLMl/cc1rgWDJ0PKFqvwxAaHjvGnOkHG+xHKNOX2WeBAv1fTiuO3lEvIB4cjS45
	/U8STFVxhbEIQViqHmyYcyfsYIP/B4zDddBUhRxhoJThtp2Xi3xDesZ+KA13f2teiutwHZyaLZ88x
	ydq3V+FUyR//s3ctgtf+OGQLoy5YD/v0UOUnSyqfj+Am9Km5RNXbwjzlEgM4U52nHawmrqUgxvrAj
	6NMGbJs5qeKH0GtXYjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRX-0000000HJ2A-0jSZ;
	Thu, 16 Jul 2026 12:43:59 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRU-0000000HIwN-16CP
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:58 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso4285924a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205835; x=1784810635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=;
        b=GG4rnxIudgMhaFvwjZN6dyoWgmgwTUiDZcbBpCKKgfAaNN19d6K3A04gIrdqnrepee
         hRpw1YDLCZFXQp7zs290LCz/bNEaEuWLUu6oTz9zCgXZzbl9lXI6N7cxSQHoeZzrZYhx
         pzPegydmB2JdPXwhEhmp5/uXrgsN+VvjRVDWZy5i+Wtza+GN5ZV8k5C7Hcv0pIqYsJ3z
         TKjbFkI3UPy95Mj3IAJZwtwitPrC2QeO/B56t336GtqJ1AQ9aYEpTJjBP95NJuHaCVPw
         XoKxz5lC5oQaWTDClVBMtDril6aqjsHo61+q5YmEkrHClB88ruXgqdxHM1VqGkOzBm3N
         egeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205835; x=1784810635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wO7rgHUMjvOOREbomqim3hRFXtwbnBvZKsCnDiin3lw=;
        b=mFgkhbWMOJ/6sT14DNxxK+C69K5IuuE6eTHcprP3wFe8zVz3H8+ut219Hsma3kN1BL
         B3zJigVwzoLgNGTtQB0U/CH3QVPIMk+xzj/9eKt+6RLTzfDm5cPoj92yOLqETS705EzM
         nk7AGOGUD711PU02fVzHxNV9g7LgORX+HSELjJ9iwQd0AMNc2k9ddylnGRa2R4eUic+N
         ZIIyTMbmjipD0JefE8VhzIr+SqUG8wVRyqryZc8t82jtb2A35D3SAzWhbXnwWJ8eDcxG
         7qso+YrpqG1tmgtmlt6J2onr13Q+LxSHG0uhsUvx4WoBpJHSgQ3Z32oNsGVCKgUIwrgn
         ly7g==
X-Gm-Message-State: AOJu0YzI/gTv7zM2k87QJnfdxU/4Kx7esa00cut6dC27Y2jbtrNAYNnA
	TzA3CxweSTDXLC6kMkjprVw+gNCItfOSvAE9fkcQ2P/Kc1W8uPt+BVIgTIta/Vw3kAESJBA1C+K
	ZB4+bwVA=
X-Gm-Gg: AfdE7cnb6Tkp+j8+sShTSX4/qLNN0pg/2imMQ8ssW4T+t6+twq1CScK8M4I/Qjhz0/i
	9RlmWtVY//Mv4qDmbqoQRz4Zi/2U5RIJrzbBYD8//QRql+NWlvePeF7a+8MVVJMsB4GKf83DYWC
	7XbsosC8x/i2NxTJHyf4SWH82N4hs9XxOaHk8/3klnl30ACEUSGHJtuSHlnXm59rmCUku0ak4dq
	bZsFzMwz6fKEy9LwB96kWcMVjwUBeI5mDc13AaFU2rzWdFxkmPo6ftGyZsH0xtRym5d2dl2T0MF
	i6tv+1cHl3AGORA4vPZxuNOSZ9yBJXIg3FJQIIuuQ2/YuZNaMLKqMJJhw6tx/Xa4fEYkEVg9T6R
	/qdVNimN2CBz02zFjGUBVwte6RbjJcSnI2uTuwJkizzn+U6uE4Fm8tDoK2epQNYVb/YbIWSc7hq
	yPfdrWHtU51PZPOh8xplUh8cX+L73wNzeBnw==
X-Received: by 2002:a05:6a20:20c3:b0:3c3:859b:c20c with SMTP id adf61e73a8af0-3c3859be277mr3653741637.15.1784205835267;
        Thu, 16 Jul 2026 05:43:55 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:54 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 08/15] riscv/mm: avoid redundant Svnapot A/D aggregation
Date: Thu, 16 Jul 2026 20:41:43 +0800
Message-Id: <66e43057442a0f37e0c7348016ccef382387898d.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054356_321401_D79A24ED 
X-CRM114-Status: GOOD (  12.13  )
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

Svnapot mappings encode a 64KB range as a NAPOT PTE block, while the
public getter returns a logical base-page PTE. To preserve that PTE view,
the getter folds accessed and dirty information from the whole NAPOT block
into the returned PTE.

This aggregation is an OR-style operation. Once the returned PTE has both
accessed and dirty state set, later entries in the block cannot change the
result. Avoid reading the rest of the block in that case.

The lockless getter still validates each entry before consuming its A/D
state, so it preserves the self-consistent range requirement while also
avoiding reads that cannot affect the returned PTE.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/contpte.c | 60 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 9ffdffdc2b0c0..70f9a0668b50c 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -309,10 +309,34 @@ pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 		cur = READ_ONCE(start[i]);
 		if (!napotpte_is_consistent(cur, orig_pte))
 			return napotpte_subpte(ptep, orig_pte);
-		if (pte_dirty(cur))
+		if (pte_dirty(cur)) {
 			pte = riscv_pte_mkhwdirty(pte);
-		if (pte_young(cur))
+			for (; i < nr; i++) {
+				cur = READ_ONCE(start[i]);
+				if (!napotpte_is_consistent(cur, orig_pte))
+					return napotpte_subpte(ptep, orig_pte);
+				if (pte_young(cur)) {
+					pte = pte_mkyoung(pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(cur)) {
 			pte = pte_mkyoung(pte);
+			i++;
+			for (; i < nr; i++) {
+				cur = READ_ONCE(start[i]);
+				if (!napotpte_is_consistent(cur, orig_pte))
+					return napotpte_subpte(ptep, orig_pte);
+				if (pte_dirty(cur)) {
+					pte = riscv_pte_mkhwdirty(pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return napotpte_subpte(ptep, pte);
@@ -343,11 +367,39 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 		if (!napotpte_is_consistent(pte, orig_pte))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = riscv_pte_mkhwdirty(orig_pte);
+			for (; i < nr; i++, ptep++) {
+				pte = READ_ONCE(*ptep);
+
+				if (!napotpte_is_consistent(pte, orig_pte))
+					goto retry;
 
-		if (pte_young(pte))
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			for (; i < nr; i++, ptep++) {
+				pte = READ_ONCE(*ptep);
+
+				if (!napotpte_is_consistent(pte, orig_pte))
+					goto retry;
+
+				if (pte_dirty(pte)) {
+					orig_pte = riscv_pte_mkhwdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return napotpte_subpte(orig_ptep, orig_pte);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
