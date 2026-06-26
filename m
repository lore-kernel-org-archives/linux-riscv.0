Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F4BC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9Vq7IRQZ6kFJZhuvesgGE4ZS18CmwctrI2hVY3Ysz0=; b=OubdEKZ0ejIhxh
	lFIidb9zMezbKqMiOZRzMvGxKb9aqG8C/yzCiTkFrKMSy+RveILKk9PYqK7cD2ipYY8hon8zYQuD1
	yK9i4K4+cEghC/JfMqlMLWkjSS8HXSqCIZobyqdkk0VNiQ0+OJ/bvbC3Y3o+Q7sQHWDgA0wDPPg8B
	94dpIhq55OSr/4VrS+wNFj0Tz9uVi9rL432QNr3ci660TIchYGfYU9uIZna/RfvonYWra8E0J6q+m
	/zNxgK9zml+AOtueNFh1rLZTiTzvywleubXL0/Ykl0qihFpTyRbiRG6diMO9TxdhweUi+xkvpKmoF
	bdVUn4NKimayfIvO+fPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA9s-0000000BgoH-0A3H;
	Fri, 26 Jun 2026 17:16:04 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA9q-0000000Bgnu-0GEk
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 17:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B51aRV5f1ZE8u0WcDYPa1jXOiQ4+1KAKK15P6AKjgVV92wSYUMCEQ1VaMho9UujxeYbsoBZlhPvf0cUOxK1pJ9LGeCyxzYYD+K3yCl1a9mf3PmMTRbmN8AmNGVPfqo/RIySvj28D5OZexP704hgwF4k1jlXgVSLn38siIWXmpPU+YC4XVfn6s9D27lAcou8RmjtCvgPnuaLgRNfM05rHiIo/fW5tlsZ1R2cISdpoc/0S1G8NhluaclAPCO7E9LtMi5y6YC8uIQtVVqT80eynwLR22GQpqp5712DS3KSZzi1tf2PhSt/yvLRZBDZhbIksoH9xkHd7w5yO+ayDrrTgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHk7bdevnza8YDrilNUlP8i9oy/vzflv77OUa0a/1wc=;
 b=QDTckK7YQH8EMLgzQ3a2LLh/X+b7a0Tbs+mn+fFiHBJsWkGjXXYxf/dwTiWLrQngooR31gCrYnkiNS9zL5xWvRl027sgxYxoFQsEirt+Qsxlq9dN1huYMTi7517EEcR/AqiKm0dgCpiz7Uz7JoHWZ+WkgIDcVjduEvsFPPJwYDRqGIAJBk4jhgFXliBlWPHMOngBrcvrMk3BKm7qdQRA9MVAqDsxCTVVKwCWRa6C9BkdA/Jcb6eU8vfZAZ+QxOeAREpSzI2fv1BcL7CKdFVXuCfUwPQOUxpNEaQeAj66JKH7Xxp3nvq91h74Hc596mCZBQNLgLSULuvdoEOrsviyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHk7bdevnza8YDrilNUlP8i9oy/vzflv77OUa0a/1wc=;
 b=QSZZIqOSL3exA8bpqG7ZuT1WHWM1B7+W7KcVFkGQE5rfvFOYvTYMAfiCr5hW3dRRY26cD8xwz2wfYoUiWrdCuNeNnDoL0r+6E2Cj9mdMWrjV1yuUNRHc72nKHd+UssPeitXMva9WZw/Xcn+7Lci4pjGKzOorElgXmD0BASfT27dE6jyD3ir2zv0b0atNNsXVrzyA68qnbeUVmBqq2tOSqQlVGb0YSP3VQ60/z0rZqnu2BkVzYU0dwK6lrj88/0NFNHPR5gRgOlOkJIT8D5aSQDGom5oxLR9wzgLi2PooMoZC4/SQjTjvAOX03U1LrNOZoLIzhS+gCtNVmrLFSkLvBg==
