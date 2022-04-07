Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A52DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qC0mKa8MMkhaIv91ihj2igW0csuIQ2alqCRZerj7iOk=; b=msTy7OfxU6tRFj
	IrXNcYSt9iYeYQL4bEEcQMI4LbaFA/gyLgftKFZpZmZJonFDqnhSn47Bw45uK2oRvZPZ/1J40BB7f
	ZXshntNpSitHRg9xlHSrgakN8THSTddWDUzkhT0O7nSxdw9f9Hpo8T1lE0ptJgVXv2CYExiapX9fd
	zwjWFCWbklr2v69EQGt9171MPRgitpJt89OPMwbthvAHmFK5IEf/H/BDlV3NYP9Uyx1Q23MnLLAJg
	hHSylPSFZ5ecB3l6LF1qX3ngWfbQKYiw3vh83jWmgxh2jIb/yM9Dwp7GIpuLVMz77P4fSZKucGlpg
	kvS70E7CYnLoS3JExvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncT9I-00CNSv-En; Thu, 07 Apr 2022 14:30:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncT9E-00CNQH-GN
 for linux-riscv@lists.infradead.org; Thu, 07 Apr 2022 14:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649341808; x=1680877808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Uwil0fpw8PsamtEm7r7EI0PmdgDUox9M7JqnohErTP0=;
 b=tn+RHCdHOpMPE7wmaBfS+eyETC5+h7i/4mXdmQyMJWyWZjskrbnVhOJf
 AleeJLcM6N76ISzRuyRzKfB/Ikhv+LEerjgkAyWDWW3nW45GE8dfWjYN6
 dlweCttnh6hnS18eI9fvuq1YJLHRE5ZUWhQ+OgsXhxW2kyGa0bz9Mnlro
 VphoGbg09aKE/mqWNMWmsz4zRzXu4UWpUWBfv4J50LkrhH14qJDe9I8/K
 k5xs8OpLgP9vvbOofkLx5RQQ5YqQ8t0aJKytEU/wRQNt6Pu8A0brppz3X
 uyHmlfnJ57RpFfcmgRLygUWTlBraCljF8Auj343ZUH1NMvHxa52QZ7kDl g==;
X-IronPort-AV: E=Sophos;i="5.90,242,1643698800"; d="scan'208";a="168808109"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Apr 2022 07:30:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Apr 2022 07:30:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 7 Apr 2022 07:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao/+Cnb9vL+s1CTPZkngFOF7OXHbHwJEgzB92zUA5h61vVWy10HPg3BRb7iCcR40AQGfOpk+CG5w2ituGbqDEX/GGZSZHrBv6ON/JNtAHgqBnlcS2WEz+VwvRUHl4+iJmGOQX3MoPJc4tjArSDYbSTo9xMA3UirSI44BuP2R+A0My6YWzqgPX0FXpw3Mv8aCGrR1bYy2dI60uP07jnTmpH95NN9aYk1bOgc+Yj5nfhTcimz52w7vOc43KpFWL/RLDgsqNwnEYFDuiqXrIB884AYkHr0ajqOO69tF2QPBicBKgl+XjZPnIVMqbptGt5ZWdQdJZK5LwpNyNszq3WVgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uwil0fpw8PsamtEm7r7EI0PmdgDUox9M7JqnohErTP0=;
 b=QCaMaAgMC6++N/s3YjMWxuObyfIiFvw48Kl0RY/m9EB6D5Yql0GAyj4SEEh6KByKNiNRcuHsLwItjML2LfNf/AbT1ZrWvlwIZhwQCNvFFJTw9f1rgdBbGWWFhzUaXwND+epKbxxb2EtKBecUA/EgmbHIBdfAhbSFkL7b9gM88Jz/ZjCcXk2m6omCCGixbEIRV4do664nUbOkt6fg6u6N5oVWw3sBntcAnXch+sy+z1wPteBu4dpx4dnlBCpri4I76IT2F0NCIvIaeo4G3uGg6LMZFFrUuxHBJQGji7xzqgHbJsAuNSx4e3Lssa+3fjGrH5FBCwYL/I/wH4s5aDN/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwil0fpw8PsamtEm7r7EI0PmdgDUox9M7JqnohErTP0=;
 b=LhcRv4eUOZl71/+lCwY+32zz/NMLdBtGbdgTWKH/RAkHFoDOP+lTtgqj2vM3NVYvMS+oNnnKANSkEIUmCCgwYVcWX+LCv+Q8Wrcu1b61NB0cWko5mBXJ3ccyomQiTqawYJtybn4HlB79xTgxTUlK8vlzogj1J63dZ8girLnShGs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 14:30:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 14:30:00 +0000
