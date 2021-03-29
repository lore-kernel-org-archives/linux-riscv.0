Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AAEC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:49:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF4F61960
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF4F61960
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h2Uf9G1c6DmWOAoozGocTT6/73rrqFTBSNJHb6V9Q8I=; b=ZioKm+4rSDtd31u6xDuX/2OFq
	pAncvga3JXCVTvDi3wlLzitdANTbXM4EhEmTqCirqLmVACgLd3qwUGbJeyL2Zn4c2s23bWza+BUVr
	9CqW/1tzUOAhHhNxPhI59MiXfyIM+XB+CEcz2RmyzKG2CkUrCQlN55LfRspu78luKSNKmoiJyHehA
	+3H2+wsnrm/qbiK0Vw4XG5jWRrpJGvao2hCbfhBPlDPSjfWxkPsFKRXZAv4AQQ+l6jxw8aVqfQBqz
	t2V7qchTfOygCUFXqwAZLLcg7LJ4vqOEaFUKRjmNwhOECCtobbQctlK4RSJk7G3hwQkQAyK7igMnB
	dlqYUtEWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw0C-000w5J-GU; Mon, 29 Mar 2021 17:48:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQowE-000ZbF-Is; Mon, 29 Mar 2021 10:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=/ay8TMmJ++2GJdBf7EWjPTAnf1cCb7gNzJ19byz4mjw=; b=CbXjYOUpbZ/MpaWcny7BSwLHfE
 d2b5cWUgtWVfKLaxYUglezwM6IxKxroufU6DCOA7LNVIhEuIw4fdvrmSEwIpp7uiV4T8QWntmvxJ4
 f0wxicikwAdNtOPXmpv3c0VBktLWh02y6mpZlmR6Nzr2khZcnlmUpSODUyU1YwUaiHKvwA3vMR9tB
 msLRxrK85ufJt/Qdhko5uy7TVyFYzKLxZf4AYkceY3EGPc7BOikeuYPifGsg92tZgkp8fxcXEqXaI
 LbaQuv0LGIlrGsJZ2f+osSVS503+uz5Aij6fFQMJ3FD3YHeXKEYlAql9l/m6PrAVqvRrFS8faGogs
 kYwE9Ong==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQh0v-000qDl-Gv; Mon, 29 Mar 2021 01:48:31 +0000
IronPort-SDR: r1gmX0En3DBnav3dAM607lDFnEgLA+qRvi0gxNhEeCV4QmoLT2cakJMZ10+sqXScA2IDZ6qLCi
 suNoZk4+mqEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="191557926"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="191557926"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2021 18:35:25 -0700
IronPort-SDR: 3OnYc4reE3mBx0xx2TBrBEdlwziLi7HjDKDFWRUBHfunsKIJDM1QQWrb+BVf58G1M5KJOojGGq
 lI3XkuczvN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="606193074"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2021 18:35:23 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Mar 2021 18:35:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Sun, 28 Mar 2021 18:35:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Sun, 28 Mar 2021 18:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbvUume1AMZG1bMZ0EK31cV+xchex/cexicm6ztwC/xZQYIxuWC3o4YUu7oHbxu/kHDEEmd/olcsjLAhiwq3Fhc6TViO/G1kPfyz5Ka+rVkb6thfa4HZO7qNvsKBMIss978mmIrc4tSSOumCgtDMARLObK9r89v7Y7S4wzaJEUZSqb3OShD+DrStEdzrbBZEj+PMEPmDSeefTN7NmVlB35fZzE8Fis/0D3kCeT4cxZqUWKkqnxZcyJOKx9xJS7SG7J2MdXygv01DECh8W77ogJXQxoLJm5pyK1NZZJw4cHPd/wKcGdDCQM81/PNEgrfHq0sR6UBUzPwlXx3giicIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ay8TMmJ++2GJdBf7EWjPTAnf1cCb7gNzJ19byz4mjw=;
 b=YVzKE4WosVRut8kCQTTj//0akhjfIfLdr3SC/zO8EYIzRo14v+nIzzwakYtF5jg9ud6s0tKOyeT+KBiDQqOxF76CRrHWZhZgjv4HgZ7KEqQYRv8ajy8r9UgSDnZdBOhKUh+PgN5oEG0snHNB4/gkXt8mtWFpoO6ymY6j280eW+qqQtp+nQTR5GdT6q+5yZYTbSWMtTs6zMVPTBfeduCwzYekECwGNRlRshEG3kKCZi+DoA6RfX7XLxxpP3XOYEPF0scVyw+I1+h+Y8VD+5/EYafnBHN07rS5Tu4ZS9TxV3ECAom+dKzfKLWC3keo8Nl8ESAfz3OpPj8ff6MbCssBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ay8TMmJ++2GJdBf7EWjPTAnf1cCb7gNzJ19byz4mjw=;
 b=u/DX/kYhvaEdHbMUGTBhNPannLaSs2aqRDefhuYJOx8lA/ZONkC9mEysKJnE+KwH2IjHkNftja78aAwafaR7E8gNsMHdrjIzHD3+J+lcX49p94nISQoVItvKvzdZBu7WyCxMsAZ6S5ZXkhnnag3f8xpqZNyQyU361husRYP8uwY=