Received: from SA1PR04MB9851.namprd04.prod.outlook.com (2603:10b6:806:4ac::5)
 by SJ2PR04MB8581.namprd04.prod.outlook.com (2603:10b6:a03:4f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 17:15:49 +0000
Received: from SA1PR04MB9851.namprd04.prod.outlook.com
 ([fe80::5f38:dbea:4e4c:9a0f]) by SA1PR04MB9851.namprd04.prod.outlook.com
 ([fe80::5f38:dbea:4e4c:9a0f%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 17:15:49 +0000
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
Subject: Re: [PATCH 01/19] dt-bindings: crypto: add Rambus CryptoManager Hub
Thread-Topic: [PATCH 01/19] dt-bindings: crypto: add Rambus CryptoManager Hub
Thread-Index: AQHdBMjWbbt+vQeNuk6AgpyYttH26LZQqwqAgABoWTo=
Date: Fri, 26 Jun 2026 17:15:49 +0000
Message-ID: <SA1PR04MB98512F483110B601D5B335F8C2EB2@SA1PR04MB9851.namprd04.prod.outlook.com>
References: <20260625173328.1140487-1-skrishnamoorthy@rambus.com>
 <20260625173328.1140487-2-skrishnamoorthy@rambus.com>
 <20260626-radiant-affable-raccoon-f48b9a@quoll>
In-Reply-To: <20260626-radiant-affable-raccoon-f48b9a@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR04MB9851:EE_|SJ2PR04MB8581:EE_
x-ms-office365-filtering-correlation-id: 4811c2a7-23a6-4aba-7685-08ded3a691a3
x-ld-processed: bd0ba799-c2b9-413c-9c56-5d1731c4827c,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|23010399003|1800799024|376014|3023799007|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: sUhTB6H/VVbQDpub1hNTrq67Wn9rHUh07w9xIxGVwOEe+mX9J4kYGiWzyw7cLNC2+avlufJB6xcFz/X8etM3WMwdgbTq5bw0w1+RSx+Str+R7sjc8b76wvoP/6+LWMMovNl8/QKGPmHTfd3sBBT0iMaJUHT189MwGD1myshzGeK+1sPcQPM9qbvvv2yurVAfw3JIz3nkY9H85My74Efa9Fllb9IxxeyAPzV9/14z0jjAF89nIbDSoIVSTLkQPHSEX1+RYsxDZM424hqV5orjRjqqNFho9BsEK4P4Ew6eUY6ErPZN+jf6sdeHugZSUekHip3lVBWaTCTHojLC28voNqUirc5HeVXMX4Eo580f0EUQ7tlkahQY6jcit7txxaJxdRuoKi0dkNNyx1Qzj/menDSUG/AJFBeiU54eSsxpdoq2TQEIfzy9aCV7tIAMKLht2npa451Zx10knRUtMhMc29zCS5oxnKqIvSXiJxxFCR+bqJd/9TDsDwzz2k2OZb26H2DDz8OA5Y/Co57B2P1+0zdhiMK4WaO0I27cuzHQbwVK+SwPmzRtmn1nlQ6l3pAKD+sqJli7u7a0zRT6v4f6oEc9/RfPa2ZzXdtCztcp5kKE4Sji9H917OPozinVPgTOwHQSsIWQUgGLwEj2OwynNep/xSBGxXTGSjGUFeoRhn8cCzeRCgKbQN4W66MH66ujkXxCi/WTM40cf//D72mkLsZ51kRhN9XAab26yWpFRdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR04MB9851.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(1800799024)(376014)(3023799007)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DpbhL0m7kSGisyGbDBerOesHbI/8sR+fDZOJ0/y5YTps616nyYj5SKDC8efQ?=
 =?us-ascii?Q?lvCCNv9/+XqMQ0o/tnebJ87Wzkh2ILyxK3A91l9VWO1FmS9ibJbN0SGEsZr7?=
 =?us-ascii?Q?jSANsz9Hy6EWibr7FK/1nxJOeuBw5liaSiMWF4ssx5sWiy48PQKhNo7gVfwJ?=
 =?us-ascii?Q?dClb9luJqWUZAhW53fb+JR1DR/7ksyzBaqo7JtMPsoaIUEE99Pyqn3Bc0eGB?=
 =?us-ascii?Q?i4LRazSMvS/tELZWTaANX4jKEsn2KgX6XfstMHxUhDkRrvKCl9TOLHOeHpxT?=
 =?us-ascii?Q?W/hCf0+AAE1ARYAei9oQWnuU1b5mM5e/3q9SOKyLdXo5r1c0i8hon441IMSP?=
 =?us-ascii?Q?bSr0vPznySq4GxUl3QaZa1v63CNOs5bISwua+LKEjAilVxZC2vE97049MpIQ?=
 =?us-ascii?Q?Xe55elB1Ep4AEfiPQCANGhlZf1YvxvfC/NufypQgcy52tTUOCJd5swVrhKft?=
 =?us-ascii?Q?N0INmFMBgnlHfBTdRxpZ0JlNLxbicp15XF1uhAD80pHIzAbRKqmAWHoeR3bx?=
 =?us-ascii?Q?KWa9xdaxYSsNXMAH49qA2YV8pykNYjUf+tgmdIJGgdHZOFo85oVypru4r6Iq?=
 =?us-ascii?Q?Lf/rMf/0uwz1LFOfaDA1+Lfi8yBlW6fXodClkKJzcgccQmX7KNy+GS/N9r5j?=
 =?us-ascii?Q?1ND0x4iPM9XDxvIG6XFVLwGeZxRH5yRJC0CwZAxgtwknH4sSElPlur5h1wUp?=
 =?us-ascii?Q?+2Nr0NIPgjrOD406forg9nbFUtfJs+Jk0ze3DNg0rik1Wd4HGZj24AaPyMBa?=
 =?us-ascii?Q?jXPyd/Iptb6YKcPydp5LsYv4CjSxXUJbcElFIs+qtYBpwnRvNHHvSAXK9cqj?=
 =?us-ascii?Q?Hhm7rGdgdmYN9TV065mqroHt1eAzKnivWVa5pVYQDEcgdGKjskTTQ2p7soVq?=
 =?us-ascii?Q?XQARstr7zjoCltLXM9RZlReN1f1/N/GHSpWjTjSNhgGoiVreghP3iEoq10RQ?=
 =?us-ascii?Q?z0AWUdlwukf69DxdoBe//3Qx58W9rIoI+M+uQNDob2+l2weiJLWFspY4Bdd1?=
 =?us-ascii?Q?ezvjOSuv1MnhqPh1sP1Fr1NVnGPyigYMf4lbdfG7zQsVZVn+nqhOCGhlg6qJ?=
 =?us-ascii?Q?U9JoF5bfSAl6vm4bChwX6sJNLBlHFu2Ijjm8QHiQsxLydYc/p35S2l8nkwJs?=
 =?us-ascii?Q?X5RLCJxyzUxl3zCFz5OSFwLg/tYaG5XWryzQIu7s69+lOwY/dUPLaSHoh1Ws?=
 =?us-ascii?Q?VL9kgFj3XQ493ZexYZ72gORGdleEp7jbYTFLs0O9ZeYKKR/9zWKOrK84+OoH?=
 =?us-ascii?Q?udqjWSFNr+zJ/bVW1IHD6eGKDhGhxxIdcInIvQ5oZHKJqfTOC4boTbSOvFqz?=
 =?us-ascii?Q?410jnxl7OTMJi+ENT25+ZMOmx2r3twJbpJJXnyg3krBmOV8Z2SURtrAd/3JE?=
 =?us-ascii?Q?/MCdNPYg+8mWfVxHzxLvr9WVn9iP0Efoq6/dgHmW0qgNsytqJ3hi37SvGrt/?=
 =?us-ascii?Q?LZ/rf8wPillYS0JUgaZkrzpHt6GjFKXyp/seuS3pzj42bHl7UzLijaGlZYwR?=
 =?us-ascii?Q?J2H+goeHAT5eFz0Ir4EziFqLQqC+DkjQY1KVuk4PW+xKl+mgWkKE8U7lpiNu?=
 =?us-ascii?Q?2P0hpAsdPenum4D13v1xDty5Fk/UdCLWOkdAPpFH1VtYbRZ+4yIXbCXdS8Em?=
 =?us-ascii?Q?oqd1ASdAVxPKnkWUC0b7MM5J/ESOJ+dnMF7C1SSJeN3W3z/onlmHaYo1lcfK?=
 =?us-ascii?Q?I5BjuOkSUx7UhkbKb03tSMfSJ8+YFmoNwIednoVsW1vOA/3PJBnsDzkJMaWm?=
 =?us-ascii?Q?NMX3F2RMyw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR04MB9851.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4811c2a7-23a6-4aba-7685-08ded3a691a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 17:15:49.4225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsQbvMO6uAPO/50tLqHRRziXnNe4d1kGxxFKlhkhDFHWQZW0YBIZ4M8kmt67pI48F59h0J0EsQZscrk3ls6elinqB9WHB6QHYhBNKYcFDZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_101602_164069_5E01ADDE 
X-CRM114-Status: GOOD (  10.02  )
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
Understood, and apologies. The confidentiality footer was auto-appended by our corporate mail gateway, not something we intended on an open-source submission. We've had IT disable it, so it won't be on future mail. We'll resend the series as v2 without the disclaimer.
Sorry for the noise.

Krishnan (Saravanakrishnan Krishnamoorthy)

________________________________________
From: Krzysztof Kozlowski <krzk@kernel.org>
Sent: Friday, June 26, 2026 3:55 AM
To: Krishnamoorthy, Saravanakrishnan
Cc: Albert Ou; Ousherovitch, Alex; Conor Dooley; David S. Miller; Herbert Xu; Jonathan Corbet; Krzysztof Kozlowski; Palmer Dabbelt; Paul Walmsley; Rob Herring; Shuah Khan; Alexandre Ghiti; devicetree@vger.kernel.org; Wittenauer, Joel; linux-api@vger.kernel.org; linux-crypto@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-kselftest@vger.kernel.org; linux-riscv@lists.infradead.org; Shuah Khan; SIPSupport; Nguyen, Thi
Subject: Re: [PATCH 01/19] dt-bindings: crypto: add Rambus CryptoManager Hub

[Some people who received this message don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Caution: < External Email >

On Thu, Jun 25, 2026 at 10:33:09AM -0700, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
>
> Add device tree binding schema for the CRI CryptoManager Hub (CMH)
> hardware crypto accelerator.  The binding covers the parent SoC-level
> node with register region, interrupt, DMA properties, and per-core
> child nodes identified by compatible string and unit address.

...

>
> ** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

OK, we are done. I am removing your posting from Patchwork.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
