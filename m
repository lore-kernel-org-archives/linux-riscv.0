Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2103CC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrMZi2Gzunq+fmUDYdA2qXGLYEd0jqKULr4u43YY7vI=; b=xrXyRS2zqVIzJg
	tl8OL7SsN0UkdyJm3D2ltmp+z+Nen80QJ1yfs+dnDH8fF5KR35OyqjoPHhFCeP02307JvPdNkS4uo
	eNoC/xKZRiP1oxesKOiD+2VPhJ0p9RFa8DfSXFv6J65qO31wPCHRDP/NJg16/RCG/4AUEsfF0lDv1
	214nh5wivFGtBzz5H0rjyrYqEkDfZmjqPvWaMeKrO6WD1JLR59p1H2ZVSSddpl6w8G2KxMQRhOzcJ
	XUn9oBqSpU53S85yho8uNTOgc1J8EFx+o5NQE+/TyOBVCnkZN6l8E9pAYpm5GTfRLjjf15fKVLYXz
	aOAF3kc2lUHGUEB7G1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSZ-0000000HKPy-0cpf;
	Thu, 16 Jul 2026 12:45:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSV-0000000HKJA-0GH0
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:45:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc891373e0so77791445ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205898; x=1784810698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igNuDXnwdUCT2dm/vIcI/M9kQJ6fMwWaxma7wgKaCpI=;
        b=h4tbZYfwTsSuoOxBSM4l93emlH0rsAfwNlOy44ae5zDiuuz/KIypj2XHwa4B/uF+JY
         eOG1kEyAuuym8jq2EqQtwAqf/FWe5Kr5Or3jGJdlNi7zo14X27/AayjCbvMEXYN25khq
         fMVtji7jjF2at0sYEjsIx1QHLOo0ifyxvz0a3bWb2ohx/5145e/LghCqTgfsuWk2pI9U
         NzgW4+tyls3pJk1FbPMl62zWLLElpL20X1iJWPYLtX4D9kzsBRsgnRPXTq3ztf1EkOXG
         v/LBtLGDWCtB/pSIHRMf29PSKTXdYFfzUiNTAfFedHs4tSYtxqxI1NIOchprmgxPOlOx
         rhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205898; x=1784810698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igNuDXnwdUCT2dm/vIcI/M9kQJ6fMwWaxma7wgKaCpI=;
        b=UGyRWNa3loXvGMsyyUVUjUqR91FQwaIZoYsMHtZ3r3Wpn/6ggFWZCGm4PURPny55VM
         zcSXvG6uuXE0dyaFy9xoOxPMTBqk1cw0J4t0kVAP0GxZ6TOki4b2Jts2xPPJlaFkRC6j
         kD8ALXO3Kd8GqJ1PGnUVi+JREI3HXwHsOe2v28/kHr76KWTnM5zsI3iaqzWgd+hz7Gsq
         jQOXAbuX4/XTtDqOpvT507S33YbX0etabwjH6d+NAVvThvjVMxUNv9bOp8uAdgQvuxzR
         TqY9dzEvJNuk/pixek16XsFdvg2lRV8it8ojjAQ1nGXj36gxDiU21DW/qpRaM5Ainkum
         Uysw==
X-Gm-Message-State: AOJu0YzFd9obkhp/U4fEnxo7SNQdLJtDgR9dvmw0jH1YoGNvsKxn6F0Y
	uiQwiyrXc0sBCN7Q+TKJMk+23vl557xMhSQ+D263d044d/4Fw6+NIeF+FIyBgbejVqjfgtsX/WR
	ArtSmeYo=
X-Gm-Gg: AfdE7cmtlcakRlXe7OOT6BO5RDSHdT+pBVOJuaD5qGXkmAWaKIRhMk2ABNU6xs1HygG
	BT4uNIK/pLd/WzzmhwNJxw0DiIUHC7gU6ZHm6PerWYRAOJXzv1vu6Rw4nXGC/qTabHp/WSXXh4a
	ixQfSCGMCRByM8FFFUBFPOIxd2331mA6gWw5fNXp78zs2qiD+QrO6Fmdlw9PplFpK0J6VZZRi5a
	XMjFVRllczHKCwUa1tBMzB5HYpYr6QU5oGnrZk9NXOTtZpLubdRAw6hwl+b5fHl1nE9Bp4mk8Xs
	Avg1+/FjGLlF2RsMiR4QEaJkrgaS8DHvreweMdKd32ohb/qaz4vREOYQ/sddpCe8TjfqStn5n5Z
	kdI1HErqUrmgK1Uu8gYWisnoab3mN34RRqXKR9n5tqTgSucVWSjZz35GYGj6satyH21ZXBx2715
	Jir3bm4oEesELoPzBcWBxNShg=
X-Received: by 2002:a05:6a21:7318:b0:3bf:a881:4094 with SMTP id adf61e73a8af0-3c36c35d245mr7182183637.50.1784205898111;
        Thu, 16 Jul 2026 05:44:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:57 -0700 (PDT)
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
Subject: [PATCH v2 15/15] riscv: mm: Request large exec folios for Svnapot
Date: Thu, 16 Jul 2026 20:41:50 +0800
Message-Id: <88438f09b79ceab1548aff17384814b7f699a43d.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054459_206819_0E18C095 
X-CRM114-Status: UNSURE (   9.19  )
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

The Svnapot MM support in this series allows generic MM paths to operate
on folded 64KB executable mappings while preserving a per-page public PTE
view. To benefit from that more often, executable file-backed mappings
should be faulted in with a folio size that can be folded into a Svnapot
range.

Request 64KB executable folios when Svnapot is available, so executable
text mappings are more likely to be installed as folded Svnapot blocks
and benefit from lower iTLB pressure. Keep the default order-0 behavior
when Svnapot is unavailable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b546e6614c558..6801ba135c483 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -296,6 +296,14 @@ static __always_inline bool has_svnapot(void)
 	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
 }
 
+/*
+ * Request executable file-backed mappings to be read into 64KB folios when
+ * Svnapot is available. A naturally aligned 64KB folio can be folded into a
+ * Svnapot PTE range, reducing iTLB pressure for executable text.
+ */
+#define exec_folio_order() \
+	(has_svnapot() ? NAPOT_CONT64KB_ORDER : 0)
+
 static inline unsigned long pte_napot(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_NAPOT;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
