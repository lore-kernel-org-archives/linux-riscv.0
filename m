Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCFAC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RA0hk+fOJ2W9D9LCRsz5kh6qVA89atf4PZjTgah8jU=; b=MpKjWr//WpKVKK
	9jgouoS3wlOZvPdgINYdmRY0fQIOKVl3e3ZwWTY2Y2wn35a14gLDi86bIc8jn+X2yFtnjupKpJpvm
	oBm53dcgbprGOMGeaH74H1MAxNalorwrrQ5aRt0FLK+dg9hmpUzeVY6plzzijMSAiIp6DQ1HbaJFY
	X76v+aNbMoTPWBJC9QhGWb4rP0JKWvchiD2XSDPEfydHbHYjV0AzErApuoqR90dOAN+/8GMD0RyfM
	0c9wBwXoZicr/D2yBi5Ve/NIO6TExyqJ1lVE6dF7MuK+SdH30800yFHZd5RAct34pZ7F7HaCW44kx
	HatmjaCQR3OeAIgyVD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYGJ-009wCa-1h; Fri, 26 Nov 2021 10:15:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYFs-009vrr-KN
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637921696; x=1669457696;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uRnqrM2KxNP9OoaW4Y/OAYoeDqGoDUdkxwNBO0nMQZ0=;
 b=ESFpFs0j+Qzxvolgma/sLR2n2Y7WfDmNJTtzcSkGAMXgLGFqbHJDhFQ+
 pKsHHsq5y0B948LZ3tbJ9UHilq5F93UMQwYKsJRx7mv1fTJnHgYkFQ66V
 vK63Wn3EHpnpmx4DrGKE6fw6JmsKMo7DFOXlTgL7rCQzvu8+rcyua5vIB
 g6rBDCJJaXrSF6r68bFAyqYIgqde98CHvVedqLdk0uBkyYPf0KTVPNvwH
 Ntv6W2mGTNo2m+o/waCvw6UPCGg2ESQuPTMACkbUZ78y3J6ebxLxWmfAX
 hyhBThIh2w3yZyEwsjbneLPpsu51OYAB5P/lX5ErwR7wkeNK020eYPCOo Q==;
