Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E280EC43211
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcX7bkqtBTHqfKOBNWjEBPls2igmOBXaMBIdeAwY2AE=; b=gdxDcsRDcoerzR
	2AW1UvbGM7HsQI3CpS9CD8TcPx9seVqygmYIoPx7Cob1M+r2FUya/giFfTbrZwyn4s02doz0hcTNL
	nATH9up9Yzzyuxw195OdnMs5dm9ItsqOODjEl5caul96eIIDRp1m6RRay+YcIVJ1kjBPL1Hwu7r81
	NNG7pXE+qsqLJCzlImXcufGeIPKlvkWnnHx8issGnOx6AhflcPyTs4UO5NqGNXE1kRLm/IDmEUrFL
	IB/rsvxbP/yr7vyt8EsPoc5/eRz7yJuDFrv/Fjpv+MYk5zYVulSQuhiPLm+lc6StL6uI7wPE8QRYl
	mDwjiOogB/eoybmVBasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAGG-0000000Bh8l-2cv1;
	Fri, 26 Jun 2026 17:22:40 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAGE-0000000Bh8O-0EUs
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 17:22:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHIpjhvy7x9fP86PHjaXDC5o0oPexERGk20cbYtF9AYrmapqipUaFH3yz0z+7W5dbESR33rx3qDSUXXu9H7tUX8MPzQGwK3LtUumQIVVp81+70hBg56h819/eQRuMIiFdDF/nCkNaCnxFgarEuLFb9/4xPWJgV+HusgmAGbZY0HpovqZtF3SJ2mu0n1e0t6kerc21Vgk99jTgEPh/imItY5TtUQBg9vFRzwRhXIEu1X3u3wpSwML6TsiLKNPWNMJglL39fHLQMsRromV0sVObVdFW1bCBDx0oh65rt2KnlffjDJio2g4ELKDaCilCUXbiAj2nfn4TzZXbG0CAC3FyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V38SbF0g7t2PkjMXUiac37EYcQXuaFRtWl9+c/JaXmM=;
 b=c+n+EI0CkREJ2NHfnMHobWjik/yWl2njey/estai+dcHFCcBI/tvXYIqv4JQjOyW7H6Mk8DHy7+dMOIlCKU6pPrksyCn8GuSr3REolht/pdtUTLvZ9eOdCAkP+RvvlxnP1n52SvEC5lmSPM9r2n08RHFbkY1OKBTqAda6HGDrL8Fom+082jv7tDoo0svfkgbivg+PXeU2j6xMrVujfrrxQgt1VJdmlqZgimrrV3t3vF0p5rdccKiVYuYxiMZfsTGMDVhMvLLTH8FSflaaIRi35ratLscfgBboy0PdLXMTksKc0wgZJVoF1B6ARShZLGQXWeN1rc9ILh7b15WMA5Xnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V38SbF0g7t2PkjMXUiac37EYcQXuaFRtWl9+c/JaXmM=;
 b=k1qpEBA1U21TMtcnv8ahqxVtNKfjkkAObSKgWm/jJykwscOMsTpgIn7P3ffZVA+sVz3CkXDY3a7HmUukOZunUNt1H+n76TMnrXtG6JdTc2BT+dMUCk87hJoHPXQH0HPEmGpiHHBH6XZZi9uPkKMf+xz9OFA/5DUspWplsV6moeiqVBThI+Nihx1Tb9peWibMXt4BCIqnvSsZtAtJCL1ybk18z60jUJ5fh6VPaJQC/IAzAB5Y/rloTEMDEMJ7Xm4Qz5PyJxlJFxp0YDRhQ4LpyxHjEKPg6jBsnBGl0fRZe7VNyna1ksJWJavvg3ZuRVwVm500UvoNcfOs1nYcgoJ5mQ==
