Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8C3C32771
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnDLiWr+TMX1+oJQAX9FXlHhO2vkW0ZYBn+1n7MEFSs=; b=kSw0qLfp/QyN3F
	e5ltt0eayzus8obzi1IrNqkuEjxBT7YOn5tCl9qXfIEiAnghqxasM3JMxwrNA6hqrtqEU4D9pLH3X
	v8ua5maJK8dJMw7m4BzTMbt2YLnnm9UP/93jCDYerKsYZaOS63h21RacZpJKdkT7ZrZnHQI+99JDG
	DcvK8JlagmnApSHJeoh3mK39sMZjZDY/X19VJw/VzTKIVQBqNcPTvlq4qzC+OqUyKd0joHUdJsAF+
	S0hRd7ROcY/e2804F3uddAFbm9Z2Y+sq3RS8UKg6xzUjV3uqfsExnJrsIEuFTHvjtVCnrEDbiz/6a
	j3g82ZplB6Lp/SM/g29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsvD-000M0y-DT; Tue, 16 Aug 2022 09:31:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsvA-000LtH-K5
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660642296; x=1692178296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cvl7F2wg5OwirEutbUrVs3ANWA+39erQI1g0eloiahs=;
  b=ZUzZoY5LRiiBqG9tNSbnAxj1/nPCKkGMEYQySabYlu3+CRU8BTGuocvs
   oNJckqE9fnGP5GQx4h6cC77PHG2Ip8FWmg9l2UM91A2oSnVfPZ/p0CYWt
   RBU6fwRUJlUpFPm3d26Xd0xFAPd6OkoG6P5k+5MxcnrTde9KE9dlFpPe6
   ZgTkN2UtsvuI1sBkRqHxmY+9TnfFO7xgJA8BbOQLEFDI/pumKb2KgOYWL
   kNYHgK+JYPoaR1BxLHwrvf/w/dto71/qI0AIKgaw1h0bTkwCc/d5sp41l
   M2RMtsX4Q0feoWNWY/TdpHPd31a3Uvl1aI3NLpGcQBQfAYvGhcpxIinJS
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="172638935"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 02:31:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 02:31:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 16 Aug 2022 02:31:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1v0PJ3u7owO9YwmoXt8yFLNx94q9SwEXlOGp7RECxtMHXxAS2hj3rj4e1z8/XCWCdSiRHB3xDyKegIv4Cn1RIBZCVvg1S3eFZJ/2G+cb+FL15MFP+222iKJbjgs+diqQxsnpk3HL1+4nzAnsbDeY4QTkQobsU3B7qsObCKjrzIJxTAkI6QHZ7otMEly9pehKGvHZmgGBJZX6nzztEchBk3jSGzzBrHqv6nsX+tYvz8IhrzoKwH/odebpqyA2yoe37P8jOv8gnFJp/9r8RsmD5W84XttRiGDnlUHxgISlgewKNUeqkbHfDt/KCaH3MZ1S9Rk/Uy9H7XrrWkZ0o/jhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvl7F2wg5OwirEutbUrVs3ANWA+39erQI1g0eloiahs=;
 b=WDPn4wfuvvLAMVxCI/Kh1JmBCAYAARw0JJfOJp3z3eoKxy4+mA0X2BG5XQyAiq9ufGqrxvpIb2hsUuusJz2a9eW3LSGfGTcsgnAQulXkDNgtVNxNv4pOWJQ3J9p+klalHg01yO1j/9Fal/vZP5qns0Uc6/oZjWc35daj52F4LxBY+UNxtaYZYmVQTlgxEw/L2vuOxcLCnZuHUVTFFaXC3sZI1x3tjudw1OMokl4IxU9+ewCv+TTN7t9nz1/LO6JaenLCBLslyzVZ+HbQXqi7NZwRFKAxHQl0tHKPfFptOKvcXyCLDp1z7QdTOXsYtkRwzLmhnChsk3xp49LbnXZqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvl7F2wg5OwirEutbUrVs3ANWA+39erQI1g0eloiahs=;
 b=S/hzsPnhQI0lITsm/mdA8jG6boHhKPvc5Nn7k+ccunhm0mXA4PT7J0sE887csMS7MIusNobtEiKRbnvzvXW8OGznqFY/KDbCvEFrWaCO5nn3mQXE8fowTsUqGRtw3meBkslihpqoyNhMWGL6mG+U+eAdB6cXOPKDdUMvFjGU+JU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 09:31:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 09:31:23 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
	<palmer@rivosinc.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<masahiroy@kernel.org>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq2xgzyAgAABI4A=
