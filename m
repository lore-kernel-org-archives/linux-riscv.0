Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941B9C10F09
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 15:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500C52133F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 15:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0NIJsFa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XnHl8MtB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 500C52133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tybst6dJzFoq7wWUNMdUYcheN5w0rYM9j8phaw+S208=; b=h0NIJsFaKm33gK
	dzK2nQ74ox6PLxzjjeLZWApITOPpMKcH0nSIku69goaV1vwkuCGOdBeHIW/pqzfy1ShaFSje3RyLq
	rgLbtjv57vikpauvtMhw8Bwnsy6J/+Pm8ReqCauHzJnbwOMrJUxJFolOf4hlEokyiXuCLMZkq7A34
	zcMma4khQuitIMReJ2blIMLlPSZAd9nt9sbz0rz9EYn9QCJrTr163trvk0sz3mkn9Wd0gF4QW/oce
	Np/XginjQpWt62bbD6uwTJBKGy+AFo/89CFXu2MmtqfP65NrbmsbfraQFa+B/qR/BmWaA5FKW22PQ
	OZA1INvVpfFnB8r4gnJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2HLO-0005wP-Qa; Fri, 08 Mar 2019 15:23:30 +0000
Received: from mail-eopbgr110097.outbound.protection.outlook.com
 ([40.107.11.97] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2HLL-0005vs-QH
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 15:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GleSxlxnmx5dfTZnvIVegteeyxfQ0tYAije4LfZwsJE=;
 b=XnHl8MtBIY+d3Mq+N0vt1uplPZTUR2k6HXws7quKoqpTeRMUp3FRZJloYV3DWyMWfln7hl/UrQe36kBz8RlEyoohCOqIBs+KiQzTFldRywgBpHZKPVBo/5kRDppxQW/c3AzkKoXBrlvVu6+dLZ2GYHrw394knB5SCtu3CZ/lzT8=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0144.GBRP265.PROD.OUTLOOK.COM (10.166.105.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Fri, 8 Mar 2019 15:23:23 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 15:23:23 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] riscv: move flush_icache_{all, mm} code to proper location
Thread-Topic: [PATCH] riscv: move flush_icache_{all,mm} code to proper location
Thread-Index: AdTUPa193Tky2RTWTjWRNr9wNwIdkABfPIsAAAIK4oA=
Date: Fri, 8 Mar 2019 15:23:22 +0000
Message-ID: <1cc5bffd-7e0b-a5c5-0a5e-0e8b2d62d9f1@garyguo.net>
References: <LO2P265MB0847855A503C55BB11A59A89D6730@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308142421.GA32707@infradead.org>
In-Reply-To: <20190308142421.GA32707@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 775728c1-b0b3-4752-7cbc-08d6a3da008a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0144; 
x-ms-traffictypediagnostic: LO2P265MB0144:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtMTzJQMjY1TUIwMTQ0OzIzOk5jS01ucU1rbmV4Wk8zeWVMR2RHVWZiY0da?=
 =?utf-8?B?cEIreG5QVXRtMkpVa2VYa2pYOE9CbGNuVG9ITzAya25aZmVUSFRlbVc4S2ta?=
 =?utf-8?B?U0dZN0ViODdjeFNJN0tvVmV3WEpHWnFIYUd5dmcwMEJaQTYzb1NZYzIvQ1cv?=
 =?utf-8?B?d21QaTRQUzdHME9DdkM1cTkwS2VtdUhXc1piOXZrQW1oWVVPeThYV1VxMURQ?=
 =?utf-8?B?VVc0L2lEYmxaQXFJWUJsU0cyUUlKNkdUVnBxU2JxMndxZTRFVEh5cXIrcUsv?=
 =?utf-8?B?UGlpVEhkNzRLR0VkczFVNlRRQzV4S0ZDSHozMmo1dGVOZkduRjVIRzdoaCt6?=
 =?utf-8?B?THBJVnExMHJyT1g4TjU0cDBNK041ZnIzOWxKSk1zaG1PS0ZtM0xhK3N4eHFm?=
 =?utf-8?B?SytzRXJYaGtDUFhlbUpoSVZIWFZXelIzSitGQnRPd3BERzZkcU1OMFpOTHIy?=
 =?utf-8?B?Z3k0R0tmcVhobyt1eEwvTW5USGN4Sm00V0xyWTNlZStGcE5SSWY2SnN0VktM?=
 =?utf-8?B?ajRrL281M2VyR1cwUmtWcFVUYWg1Z2l6V1lMQ1VtVkhSdWdTNU5mRVhING1o?=
 =?utf-8?B?YVJJcm42SVJmNERnb1JMcktidXB4RkRwcnIzN0wwYWdHVVhHYm1MOUlxM3A1?=
 =?utf-8?B?SVd3cXNkbVd0STNKNjU3L3V2V2IwcHN2M0lJYWRUVlZSbGUwN25saHl4N3BF?=
 =?utf-8?B?VXJ5ZHdEUE5LL3VnajVyQm5idU5zQnVQeXJZVjVkYmhDUXdFNnhrS2h0VXZE?=
 =?utf-8?B?cWVGaG1zUWhmZW8xTDBKSFRzT2FPc3FHdTBQd0Jwdmd2Qlp0cWEzcklOVFN2?=
 =?utf-8?B?a0FMM1lxZFRmckdKSGhEU0JQMEZ6SDNOdURsSmk5NVhnOU5hQytMUnAwOXk4?=
 =?utf-8?B?bXZUK3JtbE9SSlBWYXMvaWhFRk5UREhJSW5qZGRSaWRhOXRTSkRCNC96bm51?=
 =?utf-8?B?b1dVUGVOaUFSVDRkQ2dtcldBVlpERnZSUCsrQW9xRkc1UmF5cjV2YUZidklD?=
 =?utf-8?B?UE5pYmZUcnUzN25uUXk0dFlzQVlUa29JRFlueEl1bmllWCtVamk1NGh5Tk4v?=
 =?utf-8?B?SmJ0c1hxaVZDaGN1aUVXUFEvUndBenRMakpPSzVBUG9WRVZKQmxyS2JXM0xS?=
 =?utf-8?B?Y3M2eVpTbjh4SEQydVdUa1IvbUhJWDhreFlQVi9MUW1RY0M1Tkx5enkwQi8r?=
 =?utf-8?B?S3VsWUJ4b0UyZDVJVURLTlU2RlczcnB4dTN3RGM5cjBUVHA5ZXpvY3JocHpt?=
 =?utf-8?B?OUV3SXVxeGsvaXNzQiswWE5ocGFOVk9ESm9aaUQzRmpVTlRXRGxFSHM4MkFS?=
 =?utf-8?B?QnhvSUo4dk5BRVN2Uml2RldscFkyUkhsM1BuRVZIakF4SzFjRkpqNXd0VnV4?=
 =?utf-8?B?S01zTVIzcDNkTnlYKzRVRzUwMHROWFpydXdGOGRKTUFLYjBqVDlySXdoMXlF?=
 =?utf-8?B?SS9ITG5mTDlyaHdubmFpckR6Y1dEcGs3SHJ1ZVdhMjc4YjlJQmdEQ2RWemRU?=
 =?utf-8?B?M1J0NDdRaGxnb1JwT3NjZzQ2NkNlR1ZVSGVMZHByTE1OMnhGeHladVFwbzNq?=
 =?utf-8?B?a21SWklYWnI4OTVvVVFXVTBhUFNmb1RvSTc5bzV4SEdDSUVMU000UjJZbk9D?=
 =?utf-8?B?emwvNlRMcFpZR2pCSmxublJhWTdoVVJqTU5rRkhvMnd1OCtad2lCRVkwQmgr?=
 =?utf-8?Q?8apWue3FHiyc2drSF0=3D?=
x-microsoft-antispam-prvs: <LO2P265MB0144F02137D9C5E98418190AD64D0@LO2P265MB0144.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(136003)(376002)(396003)(366004)(346002)(199004)(189003)(229853002)(4744005)(186003)(31696002)(11346002)(476003)(446003)(2616005)(486006)(105586002)(106356001)(86362001)(46003)(52116002)(31686004)(316002)(36756003)(68736007)(99286004)(6512007)(6486002)(81156014)(53936002)(6436002)(6116002)(6246003)(4326008)(71200400001)(386003)(102836004)(76176011)(6506007)(25786009)(256004)(7736002)(508600001)(14454004)(53546011)(8676002)(81166006)(2906002)(8936002)(6916009)(5660300002)(305945005)(71190400001)(97736004)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0144;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gT4qNc/SGtP9BRdnLw+aKS8AuOMmYUBMKFmBo6KokvfRYOtAMlidothwNrlzi8DnEOES3hsnZ3KC/clF8eWi1tTfFHgxoAs9wmM0axHUvD33IvutlUqGEumRUn3Cot3Qauh8Bd2+Rq2mSGo/5qzZ8GABX8Z1ClR+Ca0Gk/jsnjy3mdgdZa1GHop+VdPxjalYjyECGcQjbREKitZM3d9sqdTImX/V98cZbWLrmRZUcp8FzXKjlwFKGzDBf93W9keSnwy/reqoe5Zqh+86Hzx7YnAd8vi5AjgFK1G2zen4kP/ZfFfWjB6x721pd0FrKQmMdFJoGYw/EyYBnkS0jmFPo0upTogK15+/e/M7KahoIpgKE8AMnKuOVgKR0CYwShf0TVhPJyLCTIhsQ7H+ArR3Dg5GfUO3b2jEgF1+Kyy5gQQ=
Content-ID: <81D579D7F629F545893CC062F6874A57@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 775728c1-b0b3-4752-7cbc-08d6a3da008a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 15:23:23.0390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_072327_909856_38E4BE8F 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Thanks for reply. I wonder what is the purpose for moving the non-SMP 
version? The non-SMP are just plain fence.i instructions that could just 
be inlined directly isn't it?

On 08/03/2019 14:24, Christoph Hellwig wrote:
> On Wed, Mar 06, 2019 at 05:00:21PM +0000, Gary Guo wrote:
>> Currently, flush_icache_all is macro-expanded into a SBI call, yet no
>> asm/sbi.h is included in asm/cacheflush.h. This could be moved to
>> mm/cacheflush.c instead (SBI call will dominate performance-wise and there
>> is no worry to not have it inlined.
>>
>> Currently, flush_icache_mm stays in kernel/smp.c, which looks like a hack
>> to prevent it from being compiled when CONFIG_SMP=n. It should also be in
>> mm/cacheflush.c.
> 
> The non-SMP version of flush_icache_mm should also move to cacheflush.c.
> 
> Please make this flush_icache_mm one patch, and the a second one on top
> of that that just removes flush_icache_all and open codes the two
> users.
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
