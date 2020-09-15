Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE40C43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 06:50:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B81120756
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 06:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNJLJkiJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fOBble7U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="y2mL7ZF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B81120756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=O4oXo6irhpEfHL/vKWscZRYoTYbXkIqCKg4XoRDZ7J0=; b=PNJLJkiJEVZeXX1Jarbfj7k4d
	1g+8wHc/ITY3w6G3VS9XKK51FJgxG+rhEuB4USqud3uPFJX0ASMi6ePgR+c5VquA0+d3HkeRyqRcK
	+7ZAzBKXDTx7Lx2I9ARr8boyGexxLTDtrZyXQD4gYvm7ZwPJJduTkaDUjdfGe1OvF2tp/GhqeNlOc
	Q3XtbQE6uRPGfOZVkDwGgtJXfuqeO+JCaKyo9t4sFZ2PGl1+LUgtgYNKQ2IyPQ4h0YMz3GBEovGM9
	mxXY0VKVykInWz8Pjf9+Syw9vLgV/9OmVpHIHZ6GTNMzjjUr0EMOVRp40QjHRyvRu7myyuBgFbs/T
	CCW+mAisg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4nP-0003q3-K2; Tue, 15 Sep 2020 06:50:31 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4nM-0003p1-Ix
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 06:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600152644; x=1631688644;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=W3FkkQafQj2Z0St47JQDoeJ21KdzD8m9godXwRtb2YY=;
 b=fOBble7U4qR2esTZkw9ECdKMHtEbdj+jvcjW2CS2IJfLTkbnA04Zm9rc
 GxG6M0rLOEESX2Fr2AvPLWl5iIfyGdjizBuVt4C/6O4NZfu6Qoa2HVWah
 D9mU0NxFyKJ2nxT8DHrlU96GhubyPn3hRc38r/C5e0kG1XAPIZaMo734V
 M9I/IYb/ddhiQsaErWwhVfPzt+BpaV5Xfp6wgVaCth1LSKwhY2PtpsFTI
 t6sSaus7ox3aK60krJSSNolxWOqPpKj5yD7TPmGD/7MdSftNo0+a2Ozu5
 U1EIqmhNzBxoT0TQa/lHEhQCL/bv17w7y17Gz25eQMgX7Q1PyFbnqj8vo Q==;
IronPort-SDR: M0r9i2qPy+gylvqjND33YCZkkarCn0Ef6s404cdPf5Vkfv7fyXB3rCZtwymgkrfDVIb7odFmZQ
 vMcPD1GfSprFEAG5sgBkOii/FXNgJVAbNmbJ9Ouqd0W8TxET7p+zAmLQyWJv9vLyAij5mHreH0
 PicEFBoxhXPKueLkLPpiSOoAhlu4IQU9hVQQ7ClIunq2gAIdOcrVZuG/PwMxFp0wTaxXkByi0x
 QDfMpupVayQrixW1QhjQGE6zx5Hj2QK3tGFyx4ajEQFkwYX2iMh25AIMEMybh5aUUHkZU256bJ
 4o4=
X-IronPort-AV: E=Sophos;i="5.76,429,1592841600"; d="scan'208";a="250715441"
Received: from mail-dm6nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 14:50:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Loy4kqf8roFmZQf83pk7zqWwfWB5R49OMnZXmwUpH0/Z0fJBtBUahdFPbPipMbrmsIclLyxB4Jg2QINVhYorKjEvnBUlaLUxZFdpCNBM5EADTRrwRdJfeVuBSbSsmvZjai+D8/j9/8dpMo9urFhbRz/rBPO70wLEBlyzImGocYL2UqhwTFtwnAgHhCnC0skNMppxWnIXRa+RLTx1wxvz/1ZcWkRNMlZa4IYJVqCTB7BLR9+C4XG1BXV/5JnUlLVThtkGeHx8W7HJJ++PztbALqajDRhc75A+O/4K+yPD0EfKkidW3d4ljp3peskT88HcyOJYYHpn07i06LhkzTjU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPSbtConWoG0ohhtbOWWmNfobYJUe5mJ7NYj62ByQXA=;
 b=AflqQJLr906/EH0e8wyyPxm6Dpe+km+GG0O94z88q0/pr2rI55ci/0mASdQBQMNCgUPJ/XGNwTVySR0+55D04MntPzrfKovLxYRiOMZs2g2Zz6MtWREL/IaybZE2AAjiUB8zA1m+qebDzkTo6f2URWNdy889PstRC5ApUTJ7bXqQd8lNnPax6/xUs8tkRX+5nuEpLkm/Vp0yyLQDPLhQFvDiSqTXTBLHMJOx72Iw+bHY1i98ZfVoQuDMkNR5j9Pwf8lbHfLGYsJ49rICd1NvhegoDz+5LFTpZGiFSlSPCgWK8B0gxZpfvY8WvqlwnXkL3UIlXiqcYNmFzHj3Y50Tdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPSbtConWoG0ohhtbOWWmNfobYJUe5mJ7NYj62ByQXA=;
 b=y2mL7ZF65CH/Tzw6EfpVgBxTTC0uHc3xs9DlQ7Ml+HUvaP9ly3BBRdmA99KEtFM9XV96AArjAYLxYh3dT8c9qJdENpoYkt6//U4+VC8PgozgtugB77GZ+CN/rB22fO3TtmDC7SwmZ0omO1XHFv7aeR7BPMRhGaLLkcsVW3fX4tE=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0727.namprd04.prod.outlook.com (2603:10b6:903:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 06:50:24 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 06:50:24 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "hch@infradead.org" <hch@infradead.org>, Palmer Dabbelt
 <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+w==