From: <Conor.Dooley@microchip.com>
To: <andrew@lunn.ch>, <linux@armlinux.org.uk>, <palmer@rivosinc.com>,
 <Daire.McNamara@microchip.com>
CC: <apatel@ventanamicro.com>, <netdev@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <Claudiu.Beznea@microchip.com>,
 <hkallweit1@gmail.com>, <linux-riscv@lists.infradead.org>
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Thread-Topic: riscv defconfig CONFIG_PM/macb/generic PHY regression in
 v5.18-rc1
Thread-Index: AQHYSO3IJSdXwoud5UqKTAwCCAurg6zhaxYAgAEl3QCAAfUCgA==
Date: Thu, 7 Apr 2022 14:30:00 +0000
Message-ID: <6411f181-88a5-14a5-114b-77b401683570@microchip.com>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
 <YkxaiEbHwduhS2+p@lunn.ch>
 <dd69c92d-dcb9-48e3-8ff5-078ea041769a@microchip.com>
In-Reply-To: <dd69c92d-dcb9-48e3-8ff5-078ea041769a@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83eab9c7-a51f-4c22-d0fc-08da18a31902
x-ms-traffictypediagnostic: SA2PR11MB5051:EE_
x-microsoft-antispam-prvs: <SA2PR11MB5051AD26C3C4351A0FB05CAA98E69@SA2PR11MB5051.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0d5tqlEjrk4k+AQwzSuYWsoV3kBu18Sn2bHe47ndT6OJcFCzyevMcnHEaGK1GnWtHL9PZ/tPeLz1slBzpIy2Qa1uMrCRFSZVvRfy+pwgD7BP4BYmUwC1BIBewSj0ZvaO4l5pQpXNMAYpw7VFopNS7d5Cv1EtR8UjGy3X+QdZHk6gDXfWipLfvg9ZBVXFcAR+MUKP+3oFDpsgM5NQqMZVy+Joh2oCDiodWDCfeWdrO8LfHdWlgDdNl9tCMcSnM2e7ImkdYenJwKlHqw9cnrAJ3StQ/iuFiZ8A9rHVhlw1gPn+svuPhE105uWz1L4ngPIj0b3N/sC9xDABxnRSv8Vmvoru/5yGCDVIzc/N4jgMxS8T8BklvHf5Zx8G3ozB8LGBP00Il62cJIuj+tjcnuwjrXFCArjBJNUpkmKwxcMzAANXLbEpCkugBsDuv+C9Whau47yH9/cjqJbmktQ8CH2eaUKEh9JFfZkTaZNW+jGeRaPmrR4G4N+2j3jMH3DnBUrFsDevUR2clPr+u4Th2YtNzaWjTZUp/ZPmmls3X2/gH85RzY8dL9jIBjc672uJxN4dq9FCk7CKsdJH5uBdp2hpmuhZJ9VvHwYUY737oMYKe2jNkdssz+km+275CaFe4go2SuFITxdETk/Q64HFdsfR601LQeM3p5NW5zuOeC+ahCwODlK0Zd2J9RgxL6CJqIdW5Wd371UTpFinYbHImb9zIWUEOlTvqR+9Q3fS0tu52SWxdgA2v6FzKGVgxLCiX9G1+DlG1XDQokUuvuwhh8YYtFIxfICI6w1+oKjcn7+YidE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(6486002)(86362001)(71200400001)(4326008)(31696002)(8676002)(91956017)(66446008)(64756008)(66946007)(53546011)(66556008)(66476007)(76116006)(122000001)(508600001)(26005)(36756003)(6512007)(2906002)(31686004)(186003)(5660300002)(316002)(6506007)(8936002)(83380400001)(6636002)(2616005)(38070700005)(110136005)(54906003)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFhMS2s2Skl6bjBrU3o3emswMUpvMWVjNkc0NGg3UmxvVUpmSlFGMjBaKytF?=
 =?utf-8?B?QVNnYmR5ZHlsekxHeDRYcDVuc3MvWW15MHc1c1MyWlRtdGNGTjJUQ3dtREtq?=
 =?utf-8?B?Tk1QVjNrcGhsTkxWanZXYlVKQXFCWTg3b0VYcExUOUdQbnNqeHZxZ2VSUXZL?=
 =?utf-8?B?S0YyOG1SQ0ZpZVNIRy9oYmExYS9HTVBOcmYzR1l1dkxaYXJIQ29nTHFOVlR3?=
 =?utf-8?B?amgzazc3R0UrVkIydzFaQk0wY2h6MFM2QXgwV21YenlZMEFJTmVCalhGNzZi?=
 =?utf-8?B?N1B4MVcxRDIxNE9TNzEvYkw2dEpWMXdvTDYwUS9MaDVmdmpMSjMrREh3R0JK?=
 =?utf-8?B?QTdyUDJ2UkNFcTF4ME5YYUVMaUwzWXZnTDdUN3JocTdqbEdwWTB3S3A5NG11?=
 =?utf-8?B?YzlvNzFISzFnbk5sZFJUOFVBdzg1MjFiMUlxKzl3c3BFM1pIMnRnaUVJNk55?=
 =?utf-8?B?RWk4alpoZEhEOFY0bm5aRjVHYjJPL0pNaGoyVEw5YWdCZ2YwN0Z3NlM5emF4?=
 =?utf-8?B?TDlyMEFWVndKRkZSM0NjcllHWDRvQlpYRHZmdHV6OWxRRUtUTGdYbGVOQ2g4?=
 =?utf-8?B?REZkYWpkZGtrNXhVZExUbHZTcmV3aEkvNkNpN0RuWjlFNC9adlQrY3duMWVp?=
 =?utf-8?B?UEVzeENKUUhMN2hTS0ZrM1BxU2xUQXVYbUxjbkdnUFhDd0lNMUNic1d0SWp6?=
 =?utf-8?B?VUlWVFZYM2ZjemJmOUpEa2QraFd5cFJoY09oaGU4a3kxV3JTTm5xcHhzNGV4?=
 =?utf-8?B?cXVOQW1sNE5WMkZhUjlLek02MkRqZTRQSnUxWnR5bFhhK01GWlNkLzFTVnYw?=
 =?utf-8?B?Z1pHajZRK3RoVFpKOCtoT2IzK3l2Y1daU1JKWG1GajcrUVkyMW5wZ3hucWNX?=
 =?utf-8?B?V1ZrYkJuY0xVN09tZTUwajIxSzVLRE9MNkZpT1Y5b3V2czFrdE5PWkEyQzdS?=
 =?utf-8?B?S2N2ZE9vV0VIbHAvRmZ1YVM0bGVHOXdrM1Q5eTRrRlhSNGhadUorLy9QVW4x?=
 =?utf-8?B?dWNGT0dPK0gzTU9GNklvS3pYbnVFZWd6NWVabklpMXJIdG84Z0JSYWlnclJM?=
 =?utf-8?B?Q1BiRnNsem5FUFdNbjRPMzU0UmxpRFJaYW9aYThrRlp3OXhsRXR6enRLMk1i?=
 =?utf-8?B?NDR2S2lkdGZtYmVlKy9jWXVZNW1XRjNVQjFrc0RmK1l0YWozU0dzZGRPS1Zv?=
 =?utf-8?B?Tll5VUFCYkNVMXN5NXdDNjVQazdoc1ZQK0ZDcFQ4SWdBOGVPR3pWL05uQVRJ?=
 =?utf-8?B?bk5HbmYxcXQyak9RRENwcFdFSlhMb3ZLSlQ4cnFscmk4MHN1RmMwc2FSTWNo?=
 =?utf-8?B?Uk11N0pLMk50VTAwOTFiN0Rad0c0THFrakhySHFER3V5WVVGWGdnaFloMXVK?=
 =?utf-8?B?NEFFV3N4aFpCYmxIbEprbVVJZTVOUHg3Vmd2cHlSUytyZktBbzR3L0t6aU0r?=
 =?utf-8?B?QjdZTVJWeE5ucVUwQ0dVcjNPdGtzYjhtYUN4c2tDbDRKN25vcmlldjM5VnBV?=
 =?utf-8?B?bUthWjJHT2R6V1V0b0RUdXhKaFFXU0RMNmZsbTA1NHhOayttTzVwQmhDVjcx?=
 =?utf-8?B?TmhGdnN4b1Uwa0taVEJrbFo2clhjSlM0Yy9ocFQ3UTc4Q29vb0FhbE1sdTdp?=
 =?utf-8?B?MzdRRGhaRDFNK1JpY0trTUwyeFo2d3ZXcjFvQXBtaDFTQTFMZ08wNFprN0Zu?=
 =?utf-8?B?SHVMbEh5SGVIR05GbVhzemRmenRDcUZOd282UFg1WVRMcXB1L0VhaHZyQTla?=
 =?utf-8?B?cUw1NkFKZzdjMEpNaVVia25oUUQzQUJIcmpkd2FwUDJlUFI3Z1FpbE04NGZi?=
 =?utf-8?B?NWMwN0V5NXNSSmxsOTd2b25hMDhWZ081alRHM3NXZXo4TUkzeElidDFWNzd0?=
 =?utf-8?B?Ym9idFpZSW1HWTc2WWJ2UUtRbmttbEtMR2NiMWZ0d0FWL1BUWEJxaXVpWUxs?=
 =?utf-8?B?azBONi9hTWFRS0lVMHYxSU1yY21oeVg2bTdaNTVWSlRZVWF1T0k3MktWVG05?=
 =?utf-8?B?aEsxZ2dSQm1kY3haSDJ5NnN6M0RrYWN0YjhJLzBOdllsU3lmU3FQbm1mSFZJ?=
 =?utf-8?B?ZDJvSjJsdGhtS2lkSWlwNlJRaHdjUXp4cm02cUh1aFZvYXlrN25HRWpZYTFO?=
 =?utf-8?B?Qm1Sc0hzRjl3S2pyWUF3Q0tZMmZUMVFBcGxkNzdYTlI3SldjZDR3V2ZaYnZy?=
 =?utf-8?B?UDNtM2MyN0lPaWpqUW5sZG5xYnhxTGtHQzVhcjJQak5RYlQwVXkzZStSNTk0?=
 =?utf-8?B?aStnMWc1SmZkTm5lV0Q1dk5EWFZQNGdVd1NEdWFySGNUcFY0V0kzTnQ1N0Iy?=
 =?utf-8?B?alI3K2FndUVzUUxLSm8zdWt6cFF1eTJ6QU1tZGJoT2thRDFOSTJBZz09?=
