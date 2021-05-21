Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B321C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 04:26:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1AB60FE5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 04:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1AB60FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=gBYgdZ6CJTsg9e23ClJxqkDzgeP/p3klqpxsCyhfiYs=; b=SUUds/xyNtVuj5YEmggI+NVDaO
	Udpvd5p8VrFsmvWXDgvBToJ50fjHBmFsqIoYL66Uc600L1xxGqZHA5aQCPzE7MvzF9wP24eHbEvck
	AmVVCqGen7uDWCdyrqMMgY+21BSij5SUWMwXwj1lt145z6GO+Vf6Z8WiQpczZgDRP8PE/eOi5SjN0
	V+M1ax5SVuILcYQ+TcWwtcZjqIQmN/e6mwoQVt5t19qBiTEXgfCObWjA95zxi+SXMProwrBzsb7zM
	6HwdlKj2QdYM1z0ZXzM2cAk4tddgBDgYe/5GFSPY/orSZ0kLsudtKVr63N/3CgpP1hqxc2SZU0bPS
	LSGtJeqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljwjj-003kmh-DR; Fri, 21 May 2021 04:26:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuaj-003RUT-Rg
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 02:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
 bh=PNuJEzXHH2jKfQWv7UsxpJDKxu0scU4XvMxPViHK+GQ=; b=L0FPRwv27iwRqUa//NECoCgWd/
 w9MMxeIt6qcDb1TXPFHqRqNGtMNyKFW579xh4StcexS7+yuFdCZWHC1+mo/pavx0zwx062g6j+pRK
 JpoBiLeQr5X/na7rq5XJBZtzq4JFQpREf8VZnlk7H0lqQWvcybih2ZYbKUEkeIDqByQ+psMp3TxDL
 mQWMTPPyHmm5R4Qm8Sy0OWvxxPxiatj6sT0XycMZaF18wOwd13M63/GcyAR9E/Urb67KCnm3fYV/h
 C8LjfEDfOPDJ0FthCX0j3HH1ewIb7/3Ow/0+7ShfD/mqdT869KuHlXsckmmeoVods1WhysYbGi4WR
 ImzLnkgA==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuah-00GlUB-3f
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 02:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621562939; x=1653098939;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=PNuJEzXHH2jKfQWv7UsxpJDKxu0scU4XvMxPViHK+GQ=;
 b=aCzSrDPx2HWG2aGIFF02aCJcC+JK9B8BnYz4kU0+DINoWH+uYxrXJDzu
 yVTkhP92dcwo51BLWyWpWcF/8LrxjHCQJarYmo4sx4OeoKxp+/MYsWVt6
 47bf12YZZEjJ6Jet98Lmh1zPqEYAZAnwbJpWZ9chGyi4R+xj5ai8FWt5U
 2k97Eb6ufk9aRTp0TWYBxmefQN+UsUU1yQlI6N71xBFVSkDQk3xSJu1Wd
 bDvkvQ60PsNsyjtTwdQE+YLBl2O5pBW81n7dtxRXL3kNZnyYqTav+KJ2U
 wpbap361TsH9PwkRZuRwaOAXrL4j8xSH0k8sUEAqwh1A9BbbD2i3ZgIYo w==;
