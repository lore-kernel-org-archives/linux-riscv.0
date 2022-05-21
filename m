Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F15C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OZIQJ9RHW/DrihySgjjYJR9puqW/HLB5QVkfyaUZnc=; b=N+BkKG1hQ0bK3s
	B1lcCfa3W8O1oFwiDMhOxQK4Z6aWyTohu328l7t96mFRaSfJCLLLJABbFfzwQDqjCkrwvfdH4iYc5
	wmQiNP+C7yOeGX4IcuIiFQ/FOS7iHTfcuOgGP/uYOJWCfFyopqbZzqadwSbZuHhYrvBBky8/MuRBk
	1ZEiY/4aakUi8HWViIclbLe/pQ6fQxhP7UwG62wOJ8iD808JqEy+wEhq2qyoOJA8oLkaDUFzXnikI
	7Lyd3zahNkuoa89dk8DAdoqbIku2sH31YSuAvrlH268ISzjC7hQxjkiwI8rDDT0wXEK8ApxoRfdwq
	bqqtz1UrphAB5lUEYe3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsNGJ-00GNIs-Ly; Sat, 21 May 2022 11:27:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsNGG-00GNHN-3j
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 11:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1653132427; x=1684668427;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=j4dHVI57TBBFhwx95D6aEikJWz8eUjEYcXodo42VfGw=;
 b=U4OStwxxpIz/VR3mNbW5u/mV0X67aqq0rJzdVuH7b3Tvvq7TFmK1rPw+
 qt/A/3SMqUocNdEKsyD/+nXn28VO5dPJzUrGZFzFbnH77wYR7r3i4pd87
 esrJ5ynwmmzaQZGhBGZsFbjVJlwtf4LYRVAfFwB12+KpgLBBp3vCZ81Er
 74lzbJT0CKhLjCYLDXhz8TMRFKzR94sxpUlHmTlh1a+VYjqBwIOGGE1+l
 JffesXVPJFvrVpSMEZ1waot/k1BKXqdPd73kPV1nHSqNsNV/tqoz50r7Q
 lnaWvIQFzaSbf1ie3otdDaqcQCn1sjpIFt1k6G1CUgpDK7xnpr/AUmVeK g==;
