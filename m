Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F43C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUIqgxR+PLeFKJuDZY39O8+aYy5RUnHP0nraE7wECVU=; b=KcxnKfw7L7m+fgkPoJQFbyQWfz
	P9xcrQmCqTSUKT4wz8U/vHRP1fAMkk58ydxUAFc6KPrlfzOx+vT9tMVntMoITfQ6T5QSeTn2UySOD
	ZPaVVYKPnZHAh+nISusaeoiN8H45eanuroIoxiiBsdJeiT5wDNDJuDqp02GEtPay+JCEy3An5RD4v
	l6cl9TRdkGanf1EFq+fnUDCSRSXJb+m+FCSetG4mfUzMd6pvpmRblKwr2zzRCyrYFr1/9LIUEFIFs
	VQjhevNtpUsZ5yLN0HDye55Wr5A7i7km2r1oaIx3bq+8M5I5Ery+2AgTj9mNVbatpoxBsq1yIAdEa
	B8JOb/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9Rq-00000005PVz-1fDK;
	Tue, 26 Mar 2024 16:14:50 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9Rk-00000005POP-0Vyw
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:14:48 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42QEnoPl014850;
	Tue, 26 Mar 2024 16:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=dk201812; bh=gr3Gd+ei0MyTg0u+0jZzp
	sS4sQYxm3VF62vZKnCLV5E=; b=CV/DjaFXGa6h1IVbpgixMP4RcPot+quawi/ew
	XmxYAfRa1SNr89UHnmXiG85TR0+EswKnrzZShqPYsg/8p1qLnW7ZHt0mlZhdzFFB
	BwMFoFethsC3OZpQSyxx1/j5LMGux3gNTw9JesQ29gBvyy+9/hbydE+DL0stt4HG
	fHLn3mNt6SSTyTeraZ5Gkf83E8HaDTnRbqE+e1yzZMnfWuvmfmUDWIgGeUeCc8B4
	ltP6O7gJj5SEbdaIjO42xiUcx2FPjWuxsJkF8FeZcY9DIwcVUy4LVDVfLfFSlA1J
	cNlSeuMp7mTVXVaJrv2HbpGUkwfQQ3HEJkJz0JO2HVbX5H+zg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3x2gj3vhad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Mar 2024 16:13:47 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 16:13:46 +0000
Received: from CWXP265CU007.outbound.protection.outlook.com (40.93.68.3) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSQ2v3W3m5cUwPDrGLCJ7SAkX+ZMVF/JuxJE4G6cmHwXHL2rL5z767YDrjSpXP2LwKAaOkNTMLV2ZULownJpFmRg+4GYd7edEyzdh+KzMm587RTvBSAZ7dta9LRiBw4DC4zGbNltiLSKmYGGrk5krK4ptosBDBIaqe7Gx4sYeCf1sW5c282v+ufPENTR6m8dIXmHYCGgWHZqwAQOXVfPVktTIi8I7giQHdcIjP3fiCyZpp8my3HZLwNvd7uu9bsp+7sm2LAFLsPFlxq7eqVPFDkOoYegP7JHkIgBW1jev8Daoist4S/0O4K7+Rvq37U7jzqfsK8G7YfeYYx0FihZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gr3Gd+ei0MyTg0u+0jZzpsS4sQYxm3VF62vZKnCLV5E=;
 b=aOzTpkieXBy44zoJgC68k3ptIMJILe8fiD8TftIwaZZxCERe1zvLgIUY5u2Uc3xWKr2OMqUZ3Ck7o4bVI8YndAUu2E9t5fZwhbQ6nCGM2Ssz56Pb9Lg/iPxOWcS3/1jbcOvUJfXF89vyyIhKdtivaVcCfiuJJ/KnupRF/w5TcO1ImNw1WwisIcwpxYT4iwyLvTOWmcwIPm57BMah9xtF1qCbDEyjIcqB+0qTsIFZXXaQxzxDRUxErsEyhVga3rNw3OdNmR1/jn3SsgJ+w4LwoMnrvyKROFrrmLAFDWJXNv6Dd9RvW/L27h+nLlZGanPK8ybUS6uJPeP+70xSVADCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gr3Gd+ei0MyTg0u+0jZzpsS4sQYxm3VF62vZKnCLV5E=;
 b=fh0ZekrO4e6kdPUrKSkQH00+WwcuTqT56+NzDNovwW/ou7LiGwNitbWNEMNqoOpMcr+EYSvD2/981fREjpPj8FtH8zo75EgyTCWaSMowQuU/kMCMKoygr2f47g6Nxmnvq3Sn28VEWaKtTjDHoTy/OivMO4lMupWy909oK5fHw10=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by CWLP265MB2658.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 16:13:45 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 16:13:45 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>, Carlos de Paula <me@carlosedp.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Thread-Topic: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Thread-Index: AQHae4ckMsPcRLd2wk2AKuUd+eKAXbFKMRMAgAAJBAA=
