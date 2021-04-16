Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3530C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 00:27:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4F3610EA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 00:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4F3610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=TKlKeV+74ON+LVhGIdio9t0JhKzECj1NpMuEez9JN2g=; b=JO66o9q9eb4kq1T+hhINSOtU2
	g+wtv+epDcMSmw4yjDw+EZ77g644facxf5KfhtayK0f6ap3fhiEjnImO4hLIwcJ/fK1PinYpXqK9P
	FMHMdHMD7uSb4dOPMyf+ibZ40RlOf3FdkFsb4WTYb5+ZwhyFsAIhLiiv1Q4jAei1CQcIzFn+72gDu
	RkNMTyxjH/OZFwFf2p215RRZjPgCS3a/W/skJThj+f0jRxRJtMcHP8A1p77cz0o0c7FFHg1f6rld9
	IUtDt1pH8P/L8iFm/co4RHeO37SgILh0Qe+sCtyDiPz/oXAQ50DVB6biOU9O/NprEnuGc4gZJSyQj
	d1YUkglYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXCKE-000EEU-2w; Fri, 16 Apr 2021 00:27:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCKA-000EDs-Uu
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 00:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=7LQ12C0NJDNUn9gLGuUPER/W+UH8ztQJ2ISITw9EHy0=; b=FNdI0Fv2eB7q7FzCPXnL2v6cDd
 cWu00f7ZFS+BIyK6JtGlISv+jY+d2K0alOcwC3jZhnEnTO5fAlRQDh9ORGGKlHX0IhObIUpLSzt/n
 OFEcNThK+lpqeDEV7oVTN4f/Qgh9oqz3j0ofN6lY/bezJB8hi13a9rjtW4HY3zyOAg/k2tP/Sh8XG
 PCYoLtAUqZF1lwYKeoMzlvXeGq9gfTru8BULrSUpkWKQ+M3k2T+4qfaLaUlgUaNdWQhTLgFarFrUV
 xl8pod8bmR1xB7haxi313t+XoQURpBaM5a6N3N6+4cAtezOrNrz1jz0JjIOUW5MI2ejCnZBrUHtpH
 Cqs1d6qg==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXCK8-00906C-Bd
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 00:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618532824; x=1650068824;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=+hyz5PI6EL/gxSTMI7PTT1WpCx9a9yMj9wFcPeku1eo=;
 b=jyg9U4wgwH0CN4VB/JVq1aKg2HMvNL1qsqhaKGXAnBYrObwcoQu/Vz0S
 i+1qGtVp6YOeHNspLM0Vx2YDQfxzrfgxpnAvWgfVe8HDAg3z+BPvDfcFO
 9FtxqWBG2ZoDq0+Ka7eCDEleItAdbUSc/q3nBdghYd5HAaAurCfm1K2a1
 wCSTIuM0jriRGqFUBPizthtcziUB14rwEggemoE8kvYkrUYmL2yk51222
 HaOVgDxvJXeEyayn6YeWmkR3NK7qLltvGcgZxwQUTU97T0F90BgWMivc/
 8cQfebDlTC4TvKHOthuiYD1efKxfIG1OIn//AKOqwlgPNEygSQXsYBhos A==;
IronPort-SDR: qQV5h89YymbQglQRl7vDunP8HRCeLZQNwWNwZwKnUzjcKUgfFzJzJMR+bKSJeHU/gWBm35e5HB
 C2ciMe0Mrg6GZ3hKWYTv7zdOnNN2TGnUcP2zO/UmB26V6pIG/gV/w7i+5pM+U/+ZO/ylv0n3sW
 RwIio1ClAzaEUP/RXtHmt9vezLO1aBLkPCRanIbUGu3oakHMZAe54qsll0JMFkFh0FXRMaxBGp
 OojrlKhfE8Xnj8U9B/A6OHBcP3XEszjTlFaMFOMbVpFf5YDI/2EdQrK0gRGpyDgPgdPcScyiG5
 3ZE=
