Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA4DC77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7hBiW8QNv+5mgPbi9Pz+OJtj/qgPA5keZynIwd1Di4=; b=EAi3aWxlGerUuk
	wQqBGoq9slfOdePjW5MXSHZChOeNx6wNCiqhv9XcqO983zrKx4LoVEFLFU7HnxybagcPKbXTVEU7M
	ToUX+QywbG9BZxZPPXCUDyRn3QhGVgcZKjK0MbshZWd5Q8ca+/8vK9GtfgXz1Pbd7jmuMEQsnho8i
	jqj6UZOtSP9WAU+Hzp4Z5RFhZi7I7/9BHswr0GC49g5Olznx29O/XNoLtuA/aowbZTJno6y+5WQui
	OnnC4AsA3CHtN4fPM9rZvIWSTRJbCGRZJnyVgVJda0EtOo42w7eQFlYPHMrDKWxs05sFepGPvzwcw
	c5O4k4P1CGsNn7LgQelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0UJ-00864j-1Y;
	Thu, 11 May 2023 07:13:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0UI-00864W-32
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 07:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VzbtLgPz/foJPeDpIxv9Q1l6mjWc+hC52ufmoRs+F+M=; b=b/Oh+Uh1DiDzDvcR3vTpuaDe5h
	sx65hr/hU4B4VhMf0gI/cnvigO9NVuESKPYOD/7C0P+0wJKO75LgM7haK4XaIm2HJ3LlnlUQNk+YI
	cuowBGbSzJTkYMEygKqP/zOFYPGnJr7kyN1x0GHHg5ljVENZMEKDg0SP0SoynCo9CGcjVQM6f02ue
	ULoHvQRDDi7hBe09Ec5e51KjYeR5/omQgvtUOR1ZD+HRiDvE9INDhh1PjZZH68J4XDSzhMx/kntK8
	h7fC313mtT4t9nQZEBKPkPdMOHAt5q04hSJa0lBtP9PNNAgArlPxQeH3ZfXzM50iQPiT03I9wnZac
	PNfHInLw==;
