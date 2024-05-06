Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B228EC4345F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 02:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/Zn8ab+wBcqv+Ycm2RUobaL2k43K8LeKhLb2LrRUz0=; b=JDkjhxS0eOVHHN
	/hiGR1HGYHCEQSH4wg70R6lXVlQTLmX4++qxIe6woAUVOUceg31sIw36drBaRMQfPZaSgyEJYnNFp
	RUe3JZHfK/BTIi8fUqR8u4RNgJuYjIMPYj907+vb6bdgUJTYrRFYEAOvtVVgbByxdGLgZCLsFMBR/
	/fAOdWeQV7iaM8ubriL1xEMekdj3TAhIHmWWyproC8VL2TRwKFTJQf881/chT802rSEJ9kdCqPW71
	W8MHGqjj4yszOaRhRBr0S1IAQ51iwZCibq0jbvLv44u+iiUP8y3dskazF+mP/etUINWoibZY43YfX
	hyJU5CrMwFikyv4ZKUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3oG0-00000005pAk-0qzL;
	Mon, 06 May 2024 02:39:12 +0000
Received: from mail-bjschn02on20702.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::702] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3oFx-00000005p9l-1FYB
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 02:39:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMg52JLKGFP8JTUEXKckY44/8bPegRF3Q7NFOuNTl9og4aw7IZZx6KJkkhqzXNqHXsqqNyz4oa4FO5E29gshr2bhbi8fQK8OHk8j8LZ1X9+q4T9KRkI7xei0RXMXegA5vgFdm7zhQ/EMXRI3LoKtG1KlWWAZdY8aF4T+JVVhPmwiiozWluvGO7pgi21nZ/wp6y1xyNS/z6u/mLRgBa+eD25RHal27psypShmPkKXCJ0vJfgcGtXVxJeaycMkyNLMPPura3UYiYpuYRXXcwLsXGq64gDtG4QivMHp//YuzsdyjRMdUXJ1GgPBlJcWts0Q29teZuu2PhMnAHvM7DerHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11QoA7wUsc4VpZfD9Amiq/wlT3HaXjnWFOb/FtM/BIk=;
 b=CksQMKDgJ8Z0IWJX3ocp37r2HXfv6ct8WuRK59i99B8Z2ICvFedkgivWt6eJPCq8PuVrafzaBFzf+xutqVtzLhxxA4TNEYgp0TxQs0kXnBcc5knwTEy37FHB4UzKiMQk+kjdsjUZIbu+pD+YTMOJ10DmKrjtEue5bkwitmq2p9ID1f57dMSlSHYF4JnxHHSll44IoYZ9EPIAxJ3J03IWu1lMPWEENS0IeHkqy9IWTBBLV5IeMMPfWOueVIpZbYk7OglDPLjKgnJ5aEZxS6rlQ4yoW1OnEIVqKygZrDCyjnIlGPCag9N6Qhr79hcHy1D8VSn3w6hsE6mVFjKRuszq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1164.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 6 May
 2024 02:23:26 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45%5]) with mapi id 15.20.7472.044; Mon, 6 May 2024
 02:23:26 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
Thread-Topic: [PATCH v1] riscv: defconfig: Enable StarFive JH7110 drivers
Thread-Index: AQHahY1xSncvYch2v0Wp+YvYWpBQy7GCuL4AgAbyfPA=
Date: Mon, 6 May 2024 02:23:26 +0000
Message-ID: <ZQ2PR01MB1307BCC6C4AA0B305ABD9416E61CA@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20240403060902.42834-1-hal.feng@starfivetech.com>
 <mhng-3c2a418c-ce79-4287-a890-208a5d026e70@palmer-ri-x1c9a>
