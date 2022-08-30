Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9382ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 14:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8zMqco+QnjBXwpFwG7G5L4H0+SWPkGh6uAYNqhBUak=; b=fNfiehK1nSqKjZ
	ChVQw9dnqHveTg8cXnZyITBhL9sfYiiduQhbU4Ve3/kuhs6nMuuVFGU9aF2eDAHKNM//IniMHLwwj
	DFiKkZ4j/PKYcPU8Ftc+Dv9oinFy9LDJCwku9Ql4DnOhuYJUYBjdqw40yv51E8KdGXEzHuoCShhG/
	gH8/kqQXVYp6JwEzLNDfSihAO8rJaLn4V30d1/bnf4VitjdYrbFrFoPjy/dECVb3m4OXZjUO4HrI8
	0NNFWpyL5tUy43yk3sKkP/GVemQeO4HqbGKNdHnwUdJPYnFimU7TjIxHT/amsXVM47oPjqrxA+/UW
	9pd6KxPtW+TiVNWvIrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2CW-00007g-FC; Tue, 30 Aug 2022 14:26:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2CS-00Hb7d-Oq
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 14:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661869605; x=1693405605;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Nzfte33TfwdNPC0Yw7KDDU7ix+I/reykY89quQq3bGA=;
  b=p5kQxVMFkaiFj0KLeczdiD9AnV6NIVQdzILiLvItbZsJnOATV9R3QISC
   kM0ZZOv8j1Oph+PvqbEuWVwLAHrADH07a1V9ji+WhCtmlcMBQyMQuxC1N
   vzKISjVaPeJ53QOcf24MOC3ADAUne0XMzlqKSUtraeNMkaTR8OhoOG2Y0
   IxxeGloClAo8rQNzH2ah/geHq1/dON7loUMlWkIfpUqG89jrcVuydeQJ6
   E5gAEzviJnKnZb/oarlin1YsYBvn8ylPvolx2fjiOgi+E0WS4kZsAINbb
   4xPIKQDMokkDm3wGYjpy4mYRWe4Y6PCXQCZPXnJDvt+S85p5fRuFPrZz2
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="171602748"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 07:26:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 07:26:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 07:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyxeXeoz1BjLQ/RNcjpt7L+sBR1FaDR1L6BxTeVcUlRggtusdndkeFrJoGirFpdSZfd1mX22uzax6EQoZfAF9vD1VEEbCt8ScnPV3m5/Vk3rV2zDIy3414z05Z02YmNZGCrhtyqDi+aOmWnH7Q+F/Q1NyV+VQR1rJcp/x0RQzlsUa+8PDL8rpuQ3jkasidDePWqrSnyI2BuvEwIs3zsHSmtYPXTC+RdFjq7VrQTYtk3rhJIOPV0lXnAez4TOcKO4mr7Q7Lo0RuBQi3p4e2qOZtRk6+qoQWd8gZIpr8TzZUk3BnWOxnLQbN23Nv8Xhotq9VYcG19v5sn8903878ayCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nzfte33TfwdNPC0Yw7KDDU7ix+I/reykY89quQq3bGA=;
 b=aitq83mdS7BMH1JgNBnzphTclEuAV/hicfsmTQjMCYBwcxd2yrFNPer16cqAPyGcceIUXSwb47xGZMF2kEu4S7sdh7OzBuoyvEOdkNdLkUcDllV8FQELVHzLxArfpJAm0k4duat87LHTtT4Tis+1GQEqHwzGesKyVSSWgU8m/zuFg14hauZ+1F2XUO5TwQn/dcwt9wAxzhN9vuguVVCh4ZADLKQhIO5B6518c06Kkx5kIMm/N8LlcXL+VIVOXl6DM/7xOiXS7CO/XyzqhzUI9/sRU891jQEAFTm+vrRevmeq7ksCUHPPO2ul9UNbkoHkQwEHT4rP5gdY5n3GSP6D8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nzfte33TfwdNPC0Yw7KDDU7ix+I/reykY89quQq3bGA=;
 b=d4mOlmKB1M8C2wvpzSyhV82vOtCKQT+9bfzhlSsGJP2nctk2SSILDSIYPCteLzQcm46dwaPHCNYKiy7vTY9jwLyGd3STshQIhwzVquao0UJ++Azq7YNQwIW28H/XPJUkOSYUEst5+q+QtGzvbAhk1kz+hz0R8EJm5RAwlTlN9hU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 14:26:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 14:26:38 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Topic: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Index: AQHYufzf4JJbBuNch02tBI9sTRPCrK3DP5sAgAKut4CAADcFAIABWCIAgAAEioCAAAMJgA==
