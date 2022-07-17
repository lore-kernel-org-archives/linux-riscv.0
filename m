Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5966EC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfIVAf0C3+fGvF7nw7th+A7/0o/Z17mGw8cCHDm64+M=; b=fnjguTS/fP69MC
	4QO6J1WBLQaqloZ0SMIqL+ULV58sksU1AmpIJtcaQizjl1uDbilvKm9P9/FES/QEYRxcBuxVY+TFX
	IPl11FRB9qUy5W4Doa56TLQeNSzG9s5DL9iZ3wJ+USWAHVBRgcVVIHg83F1atK+RAajMLcHZxVJPS
	aNhwMMJ/sI9/BqmoAnTmN9NQKhSk1Fyb1rp8XUn+765fGx+D5I5P2B45bQNmhNMmerW08y3TRiMEJ
	NrNE3E08NtqpDPXk+ev+6JjMxHrQO+EJy7SAXT/qzX9KpEy5GKbAKXa3FoAMFSppF9HFklLtXnK3S
	kOXEZ+cdQ51n9nws7LJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1Pq-006L5a-Rz; Sun, 17 Jul 2022 10:22:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1Pm-006L3m-M5
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 10:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658053338; x=1689589338;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nMblLwzT7ZCM7KZdFn2Fpv5G002QGu0UNN/6EldSr7k=;
  b=ulMofV+DkwjzNnCxuT7tTk8RiFq6NwHdNabu4EYAva/Ety+AMn0mRe0L
   bVEGfNTQrMY+rCjjLuga+xq2Jsmqc/W+I+JkDS1341MS1RTiE1N8Yk/VH
   niwgBqKGATMEhiKfs8e2rvXz+x26FphI1vUT01XWyYxwEZyQ/xqqYmk3i
   N7buVHIyepU3kZXqyeHVWwi/C4gSIEAdTyEOBGyOLtV31PgjRrZXhymGU
   AHfZ18tjfqaa2RGqoel0/uftXkHSIIm699MjkGC/wDqSZd+8PBPJ13mq5
   mcfAMVuEi4lQ4oo9pl4Yn7StprLGPXxchL1E/ESR+duGBJ4vATkCK6m4d
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="168183947"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2022 03:22:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 17 Jul 2022 03:22:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 17 Jul 2022 03:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiNy4RV1mE/yBaNubhC2fV3qGrISmeEpTqQ0uXkxY8wQD2EItc1w2LopzwdFyvXB5TmRl5+pZZ2Qht2NdL1vVMtR6fjdlU8b0XyHZ+JtfZMNQ6bJsTwfGbj/MFlyzyeglqdn/ODeApxLnozI3+tFQ5g/kXFyOp/BE0xMdEDv30GtqJ2ZJVgzzRVguamkAmp8lyxbqyzHda7xD7m7pBEM28QbGIColZ3zYTEHknuUBdju8NefT9R6nU/U4BX9fzmMMbeCq1a8VwMFSvf/VcSYEG2WFruL8e9fY70a916IWX5p8Z/IzQBRK0nTz7poTfF0BIzz5wh6t2CeGMH/eGu4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMblLwzT7ZCM7KZdFn2Fpv5G002QGu0UNN/6EldSr7k=;
 b=KwhJrnT3Z1Bfzre/Pxzt9aDAX49lLsFPQ9ZR2AWlRlhpeZEgst+w6gfRYTWgLbJjXFzgtKhd5xn7xMSmNRRkmNAWOvx9GllnqQwsMqrcjPrPpwBF6mJumMUyAS+NH+JaJdor+Ge9dqlXrA6qka0SG8yd2r9vrVuD1NmiC9zKCA+17gS9Vl1u/yejMbn/t+5OvCTTSxm4oVmtaDSK5pOKDJBItoyGguBFuW2Dy1i5rqmT71T0PIdsLedrcHiMF1NzfOGehCEDQ0uI4sJn7W8V4+ssm6wdf2jPJIooyV4p84Q9NCt4oqoH+k9qdZegfqOwxV5lHjmWinroSNv5QNQWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMblLwzT7ZCM7KZdFn2Fpv5G002QGu0UNN/6EldSr7k=;
 b=sLMue95h/g8LaZivruYfJ+65qkhN82jGT0Ztw4iNss51hHOM0mYEaiIQ+Yz+8AyjjDBqlWnJnqzS2qiIzMZWIYeqk30rpBJZqVvxgDwZFZZ3+fFE8EL9oFX0zCLsM8BYhGh5aVYf7dcYO0H2M8f3KKWQGD09/ceYzvxUbjdbYVE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4317.namprd11.prod.outlook.com (2603:10b6:208:179::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Sun, 17 Jul
 2022 10:22:05 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.022; Sun, 17 Jul 2022
 10:22:05 +0000
From: <Conor.Dooley@microchip.com>
To: <xianting.tian@linux.alibaba.com>, <crash-utility@redhat.com>,
	<mick@ics.forth.gr>, <heinrich.schuchardt@canonical.com>,
	<guoren@kernel.org>, <k-hagio-ab@nec.com>
CC: <linux-riscv@lists.infradead.org>, <hschauhan@nulltrace.org>,
	<huanyi.xj@alibaba-inc.com>
Subject: Re: [PATCH 0/8] Support RISCV64 arch and common commands
Thread-Topic: [PATCH 0/8] Support RISCV64 arch and common commands
Thread-Index: AQHYmZX1KE2nVkr4z0OTAx8W9By6mK2CWvOA
Date: Sun, 17 Jul 2022 10:22:05 +0000
Message-ID: <925abaec-755f-4009-c2ae-1a8aeb1ae101@microchip.com>
References: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae980d86-8b62-4dce-c648-08da67de3283
x-ms-traffictypediagnostic: MN2PR11MB4317:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KH43Fm5mYPfqOk+fYLFOjhi0r174F4myYz4jjz8TmBwy1vhi2cb1OaZRx7c6ZtWYf86Nqi/vGjsAzi8KJxuULNuTz+DdH/9pGcWfO2UH2WG/Gsb1XHk4HYi650j4cw36IoeC87uZCvviGnveO0EIXk+4ELyah+Iu4zDViJKyy3H5rniN5RqfHvwxdYPG+35XoFBWdnzcnt4KWF56Ho2BLdaa7dx3d2352AgRgRQ6Gj6ZMmn3HJCAwtAkRjNW3pnKL6LtdtOOwWF7QxRGE5JVzSpn5IykYzFo0AHqxKcl1OjunQuRlOBX/YWoN+XDnj+5PBUPxrKx96qbra9jka1etb8fXbTlEm3Y5ly9SPnQRxjE6C/aHiOpFzrFcMr1LmMlGlPHJw831zTeFZCYo86ce/kk/57KVJrHL0DT8vibFjU77F/Y6QdLjxvlfYkYBgYfGa7docjeueId9TnBEVyc5AlUH67pSoHDj5OBDtP+NZIo8+qxEIb1VxhH+JL7lYEreeCEnsJTuuXxHzap6yaPW5Wh1vD8/YbSgF1QoDtCU/TR5QP2aqCQtwuxjsxXfV/IQXCpl3X+9J2exDNZQ0Pu9LlUw5DV6n+za90ttM8oD/Q3IBSwaCr6uU+DmsKvKcyT4ShPfi+/QQ797UZA7CQjBL0M+J9i2lxTKAr2Zg9wSIkZxJoRx4Fae+SCCSRdcFVwZNqQk89hqn2fs2G1LhUSKYR0zJvjxA9+5zMz5IQ7Hmi8KAwmNGBJnPBFFChTNguwl/jgO6MrNcV5zat4j8A3V5np49gi1eC5+DlDFfcE4xsO2L+ahmlqea13WtvXVTRF+mg2i7ZNzs/LzfD4BmtzM2YS6biVAbcE3/Fw9Df63B85nb1yF3C0GS+GlUSKkEucvqfIzelhQdUU2G8XURW1gfOBkm6pzTQ8yKlrnskhptUYbVluHRENcSBscdzUW5Mn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(346002)(366004)(39850400004)(110136005)(8936002)(316002)(966005)(54906003)(38100700002)(122000001)(41300700001)(26005)(71200400001)(91956017)(76116006)(31696002)(83380400001)(6512007)(86362001)(186003)(6506007)(478600001)(53546011)(31686004)(6486002)(2906002)(36756003)(5660300002)(66946007)(66446008)(66556008)(66476007)(64756008)(8676002)(2616005)(38070700005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1FXSEpKWDhRQ1BYSlZMUk1nUmlHek1rZElUUkJrTk9QVGV6SDE5eVkyQUhW?=
 =?utf-8?B?UnJVcDBHbStxV0lFZDRFKzRLM09OSnMzMHRPNjc1RUVXVkFZSTd4QVF0cHdp?=
 =?utf-8?B?bXRhMXRjcnVIUk13UkZSUHJybWVzdFN3WU1JZEJWYTUxMzh0SFRlVVN3UFNQ?=
 =?utf-8?B?Yk9Hc0cxT2hVWlZya3R3QithK2lHV3lyNGpQNThzRVluQTV2VGM2ejZHMzk1?=
 =?utf-8?B?Y0tDLy9hdGhoZVJUVEN0b1RvYzdhakhJc0paSzdPQmgzNHI5ZjE2eVJzTjVk?=
 =?utf-8?B?UUpLckNBNUJQYUFMWlp6Y2NNQzhCVzcwUGk0N2xid3JmRTZxOC8wWjlwaUlQ?=
 =?utf-8?B?c1lGdzZwRXUrdHBQVTlLaGc3SHpod3MxVzdJMG03WjdxZEhsUVhvUXhpcE4w?=
 =?utf-8?B?dGRCTk5YS2dwM20wUHlVdlpxbldyQllrcG1pRWhUVTRta2dmZnFnN0pFL3ln?=
 =?utf-8?B?OVcycHRrK1VzVVBiaCtXb3QyVEdQOERaa1NWeHdHQmpINW56clFkaW1PY3pJ?=
 =?utf-8?B?dVg2c1h1MnI4MUFVYnNid3k0NDhSWnlVNFA3aExNL3Q1a3FpRVRGT09lb0l1?=
 =?utf-8?B?RDZHYmp0ajhtb1hXTTdjc3ZrNStzRE5QNkx2bUpreVpBTWFiODZVcUtleHJi?=
 =?utf-8?B?aDFjL3JSaWxYU3NmbzI2R3JFeXBVOTVaZGNDMWFTckpYOFJJREF5YkRGM1o0?=
 =?utf-8?B?N1lJMEJFWW9oZlRRV1ZzZkN6MG1JSW56VGMxSmVRZmU0Z3R0V3d3RUVpbDZp?=
 =?utf-8?B?Sk8zWmJ3ZGRoOVYxU3k5WFBsNWdhK0Rjb0syb25UUWFzVjgybVhBUG5FWG83?=
 =?utf-8?B?dTZwTGI5a0RMQTR2a2MvcnhmUFRaWk9Cb2h5eXZkaXZzRTdGRS9VSGd2dEd4?=
 =?utf-8?B?VmtseXRLU2RDNWNLeW00TXI3VzEyZTRxZ1RPNkkzazFiV2ZrY2lERS8vYko1?=
 =?utf-8?B?eTg3eWNrUHZtbW1IZ0pEWHViVldLLytVVWV6MC9Ra3NMVElCbmRLTVEvczBZ?=
 =?utf-8?B?WXlTeVp6VTJjRVhnRGxZVnR2VWF5N3B4ZmJSME1McU9VSTBCQlExY1FjRXZD?=
 =?utf-8?B?VC94NnNZTmx2cllIdnJYaWJFZDlTRGJoVE1wMTRFODJzUmszWTNSaEFROVhC?=
 =?utf-8?B?eWhWWkZPb2daV3JjTFI5WEU2TzdvUFU2bFNzdDNnamZSV1BzRHl4M3RjcUdu?=
 =?utf-8?B?S1B3SFRma1Q1SU01VU4wb2hWS1BjbjA0anVBSUtZR09xUUxiS3cyRkd0Mm04?=
 =?utf-8?B?S2NxWUFrWG9qMVRLVzkvN0NWZ2lFejZGMHZtTnhsV08rejBzcnpMcnNqK0lZ?=
 =?utf-8?B?M2FpOThiSnYra0RNN0tCUTlaNXM1dmdMbDVKam5GalpzYklVYWdHampOQ0Zk?=
 =?utf-8?B?UHpxNDZRTGxsTTZEaVgxN2xzL3BUdURsRmZVbm1Ebk1JdG50dlU0aDd2TWZJ?=
 =?utf-8?B?Uk90L20wS0RzdmZ0dEJMdVZrTzdsYUlpNzJkeGtBNEFIVTQ4b00ybEdFVlVK?=
 =?utf-8?B?VTNtclI4bkVLbEZvMHRUTFRINlVyMzJ3bXBTRlorWTV0QVhsTENjY1BZWVQ1?=
 =?utf-8?B?VUJPTUltYklON2hSNlgxcmx6VnRRc2pxdWg0dTJ1eW1RbU14UExvaFRDVmRr?=
 =?utf-8?B?Mm9yZXMyd1d0NThXTVMwMjhyS3Z3bU9QeTdjcGtib0JaSTZnRnU3K0tzWjVL?=
 =?utf-8?B?ZzRqZmpRc0RJQ0xVYkhSQTJDaFlTWVcxWmM1R3JSbVdGVGxUM1JCaHNRWEFi?=
 =?utf-8?B?UVhFS1dXSzU4bFBWbHdGM0RkQUdQRzlKN2xxTjhSbVVsVVh3UGFmUm9tMlBt?=
 =?utf-8?B?YndRZm15NjZkcmJ6bkMvMnY2dGxrZG5NcVpTRkM1STZmNzQ2cHorSGJicWNV?=
 =?utf-8?B?TThFSGJFcUp1d3V1eDVmTTk3OWx6WEMxOHF6Ukl6NWtTNGM0R0FZNFRYeDNh?=
 =?utf-8?B?UkNzZlMxWHRLbldmbXlsWFNrVCtJNjNmYlJCVUNBdk9lRzhUNGt5anZyNjVC?=
 =?utf-8?B?U1kyVnQxTDl5UktsRGRlNFNJYkZsU1JhRmtINTIzeGlCK1BnTXNhKzRzd3pt?=
 =?utf-8?B?cDM4bWN4cVRLckVkejN1MFdZaWVnMWllOURZTG5lZ0ZjUkMzME9BVzRObU0w?=
 =?utf-8?Q?AlscqzrXAjRWpZE93kpGSwuMD?=
Content-ID: <A89CE10762D3E34F8DBCCED964D8DE77@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae980d86-8b62-4dce-c648-08da67de3283
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2022 10:22:05.3931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDWFye+ql3UUF6ODrLWZETBXjHbBx01d5D7b1/HXCI7AXFqjkQjmz2Cyxz4IvP1y5K51oIuLqFw6U+7ABnPprEkFmu+S1Mam9ddpHmwQVEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_032219_089371_4B2709C6 
X-CRM114-Status: GOOD (  16.26  )
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

On 17/07/2022 05:29, Xianting Tian wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe

Hey Xianting,

I think it would be useful for non-kernel patches sent to this list,
if you specified what it was meant to apply to, for example adding
[Crash-utility] to the start of the subject line. The crash utility
list seems to apply this anyway on their side so it seems reasonable
to add `--subject-prefix="Crash-utility][PATCH" for the benefit of
others.

Thanks,
Conor.

> 
> This series of patches make crash tool support RISCV64 arch and the common
> commands(*, bt, p, rd, mod, log, set, struct, task, dis and so on).
> 
> To make the crash tool work normally for RISCV64 arch, we need a Linux kernel
> patch(under reviewing), which exports the kernel virtual memory layout, va_bits,
> phys_ram_base to vmcoreinfo, it can simplify the development of crash tool.
> 
> THis Linux kernel patch:
> https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
> 
> This series of patches are tested on QEMU RISCV64 env and SoC platform of
> T-head Xuantie 910 CPU.
> 
> ====================================
>   Some test examples list as below
> ====================================
> ... ...
>       KERNEL: vmlinux
>     DUMPFILE: vmcore
>         CPUS: 1
>         DATE: Fri Jul 15 10:24:25 CST 2022
>       UPTIME: 00:00:33
> LOAD AVERAGE: 0.05, 0.01, 0.00
>        TASKS: 41
>     NODENAME: buildroot
>      RELEASE: 5.18.9
>      VERSION: #30 SMP Fri Jul 15 09:47:03 CST 2022
>      MACHINE: riscv64  (unknown Mhz)
>       MEMORY: 1 GB
>        PANIC: "Kernel panic - not syncing: sysrq triggered crash"
>          PID: 113
>      COMMAND: "sh"
>         TASK: ff60000002269600  [THREAD_INFO: ff60000002269600]
>          CPU: 0
>        STATE: TASK_RUNNING (PANIC)
> 
> carsh>
> 
> crash> p mem_map
> mem_map = $1 = (struct page *) 0xff6000003effbf00
> 
> crash> p /x *(struct page *) 0xff6000003effbf00
> $5 = {
>   flags = 0x1000,
>   {
>     {
>       {
>         lru = {
>           next = 0xff6000003effbf08,
>           prev = 0xff6000003effbf08
>         },
>         {
>           __filler = 0xff6000003effbf08,
>           mlock_count = 0x3effbf08
>         }
>       },
>       mapping = 0x0,
>       index = 0x0,
>       private = 0x0
>     },
>   ... ...
> 
> crash> mod
>      MODULE       NAME             BASE         SIZE  OBJECT FILE
> ffffffff0113e740  nvme_core  ffffffff01133000  98304  (not loaded)  [CONFIG_KALLSYMS]
> ffffffff011542c0  nvme       ffffffff0114c000  61440  (not loaded)  [CONFIG_KALLSYMS]
> 
> crash> rd ffffffff0113e740 8
> ffffffff0113e740:  0000000000000000 ffffffff810874f8   .........t......
> ffffffff0113e750:  ffffffff011542c8 726f635f656d766e   .B......nvme_cor
> ffffffff0113e760:  0000000000000065 0000000000000000   e...............
> ffffffff0113e770:  0000000000000000 0000000000000000   ................
> 
> crash> vtop ffffffff0113e740
> VIRTUAL           PHYSICAL
> ffffffff0113e740  8254d740
> 
>    PGD: ffffffff810e9ff8 => 2ffff001
>   P4D: 0000000000000000 => 000000002fffec01
>   PUD: 00005605c2957470 => 0000000020949801
>   PMD: 00007fff7f1750c0 => 0000000020947401
>    PTE: 0 => 209534e7
>  PAGE: 000000008254d000
> 
>   PTE     PHYSICAL  FLAGS
> 209534e7  8254d000  (PRESENT|READ|WRITE|GLOBAL|ACCESSED|DIRTY)
> 
>       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> ff6000003f0777d8 8254d000                0        0  1 0
> 
> crash> bt
> PID: 113      TASK: ff6000000226c200  CPU: 0    COMMAND: "sh"
>  #0 [ff20000010333b90] riscv_crash_save_regs at ffffffff800078f8
>  #1 [ff20000010333cf0] panic at ffffffff806578c6
>  #2 [ff20000010333d50] sysrq_reset_seq_param_set at ffffffff8038c03c
>  #3 [ff20000010333da0] __handle_sysrq at ffffffff8038c604
>  #4 [ff20000010333e00] write_sysrq_trigger at ffffffff8038cae4
>  #5 [ff20000010333e20] proc_reg_write at ffffffff801b7ee8
>  #6 [ff20000010333e40] vfs_write at ffffffff80152bb2
>  #7 [ff20000010333e80] ksys_write at ffffffff80152eda
>  #8 [ff20000010333ed0] sys_write at ffffffff80152f52
> 
> Xianting Tian (8):
>   Add RISCV64 framework code support
>   RISCV64: Make crash tool enter command line and support some commands
>   RISCV64: Add 'dis' command support
>   RISCV64: Add 'irq' command support
>   RISCV64: Add 'bt' command support
>   RISCV64: Add 'help -r' command support
>   RISCV64: Add 'mach' command support
>   RISCV64: Add the implementation of symbol verify
> 
>  Makefile            |    7 +-
>  README              |    2 +-
>  configure.c         |   39 +-
>  defs.h              |  248 +++++++-
>  diskdump.c          |   21 +-
>  help.c              |    2 +-
>  lkcd_vmdump_v2_v3.h |    2 +-
>  netdump.c           |   22 +-
>  ramdump.c           |    2 +
>  riscv64.c           | 1414 +++++++++++++++++++++++++++++++++++++++++++
>  symbols.c           |   10 +
>  11 files changed, 1759 insertions(+), 10 deletions(-)
>  create mode 100644 riscv64.c
> 
> --
> 2.17.1
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
