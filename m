Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3E3C02185
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 09:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ELAykbKqTDR+fSGV3BCXc48Z6jqktDyDrz69hKRTs0=; b=2+1oAyqvPEsQmJ
	m4yjFm1Jxh7DqQtOEI4oTruY8kTcHTJ+5q9qsbgvjFvWLzNzG/1bUpB/yX+9R6H9o/UfqagEDxkeB
	NOJ3XS0qKpVr6Pmsk52qhW7RlDUiCc2BlJJrN5Isc/Q+V67pvu3cyQXRFR6HnDiu0r96p0O5uYgWs
	0AYmo3Asq7otnefvuTDrg8M3ETqY/hPPvQfAnbt4ZaKSx5t2yM0rMKR5TnzlHge9xQMmeyYVm5nwC
	f0UF6DmzZv8HrrsddlONu7xx7exEoHIIDLkisWQS185VJz8taY8l4f1xk57l07YOaTfah0YlFU6u8
	jAVs+PWfemr+dpJ5g7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoZA-00000005Gey-1hGw;
	Mon, 20 Jan 2025 09:59:32 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoXQ-00000005G5I-28AE
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 09:57:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL0PTSgciZZ0mTp67ECIJUj3cW0OowXwnAm23xRqDKOfekKNrazxS9YACDsh52hpOpe12ErYlZZE6NbN9hBxyX58XnDVnxXFoS3ynpDjU0uwTMJRwebMEcAADyGnvafjRWVYpoh1c+k47DiEfNqhsfXhYuKySXxZQ6r6hwMmvU12+JrY2QHF8jBh9+4RcZr6GeKwj8NbM6H2uy+PyfDpKEY9sfs3YVMhaTuhcbbDnmf4+hDLebCAo13P1JduVmu86+ndHK/DfC457XI2nj2cN8Eisd/p9W4gaemgVDbz8Ytwdp6ta8i9/1RUuKkCllErk1BOZFDwje83iiRW+xJANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk2nJUqkoOXVpMgdz4vQkoi6HOVnYQGulAmCAceNZoM=;
 b=y+ZirpG54eO+N/dlOQ2cDmCLsEJVBic+cqWSPRMW7Xd8baZDPKhzMHFfOwfG34r1riHBiORJo0ZJfBVCh/ZD8HxRzNVcoEVMW8ZtsTd3PnkgxhSUO91U286OmiMR3SuV0HYmOpUYPRnFXJkDyTRqOZRLPmJqiQnl/T+Uxe3BpUX5a2Pkk8biqkys4no59romchQ+K7zOEhI/HhCIlHmrhbeP+bbFBp9c68PxdWrCsQBCRGKQ9kOPULkGpXOrO4g+0ygo+movSlTmJSOwcSEFJOMz6eh23+sEQk6Kky8JbdBXWPhImGh++30L+4tnyB2Q64LF8nPs6BKpnmSBryinJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk2nJUqkoOXVpMgdz4vQkoi6HOVnYQGulAmCAceNZoM=;
 b=o6F3YJnEeEWvekF+ma6DeWojzN0BMCouF48fkU5DPZ6fFmAbdwy4tamCf0OQeMtRp78iBg289uy/bwrZlyzeiWg0tQQM2X7gfgkszY76G9AFbHCBGIlWwhngRumgeXZUmIFQXz5aSxveoYP6KwvS7I6dT5K0sG2p1wQHFjqoigc=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by GV2PR09MB5913.eurprd09.prod.outlook.com (2603:10a6:150:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Mon, 20 Jan
 2025 09:57:34 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8356.010; Mon, 20 Jan 2025
 09:57:34 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] riscv,aplic: support for hart indexes
