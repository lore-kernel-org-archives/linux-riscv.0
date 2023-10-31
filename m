Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E4EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIyCK49jJUFEmixFuqBqbz7uXOsJwT7GEfxyZbrzqHY=; b=al/61VgR/8Bjpc
	QuLfaAHUEhtVPHWCAUOLh8641imlHczMufuFqZsmmu+CSTziF1F5aRhlrAQmbBIH//oxu1O4vNdPB
	D5LVVmv4RNbaMtBSxE8GRz56Ll4c6488UmvtkL0O64ZE2AoYBQNioBjx7TsOGbjoZ33gKPH52nQBS
	5Z3c4m4CrHPRYNdTB1NPrXvyBDFSemP9ThU1X1co+O6Ts314fvCbZLmo9/KPd4c9bSFS72shLF54w
	rb9eg8FzFv3FU/wt3fi6QhEUpvq35Uqz9bjEswgwu/6QtnTjSUCZ6BtT9r7nuxMPxj8FeDvJOhFWA
	fNq+UedtxCk+bHKktQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxlPk-004uW3-08;
	Tue, 31 Oct 2023 09:52:00 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxlPK-004uKm-2A
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 09:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698745894; x=1730281894;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TBOCTcQtVE+pmI/X5AryfKN3HtolaADWsAMEPwCHwKc=;
  b=OmXGKXgAgimY6Dn9QOGySUNnbbW1M/a1Y/uaOMf82wuz5Dn0ClO1vDke
   WqLzrGQGVG/+5bs3wKhB53Xyno5R4zyXMVAEtyFciodiQZXeh4hedB6P8
   r9J259t86py4tfjZr+xSFvFbHHsUYeiha1c5TZPrNFO+LvTEVFLIdIr2s
   CPIoVZzuoSOsgmrxRhbYEwqXSTt77TrbjJCSOgNdaS+zwtbrDKcFyvYEq
   /3tn3FoJ6CMHrgyD4rV77QU2sgK0eRMIik9/qp10KVsDVU6+dj8WkXldq
   XMKZMn8iug36xnDitHuKJmwDq0HQN4tuQ/pl+SHiXLtsK/YDSscsgaHh8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1137380"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1137380"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 02:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="760570387"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="760570387"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Oct 2023 02:51:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 02:51:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 02:51:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 02:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKnDPxgC+z3057zWiaRzFGiETxkhaRQhOGFvbconLe/UU5wUdPD2kgShG45LII+JWTZTwxrcViIpfhyFhyE9y5ngoXDzfvWsxCPv6pS/mqHyUTMSRdD/wlLnGhfk/ULUv5dypw8mOmqHidvos0URtYcSI0urX1088FE+N+cEvgeCNUEtIR5Qc4LbPZ2QXsjDSxUXCD6+vSIEtI4mxPLqHdsjZC8m0lS+1fBODTg4GyBoJKPihMXcwPGzEQ+CmoU5zprTxPPfz2IdZcd/xP/JNKP4rZEibp+LWQ+HsNW8uMM5JN1QeY62iVjF4pLo/I8xwOCpjv/h+pyJetxboUNXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBOCTcQtVE+pmI/X5AryfKN3HtolaADWsAMEPwCHwKc=;
 b=U/4Tq23/SvjmVcbYANLhOOp78U8kGUBpHl6zjEzDSC1nVRfNClgFxwwxv2Q0kAjWsI9DhyK7ojo7gfR2dxFKxzitV6Tjo7kkvXoXRpEkTDw7ByIUWo5IWdARbF5cY6GkCCRX4P9sulP3YkEzHngNM++BtBELE9TbTIWXF50DCLeKucm5vIe5bXzCsfg2vS07ZiSOqKV9AH29cq8ht3lpvTgA+0vDk67zoWNKTYOkW6aKLecHINTn/gKQ6yubLKRkzJJsZ39l+PvF99zosBLbXX/LTCjK1GUB8Nt2IgiOHgB2IOgdDMRPNfmUj4nkuOZXKVunJ0+1cKzRELtLYEz9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Tue, 31 Oct 2023 09:51:18 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 09:51:18 +0000
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
Subject: RE: [PATCH v8 4/5] riscv: Add checksum library
Thread-Topic: [PATCH v8 4/5] riscv: Add checksum library
Thread-Index: AQHaCScatbmRPPMW4Eie3q/hwiTEG7BjoxEw
Date: Tue, 31 Oct 2023 09:51:17 +0000
Message-ID: <DM8PR11MB575145F9D46C35AA3600D037B8A0A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
 <20231027-optimize_checksum-v8-4-feb7101d128d@rivosinc.com>
