Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E8CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 05:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhNcAVy/SKbH4SDs1u0w0IPu2+YA12Nbj3UTZEP9P0E=; b=XZrJ7onZNsgalN
	cljOL2ZWXMAmDnL2vuxdufwf+218feaR+YNfm4F7bPNOgFJAPH8/mT25mDepthZMZVvTR6gAyH0mm
	DU5GVnnSo2bz2hm7FmjktqO5yEgtAej6ga8lSwZb0EG8PZtCryFax7cv8Zoozi+ZAy3qcNPr3KXoM
	D6koVqS3I9baD6vqqz9L+uNT6Pte/Pd2IbXgSpPBs0E8puKilZBfxZiDfJWEJ4xP5nFL4hATTtkBO
	700W0igJurLn95WBriCVhI1yqcSiQzEq6P/s8YJdYfyB4rUUe2/gMesWu0ZvC//4UDmmIFmFz11Rm
	Su+dZAbV00zBiVyOzERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlWg-00000007SuC-28Pv;
	Fri, 15 May 2026 05:55:58 +0000
Received: from mail-sh0chn02on20723.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::723] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlWd-00000007StT-3BHl
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 05:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLxiBryxUhiHGQ0e3DpvmrPdwRmmuRFLfih6bopRuCIdybqjbEy4wLFornmoLn5O0Xl0IEH3Gbfci8irEhLVLKasHQJNYBEXdt/dBbR8oWO+yaleTBtzLIyLJVLzfJeSVsyBUS+Vt7KMb8eRQMGjcabGbToNHqsDP96RBLL2iJUljs3vu4z5aFbi+G+0OJHRmsWDaLo0psY8s1FMlaMg+F8EHRc3LmyEmygL8TPbe+Z8DDBBxJ3yvNc3KNuJw/mqt8tWTTfrQpawRwuIA+2FijOQD8xBPlOB32+NkKHIZB1f0A9bXjOYy8ytgpbbJCTH79lH5ljMdSLinN57pupVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0hkWfUnzECpxh/6yZvphUUeRb1AdQCszXzxAaPwSWA=;
 b=Sgcan2aD7ck11hVtAVF1Amp5oueDhJ9rvQsA5QnE8mx/9bL8hhbjBo0USdcao4P+1+Q4LbumNwk6K/9eAA1ya4VCiqNa5aHEuPC0VDGXZpvCSVaK+0kykxfCrg4QEaDBYXPeXLJDx5yQs/BxmTwksf/BFNdF6Nb6yk6yrSQB3Oo+x0R3EQaKJZ0Id7Xde+q8vlrRwO5xWMuGuA7uw1IF/uqZOX54g1POBCpLhYDJvAeUs2TBDIEPRRF4I4Es3pfNsCvdUlh1MLhRBEkDn/7sd3rx/7qiuDiE5v/Dgx85k/Nkg4l9xWl/f75z0TpL1cptzuxp98YRjov6Xpic6C06Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 05:55:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Fri, 15 May 2026 05:55:48 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Thread-Topic: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Thread-Index: AQHc45KRzWGkgNqwEUK1h3GqM3NQzLYN3PGAgAC63EA=
