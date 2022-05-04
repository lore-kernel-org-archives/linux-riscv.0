Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FD6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ms7GOClWToIZXy+T8Wqadya84AD3koukFrlvk7uSem0=; b=QcNMXnq87/x7fd
	fwXSYiZHESurGUftvqcrYy9dSgKjjQ8cGkvw+cBsKqByDqd0cL1o3eobovgduI8PAxwLR01iOmmNM
	a2vRBk/if2R6hWbpoK4OmN6lKJmtFCPZO+xe2ETAdoCBOTrXM4pJkKdUQfxG4Qb87OYlWpNwiRTHM
	70X29IuKGta4TOXzDTQuRAaRkDmLCHnITyV4wn/tDMOznKV/5J5xZ1hFBGf2F89hzWgZ3wPoSAVSW
	DeF9v4lfhl3tsuGn5Z7AVQUdt73j3d7vCoKt0Dq6qheCqOBYGyKy1qMtahfzFrBJu6QuYysXpQrrD
	7sb7mUdAMlRb5HVK/NmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEWp-00AsBd-Jg; Wed, 04 May 2022 12:54:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEWl-00AsAG-4D
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 12:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651668887; x=1683204887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/pFusvp5EXlIdjskrEJqO804DdEcrp0yoCr0c0aBW4M=;
 b=YrKk9JT7fTeo1g9m4fvz5eDXU5nw0lEDi+/EvyuH8mF7bPthQknzBuAe
 x1fC47ErcH/wfF6O+E1Gm1v3P/o0gDMlVNlErxSUiWIBnFJCu/lX8Z9r6
 Atg4VRrJ7hEyq/B7lgAVjaELz//tS0LkiaUK1yPfSKV8/SRABjRdNh8Kc
 Wwwy7mYSzsGI5Jm4yJpmKW++F9E5UdduXl2cw5OV/apQicR+zJMwURDCS
 XoaKHvw2awjdd3I8XsaQLQHP5UcULk8Q/W5YmWbv5Td2m6klKiQCSY+7p
 +P/p4tBV+MpeYKK7GBQtNBXYJyvoOvBL670UaA4xSix6b5rljvxAQC+Nk g==;
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="162695802"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 May 2022 05:54:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 4 May 2022 05:54:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 4 May 2022 05:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIXEoAcPAZxtj8zuKEG4C+RJdmqR+lYy1d9COf/V3yWIll3C/SdWRcex0ysKdV6llvXr1iBU2AEtnIzC8WOX6R94j5QJunQb6JwkyhkmgZ2sNXFvxXNezLzi9GkdtH0hN9AkX1kmlTz0FH3WGoQiH9N/7W3bbHS3ZqbDx2ECOOHqTJPwqhPzs1bpgJzWRJemgOa6pXVv4iKEnwPSNGh/C1qLlVIRl3CRtYraB5AzS8cS9g5c4RtStVdyIgQ3Cx6QS5IqBuWbQ8mf0vXK+Q5Q2nKt+c7ZDxJicOQhx2nywzwEr3F7SFq+D7dbt5c+jHCb/VM5fG3+sbkRdvsCY9Gn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pFusvp5EXlIdjskrEJqO804DdEcrp0yoCr0c0aBW4M=;
 b=fA/QVfFObCp+5pjp9oC2lbGsiw7kAHQglMhr0z/1dmBvUZtRh/S4RBK3sohqTVFubiI7oqji4fiOs8j1u5zVTmXwrfIDRpRPUWiauG8R3ObQHAM+bxiKgxYt3fwhK7fC3t9Ph8w0MVL0HlGfDX13nxWMDPxC5ChvHRer1kOd7ovkIlR9WtC1UGb3sfxaR7UxYYEJquouFAEJNMLsmXYBRSeOjO+SSAQHGdqvQAG5/1yUFiavTKBVWbUPRO/8nPN8CTBz5SfZRzllACjdpp2EJZ4x1SRoPMi2VxPFhxu1vNtGJjomyMhRKGtBToOnwQ+E2IYwDJAdgPUfFp7S6RCZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pFusvp5EXlIdjskrEJqO804DdEcrp0yoCr0c0aBW4M=;
 b=WNQfvpk+3dah8Smd3Sgw+667BfsSyXWJn31YmhSBCIbYkU82P7hpe7daovfY/xTUVBRhBmEgy+f8yLVK5znYLnV92FyQalxp/Ipc38fl7SXnIV/7X0j/PUBDpbRObgdeTEyLlXL7BBSQCjFr7GSgcmqrUHK2GlHI0sAqXGDzYUo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM6PR11MB2667.namprd11.prod.outlook.com (2603:10b6:5:c1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 12:54:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:54:36 +0000
From: <Conor.Dooley@microchip.com>
To: <hdanton@sina.com>
CC: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Thread-Topic: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Thread-Index: AQHYPSMB0fElgzWzO0GEtW3rBppjp60OtPgAgAA84QA=
Date: Wed, 4 May 2022 12:54:36 +0000
Message-ID: <c4ccffe9-9892-2e32-45fc-7028f9b92a7b@microchip.com>
References: <20220504091622.5024-1-hdanton@sina.com>
In-Reply-To: <20220504091622.5024-1-hdanton@sina.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcbcf0a4-c7a7-4f52-cd23-08da2dcd3e2b
x-ms-traffictypediagnostic: DM6PR11MB2667:EE_
x-microsoft-antispam-prvs: <DM6PR11MB26672215F18C12A90A646D1798C39@DM6PR11MB2667.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O3obu3P++PrW9GBhlrBQ7sjYGuheIHaRG1sUDG1HEY0U6qRM2tNbIpV3PBquI7TOp2ZQ29IB1ck/44EO+kCki0aJeOrmldOMvL5fJMtTm1AehAGHDEYvN1+IjqBkIcEpb9mNg+0DrQz0qJBvU0fNF6h9rwILq4rVABJRVU5blOWUjE17D+JXvgURU81iZewDs8a5wr1LQHOjoK8hfdLcacuaShxIdbW7Lck0ulnAQKFnEY01E+YCH/VoXzxIc2hrh86jeL3S40F7U6NEbQJfSv91Alty4i3ueqLRMI1QtDWLH3k40NLgQW7F5XvBlWE219Nh3CoRh1hRn0QLPumD0HREJ2Jt+qQtZkCP7GEJ1an0NYyM33LTD3DK5sH7t7431B1RMPDYQUNIpncggniflI2sQMXyPNbeWyeEzoGst4PZleF5GH1gPw4/LTbbp+LKgKQQbmikeysQkPfzk62SELUoAGH2hIkCg0vS54aNusoGvA6k6n/fCARLhPvcSBIurMSCqup6+IoBM+nwyYAJUiiv5vFMc/VPphiQ2c1z3Am5Gbmg8y+BNA3ZSgiINv/vzniYt85tuoiU1eo2uUlMngrGia2a7FtHbcwqIw5R+ILPo0TA7so5E3kZRZ9VUldbhVJ1+QYu8SlQPWrD8q8ezG9Zra+m59VWASFCBEmAT+gdRldTUNdoaFKUuOBvQ4I64cE6Re+pUQyN7XeXGWG6lMyIZziXoq7ExZyk3+W7t5WtOB7UUkZegLGEPTVttH8kxHM4R9J4LOwi2mTX4pBo5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6506007)(38100700002)(38070700005)(6512007)(86362001)(31696002)(26005)(122000001)(186003)(107886003)(2616005)(66476007)(66446008)(31686004)(316002)(5660300002)(64756008)(66556008)(66946007)(8676002)(91956017)(4326008)(76116006)(36756003)(2906002)(6916009)(8936002)(54906003)(71200400001)(508600001)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXBuOXMwYTFNZE51WGZwTEUrUjduTXVOSWNxT3pZcXQzNVpINUlweWdsZWRG?=
 =?utf-8?B?UU1TU3NHZElNeEs4OWlXdC9aS0pNcVFGdW1rZHVmajVROXd4TFRiMWFvcjJ6?=
 =?utf-8?B?QUZCYk1kR2VGMDdmeDdwd1ZEanh4U1I3V1V6THZleVdQalZhZVNETHVuQy9u?=
 =?utf-8?B?T2pPcDVDVXBzUytzZ2RqaU84Z3BGZzlmZ1RRNFExUldNTmJGOVdoekQzd1R4?=
 =?utf-8?B?b0Roc1FLamhjNVliMEMyR1kyaDNHZnpxMlV5bXhTd1Y0MFd5MkdCUTMrNFJz?=
 =?utf-8?B?WkxGaUowTEJ2RE95UlU5Y1FOWDEvOEMrTGhSdWc1WS9OaUR0RGNoQVBTZ0RB?=
 =?utf-8?B?bnRjbmozUXpKZlhSWVNEU2NWaVdYT09nL1RldjF0YXF0ODFEdHRMdk9xd1hX?=
 =?utf-8?B?MW1VU0xObTM4YnFzZzNReVpST0EyamU1TTh4YWNmRkRzcjlKL0E0VUNKV0Nl?=
 =?utf-8?B?bDl1ai9NRzhNTkVCaFI4UmlIS2FweHlZTWdSQ1EyZmJxcDJQK0E0R2JnckVO?=
 =?utf-8?B?eU8vaGpsS1RzeWxMR0pnRzR6Vm40clduVk1DTmMzQ1JpTUVOb1dhRUp2c2dJ?=
 =?utf-8?B?dk1ldkpZK3pNcE1ibVZueXgzVjVZOHNaaGJweXlWZWhhY0lGUHQ4YjdqSHNi?=
 =?utf-8?B?NHJuTjR0Y1Z1M0RlMWRkRHZqbUhpSHkzZzkxY2tNRkFRUDQyWUZXT0hlKzBG?=
 =?utf-8?B?TjljNFRzTHJESnNIdm0zUnVyZU5zbUxnQ1creXhmWFkxczBKUEtrTTlYaE16?=
 =?utf-8?B?Unlmc0dOSldqcVk5QkJjMUVHR2dROTBJVVp3Q1JrbEcvbzg4a1BIUnNwTUVa?=
 =?utf-8?B?WWVKNjl5aVNZVnhCRGI3YzYxNHFLRkZUSFFqVXZ0NHRJdzBrSGJqMHdVL0NM?=
 =?utf-8?B?VTNDZit0RTFCeTFtemJFSW55VHRCeWRkN0xWR0J4RXlQMHBlOG95UGR2MmMx?=
 =?utf-8?B?L1poYVhlUWkyREhXcVF1TGxJNzAxUGRSbEp4VzZsdjk3dHlMY3Y0ZkZDSG9D?=
 =?utf-8?B?RlExT2JuQkhYSmg2cWRvbUdrRER0U0hPdXZ4cEJzZWRpZ1NGMjFQQVhRQTFj?=
 =?utf-8?B?NnRVZDZJK0thSXRwSE9lcDdlT2lIZmM1alZlZTJ1R1ZtMHRLc3lCcWs5a1Zk?=
 =?utf-8?B?S1BwNGh4bklEcHJ5MURBOHBiRGpCNEYyYzJYUlhYY1VDbmE5OUR1cktTTU43?=
 =?utf-8?B?N2dYMlRhbkpWc3JVNGgzWEZ1aUlpV0oxNURqUGJuU2RZSFU3MWNESGlMM3Ux?=
 =?utf-8?B?N2w2ZXI1QW45UnRXbWxuWHFQTlh2d2tNeUFBeGNXejFsV1ZsMVFvWEppUFFV?=
 =?utf-8?B?SkFrS20vTGdBUVg3ZGt4TW1vN2VWaThUeGFhN2h0QnRBSVJGYk9XZ3hhQjhj?=
 =?utf-8?B?RE42TmdJOXRtbEE4QjhQWG1qbVVyQU52NWtGdUNJWThyMnZET3RPaXo0WFNa?=
 =?utf-8?B?M0xwOFJKcS9QSlFzRW9PZzkzRXBpRDlsaUdQclplMGl4ajZvOW9Kd2hqVmo3?=
 =?utf-8?B?UGl1VmlMUVJ0RFZUc1FsSHo4MlBsTWhnaXVVbnhKZWJ3SVpRZWRiZGd1TUJC?=
 =?utf-8?B?ZlFuMEdmRjFySEdnSk9GRGlIQUtVQ3VKTGIwS1lWNE5GcFc4SDBOcVZ4Ykgy?=
 =?utf-8?B?RGF2YlJTVmhkdkFPNjAwRjBXU0tqSktSUjFiK3RKR1p5dEp2Qno3WU5NckR6?=
 =?utf-8?B?bWVwaVFNbGRMbXRsWmI3bmNNWTkycDVrblBHUUxiMDdNNWRaQS8ySWpUSzNI?=
 =?utf-8?B?LzUwKy9WVG44NzViZXpodnBVZHBZV2VKNjkxUCtWZldBT3NPM1pnMFBocEJm?=
 =?utf-8?B?RVBMNkE4QW1DOVpxazFscjN2aHI2VjRBYk9ZOXQxbmo5Z2E5ckYyVittcU8x?=
 =?utf-8?B?U1h0bUpseVlxUWJtRkVvVHltd2gwY2RxN09PNXVLMnUzU1MrcXNFMEkxZUtI?=
 =?utf-8?B?Ujc0MFRoemRvZWpnbzFPZzMxZDl4VVdRalJrSHFkeHgyeFo3ZVF4Rmw4Z1Jo?=
 =?utf-8?B?L2RiSDhETWd5MjdmYm9lU0Q2blNsUHRzbkc3OHhiTUY4endIU0hOZTFmeG82?=
 =?utf-8?B?OWZoWFZTZmVtalFMZ2VhSGNjclhqNTZzc21tTllobDZ5a1lPRFptd0llYXlC?=
 =?utf-8?B?WGJ1VUlweVhseVF4RVRFdG0va242bUsyenZBYWZtbUVGdFRNUFVYUG5halln?=
 =?utf-8?B?T0tvVHg0Z0NXV1JIeXhnRGtnRytlTExuRUhqcG9KOUcyT1V2aVhpZ2wrbzBl?=
 =?utf-8?B?c3pmSys1ZlZYRFc3VnR6SFVEVlNuVWRjdHVJZGVwY3NVcU5SQlpmQ3hCWFMr?=
 =?utf-8?B?cVJRb0NsWEh5WHdZOUNCNXBYNmhoQUdHM3phSEd6RlMwbktjRitRQT09?=
