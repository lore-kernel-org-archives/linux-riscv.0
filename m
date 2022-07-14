Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60724C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31LA3OddL6NkrSfkZ6Co0rQZaXtMGvo9TJqwu5ICgMs=; b=ntTGZA23nZfPY4
	JQ/Njym28Pp01GLbPVU+Z1whqErR1YXmPM5gZwa5uMyLhm75XcT1hhtUtVLzSiFawZNwUT+SvWsNm
	GJb+dfZ40v5IqrgPou5f1dgxTJBPow/SBNNlexv2TdcWaVT/XlKzMJGRP+n6n/XFdObOSQfH8zLGr
	bmsT8YKWqddDxpO9BujV+htXB7zSTJYNsI+wTI66cdG5mL71wzbqrXxi8naN+FGZZO8gDciewwxbx
	LRHU68F24hVHJ2dIjCgvTGUM+MPrihG/W6jARvavQsZ6uaWy1Hm3UFKCqCJZ15HDo2JO6pL1ybS4V
	zQp77jgcmbxhBN5quXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0ki-00Fh7U-Qm; Thu, 14 Jul 2022 15:27:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0kJ-00Fgr3-VA; Thu, 14 Jul 2022 15:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657812439; x=1689348439;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jGC5ZfKdhaw1xtGGRQ2hdUqqCVxwiWKPbvS2yOoeEXo=;
  b=EvfIQVMSI3F8/fmeWlyn6gAuzlll9latDn90x6CKuuPI3MomcFDs9r1v
   UrhpziI3l99GZ/KH0b3BGYaKodJcIEr5sQfGK0zCfERHCh/YCaf7WW71I
   GgLU+C6oDeY+HxZ6ulv0BOWCz6XhUnOQSh9Yn3IXq7kaccwtLSBilNVxO
   aM1Qo+lFLZEetRa5laDuxWpJbr91vJg0Cj7irjriVw3UPs0CqPYfZ7usQ
   3KaHP8s53FXqJiGBixAZ4uji1NJz4+ECsYK2IUOsojDsaO1xnqPbWwbEN
   BNJJDgUlrdyIIjvfrQ8aHiyBFPariNasch0cP0fcLboPP1dAXKHWTYIZx
   A==;
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="167851292"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 08:27:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 08:27:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 14 Jul 2022 08:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj1nJ6sH1O5HX6Rk+3+eItF+yM+Mg3XBukN4dzy0AbU96gluAR2o0Waz9f+U1uY7GqWc7kNtFjpO2ec+pHdYKh5/aPW9+xNqZqYu4XyGdTE+UQxZ2SnsyIG6P8HW9YtICbePWrRvSWWZEb5HH9fkoTDIiFzNoKlmO/y+zloeYHkzLVFBg9OrUmFwF73BkYFdvw/iCrN/SrsO2woIU/c8YCNI8lujA6LHRx2TBA4rzaQMAxS6Hx+WE8O/oVWiIAJ7ZMKHw6QJTrNt6mTmf3vLjk6CUE0hvEK1V9Iowx2cTUDvNxfmlFvOiNCPy3SrKmTYZ4uZbb12DdBcle2a+Yhqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGC5ZfKdhaw1xtGGRQ2hdUqqCVxwiWKPbvS2yOoeEXo=;
 b=HYGiQs4gC8B0Vd0i08Fcxq1kZeJCuyDlXVK+jTv44aiQu9+kFehnkPsPNx8QI3pGb/JqhFBpsRO9d+2oDKkMsdp8DV+Z2oFA6hBSRAgAea0p9tZE4qXMhF/jOkCHByvbTt+ZNOd7GEb10DawG4Ifspkvd2WbXMXoKx3hr9DpdhiwzccUfiGDIsWV0vpeA36Gf5GyjL5XtSBw9cyvmMoT8wLQklX0ZJIoq/FH/yeEBXjo8b5L54btjMNJ2k7VtGLcZESPP0DMEN6VjRDtI89swxWwSLMuLmgNsdE0BzWtH+B4b7IjJNgbeqtm6ay3J2588g7BhBz0smHR4Xznff9JEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGC5ZfKdhaw1xtGGRQ2hdUqqCVxwiWKPbvS2yOoeEXo=;
 b=NikR4rhz9Cita03xXVZcVBkLUoNEXA8613l04rYXLrhrOLPcay57HvP3PdZ21MA/8+YNvBtMadUUty9bkn/JXi2mR0MTbUzzb7Vq+oT13iSr9JoLSFNCDAKAwH9ym5IIgIzlU3iiFg/SxhUjjIt7OvUgtdQPU22nmWtPdLiC/3Y=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2537.namprd11.prod.outlook.com (2603:10b6:5:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 15:27:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 15:27:09 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Topic: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Index: AQHYlr1LjktvAhTwm0O5ibr9nGIi2q19638AgAAMFQCAAAdOgA==
Date: Thu, 14 Jul 2022 15:27:09 +0000
Message-ID: <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
 <20220714150100.aqvmdgjkymc2dr5t@bogus>
In-Reply-To: <20220714150100.aqvmdgjkymc2dr5t@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55bf0567-3a95-4ee7-7863-08da65ad5199
x-ms-traffictypediagnostic: DM6PR11MB2537:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zWQ+JwVKhoCgR2838G4Z2PG2MxTjrdxjuT9qEw/8fj+tY6NZ+3Nu/30n8s11wnU284DNKJhSbOouzy1kArq6SHWVX0b5EGpjbjc7+H0rM/ELibrEufpk1qATeRTuebhWZ4yCpFqqCJJwYK/X0HiaSTQElXboSpjnH9f6FNAjJ6iMQiJR8X5z+kJwyN4GA9t6600jGpAJLTxwV7aze5hpRCYlc9d7YYWXllvh4aWU/tGOcXKB9tTbxntqQ2JMvVR3KtvujakDbvHimTib+JzU3gJc1MTyw/ZswjxGu/SBxnVEFe/Z5CupUfES4BpYLO0whfC3ZBRR8bH8U7r6oyYYegFf3aPJAgshEBlTuAt0lVw5XZ9Ra/KZdDdMIWyuRxsv6XM9wQ03LR+hX/B7CKxEVZ7WQXVbJTsOTl9UDMmL0jk9r2uxNxVCEbvnOl24UdXYDicojd7G423NQGZx/WliOwYvKHnu4JZwe57aIhOD8V30hu6BU/vL47NCoPIlh9w8/ZD2yGA0gLJtIqDzfRp4XECPtPcjcb2TQfMmU1lqFbsczlVwHlwjlM2ccj2fOs0o62/ODQbFbfah3hAPhqMniGdYqvLTlAvFp+ju4WSQu/r959/1ZK1XX2MHgDb1de+nURdeAfG7+tbU91djH7e7xIPJeuTIhxSqKHKQkPicNrI3JeLLJ1ghBHahSRGjeO1ZzulCp2SGUXQBahL57MZMddNKhkW2fl3kF9IPAtqJMblbw+zNONWQYEvXCVhdVz0cqYwbbnapFvBdairvGFJAsTHvfLzmZX33FDDVVT1sdD0sWK4bf/F9dW5mKo0jEDXkNV46AREqedK5qDp1d8lS9+oB6do8/EOm0cw8u/ezhoG9MHgY1Uk3qWNLU+Yyv+vs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(366004)(396003)(53546011)(71200400001)(316002)(38070700005)(6506007)(6512007)(8936002)(86362001)(478600001)(6486002)(31696002)(36756003)(5660300002)(26005)(122000001)(4326008)(31686004)(8676002)(76116006)(66556008)(66946007)(66476007)(91956017)(66446008)(64756008)(110136005)(41300700001)(186003)(2616005)(83380400001)(54906003)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b290WmpyY3NYZkdrZzZrWVdHS1llWlRXZytyZXlFK1Jkb21kdFNSNjBxSGF5?=
 =?utf-8?B?VmRMWCtDbjViNzRGRTJSNkNrMENoOUxZQ3hWT1BVdmtXZGdMTHFaaVRMamNG?=
 =?utf-8?B?MXlIYU1GSElmQjVKcDMwYXZRNEpZbXpKZC9yekxWM0MrOTdJOGU3UkZVbndn?=
 =?utf-8?B?Zld4R1pLL2oyU3ZXcWtGa0xFVDBXVG5YUy83VjRwMjUyaVM2dmorV25jT0VB?=
 =?utf-8?B?S1N3WWVoemdaVE91U2ozZHkzeG1adncvUDlMRURDRmxSWXgxTDY0ZU5zNDU3?=
 =?utf-8?B?Mzd6WVFvU2JJTDVOZGtpcDlDMVdiTW5McjVHNVJsNE1TTmJjNFpjQ1U5SXdL?=
 =?utf-8?B?UC9wYThpNE10MkNBOUlZMDMwaVk5dUtBVXJ1Q2NDdzc3ckVza1NhMzUyRTB6?=
 =?utf-8?B?WmlQbWs2aW1LSi9oM2QyZmJmUVpJdlkrNVExM1VMbmJGR01aYTFHVzhxMUdr?=
 =?utf-8?B?YVBHRUpXcExRSHBlRUdiQlhveVZ5b0Y3dVZ6aWV1cjlaM1g0YWJsb2RYalo1?=
 =?utf-8?B?eGVSK3pXandYVVQ5elFFaHl3OCtrTlcxckZNSUhwOVg2VXdCeU5BSm5JSVpo?=
 =?utf-8?B?YnZITjhoOXZzejR5c2s1YUx4MnJMbVgrSWV5V3NabkNiZWRFVlVlMlFYZkFo?=
 =?utf-8?B?bjJFdjlXdnIxa2NsOUFzaHBIQ2dHTDhvdmI1K2Y5REVyZlVLSU5qVXRSNkpk?=
 =?utf-8?B?c0cxc0JUUUpLSE9jYjN6bDdkNGxCd1Zubm9IZVQvaTFCOUU4S0xTNW9xVjBt?=
 =?utf-8?B?a2FwVUprS2tuNXJ4RVc2OHdoMC9rOWtIUFpXQVVzMXdaV2FDbm5qUExENGlL?=
 =?utf-8?B?UkgxWkZqVFlZSlhYOG9PbWlKT1BFYjl2cW0rM2gvbzFyRzZWL0tSY0J4dllp?=
 =?utf-8?B?Tzh0NTNNSURNbit0OFlBTldIS0hzbjk5d0pEM2c2ZWZweWlDd2wzZnp6THA4?=
 =?utf-8?B?UjN6azY3K3k5ZG1MblJ4SVZWU3pIUWV4V2tQQUw4b1JyV2p0S3EvMVRDSEZn?=
 =?utf-8?B?SWlRVzFUM1ZvdHNGVzRPbzRSdEVlWkdnUmR0ekFHMmlyVFVucGd2UmtoRHZ3?=
 =?utf-8?B?NGpSQjhyZlJ4b2NBdGdKSDhRUGVrUjdOM21RaG9xcWVEaGFiR2FKQk51SVRr?=
 =?utf-8?B?ZGV0dDZZNjBLU0F1NDh5VWxRa1JSNkFIaHExTHU3cFZqT2ErVUJPd1FtZllV?=
 =?utf-8?B?Wkw2Ui8xcG9XQzNFV3FNVTlYdXV2VVg2WFAwY0FVMDBsYmttZUQxdTUzYTVm?=
 =?utf-8?B?cVVTenFaaXhkRHZpdURKamdJWTB0dnk2aFZVbjBEKzRDZDRtM1ExalFtdmpN?=
 =?utf-8?B?dUV3NFdjdFpkZ3hsMlJxbDhiTmNVNnIxWWRybHpoQjZxUUZJOTJnN3hpQXpi?=
 =?utf-8?B?NXhSdjI0Zk8vNm14aldwN2oxSC9POFYzWDd6MHdUMTZDVjFQK0xpRWJvVGRx?=
 =?utf-8?B?UVhLOWZHU3hRMWI1WUNnRnc4VGpMbnlzNmpRSTNPNHY0Tk5maHRlc21lVTBo?=
 =?utf-8?B?ZGNzQjhDeG1vZ2xEa3IrQTF6QmxzbWllZi9OaHBYSC9jRm5kaTNSb3QvZ3RC?=
 =?utf-8?B?WGJkc0FRY1hock85SXYxc0tNdDJxM1VjTElYZHpVYmpaT1dzWXh2d24yb2ls?=
 =?utf-8?B?dlpnaTdKM2JDb1NIdlJETTFMd3crSVcyVHZxejI5NkJ2aUpYYkpvRkNianVP?=
 =?utf-8?B?ZHlTdVBtTW5uMjFxTVlSQ296YlNmdEdPU1ZXQ0FUQ2M5Z0dHTWhPeWxCQ28v?=
 =?utf-8?B?TGQyMWdiNUUvRFd2STBqYkxvWHZualR1bEpuUnJRREpmdmduWXJ2dWRkcmVn?=
 =?utf-8?B?ZVZpeVVHMFF6Y1ZjOEdpbmVXMitLQ3hSK2JvdHkzdWI1QkRhL1hwTDBlZVlL?=
 =?utf-8?B?SFl6eXBya2I2YlRQU08vMS9zS1RveHRaNGNpSUwyUDNTSGo1VVFNWFd4djZ1?=
 =?utf-8?B?SzdSc1BmY3NBT3ZMVkx4UElHbmhnN2ZSbWQyWEtOcFhYTm1ISmN3RXhiaEpz?=
 =?utf-8?B?OFFKVFNrN0FYRS9BdnBxSCtFQis2WktVVUlMdHh2OXp2OW0vTnk3T1RJRVhz?=
 =?utf-8?B?VVhkQ2MwQjJFS3RKbEhsYkdWbDhic1k3S1Z0MytXbG9hZTB2bFhkSjlid1ZO?=
 =?utf-8?B?cyt6R1I2djdGSTVjcHp0R3pGR1A3TWIvZEhENHdmUkwxbC9ZMkg3aHRONmQ4?=
 =?utf-8?B?NGc9PQ==?=
Content-ID: <754BF887A885334CBA40242E0A79314F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55bf0567-3a95-4ee7-7863-08da65ad5199
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 15:27:09.8481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3jFQyGdLnvoxps9Q4AgyDPGBMk19ZxxUsQ06wUQMQGHArjUVmn+Y3PeLPEPSVFz/qhja1+q2S3npnQAdB9jQCMFIn2LAzQCyTvFcWZHtNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_082720_114212_8608406E 
X-CRM114-Status: GOOD (  24.37  )
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

On 14/07/2022 16:01, Sudeep Holla wrote:
> On Thu, Jul 14, 2022 at 02:17:33PM +0000, Conor.Dooley@microchip.com wrote:
>> On 13/07/2022 14:33, Sudeep Holla wrote:
>>
>> Hey Sudeep,
>> I could not get this patch to actually apply, tried a couple
>> different versions of -next :/
>>
> 
> That's strange.
> 
>> It is in -next already though, which I suspect might be part of why
>> it does not apply.. 
> 
> Ah that could be the case.
> 
>> Surely you can fast forward your arch_topology
>> for-next branch to gregs merge commit rather than generating this
>> from the premerge branch & re-merging into your branch that Stephen
>> picks up?
>>
> 
> Greg has merged my branch and all those commits are untouched, so it shouldn't
> cause any issue as the hash remains same in both the trees, I just added just
> this one patch on the top. Did you see any issues with the merge, or are you
> just speculating based on your understanding. 

Speculating based on it being a "could not construct ancestor" error.


>>
>> Actually, we are now worse off than before:
>>      0.009813] smp: Bringing up secondary CPUs ...
>> [    0.011530] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:274
>> [    0.011550] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
>> [    0.011566] preempt_count: 1, expected: 0
>> [    0.011580] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.19.0-rc6-next-20220714-dirty #1
>> [    0.011599] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>> [    0.011608] Call Trace:
>> [    0.011620] [<ffffffff80005070>] dump_backtrace+0x1c/0x24
>> [    0.011661] [<ffffffff8066b0c4>] show_stack+0x2c/0x38
>> [    0.011699] [<ffffffff806704a2>] dump_stack_lvl+0x40/0x58
>> [    0.011725] [<ffffffff806704ce>] dump_stack+0x14/0x1c
>> [    0.011745] [<ffffffff8002f42a>] __might_resched+0x100/0x10a
>> [    0.011772] [<ffffffff8002f472>] __might_sleep+0x3e/0x66
>> [    0.011793] [<ffffffff8014d774>] __kmalloc+0xd6/0x224
>> [    0.011825] [<ffffffff803d631c>] detect_cache_attributes+0x37a/0x448
>> [    0.011855] [<ffffffff803e8fbe>] update_siblings_masks+0x24/0x246
>> [    0.011885] [<ffffffff80005f32>] smp_callin+0x38/0x5c
>> [    0.015990] smp: Brought up 1 node, 4 CPUs
>>
> 
> Interesting, need to check if it is not in atomic context on arm64.
> Wonder if some configs are disabled and making this bug hidden. Let me
> check.
> 
> One possible solution is to add GFP_ATOMIC to the allocation but I want
> to make sure if it is legal to be in atomic context when calling
> update_siblings_masks.
> 
>>>
>>> Anyways give this a try, also test the CPU hotplug and check if nothing
>>> is broken on RISC-V. We noticed this bug only on one platform while
>>
>> So, our system monitor that runs openSBI does not actually support
>> any hotplug features yet, so:
> 
> OK, we can ignore hotplug on RISC-V for now then. We have tested on multiple
> arm64 platforms(DT as well as ACPI).
> 

Well, other vendors implementations of firmware-come-bootloaders-
running-openSBI may support it, but (currently) ours does not.
But, if no-one else is speaking up about this, my arch-topo changes
or your original patchset...
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
