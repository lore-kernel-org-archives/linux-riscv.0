Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360FCC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 15:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B9C2087C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 15:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5Rv/5zF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AJr8okY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B9C2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgqNPFnbceny0XzqOaRJB/lAviZfj8XchwNEKMJkUeg=; b=L5Rv/5zFDFbdS7
	0lQAF68o2dVL58ordajurPfWn26rWXfwU8rfhG3juPcx5RSBqDBCqQosLGcnPMRKnB1C6IRJSmzZT
	ldjgsf7/zdQ7PaCkHO2YYfhkS0l5eosM8hs3PWbzLBeUjtw4cFspQlFTxkRLmuYZlCjW4ue2Nfizm
	u9fgJjDXdljNPQHghfNHD9dJqiK6svC1eryag10iBUTzooDTuFEo2bR0g2rWbIpGMTUtIZulx9Xol
	0hqKzwFBt6G3kq1JB25PX/nfvyU64vOfFfOqnjjONA690dCyEjAKHhmucOHVUTTFCdxWjpw0PGnZp
	qAkcVEK+FuiNC5TAfy4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Hqi-0000LQ-0d; Fri, 08 Mar 2019 15:55:52 +0000
Received: from mail-eopbgr100104.outbound.protection.outlook.com
 ([40.107.10.104] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Hqe-0000Kk-7e
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 15:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfxJpQdzAINW3P5gsWJ1DRovlfuktMy8YmO+EqF1daI=;
 b=AJr8okY4KzpxD+oAnT/TWXMvs/MVkHciHIo72b4svozpGw36rMAVV82leLoUrm2Io75sBd0Eh6c74QxtXwsHa4S/nlp0GWeJvziuOIT4dt5DkiYPo/s3/rHN+uFumbOFrkmxbl6u7SEVBtoAJrar9q2N8FfZ/+bajMMhJt7ARdQ=
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM (20.176.139.20) by
 LO2P265MB0831.GBRP265.PROD.OUTLOOK.COM (10.166.100.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.18; Fri, 8 Mar 2019 15:55:44 +0000
Received: from LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157]) by LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ed34:1290:4306:3157%3]) with mapi id 15.20.1686.019; Fri, 8 Mar 2019
 15:55:43 +0000
