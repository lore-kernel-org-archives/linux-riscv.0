Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAEFCF857B
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxtOLNLAAxdhF0M9s70iMERxAVu7Lq/WR8ae9C1PiXM=; b=2zLttPE1lO4w0C
	gDAquN+J4YJ0mOQn1j+DDj8++obIqdfRI0Y7veBgy4C9Am76hkjYF6+LE1PqrH6pTcrNIGXzoQJQl
	a2iuaqtIXJA3R4LkyCg9la4I3PPnlRZeC4gqbMGd3Qz6SaJ4/jd92NVgyLE92uMAUkPw3ZFhZuKfX
	kev3Rr4AijDyGaKt4T1ilnJRqW8YkbAmskPf+URJgWXv73PuYF1GlfH/DJ0jtYWuHmNuyvrQGn1o3
	JZFPRl/Aqjk5wZEwTBBuandqSeNY/p0P+293dtD+0lwFIyUQthiyOfJV0cG5L/2i8q35UKChv8gxF
	3WATPhKJczy8oWiMaLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Xu-00000006Tj8-1ciM;
	Thu, 20 Nov 2025 10:05:46 +0000
Received: from mail-westeuropeazon11023090.outbound.protection.outlook.com ([52.101.72.90] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1Xs-00000006TiG-1i76
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 10:05:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLt82aZIg42PdSUN61iszQ8jPFg0c/J28NRXUvxNebgn9MGso+NRmi4m2pK6eJmOWHiwgSpTEs2lkdwI1+jS45ipO7K045vbV3IGfvUMZGUnqzEy42qEhgYRKhL0NdtYiJGkQTriwTjlmrbfPn6eS4PhaRCA6cVElyqF/OlmBvWdU1IoNIyAdvbj2rjHkrsikn7J/vryxierByAvyf4X2GDGya4ckhjjGJQ1XBb0x+KzVhdJNKttJF8gxoa6S7+hvF1dZumUki6ERO0yYI0KDki0PoXDE95pForXgLvQOMWO20w/eud4wYF1L1BpSxT+LU/U7RP4BQJ7yt2tGqzpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAeAwMwirgcy/zeHKk53+b1neuUakoq6uzzCpNrjq+w=;
 b=B733FSsoYu8q296ZA83N691P+4zui6POsqFyW7F0xqg+wJ9c1Nj704HV8FgdjeY1vUlLHZYrcp5pZZ4wRmOdv3XE4RjZp7zbVdxRx/49FI3OIfj7/dtRP3AckYCZUL/mBCfhCxuiw0MSm4iJXOrmAEgF9X6I1oPF6rUP/Ftybf1PsXKfet1xO/N/+5t8ztD9RWiarLPCZxSK8T340w+4i4IcRRj2gTuii1nFRXTI6o8pFotk2a8JG18CDH3aZgqbNV7gNGHitgzARS2op0LACjblc3PZL8Odkzbgt+xRXkswHkBEtsoweU+JIz/g2Orpksfy8VRBrZhJH7D0aSbTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAeAwMwirgcy/zeHKk53+b1neuUakoq6uzzCpNrjq+w=;
 b=Jn5MoGyILkcvngZme0Zk2mCpcC02k0b3IRA3T/fK1g1Otyv1UrTRBGWwwqQ91yhvpGBYj7QL5KAkwoldzx4mloD4phbc24N4kwjZIdVKbyr3AROdkq9StI5TwQ2xxlHa+71MMCpdnKQMoHEaTKlf3UqNB739v501Y8/snn9LabbrVXROe9owaTB16j0bfJrRzl3sKb8GQaKSbE6xXz12Es6i41MreyM5QEDcfwiElmSWheKW8k8shKXNWkD3KDf16Z/v7wx8qqXyzocM54XKwhUjeSzFoNwC6zRe3SheKkz3D6E1DmFaYjbVR93OOV2A3hnoVptbzZmNRfnAZWwJ+w==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by AS4PR09MB5598.eurprd09.prod.outlook.com (2603:10a6:20b:4b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:05:37 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 10:05:37 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "pjw@kernel.org" <pjw@kernel.org>
CC: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, Aleksa Paunovic
	<aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "cfu@wavecomp.com"
	<cfu@wavecomp.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "conor@kernel.org" <conor@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Update MIPS vendor id to 0x127.
Thread-Topic: [PATCH] riscv: Update MIPS vendor id to 0x127.
Thread-Index: AQHcTNNlUqzeKAlBlk2IdkuCz3mYBrThgu8AgADmswCAABekgIAADYIAgBbgJYCAAgHWgA==
Date: Thu, 20 Nov 2025 10:05:36 +0000
Message-ID: <b4ff764c-24d5-4187-8815-d505918e5d9f@htecgroup.com>
References: <cfa1cbf8-da6c-3ad1-e8d8-1a11ae5619a2@kernel.org>
In-Reply-To: <cfa1cbf8-da6c-3ad1-e8d8-1a11ae5619a2@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|AS4PR09MB5598:EE_
x-ms-office365-filtering-correlation-id: 7ea3f6ef-beca-48df-cd7e-08de281c5a32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OTgzOEJobk1CclJ3cGUzMUlVaGl5eHZ2bzhzMGYyMlN1QndDaVRCdjI2UzRt?=
 =?utf-8?B?OXFIR24yNVRrNGxMRUdxT1BhYTQ2ak9nMmp5SjZjOEtxL3pmaXlXZEwyQWQy?=
 =?utf-8?B?TE4rbkIrMkVPaU5hckwwQXd3ZnhCTDBCeVUwOVdRQW1NUkMvTWxWNENsQ2JG?=
 =?utf-8?B?QmovSWVCOVFCUHVxYk8zM3pJM05SZXZWdmhPeWxyeVYxdDFzK1BWbTV0RUN3?=
 =?utf-8?B?TmpqRHgvbWVJN3haTU9ySnFDV3BMRTlIemYyOHJ6ZEgzS0hxV1dNOGtwZzJ3?=
 =?utf-8?B?eXUvOVVDOVVlUFJIUzRqUFovY1ZJREM3eko1Rk4vUi9mWDZheTF0alN1SlRR?=
 =?utf-8?B?N3BtemRGdTVPQ3pDODZYbWh3eEJMeGpDTjNIM285bmFnWGZNbzV5T2Vza1gw?=
 =?utf-8?B?djFmczRQSThXSVlSWlZOS0QrMjA0aVJ0NjhWYkVSbW9aVjhIRUpsN0hZVlNR?=
 =?utf-8?B?NjlOZEUrRENNVnlmR2FJcXRFRjdKTnJGTzl6SUJYeEtleE1VYTV5WW5peVlT?=
 =?utf-8?B?VXZoVzZCUFRlemVBK3FSV3lTbjk1emdZSEpMS3luVWFQZys4M1lSL1VNbVI5?=
 =?utf-8?B?aGNXQzVPekpENjlxRkUvMU5PSTR4TGw1Nzc3Y2x1OGZRa0QvTmplaHYrOUhp?=
 =?utf-8?B?NDJ4ckl3bnI0dDZYdSt0U044RjluSXR5OGNHTWtvSWtBcjB5NUJSYVNMNHJL?=
 =?utf-8?B?RnVISy9CbWNwUFp1Q3JEYUw3aG5leW9pWkRCSGx0Y0RJd0x4cmRuNjZ4NUNZ?=
 =?utf-8?B?Z3BzVDQ1bFBVOVgzcFRPMENLeFpBUTVLejlQZXZwU0dYMG9mMGNldEs3Y1I3?=
 =?utf-8?B?RlFOSGNGVGxVY0psMDRRRktkcXF0cGhzQkVaL0JaN29KWEhsc0UrOEpzd0dl?=
 =?utf-8?B?YUZJSGJSNkt6cnZWK0JreDJCRHJxbDl4NFk5ejN4MkRMNVptMWJXOVJnZ1lD?=
 =?utf-8?B?b2dHMnFFOW5yb2F2aTJBbUVaV2VmenlxVmx0SGlSRlRGUUt5aTlmTjg3ZFRC?=
 =?utf-8?B?ODE1MlNPY3NrcHY0dTU5V0NUQm04K01hK0w3T0lHbEkxRXNvU0NUQVlsVSt4?=
 =?utf-8?B?S2UzdjQrRU5ESyt1aDV6UFI2WVBpTzFBRm9PTEFRZXhEdEEyRnJVYXYwUGsy?=
 =?utf-8?B?emUyaVhZV21sbW1BaGVoOGNVTlA1WU5YNjd5c0xHcFAxQnZUd3hvN3Nlci9Y?=
 =?utf-8?B?Nzl0b0pldVY1cGRiZUtUY1c2QWpZcWhRZE1KRDRyZzF6a3BCTTJuNVFNOElq?=
 =?utf-8?B?dGMrTVNwdDkzZ0lGSW8yQ2dkbVFySlc5ODVEM0Q1Q1VCeFJZc2IxOEN4NnRR?=
 =?utf-8?B?Q0RiZlN2Q3QzL01xM2JGYzMvRlZrem1yem9JQmk5RTZxWG5aa0tDL05yUHBx?=
 =?utf-8?B?L2lvck13TWtGWG96ZU1pRWl3R3hrc3ZDSFZ1bFZSc25qeUJJUi9RNkxrczFs?=
 =?utf-8?B?R2xOTGhHcUFjd3hyS3NQdkhiMGdzTE03a1hsanFxNlFjVkcrdHhDS2hzRklD?=
 =?utf-8?B?aTQ3QzVaZ081YXc4SmpwVC9od2ZqbFNTdHpNUDNxcTZTQm5laTBLMnljejZs?=
 =?utf-8?B?TVdvTDNRcncyK01wR3c5MHZaM2hrMDFqc0JmNm1Dd2RvZFRDQ2JTaFdUQkd5?=
 =?utf-8?B?cU42MzdLUEg0MURnZGZkcUlBS3pDd29zZy9zUHRwYzZKc0MwSjhhbkFvekZR?=
 =?utf-8?B?Y3N0Y3RVSWpMa01CUWt6UzZ3ZTU3RzhPbG0rMFJLOFdiRjMweXpZVlIya1pJ?=
 =?utf-8?B?RVIxQWJGSHQvZUFKd1JNRUsvTnBEZ1gxR29SMzBKRVlvUFJ6M0xDaTRWYjVP?=
 =?utf-8?B?cDF5eS9RS2U4Nko3NEpmaDg4M3htbVNOVXp6cFRicG9OYnNDZVVKZ3BWK1hC?=
 =?utf-8?B?QktqRlNsNUJYbytNbjF6a284YXJwNFpLNmhkUFBITC9LT3czM25kY2QrTnlj?=
 =?utf-8?B?S1NtTFQyT3lWZUlnd09PcHhxbnhEZGlVdXV0YWN1K2dmbUtNb1UrZXBGZDlS?=
 =?utf-8?B?VUpQcWJYb2hnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkl5Q1FYLy9LV3kxNkFGeWtuaGw4V3Ircng0dkwreFhOQ3A3Rlg1TWxnUlpm?=
 =?utf-8?B?NmpZZlZ6K3AzbFRsSFJ6bHc0WFlVOWh4V3VmamVvOFVaUFF5VStnU3p2MG1G?=
 =?utf-8?B?WW04RHlJOFNFeFNZN2pqTWhWVkkyQXhkeWtvVzVTSHBwVlRTcU5OYyswRFk3?=
 =?utf-8?B?bFhyeE5DbW1aUEkwUmZXNDZTZDA4aTdOdUVrOUlqdzVjQmhmMFF6S2kwSWk0?=
 =?utf-8?B?bytUOG9sSzhhWm5uVHE4UjFEU3JiYitGS2NaNytKMnl6Z21wUi9MWVppRDN5?=
 =?utf-8?B?RnZZSkFlTXN2bFp4YkRDVGhGS3pSaTJQRHE3cm5Gc09LVGRZamdOTUtuQ2xz?=
 =?utf-8?B?LzhoVTliUzdUY1pMS2EwVHpZN1FnRy9weEVESnI5U2VKaTRvdEppaXh5Uk0v?=
 =?utf-8?B?ZjB4N0hsYzVOUVVQT2dTanNKSXZqL05wRnlPaW1PZGcvTXdSRHd2dzRNUXF3?=
 =?utf-8?B?T2VKck9wZE11ZXlwQ0JFMzFsd3hPaFczVjVVSk5maS9lOFlid2oreTQ0M0dE?=
 =?utf-8?B?NHVVb1RaSExwR2FRRFZrL3Z6cUlkcGxSVlN0ampaRGtjbkhyZThTdHVyZGZE?=
 =?utf-8?B?OGp3MWs0NFFJdVdsUnREblNZRXBoUGljTjVDdmJweFBqMm5DMFg3Q0FsV2Q1?=
 =?utf-8?B?eTdJQlAxdS9LbFZSd2Z1SVdmMmYrbmVvT25YWWRxTGNGRkhxaC9QUExsRDRW?=
 =?utf-8?B?Rk9jZzRUVHFCUVpzeW5OZW9PV2F0QkhQSE9XMlM1Tk5SYzd1dlI5VEJBaTgw?=
 =?utf-8?B?RzZ4MVg0ZnNqY1NxVkJRbEFnSzl4VkhwS3FKcW41ZnhGTUdRQUx6VDBhVmNl?=
 =?utf-8?B?amduQk8xTU92YWQ2bnpwT0x4NlcwWWg5VFE0TmgycE5sV3lOSnlEa1FGV2Ry?=
 =?utf-8?B?VnQxMVEyUnhxTmNVU3IxaEx3dmJEbDNnYVpLN1lmbmVXMWgwQXZVbUI0OTlV?=
 =?utf-8?B?V0xMVGVzdktOcGU0NnFLbkd6Lzc3M1EwM2xDTG1JTlZGVEEzTzBESjM5UGlP?=
 =?utf-8?B?TWhxaG1SRk0yMC8wTloydFV0T2NMcktQUjhzWm10eG0xeVYxdG50Q0tBcFRH?=
 =?utf-8?B?bDRVNWExb0xBZkd1OEUvdkdKd044RjNaZzEyTTZCa0NsZ3BPU2lITEY2bmNn?=
 =?utf-8?B?TW9RQnpxQThuVHpVd1lZOXA0Wkd6QzQycytETyttZ1dTZHdxbnpqb0Y1M2h1?=
 =?utf-8?B?NHRCSmRsL1Y0UFBmQ1A1TUxDalJDbWhMaEVNV2NXeHBLS1NBQXJkMUZWSTNQ?=
 =?utf-8?B?M2dDLzhGeUVES3lucWhsRzJTMGQ3cXdBOFdmcElnc3orbWVWNUhmczJ1YmUv?=
 =?utf-8?B?Qi9xNkl4YWhwd0QvOGM1WWFxN1l1OXBOUG1VaVM4OGxlMFZ1aEUrYzJiOVVq?=
 =?utf-8?B?VEpoSS9tTHI2R2c0NGI2WHBvUDFKMjNsRnROY2dKby9xVlEyY0d6bVBJQjMz?=
 =?utf-8?B?M3kxbXJQV0xnMis2OFloRzdQVFJGSTdYejcyYnpydjQwWnhmOUI3eDh0YjBa?=
 =?utf-8?B?bU40OUdtVnUwY0Z2RFFXdHZvR1RzenhWNncwbkNpVGM1T1A5emd3WllqYTBZ?=
 =?utf-8?B?RlZXdWk1bW8wenJpWlUycitsNzIzZmFJYkZvdDE0ckswTEsrSDRMYXZUZGdm?=
 =?utf-8?B?U2NRRTJyOXRWMkp0TVArNmR0SkZFZTB2eEVibTliL1djWTF3blBqK3NyTlVH?=
 =?utf-8?B?bDNack81aUd4VCtqeWVkMXorWXRZN2xQM3hFUkNJVGJzeHczV0cvOWZjVzV4?=
 =?utf-8?B?TGZ3RTBOTlF2K1h2ZkRrNnlxZHZYTTN4MUpNaTVSbW9DaDVvMVNRQzdkNDVn?=
 =?utf-8?B?QjBmQTlaRjdPdFZtcWhONW80REJVcHFyY05YKytkbHo2dElGTlBOdTZ1cGpy?=
 =?utf-8?B?UEtiZzMwb05RNllFcDNLb1FXaTh3aGJHQkpEdldLeTVaNC8rSEs2ZjFFc0Zq?=
 =?utf-8?B?WHEydDBqRTdDV0J2cS8vRENiVzBRYXp2QVhmejI0N08vL091dFZPUENXd1VL?=
 =?utf-8?B?cWova1dpNXk0clRxYkVnK2JJbUpnTUJJZUt3YnJGQ3NXM2ltU3daOEpFdXpP?=
 =?utf-8?B?S3djcjZlVythYnVFcUJWeG9HZWVCdE1XMTN0N1hxQkkvMVY1WXV2VVVKcFdk?=
 =?utf-8?B?SkpkNy80aUVXQ3dEY2NPTlJMWC9aS09jQThPZ1kyVXVZSTVtZzJvVk9DUHhC?=
 =?utf-8?Q?d2p3rPTPa9vCaOq5TUXTXrE=3D?=
Content-ID: <F336FA5AB9ECF742A433FD7477F12046@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea3f6ef-beca-48df-cd7e-08de281c5a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 10:05:37.0629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdgaOqClH2aFQCePC331KdHrKWY4izjL26Rchec1KApgk7qsThRDeasUn1BAIaEQv1o4n4XOmAHtJuQbLY9x351IDmFyplvFIViKTyoED+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR09MB5598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_020544_616092_0845CA80 
X-CRM114-Status: GOOD (  24.83  )
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

T24gMTEvMTkvMjUgMDQ6MjYsIFBhdWwgV2FsbXNsZXkgd3JvdGU6DQo+IENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhl
IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBPbiBUdWUsIDQg
Tm92IDIwMjUsIEFsZWtzYSBQYXVub3ZpYyB3cm90ZToNCj4NCj4+IE9uIDExLzQvMjUgMTQ6MTgs
IENvbm9yIERvb2xleSB3cm90ZToNCj4+DQo+Pj4gT24gVHVlLCBOb3YgMDQsIDIwMjUgYXQgMTE6
NTM6NDlBTSArMDAwMCwgQWxla3NhIFBhdW5vdmljIHdyb3RlOg0KPj4+DQo+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yaWRfbGlzdC5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZW5kb3JpZF9saXN0LmgNCj4+Pj4+PiBpbmRleCAzYjA5ODc0ZDdhNmRm
YjhmOGFhNDViMGJlNDFjMjA3MTFkNTM5ZTc4Li41NTIwNWY3OTM4MDU1YmEyYjc0NGRiYTUxMThi
YmE5MzViY2FjMDA4IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dmVuZG9yaWRfbGlzdC5oDQo+Pj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5k
b3JpZF9saXN0LmgNCj4+Pj4+PiBAQCAtOSw2ICs5LDYgQEANCj4+Pj4+PiAgI2RlZmluZSBNSUNS
T0NISVBfVkVORE9SX0lEICAgICAweDAyOQ0KPj4+Pj4+ICAjZGVmaW5lIFNJRklWRV9WRU5ET1Jf
SUQgICAgICAgIDB4NDg5DQo+Pj4+Pj4gICNkZWZpbmUgVEhFQURfVkVORE9SX0lEICAgICAgICAg
MHg1YjcNCj4+Pj4+PiAtI2RlZmluZSBNSVBTX1ZFTkRPUl9JRCAgICAgICAgICAweDcyMg0KPj4+
Pj4+ICsjZGVmaW5lIE1JUFNfVkVORE9SX0lEICAgICAgICAgIDB4MTI3DQo+Pj4+PiBIb3cgd2Fz
IHRoaXMgZXZlciB3cm9uZz8gRG8gZGV2aWNlcyBleGlzdCB3aXRoIHRoaXMgb2xkIElEPyBEbyB3
ZSBuZWVkDQo+Pj4+PiB0byBzdXBwb3J0IGJvdGggYXMgdmVuZG9yIElEcyBmb3IgTUlQUz8NCj4+
Pj4gSSdtIG5vdCBzdXJlIGhvdyBpdCBmaXJzdCBzdGFydGVkLCBidXQgc2luY2Ugd2Ugd29ya2Vk
IG9uIHFlbXUgYXMgd2VsbCwgd2UgbmV2ZXIgbm90aWNlZCBhbnkgaXNzdWVzIHdoaWxlIHRlc3Rp
bmcuDQo+Pj4+IEl0IHNob3VsZG4ndCBjYXVzZSBhbnkgcHJvYmxlbXMgaW4gdGhlIGZ1dHVyZSB0
aG91Z2guDQo+Pj4gU28gYWxsIHRoZSBoYXJkd2FyZSB1c2VzIHRoZSAweDEyNyBpZD8gV2hlcmUg
ZGlkIDB4NzIyIGNvbWUgZnJvbT8NCj4+PiBJIHJlY2FsbCBxZW11IGRlZmF1bHRzIHRvIDB4MCwg
c28gd2VyZSBub25lIG9mIHRoZSBtaXBzIGNvZGUgcGF0aHMNCj4+PiB0ZXN0ZWQsIG9yIHdlcmUg
dGhleSB0ZXN0ZWQgd2l0aCBhIHFlbXUgbW9kaWZpZWQgdG8gdXNlIDB4NzIyPw0KPj4NCj4+IFRo
YXQgaXMgY29ycmVjdCwgYWxsIGhhcmR3YXJlIHVzZXMgdGhlIDB4MTI3IGlkLg0KPj4NCj4+IEkn
bSBub3Qgc3VyZSB3aGVyZSB3ZSBnb3QgMHg3MjIgZnJvbSAtIHBlcmhhcHMgSSBvciBzb21lb25l
IGVsc2UgbWlzcmVhZCB0aGUgdmFsdWUNCj4+DQo+PiAoMHgyNyBhbmQgMHgyIGFyZSBib3RoIG1l
bnRpb25lZCBpbiB0aGUgUHJvZ3JhbW1lcidzIEd1aWRlIG12ZW5kb3JpZCBiaXQgZGVzY3JpcHRp
b25zKS4NCj4+DQo+Pg0KPj4gRXZlcnl0aGluZyB3YXMgdGVzdGVkIHdpdGggcWVtdSBtb2RpZmll
ZCB0byB1c2UgMHg3MjIuIFBsZWFzZSBzZWUgWzFdLCBmb3IgZXhhbXBsZS4NCj4+DQo+Pg0KPj4g
WzFdIGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDI1MDcxNzA5MzgzMy40MDIyMzctMS1kam9y
ZGplLnRvZG9yb3ZpY0BodGVjZ3JvdXAuY29tLzIwMjUwNzE3MDkzODMzLjQwMjIzNy00LWRqb3Jk
amUudG9kb3JvdmljQGh0ZWNncm91cC5jb20vDQo+IFNvbWV0aGluZyB0aGF0IHdvdWxkIHJlYWxs
eSBoZWxwOiB3aGVuIHlvdSBwb3N0IHBhdGNoZXMsIHBsZWFzZQ0KPiBkZXNjcmliZSBob3cgdGhl
eSB3ZXJlIHRlc3RlZC4gIFNvbWV0aGluZyBsaWtlICJGdW5jdGlvbmFsaXR5IHRlc3RlZCBvbg0K
PiBNSVBTIEJvc3RvbiB3aXRoIGEgUDg3MDAgYml0c3RyZWFtIiBvciAiQm9vdC10ZXN0ZWQgb24g
dXBzdHJlYW0gUUVNVQ0KPiB2eC55LnoiIG9yIHdoYXRldmVyLiAgVGhpcyBzaG91bGQgZ28gZWl0
aGVyIGluIHRoZSBzZXJpZXMgY292ZXIgbGV0dGVyIG9yDQo+IGJlbG93IHRoZSBsaW5lIGluIHRo
ZSBwYXRjaCBkZXNjcmlwdGlvbi4gIEF0IGxlYXN0IHRoZW4gd2Uga25vdyBpZiB0aGUNCj4gdGVz
dGluZyB3YXMgZG9uZSBvbiBzb21ldGhpbmcgdGhhdCdzIGxpa2VseSB0byByZXNlbWJsZSB0aGUg
ZmluYWwNCj4gaGFyZHdhcmUgcHJvZHVjdC4NCj4NCj4gVGhpcyBnb2VzIGZvciBldmVyeW9uZSBl
bHNlIG9uIHRoZSBsaXN0LCB0b28sIGJ5IHRoZSB3YXkuICBTb21lIHBlb3BsZSBhcmUNCj4gcmVh
bGx5IGdvb2QgYWJvdXQgZG9pbmcgdGhpcy4gIEZvciB0aG9zZSBvZiB5b3Ugd2hvIGhhdmUgYmVl
biBkb2luZyB0aGlzDQo+IGFscmVhZHksIHBsZWFzZSBrZWVwIHVwIHRoZSBncmVhdCB3b3JrLg0K
DQpIaSBQYXVsLA0KwqANClRoYW5rcyBhIGxvdCBmb3IgdGhlIGZlZWRiYWNrIGFuZCBjbGFyaWZp
Y2F0aW9ucyENCsKgDQpUaGUga2VybmVsIGRvZXMgc3VjY2Vzc2Z1bGx5IGJvb3Qgb24gb3VyIEZQ
R0EgZXZlbiB3aXRoIGFuIGluY29ycmVjdCB2ZW5kb3IgSUTCoA0KKDB4NzIyIGNhbWUgZnJvbSBh
biBvbGRlci9sZWdhY3kgc291cmNlKSDigJQNCndlIG9ubHkgbm90aWNlZCB0aGUgZXJyYXRhIGlz
c3VlIG9uIHRoZSBGUEdBLCBhbmQgd2hpbGUgZGVidWdnaW5nIHdpdGggcHJpbnRrKCkgd2UgaWRl
bnRpZmllZCB3aGF0IHdhcyB3cm9uZywNCmFuZCB3aHkgd2l0aCBxZW11IHdlIGhhdmUgbm90IGhh
ZCBpc3N1ZXMuLi4NCsKgDQpXZeKAmXJlIGN1cnJlbnRseSBzZXR0aW5nIHVwIGEgcHVibGljIENJ
L0NEIGluZnJhc3RydWN0dXJlDQp0aGF0IHdpbGwgYXV0b21hdGljYWxseSB0ZXN0IGFnYWluc3Qg
Ym90aCByaXNjdi1uZXh0IGFuZCBwancvcmlzY3YgdHJlZXMgb24gb3VyIEZQR0EgYW5kIFFFTVUu
wqANCk9uY2UgaXTigJlzIGxpdmUsIHdl4oCZbGwgc2hhcmUgdGhlIHB1YmxpYyBsaW5rIHNvIG90
aGVycyBjYW4gZm9sbG93IHRoZSByZXN1bHRzIGFzIHdlbGwuDQrCoA0KQmVzdCByZWdhcmRzLA0K
QWxla3NhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