IronPort-SDR: GSbpHfYfxZ9f+KGltGbPPFEcn/J1fgDU0rUjwr4TQCE80cCrc2F4QH0OXPy/XAslma0OuTjrET
 HYrVWGIcaFIsnBrPQ3eExkM/U0KNbWg3TYkHIj478U9ZREt2HbMR49PS3mnP8K4khhYNQg5iG8
 QruWvfbiKq6Y6hmNsFLOLeS+RagB0Mmw+y91gK8q08oK7Xo+L2oXwC6Dny7XmINDdct211y9bp
 oCdsvm4CM1F4PCCeGL4qrpAX2vsXoVKIM6uFBuUO+GCj9Glvh6dqU7hWUy79I/QQ9KBdP8PP6Z
 0IM=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="272867287"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hgst.iphmx.com with ESMTP; 21 May 2021 10:08:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4F49LP1XiI17rnAom6jjfha0SLPoKafAqCQXNkMDZ0FKQMoqYmUjkVFpXkbrArYdQLzbmsaCCl3CEbFp0Bft3i7Z7GQByOiq0jkZYMjQd0HFhQk+Wm1IaeMD75cAK9iUOMiB5+1xJRMkc1I8PHxLWJ3SpLkap9nbZgp3v9np+I6JsZ9uiWO2H2k/pCxLtz1j36paHKPZf2zyYxMyTvTj5uNbsroga56XLITOezcZfxzyn2dDUbCYIHNHRfPpy4BIeUL1AnWabZkGoDRnmw1x2Z252khZffEv0hasJoO0nRzwJaA/MvjOqnotAjEiqXaCR7Y4/5yOpOHXXYjMEoB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNuJEzXHH2jKfQWv7UsxpJDKxu0scU4XvMxPViHK+GQ=;
 b=GeKP+h3Sfp2/UmtgbrCgQAUFWzw0kSMgGv8uXc5rAyYgVxozLwnJ9E3NxvVZdiNz+2y9Ymql2IaZQ97XWukLFhNzfTUfrQAy9wXUKd7C7IInK1wfApXn8wtOeXg2qyK7Z4Q3bVgY7uEaAipXGH8Hu2wC/+iICiXXY7FMZ0KB709xZDUgJ6o014lj8vaYI+THANd1SDmfMb6ApXCWf8UrSF8aVAGq8ozb7W1Tq/Nu8D3zpW2JMyHYMGP3dBfgmQb/+i+XwvaLTW+5jA9Vmw8xrB4kscvyk+KbDIBSnRfmc8DUUA+1dGiunlVlzmUgGZSp1uRynNfZ6o+ziN6TuKYD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNuJEzXHH2jKfQWv7UsxpJDKxu0scU4XvMxPViHK+GQ=;
 b=u5k6BXi4v05hIi2bYqivYDhEe991ruvMW8WmFz+JvmurUdg/P4DXI7RIeRZoslfs59n3UV92Iu4xpMA9NGz1uve0wTC+VVlo/2gbjL4VehL5UtOFLjVo/KHvO+AHB+2gG3KIg8zxecGowrCDsW+002oN6Om/swqJ5HS4vNudbc0=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR04MB1005.namprd04.prod.outlook.com (2603:10b6:4:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 02:08:37 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 02:08:37 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel
 <Anup.Patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
Subject: arch/riscv/staging
Thread-Topic: arch/riscv/staging
Thread-Index: AQHXTeXRiqrAsGq9/0GkDSZAPwkNlQ==
Date: Fri, 21 May 2021 02:08:37 +0000
Message-ID: <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1da4:199d:bd7:5694]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3158db27-8974-44f3-c91d-08d91bfd585c
x-ms-traffictypediagnostic: DM5PR04MB1005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR04MB1005AE126DB831559423BFA1E7299@DM5PR04MB1005.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ggOXvv280Qz2JSASSl7xcv/AB6VrKeL4oGyorEYk5OFqgRMNKEQYNqm7INkboYT2070jY3gVFukJGlBD2lLtW9C4fpn7LCz57ezfUHf9USTh3OGMtbYhJzgmKbm9hp/dgzzHSMJvZDt4TmYFtc64C66OGTxAkDH3BzPrkFxYf8ov1oKO/1upEj6YW3GFHo96JR7r/ukraktOvNn90X0Qzy+vr10DTDXgbXB04xI0vUwkmFixsz1OrIvrbT/fashSZgCOsXVMcBTYPjivKX7wX2X7zc73N3X33YUXKN8zCMFwHc/TVqUeoFj++7dO7MxkOXfMpczguFHRMrimyonBQFrMI8BAQSb96u4vrLBmD4kRKJAOLLQ3/v6/6oz9heVmcmwHogv1NCpptpv2zqVA+0oJ8eDE+i+lfV+rq1KrFjAzFt7eLq0dgQKK1zwECUfAtZABq4uGc5eWLIc6Gj+bJ9q4g70hgSc6Nd6KwhRqWTqzfMWeeodX5hAaSYlYATekxlbYFzwts/de2LbJ+FlQYe7Kth1wTUCJVPQaj2KejeOaXV9l0n2kXcfcKl06QdYXzdhJ4SX4rUQTlRlOUZS1Pv0JX/uUbaDN+3V4uxG0n5I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(5660300002)(110136005)(38100700002)(2906002)(316002)(33656002)(86362001)(52536014)(4326008)(66556008)(64756008)(3480700007)(122000001)(7696005)(66446008)(76116006)(186003)(6506007)(8676002)(66946007)(66476007)(91956017)(55016002)(83380400001)(71200400001)(478600001)(9686003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/EeyFxYmEUGHkKqDGnQMksQLTkSg5RTmSeqtnzvoxW56RK68Ns8ccSev7l3J?=
 =?us-ascii?Q?NIEXtNLaKKDG996EsBGKhmCemcqg+p3P5yMcHT3e+Kw7M97EuWsmcskxlGV3?=
 =?us-ascii?Q?w8nsX5AgS8ti8NnqYab+g//FckNEkO79uP0ZiASiQFH6Uf5VB+mpGRqf4hZq?=
 =?us-ascii?Q?vEw+ieluoB9eeIvFk1XaUm3OscaPSiAGBu/LwLJIDGeCIb1NeMKYH/e0+7wv?=
 =?us-ascii?Q?BuoIiJok45RKL23Vmj9/il7cJLIYAXeelYOQicZwGa6l3JT6zF3LwdWi9ETN?=
 =?us-ascii?Q?KU/kNLgTF2B2DQASKF2k33tNFq5+FWGaNzUeAw3ZfY1DX/xKSTJAmDkGk/MF?=
 =?us-ascii?Q?HxegVOPRcUew5GobHHxynzGcIws4kjaCcOIB31zOzQ/wGl0la5rf7/c4lAm4?=
 =?us-ascii?Q?rTRWQ6nMFkzWOo5RYCtxTgR/gE1MU2LqfPUfSeCOb9IdaDBUo2XTO1vwpGEi?=
 =?us-ascii?Q?xbgWyupWkIpwKsYDSWl65gb6V0aWZitHrt9QMn2huq7dYk3/cMXH5Ln+biic?=
 =?us-ascii?Q?LrKpnREvl4nwNh3BqBb9QW/gPu0uedsYxjebHHux//hCdnizruq4J+YXsD1p?=
 =?us-ascii?Q?12EghIdn80NRVVjXrkUaeEJJdb6KUviVrm7zE+b3UrbUj2T/cg5KY2663aMF?=
 =?us-ascii?Q?fHMobFDKJiwQImQRZiYRAw6/P+wlwVbVBQIsEXAKVKqyc8VO+HIHKjYaaVcd?=
 =?us-ascii?Q?VVSfuWmn6EEWcY7TN7EGXJG1d/FM0SS5mBH2CLoBPyFNHdZwgenXy3fwkIvI?=
 =?us-ascii?Q?yiwfZQkEtUJ8fL7cRYJmhT41N0uORfW0Q9qtsN94vY+FpBZfqh5yc/UnSf1V?=
 =?us-ascii?Q?pJoc6xzyUZmNjCzGTzt0pFHmUISntCn5OuAdV2Nite6lkoWiIoewnWCTymNa?=
 =?us-ascii?Q?UDM5/u0sj1fWV6Aa5t0Ae2RnFlRRfgWhD08iurQ4Cq61W3RtyTUrWOWByaCe?=
 =?us-ascii?Q?dcFy4JCdp4Spc9ZK2UQ4Gh42XrX6waxgSOpkt5Ji9yHmRsE+JIU0D5vKhdgq?=
 =?us-ascii?Q?yzCTMoP0M4z/4Y+JdW9xitFPdqZH2DWGyndFkoE0zAOAb/e3cn1TGSVwbQvH?=
 =?us-ascii?Q?3A6o33u8bMQjlhJjOkEtFvi603uWtZsnlF0uTMUwGpXToGSIfqkUqaxfeeAW?=
 =?us-ascii?Q?NPeApU6CthsHfAhUrHzA2idTKfCRYWF76akBvnfbVxa8PJOE2FpWCF/8jZ+A?=
 =?us-ascii?Q?6nB8+6/8MzPlYQcnTAVaFJq1dxZQAEqVMpy06S/SGasn3R1vHxXeBYKTx0gb?=
 =?us-ascii?Q?DbcG5XcUFG9gBzenwRM4juw1V9/7of6/lsX9eyDZOATFPI4H/9etNUo1a3rZ?=
 =?us-ascii?Q?uf4qgMnQeD6YY8WQmejn161xM+ti8Obq1qwEPar7ZoeS8As/gzd2ThB2zWh2?=
 =?us-ascii?Q?h5i8Gh+xADXPjvEzY4Ae/NQ0fZZZlcZZqRGuOu9PnpI1HyV4hg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3158db27-8974-44f3-c91d-08d91bfd585c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 02:08:37.1109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6REWZUJprzoHwsr1TAzASRA6vI6cEz5nrL4kP6IRXI8RsXvVfvxRBOlzDFRC7qS99Z6JFWhJ/kCCO0nwBKBZAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1005
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_190843_239837_CCD69784 
X-CRM114-Status: GOOD (  12.71  )
X-Mailman-Approved-At: Fri, 21 May 2021 05:26:07 +0100
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

[resending, I used Palmer's old email address]

Palmer,

I hope you are doing well. It would be great if you could be more active on the
list and share your views about the current situation regarding
unreasonably-late specification freezing and kernel patch acceptance policy.

For the hypervisor extension and KVM support, the specifications are now very
stable and while changes due to the advanced interrupt controller specs work,
among other, are still possible, the changes will likely be small and should not
cause much headache in the kernel. Given that there is already HW (and QEMU)
supporting H extension, we really need to move forward with merging riscv KVM
support. That will reduce the risk of seeing forks pop out here and there and
greatly facilitate Paolo and Anup work.

For this, I propose that we create arch/riscv/staging as a temporary location
for on-going work for supporting ISA extensions that are being drafted but not
yet frozen. That will allow the community to share a common code base for the
support code, and also allow more eyes to look at the extension themselves.
This way we can both facilitate and accelerate riscv ecosystem development while
also speeding up the specification work by providing constant feedback.

If managing this staging ground is too much work for you, I am sure that Anup
could handle it as a sub-maintainer.

Thoughts ?

Note: this needs a resolution ASAP. So please respond.

Best regards.



-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
