Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5464C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 04:26:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B1021556
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 04:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HmhIDcCA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BToZsYo3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="gN2/FqV0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B1021556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=p10By2Xm29hk2Ssa38r2RFQ+lJfmWdx3pRwGgJbTuxM=; b=HmhIDcCAG5SChvZSD+k9iS64K
	oQt22K5A3NwLHDNaA6cK9Y7yFq+Yrpe+I8ng2CcjS0vgs9ENiBxqyj9zyy+DVo0ZEg1d2oMRHrL5o
	ehapvtl89lEeoGaITSFmFdRjRZLRukaSi/+xDpRXLmRmJZDtikclw2N+puYt/AVMr9lzLbe4+09Rf
	MDGxqhMNpTqT4NijtiksaqWTJiBJ/p6Xaf7RTpHg/Q8dmtCQEj8xGDoWPWn+Ah8g1jPLJ7gXDcRZs
	Wtq8dmx3MCOiz0Y8xw7X3N+yUdmrxle+6G10Z2+WKDeErgrSCoVWfRYSGup+GWqzWhhGYv+ZFsZXy
	Tc0/zOC0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXGYl-0003yX-5K; Tue, 27 Oct 2020 04:26:11 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXGYe-0003xm-9V
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 04:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603772764; x=1635308764;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=1q0Ky/jSV9IUbwSAK8/lk3eBI2RKbVL/4Uz8+DNJRE8=;
 b=BToZsYo3iK+0WfgoF4LyuKfkebwKHQak+pogruhaCOXEhCqx6SAQzlyA
 Q7oykCDcvEEYrf5SVk1j7LwYETmvurIq1gh1O2OLrzpczAac3pLwKZI0t
 n3I8bxXsu4dT7DIZzVCCqiFIG6NpsYczkC5W7m+A+SV5woeYv1uJx3SdN
 qBVchXJq6n1c2mJbkn/bpBBTiHnsvdkr5P3E1bbPk5q51/9vZrg0fOZnb
 4K9xbSviHCNMZi+xr6O7EqtjZBsYej344Hj3QrCz9MM7E1YXyNXWCkjAa
 YLImZ2rCxhueYprDITCgZ2uyB8v7Jm7u0St7bgLlJpvvDuCKndEpsV9YL w==;
IronPort-SDR: Cv4Z9iZ9cTrhtNDIFcd/Z16IWWSjt3m5V+sohq2v8s/E4kkKAkR+bZHYdCUN+8asFiTgnxKqFN
 7IztY3hyjF1R5LN6gkxBSEbAAcy7JjZGXYH9DUdbbQl6I5y7pNd4JWVPbi+PJdI+Fd+m3EdRU9
 L8G+r07a+18sjOuuXc/78x/ZLVABVVQ2TvwmxTtNjAHBU8J9q4qHRKkFbB/0bHeZL1E5rGjrMY
 xTtma4XPhj8INabAp2v/W7xPeaOuMcPyH561lqAftDpjBacuKN4jvkKjKP+c6GtWNcy9mcJwLF
 tfo=
