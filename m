Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC86ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SXa5pI8BSwy16qIMNYMdCza0S5ywHjElrkLePKT3pI=; b=QP0ObtkqgaNceB
	WBPd10skQ54WbZ7mPoUavPtw9KkbkOTvvm3mtO3JOT1jPwji52Ml5HvbDrtJZzdNCui9DrcTux3A0
	z2Km2Fycv+zP1tYpKX4f09QRxPy6rUF1dQ5AQPYhRRteYxB8IhFaXqjXkDDHGpKFXSJB5WAE9XUkq
	ThVTuVONbDtBkJioM9+t+uFlwq5e63fcueKK0ATVkO7YpMG/29HErt3qU+GStKy+4UX6Ivih8LtBE
	VM5yoQGyFFUcVpBKbebwBUrmXGNHObStfOomCcyC2hTJFW8FX8fysjiL6dAvVXJydgpjenKNnp76J
	/pk7/PidUL9c/jpikOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4w4-009EeJ-2k; Fri, 16 Sep 2022 06:34:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4w0-009EcF-D8
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 06:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663310084; x=1694846084;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Bg0sjbgQwofYQQSW2bg3onm2H7XVkzA3lSS8P9S6t54=;
  b=yA2RsTFRXjDxaZerQkZH0mtkPygSpyA1oEOBt0GrkJhGeh6ZAzPyHaYi
   DyTfy4JQgw2dEmz5cuhHsxpT+SRaOaEYrVdbrgztHsjd1TvkKG7seIc5r
   Pku7xi2F+Q20kZthS7PoKqLyk/WoRVG+4Uo8KIQjspB3UKl8/CGNPy23r
   dr+rfU6p10iEAfm7eHmnwQuXphnb/E3E12IRGJRtwQ5H6SHvyI9FboSUg
   kJXfW2a+D1zOQdTZHLwRiWXLdYbrKH8nVe4YBzhfFSozXBZNQiWcCeH3W
   Q0W54w9OOG77QBDFuGhoacIZWUYvX2attEBya/qVJK7OH5lHcDtX6rn5H
   w==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="191112549"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 23:34:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 23:34:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 23:34:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK+De8s5oo9zI7W25AySo/UA3hrfh4cbLC2L1gHY498J3IGLecomGScdEUK/bL38leHqrqy+rqZgvYeqDpJgI3lKh9zq9uh/dRIxkVSngVM1P7uRnr7uHzjFEz/SuoBeImeO9r1ko23paAZYEgz5tO+dJ1jIBTJFCW5cb7R6HXlEqk4ho+icwsboj6S7f8HeykDcYm2AL0zDEVSLWVH6sW1PGs4v2EfVIvgPG/QaFlqRCmirtWfbs/+JseF8E7F+tltWdZkz9A0GnStlH4/ekM7RpqV/G0UiPWZuWYc2Bpig4Yw27ZCoJfhyBUbmF3Zi5WlPIiG/z3BwLzrnaCTm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg0sjbgQwofYQQSW2bg3onm2H7XVkzA3lSS8P9S6t54=;
 b=OQ+9rYfMRf3yjK4d5iTwz0FqgMTwyLk3ZP+zrsnKTTZVcAQ3J7E4jmNV6Vd+y3oIZjQCGAX9cCwTe/SPUZwtzPCEXfVAASlt0gJvYPtOdV+MLslNZE/n6XSwjAyG5QqP3erwD70xSS0A0h29/8JaPt30QVVJlKLKfNW2473g1NM7z2ukc0cbd406Qln0s60SB0o4n8BBlbSEbGpIH9sAz4bLxVSwXBJy0w/jl9jIDuezhGlj3YoyScEUIp32M5pj50+3Y5RBqCG9czI6qZTn91f9hmtf43+uXE01jQwwiZEHDmYlvjXBEt7A6ntD6yfbq5m9kdpcT6yYev5Q1Mh44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg0sjbgQwofYQQSW2bg3onm2H7XVkzA3lSS8P9S6t54=;
 b=K8UImP6wZ/D52Wd575eGnJGYlBeP6CZtZrw2evJ29XMd7Y63AlmsgI12c2rX30aQm7ye4B5jH9LESPy9GG2Edt058//vA48YTnPGNDUDxsRwm8BuN6Dl88fNvFj4yyCyUCftsgndQC0P1RwiPSJz87wVmH8SJW+p7s1vEd0TLDw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 06:34:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 06:34:34 +0000