Date: Tue, 26 Mar 2024 16:13:45 +0000
Message-ID: <286a8f76-f670-4458-bae9-f2d383629058@imgtec.com>
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
 <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
In-Reply-To: <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|CWLP265MB2658:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IKJ1vI6oE3o85TS/EcKj63CfqsBifUofIoZbeZYKohHttz9y3pmAN/j9RfH4nJx8+7HMrnQooewEMf5PeW7dgLmCF+p55E/VAwRXaxNuXgOAq9qarGsLo0n0J4W0Vzfl62tbtiGpMAqjNzvO5CEVyCxD1GtVLhMCYmN8nQ0fW/zqEX9ikk1SCCB5hfVL699Q/h17cKwR9KLM8hRsEsWEogVWt2lw4iIn3rlm4nvjdxPr/vm7XxviuNMOT5/xOHXp/ZPRTDXVY8EtTQAwzESZ03d+hwS6xa/pjpxA2WEw/wY1LLnOb5Do5KtNYW+FrPyGBhjGwTsh/nUkp5rXSGTxfsAFpl9YfxBmaRr8bahVeQaod43EWRromQ/Lqxe9dRAuMpgiqhDAXz2tEj95rBPPp5y1qK2A36Nm1IzQnL7N/79Ml+QlwAswuhd4R9sw+O4A+CfjADy7/Z+0vBFYRMvdjIZ8aKtpRUmAghsb/+NVlM66lTLZ02kFmTdpQJWfjpQk3OYQ/Yv8QAnAun1blqsuLYp+VGU6rCQ3fM5J4mM6O5cWQhKEO0xCba/HZKlns6cM7Z+VYCcOPz+Ed+6jWkfv0qMJG8pIUFVvGaMQfkKDlSuLiqifvNL/DwUdNqDWZru2nb+QsRt1t0G/KkpgZCtWC6w1LyoZvLa+5urBoVFLfjg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDRqUTUwcThHdFZ2ek90TDdYbm5CVU5pejcvSDJxZjU4RGMyUlNZRTVEZ25r?=
 =?utf-8?B?ZnhYd0srVTA3cFd2cWRyTVBsSzJxVVlTTHlVZVJHdCtlRVp6Vlo4d1E0c3hH?=
 =?utf-8?B?L1hXM0xTbnRvT2ZOS1kxcGU5RmNmcXZNelptaW9sMzZmMHZueTg1bWxJK3Fs?=
 =?utf-8?B?YWd3NXhBT0RVaWhQRUlaR2gySmI1VlIwSTJKTnpMUWZGR1BUN1FDUDdOWndw?=
 =?utf-8?B?dUFvTkZwUk4rUGdTQmd2ZnJMNTRmR0hGU2hoZEd2TWN3TDhYUXFQN1lXR0Jq?=
 =?utf-8?B?clR2L1ZjeUVuVFlTVFp6c0dBNzZTbk1zOFhHeTFINlFWZHFSRDlGQjZ2MzBS?=
 =?utf-8?B?YjFRSmh6K2M3ZFY1YU9mU1dQSGlEMVdKZUdGK2NCeHZVWWtBZXo1K0pqYmx1?=
 =?utf-8?B?S0lKRm5IY0pteDVodENBRE1wOTBUbmtnRjJxOEZMWmtmeG9EaXIvOWxuc3FG?=
 =?utf-8?B?ZjJWYkRqeUhISHQvL2VHYTI0NTlRbHd6dnFTNTNycGg2Uzh5UEtuUVFXZTlB?=
 =?utf-8?B?UUhoUzcyaS83QXF3VlEzeUorYXlLT3lhalBzZ3ZJc0VNektZU1dNR3hGRHpp?=
 =?utf-8?B?R2pUbkZWYkdrU1g1WkQ4ZHhzeElJN0Z3WERPWHpmd3RiVlYyQ1EyaTlqK0VQ?=
 =?utf-8?B?K1FCZWRRUEFFS3NnWUZ2WTRWQURpMHdqRXpOQklPRWoyRmVYK0hLWWJuNHJk?=
 =?utf-8?B?SEtUWVpVemdaMGNpMi9yN3F2Sm4ya0RYb2ltRzNSazZGdnF3Lys4QTJvcUEz?=
 =?utf-8?B?Nm9tMVZvK2laUXQrc3o0cW14QzBkQ1NIL2pLNkJ3YkQrMy9lc0V6ZUxDQTZN?=
 =?utf-8?B?NWplb3gzRzZkbDBmTXVZSFgzL1gvM1lrUGFuT2NlVkRza08zdStxemwzN3NI?=
 =?utf-8?B?d01SNUd4ZUNDWHRiZFQzaExxQklSQk04VG94SVJPc2ZwbVcvUUIrNHVoTHBM?=
 =?utf-8?B?UFY3TklNcDFpQ3dKYzh1V2NBOUFURzhuUVlnaVNGNjM4TVZJVG8xcWNEM01O?=
 =?utf-8?B?TnZScytlVTB2cVV5Z2piYnBSMm91L2VJSDl0RVVYWklzSEdIeGhWZmhFMVlG?=
 =?utf-8?B?azNSN2VKSGVzbmhHRnZJRC9jREhVM2ZaRTRYWDN1UmZXUHNiTHY4UXpGYUVm?=
 =?utf-8?B?YTNYWWxNbWRtWE13bGZNcFE3cWZoSUg1R2p1bEJtYkhwVUlTQnkvcHRzQjRV?=
 =?utf-8?B?R044d1BlVnlhbENjK2hScjNwb1p4Y3dSVi9KazBaY3htOUdsUU1LdDRLTmxN?=
 =?utf-8?B?NEdNT3hOZVZUU3VmcENhSFhKb0hSb0RHNktwd2JjQlJGNzZmRjNSaGM4SnJs?=
 =?utf-8?B?cS91dmN2ZUVJVm5YY0FVM2RuMUZSbmtlSW5KOFpFOTk3emFzcFBvVlhKL0N3?=
 =?utf-8?B?YWN0K09mRkh2d0xML2sxc21sVmhmaTBtOTlEcmFlMnIwVjhjMTU4TkNrV1Fs?=
 =?utf-8?B?MS9QRWRrSURtS1ZDVkl3Qm5WREo4ZDF5ODV4azZiSDVBK0FDeWVjS1VCcm8x?=
 =?utf-8?B?Vno5N2c0cFVSVmlmVTBWZGpVa1JpeldkcVBRVnpGWXJNeHdRNExudzBLNklx?=
 =?utf-8?B?dVp2RkZXNzVUMGVEdmlWL0RWTzlaZzE0OXpwV0J1NmkwWTNJUmptUXZNbWU2?=
 =?utf-8?B?dTN0eWpRdlIvdUxOQzBiYnlPT1YvTXY3aGZXMWN3alZFb2xqVEJXVm41TkpZ?=
 =?utf-8?B?Y1FWYW41MmVOWnhBdks0aVlyblhxSTlaUkRlSjlHYWdTUVJOb29BeW5jNVdp?=
 =?utf-8?B?eW5jNHF6M1NGRFJ5anR5L3pGUEp5SUxoWFlSNkx4YlJxREl2aFRBdTdRT2R1?=
 =?utf-8?B?R01wYW9ZdExidVNUNjVrK1NSVzJXM1YxR0J0SVJ0S1k3VFRzcHFDTVBTTFlr?=
 =?utf-8?B?eW9aMEkzTjg2TGNKQUM0TUttRzNUdVpTSmxWb1Mvd3RWcGM4ZmVxdzF2OWpE?=
 =?utf-8?B?a0puOGYyWVlLU0VyeUU1WnU1K3Z3UnI0czd6QmoxWHdETVVKc1FJcHZRZEZN?=
 =?utf-8?B?eDdYZ3BsWUdSZ1NhSHBtVGJobXltMW1SYWhhM1F1NHlMSW1Wck5vQkZFdXhz?=
 =?utf-8?B?S012L1I1NUhsVXV2Y0gyRE9lZ3NiTG1BbGNXUjZ4V1R2Z0xqRTd1RlhrYTNF?=
 =?utf-8?B?MFYyVFQ5a0JPSEdIVVZ2MlVkSmdPb2RyK3N2UksrNUFKMTJXTUZ0WmlTSWhv?=
 =?utf-8?B?SEE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 698a2cc2-e267-4639-11a9-08dc4dafb631
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 16:13:45.0646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfmBbdsF9OaZLOfF2KOLb9E/t2fIicEtVFcdVMBmVUuU5hRCHHKe1XgdR+zYbilFIVvgRq9qjKFmn6Mj/peR6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2658
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: gPdo1RVGTEJw6DgmQ6JIIZe-18XIqc2U
X-Proofpoint-ORIG-GUID: gPdo1RVGTEJw6DgmQ6JIIZe-18XIqc2U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_091444_476499_EB65D8D4 
X-CRM114-Status: GOOD (  12.18  )
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
Content-Type: multipart/mixed; boundary="===============5543465484532002238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5543465484532002238==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CEU8ImhIHdcp4FjUfWG07EhG"

