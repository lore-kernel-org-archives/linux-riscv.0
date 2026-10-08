Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E27CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TarCEi36ytnyhq5J47k1fHvtblIzopnjM1e/iomrus=; b=dWz3Ppwq5aQQ6I
	5nIWTWQPUIqPSoBM90LTFNkdrkA1/KJnHJHao1KZxXjHvcZt5seXOvwQXg35hwaGzDYtzoA2uBYx2
	XlTkTD2Uh0cVvYsnGVIso3eYUVQpJy/eeV4HfBvriFgkqBOBbD3fzjvzPYPOmbhIMv7ljkZQf6W7K
	kxtR0GA/Em0uKH3KbrbqvQ9vz4JUPVUY3/hHY4nRgr97zqwahlfcN0gVfgAMhxjyv6ioiw+QdViYg
	b226ZM6Vr+OdGSPP4dmrJIVC/Qzy6SlZDQjisMiDhzzDVBYd51ZmPU7XqBD3mfghMHKuVARyARQb1
	gMRpBupjjp/WzG1uzTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmJE-00000004FEO-1fXb;
	Thu, 08 Oct 2026 11:29:12 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmJB-00000004FDJ-3sbT
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 11:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791458950; x=1822994950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QboB8NJT0sENMOHFVDzayaRNtYW3Np6S2qMraRmNr48=;
  b=Ck1M1n3CAwIUYc6rD7BWajGWb8yNHSzjakUZxsvcYJGyYpoKJ8/HKuF1
   3+/qTXvYqRBwpirnLrvrA0q8rk1o8AdLDzMNwYd1LDvZuuCujxX5H0Qow
   03nvrt5NUgnkzC/U5p6z1HK2yD/NoKWGw/wO/GzPUOW8/RQqerzH3u2CR
   6zR969AeycX0nYe1RMtUjcXwAjUw6ebeS0IcFb7f5CoCFMIwO0D0SgGpi
   1DTXmqM0CuY2CLge7VKjdHfS/xdM5b1s5X5Z6O40ibsyV3mA7teCl4zBv
   uve6wdQKJPH1MGL0s3JESxvBecrnjTPR9iiDeIvUgS9UTXEqL07owtHQw
   w==;
