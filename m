Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11652C5AD49
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 03:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtgZnl03Pl+eq05hCx5+fLDGteB2dwH9y3Ozwxk2e00=; b=sLXtVbEr0vp5Zw
	CNzYaoqMH4rLXmWqNj21CSkLhs0djqBbWMUel+6K8Zy8qYhixhJB0L5fSZ+NOhogwKR2ieJAI3YoZ
	F8hziQXv0PSMVXHWnpmzLbC9kzaBQqFYltXTWtKrHdcx1ZtV2uE4Z8aFeQBMx/Cz881bPZ9Lw8DQV
	T4QgvtjOyiXquG1Ld4T1O6E+AYza9kWJA9Bo/e4LDeegOu0Wr86GwzuW0wxTwvYqazH/p50VSpGbk
	mp1YZJubrtrjdM37e2TOmkQJa6+jV8oYeM/RGGqbiSOMfxfjf33I58x6wqz8erjAB6dlY8MdxJlJR
	j9TOJiu5b7JYL9jvsF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLCZS-00000003CRL-1TFL;
	Sat, 31 May 2025 03:07:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLCZO-00000003CQv-3mw0
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 03:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748660857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdGqR+lbsdF+ZAaQYj0xRCvZi4FVtrfoM9MTXbgsC4M=;
	b=SAwzr5ZLNCaPcpORJJI/waeoZwDOswOh9/aFB5SO6JFnt0suYmh39Txl4AYEwz4dRdv1cF
	g4jhYc9ibUZsfgOVEb0bSSqyp10snBtHeoqAntQbL6V63Xwqky8301eAxrjTw5XyDsUEA0
	YmYYnnDQY1EKe2U4UOxs72TpMMptMrQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-AHJaUM3uMTyH1NJ00ykJ1w-1; Fri,
 30 May 2025 23:07:34 -0400
X-MC-Unique: AHJaUM3uMTyH1NJ00ykJ1w-1
X-Mimecast-MFC-AGG-ID: AHJaUM3uMTyH1NJ00ykJ1w_1748660853
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E9AC1956086;
	Sat, 31 May 2025 03:07:32 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.22.88.10])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1DA701954191;
	Sat, 31 May 2025 03:07:29 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: cmirabil@redhat.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
Date: Fri, 30 May 2025 23:07:25 -0400
Message-ID: <20250531030725.798945-1-cmirabil@redhat.com>
In-Reply-To: <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>
References: <CABe3_aF0U5ej6ctQ0TQzecZ+ayaRSzJPTv5zf6kcD9U95rQXxw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_200739_019039_CBBAE8C9 
X-CRM114-Status: GOOD (  12.52  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

To be clear, I am suggesting that the following patch to just rip out all
of the if else stuff would also fix this bug, but maybe the perf gains of
potentially inserting nops is worth it.

---
 arch/riscv/include/asm/runtime-const.h | 33 ++++++--------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 451fd76b8811..da47253a89a9 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -179,41 +179,22 @@ static inline void __runtime_fixup_caches(void *where, unsigned int insns)
 static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
 {
 	unsigned int lower_immediate, upper_immediate;
-	u32 lui_insn, addi_insn, addi_insn_mask;
+	u32 lui_insn, addi_insn;
 	__le32 lui_res, addi_res;
 
-	/* Mask out upper 12 bit of addi */
-	addi_insn_mask = 0x000fffff;
-
 	lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
 	addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
 
 	lower_immediate = sign_extend32(val, 11);
 	upper_immediate = (val - lower_immediate);
 
-	if (upper_immediate & 0xfffff000) {
-		/* replace upper 20 bits of lui with upper immediate */
-		lui_insn &= 0x00000fff;
-		lui_insn |= upper_immediate & 0xfffff000;
-	} else {
-		/* replace lui with nop if immediate is small enough to fit in addi */
-		lui_insn = RISCV_INSN_NOP4;
-		/*
-		 * lui is being skipped, so do a load instead of an add. A load
-		 * is performed by adding with the x0 register. Setting rs to
-		 * zero with the following mask will accomplish this goal.
-		 */
-		addi_insn_mask &= 0x07fff;
-	}
+	/* replace upper 20 bits of lui with upper immediate */
+	lui_insn &= 0x00000fff;
+	lui_insn |= upper_immediate & 0xfffff000;
 
-	if (lower_immediate & 0x00000fff) {
-		/* replace upper 12 bits of addi with lower 12 bits of val */
-		addi_insn &= addi_insn_mask;
-		addi_insn |= (lower_immediate & 0x00000fff) << 20;
-	} else {
-		/* replace addi with nop if lower_immediate is empty */
-		addi_insn = RISCV_INSN_NOP4;
-	}
+	/* replace upper 12 bits of addi with lower 12 bits of val */
+	addi_insn &= 0x000fffff;
+	addi_insn |= (lower_immediate & 0x00000fff) << 20;
 
 	addi_res = cpu_to_le32(addi_insn);
 	lui_res = cpu_to_le32(lui_insn);
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
