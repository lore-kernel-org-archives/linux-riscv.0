Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903ECC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 12:47:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B44B239FD
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 12:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B44B239FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jWi+Aq/jmMUGAVodJ76seMB0GgwXwyqLxEq0Zu6lLeg=; b=AHgQ/6kpnL6pMJIku/d7Db1yD
	HKd7gaqIXkuRrJ12sV9Fyy9ZDe8OSPRXRAql0qPPdiUL5MmDyVfswWOXVV0Yt6ee8mErM198Z2Dth
	IcA563iZsG2KFO2gXkARIDISbNdg+d+Usf6NGPSoEqAdA9pvRWqLUDSfUddbmyW2XuY+HxCKJMve3
	e51HEJLiharNuK2N7iGGA+uglTdoCeb2uC1QewAZlM0qM+h07NN3GaC6P6lcDAIyC9ILO3LlPQpUf
	ZL523yhfX6z2m8RvKwULRz7WJ/ewzNzdDr0T99fSky+CJBSGNxlR9ylJdMVcsS8t5NhCxlLVLoZg3
	R6vJ/kNPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2ZMV-0001ba-4S; Thu, 21 Jan 2021 12:46:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2ZMS-0001Zz-3a
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 12:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611233212; x=1642769212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CaUZehLEPs3R0B5XtozfFQ2K1IBbp9WavGveXpAZmT0=;
 b=atxAaq4uPwBMjyun41ySInHGBAuuQnma8hvWQlFdi1geJNutyDidMCL9
 ikqHxb7y87yKlpqo+TH6IbyMEmN/R+FdSEslTPdbfDLBl9ksinO08ahnL
 5Nh8rMgykkUih5dWPCz5ka6+wZs5/1l5I+cBkvvsdQUZMa956aooM33hL
 DfRYeMDm6Q5qt0n7+xdWEp7PhdLZeHHxvhdikoLCABX7I3reEonECfETh
 MHpINYX6yDriRmJesVNCjw11+wEHMHuydhjFbTcI4DSu3M7csRowS2GQX
 6Vj+XiCCvEkpZl7l5GkMQZNa5oKG0QYd8Y55fdEMTB5WWd3+nDap1n418 w==;
IronPort-SDR: ye5gD6GM2LkQERXJhrZUaexWWQo2EwPwRpfT2/4lChqHK+HiRerxTLClHYNkWKxKESQapF6F/O
 1DPHncYscLw1vAC+lZ2PFS9XRqmfAVioEQv11nGNq4Nd5bnPGnqkbX+Ug/WEZblWzfHAKFuUx2
 LTIndYo6yvHn18nXx6pzt5ydr3g/RLMU3DDjQngzQTs1jJcR+RWfKEvxdtMdVJ3Wqe7EH+yOV3
 nvHcklibfSVIgQtyAtxirNEo/9e4QKeZQE5IP9lDWja/ohN74FaYtOh4ZW5m2fSYuJvZJM0BKZ
 azQ=
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; d="scan'208";a="41215908"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jan 2021 05:46:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 21 Jan 2021 05:46:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 21 Jan 2021 05:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/A94J5MO/zfq6HGcT96/hmsJBINwIGc8uMxkJ2ZVrNqk9E1kwcV3mLjDjBBk/igIJNC00EVD5XY9DiaRQezu3f7z01yTNeRuhFAOItqQX++Z0AVeZ/afg88zRQOkSMvSZioNgAV6J+MeG2AGkQ4qIz7ILweB9ks3mZb+Jf70sQyomsHek07N5zxmag1wY5cKJdFhpHaDTl0BneCFkxKrFkLG7IvCIXBm1M+REvaIj4xT8R28i+B9imiXzlLC0hJiOukhSnUA7EV2BFxOlxChR4/uBZsFBhgd2cEZ93LFC3qeuHdcm2p8HS3D/ZZXmahRFIjzjdwq+eqUTjlZCcbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaUZehLEPs3R0B5XtozfFQ2K1IBbp9WavGveXpAZmT0=;
 b=PeP9mLuDp/58SSgoWGt+WGoB0LSQu/sfIf4+Kc/ASnwtlSPv0EOxe/4kaz9arw3gX/fsnogq8+VEzZ6k80b20Cc8mm27UU+w2mRg52vua2Lrpt0nUYRyTd3vOo2cOChZwfC6cGoJ1RG3e9gI2tEh/cXdwIiaQo262chIDxGOEDlbYy2YizHsZbfCTXAkAjTj67WXFoRK1yorm9bzNp09w4CJfif4SXlvRTDQOkLdYfOfSnErZj4nlCb0CHiSq5xUQKlf2+KXYBQv06Ar++rfZvcrPiVaDqiMINpna2y4NBTshlMowm3+CkkyT8tPHBS5u04XS76KuxCfjoVMGwoAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaUZehLEPs3R0B5XtozfFQ2K1IBbp9WavGveXpAZmT0=;
 b=jKpBPedm4s962tWrPdYP9tjav+U2NnqTpeor80t8ltH31DW1Gfjo9A1YaSKGWQxFtsi2PkOdd2wd3L70HxfV8nDPdyk+0GRrb3zKQ78vu4P+ad41L7HXWU/ULNhAd0ryaAVIBMJRKgRzUlhezd5ApW5UX9vR3njm0mrY6ZefOzI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2269.namprd11.prod.outlook.com (2603:10b6:301:4d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 21 Jan
 2021 12:46:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::9863:7157:f43e:3205]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::9863:7157:f43e:3205%5]) with mapi id 15.20.3763.015; Thu, 21 Jan 2021
 12:46:42 +0000
