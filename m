Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04AAD73619
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Y87iib6U8NMpd/kvBSz/7vjCIrVuWRV7P0gzBreKPLI=; b=fvuW+1w9i3Ev4C
	sPeBrpFmh32AjqNLEgcYpiSI+klarn7cz5UI1rNrKCFg21HyKcv7I0Uf0Kxu96RutVKMLPpI+YMNa
	eLKwDca4Q8g1l3F4qCoNGBS8OC1ntbzBVqyEb/c02teBs0lHOZesKsZvnvb8s1iAGpgnqerQQCtf0
	xXB8Nt1YdpTp1ZQzuYQIFHhG96Ad6YCmw89zzvWv5Zaa7SUofMgFdTh2PV3uwCt0seU6soxyyE6of
	8p55V2/lHNsCiykCrRBB4SauRO9XKdHMGuVQHOBp6nsSlk9t5dIHdXFFUhZ6u0PQ3vHPyrO3vz7BR
	/7wziDdTwvgcFCZO0edA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3KH-00000005fFb-1O4b;
	Mon, 02 Dec 2024 10:06:45 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3KD-00000005fDe-4ALa
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 10:06:43 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241202100634euoutp02ac078938d904c0d336a0c51623555fd0~NVC9k2uNt2564225642euoutp02B
	for <linux-riscv@lists.infradead.org>; Mon,  2 Dec 2024 10:06:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241202100634euoutp02ac078938d904c0d336a0c51623555fd0~NVC9k2uNt2564225642euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733133994;
	bh=qVpMuOOnV5mqA9o7w8bajv2jlHubixQgYsTmr9HLtvc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qSLLUWBBvQBOGcNW2xALK9KgggA/m6o7+YfUzMMzD3ogzm+TvMyOMmMUyysy5ld5h
	 HIxvh9ipVdkG+8ndDTPN/JXqzjjxJqbNYYYlkBKmMPIRQGALczEdrr+zqP/toKU0GI
	 a59NfwTgz8Xr+9MH01wkKNH4RP7ba+BA4DqZre50=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241202100633eucas1p2e58d546d8c6deb8f28386c45730d4a27~NVC9SPvDP0554905549eucas1p2c;
	Mon,  2 Dec 2024 10:06:33 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 00.A7.20409.9A68D476; Mon,  2
	Dec 2024 10:06:33 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241202100633eucas1p2a615523beaa41bac328f413e13ce471d~NVC9AUYvm3092530925eucas1p2q;
	Mon,  2 Dec 2024 10:06:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241202100633eusmtrp160f716c93c5a8cad6adcd888132908f6~NVC8-o2MP1982619826eusmtrp1Q;
	Mon,  2 Dec 2024 10:06:33 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-d8-674d86a90e51
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 0A.E0.19654.9A68D476; Mon,  2
	Dec 2024 10:06:33 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241202100632eusmtip1630ed766a899c4b712d2ec46d9aaf5fe~NVC8eNjjO1051810518eusmtip1l;
	Mon,  2 Dec 2024 10:06:32 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Michal
	Wilczynski <m.wilczynski@samsung.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
Subject: [PATCH] mailbox: th1520: Fix memory corruption due to incorrect
 array size
