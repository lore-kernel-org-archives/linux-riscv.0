Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2429C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RVMz8tYLSBhLFaxifgkQHKn7yr3ZHq3gv/e9gDW7pE=; b=GnvzJ61TefjO3Q
	1S1MWuSdfmTomKDed+gb7/dqkMWbvYh8JpAfWhNhdD2OuQuZKhOcZ1qIMVK7tEbCXjlJTdh/GO52p
	vj+7wDzmX4RgET6+HGJHe/yiYGFLPkhxswbZbEu+XpArygG1zN8BDZWeBvifWB9H/zBOVoLaHw3SB
	rlod7D3JrDKHfJ5fmSlERt/ZyTCsNQL7R3I6RhPDeDP9n5BqGzRX3uCiL+QMZrlcQs6cww809fF3G
	OorDRJ19YQD2CSKDfUc6Tik+axK00xIlk3CjOSSx+NKYFwT7UhxQtrOrbKqtLxbgKFVD8nnE2W0l5
	/xEd9imLlAbP1WX5XAQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr4sf-00Fy2F-Pe; Tue, 17 May 2022 21:37:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr4sb-00Fy0Z-5g
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 21:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652823440; x=1684359440;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9Bejrb2N5XRimr02nG/zPZW0Sjj1KgzLlZgRkmPturw=;
 b=OuVIzXIoUV+8XLuriCPt64EFtszd19iLEH3UvTzPqkndyxuLmnPjXjgi
 XWpPrav6/yPxyVqQGA0dDWdcFXRYbmNFW/Ngkbr9SuB1ihGuBVCGK0mUs
 8WI/Z/2dElww9y8M/QwanSIqhtIyh/vyVmdr30L+a5VjebLl25Op8Gz1n
 dMyFYteV+GhTVEYKndeogl8tcp28FQjntLkTaP495uL3VuybSKdqiJ51R
 NTSS9vaDiEaAT+yQSd33LcYMvYn97sAY10nRtIbCbfmFl2KGshoJZPyDl
 u902vw1YmDNeMihiaMUq1UlRvkZZFYXOce4MiCzl+dEPmJ92WrajIigLp g==;
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="159486023"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 May 2022 14:37:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 17 May 2022 14:37:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 17 May 2022 14:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5Snft4EGqjZEm1wM7WC/4XL6xl3dyw+iCPTZaW0regPTQc2r/I5T2xskGxHOrOjQH7u8V9VTtBscWMweH3OB3pemHKHRc+nDww/vk0hVMmP6URDp82BWFMKDMZ+6COrlCJ3+xjpNYUKHaGYvtPRDChJKzMST7pquzMP0n5cHvfqIz5YSgaPgaxsWLAeHJGhRt9Tf2zSGS+npKBmnfeEhFtz9kzUQ8CGKyRuhXah7oJ0YNdEZuc3lnyyVC8OUXs/RC+lVwmS/iG4MvGBw5qMIe+KmNNC5ZNe4FodvYE5ZQKCpBtsWX/KpGknXiDpMP/3O1o+X95y1d3iuVyrFdu2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Bejrb2N5XRimr02nG/zPZW0Sjj1KgzLlZgRkmPturw=;
 b=nCX0jwDnXblV31fQmd5pqiE83ulqhxKKhLhmHrUnwNLz5xE2ncVeL4hIL4KUEf8tR1QX8yOUv8os6vGC9wBkIHTsgZ2TpJ3UFGInHjoLYj3slwdUa7IPUngaMWvUq2KoQ4rMR6nds+AP8jxXgHC8kjxeRTlOR0ERqpvfHYnU6JhNpkzEKkp5vKJYAtopeYfC8Fwss9SY6AvGdGqUD6N8TvEvzsM+M7ttfZK4rzbQQwt8mHOEJocWsmTMFoIU7A0szn7gI7NLfuC6m9D91BY12/m0hA3ECqHLrTW1za/9u4rmO+ueyD+hE5mpsUCJUNXnAc+WnIgYYuYNyeh/XN4wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Bejrb2N5XRimr02nG/zPZW0Sjj1KgzLlZgRkmPturw=;
 b=Z9V2gAFiulsx34XCOGQwbmEQVcWZe4+u3akDSrwh+HCZb4j2PFesYtY4kSWBx40FxusLCU4Cu2bCyEKQFpyZalqX4ZyVpbICvl+0fWR9NR/3vO1N3h4bM4A52GiCswhP5DkVV0qZDh+UzshvdxS82oL+ZPDwkwgVxEVyGqotFIw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4288.namprd11.prod.outlook.com (2603:10b6:208:18c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 21:37:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 21:37:10 +0000
From: <Conor.Dooley@microchip.com>
To: <alexandre.belloni@bootlin.com>
CC: <a.zummo@towertech.it>, <Daire.McNamara@microchip.com>,
 <Lewis.Hanly@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] rtc: Add driver for Microchip PolarFire SoC
