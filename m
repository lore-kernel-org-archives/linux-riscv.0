Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E91BC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0F3217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 23:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vn706hMc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NeIv1U1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0F3217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ngdRt4bgnnn1HXMEZOInHWSY2Uj2RryesgdCvy6rZw=; b=Vn706hMcF/uzlV
	jvDTH5hO5H/Hlol9yyW8XB637ml9f8VgIscvRD44Quw1fUDzfvwUQZXu57+nq2F0LUHtMvT4NKg1w
	HR5BS/uQcQof92wKSGIYEXkTGjDyfBz6Urv45MLRG/n3FFdJY+OupDpZiQbAwYaBVSyeopVj42v9/
	gVnUlw31XjwiK9KcHe9+h3skckeaoRgD7XVECr4Pvtk1pHHyzmKZn6ILDJRXEHdXWGqxtG+T8iNgY
	Gb23LTQJakXwkFk9zfqhKIaWTlR3ISAIddiXo0t2VNcEqBsN7r9lS0Rdb0BGF0HFBdbCbyURRVPuZ
	R2/VJkyz6QVeNtKAOZSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEMHB-0000Fm-1p; Wed, 10 Apr 2019 23:05:05 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEMH6-0008Tl-EZ
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 23:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554937500; x=1586473500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/x+jL+kPuh7mg6eMR2Nwf6ik4gO5nqwDyzrx7ofC4os=;
 b=NeIv1U1evm/A/R2+twWhsOGBMEIKur+kUoaZi+sCBK+KysahMQ1Z7lAa
 YbwEV2Ov4ei70Uvvoi015/lbWJMzpgwwd8tOybwU462GZJbt6zqUAzGbm
 lGzLXv4718Q2BWeeMHz6aiZ518XLRIc3iERI2NsLtAdmbnj/8+fip6wQM
 yayuy6yuM+q/MmeoRHJSlFhUKsbDtMrJastfENSmIGEmNbVE2M5JSySpa
 mgaB3tq7Ays0G6+N37AxcFGShnb4AJbtA2CsYTA4M9IiN6S2LOBU7X67x
 d7H5nkeAzWBl1706HwCqsS89mTwUToOvfMRivv3RYFPWLVBg9RngW1Y/f g==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105472262"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 07:04:59 +0800
IronPort-SDR: BlhKOcgFxHJ0/FUGolSEy2EHw3IqiqwZtoItUBsnzTAbAkgmhMnGigglPVaGjMBrQ8340wKP75
 mIMPSQ5NTTz/ZFtgXPWCFxhkM+zpzP83R82o3yYYCgYhOPFa1/76IgAz+JvJmjNfLpm3H+MoyH
 FW1Hpw7/pRrlPb2IS2olK3Gk1K1VnPp2TsBFkNuedUS9INZ2xIa8keHzJ8Gz8Nxe5aJbreEyCB
 6ca3cNnIgDDpo+JlV/SOMCVofDvS3gdt0zu2ve9VOsJ3wDF16mhnsK+tF1up0FGxuB7xcORH0j
 YFslhgsEhIYtv23Mb0+U3jdu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 10 Apr 2019 15:41:52 -0700
IronPort-SDR: ZsHMd7rSmer4yMsGq+pWheMFS8QBalwNLIJKk+UiMBz0JIeI6qp4vryMi/b0aLq4o9VhbQH/NF
 Wv/a8KEdXuXeOc33WEpE7NhCCsufSFng2oK7YuCSzBJHUIigAwfSwFqLAG+g9yRiMEOmCKzU3H
 Y8puD+pbOuSRbipKi0yZONgdepAZX5HDgeIbIQoTDEGQ0modJhBreYVdlW3rxYW9AvEw7XFkHZ
 d5bqhkXwclCMvRczdB3lhF5Gao0dWphTqgSbqaAjFqbDPpElq9QtpbhHOPQwDVQATPnjAMySjI
 lAA=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Apr 2019 16:04:58 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
Date: Wed, 10 Apr 2019 16:04:40 -0700
Message-Id: <20190410230443.15729-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190410230443.15729-1-atish.patra@wdc.com>
References: <20190410230443.15729-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_160500_519285_0D75B32C 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

OF/DT core has a hook for architecture specific logical cpuid to hartid
mapping. By implementing this, we can pass the logical cpu id to cpu
node parsing functions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/smp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 0c41d07ec281..94db72662f60 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -70,6 +70,11 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
 	for_each_cpu(cpu, in)
 		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
 }
+
+bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
+{
+	return phys_id == cpuid_to_hartid_map(cpu);
+}
 /* Unsupported */
 int setup_profiling_timer(unsigned int multiplier)
 {
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