Content-ID: <61F5B57789A7E2469C20C37FBBE4B150@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eab9c7-a51f-4c22-d0fc-08da18a31902
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 14:30:00.3447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB3bdIqKREkmlzGl99LhXo0elINnVzxjyeC+tx0cGv+RLHoNZwyEhEu44FA+Dyzjr+mzgYsDJERhNfREJh7qNDDm8kO2+qRvfzpGESCU8Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_073008_793357_98018D09 
X-CRM114-Status: GOOD (  14.24  )
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

On 06/04/2022 08:36, Conor Dooley wrote:
> On 05/04/2022 15:04, Andrew Lunn wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>>> [ 2.818894] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
>>> [ 2.828915] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
>>> [11.045411] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
>>> [11.053247] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>>
>> You have a multi-part link. You need that the PHY reports the line
>> side is up. Put some printk in genphy_update_link() and look at
>> phydev->link. You also need that the SGMII link between the PHY and
>> the SoC is up. That is a bit harder to see, but try adding #define
>> DEBUG at the top of phylink.c and phy.c so you get additional debug
>> prints for the state machines.
> 
> Tracked the state of phydev->link in genphy_update_link, never saw a
> value other than 0.
> 
> Using the debug prints in phylink.c I got the following:
> [    3.230364] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Vitesse VSC8662] (irq=POLL)
> [    3.240682] macb 20112000.ethernet eth0: phy: sgmii setting supported 0000000,00000000,000042ff advertising 0000000,00000000,000042ff
> [    3.252783] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
> [    3.259892] macb 20112000.ethernet eth0: major config sgmii
> [    3.265526] macb 20112000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/Unknown/Unknown adv=0000000,00000000,00000000 pause=00 link=0 an=0
> [    3.279249] macb 20112000.ethernet eth0: phy link down sgmii/Unknown/Unknown/off
> 
> I couldn't see any prints out of phy.c

