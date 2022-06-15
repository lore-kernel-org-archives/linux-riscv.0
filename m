Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46ACC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n57EmrQNpgnUX0HOS8A/pvEOLnY9RsWxCcRRiFJOnBo=; b=zmkPtSFHK2bZuM
	5YXXUvlvZOC871fiSJAt9plwmTUuyvbHSB5vpMrGFc65+CmpPFwDEhC2sxh8YLG8rL0mDhmiv4sMV
	OGux/+V4699Fm1HWKIS72FlMRv+014Jc6A2dEc5As65wZSVfMSmB1fLnPhGzG5qIvqG28uwtb0O0j
	z7eez9Vn3D+JrgDqh34YOw1087hhRRDp5k3i6mAo601zVN+9wk83xhf4Gh9+PaNtlex9rSS/QRYSq
	RtbZrB7d+QsWYsTb5l42LSPU69kysdDcWqkSsqzAbvOcBZD9F9xevy3GrkSCCjE5QiYAnwBn2VEdE
	Qk+nW7pbFBjlHkkSeyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SM6-00EVku-3s; Wed, 15 Jun 2022 12:42:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SM2-00EVi9-Ed
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 12:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655296958; x=1686832958;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sct/L/c1ILHkqk5ZyR0w7MgXzCne5Pwd/E5LHwIZPkM=;
  b=kFoxu79Kap5+CPMcqZuJFooKuWd2PPvhJw2nifQ2LirVr5Zo6+j+l0WC
   QAZBERLm67e7xLpfC1V9+W2P/j6TPnQnFrKfzJfhkXovuMtPyzeblIDug
   OcCcAJH9OL/dpgPov5Y3OETUkKUxd+3fqdZ5elC0Rv5vkoLmYUfqvJuYk
   0L1Pi0qfNfbj+5MlQalO2yHhmI4wcQYQ4HqmTR/qupMEaGVoRxsJmWpwj
   uqewTFPfCoF/Lf73mcCwFd9wUSQdklxb1WZDPmJfk0ZwuArOEYyobbBHs
   mQ4Tn97HH7QPuxf2sCkC3kNX29Lm0RaliHsQD1ROQOzFsbAbB7QBy0iXs
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="160432192"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 05:42:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 05:42:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 15 Jun 2022 05:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQcou8kfJ1tQRjndz5MoMAFd4GIGRwyWFcp0++lksk+sT8lsZShXemt59fV417etYjW7J0E2v+meZtsLKkBwLuuiKkHUI+Fv0U26fukA4hK9iEgCWvfXBvPdH6+VHwX388nluD5LX7gRbhHXIDSB1yhDrL109tdC6EGSZhaM1lKIPI7kwGqvD/xEjVTFPf7wSny3AQXhbabRU75BnIHtTWE8A2pyz5r5Dr+oZcoEAbtIeMDdE/n0YHRoEOnNgq9AK0mTsKn9+sLfLgWwS6pm7LXlpnfNbKiGebFYWq/yz7cRUGNBiK5sLgcLtxv4iRShubrTS+XgoljgO+fGZ10qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sct/L/c1ILHkqk5ZyR0w7MgXzCne5Pwd/E5LHwIZPkM=;
 b=kFmquIGSklobUC6NYdz+du0hzDCLP9uF1vwP8JlQ88m8/90y5nFdhFVnunVXoY6ePJQYuVexxfa3rJabHDjVYO8ys+DSGUpjWgRG6RqhReXj3wvwBgSq8oL2tLsupl4fyXktGqk7gIVeRcJlaTgccmKd1kUsUZmWn6keyz+MV0m4TKLyO0uu7RCGuF3uwdXdg2c6ENLMX1mfTCBLQoIbPGJghuSdMv1LmfAfilFRj+kd9T7yP8N/4Nlz5P941auBdGt7aMkIdTCAd1I4Ay40Ba1UgShOh+e8ObkEP/aLOP7AFx8teV6ihOqh90pR3pxKhVWY7Qe0HJAnYNMzWa+7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sct/L/c1ILHkqk5ZyR0w7MgXzCne5Pwd/E5LHwIZPkM=;
 b=eWofnM+JFaLHKFqqEiW1YDBTzZDQPY65yQ/MG+H/iSt2IP6PnL3dioKbvxxPj2YFlUe4IjY2o1tgHLuC82Dw7qkcV0ZJO/Eqro/IfrjZ3LilQBQgnD+tmuhfD2/sj9flR7zyKlzfLHTetSGpdOgwWn7AlEnhm9plZH/p40Nbp2k=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4351.namprd11.prod.outlook.com (2603:10b6:208:193::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 12:42:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 12:42:27 +0000
From: <Conor.Dooley@microchip.com>
To: <broonie@kernel.org>
CC: <Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dan.carpenter@oracle.com>
Subject: Re: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Thread-Topic: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Thread-Index: AQHYgKu0NnUyv6HMX02qK3OEv15VZq1QWBQAgAAEXYCAAAueAIAAAOiA
Date: Wed, 15 Jun 2022 12:42:27 +0000
Message-ID: <630d60bc-1322-21a9-e4d1-3eb5af40f8a4@microchip.com>
References: <20220615113021.2493586-1-conor.dooley@microchip.com>
 <YqnFLCbvrTxNbG1+@sirena.org.uk>
 <7eda95bd-c7f5-767a-fe88-9f7109467cd8@microchip.com>
 <YqnSlIcAadwxt1Q5@sirena.org.uk>
In-Reply-To: <YqnSlIcAadwxt1Q5@sirena.org.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c34a8129-c1ee-4a3b-d872-08da4ecc812e
x-ms-traffictypediagnostic: MN2PR11MB4351:EE_
x-microsoft-antispam-prvs: <MN2PR11MB43514BB6DB93580307AEBEC198AD9@MN2PR11MB4351.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7caZNvvNUU6pSyKCaOtWJO9fpT9vtyXqjHuTmM9zYQolMVZaQopumDv/6in4vDmL+pk0D7eAhPLuILOusF7u6S3PBug67YE6n/7S6/VK/7+VKc2bhafCS+9C106DNMnNQLTbGNO/H2G4/gkptXEtTlC2gfhrrv0uWPeCSbVlbIDY38Cr1JWsWZSQK3Guf0aqLKoVn3u4TOaeGmXYAKvE5afYE2lFdEiFUClFjlgd0RLdct1cq911ovUntXtDxPdxd97A0aBg6o2JX6HG8uvoD8iQG8r6w/gaj/4YD9ipxKaHZIeMXxNcIYZraVIW+YDlvuqLF78eqkyIPG3Wi8dao0ynoPRaFTXQrBBXnoL5E5V1z8TrmQNiTvxe6EbfD4h/Raemh4Jyfah/Dhk4a9eYznCPVE3SiR7RzR6EfYoU/ihQXhJ8E3r6FSeeZB3/TxTsW114jNArJqFoDm2o1I5gzu5DJsvLZgDFNiVxpCBNzJhaNay/4mggKRPFSPqJJznnVmM//wPgcH4Ol0Ig8DGJokBBmJ/wiN0WWb+Pznx6zXBbqqE3XxI1aNU6mKphesf0Ko17uE9Dq2pXScRWyMwtGe45IiGSQb3xQqzGTUJsn3/WddXaHMMGfS4iODmO+PxjAYtKWTMj9dkIwHp4mFiunp0tfA1XKP4lwZs8yWJspsPGNNeIADWJrM8V2Et7eR2JL24uBjmQ8qykeGli07iBsyRRP84Tgrlc8M9u/w/ylJN2Ijju3yNIrCYpZgpwjW0kZjXL4XVD3+Q0uaP1XI03nA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(38100700002)(186003)(2616005)(66446008)(66476007)(86362001)(31696002)(76116006)(66556008)(91956017)(31686004)(36756003)(38070700005)(6916009)(8676002)(316002)(71200400001)(4326008)(54906003)(64756008)(66946007)(6506007)(5660300002)(122000001)(508600001)(53546011)(6486002)(26005)(8936002)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1FEUTN0V3JzUnhYUG00R1VPWXlNcmhNSDlINC9KNUFRK2ltNU4zbjVhMDUz?=
 =?utf-8?B?Tzdna3hkcWJwUFU4NjBVQUR5Sk1XUHltT0JoclMzMy85Y3hoejJ3Y2tVaUtw?=
 =?utf-8?B?U212bVArWlhySms2czkwWXFKd1FNaldvQlY5bnR3eDNjTHl3Yit1em5HdlNR?=
 =?utf-8?B?aDU3VVFJTG5SaEpFOXdvcUZ2Yk1mZW9SeFRzZE4yN0FJWjBDT3JhY014aHhQ?=
 =?utf-8?B?ZHN5NWpjaHlOVnFIYytLLzVCOEhudjMwWXh6UGJTNzdwdHRlcCtOLzZ1Vm9v?=
 =?utf-8?B?czZONnBNQ1RMc00vZGRGTCtOSElWZm9xZ2RKblRGRVEvVk91SlJITytGZHNU?=
 =?utf-8?B?c2FKSjIrL05neEJwNEhXVkczeTdkWnZwSCtLdnppdlRxOTV3bjZmU0JVRkgy?=
 =?utf-8?B?VVB0YnZDVHVEdTVpOURtWERiZm9EcnIybWZjVWMzV1RwR3NHc2t0NzJxSG03?=
 =?utf-8?B?THpuWGttSDJNS2VnMGRpSkxVVlFZc3BLczJGQlhPc2JrVjl0WnRLVWdzNWpD?=
 =?utf-8?B?cThXbVBGRitocHAwRnJjdUg3cVNPamx2WWIrMEMyWTlEVW9CN1J3aVhoaWVv?=
 =?utf-8?B?emVmb24yWUxudVRmdkJPeHhkRUkyTDRlZTdsWXdidDB4enl3K0lOWWV0bkJ0?=
 =?utf-8?B?bmdrU1Q4eDduSHVZcG8xWDdRcWtEOUdTL0dBVnE2TlZjYWI1TjNBODNQQk1K?=
 =?utf-8?B?TmwzUE1rdHdaWC92Yms3MlhPWE9iSmVRaS9xYVVvSmt3RzloeXBpa0MwOHpw?=
 =?utf-8?B?Rk9Wc2pWeEUyUzFVcTBGSDhnUHBwS2p3NnNyUGpMcWdFY0Y1QnlyMCtaeFFq?=
 =?utf-8?B?Yk1CL1p4cWVUcTE5bjAzNS8xVERLb3hqRFB1OGVwbU9mQnVnN2RKeTl6YkVH?=
 =?utf-8?B?Y0NpR0FYamlOZ3dsM0dqbUdra1NQRGVEZ21KWkgxNFZYRzh4M0dHY0swNnlO?=
 =?utf-8?B?TEhOTndFMko5NE95RzFUTCtzS25QQVloTFk2c3BKSXQrdVN3WEUwdEZCbEhu?=
 =?utf-8?B?UFcyQ1BBWWc5RkJjVkFCM1dMZEZSY0tqbTd4SkdTNTg4YVlTcVpTNW00ZVg5?=
 =?utf-8?B?NytLMmxDZWdKb0lDcnd3aVg4RlRuSUdNUW1YTngrZnovVHJPd1BXbzFMRWlo?=
 =?utf-8?B?NjhjLzMyUVNZZUtYcC9EaFJxZFludjBnS1hBRmROR1IwY0I2NmpjVlk3c1Fq?=
 =?utf-8?B?R0NzV2FJRlcyVEZ5cGwzaHM3d05rMHNhZWhabzJNU2QyWUxlVmo3QnhKZ2Vj?=
 =?utf-8?B?UXpJSnpoeHpwUGcreklyVVdIYk9MYWUzeHhDeXVOMkg0OEdZV0JLNm5DTEZj?=
 =?utf-8?B?QzhQaTZ5NXh4MXZ4cmp2VkNIWkFQanV5MktsZEVURXpSL2V1cmIyUlVNNlgz?=
 =?utf-8?B?U2hOakwrK2d5cDBVVG84RVUxeUVVeWNZcGFtNi9FYkpQOUZxMS8xNFcyeEd1?=
 =?utf-8?B?dHZ6RmFFeFQ2YjIrZEFTbGlCdkJVc2lOMWRrWlFkTjFmUzhUR0xhYzZaYzNU?=
 =?utf-8?B?ZEU2RUY1SGtwM1RzVnhSYTgycDVXdk16alNUK2FTODlMeVRBS3dmRlA0NXpm?=
 =?utf-8?B?YWJWR0hYMVg0NmhhMU90L3kycWtKWndyeCsyL3lCMTVkbjJ1RjZRdU5idlBj?=
 =?utf-8?B?MWZORHVlMFhQMEtQbEdpSzJCNmtmR0o1Uk1vSTZLYVI5T0xDOVdBRUxlTVdL?=
 =?utf-8?B?bHBUREh0L3BOUjlCWlFDSktxOFVWaDVJY28zemJrdXNmMDF2WmQ1TW43ZmlV?=
 =?utf-8?B?RXY3bXB0UEg5cS9CQkJzV2lJMXlMWERIekFhNE5BMm5lcmxJQ3JZSWw5cVdG?=
 =?utf-8?B?bElKK2E3Z3Q2ZmRjNnJNS1Z3ZjlZWWRnMCtKeDkrV3dxR2toYzJzUWYzSjBP?=
 =?utf-8?B?YnQxNDAxMU1md2JtY3BwTnFDcGlHRTNsUXJYMFpOTFNuRkRkR2U0dkZ3OFJD?=
 =?utf-8?B?dnJpM2hZUDB6R2R3VmprYzBHMmtwcjFYVE41K0xJUGZwdDZHMU9laXZjdWtS?=
 =?utf-8?B?eklkTWxkVEZVNHpDVkxsZXB4ZkgrUk9yL0Q1YWRZbkkrZzJxT0xwUWw0YXNM?=
 =?utf-8?B?L2lvN1dUTUdoaG5ucmoycUpqUFlMUHdqaDlCOC96dzJtdlQrbUhCTDBPQkVn?=
 =?utf-8?B?M3UvMGYyV3B6TURnVXpxVHpkNDBHNG1tVDNweEp2MDhVV1U3bXBkU3BaTU1a?=
 =?utf-8?B?UmRMdFJDa3IxMkNqcW0zZnovYnM1aDJuQ1FqenpzRzVhWDZsanpUbXo0MGxu?=
 =?utf-8?B?eDN0MXMvNzF3M0w2d2U4MkRLVTJlby80OEdvajN2cGpWTDRoMkU3eU1TTURq?=
 =?utf-8?B?amllRGcwbC9vdGgwaVFaQjVZMHJ6cWFLbDNKbzFZbmxVNnFIR2d2UT09?=
Content-ID: <175480358B582240B42BF6EB72C980EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34a8129-c1ee-4a3b-d872-08da4ecc812e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 12:42:27.3503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgoiLEuBRxVcUGRTcLeNmyxGTDbXidQJOcDNWroG0Ocha7SlCW3lgcSmbD72swdIxU25yg3hPB6zMFYpfZlEzainJQAPQQ56XAaFw25NONs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_054238_862603_352BEEDE 
X-CRM114-Status: GOOD (  15.80  )
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

On 15/06/2022 13:37, Mark Brown wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jun 15, 2022 at 11:57:37AM +0000, Conor.Dooley@microchip.com wrote:
>> On 15/06/2022 12:40, Mark Brown wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>> On Wed, Jun 15, 2022 at 12:30:22PM +0100, Conor Dooley wrote:
> 
>>>> -             ret = PTR_ERR(spi->clk);
>>>> +             ret = !spi->clk ? -ENXIO : PTR_ERR(spi->clk);
> 
>>> I think you're looking for PTR_ERR_OR_ZERO() here?
> 
>> Maybe I don't understand, so let me explain what I think you're
>> suggesting & maybe you can correct me:
> 
>>> -             ret = PTR_ERR(spi->clk);
>>> +             ret = PTR_ERR_OR_ZERO(spi->clk);
> 
>> But if spi->clk is NULL, this will return 0 from the probe
>> rather than returning an error?
>> If that's not what you meant, lmk
> 
> Oh, hang on - what error conditions can clk_get() return 0 in?  The
> documentation doesn't mention any...

If !CONFIG_HAVE_CLK, (without which it won't boot on the coreplex)
but I don't think I can be sure that CONFIG_HAVE_CLK will /always/
be enabled for other uses of the FPGA.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
