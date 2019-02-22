Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C690EC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D2620700
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAcgaOpu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OBYOo+KO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91D2620700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1ohqkYrYbHi7JsdRtBpb7ro2zRfGBy4MjqRl3r7PSyQ=; b=pAcgaOpuhnVA4LPlXNJhZDYNBM
	qoEMOvXDxJ7GqTgmz2Ntlnjcun6/XOyRdsThEmHzF7j4ymoP/b5InjGVAvrOLmTuCM4tvYKB8Oe+e
	aPPFIqyeMu8XDBchbuvZlwldT8R8BG5/li1iOtNO3a0Z4ag9iXfdqsFr852Js+3/3o+nX4AY6u45o
	B4CE0xO2fDjb+zfz/n2NCecgvr1GBQOLTUz6BztAGDRQVtLF2y+Rf3k4/n/KveaHrtgZ4fj7qValc
	nUvFvigMlh1bdB5U4FEaCdswKAlTP20OufElDLt1Wu3daeP4NCzlEr8l4gaDrJ/rNVzCtl3vfEqvQ
	qQXN62UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGi1-0007Ge-2K; Fri, 22 Feb 2019 19:42:09 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGhy-0007Fh-05
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550864525; x=1582400525;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=bTj3ZFVXgC5G434PAQjLdqn3TV1DqlyoGc/NiuvITNw=;
 b=OBYOo+KOKgyyMnFrZlYptTqZVuCfhc+bnqKB2/U08LCaCRxdNIq7WoIw
 gmICLLgyNcgYgCY8ZU7PbxS4o0nwv1vSNXXUx9OjbwY1TN2CsU1CemMes
 jgf5h/Xx0vc/Mv9MhAcKTw70c/gJbcd3LZTLqiyLyaXep3JK9E9IU4bpl
 AfYAUsY7USWLxhQ53kZMCT/sgl5PabPTEixzKwLvfPn8gyvlgRUknfzK0
 ycMjvnmoEGiww4GrRLJz0dw0k2V66CHkx2jqQ6kbMD5lIMGG/2HhAWKM0
 Wd/STwpoOG3BSiuVvAa/SlSr3UkW0yG0TXDX6+/Sx3ODfui75qX0/VVHA w==;
X-IronPort-AV: E=Sophos;i="5.58,400,1544457600"; d="scan'208";a="207180181"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2019 03:42:03 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 22 Feb 2019 11:20:03 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Feb 2019 11:41:45 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v6 PATCH 5/6] RISC-V: Compare cpuid with NR_CPUS before mapping.
Date: Fri, 22 Feb 2019 11:41:39 -0800
Message-Id: <1550864500-13652-6-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
References: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_114206_149201_AEB07706 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We should never have a cpuid greater that NR_CPUS. Compare with NR_CPUS
before creating the mapping between logical and physical CPU ids. This
is also mandatory as NR_CPUS check is removed from
riscv_of_processor_hartid.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d369b669..eb533b5c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -66,6 +66,11 @@ void __init setup_smp(void)
 			found_boot_cpu = 1;
 			continue;
 		}
+		if (cpuid >= NR_CPUS) {
+			pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
+				cpuid, hart);
+			break;
+		}
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
