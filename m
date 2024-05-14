Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD23C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rePgnj7ibvn2CIxKdoPk4NkDXDDKvRfnWEBbTSXxIeI=; b=i4v98DPuICj7/D
	zC3jHU+KvrsTDlW2aYoB5YRuQVbVpWCDKH6PFqvUoWD/AAvjQLJRUi5YOYWf21U5GtiPTDY3EdXea
	0j9z/YICga1MGN5mCkmZ4fzAlfNN/OvxSOpGpTMzMnjHUoll7U0OSReBDK2KJeCiqMoR/xtUQ5thl
	mjhHAVRgfK6RsDRPGDCZ6QOHJuuQ8nOwXxbO34ZAgynySWQS4vi3Jx5rJVFhW7IGMtqmSG9yPE4u0
	qUh+LRzryb6VcDHzjPJuXZt8WYpKUaaSmj9/KwJRU852uqxxuwXfaMvIhuT3yQWCZPVtwXKuMCeiS
	rWi80SiTLIoFiicXeBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6mmL-0000000FGKE-0R9Z;
	Tue, 14 May 2024 07:40:53 +0000
Received: from mail-bjschn02on20706.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::706] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6mmH-0000000FGFk-0OC4
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 07:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7zJ7lQdRjnE4my57vK0e0FDK/F5cV0rkF28+R/OLMiMXpJuyBeqVcauQSFTd6FE+d9RRLy/2/pPlzlaTuQPqAY2qGhGQVziwTPN2ZCShJeSKSPmFNliHdOzVw5vyAnCljs/d12+aeHoVeQiLfIUpvL23k2j80kz4hqLFftCSWtt4dZDS4UOA1q1HEVbXnPGTTMcKx17RICuv/z5BcUawmB95afY669oLHToS1SUXRFa6bOjuUli5h0cfUAigsS+FFnvPoDaqN6nA47DTwiyBO1X1fTcp+McXDhGmhrhyAXZkLdvfjkAuEGYy494dWzvBQ4K6eK+rWTuKFvNF6fj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGT1pq/Lc7fDWRg+v92Tmk0gg/MiNxoA/r4Jwcdambk=;
 b=lcD+iBjxBdRmjELaTjEmRa+YBuE9qy3D/an3avIu/GfM4ZxpRz02rzqYIaypVxQBYdUezwaS9cV3nGtEXoNwJid4ZBt5ZAGSgFur++q4TZPkO+ycQhvUoSTJcWIiDIkfiHrp/VVj61FNjBDnWsuJfVZWXuy+t42k5Nmo6CZKRZHDPC0NPVu9cL496dZPRoao619fsZe3seLbUe/CKwYmk0jPEMc07zE/bJ1ByAmQUIC+QlnMs/8kKm3I8RFCymyPsn2Qs4mOFWvPz+M8VTmC9gh42rR+WVpH94UuODwhnnirgO1IkeawndQe0is2DwPaRNXW6d9A6GHjf/dIeedatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Tue, 14 May
 2024 07:40:18 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Tue, 14 May 2024 07:40:18 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Samuel Holland <samuel.holland@sifive.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] riscv: dts: starfive: visionfive-2: Fix lower rate
 of CPUfreq by setting PLL0 rate to 1.5GHz
Thread-Topic: [PATCH v5 2/2] riscv: dts: starfive: visionfive-2: Fix lower
 rate of CPUfreq by setting PLL0 rate to 1.5GHz
Thread-Index: AQHaoEtDhNqmQ3vYiEeZ0Ra2PPyT0rGSZqkAgAOc2gA=
Date: Tue, 14 May 2024 07:40:18 +0000
Message-ID: <NTZPR01MB0956F91D339E1012A4F5897B9FE32@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240507065319.274976-3-xingyu.wu@starfivetech.com>
 <b970012b-c078-4c8d-995d-e2789afa3e4c@sifive.com>
