Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22454C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC8A60C41
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAC8A60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvoaVW3OEWzlRKchjRu4F97s21yh7UhVdHfX5ZyeK4Q=; b=WNopEyDreemPfF
	xtG7Z6Xm6trWYVJRtY3u4bfyWe+BMJeBUMeQWNkZmBPlXOHASylq+J64AEKQ5czBrCmqg1Fu0Zzp7
	WpRYM+WGw4slAOQaNPkGDN2AOQ3N3qMLRDAE0gqourDQLMxL3Ux+J8MbvfkyIl8CAOo4UHZy+fs1u
	x8iDIQrlAU+RH9PV3BI8V+f966Tw6nkALkRYLzxj7k5H+YPQMMk01FsKvmB3/x3YIBbzMgHKxbcPW
	c2PdAYVaFwGSaQw3dU0rZej0G/Bu7reIfTUS1fdWqsrlk2h/zGjSm3VT/qwHHf9MGC92zcOYzx9Jn
	51ondf/be7Snbf4vkwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf62i-00HVE6-Tl; Mon, 25 Oct 2021 19:54:00 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf62f-00HVBN-B3
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 19:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191637; x=1666727637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GO7omq3rVi+V+CzKbzcTcJGYp29gXK/DeiBhKM0seGs=;
 b=TC0wj2HlmcrAza1GR18WrKhtGvvC45vn/p8bS1+Zb6BQN+9tXMLaVcTY
 iCEAYK9+LkcH2fpQW1x+4n5WuEeLInLaQXwC6d/p9gBJaiafJTK9+7Nba
 SNbUeS2RkVARVhKCdM87gmFWGPt7LntGtmn+IMTySxeNCJ26X1l3TFlMg
 svQXl7o6zvKSQzVyM1zoBgxQuqm5YsBTAbUrAY3WMAe0l7889xAnSKx5O
 o7AzSYjQxEt0Dxpj/CQSRNYDgpzbs5STf4CXskvcAXSEOsanSaVUptgAC
 USvwSmye+CIV0W7n9aHcqVh+bweicBzfHDmq1mPKLNYDz0mvXuz3xVUOz Q==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287682863"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:53:55 +0800
IronPort-SDR: QcwEZFliv2y9BF7yK+H6pLK3CCIMzvjeHaXaVmJhkqP0p8b5mZgka1FAXoehN7SK18eq0shOB1
 6K28vKuzh798+RGDRF/D5uaVZxQrjPbDhgOUTgbq6VnmD01rZE7IVmZA24BqB0CmAPIdxPuEjs
 62oFDa4lcdoXVbxIgv0Qlw/HiwEeVVk0w3QLJCtKGCLGBialAAbF/AuiJ5ClQIY1OlCCgyChgp
 pTYgtKVitHvX4gS3+UJFpusUXRV6PjgYYzuUHqWjzbOe0ykazoswp30a6iqN5BUWp9EGZGjrKH
 45SCGY8lTaWwsRwumxHf3OtV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:29:26 -0700
IronPort-SDR: hpQC9zq/7VkwmF1ZoGH6Vdwe6qQ8dMUpLSNVbWkiYEX3/d8OQCy9jbdpx/Q9yXQoz3OuRoGXv3
 vjPEuqgXxvENKxY7Skq8zrYEHXd23316LcZp43E3N90YNTZmVzuwHFh6S9lfNNm28BLc4KQJ2B
 TqYAhhgPG2C7STOgQC/PeMqSMBvbbIaPiHvdQawdIBYr1c34eyvq/L/pShp27wI7biHxFs8B3p
 zi8wbsqLDQzcmFhtpANpgS9Xij9cFFym4dKh83QShSN7zjgaLtctRX79/b4KtkZ1AIfCdkXiCo
 9LQ=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:53:56 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v4 02/11] RISC-V: Add CSR encodings for all HPMCOUNTERS
