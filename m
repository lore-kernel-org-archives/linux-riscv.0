Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED5FC4345F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVsB7f0VoXhpWxBlNDeaT+LAXT64f72w7hK0wuEDG1Y=; b=StJ4jcIdVgot1C
	sS5+7xLwZHXSZGBaIFWGXvHchl2XgXM3BVVWCTsHK5pKf2qQU9g3FGHQFJbURma04LWyDusAj21OS
	8UfN0SNZuvJs8junE0wevfy50QDHN6XbDQY9EYYbB2XZY/FvwXiDgEvPmQUYsWQnwID4srkf2pMVW
	3AH3qsLfzqorFFVxL8Dojxp4Z7/PkgTan9DzkCOJ+xjXFPTQXTiJdLsPwze+4JG7zHu8UdVZ5Dtm3
	lzyOnJng+rCxn0io4MTbkzY+KzdVGgnLgNH0djnqu9PuOdU5C9B3ximr/T9O65uTJPzjm/1FD+fko
	C0gWysm21z6BO/NXIwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3o8Z-00000005oO2-2mbS;
	Mon, 06 May 2024 02:31:31 +0000
Received: from mail-bjschn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3o8X-00000005oLq-0zng
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 02:31:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtWgjprOwZAFY5yaAdU7Mjtbl5qrHp8tW/Qr24Yefdo2K6+1RvwUZFiTVdJvysZ4lvwD83fFeT3soisknvrq86vo3E/hhVwtcIdEXohWZc5HB0a16wnShRb86SQWBGBa+PTEMqM0edLQ3JvBKzwO0skmQMoH4ivDo8mtxuwI7SVeSxB/o7K5M68dAdIM5gZ1f5vy1N3TjaT0xOAxrtLi+Cm0G9eh9cbd+w4yVextJ870RlHPhZ2+uXbcPNKQNg2RQ/z4Jz02GUl2iN+Wy1r+J4XP2fYl+bCuOAZGFhCpPlyCLCj7VLnZ4ZYfx8+zxTMbAOeU3XkqRG5va2vOq/pV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHKu9ME0dAUnnyP8jkLjBfSJi6FMr2EDfFnzykWSen0=;
 b=R1YgF7Mg/bYDsO1D23++Gtqi7Kb+I1V+cwU5Gy3PHGxIsvKTulS0uQphZM9WRL24xfXMudxiN291qe1Bpf1DweE8TYiyUHSvzLFQmMQBjKLHCMue/J4i0h+vE7XXbGd5X3FJ1lj8BUoYY9P8jJJO49JQ+oIoDb6eL+NK22Ymf2uxkV5isSmiSZEUN6bKyaTVq0ra6o7ohvmOouVV3ploYCqAaBR8X19/E3b0Rj/hae2F8/pW2dO/hZ+29y9cAMrrfSalcOgEZmPskLf/pJf9Lsybik8RPU0Cqnvd2HJf5k2q7Q/RmLPjPODM5CNr2VjcQalXz+ZEESaFqwd3F1/VKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1211.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 6 May
 2024 02:31:15 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45%5]) with mapi id 15.20.7472.044; Mon, 6 May 2024
 02:31:15 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt
	<palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
Thread-Topic: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
Thread-Index: AQHahY1xSncvYch2v0Wp+YvYWpBQy7GCuL4AgAAElICABvC90A==
Date: Mon, 6 May 2024 02:31:15 +0000
Message-ID: <ZQ2PR01MB13078E6EBA4D625735B45843E61CA@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20240403060902.42834-1-hal.feng@starfivetech.com>
 <mhng-3c2a418c-ce79-4287-a890-208a5d026e70@palmer-ri-x1c9a>
 <CAJM55Z810=pxc+tmgw0yS+Nx=K9h=OGFxOhvtJT7nyGGg0d_nA@mail.gmail.com>
