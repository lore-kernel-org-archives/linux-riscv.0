Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84136C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47060214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 17:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YalggSZ/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n/Z8gotr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47060214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJJgsNiCDWhX+eiG1XvqxAQJSPT3WmQJ+47s5i1+T/0=; b=YalggSZ/OA69eN
	jYpTfiaDN8hke/LebiJKHbCR8diM9QByN+mxJja9hu+RUQadzGzJ+rGiIaxYLOr2O4CF0DWx9jjN+
	LRmxuG1/UbzmrZS5/YcCkP+4RJFpA0EctclrP7cBVlZwybMhQY2jubvdWCYmJXEY7btDZYLcdzX5W
	nsbJQIRMptBQwKJYtGrHIeHkI2sCBuoU6H3JNY1YhnWgmdRsHFqtL+KV5NelbkkzTB18s6SPyTJp3
	lIsupHagU1Xj7CJAGasyXoVfzJX8yZkaB2SGw3EfifLMn72DUJPpGkjG6pBSrzsgOzXauVSJ0+W1N
	t7N/+cld7/NFcimaBGPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3lgT-0006er-4L; Tue, 12 Mar 2019 17:59:25 +0000
Received: from mail-eopbgr100119.outbound.protection.outlook.com
 ([40.107.10.119] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3lgJ-0006Vb-Fr; Tue, 12 Mar 2019 17:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyxeMCWXLrjxE0q+pfdR9sKUOXuVvhIPG+JnwSMzelM=;
 b=n/Z8gotrWLLD55qSp+B4MgNpl/UF00N62r+3zp9dePxmzN6YPO0lrlZ8wzZi6ggIxzg8GvwE/wPlqhZNtPCbrEww9IeTfRU1cX60BNdVl33p9AHB1BLB4Sijm9ZcLMCZ0VcExFSMoB80AMDZFweE6Kep5yZeaCYmwjnXnLGpgRs=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0990.GBRP265.PROD.OUTLOOK.COM (20.176.140.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.17; Tue, 12 Mar 2019 17:59:11 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.021; Tue, 12 Mar 2019
 17:59:11 +0000
From: Gary Guo <gary@garyguo.net>
To: Christopher Lameter <cl@linux.com>, Paul Walmsley
 <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
Thread-Topic: per-cpu thoughts
Thread-Index: AQHU1X8Zg4tCyzpnB0uSPwesGvixyaYGb/qAgAAYDICAAAIygIAAAm+AgAAGBoCAANnKgIAApi8AgAA4aoCAAASAAA==
Date: Tue, 12 Mar 2019 17:59:10 +0000
Message-ID: <898ae546-fac8-3f5a-e53b-c2941d81ca66@garyguo.net>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1903120717110.26459@viisi.sifive.com>
 <0100016973000e88-99188bf8-0831-4fa4-b3ae-7de6547b651e-000000@email.amazonses.com>
In-Reply-To: <0100016973000e88-99188bf8-0831-4fa4-b3ae-7de6547b651e-000000@email.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfe3ec05-eccd-4c34-0c2b-08d6a7146e13
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600127)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0990; 
x-ms-traffictypediagnostic: LO2P265MB0990:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtMTzJQMjY1TUIwOTkwOzIzOi84Y09HVkhKMWRNc3V6RW5lRWtUSzNYYndh?=
 =?utf-8?B?R1dxUXpmaCtLaVhFaFJQakVWVld0UnpEMkFKSndMUmNGdStsQ3VVdWY2MWdW?=
 =?utf-8?B?NWQyT1l1M2lBMEM3VlNTMC80aUxyMWxEeEVuMU5nS1c2TUJ6Um5EOWg1MjhM?=
 =?utf-8?B?THNzdDFPaktWZ3c2cGtMMEg5V0EvSGk4UWV2NzVqU1RQRURNeU9UVDZ5dHhQ?=
 =?utf-8?B?NHpGUzhXZlBuVUlZRFhSck43OG8wUmU2RUM5YlYxZ3Y1WmdmcDJvWUk0bjRG?=
 =?utf-8?B?QTl6R0FNSzBMalZRRVh4T1R1ZkRPRHB0SnJ6cHFHVGFGVzRDejV3dUFpazZu?=
 =?utf-8?B?a0JrMHRybklldkdpV3lVaU1PaGF5ZUZWMjVJWUNlb283MzFRR3VxUEE0R0hP?=
 =?utf-8?B?NmM3WG9LNDRZS3M3b1praG1RNndreFo1d0pIeEhNcUN0VmtGVFJ6OGNyMnBQ?=
 =?utf-8?B?NFcvL1JsK0lhYmZNQW1tKzZsNkFwYTZxcWF0N2pSbFJ6Mm9keDZHVGo4OHJG?=
 =?utf-8?B?U202VURjSDJ1ZkY3NGU0a3YwTnNtck9uLy8zQ2hPcGpNdWF3NnZNWEc2R0Nv?=
 =?utf-8?B?cUNveGwwcENhL1ZnY2gxV1pZNGJyZ3Z3LzdxMGJBY0lDQlg1OVBHZ0tYR2Jn?=
 =?utf-8?B?V1JSNitBVEVVNzhpZDZrM2Z3Mmk4b0lxbmU3QWVoUkVHd3Y3WmxHWkpWb1o0?=
 =?utf-8?B?cit4ZEJXSHFzTXlmdHAxT1VCV1FvMzdVWkh6UUdtblhvQmJhSy9CU1JXdVVz?=
 =?utf-8?B?WHVUQ29BM0lNRmpudTROUEdLNUNXWTVwd01TVEZaaWpPSzhXSk1UNFVLenhY?=
 =?utf-8?B?M2dzdVMxMUUvYUNQcVNNeVNPclRMV1BvR2VhRS8rdzNzNEZnVVVlRWZwY1cy?=
 =?utf-8?B?YmdpTVMrS3JOa05ueVUvUnRNaGI4RFdtY1dEWUczNThKVEZVQ3RhalRmUkpz?=
 =?utf-8?B?Ky9lU3ZzQjhMME5EeEdBWExxL2dJdEt0Tmg3Z01GV3hwRGplLzJ6T1ZzWDVC?=
 =?utf-8?B?QnozbnoyVjF3WWxWTjFDREdBS3FObE1xQWtNZERRYlJNM0ZRc0VZRTNtYWsv?=
 =?utf-8?B?LzVWcVNQRHF0dmNmQlBtbXVPbEwvM1FzV1FSaEVYOXU1SGZLRHlFV1NKQml0?=
 =?utf-8?B?SEFQakxTSzN3c2xYdXpUZFJadkM0Z0p5ZGN3d0ljai9kNkQyaVpFWS9oQnEz?=
 =?utf-8?B?VEFzbXBjYXFTSk81UTV6TXk0Z01rREhTVmZWZmdUOW9YV1lwNHpQbVhZMVph?=
 =?utf-8?B?S2xDM3FtMUx5Um9IbGdVODl0bDdYc2NITlp4K0lyWHZSVEF5TS9BVHRLWExi?=
 =?utf-8?B?QnNwMkdiNXVmbmJBTGtXb3ZiVTZXT3Rsa1NRUHc5bXBSc2o5TFU4R3pEZWp4?=
 =?utf-8?B?UlRHY2lqcEhLM29jS01xUGZReDcrVjJXdDFJTjJXYkQ5QXE4OHdRR29nV3Nk?=
 =?utf-8?B?d0UyQUJKYktXajVaQVNuUWlqLzBOZ0RyRWNtMEtYREgyd0JNbHhjNmhEQ0F2?=
 =?utf-8?B?TW10dE1mYUxZUk1oVGsyTy90a0FTUEJzQzhpak9LODF5TmsvR3VBRS90Nm9t?=
 =?utf-8?B?cjhxT2Y4aXYxZ0RGTmFTc01YTzgwYklGY0FGblR1L2VwYjZ3ZFlIWVVBWE9v?=
 =?utf-8?B?dmxPdjNTZ2JIanRvNjZxNVpBWmJncTF0NTJObE5yZzFxOW1hSWxlWmZucHJp?=
 =?utf-8?B?c3VUU3BZaGxaYUw2NHV5MHQ5Q3FHTUc0MHFpZm13TFkrNTJyTnQrbTU1RlF4?=
 =?utf-8?Q?MEy7n6epkc53LTb65GhZWsyCg8pf8MV+NkRQ4=3D?=
x-microsoft-antispam-prvs: <LO2P265MB0990762BFB489F81DB069A6FD6490@LO2P265MB0990.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 09749A275C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(186003)(76176011)(102836004)(7736002)(6486002)(4326008)(6436002)(486006)(3480700005)(14454004)(36756003)(8676002)(446003)(229853002)(2616005)(81156014)(476003)(11346002)(25786009)(46003)(53546011)(31686004)(386003)(6506007)(81166006)(99286004)(52116002)(305945005)(106356001)(6246003)(8936002)(508600001)(14444005)(53936002)(316002)(256004)(6116002)(93886005)(2906002)(71190400001)(71200400001)(68736007)(97736004)(7416002)(31696002)(5660300002)(54906003)(105586002)(86362001)(110136005)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0990;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jKXnyoySgQxJBgb6OV95PFGm46Z1CZarrG1vc8k32Og4+edG6FMFl9zEsCozN/LzJewTcK0TeVCLgdeQFSstM+oFL/A8vUR2cV9OU+RydRWnBuNEAXcbJzje8oYsb9Oyfw3FmIapLAZZgQ7YfBoNj50Jfed2VLtQLPMwljr089p3Utoa8cMpkcul/4fikDQkCHfwt9F6Y7p34isSDNpDnVehMb3wRhaIpwgv08xrRjbVFkTLgI0EwifUG4YgjmHZyVvmW+LS3X9+6GA9v8kou/unq5+XfveX8hqdGhm6LLRcBJFM7B1hcmdZVKwwMzdh2N16B7g6aekKg2KVWjpThwmq6SDC7uGBm1va7Mcb6+aOPVWj1TYA9ENOiSwmyfh3MCtavykbCrgeTWbXvzaYKSebK1q2dam0ASwegAjKPr0=
Content-ID: <00C3887F3BEEEA40959743F01148729A@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe3ec05-eccd-4c34-0c2b-08d6a7146e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2019 17:59:10.9912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_105915_586573_C125FB43 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Nick Kossifidis <mick@ics.forth.gr>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The added instruction would require three operands (base, offset,
value), which is clearly an issue on how to encode it. Also, as RISC-V's
base ISA is already frozen, even if we have this instruction, it will be
an extension, and is not going to be implemented by all hardware. Linux
will still need to support those hardware without this instruction.

On 12/03/2019 17:42, Christopher Lameter wrote:
> On Tue, 12 Mar 2019, Paul Walmsley wrote:
> 
>> The counters, though, may not need the preemption disable/reenable.
>> Christoph, you expressed earlier that you think the overhead of the
>> preempt_disable/enable is quite high.  Do you think it's worth creating a
>> separate, restricted implementation for per-cpu counters?
> 
> As I have always said: I would like to have per cpu atomic instructions
> added on RISCV V that works like those on Intel. Single instruction and
> relative to a per cpu based addressable counter operations please.
> 
> I think the attempt to reengineer the core counter mechanisms on Linux is
> not that realistic and would require you to first know the cross platform
> issues that have driven the development of these things in the first
> place. Sorry that I have been just superficially involved in these
> discussions but I have a hard time seeing this going anywere. There are
> already established core implementations and various arches take on this
> issue and those have been around for longer than a decade. It will be hard
> to come up with something better.
> 
> Can we focus on the RISC V instruction support? I also do not think that
> this is a currently pressing issue but it will be when you scale up RISC V
> to many cores (especiall hundreds or thousands of concurrent hardware
> threads like what our interest is likely going to be in coming years and
> likely also when RISC V is going to be used for enterprise / cloud data
> services).
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
