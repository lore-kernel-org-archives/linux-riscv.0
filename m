Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AE5C83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReE6tJML7njjeaPVc2APmbd10lKZyhCD2qRwrfMe6kc=; b=bwOd/OQHd78KnN
	//d+6OkIIR1tpSfVLCsPRtZ0IW/lbH9ynnPMQCdLgSTHBQkINhKgPUNgrBxgWJM8tJuk9uo6Z8YhB
	bUywLvwoJxtZXzfU9tv0wLtukLZc/MDvUspctgZGU8D8QMOuobyn2C3h0zAhekuEmNBHlxb9MzSp3
	DesC6x2lAkottG8hsCxArRz+RyBKDLh+E4P5kIp/1f++tynyTsI9H1CRBwVEGsCjE4n5q0Cah5lT4
	2oMu/611sAkgKH+Oc78RU6/3xHDmTiZ2RCUFN65DXxyaSKMWj6heD4rP09CW3T+twcYJe2xqB/9Xw
	iYo9OpQ8nDoz2VapMtlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdSgg-005eG2-1h;
	Tue, 05 Sep 2023 09:49:34 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdSgd-005eFa-1h
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 09:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693907371; x=1725443371;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U1M5qPhXNB2QPYjjlHOQJGXfCCgib+yGMJtjnaee/lQ=;
  b=WKoS8VAPCpoqBQN7e/vJzGHfRcJV504CVS/XEvShlDklWoEnDfrHxyXl
   6bNs8KCFObo1ZpogFVAJnb1G/4k9uOd0WL2o0wVorVGNsEP9wVuuWZ7E4
   7CLJaxl1E1i8EVSlAfmpKJ8Z+xzDaVGXNU5cmj6SoS7w2PcmIVIMutmAW
   VTagWmketL3JeYKQcq2u/rwsxa99wDMZoWV6HQztHRV+9oEzZUBcj7++X
   RguE78wXEIShl1ev9l62Oa/jmxKR1rVY1ErqVK3BFcNGdFTFFlUqsx/uQ
   r1jypKW+FefQpqH/RNYZiXDDTo/ESYIHY+6EtJ7xKBYiCWBOD+IVphr2X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379473705"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="379473705"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 02:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="770279898"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="770279898"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2023 02:49:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 02:49:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 02:49:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 02:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmhsRGYf35KP52zVcccA2pY7uW5JMzX0RrXuQYO0Ore0qr4ZpeGLzAmO61SBLyQDfDoz56MPBEm0fZ/2eRjgCTfIur47Uc8MCftpUPSJzz/SbUko83qPEcqnIeMHs7ipDLQfKCKy6OVycFWSNfx4BC6tW9ieyMQf5VcaObKLAgXHcsF3beq5/zWwTupL5I14Mw5/MLZbm9bzm+Tc+kp8Zz34BlgUrmkANyd4/wJmiwZp/JDjUsbF+1putuPWtgqmmazEXzw6KzTT1297pU1D+/Rux+lZ1q0H7YSVUd6Rz2GHgMapdRezN4tcqBhm+/kTAj+Yjv2PKwH0OUNQpXpIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1M5qPhXNB2QPYjjlHOQJGXfCCgib+yGMJtjnaee/lQ=;
 b=VJFGnZq9Gm86AIkyNznfkHhMGIj2K9X9prkR87RBcNplhrNqOS7Vll74x0qMSgkbXouboxJrX7/JosDs0+PWnIn+hvMaGWpM5lBBjmrNFeso5snjZD19c3essUJmPD3iZFKBv6E5gENdQ+qMXscT+iYPGsL94jffOWhRSvV6Q065DzRVhhcht9q57PLCxwUjRJ8CPsv9tdDC7advVRZ8Y1W4pKDk7g0VvfSN8ZwqiGWq17ozHPpMebVsMAQATVfd6xfAZJIPUNVdtsj3ReSq5m3ED82fyQnO32XzQaKF+FogSIlK7uw2+zv4U5snp0tEgMAfkOaJFdJ/3jYvBX5sVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.27; Tue, 5 Sep 2023 09:49:27 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:49:27 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: alternative: remove alternative boundary symbols
 in vdso
Thread-Topic: [PATCH] riscv: alternative: remove alternative boundary symbols
 in vdso
Thread-Index: AQHZ3UN/Mb2FJmOivUiZGhwvCU4HhLAKv4yAgAFBurA=
Date: Tue, 5 Sep 2023 09:49:26 +0000
Message-ID: <DM8PR11MB575193E774FA8A49C88BED86B8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230902022510.818602-1-xiao.w.wang@intel.com>
 <ZPXrKz1jhqz5g3nF@xhacker>
