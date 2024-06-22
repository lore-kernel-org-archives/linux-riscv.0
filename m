Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3ABC27C4F
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 00:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeRq9/xsqvq3vbdS2zrB2fhCBskZ/db63rFGQXg3E70=; b=Q4gu525nbefIIg
	cMv+jH2wiCqRQ08S50N4UYCQ3wKrKt+ayEzmc8hAKhBQiRoQAN3hEaVV5SYSzz9GXmuRh0YZvd68t
	VWzxdupjzp1MAXQIpz986mb12dc3LloT1fiA75vNeSh9XWogH1uv2aM5Ajpx1kooVQ78nzlbfKD5B
	cujQ+uw0tZWGx8afqpXhfzeHsNHkYOkm6gvDcTh4baauIRv9Ym3mM+z9Dn5IzCefY0RyO4qPFmvj/
	F6jisn2imy0ob1RxjzrJu+zA3nz39fym7LtFBrFOx7uFHqdHw1g4fT1G1ciqYBJ5+j+6GnfE0pPi1
	reUAo1TqJoV7S/lPwWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKoGP-0000000Axad-1n5O;
	Sat, 22 Jun 2024 00:05:53 +0000
Received: from mail-mw2nam10olkn2080a.outbound.protection.outlook.com ([2a01:111:f403:2c12::80a] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKoGN-0000000AxZm-0pEY
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jun 2024 00:05:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ldz1ebcgRQcKOFyUW204yqGXEmlCWLYps4E7rkJ7mfTXPT2MuYB6rMwlgX3VkB6HELEri31Y9PYV6ph7YGqKrBIeqJ+V8lVxANYAh8NuzL2RC7RhFSejzqRHjjZsrMOEm8jYjRp6UHAgwIm+7qZNS8m7u3m7CRGTI9DEmf2ZgIkTcN3kdV7O/tWU3Wg5aakVdfpbEPVCickSnDMTKX3XyDOjlH0rjhpBsP6g2VvaTH1P7piA8AS9N5uSyr2XSMdM+MTXj9oGFu7kTdP4AgN0wL5QubbZPozy3H+aholnva2+9R8ljcls5X5GmjuA0NKW9AagSslwhmHouxMq0iGJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wsAhskoIskrgJHAWUSq/8gtjkfAAVEOC7NsvfTsU3w=;
 b=Zr1UQODyTgzqkmhGh5u64uYq2nd3ZOqH0A5yWIlCaK8/ZMwhSrnbTq/c8Uel2QcwdQpPn28p0WG8K6M1LaJZbzzA7gq91I6xNuGAOVPFVioG7I2BWUOvuT9E6uz+ZQ1T5x3DWhzgagxmbX8qMPsHqsqIEk1QfyRi/GEimhWfGma1dpaN8kmiC3YnPsUjTypRMfzXPrLW9TzmzUj/7xD38pUW4S2BnGeEPwrM3qInDDI+piVm5woo5rx6a4rpTFD4FcBTeC3+G2LfxqOp6/JSkSeJZsIjkE0FLsMLZ0Fw7xX67FLyhxFDxY4vKuZ/iSKHsQJ/SnWdH8ZpOseW83nLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wsAhskoIskrgJHAWUSq/8gtjkfAAVEOC7NsvfTsU3w=;
 b=cvg8GTYy8cvolEz9JuerMjZOLAL8iBJ7oF0LhlZFaPeR9CZ9iwtUp/qXR97Y2Tsl/betWY9Rjp7XwQMLR/S9ASy+Qfzl0+UlOTXm0wReg9bHD2mY0OAqb4WEjyyRgQO4VoI60IJDBPHZm3OUCEfm//1MqjZWmtIUuAuDuDCrR0EySQ8srJmc1z6dJOEBVx3fKU/gbOe3z9mx1f9dp+66XmqMMcNe0L8ES+9XOHwhvtlEjX1r3qXbWvSNv9wrh5WhYVuAn2TGmWneDJsRh3mVySykqT8BA5a85ha5C38RkURaUCHkorVLLGI5PI3vVr/v+9xLM4TXfvnB04e4cpTTtA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5667.namprd20.prod.outlook.com (2603:10b6:930:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Sat, 22 Jun
 2024 00:05:37 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7698.017; Sat, 22 Jun 2024
 00:05:37 +0000
Date: Sat, 22 Jun 2024 08:05:17 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Guenter Roeck <linux@roeck-us.net>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/2] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
Message-ID: <IA1PR20MB49531390EF0D8A9EE5C53F24BBCA2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <PH7PR20MB49622B0A6E9169B04211C7AFBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <df0f11cb-3b44-4869-bfd6-6e5d01e6debd@roeck-us.net>
 <IA1PR20MB495341CA5F2148902B198EA2BBC92@IA1PR20MB4953.namprd20.prod.outlook.com>
 <52d97ca1-b9a3-4a50-8a74-6d56984791c8@roeck-us.net>
