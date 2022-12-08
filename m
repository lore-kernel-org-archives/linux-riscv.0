Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A74C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 04:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22pXdh8T0v93VEhz+sEO0YLW6RA8ND9heB9O4NP+EkI=; b=k+L80j2Hk+XwLR
	hBb/feEAt91rj7PWe7m0GJxtTMo2iSrwfiOzpuZBaD28vLlZla0uPgYhQw6SIUlRvteklJ3oYx9oE
	xEqhmQDakh8kMcT9gKxwZycKsNPfWbuqRWFdlh1kYsoUppwrZezLIAUvCIO1NIZ9H8dHr8KMaor9U
	X6FA1mMSHta6mvg8yU2bQnCRyWgG5P0Hqm5EGPmw+MaIq2PPCGEaZ2fD+cBjURHADjcvVZsFgcBCN
	/sQ4TwTnfhn7aMeTX+mGdOw97EypW9rQVAs+7cJNWwAvRG+IRIYuzbdbd+mzdrxNYokjIVyOrVZ6O
	lZ9fiQ1W9UnXvaF8I7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p390D-001veB-7t; Thu, 08 Dec 2022 04:59:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3906-001vX6-GO
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 04:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670475554; x=1702011554;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/bInNdA4CUVI3VK+vE4JBZAPkF46S+6LTrB41zQv35M=;
  b=sTkvwkaDKGtoF/Tq4a6KhWpuhZ8Tz/RjbLT3ceNLzRHklGGPgD+Ff8qD
   JKX0fsBYs6E1n8XqQNrMhXrD6xntegOS+a5wxHLDVP68Zjk7RZUmIoWMG
   glfX0V9EQiwO5US7ZiXGcGJlBTpEOzFspHAjiki2DJWv+HqXrZ1LsW/TZ
   6lHOy/OcetXNnlbaJ8fakK5f7ezjL2DpfWjuH79fFcHR/g22Q/ROWCIEV
   lq+gyaJB3JJs+VCNYjeg7BP8hklC9YKpD9SEtDjrrnTntWMAift9YeWxY
   j5ME3QJz4lhYoTwplLs48i144p0G07nSIln1FdO1N1DT/aa7HJr8XoiVO
   A==;
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; 
   d="scan'208";a="127061336"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Dec 2022 21:59:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Dec 2022 21:59:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Dec 2022 21:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBAEfupfeFgBBM0Cuqqi4azhTvtg8CIG0wNQoMkhd3wu+c2ovc+QpZgEVGsJGIW5Azf33FY8PfumedsvXVRMyK86kIJK++zz9sT8iw9ALCB66wc549/1GLaWlhQKF0vglzyU32h5ILpE0/lmje0x8azT4h3bwodEsfdsZq8TVAOexFbpDpjhuR+BX5L5jz/DGHQNPg0lUIUddFx1FNNf/C6/xxeWXv4xYBaNwJWR3trBF7TKcKspMHjE3rSXebPRayaU2pwW2RXA2Td2rv7/76mHCY2qxfui1GHasEEyMkcPmOW0uLehKM148ju49NIE7KqXfHeyD1eKdXO0Iy2J5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bInNdA4CUVI3VK+vE4JBZAPkF46S+6LTrB41zQv35M=;
 b=b5vayC7HZHymz6NvOlnpSRLvWjX8CdwaWXuvNJ1N/3VdxgdUqNiqYJFwP4APWIa1+ft744ta/g43ToqUJB2Bd31ZLg/IXUtyCIS0kK2u0VQGRlgCzDYpjNdKTlviR6QbhHZWg4qL3R9+QXrSVR5B2iNEPNVG8FL0v/MY0VlYex3FPhQ24PyTTszNcyT2mLmRi0OyVzyqzVMAY8r7vZC+dYT5fH+L3qy9Ba381wCQEV4c17fpxa9kytgQz7TXwBNV5GWGECyz8/c/mc3QHStd3D2V1oretMHaoOaYIn49qy7ocD8Ci+sidDuM5YDcy0yQ9kVZFP3WWbWwhoLyN4f6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bInNdA4CUVI3VK+vE4JBZAPkF46S+6LTrB41zQv35M=;
 b=Dsxb75kaCtVYg+r/VaDs9agmqD9msh7a3YWN9qpZTDYUJbBojj+o8AFSOZ1buT/wdHgKRggAho/g2QNMnO79I9jyAtVkfTO50awAZr0YOrEJeGkK3VBtvjNTT5nLsSvVn4JsQhbM70w2JAyrnLWYaVUUSLTtvLBj0Sym0SATkOo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5440.namprd11.prod.outlook.com (2603:10b6:5:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 04:59:08 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 04:59:07 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <conor@kernel.org>
CC: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, <jeff@riscv.org>,
	<xuyinan@ict.ac.cn>, <ajones@ventanamicro.com>, <alex@ghiti.fr>,
	<jszhang@kernel.org>
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Thread-Topic: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Thread-Index: AQHZB+qAJbiET3vGgUy7ncmR2qkAD65iyLwAgACoyICAAAJBgA==
Date: Thu, 8 Dec 2022 04:59:07 +0000
Message-ID: <534c6246-2f7a-f919-932f-2d31dc277573@microchip.com>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn> <Y5Dfog2HYhejuDX8@spud>
 <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn>
In-Reply-To: <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM4PR11MB5440:EE_
x-ms-office365-filtering-correlation-id: d66e6972-365f-40e7-da29-08dad8d8f00c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6LFpBIH8ljdtWG3AZwHv2Gqhp2AlKUJJTGVlwBrXKhMcJmA73jwUA7iPRY2z7ixUijBjto8zU9khyUuHUns7j/UEvkxcT/28KxxDzUzJI5q4Htjzzi/UkvNCHOTIbsm0XG1vlrPKeJHMj2X5N94V9CsjYBqnWqyDit1RuXn3sKeWZN4Orqa5H63UTRPbTn+qh/h01yW3fD8GnkbEQBQOK7aZ4uJY6vTKiSTudbXWV3UXX8j+y0T7gipTuGFnrpUOyGw7jD6Ncuccd+11tVJ74OJcrk1Hi17f9Vgpx5zp8zVIm3Ow4QOcPDYAYewU1O1iwLOPFZzhTgbroS4LUoPx1lfRLB46y8SvjEg47ZDAA00BElDBhs6mNn1y9yoswUtbyyrEwJT2iOZUxg+4cJzAJpV1xgP/hy/JEZFBUcZlK6I2bk1aj5mnYV+d3gtdvc2IsXqyK3yYHFPcoLz/6XPGPShzjsCK1qUWEvjjQfR5aYnRpe64OLRSqKZiDOTUp7U9SP0W9QJkO0GWIeps+oltvq+TaIg0hXkcE+UJFdWq25S81O1KrtzK/5PajOrSsqrpMXOD/dns94j5/wR0e48HlxRstKl9WxtKr9t47W27b7CX9IueB9eN5PpnO3V4RqgilShlvX2DCSvw1To0uwyW+qYJYT+XmWVdoVgRi0QnQa9a6+MtdCYOamsjC9k9mH4FPfrTioejY/9H5YtC5zXskw/z2noKcFrCgIJs+5qjkGDulXog2uaIoyQMr9TQ9mA1BYQM8s9nBufnQBwWIFrekw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(478600001)(122000001)(71200400001)(83380400001)(8936002)(86362001)(31696002)(2906002)(38070700005)(38100700002)(4744005)(5660300002)(4326008)(41300700001)(91956017)(8676002)(64756008)(53546011)(66476007)(26005)(6512007)(6506007)(186003)(66556008)(2616005)(110136005)(6486002)(66446008)(66946007)(316002)(76116006)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXVNL2g4Y01yZEF6TXBEL3BlMmJHYnZ1VlU2QXRrUGZyb05RVVN2UXNhZHl0?=
 =?utf-8?B?bTZZd0FURkpnK21GU2pDUmRLcUJXa1FrTlNKbmsyWEtXbjByNGs2anZzM2Ux?=
 =?utf-8?B?V2Z3WFFuN1JoNjgrOWtFVXg4UmpyTVBXUFA2UklXRW5kL0syOURNQ1lzOUgy?=
 =?utf-8?B?d2MwWWV4eXE3RktnZ2NrMFhpaCtmTHRLL3BVbnY4WDJ2Y3RiN1pxN1I2Qyt3?=
 =?utf-8?B?emtSaEpmdFlKNUZWaHBRWFZ1cGNqZ2VyTStDVDBSUFc0T3dUblIvR1dpRGdr?=
 =?utf-8?B?UUlqRGkzWDkzaENQY24rMWJSSURycjBoalhQOWhyZnBvMmJKMGdNNWhxTW1T?=
 =?utf-8?B?ZnFUcS9GU1lFWElxRTBYcTh4R2cwNUptTWRMWlAzcW0wYWVpbGZEQUh5RURN?=
 =?utf-8?B?QUFuR1p4SldIN0d3Z0NaWkdGcmNZNUkrWlIwc2VBMnYzUTE1WE93RW1Ya0J3?=
 =?utf-8?B?MTlsM3RjbkttMmgya0pCVTcwbXI0cmZUdVR5UG1DbW0wYW5sWUVKR3Vha1FT?=
 =?utf-8?B?Q3ZKOUlZN091Nm44N2pzK2xsS2JUKzFOTGVRUzY2dmM0Q21NOTFMV1dtNzh3?=
 =?utf-8?B?MDl5RHpNU1d4aUZISjBFUXJxOFRKNytIem4rNDhZUWNsblBzcmgwUWFrK1dq?=
 =?utf-8?B?aGdyU3poZThNeFBHay9KK0tnWGFnQUpzTDhsYnFyT1djVElUckFWZWFyNzJk?=
 =?utf-8?B?OVlwUk91R1Y4VE5VeE1wSldTbFRtUnBVdlRIaTZqZXg5QkcwamUrRWlpbG5P?=
 =?utf-8?B?QklNR0lXK1prSFBzUUFPN2xuTmRnWWJQR0dmUU5TbDdFejZHNHg2N1lIcXNE?=
 =?utf-8?B?akhnS2pzdDlFazVSMEVHYWJENDBOaTlld3hOcDJMSkI1d0M1a1crbHp2V2RD?=
 =?utf-8?B?dkN3M2MrTmd1V1FWWkZvbS9tQ25wM0NMaEtXTVNJSE1Jc1Y5c3JYSnpjV29G?=
 =?utf-8?B?bzQyTk9iTWdxWmlrN3AyekUvWXFwNXMvQVo3TjZ3cFdud01MUEE2K0dRUzI4?=
 =?utf-8?B?VGZacDlYZUJsRkR6VkUrQzk3aCtJMTY3SXFzQVlDZXBPaEhiY1VvNCthZzVw?=
 =?utf-8?B?S2JRQ3JFS2FVdmxJbk9rWDV5YjR4UWpPTXlaSWdSSW16bEQ1eXRLbUJzNVN4?=
 =?utf-8?B?azl4R3I3UTNTQ2JWMjJ4d3J0U2RaSjU4WlFTVEJpb2c4cUlJMFRMZzZxRW5l?=
 =?utf-8?B?UXZSWkZHSjlweklja2poRGNWQnBMUlFmclZBRnlGVStORnp3eTV5OG9Vd3JT?=
 =?utf-8?B?bE8zeWhjandTa0JwUzZaT1J0L1RIMnRab2EwM0pzQlEzcENtdENkQTVWdCt5?=
 =?utf-8?B?MjdVS2JQcHJlMFl1UXp2U2xmSnRqOTdHcG5yeHJndUl6RDIwcldJU0JqbXRi?=
 =?utf-8?B?cDhRZ1hleFhPcU9FanZWUlNsZVhpSmptdGpFVTQvdnpMSVdZWnhnaklFd0FG?=
 =?utf-8?B?NDBBdVRiS0c2WVNEN25KVU9JYVVvcGVncmw5NURla29yYndiTDZheUZsSHdj?=
 =?utf-8?B?MDNPL2RzR1psTnRZTnhoNHhGb2JiTUNubVhJQ2ovLytreWtoNmNvNjZLOEJs?=
 =?utf-8?B?eU5EVDlDckVkenB0OXVCeGdYSEJLTzZrTFVCam9OaG5USVVUeHBscHltdUhr?=
 =?utf-8?B?MDZOd2VEeENGQ2NOdEdSQVNPd1VIRFR4ZmxSTXJFSEE2a0JZeVZNZ20vOFVK?=
 =?utf-8?B?QVBhL05uNmdpbVFFcnp3aEkwVWhtejRXdVBQLy9rWStOb1duQzVndUgrZDZC?=
 =?utf-8?B?TlFYOHlkelVadXBVdUNhMjBlK0lrN3RZKy95d21tN29ON0ZjRndudHY4NlBr?=
 =?utf-8?B?cHdyMWpHYW9QSFNlRVh2eEJQbm9qUUVMOUlJYWxFQjNFQ0FWTE9uSEM5eGxE?=
 =?utf-8?B?U1lKT1F6UFlGRHEvWU9EKzJMSzV2QzdLM29oWDFwL2VuRk9ONzBKcEhqRysv?=
 =?utf-8?B?VzRPSHhhaTg2c0lZSXY3Tm8yVVo0S2x4eERac0l4KzBpZ1hDV0MxbHZDcWla?=
 =?utf-8?B?MG03cDQ0bWtyMEtxV2lNV2NhRExTdVJacjFYd3JIZzRvcDlTclMzbndwcTIw?=
 =?utf-8?B?bU9LWGN4WU5xRFlweTFheTlIQUV3ODRYSzVCTy9Hclc4WjBqeDVQaWxnTG1T?=
 =?utf-8?Q?OxGXhNPVvTU3kQsil9LTKQNmT?=
Content-ID: <2B7D69D670909E459D75D3A26122D4DF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66e6972-365f-40e7-da29-08dad8d8f00c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 04:59:07.8099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /gdjN/j4FSxwMmUBU8NHv59kBUfWm4amS3faFI5hikv20ib5csNJCngiCIMFcBsF0qyb8hFZa2YvCQpptDvr5clb34XS17yBEYh2x10Vxso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_205914_892688_7CB4C077 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

T24gMDgvMTIvMjAyMiAwNDo1MSwgUWluZ2xpbiBQYW4gd3JvdGU6DQo+IE9uIDIwMjIvMTIvOCAw
Mjo0NiwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gT24gU3VuLCBEZWMgMDQsIDIwMjIgYXQgMTA6
MTE6MzVQTSArMDgwMCwgcGFucWluZ2xpbjIwMjBAaXNjYXMuYWMuY24gd3JvdGU6DQo+Pj4gRnJv
bTogUWluZ2xpbiBQYW4gPHBhbnFpbmdsaW4yMDIwQGlzY2FzLmFjLmNuPg0KDQo+Pj4gKyNkZWZp
bmUgZm9yX2VhY2hfbmFwb3Rfb3JkZXIob3JkZXIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0K
Pj4+ICvCoMKgwqAgZm9yIChvcmRlciA9IE5BUE9UX0NPTlRfT1JERVJfQkFTRTsgb3JkZXIgPCBO
QVBPVF9PUkRFUl9NQVg7IG9yZGVyKyspDQo+Pj4gKyNkZWZpbmUgZm9yX2VhY2hfbmFwb3Rfb3Jk
ZXJfcmV2KG9yZGVyKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4NCj4+IFdv
dWxkIGl0IGJlIHRlcnJpYmxlIHRvIGRvIHMvcmV2L3JldmVyc2UgdG8gbWFrZSB0aGluZ3MgbW9y
ZSBvYnZpb3VzPw0KPiANCj4gTWF5YmUgd2Ugc2hvdWxkIGp1c3Qga2VlcCBpdCBpbiB0aGUgc2Ft
ZSBzdHlsZSBhcyBleGlzdGluZyBtYWNyb3MgbGlrZQ0KPiBmb3JfZWFjaF9tZW1fcmFuZ2UvZm9y
X2VhY2hfbWVtX3JhbmdlX3JldiA6KQ0KDQpZYWgsIG1ha2VzIHNlbnNlLiBTb3JyeSBmb3IgdGhl
IG5vaXNlIHRoZW4hDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