From: Gary Guo <gary@garyguo.net>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Thread-Topic: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Thread-Index: AdTUhSADMvbAADmvSDCW/nlQt8phuABN5usAAAKplAA=
Date: Fri, 8 Mar 2019 15:55:43 +0000
Message-ID: <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
In-Reply-To: <20190308143928.GC32707@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0371.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::23) To LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8c::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gary@garyguo.net; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2001:630:212:238:3697:f6ff:fe55:55b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: feff72b3-6d87-46f1-717f-08d6a3de8577
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:LO2P265MB0831; 
x-ms-traffictypediagnostic: LO2P265MB0831:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtMTzJQMjY1TUIwODMxOzIzOlArNFFEeVkrYmptaHBaRE50cjQ0N3FtV3g4?=
 =?utf-8?B?cFYwY2o5VGNhb09kcmZzTzErU0xQWG9ldHRrNWhVRmIyUWh2b1R5cFJ5VDFh?=
 =?utf-8?B?QnR3MkVCcFZ6ekdRWlFlUnhzei9peTBHeDlsZURsVW5nSlpDU1ZEdjRIYTB3?=
 =?utf-8?B?UG9VSkREbE5WMXJraWxxeVNpZGdxRTd1a1VmTXZ1blZMb09IUUV1cGRMNWRD?=
 =?utf-8?B?enQ1STBlNTVQOUk4YkhEdGRrdWd5cFVtaXlXSjZOaVdjeFNKZ3ZFQXFTZ0Js?=
 =?utf-8?B?dHJTN1JNSkcwYndBQkhKSURmUXVxbURyb0MvWGsyaUY3Q1JoeG5YZUFnUzJ0?=
 =?utf-8?B?QU1XR1FCWmtpV3BXYTNONmlRV0lUZEJLOWZIamVmQU8yUVVIVWRCM0VKb0Q5?=
 =?utf-8?B?RHY4L0I4eTlrTDcyR1N0MUtURVFrWS9zejVFdnptMWtnTjdnT2FFcjVlaUMv?=
 =?utf-8?B?QnFFT1NqQUpTa25oR09maGl0YmdBazVldmI0bWtkc1U2ekU0VC83T3FWME5G?=
 =?utf-8?B?UVRzdGJsazdtbk9HcElqNno3THZPM0JPbmdSeFkrTldrYWZYMkh0SUt6NjdN?=
 =?utf-8?B?VDFVc3dzVjNJU2FFZ1J1VlNyTERRSm5zKzhFYlhXV3Z3YmNUU1QzY09OcGtw?=
 =?utf-8?B?L1FOeWxJcSsrZ1l1SkU2U0hub0ttNkl4YTIveTBVVHVXYTk1bVNHN1R4aFhq?=
 =?utf-8?B?Q0tiRjh3VHpHRmM1V2ZvR0xPck1waHJ1dUIrRkl1Qk1FOVR4eVVBZVo0OFlQ?=
 =?utf-8?B?a0NhNlBQOXFiaWZoanFrcGNsNUJzNXE5STZnczVzeFFHTW1pY0RXMk5Lb0ZL?=
 =?utf-8?B?cGxab2FseE1EeFRkdTZoWjYwRmRzMWI3VUw4QmZqYXRZc3lzUHlWZlVLWlg1?=
 =?utf-8?B?dXQ3UXdVRXhSbXNKUnZqUzN3NXhtTFN4YWc1QXlHdkM4UWhVUzdObHArcStz?=
 =?utf-8?B?ZEYxNE11K2pudlpOa1RIZzFIbkpxaXNyVW4xZ2NNOHRRb1JjcXRWTWl1Z3B0?=
 =?utf-8?B?Tmd3TkNVSHhPbFBmUnVFYndXSXBVTGNlNHFCY3NIMWVQRzFsTjMwKzd1QUZr?=
 =?utf-8?B?d0dBTjVqQjdwbW1JUGlPazk2a0xDTHlpaFBhOERXdVRwTElucm13Y0tHY1N5?=
 =?utf-8?B?S1Q0RU9RVGVkTFhOUm41SlFjNzBBMHk0amprODJNUEpUOWdMUjkvY3Y0MllI?=
 =?utf-8?B?NDduWlZtWW41K2ZxRjF5TFo3VjVHN1lSU0taVGM1TGJ5czE0bm1ETVoyaTJ6?=
 =?utf-8?B?TW9FRGZtQ2FTWHRQYklkZlhMOFE5T0ZleFVnUjVYc2pTa3ljYlpMakpnbGZN?=
 =?utf-8?B?ZFdUR1FSMnVsK0pqV3ROQTNxU05tc1RyNm4vbFVrOXpIS05WZ0J5bU1zZmJW?=
 =?utf-8?B?TXZwV1Buc3JrNk9YeEZvTW1qNk5zZzVPUEl1anFhMTdYYVJWbnlJZVhXeWla?=
 =?utf-8?B?QlNTd2FIZGVLQ1FyVVZIV1M2RENFNUdFYU5MN2QxRXBlaFlndlJ4SC9HaWpp?=
 =?utf-8?B?RnpVZ1d4UXFhVFlOazYxQ2ViRG42TEFxb0VBcGdCQ0pyam9HNklndlhEUlpt?=
 =?utf-8?B?T2J3ZGtRYWxFZFI2S0NETThxM29BbDNnaGhHRDNEZjNwZXVwby9ka0drQTNs?=
 =?utf-8?B?STErVzNsN2lneTlNdTBaeWpWUjZYVEZ3Wkh1S09mUkVyY2liYnpuNXBSa1Fv?=
 =?utf-8?Q?r6VmI++FWxopZm9ElLy/qZq0n8ZG4HmJsi/yWmv?=
x-microsoft-antispam-prvs: <LO2P265MB08319DE0EE7A610E06A640F5D64D0@LO2P265MB0831.GBRP265.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39830400003)(136003)(396003)(346002)(54534003)(199004)(189003)(508600001)(5660300002)(256004)(99286004)(54906003)(31696002)(316002)(52116002)(14444005)(7736002)(305945005)(46003)(86362001)(31686004)(97736004)(71200400001)(229853002)(76176011)(71190400001)(68736007)(25786009)(386003)(8936002)(2906002)(6916009)(81156014)(6506007)(36756003)(6486002)(4326008)(8676002)(6246003)(6436002)(2616005)(486006)(186003)(6116002)(6512007)(476003)(105586002)(14454004)(102836004)(53546011)(11346002)(53936002)(446003)(106356001)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0831;
 H:LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: garyguo.net does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DujH6VngB6TC4Zb+sqW3WNojsOmNTBrLujePAS/Xwia3SrL6Hli3R2VkJcgKOtVMx1X7ur97fxhanyiOMePwWUqrCKYFdfB/KdW/ctlidGv9q5YOSUZ9ZdUGAPk3YyJvDq1KuvzMaUnYxlnFZLOsNg0TNIeAygEMEhf7YcoQR2G84Cer5xW3JMhjy48Kn3blfEOjSiV3eHrl/BRg0h60la8QIJybFfjueEE7i+U1sBWcoi8TdKb1CKBZVfKdHoDFTIOkBURdEoim1jzLSYi1jCt/CimHzxaluCoXzLuq0fkrbboW/Yj2r7NzfbcJ+2nxD/HX41ZJqezDHB73DiBaXZAGi1UU6EPLfhN+TYXcySNzFh82BByFK2gJefhgtcajw1uC2C6tgOtlY4H2N22vTqPTy9vyJpmkRGslD7KzTBg=