Content-Disposition: inline
In-Reply-To: <52d97ca1-b9a3-4a50-8a74-6d56984791c8@roeck-us.net>
X-TMN: [KEqNXVwmO2XzhOSKdlosibsVfOBVpJVh2CZYGDM025U=]
X-ClientProxiedBy: TYBP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <t25lrekbdmfmyyymlx3leiymwv5obn6we3dw3sblk2yoo36kpm@wzifhyjxbn6g>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5667:EE_
X-MS-Office365-Filtering-Correlation-Id: 822b6a07-4b96-44c6-3b07-08dc924f0b2c
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|3412199022|440099025|1710799023;
X-Microsoft-Antispam-Message-Info: J/j16gRHg7+4TR85czbqaNgYUy9M2JGHmK3xoUaMyGfQjChoLKCZdgi4s0IzV9ykdkaa3zcR5lPodYDOMEd3ZQnppnhUTVXdUDKTnV5pMa2973ooUZXeE6Ec9pHw0sl9dFodk0eUAVifMCAQWuq3QkwspmUPP8T1PwUqp2LtFmjKJ9doGJtLcidAUQWP3DcUHxDF2PvP6zQdvtcpiodaXntcznNzXjyWS+2aPawhN/uJQXIN1O1/+jHa9CwGkdvtTOTh2UUBMKmu5ZWz/Y+EA/cd6z/T3++WnDuyikD62e9EndUatS8GaE+3tQkd3TiIGVLv2UJn47FZNwT6tdFZYZ72lnLydRsoOvJMqmooSHGlvfZkFQ6z+PpG7XDNwWnm8i6GcfpWghl9j2eNFp6jxhwcIchdOTioafBISfS4NQZU9HZlwleiYCy0HaH9oo1K7494DcojOZEfoxdq4TtPzVnTXxKpLSJVVaJ1eF6P0wTe16K3lFDLiH9nnBB/vMPqVyPl8FEO+4OHVgGj5rfSBjBgnLoIVbOyUpLe6apvOJONFYunou6fFflIh4RMDJgdl9LcLqPustyIfOa5nx88Mw04f/vqV8eulfsKrAnoyQ6xx4OG9sCys09nAYvaT6ZL
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9LVmWybRsQP8KXpvhHoRTCPOc3LGwSE7Z9BSIrYRAiYjuH1G5MkF2DccbZqw?=
 =?us-ascii?Q?yULMCi8Z/MIkEhr72LBkp4Yc4/b8eWnWo3kTgEErfl71vZhNH5BmAcfbF2oM?=
 =?us-ascii?Q?1BQNXpD23aFNcpokGTCOiZZ4NXjSiorqKO8u3XkJzGTDU0Fzm4qNUwFg/rSK?=
 =?us-ascii?Q?ErkLPuFi86lTq0azF40DN75yzxHbUp/7RwNtA3GYci1WiF6ccOT6TLW41SX1?=
 =?us-ascii?Q?wKLUeedlWYKlz1ECJjtG2sx2GALESiGWIhhku00BVIyWYDpOk95eqhBTWp7I?=
 =?us-ascii?Q?fqQKsc3U9hrB2DzUDw7mb17xdX0LxvFWR64nnJ1p79kAKB003uTCeVVudixX?=
 =?us-ascii?Q?5na5X5C4uZJ3wXvcl5vfnNjPPpI3KHsg2Mwgc8Ceij+DIgDuT8CNenvT9z8t?=
 =?us-ascii?Q?6Syz0xCRFwPYI9ybz4vT0IN+DTfNASgVCoueVujllw3iT3uwBfCKhBcmPO2Q?=
 =?us-ascii?Q?4R3/xudKAPLrbix2h1Jha8tU/BVAj1rqiReHbVZ9dDt3P+O1S0/eWHf0a0fe?=
 =?us-ascii?Q?p275y3NoebWGhTtznK/jfMCV0F1jIbMDf6tSLtcTcx3OTL9m/+n6UUS+8P+7?=
 =?us-ascii?Q?7myxWjQFtX3tdx/kpinyE1JWmVV7pCcbW+B2rTA3rXeq78Vtcik//vWaLJM1?=
 =?us-ascii?Q?mk+q1JVx9ZD5ZxUa1McZkTfNUGF4oEz4ZP7YjJOs2CPd5kNrY7VPvgH7gDMl?=
 =?us-ascii?Q?SZc3EIOIGPpORItNTPJm3lf5rZbP+CY7XKbJd8bNu6VsA0C4Kuiufwtwtsvq?=
 =?us-ascii?Q?3pySFYnXvH/8NEgeQVACE/pfZvQulHvIPfgGxo066sDGeN6GrFbcNXEmUthz?=
 =?us-ascii?Q?RTeIvoui5A5KUxtPawWRqWvhicOhkdH7G8n6g/mjtDNXoXiDOxqVKP7RJ8CD?=
 =?us-ascii?Q?LCx2UqmmESsBAAHYnxMg+dGNNmDzkp6Re2NPGTAI3uLrfMYKs68Z3mP4Oz34?=
 =?us-ascii?Q?njNfW32XFlth4Mtmityrds1LtyldOCpbh72b0EskMLNGl2qFqPd+mN3drYyU?=
 =?us-ascii?Q?OtGUCW2qRGVcs7s+8V4q9ofH13DP56/6u84Hd63o6fpIPDlxouyPHKUfqvb7?=
 =?us-ascii?Q?Gy0duMKbzSyaeyl64b7zg3X1vWOeu95bY8JlVSfa8ENZlPFXC2FIT473igaB?=
 =?us-ascii?Q?D3M+IWpSUbiYCycFK++A06EFhQwLIyWqnlw4IpVGzlC0wbFPAf0cgnDoe73A?=
 =?us-ascii?Q?zI50iBDIkCNjRTEmLNwIXYz/OQmzv5eUPpCAf/Kv7vICsAbzzajYIDlBoav9?=
 =?us-ascii?Q?aYNAlr3lDG8/PNvcwu82?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822b6a07-4b96-44c6-3b07-08dc924f0b2c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 00:05:37.0914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_170551_279105_CC912B65 
