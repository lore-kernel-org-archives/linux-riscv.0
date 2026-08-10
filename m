Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB02C5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyaaOu9tRiyZl2PaskeZf9UDynhd1RDA7bK/Lfjs37Y=; b=rqAojy+/x4WQ1q
	NImbE0gixHQKPea7IOpQ4RpuFivZUcNn68bsmsuSwO/c/ld1WLiha/UKKOa2N+7thYyJyYT51I/to
	4VryiLxQNDMh06Fw/JGuFVd/qu1gTxgmsVK0FXmNTNTcHJcKwpR2ylYDvB+EAVTafkLkbQUDC1/3c
	cKUmnGbmNw51jEOa7CfBCTfLB25PganJpqSmXKR3Ct7SYD1+dUpXtvrTJ2q7PzOeixju/Is9Kay6U
	Fj76rCP2udSixv1Vak3z6zLEoWDqPQVWWKo6opeJQ9QwOmN+p2syG6Rie/XUHQ8PYZUW9O/mj/rB/
	75eJbijgxIt/RnKFtTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRnm-0000000CCcG-133O;
	Mon, 10 Aug 2026 15:20:34 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRnj-0000000CCbJ-1cCs
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrm+sHF0dtrT76s0yTev0+xu/CUSsrj9svhke7lLmXgrpVGmTBnUBUOzvTWcIonCYjWarttzGdh5J+nGDRG5tJ+YyEpEuO89m7JFRviLYGSVSJi8GISPg1A4sqdOfqswx08LComj932syQ+K/Vy4ilrGrYHEhuiKMUUQQAOMj1qLjeaB9a66BIphVYQYM/hHne1hI8l0HCcX5/l7rn5Pr/5o+PNHfiQARK9tdFUeoWoWFCh/C8JBwn5VvtXb4wLIlguxyuhzX+dwOyIUNgshYhVOcdCq5Si6zYQd+f5II9QRLmlIeI76g3A19EQic9ybSDjgRXAEFWPQd6gp0BWbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnpfId42NgiBpLcyozbTRHIwbdYR5yma2ziWIzHuWwg=;
 b=H71HRtrtU9qaodw62AVDrysDPqqIdQG0eHZqmqENxar0lJd7k9flg1LIDvbMdErss7me8JnNgJ6wI2wEnAJezsv5irfBLzA/E9fGEfvvAwNOSHqmrls4jYtIq085mOAXlfRg64jlL9u1mXhNMvioRd33TgGlIIXuJxQOHK6btXG+zlxgvG1o+jj7nFBy9hB/otU+3ogL0buu+8OiELl/qkm+afiFVLoNHs0GuQKQSqKEeM7y4qAH+Hpn6QHA3GPQ2ZatyPCZgJso10AKPyvHuiZ0xn6UrFk5F8bKpo75IQ8GZCX7X4zeb4QABAHYR1lDajc5GZmRYHtnUTjWGlUYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnpfId42NgiBpLcyozbTRHIwbdYR5yma2ziWIzHuWwg=;
 b=S2S2MqCHvGxP7gwcf0df2LtESj7ehz8E90ccUheMO59f851U9BODt+DlV93yxd9m7SiBZ77IcfsrJJjpAn8aRjHsixFnofe2dCHn2NhbTEAawOwdkr1cpo/j/fy3iDwACntljAGOxLw/LsAdVrWuwX2FufEFJZvoENWp+2RJ4bxAxaPa908n92ot21t2KfkXYvmoqiHcicggkzIhU8fRD+dSARUu8IlYMrAMa4NIoPiAIHAHP3xxcsB1wJN2u0CVSCp+g85ixLqnqWk+H1f+ojJUYutVk86+23wpFdvLnPCBpIfKcNWMLHlzeqrSKLi7qe7H3pdHwVW4HM5zqan4HQ==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by MMZPR09MB294146.eurprd09.prod.outlook.com (2603:10a6:190:39::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:20:23 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 15:20:22 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "jtaubepe@redhat.com" <jtaubepe@redhat.com>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"arikalo@gmail.com" <arikalo@gmail.com>, "boqun@kernel.org"
	<boqun@kernel.org>, "cfu@mips.com" <cfu@mips.com>, "cmirabil@redhat.com"
	<cmirabil@redhat.com>, "conor@kernel.org" <conor@kernel.org>, Djordje
 Todorovic <Djordje.Todorovic@htecgroup.com>, "gary@garyguo.net"
	<gary@garyguo.net>, "jrtc27@jrtc27.com" <jrtc27@jrtc27.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "pjw@kernel.org" <pjw@kernel.org>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"thecharlesjenkins@gmail.com" <thecharlesjenkins@gmail.com>,
	"will@kernel.org" <will@kernel.org>, "yury.norov@gmail.com"
	<yury.norov@gmail.com>
Subject: Re: [PATCH v4] riscv: Use Zalrsc extension to implement atomic
 functions
Thread-Topic: [PATCH v4] riscv: Use Zalrsc extension to implement atomic
 functions
Thread-Index: AQHdGrs57+MPKxkleEeq9ik0aj5SF7aB4TIAgAAaaICAFYZwAA==
Date: Mon, 10 Aug 2026 15:20:22 +0000
Message-ID: <bfdfd666-a5de-484d-9f16-87e33a942f2a@htecgroup.com>
References: <CADRr4bcbD57hmR0XGgo8BjgNp4shEADOondZEtwscCJ9-nxXRQ@mail.gmail.com>
In-Reply-To: <CADRr4bcbD57hmR0XGgo8BjgNp4shEADOondZEtwscCJ9-nxXRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|MMZPR09MB294146:EE_
x-ms-office365-filtering-correlation-id: bc0e0fe4-955a-46df-8608-08def6f2e5a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|56012099006|11063799006|10067099003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: i57ZQpKWOYjBXtPo6WsOdC3S5vTCHmD/pp07P08Wk9easyrxixMWlXqROJpHClqjNto2wBQY5osN1dDfZPwM3NNbSheWyMiMYSs6HJnBZLmqJ03SOP6C1B1EEBhEnKjFY7Y4M0vIGod1BxT20Ps7EcflLrursESCDdRu/phlXo6GwjWuF8EZQ0bl2WR2S/q2OTvuTXRPK8wMYkd95EdPmrR3D+XnWgnvJ5s6sWecqf/GeetQWTWWlHPOGzXPe38roQmaZ2npDK3xM0VP70egJhldaaYXlOZTT5/JN+EuA+8wJ6CUzn045SkBrp/Awr1FbJ2NWjR652CTxeIKPBNbqN9tWOzxGjPgxwB0aNuhA5MXL2cYcSAABXq/UATgzvbCXfSYdSPE6nTlgwqXOTqay45pIcL0I/x4Ir7gJ304hEBa9hJv4D5nGQzPiyhSwrx7d+V0Z0TNzTFkoi1yXaB/2P50aS2xscqEFXry5OGZu8kO7cQJakVM+Lev+fOe/3avOn/ioIjBaKAjEJqoemIZD5ybCJ1kIYXGgaYP/gNsAJCldPT2H6/G4UwHQkY06V7KZZbg4k7iurgnvavgAJgixI3vTt+rxPXvVmnqABQc93G2RHcFEtlduM9as+ToO89AVgzLZTGOoe19v3BBzxZoMqQL+UQqWLjH2Ly5aSrMSGPjUKyOHgvGftRkHCMZCDaWiVjkGubL03G8eKW5Q4EV4h4ttyxveAmk/jBraHvIU9k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0owa3lOT3NVa0hFcWFGdmtTQnhZWmxiNUFPdUNnTjY4Z0puK0VFSnI3MEQz?=
 =?utf-8?B?VFRwaFFBbXI5c2tpcFhQemZxb3hueURqOUpRMURETldjV0t2akpOSzJXS2JE?=
 =?utf-8?B?Z09oUWFqTGxoYzlKeUtQZjhiUEZVQzV1NjZoeEFVaVdOdHpUWmdTNkJPOUN3?=
 =?utf-8?B?R2dwQTVoRVc2R2xnRVFwQ250SkROeDMzWkRCVm8yNGRXaEhtcUpHT3JFTFlJ?=
 =?utf-8?B?Ukd4blZ0aXdqUTZOYWszS1ExOGFBR3hPWndWampMNjVMeDdnSTdPZ3cyL2Nh?=
 =?utf-8?B?alIvZE1iOVF5d0FMclVhZWs3RlpFQURMUTJqMDBnOGoybWRQaFlrTTRuZDRi?=
 =?utf-8?B?dEpEZmtlL1gyOFVVZkZ1KzNGZkRRSGtZQW1XSzZ5NTBxeEFKV1VWQ0pYY2pP?=
 =?utf-8?B?L1JkSjZTWU4rakx5Q0p6eTA0enlpbXByV2Ztd2hkSHg2MUdoaHhtRmQ4dG92?=
 =?utf-8?B?dHM1Y1ZDY2VKQmpGemVNaVRPZncwTkN2RXZFc2tpYnZqT05obkd5SjY4MGZX?=
 =?utf-8?B?dnBwQlpydUIxZ3BJUnRNbHJtd1lHaDRYTTV2V0RJdEcydFNBaHQyMHpvZER2?=
 =?utf-8?B?Mm9UcGQ3TUFDUDBHRHlVWjRpMTZwcFQyTVNOTTdEMzZsKzgxYkRVQTkrK1VW?=
 =?utf-8?B?a1E0QkFRbjlxaGhWUHpWdC9vSzdyTHNMc3lueng4RmVGVXAzLzFaR2NWaC9T?=
 =?utf-8?B?WWR3eVNPZ1N1cXc5NVV0Z1o5OEZYTDFZRGFzM0s0Q3Z1Y0ZzTmtqTUhrMUph?=
 =?utf-8?B?WXkxNTdTaklzdEtzcUJUelk5YW9PMTRwU0x4ZkpTTko0bTByUlowL0tWQTJv?=
 =?utf-8?B?RUdPY3Q1cysxV0xIT0xTSkl0ZE8xQ09DTVNnaTREQnB2OU5iMk1pZ0RLL1Vo?=
 =?utf-8?B?SnMrMmZVc0NqS2paeVBkbFBXQVRtZWpuanRwZXRUVnplM1pEQ2RGRnZSZEta?=
 =?utf-8?B?bGtxR2xMbnliSGlLU1diY1lSN25vRG8yeGFYTW5PeDNjM0swZlNpc0JvQ1Np?=
 =?utf-8?B?bWZwbEMwblpCNXlmK0EvTEJJV2ViUWM5UTV4WlFGSGgwTUZNUWpqLzA4alBJ?=
 =?utf-8?B?RVorYTl1Z3MwTGxjajNSUWRHSFkrczVmUEYvRnY5T2hxRjBxS09TUkphZXFv?=
 =?utf-8?B?QjVPK0xrQjBnMzFKTDFTRUpvYVRkRStwNE40YStlTnVsWTlLaFJZNXZnSlI1?=
 =?utf-8?B?MVUzWUo5SzJjSzhKSW9yZG9HK0hGQmwvaUZpL01zQVI3OEt2TVIzWWI5dG5m?=
 =?utf-8?B?eFZRelp1TG9TM292akdDczdIVEVvK3Zxc1FlZUtjdDVwajlPNnZyY0F1djBR?=
 =?utf-8?B?MTlSck9xcU50bDM5MnJrRjJMbC82UG5PZjJqeXNRdzJBQURUMEdvSjJ6OUxp?=
 =?utf-8?B?UVAyVXNyWG5oRzlaOWFIc2tOdHJUMitwRkJYcVJ6SWdOUkFub0s1U2N1dDk4?=
 =?utf-8?B?Tkg0V0xpNmVuUFJjUGw4Tlg0WjE5b0ZqakJPVDMvZTBUa2t1aFRkTVE3RTRH?=
 =?utf-8?B?SHBZY2lnSjNrWDFBMjYvQURXYy9qQ0VkY1p2SVg4b3A3ek5ReWI2RWlmaUUv?=
 =?utf-8?B?OVl3R1p4S1BnU2tsSzErOXYxaTlrWVVQSDM2VHBaai9MS2lLL3N2RkpmZmc3?=
 =?utf-8?B?aWVpYm5ydC9EVkxtTTM3bXdFSFlyRm1ZOURSeGoxczF5b01oRmF3VkZ1UHYy?=
 =?utf-8?B?bkFIdFhYenlHT3lLSGtaMW5iakt4RDNKOWd0eFUxVFdYazFkZUZucWZkYmRu?=
 =?utf-8?B?Z0JVSlVZd0c4SDk4cXZjOWc1aFlMckFJVGJRb21uaWgvUk5xQU1NWFdubits?=
 =?utf-8?B?Zm85ek1LSVczSzVGTDltUWl0SWtObStzSHhwMklIRDJvZ2ZhNGhMdkVSQmJZ?=
 =?utf-8?B?emtzNDNLY1IwU3g2NDFISEZuM3BsWHhPYWRac0JzZzI3eEh0V2RITENzSXND?=
 =?utf-8?B?cVRFUEJUTTJpMmZmaURVaEhWWW5Qa3FJdjA5VzN6QVZOc0Z4RVIwU1JCT2Ev?=
 =?utf-8?B?ajlPaUNjVTJLSW9NVHRDemR3c3Z0aGpmc1Rxalo0UTdKUTV0TW9zNm8vRHpW?=
 =?utf-8?B?QjMvc0dXTlRsREQ2R0Evangva1RLTjR5L0cyQ3kxUlYyZlVPMmFXVXFSNXh5?=
 =?utf-8?B?M0ZkbjQxVEFLWUNGbzJWMVJwdU1DeU1NeSsxY0tGSXpQT0lBaGNSUlB4V3hr?=
 =?utf-8?B?SlI3YmFLN1V1UmZZdGpoaGRaWU9uNWQ4NDJmUEZKTUJaWUNCazVyZERVUFR1?=
 =?utf-8?B?d1Qvd1lvc3VOTHFrWE1OTlhyYmgzaldNY0JoUmtqbXpDN2N0V3d3dC8xQUJ6?=
 =?utf-8?B?eHAzMFZjSVJzTVhrSzRZUTFPZk1yd1ByYXArMGltYU5zYlY0ZUNoQkE2RDVC?=
 =?utf-8?Q?iLQQxybz54GRF9cs=3D?=
Content-ID: <51F856C0E3EC804C90BF2BDA2C1040D9@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0e0fe4-955a-46df-8608-08def6f2e5a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 15:20:22.8530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84YlhWZXdYhHhQaYfrWn8U2b3/YKn/qpAcAzzNVNqTrHKX1XFF173Dyyygj5E00bTXLeYc/s7Qnix6Uz40H1OIGLgnCACtLmlxY3up+PFSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR09MB294146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082031_600804_9D1A00D9 
X-CRM114-Status: GOOD (  21.12  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSmVzc2UsDQoNCg0KT24gNy8yOC8yNiAwMDozNywgSmVzc2UgVGF1YmUgd3JvdGU6DQo+IE9u
IE1vbiwgSnVsIDI3LCAyMDI2IGF0IDU6MDPigK9QTSBKZXNzZSBUYXViZSA8anRhdWJlcGVAcmVk
aGF0LmNvbT4gd3JvdGU6DQo+PiBPbiBUaHUsIEp1bCAyMywgMjAyNiBhdCAxMTo1M+KAr0FNIEFs
ZWtzYSBQYXVub3ZpYyB2aWEgQjQgUmVsYXkNCj4+IDxkZXZudWxsK2FsZWtzYS5wYXVub3ZpYy5o
dGVjZ3JvdXAuY29tQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IEZyb206IENoYW8teWluZyBGdSA8
Y2Z1QG1pcHMuY29tPg0KPj4+DQo+Pj4gTUlQUyBQODcwMCBkb2VzIG5vdCBuYXRpdmVseSBzdXBw
b3J0IFphYW1vIGluc3RydWN0aW9ucy4NCj4+PiBUaGV5IGFyZSBlbXVsYXRlZCB3aXRoIFphbHJz
YyBleHRlbnNpb24gaW5zdHJ1Y3Rpb25zIGluc3RlYWQgWzFdLg0KPj4+IFNpbmNlIHRoZSBlbXVs
YXRpb24gaXMgaW1wbGVtZW50ZWQgdGhyb3VnaCBNLW1vZGUgdHJhcHMgaW4gdGhlIFNCSQ0KPj4+
IGxheWVyLCBpdCBpcyBiZXN0IHRvIGF2b2lkIHVzaW5nIHRoZXNlIGluc3RydWN0aW9ucyB3aGVy
ZXZlciBwb3NzaWJsZSBvbg0KPj4+IHRoZSBQODcwMC4NCj4+Pg0KPj4+IEltcGxlbWVudCBrZXJu
ZWwgYXRvbWljIG9wZXJhdGlvbnMgdXNpbmcgTFIvU0Mgc2VxdWVuY2VzIG9ubHkuDQo+Pj4gVGhp
cyBpcyBhY2hpZXZlZCBieSB1c2luZyB0aGUgZXJyYXRhIG1lY2hhbmlzbSwgd2l0aCBtaW5pbWFs
DQo+Pj4gaW50ZXJmZXJlbmNlIG9uIG90aGVyIGNvcmVzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1i
eTogQ2hhby15aW5nIEZ1IDxjZnVAbWlwcy5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxla3Nh
bmRhciBSaWthbG8gPGFyaWthbG9AZ21haWwuY29tPg0KPj4+IENvLWRldmVsb3BlZC1ieTogQWxl
a3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0K
PiBUZXN0ZWQtYnk6IEplc3NlIFRhdWJlIDxqdGF1YmVwZUByZWRoYXQuY29tPg0KVGhhbmsgeW91
IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gdGVzdCB0aGUgcGF0Y2ghDQo+DQo+Pj4gWzFdIGh0dHBz
Oi8vbWlwcy5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjYvMDMvTUlQU19QODcwMF9QODcwMC1G
X1Byb2dyYW1tZXJzX1JlZmVyZW5jZV9HdWlkZV9SZXYxLjg2XzItMTctMjAyNi5wZGYNCj4+Pg0K
Pj4+IC0tLQ0KPj4+IFRoZSBwYXRjaCB3YXMgdGVzdGVkIG9uIFFFTVUgY29uZmlndXJlZCB0byBl
bXVsYXRlIGFuIGVpZ2h0LWhhcnQgTUlQUyBQODcwMCBDUFUuDQo+PiBDYW4geW91IHNoYXJlIHRo
ZSB0ZXN0cy4gSSBtYWRlIG15IG93biB0ZXN0cyBhIHdoaWxlIGJhY2sgaGVyZToNCj4+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9Nci1Cb3NzbWFuL3phbHJzYy1idWlsZHJvb3QvdHJlZS9tYXN0ZXINCj4+
IFRob3VnaCB0aGV5IGRvbid0IHNlZW0gdG8gYm9vdCB3aXRob3V0IHRoZSB6YWFtbyBleHRlbnNp
b24NCj4gSSBmb3VuZCBvdXQgdGhhdCB0aGUgZGV2aWNldHJlZSBuZWVkcyB0byBoYXZlIHRoZSBh
bW8gZXh0ZW50aW9uIHRvIHdvcmsuDQo+IFNvbWV3aGVyZSB0aGVyZSBpcyBhIHBhdGNoIHRvIHNw
bGl0IHN1cHBvcnQgaW50byBaYWxyc2MgYW5kIFphYW1vLCBidXQNCj4gaGVyZSBpcyBvbmUgb24g
bXkgdHJlZQ0KPiBodHRwczovL2dpdGh1Yi5jb20vTXItQm9zc21hbi9saW51eC9jb21taXQvMmJk
ZThjNDM4MmE1NWNiODJlNzY5YjBjOGQ5ZDhiZjFiOWM5MTY0ZA0KVGhhdCdzIGNvcnJlY3QuIFdl
IHN0aWxsIHBhc3MgJ2EnIHRvIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucyBsaXN0IGluIG91ciBw
cml2YXRlIGR0cy7CoA0KSSB0aGluayBbMV0gYm90aCBhZGRyZXNzZXMgdGhpcyBpc3N1ZSBhbmQg
b3ZlcmxhcHMgd2l0aCB0aGlzIHBhdGNoLsKgDQpJZiBpdCdzIG5vdCBhIG1ham9yIGlzc3VlIHRo
b3VnaCwgd2UgYXJlIGNvbnRlbnQgd2l0aCBsZWF2aW5nIHRoaW5ncyBhcyB0aGV5IGFyZS4NCg0K
VGhlIHRlc3RzIEkgcmFuIHdlcmUgZ2VuZXJpYyBrc2VsZnRlc3RzIChhbmQga2VybmVsIG1vZHVs
ZXMpLiBDb21waWxlZCB3aXRoIEdDQyAxNS4xLjAuwqANCj4+IFRoYW5rcywNCj4+IEplc3NlIFRh
dWJlDQo+Pg0KPj4+IFRlc3RpbmcgZG9uZSBzaW5jZSB2MzogZnV0ZXgga3NlbGZ0ZXN0cyBhbmQg
cGVyZiBmdXRleCB0ZXN0cy4gVGhlc2UgdGVzdHMgY2F1Z2h0IHRoZSBpc3N1ZXMgZGVzY3JpYmVk
IGJlbG93Lg0KPj4+IFRoZSBzYW1lIHRlc3RzIHdlcmUgZXhlY3V0ZWQgb24gdGhlIEJvc3RvbiBi
b2FyZCB3aXRoIGEgc2luZ2xlLWhhcnQgUDg3MDAgY29yZS4NCj4+Pg0KPj4+IFNpbmNlIHRoZSBt
YWluIGlzc3VlIHdhcyB3aXRoIGFuIGluY29ycmVjdGx5IHdyaXR0ZW4gZXJyYXR1bSwgaXQgc2hv
dWxkbid0IGFmZmVjdCBWbGFkaW1pcidzIHZlcnNpb24gWzFdLg0KPj4+IEhvd2V2ZXIsIHNpbmNl
IGNoaXBzIHN1cHBvcnRpbmcgb25seSBvbmUgcGFydCBvZiB0aGUgQSBleHRlbnNpb24gYXJlIHJh
cmUsIHdlIGJlbGlldmUgaXQgbWlnaHQgYmUNCj4+PiBiZXR0ZXIgdG8gYWRkcmVzcyB0aGlzIHVz
aW5nIHRoZSBhbHRlcm5hdGl2ZSBtZWNoYW5pc20sIGluc3RlYWQgb2YgZGVtYW5kaW5nIHRoYXQg
dGhlIHdpZGVyIGNvbW11bml0eQ0KPj4+IHJlbGF4IHRoZSBBIGV4dGVuc2lvbiByZXF1aXJlbWVu
dC4NCj4+Pg0KPj4+IENoYW5nZXMgaW4gdjQ6DQo+Pj4gLSBUaGUgYW1vIHBhcnQgb2YgdGhlIEFM
VF9URVNUX0FORF9PUF9CSVRfT1JEIGVycmF0dW0gZXJyb25lb3VzbHkgaGFyZGNvZGVkIHplcm8g
YXMgdGhlIGRlc3RpbmF0aW9uIHJlZ2lzdGVyLg0KPj4+ICAgVGhpcyBpcyBmaXhlZCBpbiB2NC4N
Cj4+PiAtIGZ1dGV4Lmggd2FzIG1pc3NpbmcgdGhlIEFORE4gY2FzZS4NCj4+PiAtIExpbmsgdG8g
djM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MDEtcDg3MDAtemFscnNjLXYzLTEt
ZWM2NGZhYmJlMDkzQGh0ZWNncm91cC5jb20NCj4+Pg0KPj4+IENoYW5nZXMgaW4gdjM6DQo+Pj4g
LSBVc2UgYWx0ZXJuYXRpdmVzIHRvIHJlcGxhY2UgQU1PIGluc3RydWN0aW9ucyB3aXRoIExSL1ND
DQo+Pj4gLSBSZWJhc2Ugb24gQWxleGFuZHJlIEdoaXRpJ3MgImZvci1uZXh0IiBicmFuY2guDQo+
Pj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0
MTIyNTA4MjQxMi4zNjcyNy0xLWFyaWthbG9AZ21haWwuY29tLw0KPj4+DQo+Pj4gTGlua3M6DQo+
Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwMTIwLWxyc2Mt
b25seS12Mi0wLWE1MjJlNjQwZDI3ZEBtb2JpbGV5ZS5jb20vDQo+Pj4NCj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4+
IC0tLQ0KPj4+ICBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhICAgICAgICAgICAgICAgICAgICB8
ICAxMSArKw0KPj4+ICBhcmNoL3Jpc2N2L2VycmF0YS9taXBzL2VycmF0YS5jICAgICAgICAgICAg
ICB8ICAxMyArLQ0KPj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2F0b21pYy5oICAgICAgICAg
ICAgICB8ICAyOSArKy0tDQo+Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmggICAg
ICAgICAgICAgIHwgIDI4ICsrLS0NCj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hn
LmggICAgICAgICAgICAgfCAgIDkgKy0NCj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJh
dGFfbGlzdC5oICAgICAgICAgfCAyMTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3RfdmVuZG9ycy5oIHwgICAzICstDQo+
Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0ZXguaCAgICAgICAgICAgICAgIHwgIDQwICsr
LS0tDQo+Pj4gIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICAgICAgICAgICAgICAgIHwg
IDEwICstDQo+Pj4gIDkgZmlsZXMgY2hhbmdlZCwgMjkwIGluc2VydGlvbnMoKyksIDY4IGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEg
Yi9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhDQo+Pj4gaW5kZXggM2M5NDVkMDg2YzdkMDI2NmI2
ODVmOTUwNmQ1OGIwNjYyYWYwNzFjNC4uY2Q1YmQ1ZThlYjM5NTQxOGMzYWQxMDNkYmQ4MzZjNzc1
YjdmZDkwMSAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhDQo+Pj4g
KysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQ0KPj4+IEBAIC00NCw2ICs0NCwxNyBAQCBj
b25maWcgRVJSQVRBX01JUFNfUDg3MDBfUEFVU0VfT1BDT0RFDQo+Pj4NCj4+PiAgICAgICAgICAg
IElmIHlvdSBhcmUgbm90IHVzaW5nIHRoZSBQODcwMCBwcm9jZXNzb3IsIHNheSBuLg0KPj4+DQo+
Pj4gK2NvbmZpZyBFUlJBVEFfTUlQU19QODcwMF9BTU9fWkFMUlNDDQo+Pj4gKyAgICAgICBib29s
ICJSZXBsYWNlIEFNTyBpbnN0cnVjdGlvbnMgd2l0aCBMUi9TQyBvbiBNSVBTIFA4NzAwIg0KPj4+
ICsgICAgICAgZGVwZW5kcyBvbiBFUlJBVEFfTUlQUyAmJiA2NEJJVA0KPj4+ICsgICAgICAgZGVm
YXVsdCBuDQo+Pj4gKyAgICAgICBoZWxwDQo+Pj4gKyAgICAgICAgICBUaGUgTUlQUyBQODcwMCBk
b2VzIG5vdCBpbXBsZW1lbnQgdGhlIGZ1bGwgQSBleHRlbnNpb24sDQo+Pj4gKyAgICAgICAgICBp
bXBsZW1lbnRpbmcgb25seSBaYWxyc2MuIEVuYWJsaW5nIHRoaXMgd2lsbCByZXBsYWNlDQo+Pj4g
KyAgICAgICAgICBhbGwgQU1PIGluc3RydWN0aW9ucyB3aXRoIExSL1NDIGluc3RydWN0aW9ucyBv
biB0aGUgUDg3MDAuDQo+Pj4gKw0KPj4+ICsgICAgICAgICAgSWYgeW91IGFyZSBub3QgdXNpbmcg
dGhlIFA4NzAwIHByb2Nlc3Nvciwgc2F5IG4uDQo+Pj4gKw0KPj4+ICBjb25maWcgRVJSQVRBX1NJ
RklWRQ0KPj4+ICAgICAgICAgYm9vbCAiU2lGaXZlIGVycmF0YSINCj4+PiAgICAgICAgIGRlcGVu
ZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUNCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9lcnJh
dGEvbWlwcy9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL21pcHMvZXJyYXRhLmMNCj4+PiBp
bmRleCBlOTg0YTgxNTIyMDhjMzQ2OTBmODlkODEwMTU3MWIwOTc0ODVjMzYwLi4wOGM1ZWZkNThi
ZjI0MmQzODMxOTU3ZjkxZjYzMzhlZjQ5ZjYxMjM4IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcmlz
Y3YvZXJyYXRhL21pcHMvZXJyYXRhLmMNCj4+PiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS9taXBz
L2VycmF0YS5jDQo+Pj4gQEAgLTIzLDEzICsyMywyMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZXJy
YXRhX3Byb2JlX3BhdXNlKHZvaWQpDQo+Pj4gICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+PiAgfQ0K
Pj4+DQo+Pj4gLXN0YXRpYyB1MzIgbWlwc19lcnJhdGFfcHJvYmUodm9pZCkNCj4+PiArc3RhdGlj
IGlubGluZSBib29sIGVycmF0YV9wcm9iZV96YWxyc2ModW5zaWduZWQgbG9uZyBhcmNoaWQpDQo+
Pj4gK3sNCj4+PiArICAgICAgIHJldHVybiBhcmNoaWQgPT0gMHg4MDAwMDAwMDAwMDAwMjAxOw0K
Pj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgdTMyIG1pcHNfZXJyYXRhX3Byb2JlKHVuc2lnbmVk
IGxvbmcgYXJjaGlkKQ0KPj4+ICB7DQo+Pj4gICAgICAgICB1MzIgY3B1X3JlcV9lcnJhdGEgPSAw
Ow0KPj4+DQo+Pj4gICAgICAgICBpZiAoZXJyYXRhX3Byb2JlX3BhdXNlKCkpDQo+Pj4gICAgICAg
ICAgICAgICAgIGNwdV9yZXFfZXJyYXRhIHw9IEJJVChFUlJBVEFfTUlQU19QODcwMF9QQVVTRV9P
UENPREUpOw0KPj4+DQo+Pj4gKyAgICAgICBpZiAoZXJyYXRhX3Byb2JlX3phbHJzYyhhcmNoaWQp
KQ0KPj4+ICsgICAgICAgICAgICAgICBjcHVfcmVxX2VycmF0YSB8PSBCSVQoRVJSQVRBX01JUFNf
UDg3MDBfWkFMUlNDKTsNCj4+PiArDQo+Pj4gKw0KPj4+ICAgICAgICAgcmV0dXJuIGNwdV9yZXFf
ZXJyYXRhOw0KPj4+ICB9DQo+Pj4NCj4+PiBAQCAtMzgsNyArNDcsNyBAQCB2b2lkIG1pcHNfZXJy
YXRhX3BhdGNoX2Z1bmMoc3RydWN0IGFsdF9lbnRyeSAqYmVnaW4sIHN0cnVjdCBhbHRfZW50cnkg
KmVuZCwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0YWdl
KQ0KPj4+ICB7DQo+IFdlIHNob3VsZCBiZSBwYXRjaGluZyB0aGlzIGluIGF0IFJJU0NWX0FMVEVS
TkFUSVZFU19FQVJMWV9CT09UDQo+IFRoaXMgZ2l2ZXMgYXMgZmV3IGluc3RydWN0aW9ucyBhcyBw
b3NzaWJsZSB0aGF0IGFyZW4ndCBwYXRjaGVkLiBQbGVhc2UNCj4gZG8gc29tZXRoaW5nDQo+IHNp
bWlsYXIgdG8gaG93IHRoZWFkIGRvZXMgaXQuDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y3LjItcmM0L3NvdXJjZS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYyNM
MjIyDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24hIEkganVzdCBzZW50IG91dCBhIHBh
dGNoIHRvIGFkZHJlc3MgdGhpcy7CoMKgDQoNCkJlc3QgcmVnYXJkcywNCkFsZWtzYQ0KDQpMaW5r
czoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDEyMC1scnNj
LW9ubHktdjItMS1hNTIyZTY0MGQyN2RAbW9iaWxleWUuY29tLw0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