Date: Tue, 15 Sep 2020 06:50:24 +0000
Message-ID: <CY4PR04MB37512693510EE0C8E8B29F4CE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <20200915054649.GA16371@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bb873a2e-4cff-48a1-80bd-08d859439f38
x-ms-traffictypediagnostic: CY4PR04MB0727:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB072790A51E7F3C1025082C5EE7200@CY4PR04MB0727.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VLoYTw7givXbZMuH80JAC0lxconK/tPjd/0W2MB6WKctx4vwVUxbpabss3pp6XHdyIwQMZodh49bULvzYfP2gakjRlHnwwb0J1qUXx6Ymqh3iJc0QEysBvmvr/f4bENHXN13Sb32kVQlwFYmmPjkSw/HgcgwJTe/3CgbQub28TJRVX+r0uEYeLLU/SO2MbG516zY0SMiOSoP5WWgRrCBML26h89/e1njYPCD8jgCDYhnacJfM3nx2u2cFcr1tWOJ8iO8gJtHdQhlg1UoAWJGBz4gENlV1IE+ibwwZqARlQKKilkcswSpZRFWU3bje1amneSDs32L+cz9cB7dQPNLUoc4ZxcZ8qw6NfhhZPJMgH7hQPRu1qBbJjthTMeW38dR7DFK6CmS5Mo3lQY49SWd1JSmhNwuINnX47z+/Q4K9bU62gt2l1Y0GNFVUp4TjqCCGaORo4vvZKATfJNKoywRig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(52536014)(4326008)(7696005)(2906002)(71200400001)(966005)(91956017)(76116006)(66946007)(66476007)(64756008)(66556008)(66446008)(186003)(316002)(6506007)(53546011)(55016002)(5660300002)(9686003)(54906003)(33656002)(4744005)(110136005)(8936002)(86362001)(478600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wgBhAIjgdEdCsTewfPZ5NVlTXriF8cF4so3TSiRydW31szEAINf+GSJDu56y8zFtNCP2VJX3ZLp/F9Vbn/BIYce9MSkZZFNWDuxXmYsMIQ66ufYqeMf33gwuFThVdKXMKwd4SwpShZK1homKD2okXX2G0XvIj8GJJDcjNaDmTWNdwVwTeQ3sOOcAiVIDQbjjMjxVSzcSRsgcdKKsg1fXPXRTnm1ODuexiVMls+5IQ0qjRxkjzysV1fE5/LhhOs6aCgVtIhBGmXKGm/TYb9XFYG+JSqGeMuPcRBjawzkUReHA+ih9xzdImUy7G0RexYv1y0WH7v1qhvaW4ll6hknHXBTfpwm3y+VxBmh5KGK6Dhbt7/BcKlwZpjT+Qyl9kT2pJUJBlIVWeu7o27dwA9mq4X4R5JEjczrtqS01BYLh45orpKiQnzplJy0WtZHY8k0OYtAT9D2W2qpYzmhCFuecXPuNln9UUqmoXEP3v3IU5KbP2TjZlxYy8QT8TRWQ1B2OxEyaajxaO7PRb/9o/LbHg/4pYKRHYyG8JVAjBTGCw6i5CnoazY4bOnzlqOeEhd47hEllZ/vOZ6fL/QUuLCwsatB3dLw3y5+SWVITHDNLXagyfxlNmBTU//XJ6hCBcr0O9l/2XKdJPAwWkJyMW5UUOH0k1do/lXkIRBjrJpk1NaB+eR6fjXBDOv7MNNfhUi3B72+utFHftyn2ve2yEZdnSA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb873a2e-4cff-48a1-80bd-08d859439f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 06:50:24.0547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLFdOBwmCgk9jj8KniCRUYaPz2Ob95jkOwnGkD2DiOg8P1dLSRdUQGK1T8zgtZ2zRScyshMka8I2YsZ7OMs0Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_025028_878491_F983ABE2 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/15 14:47, Christoph Hellwig wrote:
> I won't have time to set up the K210, but this fixes the timer issues
> on older Qemu versions that don't implement the time CSR.  Although I
> also need to revert the binfmt_flat patch to actually get to userspace.

So revert is needed ? Digging in the flatbin format, I do not see why the offset
you removed would be needed, and it does not seem to affect other arch anyway.
So I am really suspecting a problem with riscv uclibcb or elf2flt, but can't
quite yet figure out what may be wrong there.


> 
> Tested-by: Christoph Hellwig <hch@lst.de>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
