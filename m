Return-Path: <SRS0=YJ0P=FX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF4FC4361B
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 00:14:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2496423B23
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Dec 2020 00:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2496423B23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EeHqMVCul6NgYuIC4Xs/vS8pIPrTUsPc6t4YR8UHcH4=; b=K3NS2jMNCiqQq+/+7wrOw+Ix24
	i+6rA14XG7pwpursbcl9+9H1JFxI4MSlmH7R7oLJ4f83MP/7hzovKNW+2UXmRE+4nuID3SNKXXc7J
	PVnCXdVYJsPecgaiLuZVqJ31DDnBouWOwovUQw0cWc6xtAUfbEcA0Jair+1am3+nvzTgWRfBU/MN8
	ef0zjb2ouh07SW9/zxYJ7QN+T4hLosYnjeMHJExEbIrQcQt8oHuDZ1gEtBOCcScmDrZbGSkHZK7kT
	DNzyV0TJEzls4CUHglNDgVvLDXJ7fkDJDvoFVy/LK59XCK1tNW35blhsTw6kmGiJMuiyTktfbshM4
	vVHX5wZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqPss-00032t-SE; Sat, 19 Dec 2020 00:14:06 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqPso-00032P-Tk
 for linux-riscv@lists.infradead.org; Sat, 19 Dec 2020 00:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608337785; x=1639873785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qlA8wVBPQMAANB3GBWMbUoKFu0jCd9V1TTnxbjRptVE=;
 b=OZiXnOtagTjpy7Gd8BypeKBkTDiNipu95Rs1TJNEliuKXKxdN7YNP3bc
 HhWgPr7BzsCHuK0g9M/41sYAXZy6Fv9p+yXCv+drOOG2wqG4R3EMl3Tc6
 Hn4hPyfWdzBKg0+hz1c7uuV2lvv0wYV4MGW2MqYfxlAyxSto1CfkBXVzM
 at9bcAMAZioCyOnlAi8steGE82vlR1AZNncscELVTmuZbmbTXq0sVElH4
 RaTSEsyZAjzxFWml4eMBpMmFzUajeRSB+1Cf1YBX0gYaTOHW8q7GjySAy
 2juYf7poOqjItPtyj253i2FwOmRQ+BupcmD5Oun930FlYdcQGrj/WFtvh Q==;
IronPort-SDR: MownhQJHiGGbd8eStOkKaeBjAupN4JoT4gogex0JiVck3nTcq4lXBKA3y4+nmDwfOz3g5+Fpn/
 VnhJWCm7MwHGPskRhpNGh/6i8Y6N4/6v9UQoOaoAgQcgjv48fD36rQ5hMe8tf2a7h5tbBkPSHk
 A8vooPN/7AR5e0Us/apK2UnVZe7GTn2BiE42NYu8y8aKvFaOBs8ZyYiM1S9mlpAZq3jiCGNovf
 JdqhMm9GtvdXYw/5XxSbkhhmNBEmULNgdTV+wmfwmKrlpNDVJ8rxZV1Ga8lQ0KBoIIk8WkZgOv
 a9c=
X-IronPort-AV: E=Sophos;i="5.78,431,1599494400"; d="scan'208";a="259318861"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2020 08:29:40 +0800
IronPort-SDR: vE1v1vDKkpmYcLQsklvHzf+n0nNodprRFxhl/2Y9TJ17rq412PTInV8nfQNcXiikY2d07AOQUc
 QjE4DNPq8vcZ9g/yp1CS7l4yW/X4HMhSsM7jRSXmCEK01qDp3s5QGm9CotP6kTMSGq3S4Nt2gV
 VhRPdEa/Q4eho3o/2jRQSrUbwGIAzsNNfBc8tT+55IZqy37+uvluI9btJ4vrGASvTT2gNepvcm
 Hnt64VBgAq/a/mB6g64iotjIeKxQ9hwRHJEUupOUyCPqCEeQk2mZzudXugVh/49+D0a3Siho6H
 hOGQ5IEwyUcSNDDU+jmR00oa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 15:57:31 -0800
IronPort-SDR: 6d/6ygrnX1yCCBilFFyUWFPZTNYhYNlq4sBOFOEotphNj/FE7NISXMQhQ3bMV8BkNncDGWRasv
 XSC0e9XwPgoqtU10GzCtaz6rzTnTvSdVXkFGVWBlxQT18yut9LUnbx2GqgrKdQl7LE+CgGukbw
 oX+g+IsuitkPV8VbGTVxu2fVt2erlBkQ7SZ9wSMNekkp1Id+4DeEEq+V6xaJZ9D5WFtC5tM+l6
 fAGrwpstglEYIbW1x4ln3ElFHo4RIAQpDXQvnO3R0aQiILDd3yBzc7iFC1HuCyJ5hlDIwZAEhF
 xuQ=
WDCIronportException: Internal
Received: from cnf009746.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.26])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Dec 2020 16:14:00 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: Fix usage of memblock_enforce_memory_limit
Date: Fri, 18 Dec 2020 16:13:56 -0800
Message-Id: <20201219001356.2887782-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_191403_961306_DF9ED2EC 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 stable@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bin Meng <bmeng.cn@gmail.com>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

memblock_enforce_memory_limit accepts the maximum memory size not the
maximum address that can be handled by kernel. Fix the function invocation
accordingly.

Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
Cc: stable@vger.kernel.org

Reported-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
Changes from v1->v2:
1. Added stable-kernel in cc.
2. Added reported/tested by tag.
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 13ba533f462b..bf5379135e39 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -176,7 +176,7 @@ void __init setup_bootmem(void)
 	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
 	 * as it is unusable by kernel.
 	 */
-	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
+	memblock_enforce_memory_limit(-PAGE_OFFSET);
 
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