I think I have found the problem. While the SMGII clock is not in
Linux's remit, the mac clocks are. Without CONFIG_PM I see
the following, where 5 represents the clock for MAC1:

[    0.907959] mpfs_periph_clk_enable: 5
[    1.312955] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
[    2.660376] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
[    2.670400] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
[    6.789474] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off

With CONFIG_PM, the MAC1 clock gets disabled between mac and phy
bringup. 4 is the clock for the other MAC:

[    0.932598] mpfs_periph_clk_enable: 5
[    1.327876] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
[    1.473632] mpfs_periph_clk_disable: 5
[    1.503327] mpfs_periph_clk_disable: 4
[    2.999528] mpfs_periph_clk_enable: 5
[    3.000300] macb 20112000.ethernet eth0: validation of sgmii with support 0000000,00000000,00006280 and advertisement 0000000,00000000,00004280 failed: -EINVAL
[    3.018612] macb 20112000.ethernet eth0: Could not attach PHY (-22)
[    3.143594] mpfs_periph_clk_disable: 5

However the clock driver is actually not only disabling the clock,
but also putting peripherals into reset when the clock to them is
disabled. Removing the reset gives:

[    0.934717] mpfs_periph_clk_enable: 5
[    1.326564] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
[    1.473155] mpfs_periph_clk_disable: 5
[    1.502805] mpfs_periph_clk_disable: 4
[    3.006384] mpfs_periph_clk_enable: 5
[    3.007691] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
[    3.021409] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
[    7.114710] macb 20112000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off


Thanks for your help in figuring this out, looks like the problem
is mine to fix :)

Thanks again,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