IronPort-SDR: 94qJcKEM4Nr3Z53g9+h5fw4dA5s8ztCVz4jyv+Xyj43tRe/q9fsjSnWqnhPb8AmtUzLbECga4j
 If4s29qbvLbZtreijRpQtPvkqyYXQuPI2Mvx4X+8DYwkDQ7oxR20mHjylwlAXdCmT6DpE2AGWW
 +BRDR4Lz5N+Yoc6RFH9+e6a4y3CIPrcuuie2vvhMSDty9D9TVuJswq5YBcAzUj8FcE3SqoIuof
 iYeCQoOFVuSJsTxNveuOew+N/BObNpBQR0kqp3G4CdriDhp86QtSecGprsBTBtcdBs+d5pO7s8
 bmS7H0krm6JArn2h8MMBlZsB
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="140391417"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Nov 2021 03:14:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 26 Nov 2021 03:14:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 26 Nov 2021 03:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB9Qq0kHFsjIEolrij64qAfrpBvaCSDYX9AKubFIEBP2WMNEzveU7JA4qql/fkvRt4SQxtJmOM7yS7FWewyS3ZIKjbch9p/sFQsxyFl4s8L6lPCf/Ul13O2UTELSt17Zgje8xS2tvEY4BOWS5EAXgb9/vWJtj7Zp9kjCoNSmJWjgj65K9WvZWcOaER7EpFObW5hgvdVoFlJvkOiL15YgTyjoMpYn59Wyo5dWVVLDjceVQgWvgF4l6DcDvKrUcY6kZ8MgdF5abvDTYpR4/qS4Sn129/k9ZozOuNeatUxJEo509InAfkCqPSe2/pSWLkmc8FOREmzbAANZRJLX0NqVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRnqrM2KxNP9OoaW4Y/OAYoeDqGoDUdkxwNBO0nMQZ0=;
 b=AR4VupH9pr9j7s4sA2iokDVAvBqoBP5dTXDUefBD5ywyk2YnPGaqnNvZcQuzZOJ4RM/LnlezjvfAHab42BX4e5nZ9EPSXlSb5qxIixkIONJMnjrE2duLag9WP0AWETowA3NDcnlhefBYwV0/NwVQfWkc2eH/a0f0MhjTiPJcxXETAL/abVJ+TS76xxoGwGgmtAldLLB0Z/wX/qIuF/Dp0o2X8aUqLVngmazJvqXTuQN40F0qHDkGjOhlW6j0gWeTOrk5pginXv3Py6dvnH2OCN2gD0NeR98AjW0jfwkEM5rkzKBJcsS6rgrxsdDNC8S0D10b+LRDir6SVf9DGyLGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRnqrM2KxNP9OoaW4Y/OAYoeDqGoDUdkxwNBO0nMQZ0=;
 b=s34QTWpjRGMp14STXrWMpMniL6KwpiTBF415eUpeyEFP3fOUWvyrRsatXWxHS+Vd2j31B0xOy2I20SZu7Yz4t/Cpw2PDkEcS4F+sNBV+OH5549og8QRO/KjzvqEnWZ9YftVBA1jQ+baGvKKRVriP+ZDBqbQEpWoYc0MrIZQ0lxA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1278.namprd11.prod.outlook.com (2603:10b6:300:1d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 26 Nov
 2021 10:14:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 10:14:51 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <damien.lemoal@wdc.com>, <Lewis.Hanly@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Thread-Topic: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Thread-Index: AQHX4hGSnfyPBPrmmEGmKCXbzlxSC6wVkVGAgAAH1AA=
Date: Fri, 26 Nov 2021 10:14:51 +0000
Message-ID: <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-7-geert@linux-m68k.org>
 <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
In-Reply-To: <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65f838a5-16b3-4e13-b90b-08d9b0c59573
x-ms-traffictypediagnostic: MWHPR11MB1278:
x-microsoft-antispam-prvs: <MWHPR11MB1278660046A6C0922B9A8D9F98639@MWHPR11MB1278.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miep3ruSNt4qvtZccbju3jfjAo6L7xf4OfcclXud8IwBlvoKkbUTjmRsSy9G4zu0VHU+3fttkUmR08DSm6sI08ZnJUaiejh88ALgPjkkdaxFmOe3b89bzpq6k7KaW7S3dnItjGBx1mLNVGOKjWMcRoXKI1N/PUHORac3h6JBqjZ6ekdoG5KEZ1a/tw0yq1a3fm+OrVwfZ55Pn/jP8ccFZ+R5ubXg/EM66vC0vjvxjvOsyTF3yLF14Q9R0fHIy87Jl4qXRuMhItQ6OR82r1kK0EClkvHTEn2/B6FBzyHHeDyPHLXCkgg6qwCoMZZOgYtCIJsL4ctbh63Hv0uLr51tAEAgeKo3E9C18AL2vrNqpMQX/HpDWjb4Pluk5GOGosQnm4JgjJU2deiC82I1ypVBT5tgvn2tga4F1R8Hof1Ee2pQ7xd6VtMK6Rv++NAB+MRozKej7xlqEK3Sip4AbE//8oIXOA+YKFD+YDE+Ob+QGskDrprMmkq021qtLWnO2OFzDdQoIzVzVbjyKWRyC9aVwCs4Jpa0/+H7JJLwHLxLUtj3O65qef/bcrigfbq3s8kC6Ep2NTDIOAjX75dLHy/rLqtm7b03fQH2rzcJavQZykrHYTmNKoE2b/4pF1y7O8XycNScfbV2indElILgM48aUsAT/UdRLx1CiCDSAhMF5m0HdS4+fo8c/W9iDIVXgckz2oxkGNhL4lkSyvlpbfNzjPu5ZmeicYZq86N77rw+1WUq7UiJ7HPx7HMDX0MhG0orHf7hpf3RnaXdb3zJ+vnKkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(110136005)(186003)(2616005)(6512007)(8676002)(31696002)(5660300002)(316002)(6486002)(8936002)(36756003)(2906002)(6506007)(86362001)(6636002)(31686004)(122000001)(71200400001)(64756008)(66556008)(66446008)(66476007)(38100700002)(76116006)(91956017)(26005)(53546011)(4326008)(508600001)(38070700005)(83380400001)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzU0R3FYQVFsak8rNmdmaXBRRENteGxnd1BGVnI0a2Y3akk4NE9SVzRjQitn?=
 =?utf-8?B?YklPT2cvTjU5bnhlbDNCZCs2TlJuWmFrUUFjYllqeUtTTkpLNncrU0FpdXoy?=
 =?utf-8?B?amN6Si92eFlRVzRCQWI1cTF0d3lRTGg0a1YrUXlKODdCaUNHc000QXFtOHNM?=
 =?utf-8?B?enB2c2w3MVk3MEdtSFlsaDJKdmpkd0JYdjJhcE5udEtZOXI0YTFSaXptckFn?=
 =?utf-8?B?dWtXUWgwZ0I1R2JKOFNEeWdIUjZ0Kzc1amZrNzhsVExOMW13enpwdkRuNUpO?=
 =?utf-8?B?ZmsrYktWbFczYTdpdEtsSXQvVERJSGpqcGtScE1jeUFBWFBZaXNjU3JOakNQ?=
 =?utf-8?B?RlM1aDFHSnhNeVRwSmhCN3E4THN2N0xpZkJuKzZ3VFoydThSOStVelRJQi9w?=
 =?utf-8?B?eGMwWnhjRGFGdk9lUkxyN3RWRytQSkMwL1N6L056OWtsaE94N2pjUStnTlpX?=
 =?utf-8?B?TUdWOGJUSHptcGZsdDZ4aFhla00yK1FNVjFYZkgzSkpmSUdEcG9nS0hkY2lM?=
 =?utf-8?B?dWFoSnZ1M0YxWXlNQTB3MVJmYkVsYzlUREI1ZHVxc1dhek5BTjhwaFZrS2Nn?=
 =?utf-8?B?eUM0cG9lRElqUm1jUFFENXZHbVhDdTFnKzNzOUFwVkZZOVpFeFhCalV4MHEx?=
 =?utf-8?B?b1A2YkxtSmR4VEE4b1hIaDkxa3Y3b0I1ZjhwUXRIM2tWZllrNkVwVlN2aEtw?=
 =?utf-8?B?bEdQTFZiMEREYXhqRURtbWVxRThPeGhVWXRWTVZ4WEhRaGZycmdpdExsb1pF?=
 =?utf-8?B?YUIydlVQSGgrYzdqbU82eHhMQ0ZnU1FLUk9sdmwwaDAwTkhsVitFck16RUx6?=
 =?utf-8?B?VEVibkZOMys0ZWplZkJMUVhyQlpycWZjWE11QndLRzJ1a2I0dkNERGxUaFVZ?=
 =?utf-8?B?MFU5YVY2TnRZWnk5blpXLzA2SkszSFVoak1QWVNsK0puN0VFaCs3WmZNQzQ0?=
 =?utf-8?B?OEsySEltbTdrZWZ1UkdwRUhFRUpSZjEzbDQ5RlJ1bG1reFVJejVGU0RqMjRw?=
 =?utf-8?B?N2p5dksvVG5NcDYwcGJwQzQ1MDF4a3JIS25meW1GdWhVSmN3Nk9SQ1lHS3dl?=
 =?utf-8?B?M0pvZlUvNnFFeFJZbEhkWmkyaGNyN0RqUWo3REV6UzNQN1V0S1ltODg5RUp4?=
 =?utf-8?B?bTg5RzJoa1dZYmtSQldNQjhlOHdIMVdaQnBmR3FQSS9INjBtRFZyZW1DSC9Y?=
 =?utf-8?B?Q3hZS0c0RnVkUG1rM25sN1pDNkdKRUg3cTVWbVlxdFhLL3pWR3hoL0tXd0Qx?=
 =?utf-8?B?aVRscDBYaXIzOUNCQ1owUWY2NS9UVnRaemR4L3o3UUZacG9qQWM0ZHVXRWpu?=
 =?utf-8?B?SU5lM1dBUlpFc3pCRmdPNndEeExhUHJmZ3M1OVdZdzJRaEpFMXprUmhEZzRN?=
 =?utf-8?B?M0JsMjFQQjNtUFRpU1EyUWVVeGYxeUVzZmRCWG1QWXdXSmNKTHV3MVkzYmNx?=
 =?utf-8?B?WUlUUDhSUGZoYjk5TWVyTFp2ZTlRTUZuaXJHRWwvY1pQTllHN3JGZFJiYUFX?=
 =?utf-8?B?RUt3cUU4N1VFdXZ0N25IOHZyNjVrVGViRUk2dUN5Q0RhUkMzY1ZsUEhVOEk0?=
 =?utf-8?B?MWdvK3kwcXMxWGozWWMvc0NKOFEyMkRYRzhKNnpqQU9FTnlTUU11OXJZU0lx?=
 =?utf-8?B?OUk3VSsvdVlmbHNZVlVtVlBZL2xsNWcvL0ZEZmdzTklXNzdReW40WWdiY1My?=
 =?utf-8?B?REhYL3ZuY3REZ1R3TDdyUEMzTlBmcVZEclNZZmtZamorMFJLaHI3VzFwcG9u?=
 =?utf-8?B?TFpCcWhyWmI5WUorckh5dVJJSDE3Q2FMaDRINTcvREw3dzJkMGpLMmNTV2Y1?=
 =?utf-8?B?akFOMGIvQVBockhocWFnaFg0MU4rRExNcFNmOTl6SHNSdzFJRTJPN1BwWGlR?=
 =?utf-8?B?QXBzOHhHSXJiQ1RHUER2YTM5ZXJMUGNiSVlpRGxqVnliUUNnaEJwbkNnb3Zl?=
 =?utf-8?B?KzRKMXpBeEpVa3lzK2RsTlZvUGZXYmR1ZmVDek95ODJQdG9BL0xsM2ZYVDJD?=
 =?utf-8?B?eFZ0ZjRyL0lrQXVleG1HTVhmS1dOekt0dzlGVkhUMU9jRndEaHI5b09WSmRU?=
 =?utf-8?B?bGtVM09tZi8xbFZUZWd1UURkcWMxMGR3VEFxbHBQSGRLVm1ZT3Y4clorWk9R?=
 =?utf-8?B?SnVDdVFQSVk5NFFEdlE1NWlYOGVhWE1yR1FqVVJVQTJ2TWRNVTU0NmRobnlB?=
 =?utf-8?B?NHNNeE4vQzJwOXk3UTlMcWF3Ylc5QzFwd0FIdHo4dzZzd005VU5ZQzJxRXJ4?=
 =?utf-8?B?dUdETmhIOWJHWWRaSEg0cUc5Ri93PT0=?=
Content-ID: <5ECBCFEB2ABA3E459C99F60EE0118C6A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f838a5-16b3-4e13-b90b-08d9b0c59573
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 10:14:51.1164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUwmbm9gtxRk9eTiJqI+yO7R/aJjVBwkLhN5RJyOM1deGlS7JDZnUhUsZYcgNPNrt7a7ZlJDZ2LAb6rjeVsyPtrzEekVKR6khwz0Q5d0OKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_021456_881332_BE7368ED 
X-CRM114-Status: GOOD (  16.74  )
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

On 26/11/2021 09:48, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 25/11/2021 16:31, Geert Uytterhoeven wrote:
>> "make dtbs_check" reports:
>>
>>      arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[600000000]], 'clock-output-names': ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type': 'object'}
>>        From schema: dtschema/schemas/simple-bus.yaml
>>
>> Fix this by moving the node out of the "soc" subnode.
>> While at it, rename it to "msspllclk", and drop the now superfluous
>> "clock-output-names" property.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
> 
> It is also logical because refclk usually is not a property of the SoC.
> It actually might be a property of board...
This is one of the fun FPGAisms like the GPIO interrupt configuration. 
This clock setting is determined by what design has been loaded onto the 
FPGA - the msspll outputs are configurable, I could redo my FPGA design 
and change this to 500 MHz etc. In turn the msspll clock is set by 
another clock source that is actually on the board of either 100 or 125 MHz.

Since it's not set at bitstream programming time, I would agree that 
that property should be moved to out of mpfs.dtsi.
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
