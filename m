Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5492DC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 09:57:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBD320838
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 09:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tk1SloMn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="kyvZpQec";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="JUAFNFH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBD320838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PRww6re5FNg8Xz2hNyVmFCjnNH8DAhO/KXLqMqS+PW0=; b=Tk1SloMnQEac72bZLSrE5D9Mw
	FrRvgxoW007YIDc6CZxozulHfM2usa3Kp65rEvJYJ1xVOq/iJUGmVblybExwouK7zqEU9+H4uNtrd
	TLOjCSpHdCWQauuAOGZoMm+huSWg9adoqcT83OfacNkse7IkUzJKuvBXt9mgzWYO+zicvKJBO0pjV
	H6PxzzBLrCGvQP/r69q5Gxjz4IupE08ms40B4cmymrXG4UyryOCRODHjjaJoW+tUR4dRxVkAn2kXn
	9kZ1eL9jRTIcb5s611rh+IXmPTpqXRedbI3nlxJnIDHAtzxB2Zr1uwtqOZO+T1QvpnZyHt1oIZb2t
	0K0xsbIkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqew-0006wQ-AM; Thu, 17 Sep 2020 09:56:58 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqeu-0006vn-52
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 09:56:57 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08H9snG4024039; Thu, 17 Sep 2020 02:56:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=cjm8ZLzWUwIcUGRqBEbxjQcYTCzuW9hDAs+uEQg5LTk=;
 b=kyvZpQecZINWn/6LP4lx5aKDLUtBAdyK/M5RthEIsjz7u5BqDdk8uIiVWmLx1FhL2QF4
 MLkPzjdxuHzJOV9H000EEcMCt8Ppc7cGFEz3MmCTu/A93pr5ixcvlgxi8xtml2oFu116
 nxWG4xm663eI1cfuJbnOrdhXmsdoUYiK8QFEfEhzYQOiBKxTzC0WfVQJaHmh2EqUbvnK
 5pWzBOmOTI+3Z3vurNY5r7dcVcrBbJBbMW8HXX6wsdUiBTV29p5rmTlC7SRUAqz83BFD
 9aPTMWsBZ6z+W/dmLCMun6/33sQNYfbjGl9eZsIkVLDQSHsxRdT7bMwsEDJyENrQb15O gg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0b-0014ca01.pphosted.com with ESMTP id 33k5njy1jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 02:56:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNBGNy4QFHWVW9ksvcDSk2LSCRpg/ctzfZKBNImECNO0NM4GDKZnsvOxwPMmBrOZxs5eUm128qUO+Gb5RG6eZ4iyb4dz3dPrLYXL5YaiiGHFLo9yYNos/grYGXxnDc4vNf3GfH+0bvOhQGbJkCR6aNwtxewLV9kZMrYH0jbfTf6DPC3nxnH6fAKvxixmup4aXPomK9F5ntwnkMfFXhdgPP1ElBeLcEvqQ6/UeoW3EagaTNwcG136RAag7INgK2Kjpo586eVKd/FfHD20vqe+uHq+o2jd80ygnBqwreFJSkg2ADhVsUY3Vw6O94Kaz5tDmKMA920F1PyFIZKjlYg1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjm8ZLzWUwIcUGRqBEbxjQcYTCzuW9hDAs+uEQg5LTk=;
 b=HSXZ8GkgK75FAUoFs4H/idjJRRiqWQjcvPGpe82uehxvfQUJoa+Ig/T5o52oLOcLNBrX0dgpITFqwaC9KdrIPU+Bef9qPPMqarYc3vYJ8yENc+4xQcfWCbHYJQH/ovDRHMHndLOOzQ0ulSxAfQj/cgg2rD15K9Dv+Kv1RuFSE5rudm7q4tC0zB6hi+Ppxy/pN5p7ODyb5m0kO89jAS8ZvRDXlqKAp+cJ+4F5jUt1YXz+dQemQV9YqPTNO4yY4FRob+yqT34KT6A15BfV7q69Pk4Tk3DIc6DYva566aGtuTzogAHD/3Ev2VlaLlYDkyG3OCQZzcQyluMkn8Ug2nawAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjm8ZLzWUwIcUGRqBEbxjQcYTCzuW9hDAs+uEQg5LTk=;
 b=JUAFNFH4Zf+sHm48hzCvx7Se+bW0YuNacawirmOk5iBiw/P1tnvCfGMc+ZGzo3/zmof2grXU83vOVhpM2kB2iAAkQ44ouRKz/eqZDJ5nzRdekUFPdzDdd+7eDFdHuWZ5G/+B8HUtvjYZDayiMZAA2w6vVOw5VAdMBQpbUrRpmgc=