Date: Fri, 15 May 2026 05:55:48 +0000
Message-ID: <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
In-Reply-To: <20260514-operation-remix-9f9fcf9a6102@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
x-ms-office365-filtering-correlation-id: dc843b01-2342-4dad-acb7-08deb2469d1f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003|4143699003;
x-microsoft-antispam-message-info: 6fmve0DMtkmoSrduizrpEw08MjWqDjpx8JJ0RcLO6x3ZIx1RiaFbsWd69gLy094oorOV7P6jvBMy1bBRV220W3Dxn604keR+PVMCZRwNZBuUnUnQe1zxc084J55KtZfIiRW4sOT4Z8rKR4xHe0NpAOwW1XoDysWGFPlAmcMuM4SXspo1Wlu9mNUgawQiAMN8nZn3VAHnX2avzaoBUMLDOpSWs4Tn9jDi8GGIpmktitvZ1uOM2xyofda0KhSU87ShHnvSuoQ4B2xNmOPLJm6AiaA2FQyvtwxSYrHqHORycNcTkj3tV1EtCELz9DspWr5/TUguJNThRmWfWH3pe6LF8VmTWLkecG5N1/qDRZ/ZiT/OdX9E6Lbhfbp/4vFHdNGWgbZpqADAGWrgJ92A6Bf1mO5BsvRBcLitWU/abiz59ykTjCmsf1USLcNCbohxHvVO55/714OrQCNtLtOx9SX4JHGzu7HO897yJx/1+pSsIlNMDe4euE2ORYMEMGMAGqaP/lf1MRD/LnHmjcRIxmsSQqezIhBHqldtuXPe/MUy1ApsHn/1psiBxkYqDzlKETlZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?83Gj2kho25Ko09LiiM7COgHZPhv+KV4QoBiw16wHGPv3biC8KRISdZwVQmLp?=
 =?us-ascii?Q?NEcnhaFTnFPSv2EXVPIbMIAPn+aPjv390eQ1JDXtK1b4iXZOMZi7yZ5kH/6P?=
 =?us-ascii?Q?4JcGcvKASkcQh3fXFyIfZdubDF2SLnxzMll9Mgq08AIFEBJM2hS5rZgxskyY?=
 =?us-ascii?Q?5qszTL7ldr+TG0kpZMOEpyQ5RtPVFgucQnm+1hexYBoP6bnEMQbu0Va5lwvH?=
 =?us-ascii?Q?xiKt+58GTFesnk+x9GfxIFUkMg1h6RYvxoRUfSr4/i/Q5Lnn0nmOYcLmhoV3?=
 =?us-ascii?Q?o+xtMbTDTGz4d9ZEvNGPX64SphJR4K5MTntmMozh4C7Ua7ikUlZrAu7JxVS2?=
 =?us-ascii?Q?xzD8jUQN5ThBxLlcdsvtWLLY7T8xtIYRoy8UyQUXzb/p2PYEm73R9sWuPoff?=
 =?us-ascii?Q?eSoNaEyF/ccSw3ob2sg/Q5VCh1ylyO+i3Tpn5KdOnw04eBxs28VVrD3YhguM?=
 =?us-ascii?Q?CpLgCeuejs9x8I63Rfdz70arAy/pzu7QNA21zbz0IvBy2PCfk3RfieL4/494?=
 =?us-ascii?Q?U9axB7tMAYWwBA+0CwLafYePmXgXbMifu2uI5OUCKgzsfqDc2lnjWDlFD6Yt?=
 =?us-ascii?Q?LqzXtrBfAXbuRyNQp/6yclvRpsvc7FeeMSY9HXvwKEFdnyiaJkpNIpusETvl?=
 =?us-ascii?Q?wPYUh6iaN5UrtI+SF7rMp1QEAcsXsUClTM0Oza76hGjQRUCLVU54ZQZnYEQR?=
 =?us-ascii?Q?t2i+X06LRDPezHFf7fJ6V20Pn1/Yxj2eMu0beU7epbhWUTJRB8gRbLMLc+XZ?=
 =?us-ascii?Q?Fe5eJVPpUr93H0wHrgboku8K5WAPiV9jRs3KYkV9Ro4Jr+7wnfOoMrTOxy2H?=
 =?us-ascii?Q?u+egmyjjN0OZmd8e8NkSkfykNdGNgEaBmKh8pgYn6FIUBILYlVfm2f8JS2QL?=
 =?us-ascii?Q?k+eaKA1pxZkE82IUAC24xA/QzJ9v+rwsyeQzrPb7oezZagjTdz+OVqEMtw82?=
 =?us-ascii?Q?p+Nz7TW3h0pYX6hONhfYEgyl+iDGVSSqr5EH0S2wb6p4EWiuNyQFtBcJYDaG?=
 =?us-ascii?Q?ZFQC1JYNbSb99Jodnxupl74ocyjO0KQxEF2JBb66cIJSRhoSyMu6Qtzur8hc?=
 =?us-ascii?Q?NsHvh/gIDHgMDjW+UgVnqgZ4WHE+GkFkn+fIHdIj6F9JeV8Olbkd5Jz+uv+y?=
 =?us-ascii?Q?Wu0ZT7mC2b2AkhUii5ZjMLV/2s7kxsp0OmksOFkNaTtJbt3t7yqhjxmI2UYz?=
 =?us-ascii?Q?inXN3OdFM9rmzRmkBSEwzhHPBcCgc+y3ElKJ2sC4ldRewP1HInXkMtqdN8xX?=
 =?us-ascii?Q?6xplXT30EfAEGxU5C0ifzn5/JBxS89J++3T2QFVmXQ2xnfFy6Jv36JsDGLjF?=
 =?us-ascii?Q?/0OTep8/uQ/5vkFOBQSFSbS0lWFKkENK+1a9l+ZEDQ4RPnYR5k3Igg3T5Vw6?=
 =?us-ascii?Q?/3lzyKtIxWNtksjjpq8t9mybJ0xt+RGhKSA8BNQiWnSB5IfdaA95ShSg431O?=
 =?us-ascii?Q?KeBjlF9cGghKmZTbdIpmn0blY2fXP5WfyMm86DZXpTSe+GdkTtUq0vOIe7/H?=
 =?us-ascii?Q?FkzUF2KudMs6bOEApW86DoyTu7mUVOnxdYrZ/eLSz5infuIMoU07NIk4l0Ym?=
 =?us-ascii?Q?Ph+/85v3MOsS175YwU9SLnXvVyWk1xTAq3t2fz8NQwJULwNIS5opY0hNbVdv?=
 =?us-ascii?Q?MsZWNLSJGYD6l7SQCanWTKpbpJ/tCOrTWsDgid0wgN8KZqWQ5sRS0fSh2NwN?=
 =?us-ascii?Q?nSZn8ilbxgkVXBPHKNgi+0Cy0XXFAfaw7pMAL+bOGtPO+lzfNkIstTKEoD8c?=
 =?us-ascii?Q?UXW/TojKrkX7imLgrLuEd0CfO3gF9xs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: dc843b01-2342-4dad-acb7-08deb2469d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 05:55:48.6704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2SICiks7p8wZA3iJSGSqvZqy5OA/mJJJVqN5s2qhiliWc6TCWU9OVR1do9fTIlnoYmKtOTR8yHd6DYCkfDS8/EqWZAc8SVBptfa4Qj+4VQo/0JuRlYw2NBP19DUkv5J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_225555_800799_5A0AC772 
