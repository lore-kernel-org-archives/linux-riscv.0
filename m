Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E23C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9985D217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyn1/LgM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="n3pIRbkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9985D217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEmIcBCm+yuTEf/KQqnPFoIbu4DeLePYO54f/rpip28=; b=eyn1/LgM/gVpT8
	tm3VlS/umCr2cOwbhFqfiSB5yDtrVttJsR+l1PPZM88siQkQpwzz2rplWAKnZko1cQZnqNtX6DVGA
	3VFrckyKVwtIBZswbspizrsbeoFlmZtvGyKld43ToaQAZhdCNGalFoAbU9X3Qk9RmbO1L60aTW/lB
	tGim+vQLTL4wvXQWcKEYy1WrWHEg2Ohxcu77kpy0xg4G/ZleToyi/UNNKsU9p34Bzb1IyV9JX+3br
	i0QPbznwe2WDRG3gPz9EVZfnB4OM+ksq35W1faEASSs4KYPOzEYJCQMTD57WFLtSYBLRVk1aj1NU9
	MTIAtxWj9ZV8D5bg/n4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEMHE-0000bp-Qs; Wed, 10 Apr 2019 23:05:08 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEMH7-0008Tl-NG
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 23:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554937502; x=1586473502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2/5jwhYTGQ1JCFD91I9OK6vJ4c5B03XruX+Wm8H9FA=;
 b=n3pIRbkBRUT388QDGfa817fRhG9/TKptbRJ86mWsc7CZstu0LGUQli1F
 st18N1suhuiCHf+5Gm7fVWUmp8QPz0elW9EfK7sbZe1NCA4HegLGgJIz6
 XEa4QeSbVUDxvVqWEXF5Re5dHbnYRrbIMkhT/oId0neGdqU+O1cTa6vWt
 uGUmuiQw+M87XTW7kBExQmEF5rsVw2s77B7ETdpU7t7GMjV1i8YIyaJVr
 KvKRLRAxjRFeD/3Vqb2Cj2nkF29DSXY3J7P/cjjZ4HZX/cMydlwLqa41a
 9qtBbrwGvMp+o0csTVm4JNhdLhg8ChT2uPf+EcGrGQYK3xmQmy+c91rXI A==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105472270"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 07:05:00 +0800
IronPort-SDR: uItT99q+1exCrQcB4NaFO/5VslGJ9AQUe7aNQhVnVmFyXCJYPf5vxFvoNwC/Zj36GXEsI04MWs
 GpyxSowh6Mog9adztvWINcDnNyvVjdJBR9KmNsUr1qAyXVEOaOPke4SLfwEBfywJIgnM93jIV5
 TlDSw3zZHV/4D+ZrKeYeZmsOUf1ipBsxCmHXIQpp9eOrDhUWHQ9Dju6WKXLTvqtfwU9SuICwuo
 b0yB6K1o1d7WDeJsoNbQPMvkH/Umh5znfyej2F8zIFl1csH4xs3b/w/r2SyGJXo4mKxJcDCaAx
 XormGrMgyHvRHdC4Wz27kbAn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Apr 2019 15:41:53 -0700
IronPort-SDR: qSCZ+MB5u8VxvgmD1nPVzJjNR4LtGOvm1wKeEZBnQoylDPQFPADfO/14h5TDqLzxuODWbUL403
 eFYFoZz1x1jMC8i7etI5f0X6+rkbZ5nHV01E/SEWlpM7R881ZFPiAKCH+Icn8KS3+yTlH6gPM4
 i6Z2B6IrtwM22k/f82ZsNDhU98LAoAfJmLU9TdLCdRroZCAQk4MqUWhDF3A4GdYS8DvtdC0J0Q
 68GTD5DS2u6r9iLhGWADLJCPB8tiTHmaKY/CfFxxZGl9e6ZH8qMJqYghtWAqKdvkuSxaGGaryR
 jVY=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 16:04:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] RISC-V: Implement nosmp commandline option.
Date: Wed, 10 Apr 2019 16:04:42 -0700
Message-Id: <20190410230443.15729-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190410230443.15729-1-atish.patra@wdc.com>
References: <20190410230443.15729-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_160501_789426_0C738D67 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

nosmp command line option sets max_cpus to zero. No secondary harts
will boot if this is enabled. But present cpu mask will still point to
all possible masks.

Fix present cpu mask for nosmp usecase.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smpboot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index eb533b5c2c8c..a8ad200581aa 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -47,6 +47,17 @@ void __init smp_prepare_boot_cpu(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	int cpuid;
+
+	/* This covers non-smp usecase mandated by "nosmp" option */
+	if (max_cpus == 0)
+		return;
+
+	for_each_possible_cpu(cpuid) {
+		if (cpuid == smp_processor_id())
+			continue;
+		set_cpu_present(cpuid, true);
+	}
 }
 
 void __init setup_smp(void)
@@ -74,7 +85,6 @@ void __init setup_smp(void)
 
 		cpuid_to_hartid_map(cpuid) = hart;
 		set_cpu_possible(cpuid, true);
-		set_cpu_present(cpuid, true);
 		cpuid++;
 	}
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
