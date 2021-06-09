Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27496C47095
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 06:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC255610A5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 06:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC255610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nLAhIJgk/NpJlQ0Ez7ex8bU2V11BLWZyDtgCeDisqY=; b=rc9wsY0Cj7TPBv
	S/JL9oTeJhdXZfxLAXVuJkvMqMqjGJUybbPdgoBGbKQ6k5vnWKAHq1hgJbH9PFt7wRn0Zb6jtTiX1
	VoKwt3A7Fhez47pRauzhnnGC0Rq4xBsz9cMXbKudjfcaMC8wVhVKaEtVZ/IWLabRmIa1tUXpHtqXy
	eH95HttYUC0ubzKgQBG2DSyVKavXgf+4+6FseQtG2hyTk5HAyGgDk/hgCxjD+fMbBRp23XkXkD1tS
	P+hIUiVWa6hqfth9fBMBjp59jib/mh2U9TKtlHrTN7L9HWiVweQF2Atb2mgj8r6qIIXlaPDn4gdD6
	eXwyYW/1OdaiCkzYbsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqrLU-00BqwA-TR; Wed, 09 Jun 2021 06:05:44 +0000
Received: from mail-dm6nam11on2084.outbound.protection.outlook.com
 ([40.107.223.84] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqrLS-00Bqv9-4f
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 06:05:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8PgaVTNXET42QV9zCoIgUIA0DW+bEwgw3WWWWmR77PkITXbk5+Ypx9NzglC5oP8oJUun36d7ud+63IwM+Z71gFGUMJ0s5/YFj9x8AFvLLbSEmSbVDuhVwuF+5oRQD+oDNESbkfFveUYOGjoBF5ua4+P6pD/EdjhgYDqPTyy8RpsUPoFf2jtlMHwHOAqwzvK7oEplOVIFCxZBs0DJuiOLU2uJj/dwD4YRupaOuLEGWWRp0sIeCrlTIwLj58+3VwrbL3tgSU0wiZtrd6iHL0iqIXNDhMIfusbSLa2rYp0yvJP3dD9fE39TDKZbVhYPFLMfVv25GZs14p4Wqb0oJdthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJTYHFKEvcJW5yuJvHYivybqE8KFb25n7flEo/NXteY=;
 b=PhNj1fQVYGV3jqSdqzI9qZFupgC0wW/x8EL668QgHpdcwJu8w39fezvmDMlnjYxB9RMtB8FB3yx++pU8x8QQNG+lckfdPfqKABbpCkCPWp5WIiE4SX94Pqmnv5ffgZ9ABVxqbkmwb8//3mHfC328JCSfS14K8dAYak+5mviT4ttmRTLCWW7mIXt1xGWMTabhEHHI/JGqNQLm4pQUJ35+kb8rZzF7BlvPZAxBHNi17KO6DXpKFyDaH4VYb3jUHzzIgNc9VR62FiA+uB0BuJe3sfc+2kOrQZVtG7Onl20NY4gk/ZbFX8/FXEDkE0YjG5UqMzq+EsE2/9PjgMkKjXMXbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJTYHFKEvcJW5yuJvHYivybqE8KFb25n7flEo/NXteY=;
 b=bWYZr0w5pLHGzxcOwPlBwcE3hZ5kf/xwciqltXiV0mN+xDN5VhrdWEwoflylxv7sLlcogkFccnVWgZhFilY8sezt3hkk9B2SVWfOzFfD8As9cGNHtqrlzuaVZ/i7OMC2iAWRT3ZGByqxi7mdvEMK6MtXpWVVyruKSnV0nv+xXrc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6058.namprd03.prod.outlook.com (2603:10b6:408:137::15)
 by BN9PR03MB6092.namprd03.prod.outlook.com (2603:10b6:408:11d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 06:05:38 +0000
Received: from BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::502a:5487:b3ee:f61c]) by BN9PR03MB6058.namprd03.prod.outlook.com
 ([fe80::502a:5487:b3ee:f61c%4]) with mapi id 15.20.4219.021; Wed, 9 Jun 2021
 06:05:38 +0000
Date: Wed, 9 Jun 2021 14:05:21 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Guo Ren <guoren@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Christoph Hellwig <hch@lst.de>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, "Wei Wu (
 =?UTF-8?B?5ZC05Lyf?=)" <lazyparser@gmail.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210609140521.3038e40e@xhacker.debian>