Received: from BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26)
 by BYAPR11MB3253.namprd11.prod.outlook.com (2603:10b6:a03:77::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 01:35:22 +0000
Received: from BY5PR11MB3893.namprd11.prod.outlook.com
 ([fe80::297b:a818:3bfb:f897]) by BY5PR11MB3893.namprd11.prod.outlook.com
 ([fe80::297b:a818:3bfb:f897%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:35:22 +0000
From: "Tan, Ley Foon" <ley.foon.tan@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "will@kernel.org"
 <will@kernel.org>, "danielwa@cisco.com" <danielwa@cisco.com>,
 "robh@kernel.org" <robh@kernel.org>, "daniel@gimpelevich.san-francisco.ca.us"
 <daniel@gimpelevich.san-francisco.ca.us>
CC: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, microblaze <monstr@monstr.eu>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-xtensa@linux-xtensa.org"
 <linux-xtensa@linux-xtensa.org>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, "sparclinux@vger.kernel.org"
 <sparclinux@vger.kernel.org>
Subject: RE: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
Thread-Topic: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
Thread-Index: AQHXIkY9EWGkIZwlLUepcXMICy4iU6qaMsdw
Date: Mon, 29 Mar 2021 01:35:21 +0000
Message-ID: <BY5PR11MB38934E74AF74D40379E46AB9CC7E9@BY5PR11MB3893.namprd11.prod.outlook.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.153.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3136e626-5230-45dc-23e7-08d8f252eb33
x-ms-traffictypediagnostic: BYAPR11MB3253:
x-microsoft-antispam-prvs: <BYAPR11MB325308E3D7134732CEAD512ECC7E9@BYAPR11MB3253.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sp4Dol+Ce3nl3hU/fv/D/GUIKDOUypkeJE/zMbaTQm+QnbmSVuL0jjK/ZMXtf2p7SdDLd0pSfuuiImYjWC2pohxUpt1MyaTp/n5BOxXpfN/WBOGp7vCgEznkbRin7gx1gHK5syIi7vYCGx6bo5oW/nQregC+QI2Lc8qopP2qA9DfcDk3t/JvlXYMZq4TEgdN/mJvI6XjsorSmY5zyom8Avm/HFtuAaNjka1tiEhIxIcZtUHfq4l9WC7+J8KYLdl5+olfQCFc7XfDN1T1MZmR4UU/UjID50WgHr/PtQ8N6gYizCrfwNDixADhfDSQmwqUI7NDVT4gWSrBU2L7yDNup4v7Yen8cG9V88vMkCYCborUb5Qdlz75Vsvyu5KuZNQ2okqrZO6KQOXbl3Q128Z8hMeMGBYzb6U58EGDrj1E6cStukiiNcoI0lkl5pLZ+yN7XKJb0yPfvQAC0nSLee/lB67769TkYbOvzbF3t6xeeG6FaLrn+6Fj/1YuIOjE3EZWL50BepT7041SZs3mEYdPjSb4c6g89nDqa70MC1WmyfoN3C38OC8qu38D4qSZqlMzrMkf2AsBvH+HkXAXJLE7g/ve9C0e351D1SjDMD7041qURhXVi7FyjSKfVIDn/IS6p73+6cVBrCMoSjHQPrx7A941nQU7qd0TUDdLvhlRXmqOh3fDsFehe9OH42eV9GNu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3893.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(396003)(366004)(376002)(8936002)(38100700001)(316002)(83380400001)(54906003)(76116006)(66946007)(66446008)(5660300002)(8676002)(66556008)(64756008)(66476007)(7416002)(478600001)(4326008)(110136005)(53546011)(2906002)(55016002)(9686003)(52536014)(86362001)(71200400001)(26005)(33656002)(186003)(7696005)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qG30XGx1ArCsOPyfjuxDCzCGIxsdK9sVdtWTrycEB0bBZl1DAzQSe6MJaEOw?=
 =?us-ascii?Q?fKwOr7ob9iSZmk4lSHK+dVaRvtzc1/vvfzbQuvGjjq8Acx2Uzjj4QOCsAMA4?=
 =?us-ascii?Q?6DobvsLMhKufv6PsBcV3FoHHUqhSWwUzakvMWneHFqoyBFMiM5DcQPkxEM+V?=
 =?us-ascii?Q?eoArLPer2IGntmEqs8mNnmHIWABfd2uDS5oWEMD13fIoX9Schn07FRRHAotI?=
 =?us-ascii?Q?RXTrVZaAFm1qOg8y4JPH/YtfoxlbbS1lgxPRBi4ny36JeHdFCW77OFP1D8ua?=
 =?us-ascii?Q?lSB0vBoDd2qIhw8PXL3tiYfAkmy0ET/r/MeWMvWtX0gjZFD2rckSu3fd/4yZ?=
 =?us-ascii?Q?6d6P/njxZCCFWAyZl6DFrlJClVFIf2Lu1DP7hRNLwM4eQuz3fqzEHDed87Lk?=
 =?us-ascii?Q?ZvDH5sav+GwpUUjw1RAbwi16nHC5xwxiL1uiYiamrbDrv/ra4h2lXmCmF/yk?=
 =?us-ascii?Q?TzrhiYhxuYTgLsRxNJ5HZv7WzkEigvdq0QsCLlqyDgdkj+/0z/cLrVNeb80W?=
 =?us-ascii?Q?2wSvn8REbgHtejy1n3/b3om8NSEe+R7xgkTseEnFIbhj+aFJe7qKZdmBkiY5?=
 =?us-ascii?Q?do1zP2icP3vdavYhTj81JRCeI5R1Y13JoAJpEQnx/Cu9tdAQJx9fhM8luiyn?=
 =?us-ascii?Q?6mV3ygmDJvjUTGSknoQWLBNjAO7C7lNzb0t0MHV6qNi45QV+YMyMBpBsuiMp?=
 =?us-ascii?Q?AK0rEuaMuYOvSZZwWdMjwLjULKPtX65KFgs7u0H4QZG+lIyfESMcu5K4mKfO?=
 =?us-ascii?Q?ljfN4MHne8IAXdoQUU8SvOodGvEAnDT9H1PJetgxUfiC7oa04tEGtEt1KG7c?=
 =?us-ascii?Q?aia5+lQEMGpVKDQPNDi2d0OyKUjRJ+J1uth0georYToydJMdG0wIY4rb5xgB?=
 =?us-ascii?Q?HXQJUFQfhTpHiTUAMD1fBoD9QkAyKkRiByUTj5AyqM4vWkUnO7K4+XZpwNVk?=
 =?us-ascii?Q?LjomyGnfjOrMIfrLfAIysCBW3G6xwqnpWtPjgV9mcvUMDP9+JDlNMmaKQlEp?=
 =?us-ascii?Q?+x9xQ/mpCxZu0BeG/6dE9aBUXXPxCI4MSTFbcnMKDa+snCvmFI+KMamONbGC?=
 =?us-ascii?Q?JU6yudXQYXtJqOUIWiSTlokL9qu1xx/vgyDTMcL8u2ArLjpFJbp2ScplBcPT?=
 =?us-ascii?Q?S2lWf5mcn0q83OUpHuGioRBeopGLkqtbHsweMOEpW5EDjXkz5U/gBcGfkI8J?=
 =?us-ascii?Q?00xd41Yk5sgyWZfN1omxCwnXbq2CVn2RXoaeI9MP2NYS5GKpAuj4U4wm6Zsd?=
 =?us-ascii?Q?0FbDXcF1H84zchNGCeIKFBgW6tI18NFXDiOExz+Ra5daCgTs2LyAEDCfdxMR?=
 =?us-ascii?Q?J2gtbbxgIAD8YK/c+DHzOsrf?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3893.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3136e626-5230-45dc-23e7-08d8f252eb33
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 01:35:21.8933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EORUlTAMEmVGyPJ9IXxT10ifW8qQlyWaELYLStNmnpr+Szh6mpMwUAPTHgqsnwEvoe/BmzqwOe5+1m1EIpQbUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3253
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_024823_745198_CEB972EC 
X-CRM114-Status: GOOD (  21.51  )
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
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> Sent: Friday, March 26, 2021 9:45 PM
> To: will@kernel.org; danielwa@cisco.com; robh@kernel.org;
> daniel@gimpelevich.san-francisco.ca.us
> Cc: linux-arch@vger.kernel.org; devicetree@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org; microblaze
> <monstr@monstr.eu>; linux-mips@vger.kernel.org; Tan, Ley Foon
> <ley.foon.tan@intel.com>; openrisc@lists.librecores.org; linux-
> hexagon@vger.kernel.org; linux-riscv@lists.infradead.org; x86@kernel.org;
> linux-xtensa@linux-xtensa.org; linux-sh@vger.kernel.org;
> sparclinux@vger.kernel.org
> Subject: [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
> 
> This converts the architecture to GENERIC_CMDLINE.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/nios2/Kconfig        | 24 +-----------------------
>  arch/nios2/kernel/setup.c | 13 ++++---------
>  2 files changed, 5 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig index
> c24955c81c92..f66c97b15813 100644
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@ -90,31 +90,9 @@ config NIOS2_ALIGNMENT_TRAP
> 
>  comment "Boot options"
> 
> -config CMDLINE_BOOL
> -	bool "Default bootloader kernel arguments"
> -	default y
> -
> -config CMDLINE
> -	string "Default kernel command string"
> -	default ""
> -	depends on CMDLINE_BOOL
> -	help
> -	  On some platforms, there is currently no way for the boot loader to
> -	  pass arguments to the kernel. For these platforms, you can supply
> -	  some command-line options at build time by entering them here.  In
> -	  other cases you can specify kernel args so that you don't have
> -	  to set them up in board prom initialization routines.
> -
> -config CMDLINE_FORCE
> -	bool "Force default kernel command string"
> -	depends on CMDLINE_BOOL
> -	help
> -	  Set this to have arguments from the default kernel command string
> -	  override those passed by the boot loader.
> -
>  config NIOS2_CMDLINE_IGNORE_DTB
>  	bool "Ignore kernel command string from DTB"
> -	depends on CMDLINE_BOOL
> +	depends on CMDLINE != ""
>  	depends on !CMDLINE_FORCE
>  	default y
>  	help

Missing " select GENERIC_CMDLINE" ?




> diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c index
> d2f21957e99c..42464f457a6d 100644
> --- a/arch/nios2/kernel/setup.c
> +++ b/arch/nios2/kernel/setup.c
> @@ -20,6 +20,7 @@
>  #include <linux/initrd.h>
>  #include <linux/of_fdt.h>
>  #include <linux/screen_info.h>
> +#include <linux/cmdline.h>
> 
>  #include <asm/mmu_context.h>
>  #include <asm/sections.h>
> @@ -108,7 +109,7 @@ asmlinkage void __init nios2_boot_init(unsigned r4,
> unsigned r5, unsigned r6,
>  				       unsigned r7)
>  {
>  	unsigned dtb_passed = 0;
> -	char cmdline_passed[COMMAND_LINE_SIZE] __maybe_unused =
> { 0, };
> +	char cmdline_passed[COMMAND_LINE_SIZE] = { 0, };
> 
>  #if defined(CONFIG_NIOS2_PASS_CMDLINE)
>  	if (r4 == 0x534f494e) { /* r4 is magic NIOS */ @@ -127,14 +128,8 @@
> asmlinkage void __init nios2_boot_init(unsigned r4, unsigned r5, unsigned r6,
> 
>  	early_init_devtree((void *)dtb_passed);
> 
> -#ifndef CONFIG_CMDLINE_FORCE
> -	if (cmdline_passed[0])
> -		strlcpy(boot_command_line, cmdline_passed,
> COMMAND_LINE_SIZE);
> -#ifdef CONFIG_NIOS2_CMDLINE_IGNORE_DTB
> -	else
> -		strlcpy(boot_command_line, CONFIG_CMDLINE,
> COMMAND_LINE_SIZE);
> -#endif
> -#endif
> +	if (cmdline_passed[0] ||
> IS_ENABLED(CONFIG_NIOS2_CMDLINE_IGNORE_DTB))
> +		cmdline_build(boot_command_line, cmdline_passed,
> COMMAND_LINE_SIZE);
> 
>  	parse_early_param();
>  }
> --
> 2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
