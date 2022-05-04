Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD24C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FjeoPN+ewVRBJyJFGctssDiBXWlaYeKwcs3FOdIEyc=; b=SjHq7qlxJxSC0a
	Sos0o/TRKrzx0zkqlhjAY42D6BBkHZQhgnnuAQcTyE1gtYKkV8EXNEl+iCc3Zd8OmGKshyd9nHExy
	C0L7NlozcQ1HWB+S+zTEFdYVBMUUYWhWhEZTmFSTaxRg55VkPGrSdOR56B+M0wCyu71uwzv0mvkbc
	ojAXLwNEhTGsd8UYhYC0WGHVgneIzXxCEBJYE7EfCD1AJhdN5Kvt6hNKyfAfB4jxsJB7pSBwgxLLE
	WjtOcbFZwUnM2BAC/7WlJusEY0qTGtgiGfi+2WuUz3Tnp+/4PPUPU6VHYDa+JzIlCVkUxFO/i7b3T
	YmenfcyMgyUK7q6BWvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmASZ-009ZUl-B9; Wed, 04 May 2022 08:34:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAQs-009Yix-Nu
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 08:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651653146; x=1683189146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=v3WCnAGga42ZIHUwmt8Z5sS81gBSoSAJ+BiGNlCPFDA=;
 b=sqm3iTAkg1FtY+20biwb7v+e8kNW5rpQWlM7qjAixmgdGzkNR9i4Fiyk
 EPOSWz/Pkavzzr4nZwz81VwdhNZ5zNcHaGruTz3gSgb3XvT2Zwt1GR2rK
 VODdVxi0/GXgMQ22pUEwSkJFZDFGgNlzyh+1kYlYSbL/eCWGPqOzPwv6D
 +jKS4m/wzEaeSgH/fCVsWuQMKBNZUrKTUv3dpggNKmjzeGUOVMGjCwBYt
 VkCrKy4SeeCfZyIT7BxiqkLEFyiVwjeYQl7/CJPmLGDSI4XzvdmZhByMQ
 rq+ynQ3nVzI16xu7vo6w2S+6rtM3aJSJYjUrTJiPNg+eteEi098wqn0p7 g==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="94500910"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 May 2022 01:32:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 4 May 2022 01:32:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 4 May 2022 01:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3xWODzw/rKbAaeSD5K6ZSE6W9VveidpvYnJl/Mp3L4suvBx1rYiirpvagk9969PVLlnPyBX58IeOIPui0cKBfsftACtC9+1w1j77MpVpdZz6QoQVYHAlRpyCW2Ck5a7o8VQJBD9NSkpiAaVg0UEIMI0aIAYU1XalKEsSamklxmPGJ8ihJqke/iY4ey0L2GMUJo4/j1+QpbBQPxLddCHTBpWjtLzsqwjyQaopa2cgWjRUnyQhsEoHzhq8uwdnmmaG79VCU3CuQqwOf5tILDw8ciVsUb5/UYLGJMTGvYH4Mji2DrWyfPr7B6l+7sela6pMO7AqBSLqq0z7juV04Q0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3WCnAGga42ZIHUwmt8Z5sS81gBSoSAJ+BiGNlCPFDA=;
 b=nw9Xp7nx/XXbKtOK3ulzQqukTmCsliwvkjgLGODSQnBBAWI3amB2RZAdTCDUkHL11RZ5MVY8PkfVftCA+AGf+PgFqKciVWpWZLJVULn58pyUZ0x/3+/RG3UhgaM4T1rZqymQCjgJwUIb8JqSYy3Q8PI1ZDyVz9InuFZupaWiaD20sL2i4zLkDdHs7g+STsK/1IJOM6+uVYMv983w4CLQR6udFm1S9mc6i5y2wKPRjKX6/iTP4wczeX5Rl1Gl1Juce5hPwFskbxMXRr+ItD4absB9rgfmP+68EBYF4YZhnsMCzPkzCKYc+3nw0CY1qiC2DT88DqMh8wguijdRHtNjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3WCnAGga42ZIHUwmt8Z5sS81gBSoSAJ+BiGNlCPFDA=;
 b=h/qCkjf2sYrc5tbkTn6euR3Apv/mn6YM/3pc6DxrHRggPVyAw2yIzCxI1v4ETHeHij9IEeqbUSj9a3FZaglrcMBd2j1Dqx+AOf3sZiNSWKCaon1B3UBWURPGT0aiV+owRowq1Zs8iRDwWjIZw9XG7kiviMVCG+pImT8BCA/edgY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CH0PR11MB5460.namprd11.prod.outlook.com (2603:10b6:610:d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 08:32:19 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 08:32:19 +0000
From: <Conor.Dooley@microchip.com>
To: <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>, <hch@lst.de>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for May 3
Thread-Topic: linux-next: Tree for May 3
Thread-Index: AQHYX5FrH/BqiZa6/06OwkWdFdBwhQ==
Date: Wed, 4 May 2022 08:32:19 +0000
Message-ID: <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
References: <20220503172926.08215c77@canb.auug.org.au>
In-Reply-To: <20220503172926.08215c77@canb.auug.org.au>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8180427-d4d2-4705-da82-08da2da89a4f
x-ms-traffictypediagnostic: CH0PR11MB5460:EE_
x-microsoft-antispam-prvs: <CH0PR11MB546025234E20C8CA6519186E98C39@CH0PR11MB5460.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0pzHRCTmRgEUzdcssZXWvqfcjJL6rICrfjKnh2fvtLGv7Kb+EqTfXr9s5+D4DGBr7hLwst5xobGrOd9l31x+T8EHWq146Kg96v5FmA3bi1NpjmiJ1wK7PH5oBvA46QvfTyAwDDomLECcfuaCIHHjRemR4s3nQZaLh778qnkmGAvnn+nSf+DGSb2vFqTa+7VeTeVQpcp7r3OgJxY9ghjkZHO4h17d8smCzh6I0gaPIocZXOnZW4LMBUEv5Yw1ERBBZcouG4cVl9tjCcLB+9P7Htz3uUZrJzSBB6FljFNiTxk3yUAONSVW9Cx4rwJ0o4oBuZ0DHcu9EuUeMQexeL2MSJf4XnqJE6k182amq+TXqqI8/PNrVVcFBMcEMWJuE52yNGbpjl55pdR+CTFlVXw+m/zV+LyhvZLcN7IwOLonMFJpc+rAH2B8bAh+07ShDw/sMct1MRSaBl1N35Ai5mJrHnAcU1MdajPGl1FYOc+qEJCWgbKbpcfF6Gw9egfdcw3rUErrimTRaYyyOx+dhDlPOKR9nwRsp52Us45RHhWff5paRgiH1/z9G/mNgGQD+fpUCuKGuqioVX291L24tCqlHZhv8rwhhVT+DXVb36Xj0LFGLxgLfSfli2jkeAwy66pOau2kAGOZBRNP7qbq0NUYHas2lpHixGGyUX1yXK7j5vGzqHLFh3Vsvad8GevSTcBIjhNxwYk3YCPLzWP9uPMqidJwpaVmp95SGrYd8IvMSvv8Cz9o2gzS+1b5/v11k9nNN1IPPUiSAulA+j7trkJHnlrj7gyStwoUwXrQenZ9FPlVZ/LP/s1JivI7TRPL5El7g8ggF9V8NV4Jklb1s+pYZJbKpFJ3yN8YuT394gvND/k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(36756003)(2616005)(31686004)(83380400001)(6506007)(26005)(8936002)(53546011)(6512007)(4326008)(64756008)(8676002)(76116006)(66476007)(966005)(66446008)(66556008)(6486002)(66946007)(2906002)(508600001)(86362001)(71200400001)(122000001)(110136005)(54906003)(38100700002)(38070700005)(316002)(31696002)(91956017)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blJ6UE81eHo1S1lQTE1BTEVrbGliS0Q0aXBYN1JUaEJHTHN5N1BSNjdhUjJT?=
 =?utf-8?B?KzZtdEdCS1kvN1Bxc3hnUjhiNjA0RS9peEpGVGlsbDg4OEJCV08zODd1MTV1?=
 =?utf-8?B?ZS9heFBzMHVFQ0kraytjTVpsaDJEVHp4QzZ2VFhSSFpBMmNCUXZ0WDg2UTVa?=
 =?utf-8?B?YmZnc3hmTmM4R3JraHo2UTQweFkzcStIbGorU1B5TjdNV2t0ZzIvOXJFdnpD?=
 =?utf-8?B?ckEybXZzMkFUUWMrZlc1MUc1SzkwbDNNNDVJM3N0RU5lLzFiYzZ2eUpwWVBu?=
 =?utf-8?B?aVk3Z0ZDTjlpMjdGSmJwOXAwcHFWR2M3TUlGTlh6U2lDWTVyb21xZFpUaC85?=
 =?utf-8?B?akZOYnNZa2NCWHBOVVRQYUdPaHVvUmJ2RjFmT1hQYnIxTUpkQzBORjVpaEpF?=
 =?utf-8?B?S0RyTURWcEZEMHdyNmdkMCtNakp5QXMzZW1oaDNHSHRNMEd4cFluVGRFbHRy?=
 =?utf-8?B?d3p5dVlsQ0ZnSS9Hc2hLOWQ5b2dHaENkK1hxYlU2MllnOHc5cmh6Yk93ZnNF?=
 =?utf-8?B?Vk81YkJwZk55Nk9DRWVzVE5hNXR2aWFjN1VRYUhrMTlSK0NEVzVCTEszR3o4?=
 =?utf-8?B?aXJKUWx1czhiSWQxSUd6ek9NaWpYT3ZQRTl3cjFsMTF6T1VMVEd5OFU2cjF4?=
 =?utf-8?B?YW5uNnBpcVA2WHp1UklsUVV6WGk0ZStwMzErWk1iU0YyUUFOK2Q0SURTbS9p?=
 =?utf-8?B?SGl5NWNmTURNN3ZuZjZEYTVNMmIyK1cwZkphWXR5OWFBa0Fla0ZzcUsvcmlS?=
 =?utf-8?B?TTZ2WlJHT3dleFlMaFduTWxXUUt4dk1STDg3OW5PM2lmMlZRK1ErZ3A1clpp?=
 =?utf-8?B?cVNKRDJ6ZmpLaFZJRlVpTW83VFZjckp5V0ZsSGR3QTZnZ2dhSkt4M1ZPTGNW?=
 =?utf-8?B?K3Rmb3k1cW9ILzV2NkhvbElIRmNlNjhDWlhtUWw4c21WQlkzdUQ4MVFEeEM1?=
 =?utf-8?B?YmswdlR3UVlYV1VZWmVHb2puNHk3NXZKeHAza0dkSWNpWm1MOUNWMlNQNzF5?=
 =?utf-8?B?RXFjWEp4Z1YwcUxjL0xnR3Z1QW5Zd2hzUTU0WklWdHY3L1VWTXB0ckd5aVYx?=
 =?utf-8?B?Ri9aOUZsNTBJMmQ3VjN1NzNSaGdzbWt2d21pOFZYMFc1T05SOVRHZ09BTXc2?=
 =?utf-8?B?UEd5QW96NVI1TVh4SmVpWS9SU1o5YVVTVTN1dTcvdyt5R2dNQ2xzb1RhcjEx?=
 =?utf-8?B?aU9LQVYzYXlKSy81ZTkxbHV6aW5pZ3RSRldtS0orcnF5cVlqYS9HZThoakVY?=
 =?utf-8?B?dHNYUk9ORlFnWDFpb2dTWDhoSzhrV3JuUmllYjVXQTdCTUYxRDY1WEZDVWZM?=
 =?utf-8?B?ZXJES2FSeTZrZ3dFYVVUL0o1ZkdKOU1hLzMzS0dxT0hBVVUxbHhKbXVyckR3?=
 =?utf-8?B?ZSsyWEQxZHFOanRPdm9HK21ZV21QZnpUajNTSHdaS3QxQk55VFF3cmxCQ2hM?=
 =?utf-8?B?L0Ywd1dQVkE3MmlITng5S2ovTTJiYzJmTXJ2MWh4Y0Q3UTIyQ0lheXdiNFE0?=
 =?utf-8?B?TFFHTXBUWmVtY3RCTlZhMmpOeDYrUlhqWVZqT1lkdDhpL3RzZDZnL1NBSjF2?=
 =?utf-8?B?dm9LTXRncGd1YWNUSlZhV2hRbUI1c3RVQ0JrN2ZkQ3VxSnNSREVzYnlrc0dR?=
 =?utf-8?B?aHZ5Mlo2YkgzSEI0TTlLNE5pTTBFWG45YjNWd3NZd3lXZGw2MGFaNldOaG9w?=
 =?utf-8?B?L1pUcXBqbEtPTndkRExFT2lQTmoyS3cwaEFRQnRmRXBFSEZPS2xqRzJvOTZC?=
 =?utf-8?B?UlA5MTdYLzlPNHRoTmJ5bXM2TnE5b0hoSHBSWHpWT1NLQ2J5bEtGVDVjenNW?=
 =?utf-8?B?dzJDUG1ZVmI4ZkErRmxQZVdQWXZFYWF1TnpISnkwcmJPV08rNVc5bFg0OFJ6?=
 =?utf-8?B?QVhMZmhJblpzeWpNa2dERVdHQnVySGd1eU0xc2lmR244R3N3TWxjNEh0T0tQ?=
 =?utf-8?B?aUdERVJBNlNIaW84UUowUXlZTHVQQWhTajd2ZUEyQzFDZi9wWDFuV0VGNVVI?=
 =?utf-8?B?aFJuS1hUQndhZldtT3pPR0FXQllqbXBMMngwbk82ejhQYVc3dHptK2psMzNU?=
 =?utf-8?B?ck45TzBia1B3elIramdLTGw5anhsSEI2ZjJqaU4yQUREMFBQMkFFcnNnN2FZ?=
 =?utf-8?B?Tlo4c24zaWZiRDhnU2R2RThhaVFmbm5IWlhad3ZXVEFEMjFVZCtBS0oxOGZx?=
 =?utf-8?B?b09KaFlud0hwNk5mY0hhbGxtdXR0R3A5TG9WNnNDNnV3ajcwRm1mSEUxUnkv?=
 =?utf-8?B?ZStTaHVMYnRqNEN0VGptTFN4cEVlTzlyRDF3Y1pUZmZzcVgvajhZaFlDSUdT?=
 =?utf-8?B?Uk45R0M4SWRQWWhlMFMzVFRXdTc2WHpZR0MvN25wWUI5V285MDhLdHZyTDM2?=
 =?utf-8?Q?rVTOtgFOi3ULguxU=3D?=
Content-ID: <A4AFBE06CD953F42B816A90E3CAE23B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8180427-d4d2-4705-da82-08da2da89a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 08:32:19.2558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPLw+Lbs7JWKfssjS47cvVbsR/l1pFN2gm8DDoIrOa13tKZHazzyvjtKhBdQhpdlys1Q9tiuY5D3rkILlZOMkM3zAm91CvbH96473JHSYPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_013226_968641_220DBED1 
X-CRM114-Status: GOOD (  13.66  )
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



On 03/05/2022 08:29, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20220502:
> 
> The input tree still had its build failure so I used the version from
> next-20220426.
> 
> The usb tree still had its build failure for which I reverted a commit.
> 
> The bitmap tree lost its build failure.
> 
> The mm tree still had its build failures for which I applied a supplied
> patch and gained a conflict against the folio tree.
> 
> Non-merge commits (relative to Linus' tree): 7492
>   8226 files changed, 410422 insertions(+), 168696 deletions(-)

Hey all,

Not done this before so apologies if I am not reporting this correctly.
The tree for May 3rd does not boot on my PolarFire SoC Icicle kit,
which I have attempted to bisect. The culprit seems to be commit
6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and
swiotlb_init_late_with_tbl")

Please lmk if you need any further information,
Conor.

config: arch/riscv/configs/defconfig
log:
git bisect start
# bad: [44a2f39e611ac0bc1f17c288a583d7f2e5684aa7] Add linux-next specific files for 20220503
git bisect bad 44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
# good: [672c0c5173427e6b3e2a9bbb7be51ceeec78093a] Linux 5.18-rc5
git bisect good 672c0c5173427e6b3e2a9bbb7be51ceeec78093a
# bad: [80a7d9b5288b4c5ad900c7716d851e5d285f6d80] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect bad 80a7d9b5288b4c5ad900c7716d851e5d285f6d80
# bad: [7c344e7d5be6b8bc9d753294878468cbba96af97] Merge branch 'master' of git://linuxtv.org/mchehab/media-next.git
git bisect bad 7c344e7d5be6b8bc9d753294878468cbba96af97
# bad: [7534d13c1fc508697ea76dc1c403151465ba50ff] Merge branch 'reset/next' of https://git.pengutronix.de/git/pza/linux
git bisect bad 7534d13c1fc508697ea76dc1c403151465ba50ff
# bad: [bfad554357b0b99ca95fbc79016c3fd9559c7205] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
git bisect bad bfad554357b0b99ca95fbc79016c3fd9559c7205
# bad: [5075bc6921b420b16162bfeef073f75f7c43b038] Merge branch 'for-next' of git://git.armlinux.org.uk/~rmk/linux-arm.git
git bisect bad 5075bc6921b420b16162bfeef073f75f7c43b038
# good: [cf46297bbd341132c42e2a47e3e05b2c261c99d1] Merge branch 'fixes' of git://linuxtv.org/mchehab/media-next.git
git bisect good cf46297bbd341132c42e2a47e3e05b2c261c99d1
# good: [c23552d1a15a89db37d4fa95aa8d0a30ad3c4482] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
git bisect good c23552d1a15a89db37d4fa95aa8d0a30ad3c4482
# good: [d7e3c397087fffde68389e7530093dbc2b70c48a] perf stat: Support hybrid --topdown option
git bisect good d7e3c397087fffde68389e7530093dbc2b70c48a
# bad: [3cb4503a330159dc5cf2f8382181ccbabbbaa5b2] x86: remove cruft from <asm/dma-mapping.h>
git bisect bad 3cb4503a330159dc5cf2f8382181ccbabbbaa5b2
# good: [78013eaadf696d2105982abb4018fbae394ca08f] x86: remove the IOMMU table infrastructure
git bisect good 78013eaadf696d2105982abb4018fbae394ca08f
# good: [742519538e6b07250c8085bbff4bd358bc03bf16] swiotlb: pass a gfp_mask argument to swiotlb_init_late
git bisect good 742519538e6b07250c8085bbff4bd358bc03bf16
# good: [3f70356edf5611c28a68d8d5a9c2b442c9eb81e6] swiotlb: merge swiotlb-xen initialization into swiotlb
git bisect good 3f70356edf5611c28a68d8d5a9c2b442c9eb81e6
# bad: [6424e31b1c050a25aea033206d5f626f3523448c] swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl
git bisect bad 6424e31b1c050a25aea033206d5f626f3523448c
# first bad commit: [6424e31b1c050a25aea033206d5f626f3523448c] swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
