Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C5FC433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 03:11:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FB720770
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 03:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="doH4bWwu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mWTGnWVS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="cJPjRWh6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90FB720770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=4U+PIFym8WXBTsz8NMd5d8215elQ7nkU8dgGh8wISBs=; b=doH4bWwu1uQlOTrsg2z0Zfhxy
	IOAE94ifsepjZKaagNTk3Ay0Abx0lTTrv0c+TV7HYj9X8rir3wDmgxCoK7+tqBeLVCZ7i3yJ1iNQj
	5Zf2B9OY91MASRCoxx16ZfBFduydnKfqhW11mNw/Bcu4SO8d2VY3V0NF9eJNxoS6pMqmDKuljAZGP
	0BZKFtWCFmWJ1sxNDXlFsmm7wsI1sUAFnjbeKsyO8AP7nTVdhWhDwadC+Lo5UjELzVisXP78u9QhG
	f4n1sMM/ahKlxqPEK4dbogmYnYJTBx6Z04M1Eyr32/8sIutMGR1D5z20JTTck6G7dSdanJMlw01EV
	B9kQ9BODQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kINqU-0006Nr-MD; Wed, 16 Sep 2020 03:10:58 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kINqS-0006NK-9C
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 03:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600225856; x=1631761856;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=BsLYkWj/319g2GmJVfSWURwgeYj3jMhK+xlKzAPPC60=;
 b=mWTGnWVSg70C7RKEx+5yjer1MoQM69AH8Kme/LEXc6L/JAam3VDdPso+
 cRqZ1N4zQCbLXSupZYKY64hS8eF58HaPEJo1qduR/MURrWFjI+kjKsJii
 Kbpb/vFQk3TnC8ObrBaWuFm7+LdOb0wyCLZZxty21EeoxZ0uzLYDM74iO
 5zjcqiuyyQOgmxBoyVCfF++lclFfWA9rU+1RZBtfn+ESZijFQJ4J07fAR
 GHek2OmhIWdbpZlxVVZP0/05PbX9RsdUXGQ17mXCKx79JHUL+xdi2oaRT
 H5O+Q3yZmnGAE1k1tWtH3CA/PD7qBfDdZkF1mSY07Gi3nkyaWP1CecqqK Q==;
IronPort-SDR: IqJrX60nidqxaPjH0KKS2wcOHEUGwALpQbtb17VpqVLUjhWLZzAhhYX9DhtUM8ep+v+sXMaglV
 5Ham5jC1lTg0qKJq6QO/rLYltqjTStA/SPQ6TmvNcAAhZVxLNJeMxI+6TqTCKkOXKnI+boCLzs
 HJIlsHVF4e5K8DLBLU626Oh806pPqGVy2ZSNkFIs6UkJK5h1U2/LDP/sONLMUrnQbw67lYj1Ne
 lCQYIVMS4othaQww60+y7Yp2W5k+PwMqPilav2ajAklaJqActla3STGXtqc88fQVLRBz3r+fIc
 e2E=
