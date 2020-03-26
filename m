Return-Path: <SRS0=F0Tm=5L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EC5C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2020 23:40:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF71C20663
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2020 23:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIeaVtRt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ox/oOvEK";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="B6TC5fJ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF71C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=dFEHnUvQ5Nl+U09oSTZJU9u4ExC/HwTl0Etccy1LgB0=; b=RIeaVtRtaPRbKA52AYYGaLh0l
	6JioT6kd7fTeMFFnkkNMSbJ3KiNxxr1GJ9Qf122GuTUgAs3JuXRrwCWnlVQamtAsUlhTMKRAdXjSq
	iyhIeZbGODFQj5yx8G9OEpoLYEbZTmnN/yyPVN8XGKXaABbdx+I2sL7PDwDo8vi/nLeW/V32D2+aR
	4+11IWiMRoz+qTHtMMdIeyZGIYngLxMP2wrdazPz64s22DOcMhslENqTcXgbaBbRvN8O4wARf9NuU
	DZPxymEuvvERv8u/BzSclMTti4epOVNCeT2FVckKyRh+fx7WNsUHO7h+XuKNXmfbYbO4lHGQdq9O6
	xDQoSsmKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHc7C-00006E-Lt; Thu, 26 Mar 2020 23:40:46 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHc79-00005a-G4
 for linux-riscv@lists.infradead.org; Thu, 26 Mar 2020 23:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1585266043; x=1616802043;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=CExu/ENxN44kTSTlXTMswSeiOtLOrncwTcb2+a5qfD4=;
 b=ox/oOvEKLy2boUAwogfrGJH3fBRhjT8X6aDHvtbSHInGy8uJV0503dwn
 2C0vVYkm3+aiYCVpooq+QL45ZKMy2ghhnSd6cVkJeWcX9vfy4YNy5gZQN
 uAFoXsSzSa/Qz9ElPg+KThikBxzJu3g4PHxUP+ZE8KcJvpO2+PQAIwg2S
 +IrJJGL0zIQ7wTp4LKEEvqhztlNqqjwowCXxsidcz/ZBG62SxGtJ4f23P
 7VLZ4BvHEodlKQRBVnsIOyTYqfRAWA/SjRsOtNxLS8S/RidPxn4Z+m7DT
 DTR9o3m2WT9xGHp0tbp9Of6vf8jOnbjBi+3BOH2ZfHHZ9lOOFcoFE3vy/ Q==;
IronPort-SDR: 2gXhFH1HRSwy4wG1lqM8LV9TnUi025oWakUPspcLxH8QaEcDDBB2vXUJlBrYY9hdJqFUVzYuYw
 JNu8bgbW0F0VBCBHRpQjJv8BvUTrIfhZMXH5spYtTfG9KGQBCbZCMmANOw+C4OIqVckTCpune6
 67Ryp17Aao4iC3qw39Q79LBGmUSrPaL5nv3rd/uD2p59hw//52j9ql4RzbV+g1tEBkWR7gtzb4
 f4tI4HYeP106ee0wiUOQn1EP2jYx5Wdq8erVgkMiJpdanVknQYT3ZjTARdWAGR3XHUjueD47LE
 svY=
