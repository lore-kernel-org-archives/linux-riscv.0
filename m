Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89545C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHE1qBwF4/ceWJ1SQQn5Bd1aGDoa91p+Zr9ArB8tVng=; b=ioh9HuizeIaj1L
	5x5O4fziLAipBWrl3Mg7gmj4vE+TKogYnCU8Dx0HngtNSkUFLk5JruO0/Ym/gGYqVGqJ8r5YHsDhP
	oh+8/i1Jyd967nCuddwkh70kLp5rshh4HE8+V92BcaiwZtP4gQJUEgDCvSfmM5acI6YRsf7vjUStr
	nzb174G86YqEJulDgElkU3+B+Ug9cRsa9N9jX0jbEjY1Z08TYYPR64kx5yljMAcpRhqX8t6P8H7xt
	P2DKk66a36oCp/anLmZU7b3LN3iN1Hurh0IQSfF+phokMKTuNjOXhm0o09KZMawNMRk1EwLVOrI7+
	F5qymUW8JjHnktZ2EXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL5OW-00EsYC-Bk; Mon, 08 Aug 2022 16:14:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL5OT-00EsWH-9x
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 16:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659975257; x=1691511257;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TGri49NmiBwHC5oXXFJ4ItOQxdnonoIWczQwV+GrjZ0=;
  b=cZRFO6OuzdWTKmVwKu7/IVbNUjsx4uYVjL1tfSQrUcEjusRIvWH9L/G4
   eTMJOrktFK3FQDsXHpG36vJFQg/xL1YBUUKkmBrJAy6+zDFvsN3DhK0Qm
   +9lm0N1OkJWi+jjlIJGWfnco7E8vC+Pu5vUfPz1cZFGr2Yv80dffg1L5h
   8vhy0ClvSWnI7tqQvE8nKcUmccAzYyt2ij+rw9BO4Ew2IDbdUvbkxlvWN
   4lAPcoYwAMRtmqz038eCWq3vK24J1Uxe2njqBceRAnKj98jDxgKkrdpuk
   40S8xUk7KzQG65ATP4EqEtAvvATBUPxwNk2S1G73QwQUF+NKktTRzaIxv
   A==;
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="108069050"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Aug 2022 09:14:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 09:14:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 8 Aug 2022 09:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb7pjwwso6yw9EFmeE3bS8ejIOe9K7BrImyJUs4HEBrZVN73F91/iue6DG6ba/GF0sZHt5XYPna9+HA3HNmy3Bq01IB8qxEFea6K3dTGqWamdPNFRASXkKg9mk8CxXMz+HN/UwMVz3UMF8eJpspHHTk8IZ+lpCjKBpJsn//v2bxeJKVQJyD5JELuEFN34tbDWa2uj5/RhgoCT/zvuua8lCG/9LfnUfDSGaKbjg88O8WJXKO1WYJRoV8ZuXfXp1RrbfflKpwckAdGloYuoIFyQvZoGiX1vR7Iba7kDdDckRnmmkcZCSfOCb/ndKVeAUUAAHQVicTveCU1s+BV8QTRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGri49NmiBwHC5oXXFJ4ItOQxdnonoIWczQwV+GrjZ0=;
 b=numyfkfDgCuccecgg5xqCt2y49qb2OsIAF964yj9JPCbLZic/R/7jOaroK/EXbd53IMdkM++pEbpjNhkA3saqo0PF8QITmK+Mms6dqTUG8z2e92unaChyaJAP3EKLQhf0Us6Dtv8AsGo0ZCqn+U814a9h++KvezjQsvmuM8ok7SwFonIy68eDrSew06XBrz2xolFzaAcrTVwKQ0VZlsGX7W0PngtGcGToX2IfW31Z3JG69bj+AWYFQhENXQPmF5vJ0JOSiXU5T1R0VafY9COZWlM+17hBr1LXawB8Ul1w5xKBeDzDjQObPrvXbKLSFDrwTdJvcn1hgCStbAc2FLdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGri49NmiBwHC5oXXFJ4ItOQxdnonoIWczQwV+GrjZ0=;
 b=DaIyu0YN1bl8kZ9zNqFKezfW0AizhgDL4Wfz971KTUpKxITSc/9e0GXOSpQu8tXjoByRTBZ/n7MsK6PicpZk+z/xwvHX7Wc/aIupwQkodrNb2fGTjI5GzRLJdIgM+YhYwUL/GmpIw66yn1CblXmz1niGPKpZwAjLFRTB27rOVFI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2959.namprd11.prod.outlook.com (2603:10b6:805:db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 16:14:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 16:14:03 +0000
From: <Conor.Dooley@microchip.com>
To: <research_trasio@irq.a4lg.com>, <mail@conchuod.ie>, <palmer@dabbelt.com>,
	<alistair.francis@wdc.com>, <bin.meng@windriver.com>
CC: <robh@kernel.org>, <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>,
	<linux-riscv@lists.infradead.org>, <palmer@sifive.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Topic: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Index: AQHYqOO1TG25AQQCRk+oHxWTs2yK5a2lHi0AgAATygA=
Date: Mon, 8 Aug 2022 16:14:02 +0000
Message-ID: <fe4bc495-14a3-205d-480d-083c2a81fd13@microchip.com>
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
 <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com>
In-Reply-To: <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cc7b991-2713-4456-f39f-08da795902ae
x-ms-traffictypediagnostic: SN6PR11MB2959:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0httaRZxLixktlkn8qfslrPyydN1GpQABZcrGJOkvjvhNP3zgVyzU1iBsO7Wit+GR4YCaCAaI11tSBUqMgOSiPlZlD2Dj/98jrXRZHb989kUQAWJtBoN3V+V8c0T2gWrrJ9TV/qjnaYpvoWl8mWfyQPgN5IS91Hs+BZ/W+DjiEM3lDQ2GOBnLEOhJmbXiadh3JSB29wvqstKGXybsP0PzsswEzJyrE6i6+C9kE6+xwN9p9SKuqPT9l26ozgo6AwRciUYzqbA7FI/idtnO6M3NZ+FcQFMvWEQxEVCLB08BHqI6upkrdZV4RP/rS92Zukh+8+GEiaDryvdE/B1jC/8vhUQYYdbHeH+VjxgDIkvw18nbtFI5E1C4uGryGY8qhpxwZm/fQf4YZwsrXGwMeInGLc6QhjqmuJezvhQnwKAl3NS7armBViEQN6uLWjgMGwxgy2o/jzjCesqKEUsAFjMuR3O9si07ScawidrlhvIZk01QSeUjIyOfTQzvDGa9LAx8UM9HAxBK+vGc25DF2izT2idpeyWpBioX0NXjS18q5wPYj6Rg3stSbfNd2lIis+nFBXQ+surdz66kpxS2wCrnbpdhV3VUAwp8EuwUOi6GyKHjBD+hgXWzZdfLDU+C0X6OAqIAhmt2mAqCiQkQzNUnihwzg5i6l+leKqJQHI8ew0BgnWgxin3BDbboxxGN6Y7Yqa5eaegk0/oBn3vn3GhpAmRGOLw7HhpSC4cRwN6gTY+u7v41tGs6rChiW4LeMx5XCtGryz3O6q7e0RvJHQi8zIKQ3c7gXzG15uN/g95jnZ6nDXKw2XzRC9iln9JxGgzTDvUrK4nx7MCMPMNC6c0tHsGugO+UrqnhJTKG+Yb1nnzrrAXS9+joxChUHdg0tnC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39860400002)(4326008)(8676002)(91956017)(66946007)(66556008)(66476007)(76116006)(64756008)(5660300002)(316002)(66446008)(7416002)(2906002)(8936002)(122000001)(38100700002)(38070700005)(41300700001)(36756003)(31696002)(478600001)(71200400001)(6486002)(110136005)(54906003)(26005)(86362001)(83380400001)(53546011)(6506007)(6512007)(186003)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWRIZER5ajFqZ3lCdDN1WWNXd0MzS1dENWpHU212dXNFOUgxeTg1emxpWXcz?=
 =?utf-8?B?SS9uVjJUN0dzOS9wRWg1Q3dvVWRtU29qK3Q0TnBhdnVKS1BEMnZuMC82clp5?=
 =?utf-8?B?RVZLWjRwUVA3Wk1KalhvTGw0cnBHdGJDNFpDaEVKbkFQZFE5NkQrOC9GbGk4?=
 =?utf-8?B?Z0VTUFBNV2d5eVNjZWoyVmNwL0Vod0J5VjdjSUJGQ1IvOG9tSTcwSUMxSEs3?=
 =?utf-8?B?ZnVSa3pKT0c0ODdBMUQzU3Z1cklhM0ZkT21xVkZsdTNycWVVSjhsVUpYYUN4?=
 =?utf-8?B?SHFyQkxOdXlTY3hERDJ5TEZQbTg0T29MMUNxQ2JiTHpTSHkvNzJOVU50eWNl?=
 =?utf-8?B?ZFRIeEcwTzRKUmJiOTdSZHRRZnEvTnNxaGpHRFdiMElwTEpGKzZ2MytBQTF1?=
 =?utf-8?B?ODYyZi8yUXRadmJlVHRhYlZCMGRyblJONm1BNitzcnRjR1V1aDlpM3hvSUdi?=
 =?utf-8?B?Y3BXcEdEeE5VRjNpTGhxQnVRVjBndXFLaXkrb3I4N040eUhwaEd5TWZhbU1S?=
 =?utf-8?B?VUVYbDBYeFd2dHNmS2JCOVU5OTB3ZHRvTGw4Nnd1MkhJTVQzSWF2VmxuTGRI?=
 =?utf-8?B?TUlKZHVxZjVYSnI1bDAvem04Z0o2TSszNE1CcWxvRW5sRmx1cWVhN1lnMW50?=
 =?utf-8?B?ajJYSzcrTWtKZkg0MTBRSU44QmlacVp4TVZWcVdSbVE2Q1pTZ3pRR0s1S0gr?=
 =?utf-8?B?VDhjWGU2QXl2Qmw2bVBGK1ZiZnZvYk9YYlRyNllmY3Zsc0pQcmRJSWQ4Q0Y5?=
 =?utf-8?B?aHRzQjZ1SHZtQTdpRzR6YURVUGR2NW1tRThIaDhyZlVSckdMeWdsbEJpVTkz?=
 =?utf-8?B?YWh6ajlJOVp5bjQ5Y0dOc2hmakQ5YjhrOUdkK2tuS2tXN1IzQ2hpUU5vUnZl?=
 =?utf-8?B?L253OWhLTWtMK3Y0NGI1R0xmaCtSbHRqYzJYd0U3NWhnSUt4c1RxOXZLYUM2?=
 =?utf-8?B?S1pwbnNBZUtPSkxWSW9JVFdsYlNTTXRSNWVOWEpQZHF5Znk3N21UenVhMzd3?=
 =?utf-8?B?REZaK3VSWUtnMG1zL2hVSm5heDA1VHVEaDM1dzZoL0tNSzV4T2Y2MXowMkYw?=
 =?utf-8?B?U1JEbyttWWRHeWJtT1NkTGVmVjhydWE5cXh0bmwrU0FqL0tCQXNEUEtabUJz?=
 =?utf-8?B?aXd1VitSZHNYeXBSZzlYRkhFOXJmTnhpOTVpQ3Mxd3dZUHZ0QldhTzlManpn?=
 =?utf-8?B?MXE5Q253MHBNakpIUkkrbEZsekpFdnBDQVFvYUJWK0lRdGR5THNRUEM2dXJL?=
 =?utf-8?B?THNnU1hlaUV1ajl4WlhrT1ZVY1JvaDY2S0NqU3RPNW5yL2g3WGY1QUdsYmJp?=
 =?utf-8?B?Q0J0eVB1cUs4OE1XTUFFUzBLZk1VeU1CampyN2dUSHJLRmdBMFJTTzhvQWFz?=
 =?utf-8?B?UmFwK0VhVUVmQkRHL3dhQ0FhQWszVzNSdG5Lb2crWEsxSjBGWkwzbE8yaCtz?=
 =?utf-8?B?MndFTHRXTUFwUTdNbjVKL0phNUgrU0hsZ21CVTE5MmVMQ3pUR0wwKy91QU00?=
 =?utf-8?B?c05ubUdONDhUWGRGa24wYzJzdE1rS25tQmt0aU5aS0ZXTHlvVlZDVnl5STZE?=
 =?utf-8?B?QXR4OVQwQmlCdEJTQlljR3JENjd6Sm1ZQnZqckpqN2hHNUg1Y1oySjB4bU45?=
 =?utf-8?B?V1RPV0NuWUVER1NpUVFiTC9uTDlWdEZrUjNYcythN2xRVlBtZlczNEhFd3RB?=
 =?utf-8?B?YVdjNVJiaEIxb3pUVThHOTNmM0NoZ0NuM1YvbXVTRFVpQnBScCt1VHg1b3Rr?=
 =?utf-8?B?VFdycWNkdDMzaHNXRTVpNlAra01CT0hyUmxsRlA4WEJMcDh3dE9mRmY0MktZ?=
 =?utf-8?B?M05QTlNwWTg0QXpIbEZpdWJuZ2tKaCtmUHZBb1RPeUpEVVE1UWtIa0FaSUNP?=
 =?utf-8?B?SEpwOTUvd2w0R0gxUStRZ2lRbm14MmRIWmVlNGZoMUVubWZOdmk5VDZSSkhm?=
 =?utf-8?B?V0QxK2ExTmhnVWtXbTVpSVJkRHpVemtHQ3k4SzJRTCszbW5veUFZU2tBK2RL?=
 =?utf-8?B?Si9zQzJrcEhaVkZzZlB4SVJiRUlOQUpLZ1luejNWZmtFb2Q2cFFZdUk2QmZw?=
 =?utf-8?B?L0tsbU5GUkJEdSthdzh0M3RsYVZzdVBJK1lEUTg4cU5KTHNZK0VZSXN4TVAz?=
 =?utf-8?Q?BdsUXJVAL2B42mCGVMUgDr3h2?=
