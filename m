Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1A7C5B543
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 21:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QD3ThViigAxWLu87eWTzf+RU5C+8K66qoILX/Aet29s=; b=OYYx3K6RnBseHI
	+x22DuLZgrclWWaUHNGtwobBEKeY1ejVrZoqwzJaU4rHB7pyXXovpvnpDZlPDdI4xlkRup0uJarpL
	YLEPiSqeDS0drQGYRTy9RB4ScJ+pOi4h4DFRyvLaNrNCXMCdP1VMOK4IlN6t/QM5BEjQa4oqM+tD5
	o2NDQGUWTs7wKWK8VEmrIcxMs4xWszwWYoTXUN2bgM7DfNZq7IptsALdb6dVefKjSL+9tyEAH2KEu
	l/cHIsQiE7UprM3vjd+wRUWhqbFC8j4eV8EXXNgUdyvkDj/KUJddAJSdaz4DWXfBRQFY9Bo5sVOx8
	epKZjcztxzqRLeax67dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7AD-00000001udV-0rZE;
	Fri, 30 May 2025 21:21:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7AA-00000001ud8-2lwL
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 21:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748640073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qhq9bo/wYck9cizayDHbjF7+ytasiyxC81vAjAy8SFw=;
	b=g/o/w0Opebz8EbAFDsX8jGD3Q4xqfD41IA1VfafwReraa4DPvMAExiIpz3SLz+RSzCu/ID
	5DKWqWbs553ZBohWrt9kqq8L5KtmT7o3rEWjTcQgfzSN+e54WDOvfWG4BQMMRNPFPoVacx
	p4GR97s9ajhBFxVKPc4igyTcjI6R+Do=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-v6Y8huZnP7mj5vdh46LkQg-1; Fri,
 30 May 2025 17:14:33 -0400
X-MC-Unique: v6Y8huZnP7mj5vdh46LkQg-1
X-Mimecast-MFC-AGG-ID: v6Y8huZnP7mj5vdh46LkQg_1748639672
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B68A180035F;
	Fri, 30 May 2025 21:14:32 +0000 (UTC)
Received: from laptop.mht.redhat.com (unknown [10.17.17.210])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D94E730001B7;
	Fri, 30 May 2025 21:14:30 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
Date: Fri, 30 May 2025 17:14:22 -0400
Message-ID: <20250530211422.784415-2-cmirabil@redhat.com>
In-Reply-To: <20250530211422.784415-1-cmirabil@redhat.com>
References: <20250530211422.784415-1-cmirabil@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_142114_997659_4095B453 
X-CRM114-Status: GOOD (  17.29  )
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

the `__runtime_fixup_32` function does not handle the case where `val` is
zero correctly (as might occur when patching a nommu kernel and referring
to a physical address below the 4GiB boundary whose upper 32 bits are all
zero) because nothing in the existing logic prevents the code from taking
the `else` branch of both nop-checks and emitting two `nop` instructions.

This leaves random garbage in the register that is supposed to receive the
upper 32 bits of the pointer instead of zero that when combined with the
value for the lower 32 bits yields an invalid pointer and causes a kernel
panic when that pointer is eventually accessed.

The author clearly considered the fact that if the `lui` is converted into
a `nop` that the second instruction needs to be adjusted to become an `li`
instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
didn't follow that logic through fully to the case where the `else` branch
executes. To fix it just adjust the logic to ensure that the second `else`
branch is not taken if the first instruction will be patched to a `nop`.

Fixes: a44fb5722199 ("riscv: Add runtime constant support")

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
---
 arch/riscv/include/asm/runtime-const.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 451fd76b8811..d766e2b9e6df 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
 		addi_insn_mask &= 0x07fff;
 	}
 
-	if (lower_immediate & 0x00000fff) {
+	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {
 		/* replace upper 12 bits of addi with lower 12 bits of val */
 		addi_insn &= addi_insn_mask;
 		addi_insn |= (lower_immediate & 0x00000fff) << 20;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