Thread-Topic: [PATCH v4 0/2] riscv,aplic: support for hart indexes
Thread-Index: AQHbYosFYyla6ruZ50C+jmEaFG+rqrMffL//
Date: Mon, 20 Jan 2025 09:57:34 +0000
Message-ID: <VI1PR09MB2333B79BC237FB5BB03893D394E72@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|GV2PR09MB5913:EE_
x-ms-office365-filtering-correlation-id: d8cb3c72-4273-4851-dc90-08dd3938dcce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?d9mGSDK1q23TNjPz+PcVPDb/2IYehNwy+XEuamzBYGQzsJSjO1QZ9G5qEI?=
 =?iso-8859-1?Q?I8hsNhFOSqcm+Hd+LDQalSXN7xfmb2I13lnbUEzqeBuKgT+bLRSWEgZR62?=
 =?iso-8859-1?Q?pKcFH5tQCDQRHlbUkDZ3E45+Z5wea4qIqciC5eEsyHG3n1D7yi/fV5bpdP?=
 =?iso-8859-1?Q?HEpI/PBer6GhvucjrixaujrM/Bnr5nrv6BPbh+aYkHSjGCz3FccSXCofbC?=
 =?iso-8859-1?Q?zXvZeEaYDwojrtrWAC6wQU632NgJyhU6bVHAoXlr10kTaghU/3khPq1d5i?=
 =?iso-8859-1?Q?9znFCBKpoZBjuiKGopYrGs6xBycLaRUpEUWPpP5FtWWxuQB6uZFmea1ZX9?=
 =?iso-8859-1?Q?oXs/V/pIlkwi5GvTFl7AIRtjneSE/YWYHBYH7wsvkOfT/Qkxs9EJg11DDs?=
 =?iso-8859-1?Q?F2MiurvRzLsFxYdsbQNcIxc53GotnLtki5P4J7RQZhxa/FUsHSj3gPFwT4?=
 =?iso-8859-1?Q?waEM7Sd80U0u9tJfR8A6v8OUtRnsHzv95kWKy3SH7PT/bvCqFSpxGSORc1?=
 =?iso-8859-1?Q?5OmSrtA0X8s+xMarG2WzSZXGGKPnhHCoNkiDsEIaCXN77aAMYqthx5u2kL?=
 =?iso-8859-1?Q?ba9ZrbO9PMRtPUjVDnZmZ8JkNizlBntJ6aWwg4CKTxIMfN5NEKBYsy2Bk4?=
 =?iso-8859-1?Q?OVAhx2caVp9Rki4ngkJJoBCGP54JL7GRNnQpJDic8vq7xOP0W1oyUeT5CS?=
 =?iso-8859-1?Q?WyZFd5IRYCkM+kubIosqVpXmGdB+KophGNJ41Dcy+td6DuvbVWwMcjQgRd?=
 =?iso-8859-1?Q?UsSYUtrwP0bXW3eSDHpD7BzXp/m1I8efjdYDDwBDSHJjVuYBFciv25XAl5?=
 =?iso-8859-1?Q?K8rqn72Sm0gr5RhVa/4U2kRZ6cEEOmCyJqkqpyqndLYgqqtrycOH1nRjqr?=
 =?iso-8859-1?Q?jbAe1OWPkzGv17XcCITkcx8/pYbycRWEPxAYkkkFrqy0tqETOHc+DKdel6?=
 =?iso-8859-1?Q?40XtxUD415hBe1wZ0y7SopYGOuREHVqOrtnJcuhwQ/RopHwXz+/sgWfc0d?=
 =?iso-8859-1?Q?VYYbuO9+8KaH3Ri2x1bnOuyYQ6k7o0BipY7ioYv5AjgdTq6KXZqy2AkGbV?=
 =?iso-8859-1?Q?wwg+gfjaILi/pPM7WXRrXsKG+CB1/4HzuS91hQE5m5oHSUm8qI7FY25322?=
 =?iso-8859-1?Q?AaGvh49iuaIosUZ7fNW2QcXt1dU+q8/3MKKwtfJC3QD/AVmT7gLuNKirvN?=
 =?iso-8859-1?Q?U2ssu/4J1NssVAOwNTKWOGwpV1Oh2dLVVPpNSLKVhN8FMixrDkmAZs4/2+?=
 =?iso-8859-1?Q?OdSxAZ95eu4BbBAeLAVpEnvWUOWzj1bqSWYtT8r39kUxC+y9GuHn4nUQG1?=
 =?iso-8859-1?Q?894hvZPoWERy9i+kb4GCRYeZyg1K543RT+uxtWw8RHyf55s1osbl4U2l7c?=
 =?iso-8859-1?Q?vHeGWUYgwc4JFq5Mvl0I1p4n2N+EKfsToe6AURg/xwNq7tQpzSF0gOr20n?=
 =?iso-8859-1?Q?zm/OL9ryRZbE7AWGQe90OMfXwXD1/BDwXP9E458FcUS8/mpO6nnIZD++LF?=
 =?iso-8859-1?Q?GMW0Ky+r+g7MY8F7xYVtE6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DyHV4Bj6IssX7N8k3U6b1fTRylnk1ZdhYIi4k3RkkCmH5zR/p0K4CyJKMH?=
 =?iso-8859-1?Q?yDzde4fQruqS+dC7v74nTwvgzo9HyBWyQ6chHIryM24NSCXvkbGhhAq/gg?=
 =?iso-8859-1?Q?Ce4CecDlIrBLIeJgAkb5mIgtFQVQ1iPSk38JbNG4bCUEUXZIkd5dMjmM/J?=
 =?iso-8859-1?Q?V9MjTwbwJZLyUMxsd64nXSA35QIKf1RNuEdT+ShZU6ZTFYl2hJwbiWe/VP?=
 =?iso-8859-1?Q?9mPJ/UafXAfodYUNqOcNNYNgqGFY+5QGIRkvVUUXNW0lYhwNqxcdt1f9/1?=
 =?iso-8859-1?Q?1fm5nN9VFoRYxq7gH0wFzKODDPUlqSW1QVxdOekDaGOi8MM1bpfrEIfI8l?=
 =?iso-8859-1?Q?cmgbESHYu2H7QMdgW8om7lnLZFjcDg9/P3MwTSdyKPQP8NJ2CghEVoYOwZ?=
 =?iso-8859-1?Q?uv0edPhkrDUAC9IcC5/cZ6FD/j/uU6tCyI+pWzThSxlFTGkS6vgi/vw7/W?=
 =?iso-8859-1?Q?7/0a5GJNzuVqxWZzEZMTWrNBw8wjYIhBPDkFPyRupJmm9FCYCd7z9mhT9q?=
 =?iso-8859-1?Q?c/bk0zzsiZlpkghw20EOr/qyFJMU8ce/0Rck/3eXbsdN131jRIM5jnIBLH?=
 =?iso-8859-1?Q?FHBKTKjn2Q6fyF1s6gsOH/KMPKvw5qh1QIDSO0jskUpzFsszEVdaS4yQ4i?=
 =?iso-8859-1?Q?HKNn42K2aaOOeF0ubiROuKUhQ2n/3FOG/1XpTOkjP5p3/9J2v6dYZIlISu?=
 =?iso-8859-1?Q?X0EVB1XDXyYilQLNIGEQ/jxMfbiAL+MftBr3U1RAs4Oif9lXtOPubEB9q/?=
 =?iso-8859-1?Q?8yMIsR9c+J38HBONbj2aeN4h4zH+beCP3RpPXDTrF9g9fbYHf2gEBsURmB?=
 =?iso-8859-1?Q?X55fhZOLP7TOh/ZjLhsHrQtK1vDnCFEY5Qd7MQALsgy80EzTnJXVqIRas6?=
 =?iso-8859-1?Q?RkGIEtSP5zG5DReydx6ewV/0vC3IoAvaUkHQa8pRRUwNses64Od5XJ7vdT?=
 =?iso-8859-1?Q?1jDaPxCa/53Y8KyDslCIvNXv9N06WfA2NqBeizmZXa1tKff80vJDbotU/2?=
 =?iso-8859-1?Q?rgcw03etiKddbSRJpPVzq6TUpPuDMdEubqJOxZfpGPOrG050eAGLRxiHFi?=
 =?iso-8859-1?Q?7iy264m4RhKCyGjZNaOMaMYmYfZouz0pTZmRIkyZhm/N4BW4iFOh8DA6Gi?=
 =?iso-8859-1?Q?LmxOhSluKGq8Vy1FtOHwIMWZVF4ZTkgMLjKZBszTRXodx7A0kfOrZqCllK?=
 =?iso-8859-1?Q?exz1orKCyo4hOZHqMBI6RpQocYZOaULpewvQYlyl01RNCvDM3oqkGEIDGQ?=
 =?iso-8859-1?Q?WY1XwVZ1k/Kc4kT8Dpk0dIKZtuuPHn9qzyRvn7VtsrbJe1ydye4dcaoogV?=
 =?iso-8859-1?Q?wXivdp8QmJWGkuDZUHT3dl8v6BkUD8iBmtD1ZO6Y4irumu9hB9RozjR0Lk?=
 =?iso-8859-1?Q?DD7rqZJ6i/Aw/X9GoJe40cvvdPCQrZovE5zWtKkc0YJeaRpCpg070sYq+l?=
 =?iso-8859-1?Q?ZJx+GLS3Dh1/nxUF8ZpKpH2R7khKCcMQZvGBL9j+0mblG6p4cKjuFK8o3d?=
 =?iso-8859-1?Q?PARrMnC43whakvZey6kRkjzLLsJKiNZSK0o3OTSvO3hJCcdEfOni5Q3/ER?=
 =?iso-8859-1?Q?GM0MKtJbKHkjE6Yn4jba4eq1i729ickgAacN63kgZvHkxIEzQVhI1NYv8x?=
 =?iso-8859-1?Q?9ZEY7T+1N2TCFf8WHtrDk8eIENFPSCQboD?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cb3c72-4273-4851-dc90-08dd3938dcce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:57:34.1839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYOmxEgKxZ70MrKUq4Q3ipaMY859FArnfHw4yoRcRuVtO2nbbWf/uj/AVSyczZjIX0uv8S+yUuiDYOVYXd3SFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR09MB5913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_015744_752397_A6B3418C 
X-CRM114-Status: UNSURE (   6.79  )
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

Hi,
I want to complete with this patches, and trying to figure out where it stands.
I think I answered all questions asked about this patch set.
Any other questions/concerns?
Shall I do any changes?

Thanks, Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
