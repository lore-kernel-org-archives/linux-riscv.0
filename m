Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E2C982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHN37cnoOK54l4C26zggIh3dzzg50DGSs+KvDmg8R6c=; b=c22lAQN/Qzpb9R
	JusX3MnoNQwDN9t00pqpPvt4x3OFczpqxw3P9Ytpg1R/k3h5ZC3GE/KpGPbDIyM/uSz7g0LH8Fdu5
	sWuoFDgbATybgb3cFloRarlZ8PyaCTJ13ws7ZLglwvu64RPOPF00e2RzviTaOq5yDFxk1EYdXLLcX
	kNVcyKXv+oU5PAZJVEMarBwzPihmA6da30+jmTHEwoe+sWRN6wSVVud+EaPVeSgXXG8FLIsK2KHmx
	WgiwwpCJBzsWLAxqj+5NQLchISRRrLOKYBsxHuZlGbHbnjl0nR/K8VO0uFnSGe1EmflF4MereG1jL
	OlQgRywSO1fRDgfsQBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byn-00000001qFL-38bm;
	Mon, 21 Sep 2026 11:14:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byk-00000001qCH-0Jxo
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=; b=rfE2PPERejvoD58XMYOALkA1kS
	gwutD+3XQwpPkglKcl8XyyAy9sq8NfZAfQAAC8hVL6PaSL53X+ITlYFndGOxpyuvDTCGcwuqeYTEq
	gTl/0bOYNw9edz7NL1FHhDvHNrRP05qXJW+v/EqFVcBee8sao3vi6X7QmOaDeozpDsk2Ur/zyFAYv
	aIJGUxCtfddafiuMiBKEbPh5ZDDVLHYbDIfid6UroFtOM/vs835JYUWtobdvaAAW/K887In+i1aAN
	hOurkjRjkW68E2KFASjHfC4SHu00sp+2OoAhxp8SCTR9d4okkklsomGLEM9BJc9/rF4P3q7lQn5d/
	yD/HZ/dw==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byg-0000000CB43-1rct
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:32 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-398a147688bso2888445a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989269; x=1790594069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=;
        b=eFV0MvHXWqDhAqKHsCYEGBJMzG8XcLKMiZSRiVSRZNFR6ksF7/KZwVA/rv11519cEh
         UQ2GgbaCPS1Evsd4pAYSybyQHz06FOWh+EObgJsL0L43/vagrgXmVEE936XV9B0BWT0m
         1Pf0p3Xbp+ya5KXw7OqJrpn8GwS7WFUOlwwZylTgCXkSiLOdpoV9QpTEE60nwSpyz6vu
         ZkCF52oOes9gCau1x3JK81afoYD7mawTcxhk71w7nb8P4ecUYC7312pdtAYM1rk3BTIM
         j0rpXwkY13bvGKSh4Wf9zvKN7OGo5Fa6sDLT+roTdy1kc0uvYvdnqeOXcaczBXehpr8C
         ObCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989269; x=1790594069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=077YoXqYGKuusFGEo62X7PJkVmKJetb2TRAJK+g/S80=;
        b=dbQ0mwf4I/pviXZTHxbPUS4X2iII0bj82rCMJTHc3KUKepkm/HNo8VWr9eVqWjyRjQ
         ElXRw26ZrC+KxqfFbQotwd2MW4ufWcXS60CTHwC8KsG2IAv32AZYgHqlevKdCK4IWD1f
         BBCH+eILRDzIAFP50+UMkspAUnfJAexPj/TBNCh7r3MHfETLsWcnRC5rIfnSEjE0QwwH
         pTImyIKJcV0RrcCH468oW1q2AtBMqaJ04GG0H3vqiXBPUfPPQVJJfRSsASIq8+WDYmEb
         hrTjL9I90Z+kovxlp3xVG1y6orcAOax8w1XdBG1BVX2R2ZM0BVAinou9FVbr4raafSxw
         +ETQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv3nTr9aq/YKC+YVyShmSiQrRHRF2wf9wiTIiKY6v8kzpFiR7GG+vEvqc31OuflC8UV32jUsUaH9H8jg==@lists.infradead.org
X-Gm-Message-State: AFuF++kiNDWYkHlgrIDR2Gr7goeFyzbZnEpNkm5uhxvz+h3nY9XLMQCP
	+VhsOhpVmfHRdOfN8tS5iOiCq5weX/XNbJCKQYv/qa6PucpVHQoUnIEv
X-Gm-Gg: AYBFou1PDK5rTQmqc8Sv3sNH38bs2PpFh5Anu1tXV6SzxOeutZyl04RPJ5EU2e/EFJL
	VqrNm4l6kbJyPw09NKSHOmuRGxsWyzgsCyXOHRnbVdCmnSBC6bFy7ItmtxkPB42YjkI+vTyHMxc
	7vYDFAg4+MHDedYZWlhqNNu7xaiO2Ovcovfy9zFZcD5BAISRv7TsDvfIlPZwnbsPPrH1gSHvBWu
	W9W+D7tQyJpGrugbEdYjAIEGVk1krXDOliJN4bA8itqVk0e6ofBeA8Jq1lCTNIDUOO12/nix3rp
	9X6+58TvTujvfeQGPZus/RVNI/0pXcGsyTpSm979rRV1m4pHKdsXLr/JHO1l+qlMCh1dHIVEkXa
	/lkcP6XnrCAH6m2MZPUaMFrjtGBtVMZ3ayfCSI78/r62YiVCRgCE1nFUc/GvLHO/g4R4kiWPgmX
	8V8tTeEJvb3yYrYakpQPix7eIfahq2ytJ0OEPYwXnWXjfa8J9rwr7KQoTzUq5D52QjZUYDMCfnP
	v5oQpdwt9SgoFzUUE6/mw==
X-Received: by 2002:a17:90b:1cc8:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e54d703dbmr15998993a91.15.1789989268553;
        Mon, 21 Sep 2026 04:14:28 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:28 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 3/5] KVM: riscv: Write-protect G-stage PTEs atomically
Date: Mon, 21 Sep 2026 20:14:00 +0900
Message-ID: <20260921111402.120911-4-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121430_954319_FA7AF9C6 
X-CRM114-Status: GOOD (  11.41  )
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

GSTAGE_OP_WP clears the W bit with a read-modify-write of the entire
PTE. Lockless aging can concurrently clear the Accessed bit, allowing
write-protection to overwrite the update with a stale PTE value.

Clear W atomically with test_and_clear_bit() so that concurrent
Accessed-bit updates are preserved. Its return value also preserves
the existing behavior of requesting a TLB flush only when W was
actually cleared.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/gstage.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 944fa4c95aea..f7e4756ce15b 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -378,7 +378,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
 	int i, ret;
-	pte_t old_pte, pte, *next_ptep;
+	pte_t pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 	bool flush = false;
@@ -408,13 +408,16 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
-		old_pte = *ptep;
-		if (op == GSTAGE_OP_CLEAR)
+		if (op == GSTAGE_OP_CLEAR) {
 			set_pte(ptep, __pte(0));
-		else if (op == GSTAGE_OP_WP)
-			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		if (pte_val(*ptep) != pte_val(old_pte))
 			flush = true;
+		} else if (op == GSTAGE_OP_WP) {
+			/*
+			 * Clear W atomically to avoid clobbering a concurrent
+			 * Accessed-bit update by lockless aging.
+			 */
+			flush = test_and_clear_bit(__ffs(_PAGE_WRITE), &ptep->pte);
+		}
 	}
 
 	return flush;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
