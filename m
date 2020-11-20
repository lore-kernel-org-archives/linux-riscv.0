Return-Path: <SRS0=Au/l=E2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF553C388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DAFC20888
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2020 00:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lThJrt19";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gw8d18UZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NbzrS/WD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DAFC20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=fF588WLRNckZHqNvEmAcxJrathO0YGNfulvFF70XRvw=; b=lThJrt19Zv75hAY5hIKNu7GTN
	XwMcUmJgJtQN4DISOtVCGHz09iR8zHedQ+xXHnPgx5aG5zfE63pV/UUQCgnZr9zwKAM/OoVvFrbbA
	/ILDXH6e49ERvIUyHjs+ltsK6Rv0MBbZ+sPf7aRs1QWaDFw49Mbd9h4PyyC8IdeHTlkuwKwdyM4fw
	istf7TgcmXxhak4ja3jRgUBgxsedKt63zXDQRYRiGieX0APvKKCmb89uuUxC7gT/EhSiw0QJ/4ZbL
	5xinTcNjghUH02MDFaMlD9UeP4p2Iqh460Yk3ytgYVdrXkwE9BGSxL57SFPAs7N0sdYDosTvAGxR0
	swfnDyG5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfu2z-0004z3-Ic; Fri, 20 Nov 2020 00:13:05 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfu2s-0004yB-K7
 for linux-riscv@lists.infradead.org; Fri, 20 Nov 2020 00:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605831178; x=1637367178;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Cmf1aSt5zLpKa3XzN6s2zWhQWskgaviM1BQGRqwN5uQ=;
 b=gw8d18UZqheNAVX7qbQJuXn/Kx4hev4od7j8HJc5RSec/ML64oJF2U44
 C1ljFQ6bKjiQ+kaZ97Ulc+5A3fVbYwLsMhZOEgUvVNjxlr9St2lKa0869
 iM7GwV2m/NRYBPnBuhiAEmTuGDUplAXVft09RBgwxDOdrysR+AmCXaSXj
 YzU2w6rewMCVA0YLfqHIc8xZVnesEucoH1AY6v2Q8zzcQntXFfcD+hUjc
 6BE6AJscl9H+se6waByJDegAmwdBgB+0v7Mzvi6pifI82KUDNhvq5/x01
 3odjS3+VakJ0by7gRV5/ks6sZM8TPnk6Gsgjakd7qv0Mdb9D1KelhJbiW A==;
IronPort-SDR: Pp9HdORBDmPsBxwR6vL08wgn1NU++6QGb5ibTWqucIFOBs42Tbzbr1mzhlPDZjk9RfXMbz1l3h
 ogR0FloMT4/Y3kgGp/86PNz0BXCu/VujMzN3+n83PqpqPDB9cMBnlM84cVdxixHm+bRIsfAnlF
 kFq15tIrHA88MWfGCrMLgYJGfFXtXVgg3M7OyLa2b7TNdiNmXUHSXX+o8JS6C8V0zdckNz0/8U
 j6+xtcts4INaWMvwHka3A/Tdq3X3r50gdyP54jFGKI9MaPMlzidcTDMYwLzhQjc4paq16CyaTa
 ipg=
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; d="scan'208";a="154234432"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2020 08:12:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djC/rg7jJGpQKzrtc6bYhpTv3pOVmMb17/877M+2rmARtUdMvPreQTLI/3gJTZMG0mSH9SUDJY44nXFg2l6AqoYKfasaUkOaByyp3ov3Yxj5cb4GaHEy0qTdIZMMaD0+9R5D1/93zgmdNYSCC6DbYubIC398rKaISljO9GjIN4YlBrGzNLyoSPQACfbeBr0RC4ESEh1E05OseabFUeV6WDtTZ1EIgBij9DcncvMIlqncUzkYiMvsde24Jia4Eze7k+XX7DpWjcQCKcI1xNl6VR0nd9p79/NaFJbSYvIyAq3vJzB4oECbvxY5foNvxrrd8631aQUz74IO8pJrnc7YWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gONBB5fUKkI1mRdxPNhHHt4JbT4AC6sSRwn9JhP2Ub0=;
 b=WOfOnvHk9mPeMxogqZtWkFphGky6cEk/IGgJalN9m6LJsQBy7Xs52rMuqEfF5/bSMJcAmDZ+ObzN1xobnATIX26lwukLxuBd8ikYgiTnJqKCVmopur3Ez5XovUFCtI/Sa5JPnmmcKiipaUgG+OdY9LM2aJN4KfZALPgy3hShir8tn6SpUygWLAqFeYdCGOh+uYzjI1TLMjliqmRi4EpeY5nuPIGJzXP+4CCfTVTcvkwlIV15bZlEFnNVxq10GimFn4Bie7+pzJ3nfssUHv5/pSk/vPIE/fG7TWmoR3hRKuHUFl31WlJclBnZ2OVMNPukm5S0OVr++dFNevISGTwzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gONBB5fUKkI1mRdxPNhHHt4JbT4AC6sSRwn9JhP2Ub0=;
 b=NbzrS/WDCoJX11EbgWGoWlKmsedh22bofSewUk3UChoq4kmzquFXCx8LzsCmf8TDtwZmvy/q2tKrqyemjBMXMTUNkX+HlD351kEG41gSAu3zK+2sBoJ0tr81ECRwpCZdS+tp4giYMQ1REWu/jL7YiTWdthsKrsCRDDypbArUhmg=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6640.namprd04.prod.outlook.com (2603:10b6:208:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 20 Nov
 2020 00:12:48 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 00:12:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/6] soc: add polarfire soc header file
