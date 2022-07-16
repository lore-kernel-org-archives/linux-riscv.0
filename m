Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B3FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKTViQgsu4QT0KlH1WJTeudh3y7eaxcll9NVLKH12lQ=; b=mHDU6NwNuTsb3f
	6ZmCIUES7qJ4TUCx485imMJ7WFl4oG1m19Q2QFhM7n9HUj6PvNqkADMhFZCgo5m8hrAZHj6epK4xj
	eqHWM6hzwJY/XvQ6MnG1aCyKhOoCq/BMc+C2c2aLLZgufivUl0sEhf2+NZRgKlyit87xei3ZXMj0l
	cObRmi88pSx8qPj3hHBoIScPBp+CFyW0wlffcmLjsD+/73dSAq6pK4lOTmf184rExsMiffxmLn1MF
	IR9TfsHz1G8fshhWBHq8L96MQqUhe1Gk+k87jlWn4FXIdMDojXcIN0Cb7lg5nqNroBGvJKktuFXDr
	Erx48bjE/YecDgGsq3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCiCU-00GM9x-MH; Sat, 16 Jul 2022 13:51:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCiCR-00GM8L-11; Sat, 16 Jul 2022 13:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657979475; x=1689515475;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6CpY+6AbHFH2SZafaL4dUe+FJqkAdXXiSsq/nnXFDdM=;
  b=Ss+mJfUEXceUAS2EeiviWLYQstU7KVDmAxvjrALtOtWOb2Rhkoql5Z3v
   +/hq+hDxggKwi5iJ5WhGMiZI3p3NDa83Q14Vz/iDBM8YWgu8weJ9tYv7G
   9ZctuTC8JO8dguO5yvFRIfY406t/bhu7pPdFvbpLKxjN2L0wON/uzGotR
   XMumKFSBbyIi68R9q9X5WXv6lqyMP+R3FMmGrHQhReNV7FjUx5uV0l1Fp
   BzskQiK5Zo6GMZoMdVoyfjKhz7876/jG9v9nCZy/6AKifQAZHEoGM8623
   UUBWaM0X7UWXKLb/O06y1EhLUuSWlXPjDASxwKNoEvtTa/qj3B7GMfQzi
   g==;