In-Reply-To: <20231027-optimize_checksum-v8-4-feb7101d128d@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB4784:EE_
x-ms-office365-filtering-correlation-id: f2ea4990-d7b7-43d5-e271-08dbd9f6edea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YxFxoo0tMU9eRJSRe0NGilQOrS4Qi7FtA5WdVd65j+JxZjXzkkuQI3/YHmMywjx0eeVWtqnWZJXXL+UYOyB9OtRYSwA4elZigFik6pFTyTifmtgbQnFWRMgR0KsorStURYBTPHvYjmwXKkMWiCW/XCZOJEqrX/gYWO/w+WtAJYWJunwNkEIt7pIO82FTijk3JtuKz11iLmNFXjo/Ap5pq92RrTY0gGkdixQL9/XqFAnkyI5SON63qWZvaZSG6vXcX5Nyj0c6XcOVlUQeZqMoQKBiN4aMd/6VHYd+EAskLBIBvbEm9hlcXXJXMiS91nnPxVOVal9tA25QcLDost6IICASz97NtBviPSdFKSGPlS5OZy2tDrKD5OUA/6HGrmmHFWHE0JIXOZd64YSPVYY4JGA84OuxoXGKVt8E+MMqiIUxpuwDM3737Ru9HwgNPdS3IUQvIPduwRV7Jd7t61EOLjJqY3PjjCZNJvl2rjKRHvl1F81duhXEpBBudjXrfwY7X73Z8VFdZyHBvfDoowqIOO5C541WSHw/Zsn9t3DqQAmy8cZ5CclMY+kR93fQydLYrWtCj8ogLxSyhO9FzkzbDrmPklYIVRxxZgSSKNuHallKKoqk5wvF6bEwJ0F4fBWf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(55016003)(478600001)(53546011)(9686003)(71200400001)(7696005)(6506007)(83380400001)(316002)(54906003)(33656002)(86362001)(82960400001)(38100700002)(122000001)(5660300002)(30864003)(7416002)(110136005)(66446008)(26005)(2906002)(41300700001)(64756008)(38070700009)(66556008)(66946007)(66476007)(52536014)(4326008)(76116006)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnhkSXFHOU1DcklSWmtsL0w2by9RZFprQUFDNldRdGt1d0xuNXVtZmdnaWx0?=
 =?utf-8?B?M2xOa2NsZ09RUkdyL1pDUW5oMHZuWnVoaC82emtTOFpIUGlNekdRQTVxeTFH?=
 =?utf-8?B?T0M0ZTIyU2xPYURQQ0J0bkptM0wya2lBT1BHZjMyZDdtV3NaZDNXbDdXa25P?=
 =?utf-8?B?QzVZSDU2WVBNMWNwN2pXZFJXQVNlY0lQNnRyeHI2Z1E1WjEzdm9xRHg4a3hx?=
 =?utf-8?B?VzI2ajhoelZQZktKUnZxV1dPSFVBNjdqL0ZmaWwzR25iNElESnk2b3RHcWdQ?=
 =?utf-8?B?ZnRHVEg0TGQ0blNsdlQySzBuRGhkcE9WamxUZ3hVU244dmRjQmx2Y2xKaVdz?=
 =?utf-8?B?Y2h1TVhRR3J3UkExT0hsWTI1VHhLVTlOSFU2Zks2K2U0SWh2N1Y2Z2NWRHRH?=
 =?utf-8?B?K0JZWXdWUzVOUUorbkUxK0thUzJCUFA4aUlQMkhxbmF0alFUcjFGL2lqcVIv?=
 =?utf-8?B?RUh0V2N0dXl1b0pWazNJSTlYVzAwVVpkb01PY1p2d1B5N3V5S2RReEJ0ZjEr?=
 =?utf-8?B?bHlxUTVmYzYxUGhlTGNrSUFiYmNtSkdqUERmckQrbTIxVlpPTmdNeDg5K1hR?=
 =?utf-8?B?eWhlem5va2l6VXNXRGFtcW1ZaGlVaUpOY1ZRMG9tWHZZNWhFNG05akFnSG9F?=
 =?utf-8?B?NG9URGpCYWhPOGY0VGFuOENvajcxNXVsNC9mVTN3eitJNkV0TUlDSjdCRlRX?=
 =?utf-8?B?Ri9HWmVmaG9KRU0vcGwzWEFqTUZ6dnRrRVV6Z1JpaVJJR3lkaTQ2MWFlTzdY?=
 =?utf-8?B?TzJwdmphZktkOERkVVIxOFozK0dKTDM3bEE3NnpaTjBzZ2tKQ1QwQi8xMVA5?=
 =?utf-8?B?SFZwK3NXZG5DVlNqOS9DalNPUjNESGxDZkpFOHRHc2FnMHhMbDVRdFhZVmVn?=
 =?utf-8?B?dGNLVnczVjVLemZ6dUFHRm4ycFNJMlByY3h3Qno0RXlTd3JVSzBYbDUwcFBY?=
 =?utf-8?B?UTNiMDgzNFVFNWZzYnd0K3A2c2lRaUw0U2NkNk1XZ3QwN0NjajdQNGhvaExO?=
 =?utf-8?B?OXRQWXRGV2N0UGZUL0RkNEhUK09ESFB1cFNkR01ud3FIK0IrNHdXbUtyT2RR?=
 =?utf-8?B?MnBzeXFhcjdMZVAzNkZTUEsxZDg0cFdwM1dnNjhhaEhYTExqdm5BeW5aMXJk?=
 =?utf-8?B?NFlzMlQ5bnRpTVJTTTFJNkhmL0c2RTFLbHczTldNOGhsaWE4eU92QTRVa0Jp?=
 =?utf-8?B?Q3RIS2NsR0RDZU9KZnpLcDlsVUVXS1NpUlBFemN4STQvdms5Vm9VRGdtcWtq?=
 =?utf-8?B?d2lhKzZpdEU5WmM4cGIrRkg2WFlnOVJicHFJRzRsU1BPd3B1YWlsejcrckVp?=
 =?utf-8?B?RGgwS2cvVnhMNE5PU3E1d1JTWVlCdmorZlViMmsxbVJFSnFsM01ESXFRSmdj?=
 =?utf-8?B?alJNOFJLcEhWYjRWY0NHUFkwTzkvc2xQRzNGS2RkZ09JUklRMkowNWN6OEI0?=
 =?utf-8?B?K1o5NlVrdzM4eWRnVVhtNGNmcHdBNytQV3YwZTZreWtQYzM2WEdpRUhGYnc1?=
 =?utf-8?B?czIvMnB2UnBUaEJjUkVmTGt6bW9rSW5hVy8wSUZNQ3R6TjEweURFemgyYXNE?=
 =?utf-8?B?T0drbndScmU4Vi9OWWxKZlQycVgrWHZqT1laNUpHRGhObmpLczdOYlhvcUtF?=
 =?utf-8?B?T2hva3BJeUErTHNDb1p5RFFFUFZNYm9GUmM0Z0J2KzlDUzlIMThjSkk5dW16?=
 =?utf-8?B?QXVvRGlwaExxc0tsR1dEcHVjb3VDUndEQjRVZ055RlgvNng2alJBdHpqY3Ft?=
 =?utf-8?B?Z2M2TUhWeVBJSllHRmlyOGlzbllXYmE2TmNGRUpnbklDdTJtQkpxTjFIWFlH?=
 =?utf-8?B?cXMvMEExRVFwNVZ6QncvMFVjbk9lNnovNGd0b3ljSzlSWDFnMUs3L2dwSWtL?=
 =?utf-8?B?S3BIS2pITXZIS1hGT3RNTUVIOU1YMDlGVFU2NVRLSi9BODQvcnpNQ1J5dHZE?=
 =?utf-8?B?djVwZjlUUElhamhpai91WWt0d0pCeHVPaGRBQStYMUNIOTRrWjlHdkZnVklv?=
 =?utf-8?B?M3J4OUVKQXBQR1RHT0FhVUJmclFYQURuMGIrYTlLN2RSWFE5WWlxMDgrUGI4?=
 =?utf-8?B?cVV6VVJEYy9vZGhkWkpvcVVFKzVJNGZxRFh1ZlhtUklUMXJFRkhCZllKQUZp?=
 =?utf-8?Q?m08IHDKZmxvCicvaUcUFouyHq?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ea4990-d7b7-43d5-e271-08dbd9f6edea
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 09:51:17.9811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXGHPNzpfSVRSjloiM4Q6UFjpmgUBQXjgaIEr0QXD3HHy+CQaVxy/yFAUM3wbr6S+xR+y3NkB8qVgm6y5MofAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_025134_795285_434D7E50 
X-CRM114-Status: GOOD (  24.67  )
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
> Subject: [PATCH v8 4/5] riscv: Add checksum library
> 
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/lib/Makefile |   1 +
>  arch/riscv/lib/csum.c   | 339
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 340 insertions(+)
> 
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 26cb2502ecf8..2aa1a4ad361f 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -6,6 +6,7 @@ lib-y			+= memmove.o
>  lib-y			+= strcmp.o
>  lib-y			+= strlen.o
>  lib-y			+= strncmp.o
> +lib-y			+= csum.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> new file mode 100644
> index 000000000000..f90e73606597
> --- /dev/null
> +++ b/arch/riscv/lib/csum.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IP checksum library