X-IronPort-AV: E=Sophos;i="5.91,242,1647327600"; d="scan'208";a="160023241"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 May 2022 04:27:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 21 May 2022 04:27:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sat, 21 May 2022 04:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DunrHIX1Pjs8uwFDpNu0c6xtlQ9vmZ+foFkIjgOnxXP/DaG+PvXp0630sJclx9IO/mikgdHGiM195eUhgxAYUXkMmrtXFg6ZECsufKo1qNgrBw6IiWhyCcWC3ChCO008IAS5Ppb67NpJpOKNq6v0il8pOCoB9fdKe07BGWz1k8ZYexBwAhlUrlJXr7sI/BmDcOkzWqIw66JTnzOC8ReDsOgLOZKUlgUB41gz/chFWroFwBDcxOQpSzL86tl+B0Z9dmavVm/l/3l2Ug3hViDUzTTRNZni6YOJcr4cMjedLVKifm8run6vhqSqB+ZuJ7ewBcwrCPwTjPj6lCjjnW5GbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4dHVI57TBBFhwx95D6aEikJWz8eUjEYcXodo42VfGw=;
 b=QhUgGGWfj+ignmsYCF4/dC1NivUWhp/rBfQLApsM9SmR2TNijmeyOqLeigCM8RqS6zZZwsz4hjoLWxj+N2ubIIkWmcTLhsW7NchvGtUPPJjdhT0lmPuA4RbIZ3ejRiPDXyU53LPcdthf5Vc5hdZ8DqYR7WlbH35RYwyDIQTzwkKHrkeY9Y1JD8fCD4YU/SR4SuTUpMiS/g+0mpNexB8bNMogred4QOhjdVUR8cZFYXxJh2YgT4YqdkBCBsZxQeytfgkTIN3FEnmhRJLAefo8NLSi6LYcfLYQlKAuJun+oLT8caf9kZSdd7JPVMqRQjjCA/I5CKNLnTjbpoS4BhAKRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4dHVI57TBBFhwx95D6aEikJWz8eUjEYcXodo42VfGw=;
 b=DHhwmfRPB5eTut19+o+oCZggJUeT2zOXn76AJ6uYj6fbh1sAuWN3490R+tbLW3r3yqDCejMkGnqNWay6iuTQeIX8/6qMURMuETiViivWfL/905aFPJYiumS8pk4QTdFWtY6kspRqe/MMIx8xnTtyW/k7RAPw2icns8be4nr9Fek=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4347.namprd11.prod.outlook.com (2603:10b6:5:200::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Sat, 21 May
 2022 11:27:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.020; Sat, 21 May 2022
 11:27:02 +0000
From: <Conor.Dooley@microchip.com>
To: <wsa@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
 <Daire.McNamara@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Thread-Topic: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Thread-Index: AQHYaPd+f4ShoXXlSUiSbRSXyUCYia0pHeqAgAAbh4A=
Date: Sat, 21 May 2022 11:27:01 +0000
Message-ID: <dbf6073c-0814-ec25-cec5-cb3cf9c931d8@microchip.com>
References: <20220516073331.3508505-1-conor.dooley@microchip.com>
 <Yoi1bV95l7+thgS5@shikoro>
In-Reply-To: <Yoi1bV95l7+thgS5@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fa3690f-4b99-4d18-2bed-08da3b1cd38a
x-ms-traffictypediagnostic: DM6PR11MB4347:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4347D4F4AE31FED1A518A4DC98D29@DM6PR11MB4347.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdG0KvZo4yn/ftAW5+RT2LYIMkoXxTFcbgimMeK6Hh2qNn5/LzA/ldfG/5QXh/H1Ef4V8z6nLytnr5Nn+tCq2afJR8Q1YpHQ9fsgBcmGZxmLhQ/UKmWDdDwf+4T/C9KxBpdFSrvHox0QNKVL+KkCojOTTyptwh+OYtn1cbe+Y8lAKwnnMGnX+WRCA8VXtL1VxnA5iPziOZ1OWYIM2mF/IYE0XRyUXtYzOct+i5L6XYxRCcHdXsnE2bsIfkYaUAAaSjJfXoQ7eGUJEqGhLzFFDJmQritlaC3hLkwz0JCUQM2bUdKhg3lwJsNSyfhHVJ86KSTmK63e4R05jf2WujCRpLAMXefOAVTp/85hNTPf13xzimPam7AEroF8BOnMgR7exCb9gvPsy8oIUJ7krtKOxrCbMZQrepjU2AYonwlz9XuvviFhaDa6W/pf+1IMCGTez1xqHJhX8EpxDKNVG6L7cT4ABeS82DdH0LS0l6CHctcFdusfmcZOJzV5u34nO1bczZnA29kccbzaMZ0/TrBKdKQ2keHGSDW2YJV6IsgfKU7+Zmk24LlxgdcE/gSEY0pJZTuAyxpW9ENP+QedTiCp0mZZWXMSerwBd5afEaXPwAI8FTCSw1wBT0EAW/+HMzeHvggg/ncownbwDNChgrYEGGNkR9E/1MxKkD+IJMPn6nBGsDNfPg5aPAx15in2r6Mx/Om5Umr9QJDOTlTDjz7sH0dU/IcCPS3NGstnZ7RekzWhk9lljOL3JzfdW6f5XNNiDqgrlZ4A5rPooaPfEPMyxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(186003)(31696002)(86362001)(38070700005)(54906003)(2616005)(316002)(83380400001)(6916009)(76116006)(8936002)(2906002)(508600001)(6512007)(66476007)(6486002)(64756008)(66446008)(4326008)(8676002)(38100700002)(122000001)(31686004)(36756003)(26005)(53546011)(71200400001)(91956017)(66556008)(66946007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1VsTFBzbWE2V1hvMWF1cE9CSzcvNUZWL3lkK2pPd1YxNStBM0xnanFDQWlt?=
 =?utf-8?B?cWpralNNVWt0VGlLM05lV05pai9xZkd1M1NPV3NYVng4bnY5RGttNCs3ZDgz?=
 =?utf-8?B?WUlaRjdXbGZXS3JINk5uczdyQlRpM3h0WFBlV0pHMlVHaVRueUJqT0JKMVVz?=
 =?utf-8?B?bGRmSk14ZmFGZW0zWHNLWlVLVFFlU3FEUGQwWEtvQlFnVjgwOSswK0kwREJD?=
 =?utf-8?B?anQ4WVN6c3RrZjZ6SGFlcUE2MGNVL1cxYlk4QVNlck1meEt1T25GbXYzYzhl?=
 =?utf-8?B?bkg5MTErM1Jaei9ES3UxK2dNM0JFdEs3Z0tsMkFnVWp1d2lQWXJIelVSYjBs?=
 =?utf-8?B?M0pnS3hYWVFld1EvSXJuT0tYOVRpaVRKOWV3em9NcEQwSlRGRjR2eGhGMTBW?=
 =?utf-8?B?SGdWV0RkUHpxSFhlejRleGtUR3kzVnp0REZnTFJMVWJla2QyWUxpTzM3VmVL?=
 =?utf-8?B?ZFNDcUpUZlN3ejZlem9CR3ZUNDh5QlBLTU1ialZQcGxyZS9uQnhxU0d0Q24r?=
 =?utf-8?B?QjdkRFUrLzVBeWE4bWZRb00rbU92U3VaeXoxRlJLclEra3JmUUlodFRhZjJU?=
 =?utf-8?B?TFdNZndtZktqSWFPSm9jTjhpcUpaZTRuamJoMFN2QmUyNUlzTWRzUWV2NEJq?=
 =?utf-8?B?d2p5S1d3M2VlM0xKUy9lMS8zLzBDVExTT3k5dDg2T2dkQWJCM0VrWno5ZU9J?=
 =?utf-8?B?dDJpYUNvTmZCb2czY1RXd3dSZWE4emU5SmpkSENrZWU1RHpkcExlb3M0dVdt?=
 =?utf-8?B?djRjU21LdTY1L3A1b0V2dGhYQk1janpoMGdyTVUvL252aTRFbjFrMUx2WlNh?=
 =?utf-8?B?NXRPY3h6NnFIWWcyOVc1OGgwUThoZXhOYlIyNFg2UHdkU0kxREVkbUdMVlVO?=
 =?utf-8?B?c1dicDUyOHh6c3VOZk85NHd5TWFnZVlCZnIyWnRvQkc1c1g3L1NXSnFqMm9M?=
 =?utf-8?B?TnQzY1NOV05ycnJudVczcmJDcE5md3R4eVlhMVgvbytZVUE1eDBnSmJVZlFV?=
 =?utf-8?B?KzZGbkQ4WW1hM2RBMythM3FZVXpMTGVlMlFkN0ZiL3ZBbzR5WGE4dkpmNnlx?=
 =?utf-8?B?YUk2cno2QTJZMDVLdW51d2JENlRNYXNkUm9ZY21qblVsa3BDTWNmR3IvMm1O?=
 =?utf-8?B?aEpPc05qNjBYbEh6d3dhZCs3Y2dPTEN4ZkFGVU1UbHd4WFZxUzN6K2NvaStz?=
 =?utf-8?B?dTExTERpaGE2cjhlMklHUHo4ajdnZys5THBOdFB1dThuK0UvUU9jSDJMTHBz?=
 =?utf-8?B?SUpnRisvc29ZVkVYdlVqR0Y1MWkwUkluY1Vzb2hGVnNqV050NFBwN0cyREs2?=
 =?utf-8?B?V1YxYm44UVJkMjJFcHlWdUdpeGhKM3EvTzhXK0R1VGpLUVlQRFAzcENTM0lO?=
 =?utf-8?B?RWcxTUUwZitzNVhvbGxtNHNtUTNmOVNnWGt3Tm9XTVEvNmdISjZHY1BYT3Ft?=
 =?utf-8?B?VmQybHZmYnRvU1RSZ2R1Q0xRVHM5aUY0MUZrRjNXM3lRdFVXVmhHLzVpOFd4?=
 =?utf-8?B?VWF2TzZOaW5jTWQveE4xR29Nemp6QndsWlR4a0xUN0hybUpBVEQxRmpPSXRQ?=
 =?utf-8?B?d05XaGlDdENVZVh0V0pKZ0xQZXZzM3ZDM00wYVk2NFBiTk1vN1kyMXh2SU1v?=
 =?utf-8?B?NmtHVVZKZGJmMFY5dGtRYUlvRXJzNjJlQWFuaDE0eTdPQWp4dXcvRE8zRTBw?=
 =?utf-8?B?b0FYTGs3UlZjbmx0eXkvdEc1ajJYeUhPMldUZGxsbCtnQVBIenNkV1ZsUTNq?=
 =?utf-8?B?ZkFwNmFqVmFxQWpHemtWL3hBRVBKcldrMG5ZNGQxUEduUEh0UmFVaE1NT01m?=
 =?utf-8?B?TXY4NkloOFlwVGZMbFdITS9jZW1zNk9lY0R0WU1STTdEeXJpZFN5U0RrWmZu?=
 =?utf-8?B?VTZHdVhPaTB5STNFTVRKdFR3bmdhclFBNTNxajZQTUFtTng2b3pZSHMrRXd0?=
 =?utf-8?B?TXVVbVBvK2VtOHVPQVkra21QNXZuY3k5OHRWdVRYay80U2N2cWVyTEtFVzU1?=
 =?utf-8?B?QThuRzYrWUsyV1JHN3oxQzh0cVFSZHFiaXI1dGU5a1BCZTNJemQ1S05rczdJ?=
 =?utf-8?B?dmU3cng0SmQyZFdlcHZud3JxbGg4TTkrazd4YUtJR0FoZXByWi84M21NQWtx?=
 =?utf-8?B?dUVYR08zSSt5M2ZUVXp2UlEraU9SRmt2Zy9HWk5LeVZkdmIvRUhnQkVqMzVo?=
 =?utf-8?B?dS9qd1ZHK2hDZ2xCdno1SUc2RElXUElodVlDa2U3UTQrelF1bEF4VktQR3NL?=
 =?utf-8?B?SHdTY2ZRUHZXN0JHVTNubThaLzBlY1VGeGhlajNmRzhFL092QWNBSkFlSGJy?=
 =?utf-8?B?L1pBRTVSQngyYzdiMEp6bHhQcFQydXIxeFJFY1pPdllqQ0g0UnptZz09?=
Content-ID: <7B53A6E915CE78489E4BC5E5AC032060@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa3690f-4b99-4d18-2bed-08da3b1cd38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2022 11:27:02.0203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJupAVTgeN/4UyqkqsKQLIIgzYsfphgQTNEkzYmefOTvRV9DUTYK3ISPk1rSj0oJXV8/58O04GQTrXYwhy7fNMkmbMrmVE4kH6dOC2yMaG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_042708_517029_C96FD627 
X-CRM114-Status: GOOD (  16.19  )
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

On 21/05/2022 10:48, Wolfram Sang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> Hi Conor,
> 
> driver looks mostly good, but some comments:
> 

Hey Wolfram, thanks for the review.
It'll be a few days before I can actually get back to you, but:

---8<---
> 
> > +		dev_info(&pdev->dev, "default to 100kHz\n");
> > +		idev->bus_clk_rate = 100000;
> > +	}
> > +
> > +	if (idev->bus_clk_rate > 400000)
> > +		return dev_err_probe(&pdev->dev, -EINVAL,
> > +				     "clock-frequency too high: %d\n",
> > +				     idev->bus_clk_rate);
> > +
> > +	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
> > +			       pdev->name, idev);
> 
> Really SHARED?