In-Reply-To: <mhng-3c2a418c-ce79-4287-a890-208a5d026e70@palmer-ri-x1c9a>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1164:EE_
x-ms-office365-filtering-correlation-id: 09e4d942-568c-4f81-8466-08dc6d7382fe
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XzuU0oqOU6Ei6dB7lbqf6AdGxIwlTkzojP/g2+sQIzRgJwxEXQWuwjd6JKJWgPIc1i1FuD8+NRsb4fN0dZPNAcrB+g+3VZYqv83pB5SNhq7fdR453DCR6yovEdi/C7frHY96XZhYqA87C66NMR5Ba8IgPricXo6SmKLkvcxSphAXA8BMzq1F/PN4LCneaOLQlFvZqeMwKZ/FcLrr+0ZDnWb7RHtEVphKfiVOXY4EGvKRy4c6Pi++vqfhGOy3v6XUBri/ZMgQ9IlksgCDb7Hlxszpmo6aazApGF28mUwgAYFrjb9Dy9MmZPHNf/xmqQsD0aZ312kvVOJiOD2CpJJsWW0ZntONw3LSbthxs0T9qeNPnkjGsR4hVLoZZljTI0bDgb9jTZTSITEz1FaUT9cuyXATL6/HahwKo48OipXReV+w+Q/3ng9Z5phWi7Gl2D46uByKC5au82sXt7MOgddT8WLI0fl9NtFL0LtXxjnQJZTxkGdM2+AHK0MRZjXf4LYyXyG3CRgmj04VLw2gRljtcFtQLvIepAo+8LATQwT+pLCEZGCCQtn2YSVxy4ydD+Tkyn1eIHbomsWWLpwAIBSvRtOCRE5xvmORZu01O+ZX13JlvO6G+y0t6BfJKnq07AWm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(41320700004)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHNHT1lOay9jQUxxUHlCdm50OXl1bFZBSWZJbDJzVnhEQmtHNDlOeEgvWVF5?=
 =?utf-8?B?a05ENzlXVlJSVUNmL3NXSUdFUFo2dmxpOGJCOUswVjBYVFZrb1U3VktWMWFt?=
 =?utf-8?B?L2MyYk5GaTFKR04vOEh0anpZQ0lXNmJvdDNHdndqb1ExNjJrNnpIOUpNeVIr?=
 =?utf-8?B?ZU1sK0VpelgwaTl2VVYrN0dENXpYbUQ5Tk1VZGQvazVQTXVoOUdaNjEzSmxz?=
 =?utf-8?B?T3pCd1pZdk8zZGE4VkM2ekwwS0pyeUN6enBZNTBuSmNNSEc3YmdZdHNQUXZI?=
 =?utf-8?B?M0VxR2dIM0JNbnFaVDJFaTJ0VXYzVkxFRWtZaWtSMnpRVlJFYUpJV2dwQm5y?=
 =?utf-8?B?WGczSzhuMU5DYk0raTVvdXdJL0VzdFRHRGVLTzYwd1Z4MGJ1MUpRWkY0aDJq?=
 =?utf-8?B?N0p6a2VBMmtuZUhhbDJxQjVIYlFmNTBGMXFock1HUE02TkFwQUdJK29ibnVZ?=
 =?utf-8?B?aFdiS0kzeEE3aVNUSHB5UkE0MGNoYnUyRmtWdzBiWFF1N1ZncVJ4cmMwcEI0?=
 =?utf-8?B?UmZ6YkNrcjBjUDloaDNHZTg4dmt3R09DM0M1UWZ2ZGI1cnZESlpXK3hyTndU?=
 =?utf-8?B?a1pLL2Rab01SL3hUOUlzaUt0NS9LejBsNkVWUFZjT2xvdmF6YkZBWFltQXpn?=
 =?utf-8?B?UnpsaUtqRWdGcndRMkJ4MGNmeGZQdk5WdjdXbEhpU2h2MTl0VnRsWko4YzRx?=
 =?utf-8?B?bTliSTEzU1Q2SnNXeXZkbmI1dU5RY3h1alBTU0JwV0grcFZDNWpxMDJvSjlt?=
 =?utf-8?B?RUxXQmF6bXMvRFQ0WUZTczVGRkU3MHhoU3dVR1pGRHZ5K3kreWtVeVk5eWF1?=
 =?utf-8?B?SmRDK2RlTk1oTEJmRjhld3FjR0oyNGlJOVZKTXZjeEd5Zkw3ZDdCZXdBeGtJ?=
 =?utf-8?B?UHU5VHp3VGZZLzA3MExpcmwrRWRmdzllUXNXckE1TVpjTXpuWDhNNmlKekdM?=
 =?utf-8?B?NHRsU2VycGJDSyt6YmlId2RtekZpbG1vTDV6VEJRb3BKSzVENFpyT1YrK3RC?=
 =?utf-8?B?KzMwbjBnb0JObWd3Qm50OSt3T05FQlo2SndIbWhsckZrYXJaM2hGeHZjb3pn?=
 =?utf-8?B?bTBMK2pJQWdHTTkxYnptNTdZeVZOQnhsK1Rtb093NmdKTDNCd2ovdmNldUdL?=
 =?utf-8?B?OU1oY0ttZWpEOTd2S0ZEZE83Y3ZxSXBqR2dKU01UbTFEM2lUNkl4ZkNOOEIy?=
 =?utf-8?B?a1NXYnNsaS85NnpRNWhhSzlWaTlaSWxhd2xLMUhZT3pRUWdEekJtbFozTnlx?=
 =?utf-8?B?aFkvNGtnMFBUdURjbGV2dHhVOTJmOGp6QjhONEo2MDhSano2cGRTU202bUlk?=
 =?utf-8?B?U2lEOXVreVJSdWE2K1MrVlNpaGIyR2wwWnMzRE05bVJuSldwZmtqK25hajg2?=
 =?utf-8?B?ZnNCclhXU3U3OFJOVHRHT0dFN3NrUjVmd2cvN0tjeWdpL0RGdTRhS0FybDZm?=
 =?utf-8?B?NndvYktPdE82MGJWTGxXWXZYendxUWNoTGc1ZGZENHdBNTZrd3l6UnAxTFlW?=
 =?utf-8?B?a2xhRjVhcHQwQ25NU1dWeFVJRWFzYnVDcVQzaU5ITkxlK3ZsNHN6TlNzR2ox?=
 =?utf-8?B?ZDlhMnFDaEZJZTNUYXRSeldGc084TTdqeWhhcS9MMVEzdTNOcER0WlIraWNY?=
 =?utf-8?B?ZkJXSE5DYXI5V3NqMytJWXQzYmg5VHJLL2o5SHdvbzZLRTRvU3Q3WENRdWp3?=
 =?utf-8?B?U2tXVGxPRVRWakJjeDg5VHU1djZTSXF2NlZTOWZzYWJMYlVjM0dXU0h0eEFh?=
 =?utf-8?B?d0V5ZG1mTEprZklYT1Z0Vnd5MWdSSC95Lzljblg3dGYwTXdldUpNeGZXQlZY?=
 =?utf-8?B?RU51azRyOXF5dHNpbmlmVEJ5QVYrK0RQc3k5eWlQTmpRMlE1NDliaEJBOGNo?=
 =?utf-8?B?djB0bDNIdUtWclZRS21jL0tpbmxjQWpuZW1pVVZpODIycDJpb1ZWTytjYk9o?=
 =?utf-8?B?OU5wWUEyOXFRQmFFS1RvTVV6aGRrcWhHeEtaZDdESm9IT3hZN0hYanMwdEk4?=
 =?utf-8?B?eDU5OU5wakVvU1dSYndKME5kVDlmSkg3WkdHMlFhUHE4WktDYXRnWTU0amly?=
 =?utf-8?B?Ynh0U0xqRi8wWmtOZXJqNE9zUHJWRUJ3ZEtmckMzN0xqSi9oOTZ6R3RIRkpK?=
 =?utf-8?Q?k71qcKdHQC/5mCpHjTGYFXCUg?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e4d942-568c-4f81-8466-08dc6d7382fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 02:23:26.5732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5pH0t9Klo1PiO9rPohbgLVkAoPirP0bm4xKcG2PIETFdOc/8UM9yRpghQaaVZ8uZIOnlWeG2d+0fqs1OYlVnI0FiD+PbmPjtQdsoxDJYEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_193909_827365_BA884C92 