X-CSE-ConnectionGUID: wr0pvq9bTOqaJP2R1HW/ng==
X-CSE-MsgGUID: BX8vpQcSSAenKfKAuqvkTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="132393"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="132393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:29:07 -0700
X-CSE-ConnectionGUID: dQ5U5pFxR1+CLvL+l2HODg==
X-CSE-MsgGUID: K8wcpwlvSUqz166utMYqnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="125297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:28:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:28:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 04:28:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAWbdEpo4jtyL8jys76PZTBYxDozkXvCOrmMIqtEjo/hmGrsaDtDhXMlSyq/9c2YP9zNxnyWrJ6iB1RmnHzbVPB2j1Jmh7pB7Zl1MTtPBpG4SizzZrQcZQFFxafd2VIx1hi/koG09recgBZW1ZJZuif7SiNpiV3XzkmNDn3yJlTGGq4ipJs8k8913Pgeu1zwVwMQiw997m23FMQolLW/RlQ5qVVfP6XK5zVZbj/ArEiRzihSBE7/tcdh6vgFNhHI/KiFRmG36NwbrkXqAEKOCab9RJmihFf8GRUX+xQHBJtFoBuZNK21l8YOyJatj8X5NA4J5aYniZdEDlolGgZoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao7WZw2g/VPBnESeg7u201TljVSK9wVNlKSw5fC3eAk=;
 b=GMN2qacOtlznTBNhwpxYwOJbb+qwh7COEyEFCcbcSSFBSjpUbD8tpD5ZP6mIiEuaLUUFT/vgxpnjt6iOqurX+nhBO1w71S1ZRo4g9OjbernwkKQ/0UPHVz3BjksDXVWzC3xlW3HLFqux/2difLBxnsTrc2qIE19UGunoVZAH/kVbjrPrP9/O8isinFFtx0hNimali/yuE70KgKoYH3izah2oUkt928acH3kdkOBu4eTl7nQQAMrlq4cUHxxOwPv3GEivEPnrEOWoSJSUQ8eRmhJ+lNf4LYdtfOltslIJY4Tl7G7B+e5fg0qhJj50z/bJVKEvUPwXZefzImaEJZiR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) by
 DS4PPFEC77118F8.namprd11.prod.outlook.com (2603:10b6:f:fc02::5e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 11:28:54 +0000
Received: from DM4PR11MB6453.namprd11.prod.outlook.com
 ([fe80::7416:2f56:a8a0:f723]) by DM4PR11MB6453.namprd11.prod.outlook.com
 ([fe80::7416:2f56:a8a0:f723%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:28:53 +0000
From: "Zhang, Guobin" <guobin.zhang@intel.com>
To: Aurelien Jarno <aurelien@aurel32.net>
CC: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Thread-Topic: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Thread-Index: AQHdJhkAENIlZT4JRUqEFIdoplr5DbbfAe0AgBTd8P4=
Date: Thu, 8 Oct 2026 11:28:53 +0000
Message-ID: <DM4PR11MB645348B7A1FFBD4ED9AD800883932@DM4PR11MB6453.namprd11.prod.outlook.com>
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
 <arX5rpNRRk8r2Nve@aurel32.net>
In-Reply-To: <arX5rpNRRk8r2Nve@aurel32.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6453:EE_|DS4PPFEC77118F8:EE_
x-ms-office365-filtering-correlation-id: cccf7ac7-eeac-4a63-6e73-08df252f555f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|18002099003|11063799006|4143699003|38070700021|6133799003|56012099006;
x-microsoft-antispam-message-info: J1cKMoLrXTUfZPQRIS3dL+LwiLww+cLO404B7JObfTILadtdO3HR1/w01jtgOks1X321y/JIAufbDw3Km/fEfg3uJv20AiAxDL4dwVvkuZT7PC05TqGV6KPM42TUHjEBjDoNlN9Tq6zBdBqqh6mXRZFu3leh3mr8Vt3xpxpU+5RzuP4WJNEdpNEfIZbXhIR6gX0E1IWjCTJOTkFw/LBgyp3D1UFM+GE5cFRbxYEI9D5wXMbRZOB1lTLy/KlbK5hT0LLz/MyXJ+DjU1iXR+XX8mkbH2TKOVKNmZ1iS9dZWQLnOmrJ74bHOHu+16amv0orfdbNL7KC/AsISnlPg61mp4Iv1x/g17sQ8eUYEygsdCVLGXbWP960U3arVxmzgAyMkQLX+mdRbXVBH35Ni+ZnD7zZl+2G+Dlz2RwdXp2Ice3onX64Ygxt0xN0i5JoOCvyjjOLmcMuWVNz/YHH06zDi/UzgIiwnzdBVoke9X5dW45Fe6I5ANgPmbjiiunwt6WKE++uhqRuE+gs383XSJDx2FcBPkkGmaPL6Yl1ICniSc+7bE3Cy+BZLKMrtfjrxzU0wv3DcP6WaosLQdN9YXqjSs4R6Br2Rf7EHYww10RR2LXsb/rU/LFJlxHg10lii1cwxQBjrY7o50zH9goZk3k//XL8+Q1/nJh12qIGRgL+zCmGlv8TiExh7AjezlL/o2yDFQu/S+Hr8cicY16s35B8+g6kTxhHJTo+qFC1rJs1klU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fL+y73PzjobL0BxLUCb0OJa+M10gHpe7nLOk00FmNjbDTYRWG7ZJGYBhg0nC?=
 =?us-ascii?Q?zOTbpaKw9Z5auaqTyHG/smyTGYA2bherWcKA7Z1/e/bv+uEMJn0WNppK1y7x?=
 =?us-ascii?Q?27fjqKlrZmci7tqWKxS3Kzw1cX2/h0Z6yjbkDKgvs4s92pxtBhZT94TabRpj?=
 =?us-ascii?Q?X9+DPSi7pONyDeFDvEnHuTD8YpERV9O1rNdAHbBK5l6EoJGr6kzUqvLwChTC?=
 =?us-ascii?Q?iStHMq0GBrrbeDN2aCs1uuZ2FFYjtBl8QpsQTmuVjq+F9DkqClgO5Oni/Czf?=
 =?us-ascii?Q?Au8aDRSf5Z9XwJ/LHpU8ndLZh1nV6KXPzZaklFe733L+gqwTCoJkGtOqSdFq?=
 =?us-ascii?Q?L68C7qsnhMx96EcojaD7WoaAmAE7lo5S92LkrPKJCXqWR2b7uSljqV+0wzDC?=
 =?us-ascii?Q?Ek4QCqj4dRGKoGV7qRl/jxUO7eqMoenFN1zZ6+pDDEsyrhZ04vOemCiAhaml?=
 =?us-ascii?Q?Le3c3/lEBnlURGWxKQf+W0+VA5wBj578Pc62dvLY3Dm63sswpqqMwT8L/mgU?=
 =?us-ascii?Q?ySit21jh0F0KzxB9b0e1rqQw2MdBKVWWPHxBqOqUEonrpR9G5Mi+UbseZs2s?=
 =?us-ascii?Q?NMlWx/ApkSJodwh9DlqWWy/9jZggjfhnDNwstcJNlcelcAfpycE45i+avV3r?=
 =?us-ascii?Q?07XPWhPiZPDiyz+mnVZq55dQzQRKVl/4sTvc/0OhUMtZjF2GbuWyQ8UeQ4E5?=
 =?us-ascii?Q?MRbfS6S5idol373TyZEllr8ksgYLIY5jC7hu43hTzYhGAjsUk/7plKoFg1Xr?=
 =?us-ascii?Q?ocguOYjOgNiS/ZldGrg4foemh+A9aK5m1dpldcRWfUrtzxG9yFMnhgBBKasj?=
 =?us-ascii?Q?PMZiRruZl2oHNyT8OneXf/HldfygiVOVfJGdTIaF9gcNDHx0qmmtmKTR63/m?=
 =?us-ascii?Q?YdDTvs0bLbVFxJ3g47fyIZYpxZqG1FP55j7dlu6ZHOn+ZigPhXlqw19qok2Z?=
 =?us-ascii?Q?nibiirkDvfEOM6RM0CoK2EAi5NlKttx3n3446TlmK38LDMIVeIS7FAeRG9Ua?=
 =?us-ascii?Q?gFx7TozlWWuRKroavpI0OfqOZ8LBiv26V39Xi9/rnGJBRVP+NZWA/cRjf1d/?=
 =?us-ascii?Q?6gzrE91rJSQ2HVcNF2I3+GbIXqgVHxpUG7u+cgkKQwlRHxG740RcKgfpwyMs?=
 =?us-ascii?Q?sdbWIqP9c5bISg6nxp7rQQ5sCwWUOitpKuXGUvAJOgs/VBcAaJVLBJ1Hnvab?=
 =?us-ascii?Q?BVIZwfAdJCIK3k2CK4g343J4DglHK3cmgEku+sT7xQox4YyrnLh50wzqU+3o?=
 =?us-ascii?Q?+AmOQmF5LBZFp9T/oA+s5KonG7CmqPr3TO93NsAXAIgtvBhTI55aPU0kOCwn?=
 =?us-ascii?Q?66SorjL2mhOkSyuU8ly4sUA1CGiglrkKPT/ZM4cpsbGIcLGrRJ6fyXvpopPM?=
 =?us-ascii?Q?zWXieCOLtdGZdEIUf0R9tYp/xfAu98TB/Dig83AhNUD4gQMo0IRaM84FzdIq?=
 =?us-ascii?Q?oaSoK795MEfYhUm61Ix8c6jboofjDuOyF0KPaGvp+2iCK6m3otr+0jAIDk0K?=
 =?us-ascii?Q?fWNLg+3uqyhqHik3IWRBkBPAK7Z3+sgYNiabTkC+90yYjSiAzekjm4+tbzqX?=
 =?us-ascii?Q?9YEMIUU9xb1t9yheM/djEsaIl1D2FJ9ss8nXAJbaPe3CQhsloU0s6DQT1PQE?=
 =?us-ascii?Q?U3frOIdzm2//hTQzaT0pNxdd1HRHA/nb6otfugG39McLTXE6JNFhUeyATQ45?=
 =?us-ascii?Q?bIPMCdEMnrxTXCGARvc8T3hjftoxzzx2e9ir1DWKHUfg5rE1zy6n1VqqZhhy?=
 =?us-ascii?Q?uGm2xS3kxA=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mKGH8ncbYPia0EjUbgn95vHCg/nq+5TcU2xT0183KdNRumXEGL58RDmKzdlI3JNKz1EXhcdFDU6u/39cWVeOYGeXQndo3JWvlNiUyjPRVRkR9XlnzQ57yfYIAGpjExT0UMGEG75A/OldUl6+hkclrGhNLxYYRvYJ2YUZnV1Lh5YsORzmeleyT1u3BWZckVsdNqYAu4+ONqZicixQkJk/lSwXWN99N3K5grBMcW9Hi472p8Y9kB5Pmm41G3pwkFQauTCbAk0CR0pkGPOaWl6/M4zLj3UwaEqr+p3LXEE8gSDzmi2Xa7cL1dRpz/knj16p+Jc2OAQAheSzL2IrMWAYUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cccf7ac7-eeac-4a63-6e73-08df252f555f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 11:28:53.5704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IFxB1yOToSRFi+AOYYsWJEh7QNndNuk7ADBGq3yHbGo8fCpIkhw/rfneI3QYRw3Iq3zQThasI5bdPM04o8jTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEC77118F8
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042910_007173_816BD976 
X-CRM114-Status: UNSURE (   7.18  )
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

On 2026-09-25, Aurelien Jarno wrote:
> As you also mention that you reproduced the issue on the Spacemit K1
> hardware, can you please tell me if the bug appeared with similar
> symptoms?

In my case, the issue manifested as a SIGILL coredump. The signal
information was:

    si_signo = 4 (SIGILL)
    si_code  = 1 (ILL_ILLOPC)

So the observed symptom was SIGILL/ILL_ILLOPC on SpacemiT K1.

Thanks,
Guobin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
