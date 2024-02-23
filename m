Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90041C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2l4yy/njyZu2pnM/vPSCrDA4E/AhfI6hG0UlKgO9ag=; b=u92NLEmNorBG/V
	cp1c+z3G14qkfUnEAADUjsV4xfvzfw6e1Af7wOq67Sua0KYykiAA74YEOTeVVWQrTd22p/dJTf4TW
	3Q4D+/aEUv/AQV7UfjXefIDtQEZqgUuSDZbWJz7fBNAQwN02BlWpKdlYrYjof/o7MSZYwYnkt7H9G
	q/G48k3tO+8NoE/rplXqb0TnwPD/FqaQowvAvCXeEnd8WwfYuyhKeLGQm5IP9MHP+yG5D3TANPjB9
	KMZa4iso28cE+cIC9QEeqfryblWYovr5FLmYN928NbMEOZKFXax3f19zxHHzUv/1xbEuiESyo49ux
	xhn06ncD1VyGXP+64Flg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdT3v-000000090py-2k80;
	Fri, 23 Feb 2024 10:45:51 +0000
Received: from mail-os0jpn01on20600.outbound.protection.outlook.com ([2a01:111:f403:201a::600] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdT3c-000000090jO-0fE2;
	Fri, 23 Feb 2024 10:45:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZ/jvOSk8h2izqjrx9bprF7In5zgHry4hZ0LmjZa9kT5VvHQAlg8QmvtHQNw/3BJvTXhaGpeBVfAf0T6YKpfzAP2Ah5hiJOpRcFKLIPHnA0zS6uFYl8bT5aGA7EmubEpAXP8pwJLXMrFZRiPpjQBReVcvlmFPvfafEMCCJqJG7iXGWRb8Y8Y9UidSk+LwteU14jVrXMjhwmVMaCh82L1aym0ZZ1kjs02wpwV29EO6FVqHoksIP6535wKVd7YW7CEjviYhKgz2X/wMH2ytC5FK6kQjsT3IWA842akvVagVgbY4mY7N44ZsWtA5IHraQVzXUKJrKhzc3nEJr6BfdCETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmX5r69aZxQ30YHKECJj6N6YTw1I/5yfHSVSSh676Z0=;
 b=TAtmCa06wH15FtF0/y6y1tw+EOrQbG5MW6Uavf3TcpmeZzTrj47KcRPBeNtCm2c0zuNG8BWSeftOgXAYoRlh00I8Iij/28iFuSeAn29pVnctj5D+lvlhUV1vzih4a+pglfUvNe262B5f/QQ27NPjG6AVSJPfHlPGpOuzE9hOJB3l54iV2pFjrWOYxMm5EpLlKNxVYrrdvfkaiaYQAXK0VuKrIYCJvV2wZTedFCStYeTQzRFN//sZ7+/KYgb9LKlFpGquEOgOJAL9Wul1xb+zfMUuYHBF500f3VoMJioxz/RTjZ4cEre11/mH8gKm6qFm+XNM/Sh/SOglBK+FJQNVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmX5r69aZxQ30YHKECJj6N6YTw1I/5yfHSVSSh676Z0=;
 b=cqORsm/dHE4eDXMLRAHXQtgaagYCn5TSm8Ogi1RwcJNvE5HlJdnIVEjLezwDkCi0M+7MDp0rSgAzZLkEI/620JG8YJ9T+BaczI9o8bJsqWcj12pfwr6+eIRlMos3z529dXZlrfJXetkGZMxQPNcwokWczwiIJLuznhdWMN7/5dk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB9632.jpnprd01.prod.outlook.com
 (2603:1096:604:1d7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 10:45:07 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 10:45:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Anup Patel
	<apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: RE: [PATCH v12 02/25] genirq/irqdomain: Remove the param count
 restriction from select()
Thread-Topic: [PATCH v12 02/25] genirq/irqdomain: Remove the param count
 restriction from select()
Thread-Index: AQHaZkJDw9NLoYRbNkuhzQYScggLGrEXvPCA
Date: Fri, 23 Feb 2024 10:45:07 +0000
Message-ID: <TYCPR01MB112692BF27640D12CEF5987BE86552@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
	<20240127161753.114685-3-apatel@ventanamicro.com>
	<CGME20240223102258eucas1p119f38e40f769c883c0a502e9e26be888@eucas1p1.samsung.com>
 <481aa3b9-55c2-4ccb-bb4a-58b924d77ad7@samsung.com>
In-Reply-To: <481aa3b9-55c2-4ccb-bb4a-58b924d77ad7@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB9632:EE_
x-ms-office365-filtering-correlation-id: 75d7dc56-a861-4f9d-7074-08dc345c8078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 871dRNu7AxtUWoynAiipSEyXnzITDK8q0CrDtvdz2zNnOVYLZZyr2h+SQ3bJjxcl3EToFWwPhaYkkYLNscUss8ttmfgn+iBp0Z/Uds9XiikUuWUXYTU9ekwRWJOT9JPGwCcOMMIKImqsxrYiB3GOb1aan2PgvOc6kt3jwIlFK2Ifo5Tgn0cLkU5XKqg6C18vRz8WcwB8ARAEteT/GlqpKNAz5sK9kS9LodHzGQtKGUez5YZ/es2gpWGxdXQ8JmLOn8WoNMeIrJ86DB25aDlKcyHQ/BdciCews4i/3X++kwldrUUQ5Rp+8jhNW3bbRrp0eXS98qKgYzg7t8uwrqLQ88kDF/rDKvboTtK+JtUDQIQkZ+xoCfGYUBPLyVfGap0jCaIqA7cwn8Q4VfI+V+x7Obm8khMwrUEq0l3GCXG9u07cT7nwKDAnorlnYXWLLe78ZMitWPwCMBoAYwYD/0ZjeqnvWVN9uyTeBXlsVdgflXcr0nXvy5yyeqicGpmGhYNxLOybR8W8RRvOFRX/ZQV0/Np1F9INF3ojn53FCNANNboGzWXKQnRIWC5oXrbBF4vkhNvRtzYzGUQp0XhzoNEKIMsHRICTx2xMhnStPfd5GgA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rvWAK5+UAuBv/0F/fE4g2nsrEYoLXduI/WoldW5e+dJ4PQphHErlqOSOZR?=
 =?iso-8859-1?Q?A2bnSGTlqbtjQnspMaeutN2sQRnVTV/gsbU5EV6KYkBKAJhLbg45Xg1PtJ?=
 =?iso-8859-1?Q?9exZfzIlW+pMMP+x4yRVvOENN85O08L3O8qVEttSv/+ysfZMe4kj3/2ihV?=
 =?iso-8859-1?Q?XRI5TLTAxRz230yULym8D5dSg0OUp8zurpIF8SeXKG2c9nubS42Pr5o+36?=
 =?iso-8859-1?Q?IRWYJk6K4j9znZgc2dH0wiYkbH/fGgUNMggR9qqVPzELEfYvqYv6Qombch?=
 =?iso-8859-1?Q?L3qhkmGlLlO63kKW2ONYMiP3aLC7pQy7oLildWE1/AoOlfDshhkH9sQ+Cl?=
 =?iso-8859-1?Q?FoEluXTNv+bZ8RUg07nz3R8DUjH3iJZY58MduwSJpCc0f5KX+8VDtLsLt/?=
 =?iso-8859-1?Q?J/N0fAUwJY2ar2P41vueEmgqbTT6Ur8M6qdWmJs1wvTA8zlt50hCHb5RtO?=
 =?iso-8859-1?Q?OIFo+9XbrWqtsowC2vWP0uhAu0q0rckChg3mCB2lixPT5bsspX27Mn0Q9y?=
 =?iso-8859-1?Q?Rk0DeYXFsuxK9NkQ9jNmW37zeXYcayhH/4px4JuOMfThFNcHl9lDkALeiQ?=
 =?iso-8859-1?Q?RMFfB8y1Dmv/2RC1BHiYkC0puKqJLWFG162KIRg1CJnO1dhCv8NSVUHxsY?=
 =?iso-8859-1?Q?q5hzDxNVbbJ+vwFEJSANts3ZEPFP7tcx/vnwAMYaquQD7v2eKjuUbZXENT?=
 =?iso-8859-1?Q?z7uipgEdadhe0wVNWMuHGoagILQqxC46Gd9dc+1UtV1EqNn16+nLNlYBMZ?=
 =?iso-8859-1?Q?WZ2dPKKlP61bzimotbT7g0cJwW+EHVUrnVw4vjaxCHxZjAWzOsNiL/Tmu6?=
 =?iso-8859-1?Q?KXkyzIOdRfozTpEQL2zNS68Wlx7tCT5/y0Fsr7nV8uWnGdIphGkUeIqErI?=
 =?iso-8859-1?Q?odrZ3LAVAu2tMgZPSJneJd5YsQxreW8s84vCaiwoujwXXx9M4OpY8mNP/g?=
 =?iso-8859-1?Q?aBAk9zr4FlL5DjztsYpUjEHm9aTtOErgbuM/XDZ6sMQ8oBsBMkhbWz23uR?=
 =?iso-8859-1?Q?u+IeAClx/lcPYa4gSsdNCUMoeUeVc4jnPXLhYgEvYHukJDW5BSM0bOGTOA?=
 =?iso-8859-1?Q?dnupwWBN3/X/ApGu9OgTqIujTD4zT4Obe/gmCvQyqtndiM47MFLLxsSnb4?=
 =?iso-8859-1?Q?7o7y+ZvMBwYDP2q7p74I6/E60r5jG4LLEN/X2JCuGV8fr0n9utG0k68m2u?=
 =?iso-8859-1?Q?p7y5FtyeZA0LTW4IvVeQ+5qnLfyL5EM415xilHcZPWrjZDKFsnYlcjiQxA?=
 =?iso-8859-1?Q?kFZUnv8PC1IhkpNk4BFmZ2K4yaH/yBUure540Vx3cwncAl7PsqVmyRS+tu?=
 =?iso-8859-1?Q?evDLduyaQPzU9KBdK/iKO3KrKtD5N2CCWPYSp6T4aAXgBXS6IjcOT0DHyk?=
 =?iso-8859-1?Q?2ARqiyrMpjnPH+wIkE6AMpplEBY7XTj9HCtHAr+E/HAi/SJkaqz4KQ/XRq?=
 =?iso-8859-1?Q?FMtzVVOD0ALz9Tp0x2P4JfDeepYAo8K+JFAmBXPIZbv949XCGQx+V8kLAs?=
 =?iso-8859-1?Q?t40VRn+M1leSyoOlkH3ZgVpwwjLAtgUPo7tsRjrhMfYYnCaacBTSEknsay?=
 =?iso-8859-1?Q?eDVhp4txYJcgWjH+D/ORyjs6zth/+DCTymjlkUry6yTELtsqsDwF3Mtgbq?=
 =?iso-8859-1?Q?tPkA2EZQAUeq+lmzQaUQdq5TPQQAz+rtx6OGO8nfEgALKo0V2I0l2sXQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d7dc56-a861-4f9d-7074-08dc345c8078
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:45:07.6633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOPycWWvCT/9kzzX6Bhg93HNO8vt/d2aVVBI0LYuGBfcsBCXu4clt+r7WgOwwJ117RoGFYltIdsSp5kEPWC3g0HDRR72fkM90PKEeTlDB+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_024532_741113_82012457 
X-CRM114-Status: GOOD (  23.73  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Marek Szyprowski,

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
> Behalf Of Marek Szyprowski
> Sent: Friday, February 23, 2024 10:23 AM
> Subject: Re: [PATCH v12 02/25] genirq/irqdomain: Remove the param count
> restriction from select()
> 
> Dear All,
> 
> On 27.01.2024 17:17, Anup Patel wrote:
> > From: Thomas Gleixner <tglx@linutronix.de>
> >
> > Now that the GIC-v3 callback can handle invocation with a fwspec
> > parameter count of 0 lift the restriction in the core code and invoke
> > select() unconditionally when the domain provides it.
> >
> > Preparatory change for per device MSI domains.
> >
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> 
> 
> This patch landed recently in linux-next (next-20240221) as commit
> de1ff306dcf4 ("genirq/irqdomain: Remove the param count restriction from
> select()"). I've noticed that it breaks booting of Qualcomm's Robotics
> RB5 ARM64 board (arch/arm64/boot/dts/qcom/qrb5165-rb5.dts). Booting
> freezes after "clk: Disabling unused clocks", but this is probably a
> consequence of some earlier failure. Reverting $subject on top of
> next-20240221 fixes this problem. Let me know how can I help debugging
> this issue.
> 
> 
> > ---
> >   kernel/irq/irqdomain.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c index
> > 0bdef4fe925b..8fee37918195 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -448,7 +448,7 @@ struct irq_domain *irq_find_matching_fwspec(struct
> irq_fwspec *fwspec,
> >   	 */
> >   	mutex_lock(&irq_domain_mutex);
> >   	list_for_each_entry(h, &irq_domain_list, link) {
> > -		if (h->ops->select && fwspec->param_count)
> > +		if (h->ops->select)
> >   			rc = h->ops->select(h, fwspec, bus_token);
> >   		else if (h->ops->match)
> >   			rc = h->ops->match(h, to_of_node(fwnode), bus_token);

This patch looks reverted on todays's next. But there was a fix for fixing the issue you mentioned [1]

[1] https://lore.kernel.org/all/170844679345.398.17551290253758129895.tip-bot2@tip-bot2/

Cheers,
Biju

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
