Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29388C27C65
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7vLokvzHbJyKLeqxlwMD7hcJ7CFHRB0eWKJvnEjge7Q=; b=ez+RXeDLw2nEHM
	vKSn0ltc3sTM7372wd1M5F/qo9VMnrGiqhDhL44EdwnzI42Xa0G1/5YN3MAILma+bMKYHapEFBisN
	RYFsLa5QO2s4sYIN/YTKLrF85b7VBuhe5eJDHDliWbVekwVItmeRvPtlnvou0JT99dQuyzr+VHxrx
	OYkwModG2c+UHAA/XTToCaqRQi5NuvHyr3tktjpjb2SujTT9lax25uxr62AASc1eNawsWlj5BxsCM
	huK527rr9YWfdUeKh9zavInNBSkjY76JyRzZqXuhW3aROxb7Z5YZxicYL/KDlhNhruX9PRXEVIa2v
	lQ/dt11Z0U/cy0mScU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7KY-0000000A32d-3XiG;
	Tue, 11 Jun 2024 19:38:54 +0000
Received: from mail-bn8nam11on2070a.outbound.protection.outlook.com ([2a01:111:f403:2414::70a] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH7KU-0000000A30n-2bX5;
	Tue, 11 Jun 2024 19:38:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGD8kRYHoh4j7iFTcTjBItzXOPnYVsipVK7vELg/nQDp8gg1inBWIdZqAILcmu9rqECoR6SCDjZAr1fetdALr1S0+i7x6OjmSa7NOiIQ6FtEtKTUVXGIIYJyf1X11Ne8YUsGAHehoENcQSqnX0iMLPm8jiRxzmkiadUoa6q6fNfq8YzpAfDR106H3AXxpQuHXOchcKVT8F1eJGaRu3Ymjy0vZATpD1fbFsPqHK6FX3MZeTVVw4e06KjRbCLL0Vknp7T4cOgfVaU2q0RmYpjO44aNlZYg3ykAmhTwm5qzqSiqRXnt6pIHMCzq3j2iviDWf7jIv8Z5sJE9P5ayHJ/V2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRjY3+M8TCpBtBDZF2UBYSgsSQHyh7HHpYnbEjfJIYM=;
 b=DvHmZlWxSVgo4zkk3C2ptFhSD1xhABwCbrYJ0Eb4v+HDK+MCunEWhq4bTEXfT0fdYvIrfL4SU0JHf+oZ0QdUKn2T3gYeIntWtMrPNimqtXcftXKPbyZFePksKms2Y2IHDkxljonFmx6X8x5xATlKbmV6fhNb1SNHmMiRtRfCjgWkc+uAZRJz2zQgk414JEgJoihwlv/OwfCfWAOC8JVCPtDo9eq9lchgOUFxA143EsHU6cfiHQk1X7rxN0RFgnCyYlqo8vwwMsvQ4vY84DO31EiHrYxGo6zGxMJ6K2qQx9c0E74avBxt/OmwAkbJvKy1X4VqG41dm52QBfow9Z6jJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRjY3+M8TCpBtBDZF2UBYSgsSQHyh7HHpYnbEjfJIYM=;
 b=u35R5li/Tndzzz3rsfMUs6vwzfBVUe0akSBPZE/yU7Dcnl886FZ29TaxTOq8sxpQVv1HPaPMDZpd6+oYTmkNycaZ69YgfRUS3HItZEUzOi0vhDNqAREKC9Pe0Y6xk542HbeQhe+KHBgTGKN1yg+dvH7Yk8YYb1+URIHQn7xQrVo=
Received: from CH2PR01MB5894.prod.exchangelabs.com (2603:10b6:610:45::11) by
 MW4PR01MB6323.prod.exchangelabs.com (2603:10b6:303:78::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Tue, 11 Jun 2024 19:38:44 +0000
Received: from CH2PR01MB5894.prod.exchangelabs.com
 ([fe80::b5cc:1692:8c7d:8beb]) by CH2PR01MB5894.prod.exchangelabs.com
 ([fe80::b5cc:1692:8c7d:8beb%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 19:38:44 +0000
From: Shubhang Kaushik OS <Shubhang@os.amperecomputing.com>
To: "ampere-linux-kernel@lists.amperecomputing.com"
	<ampere-linux-kernel@lists.amperecomputing.com>
CC: Uladzislau Rezki <urezki@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "cl@linux.com" <cl@linux.com>,
	"corbet@lwn.net" <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "guoren@kernel.org"
	<guoren@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Matthew Wilcox
	<willy@infradead.org>
Subject: [PATCH v5] vmalloc: Modify the alloc_vmap_area() error message for
  better diagnostics
Thread-Topic: [PATCH v5] vmalloc: Modify the alloc_vmap_area() error message
 for  better diagnostics
Thread-Index: AQHavDYcN0EphoQrWUSinj2sRxMflA==
Date: Tue, 11 Jun 2024 19:38:44 +0000
Message-ID: <CH2PR01MB5894B0182EA0B28DF2EFB916F5C72@CH2PR01MB5894.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Enabled=True;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_SiteId=3bc2b170-fd94-476d-b0ce-4229bdc904a7;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_SetDate=2024-06-11T19:38:43.157Z;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Name=Confidential;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_ContentBits=0;MSIP_Label_5b82cb1d-c2e0-4643-920a-bbe7b2d7cc47_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR01MB5894:EE_|MW4PR01MB6323:EE_
x-ms-office365-filtering-correlation-id: f6e74a85-5732-4cc7-fe6f-08dc8a4e1ae5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|7416006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?9oyK6SQi1lo/+yjMnfrltrSXdCOQYVWHSuXQOi+tBap3F5aXQAGQCW9HxO?=
 =?iso-8859-1?Q?gD3wjtNnqBj8Xz6HDnubiEDfm2HWVHdK1O6/4Z7yB7RADRD60agelR0J+j?=
 =?iso-8859-1?Q?tS22V85S95wify72O1h3in1SAa3+N49oe+hF7icR5ILr/Vik6IviLZLdTb?=
 =?iso-8859-1?Q?S1u+o8dvIyHxcuwmKi3JH5veXVImdSjSmzjyJbjiJLnVp0GeHmPoLEqT+/?=
 =?iso-8859-1?Q?4k+qNnHhESLt0uCH6x403Xvok5KfnCpf+WEFQE+4hdQt1RHOFtf/osZOzK?=
 =?iso-8859-1?Q?eIIJFmhEvc8zeYW0BFyZjcwci1DrmVu65tnt/tU3nMeS31VMI1H+7E+PyT?=
 =?iso-8859-1?Q?TT4rMiHIZ4hC6snH9wDkhd+Zo3+BJ3s7cw1RaPRdrMQqbixlnTa/romdvA?=
 =?iso-8859-1?Q?OfrcWkscye5j5yRhPBULSjbmXG4H9O4ScOLCXCh2byUfum+p4SAxYuf0q9?=
 =?iso-8859-1?Q?LtwrZhR4NSXxKs8u3R+4vReLwdEBngWNHSQSjBjuXcjJ48OjzW0+EV3g7k?=
 =?iso-8859-1?Q?FSRQA6zQuvrknY6KsDH/BHm1L1bXlkQGi1reEqXIedyasL1hXhc1piJ6bW?=
 =?iso-8859-1?Q?W9ls8XXg2sTHgWxrsqVyS+jOGluL12vvlccG0VfONIYBPMvHw6wog+Z7da?=
 =?iso-8859-1?Q?+HFSAr0TbP4eoTWkedcUyYL3lR5j4HcOHWtfKqB0cea9rMp6q6JntaXHQI?=
 =?iso-8859-1?Q?sxHhiqgS97q9C0eqCrn2V8+ztIOn12GKOl6IEnjIfjNtX1WOBbKln4s1CK?=
 =?iso-8859-1?Q?qlggJm+G2G1qM895fPPXCq/CsaT1zC3NL04ZRq9izaf7NH1ZHgm5rkb82p?=
 =?iso-8859-1?Q?x67MrSWX1iaeI/ncZ1tkihYt91PBJEvSFMHbFSSkFd1nFaEB+H3UW6QDrS?=
 =?iso-8859-1?Q?EvWXZPsrqWzq0c37KbfEHaVyCcfDIBQQEdTiIaytNiLwq5NHldzAEmRzLk?=
 =?iso-8859-1?Q?nH+Zah9S2lmG8vJ/cbGdZbbr6p7zG3e0H1bU+89DP2PU4T2n3Aog3BLP8E?=
 =?iso-8859-1?Q?2dO/10Emr1JJbFnk+L5ljPul/mNtYJKjA26HrMjTztyJThUO0/yYOJiqIC?=
 =?iso-8859-1?Q?amH6xn4gHtLHEuwEylqd8EcMv1XehW01bm6G0AKwFHUOYMsBygWlYEee6g?=
 =?iso-8859-1?Q?L8cZ0xZe2qyfGej5TBd5NCaoJ6Qg90gRUyXg8RKakMWyi8rElVVSCyO2vr?=
 =?iso-8859-1?Q?48Nivf7cKVHu7oIuwnGwjG39ELbTV/LX7cZ6BGDIa1jIqRlYCNZT71dggb?=
 =?iso-8859-1?Q?TKFjKXC9NDgCccZDuBxLVKrPCXfzxBEcrAMI4lQxBPsAyLWETGSCcheQIJ?=
 =?iso-8859-1?Q?84WcEgfZHoOG50WjmQE1E8ZCM39WdJsaFXldQI0j7gsrq25Py4QgZQNo9w?=
 =?iso-8859-1?Q?hK1xn/8pVNr8BKJ/vMbGR1dr81PnpOHi3v5OMf3Z17SLFiN7zZARg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR01MB5894.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ur7JQTnLMjn6vsoY8kPmVAPqYUZynQ7qfJjhUs/bwn9qh8qzTQ4HUG0QbH?=
 =?iso-8859-1?Q?31HO4jIF6DNzcrajEjf+SqrcFdzz6A3khYBluPtjMrHZf1FLc0VEfBHGFF?=
 =?iso-8859-1?Q?GX2nsAO6qLWMtz8HeTG7MbAjAsviTyKptUFfeJrXKEKIWM7TaF556UG1zH?=
 =?iso-8859-1?Q?5BGGwHSwzC6aTyr6CNl9DvYlT7IVISgq/H2wd5w1uJ6lixdQOTnXbmFOrv?=
 =?iso-8859-1?Q?ph1Qgat2NW3dTr+4PIWRrjWM4BmS+9CrD4oJ/ENJRg2bIj/cUQI4OevByW?=
 =?iso-8859-1?Q?fzxU+2gc/xaye1KQH8DfyJRM2pZYgAMn4KpmvxoJxjR8O9woCnqqc2A+gD?=
 =?iso-8859-1?Q?6Ldse9TeB+1JnMmGeMtS8WlQa+ZgfroSa/Q7bE2y1nCzkDhZx4JXJUGOXs?=
 =?iso-8859-1?Q?dsvVo4eEf4YIEYDt0UOmT200ogdrsOZ81fjtDczhIcHjtgrmV96aTuqDbZ?=
 =?iso-8859-1?Q?B5KJCaIYpuTC4DcRAeyO40jJjvhFwaXLrWL+oLNwF9Pm38RFiCBTCiHaOK?=
 =?iso-8859-1?Q?65I/O5CUQKEA3vfI8bOCCkTuh3S0TKN4wF8F2D/Py47VH/tXWxu5KKYOhq?=
 =?iso-8859-1?Q?YVKiDDrgl4QTyZW08AkSzm7Tt1U3RWKTeXsdJXMK8nE+Pfu5mUcCECFJHr?=
 =?iso-8859-1?Q?sNrUMrmj61yTAgWNdjPJSp5cZzwBngQ5fKanFULI1vl2Z9+M8HCguoWOXA?=
 =?iso-8859-1?Q?A7H2MQU0oRkt/fWC8rSi7T0VxOyHedM8hJS6jiym+hysF4h6/rodKN7Png?=
 =?iso-8859-1?Q?BCvssNOxsVZXuFY/csNZElJOPw/h9aUGh6cb1AuloaNZ041mPP68TWP32+?=
 =?iso-8859-1?Q?0w9LGjZOhH59RS+X4XeOGQwUqzeH0yGbHGLUMWNRidI/dQ8SvPc7WPy2xg?=
 =?iso-8859-1?Q?UiFbtmfs+eAWgYv3xWMZVWJkvWotn2Qx2Ne1Lj6YQwdJ0gvuDGXa+4Vw72?=
 =?iso-8859-1?Q?n2rArz5OqOrMjm13vNcXX6j42cNioCS8WdDd18AMMmhcmskd1dl4rOte+E?=
 =?iso-8859-1?Q?v44no2BUQL5LkAqBe2pWFhmxxHtSh/7dbR/pT2ZNe+vAglvL8BWC1fR6n+?=
 =?iso-8859-1?Q?bmXR4elffnn5RxsQH8ZuQ52lBTrJla4uQSSRKFYsOTkmjwD4R27FuBdlJJ?=
 =?iso-8859-1?Q?jZcHtJEeWYtW/5GCagxAQLsc1vUHYuzAucQWPQvzRsYxO88UijsuvMfPkI?=
 =?iso-8859-1?Q?miIrWCl9xqQ9A6udBh6y+EplN+4aMMFm1/xDFs6F3ypzv6WJigSZ+ln9Ws?=
 =?iso-8859-1?Q?qoJ672K+/o0px01unbWojdpTqag6B94Ilg4Vxg2dhHQX8U5MP1hMFouriQ?=
 =?iso-8859-1?Q?255g31uj/8qUsMOpX5Gx+wDt5YtVRuX/AfF2euPj2uDOSDJrtWKiPtS1fI?=
 =?iso-8859-1?Q?uZRNQMaqpIBJUutF4jPdhCZnGvtyMh90zaCOSokwS1DjI+VEAGujg5W8lD?=
 =?iso-8859-1?Q?BgkpGqSNtap0UTL9DqNgZCBudYE7zxQmZ9KBC8/nxUKzT/bUVvSqzte+aQ?=
 =?iso-8859-1?Q?jz9HZ/VUmWM655pWB1/Zq2W6GM/LtOXdaijIyde5TEpm1TEbUI5xmOtJSU?=
 =?iso-8859-1?Q?b6g8D37tFU3BAwVfNUu4w3wR22OkeyGAvtyaul1g0e6EoHFaargqVzpGvR?=
 =?iso-8859-1?Q?ri8FpaqNq4vZFnetO7T4XtxWPfiUriYe4RxFEFHUBsvuyNzXudX2Q6Ew?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR01MB5894.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e74a85-5732-4cc7-fe6f-08dc8a4e1ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 19:38:44.3085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bsQV1oKJPyHikjjNDhID4GYBtgdziLLku99ASfTCl7wbIG4fVSSj4ZX0keWlIT5FOcqufzhNs8McWJvtMa3cvbNSRXHIqV3SBjdKBoY3cHwznzLxPM5dZZMd8s8fyhew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_123850_708533_1FFE12F1 
X-CRM114-Status: GOOD (  13.12  )
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

'vmap allocation for size %lu failed: use vmalloc=<size> to increase size'
The above warning is seen in the kernel functionality for allocation of the restricted virtual memory range till exhaustion.

This message is misleading because 'vmalloc=' is supported on arm32, x86 platforms and is not a valid kernel parameter on a number of other platforms (in particular its not supported on arm64, alpha, loongarch, arc, csky, hexagon, microblaze, mips, nios2, openrisc, parisc, m64k, powerpc, riscv, sh, um, xtensa, s390, sparc). With the update, the output gets modified to include the function parameters along with the start and end of the virtual memory range allowed.

The warning message after fix on kernel version 6.10.0-rc1+:

vmalloc_node_range for size 33619968 failed: Address range restricted between 0xffff800082640000 - 0xffff800084650000

Backtrace with the misleading error message:

	vmap allocation for size 33619968 failed: use vmalloc=<size> to increase size
	insmod: vmalloc error: size 33554432, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
	CPU: 46 PID: 1977 Comm: insmod Tainted: G            E      6.10.0-rc1+ #79
	Hardware name: INGRASYS Yushan Server iSystem TEMP-S000141176+10/Yushan Motherboard, BIOS 2.10.20230517 (SCP: xxx) yyyy/mm/dd
	Call trace:
		dump_backtrace+0xa0/0x128
		show_stack+0x20/0x38
		dump_stack_lvl+0x78/0x90
		dump_stack+0x18/0x28
		warn_alloc+0x12c/0x1b8
		__vmalloc_node_range_noprof+0x28c/0x7e0
		custom_init+0xb4/0xfff8 [test_driver]
		do_one_initcall+0x60/0x290
		do_init_module+0x68/0x250
		load_module+0x236c/0x2428
		init_module_from_file+0x8c/0xd8
		__arm64_sys_finit_module+0x1b4/0x388
		invoke_syscall+0x78/0x108
		el0_svc_common.constprop.0+0x48/0xf0
		do_el0_svc+0x24/0x38
		el0_svc+0x3c/0x130
		el0t_64_sync_handler+0x100/0x130
		el0t_64_sync+0x190/0x198

Reviewed-by: Christoph Lameter (Ampere) <cl@linux.com>
Signed-off-by: Shubhang Kaushik <shubhang@os.amperecomputing.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 ++++++---
 mm/vmalloc.c                                    | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b600df82669d..9b8f8ab90284 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7245,9 +7245,12 @@
 
 	vmalloc=nn[KMG]	[KNL,BOOT,EARLY] Forces the vmalloc area to have an
 			exact size of <nn>. This can be used to increase
-			the minimum size (128MB on x86). It can also be
-			used to decrease the size and leave more room
-			for directly mapped kernel RAM.
+			the minimum size (128MB on x86, arm32 platforms).
+			It can also be used to decrease the size and leave more room
+			for directly mapped kernel RAM. Note that this parameter does
+			not exist on many other platforms (including arm64, alpha,
+			loongarch, arc, csky, hexagon, microblaze, mips, nios2, openrisc,
+			parisc, m64k, powerpc, riscv, sh, um, xtensa, s390, sparc).
 
 	vmcp_cma=nn[MG]	[KNL,S390,EARLY]
 			Sets the memory size reserved for contiguous memory
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 45e1506d58c3..3827c4197522 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2055,8 +2055,8 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
 	}
 
 	if (!(gfp_mask & __GFP_NOWARN) && printk_ratelimit())
-		pr_warn("vmap allocation for size %lu failed: use vmalloc=<size> to increase size\n",
-			size);
+		pr_warn("vmalloc_node_range for size %lu failed: Address range restricted to %#lx - %#lx\n",
+				size, vstart, vend);
 
 	kmem_cache_free(vmap_area_cachep, va);
 	return ERR_PTR(-EBUSY);
-- 
2.39.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