X-IronPort-AV: E=Sophos;i="5.77,422,1596470400"; d="scan'208";a="152176054"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 12:26:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH5GIMr9Efy4n0/Sm+WPjRRsm6msdoNlEygBmzV5DvcOmfWtf/2xs9VfGqD2kzXusmVWxPtmxhws1G6x7EtVyp/8i6Aa8Swmn0AVBY2DCRET0vQ1PpJISzW5ha//Qu8ud7fnz1nsu3RjGC9gbaS6H4EHiwqm0/U+nvxRHdRDvsdPlaTxlffwb8jpXTwFYCfNP/sU1kGG+wNce1xJnGRpa8wMnZfJLM6EVjlR/jS8kKrUnjYqt//DORgMKphVLI1Qn1is4MAwIV4ZW7BbNNzjBqnxs5Tz02gmFelHnhk/ZuFS+pfC719VVmf+l+45q40FkzLkCZYvTeCcyftZdmPG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIV0uV4UeSuJrpkm15vc9lY1OO+VXKO30EzIiwQb8lQ=;
 b=lE29Vv5L95Br3zj08iK+Fg6q17bpMei+RwxnZqS1C8Qu6673g49N8OzD/Cmxk+CkOheNeFjB/idLYDQQI8Sn/gTjok+pPsPh8K6bedDi4Vk6FLBqb5ILVSds8XU417re4O25CYdLRy6n1IgbS6mQJF5YwDSv5fQuvkD/25H4BpZvtIJiFUideVJJbe/6gIsscgfJLXMroh//WKY+OJ33fgU4BN+HADCIGwmg8kiPQo69j0/lL1x1NSoRXJ0zt1aQ4UesK5wF7ENnCkb2EsCFE1VqRCNI1X7nzQUhxi9Cek4iiu/MObWfNPI2DKJXg4O5zEHXujJ0L00BeD8xpTJaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIV0uV4UeSuJrpkm15vc9lY1OO+VXKO30EzIiwQb8lQ=;
 b=gN2/FqV08ZUj5jX67lcwmrk+g2h9c1/eN9YCKOL08cC5YmVTg0Debd6x8HZJxzJT9EWPNBNHYnYQvwT2pkb1gDoW3sRbBcMPQ4gty6kUuQca1ZxQjCm2qzQEhnWKdy1GolDJSGhP5t/ark1lnNOnPcqCsnsrVFGRX5kaMWTfpmU=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB5092.namprd04.prod.outlook.com (2603:10b6:208:55::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 27 Oct
 2020 04:25:59 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 04:25:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Atish Patra <atishp@atishpatra.org>, Alistair Francis
 <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+w==
Date: Tue, 27 Oct 2020 04:25:58 +0000
Message-ID: <BL0PR04MB651446F56F2F67B942027517E7160@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <20200915054649.GA16371@infradead.org>
 <CY4PR04MB37512693510EE0C8E8B29F4CE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200915065138.GA31702@infradead.org>
 <CY4PR04MB37514B8FF89DEFDF2A7622C0E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
 <CAOnJCUK5C9gGUu0UEtu5Q7dzus1kwr1bCMFxQPF67kcyCk3tnw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:3dd3:d7e5:5981:e303]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5b174e54-0479-482d-7d1f-08d87a3067b4