X-IronPort-AV: E=Sophos;i="5.82,226,1613404800"; d="scan'208";a="164993708"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2021 08:26:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TANVwTwTlXE3IHQVk2bSftbJFn9iyMyCSCOV1cyflhpJ4S/GPcMOPShP9ILHd2d/3n0D/80DemowOloCzniQ8rcj23/scLhSUeP61xI//NEptPSTsROTQjPymwkm/0CLCy1Nnu9jH1+X1917MOeCZQU1AyIRrDMhfrS9he23cfn9ojzHLlUuaLTuI9pRfzNy1lJPOXa7sFP50oUQNY9bIkClIl2u88EBIx7Ld+Efbx3zNKRGRzP3UWxslLITII883xgYRTJqke2v3icNexoVV2czo6bIyU1w0PIh7Z1AlZNyCyWw1EG0KScYpUVCju5HDngZJaN2H9NY243wEk7e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LQ12C0NJDNUn9gLGuUPER/W+UH8ztQJ2ISITw9EHy0=;
 b=j6FqC0psXo58v9YlGy81O9gYDMhwqFxP8tU+3L/2Yz0deI5m/5HNtn5/vPYplsbbNuA8ZRYJX89tlSg+2gDmhObX+W2O2ZSDsFD8nHKSi84p2SqaXt81BLYDx2pQekjGQr174k3Oc5fEuJHkpZYouvbuX2OlZflN2UKk7yBNtRSZOtwSdvYEt3LOzGosSg+iT2Qy2kCaDzpVqUsKgTqk8GloqEkD0qerBqEK9DKYhY79eI1KvaOx0iscs0TYnYFOd4Xdh2RcxGUASOZLNTo6hZ8HW62wJwJosYBqZ0YZztJBzJyN7LhSBWi6Rczf0gAIkOY+LN4g47/YFLlq0pCvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LQ12C0NJDNUn9gLGuUPER/W+UH8ztQJ2ISITw9EHy0=;
 b=GJa5MSlTzrFOK1vEapDhrQhnN2FRis1Sd7g9YX8IXtYnB6tENDtrXUtSmMDl0EYTHtcgKNAC61YMkWzfx8NGpLf4QPdPuFdV4k+9vmvIv8YI2JMvVUj2RXXboN+qFhXgw9Vl+RQPj6dNnyTBg7EPT03pXjG8fBmaoUnvOXcOMRI=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB7072.namprd04.prod.outlook.com (2603:10b6:208:1e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 00:26:27 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::8557:ab07:8b6b:da78%3]) with mapi id 15.20.4042.016; Fri, 16 Apr 2021
 00:26:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
CC: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "gerg@linux-m68k.org" <gerg@linux-m68k.org>, Anup Patel <Anup.Patel@wdc.com>, 
 "uclinux-dev@uclinux.org" <uclinux-dev@uclinux.org>
Subject: Re: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Thread-Topic: [PATCH v2 0/2] Fix binfmt_flat loader for RISC-V
Thread-Index: AQHXK8WacfnVzM4zUUS2ex+k23Zi9Q==
Date: Fri, 16 Apr 2021 00:26:27 +0000
Message-ID: <BL0PR04MB65143E710571C8CE7E7F0FB0E74C9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <BL0PR04MB65148D80C819A7E3B8365242E74D9@BL0PR04MB6514.namprd04.prod.outlook.com>
 <mhng-61cff5f4-32a0-417d-9a2f-eb6d052cf802@palmerdabbelt-glaptop>
 <20210415055605.GB8947@lst.de> <YHjYoDA2JPxSYVu0@zeniv-ca.linux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: zeniv.linux.org.uk; dkim=none (message not signed)
 header.d=none; zeniv.linux.org.uk; dmarc=none action=none header.from=wdc.com; 
