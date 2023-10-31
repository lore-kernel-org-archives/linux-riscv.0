Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD623C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KsFD13ZsV560Kuaxf/HYRgUTvbVSI5l/tP28rfC5zQ=; b=kBoYmvs7HGnCY4
	+goV6JPLPaUdxFl9OjKBzIhtZJSo91mbUeBYk35l1fI4gkCr1FQ+j99aZX4aErrzHwoo1prHPPFuH
	F9lFiZqblqVyb124YzXVA4YetxMDfh62m13NI3bKDYctZDcS1XpHW0lfEMH3/UMs1mRi+cYJkYG5L
	l78HX3u9cv/ZtfEa9eUUA6ow7kHl52OPQyvqSUBQeuU05FX8CIGD3v4SNm9Uvba3QVks5p/aaNnU/
	hDK6Q3YivIznJ8GCynkj7iPoudPg1iXF8c1pBWcdu3jCXmpguhIICo6Ep6uA0kKYNW2PeABuIrPfk
	cJkAa62ePUmzQ7MZ7+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkmY-004r97-2a;
	Tue, 31 Oct 2023 09:11:30 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkmR-004r7v-37
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 09:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698743483; x=1730279483;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qH/VlD/DSdJS9HVNOVdVm3l3tve3grgqnWLF0d+FETc=;
  b=RIex2t0fn5B45OxiSHhNL6hGj9hjqUy0UQ2cfo6yjMA+CvvNb4D8nWlw
   haRsbC9kmfqPLbXh/KMUKS0+No7eRaJ3hqR2ZPCIl0lY2+bf0BUDHAHg/
   4DICwpT/AB9+WQb9Nspb/k0ZH83mvWFCQBokRpx+Mz07LiY73Xn3QQJFb
   iZlto5LC+PnC3Ir6L/codfFaLLRlEc/aC0idH58I7TpzHsZKqumBu2miR
   clD4kRmi8Y18S2S9l2VeFY899/ac2rgFtntSoNOydnDiDSFwS5hQL2gKt
   8VPDpAmbDNhoZGL0g6OL+xjCz+gifcUKkK2LuNwp0a45nh2tFDgJVHSM/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="385434406"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="385434406"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 02:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1733261"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Oct 2023 02:11:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 02:11:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 02:11:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 02:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iT6CN/pjgfsoVUa24Q/DpKst1QWZj0tpWgU8oW1sbNNLQtmdJWCU9OfpE9+PWaFmWwMwTtGjqd7Y3LfRN1MeBev6+3H+2QWIH+tK1C3CfBQKtX57EWS6RwCjejNaxQkyZGO681GHsrq2QMBffTUSSkE16J5nHM7+jDYd3nuc3pqjEI3hc+I5Iz2nizaAnTjUyyEsddMP7LEuTYT/n/K9Hl6N70wou2kSy9fagsqjt5xjI3QJS1mc/UVaRZrjJrGxmSHPSKrxlTreLBsm0shZsPxTeRypOOouqG7fpMCaCxQYECR+SREf438KB+XZ91ZwbunX4fxufB1TVOs1WX1Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qH/VlD/DSdJS9HVNOVdVm3l3tve3grgqnWLF0d+FETc=;
 b=IR/Nti69IwiIrVq4bl9AY4Itza/i2QPK53vlwLrq+fknnhxpoZj9NdvbPe0wWNvw1xJ/RcBlkXaQUEt5DT9I7gsMfX5XPrzfFND075JByGyBCwvQEhTEDATPXJz4pPjlClX8f5gedc1kwV3shseqf8O7NAO5/9+aqp+5l3vsRi0Xjcav2DbG3OrLIHo9YiUFCkSbVSY4V/NZRJhSBzVGPYSO5QFgAxvQehPR5rjAZQddSFr1OGBP9v0B1+q1PW2Sybz6D/9BHIQIu8QbRheoPfugSN3INxnw3RfzIdMcO1phZcZvZTyRKL01irAO3EcEWS1Hytdjl9kQK3wu3ImpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Tue, 31 Oct 2023 09:11:08 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 09:11:08 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, "Evan
 Green" <evan@rivosinc.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v8 3/5] riscv: Checksum header