Date: Tue, 30 Aug 2022 14:26:38 +0000
Message-ID: <22c254ae-2b84-1342-4b2d-f532f34e2c94@microchip.com>
References: <20220827095815.698-1-jszhang@kernel.org>
 <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
 <YwzI7VmfFnOvYWgf@xhacker>
 <4037b310-47c4-ca30-d4b6-a284e87da437@microchip.com>
 <Yw4XwsVQBB1HRw04@xhacker>
 <d9331af0-58bc-ed3b-10f5-8509795e3198@microchip.com>
In-Reply-To: <d9331af0-58bc-ed3b-10f5-8509795e3198@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60a2c7c0-b1a6-42fa-cb11-08da8a93a652
x-ms-traffictypediagnostic: DM4PR11MB5437:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b23Nmp++eoTxcwV3qwNGsgT4sKfvXQr+zIH2zdTMpw1UQfrcX07u0SzkAMGggL/p12rxHlA9k3F5ONi957epzfHOb06l9Mhb5bytZjIcjtWIvk2UhDSLNWEMzWRG9aoGicojlGNtIfqFamzFutsi4c/DqRGASy+lam0wdHZJuJi9pTL2P6zACAgWeLLRqsn+1hCfY4l+L6OT7wP1TCXRbrwZg80rYIuOUOBNoVBR1ySI8w2Cscro2O/Y2v6ecLhXofcJq22TLlVljbwpb43tFv7zV9jKr8AGFPyM7EoshN/z8ygYTjCac2XxgcIZ1/38D3sCpOZu56k7+9qOwhgdq/8oPXTzQGRnME7gGaAg7LhYxnG1Uk10cQ+Zr9klO7EG2GCyAGJ+4nt56w1qwU34g8T7nzGYN3cocFyVB4tWVT63z6WaJibX58wsX/cQuHIA7bnomXXy3FKuJAna447y0B2yZCFGLFXFiA73X0m+r6lg/J5mbIWVj1hn92NN+qadoJmzJCxjEGZvGbwN+f0Zf+lxeD6WDFk08Z1usj00Fju8E0zL2fUoxGwD5i7cdhqZoKh3lqi2aor2yBlxTGfud+tALJoJMIwLXXaP3JqShsvS/K3bUQA5CW41rSdGVUPT2P3e8nGKb3PFAW2y3FLxPN/NW2eF9O8jonNesa34O3sayCRfUYbdL+2UXJun3hY5qJdl8deBCv5+kE0OoFAJCZ2pUaKBccizXoZgm8Ec/7rJsubLJzUf2Smj7WUjqjmriLeGaxsBQ+2Z5JWQJWuPngBDWsnmI6UEA8otyHKiSzIiBqljsXK95aDAWDrVBqZoCz/WJFpcs63Xbz/2aLu5HQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(366004)(376002)(396003)(39860400002)(66446008)(54906003)(64756008)(66556008)(66946007)(4326008)(5660300002)(8936002)(8676002)(66476007)(26005)(2616005)(76116006)(36756003)(31686004)(316002)(6916009)(2906002)(91956017)(6486002)(41300700001)(478600001)(6506007)(53546011)(86362001)(6512007)(71200400001)(31696002)(38070700005)(83380400001)(186003)(38100700002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1BaU0xNZEVqV0Z2Z1o1alhDdzU4ekhSRjVDS3NVdkxyZk15aWxueTR2c3Fw?=
 =?utf-8?B?QjltMVVIVGt0MVFualE2blAvV3AzZG5GeEFTTUU3Mjk3K0duWFFTNkwxWVZD?=
 =?utf-8?B?S0E4ejZ3TjFRQ2NRRHBOWXpVaGJFU1k0aisvTngxeGFqOTRUYVhoQUIxNkRI?=
 =?utf-8?B?VGNxbC8rd2VYM0lXNk10RjB2dEtxMkxkQ3Jka0RKSndDb1BhaWJiZGpqZ0FR?=
 =?utf-8?B?RS8vNlVDNFcwbTRhRG9OZjFVdE1LbXJPVEZOd0Y0RlJSV2VGc2p0aU16Qjcv?=
 =?utf-8?B?RW9TNXYzS3NURjRBa0RIeDVYTGJ3cnMwczk0c2dtUytHWmF1aklpb0FMQ1Zj?=
 =?utf-8?B?Z0ZSVUEvODl5VTBoa2wzM1ZoNGJickRGN3VvaTY3N0FvTXV3WFlzODg1NXEz?=
 =?utf-8?B?clVwWHkrZTA2WkFJUzQ4MkFRL3R1L0t5YzlKd1ZqZm90cWVGN2IwQUdZYysx?=
 =?utf-8?B?dEhYd2xxcUxobGdKdkt0UVl4OGFVME1zT3I4bVZqSVViNW8xdmJlaENPYXVD?=
 =?utf-8?B?NGRrUUVsd2IvdWt2UXVacTJZaDQwYVc3VUZZWWdQeExDWWpjWENnM0ZMVE9O?=
 =?utf-8?B?SUZnbm10dnZQNzczYThObDNuT3pkWk5teU1YLzFGM3pyenUwRURwc2x5SmNC?=
 =?utf-8?B?U1g2cC85Y3dmR0NEazFYZG5mYlhQUFJJbnFMU0JEREhpZU8zT2J3dUpmeTI5?=
 =?utf-8?B?UDdJUUhYUDQzQStqOTdZS2lLaEN0cGwvNWEvdDdDeFJ1OGFjM0MrM1NPZVYz?=
 =?utf-8?B?SkZEMVJUbHhSVnlLbWUrRE9Zd2lQY2Jra0hQTmtxeE5UYUhpd1pTclVKZTZW?=
 =?utf-8?B?eUF3TDRSZlVtaGtqS29mOWIvUjNHaHZ5YVBYb1NTaUlKblBIWGozaXNBeWYr?=
 =?utf-8?B?ZXVtdlowTDhKcXQxTEtTYmpHSHY1NVZ3UHdTTTFhVU8vdEtpWmc5aGJ0dU9Z?=
 =?utf-8?B?enhzaXk1RlV6SGR0ZHdZWDVqV0N1R0E0UlNaRHh0NUNLbE1YNlF2S2t0NCth?=
 =?utf-8?B?eGluWWRHY1ZPWTBtbHRuL1pJaDhLWUNHS0JTM0ZHd3hKYUlacVNSZW5JTnJ2?=
 =?utf-8?B?TmQ1U1h1NENYODdqQkpvc3RHS21lQksxUEFiWTA2dUhZMnhqTUFEWXlrTlhq?=
 =?utf-8?B?ODNqNE5tZWducloyOFhoYmlKTy8vRVdTVGZiN0IzTkdPUG1zc0wvaUk5cDVO?=
 =?utf-8?B?aTVxMmphTjgzZThEcnp5amxlSmlWUThvN2hMdWRvMkRwL2IxaHJKSWQveDFO?=
 =?utf-8?B?WEJHYzkzb3VYMWN6bm9HTS9tTndJa2hEblBXdmxIbkRGMkZDMVplei9RcUJl?=
 =?utf-8?B?UDR0V0twMDQxVmdTVmJ1OVN0eVBjRGtTb3BRZUNvNy9lbXJJVU9DRmZ6ZnF4?=
 =?utf-8?B?K3hZRmFhY2lxMUtKbDFHMmEzTHpZbUhqVjRIb08vUXZMbnRlQ3Z0TEtaRWxU?=
 =?utf-8?B?N0gxNHd4Y3oxZDhtRGlQVWdaTzM1Nkl6cUU0Qm1zNmp5bTM1Q0ZHZjBkVGRo?=
 =?utf-8?B?WGx6aDhWczdGUzhrVE1tUUpaeE1mSWMrTU1OOUQ1TmVJTk1RblBWMDU3V0Vw?=
 =?utf-8?B?Z3Z2bEh3MjdlZG1VNFZCS2lzNjhUNkFMNEJ5VEtFSVRIR3dycVVHdnpEUDhl?=
 =?utf-8?B?UkxBaDRIajE0RlUyaUpqeUdCcFByaldFN0padXVxRC9jWlZ5bzc5K2xFZVRz?=
 =?utf-8?B?eFVaSldiTTB5c1kwSHFKS0phOThZNndtKzdIeXBqYWZWd2w1M0N4dFF4dDlr?=
 =?utf-8?B?QlRoQVdQdFNmUVdXSFV2VmFYQ0tmcXpITEw1dmpVOUk5bU5zS0FXUVlKV2lD?=
 =?utf-8?B?K0pkbjJqRTRxZmt3Q0duNVlEVTZOQmZoeDgxdFlxeFgzbVlPOWc3UVZCUEE5?=
 =?utf-8?B?MElHdDZvN29zK2JCYjd3YTQ4ZVFHWTlqSXBuL0xQb2NicTNvM1kvd3VZN1Fp?=
 =?utf-8?B?aCtKY0JFQUNyQ3ZZWnR1SFdVTHZiaWQrN0VQTVdsc2FBVmhJSjNnVDVMd0V4?=
 =?utf-8?B?MEE1MHRFTXRrM3RCNU9IK1lrdjBFWkNuRlNJSWY4Q252TkZSOWZzNjF4VWdF?=
 =?utf-8?B?ODA3ZVdpRVJWMjEvSUFUR1ZCK3lqU3Q0Wm1rM0VCNG1LOWZnS1R5dzFsS1py?=
 =?utf-8?B?UjVPbHNQVGZPL0ZLV0xlQ1NoZThaYWxQNlJ2bFNuYkVXNmlUUyt5VnluUSty?=
 =?utf-8?B?cEE9PQ==?=
Content-ID: <631BB8EB030D9F428B3E294FF4A09CBA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a2c7c0-b1a6-42fa-cb11-08da8a93a652
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 14:26:38.0988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9bcPIc7aDiR/fNeAM9IuULT5KxQq/hFqH9y/0aot+jsjBMEOvaVF5XJfxbbFw3tuvj4j2qNsH3C3EfgEJxnRfl/I/xCzXr5lDPfB5VWEvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_072644_929920_B0F1FB63 
X-CRM114-Status: GOOD (  20.24  )
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

On 30/08/2022 15:15, Conor Dooley - M52691 wrote:
> On 30/08/2022 14:59, Jisheng Zhang wrote:
>> On Mon, Aug 29, 2022 at 05:27:48PM +0000, Conor.Dooley@microchip.com wrote:
>>> On 29/08/2022 15:10, Jisheng Zhang wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On Sat, Aug 27, 2022 at 09:13:03PM +0000, Conor.Dooley@microchip.com wrote:
>>>>> Hey Jisheng,
>>>>
>>>> Hi Conor,
>>>>
>>>>> On 27/08/2022 10:58, Jisheng Zhang wrote:
>>>>>> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
>>>>>> memory optimizations such as swap on zram are helpful. As is seen
>>>>>> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
>>>>>> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
>>>>>> swapped out"), THP_SWAP can improve the swap throughput significantly.
>>>>>>
>>>>>> Enable THP_SWAP for RV64, testing the micro-benchmark which is
>>>>>> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
>>>>>> shows below numbers on the Lichee RV dock board:
>>>>>>
>>>>>> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
>>>>>> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
>>>>>
>>>>> I know the original commit message contains this, but it's a little
>>>>> odd. If the patch /enables/ THP then how would there be THP swap
>>>>> prior to the patch?
>>>>
>>>> hmm, it's swap I'll send a v3 to correct the description.
>>>>
>>>>>
>>>>>>
>>>>>> Improved by 382%!
>>>>>
>>>>> I could not replicate the after numbers on my nezha, so I suspect
>>>>> I am missing something in my config/setup. zswap is enabled and is
>>>>
>>>> swap on zram rather than zswap ;)
>>>
>>> I think I tried about 30 different config variations, initially not
>>> using zswap and later using it.
>>> My zramctl looks like so (although I did try zstd too) after running
>>> the demo application from that commit:
>>>
>>> NAME       ALGORITHM DISKSIZE DATA COMPR TOTAL STREAMS MOUNTPOINT
>>> /dev/zram0 lzo-rle       241M  22M  8.4M  9.1M       1 [SWAP]
>>>
>>> I am using the default riscv defconfig + the following:
>>> CONFIG_ZRAM=y
>>> CONFIG_CRYPTO_DEFLATE=y
>>> CONFIG_CRYPTO_LZO=y
>>> CONFIG_CRYPTO_ZSTD=y
>>> CONFIG_ZRAM_MEMORY_TRACKING=y
>>> CONFIG_TRANSPARENT_HUGEPAGE=y
>>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
>>> CONFIG_THP_SWAP=y
>>>
>>> Am I just missing something obvious here?
>>
>> similar config options here. what's your rootfs? Is your board busy
>> with something? I used a minimal rootfs built from buildroot.
>> can you plz show your numbers w/ and w/o the patch?
> 
> I was using fedora for the testing, downloaded directly from
> koji. My before/after numbers varied, but were around 80,000
> bytes/ms most of the time.
> 
> If I increased the size to 500 * 1024 * 1024 I got around 130k.

130k before & after.**

> 
> Before/after the patch, the numbers did not really change, but
> things did fluctuate quite wildly - from about 50k to 90k using
> the 400 size.

What I mean is: before/after the patch had visible performance
difference because it was always flucuating in the same range.

> 
>>
>> I also tried the simple benchmark on qemu(just for reference, since
>> I have no other riscv boards except the lichee RV dock board):
>> swp out w/o patch: 30066 bytes/ms (mean of 10 tests)
>> swp out w/ patch: 130055 bytes/ms (mean of 10 tests)
>> so improved by 332.7% 
> 
> I'll give QEMU a go so :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
