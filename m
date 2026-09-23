Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87720C9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4+3qWqDKYUAENB9BwySDJw/416fydoSJYdgyMqLUZM=; b=DFTVZ4raJHD8mB
	NOPIMmSf716FJmKcqEVtn+ILhhvlaOEfWTYkpSq9guXPAUdlR2oyPZftTauQTk/cZDBzTUBQTl4YL
	ALGGZzK/sGsmspPpMgViotyoLbOs7fRGeOhnVsu88k9KOG1rGpCbpUFxjigsjdbsrX5W2STz0PsZ9
	ZzzQu5qi7esvwdrL2AhmKrkgUyNPkin+PrnZTDJs0YGX0XKP8DPFCNsh/HVBXWJLtXRo0GXRBye36
	5/z3+Lu35ezxh25/4mpX1A5WKoY8hr8OSLhFHVFv0xjuLx6CntceseO6K0TvnGAmKjvpg+/EFvnY9
	TMy0pP/U6S7x559IwUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tvp-00000009WAB-0lhL;
	Wed, 23 Sep 2026 20:51:09 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Tvm-00000009W94-0wBy
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 20:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL4Nepd+qLhBtqbr8PcKSeH8QQ7db+kQbM3xzN4wVZM+rPd1oKgXH3cC7MzFuNrFEWUeOqsLgCfeNolulPrjk3F8fNksfhtl24AEjJ/YQA7aDBR0kguGJvAUiEWEdqH4UM+si/TC+7BVF3nZo+Urs0xQseddcSYH640pluxUAOakyzI3M7g5JqyewFuUazhrVq0wgKXoHQ3NsgyuXpsHtEwvCr/2EXhXhjlJPFhyHELO0inTfzsh211QYQo7iwXqbbtliPCukhJYYEH/M0fijhHmedb+SWTy6AQi6Lz+eddoINJ8kr2Uz06/7HiusKl6lvdM2g+bc0OFcucGJ/qW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbYlQhT4Aq9TWP2c6LFyxCybJnqxPnaUrNzfPZdEuPc=;
 b=GW7JCHOLdLUnL7pBW+MNjZgsObZSGPuEYgMj0N6ptmoSQkz5TyNSDEPPbkr42cFW7vzTy8al7mc4NKTuDeFh9nGMXd1UfUfCRM5vE5eX9nyh1rrRkzMaMeA0yf3Fc3QSw6uReAaQbeoInc74Rjkv+R2b8reYRAemUYz2eLjZBb8qZJXt4SCq7oVkTnu6bDKSZR0XuV+KyVoW3lZ+mySPA3jRc8auusuBYdM5I/rwhoGzd8MV1k1y4vDiFyQ/3+IDZKXVJ61bakOj3plx8qu+yue1YVLawrAQC9eZ0vvgCxkFgN8PfNlTZK2ISWB3i8o2bISODL6qBrFjHx3J1oaIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rambus.com; dmarc=pass action=none header.from=rambus.com;
 dkim=pass header.d=rambus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rambus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbYlQhT4Aq9TWP2c6LFyxCybJnqxPnaUrNzfPZdEuPc=;
 b=R0UyrwZ3DXDke70gm/cAcKAOu/5JoSXw/jKwQB1peleaf+ZeK5P2dy60LGMgoPR1p4aOHO+0qMbVGZJ9inRhqTwdgL73RHqy5ocG7/cZmWINCUgYiEuRsHXNlmhT/s6U4deybvuc8qYp7HzO4L12loac9fXhZBQWi8BAcan6NvID9vLhsAZ5026zEgR10AXqKdWqshm3iPMFA930COfZvbFA57hjGzB9d8yEAhvz4KbYI+ljNf+7A/YRGKC+SEdZm0RrWfv/EkKX6q3q/fSyZjEw2+F75bVekyga7N8TyICQkhF3Fiapgkj2+8QgeQLRbj4uDnS8gLgdPy7UeqjNTQ==