X-CRM114-Status: GOOD (  22.08  )
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

> On 02.05.24 00:09, Palmer Dabbelt wrote: 
> On Tue, 02 Apr 2024 23:09:02 PDT (-0700), hal.feng@starfivetech.com wrote:
> > Add support for StarFive JH7110 SoC and VisionFive 2 board.
> > - Clock & reset
> > - Cache
> > - Temperature sensor
> > - PMIC (AXP15060)
> > - Restart GPIO
> > - RNG
> > - I2C
> > - SPI
> > - Quad SPI
> > - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> > - Audio (I2S / TDM / PWM-DAC)
> > - Camera Subsystem & MIPI-CSI2 RX & D-PHY RX
> >
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >
> > Hi,
> >
> > As more drivers of StarFive JH7110 VisionFive 2 board are upstream,
> > add support for them in riscv defconfig.
> >
> > Best regards,
> > Hal
> >
> > ---
> >  arch/riscv/configs/defconfig | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig
> > b/arch/riscv/configs/defconfig index fc0ec2ee13bc..a4eb66b30d95 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -111,6 +111,7 @@ CONFIG_PCIE_XILINX=y  CONFIG_PCIE_FU740=y
> > CONFIG_DEVTMPFS=y  CONFIG_DEVTMPFS_MOUNT=y
> > +CONFIG_SIFIVE_CCACHE=y
> >  CONFIG_MTD=y
> >  CONFIG_MTD_BLOCK=y
> >  CONFIG_MTD_CFI=y
> > @@ -154,24 +155,36 @@ CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> >  CONFIG_VIRTIO_CONSOLE=y
> >  CONFIG_HW_RANDOM=y
> >  CONFIG_HW_RANDOM_VIRTIO=y
> > +CONFIG_HW_RANDOM_JH7110=m
> > +CONFIG_I2C=y
> >  CONFIG_I2C_CHARDEV=m
> > +CONFIG_I2C_DESIGNWARE_PLATFORM=y
> >  CONFIG_I2C_MV64XXX=m
> >  CONFIG_I2C_RIIC=y
> >  CONFIG_SPI=y
> > +CONFIG_SPI_CADENCE_QUADSPI=m
> > +CONFIG_SPI_PL022=m
> >  CONFIG_SPI_RSPI=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> >  CONFIG_GPIO_SIFIVE=y
> > +CONFIG_POWER_RESET_GPIO_RESTART=y
> > +CONFIG_SENSORS_SFCTEMP=y
> >  CONFIG_CPU_THERMAL=y
> >  CONFIG_DEVFREQ_THERMAL=y
> >  CONFIG_RZG2L_THERMAL=y
> >  CONFIG_WATCHDOG=y
> >  CONFIG_SUNXI_WATCHDOG=y
> >  CONFIG_RENESAS_RZG2LWDT=y
> > +CONFIG_MFD_AXP20X_I2C=y
> >  CONFIG_REGULATOR=y
> >  CONFIG_REGULATOR_FIXED_VOLTAGE=y
> > +CONFIG_REGULATOR_AXP20X=y
> >  CONFIG_REGULATOR_GPIO=y
> > +CONFIG_MEDIA_SUPPORT=m
> > +CONFIG_V4L_PLATFORM_DRIVERS=y
> > +CONFIG_VIDEO_CADENCE_CSI2RX=m
> >  CONFIG_DRM=m
> >  CONFIG_DRM_RADEON=m
> >  CONFIG_DRM_NOUVEAU=m
> > @@ -183,6 +196,10 @@ CONFIG_SOUND=y
> >  CONFIG_SND=y
> >  CONFIG_SND_SOC=y
> >  CONFIG_SND_SOC_RZ=m
> > +CONFIG_SND_DESIGNWARE_I2S=m
> > +CONFIG_SND_SOC_STARFIVE=m
> > +CONFIG_SND_SOC_JH7110_PWMDAC=m
> > +CONFIG_SND_SOC_JH7110_TDM=m
> >  CONFIG_SND_SOC_WM8978=m
> >  CONFIG_SND_SIMPLE_CARD=m
> >  CONFIG_USB=y
> > @@ -196,6 +213,11 @@ CONFIG_USB_OHCI_HCD_PLATFORM=y
> > CONFIG_USB_RENESAS_USBHS=m  CONFIG_USB_STORAGE=y
> CONFIG_USB_UAS=y
> > +CONFIG_USB_CDNS_SUPPORT=m
> > +CONFIG_USB_CDNS3=m
> > +CONFIG_USB_CDNS3_GADGET=y
> > +CONFIG_USB_CDNS3_HOST=y
> > +CONFIG_USB_CDNS3_STARFIVE=m
> >  CONFIG_USB_MUSB_HDRC=m
> >  CONFIG_USB_MUSB_SUNXI=m
> >  CONFIG_NOP_USB_XCEIV=m
> > @@ -233,6 +255,13 @@ CONFIG_VIRTIO_BALLOON=y
> CONFIG_VIRTIO_INPUT=y
> > CONFIG_VIRTIO_MMIO=y  CONFIG_RENESAS_OSTM=y
> > +CONFIG_STAGING=y
> > +CONFIG_STAGING_MEDIA=y
> g
> I don't think we want staging on in defconfig.
> 
> > +CONFIG_VIDEO_STARFIVE_CAMSS=m
> 
> Is it just for this?  I think we can just exclude that from defconfig until it gets out
> of staging, we should be able to boot without it.
> According to the TODO userspace isn't there yet, so I think it should be pretty
> safe.