x-ms-traffictypediagnostic: BL0PR04MB5092:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB5092C0B6D4BF60E4FE3281A1E7160@BL0PR04MB5092.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +RO+O5YjNY7O18pyRMe+/BYJnjzTDqv2s6TZ5xj2UyGkMAwzg4R1EC23NHSCsey+aK2H/2CCQwGnrJjG1zBlmM+/+Y4OMmcRK5s/PmZ0WiDMz706ywOxpqGNImCKiISpz1YXW4GYh3aTmVn79zYAwJ5c3Yi8kGtypliYIm9G1VBnWCLz4D7cyOo+omZSG4/CuVsnXutZQNKROd4HwCE8D5ScSGJZQavhM/5DCHY9a6IKc2eHGdxIahfthnllOEZxEwH1CIZ5uYrOvRz07/1Tu9MzBpqyIWCRa2km8s0eMSIy+9ogP1Z2AsothNVX++MS4y87rFYsXQg+q6jRZKI1nQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(5660300002)(33656002)(4326008)(71200400001)(53546011)(86362001)(6506007)(316002)(478600001)(7696005)(83380400001)(55016002)(66946007)(2906002)(6636002)(110136005)(76116006)(54906003)(8936002)(66476007)(66446008)(64756008)(66556008)(8676002)(186003)(91956017)(52536014)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: cvIEtS5EpgumI+Ag/oB9Dx9a/ddFI4ISx411tk9V6EN4dZkE7zYqnEvyAItIHYlXEL6pSPLmvwNdvtUJnXCKt4PriL/MHNKrsKXK46vlEadfcCSCOEk5W46uJca1YCf8I7ArCDR4tQj6Bu1llkxvmht4tWiRuMjhQ412mVhdCFaQzy2o+k9yTONmZsyy63SGiDIVKizzK8S5ojCpudxJqeZBHKiO8I8tDfsoZybr0siwBBt4Jez5bM3p3BCWPOm3cVj/gUkXVzFV1ttaLjDIJn6RSBpV5Sky5Kxo47O7lEKqYSQDsBBpwRfWxKH0nTX+fzPeTiVkIpdAmZuNiiECWB1gOWURmafO28eOMzvitZPooeDzT/5AyCXZxb51eRbti3CE7TnNAQysjbRuzy2xkYt0Dyvme2dbIvK8grenEiltFwF1bnAsddoZXT+sBT8a+JcBM7zA519l7ZC3p0JrjNH9uiqmEvokxrYlJDwFfPL2mGh26QG6SgJHQIhg7H0mlEJOpcQmwjLK74VKh1NdaRW8h3mRRFwWcEIV7Jkp4lB7xyoSC+hWCCvs4BAip9jXVKf28b9MYtVSAGt2GMSh6bSwd38UU3LJwDrV0FAPy+hcVd8wlaLxHzeXYARdCZ7oAxatTQSEE+TbIlaSC81zyTtLCcz2uP5XkwFrjSQuxkthcfnpEyqaOkfnX8eHrv4zN4jwymepW5znSm2iiNeQMg==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b174e54-0479-482d-7d1f-08d87a3067b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 04:25:58.8989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJIQzKtIzJpqQoFozdDwkYC8RhPO+YYwI6AH0ApZNkZuBgDoEZIc01sKaxY+ydaPVdRQZP9lMFNrpFCO8jpJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB5092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_002604_522696_491DDDAD 
X-CRM114-Status: GOOD (  20.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "hch@infradead.org" <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/10/27 13:12, Atish Patra wrote:
> On Tue, Sep 15, 2020 at 12:02 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>>
>> On 2020/09/15 15:51, hch@infradead.org wrote:
>>> On Tue, Sep 15, 2020 at 06:50:24AM +0000, Damien Le Moal wrote:
>>>> On 2020/09/15 14:47, Christoph Hellwig wrote:
>>>>> I won't have time to set up the K210, but this fixes the timer issues
>>>>> on older Qemu versions that don't implement the time CSR.  Although I
>>>>> also need to revert the binfmt_flat patch to actually get to userspace.
>>>>
>>>> So revert is needed ? Digging in the flatbin format, I do not see why the offset
>>>> you removed would be needed, and it does not seem to affect other arch anyway.
>>>> So I am really suspecting a problem with riscv uclibcb or elf2flt, but can't
>>>> quite yet figure out what may be wrong there.
>>>
>>> I did not have time to find out if what we did in RISC-V nommu was
>>> correct or wrong.  But to get my existing userspace to work I had to
>>> revert the revert.  I'll try to find some time to dig into the binfmt
>>> flat issue and elf2flt soon.
>>
>> OK. Thanks. I will keep digging too when I have time.
>>
> 
> Is there a solution to this ? As Christoph pointed out, we need to
> revert the revert to get into user space for nommu kernel (v5.9 or
> v5.10-rc1).
> This commit was introduced between 5.9-rc2 & 5.9-rc3.

And it was back-ported to 5.8.5 and above too.

> 
> The concerned commit here is:
> 2217b982624680d19a80ebb4600d05c8586c4f96: binfmt_flat: revert
> "binfmt_flat: don't offset the data start"

Nope, I do not have any solution yet. Inspecting in more details the riscv
elf2flt code and uclibc is needed I think to understand what is going on. Not
clear at this moment what the root cause of the problem is. I have been busy
finishing the Kendryte board support (SD card, I2C, GPIO, clocks, resets,
pinctrl). Now that this is mostly done, fixing this flatbin user space problem
is mandatory. Help welcome on this.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