Thread-Topic: [PATCH 2/6] soc: add polarfire soc header file
Thread-Index: AQHWvpYfbatSa8asgkSdpmbGR05PmQ==
Date: Fri, 20 Nov 2020 00:12:48 +0000
Message-ID: <BL0PR04MB65145685ACA45790C2F17A96E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201119170425.18365-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:752d:4d55:43bb:285f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6356b82b-0354-4de9-5e4b-08d88ce9037d
x-ms-traffictypediagnostic: MN2PR04MB6640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6640A50BCFDCEED8B2FA8702E7FF0@MN2PR04MB6640.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IIFUoMS0Bk0mhX3pC/K84maAFSORiuzulaJtqsSJIhntORIQ+Msi/Gtwb7UHSbJUcCJSwphIt+K9BuGRiYH6KT3ASRFaAQj5dNlqr9OvN4XbjfAEPrVM0h9O7tncdottb8tiDqSN+eYGt/Q1EwXew02DxhaEBRlH/jTF1OWhEtcyWAXMA1Rnln7dsAX8tsI8298lGE1czLe7h20kflE60ygBDMzoEpQHdLokcDjvJ/rD+YXTtSRbdWU1I1XKGD/xPAIsPtyTbf+3CmomeS5Q254Bq8XsMR0VBgIhN1xOqd4EGTrd7V6dehIGZXpj4pZ4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(2906002)(66446008)(71200400001)(66946007)(91956017)(4326008)(83380400001)(5660300002)(54906003)(186003)(86362001)(66476007)(110136005)(66556008)(53546011)(7416002)(33656002)(64756008)(8936002)(6506007)(478600001)(7696005)(8676002)(76116006)(55016002)(316002)(9686003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2fmoYbHVHetlvCHKReRgH9zu1gXojxLweyxBrFXZLxoccM0QjYGoCR1li/ke46GEOJMVv8zPHeutj3GMxsrJ5xvvdS9+sW4ze8Vrgud9iM4ieIAWH5ongTKEA3OdkNZbkXJJ3UJZWP8SM2SB/wuznMuZuqimFcZOFwhyHwvA8YCQo0znXWU2qmKjoN1mG4VA72BfDP2bNa0kDq5I885gvG8oCYSp6Do/iq5odQqFyjBKPAan7o6UlC8TAkVvvcxvcmmrFCBKCNoztIhBzHIxm6YHqa49tBtzEVnNvwXfwD4Q9rU/ErvqWsvl1mcQLewpeSdhYtaDRld3o+bjXO5Y9xmP26/sYRXSPOMrUKeBJbU4DyylEuPLWADehmy7Ulca285/uNzmR1lvZrFDpUYiv9akfh8W7oTqez/Lrk20hWdeUie9G5Rf3uVpwvZqtl+HBApF/Gy7ZQK+RMgozHiAdgv5Gnuum71gRxu7lGvEK1UvwkMKN2iEwN0AqSFkoec/ZEu0leGD1wKe7Jrkc/+q0Kp1yFaa1xCDG9PRSQJyreyJrd/fckyaV9r9Eu+zM1xFyrcUuxW3BeBvkjb/171wWbvbxfl+nqsX5nWWFRsLD3CYiZb0DZHx6lxHPSUlOsUQW/glAicOZPVfszgEqE8YrfR9vwSFw8h51njBNeatsvsKC4pO+5MUlXO6SowuPqbWTmRxhZ3AV5p+2Tpd3VBDFQ==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6356b82b-0354-4de9-5e4b-08d88ce9037d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 00:12:48.5387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ioPRyTWa38XB3iM2fKNSPC/35iJXMz3ZLd2dNBgwzyRLDkk9oDJb4D/2PV0WX0TNHlSFWuSTGMdgT0lyGlzkrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6640
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_191258_789400_C60AB8FD 
X-CRM114-Status: GOOD (  17.19  )
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
Cc: "cyril.jean@microchip.com" <cyril.jean@microchip.com>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "daire.mcnamara@microchip.com" <daire.mcnamara@microchip.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 "lewis.hanly@microchip.com" <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/20 2:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add header to support the Microchip PolarFire SoC MSS system
> controller mailbox.

This should be squashed into patch 1.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/soc/microchip/mpfs.h | 50 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 include/soc/microchip/mpfs.h
> 
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> new file mode 100644
> index 000000000000..60311ab72b76
> --- /dev/null
> +++ b/include/soc/microchip/mpfs.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0

This line should be a comment on its  own:

/* SPDX-License-Identifier: GPL-2.0 */

> + *
> + * Microchip MPFS mailbox
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#ifndef __SOC_MPFS_H__
> +#define __SOC_MPFS_H__
> +
> +#include <linux/types.h>
> +#include <linux/of_device.h>
> +
> +struct mpfs_sys_controller;
> +
> +struct mpfs_mss_msg {
> +	u8 cmd_opcode;
> +	u16 cmd_data_size;
> +	u16 response_size;
> +	u8 *cmd_data;
> +	u16 mailbox_offset;
> +	u16 response_offset;
> +};
> +
> +#if IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER)
> +
> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
> +			      void *response, u16 response_size_bytes);
> +
> +struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node);
> +
> +#else
> +
> +static int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
> +				     void *response, u16 response_size_bytes)
> +{
> +	return -ENOSYS;
> +};
> +
> +struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node)
> +{
> +	return NULL;
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER) */
> +
> +#endif /* __SOC_MPFS_H__ */
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
