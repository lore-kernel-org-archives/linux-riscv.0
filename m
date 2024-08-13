Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C54C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/GVu/ZPD0NztXteQCxJtsp8VZ0zOifPc1OZq5JT8Ok=; b=CNqRqZKMoObzmM
	jxAUBqyvb6Aoulx1ot0MKTzOY6LawFAwNtsEZQnvyW0nIXJsxJu3MGwDzNYglk9ysZEndDnVJBo54
	Jb6aTg95AS5T7x2ibVl+EXNFVpQa4JNuQ9JHKyMTDrFnKAey0HOzmFT+XQF4TRKt6OaXZ22gXhwx5
	ldZibuRQH68syayGTMBDYqXcD+g6cDIgHX/7Y9ZMH9sYLHK8Df61bzPv0KBWPdfMrBLtOZ3dW4669
	5D2mKJcaG23B18k7vstZ0I6X90+LXe60VLRIS9MVytKa5Vxtv2BOuZPtKLQk9LTB9JFtUL32R4IO8
	KJA3Zn7Y46dOmHTkEwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr74-00000003nGA-0b5y;
	Tue, 13 Aug 2024 12:58:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr72-00000003nFW-0Xg9
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 12:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723553936; x=1755089936;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MAb9Etnr7FQNBqazP4dD0LuRmiFaXD8xCzid6qEDk9U=;
  b=dr9m0+VZnjwYNILMw8DXileT78xk6Fo5vqmzUMkD8RbEMo+3BJ8yflaD
   RlMtOs604ljfoxvu56aQ/ZFteilS2Tgc0T4ddcz0T90kcGcZZ7/N518Rp
   sBx1ZNtgcbfSrMJiLjdCBySoqz6y7tkgIGv4y/p1FmXSXzFQoULvjr43N
   N0+zdunZxUCaP3eaU+RsNdeXD/zYsGpVxzAPLCtkQ9tQq/4poE/LnDkpk
   CJi6XbNxhfWKoadTLfLOU+AFo6CKp6fM+1vud2JzKbA29Kj5mratUg6vc
   DpAXkJFNot1HgfF/Cq0Hqq8A8wwWFcs6RvYoPfPqzh/o2nqN56MmhIz3S
   Q==;
X-CSE-ConnectionGUID: 2vO2I9qeRVGJIH+moj4UBA==
X-CSE-MsgGUID: 6XIZ+V4vS4qqe58IXXmJug==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="47117086"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="47117086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:58:54 -0700
X-CSE-ConnectionGUID: S9pWvkd/TaePFb4NDa4oBA==
X-CSE-MsgGUID: XG0mLd0aS2WHZ2dYr16t6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58304258"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Aug 2024 05:58:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:58:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 05:58:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 05:58:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 05:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbPyAJ6d6zalU5aT8xKQxpDWjlz2/0YPlwO/8ovQF/XhTE2uHciM1RluZlTMm+0dSG4TGo6E8k6u04dt5LpOx5oSdfTYUZxB0SCvGvr3vzRlj/Rc+XuEKDcbiwbwf/ZesJQuNmBWFGG5qFkFdaDtDisDVHE3Hu3dXrTotSXxReJ9qMNJj6JUp7vJjijl89MH5t/Oan+Pegt2kCswDHVJzVCA7Nfb07if7mRmgs6ae3pVyGXb7ONzEVNwUDuLO+ey/W+wtqdcjPU2c4WwU4sm+lDdJI6sehd+bO8LQ2EIRF1srFKiAe1uYjimMjWrdk7MvJT7+4U4pBNwrqywzN6Lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t6xGTq2CcX/3r79RZiwdMMZjre12c+tiS8QznyM5go=;
 b=nyT5p2uQ4M5IoLM607TANufVifwpoUJ3O9Z+3ho7ymcIzXvRRtC/VccrzbwSvLw+67x81lKV7qK/dpVssIKDKFSQYBHS4UDmAHsG06x75al46exMK9+sXr1GD92pBeae2B2iKzvzBl5ehFG5Pb6ivCdZyQoIAjXjV74cblNKdy4bDOwpVWdNfGWNDM8/XQ3V6kSwOgA/SvfnYXYjQbJDLqrYwvKwnT7NXaWMHlsqc+K69Z6C1VyAhe6Z3eIxVRPViLPkWEiWU1kCrDQApd7Mz68v8FmbvcQ/1bbOP/LTOnbjvLZe/FVneh1LMerLsElmXORyhXTmuGZiCCKoAzuqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 12:58:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::366d:21d5:9005:4c55]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::366d:21d5:9005:4c55%6]) with mapi id 15.20.7828.029; Tue, 13 Aug 2024
 12:58:49 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Hanjun Guo <guohanjun@huawei.com>, Sunil V L <sunilvl@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] ACPI: RISCV: Make acpi_numa_get_nid() to be static
