Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E39C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 02:14:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39906121E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 02:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39906121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=USpmM4rZKsaJCajzqy/YJBI+KSo5lWKd5SJsxzZ7Tz8=; b=QXGGraOCMmUZxB
	w47tz7cefdl7x1CRPZ19xl6jH9G4HlbITNSU0ZLpTYSD5ncgG+6yUxIxPrw52IQRLUgHBB2fmcsU7
	Z8RuOiIrPLgwQ3YCZJH0FwX/xGytS0VFgBP/jv6aR72D+z6Ge9tVZxUNzGYhmaDxj1058bBf5ssmg
	TC/QcEzWqu91DysDrgyYQ0x3BlZmILirfIQKFI460keCmsO2RWJUu6av4Okh6fC//VbJFukYky7ID
	LppyQrHAHTx1krsBhNKkXdXKz2pjOM/lZHBA0vFERWw9USbY88KhwTTrLH87qZ6lox4kKR3jwDG/D
	qSk2RXNDddy39fk1Y9Pg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljugB-003Sq0-FM; Fri, 21 May 2021 02:14:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuY1-003QnS-IJ
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 02:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:Sender
 :Reply-To:Cc:Content-ID:Content-Description:In-Reply-To:References;
 bh=fUB8y9N0ugUUsyzUQ07MjA5UlGAZAMV27vSLK0RWFXc=; b=OXUI46Kr2gVVt+gTgsYsRiTXbd
 e/y/gAMSMPgTv7YjTL7SWPFoOkUF0Ta60HXFtC7CAf6mQE4e98zaCGwpL7oM8Eb8mvzXR0Oo7IJMY
 UQ5Rf/jjDv/T6Vl82pKN5uXY7Fgn2VGKrqY8SNdrGVSSc4SHLiroL1kjjwDCSEtsWyka704BZlOQQ
 6COSo/If3RVETbue5T6ls1jk/H/unvJd92op7Xi/lmBLY+x/WqW+Xp8e72KALRfwE9Ds1DZlGu1rz
 Sx25ehEdyr15D7Qoc8+5kKyht0yw0e3jxmR1Ig+FE3m30x6hkHqdsc5gb7ShCHiKqEl03to3PO7dh
 aFeoHFiQ==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuXx-00GlQb-Jk
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 02:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621562753; x=1653098753; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=fUB8y9N0ugUUsyzUQ07MjA5UlGAZAMV27vSLK0RWFXc=;
 b=k86RmTWQ2QSQAhYMgXhXjzAAxqV2pCa/sbipAUVIzG/RemeRGjhTbfoX
 Bx5j8g1yCCw1F31z0JMPXZr5Iu6K+uH10dN7RDqrIwtQ/ZxCQmrY7fhtf
 AJZ+uLLujQiau3GK5rAVprGQp4vUPR31wFJnoUe9ZN/ODLzBatOCYsFkL
 ChRSMOSFIMhDPONBiplOC3atsfuTIBar4dHegAhfsnPsSWxHJqiONmIoQ
 RLeu6Y1hwqoomOb2yd62UyJNZRaFa/F27G82mvWnAyZiW7vRJs6HWg0oX
 CWYUf99LLzxBlaxW1j8VbrMT+7zrF9/JcLyNvQhZ4R7Ms2tbqpiDdmnnd A==;
IronPort-SDR: UXh3CjmlEnTwTEigF6629NpVzJRlyYNr3r/X/xzxlTBLrZ9GCjMAZtz4vU+hay+lIDxH4PBu+e
 CPrp1uNHqVnpTTSOi3bu3xcbyNuEJfEW3A6n0hgguMd4Kyjbn9qVfAArpJv5cqdtNmnT+/pEJB
 S2o6ed6DkL1fwYRPYiveZPS5NJehltnBt56GIvGt1i6HlsvHlt0ERaIyG7IEfqok9fKnW5AjEg
 FYdjK5y5q95lItwA4gciA/ITU63TYopt7jaXcoJSKhwDRKpStGXWs1ikv+T08WpjWVSpdquMzO
 PQ0=