X-IronPort-AV: E=Sophos;i="5.72,310,1580745600"; d="scan'208";a="133620418"
Received: from mail-sn1nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.53])
 by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2020 07:40:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXGTBxVijsaljo8akatM/1PZTAYBN1s2NkKORCVjBXVU4FYUbiycM2+3fF+HOLAqvLVpZuVPHB5aiuKFIuVKJ/HgLmZYoMt0q9CCk0tcioaZWgRbv2q1kk3GfhtmJ8KIUQIlL8TDhwuNqZOzT4Ea/EGTF0M8eWQhJN4lDBuHBLitdBzFJUmaFZjJ7lPHLS4BSPDuy42cKb2gBWaLvdNkdZ2JdiqObL88fH32K/yN5V52NDrOXmCMnyYNVroRRAuP/Hn1IDdgDqCMgs2iGcrC/uDXhOhm++N0c3+h8JqbDnS5nIPWn2qkWm3BM6S7B/t6olT67Ys2p2XJ9GMpk3KmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFEHnUvQ5Nl+U09oSTZJU9u4ExC/HwTl0Etccy1LgB0=;
 b=j29AF1/351V47OxNDsiVPHkefiAqq1FBle5gd/IwmsY52ow0sZtaW4UQtxj/QlpBMQSFAHH8k9SHhcK0vc1aKHbcMLC8hwSXXoZjy/x/aTVROb3kZ69IhdnCY7pxXOBL5Ath+cSU7jcNQHAZpTNOjUF1IaLjAc7j7Y38vf2ORltiBU+oOs3Kxl/MkLskY9WaF4TKbR1N4rPRxgep20ei4f+wOsmImZm952h79WRdHB5T1Qih76qjsr1unctsJG1uloVV2fChStVoLvf8I60bOwWBqyzFKRqpITs/vAfEuH9eMn3KL7APfoSxchc/Dxa2NRWzXJLmiGlpktxRzl+RRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFEHnUvQ5Nl+U09oSTZJU9u4ExC/HwTl0Etccy1LgB0=;
 b=B6TC5fJ4AgROCW5750DwsLWEO0k4dAX36fDJTUT5JYx8+mEebYUB+wSj6/11KGX5Awgfe1mLU50v77J9L8SlEzKpYSc8Tqlb6suh/RDG9AnKEQ3mICYze2WPR+KGDnFUwuzxj+uOXuJzwTH9V6eBKXxA16vvgo85F4Qsr0MRum0=
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
 by CO2PR04MB2200.namprd04.prod.outlook.com (2603:10b6:102:e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Thu, 26 Mar
 2020 23:40:34 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
 ([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
 ([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 23:40:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: Kendryte K210 support v4
Thread-Topic: Kendryte K210 support v4
Thread-Index: AQHWAZNaLEjVeiBygka2zA2IfW/gVg==
Date: Thu, 26 Mar 2020 23:40:34 +0000
Message-ID: <CO2PR04MB23439F82E1F360E1562DED77E7CF0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <mhng-9f7e9ebe-0ce7-4ccd-9a18-ed5d14c165e7@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34bad4d8-969c-4b6b-8d57-08d7d1df1420
x-ms-traffictypediagnostic: CO2PR04MB2200:
x-microsoft-antispam-prvs: <CO2PR04MB2200E18AF843FD511AE50FCEE7CF0@CO2PR04MB2200.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(8676002)(5660300002)(186003)(6916009)(81166006)(81156014)(52536014)(316002)(71200400001)(6506007)(66476007)(66446008)(91956017)(64756008)(7696005)(26005)(53546011)(33656002)(66556008)(66946007)(8936002)(4326008)(2906002)(9686003)(76116006)(55016002)(4744005)(478600001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RBzRhvxJsV3x/hQXpZ5u5YcMhs2FG0Da2/jaVT27j0qSXl0K936GeTsAXHlSgqv5X4lAgv8KcC9aG7X3TaBoN4F1i67w9MHAwDkwrcLgnR0w6B4M1rur3aDIyh0tBEPB2O6+uh/D7ecvmnvua5UWOUOik17XnBop+u7rtk8VakOo0N2UoJNiWAWkMTAG1nTeY9ivcjTuiZX09sE7fqsN24+ZuMV8hOgmXLl61dh7aQt5Xp42/pPv626GPpFa8xvKHjICeoqEcih8d8zy+ReKbQWzdiro+x1SzDdaAcFPN4tDryX7dtXFqBNbSc4rb6H35z2u3lLjR3V7nvO0Zpr5oIYirTqZxcYe6fzxXxln7fZFpr6Pr/sLbSeqvXsiP1GoiB1XEUHOYoIP1QTQHCl0xj4YkiJMhWQ3wHyFX4N0vMSxheMlhJ+VlSUetn2g4bBa
x-ms-exchange-antispam-messagedata: P4RRFcvKCtfjvdUDa8t3w87UruPAW81ooVQ8pO012j4boh7YKqXeR8br4oy+934Upb8WB1wLoS301iEYNyRb9hfyIjjaanrQ5L6BBlk2RNh8qjnEiCPdEWxTh9iqH8q/SgnboIvyPWlZoPHmdmyZNQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bad4d8-969c-4b6b-8d57-08d7d1df1420
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 23:40:34.0514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1X8kVl+CbZRgrl4c3oBf5RpIRksKUI+2UkDYRO5JEDUxRd/GtR02tsxpOrR6yZYMkINz5mliFOcU1mqEjMsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_164043_664091_16D7E687 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/03/27 7:09, Palmer Dabbelt wrote:=0A=
> On Mon, 23 Mar 2020 21:19:05 PDT (-0700), Damien Le Moal wrote:=0A=
>>> Palmer,=0A=
>>=0A=
>> Ping ?=0A=
>>=0A=
>> It would be great to get this series in 5.7.=0A=
> =0A=
> Well, the real issue here is that the new series don't appear to address =
the=0A=
> fundamental issue I had with the patch set (kernel binaries that only run=
 on=0A=
> one system).  As a result it's gone on the list of things I need to go fi=
x,=0A=
> which is quite a bit longer than the review queue.=0A=
> =0A=
=0A=
I do not understand... Are you referring to the compressed instruction #ifd=
ef=0A=
that was in the unaligned load/store handler ? The latest v4 removed that a=
nd I=0A=
actuall tested all 4 combinations of kernel and user space being compiled w=
ith=0A=
and without compressed instructions. All worked fine.=0A=
=0A=
We had the same problem in OpenSBI by the way and we fixed it there too.=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