From: <Conor.Dooley@microchip.com>
To: <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v3 1/5] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH v3 1/5] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHW2UlNXeYm4PMxvUi4o6GADiv4HaoUXEWAgB3YFoA=
Date: Thu, 21 Jan 2021 12:46:42 +0000
Message-ID: <3425400b-889f-5393-6c26-bf708f2734f1@microchip.com>
References: <20201223163247.28923-1-conor.dooley@microchip.com>
 <20201223163255.28992-1-conor.dooley@microchip.com>
 <X/BuucfqPGpE/S1r@latitude>
In-Reply-To: <X/BuucfqPGpE/S1r@latitude>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26297adb-bc5b-451a-be13-08d8be0a9a80
x-ms-traffictypediagnostic: MWHPR1101MB2269:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB22691277037A6BF1E01E7F3898A19@MWHPR1101MB2269.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I7fNk03CbYv2dycQyvRbyCuNVee+yo+kBdyocamx9NpAYJh/5uQmIPAzgzLtQJ8gGOGjFDBVgpW828LXvYADGxKl1c4PGd7k+aeR3RLDR4B+kxTyxlemTnziAg4R3p/6bcDog/AVMYYt3OtWvYQ9vQI+/XxcnOAiaZ50cbt5RZf6j332oe4TJIyr9a/3Y2PQNlyedlW1KFS7zaF47TPxLYRnYUjJDEgL6vngQRD94+9cZGCtMRoasQmQG4I225tjj8d27CLJKDbuSrwR3J3nKSICLoKv26BKv2spvsmfhrArgasTwJBmVC0wQpPaI9k/3LBX7kI6aVlIz39VLIkIcVVUNzC6Z+Glz0+c5ZMYaUSNVuUM6QWh0sM9Ssv04daMrV5nbmGk3bBUU0ftBc1rQVpzn50SG38+tHqdzdAUyNo5L9eID8TB1PQnRvjb4g97g0coVvOxfm6Vha6WwbgPsmSwuWQpNBwv+QHSHVZK0Vw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(396003)(366004)(136003)(376002)(64756008)(66446008)(36756003)(91956017)(66476007)(66556008)(76116006)(66946007)(8676002)(66574015)(6512007)(2906002)(316002)(5660300002)(26005)(6486002)(15650500001)(86362001)(186003)(8936002)(2616005)(31686004)(6916009)(83380400001)(6506007)(71200400001)(4326008)(478600001)(31696002)(7416002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?yZO2B7eiFLLq6WHq66erATenRMuLnokXqQjQNEfCo79ALH1IZw9VU9XE?=
 =?Windows-1252?Q?2viAND3rFduYGFUWFKaBbAezGJxWHHYi/0aTEBI/Jgb8dHAe3yDmOm+b?=
 =?Windows-1252?Q?YG166alhfG4/lTYPXmi2En4UZ9cRBxB6qDcdkvpUy6Ek55EKoa1rE6KS?=
 =?Windows-1252?Q?F4k8Uu+t8lCfaiAn7aQSpJ6hN35dycl5Q75mEAYgUz+oUenWCyuu6P8l?=
 =?Windows-1252?Q?NC6NVpRUseQJ5cnwE1e4VIYAid8vri5aH0ATgQ7bsC4ks70RTz7RLyFD?=
 =?Windows-1252?Q?VRJg11xQKAGkBpZP54ehEB4F6R1Qrb9n1wQfwTO7h13J4xPgtyjRVSb8?=
 =?Windows-1252?Q?GEfYE1WGFikxRdfb58B45f6XV1Y3h1+jRSLSzxiR2cTAHsKQ71kHnuOl?=
 =?Windows-1252?Q?fSjbA2gnSyZhpS02SamdbhhGgBMJ59qrILmt8ameS2CwzMT+REKFE+QA?=
 =?Windows-1252?Q?Wj2MQJscCtf/Cnhrmr3lnZhNJvPYzjo4buj6qC7O/xlWmGyz9SqV86Ks?=
 =?Windows-1252?Q?KUjvPHHx8E6DCLDgGXPw7L3L8P5vgAj860Q3/gECSm8hQoux6LWGOjPq?=
 =?Windows-1252?Q?H/PWi3hsv7FpW/iUIBKhB9C/9UKp1QNlYNQw1vBmNtMZRFJvVSFEIvl8?=
 =?Windows-1252?Q?nHlLmf5f2+ICg6Ww83gHbrdGbxQKKgXqCocHtBXbJQxJjCV4mbMAejGe?=
 =?Windows-1252?Q?hky7rF859pZYdMAsOgyxYJdUYVajZezTI4KpnrWipWmZNRJwDYpjFbkK?=
 =?Windows-1252?Q?o31RDOIv+P5uCX5pW1Dg45MkUofEfVerCsn5uHWTUy1WglFvwE9ZuJbZ?=
 =?Windows-1252?Q?T7c8wSy65SfDKOMur0IclCJey2f54vv+7wat27PzLywHNTqEVzCw/5Yd?=
 =?Windows-1252?Q?PcEq3v2ApxJy+196IrAFi9+NTJe6UgOrBBNYbnNY8SwovHCwsFndLxPA?=
 =?Windows-1252?Q?8MwP4Sw5U2NEn6Mn+QbfURJMlF57tPfgHg2KdrnPwISRC3SccsR7Wfye?=
 =?Windows-1252?Q?Dw/Y0CeFyuf8Ozsq+eBvyZyTEc4FKDTwlJGeZODWyHS2mLYQe/4DUmoz?=
 =?Windows-1252?Q?LA/DkdZbmGx48MPQQPAepBnoiDTN8puYkw8/7Ch6+5BlcIY/KSj4Ewbs?=
 =?Windows-1252?Q?c8qUR7h3mfNbjTc+lHjvsr5b?=
Content-ID: <9D97453363D5334E984D346FAB298ABC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26297adb-bc5b-451a-be13-08d8be0a9a80
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 12:46:42.1634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LX6fF+lQlhrYQRQYtibX3jT4xLXxpVQr4zMgLkpqCWUWOp9NKC6VYnwmS1Y1pI2SBU4dWERUKkZ1/ti+XG1LYyaYgH+IQZObBjmngLbVYZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_074652_446674_998BF305 
X-CRM114-Status: GOOD (  18.26  )
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
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 Lewis.Hanly@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, Cyril.Jean@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/01/2021 13:01, Jonathan Neusch=E4fer wrote

>Hello,
>
>I've added review comments below. Some of them might be more detailed
>than necessary, and reflect my opinion rather than something that must
>be fixed. Anyway, I hope my comments make sense.
>
the more detailed feedback the better in my book, if i dont mention it youl=
l probably see in changed in the next day or two
...
...
>
>
>> +=A0=A0=A0 /* Code for MSS_SYS_PARAM_ERR is not implemented with this ve=
rsion of driver. */
>
>What is the "code for MSS_SYS_PARAM_ERR" semantically? Input validation?
>
>> +=A0=A0=A0 writel_relaxed(0, mbox->int_reg);
>
>What does a write to mbox->int_reg do? Does it acknowledge an interrupt?
>It would be interesting to have an explaining comment here.

both of these are hang overs from the bare metal driver and will be dropped
>> +
>> +=A0=A0=A0 if (msg->cmd_data_size) {
>> +=A0=A0=A0 =A0=A0=A0 byte_buf =3D msg->cmd_data;
>> +
>> +=A0=A0=A0 =A0=A0=A0 for (index =3D 0; index < (msg->cmd_data_size / 4);=
 index++)
>> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 writel_relaxed(word_buf[index],
>> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0=A0 mbox->mailbo=
x_base + MAILBOX_REG_OFFSET + index);
>
>word_buf is uninitialized.
>
>In mpfs_mbox_rx_data, you access the registers at mbox->mailbox_base +
>MAILBOX_REG_OFFSET in steps of four bytes, here you increment the offset
>in steps of one byte, because the index isn't scaled. This seems wrong.
>

Thanks for catching this bug, both are related and were introduced during r=
efactoring.
The only dependent drivers implemented so far don't use the full sending fu=
nctionality
so it went unnoticed.

...
>
>
>> +
>> +=A0=A0=A0 mbox_chan_received_data(chan, (void *)data);
>> +=A0=A0=A0 devm_kfree(mbox->dev, data);
>> +}
>> +
>> +static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
>> +{
>> +=A0=A0=A0 struct mbox_chan *chan =3D (struct mbox_chan *)data;
>
>This cast and the one at the end of mpfs_mbox_rx_data are somewhat
>uncessary, because C allows implicit conversion of void pointers to and
>from other pointer types.
>

true, i had put them in thinking it made it more clear, but on reflection i=
t doesnt.

...
>> +++ b/include/soc/microchip/mpfs.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + *
>> + * Microchip PolarFire SoC (MPFS) mailbox
>
>This is mpfs.h, but the comment implies it's only for mailbox-related
>code, not for all of the Microchip PolarFire SoC. Is this intentional?
>

yeah, while thats correct for now it wont remain that way for long. ill dro=
p the mailbox reference

>
>Best regards,
>Jonathan Neusch=E4fer


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