X-CRM114-Status: GOOD (  25.10  )
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

On Fri, Jun 21, 2024 at 04:05:46PM GMT, Guenter Roeck wrote:
> On 6/21/24 15:45, Inochi Amaoto wrote:
> > On Fri, Jun 21, 2024 at 08:19:10AM GMT, Guenter Roeck wrote:
> > > On Sun, May 05, 2024 at 09:18:53AM +0800, Inochi Amaoto wrote:
> > > > SG2042 use an external MCU to provide basic hardware information
> > > > and thermal sensors.
> > > > 
> > > > Add driver support for the onboard MCU of SG2042.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > > ---
> > > >   drivers/hwmon/Kconfig            |  11 +
> > > >   drivers/hwmon/Makefile           |   1 +
> > > >   drivers/hwmon/sg2042-hwmon-mcu.c | 531 +++++++++++++++++++++++++++++++
> > > 
> > > Documentation missing.
> > > 
> > > > +config SENSORS_SG2042_HWMON_MCU
> > > 
> > > "SENSORS" and "HWMON" is redundant. Yes, I know, others do it
> > > as well, but that doesn't make it less redundant.
> > > 
> > 
> > OK, I will short it.
> > 
> > > > +static DEVICE_ATTR_RO(board_type);
> > > > +static DEVICE_ATTR_RO(firmware_version);
> > > > +static DEVICE_ATTR_RO(pcb_version);
> > > > +static DEVICE_ATTR_RO(reset_count);
> > > > +static DEVICE_ATTR_RO(uptime);
> > > > +static DEVICE_ATTR_RO(reset_reason);
> > > > +static DEVICE_ATTR_RO(mcu_type);
> > > > +static DEVICE_ATTR_RW(critical_action);
> > > 
> > > None of the above are hardware monitoring attributes. They are not
> > > acceptable as sysfs attributes. Some of them might be acceptable
> > > as debugfs attributes.
> > > 
> > 
> > It are reasonable, I will move the hardware info to debugfs.
> > 
> > > > +static DEVICE_ATTR_RW(repower_temp);
> > > > +
> > > 
> > > For this one, I don't know what it is. If it is a temperature
> > > limit, it should be implemented as one (for example as _emergency
> > > limit).
> > > 
> > > Guenter
> > 
> > "repower_temp" is the highest temperature for SG2042 to perform
> > repower operation. It is not the emergency limit, but a recovery
> > limit when the emergency limit is reached.
> > 
> > For example, when emergency temperature is set to 95 and repower
> > temperature is set to 80. The board is off-power when it reachs
> > 95 degree, and it will power on when the temperature is lower
> > than 80 degree.
> > 
> 
> That would then be the matching _hyst temperature. There is no need
> to invent a non-standard attribute for it.
> 
> Guenter
> 

Thanks for the reminder. I will move to the standard attribute.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