Date: Mon, 25 Oct 2021 12:53:41 -0700
Message-Id: <20211025195350.242914-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195350.242914-1-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125357_480998_871B5AB0 
X-CRM114-Status: UNSURE (   8.71  )
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

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/csr.h | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 87ac65696871..e4d369830af4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -89,9 +89,67 @@
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
 #define CSR_INSTRET		0xc02
+#define CSR_HPMCOUNTER3		0xc03
+#define CSR_HPMCOUNTER4		0xc04
+#define CSR_HPMCOUNTER5		0xc05
+#define CSR_HPMCOUNTER6		0xc06
+#define CSR_HPMCOUNTER7		0xc07
+#define CSR_HPMCOUNTER8		0xc08
+#define CSR_HPMCOUNTER9		0xc09
+#define CSR_HPMCOUNTER10	0xc0a
+#define CSR_HPMCOUNTER11	0xc0b
+#define CSR_HPMCOUNTER12	0xc0c
+#define CSR_HPMCOUNTER13	0xc0d
+#define CSR_HPMCOUNTER14	0xc0e
+#define CSR_HPMCOUNTER15	0xc0f
+#define CSR_HPMCOUNTER16	0xc10
+#define CSR_HPMCOUNTER17	0xc11
+#define CSR_HPMCOUNTER18	0xc12
+#define CSR_HPMCOUNTER19	0xc13
+#define CSR_HPMCOUNTER20	0xc14
+#define CSR_HPMCOUNTER21	0xc15
+#define CSR_HPMCOUNTER22	0xc16
+#define CSR_HPMCOUNTER23	0xc17
+#define CSR_HPMCOUNTER24	0xc18
+#define CSR_HPMCOUNTER25	0xc19
+#define CSR_HPMCOUNTER26	0xc1a
+#define CSR_HPMCOUNTER27	0xc1b
+#define CSR_HPMCOUNTER28	0xc1c
+#define CSR_HPMCOUNTER29	0xc1d
+#define CSR_HPMCOUNTER30	0xc1e
+#define CSR_HPMCOUNTER31	0xc1f
 #define CSR_CYCLEH		0xc80
 #define CSR_TIMEH		0xc81
 #define CSR_INSTRETH		0xc82
+#define CSR_HPMCOUNTER3H	0xc83
+#define CSR_HPMCOUNTER4H	0xc84
+#define CSR_HPMCOUNTER5H	0xc85
+#define CSR_HPMCOUNTER6H	0xc86
+#define CSR_HPMCOUNTER7H	0xc87
+#define CSR_HPMCOUNTER8H	0xc88
+#define CSR_HPMCOUNTER9H	0xc89
+#define CSR_HPMCOUNTER10H	0xc8a
+#define CSR_HPMCOUNTER11H	0xc8b
+#define CSR_HPMCOUNTER12H	0xc8c
+#define CSR_HPMCOUNTER13H	0xc8d
+#define CSR_HPMCOUNTER14H	0xc8e
+#define CSR_HPMCOUNTER15H	0xc8f
+#define CSR_HPMCOUNTER16H	0xc90
+#define CSR_HPMCOUNTER17H	0xc91
+#define CSR_HPMCOUNTER18H	0xc92
+#define CSR_HPMCOUNTER19H	0xc93
+#define CSR_HPMCOUNTER20H	0xc94
+#define CSR_HPMCOUNTER21H	0xc95
+#define CSR_HPMCOUNTER22H	0xc96
+#define CSR_HPMCOUNTER23H	0xc97
+#define CSR_HPMCOUNTER24H	0xc98
+#define CSR_HPMCOUNTER25H	0xc99
+#define CSR_HPMCOUNTER26H	0xc9a
+#define CSR_HPMCOUNTER27H	0xc9b
+#define CSR_HPMCOUNTER28H	0xc9c
+#define CSR_HPMCOUNTER29H	0xc9d
+#define CSR_HPMCOUNTER30H	0xc9e
+#define CSR_HPMCOUNTER31H	0xc9f
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
