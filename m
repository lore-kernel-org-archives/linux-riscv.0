Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6977CCFB443
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 06:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D14nhaghJ54zghk+0zlV65KPkkItpT+c0LEgoO8KmdY=; b=F1LyrilSDJ4eLp
	FCj2asAB2J0CNRMbSEfj2TM07CnZS4OJ0696IyN/R7vwkZU3jrjH7ZAnMqCR/WyTR1ppnBIsH0pG4
	SR2znIVCs867K6IPl4grfPpmajiSRfSI0cUSliOldDxMkqs3mNu6e8hHw4s8BiLr2YJE8I/6hD6GY
	g+sD7wNhHqD4BjmVgsmS0S4FKyD668gfG9SV6uvrb1E7RieZWWf9ZG7sjBO2p0MWZb4Taf9SXvKBA
	CgZIuJ/y+jKYRb4R36O49wt6ENR7GNiu7PwBCjGY61c9ue4IY+qHHIJ//SJC/o8DnzzABqcEuTVgH
	u27a3QqCq8/H9f1F/rCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhIO-00000001RTm-47qU;
	Mon, 07 Oct 2024 06:32:40 +0000
Received: from mail-am0eur02on20615.outbound.protection.outlook.com ([2a01:111:f403:2606::615] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxh3X-00000001OkX-2NfT
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 06:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHK363FpNGOGuv5yc6RNLmzCVuF8FbPCnrlPDsoqKySwD8KfjfI3NV9WVLYzNSp08K2gxBezgenPBAXWxng0xbfEr9hHx4PMPY9mP/z1Vp0rouGXOWn8g6kqbRThgR4pMpfNJ8gKmu7FFut5AWnNH6J2IlSEKOIeakSrlem/eNWKM35D1EFxhhv4+Q4i0aRh7gJJSb0iRqMhpBsbqp0q04f60O3x2OSWyJU5JsOYskPFv6RMTfYk8OSHXA19q4es4stCSMwLlUi0ovIfwYID0thewSbc2LZkR3BlKzERJ+aydxPMNVcFZOvaHBuWvKIA6MtWmLKFP0L7l54DP4ImVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOlT63lqIzaUuKVaJoHDuip5Znhy4Nesg53TQhpEKkA=;
 b=VdBuaQPmE2IKXwhkBN7UGVi0MpRVjLdv3sp9tzWkcajIgR49hNH8ZBGP9QQhQ5nv9XP4BDF+HaXOndKJO5qHc8omkQte7Bg3rxwCI/NzDY1484Tkl+hSbAVER6ceTA8PTZ2ETD55AnlmPG9CdL5pXsePwCoy8uVw+CdUifWkhBBBpoNV1BJyz7SUM3rE60ENNYbJBCEQy/zatgisg4Dc4Ut8wWlXd9ixjnlwP7BSte+KaacEgM6XNcvAEiDSa2hFSE3LwLn6H+s8pRNUNqzODVLF0VdHmcnny5U+t6oquEFrEk9WprXBhwQWg+ouL7kOaZ+Uk5BGh7/G+I5zuz7yhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOlT63lqIzaUuKVaJoHDuip5Znhy4Nesg53TQhpEKkA=;
 b=RQ1GqNHIH7Pab9Fd2Si5tjo73RNZ0MexsRcEHijMvL7kZjlaoFOiZAVwA4cFyRIWqVaQUuF/JvDj+psfDLuEzuiJ6uaMN3h/eWBxaVVxQAnJCCIdxMh9TAGqow7ie8LB57bW9doiKZbB4HbJ+KX2nDHxDCpSG2ZQEQebN8n1KXM=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by VI1PR09MB6735.eurprd09.prod.outlook.com (2603:10a6:800:1d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 06:17:14 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%4]) with mapi id 15.20.8026.016; Mon, 7 Oct 2024
 06:17:14 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Christoph Hellwig <hch@infradead.org>
CC: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v1] riscv: make ZONE_DMA32 optional
Thread-Topic: [PATCH v1] riscv: make ZONE_DMA32 optional
Thread-Index: AQHbF95IdP/goVPehEObmdWyR1OJkLJ6x3GAgAAIG4Y=
Date: Mon, 7 Oct 2024 06:17:14 +0000
Message-ID: <VI1PR09MB23335FF3B1274ED13F24AF06947D2@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
 <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <ZwN0l0Y_oUfDX8jl@infradead.org>