Date: Tue, 16 Aug 2022 09:31:23 +0000
Message-ID: <d1c1e2bd-39cb-4927-ac0b-22583ac7a420@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <d6acd450-a3bc-d5bd-eda9-9664e6beadf9@linaro.org>
In-Reply-To: <d6acd450-a3bc-d5bd-eda9-9664e6beadf9@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d46bb0f5-6465-40b1-35db-08da7f6a15f8
x-ms-traffictypediagnostic: DM4PR11MB6455:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?NXJiVmY3NWs0OUNBOUxoOVlXYzdYOU9CRElFNjZYeHFmMjdITXY1TFZlM05H?=
 =?utf-8?B?SGplUkR5NEZrdVdUb3FabWtIOFgxMG9Pd0kralVIcGZqb0JLNktLRCttS243?=
 =?utf-8?B?Sm9VQlA0UFlINDM2blQwamN1Mld3aVErRFZKNytZZk9uUGxUKzBGYlVjQklY?=
 =?utf-8?B?a3czZWJlSXI2SWxyM3FXTVRQZWJmV1hIOHdENnRsSlZlYXhua3JheFQyTE5a?=
 =?utf-8?B?TDFzS1JzNVZJU2R6aWlpeWd5MjMwdG9mUFFhVmVGYVBxYUhvajV5bWlSak9C?=
 =?utf-8?B?eFpMcjVXZmZqN3NFaTl4WGRMRm1kOFFNQTN2QjkrVjVob2t2L29ZdjkxTTdq?=
 =?utf-8?B?Y21XT3Q1Q3FjbHN0cFJVY21qYkxuTG9ZdHJPR2VydXgvNjVKbjUxQU1vT0J6?=
 =?utf-8?B?d2VJRFpjYVdGVWZpSDR4RTBra2p0RE85SHNlR2pRUy9zQklPUlk4RkVrVFUz?=
 =?utf-8?B?SnV3WHR5WFhhUTk1b2ZieVhxQXpWdDQ3eDFGcXNLQlVSZG02THh6YWRJUVJM?=
 =?utf-8?B?Z2NiK0tJQ0o0RHVUUFd2NFR0R01hNGtWZDVmdGVZTVdhSDc1c2FHQkQ0YVFj?=
 =?utf-8?B?S2tjdDUrV2tJbElJQVlTZXMvZXF4V1UyaUZYMEw2YXFJbEwzY2lSWUw1Mklv?=
 =?utf-8?B?UDMrMUd1S3NiV1pRQlBmNHNOUzg2VVprV3VCZkg3ZktXTGp1Y1RxZXNwZG1K?=
 =?utf-8?B?RFZjdklXYlVqV29yTVcyMTUxdjZoNmg4c085Zkk0REJaOEZ5WWkrcjNMUkZl?=
 =?utf-8?B?T1E1bU83Q1dHQUwxMXEzbkltdlVTaUFrbjhQUmhqdndGTURPdkIzbTRGU1c3?=
 =?utf-8?B?SEMya1hwWjBwaWowMWZqZkdTNDRCRStHRmJCTWtKWEZ6RCt3L2M4UlJaQWhD?=
 =?utf-8?B?UGs4SzVEcHgrTEZ2RFNJblZkMFJORTBESjd6VHRtdjhpaVhHdTU3aG5meWYr?=
 =?utf-8?B?VVJ0RDcrMXpxT05ZOWhmZURtUEU0czgvNmNUSjk1WjRXaFZMYXhqMnUzRTlJ?=
 =?utf-8?B?dTFPdDNvRHZNZ3JOT2hVUVEzZzR4NWhubjduOFc1TWthVU5yYStmb2hSOGZn?=
 =?utf-8?B?ZUdzY3lUcDhwcmt1UzRkN2NUK1hoVkM1N1kxeFlaSHRINWwrZWtnWHhSNkkv?=
 =?utf-8?B?RjA2ejZxSHlsU0hsSUk0R2t6TU1iOFRMZWIyb3lITXVYcVcxRnA3QmI3OUdn?=
 =?utf-8?B?U0hScGVTaUFhWlZkU2czellOTHMxY1IwZWpjdTc1Z2ZGM2E5QmxaVFpJTmZ6?=
 =?utf-8?B?KzV5a1Vmc2VpNjFyMGVHc3VRWFhERHlKZVZlUTN0VDRUM0J1UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(376002)(366004)(396003)(71200400001)(4326008)(31696002)(66946007)(122000001)(6486002)(86362001)(2906002)(64756008)(966005)(5660300002)(8676002)(66556008)(38100700002)(91956017)(8936002)(66476007)(66446008)(76116006)(316002)(110136005)(54906003)(921005)(53546011)(38070700005)(6506007)(36756003)(7416002)(41300700001)(186003)(26005)(31686004)(478600001)(83380400001)(2616005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHJ1Ni9DV0x6ckpXS1FOOWhYbHArQ1B6bVIwVWp5WjlTUTk0bjZhYithQ3Jh?=
 =?utf-8?B?MTJ2UHdCYXdOWW1tZTkvb0pESFR2M2E5QnhzNk1BeUNFVnNrV2xiaUdmZGpn?=
 =?utf-8?B?cEU2UjVTaVRLMUhRQ250Z1cyZE1YanhOT0lsaU9NVGJlaEdiOHFKdWprTG95?=
 =?utf-8?B?a2loZ2ZWNWhya0Ryd2NnMkY4TGhsT0tyOWl2VENvMDNKTmQ5OGtvVmVSVE12?=
 =?utf-8?B?bFZ3bEo1OE05YjZ4b0U2bDd3YUd5RTNvSWY2ajFQZ0hHQmdTcmIzYjgwWkJR?=
 =?utf-8?B?dUxCTW50dStpd0hNclB0cTlFWmFmMFNXVncxVDBVOHd2b2k5dktCMlFhZFZZ?=
 =?utf-8?B?TkJQaTYzVzFYMzVyRnU5TWlDTXVQY0oxbEEwUTBMd1RXL3E1K05mcU1IeWN5?=
 =?utf-8?B?ZW56VWo1NGlRbWVxOGFTaXdrNzdqYkxwd2ozZjVvM2pUeDU4YkZOSXlwNmQx?=
 =?utf-8?B?aDUyZzVmeFBlMFRHaXcySklRRTg3UTFHeWV5Z2xxbWh1TlBNc3BCcjh1c25M?=
 =?utf-8?B?d0NJaGR5V0wzeVJMMzd5Q1Y0ODF2SHVaU0FKZzYzR2txNFdMV1I4VjQzVjlH?=
 =?utf-8?B?QU5CVDhKVkVtZ05KQlNpeHdpSjBLbDYxckswV2pkVlAyR0ZBYnkvOXkvMENW?=
 =?utf-8?B?TEg2UWVwTVRWSkFUSTUycUdhNHdUd0o4aWVZbTU3ZGYrNkNEQVcvZXg4YS9D?=
 =?utf-8?B?cmllc0VFK2RxY2FwUFA1dnk2ZldsWnErQ0VxbEZMZ1p1K1IvZ0NPZEgrVUpH?=
 =?utf-8?B?Q3FJY0M0ZC9RZXlWWWp1Z1d5aFloTnZiM3lrenJ0Qldyd0VvaWxydmRicTNh?=
 =?utf-8?B?VEkxVzhjUTJUdFJocDNaMWJZTDVpSWpiNUIxbllJaGk0YlpCeFM0TFpBME9a?=
 =?utf-8?B?eVFIdmp6YWhuV1VmaU9xVU0xWWZWNUNGczF0MmVsUVYzN0NFZm5PZU56S3Qx?=
 =?utf-8?B?Z29jdmdXc1NGSUNtVnMrczhqWFVrUFhBemZPVkI2dnJyUzRWb3c4OFlyYzBG?=
 =?utf-8?B?ZVpPcFlUSTg2WEp3d0paSXBFL0RxZVd1TTh5SUVobndHaE1UbklUc0U0Wmdo?=
 =?utf-8?B?bkJYbzNLOWV6bGQ3NWVFb2MyQmhNRXF3M3hReisvb3RtcUN3NW5vSEF6OW90?=
 =?utf-8?B?MmdXNzZZM3JKR3dFakxzTkUyMml6b0QzTWRJQnM1cW51cUlEVEM0bXF3RjBL?=
 =?utf-8?B?ZHV1MVI0bmJMSzhrc3JXcThxM210SVdtY2UzRUNyUDlwbTdaeFNIaDRYK2Q0?=
 =?utf-8?B?YWdCejU5SEwySWNsS3AzN3E0M3RDZVdkV0NuYWRtMVNObUhJQlJ0KzI0WDhr?=
 =?utf-8?B?RnFGZm1SazlVVWkvYVBxWUtSTW8yWnlZbkRCMDlDZ1g3Uk90MDNkNTN6bmtx?=
 =?utf-8?B?R01GU25SZC9XbFRCOGFZU1ErUlFjcGF2a1JReU5PZlRMNm1aTmpRZlpVQXJX?=
 =?utf-8?B?Mk1TUEtnOW81Nzd3amZiaStoT2pWclNmaWorQXdMRTNWdWJ1bWpRcmVkM21E?=
 =?utf-8?B?ZDVEWXhiSXFxWE1uek50THRLSW50ZGdHeXZ0cVljL2FjbE9vZXhhdStFQnJO?=
 =?utf-8?B?Y2toQnNyTHM0NzkrRkpqdngxVDhnSXRRNktrVnkyN2NwdFJzd2NtcVpIZUtr?=
 =?utf-8?B?N056MzZlU1lSRFB2c2pOUm1VakJnWHJLcTVvWG54L2dkaGVkUU5IUGRDTE0z?=
 =?utf-8?B?ZFE0WFY3bFZGTkhKenFEd0dSU0hhaWJiMGgxUkd2T0VkTlVsSVJoaks3di91?=
 =?utf-8?B?MFBVUFdDdkhDVmlmZytScDMydWhLYkF4emlTNUUrOVRiYys3L2wwd3FUS2dI?=
 =?utf-8?B?c0poOGc2UTdRTnZpcGtNZ1J2OWxIUXZxWW5neTJrWUVFMXdBVmFyMFQxak5s?=
 =?utf-8?B?b2RqeEJaWmluOUptb2V5OFRYYVRXZDlxa3NIblVpS254UEhOdktpS3YvMktQ?=
 =?utf-8?B?RHZ0S04zZ0thRitWUklEc0VSTVF5UjJQa0hDaE5UN21WUm1EREtuTzI5d0dy?=
 =?utf-8?B?WjhuNzZvNlhJWVZNZndhQTNvOE5LOTExRjlXSFZnQjFxT1RrQ2psLzM2emNV?=
 =?utf-8?B?bDZvSysrSUtPT3ZzU0RsdzdHb1JYQ01zNnhTc2hwb3o4d2xzSWJBQlhXWDQ3?=
 =?utf-8?Q?Zg7KHUuqP4YKw/heX6WxA3+RF?=
Content-ID: <AFD0A215B29FA340AD1ED976E0028589@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46bb0f5-6465-40b1-35db-08da7f6a15f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 09:31:23.7726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBAjfImDD+83rb3G5xlCAtowaH154LPgcCfNQrBa0QaBK2wnK8qgKQpL7x/R6yi6tgF8JeTpOZSp3gTnHxuiI4eUyq8yO8PXmTtXHkggOBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_023136_779664_3E2B8A64 
X-CRM114-Status: GOOD (  11.53  )
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

On 16/08/2022 10:27, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 06/07/2022 00:52, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The k210 U-Boot port has been using the clocks defined in the
>> devicetree to bring up the board's SRAM, but this violates the
>> dt-schema. As such, move the clocks to a dedicated node with
>> the same compatible string & document it.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
> 
> Does not apply to my tree. Please rebase and resend.

Palmer took it with the rest of the canaan stuff as per:
https://lore.kernel.org/all/eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org/

It is now in v6.0-rc1:
commit 727b05e46cffd74adca96ca13e57352339875586
Author: Conor Dooley <conor.dooley@microchip.com>
Date:   Tue Jul 5 22:52:05 2022 +0100

     dt-bindings: memory-controllers: add canaan k210 sram controller
     
     The k210 U-Boot port has been using the clocks defined in the
     devicetree to bring up the board's SRAM, but this violates the
     dt-schema. As such, move the clocks to a dedicated node with
     the same compatible string & document it.
     
     Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
     Reviewed-by: Rob Herring <robh@kernel.org>
     Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
     Link: https://lore.kernel.org/r/20220705215213.1802496-5-mail@conchuod.ie
     Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