Thread-Topic: [PATCH] ACPI: RISCV: Make acpi_numa_get_nid() to be static
Thread-Index: AQHa650oKeTsyRqMeU2LB8Fg+4tBpLIlKTnw
Date: Tue, 13 Aug 2024 12:58:49 +0000
Message-ID: <BY5PR11MB3909E5DE995CE1A403957691B0862@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20240811031804.3347298-1-guohanjun@huawei.com>
In-Reply-To: <20240811031804.3347298-1-guohanjun@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|PH0PR11MB5061:EE_
x-ms-office365-filtering-correlation-id: e0d79104-be4e-4461-f426-08dcbb97ad27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FqzZZ1e0rl/LgweT+Qwk7hi1rzK/OBRJsHTg1TIU4CXoWFBeEOtNKurMrSkq?=
 =?us-ascii?Q?LOFW4/2KSia2HWeE4S2AYu1ZjfZCvCLz49yfDNQ7ykShZB+4p42nXMhUJcp6?=
 =?us-ascii?Q?tylDCS6eL0T/Z6vbsRUZKV4yPmWRZRZLAbyYCvHnsXr8jpHsLk2CSPZa0fir?=
 =?us-ascii?Q?OprjyTDTc4n0J470bkgIY2g2g+LM/84BavpxjpIIFUoFZPYVxlpfyYLeVfXt?=
 =?us-ascii?Q?ZoNMDdJ3ADcX0gTQsfScBQQ03f+Cj7kbZ4crd3mv0VX/5URwdpHNtDQ9Lh/K?=
 =?us-ascii?Q?c0r+rE64NYkQFiBJi2RtTp6v/DEGPhqjOKMGxNmrVKKBXMdyHPHp0qzCBX7m?=
 =?us-ascii?Q?+67yvhm94HBqjLmC4setV8c6ANRU0HhokPlzdoC+SdhFMBX7yYw9rM8yXu10?=
 =?us-ascii?Q?9DueE5O/CKw8Mn5OLf2yp5czvl29mPyY41si8lcroMqzV+m0OQVSesXQ94/j?=
 =?us-ascii?Q?qO29vqMx7OZy2NPHGdc0QLMqxEEibp9WhzZKCP2S4SJpLxMnSwvXfdVKRRaj?=
 =?us-ascii?Q?/6f18vzz3roSGyLteK6JowVo17qvpD0Oax5xg6+MhQRnU1CX/cwJh74tbSp/?=
 =?us-ascii?Q?umMLiJJFRtm/lhYk2oJNOGn03OGgmwFa+M60R8Rq+vmyBzerPm9UFX2343wp?=
 =?us-ascii?Q?yESLi5u3gxmiBTXzmFVvCS03xMVFivbP/Z3TRCr6/TtLLT3PqKtoxYalmcap?=
 =?us-ascii?Q?PV8GWxLqPzmlbYbxsqhDp6i+7dNioKZpfNnzGJgUdLcoZlNeafqUs28RmQX/?=
 =?us-ascii?Q?U4/gIzA+NpjRdB57Hytn3o2g5u+CpBsNak4UxB0rC60/Ifnd6MvIn9eHsAFh?=
 =?us-ascii?Q?5OhG9xUyNFsw2/5lcDb3/xgKaVI3AlWjuxsIaHcVQ1cmx4Ce/IBi8vQVHtnh?=
 =?us-ascii?Q?uFBQj33XwxGZt+x3qB0r7Gj+/sUAdlu2dCASqr/drimTwnJMnghaVrNsPG08?=
 =?us-ascii?Q?kmnmLR3JzhKd8Gw6P3QJO9lhCnMXYaXKwNiGwTIG/mWitIZOCo6dy6TJPKus?=
 =?us-ascii?Q?FStYOb94zF07MPIQ9kLo9RsLxv7OYvl33pt/7FOxFSfirCM0Xh6HQNs+Dsev?=
 =?us-ascii?Q?XWbEVFFZPVDQuxEEGwQF5X2G6X0ao5mSvP4kaXGt77hTX249eewLLXzYssX4?=
 =?us-ascii?Q?HXztvqD8BGAmgkGijAhLGS27JjYnd88rXyL7uZGpBHfSBwsb64pxa2ul4Owv?=
 =?us-ascii?Q?oJS0pRJGAzQWAM6hISutkB/JjBh0Wso+qT8TH9DvdYNhp5WOgnD7GKSRsKiL?=
 =?us-ascii?Q?YnUKXPgIkQfdU298fb16Kf8AoTaFzkamorPySEKOm6Q09zixiWp0lhpl1mJ8?=
 =?us-ascii?Q?7mKUi3KEUJ86VHHyhKvjVS855MYfcaonbjipZ/+wH5f0tpo1EN8MWgFkrj0Z?=
 =?us-ascii?Q?WIJY92W8N9L3YPADsUWJ9tKkHdXUlFQNZfkmftelPi8/0J/R+w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qxw2Kt9MCVdNdvjumVxRYIEkbrRLzuAp4y+SE7zDpAUW0zusqwchazQSGljp?=
 =?us-ascii?Q?FbKR+eEl9h2/UasrOGP8eItVUd/5fwjI1/dgClLBrHzK+ag3cpHDmzGvzBna?=
 =?us-ascii?Q?QEEJiE7ru++WouFn38XjwAKCDC9F8RcDHz2RWXmVP5XcHfTl6S8XURb7Xwds?=
 =?us-ascii?Q?TVQZxfvw/r0I+u/pAf5ZRQlvrBnzeA1R6DwoJNz5OZUEn0ikqPV0oKcnmVeF?=
 =?us-ascii?Q?C46+tnB4xmpk/tbTbNX+KOpkUD9xzy/vty2siNJvFUQc2scbSnDgX+6ubrbn?=
 =?us-ascii?Q?/ELjO6SLmyL1ZGEud5pjsq604iZw5AFj/ncHANKKz/ToaMPMV09IJJ4NPjYV?=
 =?us-ascii?Q?NxlIx3tTn2D3ahYWSFFtvGSRCmQ/Anm/3PE+mdpuExCKT5FzMB9fkzVtc4Rm?=
 =?us-ascii?Q?Ni01BLO3l/BdO7hp8DAUZmEoQANIYd1l3eDDc0ZIPNtqj+LMxUEfoJnCTP5y?=
 =?us-ascii?Q?0yAFq0UrODHBAnC0gE4upZR+gi8O02RzV/O/rsXBjLlqsflr8jgt/3/qcgak?=
 =?us-ascii?Q?pCWTBO6RQ09yPzsnxs7YF5ISDslmTPqDg7Fyd7tr5XOeHVb1VMNNlGpr1Q3+?=
 =?us-ascii?Q?arRPqVUcRPWe/66v8USHErcZIJLQzwF4qmkwxOJIf62OCCJ90e9tP6P1BmCr?=
 =?us-ascii?Q?TydMbizIiYA1fLwwRwyK9anYhVODPC+uZOneOdforbi3thHAoPT6NvqQIvPP?=
 =?us-ascii?Q?pJs5/pY16n4b56cYFzpESWt3yCXVtwOsbO83ti+BJIAtrArGTlfWcyWByTY2?=
 =?us-ascii?Q?VAKoPVNeZcpXcdIiMIySZxPqonx6x8vVPN1Tp36aJUT39Sr4yLOtgLncr3sc?=
 =?us-ascii?Q?iw4J3SjDy9b8nW6vR5l3Uv6k/Ae1iUl7zOZKgunw+oio3M+4aWd/N4yPpaqT?=
 =?us-ascii?Q?KfIrhgOZcFGjxe9t9MLEUwm32NG2IAf7X11r8dz7UAc51gv5S/4LqLHgCh6V?=
 =?us-ascii?Q?llnLnqAmxO2ChAN+ags0GboEHB97knlEvikUxI4uG6VWn8WaRaq64Xq3iGIH?=
 =?us-ascii?Q?/q6WJip1wuoIEdCCD0UGjG197o3mbj63c4+ouBebbb5BejFAhq6cKLNonwho?=
 =?us-ascii?Q?DkR8uzrK9e2zWeabqMwfGcm0IXDGs6AHfbPJBOXNsMB1tjOWw6N1oPxnmpO+?=
 =?us-ascii?Q?mWpYyiIBfeZE6FaAU6Cimv/MaZldYRQjpMgC1BvdWEPqRK6FGn1bcmi1JZHv?=
 =?us-ascii?Q?UfQZ6QTDiTTA9wbHSkRAEyAfxB4coRKQKjpzbO/O+UauWumYmxC1w1/nWNnq?=
 =?us-ascii?Q?JIA4UkTt00m/wqneOCiifdG5aq2mVrzXMImnOBVUUyiy2bIHY5LMQySsIfhO?=
 =?us-ascii?Q?gVOYEH59HOx2mCv8hGyPjFNdT4dbG52+PHYJ2E70tlekz7AIOOcLO/VmEJjG?=
 =?us-ascii?Q?m9zapnuWift7nxQ3gii3GjQyMF2Bs+hnGBzwtl4MNqe2nwfryLuRr2Hwk/Es?=
 =?us-ascii?Q?wI/hBavSf7qIoaWT0I3IrhYeFvEY3dCJhCc+frtxTpnLtMSVOgxb3rVb5o+u?=
 =?us-ascii?Q?MSB5WIKqmhtPk99TUevctv+CmHPhmnF5C6Mr9IUwJIwhVxHbDaufqeUkmGQS?=
 =?us-ascii?Q?nTV0n54ul0bkI0rlrNd92+avO9V8rRJsxkWDiWu7?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d79104-be4e-4461-f426-08dcbb97ad27
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 12:58:49.8698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7P7e5Y2qrFql2loT9xi2CuJ5+cyw2vu6HZI90zOE3vYu+DNCsO8lWW/ogH2xK72ghAHOwKfw3DhWaKAhrn0xgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_055856_209813_B5C1666B 
X-CRM114-Status: GOOD (  16.81  )
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