Yeah, this driver supports both the hard peripherals & soft FPGA cores.
The hard peripherals do not have shared IRQs, but we don't really have
any control over what way the interrupts are wired for the soft cores.
Worth adding a comment to explain the reason for it being shared?

Thanks,
Conor.

> 
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to claim irq %d\n", irq);
> > +
> > +	ret = clk_prepare_enable(idev->i2c_clk);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to enable clock\n");
> > +
> > +	ret = mchp_corei2c_init(idev);
> > +	if (ret) {
> > +		clk_disable_unprepare(idev->i2c_clk);
> > +		return dev_err_probe(&pdev->dev, ret, "failed to program clock divider\n");
> > +	}
> > +
> > +	i2c_set_adapdata(&idev->adapter, idev);
> > +	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> > +		 "Microchip I2C hw bus");
> 
> Most people add something like the base address here to distinguish
> multiple instances.
> 
> > +	idev->adapter.owner = THIS_MODULE;
> > +	idev->adapter.algo = &mchp_corei2c_algo;
> > +	idev->adapter.dev.parent = &pdev->dev;
> > +	idev->adapter.dev.of_node = pdev->dev.of_node;
> > +
> > +	platform_set_drvdata(pdev, idev);
> > +
> > +	ret = i2c_add_adapter(&idev->adapter);
> > +	if (ret) {
> > +		clk_disable_unprepare(idev->i2c_clk);
> > +		return ret;
> > +	}
> > +
> > +	dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");
> > +
> > +	return 0;
> > +}
> 
> Rest looks good, Thank you for the submission.
> 
> All the best,
> 
>    Wolfram

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