X-IronPort-AV: E=Sophos;i="5.92,277,1650956400"; 
   d="scan'208";a="172406385"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 06:51:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 06:51:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 16 Jul 2022 06:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJAV7noAz+GW5SNxYlHu7Nle+LNeg4gIZrT6WVp7Ejr6AbBV64On81irFnD4tLbXjopaFk71K+aR6+/yGkafMskFKLFxrjiNIhy5zFoXB3oEkpeLhjlw6mrb+ux1B3dTNGi0Nv7493Q+zCZrsXH5RtFymnEBouo19U22Yng/2h6rtWu2dChe/WHgpvBpUmZkOpWcCFkEK/8ZuaPG6p5HlFUzJoN4yTLxjlmLFWs3QqKyLy6fSSKamwA6FTo4wntKQerpgjlvni3f381saU2AMs/kbN2gtctp845z/YJqJ2fyYzwTZ2IfBpiyrZaRSZw/osdWQ7nHgtwQvsRMQJHeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CpY+6AbHFH2SZafaL4dUe+FJqkAdXXiSsq/nnXFDdM=;
 b=BEzkv/wabpU6HsG21SYiWo+RbxNbu72+qWFsvOk73FGdePztan4bQz9RW5lsqd22oNcERLM0Aek8zKsuzO+PKjRt63hBbiopnLcDbLsgn5Tk0fzFS6lgvoHv741A1w56imSVy3aFcpGfvhMBxPK5vOWABal2eXVi9pSPX+XtwKZu/me9bPKIxSU8GQU5zNbmWWSjQoOoox7Nf7f58MvNyN+qOGPg3DP4aG+8EA3RYynSmysxyBIK4388s2ZBT+Yt/x7Tw4Hkj5BTOH/A6Cyy+hY4o6aPxmWa5voOjuXKiqzJpncP389r1sJt6/CbqerBq3FRrKGHTNDlN431fz6yCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CpY+6AbHFH2SZafaL4dUe+FJqkAdXXiSsq/nnXFDdM=;
 b=FUPceVIhLKU8dUQbRyGhvz0gTSxOoQK2Xu02F+8Ycee8WeIVCAHrS9JwCeB5jh+pP2LL51Bkd2t3xmMPsBmTRb8aafvmmQYcAw6uHTFLR7hN7oDnq2B7IGGsmAcmXJvFIbDe5uOuyy/m4axyCfGOgrh/A+G2AHYQqGGGwVccRB8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR1101MB2279.namprd11.prod.outlook.com (2603:10b6:910:17::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 16 Jul
 2022 13:51:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.021; Sat, 16 Jul 2022
 13:51:02 +0000
From: <Conor.Dooley@microchip.com>
To: <miguel.ojeda.sandonis@gmail.com>, <conor@kernel.org>
CC: <ojeda@kernel.org>, <gregkh@linuxfoundation.org>, <jarkko@kernel.org>,
	<kunit-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-um@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <live-patching@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>, <torvalds@linux-foundation.org>
Subject: Re: [PATCH v7 00/25] Rust support
Thread-Topic: [PATCH v7 00/25] Rust support
Thread-Index: AQHYbn59bdkjrFJN6kyBlKdplUgu6q2BRfYAgAAPIACAAAQXgA==
Date: Sat, 16 Jul 2022 13:51:02 +0000
Message-ID: <4a6240da-9003-cd74-cd47-f95ba2d9e7ae@microchip.com>
References: <20220523020209.11810-1-ojeda@kernel.org>
 <20220716124214.329949-1-conor@kernel.org>
 <CANiq72nYRkHV6N2bGpTz3td=2Vto21apvZW0igTT-mV8TZtB2g@mail.gmail.com>
In-Reply-To: <CANiq72nYRkHV6N2bGpTz3td=2Vto21apvZW0igTT-mV8TZtB2g@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2e954f3-5d52-4713-76fa-08da67323889
x-ms-traffictypediagnostic: CY4PR1101MB2279:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Ot0S4Y6Hyle5yYgv2EgjGIBTYNEScgN/hpCfkFmBPr2hzo4YaMu5VV8/JSNdjnldeDJrhIaaOjvL4VQl7ntT/Wn5cXjzTQ6PG9nc/e3D9HfAOi+8A1hmeJUQstHcccWvcbJFvnaetpZmJcBeuWHB5dGozsX3X0BFmaquLIjmU5cphMED3H2GtMgDNM+5r9NeCYw2KsAZBltPN1PH+709PGPieFBHQbuPW06HKv2wIvUSXMgFuCod1Ui33tFEhOpiKtXyBg0LpQUtKZKP8IWUQvuhQ8dv7ikpBp0O8eoALmdesnh7+ttz8ybRL002ZTdg1ptfgwZPUp6TTL2rkNR1oxQioMLiJ4vj6TteDVjJhZPLkgzcnXVV+vDl3fsHS2iuCmA/QpbDmfQ9g5Gqb7nb86KeJgGY7RaJw6cbaDq/9gdr1IzC9Jpkh0gSkZLYzYZdhE+Cr0mZvGE19XHC4lvyItvHvR+r+BPscTvmjA4FsFkYD8fF3tNvlescYuQuNCNksFj8QV8x+tCMZGjEXicEm54ZOAdYMNtcsDplpT9WcOp0daFZPKuf0phpmAwqnm9LLYpL37dkh7Ppf5/fV5uaq+xFklQnv5SIpOf7XWrkbl/R24J1SGVEIJp/qOsp8Z3WnA5+b1GTeCuo96M15XiaRE7I/vmLHam48O4tZfIfz5i8EEgStQsoS3LCKtsPHI1hBLYX8NBEeQj+oGbm2NEH+EKlUp+KU/SZKi4yW7+jPn07EMO5vjKbsBEiiRp1pMpHEnJr9DC7bZGFozmJ4DBbvNkWcky8XmbF6tfdkObzEd6PNgFd1ZHrpnHfGb8AsMfG+rQhASh3s4FCywT/UfAEDZTUsxCq8S3aeCaaxe3BkyYejUjTC0AL91q9eHjkxp4lCFkTV23OvSBFQ0nf5B8qSusOsnj6pETr/osEX4962g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39860400002)(376002)(26005)(966005)(6506007)(41300700001)(6512007)(71200400001)(478600001)(6486002)(53546011)(5660300002)(8936002)(7416002)(31696002)(86362001)(76116006)(2906002)(54906003)(110136005)(316002)(36756003)(66946007)(4326008)(8676002)(66446008)(66556008)(64756008)(122000001)(83380400001)(31686004)(38070700005)(2616005)(66476007)(186003)(38100700002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2lpWnBrKzJkNVdBR0dYdHNNU3NITzBNQXhEcks1TU5LYzRCN3IzUmFad1l0?=
 =?utf-8?B?bXFYZzF3U2VqTHd0SElvM1QwRjdLd2FkTGRzbmhhK080OFJYTVQ3d2xIbnc2?=
 =?utf-8?B?dmk0Yng1Vlp0cTc4SDhBQkJ2eUtOY0lUeE9YU1JHU0I0VG5iNkJLM01Sakcr?=
 =?utf-8?B?TndxTmVocFhDTzFFdGtGaDUyTjZHL3JiM01LeEFVWFFhM2VBY2NheHphUzN2?=
 =?utf-8?B?QTNDUWtBTmVBZkoxY3JEVkkzcGV0NmNxYzlhVzU4SnhKazRLZ01WcTZSSzBU?=
 =?utf-8?B?b1pQVHlCYU1MZUxBTTVUOUgxNlZla1dUbzNIY3ljcnIrL1hIOVdiR1d1SmFv?=
 =?utf-8?B?U2VYV05LcDJoYVc1cEsrM1ptQ2VjdHZnU2EwaFZjdGtRN3VlY1RMendqbW00?=
 =?utf-8?B?NHR4TzdTa1Y3RXhMUlRXNncwWHFwTk51cTErL2JkOVRzZ3FIcVpXM1dwdC9p?=
 =?utf-8?B?YksxQ292cWZnNFh0Q0RNSXNtZ3d0eElqNnZhTFdNWThMT1F1WldVVnpyeko5?=
 =?utf-8?B?T2xQVndQS1hibW1GUldqQ1gxN040cmswMFRCUTVpSGFYTGcrSXlVQWRZa3Y2?=
 =?utf-8?B?eTQzdXZ3aDIrVzR5ZFlXMEdFN1IzSmU0dUhJTjFTSWQyQkhMdEZQOHd6YTdq?=
 =?utf-8?B?clc4VytBOG1VdTlDVDRIUVdUV0dicml2eVBPNUFQcFRVS2JzdE5ySXViZVdz?=
 =?utf-8?B?RjNLalZic1hIZU1LN2UwOE9uOFR1dlZrdG1aSjdLc29LZmo2OHRpLzZkR1I5?=
 =?utf-8?B?OGN0UWplMDJTYkFNMTJFU0pDbHM5aTQ0RU1vUTB0a0tOdllTeDIxeGRtMTgw?=
 =?utf-8?B?TkZSS01PUTc2NTl2TWZvdDNHU0JTQmM5SjZ3ZVlwTDJGRWtkWE53Ujlrb0pi?=
 =?utf-8?B?bjhEbngvRU9lZ1dzaTdBQmRsaGFFMHUvL09pL05aR0xtcGdwZzJmQ1R6VDAr?=
 =?utf-8?B?b0FwYlNXM1JSRlZJeFVhNGpoWUtRbUQwamVTeHErR3p2RmQ3a0R6SE93MDFE?=
 =?utf-8?B?Q0VGbVAzVlN0S1RoMEtKL1BnQlBrZVA5d2Q2aVNBQklnek9aU01wV09OSTBX?=
 =?utf-8?B?cnl6ckhKV21MNkpRTjg4NmlQYnBDZ25aZ21WT0VaU0YySWJmOWF1RldxZjNS?=
 =?utf-8?B?MzZZdHMwQ1NEWjM5YnRtVCtzUmU3SUIvWi84bGFaYVduMVU5ZUFuY0haeFk0?=
 =?utf-8?B?dkpyKzF2RWc5S2ZMTG0zdEkvemdHcDRMTWpnYkl2ODdVMVVYNjhLN05VbElB?=
 =?utf-8?B?anc1eVlqTXRLZWh3cWlJZVROMTJlWFRuVjhIamtWMGVLblV4NCtLd0doR3kw?=
 =?utf-8?B?VjJ5UFVkTkFNcmFlZE5HMlR5ZDJyNzlvMVhQZjgyeWpqNnZ4dDBMamwvdUU3?=
 =?utf-8?B?RllTb08yZXpNMWxQcWNDQ3lkK1pMN0N1aTFzY1ZabjkydzZGTGxXclBYdGhO?=
 =?utf-8?B?bEVKSUZhT0dxWk94dktpSTM5b3lGWTR1QlFYUzRJOXp1aFd0SDRMbTFGQ0NI?=
 =?utf-8?B?K1RWemx0cWc2WllZdGhsTVc4bmUvNzZBb2x5c3BsRjhpK3JxWmNRdjhHWWZp?=
 =?utf-8?B?aG5Kd1RFN1dZV0pWejA0bkI2V2lUTmFMMGFNakhJV0NRVnpHQ0tDdU5JcDhi?=
 =?utf-8?B?NHQzSkk3SWN6UkJkQXh1V0tkQWM1SmdscWRSZ2UzV3hZbm80d2hxaExnRzVZ?=
 =?utf-8?B?aDBDTWdhcFYwOXh5bHZ4cDNaMDVydjJRU3c4MGFKVEFuMmgzRlN0MEZCZDZS?=
 =?utf-8?B?WUJhZlYybjBqTHk2bjZ3TUJBVXFpSEVNVURZc2w1L2w2d2xCY3NRZzFYcFox?=
 =?utf-8?B?Uys2dlJUOE5lSmdrQ04zQ1d4cUlwYVlPcUsxUXZjK3pLWEc5aUl2TzJyRHN0?=
 =?utf-8?B?bWxQOWtnMGx4OVVlOFdwSHdkTTNpUGEvMlA4ZHo0VFo1b3BiNVJGZjcya2pk?=
 =?utf-8?B?aW01bSt2VDdjTzJVVmJ2czFNNFY5SHhYalR6UHRMSW5QejY0bUJwandxSW9H?=
 =?utf-8?B?R3BMUmlZbTJuWmZRSzg2MzZnWnRlYlZUZy9wQ1hlUkRnd1JxSjIwUGZEMU9E?=
 =?utf-8?B?OVo3MUFFYmZtaEJvM3h4RTVPQ1JnUEtGaGIzUVhUY2lwWkZwQkhCblhuRnJj?=
 =?utf-8?Q?jUo9HPOShqtco2V4QPmfXHMho?=
Content-ID: <2596BE2EC5057B49B1C1166707F15CE6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e954f3-5d52-4713-76fa-08da67323889
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 13:51:02.0436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqMosjuZk9tjE150BafbVVwqZP2R2yEM1eD2vQCmx2e7G4NEJMlK4edNtJAPKbVIvGNANnCATXl2TQqS2D9x17PClYNmnBCIMb/0JZ8TUts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_065115_101773_A324EE36 
X-CRM114-Status: GOOD (  17.23  )
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

On 16/07/2022 14:36, Miguel Ojeda wrote:
> Hi Conor,
> 
> On Sat, Jul 16, 2022 at 2:42 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> Maybe I am just missing something blatantly obvious here, but trying
>> to build rust support in -next fails for me. I am using ClangBuiltLinux
>> clang version 15.0.0 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa and LLD
>> 15.0.0. Is it just expected that building -next with rust support is
>> not a good idea?
> 
> Please see https://github.com/Rust-for-Linux/linux/issues/795 for
> details about the maple tree issue.

Ah right, sorry for the noise so. I checked the ml but didn't see a
report there.

> 
> I will update the `rust-next` branch next week with the new version of
> the patches; but if you are interested in developing, please use the
> development `rust` branch instead in GitHub for the moment.

Thanks Miguel, good to know! I'll just wait around for a new version.
Just been trying to get my CI etc in order for when rust support lands,
but it sounds like I should be okay as it's a known problem & not some
only-broken-on-riscv thing.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