x-originating-ip: [2400:2411:43c0:6000:c420:851d:e64f:2199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8512ce1-44b9-40f1-1346-08d9006e462b
x-ms-traffictypediagnostic: MN2PR04MB7072:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB707227E88852E478DA07DE08E74C9@MN2PR04MB7072.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZfsvSaun7BnJNl+DrvmV4dNSytrMloYp2EezZ9q8mNturqYcHx4bTC5268Ad9hQw7GB/DHC1dS4makHy7DjYKzWzFiH+OrPQRP3GvWeSrYQx8Ag0oMqWTVq/NscqKGrZb9S2nMXaEqyqF9P1zm+DQwzPfatuX3JnCjOZRLYDb7vq0s0Ic2+B4NzOGKlfnz4bI2XKWJqmY8X+IFhQHkg2L1Hsc4yN3qeKjqNl4QvR0o4lST/2Qq0N1VcXov+YpG1TVQflgkNJ6q/0i3SaZmttyVPPNEBkj+Alb/GfOVmZnsTNyNJWr4kPspMvHkdH6AznreLjxl2FC0e/VCBIutyxJ6DWC5wpYACVW1h1zxUEJiuz2FgLIH4f7rm4VNFoVsL9exQPTr0F7cS0HklT9BsCkIbsHipaOytYKZR5RKJvk4O2MTvD82/r8vsOh1PY/FIR0Vvxu9IJ0yurCW99PiLLPAQXqqPUzB1pt3WfMWHuuviQNiSn7G/IX1FHZ0ZRDirE/h+N6fbQraUOLDs+0ly+RLTVa3DKeQXOWe6YeCC1JxmPyeKaAucXUwtOEXLcYKrM+dRB68F3F93Pa9WkTuU3/LCK0HrWJW49eySKwabyl94=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(186003)(9686003)(71200400001)(38100700002)(122000001)(478600001)(33656002)(66946007)(7696005)(86362001)(2906002)(54906003)(55016002)(316002)(52536014)(66556008)(66476007)(110136005)(53546011)(76116006)(4326008)(6506007)(91956017)(8936002)(64756008)(8676002)(66446008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?QsXpS1P+GFHk1c0UgTxKk6ve9Uq9kT7N0uSV/Ocek2EkmyW+77+SQyl+EYen?=
 =?us-ascii?Q?rfH3cL4dd50Zv/W66L02tQ0WyHmGm/AFUj0Mb38P0gSpSahNBZ9X1vhM1JEU?=
 =?us-ascii?Q?yI61J/HqTbQ5zu2n/jBHh6RmJSgJlU18VYLLrxnCxG1LN6hZmAmRCuJWeDfb?=
 =?us-ascii?Q?RdXGNCaaBrLwkL1pOZxH+hJHiJYcelJywyG/OxZYMfulGPLN4O3hRmSJoxO3?=
 =?us-ascii?Q?mA/zJgdWXkGSfdjKAH6qvdERdf5EwZ8yJ4FYApUwKJ0ZwfHtt8OSmAyToJFl?=
 =?us-ascii?Q?lischksOMorBEe6fkgJRhPlCo7X9ZoImX+mkCQSITHgkxPvW9XKTGJ56msCP?=
 =?us-ascii?Q?yn4WrOcZaOtsc9BxSjfTTHX45wEY3mLrP+0yckaasUBSegHC3rb+4OXWtkb9?=
 =?us-ascii?Q?M0zvB6+YybpTiBskpQzc3oXBhlOj6xjO+KKx9J7FCRKaeKaMXPbDfLW1JDKl?=
 =?us-ascii?Q?ZUDYGkjDIjL/OwwC2Nv8JnqBgqNq6uUY4e2anZGR/0tj7XpLFsEWMaxFA+5P?=
 =?us-ascii?Q?AAbqO+MUQ6cPzTljLyztlmRz38VQ/GMLqPqHthJoCQs6qDHvkqmTZhBHfugJ?=
 =?us-ascii?Q?nX7kelY+3zX1iraufqph6RnBegeTr019Zb8oXGTQjQ4MZbDoFFEHtJkuYvnP?=
 =?us-ascii?Q?m0XcVvVngBvDKrzJ/A3tj0oDoqVPHkmRTj1/laq+mG7nRdB5fZZ2GYLjjF9G?=
 =?us-ascii?Q?zbUopAyKgHJffyU5B06RCfR4am+IUJ9kVx8Zyp4TYkJXdKhGNwj6gsnuKCzc?=
 =?us-ascii?Q?3Bp1WgYzDgIh8ZgQ3F9caXHbtpedOiJFcMQzfdPClaMGTV2P+cK2sWIOtTfz?=
 =?us-ascii?Q?pGfwx3ieHWcmc/V73UlfiVFN1AuKAoDh3TAVxYKX6rDa5hxKdR/U4PI4BO6W?=
 =?us-ascii?Q?h9NaHULtZo+4Fh9j1w5gITYgAdKhCijktTSj+aad7JlevW5KTklVTQfisj/O?=
 =?us-ascii?Q?zUyF2J+3MvBuTIWuuqQM836dlsqNbktk0Dd7t+iXkbS/WkOgHfDi2Z/M2Wx9?=
 =?us-ascii?Q?8MZbZZOVydqJZ78p0pzoBz69UwK6djRFOHn8xSqre93+5wZ7k3JIwYAruySd?=
 =?us-ascii?Q?OSdIOIGMmL2k3BrsLhvX3BKJ7uGgbLCPy5lGxQO6AWxDH8gfqPtI8jf29Vfq?=
 =?us-ascii?Q?iHRt16ePUcEioCUs5VZy60iuGjcH9+ILAnh2PILjRqzcwqJvm5FuPOw8wGw0?=
 =?us-ascii?Q?MdkcEjRCvTjT7fo7YMFqHGYM+9SlZpEIdLg12k+npI+guAkYxzcyET6GPfzL?=
 =?us-ascii?Q?EpeUJGMOKXvkbr8xLT/bEbv+QDQBTYO/oYiyOVy69twTzd9yD4wKDhDxrbo5?=
 =?us-ascii?Q?qPruePBRYrWQBpaY4Wi4+No5kepcGq1bhbs4kn4zScSqauO8FE1L/oCH85mc?=
 =?us-ascii?Q?B0f2iSq1nS4NkIlP/DMdXx5ZyR6c5kGw4H+WGBL/evxQrM4QWw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8512ce1-44b9-40f1-1346-08d9006e462b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 00:26:27.0986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHT04CDAsT9wWBAHUclBG/pknEDwrZVeAiKM6kHo7Zhp0bLs7fgadX7CehUOqhufCGp+fsNnz0gD6EjhdRA5mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_172704_437120_737BD2B0 
X-CRM114-Status: GOOD (  19.42  )
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

On 2021/04/16 9:22, Al Viro wrote:
> On Thu, Apr 15, 2021 at 07:56:05AM +0200, Christoph Hellwig wrote:
>> binfmt_flat tends to go through Greg's uclinux tree, adding him and
>> the list.
> 
> 	FWIW, my involvement with binfmt_flat had been pretty much nil -
> the least trivial had been "binfmt_flat: flat_{get,put}_addr_from_rp()
> should be able to fail" about 4 years ago and that fell out of hunting
> for places where __get_user() had been used without checking error values.
> 
> 	It's in fs/*, but I've no way to test it and I have pretty much
> zero familiarity with the guts of that one, so I can't give any useful
> feedback on that series.  So consider the Christoph's comment seconded -
> you want it reviewed by gerg et.al., and it probably ought to go via
> gerg/uclinux.git tree.
> 
> 	I'm reasonably familiar with binfmt_{elf,misc,script}; anything
> else gets touched as part of larger series and only with sanity checks
> from other folks, if the changes are not entirely trivial.

Al,

Thanks for the clarification. Would it make sense to have an entry in
MAINTAINERS file pointing to Greg and the uclinux tree for binfmt_flat.c ?
Greg ?


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