Date: Mon,  2 Dec 2024 11:05:35 +0100
Message-Id: <20241202100535.1359134-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7or23zTDT7d0bf4MK+V3eLepS1M
	Fi/2NrJYXFsxl93i8q45bBbbPrewWaz/Op/JomX/FBYHDo+ds+6ye2xa1cnmcefaHjaPzUvq
	PVrWHmPyeL/vKptH35ZVjB6fN8kFcERx2aSk5mSWpRbp2yVwZdya95G1YBpXRduJe4wNjI84
	uhg5OCQETCTmHQjrYuTkEBJYwSix/GxVFyMXkP2FUWJu6wZGCOczo8SzzvdMIFUgDV0/VjFD
	JJYzSnxYNQvKecMoMXXlSVaQKjYBI4kHy+ezgqwQEQiU2LqgHqSGWWAuo8Sj5hnMIDXCAqES
	M5Y9YASxWQRUJbZ+vQEW5xWwl5j/4THUNnmJ/QfPQsUFJU7OfMICYjMDxZu3zgZbLCGwh0Pi
	zsdZjBANLhJbFqxmg7CFJV4d38IOYctInJ7cwwJh50s82PqJGcKukdjZcxzKtpa4c+4XG8jR
	zAKaEut36UOEHSU+fHjBBgkuPokbbwUhTuCTmLRtOjNEmFeio00IolpNYmpPL9zScyu2QX3i
	IbHr0j8WSEjHSnz6/JNtAqPCLCSPzULy2CyEGxYwMq9iFE8tLc5NTy02ykst1ytOzC0uzUvX
	S87P3cQITEan/x3/soNx+auPeocYmTgYDzFKcDArifAuX++dLsSbklhZlVqUH19UmpNafIhR
	moNFSZxXNUU+VUggPbEkNTs1tSC1CCbLxMEp1cBUo6pf8KckfOK8qUzCIsr//S/HPzz9Qnn/
	glsdByW/PZ6a9KF98wq/zSJTZ2WsKmut7V5sFWGhYbHomfnkfbtW97QFOO1L8JJUuPI+U/DE
	Qo/FC79x7F658POnk53Hd7t9PyLYUf5HaOWiRcobryZ1ypUFaT6f9+3v9RuaOZypUz5+1zLW
	8Qy4IpAyr+tCn8GB7+uMBWZn3rvocJlph5qextSqTQmCq315ONmt057+y7d8Es0dLz5jYeQx
	2aRw36PcycyBWsEM821D/vDZ39KMPvblk/ajApa8R37CEgvt+T/MEPsypUZdYmnQ//zXz3X+
	r1p2LGmu2wlJU8He/RNaNsbIzF5etq1P/PfsfLUtSizFGYmGWsxFxYkAKmq+p7UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xu7or23zTDeYvlLL4MK+V3eLepS1M
	Fi/2NrJYXFsxl93i8q45bBbbPrewWaz/Op/JomX/FBYHDo+ds+6ye2xa1cnmcefaHjaPzUvq
	PVrWHmPyeL/vKptH35ZVjB6fN8kFcETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
	WhmZKunb2aSk5mSWpRbp2yXoZdya95G1YBpXRduJe4wNjI84uhg5OSQETCS6fqxi7mLk4hAS
	WMooMa3lNBNEQkbiWvdLFghbWOLPtS42iKJXjBLT9x9iB0mwCRhJPFg+nxXEFhEIlbj0+gkj
	SBGzwHygSedbwSYJCwRL3N1+jBHEZhFQldj69QYziM0rYC8x/8NjqG3yEvsPnoWKC0qcnPkE
	bDMzULx562zmCYx8s5CkZiFJLWBkWsUoklpanJueW2ykV5yYW1yal66XnJ+7iREYDduO/dyy
	g3Hlq496hxiZOBgPMUpwMCuJ8C5f750uxJuSWFmVWpQfX1Sak1p8iNEU6L6JzFKiyfnAeMwr
	iTc0MzA1NDGzNDC1NDNWEudlu3I+TUggPbEkNTs1tSC1CKaPiYNTqoGJzeP7q0kbfi248dmV
	fdIdswdr5tWxqMge4jnwcsKssD0WTtWKUz8aKF2/+Ua4qy688NOj9Matz3Jqjh8PmLPa08JF
	2PAX00vD6+KvucO+yTw5+rGVOe/yxo0n5eJLlNquPXDa5NFye/O2nvvxO4Q589Uz7zyXy8j1
	nVth1qz8/vZx26VdvXNLTSbw3fNiXR0ialR+6sxWcY9idvVtQUmW3OL2Xglf3hsUPDql/OVh
	3JmCFs9Jr/bPFPTvX+bf6xXZKMkt9H3NzLdBRZU8latOG1Xv2hWrrhnTq3jAN4lB+aFyafCq
	TQ6XHr9WbGI5WhFp8unr7y3FZcFSN2rlemz760JztCoDpZ6u9mstElZiKc5INNRiLipOBABN
	RcvbDwMAAA==
X-CMS-MailID: 20241202100633eucas1p2a615523beaa41bac328f413e13ce471d
X-Msg-Generator: CA
X-RootMTR: 20241202100633eucas1p2a615523beaa41bac328f413e13ce471d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241202100633eucas1p2a615523beaa41bac328f413e13ce471d
References: <CGME20241202100633eucas1p2a615523beaa41bac328f413e13ce471d@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_020642_526216_99274DA3 
X-CRM114-Status: GOOD (  12.10  )
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

The functions th1520_mbox_suspend_noirq and th1520_mbox_resume_noirq are
intended to save and restore the interrupt mask registers in the MBOX
ICU0. However, the array used to store these registers was incorrectly
sized, leading to memory corruption when accessing all four registers.

This commit corrects the array size to accommodate all four interrupt
mask registers, preventing memory corruption during suspend and resume
operations.

Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/a99e72be-8490-4960-ad26-cbfef6af238f@stanley.mountain/
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/mailbox/mailbox-th1520.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
index 4e84640ac3b8..0d95e1898702 100644
--- a/drivers/mailbox/mailbox-th1520.c
+++ b/drivers/mailbox/mailbox-th1520.c
@@ -41,7 +41,7 @@
 #ifdef CONFIG_PM_SLEEP
 /* store MBOX context across system-wide suspend/resume transitions */
 struct th1520_mbox_context {
-	u32 intr_mask[TH_1520_MBOX_CHANS - 1];
+	u32 intr_mask[TH_1520_MBOX_CHANS];
 };
 #endif
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
