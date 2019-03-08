Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DCBC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012C12147A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4Z8sHQ2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DmbpP0+Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012C12147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:From:Reply-To:To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oAY0RvQrh1JRneyk0yGVmx1zpGHQFu7/sHecH3y3l8=; b=W4Z8sHQ2g0qnY6
	ZwOQG9d1+7YjKLoVXhn2wjzRI8kQDWQDKVzYyL+AAkjexAyZmqlXMZpJzRmcitcn4Ds0MJKPcEvya
	R89cctSEwtHYss+KPFUzuZOJ2ZVt+jnI4pwknglIag+A4wIuJAKQiBVPJ427Kn5xAtY8b+i/hqkvi
	ZXmH/LrOESYF35RnD/MuDzl74bmE8o5GYsPRFFPP182phAT6SOIRVju0lSZaCj0kVGuoENaGoClzZ
	+DPONYej84JDKGaof18D3KOg+5tFxwe4YwR27fep8mOaucR2tATKZfTWZy/L7TkCJP64kma4XItUt
	zyPu9MkZWR9tcCPsd6TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2IlH-0004nH-IW; Fri, 08 Mar 2019 16:54:19 +0000
Received: from mail-eopbgr110104.outbound.protection.outlook.com
 ([40.107.11.104] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2IlE-0004lS-PK
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 16:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s891SSCoi5TomYKQPEoNddkkjMdRXHW3hiSwpdBNJmM=;
 b=DmbpP0+YJ+0YRAlfK0Yf4Va46OO1pW0fH+aXxvPyK6/jPBBH+LAoVNLZK9XF5qs9aLt/kSEFh4uQ5ta86C4HbUi9C8Wb+ELfRno/QDo3cUnuIM5Pjx/UsocoS2iG4yE2EV0UUxmPD7jl09RMDplcYfPh8DKGYzuSIbXP564wVIk=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0720.GBRP265.PROD.OUTLOOK.COM (10.166.101.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Fri, 8 Mar 2019 16:54:14 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 16:54:13 +0000
From: Gary Guo <gary@garyguo.net>
Subject: Fwd: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance
 improvement
Thread-Topic: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance
 improvement
Thread-Index: AdTUhSADMvbAADmvSDCW/nlQt8phuABN5usAAAKplAAAAT9VgAAAX/eAAABrloA=
Date: Fri, 8 Mar 2019 16:54:13 +0000
Message-ID: <b6bc2f0f-e77c-8447-8422-adb95fd5ffae@garyguo.net>
References: <da8e3ed9-c289-573a-2d7e-751e5172395c@garyguo.net>
In-Reply-To: <da8e3ed9-c289-573a-2d7e-751e5172395c@garyguo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::13) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-forwarded-message-id: <da8e3ed9-c289-573a-2d7e-751e5172395c@garyguo.net>
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e92db8d-1889-49b0-535b-08d6a3e6b122
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0720; 
x-ms-traffictypediagnostic: LO2P265MB0720:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtMTzJQMjY1TUIwNzIwOzIzOmNCekpnUWMybzkzMnpKY2hNSkJENXh5NVVO?=
 =?utf-8?B?bnhZNkR3cEFoRVBEZUZFZDFTa09GbHJaTGdOWm1FYnh1K3NEQ2tkdVNCV1U3?=
 =?utf-8?B?clpWZ2RPOE9BRVlCQlNYdnBBNjN3aVUyNmZDOXV4NmQ4NjBZc05rZk9XM2o3?=
 =?utf-8?B?MWFvYUZ6czlBMC92ejBXRVZZaFA1aWNMTGVFUkI1Z2FNZE9odnR1NG9EeFU5?=
 =?utf-8?B?elJlbDgvRW1ZbUtyNUowZmdOMFNyMmUwcDJNWS93cHk2N0xIZW1FaER1VGJm?=
 =?utf-8?B?N1JQYUU5Yjg3aEQ4QnI0dlBINWFGVW84RXBtdFRlYXFFWkkxVmx5VGJMNmQz?=
 =?utf-8?B?V2NBZnRtajlUUlM3dzFJVWVQdGQ3ZXl2M2JWMGJFaEFaMVM4S3hWWG9RQThF?=
 =?utf-8?B?NmF1d1VLbXJUQ3VJOXEyTzhqTS8rWmQxSzgrc2pMdEdmM01NVEdSVWc2ZENK?=
 =?utf-8?B?ZEZqNkNRL3R5MTNnYnd2RUJMSGh3c2tvRm9POTQvUzg2V0M3QlIxS1BNQytZ?=
 =?utf-8?B?YzlDN3FwTS9RV1ZmU1l4aHdzUWI5L1NKR0pWSGF4bG05Q25OTWJ6b1J3cnRa?=
 =?utf-8?B?RHdZMFFmam5wMnJXZWNnVzhFdXF1WVpESHYzVHBQWnRpL3NqRmlXOWtjU3F5?=
 =?utf-8?B?UUg5eUNtdklOcVRrUlV1NlJLL0U0S1ErQTFnSm9Fak5tSnA0Ti9PRDE4enhV?=
 =?utf-8?B?WVl4Q3hCd1h3NUloam1mOG1qTW5rMWxSczl4Yng2YTNlZjlmMWtjY0cwR3R6?=
 =?utf-8?B?T2FQM3JITHRHY01xYXNEMUREU2tLcVVmTCszU1VrNlVCaVpZZERtaFA4d08y?=
 =?utf-8?B?dmxpUytqTGNhb1ErSjIvTXJmdXM5aTZPL1FqZEwyZi9zdUdFUU50WmFCcDJv?=
 =?utf-8?B?TFlvdHhvKzVWRlVJNGN2cmcrNUc5ek5acHh2R3lKekxjZmVGZEJFUVZJS3Vi?=
 =?utf-8?B?VXA4YXE5d0dhWUlaVDI1Q2ZzdndyeGVrWFdjWTUrYm1QRW9XTjcySmhJdGpV?=
 =?utf-8?B?QmpnWjcwb2tkUDVROTVBNVpSWXdGRjc5bnlKNk5iYkpQQVZubndURXZMbXNQ?=
 =?utf-8?B?SGQrVm0xWTNYUnVvS3hJY2VheW5UMGRNVitZbnNNWlc5aVBCM0FxVEtjOG9P?=
 =?utf-8?B?dnNPN0RaK25kaWFLUWxLcEc2Z3R3R1ZMSEN4RWJGN000cmV0ZFVLaHYxdUVl?=
 =?utf-8?B?bDFaWkNRSk5lc2UvVEM2ZnFjMmlhWEJER0o1TlpqSGxZZm9sbDNjRGJUOTBO?=
 =?utf-8?B?QjdkdWlUT2dob053S3FZMll4dnZEdFBDRWxCei94NHR2RWxpSEVSd1daUW45?=
 =?utf-8?B?L3BMWC9NbXJGWGpHd0lHeG5hTUJrTVV6dXhUL3kxK25ia2VlRjJadWhnVUNv?=
 =?utf-8?B?VDlLTnJFUm5FUmlUUTRtSHVTMHRYR1B0cml6KytLQVNqazhqdFRTTFNqTGVl?=
 =?utf-8?B?UHNKNGx6Rmd2c2tBRHdiRHZlNTgyUHcrMXloNkRyOGFOVG9TeStiR0x0U0tu?=
 =?utf-8?B?S2hOMWkxNXh0aGwyZXRFRWpQUGtwejcxd0tia3NVL0RoL2dRRGo1VjJhemp3?=
 =?utf-8?B?cjNZMWU3cVpHREljYmZ0Zm9jaklYS2VIaWNYcEtkSkVXeHE3NTY0dFdyL21X?=
 =?utf-8?B?elV6SE1kVWw4MzhvZXBUUW9aajY0UitjUGtTR3U1a1NCeEVZU284M0plbDVI?=
 =?utf-8?Q?DVRRu5t4CV8aMKd/eh0S2z52fdRLmY2/QmpqDQQ?=
x-microsoft-antispam-prvs: <LO2P265MB07204F9DC31727541B108197D64D0@LO2P265MB0720.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(39830400003)(376002)(346002)(189003)(199004)(81166006)(476003)(2616005)(54906003)(486006)(446003)(508600001)(59246006)(11346002)(86362001)(5660300002)(102836004)(97736004)(6116002)(76176011)(99286004)(53546011)(6506007)(386003)(52116002)(31696002)(36756003)(6486002)(229853002)(71190400001)(71200400001)(7736002)(256004)(109986005)(81156014)(46003)(186003)(8676002)(316002)(4326008)(106356001)(105586002)(2906002)(25786009)(6512007)(2473003)(8936002)(6436002)(1671002)(68736007)(53936002)(31686004)(305945005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0720;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zhV6ilYAnkuVkc190vA0vb3W8J0XkwpAubt9Nl6EqODK+EbSq11biQDPsdA0P5/HFJyKkkJI4O0YMtmTBwdR3foWUO2AiE8KPWS1CeDNfrmqc06XacrMzhAPqBqpjFF+O7IYymBj8t+FPMGuUxzWdLTM9KL4d8snNZDrrWU5CMos41WYenccpg/5KgJJFwVb3jqojQT7KvWEMrreI2k3m0IdkJFDvFSzbQFWn0ZjxPkWiVKUIWxVs2ktKqaJCA40Bo/O+4hLEgYGDBvMktV3ikyFD8A0EC+Us1ERfcjqFY0waIZLmxZDPRQLj17W8VleqajVUE3qph2I0rUTmf0nM9SCgva4DjWCMm8gpbtccZz1UeK6RAetAY2SFLbMfemgLwDV0XfCQKoLK7UQ6keCC+ETlDSASnuvpb0DRTvWP18=
Content-ID: <61C3D8170E0413458B1A1FB56B654CBB@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e92db8d-1889-49b0-535b-08d6a3e6b122
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 16:54:13.2318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_085416_820939_19798B37 
X-CRM114-Status: GOOD (  12.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Sorry, forget to reply all. Also send a copy to the mailing list.


-------- Forwarded Message --------
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance 
improvement
Date: Fri, 8 Mar 2019 16:42:09 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>



On 08/03/2019 16:31, Christoph Hellwig wrote:
> On Fri, Mar 08, 2019 at 03:55:43PM +0000, Gary Guo wrote:
>> The problem is that technically SBI should hide the details, and we
>> should automatically, and transparently benefit from architectural
>> hardware acceleration.
> 
> But it doesn't.  The SBI effectively requires an additional trap,
> which makes the whole thing a little pointless.  I'd much rather
> have well working code in the kernel, and if people want to do
> hardware based TLB flushing to propose a well defined Supervisor
> ABI extension for it.

The current SBI suggests that if hardware-based TLB flushing is 
supported, they should just provide their own 
sbi_remote_sfence_vma{,_asid} to do that. It's just that the default 
implementation on BBL/OpenSBI isn't doing its job properly, so that's 
why I say 'it's essentially just an erratum now'.

The default SBI implementation will still do a IPI-like thing if there 
is no hardware-support, which is very similar to what I do in this 
patch. Technically it should be slightly faster in SBI than IPI because 
it does not need to hand control over to the kernel and back.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