In-Reply-To: <b970012b-c078-4c8d-995d-e2789afa3e4c@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1003:EE_
x-ms-office365-filtering-correlation-id: 8b47692f-cc6a-49bc-03b6-08dc73e91a60
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x1TgGa0wAhzTmFdg/Shmgb2la/NLK8LkyCXJF4wVeht7iiMBlfRUGq08D6g3tOmPbXoTyEFGw2HBCJyKZFXaMLADxy8fX6StT+o9bWSgg/kG+6DYf+hET09k+PtddeKXx7iEHOn4tKsvZBTfuH97muCRwb3QKz7K+NF8fsc7M49+uRYcLChd1cRUsoMiA2CrkUS7Mal0zViqi88EbZyy5inOPZ+O7DAq0txgFygl7k+n6rnj6jKgZHaLKEL22Pvss8sDlc+3zBHnBWvt7mrrr7VY2u/PRTlsfeCnmdQYqExvpXzKdN+srNViRcbnWgI5s6fuZfsAUCAwW2DdpqOkrFTSlT65io/2re0pc33QeeEkjpg4I4b/UghNhyVRADrvc8ZVnEyyYrUJNHVjMVFvG0MFKeYMU+OI2dnryRZ4HVOPgeWXJqUbDJDPuqbNrckGGuE3P+/jN4fbDSdGy+OKtfwrE52dla75iapFZYUVyonlneFZ5KyyfK3N2jQKSppTu8AqJ62QqLpE03PCnU9U6CcGA4h3yIlZ4qxB6pc+vxUSPIxNELwhxI6UaHKIl/RYa8knsvhcpTUBQYJkwiYWSOAQ2V2V+9sZcCP6vB7GDpEBHpNS1XHhE6CL6WBeuty5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGtDUTFQVzJTcEsyN1RaV2QxaE9nOGJnMnR2bjVxVUphYlNDNUJPanU4RkxN?=
 =?utf-8?B?YVorM3N2UjRudXdHRVRESjQ2WWhQV1prSnFpQU9jWUtRYVY0REkrRytJSlZY?=
 =?utf-8?B?MFhScnFpS2VoelFzMWQxdi9BZ3d4SWVLQVI2cGN5TEtwMzRxTE9FRlB6d016?=
 =?utf-8?B?NU5vQnlwVmF0UlN1UzMxb05FeUJ1bWF3QUF0NmQvUGFkRlNxQTdhMW1ybHFU?=
 =?utf-8?B?MzBIeXBBemIzbzdDLzA1elhyR3RocEp6dE5YeTkzTkRXM2tqSEg1WXkzMmVS?=
 =?utf-8?B?TitqNlR1bG5xZDh1dFNDRVdnTjZUczA3cUNaZmlIZVlzU0s3anQwYktzVmNQ?=
 =?utf-8?B?MEJrQlBBTHhWTDBXZkg2U0dzL1lOMC9SWDZ1cnhlb3dRY3FtTVJFdW1LN3l1?=
 =?utf-8?B?NGpkajVpekdvYnVjS24vUzJUSmQwWWlXNS9CekE1NUZyK242c3FtZnJ3L0h3?=
 =?utf-8?B?Y0NQVzVmU1R4bDh4bkxuZmVvQjVTcE5kQUw2YURySkJEdEFueTNTSFRxdjZ2?=
 =?utf-8?B?bjNKNU1ZeXlOMVBKNEhZaWw1SUlCcDZidFRsbDJJS3NBMHFDMkZibVVyWGx0?=
 =?utf-8?B?UGhvMXhzOGoybGxjYlZtVlNsSStQOVNncHNrZWNJRlVUMmRuOFpBQ1ZGR1NH?=
 =?utf-8?B?V21UdDZrVHR6N0VBYU8ySUNxRGxXeXdjVkdJS25WSGYvOTU4MFlPRy9qYVZo?=
 =?utf-8?B?ckNrK0RmOFJZQmJycVFwZzVHNDF5UmNXMnlldmcyNS9iR3NEclh4Zk9sNDF1?=
 =?utf-8?B?Y09VNXNrd2VtY1JQeW96c3E3dkQwT05sSDQ5ZEQxOFhzZzFqMWRNb3hPeFFj?=
 =?utf-8?B?Q2M3cCtJWTFUamJQU2w1NEcwVTFDaU44S0NHRFlDbmZUK3dZR1IrOGxKMDE1?=
 =?utf-8?B?SXBEUUpXb2dtMGxPR09OdVA3NkJ4bG1rQ050cW1zbUNOQ2szZ3B1dHFKZUFF?=
 =?utf-8?B?M2M0MHNhakErY1VzVnpmNEhhUUNIV2k5NkpXWFl6dEJ2SXdBamoxdkJNcTdC?=
 =?utf-8?B?V2xDbGZuRWtqdHdWdnk1SittZ1U4RkRBWVhXWm9ZeUd4c2F5ZElDYmJDdEw2?=
 =?utf-8?B?NDcrQlgxSFZ0QlRhNjRKVUtwbjZZRmZLWDVoZE05YTNVSE5uaGlRLy9lTkMv?=
 =?utf-8?B?R1RleFFWbmdhV242eEZNUUs2bEpzcUlET2l1UFZtUzkwNXdsTmtJQkZWK1dk?=
 =?utf-8?B?a3NWOHdyQXlGQ2F2a3Jybm9Tam9ERERZNVlybkRqcW9kVHFyRDBrWW5WbEl2?=
 =?utf-8?B?RmdlV2JlSzR4a3B3aGNORG50Tk50VC91N3k1Vm53L3RJQkI1eDc3cENtR1RQ?=
 =?utf-8?B?L2lBaTBsUno0YVdxQXBoSHZJMjRzUUxMdEdYUjVUWDJaUHZjTVZUL3Nkdk92?=
 =?utf-8?B?c1NvMWtSTm83QWZYTlVQWTZEMEZ0MDJ3RWhtMEREOURPSWxWV2V1Mjg2aGhF?=
 =?utf-8?B?R0JZTVhRN3E4azhReXl3WEhPR2QrZ1NGUDRDSVU5SWZ2TW1vNU53UHVzWEVT?=
 =?utf-8?B?UkRCZlFFd0hndTNxZzBJTDBONjZIb2psQmhDc0VwSnBKQVNUZmw2dnhveERL?=
 =?utf-8?B?Z3dCZ2lFOVVmUkRBUDR5V1FoNWZSbU9IWkZBZ1ZXRDVUMHpCUVFOeXBCZjM5?=
 =?utf-8?B?aUp6cFlJTlhpWWMweDBuZUg3cDZIV0ZmU2RTTjlSN0ZSVzlaSnp6ZjVKN0hK?=
 =?utf-8?B?ZnZzZTloYkdMSGhvdXhoQ1JzNVRuOGEwU2kwclg0VnpVcEcvS3Bvcjh2QTgr?=
 =?utf-8?B?U2VCVzk2Sm5yNTZ1NFA4S0FWQVk0YzFGL2w5K0V1VmtpR0FEeGxyNng3UldR?=
 =?utf-8?B?M2lGQ2xndzN2amtPcEZ5dDVNNXZJSDYrNkZZZVJmVXBhKzFOZlh0VDRTWGJx?=
 =?utf-8?B?TWZnbjdOdHJGUTlNQ2hXNlJtaEw1MXVvcnUyWGNMajViU2pWcU44WGIyZG93?=
 =?utf-8?B?Nll2c0x4TGdLQ3hNZFBYazc0OHQrOTQ4TFJTMjJtV3pYYzhiUHRrRUJrZjdD?=
 =?utf-8?B?SlBTdlhuV3dqRTRMWGc5VTc4OU96TE5KcHRFQnpralhCSkgwbXF1NG9vYStz?=
 =?utf-8?B?ajg4ZEh1NjFDbzNQQlJBQUFlODhnQ3JEMHczMzN2Y3c5eXJMRm5GUlkrWnht?=
 =?utf-8?Q?VTE60bZZeenTBkbbmA5V7rnDC?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b47692f-cc6a-49bc-03b6-08dc73e91a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 07:40:18.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H9mowPSfD0u+N1lxCW7w93Br8YDdk9RK/TL2o/YJ20NjiZiftcuYlgshyd3vWYN751uubTuLQSJYYS1KmL0yulvVjveZo8hUuZy46EBnLIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_004049_244754_4C7BCB94 
