Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA06CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHqCFxSqmJQPiTfYNHQYVUV2Z0HClyKToVbbVd0facY=; b=k7oRLK0oINvh+E
	5N5OKykX7eLYzE8mv4VFA5t+Q3rzw+RcZDiaNqjLC3w7+mKwpeGWEHanzReava2SyNybt62bGbNNP
	zcXWRhrUJppx6ixSDRdRQT0Q4I5VZIv4q7N5tx0D2IxmpHE8RT3inbDVAMeUw/27lXUynHD7n2ED4
	oLAqUWT5D113RdatErXB8DcR6hsH1Hd9R2ITG4+VtIIzAw8m4C2XMGrnmQg63q7LhuwdizO0zbi32
	v372+NXL2VqEvo0JEuv7TnfJiu7w15BCaegFWaqj1Df4slawdubMkt1Z6UtG0S0u0Olx/JVwnF27T
	UdWtQ/SSGApaCabL8c6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFoZ-00FtvU-2v;
	Wed, 18 Oct 2023 23:18:59 +0000
Received: from mail-bn1nam02olkn2082a.outbound.protection.outlook.com ([2a01:111:f400:7eb2::82a] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFoU-00Ftu6-2v
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 23:18:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPQy9SlJ3X3/J3EHsstQvxHFfEavZylp0slfWnXyZE5uWTfRPDy4NSQpBe+KSq7ENyP52kPwtWCwwpLymhzk73ZyQOe+Geqla7x+PKSColZBwmfAG7dKFJwM37t4Ga7+ZELNSVjCLKpfB32cnAKU1+bHfq8EKNXENoPvn/jE8tMFaI3rzJcDkQe0AdPYWokCTVEIDSZDPOHiM6i3enmr7oME47j3hPDLCkcQb2EcDSB5xlY5HrfnsysOnwRgMtwFCbcYsWQclnwIWgjMNMXDpIwGh0LHNhhVaiYO1YQTAiifIHgJZBgJbmUOUQ60V0ibVSUVLYTdG4tA81r4MxAdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeYWlTYaJOGIiEWkZu5rFXcX7Q/TSa/S03ztRgroNyI=;
 b=eT9OSrhKRaOHq7YpyQKHgVfs6/bCnby0p67ILPTTnrvgi13LEMQ39kg3EP318WqEMZdzcBNiFtkUCTj2hnlr4yHg3Zunrkg7bCLPOA4VFiZF0U43gYPbzVwR8QMP3fkBpQHEOTcm49JdlYzGK00jL1wqOEHa5PWjrxfUYCiWELjFQ6WZCOYhGxQv0RE2SuZFj55ni4/uNB9qoT7/po6lgsU3jqm4N/XwOSgWW3yeOmBW9Up12PrK4Ap3X2jV5hcH6vLe/TvJpe763EMfnY0w16uaIfwlXL4y96NGzUsByZb5+3j9Bh/PO3y//g5M8ip6L9taHuCs5l/mBFjPGB6FGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeYWlTYaJOGIiEWkZu5rFXcX7Q/TSa/S03ztRgroNyI=;
 b=CW8XLf9MHyPdyCFqyGnAqsbZ44zGbbMNmp1YSnUSpg+8P7jep6ifPRJo71+Omb2DfxCWWE6sC4bxJn0EhGDivf6FDcKQvbcsUc15uP9UPvP3Yqfxu6CWOnbBpZJim1xCtgsTlThBQlIVux1TMTNQJk+C/8Hw5ugyCZzhsSgUr2mQWlhK4WGTv4buyLgMzupaxqKnO8eweNNNq+ZS6W0a+g4uiIX3VkGE9ZUjgJHWphIpIupk8NHY3F8u4bBuYDOgoSHReHksgo8a7u0JFdbq0OwAuYeUXUQTEuchPZkBxlKh209WWaTrFbnHVQMMeXRlZMMjPNCLP03o3uSBi9+e2A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DM4PR20MB5087.namprd20.prod.outlook.com (2603:10b6:8:8d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37; Wed, 18 Oct
 2023 23:18:51 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 23:18:49 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/7] dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
Date: Thu, 19 Oct 2023 07:18:50 +0800
Message-ID: <IA1PR20MB4953F1FCAA05BE0C3563C0A9BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [y9B9I/G15ojI3fGqCG27vtUp9TDoQN9tQpOex+hILlg=]
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018231855.28472-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DM4PR20MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 72453cc9-70de-4aa7-8631-08dbd03095d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUtjrwI61rr2Z71KgMNUOPKTzK3rROMF0IaaEte00dRogcEdH0wkL5uYk02/2k4P0x8bGnRCWWLVI+5n//6cJRp9hr48kPCw6bO4ugQhI/z6YHxha1tnsD2LMmqK5MtY6wnmg1gvV9fJrNiG/+nurAM1fhT8kWvFr/LNrHW9BKWeghNKz3R1mnLtuRUiCqHSTG+q2WkeyfrYnKS4lHBMorAkUtup7UybeOycJKYeBbtw1t3kda5/wF4BwjftoPzlR8vMB4MvJ1F6Q3whUUC3/zMbsgXBfimLtf6ypNU40qInv5Hqj7Y7s2pTnunlZW5peQkz+zddf2TV0jv6aYdTODfGG+ZU2k7YzVThdv/9GguQfriTKG6RovuxLNqCQaFbdBgw+ZI7+VE1c2eBxOBs3ayD/QKHqbwFLLUQCk13aizciuDyvCgIwT5i6gfYPR/Ih0MRDGlOJbLs2okpxxmu8kYwskOhR+D6nDjVSlPr5oDf/auam7YSr679edy7B1zH54dg8GBuquzTpxeG/3AD0MMLmuO8XDVOL20XQuXgy5Z7aucakRFqmB0lQ+7srY+D3Gynjxp17bmh46Mx+TyQZcKQCLhaSE85Z+8RJeABpXSLF8P/97piyV9NR0MHnhbanBPY5uURKmWdIRWXI0qP8/tkfSnjQgDUx2As0wnFndE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIsMr6qU5VjSiDa+eShwQ9LLM2WeFn/b5D3UNlrzY+KvqeXSGuS7L/oVorN1?=
 =?us-ascii?Q?4zbF4292s0n3gJomeonhCAJcyzy8z6kU73rZxLiMf1UPsK+1wCzGcgOHXIAe?=
 =?us-ascii?Q?XXUhwafLHsVgUITvEUmtaiqTvR11KvPTndzFq/ws6agwzkGCmSeGlPhAYkkc?=
 =?us-ascii?Q?3lPLu+00YTlPcdr7/+TAkVxfUyveIIbSc2mabhhHq8JXCjcI6+w9RHybUYGT?=
 =?us-ascii?Q?U04Bo7jXItWpgA768N1rHCwsUwf7kXvUj4egvD4V9HpNpU//vwK6rC2OcnFI?=
 =?us-ascii?Q?KL0Cy4Qcg/h415iH3V+WV0VrUJH5EWcBdDuZ3DC1O3gvEvHUHkN0Jr5AawvS?=
 =?us-ascii?Q?MK4P7NsC1DylELBGZv6mOhX0iahlh6iXDdXtwHa87A7rvOS/PQhAWA48oi3+?=
 =?us-ascii?Q?xBS6/t67GBM6YTTmT8eYrYH5ChrHb9pZYw6eTb3ZSbIyMy1ifvLmwT5Vva0f?=
 =?us-ascii?Q?IOxfBQqynG7QM7HjcWRATkMIidI5HHkofnB9CsL8Eho2WmG7qVyOmVY3A1qy?=
 =?us-ascii?Q?FUbsPyLiHqkCzw8Rm+RzrIvJqsdC3uNXkIU2Xv6brGxYkm3bHin4yeXFvqS/?=
 =?us-ascii?Q?xr6bbEq4PaXbqu7fJX+y42wav3S8OWQB5ov0WGU77oYueFysAXSB/KwHIVha?=
 =?us-ascii?Q?whlxEoI5j8n+B7He2XH6Y1Q89ZCtMa+fw6dhE88qt5dV+Z6CvB3HWBXSeyU8?=
 =?us-ascii?Q?4vTimjD3KiBqPSR1EBhz3lLgmuFhtRYZsSTdk91QMk8J6ulFV/n2vtXnjRaI?=
 =?us-ascii?Q?c5+KtiJWY2mWQE+7LIAOKDUUiEUIU6tefALPduaE60+ETvH9PgNVABa1c1up?=
 =?us-ascii?Q?5A9Lpb1yOTNJT+j8Iz9XVkiog2xU5L7enRpeQq1wXYxH8ZSUyztIQnTNwJFq?=
 =?us-ascii?Q?2216+JYGj6U6QrDfDAzRBjnJl9pNlmUWb+YHyyfoJB17lhAzY5lHZZaDrMi6?=
 =?us-ascii?Q?JS/8zLT3N9GK/z6NNfdiVA6iu/38JV7OHfdDS3WIVoEekvaCAUUZQGqiRzaj?=
 =?us-ascii?Q?BCDdCRxI5bnmDYrumIel+gdTtezdiR344cdHVzdg/Zjv7QNick0hyLqmd+Ja?=
 =?us-ascii?Q?n8VOR7ueiBW5rE7yq7Vhkms91gA9zPElYu7M3FEcHsKPzy4Sv5t7UHL3otMb?=
 =?us-ascii?Q?IcgNdjwZK765FHQsx0Px15T4uybR4COBRcIdnq0zrM1z5jDFO9hR1iI62Koi?=
 =?us-ascii?Q?kR8FZdwOnNLp8jyetXOgopDfiTLaa3KTf0Eym0UcFlLGmgCKnnyK60e2Gcc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72453cc9-70de-4aa7-8631-08dbd03095d0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 23:18:49.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_161854_948636_42DD11A4 
X-CRM114-Status: UNSURE (   7.06  )
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

Document the compatible strings for the SOPHGO Huashan Pi board which
uses the SOPHGO CV1812H SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html
Acked-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 86748c5390be..9bc813dad098 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - milkv,duo
           - const: sophgo,cv1800b
+      - items:
+          - enum:
+              - sophgo,huashan-pi
+          - const: sophgo,cv1812h
       - items:
           - enum:
               - milkv,pioneer
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
