Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6768FECAAA2
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Aug 2022 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z2B3ugSacl0c6XjXmZwCalrpBLPfjcb8qmPIpL9ctk=; b=CzszSsJiXOi2Vf
	u2ihlaPPFnGT+l8KcV9nQfmYjzdwbZUr/kiMWjF3XNWu5EA3c+TWSXXxXCXaHCkVcVY33R1R1uQog
	NoOeHi1cXR8zw8zT/WYEJuMM24lcMrZSj3C24uDM6neebWhnNUCknSBqxiqBLbj/G2UHXX56ygxrL
	R7OdyLDBj3pv0dYGdbH/rrNOiBua476YRXvpjaZmyhmAomJtvnBYnAHWL7hYLuRefFqwZYr0SmR7D
	WB2sB7CzEAfYkUbW4AbaN1nYIavQUyLttVaACOIZ0iiQZXEfYoZCX9ZbCssQASKzb6BlD2BZTcH4r
	Sa7x9VuN/LZsRHnQvSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSR20-002WoD-Pd; Sun, 28 Aug 2022 22:45:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSR1w-002WkK-Hd
	for linux-riscv@lists.infradead.org; Sun, 28 Aug 2022 22:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661726725; x=1693262725;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GCFYmNJxEKlOXi81vrPxmgl1IFE5WD7MQPgsHuT4YKM=;
  b=oHwuKIh//V4AaHteLa9/pI4Fm9kqn9VoxpkM3SvymiQAbbjIkI4Geu0D
   Il4AUwFWzAIezraVfY8eRLl9V/7NjPGVgNrY3TIbU1d7zxPZlFhVEU1FQ
   qI4+Tdpx6ymU8VePeUt/T72GU6S7nzrvqG3CjwdfGrNGd+8C50QCSSwbD
   Ji6O+WdsHxNAtIAv6DoQOKKS7bdB9X/R0uxt1OAU/Lsy3r8RDuUL5xw0U
   pL7JBduGN4QoadPf9v/W9bbbuJf8sbQ6L1ibHOwJNSlQXwxqrKapINH8s
   vJK6Okor+MjA+9/+ZQsguDT7Nlv2jFxVp7n1dFALO6gvCjRCwQrULPHyK
   A==;
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="178070324"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2022 15:45:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 28 Aug 2022 15:45:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 28 Aug 2022 15:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miZknUX05TNViDrtGqjSTmlxYNV4CR7FZGDXoqxr+978W7v23jJBu2jL4h5uTTTDA8AIGurg2kFZuVvNFbx0AMUs5pcU++uUJ2X9/5SWIhQuLPmXlR8EYHYRd61q3uqhR6ge0d3FmBbnsTVO2uN3iExQPzKbn7nCsP4/0SSIFQsp/PI0rjuVix2p0uVGuzfI8efS7N9Zro1tIWlfudDXCquVuyd5+QRCSLEMLH8qz3yq4ajVLBagkxLtVQj7V/q3uwHJyDa31EloZ7vvdTKm/78+kdWlScRh50MjS/fK6nF1Vmh2yMOf6uos5SdpXd9hyhDTE9Hl+kwkAa2HqkeNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCFYmNJxEKlOXi81vrPxmgl1IFE5WD7MQPgsHuT4YKM=;
 b=Z87L5kgSX8YZi4aEn4lCgdndxeJyXBYABF+k1lz7sEl1w2YiRqM/hjtVbbtfe0wW6E5ATrj+Tpz2ejHIqC3shEXu2TLnmfgOI85Nv5IHK0hgEApd+xzegSTGmy+MqZBGfPWrpmgcv38uGkTvqlOeoSlafGIubfcpYXao5lCqnjU2kYPy3dTzxvNh8ADm0qzJTXllAXds2Og2eLdQh879lZeEPjQpJ1dsMXKOqRkeQV+GKhDG9WGLVDzOIfO6064EhrGNDFPADFAlmkQAAEl1kmZoLJDiIGKomAOd3g9PIotl+2wFSMd54ekMaJYgOKG2f1nCwzTTNrch53i5lXETSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCFYmNJxEKlOXi81vrPxmgl1IFE5WD7MQPgsHuT4YKM=;
 b=VsBbkt1r7F6Mn/PIsxrdEsgzsxJ6KYHzTSd/mvxQ6Ub26Ge2R92bU5/R6RCg/THgj3w0ErTAK6pCzhb7PyKuDMGKSe3pvqBWTGpX1t1YBOXQpdWMzuh7pyhOaO+wALWPi1u6wQ203MCaYomaO1LqJGPc9sRUfS8kcByp5FBOX9I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB2015.namprd11.prod.outlook.com (2603:10b6:300:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sun, 28 Aug
 2022 22:45:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 22:45:05 +0000
From: <Conor.Dooley@microchip.com>
To: <geomatsi@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <atishp@atishpatra.org>,
	<mark.rutland@arm.com>, <will@kernel.org>, <anup@brainfault.org>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<sergey.matyukevich@syntacore.com>, <atishp@rivosinc.com>
Subject: Re: [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
Thread-Topic: [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
Thread-Index: AQHYuYtpUI77r2WEBkGbhmIdER/euK3BvTWAgAMarwCAABSmgA==
Date: Sun, 28 Aug 2022 22:45:05 +0000
Message-ID: <e3a38e83-9ce2-b8db-ed6b-7dff9b8b0161@microchip.com>
References: <20220826203443.823906-1-geomatsi@gmail.com>
 <20220826203443.823906-2-geomatsi@gmail.com>
 <70656978-546f-c14d-96a9-8dc7d8dcf9aa@microchip.com>
 <YwvenvGgTiJAy69W@curiosity>
In-Reply-To: <YwvenvGgTiJAy69W@curiosity>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 838dd8a4-e346-4e90-573c-08da8946f3d7
x-ms-traffictypediagnostic: MWHPR11MB2015:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +bZ8LJmIts5Fkei9TCxIRBpk8AxQuE6G71KKvmnKuY0uuEI0hLbclGaQ7p+es88l0EWPRerzQRYrOegSk2IGkHIOmx2RolOoHzeD5gh3YYQwg7P7raxsoPIa06IjB/0xV/8Drw8x+4GyYv2DuvFyZy1ZsuOSH3dgk4YHa/TpUYim9NwsL6x1HCmg745xgvs1YWq7pdJ9X37G2WYBhOHyO6yL4XkOt3g5ed0FVtwVVQQvGB4aZjAcGC3FFoY33X2XaXji5mAswaHYX4UWkM73DzDp/4hmL7OfYzdt+IaTTIxKlM7S2eF0zCkcdFm+iYxXGsvZVYwlxAUoLDgtLRlREKItFDruXLGwERM9FrGcpb2u+LNMfCEaJrB5rUJWb8i/Ka0KZPebIUpEjAaLg/yifUtH+yoxFBwUZU8EzanRamcpODR22ypo4blA7us3+zTT/zTBW2FvrqtPOEcoOkm5od7QUIqCaHT9NPABos+LlNHXsWXewoRrxQ+3T8Y3jJDOZSWfjkZWgoSp7nBChAJvMY6udvfBXhdhIHorh+k3IiQRtHJ+oFarAhjEadlkaS0qwARuJeqGCadqlXE5EbvYrNm6GvrnMi0t93DYhVExDnrt8Rl8Au9k0M5ZQS++Mq5MURiJlwEL6KKMqyvmdINyf4DH9BCogsW3Acz2WO+4Hif3rtZ25U2PA7aFwBRhdiT1WRTd6eWJB5T9vSXREwfylMOqhEalIzpx6Rzm8jCTH5uVh6lfbi7cyFdJ8IkwIRfHbml0nN3xVEos53jfMMpc9TRs+hWDiXml+Rz6Y9RP8/rUGx2o6sD6pr3Y2tEpPvKpeUWCeE4Oehu8eEnmZF/e+ha+rD9BiJkcZqlH3xOTvUs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39850400004)(86362001)(53546011)(6512007)(26005)(31696002)(71200400001)(6486002)(966005)(478600001)(6506007)(41300700001)(122000001)(38100700002)(38070700005)(186003)(83380400001)(2616005)(64756008)(54906003)(6916009)(66446008)(66476007)(66946007)(5660300002)(66556008)(8676002)(4326008)(8936002)(91956017)(36756003)(316002)(31686004)(2906002)(7416002)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2MxY1hwbS9UdU1hZVE2SmxSNjZRZFZlbDZaREl3dUdDdXczSm1sUUJEWVRs?=
 =?utf-8?B?V1pxMm1IQmdVVHUxSWRUUE93TzJobEpackRVWExjODJUTllQOU1DTENWQ3ZY?=
 =?utf-8?B?ektKS0txd0VXWE0yWHVtbG9URjZNQkkycDJZSE9ZS092SWFmQlh6RFByN3VY?=
 =?utf-8?B?Z25uWUlDcmM4N2ZMUUF3dm1sYUF5ZWlKN0ptZ0hJVm5IQTR6b2JSUXYxNFd6?=
 =?utf-8?B?OUpzT1ZCVFRITU1HNzB2b0JWbXMzdlR6cjJHMGszR2V2WkJNSVRwZUdoeFJj?=
 =?utf-8?B?dEFmdXl5TFFwaE1SMHFLTFBrZ1ZvQkJZdnRmVEppQzZqYU1wSkJ5VGRrSHBh?=
 =?utf-8?B?UnczU0FqKzhJTUNSOVUyYlFKWXk0a0QwdC9oUDNEdFRrZ1kwQi90cU8yaExG?=
 =?utf-8?B?RnExd3J1Wjg1anFRbmZzRW5rc3pBSEYvSlVrR2dtWmhiT0o0MHo4aWQyTnZ6?=
 =?utf-8?B?TmZTKy9JRWJyTlI3ZXNCM0Z1WUo4bU5oM1dQTEZ2RzZmUEYxOTZ2RnlYSzlY?=
 =?utf-8?B?dGdUazkzNDBjOXdQUGlsczJ4ZDRUcjNYK01MSldGMnZZQUplckNGNEIxdVlh?=
 =?utf-8?B?QmxwR3NJeXpyeEdOWUtsNXVad1U4cXBPUk1sMnpGMXNLdHovc2hnVkxmaXpx?=
 =?utf-8?B?dFhKcHd0KzNicVdjbkF6K0MrelJEUnFHdk1aQlVrTEtNdFI1NHduQVVUM0dp?=
 =?utf-8?B?ZEZQS0hVVklETW9ha3c5dkZEUTdibXJ0WkdObnRKaCtVc283YmZoRk9MRHJ0?=
 =?utf-8?B?aHlSbzN4UzN6bmg2c3Z5K1IvZllYUUtEemp3VjRFeFJadnlUQUR6Y1VrTkhn?=
 =?utf-8?B?ek15ZTZ1dFFQNW9xUWhRNVdTcFVJUnBrZFJSakJ1aFVndnRpc3NzeFpJaWd2?=
 =?utf-8?B?WjVDTi81aC9JZUpsejJjRXFyMUxjeTM1eDlZRTBQWTA2S2ZXQTRVd1oxMytE?=
 =?utf-8?B?dElIZmVtVUgvZGdOUkd0cTlveXU3dS83RnpjVEIwOW5zTjR4cEZ3eTE0aGJU?=
 =?utf-8?B?MHdJaHcvcWdxdmtuY0VJSEpNb2pWUnpPTkg2cFlHeGRlUG5hc0NkTWtDN3Js?=
 =?utf-8?B?dmlIbURaRkRRbjhTYnQ3K3pQMWVRa3M0bEpXUTk3MXdqZCtqMHkxUFBjR0ha?=
 =?utf-8?B?M2dBeDZlQzh3aWF6ejVNRGZDaStBRTY5ODd5d1MwcGYvdVo5cXVqTndGb0pR?=
 =?utf-8?B?bThEVW5UVzVFMVUrcGg4KzlaaGI4ZmFQTjVHa01USEhQNEpJOTRrN0NQdzVY?=
 =?utf-8?B?aDBYekpsZGpHdFd4dElmVmdzVHBYcFFadld1eEdjYkx4VzFmNTVJek1JMkd3?=
 =?utf-8?B?Z3hhelk5c2toZ3NIMXYyekttZFBtUEJaeFhPL1NleUNYS3NUYmN5bEpxZ3ZL?=
 =?utf-8?B?d3NvdThaaXp4QVNFSmgwbXlPbkFKOWsrdTdUbFAxR1RsMFVCUXRubEwyQjR0?=
 =?utf-8?B?S1ZYdUh5QWRKN1RESVdZRWo1aytEdk5iazFSTi9PRFRSWlhFbkpvWG9RckhS?=
 =?utf-8?B?d1hyRlU0QlhwbWFmL3VzejFmVEhTeDVJbVAyMUwydU9OelZWZnZGdlFMYTFm?=
 =?utf-8?B?QzNJMXg1dDNoL0ExWjhRZm5aS09JN3k1b1BZQ3hRUmNVVjdWR2pyRW15SlE5?=
 =?utf-8?B?czdIY1N4VU5vVEc2QjVsQzVCdUtBTFIySTdTb3FHT1NPVlZscVJXQnZSZWVU?=
 =?utf-8?B?WmZ3dWE1M2Z0RGlsMklXdFNMMWhTN0hQV1lzcHpRODl4RHRtRnVoemx0aStW?=
 =?utf-8?B?VGNnZ3A5LzJxMWdDRytqNDJJWnZRcXVJa25PRllXcTJ6ZjNIb2ZmRHVSSXZB?=
 =?utf-8?B?eXhITHJTbUtQZEd2U2RWalhjTHdBaTVCaXdDWEtYQVpoVjhuUGh0R216Y0ZV?=
 =?utf-8?B?QmtDeW9zNE5SYVhhYldQczhuRVp5ZFhDTWNhb2Fuc3VqV08rakJHVHJUMzl0?=
 =?utf-8?B?dXVJQjBoUlRoakpuN2c2MVdjM1g2dFQzV1JwdDc0NVh3S1hRUFQ5cy9rU2pw?=
 =?utf-8?B?MXh3ZmlUSVAvUWVkaXdnbDJLNWpsT0tjclRxb0pKa3RqRXpjbElHcUszSzhx?=
 =?utf-8?B?OWxhN1ZObzEzMWI5dmRvem9MdGlsaXdrd1N1amdtVlAyNFNLblVZVW5sVStW?=
 =?utf-8?Q?z+8Pp8VbphoPlEfFk/oaKxEyw?=
Content-ID: <BD2163E3CBD81648A916795C59ACAD76@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838dd8a4-e346-4e90-573c-08da8946f3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 22:45:05.7881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQAhzex+zub34Dhdh8CY+UR8iYxNTtNMYPmpHY7dxaao8DxO7qOn9vl1R40XHPgIJw8NDRBljXMe8NWEYJ55A3gCuGoBGS0zbqS4nvYahzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_154524_863888_86044806 
X-CRM114-Status: GOOD (  26.04  )
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

On 28/08/2022 22:31, Sergey Matyukevich wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
>>> [PATCH v3 1/3] perf: RISC-V: fix access beyond allocated array
>>                                ^^^ (see below)
>>>
>>> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>>>
>>> The root cause could be related to the interpretation of the number of
>>> counters reported by SBI firmware. For instance, if we assume that unused
>>> timer counter with index 1 is not reported, then the range is correct
>>> and larger array needs to be allocated.
>>
>> I found this to be confusingly worded, had to read it a few times before
>> I understood what you meant. Maybe it's just late on a Friday, I think the
>> theorycrafting about why the code looks how it does got me lol
> 
> Well, it was not exactly theorycrafting, see accompanying opensbi changes:
> http://lists.infradead.org/pipermail/opensbi/2022-June/002926.html
> I tried to provide some context for this one-liner, but failed to do so.

It may not have been theorycrafting, but it read like it was. Your proposed
commit message below I think does a much better job of explaining why this
needs to be fixed.

> 
>>> This is not the case though since SBI firmware is supposed to report the
>>> total number of firmware and hardware counters including special or
>>> unused ones like the timer counter. So just fix the range in for-loop.
>>                                               ^^^
>> I see "fix" mentioned twice here, what commmit does it fix?
> 
> That is the initial commit adding the whole SBI PMU driver, so it is a
> bit confusing to add 'Fixes' in this case. I think the following commit
> message should be sufficient:

Fixes tags are good so we know how far back a fix should be backported.
The driver was added in 5.18 AFAICT, but that's EOL so this fix would
only need to be backported to 5.19. The appropriate fixes line would be:

Fixes: e9991434596f ("RISC-V: Add perf platform driver based on SBI PMU extension")

> 
> SBI firmware should report total number of firmware and hardware counters
> including unused ones or special ones. In this case the kernel doesn't need
> to make any assumptions about gaps in reported counters, e.g. excluded timer
> counter. That was fixed in OpenSBI v1.1 by commit 3f66465fb6bf ("lib: pmu:
> allow to use the highest available counter"). This kernel patch has no effect
> if SBI firmware behaves correctly. However it eliminates access beyond the
> allocated pmu_ctr_list if the kernel is used with OpenSBI older than v1.1.

As I said above, I think this commit message does a far better job of
explaining. For v4, could you please use this as the commit message and
add the fixes line that I pasted above?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