Received: from LV8PR04MB9006.namprd04.prod.outlook.com (2603:10b6:408:186::11)
 by LV8PR04MB9241.namprd04.prod.outlook.com (2603:10b6:408:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 20:50:55 +0000
Received: from LV8PR04MB9006.namprd04.prod.outlook.com
 ([fe80::3e2f:2514:159c:85b2]) by LV8PR04MB9006.namprd04.prod.outlook.com
 ([fe80::3e2f:2514:159c:85b2%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:50:55 +0000
From: "Ousherovitch, Alex" <aousherovitch@rambus.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring
	<robh@kernel.org>, "Krishnamoorthy, Saravanakrishnan"
	<skrishnamoorthy@rambus.com>, Shuah Khan <shuah@kernel.org>, Alexandre Ghiti
	<alex@ghiti.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Wittenauer, Joel" <Joel.Wittenauer@cryptography.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Shuah
 Khan <skhan@linuxfoundation.org>, "Nguyen, Thi" <thin@rambus.com>
Subject: RE: [PATCH v5 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Thread-Topic: [PATCH v5 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Thread-Index: AQHdRvg30t1+45dAjEm+KmT5OENVbLbbsCeAgAD8JwA=
Date: Wed, 23 Sep 2026 20:50:55 +0000
Message-ID: <LV8PR04MB9006374FD8621EBF3C7E7F6CD7822@LV8PR04MB9006.namprd04.prod.outlook.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-5-aousherovitch@rambus.com>
 <arNn_fjy4jamSitO@gondor.apana.org.au>
In-Reply-To: <arNn_fjy4jamSitO@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rambus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR04MB9006:EE_|LV8PR04MB9241:EE_
x-ms-office365-filtering-correlation-id: 3f8a87bf-f1d1-4ecd-2227-08df19b45d1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: hEJ2pw3lF5CpG9i9AXhEm8k6qFDlTehmxpCb7OUxnHjUyBwZmuyRywaZIOlt30BP8iAwXPNaxluzsPMra5qvW21p+Hp/NolPU00gF4QNuRWBTeweOCQ8UbikEWL92lWF3CfUh9w6kq2EefQZeiw6exjtRU7GlGchWo9UUCPoGTGx2LGNKp6hXEK80LlNSh2Xc0Jepa9L6jSKilRMZOLkjZIRXG1u2vxCVB4Q5gRyVKc5DNbnE9Kk2kVCZF5pNfOnJp6hERrXvwaHTV1X6xBSADDXyvLJrBR4KgdY6onkQliBKH+qCxONvGnCjKABlCHumKTQOrjp46XOCNaTKChtNIRw4RG0FDOUNNQXSMN3a5+qPvkWGUzGOOJNv4pOkSS+HBUD0+VVUqsEmZmBGb6Q3H0vRyixeoAPj6woL7f96DxLhlz25TLAlWXVQksM55nL9E60Gtm0g+R7yfM0r0Bu0pjolDPVK+8IUudZSvoni8CVxpsTVlAUuytRkmUR3qCmE5qo/kRUDrxiHkcyEsBt2L+uKmKh5P5AhCd7ht6luN+Ers7pyLOFv7oQFJ4poZVxYxW29Es7NVp8CIgyBf/MVueBazBhIu8+g+U8fS1QwbiXroQrYxo9m4FPABfbNTS+gufDLvPn1dxHyDiwsYyOkWEKhyL8m//cgIoqCjw2l1gGFvIUBRTNGRLXEsk9vpby6q2O26uIRjahdJ1sRSEEZznjAV3EYdNifvyzhVAVa5g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR04MB9006.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JOkNtSddroB9sKuxWMQXu6MySCvAQ2aDINDQDIoNVt5DcDV16vfYYNHtAKhV?=
 =?us-ascii?Q?1yYCkHbF3sAvU/Po8kZA+dgkyjpwJLu4Dtun4mQpmTbUI7A3cgo1ogtRvtMd?=
 =?us-ascii?Q?qrp1H/jaftF4OBL9vCnfGz2luwmqCaOmnQE9i0lnUcK0x8ehF5C6Yvk5d4ni?=
 =?us-ascii?Q?8iYtaaEOQlvTFui4H1aYNUVYRnLalckiYVC4q6xFqypBLyUriCu8kmb0HasQ?=
 =?us-ascii?Q?2VOI+NSbfZJ9Q0J3NjmeV6D6UvkWTGxJ61cbWTrC8N12AXqcCAdc8Tj/UHFj?=
 =?us-ascii?Q?zcu338yNU+YoRI/g+itg7IIAh7Xw6MaVNeHsAeemjaVOLKBI3hEQlV3S+1F/?=
 =?us-ascii?Q?0DdrcgHynEsWT/U0Z5noUBTrl3MwJNLg/VkWWyXs6vQefiWH9G6Nmh3bw+SO?=
 =?us-ascii?Q?WbeUCoDtBDmVXcTOvIRJSs/gBma6c9znkIqsiXIns8LrYhVa8cuewbb2gLjX?=
 =?us-ascii?Q?LiF6INCP/nksKWY4NjaHSTWw+8NGtYQ7c71lbJU5wlhjsokECWIp6J3220Kj?=
 =?us-ascii?Q?pn96ab2Ut4epcpPeFQ1zdAxcq1WH4/xV+h2LZ+LN+uCmFen+2Pz73YjwB9Tg?=
 =?us-ascii?Q?izCLEc9/7NOVBPqiQ61MXtlTPPoiOqTHsrYA9dBuRvC9yQ6rFvkcpddaJbyi?=
 =?us-ascii?Q?MZWIgdwPwW0RC9zDQQY31IlS1qA/EbWvldMwJMrifTMPDVLuwvrLkFsSpWfc?=
 =?us-ascii?Q?UiHWBehiJm2HHEC16lm88LHAsLBp3i1ddrHRLUVzqJpDyvWYbVpjN51HbxZM?=
 =?us-ascii?Q?3Uyi7kmCTC/D5GKbKxbjDmQMeutVKk2cL39mO1bQPYGsolVMO+zweQHlIsVd?=
 =?us-ascii?Q?0neijWscnECtmm/g5Cu930URsBO/ogrbOTjlNWFVS1lxqh/3gOnVkYBhmo/g?=
 =?us-ascii?Q?Ca4jSdnYKUB+tXbLBg7VrgipZBA2KRUSDI/VNl8ReVq1qkrC0ZhTUYB7V+x/?=
 =?us-ascii?Q?PPTA48GiKA46dJhRNY94IfW2Zt7g4Oo1+oK78AncYuZak3Uw849AMjUJ9kr+?=
 =?us-ascii?Q?i1SY8lNqKKygPKfKW5uNalmvTBTSiMWBNP/koQAVjoLs6mv5iRdC09pcJfm4?=
 =?us-ascii?Q?h3TPIRRs7s5i3gjYOwG0kiQatYmarGi5erkLP1HW2ZbWSNzFm8O3u2ZePtgG?=
 =?us-ascii?Q?4kg5888CjxI0NL/r5XT7jHjx+8C31hFVoGMNrs8nXlpxjnRy1oufeqIs+5ll?=
 =?us-ascii?Q?PDl1mjK4uRcEQDa77P1g0tFw4dCW39WEpv9qBeiCpYxBlO+sByyY8HCHICDi?=
 =?us-ascii?Q?DAvZT2KFPjMSsqXoI0v0HQcPICFmMILL/Eas6Y8SAs1v7gtlYqDy8d4uJCLD?=
 =?us-ascii?Q?MfzUFo8B6vIwZ/V3YfnREx8V6jpUrtye7riZiFSAuzWNBbZjtZUsSXmYefdD?=
 =?us-ascii?Q?MnXIIRJvy1/+g+l3v86dbKcRHZ3YfelWD1nCGAeS8xNxxdNzq7pwwF7UXNqH?=
 =?us-ascii?Q?Gd8u2Xl0gCe5x0QkG6pKLAh3b3c0p6jM4OQWbw/T7EKfBCooVU4+0cbSfK4H?=
 =?us-ascii?Q?vsV405Ixw380fpzLL+vK7d/CxFRxoJ4SYvI1gFjF7+Vrxo1jPeC0c+xxQycU?=
 =?us-ascii?Q?huaWXCEbQEzqYD9gfCyDkMeBE3yGbWM+BCoC7+S2bI6P8gyF1N8aPuU9YT6y?=
 =?us-ascii?Q?0q6z757jzSroXd7swG0U9rNsN/4qAfSWhQAHzIwXNx1hdRYcIsyi+1LB3abw?=
 =?us-ascii?Q?2BCD+hPlCITPF3V18Ei6B3r2mA4/L3chD9Mzf3EtkL8cxg53MKDV5DyNBA1s?=
 =?us-ascii?Q?z3i9Z8fjQQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR04MB9006.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8a87bf-f1d1-4ecd-2227-08df19b45d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 20:50:55.6655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBPMC5B0wd+HyIGhH4S694BMr424WdIYZvJqDfPtsDRugB/joEzQBxj4NzCXWBEBNUJRmeFqznZV/3nR8FrMxo6FRdI7xOqUydnVO4/IY4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR04MB9241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_135106_303172_F506BDAB 
X-CRM114-Status: GOOD (  10.97  )
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

On Wed, Sep 23, 2026 at 03:47:41PM +1000, Herbert Xu wrote:
> Why did you set the NO_FALLBACK flag? This is only meant to be used
> by very specific cases such as s390.

Being async, these algs get NEED_FALLBACK forced by ahash_prepare_alg()
unless NO_FALLBACK is set, so crypto_ahash_init_tfm() tries to allocate a
same-name synchronous REQ_VIRT provider -- which doesn't work here:

- shake128/256, cshake, kmac and poly1305 have no matching provider
  registered in this tree, so the allocation fails and the transform can't
  be created at all. NO_FALLBACK is required to instantiate them.

- sha2, sha3 and sm3 do have a software provider, so the transform loads,
  but the auto-fallback can't stand in for the hardware on the streaming
  path: our exported state is the opaque HW save/restore checkpoint, not
  the canonical state, so a multi-part export/import round-trip through the
  fallback misinterprets it (and for SHA-2/SHA-3 the statesize exceeds
  HASH_MAX_STATESIZE, so ahash_do_req_chain() returns -ENOSYS). A one-shot
  digest could still use the software provider, but a fallback that only
  covers one-shot and corrupts streaming isn't usable.

Same flag as s390, same underlying reason -- no generic transform can stand
in for the hardware -- though the obstruction differs: protected keys
there, opaque (and for SHA-2/SHA-3 oversized) HW state here.

Thanks,
Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
