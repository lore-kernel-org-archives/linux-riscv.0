Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13490C56201
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B571720708
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0aEtXH3V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="P7imCxg+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B571720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fXVyYS2t9va4G58pC03VA4d9ZBiDIWidqr+XRUr8uOM=; b=0aEtXH3VAgmEBQKzqXhgabfRE
	V2/Yqid/iy8LtCw6WoK+IVDI0gOLkgqLP2ChmPXt/RfAxTA+A3xxvMKazG/ygUYBu1vPG3HUQz/de
	bcSLaUFmCBulOt7OZR90WhPVW0D8wAdA/xmh6FX8AwRnN6My2vAB54m9VcZ00hokRdPWtSF8kzQNY
	2H/DkxGNMtg8XXR/w/9+i13bwLOrTP3sj5oJxGkMjrzESGKfJU65gkd8/EuLSbTq+If+fmG5nBq52
	BXgpz9qxiE1Fju1w5btn8AE1Y97YALESFOPRdOm7uZIEmXlm/OayEkYwZMCQZMW6MyUxcagLM+Sib
	/7oyW5gOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWa-0004Ka-Lz; Mon, 26 Oct 2020 23:03:36 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWV-0004FU-0j
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753411; x=1635289411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySjO0ROtxsgulKuASejfUOnFI2wPdTDF4D2jhNgjeiY=;
 b=P7imCxg+9oBiw8aBtRk+L6Zz8THT17cCHNj7XjaKdrZmC2+KBGDAvFWO
 5V/fRypY/s9wxrudt5RjyPOp87Ob7g+gSuRQ9v2Ickh6Dl0cg/bmflozp
 nlSCPgJUH0uCTqgckGDx9Kg+EdFOUmnUNTFlItmvIOJIYmaDjqe58y+HC
 ej8tpDrRJdN3oAN6uc5hYyO5kMWuiFVJibm/bKr+5oJgimJ9DsG2bA4f+
 jKvLQRQCI5MidMbWd1/oj0QSwCNghHSUahIwFeQjZjwy0Do2Wn7AyjwHz
 Pimf0/AVzQYqo8BacBX5cUK7OXAkBRsTu6BUIu/h6VPuvV/t7ZwQp9z8R Q==;
IronPort-SDR: PT0RiwbgnnB9A6wwG+sCRTPlsjfPISJwc8M+pA4S6cjb6g/gX+CxZDF5bjLlqnkTWQiYX2pzM7
 oy40QCbgnrOmeGDuoRhTSdYyZ4yxn/8MGgWB7Mo7ASVn/rRoeSGkcUjDsDZ1i3vGEcW3It9BJJ
 xoamU0sMqFCB/KXU9pOVY7ZWo9e/fTAAl59xrdy9nnLDHTSmOxqnxIugOPx36qVNglEGPVoRp3
 PcLgXDjtPzOvLJp0XI9G/dGNZ0zs2mZyt2jKX6+XcufPL6perAaPdrPzUAa5YOsoImLBpZsT5d
 ogU=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152918"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:26 +0800
IronPort-SDR: ZbbpiJxajYyqZgq/FisScuJrRZsjrqlKTSHhQnmaz5I2bxr8Q/Q13rQQ+52de0CtGTdgnVXive
 f7e/l3eRWTzARcycqNkGjCUHbg25Lr5CkXXYOeafY1cnnz3cLPy1D53MkmPQ9RDajUYFYvhxJq
 /LDSLVmZiWjquoJBfjk4NUyfaczNQ7Ttnee0ZhyENiPr0n9B2fhJa07FPYS9R1t7ReBR/TZydI
 UKxgygabdrP3YNvguDZCWoy6tI9mvzSWi0cMxM5SA6Uv9Qq3W1TqnD7rxSnMUDViRrpoS/F7gU
 WcKtaoA+nEMc+wxCU8YiHZdf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:37 -0700
IronPort-SDR: ZIK6pBlHow57hiV8D7ho7M4zJo6JZXmXc68rJru36zg2zepGnFLYfk0rMM063VRf2xcII5Vlm6
 k22KEvndaC4UkvZdmPy7PsVD3hmZnU/emkdOcOh9ZfogHtkgStZuny0fTzU6a6UKM//grYrAnu
 g2DxU2TKr9SHf2reP/hg81Iij6L7dTzG1xKtuyPaToFyfsS8Ud3UlSpzrBY8RZEc9935R2b6nJ
 OLPJbTTgczk/7d57STXaSaoAVH2omOc9iwiC6afLAGgmwM3l5XwA5ZkyLRltkHkbZ7/aPO0BEN
 FHg=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] RISC-V: Move dynamic relocation section under __init
Date: Mon, 26 Oct 2020 16:02:54 -0700
Message-Id: <20201026230254.911912-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026230254.911912-1-atish.patra@wdc.com>
References: <20201026230254.911912-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190331_505428_453BB9CC 
X-CRM114-Status: GOOD (  12.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dynamic relocation section are only required during boot. Those sections
can be freed after init. Thus, it can be moved to __init section.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 0a1874e48e8a..64c5e74008b7 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -85,6 +85,10 @@ SECTIONS
 	}
 	PERCPU_SECTION(L1_CACHE_BYTES)
 
+	.rel.dyn : {
+		*(.rel.dyn*)
+	}
+
 	__init_data_end = .;
 	__init_end = .;
 
@@ -116,10 +120,6 @@ SECTIONS
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
-	.rel.dyn : {
-		*(.rel.dyn*)
-	}
-
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