Thread-Topic: [PATCH v3 1/2] rtc: Add driver for Microchip PolarFire SoC
Thread-Index: AQHYaP86qvMrzg0sT0yoCeeD82E3M60jkrUAgAAH0wA=
Date: Tue, 17 May 2022 21:37:10 +0000
Message-ID: <1e438d33-45d1-d126-2c0e-5f6b00d3c979@microchip.com>
References: <20220516082838.3717982-1-conor.dooley@microchip.com>
 <20220516082838.3717982-2-conor.dooley@microchip.com>
 <YoQO9or6g2r3EU8w@mail.local>
In-Reply-To: <YoQO9or6g2r3EU8w@mail.local>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e119e5d0-0c11-4784-5f18-08da384d6641
x-ms-traffictypediagnostic: MN2PR11MB4288:EE_
x-microsoft-antispam-prvs: <MN2PR11MB42881186B93B92A47FE897D598CE9@MN2PR11MB4288.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HnKTUuuiTrO1mQdykt2YQBjeBkyRQZyUnOOwlNJd0nOdnOyjUUGUU9JrpBdFgj7fqU+WcLz1qfC5lqVIdu9t6+madN/tjJql+FdmxjAeyETu3/+RdJH4n7NqE0AgclpwwNRkWFAuJC3/gj+b7BU0GlRSX+w3hjeGLGhX9xKKLiYcqrdXQaXiP1u3LdS7rg30yrkSY2D+IKu9qFmil1ZCkHftcIa475Y74ChKdIucRbc0rm8WP/FexAeMGqhd3S1/MRtP/r3W5hqpiDevyU5ayBQtjYLZYTgtFcSlkZLrxtNjjr5P/1Vnrxfb8VOVPsZAtstEhsrK+MDSigzmuURI3ZRlMQhCHSUjaQtmgg+bUgVkoqn4SnLvg4nh2NK2myZHq1sBAv0mZ3UE0AWkxQRBPFvQNDk+CkS9sSPwfVrVyRZgBd3VDjNFUgbZscbDQirmgE4JeIEXyNniZ1PvnMQN60HbuH8eBEslFgrNgMsCsu8NNrepZlKRVxFgLqtCTX542lGr9zFXq0wqx7HuX553yRZs1j/MGGLPYDPBzvLIalLwCrTN85LEaiAYIjDmZzuF9yRU7eNg0aVon9hhl0HYhc07tYjSYHihqaqPBGJNd0XOGY3hQTcx1Fe0mdWeqtVp4VhFNOZbgE3m4l7BLf1m1LopM5xwEv4egEEy9omfp9N7JluhE80wLritmAOxXkZE6RX1rmEYpF8uKVidj/XMptkhORPni79oW+uy69gdN3+mRbFVTvcEC6GaYhternVrh/tSabgwULzlljBsDOllpqRws1UW4Dye38X7XEqAtqfJYbe5ypqCt8UDs5QhGDIF9nmT9Ka5JLESQVpaYeHRK03KfPsi6k4etLRq+RMZGk8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(2616005)(53546011)(26005)(186003)(71200400001)(83380400001)(6486002)(38100700002)(966005)(5660300002)(31686004)(6506007)(8936002)(508600001)(36756003)(8676002)(31696002)(86362001)(2906002)(66476007)(64756008)(66446008)(4326008)(66946007)(91956017)(38070700005)(66556008)(76116006)(122000001)(54906003)(316002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDg1ckJ1Z3hGWGs2UndsZytyeDh4SUZTUkkwNzArUWdaV1RMbEliNHFxOXlY?=
 =?utf-8?B?Nm0yWFovU0RuVWRBbDRiQWlDTVl4YWpnaGJZTUV3aFo3YXZ5RmRuT0VMcTRM?=
 =?utf-8?B?cEpmZitJNTlFYlpCZjh2UW9hSC9zZEJzM1BHQ2h6U01MM1V2d1FTb1Z2bkpi?=
 =?utf-8?B?MDJSTWdHU2R4NWcwVjdCVi9OdHpQa0ViVG52VXY5bXo0NEc2c29KbGVoZFAr?=
 =?utf-8?B?ZlB0Y202S1VnNDNmS202SVlQTm1XaVJlbG1IeEovMWh6a0dZSG8yakgvVkxZ?=
 =?utf-8?B?VzlXSlE3Q3lJaU0rVm5oQXpEVnd6UHJxcExyeVZYV0I3cGo0SURPeUxQejVJ?=
 =?utf-8?B?d1J0Rm11dVBmR1NiR3dxOVd3b0dtWEFZS0d3ckF1dmNZWUVkWDVwRFhtZ1lW?=
 =?utf-8?B?ZnB1TTRzdGlCUDRLNE9oaEtTTUJ3TGdmYkVzY3Ridy9TYkFHOFI2YTFGTEor?=
 =?utf-8?B?SEpaWUFHbE5iM0ZISEc3MyttQUQvbFBmZ0RhenJmUXZMYTdqeHZFV3g5RFFQ?=
 =?utf-8?B?S1J6NVVDd21UNEhCZXMzZ0ZFYmY0NWxjdUsxNkNxNmtkQ3JJaGl4a3RTdWJU?=
 =?utf-8?B?eE8xWFpWa1dGTnpySytuMWcyNFhUSGkxeC9GOGFxdlo3akFkOE5OMktFbzR6?=
 =?utf-8?B?UExoc0ZrSzdudzdMK2Z5NzdaV2JXd25VajBLWmNWblBZZkJkRWU5UkFSamV6?=
 =?utf-8?B?NGJ0RFFyeEJEdzhSdFhPV24xcGFBWTBTTTUvTmJFRTI3NysySXZULzhNbWtr?=
 =?utf-8?B?OTUranRIZGx3M1dvQ0hPR3RmR1pzRWZPOTlXS1h0NGZOUUE5amlJTmtZaGVi?=
 =?utf-8?B?emc5MmxJRTZlZUlvQTVzd0NueTBhL0l6NWdXTFZMQi9GQzZCcjBlYUc3RjZR?=
 =?utf-8?B?dnpqYXdRVFlVTTdDK1hRSE56SG5jZ0EwQzh0aFJCZkpuRHdYQmV2ODJSMlBQ?=
 =?utf-8?B?eWdUQTR2YkVvQXdxaGNiaG9tUFhrdlpPSmplSnhRQmV5cXIrdkdwU0E5aVdt?=
 =?utf-8?B?YnJGenJDQnlvb2djZ1ZnU0hCaXZoZHkzSFZ2NlVRb0pjUWJZb1k0NllRYnps?=
 =?utf-8?B?WEN5aWwyWmJXSGlzU2p3aTBYZ3lianpvU2ZSK1FCNktBWDdvZ0l4WGR0SSsr?=
 =?utf-8?B?YmZYa2ZiVWpDTnpZcm5icVM1Unk1a0REbzFkZXE5SjZrS25hNUxuNFNTb3Fw?=
 =?utf-8?B?L3h1Zm9YNjZSdDl0cjJ4WUlPUlNzaXNueEpzejNFTEJMTlJRUlVPd2tJZFEx?=
 =?utf-8?B?ZTVxWk5nTTBHVlFjOGxFUytZV05ya3hQNjh1YkZBUGNwU2xQNmZxL3FGa1lv?=
 =?utf-8?B?UzVIbGkwYkI1V0kyUDMvYmxJL3N0MElyZERvSVNjMzFMa3Qzd2gvcTVJb1Bw?=
 =?utf-8?B?ZmtCa2pRcS8rUGZRM3JDcFhRelp5YzRUSmgvMklmYndoR2NRUzVqMmtjTkFX?=
 =?utf-8?B?QThCRXp3OHV4KzdRWGhSRWlyUG9SYVNPWktJUjBTaEN2OWxvTG5mb2wxSlhU?=
 =?utf-8?B?dXd3NTJxaDNaVjFrOXQ4RXFLcEdJTjhsbGZyNTRLL1JqNHNxSjg4emlLQm5F?=
 =?utf-8?B?cDNOZDJSVDFYWFpiTFM4d2prcXhzWkVESFArTm15VmRYTjNkaHVQWTRxZ25k?=
 =?utf-8?B?S1RWMSttWXpKUVAwTWFzOWphR1FqampackJWS1dWOVZjYmJBYmxNamcwQWtK?=
 =?utf-8?B?SFh0SGEyZE1yM1puU3hDQkxQUUM5NUE5c3dJdjhNRFFiWGpaNlQyWm1MNWhJ?=
 =?utf-8?B?Q24xYzVZbHZkRmsvamFFTm1VcWhNUlVOalZSUE9yTlYvNDMzY01lSGcvOXVK?=
 =?utf-8?B?TjZwQjJ5R3lIejBHYUdMM1RpMHBMaWpuN0x6Nlo0WDNzdDlRMTIxb2F5Rjgz?=
 =?utf-8?B?Y2pZNEVHbHVra2pwNXlDc1FhK2lLVCsxL0xzM2FyNE8zNlFlUmhSNUtxVTNa?=
 =?utf-8?B?cCtoeGthVEZtb3M1TkxESG9HVW5WdkZqMFl5K04vYW1xcUdLUWNsNDRUellV?=
 =?utf-8?B?QkZOUy9HT1VRYmttNXppRkRFWnhhdkxzVXFURG82alRFdXlvMTcvNGdHOVVQ?=
 =?utf-8?B?UkY3UisydTdndWk3ZXhKeDA3dWZyeS9oUEpqaDZFd1BWdndZU3ZCSFM2MGR5?=
 =?utf-8?B?QjZub1dvNWJwUmRxc0o2djBBcmM4NXZ1L2FZWW9KeUEzMmwxS29oRkFtYklu?=
 =?utf-8?B?K3pBSjVtei9uNENodnVTcFo1VUZPM2YwNjVidVlIMzdCd2JYb1dtVGpKVWdJ?=
 =?utf-8?B?NWRXUGFsMGxyNDhBS3NaQzNPOThrUWtzeFhvNzVRSHpYNGRaZk56bFR4QldM?=
 =?utf-8?B?bVlBczV3cGoxQlR0dWFPc2daOFhXYlZCUnJPd0x6RlQvempGVUYycUhIUFB2?=
 =?utf-8?Q?DG5oIlUUMv9PLmCQ=3D?=
Content-ID: <09B2A09AAA98DE4483FBC1683590D1B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e119e5d0-0c11-4784-5f18-08da384d6641
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 21:37:10.4919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6sB4Pbo3oglqgwO9iotWZ6z+JX57bPTqWpoFeBfg3lgY77dpiDruLxDzvSinpZgZxOxWJybF7KQFlMxyOMiuOkHxaCNsbgZcjQ6jVblGcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_143721_594335_C69D7E20 
X-CRM114-Status: GOOD (  21.73  )
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

On 17/05/2022 22:09, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello,
> 
> On 16/05/2022 09:28:38+0100, Conor Dooley wrote:
>> +struct mpfs_rtc_dev {
>> +     struct rtc_device *rtc;
>> +     void __iomem *base;
>> +     int wakeup_irq;
> 
> I believe this is only used in .probe so you make it local to this
> function.> 
>> +};
>> +
> 
> 
>> +static int mpfs_rtc_readtime(struct device *dev, struct rtc_time *tm)
>> +{
>> +     struct mpfs_rtc_dev *rtcdev = dev_get_drvdata(dev);
>> +     u64 time;
>> +
>> +     time = ((u64)readl(rtcdev->base + DATETIME_UPPER_REG) & DATETIME_UPPER_MASK) << 32;
>> +     time |= readl(rtcdev->base + DATETIME_LOWER_REG);
> 
> Are the registers properly latched on a DATETIME_UPPER_REG read?

It's a good thing you asked - I went to double check and these reads are
backwards. /facepalm
A read from the upper register will always be aligned with the last read
of the lower register. Stupid oversight, sorry.

> 
>> +     rtc_time64_to_tm(time + rtcdev->rtc->range_min, tm);
> 
> range_min is never set so it will end up being 0. I guess you can avoid
> a bunch of arithmetic in all the driver. Offsetting will happen in the
> core which will probably never happen anyway because the max year is
> 141338. I guess we will all be gone by then ;)

SGTM, including not being around in year 141338...

Thanks,
Conor.

> 
>> +
>> +     return 0;
>> +}
>> +
> 
>> +static int mpfs_rtc_probe(struct platform_device *pdev)
>> +{
>> +     struct mpfs_rtc_dev *rtcdev;
>> +     struct clk *clk;
>> +     u32 prescaler;
>> +     int ret;
>> +
>> +     rtcdev = devm_kzalloc(&pdev->dev, sizeof(struct mpfs_rtc_dev), GFP_KERNEL);
>> +     if (!rtcdev)
>> +             return -ENOMEM;
>> +
>> +     platform_set_drvdata(pdev, rtcdev);
>> +
>> +     rtcdev->rtc = devm_rtc_allocate_device(&pdev->dev);
>> +     if (IS_ERR(rtcdev->rtc))
>> +             return PTR_ERR(rtcdev->rtc);
>> +
>> +     rtcdev->rtc->ops = &mpfs_rtc_ops;
>> +
>> +     /* range is capped by alarm max, lower reg is 31:0 & upper is 10:0 */
>> +     rtcdev->rtc->range_max = GENMASK_ULL(42, 0);
>> +
>> +     clk = mpfs_rtc_init_clk(&pdev->dev);
>> +     if (IS_ERR(clk))
>> +             return PTR_ERR(clk);
>> +
>> +     rtcdev->base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(rtcdev->base)) {
>> +             dev_dbg(&pdev->dev, "invalid ioremap resources\n");
>> +             return PTR_ERR(rtcdev->base);
>> +     }
>> +
>> +     rtcdev->wakeup_irq = platform_get_irq(pdev, 0);
>> +     if (rtcdev->wakeup_irq <= 0) {
>> +             dev_dbg(&pdev->dev, "could not get wakeup irq\n");
>> +             return rtcdev->wakeup_irq;
>> +     }
>> +     ret = devm_request_irq(&pdev->dev, rtcdev->wakeup_irq, mpfs_rtc_wakeup_irq_handler, 0,
>> +                            dev_name(&pdev->dev), rtcdev);
>> +     if (ret) {
>> +             dev_dbg(&pdev->dev, "could not request wakeup irq\n");
>> +             return ret;
>> +     }
>> +
>> +     /* prescaler hardware adds 1 to reg value */
>> +     prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
>> +
>> +     if (prescaler > MAX_PRESCALER_COUNT) {
>> +             dev_dbg(&pdev->dev, "invalid prescaler %d\n", prescaler);
>> +             return -EINVAL;
>> +     }
>> +
>> +     writel(prescaler, rtcdev->base + PRESCALER_REG);
>> +     dev_info(&pdev->dev, "prescaler set to: 0x%X \r\n", prescaler);
>> +
>> +     device_init_wakeup(&pdev->dev, true);
>> +     ret = dev_pm_set_wake_irq(&pdev->dev, rtcdev->wakeup_irq);
>> +     if (ret)
>> +             dev_err(&pdev->dev, "failed to enable irq wake\n");
>> +
>> +     return devm_rtc_register_device(rtcdev->rtc);
>> +}
>> +
>> +static int mpfs_rtc_remove(struct platform_device *pdev)
>> +{
>> +     mpfs_rtc_alarm_irq_enable(&pdev->dev, 0);
> 
> This is not something you want to do if you want to wake up from
> hibernate or any similar sleep state.
> 
>> +     device_init_wakeup(&pdev->dev, 0);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id mpfs_rtc_of_match[] = {
>> +     { .compatible = "microchip,mpfs-rtc" },
>> +     { }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, mpfs_rtc_of_match);
>> +
>> +static struct platform_driver mpfs_rtc_driver = {
>> +     .probe = mpfs_rtc_probe,
>> +     .remove = mpfs_rtc_remove,
>> +     .driver = {
>> +             .name = "mpfs_rtc",
>> +             .of_match_table = mpfs_rtc_of_match,
>> +     },
>> +};
>> +
>> +module_platform_driver(mpfs_rtc_driver);
>> +
>> +MODULE_DESCRIPTION("Real time clock for Microchip Polarfire SoC");
>> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
>> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.36.1
>>
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