Yeah, CONFIG_STAGING is just for CONFIG_VIDEO_STARFIVE_CAMSS.
I will drop the above three configs in the next version.

Best regards,
Hal

> 
> > +CONFIG_CLK_STARFIVE_JH7110_AON=y
> > +CONFIG_CLK_STARFIVE_JH7110_STG=y
> > +CONFIG_CLK_STARFIVE_JH7110_ISP=y
> > +CONFIG_CLK_STARFIVE_JH7110_VOUT=y
> >  CONFIG_SUN8I_DE2_CCU=m
> >  CONFIG_SUN50I_IOMMU=y
> >  CONFIG_RPMSG_CHAR=y
> > @@ -244,6 +273,9 @@ CONFIG_RZG2L_ADC=m
> > CONFIG_RESET_RZG2L_USBPHY_CTRL=y  CONFIG_PHY_SUN4I_USB=m
> > CONFIG_PHY_RCAR_GEN3_USB2=y
> > +CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> > +CONFIG_PHY_STARFIVE_JH7110_PCIE=m
> > +CONFIG_PHY_STARFIVE_JH7110_USB=m
> >  CONFIG_LIBNVDIMM=y
> >  CONFIG_NVMEM_SUNXI_SID=y
> >  CONFIG_EXT4_FS=y
> >
> > base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