X-IronPort-AV: E=Sophos;i="5.82,313,1613404800"; d="scan'208";a="280189335"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hgst.iphmx.com with ESMTP; 21 May 2021 10:05:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSxuFqYw7fcB6WnOH3qiyWu9e1eAe6QMEAVmZcwaOOmQWE+vUEN2lp83uW7wchCZ0dfJNv18MByhRxjGFn/fCa6dHjYpktv9HTvA17r8IElC77o7I19UXIF7R/rF1Fy7qw0CXZLNlsOt765yWWRQFpISmzNldv+PqHZZjRcYgOjcCGLLJ9Keq+ErP9vK6Ls93vJ6Zu6tCtTXYHp6CVmTHecOPeiaZcdllorGvi9EUD/rVnFYxlrCD94IGxRUD5INJzzdboq0oU/D4wxsNBoFsZwVYYH7d5ImlfBpTywLwkKS/5WBe5z1az+V7m0wdpjyc/f8M7vK2HwqLZOafi0gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUB8y9N0ugUUsyzUQ07MjA5UlGAZAMV27vSLK0RWFXc=;
 b=CXxCbUE2JONN5tgWp+Ocp7S2fCg0ir2sfqJZch+1lX4ktjO6joYhwYP+DzWmXFT4/p7+HwzppFpFFUS+sbEqBtSOs4WY2SELPqp243qXJe968SZC6/p3U6OdhBBeZdXS7z/ZtMX9lk6+AIcNxuOfYXZH30ix/9NDtyD5QwC8qHIZL3ASgIvBl9RBc8sbN7W7KSUAJrRMAtaZqENHdxRBTXAQKYKLW70LGMOlaQUKK+iEq1bcqr7spfuPUOsBjs+72YqKASWR1IOaeHoO0jf8n/5IabvUgWAn72Ne3d7UZSkiped3Zh4ouuFgT6PeUyQXO921mIFb08Qi71IzDNvW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUB8y9N0ugUUsyzUQ07MjA5UlGAZAMV27vSLK0RWFXc=;
 b=wm+90w6LPurL9r55aOga4aV+gKgw5pZkSA3No94lTlgfawcRyVZWurdugbwc85CbEPBS+6IY/KGbeOf7UdgAsEWR5cSHiqqvRSITenvJjbIgZoBKebLGj6YUug4d5djOd972vn+uIHMEwsnv734NoWSwczgN+uByyQqGgYpmq78=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR04MB1005.namprd04.prod.outlook.com (2603:10b6:4:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 02:05:48 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::64f9:51d2:1e04:f806%9]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 02:05:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt
 <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: arch/riscv/staging