In-Reply-To: <ZwN0l0Y_oUfDX8jl@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|VI1PR09MB6735:EE_
x-ms-office365-filtering-correlation-id: 660085ec-693d-4f1e-392b-08dce697afcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?CldZX21fcx0bnOwZxuv2OlOoO2/pRslapLJzYmLc5RMyEOJIvA7qOPJ26h?=
 =?iso-8859-1?Q?Rlnpk9FR/Hwsatyo6cJEPzJ75bT1ixSIYugnrP9Gf33A1DkwRNg4yAjPKn?=
 =?iso-8859-1?Q?FCFkjokNKwRN9rlza4t9yvYKTM08gSx3oAjTnR2gKPIz6U3s1xnFlLbVwP?=
 =?iso-8859-1?Q?r6ln8XyatzZNIKbq9gLjJIezTPO191FbbOoEx4syH1FlQDk9PAArBMCb6d?=
 =?iso-8859-1?Q?jWsx1sVCN2WnfOhQNaLwU5V7QzLThG3knImcC+9km77rOZRWa3yVQRUD2u?=
 =?iso-8859-1?Q?fV5ZkiRiPd1yb9c9xr5W+iM90SKl7034uOMSvf///UPBxCgkR4PlvVmSm2?=
 =?iso-8859-1?Q?Qo50O/W/6bwmefHEfSlE77iWV+8+6s1RFXWVNcScyPxYgVODe3H+/uES4T?=
 =?iso-8859-1?Q?oCgDji9aJmaciLLV4xMu1q/yI4TIrtmKt1S3QidWlVRLHXEoSopkXL49wD?=
 =?iso-8859-1?Q?nLIlCf50GJvlluOplcKEGY7+9wEOlfWoPgbqp4ZNUVt1MVYsiLbczHonwL?=
 =?iso-8859-1?Q?9j5BQ1I5MW/c2Piicp3f609bsKC+H2KTW3IAAyKCI1mMT1dnJ9eqsNduzr?=
 =?iso-8859-1?Q?EUH5crvYd3t02pe+VFleMn4/mpdXdfFp90ve5jcrFQ4Up8/nZhqWeqZDuE?=
 =?iso-8859-1?Q?ZFrBC2fE0pigYquQxgKS33r9h//vY4H2wNkmrjYqX1ozw+xKvJm6YGJHdw?=
 =?iso-8859-1?Q?Ss0lNxoJ/b2iu02rdaop+f2a/FBAtj/rB3zNckYkbOo2xbb6tkG2PqxlBy?=
 =?iso-8859-1?Q?+k5NsXMuufLZbODHFUPC2sX3QxQcMdUWJrGAtnDBMN0sfa2xoeCjeeGU/c?=
 =?iso-8859-1?Q?TeKgdlT1OYfGEFRpHCvyLxyPQvbn4Ou1TRy58b5NBSYiSevs+HV44DXaww?=
 =?iso-8859-1?Q?MLWh4Ys55N4jzSG2G+S9/y276QqfnHTslzDGlT8c0ySd5VqgbD7YWCPEyC?=
 =?iso-8859-1?Q?4moryeQOpA0Zv08dJV5yMg68BtCFwe6L7TucOn0C9qV/rAaAQ4iYmQBkq3?=
 =?iso-8859-1?Q?ptvUuxk7cnlnFUIaMWgZMRy4OAm6fTI20fMNLZUpriz68JFWCe6k+5lpMe?=
 =?iso-8859-1?Q?M/6nRefMR1gp6Z4OBNWwxdM4Z0tngAg7ID4MrVvDrIbFpCROTQpJe7YvUd?=
 =?iso-8859-1?Q?xzWSJEVS8zwiSg+miE2QrIavxjuNEQr7hxp75xcETXR/ox8fUCHDJZ4/F9?=
 =?iso-8859-1?Q?MC3pVYLH54Hx2gTnrLLKMhaush2SnA+2xXoUCjSofZvoawwa2MK60onJE1?=
 =?iso-8859-1?Q?zsjMPNPNAPuPJdThUaNPgG3SlhzASYb6RYU/UdznxPhvxoB+9eEAT0dpX1?=
 =?iso-8859-1?Q?jEIKcbH3WkaMVpi5XmmrM+nEdVE7wl161z7gBnVTvQEgOPh7KB8jcIJx+f?=
 =?iso-8859-1?Q?tU72ROaK++VxWtLl2gD1IqPaB7he20AA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mGhvQP08jTvd8tzgl6ezPlzqGkK+FFfcMy7TLwruqGWr9rTH8qo9u6d1xv?=
 =?iso-8859-1?Q?H9FM16ATu4EuX71KsatFggjCHzGUxVBK3Gt56kBN6WxvJ+PnOiXw5gareK?=
 =?iso-8859-1?Q?OfWLbNvbWmSMEMxGx9gqObdfec+DwGwqT9puajW7MLoXTTEVs3vpdrV28S?=
 =?iso-8859-1?Q?cifnsC3sNeNDCWbXn9F0DOxOfTHNATkIfx2J2EYkHLZDBXKGn9Ny/wXxBA?=
 =?iso-8859-1?Q?5r5maHTmTExgv/Yg3uqrMgIuOhlCYfaKgWBQLYSn7d+8ZlCv9HQzg7gtmi?=
 =?iso-8859-1?Q?gUfP4KE024iheF59gBLXWMpkGDtFQLFOpm4HUZRLE8Qrc2I2SeTUVKkGFJ?=
 =?iso-8859-1?Q?H0+YOrpdbTO/EwB4xvnioVAQx8CZwTO0bWjQ0OtOdsrJi82dj7he6G+2qG?=
 =?iso-8859-1?Q?7vqeEiQKIc1Z/9HaSRxi8I+SoSalvyvOgcNwMm58gg4Neh4bUJhsbOwa/4?=
 =?iso-8859-1?Q?Mnc1CYiDazkfs/SCMVo8Xdnc/RVkRPxPfu4IcV+96nONvMibSAwth014MO?=
 =?iso-8859-1?Q?aDkoNKit2UVg+4gXMNhb72gYYXX0roZtGpgt6v539BL2O5GdR0TleLJ0qv?=
 =?iso-8859-1?Q?nFKuyUVS618LMTi2mYEXA6N6kTdJCqXrtptNfjqHQbj3DXS+hRLjQHZT6i?=
 =?iso-8859-1?Q?dV5hKBHK4TW45WfQZyJbonWqOX3+AVmYodwpASSVd6FEXE7rVhYm4D4khf?=
 =?iso-8859-1?Q?x42khV2n3D62nJi/8JveA/XuKm+iiOjCAmAG9dNeT/6DTepmu1ph78oFgC?=
 =?iso-8859-1?Q?Xr9L3cFUnbyob72+ZPg7RGojDdVW0gXxOmlY0Kz2izPE6bSc30CdjIWYxU?=
 =?iso-8859-1?Q?ntfS7RQJH0oxxGTxe/Krp1sH320uwRibCnxrB4qA5cnATxGdZNq2/ip5a0?=
 =?iso-8859-1?Q?Wac1+F5jRE+C1nzu5CG5JgZHvxR1tcYpl4XtzTFBrptn7Bvn50sVIrihns?=
 =?iso-8859-1?Q?n48MeBJnk4lLoS0aBjErAGj8UNjO/65SVHqLK4XprHowNyIPHIgMuiWt+Z?=
 =?iso-8859-1?Q?TtGS/dVSIP1F3WNJZ4txsIzQV/J/otEQR6pXFMPDxio/0zd9Krk0m5pHqE?=
 =?iso-8859-1?Q?G8wDmwrmopdpWvxR8Gp1UK6r7uWuRMD4MU/D6li0EGP+IBYMx++UCd57DT?=
 =?iso-8859-1?Q?dFy6rd7vkOzN7tu3UQLpfU+neNmQkRj76uCMt4EygyR3vB5PQmI13TebnJ?=
 =?iso-8859-1?Q?r1vRB46D0krkx80uuTKtp26cdVb23q1iDm9KWU7RwoooRaO3gGId+EaWaG?=
 =?iso-8859-1?Q?PHY50ehXkjkHL8iFMHwFFf8AxJFTj5V91KbMiIrJbnVLfuiwFTL9jwupO/?=
 =?iso-8859-1?Q?3fKwDouuguNyH6qDrXXo0/OJp3+yPDZ1dQ/SSUS/GQ03my2RVJg6XKFr+D?=
 =?iso-8859-1?Q?isYvIFBpeHrpsVvqbQ2DVCcCIKzLwUxFlvlqCFJFQdRuReSt3zONFQs7rh?=
 =?iso-8859-1?Q?tdQYIgbkqLYFdme/H6g13nZX8xGQaZgC7NrPL+LQs/sDwSNJb2svhNOLBs?=
 =?iso-8859-1?Q?xANDcOzW2XpFZbzmnhynK5SYwsGb25j67t5U4xEGDPYN4vmVdtqz+Sq++u?=
 =?iso-8859-1?Q?k40073BdbmgZhiwKyOSESk3btUfeNUuY5Xo6C03atARSTvDouolcNDaeC8?=
 =?iso-8859-1?Q?He3MO+nYH1wh4eDnjkcJIo/k3LGwzbdRhK?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660085ec-693d-4f1e-392b-08dce697afcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 06:17:14.3521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHHV+/JLiaUzNVlZKOTVaHF8zPJ82iFVG68cqbsUPhi/KliJWY15bJGex1NRBdPNxErms43NbPxCtyLSC6eQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB6735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_231719_809688_D201B3BF 
X-CRM114-Status: UNSURE (   6.39  )
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

>Well, this doesn't get any more true by just irgnoring the previous
>discussion and just reposting :(

Sorry, this wasn't the intention. Perhaps I messed with the message-id, I see my "patch v1" in one mail thread together with the previous discussion, but not in the other thread.

Anyway, I think making ZONE_DMA32 selection depend on NONPORTABLE answers the concern
that was raised

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