Content-ID: <287BACE2B289B84591F94BC1CDC7BE63@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbcf0a4-c7a7-4f52-cd23-08da2dcd3e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 12:54:36.0793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUhoq/VT2/62XcQK/PWM4q9H8LwuwH1JYUS8lAQlU7NPTT0dkXPK4Xm8ZkLCE08ngE5AraWokyv+E4PAGe083MVNbbtuew+PvsimZBz4Mgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_055447_444480_71D20F4A 
X-CRM114-Status: GOOD (  19.39  )
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

On 04/05/2022 10:16, Hillf Danton wrote:
> [You don't often get email from hdanton@sina.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, 21 Mar 2022 12:58:56 +0000 Conor Dooley wrote:
>> +
>> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
>> +{
>> +     u32 status = idev->isr_status;
>> +     u8 ctrl;
>> +
>> +     if (!idev->buf)
>> +             return IRQ_NONE;
>> +
>> +     switch (status) {
>> +     case STATUS_M_START_SENT:
>> +     case STATUS_M_REPEATED_START_SENT:
>> +             ctrl = readb(idev->base + CORE_I2C_CTRL);
>> +             ctrl &= ~CTRL_STA;
>> +             writeb(idev->addr, idev->base + CORE_I2C_DATA);
>> +             writeb(ctrl, idev->base + CORE_I2C_CTRL);
>> +             if (idev->msg_len <= 0)
>> +                     goto finished;
>> +             break;
>> +     case STATUS_M_ARB_LOST:
>> +             idev->msg_err = -EAGAIN;
>> +             goto finished;
>> +     case STATUS_M_SLAW_ACK:
>> +     case STATUS_M_TX_DATA_ACK:
>> +             if (idev->msg_len > 0)
>> +                     mchp_corei2c_fill_tx(idev);
>> +             else
>> +                     goto last_byte;
>> +             break;
>> +     case STATUS_M_TX_DATA_NACK:
>> +     case STATUS_M_SLAR_NACK:
>> +     case STATUS_M_SLAW_NACK:
>> +             idev->msg_err = -ENXIO;
>> +             goto last_byte;
>> +     case STATUS_M_SLAR_ACK:
>> +             ctrl = readb(idev->base + CORE_I2C_CTRL);
>> +             if (idev->msg_len == 1u) {
>> +                     ctrl &= ~CTRL_AA;
>> +                     writeb(ctrl, idev->base + CORE_I2C_CTRL);
>> +             } else {
>> +                     ctrl |= CTRL_AA;
>> +                     writeb(ctrl, idev->base + CORE_I2C_CTRL);
>> +             }
>> +             if (idev->msg_len < 1u)
>> +                     goto last_byte;
>> +             break;
>> +     case STATUS_M_RX_DATA_ACKED:
>> +             mchp_corei2c_empty_rx(idev);
>> +             break;
>> +     case STATUS_M_RX_DATA_NACKED:
>> +             mchp_corei2c_empty_rx(idev);
>> +             if (idev->msg_len == 0)
>> +                     goto last_byte;
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return IRQ_HANDLED;
>> +
>> +last_byte:
>> +     /* On the last byte to be transmitted, send STOP */
>> +     mchp_corei2c_stop(idev);
>> +finished:
>> +     complete(&idev->msg_complete);
>> +     return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
>> +{
>> +     struct mchp_corei2c_dev *idev = _dev;
>> +     irqreturn_t ret = IRQ_NONE;
>> +     u8 ctrl;
>> +
>> +     ctrl = readb(idev->base + CORE_I2C_CTRL);
>> +     if (ctrl & CTRL_SI) {
>> +             idev->isr_status = readb(idev->base + CORE_I2C_STATUS);
>> +             ret = mchp_corei2c_handle_isr(idev);
>> +     }
>> +
>> +     /* Clear the si flag */
>> +     ctrl = readb(idev->base + CORE_I2C_CTRL);
>> +     ctrl &= ~CTRL_SI;
>> +     writeb(ctrl, idev->base + CORE_I2C_CTRL);
>> +
>> +     return ret;
>> +}
>> +
>> +static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
>> +                              struct i2c_msg *msg)
>> +{
>> +     u8 ctrl;
>> +     unsigned long time_left;
>> +
>> +     if (msg->len == 0)
>> +             return -EINVAL;
>> +
>> +     idev->addr = i2c_8bit_addr_from_msg(msg);
>> +     idev->msg_len = msg->len;
>> +     idev->buf = msg->buf;
>> +     idev->msg_err = 0;
>> +     idev->msg_read = (msg->flags & I2C_M_RD);
>> +
>> +     reinit_completion(&idev->msg_complete);
> 
> Would you specify why you need reinit completion? Is it likely to race
> with the complete() above in mchp_corei2c_handle_isr()?

Is it not fairly common in i2c drivers to use a reinit completion()/
wait_for_completion_timeout() in the xfer function with a complete()
in the isr?

I can certainly add a comment explaining why this is being done?

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