Thread-Topic: arch/riscv/staging
Thread-Index: AQHXTeXRiqrAsGq9/0GkDSZAPwkNlQ==
Date: Fri, 21 May 2021 02:05:48 +0000
Message-ID: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1da4:199d:bd7:5694]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 811d453a-fb06-497b-6229-08d91bfcf409
x-ms-traffictypediagnostic: DM5PR04MB1005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR04MB100546F66C99D4C8BF9618A1E7299@DM5PR04MB1005.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9oNNhBkWrO9vaHm7bKSwSwYR19K053LWT9hH3v2zlUduBGjZuvPU0ki8oWziYDacAT/LWJyMWL/xiM7VOis6ENXt6qmZXVUIDW9SaWHhHVg37TBmy3T+bBn9UaRyN8xi0PlNbsdF82KqFgEgMNOPA+1APNN0GYBfWOMZLj9o+qAr5ghAV5QNLzQs9puOFms47d0IhDlNujnwAdbQw749GNDCcBxNTBGub9j9UA3Amvey9RdVbHMZh7qor5xPsUpVU6J9luYkBL3qTQhOJQ3dw3dXfiawFZ27c2FkuMhVhduUv5LEgbBicIBioeijKf2Fdp239nrz8sTBhRNqqTkKmpzlduD02pnDxWciPPmwYyc2oH7Cc4Lbz6524tHgdxneCkj6IUpWi1ENsFWweA+IgS9dC32csOv6otV151ALS+QhfjLFHOuVmAkFMAyIdUa+YM/VVe57wUvJtPnTTovYozNBwek0LyZv1hz8EEih0ion2GQXZPEsLjPBzX2Y0uzVgh0pDx2s/qpNxACUX0gGs0XgEHmYyGZaQvdzT8p+zow1JfXhN1yZX4eZnBGPlMRzZBgVpBaSMwutXJbzBlcq+6kA+tQO2L1ta1evwTG4LwY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(6506007)(66946007)(66476007)(7696005)(66556008)(64756008)(3480700007)(122000001)(76116006)(66446008)(186003)(8676002)(478600001)(9686003)(8936002)(91956017)(83380400001)(71200400001)(55016002)(38100700002)(316002)(2906002)(5660300002)(110136005)(52536014)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GI4ykn2wNEb66mQyJFdLRWUWo7hWP65u3S4CPiMt6HHCwKsbpo7iF5BB9KXh?=
 =?us-ascii?Q?XzEqXehu0tKv0ZDBBeadV9PoaDB+IZDDW+IzDIKy48YOpW9nLgjdgmRElH39?=
 =?us-ascii?Q?wAIHeWFKKf8Ee4Njxl0LT0HxzcVd7hMRsYzEZPQoxzI3SJOHw/m7FvXY86pD?=
 =?us-ascii?Q?0ytrtuZMrJRcVu+pPsSSHsOM3mMGNHhk1WXjFeGUqsnv1eeEPOznRAcf6B3N?=
 =?us-ascii?Q?g5kE1EkBzYC2AJh4OQvvkky0xhBS4uUHwdKL8xlCEvqfz0M6ZSlSXdiISv2D?=
 =?us-ascii?Q?lwAd4lYubo5SHLpTQrNDAEcK8zv8WomJOE99WEk+JnpAcbbwTnkCqnMrkia1?=
 =?us-ascii?Q?ss/7TQivWNjNnt0oHYkKPdnWzDNP1YWE+b126pbKmbGSUf9R6PwDwvpHrvd/?=
 =?us-ascii?Q?mazu6xmxLWI+QIp8Q2j2eOh/1e4EaDOOuPfZB2LhVmuhsZ0KqqTmjFgMpiWc?=
 =?us-ascii?Q?mmwndh1toC/PUNaU4v73CkQBbFPdYfsgmnNv1KYnmO6wgf2VV85zculkCMxz?=
 =?us-ascii?Q?EQVC/GKEUkyxj2khPzdIfckcESVzRah4U/MQUpPvVqfgQXYwdederLiNJJ4M?=
 =?us-ascii?Q?P3IWjZPW5Q9EMvfnMMbMlHKAiE3hkI6ymcgn0avBvDAr9pqKFyzC4GWpKAmR?=
 =?us-ascii?Q?wXhXdojP9s7hXKFrexhmlAM6M49DwzJ1gRZ6FuXbXTKFJKC1RvMn9xS7MPe0?=
 =?us-ascii?Q?oec3Fl7QpcfRgsznl0jNGHX1hoNqbC2vYuUXmntuRZGWFk6bOTtAD28RSssh?=
 =?us-ascii?Q?q6bUdd0kdMqJfhkJW3Rx80fg2emt6TevbO5M5cuHX1iuijsuR3GyFvhzimkY?=
 =?us-ascii?Q?IlRmS1Pg1QgDFuA4iMvlUCdib/zDXFmYb6L0Ic7aoaoxSyF0ushcIe1DCfkE?=
 =?us-ascii?Q?SmGuab4j+GJ+RvQjfTK86TMa4y8SKp9iShUddQC1+xklw7KP3esowm7c3/GI?=
 =?us-ascii?Q?fv8ER71gVQBry9Hn09NqdwbVaoWtrQtlNxKWdwQmJ5iB0ni/m860HSBSrNRi?=
 =?us-ascii?Q?DKMw7yfCw8ulUDSIi1gNwAI7rNI3fwfYtIdpENxOzna8XTjE8Ecnqjlqw1ZZ?=
 =?us-ascii?Q?mTU2w5EOQuNOPIlZeHbDBtSakuFBlRpDzEXgrr5h8vcCuVsXk9pGzjTjLU3y?=
 =?us-ascii?Q?Z+u7AqqGMeR1BDWu0sVzx/HF/N3VP7Bcmsp31pqLpNn26H9NWqWwf71kCkCb?=
 =?us-ascii?Q?izPp6CORHfo1p2Ajtnfa64uh9WkYXEJLgkCpu4AkmVeh4Je2/7d9vMF2e4mg?=
 =?us-ascii?Q?4y4nfxYPyWvBmJxjbFF0ETP1TIwPb23OWqmh8U08S5NhSYJ7UpmZmhC0/gYJ?=
 =?us-ascii?Q?EKftWXk/slv5+PKi4yxXhfoYyZWHKDXQsAvnTZKXCwSS2ZMDx/ZQ+5/BuEtE?=
 =?us-ascii?Q?sIMb0DaiEj3P5qSjhleeMk0c82p7smhp14OozO2zURtMvrIN+Q=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811d453a-fb06-497b-6229-08d91bfcf409
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 02:05:48.7728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6jN01y5GK0p0H+vHpzS3bLIxptNp4dUFbh4MXzGS9+SxdjOiHjrmPHNmDgSp0jG5NUgDaCptvkLeHkvjW8DSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_190554_557271_3F1AA8E3 
X-CRM114-Status: GOOD (  12.29  )
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