In-Reply-To: <CAJM55Z810=pxc+tmgw0yS+Nx=K9h=OGFxOhvtJT7nyGGg0d_nA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1211:EE_
x-ms-office365-filtering-correlation-id: ecd5aaeb-fe4f-42e2-2172-08dc6d749a8e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XA8q6qKmCHlNWR2aFSsW8+vcAbBpWgVGkH/RLFyxsHGyvzQZbAG069X6aXRHc3tKLkYRkP2akK8ZxBv4+JOGoOAvHw7Q7IMhkl/JHcZfv/LwIfP3ePYHx/FmHkTtEsu1dwTK37h23OUlAoWBlcHgdpFlcN//w0iXP3CGwAuPaWlp+amQ1BBHGH/gia+CJQE5uZL/ryUjb7sYIIniXSeC6WEr2aIQ8FQgB+KmN4Br1L/h6QLdLyky11whXci+dAssOf8AXhr2NhvvKxMH/6e1UL5J/DkZZU2ehPX2McIVkUaGarX8eAio8xAz4+OTSb5HLnnvmvCpLNnBtHl0WduheGNhdGA3gOHnX8Q4t3JzXDThNmqe6sKufYNuHEmJftEAiVUTyFl0JNUVFYZXmb0/2GHkMwr35n5e1AOvGXelY/rT8Yt3duUQ1Ou2JI6oxda4X6MtVeSzj6gqR4NHE53m6UJHZCHY1BSOi8ebEKdRUwquTjV+Q0t3Nzk15PEM3O3kMRmV+X2MC08ZNQ3dWrdu4aAg6xGOCtqXQ7bGIuc7ZP2cP/pJcyAlNW6FWOjlN1lmE5vIybmwILwjX5BrU6lHc6bXTtYhHHL6Y/zCI5DHuUxpOz5MIvUTeoSQrYA5JxV3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWxwY21VQWdSanM4SlFpRlQ5NE5weHc4NHp0VGhMTTk1WUJtVHN2a05FKzI3?=
 =?utf-8?B?eGJickZCS2hlamcvTnQrRXg0eWNGS1h3Zm5TV0MxWjFSOVRyREJra2UrV08z?=
 =?utf-8?B?YjFINEliT1hlWFJyUGs3NzhmY01vZjlnYVExUHJZVFlKZTFYL1BkUDFZTkdC?=
 =?utf-8?B?Z2dicnZsalNhK0ExeVZaVXRqczEyeXQ3VmRxSW10SVVZU0RDY2l3ekRheWFq?=
 =?utf-8?B?UFFQK0U4dlRwODFGQ2hPQUxzaUhMVXU4amFhR1ZSc3JBSVZmZ3pMaFRqbHlt?=
 =?utf-8?B?b3R2NURpdFFCNjVoZ1Bhc3lNZk1kMHhab0N3Q1daMmRsWWhkUXdoVnI0THRy?=
 =?utf-8?B?VGlKeGgxUFNpemc0c01ZcGd6WnF4aitGK1RITUxWWkRxM3diY2ltbkw0aW4z?=
 =?utf-8?B?YXBaZ0gwbW1aU280bXV5SGhvbWFtWTZjYW5UbFhCbUJFRDhwY2wxUThPQzlR?=
 =?utf-8?B?K0w5d25DN0NYa2doM0VSWUtET285MEtNMWdoNDlQWFZxSEVoZ3FyYnZQVXhk?=
 =?utf-8?B?aUgwc0x1L21aZks0RnpPdmp4ZFhrRXE2cUVTZjFjdEVrYzIrc3h3WVJEa2xG?=
 =?utf-8?B?NlhHL2N0WGF4NVloWkg0clh6K3BxSXBIdGhrQXdNZmVPS0lyS0xLRjRQVkxq?=
 =?utf-8?B?c3NFTmFSOWl4TnJzcEE3QXI4VFFhRXhCd0lJTU43SW40dktHTldudlU2dzBy?=
 =?utf-8?B?eWFudnBjcy9vOU1XZjZWYThucVpOMXJuZTJSVjhOM2pOQkovdm85QVJlKzZl?=
 =?utf-8?B?OHJPVERvNXR6d2wrYkd4bmh3dENmZUg1Ynh4WVV0TDRsc1NkUHQ2aFlWWDF5?=
 =?utf-8?B?cy9taWovVzJVaWVKK3V2QnV1NU9BRWhXdTkrVnFCLy9jYVNVMGM5Umt4UU5Q?=
 =?utf-8?B?OE5qZE9QMERZNjRVbVRQbmxKOWNaaHdCNzRpZC9wa1psWFYwdE1IOXVHYW84?=
 =?utf-8?B?NkdMZUNwYndScGU2Z0N2b2lxU09HK3cwejdaWUhZeFpwSTFTNUE3ZmYweUl1?=
 =?utf-8?B?a2YyOXY1YmJqTk0reGFMR1RrdWRHY0YxVzY0bkQ1ZzRhM0xVWmNud0hzRFlW?=
 =?utf-8?B?akoyR3d5dE1ENzBsZTdzSy9KU2RSZ3FOQ0Q5NFBOdWhScjdibzVQNXY5SlR2?=
 =?utf-8?B?MUZzYXplaVNrZUxkUmFmRU8zc3dMZ1V2di9FOWlPYmZiTk5BVndTOHRDTHl6?=
 =?utf-8?B?alM5Y0hQaHZMaS9xNHBHUlczWWhQVHlYeU0xMkJkNlF5emxsMExuaTE1ckxv?=
 =?utf-8?B?NmpZRG8yNi9rQXpqWis1M2RVMUl2VzZCeTJoczM3RzdFbThhRTF5YWdyUGdq?=
 =?utf-8?B?WjB3NjZxM3J5akFFUDcyWDJKZDBQdjZjRDliZXNDLy9xdHRpMTRmUTYxN1I1?=
 =?utf-8?B?aEZYTlhsdlFWL3djck1BY2Jha2dSZUtiVGVZak9tc29NSHdsa3lvUGFiT1pY?=
 =?utf-8?B?OTZMTHpSVjd3YXYyckI1alc3dDhNbDd1bUpUMlBtUkFqT1lJRU1vSDd3b0lW?=
 =?utf-8?B?T1JVV2pLL3RvWVBNSmI5ZTB3elpBcUhweGZ6TUJSZTRLT3FhbnNrQWZWL0NS?=
 =?utf-8?B?R215VjJSTmRtZVFKMXJ3cVVRNlBxTGZEakNIa1c4K2NIcFVDKzdsNmRDOXpI?=
 =?utf-8?B?dm0vQ2t5T0E1TzErSkNKQk1xcC9kalZON2VKRktaN0FxZSs3aTNkWDlTdVRN?=
 =?utf-8?B?Z1lMNis2U1RBT2UvZjZCcVhHTElqeXluaC85ZDNkR0ozZnVtQ1liWFVHR2pN?=
 =?utf-8?B?ZmVBMjF1VlVCTnk3d3Q1SlBUNkYyTVFiVjdYVDFsdUc0TEhOV0NnYTBIZmhu?=
 =?utf-8?B?cTBMTG5INFVVWVVVSG01TlBtcEtEcEt0d1pPY01qYkIvYlEzNGVjR3dMRjVv?=
 =?utf-8?B?WHplZVd3MmN5WC81cVp6c1MwdjBOZURpMnhKckZrSWx3ZkxlMDloOWEzVkxh?=
 =?utf-8?B?d3BRTER6K3IxeDUrbTM3Vkc3cTA1RUM5V3c2VURVbVRLbFJ1NUthK0JsdW9V?=
 =?utf-8?B?clF6QjdVT0I2ZmJGMElLOXNJN25pZWk3b1JSdnBUdGFGL094OUcrVUdmMXBJ?=
 =?utf-8?B?Znc0azAwK3IydFhGMGE2TTZVTmluNGlkTWhhOHNiT2dkU0FsZS9vYjExOHBz?=
 =?utf-8?Q?x5vBJFTm5VfKsZ48UKP2s3yFk?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd5aaeb-fe4f-42e2-2172-08dc6d749a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 02:31:15.6115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZCAqPB/7fxE+bvY2iRRb+7YLkrVn1qfeflPrcQLSOsJARwVkA3C2KN9PPLTU/hSiJI6Y30KeUo+CejwUUqS+iK0faR+B2sx52xVOzO9RJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_193129_307382_CEB75439 
