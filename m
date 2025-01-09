Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0923BE77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tck33Vj+hNvirhITayB/wfT5nceNNpmqkmhbsS9KLk=; b=hjoFNJ0rnF+7Co
	Iz1oO/VNWJkiN9C8OkDGIlWtAKJcCrMtARIMDpQYkYtudf+Aujd/z8bgd5qZmCGXtW2jx9+UbF2rJ
	9B80mhBWBOzxcu32MWC+bbBT9+/5Cc//+FjTc3tyaXtSOWBcykYCezzgWhyYtmftW7tJ1+ZMzn8Zm
	r0DjaNUYRBv1pbNjAscFvGkaqMAD+H4XAT/mT8p+obyEl1ONrmKYrWqpEeYbDs/pdetBERE3GgQyw
	K4TivdvdVBC6/Eb/BVrcZn643gyjeWMR7UlL4m5sgAaIZ9AX8XobSO8W/QQh52hY53VL88q5FLXPL
	7ixI46GaXxFZSMJcc5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVofy-0000000BK1L-3sGZ;
	Thu, 09 Jan 2025 09:18:02 +0000
Received: from mail-vi1eur05on20628.outbound.protection.outlook.com ([2a01:111:f403:2613::628] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVobw-0000000BIKX-1fSD
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 09:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3kd4s17O4uwlTko95O/Qcer8L6/aqdB+TvTcwVSceSvghPyj8e+sSGEWfwg2Z06Up7OQYT9OaDlv3q0nrVnn3JchpT/c48AWrMNQOPQ+/4TL+WlG3EEu+L1jkY7V7gjjB/vw5nkRlj2BtB3wXaza0pazh/auawPXPSdN7BejZPf9/IOYDf7K0hCKml8F7hAE2g4eCPsbicmNrWUiLJZwmoMXNPnJcOx133p3FSnWE00nNDnmp67B/XDrP7kQKuXgWU+eqHV/7nflh5GzhW4MLgBlL8b5v5G8OZopXdL4VX7mZ6XX6dP9i6N90S2FO5MHy1dYJ9R4+2o5wOZtVHZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHlbDLTFkNESmGf/5q1bqDrcLYt3q+7fmrnF8LmnJWg=;
 b=fRs/DbReh2DErrg+M9S6I0FQ9BELQO5fru7bZgfFEJnAUEu0fi0Gzkmrynw5KoQYTOhcgcB1ioLJN9CaK3K88qwE4k5hzsi/keIvJ00VSXlqBpXgaX16924vs73BqfJM3Oz2g+vMOHm7QgzbDN9Ikhirwv28XIYwTRACVn+s8Sx77gHzd61H6IrA5RKdxSUEqei+xPW8pttTxBByONifMsd2bt6/+jxlBO4f01qBiHx1pW7XhDY7y91G00AmSqi3ShvL3mpRm3a54/jtftkizbm/Fbh6cy3+zZKkoSAyCpgvY+/nQIuw7PBfyFGVRBSD4XoJl6XHyDoqVw9Uh/c2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHlbDLTFkNESmGf/5q1bqDrcLYt3q+7fmrnF8LmnJWg=;
 b=GlObaJBgCJYMiKPTmA3mltpHEBANvGg3puhhuo9oJgbEmvWd0NWQg56DG83Kn+Zh7dmtDkVORlW5nGjJFFfI0cyzcxUXjYEN8AsavEL+LuqpmW1qDd4KrPU4ocXgYzk3ZSxcBQpxoSNYeSyTbPoaNwWI5ratSMUsaNjwixk/A8U=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by DB8PR09MB4138.eurprd09.prod.outlook.com (2603:10a6:10:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 09:13:45 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 09:13:45 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>
CC: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
Thread-Topic: [PATCH v3 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
Thread-Index: AQHbYNoIrBRaWq5BkUORmgKRhzArorMOFl6AgAAQPTc=
Date: Thu, 9 Jan 2025 09:13:45 +0000
Message-ID: <VI1PR09MB23335F8C46D70921B074488C94132@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
 <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com>
 <20250107075835.1421602-2-vladimir.kondratiev@mobileye.com>
 <61adfec1-89bb-4367-b8d4-64a8b751326c@kernel.org>
In-Reply-To: <61adfec1-89bb-4367-b8d4-64a8b751326c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|DB8PR09MB4138:EE_
x-ms-office365-filtering-correlation-id: e263d147-53fc-4eda-80bc-08dd308deb5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?U7Tav8upWNBe+pwyI5ornD4KAqvYcG3sz/hRDz1StnJJJsq4xTc2068Hpm?=
 =?iso-8859-1?Q?DIOLxwf3axUCPVu7oey4xtiHc0iX4Yf2z3xPVb17+ZY/uSIK5UCtce6U42?=
 =?iso-8859-1?Q?tx6U4g3bTkkb40uF2pWdmyMQPz7leMndEXGNWyj4xCgNOupyd8Q/TDuMYT?=
 =?iso-8859-1?Q?Iqw+/TUNt9GLNh/k7bHiAkgLO6EbfdTAdz5nWwgdbD3z/vjJ6vPyP4QR5l?=
 =?iso-8859-1?Q?KmFoXlnk8taqjaV6ngsc1GXQjKd7vtz+/MF3a1nDvo6Ts8htqB3NtX/yuq?=
 =?iso-8859-1?Q?yia1tk40djDBQbzgmjJEdP89BdGTHwSJWd8LhZmJyJw7rF+bAUuVXKN5H5?=
 =?iso-8859-1?Q?i+iDwR54sz31KNoKsXeYHSVTKihbkVfn1ybT2Hmgp0Qj9H3bEnJ9TvVVoN?=
 =?iso-8859-1?Q?9UH8vwwJ3olOlNc4eUkv431NDh5DZWhLwdjADBpdtfUn4dKHzNTE50CjPT?=
 =?iso-8859-1?Q?vSP16mP/JdEJi2ZDatmMJ/LxWExFtWx0GWS99pkibA9Wx/UE0Pjo5IhSqv?=
 =?iso-8859-1?Q?yVsMeRHpGjqiLqF52rZsUAQ1nq9pn4JJ8hwxPo5JtbB83ZLbo87UWs1G25?=
 =?iso-8859-1?Q?uae34FjeFFtYgSlavkVzrztikUh4eMcOsfmzC+kd8DGJ5DxZLCWf/1zs8k?=
 =?iso-8859-1?Q?jfFOgGSuw0roJofa+R7RNPi1wdh09EcxcgYBJJ1WQo5X66HBQ6nH4GgRnr?=
 =?iso-8859-1?Q?WAeQcsO2BTLcNjZGDJVqxY6V7f8L4ej8SNM5eU5PmZ/NoO2P7NoOoJ7ikE?=
 =?iso-8859-1?Q?GOemhHVKJ445zdOdkvrt1OwsNN2iRnkGzC02Vp53sg4VESRDw5xzSeVbnC?=
 =?iso-8859-1?Q?pswX8vRMAq8ufXDJrG1QB28Q6MJqhhvCz2W4oAIijjJK7bUErbbCt4eZOw?=
 =?iso-8859-1?Q?p1QJtd92zqUfgaeBCc1mjVnmdMLf1UVqW3yY7H3wWxGtkHw3Ap/izlENqU?=
 =?iso-8859-1?Q?QnUTGxlikULrz8ou1ike4X7Eegusa8udUeBRDG0949ksNkJc7eEFYalgDV?=
 =?iso-8859-1?Q?dS58wAoFovl91tXvwp0OkbbIeHvOXa9rzuxEmltvjASx0m9lFDF4RFK9uR?=
 =?iso-8859-1?Q?wK7tNQXJ4vghY38p2bhSyhFam+VWjkh0QHIIOcEK3qXwzADYX8AFNuuhYt?=
 =?iso-8859-1?Q?Q3NP25YKKgNaW/nxonMZayW963s17Wpbcg0e3jObyXVxxhUkqekfuFNE4T?=
 =?iso-8859-1?Q?WhbFstCvPn/HVO8TVQ7zchlNwIbnJtnW5yqLvNplIHZq5Ye1t1UUuvjX0H?=
 =?iso-8859-1?Q?t350XJ0Etbi7qu2XFY2vxU0+iLp5JGsgRzyjAR7GKoyjyl+WANml/dn4le?=
 =?iso-8859-1?Q?3u81Xfju4E0F6PIC32ZqtRZiGQcd9O0DRf8Cvpt4lwzMOYQkTXi7FuCcSQ?=
 =?iso-8859-1?Q?KgG0EcYMTtir/g4XLnwr57fbwGmRyqmFNFKa7ZvEFtCngYZhgV7Vjfbsb1?=
 =?iso-8859-1?Q?F9DTHZPtUSVfSVq5Bmi/ZZDM/gE6ynIyCZS6cVZ/9jv2YhDJ453HEasYK1?=
 =?iso-8859-1?Q?55Zb+Am/op7R0hbJJkfTNp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8l89T6c7hFss/jChR2Mr48aJvfxvthXdACFAXU3VT/4xU2M7iw3bkm2sT+?=
 =?iso-8859-1?Q?ybbfu3eYmTBhL9dWO10CReatCQQJDGFEInzBe4TTSEQvjBwmNDMJdErS+k?=
 =?iso-8859-1?Q?4NF5CqY68rdUWe7kWDKF/wQPMS4cgBVNEN0YJkU55qvIiSlv1JdUWh5BCh?=
 =?iso-8859-1?Q?rCiRfX9Zr0IP7YeRj7k0lzV52DCjJCoc0hHPmC69kiHOc0J+XO5OH+iEmQ?=
 =?iso-8859-1?Q?eHysjnzWKnXE3fOqoL7zAJwA3j+LFHXypLgwJgl6IhpWbwq9RFBb2Mrc4g?=
 =?iso-8859-1?Q?XhEK3EzOLvKz102eOApDE23Njeq0lAdlrbupK6HzbbZeOrtjrXLIH90eRv?=
 =?iso-8859-1?Q?2f/trMDkqjEKiC2kbCOU0tOr98ymwHjMxz2jE+h3WdclsycwxwzbIGh6qH?=
 =?iso-8859-1?Q?3p6xfu/W1+yP3phCK70ZjH/PBq4op7LyD1MdZxLtCqb/dKPQE4Vbz+74vP?=
 =?iso-8859-1?Q?SKjuj5K9MY1p7Mdh1q+ZZqIZ1r6cA3gM5FdgqzLjxQYfTfxh4c/K6UNbwB?=
 =?iso-8859-1?Q?37WbmGxMCDSa563V/xrU5M0PbLhmMPvlqeOZELxLPt00GAVrJX5S5NeGbI?=
 =?iso-8859-1?Q?N8pdZYRDTJaVsqUOY8qx1gLdp4u6uBkrvNBvhcWcT3SDh2yiqE8g63IXHA?=
 =?iso-8859-1?Q?2A7/XMHfjarM0oqoI458iJucYDOCZAVcUlS32fQ8+jyipNiZEnoX/VlnUM?=
 =?iso-8859-1?Q?45mTcsFsJuxn8LAjID/QmSSMvYyhOxl0jVamuCOfzh64zqKW43EGQbyTcD?=
 =?iso-8859-1?Q?J27MGS1GX3gmqs7uhOmVbBh0m7i/CV9zfBgP/6AXDQwKIQ+UGFht81SW21?=
 =?iso-8859-1?Q?ifVtFywfv7NxvDmOKiXk/j7jvjeX79VOuuhgS6wJiCjGpIFoHm6/Vxk2B4?=
 =?iso-8859-1?Q?eqa29PGp+5N1YzCRIgJXGWN0iadzovAtNLwytdr42bU//T6TsW/ne2inPM?=
 =?iso-8859-1?Q?lsy21UzsvQQLaH3UaK1gi3b348P2ZjzvyG2fZX7Fa0BofW5cOyGtlSScNe?=
 =?iso-8859-1?Q?TVqqv6sFUbtqJ08s6xoVsCWJ3jnepF8hWzW4nFrj05j7uT1TfljKDzq6i2?=
 =?iso-8859-1?Q?BRjjKcWJszrwaVzuCWNFIxNAi22fiKI5ESv/iTht4ICGV8UoHhHRAbsTnj?=
 =?iso-8859-1?Q?vitkuWU9XP0E7ytj7TOHV7SrUn3d5eRMLTFuuBRQs+cJ6Wmg8G0bRXlEYZ?=
 =?iso-8859-1?Q?svfUp6XYxL+eN1VoFcOXDrgP8zqDK0G2guILyErPc4GGJodMJYAFCPkYeH?=
 =?iso-8859-1?Q?6Zralt+xcE4Vv+sIiysRDLgmajdTmARya7s+xilBghAH6wZFOe7stcWSAP?=
 =?iso-8859-1?Q?pP7W2CKZBWLz1ytLUjYtybB/+4GHdQsrV6/+pmqbLv6WIft6Z46/9LBNiZ?=
 =?iso-8859-1?Q?vloz0cx/iixPV9eD0CxATG1Ju2yMU+7hGIKclJf+1RnlJmv3Y2K+ndg+bA?=
 =?iso-8859-1?Q?t4q0/aE9wUUGolh89/qSot81kxTpT3i/q+uCoiOGlvvxng8Brr3VCIfzsO?=
 =?iso-8859-1?Q?3S9t0bR4kq8A59TEXE2MoF1NhESgUieHOXaJfvs0vBKVnMQdC/RpRTdAn7?=
 =?iso-8859-1?Q?RgtofxbzXTyXvWPewq8I8DCADuc0GTp/uiykDLoS8w8mvPYFLw6zkoKiSA?=
 =?iso-8859-1?Q?3nsoGif7sco25yw7Rso2bc2JP/iUmxIhnp?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e263d147-53fc-4eda-80bc-08dd308deb5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 09:13:45.3070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlem+o2CQOeCVhgl5Y1kWuzd5spaYPeOY1eU0X81d/W1TBqDC9VjS4Iq8kEZUNXQpGB39fQiGS3AsLVloyjYEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_011352_620529_2C911941 
X-CRM114-Status: UNSURE (   5.45  )
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


On 07/01/2025 08:58, Vladimir Kondratiev wrote:
>> Document optional property "riscv,hart-indexes"
>>
>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
>> ---
>So you are going to keep ignoring comments?

Not intentionally, sorry for this. I saw your mail too late, after I already posted
"v3". So I asked you how to better handle this. Perhaps this lost somewhere in
the mail thread. I'll repeat - what is the best way, re-submit patch set
as "v4" adding missed address, or re-send "v3"?

Thanks, Vladimir

>NAK, not tested.

>Also:
>Do not attach (thread) your patchsets to some other threads (unrelated
>or older versions). This buries them deep in the mailbox and might
>interfere with applying entire sets.

>Best regards,
>Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