In-Reply-To: <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To BN9PR03MB6058.namprd03.prod.outlook.com
 (2603:10b6:408:137::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR13CA0191.namprd13.prod.outlook.com (2603:10b6:a03:2c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Wed, 9 Jun 2021 06:05:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35e66c63-5c4a-4713-c880-08d92b0c9a71
X-MS-TrafficTypeDiagnostic: BN9PR03MB6092:
X-Microsoft-Antispam-PRVS: <BN9PR03MB6092FB3E0AEEF4A2F54EAB3EED369@BN9PR03MB6092.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2fOxA78HXwRDfbQKpeTHSv/mfqudkIq2CzGCQ2WdqWrWnbJavZpZfg+DdmAS/QqQwBpFqW/Js4h1stmDjTuz7KO217pnVzD1RFybyrIR6PSJV+d78ORZ9i3JIEhXPNVFgZHUmUD537IsKyQCH6DwSrUhfEyxXEmuGEhaHYVplgSHz4DZFO/3q6YWQeDsIhCyo6trR+wz8+XxjxzNz1dQq1XyV3O3Aj885x8e6jDE3wBgyvDIF5+xoyHK8yl95rcSxOHOOzkVAJgpl90Qoqo3kXq36BLE0Jvh+a9pR6i4Ih4z2uf/X9Y7yeInCBY1pFOlvNsVXUE2FEoJR9jZkxVLi4cmEUi+8+78NZNl6AaVzRQW6I8M/EIRHLZsvCE7R2St1VBG4TYFyFZJ3LkxmFsF5mSnsmUhnZIVZPQhhjCEFTlxjR+11lMVWai2KshdfBfHLNCnIsw1UOYYEVKfd1BIPjk+nyosg6GY6I4ZnIkf0pW7SKkvj1RCEn0DWz+v4wY8RFeq/LNmX9eHwwN6qEZaf6dlpCfxCDKUtXIG44XnDxYzGCH/FdqK+LD6h5vg3Ec2JBMQjhSqjdZRdCw/Zxm9TiSa3YhCAG9Y2MkHKx5PQLL2ATTXnHBUF3v1y81G2lEcb7ZozuJZojQZleEdothTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6058.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39850400004)(66946007)(66556008)(66476007)(83380400001)(53546011)(956004)(6916009)(26005)(16526019)(86362001)(186003)(8676002)(7416002)(6506007)(316002)(478600001)(4326008)(54906003)(55016002)(9686003)(7696005)(52116002)(5660300002)(38350700002)(2906002)(38100700002)(6666004)(1076003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVNJSVVuSmlyc1JmQUR6a3JZMkVyTTFUOXVMZGQ3RGdDdnFYWW1FdXNlQ1N3?=
 =?utf-8?B?SDJVenpBZ2MzS3d4UWpMUjVkS1kyVCtJNnpHclVPUXYwNlZsWTVFNkFUSzRH?=
 =?utf-8?B?TmV6NXd6VjZFMTlVRllydzZhR1R0OVBONWQ3azZpOC9wbE9jdVZoQnlxbHNj?=
 =?utf-8?B?RHhVZDNnY3ZSc2tRbEZrOEtjaEJDL01VZ2o2QlFNUUZLVWdOaSt6Y013MExa?=
 =?utf-8?B?azM1dTByV2wrOGZRbnlLY1hIbkh5dStPelpRVmNJOWxsN1ppTStabTZCY2dJ?=
 =?utf-8?B?NlM1QnBueEZraUx0M1lONkJ4aXRXdlI4TXd0UHJGcit6RVBtRGgxK3RuNmpM?=
 =?utf-8?B?eXIvR09HY3ZCY2RobVorU0xkbm5ob3JZaDFvUHZEa3p0K1QwcFJoWVU3M1JW?=
 =?utf-8?B?MW52Qnp2YnRmREttNlpYd3BpQ3gybTh1WVpyUTNTSGhtczdUdWZKV1p6VjNx?=
 =?utf-8?B?dVc3eGtUT0dScHFNa1E1WVhTYWYzdkhJUEtjMDgzeUQ4WXZoWFRSU1Nrb2x1?=
 =?utf-8?B?SjJiYVAvS0hZNGp1VkE0ZkNWenhOaXNYTHFjTTArUUNpY3ZHR1VNbmFERzFz?=
 =?utf-8?B?Z2lPcngzbGc3cDR5RmFDTzBrUEh1MDlka0NwZUllL29QRmVLZWNJY1ZFM0pK?=
 =?utf-8?B?K3l0YWV0bVFSSW1jczc5cGI3djRoZEc3emM2VzRkOXVGd1MySEM1clBXWTE3?=
 =?utf-8?B?aU9SeDh0aHhoU21aak1KTEpDNEhHOXk2ZmN1b0lLRXpsdjRnckNUSUpDSlph?=
 =?utf-8?B?ekUrQ09KWDNJM2d1aXczdVluSmMyNSt6RkRza3E1QW5nY0p6K2Y4dXU1Vjh2?=
 =?utf-8?B?eTh0clpOVENEaEc4Ulpha2VIb3ZFZ28xMFdlQjJ4VUtVS0JjRjlaVWVZNHNr?=
 =?utf-8?B?Qm9vNVd1ZFRVdWhxb0Y1ako1SytjLzNUWW5uYlRodGkrQXE4cWlnWjE0Yi9o?=
 =?utf-8?B?OUNFN0tGTTBkbWZkQWdlYVQvQUpad0RQMmgrUnBRUHJYNVROQzQvUjYyNFY4?=
 =?utf-8?B?dkVvTjdZSS82cU9KSTVOQisxa2daS0sralhFcGtBNGZ2cEJxWGRlNU5zZ1dH?=
 =?utf-8?B?N1c0QXVNblhJTGJRMjVhVlhyOGtRQm1zVnRGeCtMZmVCTkd1aEJ4UllZSkt0?=
 =?utf-8?B?aURoNE52SlgvQlRDNG9xMG5PVHBoL05ia3dnRm9BWXVVZERpZlJMcWh4dzJX?=
 =?utf-8?B?V2Rtbko3UVIyNDY1bGk2VVRWSXpMbjJYbEdFMEJ1T2Z6TVAvUUZNUWUwZWNs?=
 =?utf-8?B?TU01KzI3U3FsYVpkQWpzeXovT3FZTE11dWxzcWpuKzk1dHZYaWFHY0VISDVn?=
 =?utf-8?B?dVVNVGM0ZGt1UDd3R0poM1pTUWpEalJVcHcvMWFOWXFxRFJTajlvZlllSlFa?=
 =?utf-8?B?b3AydG91OVJHcHZTdng2Q1E1aThrc0FlRVZyYXN4dmF0QjV6bFY1d3R5MFhz?=
 =?utf-8?B?M1kzUWJxVkYwY2VEWVdPUGRLYlF4ZFkxb1cyc2xvb1hsTnNvUmI4RExySVNB?=
 =?utf-8?B?SzBKYmNEam41YU9MeEVReEhYUE1jeVZIeUdyRnJmTGRnWmNkZTFsQnhIQjRQ?=
 =?utf-8?B?TkRlN2R3ZU1wczZxWHBLTUtJY2x1NUI4MGQ2QzV0QXF2VGFyUWdIa05pd2U1?=
 =?utf-8?B?UEc1cUVWMTJvV1Y5N09wbmx3cVFXSzdoRGZCQ0pYUWdGVllIOFhvQTh0cjRF?=
 =?utf-8?B?QnYxWjVHZTJJT3J0Tjl2VHRId3p0cFg4QTJ0TnVreDNZdUVLWkZoRFpUU2hM?=
 =?utf-8?Q?PYgloUhPsksAko8KvgrjWOLKV2A5ohpE2F+G9ws?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e66c63-5c4a-4713-c880-08d92b0c9a71
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6058.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 06:05:38.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUDfMEROW9xoyOQf8GTuUFF/oxj6e6c6FqZqIg4kfZhI/M/6/Xa89TMK6zgx4sCSBWCX7NCgvmDdZ4htgWEGDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_230542_271359_F479339E 
X-CRM114-Status: GOOD (  31.88  )
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

T24gV2VkLCA5IEp1biAyMDIxIDExOjI4OjE5ICswODAwCkd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKCgo+IAo+IAo+IE9uIE1vbiwgSnVuIDcsIDIwMjEgYXQgMjoxNCBBTSBOaWNr
IEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPiB3cm90ZToKPiA+Cj4gPiDOo8+EzrnPgiAy
MDIxLTA1LTIwIDA0OjQ1LCBHdW8gUmVuIM6tzrPPgc6xz4jOtTogIAo+ID4gPiBPbiBXZWQsIE1h
eSAxOSwgMjAyMSBhdCAyOjUzIFBNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90
ZTogIAo+ID4gPj4KPiA+ID4+IE9uIFR1ZSwgTWF5IDE4LCAyMDIxIGF0IDExOjQ0OjM1UE0gLTA3
MDAsIERyZXcgRnVzdGluaSB3cm90ZTogIAo+ID4gPj4gPiBUaGlzIHBhdGNoIHNlcmllcyBsb29r
cyBsaWtlIGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3IgdGhlIFN0YXJGaXZlIEpINzEwMAo+ID4gPj4g
PiBbMV0gWzJdIHRvbyBhcyBpdCBoYXMgcGVyaXBoZXJhbHMgb24gYSBub24tY29oZXJlbnQgaW50
ZXJjb25uZWN0LiBHTUFDLAo+ID4gPj4gPiBVU0IgYW5kIFNESU8gcmVxdWlyZSB0aGF0IHRoZSBM
MiBjYWNoZSBtdXN0IGJlIG1hbnVhbGx5IGZsdXNoZWQgYWZ0ZXIKPiA+ID4+ID4gRE1BIG9wZXJh
dGlvbnMgaWYgdGhlIGRhdGEgaXMgaW50ZW5kZWQgdG8gYmUgc2hhcmVkIHdpdGggVTc0IGNvcmVz
IFsyXS4gIAo+ID4gPj4KPiA+ID4+IE5vdCB0b28gbXVjaCwgZ2l2ZW4gdGhhdCB0aGUgU2lGaXZl
IGxpbmVhZ2UgQ1BVcyBoYXZlIGFuIHVuY2FjaGVkCj4gPiA+PiB3aW5kb3csIHRoYXQgaXMgYSB0
b3RhbGx5IGRpZmZlcmVudCB3YXkgdG8gYWxsb2NhdGUgdW5jYWNoZWQgbWVtb3J5LiAgCj4gPiA+
IEl0J3MgYSB2ZXJ5IGJpZyBNSVBTIHNtZWxsLiBXaGF0J3MgdGhlIGF0dHJpYnV0ZSBvZiB0aGUg
dW5jYWNoZWQKPiA+ID4gd2luZG93PyAodW5jYWNoZWQgKyBzdHJvbmctb3JkZXIvIHVuY2FjaGVk
ICsgd2VhaywgbW9zdCB2ZW5kb3JzIHN0aWxsCj4gPiA+IHVzZSBBWEkgaW50ZXJjb25uZWN0LCBo
b3cgdG8gZGVhbCB3aXRoIGEgYnVmZmVyYWJsZSBhdHRyaWJ1dGU/KSBJbgo+ID4gPiBmYWN0LCBj
dXN0b21lcnMnIGRyaXZlcnMgdXNlIGRpZmZlcmVudCB3YXlzIHRvIGRlYWwgd2l0aCBETUEgbWVt
b3J5IGluCj4gPiA+IG5vbi1jb2hlcmVudCBTT0MuIE1vc3QgcmlzY3YgU09DIHZlbmRvcnMgYXJl
IGZyb20gQVJNLCBzbyBnaXZpbmcgdGhlbQo+ID4gPiB0aGUgc2FtZSB3YXkgaW4gRE1BIG1lbW9y
eSBpcyBhIHNtYXJ0IGNob2ljZS4gU28gdXNpbmcgUFRFIGF0dHJpYnV0ZXMKPiA+ID4gaXMgbW9y
ZSBzdWl0YWJsZS4KPiA+ID4KCjxzbmlwPgoKPiA+ID4gNC40LjEKPiA+ID4gVGhlIGRyYWZ0IHN1
cHBvcnRzIGN1c3RvbSBhdHRyaWJ1dGUgYml0cyBpbiBQVEUuCj4gPiA+ICAKPiA+Cj4gPiBOb3Qg
b25seSBpdCBkb2Vzbid0IHN1cHBvcnQgY3VzdG9tIGF0dHJpYnV0ZXMgb24gUFRFczoKPiA+Cj4g
PiAiQml0czYz4oCTNTQgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgc3RhbmRhcmQgdXNlIGFuZCBt
dXN0IGJlIHplcm9lZCBieQo+ID4gc29mdHdhcmUgZm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eS4i
Cj4gPgo+ID4gSXQgYWxzbyBnb2VzIGZ1cnRoZXIgdG8gc2F5IHRoYXQ6Cj4gPgo+ID4gImlmIGFu
eSBvZiB0aGVzZSBiaXRzIGFyZSBzZXQsIGEgcGFnZS1mYXVsdCBleGNlcHRpb24gaXMgcmFpc2Vk
IiAgCj4gQWdyZWUsIHdoZW4gb3VyIHByb2Nlc3NvcidzIG1tdSB3b3JrcyBpbiBjb21wYXRpYmxl
IG1tdSwgd2UgbXVzdCBrZWVwCj4gIkJpdHM2M+KAkzU0IGJpdCIgemVybyBpbiBMaW51eC4KPiBT
bywgSSB0aGluayB0aGlzIGlzIHRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoZSBQVEUgZm9ybWF0Lgo+
IAo+IElmIHRoZSAiUEJNVCIgZXh0ZW5zaW9uIHByb3Bvc2FsIGlzIGFwcHJvdmVkLCBpdCB3aWxs
IGNhdXNlIHRoZSBzZWNvbmQKPiB2ZXJzaW9uIG9mIHRoZSBQVEUgZm9ybWF0Lgo+IAo+IE1heWJl
IGluIHRoZSBmdXR1cmUsIHdlJ2xsIGdldCBtb3JlIHZlcnNpb25zIG9mIHRoZSBQVEUgZm9ybWF0
cy4KPiAKPiBTbywgc2VlbXMgTGludXggbXVzdCBzdXBwb3J0IG11bHRpIHZlcnNpb25zIG9mIFBU
RSBmb3JtYXRzIHdpdGggb25lCj4gSW1hZ2UsIHJpZ2h0Pwo+IAo+IE9rYXksIHdlIGNvdWxkIHN0
b3AgYXJndWluZyB3aXRoIHRoZSBEMSBQVEUgZm9ybWF0LiBBbmQgdGFsayBhYm91dCBob3cKPiB0
byBsZXQgTGludXggc3VwcG9ydCBtdWx0aSB2ZXJzaW9ucyBvZiBQVEUgZm9ybWF0cyB0aGF0IGNv
bWUgZnJvbSB0aGUKPiBmdXR1cmUgUklTQy1WIHByaXZpbGVnZSBzcGVjLgo+IAoKSnVzdCBteSBo
dW1ibGUgb3BpbmlvbjoKV2hlbiB0aG9zZSBiaXRzKDYzfjU0KSB1c2FnZSBhcmUgc3RhbmRhcmRp
emVkIGluIGZ1dHVyZSBSSVNDLVYgcHJpdmlsZWdlIHNwZWMKZ2VuZXJpYyBJbWFnZSBjYW4gc3Rp
bGwgYmUgc3VwcG9ydGVkIHdpdGggdGhlIGZvbGxvd2luZyBzb2x1dGlvbnM6CgoqYWx0ZXJuYXRp
dmUgcGF0Y2ggb25seSBmbHk6CklmIHRoZSBiaXQgaXMgb25seSBuZWVkIHRvIGJlIHNldCBkdXJp
bmcgaW5pdCwgd2UgbWF5IGluc2VydCBub3AgaW5zdHJ1Y3Rpb24ocykKYXQgcHJvcGVyIHBsYWNl
LCB0aGVuIHBhdGNoIHRoZSBub3AgaW50byBzZXRfdGhlX3RhcmdldF9iaXQgaW5zdHJ1Y3Rpb24o
cykgYnkKaGFydCdzIGZlYXR1cmUuCgoqbm9ybWFsIGNoZWNrIGZlYXR1cmUgdGhlbiB1c2U6Cklm
IHRoZSBmZWF0dXJlIG5lZWRzIGEgYml0IGNvbXBsZXggY29kZSwgd2UgY291bGQgZ28gdGhyb3Vn
aCB0aGUgImZlYXR1cmUgY2hlY2sKdGhlbiB1c2UiLiBzdGF0aWMga2V5IHRlY2ggY2FuIGJlIHVz
ZWQgaGVyZSB0byBhdm9pZCBicmFuY2hlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