X-CRM114-Status: GOOD (  19.67  )
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

> On 02.05.24 00:26, Emil Renner Berthing wrote:
> Palmer Dabbelt wrote:
> > On Tue, 02 Apr 2024 23:09:02 PDT (-0700), hal.feng@starfivetech.com wrote:
> > > Add support for StarFive JH7110 SoC and VisionFive 2 board.
> > > - Clock & reset
> > > - Cache
> > > - Temperature sensor
> > > - PMIC (AXP15060)
> > > - Restart GPIO
> > > - RNG
> > > - I2C
> > > - SPI
> > > - Quad SPI
> > > - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> > > - Audio (I2S / TDM / PWM-DAC)
> > > - Camera Subsystem & MIPI-CSI2 RX & D-PHY RX
> > >
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---
> > >
> > > Hi,
> > >
> > > As more drivers of StarFive JH7110 VisionFive 2 board are upstream,
> > > add support for them in riscv defconfig.
> > >
> > > Best regards,
> > > Hal
> > >
> > > ---
> > >  arch/riscv/configs/defconfig | 32 ++++++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/arch/riscv/configs/defconfig
> > > b/arch/riscv/configs/defconfig index fc0ec2ee13bc..a4eb66b30d95
> > > 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -111,6 +111,7 @@ CONFIG_PCIE_XILINX=y  CONFIG_PCIE_FU740=y
> > > CONFIG_DEVTMPFS=y  CONFIG_DEVTMPFS_MOUNT=y
> > > +CONFIG_SIFIVE_CCACHE=y
> > >  CONFIG_MTD=y
> > >  CONFIG_MTD_BLOCK=y
> > >  CONFIG_MTD_CFI=y
> > > @@ -154,24 +155,36 @@ CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> > >  CONFIG_VIRTIO_CONSOLE=y
> > >  CONFIG_HW_RANDOM=y
> > >  CONFIG_HW_RANDOM_VIRTIO=y
> > > +CONFIG_HW_RANDOM_JH7110=m
> > > +CONFIG_I2C=y
> > >  CONFIG_I2C_CHARDEV=m
> > > +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> > >  CONFIG_I2C_MV64XXX=m
> > >  CONFIG_I2C_RIIC=y
> > >  CONFIG_SPI=y
> > > +CONFIG_SPI_CADENCE_QUADSPI=m
> > > +CONFIG_SPI_PL022=m
> > >  CONFIG_SPI_RSPI=m
> > >  CONFIG_SPI_SIFIVE=y
> > >  CONFIG_SPI_SUN6I=y
> > >  # CONFIG_PTP_1588_CLOCK is not set
> > >  CONFIG_GPIO_SIFIVE=y
> > > +CONFIG_POWER_RESET_GPIO_RESTART=y
> > > +CONFIG_SENSORS_SFCTEMP=y
> 
> If this needs an update anyway this temperature sensor shouldn't be critical to
> boot and can be left as a module.

OK, I will modify accordingly in the next version. Thanks.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