> -----Original Message-----
> From: Hanjun Guo <guohanjun@huawei.com>
> Sent: Sunday, August 11, 2024 11:18 AM
> To: Sunil V L <sunilvl@ventanamicro.com>; Xu, Haibo1 <haibo1.xu@intel.com>;
> Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>
> Cc: Sudeep Holla <sudeep.holla@arm.com>; Lorenzo Pieralisi
> <lpieralisi@kernel.org>; Rafael J . Wysocki <rafael@kernel.org>; linux-
> acpi@vger.kernel.org; linux-riscv@lists.infradead.org; Hanjun Guo
> <guohanjun@huawei.com>
> Subject: [PATCH] ACPI: RISCV: Make acpi_numa_get_nid() to be static
> 
> acpi_numa_get_nid() is only called in acpi_numa.c for riscv, no need to add it in
> head file, so make it static and remove related functions in the asm/acpi.h.
> 
> Spotted by doing some cleanup for arm64 ACPI.
> 
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> ---
>  arch/riscv/include/asm/acpi.h | 2 --
>  arch/riscv/kernel/acpi_numa.c | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h index
> e0a1f84404f3..6e13695120bc 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -91,10 +91,8 @@ static inline void acpi_get_cbo_block_size(struct
> acpi_table_header *table,  #endif /* CONFIG_ACPI */
> 
>  #ifdef CONFIG_ACPI_NUMA
> -int acpi_numa_get_nid(unsigned int cpu);  void acpi_map_cpus_to_nodes(void);
> #else -static inline int acpi_numa_get_nid(unsigned int cpu) { return
> NUMA_NO_NODE; }  static inline void acpi_map_cpus_to_nodes(void) { }
> #endif /* CONFIG_ACPI_NUMA */
> 
> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
> index 0231482d6946..a93c773b60e6 100644
> --- a/arch/riscv/kernel/acpi_numa.c
> +++ b/arch/riscv/kernel/acpi_numa.c
> @@ -30,7 +30,7 @@
> 
>  static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
> 
> -int __init acpi_numa_get_nid(unsigned int cpu)
> +static int __init acpi_numa_get_nid(unsigned int cpu)
>  {
>  	return acpi_early_node_map[cpu];
>  }

LGTM!
Reviewed-by: Haibo Xu <haibo1.xu@intel.com>

> --
> 2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