X-IronPort-AV: E=Sophos;i="5.76,431,1592841600"; d="scan'208";a="151849680"
Received: from mail-bl2nam02lp2059.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.59])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2020 11:10:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj5QCHxUCM+C88Hp+qOFz/cRqj6/jY7BoTijq+ntyRtJrpY2czMNBW4vzzJbVZb95A1233PPQLZfWH3Qzwf21pTVfUUaknZkHJXHNzkwT9yCbmUsUcTlSso8ZEKqp3q/i7ThgessyDppKNDartZQYMBQ8MX1hRwJl21a680tFJyy0yg3xjD3ibDCD5GTFlEO5iidxxnAIlqR7ZKOzb0pSLzCxU13RCp0wvIjSCWonG921XFUMWVmMOoaFWOp/vg9nLKCM2fOkcS5hiVGq27U27f9pWvAwknrR6HL67UHPdD/N6Jx5mr+ukaBFzpSDRVog0RP7/514umzV1hG3xVPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0Fak0TakTAks4wyvXU7Chgb0eeLCoYeFrnjNb32IC4=;
 b=jpHsaWfbBL5HXYMD3uH5aL/N5OF9kAJGhwitaAluVvHtAK13wl3KAKxaXWqj3Ov6ATDGuJF/3LRzxvI7stiPwtrYvz66ggeXe0ZdABE4WUu65EbQxqtAXvUtn3SyjIBr5ND7ywhaoRvsQJnG4iCK0NGQxg3BN2qHbX8XUuyAoiKhqqQiCGsmu9IqB5F0o4jTuIDsK6d/OCyaUG18WAYs5KAjBFjj+hhKlOZOlykUlBeED4aARyyuG9iYHG+l3cyFU+s8aHkU/U0wQMWFXW1VXTSz62wocP6u3uJuranVzwHbfdicwtjoY6w09k+oaEWPiElajBBu22aRVcfIiLa1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0Fak0TakTAks4wyvXU7Chgb0eeLCoYeFrnjNb32IC4=;
 b=cJPjRWh6C7B0LN6Ufycstq/dhMN6Lb1K0/7hbGInYN5kCmXJrTOAzYL02YhhqA/M9gB9ERfDEmy38cGJw1gLZfBI5Kmtyv6hhvgJkKSwJwyqTC2Jjeb1cQvjxzyLAcaHvFLYzPCYaR4qfdXAjiGoCJBIK3gSzwZpDHCsEdRHen4=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1049.namprd04.prod.outlook.com (2603:10b6:910:56::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 03:10:53 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 03:10:53 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Fix compilation warning
Thread-Topic: [PATCH] riscv: Fix compilation warning
Thread-Index: AQHWi5ijfMvRpAuExEmlFdRP+Kjr6A==
Date: Wed, 16 Sep 2020 03:10:52 +0000
Message-ID: <CY4PR04MB37512BE794C298D7ADCCE6B2E7210@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <mhng-bb93a26a-2217-4540-83f7-99b896516413@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:b178:89b:b9c7:c5e0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ce4017e3-e4c8-470c-9a59-08d859ee1f0a
x-ms-traffictypediagnostic: CY4PR04MB1049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB1049F654210640EA891B529EE7210@CY4PR04MB1049.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:478;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EnL7wqIvfjc11rQdGld4d0FOzkVd16QYn7zIhc6PMQ3KSOd3dE+ptoVSxPSyjqyquYQ+bSuLPC3BBYEX86C4vJ53ZNuLUoQhrXaFw6vuPftqUCZ5/8fuuQ/S4KAWKK28Fs3aWgymyG9WiKqTvXSUTvr+ET4iId93DLdAfyJmBbRH4sammevomA6YmrQ9mvBzrgEinYiIPQH4QpvX0D7raYBGOQdVswdcVnpO/s5O8dyaiZ9r8ZpS9b/9YBXBvC/lrg2XcvXgrscyaak+rBBfauwQkHNrBhdF0lSYPW/NsV2z+7bzVP9N06oXKSLlmP2CgDBiEcmvZN8SSs2nLTxq8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(316002)(76116006)(91956017)(9686003)(86362001)(5660300002)(478600001)(4326008)(7696005)(55016002)(71200400001)(33656002)(54906003)(53546011)(6506007)(8936002)(6916009)(83380400001)(66446008)(64756008)(2906002)(8676002)(186003)(66556008)(52536014)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TUvYWaiJtW9Gfte4GjRFCtudX8WdTkB9URmL1nwFCVLdszANAtU4tAtvvdarW6zoxzc8qMHEjLGL5u++1XR6ZZwFOOT3OEcK5K8KhaTnxxlIBAiiai4PLv2ki/QyZ7zxNMbXXnymisW+Sa+YPfiD0jmqpL2qZ2UhEcaEFhQIQFzPJCSH1HYhag9LqZrncar9Yy8gIBdxjd75CHPlaT1X4HT7wX/JiYk0U5mxM+RMmw8BWVuFHyFIFj8aioDJpMm6lOlRhrg+4Rc4HB7Xm6OooywowthlrJ3NTuD373N73+MrPnHgn2zK5W3CAY58jxxvWjAtRd0M2TEZo7sTiHGucxeE6nfXbDBdKYQC2B3WzSr7llOXOUKSyD05LYv4EKUa35W5TEcJdtHtKjwhxApmwK+Nd1wSat1RH1pQHl+fQlEl6LG/gxGy0qoyPMNgbL4qR5YeiZH+dQdvREzYnsMn5mi/4Dhx5XC8UBNwgkg/724MCb8h2bNAWM3IvCRM7eqodlzgc97/BQPYBPrchSej6zIFW+iBUjVbaIw1jWdhXPH2tAMxG5iP55qmqpBDIoUjg89XpTqgz43NRUtfgjIgth/VOeTATvICjnDF/CA7IuaVn9uHtAa1kwe8Gig0K6acOX/bZzAoHVxIMct0ih4SriSk8A9wRdGPPQPPpy+BfushWZ+GrpHKeIEQvV1PSgx/wdps9L5d6i3BLgKeV7eIlw==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4017e3-e4c8-470c-9a59-08d859ee1f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 03:10:52.9912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtCxn3z70Yk0ejN8Ajf245AZpbXZA3pxLU/8ae6WxZueSK3OvqyJZcH+C9ILfjajznVjcB1eWQiUIr4dhyfMkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_231056_551640_4EEFBC46 
X-CRM114-Status: GOOD (  19.99  )
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
 "atishp@atishpatra.org" <atishp@atishpatra.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/16 11:02, Palmer Dabbelt wrote:
>> On Tue, 15 Sep 2020 18:29:52 PDT (-0700), Damien Le Moal wrote:
>>> On 2020/09/16 4:44, Atish Patra wrote:
>>> On Tue, Sep 15, 2020 at 2:16 AM Damien Le Moal <damien.lemoal@wdc.com> =
wrote:
>>>>
>>>> Move the declaration of pt_ops under "#ifdef iCONFIG_MMU" to avoid the
>>>> compilation warning:
>>>>
>>>> arch/riscv/mm/init.c:44:28: warning: =91pt_ops=92 defined but not used
>>>> [-Wunused-variable]
>>>>    44 | static struct pt_alloc_ops pt_ops;
>>>>       |                            ^~~~~~
>>>>
>>>> with NO MMU builds (e.g. nommu_k210_defconfig).
>>>>
>>>
>>> Thanks for the fix. pt_ops was added as a part of EFI series.
>>> I am planning to send v8 to include some more generic EFI changes.
>>>
>>> Do you mind if I just include this fix in my series ?
>>
>> Please feel free to integrate/squash this change in your series. No need=
 for a
>> separate patch for just that. But: If your EFI series is not final, what=
 is it
>> doing on the for-next branch ???
>>
>> Palmer,
>>
>> What is going on here ? If Atish V7 series has problems and is not final=
, why is
>> it already in for-next ?
> =

> I'm behind on this thread, I just saw this as I was sitting down to do
> something else.
> =

> It was supposed to be ready to go, but it had to be rolled back.  As far =
as I
> understand it my for-next doesn't actually have broken stuff on it, the i=
ssue
> is more that some other EFI tree changes landed that would make merging t=
he
> trees more difficult.  IIRC Ard was going to an EFI tree tag for me to me=
rge,
> and I was waiting until that to show up for the rebase so we didn't juggle
> things too much.  I guess I'd assumed that the actual patches weren't cha=
nging
> that much in the process, but if Atish is going to be sending another ver=
sion
> with meaningful changes then I suppose it's best to drop the EFI stuff fo=
r now.
> =

> I just rebased for-next, dropping the EFI patches.

OK.

Atish,

Feel free to squash the compile warning patch into yours for v8.

-- =

Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