X-CRM114-Status: GOOD (  22.89  )
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

Hi, Conor

Thanks for the review.

> On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> > Some pinctrl subnodes only need to configure pin properties (e.g.,
> > power-source, bias, drive strength) without assigning any mux function.
> >
> > Currently, the driver requires a valid "function" property for all
> > pinctrl subnodes. This forces the addition of dummy or redundant
> > "function" entries when only pin configuration is needed.
> >
> > Example use case:
> > gpios-configs {
> >     config {
> >         pins = <0 1 2 3>;
> >         power-source = <0>;
> >     };
> > };
> >
> > Make the "function" property optional. If it is missing, skip adding
> > the mux map and only process the pin configuration.
> 
> I looked through the series though and all controllers appear to have pins and
> functions, is it the case that gpio is the default for these pins, so you are
> omitting the functions property when you are using the pin in gpio mode?
> Saying that the functions property is "redudant" makes it seem like this might
> be the case?
> 
> I've got some feedback here, but I can't really provide it without knowing the
> answer to that question.


"From v1, copying Linus's suggestion:

> +  This domain contains 4 IO groups which support voltage levels 1.8V and 3.3V
> +  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> +
> +  Each of the above IO groups must be configured with a voltage setting that matches the external
> +  voltage level provided to the IO group.

So your hardware has groups and support some properties on the group level.

So expose these groups and make these properties configurable per group
instead of inventing per-group properties.

> +  gpioe-spi-vref:
> +  gpioe-qspi0-vref:
> +  gpioe-qspi1-vref:
> +  gpioe-qspi2-vref:

Create proper groups in the pin controller then use the
standard pincfg property power-source = <...>; for this.

Example for a simple default hog:

pinctrl {
    /* Hog the QSPI pins */
    pinctrl-names = "default";
    pinctrl-0 = <&qspi_default>;

    qspi_default: pinctrl-qspi {
        config {
            groups = "gpioe-qspi-pins";
            power-source = <2>;
        };
    };
};

The groups can be orthogonal to other pin handling, that's
fine. Implement .pin_config_group_set in struct pinconf_ops.

However, I found that pinctrl_generic_pins_function_dt_node_to_map() does not 
handle the groups property, currently, my node uses pins instead, so it looks like this:

+&pinctrl_per3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpios_configs>;
+
+	gpios_configs: gpios-hog-grp {
+		gpios-hog-pins {
+			pins = <PADNUM_PER3_GPIO_E0
+				PADNUM_PER3_GPIO_E1
+				PADNUM_PER3_GPIO_E2
+				PADNUM_PER3_GPIO_E3
+				PADNUM_PER3_GPIO_E4
+				PADNUM_PER3_GPIO_E5
+				PADNUM_PER3_GPIO_E6
+				PADNUM_PER3_GPIO_E7
+				PADNUM_PER3_GPIO_E8
+				PADNUM_PER3_GPIO_E9
+				PADNUM_PER3_GPIO_E10>;
+			power-source = <JHB100_PINVREF_1_8V>;
+		};
+	};
+};

Best regards,
Changhuang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