Received: from mail-bn8nam12on2060a.outbound.protection.outlook.com ([2a01:111:f400:fe5b::60a] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0UB-008AbY-2p
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 07:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr4pTIPHPs/23v5A+EQgqYIcfiAinwFS0g5Ae1KXhdRwQTnk3lEvpUMBtwnMiQczXj0OAk08fPqLcUSx10qcK6B7P/00vwtazn81BBfXA+Dqh2rq6jAMl7oesg9dgmbij9roC2wZ4EZaFtLzKua+RF81YjLxkzAaIdyqNtLHwr1px+8vSjOlCBXuX0O+T75qVeauLQ5VsmEMLo7IuAOdqali/mxr8uonFPyUefgGvalWNqW4wiWP9fUruEm4crB/yrh94JWAeYJdBp2DryR/DIMJv5N2dW4DDBiXB3yBxeQOi2Ec+vi7ra6OPF1aTgsQU6IntvN2P2bPbEcudMph5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzbtLgPz/foJPeDpIxv9Q1l6mjWc+hC52ufmoRs+F+M=;
 b=F0S6wuRVqSBFM9hz+BMkDTwe9czF6CMsu2ayG9sDnOazlUwxTNRDqFlVPlBeRrubLgY5kxeYODOkq9csDcamS1hVwElT85ZvhSVU0DHJbG2rpM016Uxd3r529WOW/WMZUPyyYxgc5fLKktLULiiuA4EXS22d7YHXwNae5Ti2po7PxovTfhQbUCKuhh/B8nNJVYJ+DiTVpkEwKILYFrc2zbhsTFhag/wZy/Dx/5mKTwiiY7eCA73hGNkdc1SOLggyblwSeQjyxvIfrU+MZUWrGjBiW4dvyUjdA/5MRnQbJAPdW1SRl3z+9Zj4Uqs0bnof8z+g9bujLSIhCWRcKsegvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microchip.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzbtLgPz/foJPeDpIxv9Q1l6mjWc+hC52ufmoRs+F+M=;
 b=qwLP4gvsCx/NJA7136kxpPexzu9zplG0dtI5h/WyJTSZW+6ct2FUNP/UHpWkznL3Xjpeb5u9iD5PW45QicHDeOJmodmDGbhaOIFIbp+Bninm4oPxXVl9g20CzshsV1DYdlBYPyI/hh9TbsmVRQfw7MgI+B0Lxl8Ib1Sia3agR2E=
Received: from DM6PR13CA0045.namprd13.prod.outlook.com (2603:10b6:5:134::22)
 by IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 07:12:25 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::91) by DM6PR13CA0045.outlook.office365.com
 (2603:10b6:5:134::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.6 via Frontend
 Transport; Thu, 11 May 2023 07:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Thu, 11 May 2023 07:12:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 02:12:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 00:12:24 -0700
Received: from xhdpranavis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 02:12:20 -0500
From: Pranavi Somisetty <pranavi.somisetty@amd.com>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <richardcochran@gmail.com>, <linux@armlinux.org.uk>,
	<palmer@dabbelt.com>
CC: <git@amd.com>, <michal.simek@amd.com>, <harini.katakam@amd.com>,
	<radhey.shyam.pandey@amd.com>, <pranavi.somisetty@amd.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: cdns,macb: Add rx-watermark property
Date: Thu, 11 May 2023 01:12:13 -0600
Message-ID: <20230511071214.18611-2-pranavi.somisetty@amd.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230511071214.18611-1-pranavi.somisetty@amd.com>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT052:EE_|IA1PR12MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c70ffe6-cbe8-493d-5b48-08db51ef12a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sWKC01KHro2nEDyic2qEHDFLaE9ET31jdw3ZmUtvj/anVcOj6o0c/q8Z4iM9JyV1Q0usOxK+3OXOIKG6tc6yckqdAvDne5ufEAHGnJDn6DlPKCRWPWrAPE96au0SSR5VGmFVIeUxa0WCK6V2P79yMflIUv41RUEs5nvI+fHd3deG5ht0OjAILFbQf7273B0e4Gh5umCB67b5LpBAfWV4kSJlSZ2ALMEfdGUkCavGThnUYUMv2OQdDRkR7ur0gsaofw3G5KX0HcAmxPmS11oT9l6w8RKl2TfS3YQsotPTI7wZG97TgS+FN2cUeyjl39VnD5Liitk1X/0DmFgIQLpu0h14rOcmSrkC0XNuDHcusKZFg6CTlSgpC91NSN0mJznTbmHDq0PJWHnzfSwo0G9mMFiRm2ZBmc4u+0grWi5AWWojTRaUyO41LScI6BHkSuhuln7e435z8Sdz/XfAl9Dl7yCpixKIcoTQbsGq7sSfRXNowaIXW+WBQ68zPVs5okJTYzak4o2TOPwzjAP9l7sVbW40j8XgEmYAmTQMNca3JTqNGpLfDJC+JPpz9o6r0oQqmwn6jEQUN9+Fq04nyB1sOduKqe4CRgR8ov1Us7Wq2LWS4zl3AGEgZcqVDBOqlRLEj5xT2IcJWybxJQ8tGQm19LP6MhxCSmvGQ5ZExDcuXnYFomQLNip7hzxjnzJng8FuBXSXi7FA8Ug3SMFSlX+xPqlBK3mCYyTupzYGKpP8nBIyzwXS92bRr2aRTdUj8C+8nHUJyHus1pbLKfF3EeZdQA==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(6666004)(41300700001)(70206006)(4326008)(70586007)(40480700001)(1076003)(26005)(110136005)(54906003)(316002)(478600001)(8936002)(8676002)(44832011)(5660300002)(40460700003)(7416002)(82310400005)(2616005)(36860700001)(426003)(336012)(2906002)(47076005)(83380400001)(82740400003)(81166007)(36756003)(356005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 07:12:25.3939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c70ffe6-cbe8-493d-5b48-08db51ef12a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_081313_026888_C73E9494 
X-CRM114-Status: UNSURE (   9.82  )
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

watermark value is the minimum amount of packet data
required to activate the forwarding process. The watermark
implementation and maximum size is dependent on the device
where Cadence MACB/GEM is used.

Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index bef5e0f895be..779bc25cf005 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -109,6 +109,13 @@ properties:
   power-domains:
     maxItems: 1
 
+  rx-watermark:
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Set watermark value for pbuf_rxcutthru reg and enable
+      rx partial store and forward.
+
   '#address-cells':
     const: 1
 
@@ -166,6 +173,7 @@ examples:
             compatible = "cdns,macb";
             reg = <0xfffc4000 0x4000>;
             interrupts = <21>;
+            rx-watermark = /bits/ 16 <0x44>;
             phy-mode = "rmii";
             local-mac-address = [3a 0e 03 04 05 06];
             clock-names = "pclk", "hclk", "tx_clk";
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
