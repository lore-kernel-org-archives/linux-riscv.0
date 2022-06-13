Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31FDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 06:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hn78B4of7CpOH5FOCFmLQFBn9akK/fSli5DyFUBwCGM=; b=Yk5SSMsGGQbwSl
	odTBnlz6J501/31TiLNkZ9U+Xme7DFv9V1exS7leFq9fs268AHbzwR8qEMwnwwHlH5RAYkrCKk8It
	pT4F76hTeYCkNi7pVJ/9bj7P85NeytttpESOjY508/Bqw1CP+QVBLCqAXV7L/hf1RqPjId+LIu/go
	+qumR3grfNFid9OYeSQwI7DWWhPEiFolAQJKrwwMGUd7llmUAkuoa3hoA2YFcTImHK6F2JH43xw43
	8I4YEYfO6lTy85a5MBvycpIHnUr5XHgbbJYPE5+wUE9ESWlAcqUsg28PoY/LpYlQ2pJzRyxC6WrpO
	brTU2QNEK7LWSvSsYLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dWD-001eRJ-B5; Mon, 13 Jun 2022 06:25:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dW9-001eQI-Uj
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 06:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655101541; x=1686637541;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e7vPPXNRiz6ITT90Y6jGBQKgIXDf7baP3AQhB7ifxas=;
  b=1sQqinJBOkVacSyadn27TiOuOACpYr0ULPvmSt/oauzm+Dz1KpoePtOt
   5HBC4AjcXQZqRFnjCybx/obgjY6k3hHVUEnyo5bH21uWSK5R5VEEU2XQD
   7klcP55fxRd2y+TTNegpa2kO50U2rZY2eQaOk2XVEY6wYGB5coFJmU4Fp
   M6F/a+OIzyJId5KP+V5FnqZ33tditLU2/AZlSuqA8YDiANfYEVjWUlNbs
   E8UbyRbtpBHGUTUBOdiBo175FgsaCkWrJSJvRWRaVIIpmVdNfP1ZpmlZh
   mI7zokurZIAqmozRnHOIDDpCj1XCuZv9FvLadItGeXBkpFc//qjSH6JfY
   g==;
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="99705221"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2022 23:25:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 12 Jun 2022 23:25:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 12 Jun 2022 23:25:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYWlyPu6RT185c9j3j8g9cyXBsOsFrND8KAZ5XAl/9UNWQGMCKfPTa71sWfMs52I5jxOQXLdLobhL+chEseohjl0JTGjlP5wCp/6BDTuaJPTak7/BbHUiZEmF1Qk+NoWyCBp2fauG7MpcW/N2Q9NYZ8IaZ7jochXxpmwIglUMyFKh+fLds3DGuLcBc4Og4cpDuabs52+/L7j7pIusu0xXYqVACOutD6cIc7gPq3JLI/WPKxnDUUlslcgOzZdNF2zJOwKCguyIzIvvi3v9J/RPmYeQIR14DJPg1NhsDETgjD0XOtnwQscSiPS0B3EmtiGIZK+jn9WyURDk8thM8B+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7vPPXNRiz6ITT90Y6jGBQKgIXDf7baP3AQhB7ifxas=;
 b=QEiQqj8VJzi6bktK8WRgv2d34N6dO9Nrf4KN9lhgOny7P6X4ZUvMRZ0WI4SAhXEqLnhZGPZPNPuVACcAf+Px2NNJHXOWWvHONnTwOvrIyI/Mu8/tdgrY9LLijAwXBUnhdm/Dfxe1L5nBsC5JdfsIztXETzCixUlFWik5Pzg1qvt0KG2KY4f7HyVVq4b74H+sqMuN/X1/Ir1CVmi7Vohf2e6aXMlYy8qWvJIAO1T1O9FhO5VabMLIt0r8KGBHkOSrpYi3AI4XVKl6ZoduLnpdT5IIGct2HaqZnRP3pOH1VE5M32uRGaGBjO/U2pdObs4Qb+7jLWNQthNQTNkP2istFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7vPPXNRiz6ITT90Y6jGBQKgIXDf7baP3AQhB7ifxas=;
 b=bzKWTJFYIMfkHnv6EoOP5mCBMS6WU+Jy1mJihISG53/kz2zQs/PIJmwUE3M9UYBDh/klE650sU/ZOeEvF32IEPW0L/dK+n5uy7x/zoDbmcq0YdsdOwAp43aIL9RnYhZcFh2sTMM1cj3Gn99GZIXefxo3HBlvbvDtKpt+Evg63Nk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1876.namprd11.prod.outlook.com (2603:10b6:404:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 06:25:22 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 06:25:22 +0000
From: <Conor.Dooley@microchip.com>
To: <coelacanthus@outlook.com>, <palmer@rivosinc.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>
CC: <xc-tan@outlook.com>, <dramforever@live.com>, <c141028@gmail.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<guoren@kernel.org>, <yash.shah@sifive.com>
Subject: Re: [PATCH v2] riscv: don't allow write but not read page mapping
 request in mmap
Thread-Topic: [PATCH v2] riscv: don't allow write but not read page mapping
 request in mmap
Thread-Index: AQHYfuV1GWsMvwuZjEWjcn7lYAdUl61M3n6A
Date: Mon, 13 Jun 2022 06:25:22 +0000
Message-ID: <ea438a37-1736-27bb-32d5-560fd434654c@microchip.com>
References: <PH7PR14MB5594801243EB482C01963A2FCEAB9@PH7PR14MB5594.namprd14.prod.outlook.com>
In-Reply-To: <PH7PR14MB5594801243EB482C01963A2FCEAB9@PH7PR14MB5594.namprd14.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09feb610-ba46-49d9-c274-08da4d057e9a
x-ms-traffictypediagnostic: BN6PR11MB1876:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1876458CED1537B0188AAD9C98AB9@BN6PR11MB1876.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CgzEs4j8ZZx0VIGEeuGtwfKVSB+3h5Vea3LUKp3ioo4Eb+6Rulu9LkN+YzuuZ+h/kAWHaFIDrmMwOl8xWXY+8HgsOhQEva2gqknYd/lVvoCub/0Up34ZfwlwYVb3kk1AYRXEHDoCBwGBMza2qYWfENhnuEhc1w6X7gTj4Dtx11GVmhEdhbT5YB2lF1CKCfau2HvtkJEzsr7Pq+mmfCqXwsv09m9lh1YbCvAo+2/sAYB/vymkLhkhj/zMVG+RgrsWZukev7+SQeLnSnOK01wcqPWluVqyiWsbw4mDKtbCDF4pJofmwtktN8Fhrh+mMmqA+KZjUNsgZUOYUatF5VBo4cGsTvkvJFGHVE17aEUsHDf59YMnHInyr31Wg12x9hti+EkFMK7A3k0ec8nS4ou1MFDlON1gDJz/QH8uXEFRdNsTBXPlW8KnolPm/9c+snGlwOxjLsogSQJtPmzovMuQGH86Ws2XoEcaRRPVsG6GFBH6tNMlahAIlkTcHsgwf2s7Rxw5Ft/kW+2Z2vmCB1Sy6UwAAtHuLOxU9PjN/XofWdmw0OnqWyhfamsX2JsGiEBMwNFqLM528YQQna0SilTNQlpGcYxr+W+fzwkhta7SGos0O8ItsGXCmpRVhi69VLFTEZTh6twO8mHDUjyvWBmUh11QZwsG2zVU2XfU4J8wSVmYy7Gy+17NOPv7cSw/yB6eYiawtG2BM4fIIBjekF0sJdRqNX2xtHDIwaYTEwl1kEmhc2h5OrjJ8+If9ZjrKWeChD3Je/JVomORmIG8lceAinsx76fVBbEZsUtGD3AELhS2o8WWUFmeHOm84UpApDSEBlCP3AQWsqV2ZHP8UaHem6gsxs/uXS/Ub7l9FAr+TsaAWewWLRi0/dnAMZhy24nqcv6C1grEm9N2CnnQ4m6w+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(66946007)(45080400002)(316002)(966005)(508600001)(6486002)(110136005)(66446008)(26005)(76116006)(91956017)(54906003)(71200400001)(6512007)(53546011)(31686004)(86362001)(36756003)(5660300002)(31696002)(8936002)(7416002)(2906002)(66476007)(4326008)(2616005)(64756008)(8676002)(66556008)(83380400001)(186003)(38100700002)(6506007)(38070700005)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkZCMnltdG9Vc2I1OUxSS1BpYVFPdVlhOWRSTU03WUF3K3FFVmJSY1QzM0Ra?=
 =?utf-8?B?K0c3ekpRdFhvaG5oKzV0dGN3ckhpNnZER3d4OTg3SjhLU2hTOHJZU3B0MmZq?=
 =?utf-8?B?d2dkK3JsWG5hcThua1M3RTFKQmp2d3NTR1JtblBicWVucnhvT0tlS1dPVjdJ?=
 =?utf-8?B?eGxybGdCcjI2YlZCQmFUUmpickg2L0s0YTEwZ2VZLy9LaGVRVXhyWkt1a2x5?=
 =?utf-8?B?NjhEQVdRUWgwZjF5Y0dZenNhMFhYdmx2YkNYQ2NXTlF4UytEZ1M5MjhUaFds?=
 =?utf-8?B?dUpLaUc2VXlSajgza1AwcHhzMmpjd2hvV0lKZ2FvTEZhYUZDc0xvNFg4QUl1?=
 =?utf-8?B?c2czK3NDMm9DSzVuM2JEN3N1ZEhwaVA0MDM5eTYwdEdhSjgrcUhwREdSajYr?=
 =?utf-8?B?Tlo5cGMxQjNuNyt5ZFhEdGVVd1dTemVPOE9pb3hleTBHbFYzK1VUSVU2SXlB?=
 =?utf-8?B?ZEFnSDVpZ3EyMDlKRnpaV21iOWNxYVhLclpUQ0JWRi9CSUUxUWwzd0N0QlVF?=
 =?utf-8?B?Y202bTB4ZHYwQWZOYjYwbEZNMzJ6M3J5WnIxYmw5aFVTSUFmVFYrT0Q1UU9Y?=
 =?utf-8?B?YWJZZEdWdDZPY2EwWld5NkVyZ0tnWjhVNFFCMzlHcGJTTXY1WFNPRmh4c01V?=
 =?utf-8?B?Z2syTklONEVCUXNBeDBPQXVEVytBMHpyYnpPZXZ1YXBSRVp5MWRwY0kySnVo?=
 =?utf-8?B?OHVCSXFtMHNYZTkwOHRKdGpyRGh1WVN2TmljU2x5QlMrb05EUWdSRW02ZDl2?=
 =?utf-8?B?VXd2N25qa0JmS2lZd2ZhOGJETnJCRCttcHVmS2EvQVJZS0kwVkVrUnFCYy9E?=
 =?utf-8?B?cG1RbWp0V1pxUHJOM1N2M0V6VVRHdmRlV0lhUk4xcTI1YjU2L1dJZHpXTFFn?=
 =?utf-8?B?Nnp4Yy9ZVzA0d1VPZ3RnZWZhS3pFb0lHQmxORGRiTzB2U0p2VG5UVTVERm1z?=
 =?utf-8?B?WWNFSDNaRHhCN25sWEEyTkFGczJkdVFMSE4zVklpZG1KZ0lVL29adUhkZTlO?=
 =?utf-8?B?b0YyYS80VE9mNnY5WDV5cXpPL3BGeGlWSGNpRis4blE2VGNRQ3h4S0s4a3lN?=
 =?utf-8?B?d3dZSzE4Yk9xaWlWbm1SOEtxQi9zR21JM2o0VlJMRjNvQWxMNXZhcGVXL0I5?=
 =?utf-8?B?Qm02djRsK3pCWjZMYlo3d0RYOUNYQ2lZTlRReDBmVTRWOUNpWlpMVmI5MXho?=
 =?utf-8?B?MWZIZWJNcm9KRTBNblpJa3ZrTHE0WnB4emdFWERPZU9lSlRFZytxTnYxQnhV?=
 =?utf-8?B?TUpKTXRMTytqb2hqNHI4MzhseDF2aFM2UHg2V2Q0K29zZmtoM2JrMlJBODZr?=
 =?utf-8?B?clNLbkdpVkZqS0ViQUwrdWU1UzFla21nS3VuQjk4Qy9FQkJodFBoMkFWcFBB?=
 =?utf-8?B?eUErVndZV093R0VDQzBHQXRNTnB3WmRxZkFMV2FrMUpNSXBhMVprVFo4TThl?=
 =?utf-8?B?R0lPTmpFazE4YlFzb3NKN0lhNElkY3VETVFsajJ1OFdNWGhhajF0em1UUnh5?=
 =?utf-8?B?NlhRRjRZYTVSRWJsQmM3dzZKRXdXbFFubkd6ZEl6WW9CdHhSSkgya3c2eEkv?=
 =?utf-8?B?STZWa3lWNEVsRVo2WjNwS0krUjI4ZkkzV1BBWWlHb2N3bDB5Nit0UGQzUFhM?=
 =?utf-8?B?dXdTeUJodXg0SDM3dzVod3hyNVF0ekFiSlMzSkRaMEQwaTlFSWhTWFVVdWFE?=
 =?utf-8?B?c0lRa2pzeHJzUmNiMU9xaS9qeUJ4N002eENUTTJ3Q0NwS00xMlpBZk9NNEQ1?=
 =?utf-8?B?SFlZYjMvdnpQMG8vZUh1MGpoajREVldLdlBkK1RhbEx3cVczNHg2RnFzT3R2?=
 =?utf-8?B?UjI4TE8zNHM2ZkdGTWxnM1oxeG9UUlNkN1JiY3M1d0F6c2dUVGxHM01VUUxr?=
 =?utf-8?B?dC9wSHJlR29ZZysyVmM3ZkVVbDZnQzhSdFNtaTIwVnM1SG1EVnRmYTZ4T2ZU?=
 =?utf-8?B?TUNGRWVaSWZtSXI5eWcrQUI1OURPZURMc2xKYUhSV1lvbnNsQ2dRWG42K0NL?=
 =?utf-8?B?bDF6cCtZU05LZS80UEV2c1p1TlFCMEk0WlNOTTlRc1c1eG5HajFpUFIrR3Vh?=
 =?utf-8?B?cmE5cjlQZkovdWZuZmozTXA1azVlc282Y1ZoZUMyemhDcG5SOGoxM05FK2o1?=
 =?utf-8?B?b1I3M25KUC80QUJyN0RtZUhHc1pFU1dpMVU0QWxGQ1FPeDRJQ3dMc3dvZXVQ?=
 =?utf-8?B?T3VsMHRHR0tWSGU3cHZTb0VSUFZsWXRGbFQyajRPQmxlSTVKQWd6djhsQzRN?=
 =?utf-8?B?MGdMNXVydjh3b2tKcGdHa25PU2ZaVjkzYUdtUk9UMjNWb0FZRG9XeFJKaCsv?=
 =?utf-8?B?dElJZ2I3MGFJZS95ZGNHU2pSd2VxOGdDdHEyd3Zwb1dySXBvOFNxUT09?=
Content-ID: <9BDF4A8F35E5F54EAE43F6CE2141D2E5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09feb610-ba46-49d9-c274-08da4d057e9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 06:25:22.0437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1wlDRHDH4cs+RoR5NAoU+sL0M7z+qOm08cnjfbMwlSxwTt+OLVn1Xf++VTW0HBOJxdPqcIoueig3q7GmNDf+A5/VY0mF3cUsEoYm6f3ocpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_232542_356016_63B41472 
X-CRM114-Status: GOOD (  25.60  )
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

On 13/06/2022 06:20, Celeste Liu wrote:
> [You don't often get email from coelacanthus@outlook.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> When xctan tries to run one of libaio's tests
> (https://pagure.io/libaio/blob/1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448/f/harness/cases/5.t),
> it encounters a strange behavior: for the same PROT_WRITE only mapping,
> there was a discrepancy in whether it could be read before and after writing
> (readable before writing, unreadable after writing). After some investigation,
> I found that mmap allows write only mapping, an undefined behavior, on RISC-V.
> 
> As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3 version
> "20211203 Privileged Architecture v1.12, Ratified"[1], the PTE permission
> bit combination of "write+!read" is "Reserved for future use.". Hence, don't
> allow such mapping request in mmap call. In the current code[2], write+exec
> only is marked as invalid, but write only is not marked as invalid.
> 
> This patch refines that judgment.
> 
> [1]: https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf
> [2]: modified in commit e0d17c842c0f824fd4df9f4688709fc6907201e1
>       (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e0d17c842c0f824fd4df9f4688709fc6907201e1)
> 
> Reported-by: xctan <xc-tan@outlook.com>
> Co-developed-by: dram <dramforever@live.com>
> Signed-off-by: dram <dramforever@live.com>

Those don't look like "real" names?
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> Co-developed-by: Ruizhe Pan <c141028@gmail.com>
> Signed-off-by: Ruizhe Pan <c141028@gmail.com>
> Signed-off-by: Celeste Liu <coelacanthus@outlook.com>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Yash Shah <yash.shah@sifive.com>
> ---
> v2: This version adds a link to the referenced spec, and reference of the
> previous related modification.
> 
>   arch/riscv/kernel/sys_riscv.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 9c0194f176fc..571556bb9261 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -18,9 +18,8 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>          if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>                  return -EINVAL;
> 
> -       if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
> -               if (unlikely(!(prot & PROT_READ)))
> -                       return -EINVAL;
> +       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> +               return -EINVAL;
> 
>          return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>                                 offset >> (PAGE_SHIFT - page_shift_offset));
> --
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