Content-ID: <343854106F67C840A8D9E5ECF4583699@GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: feff72b3-6d87-46f1-717f-08d6a3de8577
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 15:55:43.8659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_075548_273378_A51E695C 
X-CRM114-Status: GOOD (  25.06  )
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

On 08/03/2019 14:39, Christoph Hellwig wrote:
>> +menu "Virtual memory management"
>> +
>> +config RISCV_TLBI_IPI
>> +	bool "Use IPI instead of SBI for remote TLB shootdown"
>> +	default n
>> +	help
>> +	  Instead of using remote TLB shootdown interfaces provided by SBI,
>> +	  use IPI to handle remote TLB shootdown within Linux kernel.
>> +
>> +	  BBL/OpenSBI are currently ignoring ASID and address range provided
>> +	  by SBI call argument, and do a full TLB flush instead. This may
>> +	  negatively impact performance on implementations with page-level
>> +	  sfence.vma support.
>> +
>> +	  If you don't know what to do here, say N.
> 
> Requiring a kconfig here is rather sad.  For now I would just
> switch entirely to your non-SBI version as doing SBI calls for this
> is rather pointless to start with.  Either we get real architectural
> hardware acceleration, or we might as well use IPIs ourselves.
> 

The problem is that technically SBI should hide the details, and we 
should automatically, and transparently benefit from architectural 
hardware acceleration. The only issue is that the SBI isn't doing it 
well at the moment, which to me looks more like an erratum. Once SBI is 
doing its job, we should switch back and use SBI instead. We can change 
to default value to Y first, but I do believe we should still be able to 
use SBI-version if necessary, e.g. to test SBI implementation.


> That being said if there are strong arguments to keep the old code
> I'd still prefer that to be runtime selectable.
> 
>> +
>> +config RISCV_TLBI_MAX_OPS
>> +	int "Max number of page-level sfence.vma per range TLB flush"
>> +	range 1 511
>> +	default 1
>> +	help
>> +	  This config specifies how many page-level sfence.vma can the Linux
>> +	  kernel issue when the kernel needs to flush a range from the TLB.
>> +	  If the required number of page-level sfence.vma exceeds this limit,
>> +	  a full sfence.vma is issued.
>> +
>> +	  Increase this number can negatively impact performance on
>> +	  implemntations where sfence.vma's address operand is ignored and
>> +	  always perform a global TLB flush.
>> +
>> +	  On the other hand, implementations with page-level TLB flush support
>> +	  can benefit from a larger number.
>> +
>> +	  If you don't know what to do here, keep the default value 1.
> 
> Again, I don't think hardcoding this makes any sense.  To make the
> setting it needs to be overridable, and preferably provided by the
> SBI code in some form (DT entry?).
> 

Currently we have no way to retrieve the ideal size - so I just provide 
a hardcoded constant. What do you suggest for short-term before we have 
a reliable way to retrieve this value?

>> +#ifndef CONFIG_SMP
> 
> If you rewrite this anyway can you switch the order around and use
> an ifdef instead of ifndef?

I did a fast grep on other archs, and it seems that at least for 
CONFIG_SMP, it's more common to put non-SMP part first.

>> +#include <linux/mm.h>
>> +#include <asm/sbi.h>
>> +
>> +/*
>> + * BBL/OpenSBI are currently ignoring ASID and address range provided
>> + * by SBI call argument, and do a full TLB flush instead.
> 
> This is really information for the changelog, not really for the code.
> 
>> +static void ipi_remote_sfence_vma(void *info)
>> +{
>> +	struct tlbi *data = (struct tlbi *) info;
> 
> No need for the cast.

Thanks for pointing out. Writing code for C++ for too long I already had 
muscle memory for the cast :D

>> +	if (size == (unsigned long) -1) {
> 
> Maybe add a symbolic RISCV_FLUSH_ALL macros for the magic -1?

This is just to unify with SBI (currently we also use -1 in SBI-calls). 
Since the argument is unsigned long, from 0 to -1 basically just 
represent the entire address space. Do you think it's better to replace 
all SBI with -1 argument with a macro as well?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