In-Reply-To: <ZPXrKz1jhqz5g3nF@xhacker>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 7dbd4690-b25b-4413-c0c7-08dbadf5649e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aPZ8RKN6TM3hjT5MFNiMWbNk2zrHppT+HgHOjMT+F3b8R1TDlE8oKI54gbA7R7bRm0DB187oEzRTgTa/vkVkBqnp8vbITwz6TsgNOsC2h567QmA29Ju3AT8bolpitJWV62QhR6u5wejp+SUo8tAxMphVHaVukZDfFF2venvmBcxyZgqkzWJfeG9dqgIEOj1CtPEScW3QTBTvvdu54nCymHM7m2yDdhEbf0nt7vYc+0jvQVhzziRGB5knHe6JwaNInkodh1x8Mx2Oxh7g77bC7GStq54NhN+a5pJpuxyRmsJDnrKYw0evokpXp+yRJVYzGrR7rgEvNxU3wfarUKwYMPOjz5wAgWzBuI5qRyL6fZzN4Ff5FE0x04fa2TsIjNgx9ojE4KpECqZDyOYbFx/IDo9iw1eHlR3kHJxvr/l4OFOKSwfHIt7mSTXNC/Y0Zea2KASywNgu3WqiyJUJuUUt4+TaAtvShvZbdMDZaLOJE/GWEJ5E2yQAiEVRPpzcPpcCJPtDs0WVn224pQBoeABlMyXCli0n0VkOzKoDZBdLSuwoRTsuN/X4hcX/Pb628jlmwD3dGMkwXje/icczgXtNcBKHubS/C+Cyt3WKFEV57SY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199024)(1800799009)(186009)(6916009)(33656002)(8676002)(71200400001)(4326008)(8936002)(86362001)(6506007)(66556008)(66446008)(76116006)(66946007)(66476007)(64756008)(54906003)(966005)(7696005)(9686003)(478600001)(53546011)(41300700001)(83380400001)(55016003)(316002)(38070700005)(38100700002)(5660300002)(52536014)(122000001)(2906002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3k3ZzhQOVpMcldlRWpaQzdROGViZVd1enBPR2FPU0Q4anJ0U2VXRklCRC9S?=
 =?utf-8?B?dkk4T0VrcFcrSDdUWFRLUGs1aDFDa0diZWJYZjZ1SFNtOFdQWGxlUXUzTlZL?=
 =?utf-8?B?bVB2NlYvcVI4L0hQb3oybkIvdHI4bU1VcXY0dk9BMFZla3BjdVNERTRpVGhN?=
 =?utf-8?B?OW15Qjg4Mk9SZGxybGNOY2E3N2FhNURJelJPclpxRk5hMGF3aE9VN1c1bXJ4?=
 =?utf-8?B?REc2ZDNabXcvZXErYzlQK3BvYzUySERUc0cwWk1rNm40azNWLzQrV3pqczdF?=
 =?utf-8?B?bUNtVmFzdWR2U2c5dGZ5M0oxK1Q4RCtia2N4TTVDWTdCNTV6Zi84N1MzNDJP?=
 =?utf-8?B?dWV5bE1Ta0FNdnFiNFE3UnN1SzRYVEpFMHkvWkNwV0M2U1IvYzV4Q0JQV2RF?=
 =?utf-8?B?MEdVVzRtMDd0MmJhWWRzdWFoQnQyNzFKOE5uUnNEckh3ZUk3ZjNNeCs1ZWtp?=
 =?utf-8?B?TlFzMHF0VVAyZWptWnR3Z2xvcTRqWDZPNGxtbFVPTkRlUXFjVlE3SGUwUDYy?=
 =?utf-8?B?NXY1SWdVTUMrNjB1akNlZk0wSlg3OTdhazBuZFNMa1VBeFVpRXg4YjdsdExL?=
 =?utf-8?B?OUM5a2Y2M1RKZFhZdFJyNmhYZyt2U2hoTHFweE5CYXZ4MWY2OXNMVndPUEtC?=
 =?utf-8?B?elZWcGFhVnRPaXdWdTVWT0FIRWlRQitMTkVrMjRjeWJSYTJzVDZ2d3N0czlP?=
 =?utf-8?B?RWpZeWJWZU5DaGk1dlJuTFN1TDFyOTlHZGI0eVZjNXBGUVpQU2dORFhGaU5T?=
 =?utf-8?B?WU95NUdBNWROMGlzRFhVeC90ektuQ04rVE0weUY0WG1TMGZBL05yQXhsWGM4?=
 =?utf-8?B?Wm1CcTc5SjhiQzF3NGpNTWE3VXlGZWFaTG5ka2tVT0I1VFZ3VVdQbmRxSS9s?=
 =?utf-8?B?ZUpVSjllTWtPYkduK3E3NGdnSlJaVTI0V3BYNGdBeitjT2gzWkpSRXhUdnNN?=
 =?utf-8?B?ZFFWNTJDM3NhVndUVHVYR1F0YTEvQXdqd3lxc0xMMVRFa0xpalcycFY5NEFL?=
 =?utf-8?B?SGd6d3U5ZzkrZXp3a0g0ZjZ4OXgzRXlkSGdqYUxQNTJGL2Vwb2NlQlpkVnlm?=
 =?utf-8?B?VlNpNTVhb0VPYmVJTGZaUlRrYWNwdEIvOHhrcGFJUTYrMGp0N0dWYUp0VFJi?=
 =?utf-8?B?N0IyVmVFUE1kajkxTzJVRTZFR3JDTS9VMnQvVjgwTWYzSEpsRFk5WUdSUHp3?=
 =?utf-8?B?Q3V6ODZxWW5Qc2pJcnZuNHBUY2M3cHQrbE9PVWdmZHI0NFZWMHlJMGlYWkY3?=
 =?utf-8?B?UHYwN2pOVHFEUGtCbXIvNTRmUU16NHJkUk9nOVJiWHZENEZnQUZEbWdkOEky?=
 =?utf-8?B?ZDRtbjBRNkp6eVowWDBITmQyYVF1a25xbUxVaDhlenlZQlVMZXRrUmlwMG9p?=
 =?utf-8?B?M21YMnhOeVNoQ05LVTUwQVU4NFU4Yk5Jc2VFSnRNU2RKTFNWemVWdFFacW5z?=
 =?utf-8?B?QkNSTS9nTG12QW9yVlZwTFVYZGpNdis2eUIwYnFKZWZLeURXY1lrTzBwVFFt?=
 =?utf-8?B?R0tLZTNZUUVRZkJUeFlpVVZhU1FTLzJJalZ6aUdTTXoyRjlUc0NzbHBtd2w5?=
 =?utf-8?B?Kzg2VnJYV2twVmVmRkcwOVEwMzBhRE4xZHVkNjRDUTR0d24rM0JkbW1rc0J1?=
 =?utf-8?B?c3VqMng0bURuWEFmaU1CWHlYczJJSXZoQTB5SHBIRUdMY2l5MkFnVURFdmVn?=
 =?utf-8?B?MWhQUXA1UWRMcnhtMWxpM29wYzlLMSs5d0o4cWhxUHJTQW44TVhzMmJkWEhu?=
 =?utf-8?B?WXVOUlNLQlZrVXJTZGFiSnVLSlg0SVYxbytpbXlBVHpBSmYwVC9FLzZSN1VD?=
 =?utf-8?B?R29FWXlvZjZabE82c0JiRzkrWks2VU5xc2NnSmcrR21rTzhGWm12UFpPa2k1?=
 =?utf-8?B?dWdVaUhTT1ZFYWVOQ1BwT0RHUTFzZks1clZ6MVhvbW9kVW9MWGFYOGVFWENJ?=
 =?utf-8?B?Q3dvZ01zRTJDNlpzT08xazZzM3M0eWxPbWJGNWR6T3BEaVlZTzVSbzJYY1p0?=
 =?utf-8?B?MC9OV0U3VUR1V2F3QWFIY3k0OXVKbmk2cjV2T01yajNvUEZNZW9iZWVWc1F6?=
 =?utf-8?B?Tzh5aWFGclZIWnVwUFVzMkNmS0xTM2JIQlhqQW9uRjZhVHBudTd6MHhYdlNX?=
 =?utf-8?Q?Ov3g=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbd4690-b25b-4413-c0c7-08dbadf5649e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 09:49:26.9705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hh4HXSIVR2XPaYPGlbR8RLWnJ+ykhrM6OSjNfvzj/Qf+NWjf0AlNyG9CDSaCXpu5ZCsytE4YNTmnC2Tatlg03A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_024931_635491_F7439D79 
X-CRM114-Status: GOOD (  19.54  )
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
> From: Jisheng Zhang <jszhang@kernel.org>
> Sent: Monday, September 4, 2023 10:35 PM
> To: Wang, Xiao W <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] riscv: alternative: remove alternative boundary symbols
> in vdso
> 
> On Sat, Sep 02, 2023 at 10:25:10AM +0800, Xiao Wang wrote:
> > Instruction patching for vdso is based on elf header parsing to get the
> > beginning and ending of .alternative section, the __alt_start and __alt_end
> > symbols defined in vdso linker script are not used, so this patch removes
> > them.
> 
> The same patch has been in mailist since July:
> 
> https://lore.kernel.org/linux-riscv/20230726173024.3684-2-
> jszhang@kernel.org/
> 
> Thanks

OK, then please go ahead with that patch review and ignore this one.

BRs,
Xiao

> >
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >  arch/riscv/kernel/vdso/vdso.lds.S | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S
> b/arch/riscv/kernel/vdso/vdso.lds.S
> > index 82ce64900f3d..d43fd7c7dd11 100644
> > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > @@ -42,9 +42,7 @@ SECTIONS
> >
> >  	. = ALIGN(4);
> >  	.alternative : {
> > -		__alt_start = .;
> >  		*(.alternative)
> > -		__alt_end = .;
> >  	}
> >
> >  	.data		: {
> > --
> > 2.25.1
> >
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