From: <Conor.Dooley@microchip.com>
To: <vineetg@rivosinc.com>, <linux-riscv@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <palmer@rivosinc.com>,
	<cmuellner@ventanamicro.com>, <linux@rivosinc.com>
Subject: Re: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
Thread-Topic: [PATCH v2] riscv: ztso: disallow elf binaries needing TSO
Thread-Index: AQHYyYQq7AHa3Cms0USowTkeq57IPq3hmaYA
Date: Fri, 16 Sep 2022 06:34:34 +0000
Message-ID: <67a3aba3-68bb-5e8b-4e4e-869c8e99e879@microchip.com>
References: <20220916030552.1396820-1-vineetg@rivosinc.com>
 <20220916042331.1398823-1-vineetg@rivosinc.com>
In-Reply-To: <20220916042331.1398823-1-vineetg@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 06505299-d58d-4ddc-3b0a-08da97ad8514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y/7Eiz4U5NnLHq0Twyu/FmuRxWtvR6Djniym+QIHFTMHTCvFyAMbcJDqxmRA2M7hqzjnCmDNvRYkCn3Nv+zzRUVNUx9PSR/Vru1YeYxukl4nv7DiWZt+44716sE5Gf4Gb2wCN9o83eqtwoBh7ZUkKIzINMNhWOk6mU92Cw33AICp81Fd7D9Jd/NkSMCyxrZGwpjVCotghQzqZ8q1YnVx2z1dVQFR8AhtmMpy04NdzL9xct22ALTEFjKWEsdDWL1Cjsinn70bcoLOjW35ZC6aZc0bVvBWcDV4fJ+FURLbeLULoPWqkWEGsAq2CxSFZMYkfggosWOLm/VnUJY480W7PmYBINj3A1mqWdifHQu04F7Xqy4J9tfJKnu/GTdUOP5iFUGQBFNPqzMFBp4AqHC7ANFk5E4CqZowfAWNu132EMP/RtsvwT/DRh2Sky7T534Jh17KTurX3Vr0/zcDugM69eH5at2CXL3+FSZzM/9IN6DW7qqCsHHk80W9D3G5q9uAKKGxjP05pzUcs93KjiOAbcimJ6/vlCqOnbfr8gmKjsMUwOJDzNTHssG0M6tBCPVk2LbKOZMfhqtqDFVxcGDTuaCcXdxwU1ccCnyPMDHK35G+Xwtktr8xsUhSGvcK0/pFfqpv1jTouZAnhTobDbV/oTmj5RahZFRbh5i3zl2dnrPYkcaIFaABa4wHAVZJDITPVhy5YptJGzaly7G6kD+Tg7g3gdXEpnsjx1kCk02KFyB/emgYZBL0/Da0MR1wfn/yxMfNgGJcI/IZWHQon9msXznUFLkUKNpi1vlfF+zkT+TXP6xnb4RMWXlpvW79aRIpe9D0p5lwGzBgYvyndVCI0Ay5N74VQWbAS6sJVUyWG3c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(122000001)(38100700002)(41300700001)(38070700005)(2906002)(71200400001)(186003)(26005)(83380400001)(2616005)(53546011)(966005)(478600001)(36756003)(6486002)(6512007)(64756008)(66556008)(31686004)(66446008)(66476007)(91956017)(66946007)(76116006)(316002)(8936002)(8676002)(5660300002)(110136005)(31696002)(86362001)(54906003)(4326008)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVJnaEZHTGlOWkgwcThhNVRiWUJpT25ETHEwYkZjUkRjVERzbkhXL0RJT1RL?=
 =?utf-8?B?cHpGNFFZS242cVRENmRSZ1pXaThQRTZsbTNWdFNzSFFGZ1lPQmtKemJEcnJ6?=
 =?utf-8?B?QnUzMjlpa1dlVkVEYkpKRmptalZTaG1ObER6a3ZVV2pQb1ZjZ29Jbmw5cHBT?=
 =?utf-8?B?YVJmZmJMaFh6U2s2bHoxTFdDUGJXT2NnN2xDUk9JZmFsVTVxYXNuMjQ1bG9m?=
 =?utf-8?B?MUd0U1BRRC9Ob0FWZ3NxYUtTeE1wSmt4YmdPUzgwdU53cDZ2c0pRMTRSS1Nz?=
 =?utf-8?B?ZXZGekNjd2diQzZBOEtGS1Q3ZnM2cTRtay8ybTM3cW1vVTVXa2hGM0tkY2pM?=
 =?utf-8?B?Um4yS1lVRm8vWUhXNzZGRG5OTXBmdUU2akNXT0xoNGRFOERHcGZOWkpsOVM0?=
 =?utf-8?B?bERsRTl0Q3NhVkJZODRmdnF0MWVLV1VWNVhzSkRMY1EzQ0NFbFpYaG9GNlRS?=
 =?utf-8?B?d053NjQ1NWRkV0J4V0tyYjZxVnNreDJqSXlMVkpJOWROKzVROTVYRThCbGFD?=
 =?utf-8?B?ZjVFcnBMcDVvanBza3RhSFlkUURmVFFub1J3V0FEUkVlbWRaQ2FsMWlkZWE2?=
 =?utf-8?B?TnlrTzFGYnNMSUY0d01kTG1RV0VlZXA0ZlFPSTVOa3FUUElNTS9mZWhnNEtC?=
 =?utf-8?B?aGFLTG5kS2ExYTB0b3RwazNKNGxRcE93K3dSVVArR1FhVjdzNUd2OUpoWkRZ?=
 =?utf-8?B?Qkp0aDJZMGhrcVdHR3JxK3FrYk5DeXhLTmxRS2hFdHo3SGxGd242RlZHcEVW?=
 =?utf-8?B?TURzSU01SlVyRTN3VUN5WmtzdXpSdzNQbWMzVnR5MWpBRVJjZ0hpcnhwOWNW?=
 =?utf-8?B?Q1ZEY0t2aHdqTFRDcmFLSWx2aEp2NDRvZy9IRGkvVTJINEVDSTlvMzE2M2or?=
 =?utf-8?B?SzRyUldmVHZ1WGV1OEd4aSt1bEdsRU8wcXJuTjlWMWhqZHVUR3BwSkp2eWUv?=
 =?utf-8?B?SkhZSC9pQUdiTkorSHlSME9PVFZ1dWxhanl0MEFhSW83cTFnaHRUUHMxOElh?=
 =?utf-8?B?WGt2M3Zyd0ZCTWF1c1UzMXRzRitXMm1pWXc4dGFGS2R3UTh1SmJmY2M0bXE1?=
 =?utf-8?B?dVA0RXhyVzJJVHlHUEpJZ0tRUFc4SzVuRU9yeTJiQ3V6ZE1rNHhVQVBQeFFu?=
 =?utf-8?B?TlREckNsbWI3YUFlZE9UNW9JZGEvdVU4M2lwNHFUS0cweGtyUm5lTGgxQVc3?=
 =?utf-8?B?bDhlUlNHS0FhRkNNM21OaGZkSWtTQzJabGhWUlQxL0xucDNtMmtHUWIzV2Iz?=
 =?utf-8?B?NkRHNkdVM1B2UmJwY3hUNEtxRG9LbmhhbWtDUVJRa1FmcVlNV2diaXpleVFX?=
 =?utf-8?B?eEovWDNEcndvazkzVm4wb2pUT1Z6NGN1QTFRYUFLdjlpc0xyV0hhRWpqN1Iy?=
 =?utf-8?B?UWJ2UzYrakE5YmhIMnRTM0V0VDc4OWY3MWlsVXRid1ZFQSszQ0kzYmdBMFlk?=
 =?utf-8?B?TW9TZy9iZjRLY0tyMm1MbEUyVnZMY1BmWHR2S3NMZ2kzTFdpSndmS2hxazNs?=
 =?utf-8?B?SmtqKzE1RjdMU2xnWGVJallnRTRyMVF1aUV5Q0N0N0NmQ09rRHRycXdQWHBh?=
 =?utf-8?B?UVBvb0h4NmZlZ3I3SVIzQW9LL1g0eGNGYWRNNUFzN2ZyaEJ2ei9UdEh0cWRK?=
 =?utf-8?B?dG00c1czU3NFcWNYSlpDdDZjQ2MwZHBpeWdycWhTeFVUVFJyd1duYWRFb2Q3?=
 =?utf-8?B?cjBJYWZCT2V0aDRCSWh3VXhTN2YxU1ZpUFNEc3R1WE5YQ081RnBjV1NJY2xa?=
 =?utf-8?B?cTBzY2l5bmlRVi9UcUJldVcvVVMwRzkyYXl1YWJCMC9iQjA3TzJtajFxWlQ2?=
 =?utf-8?B?a2RqeEhsdlNwOW9aYTdMUjg5MThsbHIwNlp5Mnh4Tld3VHA3Q0JQUEZaWXYy?=
 =?utf-8?B?c1AvelFLakMrVFdPSHNlbGs4UkRBK3A2TlIzNjhNdWM1bXpvcEZ4N01mQXRk?=
 =?utf-8?B?eFRqa0lyRlcwa05VSHJKemkrSU1TVXBJd3hzK256SFh3cVVhVUJ4RE1nNllw?=
 =?utf-8?B?ZlYzSWZySnpzUUdNYW1CeXJRcC9oTytZMVV2Y0UvNlcxOVBCd3lhaXBka1hw?=
 =?utf-8?B?a1BWT2lNejRJRk5VMk1OUmpNZlNRMlFnZkQ0bENyMVlZWHhhTU9TL1pyd2JH?=
 =?utf-8?Q?LVbU+OtJRiyDj6j9SaRctymEn?=
