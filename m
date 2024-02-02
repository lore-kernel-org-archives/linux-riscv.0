Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA18C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6fKwE7odlUp+LSgYwzGnDz+Cr0jJ03M3z3t2HSK2Kg=; b=tbvzMVkMPZg01q
	RgqP+wLy4ZJSu8NOADEytDA7VK4Z50FNS+A7YrYEI2TJgxugSIzgKsl6k4j4Bb4nGIajQ0PSQPYWT
	urwL3K8IS2FgLxm1QC0S6lLKwN+xS7qJZ4BGMyCWU5baldBgERT9sb1lsOlmgYEyepoHSDunxmEwB
	1APSloZpK0NRntX7H+JG/UUyuAO0BuZ4DtkLZuShAxtTGIboyLUPk/F/wGw1zohYxFEHe0AHBVWmJ
	nYw4zEo+I/otfikEb27Iup7rQdB5MjrTh0csQaZfEzKU9Sz6DVnC64vbcruxwaefCCq+ypRTSZggs
	PBceIU6v6Sbhykt3xOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwRA-0000000CJRK-3ctg;
	Fri, 02 Feb 2024 16:30:44 +0000
Received: from mail-bjschn02on20720.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::720] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjY1-00000009vOP-0nU1
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 02:44:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDHVXA9kLJWMJvMF7VT2OxpvMy2Iwnh3DaZ77IcJ0E0aKhvpsSnkZMqI+Rn0DhJiuM7irrk8MIwl+c+cIYS5gJe+D9aLWvCdTWN6SfmxQiIYlNjb5i+3bwdl3WjU56GqxJVogMnQo0QxlxO8RLKvvj5QjqKTo5M/5SXdTYp8fSLn6/cJ8LdBdWV+5xoCaDafE7iLvkskvEYefUbHV6N8Eqi633ypt/Ok8ADkRKBq6xikbEq7R5lnCCxaSWDDcd073ph0hrqU29nCJDJjAqa2KAsRv5VGvqbU+Jlkq8ZJNfbs+fkvQfNzI/B755cRPkfvBvfi4tS7Z4G24ByKLJSyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Y8Khx/q1f0Iajefc0SNvoytNuWxwzuLFgTo8+yGt+U=;
 b=O8KmytqmNUHKByrgZVpqpB4oC+dJ/hmU0oS+tsu3d1fl1y2a/xRQN+xjPvqI8eBSTOW7lscxypiQjTzZd9lACq59o7ZMaQFUuwr9NvRqIt5KWQL+TtcQkOK01okpkMGRF1HTBH0aeHUTMsPQDTm8+4f7x/h/c/H+p723enC+Nx11TnPj+nF9/haUjDI/+c1cwJXdwR6NxkqnNymQpImrDtwdPoNf3sq8xNCGoteF89bD2onRBWnNvOUPJU16hU/ThcSzimjkYor0MOCRhgITxRn/JYanXtUGtG+NyRcNFKdqPb8E9OTYTl1ySlGXU4kntIA6ttpEM26lE9QQ8QGciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::10) by SHXPR01MB0848.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 02:29:17 +0000
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 ([fe80::b0af:4c9d:2058:a344]) by
 SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn ([fe80::b0af:4c9d:2058:a344%6])
 with mapi id 15.20.7249.025; Fri, 2 Feb 2024 02:29:16 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW3YyXSByaXNjdjogZHRzOiBzdGFyZml2ZTogamg3MTEw?=
 =?gb2312?Q?:_Add_camera_subsystem_nodes?=
Thread-Topic: =?gb2312?B?u9i4tDogW3YyXSByaXNjdjogZHRzOiBzdGFyZml2ZTogamg3MTEwOiBBZGQg?=
 =?gb2312?Q?camera_subsystem_nodes?=
Thread-Index: AQHaU1XbC4h2Cxa8Q0qBcekBfbY08LDz/xMAgAC4KBCAAR2gAIAAguQQ
Date: Fri, 2 Feb 2024 02:29:16 +0000
Message-ID: <SHXPR01MB0671975B6B2455E43A5C7D86F242A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
References: <20240130082509.217683-1-changhuang.liang@starfivetech.com>
 <20240131-recycling-entering-b742e0e835eb@spud>
 <SH0PR01MB06675EF7ACD1452C4DEBE45FF243A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
 <20240201-handiwork-excretion-36aa2eea0709@spud>
