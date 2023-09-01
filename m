Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861F2CA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tn46yP/WmZ7pfBcwkxbfHYSQQaVcd8yiZYAYTSDYJw8=; b=OBca8z6U7VIXQT
	AsAChN/i1wdzVWh3yy4hGgw0evZBBnyUE1F8MEY1rpKl9llYuSTzoyFH+gbMGeYvCQsxGqvqvA6oi
	IISOWeHx3AVHafPifgKeuxYopKYD6jDGb/oBoDrqMySefpOKg8lDVTkxPeZGhJOeiRkS/7eYrwR4D
	nmiOwcaB3CpOW/3ze+nV+Zhx/Sb4R5WMezmsV/kgpaNE67kcyEEg9WzQKrwxnu9PEHQRYDDrAUnc0
	xXQT4OCcnbM1epk1Gk8KDp8PwqFkSfgNDlimcp2gZB2A+I/9kKnIMM6oWWOg3Y7wIag7T2o99AZWR
	MGvDEoNhg6CEh/PhqXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0at-00Gkst-1o;
	Fri, 01 Sep 2023 09:37:35 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0ap-00GkrU-1i
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 09:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693561051; x=1725097051;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xVmM12semqk2jjYjCWI5CYnoG2PsW6WQTxF2vIsT9ac=;
  b=bNx55VeFrpTS+JDyxS5xzfBDoQRC0AUBY1Q1aBSk9+eFrChCC61oT0Wq
   FzYN7gE1PavAERFdCsASZJMDkzDR3lAyG67WpMfWpWEoTkDSXnGgp8s12
   TbUSYTZ86X5KFxxh64QGiDpe0un/smBmG1L6pUKg0pZYTljyE2ldgc/Y1
   2gvtU+KPB/l2JKug+v2AoG4+FZcJc+vccp1pzKHiYyH15KJMmdTUMTY7l
   cD4pcD5KsZvF/1UXpHCEeXNGyOkvfTyc0JLeoTSvtKh0NV9ARJ7vEUUZi
   vXt3tj2KdRsrZLorCBPCe8968v8c8wG1cOdakh5VvOqgD5OUdB6PxdDUT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440160077"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="440160077"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739865538"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="739865538"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Sep 2023 02:37:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 02:37:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 02:37:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 02:37:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 02:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEkKmfXBLaWJMOpNpDDBQ75HGXo99PlD21PcC/MMM/+AJ3o6X/MyNW3r3/E+D/BqN93YLnfqqivYBYob3Oelc+VK7i3SO+k+VMIWXi6bgggHD6QDfHxeY317Ybu6EQ2ubnrpdjyUi3nUoMO8wytlDc/TYlo6cpdF2e86P/5QlDTXZrth3IeG0RbVyyM1z/80IFe+6klWo+aTOs+37vzUouK1Np0ea8D/kDSD5yeRj5JP62oYhlCalwiBnxqxDvd/N/EYXZlrQi+ITB6UnQVWaCo7fnm8JgRT3dGQIfhxsMZCsmrBw+KumPbcbsSbvIGqqMG146tYjmApvnvOIz6Q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCad6GLQcX/xKPtLhX9LysQIVFKVjkhW5DpCd5hKfvg=;
 b=QOvFH++hXQrYtHPmtu+4J5pPaollvRpuogcuAwrOEA+mdGCioe+8tsiAbV8kuc554Kf1fdFIxhPkvckpjD9in5TFiugYpmniI1GvbfvaNH9JnX39QY8BFaLYNODlT9m1stBRg5gg+yjLpQOPEe/TEt1UjXCR+allyYVMF5xb2G3PNb8sAkp+L3lF7cjKiC2rrlNL4DdYbnT9v1dKZrpsvP7sDUL476CzZ2siXcLWeayO6+P7xDnREyXoK+HZaBaa1TUEuNjN3CR1dIMsmcf4W8B+7rRqWtA/2+Cv0OWMiPDhpmv8X5M289ox2E2uQoTA0mQv1j+qbfHi+x9At9J31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.23; Fri, 1 Sep 2023 09:37:27 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6745.022; Fri, 1 Sep 2023
 09:37:27 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "evan@rivosinc.com" <evan@rivosinc.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>
