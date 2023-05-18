Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297D5C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9WE8mIa+ekgPgwYZ2AkTYLuOYBKUWI2kkeIzlwaOPtk=; b=XZnv1ZupQ2WWmKJP4f9zSGYjlz
	0Y7NX8YOsHT3K1Ho4GPgGdKBW9vY417N/DLyzpt5lk6haxh6y4ty9Rn928Fe60nWk4RdxkLoqxcSC
	k+MYB5Wh/5DpdQEtwHR8mNIX6YQyrM5ns/RWs+BEIwXl8MT3+skF6KOOyYRqwiYVOl5cGRzTz6ZVQ
	5p7Fh3yc5GlaIy9/tAa7bzSNm8T18Yk4k1pjiRrA8W1idalkw4oNlVJNL4REeSI85yDxf35nNFYAw
	dNJfs5AdO7FPapW1N7a+zVTh6/0WwQQ1d7MjC8ymR+z7mAcmMneaaTaYDy45hnkxiSR36WlPvMo2R
	M1Cg5gOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pziPL-00DotM-0t;
	Thu, 18 May 2023 18:31:23 +0000
Received: from mail-he1eur04on0608.outbound.protection.outlook.com ([2a01:111:f400:fe0d::608] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pziPH-00Dorm-1l
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mni9MiuIiPGIUr7jISvPD1bkM7SMkmuwVcuGaZN+hBE=;
 b=TZiM6+xzKHkcxgHcVMNcl3IEdQgz9gc2Dr2LS+Fq1BmBkhdqh+kO9jglQ2To3Aq9mr+mLUU+R/mAzdfedNzQh+Z9fVJUcgYUW/2pDdjK0hHYJtcz/osnUJgrRhdlSGWq6pJuPQ3e/sn+K9VHDORY5Qn8c3ZaYJPR1QnxckDvZN6oL8WC0Xf5gKTVGt2XOxXZU2g1E5rJ00+zXX1x/PnimH2x54Q7mVF8u7BTi71he82UrZ97DlxQjyljsbWjBdOwHKjHWm3uGgE3uH6MEC58oHuUMZ6KmgIfnrVN+xKVGbcufrpoQIXHnE7p78H0Oa9kdfbyKoUrNQ0YcXNvlauboA==
Received: from DU2P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::28)
 by DU0PR03MB8342.eurprd03.prod.outlook.com (2603:10a6:10:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 18:31:11 +0000
Received: from DB8EUR05FT005.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::f9) by DU2P250CA0023.outlook.office365.com
 (2603:10a6:10:231::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 18:31:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB8EUR05FT005.mail.protection.outlook.com (10.233.239.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 18:31:10 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 0F62B20081128;
	Thu, 18 May 2023 18:31:10 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.175])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id B19DC20080073;
	Thu, 18 May 2023 18:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoU6K1tv9gx6K0awPShqgov3VMnFlY057cSBd3sJ7L6UKwYdqDpHHdpmcc5VazV2IOiD5IFyxFd9HRK1uHR/Jsm7l3/UwvZyAEq7TV8yopvjJ7+/qkWHWkkcVajbgDdjklreX26J0WPvQIiYUjh/qgfYUjdHCOcRSAE1cwU87tRH2u8jlVFP4tlwInyxIWkwyYnnRFtHI4fwPZtc2DrnfUY4KP1Y3gGkq1WeCxdCDAh2ffzqwX8PRPhWzSVlgu6oBnfJd6jTlaK1ohrVvUgEpRvckPIcbU/OuvUcbWM+lDrzUSf+iKUvCnNkRd/eLQiSWmWrSgsJKKnIYeJv13tNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mni9MiuIiPGIUr7jISvPD1bkM7SMkmuwVcuGaZN+hBE=;
 b=atxYYhzHqc6oDzAlK3fUCdGSl+6CeD6fJswsEwvJ2ETG9Jyc5FPKOH3UMuo7y46uLCiKPAEj4t8uYZRYAhCU36nbzyE75Jp0EOMDAnbGv/mz/LXCeJr64EB+txWoavUepg2crtNFDfAe9/Epwr7R63gnwyTKx0+vxrJhjVznvjWX2eeAZGCjAkTiwWYCZHWn4tO/aG4cKaq9Yt5hxCfiAHCZXLLyLFo9DNG+wIgxO1/xv0hi0OsdGmGk+nM4OZVVB0DnPtcuVFpcHgwvhoQl8kd5Vt/68A/DIHLd1OZAdlv7z3zG4ICEFm+BdYpYVTr7gkMaMoHn50/jge0cKmt8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mni9MiuIiPGIUr7jISvPD1bkM7SMkmuwVcuGaZN+hBE=;
 b=TZiM6+xzKHkcxgHcVMNcl3IEdQgz9gc2Dr2LS+Fq1BmBkhdqh+kO9jglQ2To3Aq9mr+mLUU+R/mAzdfedNzQh+Z9fVJUcgYUW/2pDdjK0hHYJtcz/osnUJgrRhdlSGWq6pJuPQ3e/sn+K9VHDORY5Qn8c3ZaYJPR1QnxckDvZN6oL8WC0Xf5gKTVGt2XOxXZU2g1E5rJ00+zXX1x/PnimH2x54Q7mVF8u7BTi71he82UrZ97DlxQjyljsbWjBdOwHKjHWm3uGgE3uH6MEC58oHuUMZ6KmgIfnrVN+xKVGbcufrpoQIXHnE7p78H0Oa9kdfbyKoUrNQ0YcXNvlauboA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7425.eurprd03.prod.outlook.com (2603:10a6:20b:260::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 18:31:01 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6387.034; Thu, 18 May 2023
 18:31:01 +0000
Message-ID: <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
Date: Thu, 18 May 2023 14:30:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
 conor@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
 Leo <ycliang@andestech.com>, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, u-boot@lists.denx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
X-ClientProxiedBy: MN2PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:208:134::19) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7425:EE_|DB8EUR05FT005:EE_|DU0PR03MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8343e6-d81c-472c-cd36-08db57ce0d81
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  EoEsg9koKbLFQEsCxZiQ7Ys0VldzAtWlNZnp/y7S3JjBI9DDnT2KS8i264+qsoYrJvZwwO3n6UY4PUERPIdqE81z3P6H86kbhBgPJdG4wG6otFSbH6ARYqqjUwSED9YN1gG6mN2XdkzHNmJ3jjwGyl/7bQTFRj24hv7xiibiQx7MOEP1bQz1rUBZsd1oxNXcigrFikYn6mhBQXKJL+iqFND3/emXrDv+HALs9WIUSMSmsffTlL+3my4gKbx0NDjJhAypj/wcy1MD2PGgiIZ0PHg9ObgJSgnl396wuoVYeYe1Ec+rRS+ddFIPAc+fIQ04VbGBlqyOfleM7J7LMpjTJ2wwiFNYlFUXnhfeDBP8zHwsKh9PQc5jEgYTr7Oaz7z7OSyFFyeOuuVf9uY3OaHJd+3y8GP70+87/zzl+0/eunRSiaVHJmHTNjluP4Ktp/jXnbev0iZTn7h/kmdmzsNEB/S1wrdugzEuMA/It75CNrMwafPoq/SIP29qnA2EA3Cv5RD2AiTk7slabDcm2kzgNiqVU3wW61HMPjssInNGV4mFvthTn8aFYja3s8Wxqn0Zfh+eKOl9o84btVV+atS2duTJED07vWdy5//bJ5B/INYrGcUGdPQey5QurAkVlyG6WiTanSVcLqq6xGitc4Lb8t9FNEUX9i+gi6IjvbITn64KTd8/DP1EfwArlNODbtoI
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(136003)(346002)(39850400004)(451199021)(83380400001)(4326008)(26005)(186003)(53546011)(6512007)(6506007)(6666004)(36756003)(52116002)(2616005)(966005)(6486002)(316002)(66946007)(66476007)(66556008)(2906002)(38350700002)(38100700002)(8936002)(8676002)(7416002)(31696002)(31686004)(86362001)(44832011)(5660300002)(41300700001)(110136005)(54906003)(478600001)(45980500001)(43740500002)(569394003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7425
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT005.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	8d2a735d-d17b-433a-feaf-08db57ce07d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Q5iszdJK/TN3LHXeAk1mVQYoavGtajUrm/7Znr/1SOfYuMF0TCNtUujNHI/VgKtOQD4t1u3v5WwXM9pCKQtbgZFiBMI1jEWtEeBUjUHZDICs3YSfzHobcaA3FS3Oy/2SRkxnG7bZGRiTRkqRDVDdi2NeozFEnhksfF52WfoMLr2iT+MP8mW5Mw7c+XSGO/A0REysJ7SkD+vxEbq8Nr5uLxg9sTrnlMsZRqwZm9PURd5vK6zMA4UDSwQGxeavdE1q9390Dl3hbWkVPPJQLd/EqmKcApF2bfKF2JWrK50mLW/hLGTnSJkBwxwSWP5Er9Q+L59JXXdUVKqxR/eTU5EGwEv28sysTty/zhmB6IS6XYL42BbLQooF/L99/vPXyrJkNvMVOg4LYkgWA8a1CFsTrzV2rLF4hsO3fRGAG+kS6dg74yXMKcBeladwHe+oZUN/b13gE0WvNLIc19cbSKmOmH+JNhcEsyrL2jTAoB3e1myb1MBU2sgEUpBtVx3IgaV3ooLjTq9T3q0TEVpvlsP1dAsiy8dliuX5Ido4EZjYFtbp5W+kNnW+ga5vkgaxnfocYfuEgeuslwJn4kB41hj5kWzLzqDPlxqFevIcjcax7WPJAssdl/3oEEempQx3sVjJYvBo4LPaj6Wo2e1+5IPOOGEsOs2O4pN/apXyp0B+KPEyGEd1XJkI4sjUzePbbcvbpV+bZRojuQqU0/rgiwx1GhiIfLPOLZmrNihZW4uD7jJQQVu3NDIC2CFct3I/ecEsAstpjZlDXOraROfQfLtJBDznpeSIhXDoR4K/NoYrOC0S9UPw1o6XK/CgDg4o/zIW
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(39850400004)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(7596003)(44832011)(186003)(34070700002)(966005)(336012)(47076005)(110136005)(2616005)(54906003)(478600001)(6666004)(6486002)(6512007)(6506007)(26005)(53546011)(8936002)(8676002)(5660300002)(36756003)(7416002)(82740400003)(40460700003)(40480700001)(7636003)(356005)(82310400005)(41300700001)(70206006)(70586007)(2906002)(4326008)(316002)(31696002)(31686004)(86362001)(43740500002)(569394003);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:31:10.3609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8343e6-d81c-472c-cd36-08db57ce0d81
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT005.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_113120_112877_2289CF3D 
X-CRM114-Status: GOOD (  37.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8xOC8yMyAxMDowNiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFRodSwgTWF5IDE4LCAy
MDIzIGF0IDA3OjEzOjE1UE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4+IE9uIFRodSwgTWF5
IDE4LCAyMDIzIGF0IDQ6MDLigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPiB3cm90ZToKPj4gPiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAwOTo1ODozMEFNICswMTAw
LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gCj4+ID4gPiAtICByaXNjdixpc2E6Cj4+ID4gPiAtICAg
IGRlc2NyaXB0aW9uOgo+PiA+ID4gLSAgICAgIElkZW50aWZpZXMgdGhlIHNwZWNpZmljIFJJU0Mt
ViBpbnN0cnVjdGlvbiBzZXQgYXJjaGl0ZWN0dXJlCj4+ID4gPiAtICAgICAgc3VwcG9ydGVkIGJ5
IHRoZSBoYXJ0LiAgVGhlc2UgYXJlIGRvY3VtZW50ZWQgaW4gdGhlIFJJU0MtVgo+PiA+ID4gLSAg
ICAgIFVzZXItTGV2ZWwgSVNBIGRvY3VtZW50LCBhdmFpbGFibGUgZnJvbQo+PiA+ID4gLSAgICAg
IGh0dHBzOi8vcmlzY3Yub3JnL3NwZWNpZmljYXRpb25zLwo+PiA+ID4gLQo+PiA+ID4gLSAgICAg
IER1ZSB0byByZXZpc2lvbnMgb2YgdGhlIElTQSBzcGVjaWZpY2F0aW9uLCBzb21lIGRldmlhdGlv
bnMKPj4gPiA+IC0gICAgICBoYXZlIGFyaXNlbiBvdmVyIHRpbWUuCj4+ID4gPiAtICAgICAgTm90
YWJseSwgcmlzY3YsaXNhIHdhcyBkZWZpbmVkIHByaW9yIHRvIHRoZSBjcmVhdGlvbiBvZiB0aGUK
Pj4gPiA+IC0gICAgICBaaWNzciBhbmQgWmlmZW5jZWkgZXh0ZW5zaW9ucyBhbmQgdGh1cyAiaSIg
aW1wbGllcwo+PiA+ID4gLSAgICAgICJ6aWNzcl96aWZlbmNlaSIuCj4+ID4gPiAtCj4+ID4gPiAt
ICAgICAgV2hpbGUgdGhlIGlzYSBzdHJpbmdzIGluIElTQSBzcGVjaWZpY2F0aW9uIGFyZSBjYXNl
Cj4+ID4gPiAtICAgICAgaW5zZW5zaXRpdmUsIGxldHRlcnMgaW4gdGhlIHJpc2N2LGlzYSBzdHJp
bmcgbXVzdCBiZSBhbGwKPj4gPiA+IC0gICAgICBsb3dlcmNhc2UgdG8gc2ltcGxpZnkgcGFyc2lu
Zy4KPj4gPiA+IC0gICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0
cmluZyIKPj4gPiA+IC0gICAgcGF0dGVybjogXnJ2KD86NjR8MzIpaW1hZj9kP3E/Yz9iP2s/aj9w
P3Y/aD8oPzpbaHN4el0oPzpbYS16XSkrKT8oPzpfW2hzeHpdKD86W2Etel0pKykqJAo+PiA+ID4g
LQo+PiA+ID4gICAgIyBSSVNDLVYgcmVxdWlyZXMgJ3RpbWViYXNlLWZyZXF1ZW5jeScgaW4gL2Nw
dXMsIHNvIGRpc2FsbG93IGl0IGhlcmUKPj4gPiA+ICAgIHRpbWViYXNlLWZyZXF1ZW5jeTogZmFs
c2UKPj4gPiA+Cj4+ID4gPiBAQCAtMTMzLDggKzExNywxMyBAQCBwcm9wZXJ0aWVzOgo+PiA+ID4g
ICAgICAgIERNSVBTL01IeiwgcmVsYXRpdmUgdG8gaGlnaGVzdCBjYXBhY2l0eS1kbWlwcy1taHoK
Pj4gPiA+ICAgICAgICBpbiB0aGUgc3lzdGVtLgo+PiA+ID4KPj4gPiA+ICtvbmVPZjoKPj4gPiA+
ICsgIC0gcmVxdWlyZWQ6Cj4+ID4gPiArICAgICAgLSByaXNjdixpc2EKPj4gPgo+PiA+IFRoaXMg
aXMgdGhlIHBhcnQgQW51cCBrZWVwcyByZW1pbmRpbmcgbWUgYWJvdXQuIFdlIGNhbiBjcmVhdGUg
YmV0dGVyIHdheXMKPj4gPiB0byBoYW5kbGUgZXh0ZW5zaW9ucyBpbiBEVCBhbmQgQUNQSSwgYnV0
IHdlJ2xsIHN0aWxsIG5lZWQgdG8gcGFyc2UgSVNBCj4+ID4gc3RyaW5ncyB0byBoYW5kbGUgbGVn
YWN5IERUcyBhbmQgaG9sZG91dHMgdGhhdCBrZWVwIGNyZWF0aW5nIElTQSBzdHJpbmdzLAo+PiA+
IGF0IGxlYXN0IGR1cmluZyB0aGUgZGVwcmVjYXRpb24gcGVyaW9kLCBzaW5jZSBJU0Egc3RyaW5n
cyBhcmUgc3RpbGwgInRoZQo+PiA+IHdheSB0byBkbyBpdCIgYWNjb3JkaW5nIHRvIHRoZSBzcGVj
Lgo+PiAKPj4gQ29taW5nIHVwIHdpdGggYW4gYWx0ZXJuYXRlIHdheSBpbiBEVCBpcyBmaW5lIGJ1
dCB3ZSBjYW4ndCBkZXByZWNhdGUKPj4gSVNBIHN0cmluZ3Mgc2luY2UgSVNBIHN0cmluZ3MgYXJl
IHdpZGVseSB1c2VkOgo+PiAxKSBWYXJpb3VzIGJvb3Rsb2FkZXJzCj4gCj4gQXllLCBmb3IgdGhl
IHJlYXNvbiwgYXMgSSBtZW50aW9uZWQgZWFybGllciBhbmQgaW4gdGhlIFJGQyB0aHJlYWQsCj4g
cmVtb3ZpbmcgZXhpc3RpbmcgcGFyc2VycyBpc24ndCBhIGdvb2QgaWRlYS4KPiAKPj4gMikgSXQg
aXMgcGFydCBvZiAvcHJvYy9jcHVpbmZvCj4gCj4gVGhhdCBpcyBpcnJlbGV2YW50Lgo+IAo+PiAz
KSBIeXBlcnZpc29ycyB1c2UgaXQgdG8gY29tbXVuaWNhdGUgSFcgZmVhdHVyZXMgdG8gR3Vlc3Qv
Vk0uCj4+IEh5cGVydmlzb3JzIGNhbid0IGdldCBhd2F5IGZyb20gZ2VuZXJhdGluZyBJU0Egc3Ry
aW5ncyBiZWNhdXNlCj4+IEh5cGVydmlzb3JzIGRvbid0IGtub3cgd2hhdCBpcyBydW5uaW5nIGlu
c2lkZSBHdWVzdC9WTS4KPiAKPiBHZW5lcmF0ZSBib3RoIDopIEFzIHRoaW5ncyBzdGFuZCwgeW91
ciBndWVzdHMgY291bGQgaW50ZXJwcmV0IHdoYXQgeW91Cj4gY29tbXVuaWNhdGUgdG8gdGhlbSB2
aWEgcmlzY3YsaXNhIGRpZmZlcmVudGx5IQo+IAo+PiBJbiB0aGUgY2FzZSBvZiBBQ1BJLCBpdCBp
cyBhIHZlcnkgZGlmZmVyZW50IHNpdHVhdGlvbi4gTGlrZSBTdW5pbCBtZW50aW9uZWQsCj4+IEFD
UEkgd2lsbCBhbHdheXMgZm9sbG93IG1lY2hhbmlzbXMgZGVmaW5lZCBieSBSVkkgKHN1Y2ggYXMg
SVNBIHN0cmluZykuCj4+IE90aGVyIEFDUEkgYXBwcm9hY2hlcyBzdWNoIGFzIEdVSUQgZm9yIElT
QSBleHRlbnNpb24gYXJlIHNpbXBseSBub3QKPj4gc2NhbGFibGUgYW5kIHdpbGwgdGFrZSBhIGxv
dCBtb3JlIG1lbW9yeSBmb3IgQUNQSSB0YWJsZXMgY29tcGFyZWQgdG8KPj4gSVNBIHN0cmluZ3Mu
Cj4gCj4gTXkgcHJvcG9zYWwgc2hvdWxkIGFjdHVhbGx5IHN1aXQgQUNQSSwgYXQgbGVhc3QgZm9y
IExpbnV4LCBhcyBpdCB3b3VsZAo+IGJlIGEgY2hhbmNlIHRvIGFsaWduIGN1cnJlbnRseSBtaXNh
bGlnbmVkIGRlZmluaXRpb25zLiBJIHdvbid0IHNwZWFrIHRvCj4gR1VJRHMgb3Igd2hhdGV2ZXIg
YXMgdGhhdCdzIHNvbWVvbmUgZWxzZSdzIHByb2JsZW0gOikKPiAKPj4gPiBBbHNvLCBpZiB3ZSBh
c3N1bWUgdGhlIHdvcmRpbmcgaW4gdGhlIHNwZWMgZG9lcyBnZXQgc2hvcmVkIHVwLCB0aGVuLAo+
PiA+IHVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcsIHRoZSBsaXN0IG9mIGFkdmFudGFnZXMg
Zm9yIHRoaXMgYm9vbGVhbgo+PiA+IHByb3Bvc2FsIGZyb20geW91ciBjb21taXQgbWVzc2FnZSB3
b3VsZCBiZQo+PiAKPj4gSU1PLCB3ZSBzaG91bGQgdHJ5IG91ciBiZXN0IHRvIGhhdmUgdGhlIHdv
cmRpbmdzIGNoYW5nZWQgaW4gUlZJIHNwZWMuCj4gCj4gWWVzLCBkb2luZyBzbyBpcyBiZW5lZmlj
aWFsIGZvciBhbGwgb2YgdXMgcmVnYXJkbGVzcyBvZiB3aGF0IGhhcHBlbnMKPiBoZXJlLiBJIGRv
IHRoaW5rIHRoYXQgaXQgaXMgcGFydGlhbGx5IG9ydGhvZ29uYWwgLSBpdCBhbGxvd3MgdXMgdG8g
bm90Cj4gZGVzaWduIGFuIGludGVyZmFjZSB0aGF0IG5lZWRzIHRvIGJlIGNhcGFibGUgb2YgY29t
bXVuaWNhdGluZyBhIHdpZGUKPiB2YXJpZXR5IG9mIHZlcnNpb25zLCBidXQgSSBkb24ndCB0aGlu
ayBpdCBzb2x2ZXMgc29tZSBvZiB0aGUgaXNzdWVzCj4gdGhhdCByaXNjdixpc2EgaGFzLiBJZiBJ
IHRob3VnaHQgaXQgZGlkLCBJIHdvdWxkIG5vdCBoYXZlIGdvbmUgdG8gdGhlCj4gdHJvdWJsZSBv
ZiByZXNwaW5uaW5nIHRoaXMgcGF0Y2ggb3V0IG9mIHRoZSBvdGhlciBhcHByb2FjaC4KPiAKPj4g
PiAqIE1vcmUgY2hhcmFjdGVyIGNob2ljZXMgZm9yIG5hbWUgLS0gcHJvYmFibHkgbm90IGEgaHVn
ZSBnYWluIGZvciByYXRpZmllZAo+PiA+ICAgZXh0ZW5zaW9ucywgc2luY2UgdGhlIGJvb2xlYW4g
cHJvcGVydGllcyB3aWxsIGxpa2VseSBzdGlsbCB1c2UgdGhlIHNhbWUKPj4gPiAgIG5hbWUgYXMg
dGhlIElTQSBzdHJpbmcgKHJpc2N2LGlzYS1leHRlbnNpb24tPG5hbWU+KS4gQnV0LCBmb3IgdmVu
ZG9yCj4+ID4gICBleHRlbnNpb25zLCB0aGlzIGlzIGluZGVlZCBhIG1ham9yIGltcHJvdmVtZW50
LCBzaW5jZSB2ZW5kb3IgZXh0ZW5zaW9uCj4+ID4gICBib29sZWFuIHByb3BlcnR5IG5hbWVzIG1h
eSBuZWVkIHRvIGJlIGV4dGVuZGVkIGluIHVuYW1iaWd1b3VzIHdheXMgdG8KPj4gPiAgIGhhbmRs
ZSBjaGFuZ2VzIGluIHRoZSBleHRlbnNpb24uCj4+ID4KPj4gPiAqIFNpbXBsZXIsIG1vcmUgY29t
cGxldGUgRFQgdmFsaWRhdGlvbiAoYnV0IHdlIHN0aWxsIG5lZWQgYSBiZXN0IGVmZm9ydAo+PiA+
ICAgZm9yIGxlZ2FjeSBJU0Egc3RyaW5ncykKPj4gPgo+PiA+ICogU2ltcGxlciBEVCBwYXJzaW5n
IChidXQgd2Ugc3RpbGwgbmVlZCB0aGUgY3VycmVudCBwYXJzZXIgZm9yIGxlZ2FjeSBJU0EKPj4g
PiAgIHN0cmluZ3MpCj4+ID4KPj4gPiA+ICsgIC0gcmVxdWlyZWQ6Cj4+ID4gPiArICAgICAgLSBy
aXNjdixpc2EtYmFzZQo+PiA+ID4gKwo+PiA+ID4gIHJlcXVpcmVkOgo+PiA+ID4gLSAgLSByaXNj
dixpc2EKPj4gPiA+ICAgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXIKPj4gPiA+Cj4+ID4gPiAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IHRydWUKPj4gPiA+IEBAIC0xNzcsNyArMTY2LDEzIEBAIGV4YW1w
bGVzOgo+PiA+ID4gICAgICAgICAgICAgICAgICBpLXRsYi1zaXplID0gPDMyPjsKPj4gPiA+ICAg
ICAgICAgICAgICAgICAgbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4+ID4gPiAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwxPjsKPj4gPiA+IC0gICAgICAgICAgICAgICAgcmlzY3YsaXNhID0gInJ2
NjRpbWFmZGMiOwo+PiA+ID4gKyAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFzZSA9ICJydjY0
aSI7Cj4+ID4gPiArICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRlbnNpb24taTsKPj4gPiA+
ICsgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbi1tOwo+PiA+ID4gKyAgICAgICAg
ICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uLWE7Cj4+ID4gPiArICAgICAgICAgICAgICAgIHJp
c2N2LGlzYS1leHRlbnNpb24tZjsKPj4gPiA+ICsgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4
dGVuc2lvbi1kOwo+PiA+ID4gKyAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uLWM7
Cj4+IAo+PiBPbmUgZG93bnNpZGUgb2YgdGhpcyBuZXcgYXBwcm9hY2ggaXMgaXQgd2lsbCBpbmNy
ZWFzZSB0aGUgc2l6ZSBvZiBEVEIuCj4+IEltYWdpbmcgNTAgc3VjaCBEVCBwcm9wZXJ0aWVzIGlu
IDQ2IENQVSBEVCBub2Rlcy4KPiAKPiBJIHNob3VsZCBkbyBhIGNvbXBhcmlzb24gYmV0d2VlbiA1
MCBleHRlbnNpb25zIGluIHJpc2N2LGlzYSBhbmQgZG9pbmcKPiB0aGlzIDUwIHRpbWVzIGFuZCBz
ZWUgd2hhdCB0aGUgc2l6ZXMgYXJlLgoKV2h5IG5vdCBqdXN0IGhhdmUgc29tZXRoaW5nIGxpa2UK
Cm15Y3B1IHsKCS4uLgoJcmlzY3YsaXNhIHsKCQlpOwoJCW07CgkJYTsKCQl6aWNzcjsKCQkuLi4K
CX07Cn07Cgo/CgotLVNlYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