Received: from CH2PR07MB7190.namprd07.prod.outlook.com (2603:10b6:610:a6::9)
 by CH2PR07MB6647.namprd07.prod.outlook.com (2603:10b6:610:25::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 17 Sep
 2020 09:56:31 +0000
Received: from CH2PR07MB7190.namprd07.prod.outlook.com
 ([fe80::b4fa:137d:3c3a:801]) by CH2PR07MB7190.namprd07.prod.outlook.com
 ([fe80::b4fa:137d:3c3a:801%5]) with mapi id 15.20.3391.015; Thu, 17 Sep 2020
 09:56:30 +0000
From: Dhananjay Vilasrao Kangude <dkangude@cadence.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
Thread-Topic: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
 controller driver
Thread-Index: AQHWhlcI+QkIqmxk0UeRRL8qfzg+Salso4lA
Date: Thu, 17 Sep 2020 09:56:30 +0000
Message-ID: <CH2PR07MB71904C52A6BD735852151418CD3E0@CH2PR07MB7190.namprd07.prod.outlook.com>
References: <20200907061126.GA14999@infradead.org>
 <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-d2a95187-c772-4c5d-b30b-b053a3195177@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZGthbmd1ZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wZDEyMDliMS1mOGNjLTExZWEtYWU5Yy1hNDRjYzhlZDZiMTVcYW1lLXRlc3RcMGQxMjA5YjMtZjhjYy0xMWVhLWFlOWMtYTQ0Y2M4ZWQ2YjE1Ym9keS50eHQiIHN6PSIzNzk3IiB0PSIxMzI0NDgxMDE4NzQ3NDM1MjciIGg9InM1cEFtYUNhS0MySkU3d1doTEtkR1YwR0JoUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e28cfc6-96a8-445f-650b-08d85aeff3f6
x-ms-traffictypediagnostic: CH2PR07MB6647:
x-microsoft-antispam-prvs: <CH2PR07MB6647354CF5848DFCD5769B7ECD3E0@CH2PR07MB6647.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8CxnVywu49RN99nmYtkKNNXNUzJLMCgAb29LVOS/edLltAh7eysWZRJ6eKpQlHFBol8dqoFFqa5fFyhkaXDU2685IpyXFXL6e7cpWt/cYmUszMlKIAbQjE/zzh4yS2vkY3GJULeqeYAOfhGa+JzhpfPNT7rBNVPqeZ9cO5FLP40CYGOOEg9VAJOBc3cnUajWdydes2OEGo/CnqDJS6A1H9OsPaGxdc/a4ruKF1iImxavMlZCGgy2ftTCNZqFVne+Qu4qmGgoWnuMd5lcW6Vd4pshi+Xrkwx69w55pW6YvpbArwz3Nv3uhFPEkI4SSPEBpULssuD9iOnd6q0DN5iwMfKEmTGScBS/Q1CUmB8GVwYDYYVgRj3YELDYi9hIwkUDPN7rxr/CefRb+223yP0JnNPlzsVqJ12ONoUzz1MgBYTmrkXzUWS8DBtgMnEwRJiTk4I/SQxDzfLsNevcrhzfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR07MB7190.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(36092001)(26005)(5660300002)(478600001)(7696005)(6506007)(53546011)(52536014)(7416002)(83380400001)(86362001)(8676002)(966005)(2906002)(71200400001)(9686003)(54906003)(55016002)(33656002)(4326008)(186003)(76116006)(8936002)(110136005)(316002)(66556008)(64756008)(66946007)(66476007)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ixwkO/Uvo/ZopTSpKcerH8/eRz6fHU0yfXX1Oxzg8KM66NDvOWPYndWtHq0mvpk/Lk3lwD5gT+6mCB85Ezx7BxZa9EmGdrS7dw5kjDlQggJ/sgoEkvx8jQdlRRG8E0wVlIDTMo61jnvNNzEvxJzuCOKbhulZ7H7BiHk36B1A8wo6oh0bmU3DA7MfEK7Hboa0Favtx0ZxnHD6GB9Dt+gIR0bkbIPVSRe+sU73H9+CFgk0FnphGni1Z8hk7rf8Xtcoo1jk3HAdder/1jifDWAVS9wcinMSGEl+HVYbkTPMkJlVME5FeTbWrh+tpVIaopMiwZ+mGNELOVwT5PDKjejYGBNTk0XkPdnLQa58PaDlVhKmKlubLen6r3lbNYHah17FLhu5NWTowExQqLxdkLcgx401DKGhJf47TYMmwoS1pV0zvcdCM/OM0H93SX7otqz5m2Hjy9LKlh28fFcU2c2GhIjPLlLNf1/Zw3lIniOPkw7E3l/Ah7g3B8eIdgjZNrfyziqbGcB8KrwBcamUdFERaIUW18j9ULbTWp+RNO8mmFeQKBdnQqLdA57CNPS1Tk1sppLsk4dSiYN14+M5kAXoCExwB4vJnZ45gCObKZZvAOZfyi0kaunvHArGEQriTKtwx75+L5mUM9cNP47wRk6gFA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR07MB7190.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e28cfc6-96a8-445f-650b-08d85aeff3f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 09:56:30.7837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9rZ+b37+YWH40yKUndOzg3Nb09zeAWEOjgthmL4986XAyo8Sh1wltpBjVNmXR+9EKGhWPwcyPEfl97CYtF9clpTAL0QVsToAfHUR5xfF7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR07MB6647
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_06:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=680 phishscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_055656_255257_FDFBFCBB 
X-CRM114-Status: GOOD (  37.46  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rrichter@marvell.com" <rrichter@marvell.com>,
 "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>,
 "yash.shah@sifive.com" <yash.shah@sifive.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: Wednesday, September 9, 2020 8:42 AM
> To: Christoph Hellwig <hch@infradead.org>; Dhananjay Vilasrao Kangude
> <dkangude@cadence.com>
> Cc: yash.shah@sifive.com; robh+dt@kernel.org; Paul Walmsley
> <paul.walmsley@sifive.com>; bp@alien8.de; mchehab@kernel.org;
> tony.luck@intel.com; devicetree@vger.kernel.org; aou@eecs.berkeley.edu;
> linux-kernel@vger.kernel.org; sachin.ghadi@sifive.com;
> rrichter@marvell.com; james.morse@arm.com; linux-
> riscv@lists.infradead.org; linux-edac@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive specific Cadence DDR
> controller driver
> 
> EXTERNAL MAIL
> 
> 
> On Sun, 06 Sep 2020 23:11:26 PDT (-0700), Christoph Hellwig wrote:
> > On Mon, Sep 07, 2020 at 11:17:58AM +0530, Yash Shah wrote:
> >> Add a driver to manage the Cadence DDR controller present on SiFive
> >> SoCs At present the driver manages the EDAC feature of the DDR
> controller.
> >> Additional features may be added to the driver in future to control
> >> other aspects of the DDR controller.
> >
> > So if this is a generic(ish) Cadence IP block shouldn't it be named
> > Cadence and made generic?  Or is the frontend somehow SiFive specific?
> 
> For some reason I thought we had a SiFive-specific interface to this, but I may
> have gotten that confused with something else as it's been a while.  Someone
> from SiFive would probably have a better idea, but it looks like the person I'd
> ask isn't thereany more so I'm all out of options ;)
> 
> It looks like there was a very similar driver posted by Dhananjay Kangude
> from Cadence in April:
> https://urldefense.com/v3/__https://lkml.org/lkml/2020/4/6/358__;!!EHscm
> S1ygiU1lA!UfVYWzQqCgaUNKN156ffKM5NkFoYtPhHapruC3yqme7nvbUBnD2
> mEHg8F6it4y4$  .  Some of the register definitions seem to be different, but
> the code I looked at is very similar so there's at least some bits that could be
> shared.  I found a v4 of that patch set, but that was back in May:
> https://urldefense.com/v3/__https://lkml.org/lkml/2020/5/11/912__;!!EHsc
> mS1ygiU1lA!UfVYWzQqCgaUNKN156ffKM5NkFoYtPhHapruC3yqme7nvbUBnD
> 2mEHg8DeCwApk$  .  It alludes to a v5, but I can't find one.  I've added
> Dhananjay, maybe he knows what's up?
> 
> I don't know enough about the block to know if the subtle difference in
> register names/offsets means.  They look properly jumbled up (ie, not just an
> offset), so maybe there's just different versions or that's the SiFive-specific
> part I had bouncing around my head?  Either way, it seems like one driver
> with some simple configuration could handle both of these -- either sticking
> the offsets in the DT (if they're going to be different everywhere) or by
> coming up with some version sort of thing (if there's a handful of these).
> 
> I'm now also a bit worried about the provenace of this code.  The two drivers
> are errily similar -- for example, the variable definitions in handle_ce()
> 
>        u64 err_c_addr = 0x0;
>        u64 err_c_data = 0x0;
>        u32 err_c_synd, err_c_id;
>        u32 sig_val_l, sig_val_h;
> 
> are exactly the same.
[Dhananjay Kangude]
 Hi Palmer,
       	Sorry for delayed reply.
	I was expecting new changes into the hardware IP since last couple of
months thus I haven't up streamed V5 patch till now. The cadence driver version 
is of more generic for cadence DDR controllers which could be part of other SoCs too.
I would suggest Yash to patch Sifive specific changes once cadence DDR controller driver 
get up streamed. I will send V5 in coming days.

Thank,
Dhananjay
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