Content-ID: <D3EF5A9697771A418151CBC8B1DB7C73@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06505299-d58d-4ddc-3b0a-08da97ad8514
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 06:34:34.4022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2vqLNqnThdbuVVs8OoRNgEg5T222yrj0zPav4eFP/yja5+08KadJGjxs6JkWVyLEVoCTJNxW8E2ShMSqgIHrCryOaFAEETkxBO5Y8EGPoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_233444_699552_122D1207 
X-CRM114-Status: GOOD (  25.55  )
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

On 16/09/2022 05:23, Vineet Gupta wrote:
> [You don't often get email from vineetg@rivosinc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> As of now the software stack needs work to support ztso. Until that work
> is finished, disallow binaries needing TSO.
> 
> This patch is needed to help ztso ratification and prolifiration of tso
> bits in tooling.

I have to admit to being a little confused here, if Ztso is not ratified
why do we need to protect ourselves from it?

> 
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
> Changes since v1
>    - Build error (and boot tested on qemu)
>    - Improved the comments a bit
> ---
>   arch/riscv/include/asm/elf.h      | 11 ++++++++++-
>   arch/riscv/include/uapi/asm/elf.h |  2 ++
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index f53c40026c7a..b6b4542b3039 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -26,10 +26,19 @@
> 
>   #define ELF_DATA       ELFDATA2LSB
> 
> +/*
> + * Make sure the elf being loaded is compatible with extensions.
> + *
> + * In the final incarnation this will get the extension list from DT and
> + * make sure elf can run on given hardware+kernel.
> + * For now disallow TSO built binaries.
> + */
> +#define rv_ext_ok(x)   (!((x)->e_flags & EF_RISCV_TSO))
> +
>   /*
>    * This is used to ensure we don't load something for the wrong architecture.
>    */
> -#define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
> +#define elf_check_arch(x) ((x)->e_machine == EM_RISCV && rv_ext_ok(x))
> 
>   #define CORE_DUMP_USE_REGSET
>   #define ELF_EXEC_PAGESIZE      (PAGE_SIZE)
> diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> index d696d6610231..fa9e4c52c7ac 100644
> --- a/arch/riscv/include/uapi/asm/elf.h
> +++ b/arch/riscv/include/uapi/asm/elf.h
> @@ -32,6 +32,8 @@ typedef union __riscv_fp_state elf_fpregset_t;
>   #define ELF_RISCV_R_TYPE(r_info)       ELF32_R_TYPE(r_info)
>   #endif
> 
> +#define EF_RISCV_TSO           (1 << 3)

s/EF/ELF ?

Thanks,
Conor.

> +
>   /*
>    * RISC-V relocation types
>    */
> --
> 2.34.1
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