Same comment as patch 3/5.

> + *
> + * Influenced by arch/arm64/lib/csum.c
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <asm/cpufeature.h>
> +#include <linux/jump_label.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kernel.h>
> +
> +#include <net/checksum.h>
> +
> +/* Default version is sufficient for 32 bit */
> +#ifndef CONFIG_32BIT

Why not use the same #if macro "#ifdef CONFIG_64BIT" as in checksum.h

> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum csum)
> +{
> +	unsigned int ulen, uproto;
> +	unsigned long sum = csum;
> +
> +	sum += saddr->s6_addr32[0];
> +	sum += saddr->s6_addr32[1];
> +	sum += saddr->s6_addr32[2];
> +	sum += saddr->s6_addr32[3];
> +
> +	sum += daddr->s6_addr32[0];
> +	sum += daddr->s6_addr32[1];
> +	sum += daddr->s6_addr32[2];
> +	sum += daddr->s6_addr32[3];
> +
> +	ulen = htonl((unsigned int)len);
> +	sum += ulen;
> +
> +	uproto = htonl(proto);
> +	sum += uproto;
> +
> +	/*
> +	 * Zbb support saves 4 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +		asm(".option push					\n\
> +		.option arch,+zbb					\n\
> +			rori	%[fold_temp], %[sum], 32		\n\
> +			add	%[sum], %[fold_temp], %[sum]
> 	\n\
> +			srli	%[sum], %[sum], 32			\n\
> +			not	%[fold_temp], %[sum]			\n\
> +			roriw	%[sum], %[sum], 16			\n\
> +			subw	%[sum], %[fold_temp], %[sum]
> 	\n\
> +		.option pop"
> +		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
> +		return (__force __sum16)(sum >> 16);
> +	}
> +no_zbb:
> +	sum += ror64(sum, 32);
> +	sum >>= 32;
> +	return csum_fold((__force __wsum)sum);
> +}
> +EXPORT_SYMBOL(csum_ipv6_magic);
> +#endif /* !CONFIG_32BIT */
> +
> +#ifdef CONFIG_32BIT
> +#define OFFSET_MASK 3
> +#elif CONFIG_64BIT
> +#define OFFSET_MASK 7
> +#endif
> +
> +/*
> + * Algorithm accounts for buff being misaligned.
> + * If buff is not aligned, will over-read bytes but not use the bytes that it
> + * shouldn't. The same thing will occur on the tail-end of the read.
> + */
> +static inline __no_sanitize_address unsigned int
> do_csum_with_alignment(const unsigned char *buff, int len)
> +{
> +	unsigned int offset, shift;
> +	unsigned long csum = 0, carry = 0, data;
> +	const unsigned long *ptr, *end;
> +
> +	end = (const unsigned long *)(buff + len);
> +
> +	/*
> +	 * Align address to closest word (double word on rv64) that comes
> before
> +	 * buff. This should always be in the same page and cache line.
> +	 * Directly call KASAN with the alignment we will be using.
> +	 */
> +	offset = (unsigned long)buff & OFFSET_MASK;
> +	kasan_check_read(buff, len);
> +	ptr = (const unsigned long *)(buff - offset);
> +
> +	/*
> +	 * Clear the most significant bytes that were over-read if buff was not
> +	 * aligned.
> +	 */
> +	shift = offset * 8;
> +	data = *(ptr++);
> +#ifdef __LITTLE_ENDIAN
> +	data = (data >> shift) << shift;
> +#else
> +	data = (data << shift) >> shift;
> +#endif
> +	/*
> +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> +	 * faster than doing 32-bit reads on architectures that support larger
> +	 * reads.
> +	 */
> +	while (ptr < end) {
> +		csum += data;
> +		carry += csum < data;
> +		len -= sizeof(long);
> +		data = *(ptr++);
> +	}
> +
> +	/*
> +	 * Perform alignment (and over-read) bytes on the tail if any bytes
> +	 * leftover.
> +	 */
> +	shift = ((long)ptr - (long)end) * 8;
> +#ifdef __LITTLE_ENDIAN
> +	data = (data << shift) >> shift;
> +#else
> +	data = (data >> shift) << shift;
> +#endif
> +	csum += data;
> +	carry += csum < data;
> +	csum += carry;
> +	csum += csum < carry;
> +
> +	/*
> +	 * Zbb support saves 6 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +
> +#ifdef CONFIG_32BIT
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum),
> +				[fold_temp] "=&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return (unsigned short)csum;
> +#else /* !CONFIG_32BIT */
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum),
> +				[fold_temp] "=&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return (csum << 16) >> 48;
> +#endif /* !CONFIG_32BIT */
> +end:
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	csum = (u32)csum + ror32((u32)csum, 16);
> +	if (offset & 1)
> +		return (u16)swab32(csum);
> +	return csum >> 16;
> +}
> +
> +/*
> + * Does not perform alignment, should only be used if machine has fast
> + * misaligned accesses, because buff may be misaligned.
> + */
> +static inline unsigned int do_csum_no_alignment(const unsigned char *buff,
> int len)
> +{
> +	unsigned int offset, shift;
> +	unsigned long csum = 0, carry = 0, data;
> +	const unsigned long *ptr, *end;
> +
> +	end = (const unsigned long *)(buff + len);
> +

kasan_check_read() missing in this function.

> +	ptr = (const unsigned long *)(buff);
> +
> +	data = *(ptr++);
> +
> +	/*
> +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> +	 * faster than doing 32-bit reads on architectures that support larger
> +	 * reads.
> +	 */
> +	while (ptr < end) {
> +		csum += data;
> +		carry += csum < data;
> +		len -= sizeof(long);
> +		data = *(ptr++);
> +	}
> +
> +	/*
> +	 * Perform alignment (and over-read) bytes on the tail if any bytes
> +	 * leftover.
> +	 */
> +	shift = ((long)ptr - (long)end) * 8;
> +#ifdef __LITTLE_ENDIAN
> +	data = (data << shift) >> shift;
> +#else
> +	data = (data >> shift) << shift;
> +#endif
> +	csum += data;
> +	carry += csum < data;
> +	csum += carry;
> +	csum += csum < carry;
> +
> +	/*
> +	 * Zbb support saves 6 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +
> +#ifdef CONFIG_32BIT
> +		asm (".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +		.option pop"
> +			: [csum] "+r" (csum),
> +				[fold_temp] "=&r" (fold_temp)

It's better to align the indention here, or we can follow the below CONFIG_64BIT case.

> +			: [offset] "r" (offset)
> +			: );
> +
> +#else /* !CONFIG_32BIT */
> +		asm (".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			: );
> +#endif /* !CONFIG_32BIT */
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	csum = (u32)csum + ror32((u32)csum, 16);
> +	return csum >> 16;
> +}
> +
> +/*
> + * Perform a checksum on an arbitrary memory address.
> + * Will do a light-weight address alignment if buff is misaligned, unless
> + * cpu supports fast misaligned accesses.
> + */
> +unsigned int do_csum(const unsigned char *buff, int len)
> +{
> +	if (unlikely(len <= 0))
> +		return 0;
> +
> +	/*
> +	 * Very significant performance gains can be seen by not doing
> alignment
> +	 * on machines with fast misaligned accesses.
> +	 *
> +	 * There is some duplicate code between the "with_alignment" and
> +	 * "no_alignment" implmentations, but the overlap is too awkward to
> be
> +	 * able to fit in one function without introducing multiple static
> +	 * branches.
> +	 */
> +	if (static_branch_likely(&fast_misaligned_access_speed_key))
> +		return do_csum_no_alignment(buff, len);

When CPU doesn't support fast misaligned access but the buff addr is aligned (checking
by buff & OFFSET_MASK == 0), did it worth adding this check and then possibly calling 
do_csum_no_alignment()?

BRs,
Xiao

> +
> +	return do_csum_with_alignment(buff, len);
> +}
> 
> --
> 2.42.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
