Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344B5EFCE58
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 02:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fXeMqjd0PUCcD9+PvZ7dtvQHcevcoiLvfdPOLMiSU8=; b=z3XzflcR/8xep6
	ds5i4uVx2ucmcu7Rtz5Ny6HjNzCMfw9WNOfN+gylLjDF827iCaWM0YfcsofcBfjGxfMU8498YCgRf
	TU6Qf3KzpJyiRewOxgSdfNmNsQE7P4EFZM+N+UxiS3ItTJN/Z7I9tnsz5SywVDr04yHvsE6ah6S4w
	qk2KlDYRl+KrzwADqgHhvZh326lEpbtwtyccBdvhbakB5RVQA4J8yG88HRLxH1jBjmtUN+SAcoJw6
	2RzEv8tKIWDgEDMoJHkVq4unOoV1ZXctnDr2RsuD3Da26Rb+D65H3Pn3JNqv+n/T9oo4fOe6PzUHf
	jiKYbhttKrU1NHCqkX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxygs-00000000nXJ-3lAN;
	Thu, 05 Mar 2026 02:43:54 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxygm-00000000nVi-45Zf;
	Thu, 05 Mar 2026 02:43:50 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6250ikGR2783580;
	Wed, 4 Mar 2026 18:43:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=; b=
	Tu0xOb9bjwYiWIVoROJ3j0xiG91ThrpouTVxK7Yz+4KDZIMbWX5dNkgCHoul4Mbe
	K/jtcUCH15HLfxDXGsShkzh+PdDss6VZaKTcwNPOZNrHpsDxk0cEDhEpngLjbgAQ
	earkECSpXfSHAMdNwUj5Mi34qpHByhz1tlJFL2GAX9On5OT+zjyjnLd03EGuOwk7
	9MWG5W7QqEXWdbGYiTq9MBn8oY3nEAD/y2JnTugr7RXOdM/1AjC/6rnYmGeSzO0s
	9JshcNfFrrXlIKrYShcr2Z0M9qPtxsb2zBS45IWnL2dL1GDyvrEl/AK2SV0w7azg
	r+nEn09tLQvOF/3+Xs9pxA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cptastd1g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 18:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772678609; bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dthB017OZYfsqs8htB0+dMrzDTa9UeDBy9fi/yjCX6upsvBY2sbP5y/I5bQrC4rb+
	 JLCHkMouHdnLYAfYhhdUhLBFiJogLMqrCTu1vcGB9l9XX5cbVIhOcg6kbRiEFcHvgf
	 kIOgoZzGeVtBFwadnwGH4a5rt+mnNGl94XoZLJosOT3gClKcUYJX55jhaTAK/QF+Fn
	 3obgVEWWiSbf/H5sNl6H3UiziiD4I74aj8Ycjb6WzLQI2KAZed/4mDjtguBwomAa6C
	 8YrpAtE3uGUzvDY1zUtQZP1NJgq7yumCwDM7avHEANoMTzLEmv57h2jlGhBxL9Pj9h
	 gru2ZjlZfHvJw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A55D340359;
	Thu,  5 Mar 2026 02:43:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 02423A006D;
	Thu,  5 Mar 2026 02:43:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YY3q5KCg;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00105.outbound.protection.outlook.com [40.93.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3D9BB402D6;
	Thu,  5 Mar 2026 02:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUjDC8Fg+KGqaMvjhLcNOREnwV77P3VjHu4WrLTLThUgpeVWhBUPP+7hIlWvfZANX+ccLBSOEfKA4JIrGjzhj0hWAVfmCMeRhXrEzzVXtZlBF8+4Cn8w8iWNKMyWK41Z99oV5KDBPo9GekLFQDEqrY0QCtEqQfc8OlUx0LnjpMVKi7oWdFRekAC1hOMXS4bxfwg8NV5SURTAVW7r2XHSuw6iKdQBhqy7CEFF5O510DH5DcgLHz5JnutrKcjhItqssWgwS/OTQuc46aY0CUVsa0I9BAnF1clc4rPvL24JEQ4mgohcnfDvaFMy0fPVlP+oguX5wShskMarV9aS0EB3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=;
 b=FylS8K3ygAkTh2pXWOp512qFTVMRp2TwmE/vT0jqmwN/nhYleoKa90owCLGGNaePxwD+JJU7Y0ESoMAThHCt8R+RfljIv3BtP6ksyS1wmHLl4pcoJ+RsrmmwPWSvSrbNn6CNujjGRNSQRHjd04aOqM7L6Q3KXDKer4K31691EjQ2QxMWH6/8SnJC+MwB7v9aR7v4EJOiThNiTKOECCbETlHWePs2pCEQTHTDx5VSJizmISaU52VnuyK26dPIZ9n7XodItGQUFF7K+f0SX6fCRtUlDSal11eWa4PwYuTaHvNd8gde5UFg2EwoF6I49xgvzAyTSKgNV/dHEcJ8rin63A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=;
 b=YY3q5KCgeNjnAaUP/WHA6q0UXGbzSlrRUSOxxf0qYESjtDjaMEjvTp1ihkRubrCxlAHPyDpl8jlhyeY3KdqQxAAEVniojQhBBl0GS5Z33AK4jgTO9Ku9Y+j4gHRBoRdYgItUbs232/51V3ywJrDtGG2+nr9qEdMA4P1/NGsTfRA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 02:43:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 02:43:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
        "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH phy-next 03/22] usb: add missing headers transitively
 included by <linux/phy/phy.h>
Thread-Topic: [PATCH phy-next 03/22] usb: add missing headers transitively
 included by <linux/phy/phy.h>
Thread-Index: AQHcrAC8TPH5bRx6oUuwkkIpnGArx7WfO6CA
Date: Thu, 5 Mar 2026 02:43:19 +0000
Message-ID: <20260305024315.ipn2gvbgovy7lfea@synopsys.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-4-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-4-vladimir.oltean@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7028:EE_
x-ms-office365-filtering-correlation-id: 0a7651e1-499e-45fa-8aad-08de7a60f5f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: w0lI+YqeEoJUvo2nz2G/4kSFE2LY9t7meUFWmNK0E40/YoKTDsyBhGay15bYjID2GijFnUVoWEetO1zLb22L6s5lHh+Ulb/Gy1d+pCnloN7UbYjOESEQFi2RFG4mOA5qp2md0/yZvi7mKuCq4gqsUcIfJvamjv+C/adGV5DgTTJ5fL/8hTkSLwM5d4a3wG1f/0UwGR+MVeZk444sjYOloWShAKkg47rlAuQqBwOTMpqltM4nE7WkkWK5Owm1xJ1z4QeLf1tGjmMnnntSCO2lBy/C6S5tQQqq4qSm2mVLtSJ9QfdpseFciacZpB8GuvoEAbS7+JiL5KXaafXJdi0E1K+9Vrx2AflsvTMPnvymRi1HlI8eWuWtxMxmgUgyFlQc9UrjxT/veGlgMf6uNmk8NpszbV3ZoelADT1VJwT3Dh4Wkqp6hKbYvBNOSxnuOu2u2eg2RGS1WCOYsNtkZoUUuqwVf8ZnnpDlLynfvIrsmxWfapCwm8g6hOdu3DtvTSfBpZ+ak8yx5O9V0S/EouLBRoWD0HCo9k4mJpr7Grc4IqWDvxrZCc0kAqW7tdaBucWijfeaxs7UXjAcFXPVjtSrU1nX7MB4hMygeVcX3loJLFR8kQz2kYmv5kdfMgtcMVBKxw/ZvbOOQxA6xGUcHdKXUjyBpqodpfobus4BGwItdrEhlacWjOhbR92lE2fbQ/OfZb8+R5AlVqqYIUMJyyPWBP54seK4lnTDLlzSl5FQr4ERyqdKGHFdGDS1QklrBbmAzwTF8zP+qTLVcg8WxXU9/jxD2t8s49zDNrx9QuG0vng=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJkRDY0MUNGU0xiekxDUzRzbTk4WUVQaGplbEtsWmwxdVRSZkw3OXp2Z0ps?=
 =?utf-8?B?eUc2UG1uMWxGTmxwRVU5QkJxdnlPNXJ3S2dKMDZwdWhZNmh5SWRtWHRyNEpW?=
 =?utf-8?B?NFBOa0hoeXU5SDlaSDkvTFB4eElqYmJaclovRDNIRi9Ieko1ZTZjejlBVmVw?=
 =?utf-8?B?K0tvU3lSU3FoY0RaUUE1SUF5T3d1UmN6SDBDd2hBb1R2RVNhWk1mbzFyZzB5?=
 =?utf-8?B?TThEcDBmTmVrTVI4UGJXd2lHbGkyRmY1SEtNNjB6SXNGekZKRm1oNU1LazUr?=
 =?utf-8?B?b3pSN1Jnc2luM2dJOCtnN2ZWOTdyT2p3TWdMTlY4K2FxWnVhYnZkSVJNcnRu?=
 =?utf-8?B?YUNKQXQ4UWc5K3dHY0JpUWF3L21jMVpvVU95N044d3BGc1lwZWlOVzFqaDRs?=
 =?utf-8?B?aTJUZmdFVEFQWXh3bzZSZDYvZzZ3MVo4cHFYUnp1TTV4QXQ1WjRaYlA5Nllv?=
 =?utf-8?B?bExMcW1iZzh0OEkrRGVVdndsNlF1b2NuT3NOKzltQ3k2Tmc3OGpPUDJnUHg0?=
 =?utf-8?B?SFNGYmllRHdsNWhhSlRNc1ZTR2wvM0tvMDQ0cUtob3lLRHJUUFhLWGFPVnlw?=
 =?utf-8?B?YjlIWUQyWmdnKzcxY1NDZ2ltdDc1WlNmQmlUWVJnMHo4VjBYQ0VxSjFFLzgz?=
 =?utf-8?B?VCs1YjZLa3Q0Y2lmWHpQRmhOWU0xbExuYXBLdEtqdFVsbGxqLzd3MjV4UU1T?=
 =?utf-8?B?RFYyUUVqRElkbiszU3I3ZmdIUW9Cd3Y2ZkV3Nlk1anhJNUhJR21BUkZVNDYy?=
 =?utf-8?B?RlR3dzB2cTVnZUV5V24xYWFJOTc2ZEo1QXFBc0JlamVLWU9BZGtpUHhKMlJ1?=
 =?utf-8?B?QlRNY1JCTHBEeWNLNG5mTzFHZ3RNUFI0N0RHVVkwem0rUVBmSFhFVFpURldV?=
 =?utf-8?B?UnpNZHgycnArQkk4WWFxKzg5T3JrUmtzUURnaEFzVEFYVkozYmlHRlg4SjZO?=
 =?utf-8?B?ckJSaHZmWThRVW5sQXp1enp6cjhzd0N5alFvVGF6aVdPQ1JzSjJyc1ZGeGdG?=
 =?utf-8?B?NTVTMzNJMVY1TisyMUNKVU5yWG9Bdmh0NHhhMFpLWnovNGJQWG91QzJJbEZr?=
 =?utf-8?B?dEx5QVpPSS96Ty9keFJwNWloM3dnMUFHQzc3Ym1CR2xLbTQ3eHc4VHdRNmsv?=
 =?utf-8?B?eGRybExmZ2NqMTNpaXFzaGJkckloYjVhNVEwZ2hqVjcxZEkzRGp2UkdweUs5?=
 =?utf-8?B?L25DUUtXRHViS3liZkxPQXdqditzb1pkeDkzVjMwbWMyNjJIcWMzdVg2c2RX?=
 =?utf-8?B?NnU3Z0xwSFErZmRRTVJtRENKd21lK3BURmphR05iQVpEUHBHMzlvNzdZbmNL?=
 =?utf-8?B?dmJiNmxFdHFySXg5RXF6Mmhkb3NkUTFSNDdib0F0QXF0S05pcGJHY0ZyZlVy?=
 =?utf-8?B?dmpoa0NFeEdMeWdWemZqUDRGNnVVSHM2VTlnMjBnOWtkTlVhRHpPYUczVkJT?=
 =?utf-8?B?OXhYSDlQUXZydU85MzZGUUJPZk1URSt1aG52dThQaVhrZzRhR09BQ3RjYjVv?=
 =?utf-8?B?YlF0VmJWdmg0anYxU25jNEpQWCthbzIyYzJYQlYrVENxVmQyWkdmY2ZORDRx?=
 =?utf-8?B?aTA5T3A2S3NwN0tydmMxLzUzS2xwY0ZlVm9MdzJEQXBMc3hiWmdBcjloRXpz?=
 =?utf-8?B?d3NySXVTbWRhdnZaMFpvWENXRHlUL3hmM0xpNlJwU1I0UXovWTNiWUlkSnNx?=
 =?utf-8?B?S3U5ZlhzR2Viem1ZY2JMM2U5SFFKZGR4RFZxWGhRM3BQTzVWTEVVa3BJbjJn?=
 =?utf-8?B?dmg1Y2FyOEJPM2VNTHJ2bDhPZHZaeFFMQWo2OThqQkNPRVRUSXNzSzM0d01m?=
 =?utf-8?B?bEJ6WThQbU85VVNUeC9UdWducXVTVXJRb0hqN1RoRTA0RkRtNWJhWWhqcHVn?=
 =?utf-8?B?bjRwOElNSEV4L1dLK1k2TGZoa1U1NGRDc2hibzVXNEI3SUp0aE5yUStqZmJM?=
 =?utf-8?B?Q290WmVhZmw0RzVZbVh2cTdTTzNJS0thTzNKaUYwa3dLRy9DRzcyT1R4MEUx?=
 =?utf-8?B?bVh1K0NXUHczVXpkZlJuN0RRRXpKYWFjZWVOL2NOa1ZiN3hTalFWOGxBaUts?=
 =?utf-8?B?NjRZUXFGZVF0MjZYckpDODFyb1hxQXpOYVhOd1dOVnZneVVvU2NlTnh1QXlQ?=
 =?utf-8?B?cENPU2MzL24raUVBWHFhSi9ieEt5RWVkQWNndWhBSEtaNERrTWNwVGhjSS9t?=
 =?utf-8?B?OXFHdFVpeUx6ZTB0d1hxbm52anhOdzRyQjBodFMzZ2xTMFB4ZCtXS0VZeW0v?=
 =?utf-8?B?QnVGbXBpajdwaGF0MTk5QVN0WGdNUVpUbUFvS293WUN3d1NDTDVINTZvVjlM?=
 =?utf-8?B?M0xqUDhLNStJVm5vN2cvUHdKazJ0dkl0ZWs2LzhhUjdZdFBramRUZz09?=
Content-ID: <EFF2352D6A20F94D90242F8740EB3F7F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: STeBkx9Y1j0MWrKp5DWmzQKuckIMEvZVvuRN40JZqOyurjsyrGsVTxrKUHyajKRn+d/icDKvGBmTTpAZfcTu7LYErLJ1/uMJF+ruz5PzszcLyQi4hFw5pU+ujlREjb6a88Zt3FARxyiFdy94tcvmk9ibJrXuDrosUjVYrWHY3ClYmDcS8yknt4K4hviC+lZM809FERK2QohN7HNDdzeEWvXh7NZPlqXeyjwalfS6R1/Qbg77+Q7VLsuqyc8ohLf3dk2fZOCRzM//gi9XwSAf6VA7uNfnun5TXpW3wf3ImyJ1wAAl6Hr7kvbjIkzq57xPnIBExQFALVY7/2B0M0EEmw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0WwY06hpvEnw/ZTrp8doUgnBNgy4/JLnkwXQid2ts2rMOkE4NmQgCeNqukt8NaBuOa+2s99bmq9a+CKxaXt9DxvVVXARodHPPHkKuzKH9vCb8UTnC9tLcdibUCrdMWd1YM6rof/qpYq3shzpo9iNLVKPnbzunzuIlsZs8k5LUHQTuac4GQeqUXMq7Pef7ajDWgZyECBEwTRAMZECcePJd3T7wNK+LilvN6f5wcI5T7NECjfxmaNJI7Fhiieh5aB+C/VCUkt2/nbse+0+Yt5+jpsTp55E9eEQeBIx+UtlMGz43nhsRbcGqo/bvNuDNTTTE22nn1U6hCeb1gXVyyQ+ye3PkSeHrxj7WGKfY/RQFPGmmZSw3lrMHpnfheTDhiLAKx45vFWme0oAEKoN6upfl4d9JljrPUnZxp206omInXPdh5zB3nWOfEUeuKTosA6UViDU3SfE+sy0U+GV+GyHlDm5Xx1OsKLCv2UL4/T62lNUnyo56I2g74HaHZvvP93fBH3RxJJ+mMlxow8u1h5Qw/o171LuWkHQ15q/xn/wuaO3vPLqxC56pRL5cUtUF/QvaiUouBCKkWTYuLvchqiPO1NQkhPjSFKKkw78z1lbps/KtLnSjYjBLTvCcUJsveGY3Kh7HmJp49ZPJsZgeBmyqg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7651e1-499e-45fa-8aad-08de7a60f5f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 02:43:19.4787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E8vxE6vyUkEPO7Y7Djfk80lBF7seO80UK/xP4jmil7I/xEG9f8Mxb9dxMxbjAtGTibLBKttAsYXnse7e37Ni/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
X-Proofpoint-GUID: I8_piAzATCRcGyWl9AFd_njvTanz_ZSW
X-Proofpoint-ORIG-GUID: I8_piAzATCRcGyWl9AFd_njvTanz_ZSW
X-Authority-Analysis: v=2.4 cv=WrEm8Nfv c=1 sm=1 tr=0 ts=69a8edd2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8
 a=jIQo8A4GAAAA:8 a=4jXbIR6WmcaQWBQbZNIA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyMCBTYWx0ZWRfX5CxZ+HnnjQR6
 unQrpLVHFt7x3ub1wB1qMdtRoiNrxLxRBWvF12djGAM6oP0DhVnT8oSNgFBmpDti0HyHwZXx0zv
 6sm/r4+ImFkDcR74xGzIvzfbUsBPauzpKjweTI4YdIbHmySLV48ge+fd4tQxcjN4DIfam3U9bJo
 VvCquCGXg4iBk/5fFWlvsorpC52e+audszu5hgqTDXqVrPLcyMTcJdp8V8XZNOjsUSUW5/AWIFI
 Ps61E+6RU4WYiG6qdm/0cEt4PERAiOZO8rlk0OOLzJB953lgwyPwzCdsaRDua055TBk/eyU6uG4
 LmZUcHUdukm9rZbFuCwUrcEfcsgRUlO4tRg6hf6NAtbfxu5I6zKsZTJkQSZ0xATwDFl5oD2zTf7
 F4aucg7eUPGJQSeBLYTk7dcetutcFM6/ntY9DRUAYzDI/Ok2TxGWmqyvIlGlkoVX/iIHiMjHiTt
 iVA5kyYVn2XCDTZSqRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603050020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_184349_199506_56358166 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 04, 2026, Vladimir Oltean wrote:
> The chipidea ci_hdrc_imx driver uses regulator consumer API like
> regulator_enable() but does not include <linux/regulator/consumer.h>.
> 
> The core USB HCD driver calls invalidate_kernel_vmap_range() and
> flush_kernel_vmap_range(), but does not include <linux/highmem.h>.
> 
> The DWC3 gadget driver calls:
> - device_property_present()
> - device_property_count_u8()
> - device_property_read_u8_array()
> but does not include <linux/property.h>
> 
> The dwc3-generic-plat driver uses of_device_get_match_data() but does
> not include <linux/of.h>.
> 
> In all these cases, the necessary includes were still provided somehow,
> directly or indirectly, through <linux/phy/phy.h>. The latter header
> wants to drop those includes, so fill in the required headers to avoid
> any breakage.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c   | 1 +
>  drivers/usb/core/hcd.c               | 1 +
>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  drivers/usb/dwc3/gadget.c            | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 56d2ba824a0b..0a21d7cc5f5a 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -17,6 +17,7 @@
>  #include <linux/clk.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm_qos.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "ci.h"
>  #include "ci_hdrc_imx.h"
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index dee842ea6931..7a3261f72463 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <linux/bcd.h>
> +#include <linux/highmem.h>
>  #include <linux/module.h>
>  #include <linux/version.h>
>  #include <linux/kernel.h>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index e846844e0023..2ee1bb9d7199 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 0a688904ce8c..d06171af6870 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -10,6 +10,7 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/delay.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/platform_device.h>
> -- 
> 2.43.0
> 

For dwc3 related changes:

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Thanks,
Thinh
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