X-CRM114-Status: GOOD (  20.00  )
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

On 12/05/2024 02:47, Samuel Holland wrote:
> 
> On 2024-05-07 1:53 AM, Xingyu Wu wrote:
> > CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> > But now PLL0 rate is 1GHz and the cpu frequency loads become
> > 333/500/500/1000MHz in fact.
> >
> > The PLL0 rate should be default set to 1.5GHz and set the cpu_core
> > rate to 500MHz in safe.
> 	
> Can this be accomplished by instead setting the CLK_SET_RATE_PARENT flag on
> the CPU_CORE clock? That way PLL0 is automatically set when cpufreq tries to
> change the CPU core frequency. Then there is no DT change and no compatibility
> issue.
> 
> Regards,
> Samuel

Thanks for your advice. But cpufreq tries to change the CPU core rate and also
the PLL0 rate with the flag of CLK_SET_RATE_PARENT and the PLL0 will be
changed frequently. I think it goes against our intention and the PLL0 rate should
be fixed or rarely changed. This helps to stabilize the system.

Best regards,
Xingyu Wu

> 
> > Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110
> > SoC")
> > Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> > ---
> >  .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi     | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index 45b58b6f3df8..28981b267de4 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -390,6 +390,12 @@ spi_dev0: spi@0 {
> >  	};
> >  };
> >
> > +&syscrg {
> > +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> > +			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> > +	assigned-clock-rates = <500000000>, <1500000000>; };
> > +
> >  &sysgpio {
> >  	i2c0_pins: i2c0-0 {
> >  		i2c-pins {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
