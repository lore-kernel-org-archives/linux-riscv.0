Return-Path: <SRS0=gGBx=QO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1954EC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 07:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8AF52147C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Feb 2019 07:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="THXKUTLa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Q5Oan6iy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="N/MHwUUZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8AF52147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qssb1dJ6BC3ocNZevpYjVPmb4NkXy09PyU2KgO4kQpc=; b=THXKUTLaZMOqf1
	nyOxyQ1pxkm75fmUH2BLK8+/+A/aL3XvvL9eqdGbIfRP0iWi3cCv8O73H5irq5R94hP3sJEHU4CxQ
	Qt7F/vwjC1JfTX0fxjgJKLGy/ogcfZcEjyxifYmb0xe0kl3ZTBpZOmS0YO8TAgZVqFsknlO51LMKF
	0O7IWdpnDopDBf//6WNHcIORKyKOGPj7uaf7gqDf5eMDfGGO2F9lC0600RRat2rjSRzzN/NggejhT
	VwEXY7VX5rvUXuYoE6mRaW/cyvHyq4wytg/ZccqNJwyF2MDrzd1I4FCY8ZGMYL5jOmnewh4e13Z22
	XBx5xSfw/VzR5fiij7tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grdw0-0001Fh-IZ; Thu, 07 Feb 2019 07:17:20 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grdvw-0001Ew-Qs
 for linux-riscv@lists.infradead.org; Thu, 07 Feb 2019 07:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549523837; x=1581059837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f8N1TKXdqniKhPriHBxaBemVyGDAV4ehyl1+nxQvMpo=;
 b=Q5Oan6iyA3SxjxHAlB2MW+3OrYrV28USZdPAmbyQ5QQAdPxXOCnxloI0
 z76IR7CMc0GMpM2MyyN517lM2cvxwoioVjmtBi4HvYTvkMayXlG/+aLWO
 /dR3y9PmYsOBb+c4ESSlZWA/b/+MNT0Hs3QEqCz+CmK2QNbKmLcSFu8Bo
 JHoPBuEr3stG84W0eBd2+2qg1UHye+gQcU4unPgrUhbltivhDjw2GHgJG
 Wwv4qYfB5SXtNwoFH6PZJNfLffhWJTHjeAjcxgMOiaHLdr6YP26j93wia
 ev4AokS8tOeeCQnK7UBfPdKSgfWEjbCL62ElBYLAMWEFqHaw+T9ytn4y8 g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="101981214"
Received: from mail-sn1nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.53])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2019 15:17:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGh8bdB49TlsCUdOyvci3H/+ld4dqx26HWIXl5t1Q9s=;
 b=N/MHwUUZ3a5+giFoFKhSHLeGXkwbOiVO9exJHC4ssCcf617FFpI1ao/3mpJNHuza4Kg3R/TCK4JQnV+OaaU4VhyIEmELstYFg9ZV2G/JyRPkNXN8HQ6ShpHS3r7d0uRyBNkn+y0PgMLP5fPKCozODdDPsvrKRJS6Zo6d09H6cH0=