--------------CEU8ImhIHdcp4FjUfWG07EhG
Content-Type: multipart/mixed; boundary="------------JYTNXau0II6QTF70qbZMr0q0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Carlos de Paula <me@carlosedp.com>, linux-kbuild@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-ID: <286a8f76-f670-4458-bae9-f2d383629058@imgtec.com>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
 <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>
In-Reply-To: <CAK7LNASeOf2ythmXoFS7-fdE40R1BX=JT=v4SmHxq61Hww1Vqw@mail.gmail.com>

--------------JYTNXau0II6QTF70qbZMr0q0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26/03/2024 15:41, Masahiro Yamada wrote:
> On Thu, Mar 21, 2024 at 8:59=E2=80=AFPM Matt Coster <Matt.Coster@imgtec=
=2Ecom> wrote:
>>
>> From: Karolis Mituzas <karolis.mituzas@imgtec.com>
>>
>> This matches the behavior for arm64 [1] and prevents clobbering of
>> vmlinux-${KERNELRELEASE}.
>=20
> What problem are you trying to solve?
>=20
> Why is clobbering vmlinux-${KERNELRELEASE} a problem?
>=20

This patch makes riscv tar*-pkg builds consistent with other
architectures. Clobbering vmlinux-${KERNELRELEASE} means there's no ELF
binary produced by tar*-pkg builds; sometimes you just need an ELF
binary, e.g. to run faddr2line.

Cheers,
Matt

--------------JYTNXau0II6QTF70qbZMr0q0--

--------------CEU8ImhIHdcp4FjUfWG07EhG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZgL0OAUDAAAAAAAKCRB5vBnz2d5qsDtm
AP94kvA4vni+Eai4EY9+7XmZaDKp/ZZGHv7aFyoctV0qMQEAjYKsIJW41snS0+5WLWcJagRfFPuf
//zgAaH5linBVA4=
=/A5r
-----END PGP SIGNATURE-----

--------------CEU8ImhIHdcp4FjUfWG07EhG--


--===============5543465484532002238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5543465484532002238==--