In-Reply-To: <20240201-handiwork-excretion-36aa2eea0709@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0671:EE_|SHXPR01MB0848:EE_
x-ms-office365-filtering-correlation-id: 869968ff-9a54-478c-2165-08dc2396c0f6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +kKAYU2/KnTjEz4UKqLpmB0+5Fl3pLyTnFfypAcRbKBUQ0iXCg6i1M/R5er1Quh/G9CKceQzdpO0pbElwCvz1KNQt6nB/ez9ba65QxO0Cj7lQyrtNPk1pJ7Gd1GDiKyenk8JID6uemk0OoQwhUDgaRABJ8KK7CTRK/COfLLT8IBx8aCkKJvidHWUTRpUhghPAQ4XTyU+fzfUI4qhtxbJn8JIBKw8Kuv6E2h/MqBFefJwGY2ax0Tjd0+H9PLxD8pGJy4ZndIRfbCrkooiJVVY3VyZYAwRoyR28nicBeqk8pjakWLaH4/y0RWyTIFR3HXgaHmE/6wDPebyj+mBXByEZnlFMbfOyFhyF8D10Z0bsbzvz0bM8Z8iCMvYkji11X60qIDGlAvVc69n10f6FiZ2nQ/TA5ke6ERasx75oavIs61y4fXsH0BgRxXbCCvW5aj9nixkNGScXyWvqXyavKZXq/mu3t18JUZu08MnOuBwS47VB3qInY2aIMm1L9xsY5KTDImpaCiXvA8/GgKvfTpxvKFptkSRsvui9Iqgkv/9yD0Qe355PZV7w7NhMwxZmgNp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(39830400003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(83380400001)(224303003)(41320700001)(40160700002)(33656002)(86362001)(41300700001)(40180700001)(38070700009)(66946007)(122000001)(9686003)(38100700002)(26005)(7696005)(76116006)(508600001)(2906002)(4744005)(6916009)(66556008)(66476007)(5660300002)(64756008)(66446008)(54906003)(44832011)(8936002)(71200400001)(4326008)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RG55SXBpNVE1YkRyQTBodENReldORDVXUGV4d21yNHRFRFA1RzdKbXZaV0xN?=
 =?gb2312?B?WTRVbnR5T25DaXFlZXVCTW95WG5NOW9BSWRTNi9mUUk3bmovWjFQdDlKUVJt?=
 =?gb2312?B?OGMySzVJTlFKT0VscHJuRVFWcUd4WnNVZFZvQmV4a2l4MU92S2Q4SzB4SlJ0?=
 =?gb2312?B?SmNFNkR5alEvWURCWUhJNEJlMVRXOGZqMHpZQTFhcmgzZ0M5WHlxVkNYVHcz?=
 =?gb2312?B?dzlDZ2FvODRrVjNKajVIQ000aWtQVWU5VFhURjZWVC9maWtUb200VkoyaVI4?=
 =?gb2312?B?SGNkSFNGS200OVN2elcyR3J2SE1nT1I2ZnBnQ2dwSVdMekgrTEhWenMzYmNP?=
 =?gb2312?B?Z3krZFRJRW5VSGhFQ0lxYmhDTHJJWWVKeXJmRUVRa3RLZ0xxTktLTWd4TEcz?=
 =?gb2312?B?SGQ2cjBhUFVjT1JGNXNpVUYvUnd0ZVlXMmtvZHByU0F5RmpRZ1k5TVJYQUVa?=
 =?gb2312?B?UFY0QlZVaFIvamE1QlVKaURoWGNkTUU4SnRaRC9kUzBwVkF6cWN0cDJqVUJ0?=
 =?gb2312?B?UWdBd3R3UTFnMFJpdjJhdUZQNUdDRWNMV2pzRFhZZlN5RFFQem1zd3NRaXBN?=
 =?gb2312?B?L05BTzBCUVJaWGVSZFNGTXIvNlU0ZXUrTVhNTnBLTEtEK2oxSVc2Q0YrNTE5?=
 =?gb2312?B?dFRLdmduRzBKbGNIRDB2RThxaFdWRlk5RFdZTTZlRVZGc3l2YkpSQ0NXYXc0?=
 =?gb2312?B?emVwTVhZT0ErYkJ3bWpuR2pjWEFhZFFKYVRBS2xoaEorUXphVEtsd3c2TVRZ?=
 =?gb2312?B?N2RRdzN5ZjVOUk9OSVZMS2ZZTlZQSTZqeU5jLyswd0NGcWt4UExiMkNnV3lj?=
 =?gb2312?B?UUJRbFB6Zlk3ZEVUNUE1cGRyY0ZVWHA1Y0dzSFd3em1yR3FtQ1g5c2lQWm13?=
 =?gb2312?B?K0UycmFicEJ2Rmk3MlhWM1Q4OWw0cVBCdnV5UmVPb3FXc0pBTWZuU01UK0tL?=
 =?gb2312?B?SHhKZnNmSGVqbGFoazVGMXoyR1prU282UkNpYlQ4Y3pwR0tzL2NyQnJQT25p?=
 =?gb2312?B?c1JrWHAxMWlGRUc0cWlIYzFxQmdMeVo1TnlTaHRqRWs1ejVoN25QQXIwMmpu?=
 =?gb2312?B?OXJPbkJwZy8xR3RCYlJMUk9nUnBtVWF3ZWtQNVhEM0QwZGJPSW9GZkNUTm50?=
 =?gb2312?B?MU1DdEU3UWdPNnYrZ0VadnFSL0l3eWpxaHkvN2JhaVZpR3g2WHlQcTFzMEw4?=
 =?gb2312?B?OWNtbWFRcjVYYjN6Ujl0d1pITVhXRm96YTZkc1huWW9vc0xUZGxOQlBiNG1y?=
 =?gb2312?B?bXVuazlxMzhGSjBNMDM2aFZWd0pST0NEUE9tZWl1NjY4RHp1RTJjTE9PVnhF?=
 =?gb2312?B?TXpmRXJIRTMvSlFRdW1FcVkvdEpyQXdxQkdPeHU2VHZRN25zR25xKzBEeURI?=
 =?gb2312?B?cjJuNTB2d1RJd21WbjgxOXJ5S2JtZXJUcVduOVdmRG80YUZVemhQY3c3YnZG?=
 =?gb2312?B?UGhVelFUSEU3L285b1MvYzlPN0pCL05TQjRrc1Z6UFVCZVh6TDVkeXBaT2Fo?=
 =?gb2312?B?WWQzTFVoYzNWWDBoT1BGVk1SaUlFVFE0RVlmUFpBYmlqSkVqOEJpYVAxZkFi?=
 =?gb2312?B?UUxoUjVYZzJQb00xclNSa2tXN0xBYnFBaWlxQkJ1L0Z5emhkZVM0MjhpaGtD?=
 =?gb2312?B?VGw0UlNKV3NIUVR1L2xNRHBTL1AvcU5nWXdVMUs3ZnRZYXc3VlpnSHJ3b1hQ?=
 =?gb2312?B?MlY1KzlGV2ZvekZJTCtXVjl4eWpLMTlYRjFuT3drbmVpRHIwcTd4ZjRiSVZ0?=
 =?gb2312?B?bXZVS1FEc2F4bFJ6cUV4Tmk3dE8zcXlFWmI4a1ZtMFpISnlDYkV4Y2dYcDdI?=
 =?gb2312?B?RndJZDFEcjI1S0pYZ2NEQS81bnY3YTE2WmRQQm1HSnBzT1o4K1JGUG1TbkZs?=
 =?gb2312?B?cjdJR3BLUWVsR3lBTWV6dVJNbzB0b0llZ0xibGhFZElXeGwya3hNSXZyYUdw?=
 =?gb2312?B?MkdqN1JXTkpaT0R6cFBaRE5ycENhZ2g2bmZsbXpVZjdmSGtKRzFjcXd2NFFt?=
 =?gb2312?B?SXpsRHpzOGEyUnJyblk3QWQwdDVuZVR5dGJQaU1uNmhtd1J3VFFxQWtPVFhP?=
 =?gb2312?B?aGZ3bVdsa1Jqa0J6NzRweE9nR0krUUdodmpRTjYyM0JtbStuUDBpQWJQNjNk?=
 =?gb2312?B?VTg4eGlLbnZmdmgvYjhUWEhaS2hwTEl0aUkxV0lUSVdMN1BCOXhMZlQ2NGdN?=
 =?gb2312?B?bmc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 869968ff-9a54-478c-2165-08dc2396c0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 02:29:16.8935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKiPq0BHpamd4XyF8NENi6NRwu+UC6VvgiEx2oy67wuP59Sih6FmA/lAJbEYUWQjf19SbFk0KgRXQ3t3vAFU7IvZjrYLg0Ot7XU35mCBu1LzXzy88MuVn9Jp0gmn+kq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0848
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_184457_236324_6A8AC308 
X-CRM114-Status: GOOD (  12.18  )
X-Mailman-Approved-At: Fri, 02 Feb 2024 08:30:41 -0800
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi, Conor,

[...]
> > > > +	imx219_clk: imx219-clock {
> > > > +		compatible = "fixed-clock";
> > > > +		clock-output-names = "imx219_clk";
> > > > +		clock-frequency = <24000000>;
> > > > +		#clock-cells = <0>;
> > > > +	};
> > >
> > > Why do you need an output name here?
> >
> > The output name can be unnecessary.
> >
> > > Also, where does this clock come from? Is it an oscillator on the board?
> > >
> >
> > This clock come from imx219, not the VisionFive 2 board.
> 
> If the camera is not on the visionfive 2 board, why are you adding this to
> visionfive-2.dtsi?

It seems that I need to use dtso. Right?

regards
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