Content-ID: <1B189610C02BF945BE75E9732EB60672@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc7b991-2713-4456-f39f-08da795902ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 16:14:02.9948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDQYIBRoDy9nzjdpbPIacpTkYpI0uXygkQwDi+58v8v55wd3ROzqKoLxews4YwDQy/2cFUgXxc0LbuMQwXsGbVKqLHKz9a2Y/0IB7S5mUSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_091417_671570_D1702DC0 
X-CRM114-Status: GOOD (  17.71  )
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

On 08/08/2022 16:03, Tsukasa OI wrote:
> I agree with Alistair.  **I** removed 'S' and 'U' from the ISA string
> and it should be working in the latest development branch (I tested).

Yeah, I saw what you as I looked at the commit log while trying to
understand why there were invalid strings appearing when the code
looked like it was impossible. Certainly I found it very very odd.
I didn't just revive a 2 year old patch without taking a look at
the code.


> Besides, this function alone generates the ISA string for DTB and
> there's no way such ISA strings with invalid 'S' and 'U' can be
> generated.  It's definitely a behavior of QEMU 7.0 or before.

Hmm, it would seem that you're right - I have retested on a fresh
clone. I did checkout v7.1.0-rc1 before running the first build that
I saw the invalid string on as I'd been on some hacked up & fossilised
version prior to that. Perhaps some build artifacts were not correctly
removed, consider me quite confused! I do recall the configure script
saying something about my build directory when I kicked it off, so
it is likely down to that.

Unfortunately my bash history is out of order so I will not be able to
replicate the conditions, having many terminals open does have it's
downsides.

> Please. Please make sure that you are testing the right version of QEMU.

Heh. Please, please give me some allowance for reasonably believing I
was in fact on the latest qemu/master after checking it out and building!

I guess this patch can then be safely ignored :)
Glad to have cleared this up as I was rather confused by what I saw.
Thanks Tsukasa/Alistair.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
