Return-Path: <SRS0=huAv=DA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D40C2D0A8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 17:30:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D842053B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2020 17:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="brzBQYAy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="PRnh0VkE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D842053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KMgJPUpL2jDcWKx8OlJ9uwnS6qFxtBmEbNNzFXK/wy8=; b=brzBQYAyGGnCjd7608NQv/RfJ
	zIl9w6Ql7t6AwMSjd7eyFOEQY1ms+78Nsqm5QKSxMMueOGzTYaaSMa2BV6gmaSkFDXsp6V5i/0f+2
	znm/xyanRO9OKiTiaFKw6pVLgy+iMs5DKtkqIcBAFFetbmKMxUyheU3/A6dus3Io5MCGb4plRr9wq
	wVn8s3hMut4dGfDL9cjhuaVMf7BADUZBqZYbJNpQJlRDcsbYbM3jM3qxIN3yHcZZQrVGHtj2pCk0z
	MLWxjLy2sIW6i60TW5Qhko655w6Ph8UiFUxbTgVCVcsk7sBopdYdjq1Bz661kszDt5WqVrkWY3jtg
	rQsXSecmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL8b5-0003Io-9m; Wed, 23 Sep 2020 17:30:27 +0000
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com
 ([40.107.236.87] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL8b3-0003I7-Ch
 for linux-riscv@lists.infradead.org; Wed, 23 Sep 2020 17:30:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPnLDsQ5gE0kcyrgPglQMe9Z6JuvItbV7ZBpAJq+pN4gCSsIMKydM2YzGD0dDR+crE+Tkwup4pD1SFphXJQeHhKmB1VBM3fGvXOKX9AU8mCqykCMJJohGPBZSa0ETdKGSzK6uj4dT6kJa/Xhwyl/r+YnVAOpI0f8+Br1p/rkJ3FcqQQbe/wM3FYJ/X4X3w5PC+J1yfc6pxnTtxlYYdcJ1latQMT95HaEnKPyOObVUci27BPafv5F7kc8wj+9NQjYyj5KgDv23yxjs1M2EP0nCsFuux+En1Db4IG+Pxegnj3te0BDyS3EkO5o9fqhRIymzliVBwE5WNDeN0OHvZMsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5R/xAuTWL2Kx6GJKJt2Y1MXmOoDoymrmWhj4jMXTq0=;
 b=GOAfTW0XN+ta78bHTH+EIi/fy3UXO6zrH0NzwKYH52YNm7kLoTxhAxUe28ABVVE2ztGUeuhQFSAVYvFwrRrd22D4rvuniAVWJGOsPS6nbOSC7/EDN1QRpEjgKrJLK9HO2hamfv/AJFM+xNrtYYBcGfeOAYuwkjyBK9ouY09dJ4zyYddpR7iGg4Tk/s7aOD19r5HkOi4YQB7ykwhPvMVMBPwCqeyFW9SRGHIvSTajYd9A6mf6qxYnifngAcfZ30aMQsO3G503xo6xmrlYF1A+zp9FmZI+Vz4ldFTEH2DT8OJgvKGYYHy0ZUoT1MoGkNNWv0on9Jq+ep0jO+3SRvnlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5R/xAuTWL2Kx6GJKJt2Y1MXmOoDoymrmWhj4jMXTq0=;
 b=PRnh0VkEcBqL98uBE+asBZMUYUt2fHxNLySgHtNSssWjl6t8alJSN7EQLtaYzCkqf/u3IUWXRKbW7F9DzOV07hlkwrUbNjhsS7KLwfZ7x5/0B/azHsJrEacYz6NUQnyAtc6UWurv9PvWZSRy0ByP6pqp8QP+mtSyhzhFSkfo9LI=
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB3034.namprd13.prod.outlook.com (2603:10b6:5:195::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.10; Wed, 23 Sep
 2020 17:30:18 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3433.013; Wed, 23 Sep 2020
 17:30:18 +0000
From: Sagar Kadam <sagar.kadam@openfive.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache:
 convert bindings to json-schema
Thread-Topic: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache:
 convert bindings to json-schema
Thread-Index: AQHWfVwv7/G+kdFYjkmHoBtHJ2osZKlohwEAgACr26CAC/8xgIABb4zQ
Date: Wed, 23 Sep 2020 17:30:18 +0000
Message-ID: <DM6PR13MB34515293443119FDCD266A3B97380@DM6PR13MB3451.namprd13.prod.outlook.com>
References: <1598633743-1023-1-git-send-email-sagar.kadam@sifive.com>
 <1598633743-1023-2-git-send-email-sagar.kadam@sifive.com>
 <20200914180000.GA4136408@bogus>
 <DM6PR13MB3451786E8B73D50D36A89FD097200@DM6PR13MB3451.namprd13.prod.outlook.com>
 <CAL_Jsq+4i-zq1Ro90h6XEbwhyqWKKj+MQ5KW6U-qFSViWh3SNA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+4i-zq1Ro90h6XEbwhyqWKKj+MQ5KW6U-qFSViWh3SNA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [116.74.150.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e7c821d-6e25-4426-d006-08d85fe65750
x-ms-traffictypediagnostic: DM6PR13MB3034:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR13MB30347D6A77757A57F10D7F7797380@DM6PR13MB3034.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCwnLvU910ZntrbKhFoKrPhpE/ktILENnca22DEkVPwtvg3DZpYz/3CICebrC2nBst0UCA1ZrdmFLy9NLUt5sgYNEz/ATlm8nSYBfmkbp70D1x/YeRqfvzLrVMybRFxxgzyo+kRLHDrA0G8eg8b8Wqd9Conauodleu1Mw/C5WK0TWzTDJicKGFEloZ3x4X0C+mYiCKQ6dt8fYXLjhqQjN9x96Ur5IyMWM+aqaUwG9A+3IlXy1Y1AQEN+UtgVIjRYNrkr/Vxq6t6kDAO/nr6boIdk6K3N+fEKYvqlnjBUo/GxUHukp570ys+Vi5rK8hOUJYTckXMRqVaNilIyrVKeFLZSrmWGDLAQn5oVu6C71kYzOqfiKcvaazOWDcNDbf53k0nPl8gzr+8U+IyL3NWTvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39850400004)(136003)(376002)(4326008)(52536014)(8676002)(54906003)(76116006)(86362001)(8936002)(107886003)(2906002)(66446008)(55236004)(186003)(64756008)(316002)(7696005)(44832011)(66946007)(5660300002)(66556008)(66476007)(6506007)(53546011)(478600001)(966005)(33656002)(71200400001)(26005)(6916009)(83380400001)(9686003)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zlur1CJ9Z5OZDpuj03HY6gUxscOO1CskiR4WycI2EQMrQkCoBK3MuwJVPQFAN7WjLSubhSRBtEDDWrDeQyyKoZbNFy3CnZ47PcjR09NmsMosHppzCF0rE1N34X5ofIvLWmIxGwOQ2QoQF90DrQG/6mehD3Ei8uK6MoEvEYKrK9FTR9zFGL9FzfbZSwP4fQYcBiXWkStwN1BUkKx4ZpQ/kjH6IDUwkMWy08RPPCgtbXi2Obi5K5i0Dq9Odh9UuQ1iswGeonhlXpXqIlK6lHszw5zDU1r4dO+ijKg410aAAlz+vuODXqwTBL5h5djvYyrCUYLQjImDeQs+tY3AwwVK7lAtVIfOQt7nE30/+3K6NtVe9IQFzpWsEhHCsATKQorJ/9y41eBVNWHG3fc9gRVabxQgG0dH9aOx07L3PDrYElgeesWoKDI2/Ce8ivyYBlNFCtuQC2lnkJ7tZCTg+jWq87fhB63qHIw5XJkHJzwuzkXITEsQEomKM+2VfXWEDvxbnI2dDTJBQHdywB33+vghgLXl8sWBgXCih7DlWKrpNZwVZplQkKoJihbrQ8jegioEPZUIgRk+9lOuwVHMmnUGa6hS+LWJyaOODnIpxihHC1KklXcJsRXuAmg2ZxONdAu7jNwP4a828DjDWHKGpE3ZvQ==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7c821d-6e25-4426-d006-08d85fe65750
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 17:30:18.3856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cV5BvrHIE5IiTwpnxbOs7RtYWTN5irpn10oJmlmpuz1FJJtETlhblzvU13Pt7yHjfON+oN9byf+jM6qwagw3/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_133025_472725_8357E31B 
X-CRM114-Status: GOOD (  31.13  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@openfive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Rob,

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, September 23, 2020 12:57 AM
> To: Sagar Kadam <sagar.kadam@openfive.com>
> Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
> devicetree@vger.kernel.org; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; Yash Shah <yash.shah@openfive.com>
> Subject: Re: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache: convert
> bindings to json-schema
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Tue, Sep 15, 2020 at 9:17 AM Sagar Kadam
> <sagar.kadam@openfive.com> wrote:
> >
> > Hello Rob,
> >
> > > -----Original Message-----
> > > From: Rob Herring <robh@kernel.org>
> > > Sent: Monday, September 14, 2020 11:30 PM
> > > To: Sagar Kadam <sagar.kadam@openfive.com>
> > > Cc: linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
> > > devicetree@vger.kernel.org; Paul Walmsley ( Sifive)
> > > <paul.walmsley@sifive.com>; palmer@dabbelt.com;
> > > aou@eecs.berkeley.edu; Yash Shah <yash.shah@openfive.com>
> > > Subject: Re: [RESEND PATCH v2 1/1] dt-bindings: riscv: sifive-l2-cache:
> > > convert bindings to json-schema
> > >
> > > [External Email] Do not click links or attachments unless you recognize the
> > > sender and know the content is safe
> > >
> > > On Fri, Aug 28, 2020 at 10:25:43PM +0530, Sagar Kadam wrote:
> > > > Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2
> > > Cache
> > > > controller to YAML format.
> > > >
> > > > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
> > > >  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 92
> > > ++++++++++++++++++++++
> > > >  2 files changed, 92 insertions(+), 51 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-
> l2-
> > > cache.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-
> l2-
> > > cache.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > deleted file mode 100644
> > > > index 73d8f19..0000000
> > > > --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > > > +++ /dev/null
> > > > @@ -1,51 +0,0 @@
> > > > -SiFive L2 Cache Controller
> > > > ---------------------------
> > > > -The SiFive Level 2 Cache Controller is used to provide access to fast
> > > copies
> > > > -of memory for masters in a Core Complex. The Level 2 Cache
> Controller
> > > also
> > > > -acts as directory-based coherency manager.
> > > > -All the properties in ePAPR/DeviceTree specification applies for this
> > > platform
> > > > -
> > > > -Required Properties:
> > > > ---------------------
> > > > -- compatible: Should be "sifive,fu540-c000-ccache" and "cache"
> > > > -
> > > > -- cache-block-size: Specifies the block size in bytes of the cache.
> > > > -  Should be 64
> > > > -
> > > > -- cache-level: Should be set to 2 for a level 2 cache
> > > > -
> > > > -- cache-sets: Specifies the number of associativity sets of the cache.
> > > > -  Should be 1024
> > > > -
> > > > -- cache-size: Specifies the size in bytes of the cache. Should be 2097152
> > > > -
> > > > -- cache-unified: Specifies the cache is a unified cache
> > > > -
> > > > -- interrupts: Must contain 3 entries (DirError, DataError and DataFail
> > > signals)
> > > > -
> > > > -- reg: Physical base address and size of L2 cache controller registers
> map
> > > > -
> > > > -Optional Properties:
> > > > ---------------------
> > > > -- next-level-cache: phandle to the next level cache if present.
> > > > -
> > > > -- memory-region: reference to the reserved-memory for the L2 Loosely
> > > Integrated
> > > > -  Memory region. The reserved memory node should be defined as per
> > > the bindings
> > > > -  in reserved-memory.txt
> > > > -
> > > > -
> > > > -Example:
> > > > -
> > > > -     cache-controller@2010000 {
> > > > -             compatible = "sifive,fu540-c000-ccache", "cache";
> > > > -             cache-block-size = <64>;
> > > > -             cache-level = <2>;
> > > > -             cache-sets = <1024>;
> > > > -             cache-size = <2097152>;
> > > > -             cache-unified;
> > > > -             interrupt-parent = <&plic0>;
> > > > -             interrupts = <1 2 3>;
> > > > -             reg = <0x0 0x2010000 0x0 0x1000>;
> > > > -             next-level-cache = <&L25 &L40 &L36>;
> > > > -             memory-region = <&l2_lim>;
> > > > -     };
> > > > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-
> cache.yaml
> > > b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > > new file mode 100644
> > > > index 0000000..e14c8c6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > > @@ -0,0 +1,92 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +# Copyright (C) 2020 SiFive, Inc.
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: SiFive L2 Cache Controller
> > > > +
> > > > +maintainers:
> > > > +  - Sagar Kadam <sagar.kadam@sifive.com>
> > > > +  - Yash Shah <yash.shah@sifive.com>
> > > > +  - Paul Walmsley  <paul.walmsley@sifive.com>
> > > > +
> > > > +description:
> > > > +  The SiFive Level 2 Cache Controller is used to provide access to fast
> > > copies
> > > > +  of memory for masters in a Core Complex. The Level 2 Cache
> Controller
> > > also
> > > > +  acts as directory-based coherency manager.
> > > > +  All the properties in ePAPR/DeviceTree specification applies for this
> > > platform.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/cache-controller.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +     - enum:
> > > > +        - sifive,fu540-c000-ccache
> > > > +    description: |
> > > > +      Should have "sifive,<soc>-cache" and "cache".
> > >
> > > That's not what the schema describes or the example has (the 'cache'
> > > fallback).
> > >
> > Thanks for your suggestions.
> > I see that if we include the standard 'cache' property here, it injects  error's
> in other yaml's as reported here [1]
> > In plain txt format of this binding the standard "cache" property is
> mentioned to be also included along with soc specific compatible string.
> >
> > Please correct me if I am wrong here:
> > So in order to retain the earlier description as Should have "sifive,<soc>-
> cache" and "cache",  I excluded "cache" property from example
> > as I assumed it is implied for cacheinfo infrastructure to work properly.
> > I will retain the earlier description (from.txt) which was "sifive,fu540-c000-
> ccache" and "cache"
> 
> You will need a custom 'select' schema to only match on
> "sifive,fu540-c000-ccache". There's numerous examples in the tree.
> 
> Rob
Thanks for the suggestion, this is useful to me.
I will refer to some examples using "select"

BR,
Sagar Kadam
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