Received: from SA1PR04MB9851.namprd04.prod.outlook.com (2603:10b6:806:4ac::5)
 by CO6PR04MB7827.namprd04.prod.outlook.com (2603:10b6:303:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 17:22:32 +0000
Received: from SA1PR04MB9851.namprd04.prod.outlook.com
 ([fe80::5f38:dbea:4e4c:9a0f]) by SA1PR04MB9851.namprd04.prod.outlook.com
 ([fe80::5f38:dbea:4e4c:9a0f%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 17:22:32 +0000
From: "Krishnamoorthy, Saravanakrishnan" <skrishnamoorthy@rambus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Albert Ou <aou@eecs.berkeley.edu>, "Ousherovitch, Alex"
	<aousherovitch@rambus.com>, Conor Dooley <conor+dt@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob
 Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>, Alexandre Ghiti
	<alex@ghiti.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Wittenauer, Joel" <Joel.Wittenauer@cryptography.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Shuah
 Khan <skhan@linuxfoundation.org>, SIPSupport <sipsupport@rambus.com>,
	"Nguyen, Thi" <thin@rambus.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add Rambus CryptoManager Hub (CMH)
Thread-Topic: [PATCH 19/19] MAINTAINERS: add Rambus CryptoManager Hub (CMH)
Thread-Index: AQHdBMjX0sP83ggvF0CeFOOuih+57LZQq7SAgABqWVM=
Date: Fri, 26 Jun 2026 17:22:32 +0000
Message-ID: <SA1PR04MB985196991689AF3F3DCD349BC2EB2@SA1PR04MB9851.namprd04.prod.outlook.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
 <20260625173328.1140487-20-skrishnamoorthy@rambus.com>
 <20260626-lush-eel-of-election-5fcbde@quoll>
In-Reply-To: <20260626-lush-eel-of-election-5fcbde@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR04MB9851:EE_|CO6PR04MB7827:EE_
x-ms-office365-filtering-correlation-id: 73c1da11-c52c-41ba-acbc-08ded3a781a4
x-ld-processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|22082099003|56012099006|4133799003|18002099003|6133799003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: Px7QMnRUpS2A1MuapQ4aPLWSTkq7DVRDJQG3dMRp63sXqW/b+TbiOdusGQP7s0qdtoHbBeQWRvfSY5t82gHDtZBUvmmO72sHYMMaTORl1zQ9r81wnQdXhy5+atGoHqygAAeVPYQoEWwck6tfuDpDI0LvFsmqfcLQSNKMpgd5GqKkEsDoJk4DTl6lX/Dq7OhjJxRWjZWKhGTPCXzbZWY48Fw2cpqUUS9EMZIqAXjzLI1cJH9JkyyeH8PZawS9qTtFTDdQHD3EF61o5F+unghVgGMBnpGfa1XvO6tDWn4AlzDN5zEz4bqscZ5ZtR1O1cp2GcORl4MwTM7NzE04fNWw9S1NSZY/gN6YdzEBlN0R2i2pqxpK1pOf20KswYU2w4uMiYBjRPnbQXs4QGVbecXHwOOCrVYGM26m8pxoCUDhs/U/WMMTvrDG3pmrsx0rnHCLcQ2E5q1kH3SyVJQmYycL3K6skCLsUUYWI657dOxWW2rsPgyT4whj+yPMt6HP/3xwkNl6c8FG3ASeHhkAaP1ugxoOIAp0kNu025ckt1QILtsFwrI1L3VO6Ug6tMFo2nJIZNzUQzBOfPUxMvG5BKOh1xsZEVk1X3U+riHwxgtbnuOqbY8PRLNKoNDph7Lgl94Lv1CFAp8OatUBgLbT6NykDXh0bXFxfVyS3EwhSUiuptt9nO3YU9ly9Px4t44z3+GKOW+SSqcXlx1MUHB5g6MKKbSWCVXhdQ1DNQAmxZWHHbU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB9851.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(22082099003)(56012099006)(4133799003)(18002099003)(6133799003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4g67V++jPJNHJMqdwa7jER1/ZgkPoMQB4/+0VY4SngzovZvMWfAqT+nMYWCb?=
 =?us-ascii?Q?VekwGilKrpCIy5fbJq7BRbafrs8/QE6yDuvQlHno6fXcPFcvC+PosTHO4lc1?=
 =?us-ascii?Q?4lF2qYnBNYSBN6uLsQXgNW6hfrT4DGE4m0hdcqTVtBtB5QzQYHyCcTQAP11+?=
 =?us-ascii?Q?qp14V27FzncepVfDKMVFWO8gYNquGuUjc5IksobzCl5YjkxZTTvrolUUUFr/?=
 =?us-ascii?Q?XvkfngL705rePDQOy7Q4lzajazKhvc+R5l/dDkH5oJZkldMTVZifq0xIW6W8?=
 =?us-ascii?Q?jL7r3rC6iDoDTCvtS376ZmeqRKB1qfQixUj1OX4SaTk4UsC+qgZOqDY0Ab46?=
 =?us-ascii?Q?+SRQn3KMXeuLQkwPaOaCvYoZXloGpvvNbhTom+nLOo/W/hYVl0krQtA6sQ+l?=
 =?us-ascii?Q?5GkqFYEamjc1VN8HZ78AdiEc+UPzgcpSdNQsb7DP8z6Qc8nLTwUplkmJOXPo?=
 =?us-ascii?Q?0+w2Sd8JyY4yWbtOhY1AHjRxtNTLMfIaga+EygfQO+2ESrfQErClHXGQtQlJ?=
 =?us-ascii?Q?kylvc2fLdD8POk0Pr/vN3vABO8CRV5AChdOUlpks/e73O0xx1HUM1eQKCHDj?=
 =?us-ascii?Q?9FxAN8hqan1fB49Ik1pOWDKl5Ck19tMJ1dsh4z9iJ+gYkw5leGCDEjdLH76N?=
 =?us-ascii?Q?vsbkjzG9hhHflMTUwhMsAy26X85xVjo/x3bVYYWGJiiZdy7i/4ts4CcL8aH4?=
 =?us-ascii?Q?aCkw3zd4tkr67V+y6wN2e4EjyulRmRhdc28BxauL9empIiHJOkUZcAWTgCmw?=
 =?us-ascii?Q?YR1dnnuRbxGpipoV9zsJejugr4lxN6lXXLBWgCjX6L4hGcoCM7OsE2sfZKip?=
 =?us-ascii?Q?RH+a18WOkVcXux/WH7wyD/dXDrnoJAE90ilsEwcs2V7+4+TGwO54Mpaa6KfZ?=
 =?us-ascii?Q?iFWAUmPGnMVVNfP0EDmBqa4nmch5BB/hT5anIDCBqBHOKHuK9Y5wlFBOR2P2?=
 =?us-ascii?Q?YDrljNJzxyT6s7uOsaLLG9N+eFoadwiGmazx5Ezym6NpR4tJsDMdgtTMIEY2?=
 =?us-ascii?Q?T3nll8GmwhuXBjgLlsOS9s42rrgMDjeA3YtvwKzXVy17Y4pfFCdA9fVMh2Vl?=
 =?us-ascii?Q?YMFgHRa5fU/DM7KiInaBJokM/FaeNdQaFn2GEtX/jZvkProcMBn6g8uTmIWO?=
 =?us-ascii?Q?y4C25YgQZ6wesTIyoX3rlYXupS+weBVEEI2BNC3m8vCFQMWLlqU41jddY+YY?=
 =?us-ascii?Q?OvXW2K4PMr0Nesv0S6RRfFSTmkJlml+kxIoefO53794RI/nN8jPnQpC9HFKg?=
 =?us-ascii?Q?XSRQBjLdfzZpfVDGpAhiqMldMNNZI5cuEtVBUaFXANdnYogJgpeYvRR8Txjw?=
 =?us-ascii?Q?731Oj9tV8mOE1o8mDkSfcHXsx9C6mjzeqm04j0zwChlBgwq8XUuPHQ1x2sG6?=
 =?us-ascii?Q?i4jeO4h3SD0rLr+TDEEQoUHLFerZDuqGuNPv2w2kjHLe5U25QY83FwhURdDN?=
 =?us-ascii?Q?dhSOB31ysy/pJNgAmtceozfaMcjjzDL/NcQAfW++BSqjM09IfbqUsncoXwF1?=
 =?us-ascii?Q?/tc4Lws2UbeVIpTPrV+UbAIVCUM/wjX2i4EZnwdEOAlkN6fg2e1Vk0y9DNer?=
 =?us-ascii?Q?gbV8iEEKFn70OvsOjXfKc2+AQ9EtEV6O13POSJeeBgPzJ/gG8L++944d+xUN?=
 =?us-ascii?Q?7DIWikUwA3Ks9QrQuDcCFKf8LGsPpLI3zW2K/iUAhaNO0zt5nEGzPSyl6VUB?=
 =?us-ascii?Q?KbfiAo6XIMzB97CzQ0IcajyaUB3zLjYKJI6pGP3139WXZGk+NchEhjltjWa2?=
 =?us-ascii?Q?nQ2Oay2mMg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB9851.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c1da11-c52c-41ba-acbc-08ded3a781a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 17:22:32.1041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XV1ys6yiPUYfRdR1eCxCas88jJRlarycjkJppVGWKq2VqxS616CuHuSYKXIyVy/xxseCw9BCvNXAjKTXABMXnv4w4c9pf9P0E/WOGu7azE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_102238_095733_5F02930C 
X-CRM114-Status: GOOD (  18.50  )
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

Hi Krzysztof,

Thanks for the review - all fair, and we'll fix them in v2:

Drop L: sipsupport@rambus.com (keeping only linux-crypto).
Drop the T: line - we don't maintain a tree; the driver will go through the crypto tree.

Yes, Joel and Thi reviewed and acknowledged with the statement of oversight.

Krishnan

________________________________________
From: Krzysztof Kozlowski <krzk@kernel.org>
Sent: Friday, June 26, 2026 3:57 AM
To: Krishnamoorthy, Saravanakrishnan
Cc: Albert Ou; Ousherovitch, Alex; Conor Dooley; David S. Miller; Herbert Xu; Jonathan Corbet; Krzysztof Kozlowski; Palmer Dabbelt; Paul Walmsley; Rob Herring; Shuah Khan; Alexandre Ghiti; devicetree@vger.kernel.org; Wittenauer, Joel; linux-api@vger.kernel.org; linux-crypto@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-kselftest@vger.kernel.org; linux-riscv@lists.infradead.org; Shuah Khan; SIPSupport; Nguyen, Thi
Subject: Re: [PATCH 19/19] MAINTAINERS: add Rambus CryptoManager Hub (CMH)

[Some people who received this message don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Caution: < External Email >

On Thu, Jun 25, 2026 at 10:33:27AM -0700, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
>
> Add MAINTAINERS entry for the CRI CryptoManager Hub (CMH) hardware
> crypto accelerator driver under drivers/crypto/cmh/.
>
> Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> Reviewed-by: Thi Nguyen <thin@rambus.com>

Are these people really provided you with Reviewer's statement of
oversight? Do they understand what does it mean?

> ---
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90034eb7874e..ecb389795e3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6797,6 +6797,25 @@ F:       kernel/cred.c
>  F:     rust/kernel/cred.rs
>  F:     Documentation/security/credentials.rst
>
> +CRI CRYPTOMANAGER HUB (CMH) HARDWARE CRYPTO ACCELERATOR
> +M:     Alex Ousherovitch <aousherovitch@rambus.com>
> +M:     Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> +R:     Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> +R:     Thi Nguyen <thin@rambus.com>
> +L:     linux-crypto@vger.kernel.org
> +L:     sipsupport@rambus.com (moderated for non-subscribers)

NAK, drop. You are not allowed to add here internal moderated mailing
lists. We are not going to participate in your corporate dances.

> +S:     Maintained
> +T:     git https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git

Drop, you do not have commit rights there.

> +F:     Documentation/ABI/testing/cmh-mgmt
> +F:     Documentation/ABI/testing/debugfs-driver-cmh
> +F:     Documentation/ABI/testing/sysfs-driver-cmh
> +F:     Documentation/crypto/device_drivers/cmh.rst
> +F:     Documentation/devicetree/bindings/crypto/cri,cmh.yaml
> +F:     Documentation/userspace-api/ioctl/cmh_mgmt.rst
> +F:     drivers/crypto/cmh/
> +F:     include/uapi/linux/cmh_mgmt_ioctl.h
> +F:     tools/testing/selftests/drivers/crypto/cmh/
> +
>  INTEL CRPS COMMON REDUNDANT PSU DRIVER
>  M:     Ninad Palsule <ninad@linux.ibm.com>
>  L:     linux-hwmon@vger.kernel.org
> --
> 2.43.7
>
>
> ** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Heh, I should have ignored your message...


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
