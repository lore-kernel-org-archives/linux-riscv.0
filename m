Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63186C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pw7UUey8w/xsrzjVH3MtWjz0dvxgjbL7vrpGIYiN6RU=; b=nyGiWa7mdNodRx
	5up1umxWNkd85W7Vx9TxJ4IiVut5u4YQPh2u+335RqN0OtegHsojYCa4iE/Gf/FGPcURqmGWvnmsv
	NsoQifLRZbdfHys0VNDcOrt6TlS0osP2aH4uE++oKZScCKnLYrTDeMUHpPEDf0OD/FTR0kj1IDVsr
	J7mPG+3Qz38TVkrz9crZeK6zWDjB+Gw0Z+0BDQOz8gMx5qTZ/mZPBD7pzGQfCLQLrpjo2FI0GgF1e
	qhsNiFh6ElfqoggqYFRBtVu+Em6dJq9ykcl5ph2On4rFF6Xh5SCeV7LY6x7OiXkpmsL0nPhA7ZfNI
	RgZr5oFosNErL6efHGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGBC-0017GK-IJ; Wed, 18 May 2022 09:41:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGA0-0016ST-Fn
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652866804; x=1684402804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tLKkOEpKA7DCH/1WACOJu6ZtX7Rfj3Tg/45/U1FTTic=;
 b=Sx5JJrIGg34Ss7ZOCqwrBkIwU2/whqKSD4f4kFdVxrayyFikS8neHij2
 JoyqxRJv+30Q4WR3/1VeKD7Nz+Jar7fzEOTPs8xb/onhZeX8/RvdIrE0w
 XxlywCLAV7ywu6a9sIbbPninq9wIt3AOXA+xg4Pr2KUg1T1Bv+LeYjJ4V
 cuhmkQElE8Exaiqr390XHk2Np1rxnw63FS8CNq8+XcA3oAHJ2ygyQoPuf
 jV3OgveQsyEor40Yer2A6MZuged/LfPkJJEteHMJtKMXVl9xQwQcuEuKg
 kS+FIhUUiym08M1mYgZKaNXVPraafJEim1xcgdaDQm6HQ6fkR0gTytxDz A==;
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="164568558"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2022 02:39:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 18 May 2022 02:39:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 18 May 2022 02:39:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKMJWK6UbmZsfhta/WATQyfVvxkwX5K7pX+ibFoX6RN6CPQN9FQSUFIfHCaLUywSsbgFE0YupReoCcBPlRzaDS9jtne+/woSlXWgHC9YQ9UHhYkLSA2LDruS9CE1mDNH0DPKiLcoZcGxCgyze4okvTAjismkG6MceTrxu6Pbi2qiMAY7FukpIfrUIy3OgYm/ipPfi+TaNeZFeCKJQ13ZDYld3k3FPd0jVJRUYEFb24pqPmTkVsDWtUNR23P5n0Xu+ECLI0MLXHXFko8Gd1/9ehuE+5qOsQ2jYWsf/hrs5qOu28X/BttScd/oiAoyRdP3/ADuApsRTyl7che2wEk5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLKkOEpKA7DCH/1WACOJu6ZtX7Rfj3Tg/45/U1FTTic=;
 b=L72FZ8V9pLxWWTj+P5rAk047U31vTgE87Kc+JcCHesxCgNgQHv91/lsm6ee+jLwEfFWS64yDEYqz+ot0xiHNdRHdeU4ztVqCpsoVVrqROPyU7M5phF+wxEeyt2rV1Nw7sBrCqEsHP95+WitsiRbnN03gaHHGzh36aHCrt9amn+NsgzkYr5mzz2PVt+ER/qaODdUi8NmqImd0iybXybKtzqCRagwVTdSRfyGIEQp0ygIrZDLfSZg8g3dMRilILAWiNGQ63PcvklnCFJ1EBno0ZxKcJBOFW2JLP+kM3rqYLqDMPTkN6vi4t5nEtvtRQC1MHik2niQh6rimg8i1DllBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLKkOEpKA7DCH/1WACOJu6ZtX7Rfj3Tg/45/U1FTTic=;
 b=rCgNNQRKPzTpdRm8kDKtFYRfaVSVeb5JCmd+SIAEqMgCwJMx8RTQxpbE5jtbJnAWgZwob5VEqJKgNLYUA6SyTLhj/TBkDMtGRizirlfR/DnKD6+CR/rD7xH7rhdyWq9B8WQNd2YYaHQJwcCD7EtW2MsKvd17VJHUL++UTvnHiZY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1593.namprd11.prod.outlook.com (2603:10b6:4:6::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Wed, 18 May 2022 09:39:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:39:53 +0000
From: <Conor.Dooley@microchip.com>
To: <i@zenithal.me>, <palmer@rivosinc.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, <heiko@sntech.de>
CC: <atishp@rivosinc.com>, <anup@brainfault.org>, <ebiederm@xmission.com>,
 <keescook@chromium.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-api@vger.kernel.org>, <mtk.manpages@gmail.com>,
 <linux-man@vger.kernel.org>, <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH -next v2 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar
 Crypto
Thread-Topic: [PATCH -next v2 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar
 Crypto
Thread-Index: AQHYaplfm3lmpHbpY0WLoNY3ZgIZ8a0kYNWA
Date: Wed, 18 May 2022 09:39:53 +0000
Message-ID: <fba8ab6e-17bf-1fe1-ad5f-339276907298@microchip.com>
References: <YoS6qRhxGuwHmK7q@Sun> <YoS7lgTmcRT0q9y+@Sun>
In-Reply-To: <YoS7lgTmcRT0q9y+@Sun>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4254991-d8de-43db-3d2f-08da38b25c5f
x-ms-traffictypediagnostic: DM5PR11MB1593:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1593EEC9B66E437ECF07FEC498D19@DM5PR11MB1593.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cEgUMfng3GeczvnWQXH29Tka1JQc7jqrHS889s6JBZCfG2lwhz1pOG6Gd+p8ol9wZifWw86atW+mr1vCPbkJGmAL8UBV0/q0rPbJrRZkge3IgBpYIx5O3VAHJ0Vy2Hup8yIhe4RhVHEqzGGxw7hGxLuj3nEIzo76XnxWOyTjcsLv63kKGkURw827qy1U92qn7xw45vNREyuyrQ12tsd+GIhyAh+9G5ZCqhx5jS5li7kPujQms0jWtmxlNnmkfaNANC/yo27DBvBwA5tgBSlgZrMqdio9PVZ+CIYE1aPq7gg0MicHGkW2Df9GMiyjBlxmgrMpZgKKguwZ8Wj9HSd3LO/l0mpxQPchth3Wf1WMEJFO178JwxdZbTZASlgf11kLLoFzH9qzf16/rYSntYS/0sEnQjCnhW217vjq3qEjpIYJT4UimkHDRwAwxVxXS091ndSN/aETKI3Fzv3Ipm61ynhn0Xonra1gFQa9MXQMGcgZTZ3p9LfpOGld/GNzT8fOg7juV45QJYjvgLqZnoHrHn84VJd8fzXXfgmxwQNYyYE8aqfAhBkVM/MNItxeFm9GN0HFuFCCL9+igKgGkT6lg3NR2Q+EusH8C/tcK0XFEbXQhdYnRCTVJLYuCazk2Uh+wXd5n2kvW2lrRfNcz21VZBAtQUu9VFoioxVpUNgZfZZIBrcPvCsuma6zapnqdXCGonu1A4fMLfBnmpXj/AAHarFo6b3lz9lj4ZDZuQ6clweRSvqRDw5B1VRNKCFIwhHzZKuwTX9I5an0Qrow6xElBAD2mA5cB/yfFV6aYd3jDRjO6EGG7ninAo2dwl2SWCum6nLBkiVIMcP2LmoKYoz39keAoRTRJxz8uFBcWiRrz/pt2pdZayNja6DTx1EULkbJ+thUQAoulTuw22g3WdwqY4mFfDF1Fd4dAxRvgniVOZ0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(31696002)(38100700002)(66946007)(508600001)(5660300002)(86362001)(91956017)(7416002)(54906003)(66446008)(110136005)(8936002)(38070700005)(122000001)(64756008)(186003)(6512007)(26005)(2906002)(2616005)(66476007)(66556008)(4326008)(966005)(8676002)(6486002)(316002)(36756003)(71200400001)(53546011)(6506007)(83380400001)(31686004)(781001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEpCMUZoUmozMndNaUJIdG8zRnFGQjU1NGl0bExJVG9GRkduOEQ3a2lyWUxz?=
 =?utf-8?B?SnVYeWxPckUrQXNEc2VJNTJ3Q3VsRldKKzdPT2xiVHVYMmtQOXZ3d2VsSFpX?=
 =?utf-8?B?bmlSRXNGcVFTdUFhWVU2YTZLMENIenc4N0V1ZzZWMW1LemY3VDFpMVlyNU5V?=
 =?utf-8?B?NGFBRzYyTVg3K2VQai9kZWYxQXZ2M3YzRmE4MDErQU9pdWNnWldOLzlUVUtw?=
 =?utf-8?B?M05CdGZycFFqdlA5bzRPdzB5RUI1UU9MNHM2SGtKMTdRdkJqM1g4R0VEL3Rk?=
 =?utf-8?B?NVZnRVRYck5JQWVjYW9EcG14Y0dGTEhNSEp0cDJsRUZFU0Z6Y1lTUnljK2xl?=
 =?utf-8?B?cUVXdWMyVEtoMGZQL1NaclZuaDc4V0ovL0NoYWR6RlZyc3ZoaFBaYnJ3Sitx?=
 =?utf-8?B?d0tsVXkrY1E5cWpCNU5RMGszb3pnZXpJTCtydDdlUDlkdnZ5M0djcE5ucXlU?=
 =?utf-8?B?VFo0YjR6TzVDWmJVYm5GNFV3bHRqdlpiSnAxNDJ0amlmVnNqM2dWSUdlM0dZ?=
 =?utf-8?B?NHNrRFZqUW0wVDhUNTQ4dWVTSUJJT1JNZ3p6MzNQK3Vwc3Nnc0lMYWhOTWNO?=
 =?utf-8?B?VlVldDJuOHBDTDZJVEtFUU9jTTVOdHVzZ0JteGZTQSsxL1lxQm5paC9FUTdo?=
 =?utf-8?B?cWl4U3AyZVUvQVhvODNVUm5SaCtxVnZPWWRTWCsvMzIzdVg3T29ncVU3dklr?=
 =?utf-8?B?YzMxREJ4Z3ZRK0lkalNqT1FNL1p6amVtZ0taeVpUWXJYUTZJTFJMSWpUQlZn?=
 =?utf-8?B?ZGZLalIzMlRjYThYTnd3cGp3b1VkTklzUkZlVWFVVHhISkFIWTU1cFhmVGNE?=
 =?utf-8?B?Mis0T2NHYXo0bk9hVTV4UzJZSGQzTTdlNXNwSFFEdVgrbk1MNDg2K0pQWDFT?=
 =?utf-8?B?OU1pZ1Q4SUZqWURQQzVqWXp6UnluZzlwcmltb3VzRUxmenFmd3ptSHBDSEdn?=
 =?utf-8?B?ak44VjA3U3piNmtYclh5Sm0razRjeXk5ZCtOc1JOTXJBdTl2VE14ajVwakJr?=
 =?utf-8?B?ejlkRy9yUHZFUm5TdHJBQ1V3aTJSSXZxS1liTzg5d3RPRDlaSU5HWTBQcy9N?=
 =?utf-8?B?bksza1ZPMFdBTWhuVGhCRmtuMWpTMUlKTHRwR1dWWWlaKy9IOUpsd1dxUmtN?=
 =?utf-8?B?ZVVEMVVFSmMvYjlJQjMwdStES0E0MU1WeXVZTXViczQ3N2ZuUTI4U0ZEckFv?=
 =?utf-8?B?MU9Hc2NVUm90R2pHTEdrazZxRC9mSnRTRCtvYTcyMm14MEtTZ0QxS3pHR05O?=
 =?utf-8?B?R1ZGTWhRWGJTTVVNTTFDb0JPODZGb210TEJRdVo5MDhNZkJVc0Z1N255dHVD?=
 =?utf-8?B?MlhRMWVBaG9GM2s1aUd1TkVWN0ptTWROeXMxeUVWVDdndFNsNGdrQUJ6RlpX?=
 =?utf-8?B?VEwwd1c3OTIzQy9sT3Vxc0RsTEttMUdsRUNrb1UyL1JMNEZ4bDFYVWFmS3lE?=
 =?utf-8?B?eUlPb2hhR25CMnBWZnZZNGx4eGdZV2JuZ0Nvd2l1cVlTVFQrY1hvaGZKNWlS?=
 =?utf-8?B?MzU2UmJhMEV3MWYrOFRwZlhhamJJbmIrUTd1VUt2R2RuQlJLM3RsMFcvOC8x?=
 =?utf-8?B?SDRIcXFYQ0RWWXJ2UFNNM3N5azBNSXNmdURzSXIzQmJHRERrME5OSkUyT21n?=
 =?utf-8?B?bitOR1V2V2ZUTHUzdkVmcmNwV2c4K3FDMmN0MDhxVFhvd2NSRDBzeXBVUFJB?=
 =?utf-8?B?S3RBZDNScHpFdmZzM084L0pFTGJ5WWYyY21TQ3ZsMmdwRDlmclNHSjI0RGd1?=
 =?utf-8?B?VWJyTERQNHFNNndhKzhDTWc1MmIxWlZNc3NWWmVEd28rZkZuQTN1bkNFL2pB?=
 =?utf-8?B?bzRlWnFZc0JpcDc5SHV0ZDYxS0NBNmM5cDU3MmV6ZXZKYlVnaDZNdmNJOVBp?=
 =?utf-8?B?Vkozb2s4b2I5a2JOdmUrWjAzbjFtNjd2TEFlSEtMcGxRQ3YrelZXSnY4RXVL?=
 =?utf-8?B?Y3UxWkNuekc1c1NaYjZ5YWZaaWZ3RXBhdGh4cFNYbEJMZEZZL1QrSDh4Z21n?=
 =?utf-8?B?ZUNRN0QyYkR5TjBBdDhOdDdUVE1ta2VkTHV2SkZMbEVtSjkzTjRlcjB6cmtj?=
 =?utf-8?B?Q3NOYnFVdnkyaVAzMHBLOHZiUnJxRUk3bk5YbG1LSG1aU09SUVRybDFRYm1s?=
 =?utf-8?B?SFB4QTY4QmQ4TE1RMDRLTUNOMHlxMGxRRitoeVNzZzQxUCtob1pRL1ljaDRB?=
 =?utf-8?B?N1R1QitxTUR5Wi9MblJoTk9aTFo5M2ltOHZuc1FPQzAvaDJGQWQxN21EVnl3?=
 =?utf-8?B?bmRUTFgxTjFvejdmeFNDU09vU2xUZ0RGbjhVQVVnSmNobTJqUHdQQWhMQzln?=
 =?utf-8?B?cGRJR1JVWjhzQXBkMlNjTG9jam81dG9rdGU5UU9qakhqd2ora3ovRjZGeHZB?=
 =?utf-8?Q?FXvgcvzs88XMRs4U=3D?=
Content-ID: <B81FC87D44EF744F9E46CE1D80C796FE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4254991-d8de-43db-3d2f-08da38b25c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 09:39:53.0957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: niEwlq+a7vJrNFLKA+w9JX+QBjhDfwe3Bka9CK7h9yP2N1wpetYvSOD+oqEIStrEUgHGyN89xJPdBoxs/KvsHEq/ZntcT0O1J4mKuYYTFQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_024004_566050_0926A9A4 
X-CRM114-Status: GOOD (  27.07  )
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

On 18/05/2022 10:25, Hongren (Zenithal) Zheng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> userspace currently lacks a way to detect whether the
> platform has Bitmanip/Scalar Crypto capability,
> this commit provides a way such that the userspace
> can detect it.
> 
> RISC-V currently still has no mature mechanism,
> but no matter how things in the spec changes,
> (no matter how "M" mode things change), the kernel
> still needs to offer some API to the userspace.
> 
> More discussion can be found at
> https://github.com/openssl/openssl/pull/18197
> Userspace currently has to use env var to detect them.
> 
> This commit along does not assume any specific mechanism
> below kernel.

s/along/alone?

But I think you could rewrite this sentence to make it
clearer, I had to read it more than once to see if that was
actually a typo or not.
Possibly swap "This commit" for "This interface" or similar,
both here and in the first paragraph.
Maybe something like:

"This interface does not make any assumptions about the
underlying hardware"

Thanks,
Conor.

> 
> Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>   arch/riscv/include/uapi/asm/hwcap.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
> index 46dc3f5ee99f..bfed3e5c338c 100644
> --- a/arch/riscv/include/uapi/asm/hwcap.h
> +++ b/arch/riscv/include/uapi/asm/hwcap.h
> @@ -22,4 +22,26 @@
>   #define COMPAT_HWCAP_ISA_D     (1 << ('D' - 'A'))
>   #define COMPAT_HWCAP_ISA_C     (1 << ('C' - 'A'))
> 
> +/*
> + * HWCAP2 flags - for elf_hwcap2 (in kernel) and AT_HWCAP2
> + *
> + * As only 32 bits of elf_hwcap (in kernel) could be used
> + * and RISC-V has reserved 26 bits of it, other caps like
> + * bitmanip and crypto can not be placed in AT_HWCAP
> + */
> +#define COMPAT_HWCAP2_ISA_ZBA   (1 <<  0)
> +#define COMPAT_HWCAP2_ISA_ZBB   (1 <<  1)
> +#define COMPAT_HWCAP2_ISA_ZBC   (1 <<  2)
> +#define COMPAT_HWCAP2_ISA_ZBS   (1 <<  3)
> +#define COMPAT_HWCAP2_ISA_ZBKB  (1 <<  4)
> +#define COMPAT_HWCAP2_ISA_ZBKC  (1 <<  5)
> +#define COMPAT_HWCAP2_ISA_ZBKX  (1 <<  6)
> +#define COMPAT_HWCAP2_ISA_ZKND  (1 <<  7)
> +#define COMPAT_HWCAP2_ISA_ZKNE  (1 <<  8)
> +#define COMPAT_HWCAP2_ISA_ZKNH  (1 <<  9)
> +#define COMPAT_HWCAP2_ISA_ZKSED (1 << 10)
> +#define COMPAT_HWCAP2_ISA_ZKSH  (1 << 11)
> +#define COMPAT_HWCAP2_ISA_ZKR   (1 << 12)
> +#define COMPAT_HWCAP2_ISA_ZKT   (1 << 13)
> +
>   #endif /* _UAPI_ASM_RISCV_HWCAP_H */
> --
> 2.35.1
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
