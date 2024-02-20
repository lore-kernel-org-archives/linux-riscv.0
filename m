Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4669C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RV16fOF/oO04f9xIYljSzENAdVv253R7CUDazjnt9A=; b=njDSxYGhMkiTHA
	SEgL/h1+EaaZzsXbPVXhJjcDzi9+OJZW2lnAMMPoetNG0l8IFwezDpdStsRVWooAKnaKwmlJJ/7i1
	/JUAj0I9PXHcyTH8X/b4e5IfmxMPXucoAvJP1F5WVdkPOXrvoecAdujraWpm8qyoETyUeSqsHa00Q
	KhNVBleXswKWY662TnagVnSGrhMKDcs6c3eTfJCaNwoikG4VUW2YL7gRadRhJS1t7HWTYdDnYCyTg
	2UniEtYJmNH/kCuGuSEbIVCTH8fm4riE7oK3vNpZp1RKpH2etl8bc1u41F/m4S/dhR8h3pJPThup8
	rtDboJio92fpVeikXpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLrm-0000000DoYD-3c5P;
	Tue, 20 Feb 2024 08:52:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLrh-0000000DoSX-1cYb
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 08:52:41 +0000
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708419145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRJ6q+w6PWpmy1zIT6leu3Z5s7/O2Fle24NL27shHS0=;
	b=IzLVuyGZR+3MMByVPrc0qDiSJ9LPePvFUId3+fMVczmxkwoJC4Pmp+HxhnHe1mjMRA9d16
	MK3rauiN6/y7dLiS4a8tWIpdn+s+PdOV2Ao/fbM352GUtnqxCzqdPVnzhKvottAgfS5Jpv
	+sVfL/oXqHzQkv+f+1mnDG+xkngje+BkLgKfpvO2KJGeLSwOTwSgRD9do8Lu6YBTGA7bNz
	7TRo+XRf3wcD4WhKQIf4sI/b/Z+0DsqQmEzwb96PoxiemIppwqIz1eMik2LYgNEJAVWx8y
	T2BZHto4opPMZ4UVNm50BDN2J0jDMcHXKfpdsD78k8OpbUshVZjlCVBC2+5Iuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708419145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRJ6q+w6PWpmy1zIT6leu3Z5s7/O2Fle24NL27shHS0=;
	b=gVZVDs3DqBXIydK1NNlQDSB1Z0oouZ4f/SeqnfAykhrMEH+KNNVdoATlwV+T6JYu6LBfba
	XCebOD4yIVZGWOAw==
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1a] riscv/vdso: Use generic union vdso_data_store
Date: Tue, 20 Feb 2024 09:52:12 +0100
Message-Id: <20240220085212.6547-1-anna-maria@linutronix.de>
In-Reply-To: <20240219153939.75719-7-anna-maria@linutronix.de>
References: <20240219153939.75719-7-anna-maria@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_005237_594407_72937BFB 
X-CRM114-Status: UNSURE (   8.55  )
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

There is already a generic union definition for vdso_data_store in vdso
datapage header.

Use this definition to prevent code duplication.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/kernel/vdso.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 2cf76218a5bd..98315b98256d 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -30,14 +30,8 @@ enum rv_vdso_map {
 
 #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
 
-/*
- * The vDSO data page.
- */
-static union {
-	struct vdso_data	data;
-	u8			page[PAGE_SIZE];
-} vdso_data_store __page_aligned_data;
-struct vdso_data *vdso_data = &vdso_data_store.data;
+static union vdso_data_store vdso_data_store __page_aligned_data;
+struct vdso_data *vdso_data = vdso_data_store.data;
 
 struct __vdso_info {
 	const char *name;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