Subject: RE: [PATCH v2 6/6] RISC-V: selftests: Add CBO tests
Thread-Topic: [PATCH v2 6/6] RISC-V: selftests: Add CBO tests
Thread-Index: AQHZ22JJQPZXtQwmL06h2mwTFZtGqLAFseJw
Date: Fri, 1 Sep 2023 09:37:27 +0000
Message-ID: <DM8PR11MB57513A1848E33ABF9131423AB8E4A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
 <20230830164954.91987-14-ajones@ventanamicro.com>
In-Reply-To: <20230830164954.91987-14-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB5293:EE_
x-ms-office365-filtering-correlation-id: 0163a1c5-2386-411e-d066-08dbaacf0e57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z9bk7iDLVb/y/R2VsVD+fKuP3kMt0j48AsZTJ81LSV203R+Y9IZ8GqpbHXyt3XZNjTYo+6W82xcx7dWwc/kbOIIy9Gwuzb6OEwJea4Nm1f9sF2Bxv6ozRnpMrurKScDRGfryh+Apf3sJr+MeQaFPimA80dioJ+rKqZNAkOeZ3Vluea0b6/XgOMAj9gNW7INQm11TKf1MucJzpNUpnPMVGATuKT+ljxlxy+UFF1XRLIpuasgO5fe0vNp0sA0nr7sM8bd0oICxAEGBmny4AbH+ZqiKo0KKois0S8EhlYII76hoRfKZN15TRKAoxchAC61MAFz6yrrf4htXll/OFFuWLo94bgou2aA4tyt/WDmWJbDrflCeL8p5NZxINe98Z9kC2feo4OWV7YeFw6efhr7DgGR42WwJMXbTCxi/2vpYt0oW4/uRPtXNfYOS7p7lu+kqPXZrv6yx08q6SX7Hrf7b6GbfWAEpJfYtV5p9F8Rn+EyKUOMSkWIS24NbAOGV7vWOx7RWkYsvZrQdQ99HicOGhI2WLCxAizkED4h7r8Xfb9FzIW9vLLYdcAOkZ2oEsNcp0L0kIZsb8jWvzOmLxhi4Y1VA49xwFO3r30Ru76xvDf8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(1800799009)(186009)(451199024)(6506007)(7696005)(53546011)(9686003)(71200400001)(83380400001)(122000001)(33656002)(86362001)(38070700005)(38100700002)(82960400001)(26005)(55016003)(52536014)(41300700001)(2906002)(110136005)(76116006)(66446008)(66476007)(66556008)(66946007)(64756008)(54906003)(8676002)(8936002)(4326008)(316002)(966005)(478600001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Qz72lZG7JzfoJwOe05nPuB19y5z6fXR99kcydRx4iqwt701ii0ZDJ0Sc?=
 =?Windows-1252?Q?hhnCVIoMtmQcjJ2X1OyINTLq4Ubu+7jGeW9frHe9GXb9PNDxKUHI7A4V?=
 =?Windows-1252?Q?uPYYQHvq+Ydbmu0H6Hgeld2QUa34HvhfohX4rpUY0yVRQ39nt7tJA1VP?=
 =?Windows-1252?Q?FOi6qXn7EM9I4s+J+A1fAodg1H78G8NzPaGRopNeIka97i8d4XvCNS14?=
 =?Windows-1252?Q?T4+4RyAtKXDjOgNtj4AOIdlpytP02sQ+1MW7f6gd4vOludk63+/GItEl?=
 =?Windows-1252?Q?YXvQJ9a9N1iDXFoMOE4hRM+fZEVb5uGyqCK6eVMfOxV7A+018PWoYEqL?=
 =?Windows-1252?Q?IBJMSKa5klMkvvj2/PW5f66JRkI/wgN8D3uLYQgjUxx2vcC3DuEXt08r?=
 =?Windows-1252?Q?IMaTpd3K6hK2FVjLeW4/bz/arTIJxzpPm91EEl9qfrVLBdJUH5n+nJ+N?=
 =?Windows-1252?Q?9LcjSXuKuqhzQgzDCGU/ToRnI2CWATwMWhsaPA7gmebD2L/HBCFRXaVe?=
 =?Windows-1252?Q?QXi0goQN+bz137ebjBKtdkXLj7446EkYKsBVJpFJ/PBlEvqEgAIDn8LW?=
 =?Windows-1252?Q?qEZUDrosOtNOQutjds6kFBtOmJciSjdudmhr07Kn85oiwK+loeRHQLi9?=
 =?Windows-1252?Q?lW4o39uejOvVDLqtOiP3E4TnOmk6goW6o26KCKh4o7qAjPn/8A5Dn2AX?=
 =?Windows-1252?Q?wQ4pb3nRttS5uEUnJ6DIKk9SKPQjF9+nTU/IT2SHjViv8Jy5aq98mExy?=
 =?Windows-1252?Q?vVHS2DDWWQ25UgKsDuHlOLgT1ydXsnGFiRXH2bZPwA4k7RehZFIVlTGg?=
 =?Windows-1252?Q?RurN031TRFSQOxl23yKYS1vWFen8Y3ZM+PnS6lbtZVa2X8rBJA7Vku+N?=
 =?Windows-1252?Q?FpugVTpbnwUYfp6g9J6rdRDhIFN+xi5lP9sLexLcG1p0dRNmKfdHfffJ?=
 =?Windows-1252?Q?2BvHasUSDDNZUB19YwpEacy9hSTPT3HPdJpP9PJMJfwSq8AsPrm5trtJ?=
 =?Windows-1252?Q?aep2UrhW6wv+rWr6ho0pMZf9e9geNlhWaSAntbRRiUPYz6qvnCheLWHi?=
 =?Windows-1252?Q?wLn9lWGsPq3Lg1L9uBdmy/8m5WW329zMZIsD+uCv8TrHpZydFaosdHgz?=
 =?Windows-1252?Q?x1AF+EeiqEAs4OTbjoO0GLnu893IXsn9KA5ydvM6DJCorfwS+jL40M8h?=
 =?Windows-1252?Q?oxTaEscBV6ZYLBC/yChX0kHwMXPgKt/kIJM+p0/oQUKjIBfut9jtDzNH?=
 =?Windows-1252?Q?Nn3SgY3woy1taE+/hKsOO4nKoIHpErM5uKChpqL+965sYLgiS4X2s6Qm?=
 =?Windows-1252?Q?Q/Lcr3JhsebRRdF0U5GxAtBYAut31BYjhnreMBwsgF7rIOr/l6RBWVEf?=
 =?Windows-1252?Q?gNjMBDJmA9JboBrpK3cMRH3VrFW0aSHJ08z1kIC5uA3DO3oK2mTggMae?=
 =?Windows-1252?Q?VX6ujKqCoI03CL50a6b+zqoggzgQnMlWd2CnKjYepVAw24kT9Merhr/U?=
 =?Windows-1252?Q?zvg7+woT05tmg7wpLPd5MHVoLxtdfQNilkEuJ8afE8Y9GRnb+yqD3/9j?=
 =?Windows-1252?Q?yyG2nbaODoKge1Jkxv7Il4eI9BdwehVsgIhRKrP/56QpCk0KsQ3xZGj3?=
 =?Windows-1252?Q?a56syHr8wBO2amvgrASGhII6kwq/oePVpjNQP3mOVzE/UOFgUa6dJPUt?=
 =?Windows-1252?Q?0GE1Asdaau8Ai8EY4EY4QItJNOeug9/0?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0163a1c5-2386-411e-d066-08dbaacf0e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 09:37:27.8161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnK5BGg5C2/CFlk34fsV4wAhAtFsmkAjIGjZjezXSmPXOBy5IPK14/iwdy40tAPZx4bOd6NzPzJGqwWb0x7e9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_023731_648378_F9E6E6B7 
X-CRM114-Status: GOOD (  25.77  )
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

Hi,

> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> Andrew Jones
> Sent: Thursday, August 31, 2023 12:50 AM
> To: linux-riscv@lists.infradead.org
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; evan@rivosinc.com; conor.dooley@microchip.com;
> apatel@ventanamicro.com
> Subject: [PATCH v2 6/6] RISC-V: selftests: Add CBO tests
> 
> Add hwprobe test for Zicboz and its block size. Also, when Zicboz is
> present, test that cbo.zero may be issued and works. Additionally
> test that the Zicbom instructions cause SIGILL and also that cbo.zero
> causes SIGILL when Zicboz is not present. Pinning the test to a subset
> of cpus with taskset will also restrict the hwprobe calls to that set.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
>  tools/testing/selftests/riscv/hwprobe/cbo.c   | 162 ++++++++++++++++++
>  .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
>  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
>  4 files changed, 184 insertions(+), 12 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile
> b/tools/testing/selftests/riscv/hwprobe/Makefile
> index 5f614c3ba598..f224b84591fb 100644
> --- a/tools/testing/selftests/riscv/hwprobe/Makefile
> +++ b/tools/testing/selftests/riscv/hwprobe/Makefile
> @@ -2,9 +2,14 @@
>  # Copyright (C) 2021 ARM Limited
>  # Originally tools/testing/arm64/abi/Makefile
> 
> -TEST_GEN_PROGS := hwprobe
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := hwprobe cbo
> 
>  include ../../lib.mk
> 
>  $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/cbo: cbo.c sys_hwprobe.S
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c
> b/tools/testing/selftests/riscv/hwprobe/cbo.c
> new file mode 100644
> index 000000000000..920abfaa10c2
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
> + * subset of cpus, as well as only executing the tests on those cpus.
> + */
> +#define _GNU_SOURCE
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <sched.h>
> +#include <signal.h>
> +#include <assert.h>
> +#include <linux/compiler.h>
> +#include <asm/ucontext.h>
> +
> +#include "hwprobe.h"
> +#include "../../kselftest.h"
> +
> +static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
> +
> +static bool illegal_insn;
> +
> +static void sigill_handler(int sig, siginfo_t *info, void *context)
> +{
> +	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)-
> >uc_mcontext;
> +	uint32_t insn = *(uint32_t *)regs[0];
> +
> +	assert(insn >> 20 == regs[11] &&
> +	       (insn & ((1 << 20) - 1)) == (10 << 15 | 2 << 12 | 0 << 7 | 15));
> +
> +	illegal_insn = true;
> +	regs[0] += 4;
> +}
> +
> +static void cbo_insn(int fn, char *base)
> +{
> +	asm volatile(
> +	"mv	a0, %0\n"
> +	"li	a1, %1\n"
> +	".4byte	%1 << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15\n"
> +	: : "r" (base), "i" (fn) : "a0", "a1", "memory");
> +}
> +
> +static void cbo_inval(char *base) { cbo_insn(0, base); }
> +static void cbo_clean(char *base) { cbo_insn(1, base); }
> +static void cbo_flush(char *base) { cbo_insn(2, base); }
> +static void cbo_zero(char *base)  { cbo_insn(4, base); }
> +
> +static void test_no_zicbom(void)
> +{
> +	illegal_insn = false;
> +	cbo_clean(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.clean\n");
> +
> +	illegal_insn = false;
> +	cbo_flush(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.flush\n");
> +
> +	illegal_insn = false;
> +	cbo_inval(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.inval\n");
> +}
> +
> +static void test_no_zicboz(void)
> +{
> +	illegal_insn = false;
> +	cbo_clean(&mem[0]);

Seems we need to call cbo_zero() instead of cbo_clean().

BRs,
Xiao

> +	ksft_test_result(illegal_insn, "No cbo.zero\n");
> +}
> +
[...]
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