Thread-Topic: [PATCH v8 3/5] riscv: Checksum header
Thread-Index: AQHaCScbyez8kuVx206/Fnj5ZW42L7BjnJTw
Date: Tue, 31 Oct 2023 09:11:07 +0000
Message-ID: <DM8PR11MB5751FE93CB74EDE4A2F4876BB8A0A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
 <20231027-optimize_checksum-v8-3-feb7101d128d@rivosinc.com>
In-Reply-To: <20231027-optimize_checksum-v8-3-feb7101d128d@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB6393:EE_
x-ms-office365-filtering-correlation-id: c24274de-f7ea-4b1f-44e3-08dbd9f1517c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jHUj02YIDEyziarBNKjd3E2uXgievqVwhaiBKAhnihCE0nQy8EOTYFGFZ450v1RypYL/XaEmuOfQRhhbHX+nPmC+HZbgy4LZmMEYN9qqG5e3OQJuRXGSw3bOhJrgZJ33cXt6NGBoMVpvj/qeazMPbFvqoTT5zY9VJ8UCpbAPpAAj9Ueb01F2g9eZQ/e/xpuDycKpJPf0FhvRJ3Lkr9ggGALt/9ZWpkwgSOUf7ngWDZaPADVmmd5o87908uGiGZRYxmO+lxpdLT1REPn2yMg4c0vy9L6NCfD+eN2SIztfEiAzGvn+kACd2Q/MLnyOSTvopDUCUbt1g04xqP1WpWxoBv0bhiBJRDap9co1+6gOjQDRSoT3aLFpoY1PId9P0vSCVdhy1MBow3lYC+7WzwXYPOmpTh0coS3EysfFpMvQy34jjqkENTSrITSCblFPtR9Ab+NJLz4Odok8WIbS0dDfSfJsxFJDLEKKZw7pTQCJIlp1Bm6TrLhjnl5IhyfMVsKhsN8fA5f0xTDxAsIL+gW8Wj4+Sy2WC4hwhsYkMeM8t15/82ksJZxlgQqDZ541zWNZZ3qy4x7Ff3mGm1j09MY/3fHHHxEXuiX9WYNczE2uvqaH78KQpknQLpabVReHR49/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(26005)(38070700009)(38100700002)(55016003)(52536014)(2906002)(41300700001)(76116006)(64756008)(5660300002)(8676002)(86362001)(33656002)(8936002)(4326008)(7416002)(478600001)(66446008)(53546011)(110136005)(82960400001)(7696005)(71200400001)(122000001)(6506007)(316002)(66946007)(66556008)(54906003)(66476007)(83380400001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmsrMTFhQ3dGSGF3ZHVwOGlqOE41U2wvcVhYSlliRlRpNVNnN2wxR3czMzRF?=
 =?utf-8?B?TnZvd0tBSW1OTnRPQjRvZkJ2aWJudklqbXZoc215NXNNY2ZVSHFXd3U2RG5S?=
 =?utf-8?B?UU5TY3VzdGxDQ2VjQWFGUFJwL1Y0VGFaeTJPc0NWMWZUNURETG9TZVBJR2Jh?=
 =?utf-8?B?RkFIeHJCZTBFbWxDdzdLandIRUw0aURaekFOQzZKbmhYYU1vRUo4MGMrSXkv?=
 =?utf-8?B?T0VMNnJwRnc3Q3pOdW4xclE5Q2ovYnptdXpMRi9pY3FkcGcrQjg5Wm1RL1ll?=
 =?utf-8?B?T3pGeTgwTU9GZ3pyZHVUNVBKaGZNa1BQOEdEdkZZRnJZN3R6SnZLa1hXNEJD?=
 =?utf-8?B?K1pPSTZIb2pDcVV6d2hlKzJsQ0NLdGRsbWtrS0h6a1Y1bUYrdTBsRVhFUzNF?=
 =?utf-8?B?VUtiZVFWVHZQL01Pd3BrQmVxTmpvcm5COWw2ZWY4YTVKdGo2L0RDak01TFg1?=
 =?utf-8?B?TmVLRHZmU21MR0FsNW51azR5Sk52UnFOZGlYRlBhenl1MzVXQmNZT2RlVnA2?=
 =?utf-8?B?eG1vRzBnTkk4NTVYRzNrLzFkeWNtY2hBSURZNWd4RDRFMnBOZ2NRaXRvcmVI?=
 =?utf-8?B?Q0hZZHBUblI1R0Vucmt6ZHFxRW5QUHhONlBIYk1TbXQwY0FuaTdlZStoOVN5?=
 =?utf-8?B?b2RpUUIzd2crVUt0b2tYR1NZYUxOblA5R0lIcm9XdWw1T0Y4eWo3QytxM0Ny?=
 =?utf-8?B?SnVCMFFmeFp3NDBkdFRUOVRCcHYxMUN6emJTU3J5RCtYNDNhUGs5UmUyS0tK?=
 =?utf-8?B?dkNYSVliY0Y3NEV1VUMvVjdINWtyNWhjQWFpQkZSdFpIamd4K2E5VktEVzVz?=
 =?utf-8?B?SUJXU1BFT0NJejZzUk1nbWNIQ0ttRFcvUWJnWU5vNXFwbmIwYVhmQ01QR2Ur?=
 =?utf-8?B?RUp5eHRkTFp3Q0M2S3JwaGdSQ0RvL2xjbHhQVnBJNnpxNVFjaHkrQTdRVkJs?=
 =?utf-8?B?RGFLb1JlRlNIY0NJWUxkbmd2N3Axb2QvWGR0VHJKbURRaFpYYjlDcWp4Z3dP?=
 =?utf-8?B?UTlCcWZNclVqMS8zNXV3TTl2NTU5MzE5aWVwUUQ4T0lvckRYK3hHb0NoeFZo?=
 =?utf-8?B?NTdiWlVzVDJCcE9WY2tNaGJtcndMa0xBeHZJZUpYRno1Q3NWN01QTWlFZHR3?=
 =?utf-8?B?MHllTDRmQjEzZWtUNDk5VXovWm5hcFIvWnZDTTMyOXNYODNyd2JNeFEwNnp5?=
 =?utf-8?B?ZGc5ZjlWNTQwRzIxVzNPblBua0M1aEtWMXk3RkRUbW1ZUEwwTnN5RDA0bXJt?=
 =?utf-8?B?WThVdk01czlHZjJTU2V2T1djdXFycXRkUmMrMTUyM1NHSkw1ZW12M2U1eDB2?=
 =?utf-8?B?VnE2cUZUZFdvSkRJMUJoKzVyTXFGM2xvdnJTM3FRd3dNT2pkNkRSeC9KSXhZ?=
 =?utf-8?B?eGZ3UERzZlBQWlJCeUtXa2R3d3pmS25FQjU5bkR6NHJEeEo2M3YrNjVZMjFB?=
 =?utf-8?B?VUJXWXRoM3NBczZ0Q0lMMnU0QkdkZmdrdmlpUHlGak1wdEk3VmMwdEJiZ1Mv?=
 =?utf-8?B?Y1prOWwrRDU1bi9jazlJb0Y2b3VvWVYwZFlMckc3VTYwK1VqaGxkUmI2TE1o?=
 =?utf-8?B?a3grQk9Cd1lpb083ODhING5KZWdEMWFuaWZSTjZhYklZaHcyQ2JkNUwySWgy?=
 =?utf-8?B?clhwNUkrdGxzWTl2UmE4ZE1SU1lWUEJNYVpxeU15N2RjdFdCeHVWSHVnOHdI?=
 =?utf-8?B?OWU5N0NGdGNudTRxbXJ2Rnk1TnJUMzdmaGRkdURURmRoaVV4dDJkVmlxeXk1?=
 =?utf-8?B?a2REeEhTcXBYd0hIRWhsODFmaEtmdFJzcXhxUXJvUitkZ2hCd0hUNlB6ZVdm?=
 =?utf-8?B?OGphdW84N0FsaU80bHlQaTVvVUQ4SDloblFyallPU29kMjBFeDlpdlZlT3p5?=
 =?utf-8?B?b1hvdHpLSVRINENwdC9rSHZmWUZQTW1jbWFQR25WUzNyTVNEaXlvMHNzTVlL?=
 =?utf-8?B?UW1GVllSZzZLWUt4TG9QZUJpOThmd0p2QlZvKzFYU1BPTWxyR3IrQ05CU3BR?=
 =?utf-8?B?S2gvekUyMmhTK2dvZDJ4dU9wcHg0RzA1cHREK0c4R2l6dnVyVEV1QVRyVVd6?=
 =?utf-8?B?NjR1eWJkcEJUU1NzS2NGckdCY1lFYzFjRUZLMGJJWi93UDZXMTVIb2Vnb0gv?=
 =?utf-8?Q?mk3BGOdk2QezFI06QLPRuXMtv?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24274de-f7ea-4b1f-44e3-08dbd9f1517c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 09:11:07.9927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8e0s1zUxvtjSf6EHmV8VOpShzWrk2wp4SiJCtB2xCzQrLKV6RPSxuEZp2luCEYuftheywMVt7eD2tD/yE0myA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_021124_025802_82D83D6C 
X-CRM114-Status: GOOD (  26.11  )
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
> From: Charlie Jenkins <charlie@rivosinc.com>
> Sent: Saturday, October 28, 2023 6:44 AM
> To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> Wang, Xiao W <xiao.w.wang@intel.com>; Evan Green <evan@rivosinc.com>;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: [PATCH v8 3/5] riscv: Checksum header
> 
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/checksum.h | 92
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/checksum.h
> b/arch/riscv/include/asm/checksum.h
> new file mode 100644
> index 000000000000..9fd4b1b80641
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * IP checksum routines

The checksum helpers' usage may not be limited to IP protocol.

> + *
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#ifndef __ASM_RISCV_CHECKSUM_H
> +#define __ASM_RISCV_CHECKSUM_H
> +
> +#include <linux/in6.h>
> +#include <linux/uaccess.h>
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +extern unsigned int do_csum(const unsigned char *buff, int len);
> +#define do_csum do_csum
> +
> +/* Default version is sufficient for 32 bit */
> +#ifdef CONFIG_64BIT
> +#define _HAVE_ARCH_IPV6_CSUM
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum sum);
> +#endif