Received: from BYAPR04MB5303.namprd04.prod.outlook.com (20.178.49.148) by
 BYAPR04MB4168.namprd04.prod.outlook.com (20.176.250.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Thu, 7 Feb 2019 07:17:05 +0000
Received: from BYAPR04MB5303.namprd04.prod.outlook.com
 ([fe80::add1:92cc:65d7:5d94]) by BYAPR04MB5303.namprd04.prod.outlook.com
 ([fe80::add1:92cc:65d7:5d94%2]) with mapi id 15.20.1601.016; Thu, 7 Feb 2019
 07:17:05 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, ron minnich <rminnich@gmail.com>
Subject: RE: [sw-dev] SBI extension proposal v2
Thread-Topic: [sw-dev] SBI extension proposal v2
Thread-Index: AQHUtwKAmngE4O36IU2Aa6p2Kwc1mqXEnNKAgABDcwCAAAF1gIAAMu4AgAzB3wCAAAkTgIAAhoIAgAFeLICAADdLwA==
Date: Thu, 7 Feb 2019 07:17:05 +0000
Message-ID: <BYAPR04MB5303F11D9F51A33DDA7939898D680@BYAPR04MB5303.namprd04.prod.outlook.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <22450f8b5b18421e486985725b1a58167662fd2d.camel@kernel.crashing.org>
 <CAPhv3nqQRC=jsLuheFPa1=qj7_rZ4D9q8nTr_yK7qeotobPbnA@mail.gmail.com>
 <CAP6exYJNWRuW6P3BXu6XfcZOKiCECjsv3SJQ14uMxQY0Ypg1pQ@mail.gmail.com>
 <alpine.DEB.2.21.9999.1902061914480.6518@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1902061914480.6518@viisi.sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR04MB4168;
 6:l88QnyDiK3XPnrMCRW9Vdlk4ELHBPSJTW689C/9xyduLUXQXkxk1g4cHFtJkuGpywT/E81EDqD3D6ErmOrKbTVysjVKyRSFPDDF9KHYaTwbfAJV4ln8qgMa6Oc/8Dmn6/gL7TSFVXjVwtGWZs/wV+jygAbVPWc7GyywEOjU4T3Oj3HT0EJrZojiJlK8ORWrqUTZt8kMLAg1vVrK6vxw66HvZCg+eftR6e9+X7HbY7AsH/71NHu01fzupe9t6j3PVIuOAcYkPn4HVkD2TunbqdC5uTYy5LzpNI3kwazybRHR13a4OrAb8H/H008RVatttFWS3rIqTX5Pf3Vr4zNCk791zSdiYwVfZHvX1ayXfNLLga7bHQ76wan2pFD+qVtdxo2D83qToV+7x+cgcApZd/5zWqPb7F8sdI7JCechZQITnQNDi3qaRm3B7Y/rOTTX5tW1r9ky4sAejvF0P+4C3RA==;
 5:2/fQh7oG3vRzsI5VLajW+VNnXweOFtnASqYKWjWpjIdXEmeeRJF5z4054tP+sn6t6wWkJ+qbxuwb+F5GmVNaMDLbTkWq0aAgqvikQv1fCFfeIzsM5Za2tnU62+oDyfbvk/9vtLg/6uPUBzkuxdgAGiQ9FJcQOMhll8VyF1N7tje1FxbjFxzq8cLQKHMRJQQfEvHnVPt/YPdbf2d45HZtHg==;
 7:KULQBRoCVRqDQ3hOXKkBukq1kvfC+Nd9+Mg5LrkLp1cgZyJQVQa1gSIO7tYOW+jals6i+4S8BiQ2zVYvZyK7KZiedsVNWKNFUWsB3NL2spal6Vnx0ux7Hlu5+ArnWzbeEc0FO6owSwS3C8ceWtQQ1w==
x-ms-office365-filtering-correlation-id: 24dd4240-df34-4bb8-2cea-08d68ccc43cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR04MB4168; 
x-ms-traffictypediagnostic: BYAPR04MB4168:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4168274AC75880B942A374448D680@BYAPR04MB4168.namprd04.prod.outlook.com>
x-forefront-prvs: 0941B96580
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(396003)(39860400002)(136003)(199004)(189003)(13464003)(25786009)(3846002)(6116002)(97736004)(66066001)(446003)(14454004)(7736002)(53546011)(106356001)(9686003)(74316002)(71190400001)(71200400001)(81156014)(81166006)(476003)(6506007)(486006)(8936002)(68736007)(55016002)(8676002)(105586002)(33656002)(2906002)(53936002)(11346002)(305945005)(86362001)(256004)(6246003)(102836004)(316002)(4326008)(561944003)(7696005)(99286004)(93886005)(7416002)(76176011)(26005)(72206003)(54906003)(6436002)(110136005)(229853002)(478600001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4168;
 H:BYAPR04MB5303.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xZCur6il1ZmoIEJRTbz5qB8IWf1z81C4qkzeCuFgmAJFl2feBs15/jvlafYnkasQOwylYYPF+nKbQBOPUq3EU2Mo90MBmL5o8W70m4ce2WKPzHRaLmAj5JPrF+8u1vj6GKc33plHVpydcrAM90zLg/dOzsesiYeDXUjw7sB5DQy0p0a8qPJCYyiPDQlK/aFqwLckUdgMjDRWju48NnEuDwLvPpINHSDkBDs6DaadFQQloTnL9E37vV7BlZvihAY3lcmPYFhbgqvaiZea0ODPQHzlBYhi/hi3O7z9+I3ZwYoNMD60/GKYM4aD6c6BhdZFexy0X5+4UoAN2A2wlbMlymGV3b2Aq+Bu4526O3UcmD3I4U4ue3kCbj8edEkeVVncSrH7Mznqz0T8n3bzrq544m6YQLJKvVNftwaPZkZvd8k=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24dd4240-df34-4bb8-2cea-08d68ccc43cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2019 07:17:05.6940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_231717_058149_328AA92B 
X-CRM114-Status: GOOD (  22.64  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "zong@andestech.com" <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 =?iso-8859-1?Q?Lu=EDs_Marques?= <luismarques@lowrisc.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Andrew Waterman <andrew@sifive.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Anup Patel <anup@brainfault.org>, "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: linux-riscv [mailto:linux-riscv-bounces@lists.infradead.org] On Beh=
alf
> Of Paul Walmsley
> Sent: Thursday, February 7, 2019 9:27 AM
> To: ron minnich <rminnich@gmail.com>
> Cc: mark.rutland@arm.com; Christoph Hellwig <hch@infradead.org>;
> Damien Le Moal <Damien.LeMoal@wdc.com>; Olof Johansson
> <olof.johansson@gmail.com>; alankao@andestech.com;
> abner.chang@hpe.com; Lu=EDs Marques <luismarques@lowrisc.org>; Anup
> Patel <anup@brainfault.org>; Palmer Dabbelt <palmer@sifive.com>;
> Alexander Graf <agraf@suse.de>; zong@andestech.com; Atish Patra
> <Atish.Patra@wdc.com>; sw-dev@groups.riscv.org; Paul Walmsley
> <paul.walmsley@sifive.com>; Benjamin Herrenschmidt
> <benh@kernel.crashing.org>; mick@ics.forth.gr; Alistair Francis
> <Alistair.Francis@wdc.com>; Luke Kenneth Casson Leighton <lkcl@lkcl.net>;
> linux-riscv@lists.infradead.org; Andrew Waterman <andrew@sifive.com>
> Subject: Re: [sw-dev] SBI extension proposal v2
> =

> On Tue, 5 Feb 2019, ron minnich wrote:
> =

> > While I respect the tremendous amount of work the OpenSBI authors have
> > done, I agree with Benjamin and Luis.
> =

> There are a few key points that seem to be getting lost in this
> discussion:
> =

> 1. OpenSBI is a sample implementation of the SBI interface, and is not th=
e SBI
> standard itself
> =

> 2. It is optional to implement the SBI, and it's likely that only certain=
 types of
> platforms will do so
> =

> 3. OpenSBI, from my point of view, consists of two distinct components:
> 	a. libraries that can be used as reference implementations by
> 	   other early boot firmware; and
> 	b. sample early boot firmware that replaces riscv-pk

I would like to clarify that reference firmwares provided by OpenSBI
only provide RUNTIME services (i.e. handle SBI calls and M-mode traps)
so they are not early boot firmware.

The OpenSBI reference firmwares are not suitable to be used as ROM
firmware (e.g. ZSBL) or LOADER (e.g. FSBL) firmware. They are only
RUNTIME firmwares designed to replace BBL (riscv-pk).

Further, it is not mandatory to use OpenSBI reference firmwares as-is
and HW vendors can always create their own RUNTIME firmware (probably
link it to OpenSBI library).

> =

> As far as I can tell, as long as the platform specification standards are=
 written
> correctly, there's no conflict between SBI-based platforms and SBI-less
> platforms.
> =

> > There is a further issue that occurred to me doing their excellent
> > FOSDEM talk, which is that nowhere in this has any kind of verified
> > boot scenario been discussed, and if you don't get that thinking in
> > from the start it is very hard to wedge it in later.
> =

> Verified boot seems almost completely orthogonal to OpenSBI's library
> implementation (3a, above).  U-boot, or Grub, or Coreboot, could reuse the
> OpenSBI libraries, but not the OpenSBI early boot firmware.  Then those
> other bootloaders can implement whatever verified/trusted/secure boot
> approach that they wish.
> =

> As 3b mentions above, the OpenSBI repository also contains sample early
> boot firmware.  That part of OpenSBI would clearly need to be modified to
> support some sort of verified boot.  However, no one to my knowledge is
> proposing to make the OpenSBI sample early boot firmware a RISC-V
> standard.  That part of OpenSBL is just a sample first-stage bootloader
> implementation - the same way that U-boot SPL or Coreboot romstage are
> sample first-stage bootloader implementations.
> =

> ...
> =

> I personally am excited to finally be able to use U-boot's rich commandli=
ne
> interface and device drivers without needing to have riscv-pk (aka BBL)
> involved.  Those who are not doing active RISC-V Linux development may not
> be aware that the use of riscv-pk made it very difficult to use upstream-
> focused Linux DT data.  Even though I might have slightly different
> preferences for the current boot flow, their work removes a major obstacle
> from RISC-V Linux upstream development, and is a big step forward.
> =

> =


Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