The do_csum and csum_ipv6_magic helpers are implemented in patch 4/5, so the
declarations should be moved there. Otherwise, build would fail at this patch.

> +
> +/* Define riscv versions of functions before importing asm-
> generic/checksum.h */
> +#include <asm-generic/checksum.h>
> +
> +/*
> + * Quickly compute an IP checksum with the assumption that IPv4 headers
> will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + * @ihl is the number of 32 bit segments and must be greater than or equal
> to 5.
> + * @iph is assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
> + *	riscv, defining IP headers to be aligned.
> + */
> +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> +{
> +	unsigned long csum = 0;
> +	int pos = 0;
> +
> +	do {
> +		csum += ((const unsigned int *)iph)[pos];
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			csum += csum < ((const unsigned int *)iph)[pos];
> +	} while (++pos < ihl);
> +
> +	/*
> +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> +	 * worth checking if supported without Alternatives.
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +
> +		if (IS_ENABLED(CONFIG_32BIT)) {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				not	%[fold_temp], %[csum]
> 	\n\
> +				rori	%[csum], %[csum], 16		\n\
> +				sub	%[csum], %[fold_temp], %[csum]
> 	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		} else {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				rori	%[fold_temp], %[csum], 32	\n\
> +				add	%[csum], %[fold_temp], %[csum]
> 	\n\
> +				srli	%[csum], %[csum], 32		\n\
> +				not	%[fold_temp], %[csum]
> 	\n\
> +				roriw	%[csum], %[csum], 16		\n\
> +				subw	%[csum], %[fold_temp], %[csum]
> 	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		}
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += (csum >> 32) | (csum << 32);

Just like the next patch does, we can call ror64(csum, 32).

BRs,
Xiao

> +	csum >>= 32;
> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}
> +
> +#endif /* __ASM_RISCV_CHECKSUM_H */
> 
> --
> 2.42.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
