Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B07ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0Kk65Ww4tSPl3oDVz9JDqDIocJnlUn8+9O7zUC0yz8=; b=czJxXMpXWgfv41
	v9ean7RZs82sHSW4xpwouqjyAxVVqTq8oMUjFQiTg9ah8iID210HLAKv8pQHuLTGR44pHA8Af7Uil
	KWrW/bzSpfEsj4W+hfQNgywQLb9+s5T8/FvpFg7Ne300EKoQ2V5dw4EzMnW4CwWHDmzk0EfQWEMC4
	DJS0dDeDF5UPPEW6esCU5xtH+RpVm5PYsQrluipVuUlI9iRHOCthE4Um1PmjifYDJiX2axTZKYI2H
	jwcMId76XV/cVMhlTFJOpsP5vxUDx1Sn+U+23XR/23aO2/qhesAlgOJ1EdG8UIMw+cSIKksK0gTKn
	A2XR0bQeWl2j4pEKSqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuzm-00EW3A-7A; Tue, 30 Aug 2022 06:45:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuzj-00EW1s-Q5
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 06:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661841907; x=1693377907;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z0J8vv7HLE/vCRq1rppUryfJYNhSBksJ9omLtYdaxrc=;
  b=kdld5jtLfwcTYSJdLwnks4Y6Obt9GH34GuGb5QFWu2yvcBpgVlWF08/B
   8jTjLUeuhChFf4U2qSa0P9a7chtB8isC9ASGSEYy6jnxQDJash3EKRpYq
   pPwB7uUXhDU65g2faQ/o6RDCYt+xtsxz9KA6CzdgUFBTZuM7aBxLv17Wm
   CjchK8ZKWzBB31DbXUVMYjG8Wx0BbJHRfSQ/v/TZrKcTa1AeZNrYEVTHB
   iRr/90rGa7fPzIiTxxaMETwWHdvFshSc9qVMMgh1jM7RVcrini1gzCDgs
   RRIwWQ7kiToIJTBfHl0Y8Eu4eKbmmqAU7T6dWkdcvUdbKtIOfswogRG0m
   w==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="111329406"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 23:45:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 23:45:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 29 Aug 2022 23:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmHSpfcBfqwQA299yzqNpyEHa5y5M35SL94oLEZ5sg8vTi8XHdcFFSjZr0RBhrUyW9hH2+FXNDsXzoTewXmZ97qmqORy39J6N5ryrUbwPC7eTCDHO8LSbHJRGi+GvlGJBWOH0px+68yRNCoZ4H25s3NdH+TwCDtqaBBVUCJ/VZQj7vAR7m7rJ5QQMxDkWPZT/TD0vUwmPqZj6VSBwojs/PyFp0hsQu2b+0YwUiAY26VThXDYXO2VEVhfJs53j882xfxy+OUNGYfQwsCsQVSsxrvn4x26RSCVhz2o6pPZFcMckFGYul74POgUuCVJEin9CWXQLRAesFHbb534Ho1n+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0J8vv7HLE/vCRq1rppUryfJYNhSBksJ9omLtYdaxrc=;
 b=fZnqSEGn/uE8BSLeBhAXEnc0/NoSjGJLfBW/P/iwgJKSt0k4bI2cW9LvCU7PnsvgSEcRMTofb0T4Jb2M7+JHyq8UN0CAsu0wpezG0DmeJaID42VRk+PzsAXmexNxmT6I7etC4pphpi8Vb1f+i3V8pB7WhWCRnhAAPXXrvZBvNfqJ8uR5nyFTPMfJkwwFnb85gknGG7q2DCzW/jBgxSpzmUJGBoD6Y2tTFAtQ9kczYi0ArOh8t5pJmzi5HsXLV/qq8DLWncV/mb/6W9Oes+1sZEfFlnalk1n/ycV0+ouYHR/Z/xBNoOMAPygj013IR9OARiOcdm/TKfcxkMKo5qBqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0J8vv7HLE/vCRq1rppUryfJYNhSBksJ9omLtYdaxrc=;
 b=h7jzRPBY6DxZ/J8isKGc30ilie5szsQx/89wb0LeJDVS8Fdd4ial4wBBdJAffz6DNzaqYBYV29HqonTfhD7rYUe1B2c/a3M/A4Mcw3ac/i8mb+L697dm8HRvFKLK/mzPVKpAVsiT2HrdTmPrth53Fs/tN+yFxxsDtEpo9+8b0i0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3116.namprd11.prod.outlook.com (2603:10b6:5:6b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:44:58 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:44:57 +0000
From: <Conor.Dooley@microchip.com>
To: <Claudiu.Beznea@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<p.zabel@pengutronix.de>, <Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 03/13] clk: microchip: mpfs: add reset controller
Thread-Topic: [PATCH v3 03/13] clk: microchip: mpfs: add reset controller
Thread-Index: AQHYs7HD94G0z6Dx0k69R3PXo6PTEa3HD1yAgAABNQA=
Date: Tue, 30 Aug 2022 06:44:57 +0000
Message-ID: <ed1d4fb5-c9e9-39de-d21a-4156991e9e37@microchip.com>
References: <20220819095320.40006-1-conor.dooley@microchip.com>
 <20220819095320.40006-4-conor.dooley@microchip.com>
 <8726cec3-858a-b0c2-ab26-c1e2d2702776@microchip.com>
In-Reply-To: <8726cec3-858a-b0c2-ab26-c1e2d2702776@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35123389-dcdc-4031-3d86-08da8a53279e
x-ms-traffictypediagnostic: DM6PR11MB3116:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PT80bZwrvpRqT+KRgb1GC3UBPqzE9cN7DqWHWCkaW+AjlLRDibxeX3pH4IhVu4ZeIZ54KkMDyFgD85kAFP+zQs3P/ly9llHMbkl5p7ItWVVF4/pvAXd7UkYv0Jna1QjmkPT/UfGqwPI+Ch3B3tRfqIjblr0XM9o4a3GTePz46TRQvFnLbK8UqO88BFIlLqVze/dCV0EVyqkd/WwY1VkQ5BNCzyoHnlCjguBMI4ml3vqZp2b/Dn9+plQSCN7JiYbd3kcnPx9gyoKF4GoglehboyJ5Xu93waEvj+qw2asWk/AqmGaB74KSFBm5bYE/FEv+CBzARJXspLmbmFbYEELvETs3HpEsAEmG6NQBaIO/0DwSQGcRwzHO0RmF+0olnOLFRsXDbN3B1Gt1z1id3/haK93g/mhDN9Nv+39jFJTNvTiLx3OiPcTU7gLgRubM25C5EqGWC8NMXAddG5aOL9cM0sibgxZtaHsLDE/mIsxnR61yzAA3PMGfJjuBKqR8AMYR7brbFG64kukgguG3NpdslsNyu3qLp5j/en6fAtGJ3DrltrRRmvr8jRfRU8A0fqdggbMQNFlSKskOWJgr76mlQWmRLC3XJVHhbX56cSWybX88ZQzzZ8m2mpZ+6mHY82g/odpL1imuWxn0IiEmnyETBey9NYVTlHsU94goDo4t7TIk3B8jZg5nnVt8J+ehQv7GuEmXcH87KRyETB2Lm/PFuqKGsltq89MCKoghrBM3Io3Mo+LBJJ1OqVaAYrucDGpCU7FAo5k6w8/HrgUl9y7aUR2f2lgY7L7Gvw0rmSYDJ76iBQA02ZpevRr5U9E+yQMLnZMVZ5dgDNHcmq3qtqAmyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(39860400002)(346002)(366004)(26005)(83380400001)(2906002)(6512007)(38100700002)(53546011)(122000001)(6506007)(2616005)(186003)(66556008)(54906003)(64756008)(8676002)(66446008)(66476007)(316002)(71200400001)(66946007)(31686004)(76116006)(6486002)(31696002)(91956017)(4326008)(110136005)(86362001)(36756003)(7416002)(41300700001)(38070700005)(8936002)(5660300002)(6636002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUkza3dTeDNINC9STy9PSHdlYnBrVmh2SXpOemZWcXVOdnVvRUNQZnBEYTlR?=
 =?utf-8?B?dytoMDU5aDcrUXpEUjEvUjgwNjZNR2tlSVQvZlhqdG83dURnbXAvbE9UMnFs?=
 =?utf-8?B?Tkwydm4wT1hFdXdjbHc2dDBRODlCSTlIaXNGZjB5OXFqWitWTFVoMVRsTndi?=
 =?utf-8?B?QmtYYW9qY0xxbGs3WGhVSG5RL1ljSW5ZVDc1YnNDTjA0VnR4cVZTWXBVcHZo?=
 =?utf-8?B?VGVxUUd5VUYwc0M1Nzlnb01JYzY3OUdDU3hnMUNXSGZVdDBSUHE4SFBvYWRn?=
 =?utf-8?B?M1NCTmZ3ZTJCR1dEYmVZVDl3cVd2dC9XdnRPcUUwbmlCa0hBWXJSOURiOGdn?=
 =?utf-8?B?Vk9mQmptOW5laUlqQmVESVF4S1RxR3JGTVNZa1RWLzlyWmJydkRWV0U4TnFp?=
 =?utf-8?B?dkVHUEZ0dTcwNWt1Mk9RN0VGUTk3dFlIK0pxRElmaVBMWU1pWmNNY2ZDMlE1?=
 =?utf-8?B?TlJLMmoydTJlaE94M2VBampWOFM0TFFLOVpHNUxmWTh1b3dQRm80K0pZQW1i?=
 =?utf-8?B?ZDhkQnJJUEhwQkxvVUhuK1dKanByYTZCRHRCdVdWMHRramRlcDJlTUY1NEk5?=
 =?utf-8?B?UXM3UkJPdHExOFBkVWRqaWFSQ0czb1ZEWitPQXZqMVZzR2J2YWc0YzlUZmUx?=
 =?utf-8?B?YVJlMHRJVjVXYU5KckNZRldDbUNJcjlkUlUvUFVaMVdZeWpzTm8yditUb1JQ?=
 =?utf-8?B?emFVUFloYUZiRU1rVkdIWlFRV3d1SDdRNlpTaWhBL1hCQ3ZtWTgxbzNwODB6?=
 =?utf-8?B?MDQ4NGxOd1l0R0dPWlRvWUIxU0d6MjhLcUczd091Y29od1ZydENjU214YUlZ?=
 =?utf-8?B?c2ROdTJBcXpGbGk2b2U2WmhSbVc1b0RGenhpV1lOMzVOaCsyZytaNmtrNWNr?=
 =?utf-8?B?UjN3VVNZR2lPQ0pnYmFzWXJmR2NPY1haSkpsMTBJZmExNWJXSHpyb3d5UGZl?=
 =?utf-8?B?UUVXblUwRkdMSGpaNEo2Q1R6cyt6eU9kdTVCcU1xTFlLMzNHL0xYb3JmSFd5?=
 =?utf-8?B?WG91L01nanFFaDlIZEE3bTUzdDlLSUZYUExsT3pyL0lZVXBXSlNldHpCRjJW?=
 =?utf-8?B?L0c5Szd6bEMyMnNHNml6WlZYMVR1V3lxbW0vZW43LzJCZVpSZ3d4WkZzeVdK?=
 =?utf-8?B?V1lqaHNVYmJCRnoyekh0amMwWEE3aVV5QlVZeGxnM2Z2NjVDREhFY3dEYjBW?=
 =?utf-8?B?aHAxSmM3ZGR4cEg3Y0JsMWQxUEZ5RzVVRXh2dnhlTkxtVTBQVjJ0bFdPYmc3?=
 =?utf-8?B?VHhRQmtjQkVDcWNQTHVPS2tIOHZJVm5XaGtMbm1KVnZuRXJBWnlBOEoya2pq?=
 =?utf-8?B?MmRIbCtqYWc4bEFKQ1pxaUxxNnFLMmlUaVk2Z2tWSTROZVNOWFlHSkZRZUNY?=
 =?utf-8?B?dTFuQk5oMWxlTnB0bm1BRDBQNVhvNUFvK05PRnR6Rjlyc08vQSswSHFzRU0x?=
 =?utf-8?B?cXBSdkZmTk5zSklwUitPYis2bUNaeVVxSEE5Y0VWSXd3ZklIMmEyQkFvWlJv?=
 =?utf-8?B?Ky9iKy9BUHFaSHVjR3RBL05WK2h4UjY0cnFWUE5yemxYNXNmVmx3R0VEK2J3?=
 =?utf-8?B?QmxidU42L0NTVjV1M3laaXh4bFFhc01SemFKWnVoczNhM3VmaVBka20rb29u?=
 =?utf-8?B?aXJ2bmgzdDBSYzBQekF2NDZ2b3NVZEVaZ3FQcEkydFE5aUhXRzFTaFNpODEw?=
 =?utf-8?B?RjM4QjVJVlliNkFCMDhJMHdxTUo4TWJ2R1h5alU4dHU4Vk8waFByU1A3enNl?=
 =?utf-8?B?ekt4QlZNZklqMmRmdmUyZTZVY0ZrOVFWOWtYcVRwcWNhczNNU0xoZlB5VHBv?=
 =?utf-8?B?cjBnN1ZtNUZKQTIrQklnK3o5QTBYSzZIVzcvOWM5TWlLSUdNZ1ByNjZPZXNM?=
 =?utf-8?B?dWFYUXJDOEtHNXllVWF1UjZmcDJoVUEwZE4vK1lPM0RGOVpBNWpkQnJjd3dm?=
 =?utf-8?B?YmpqSGtuYkE4VmpleElYNWRWWE9HM0ZPSk5ZRElVSGgrRlF1R3BHQktDVVUw?=
 =?utf-8?B?Q2ZJRklrZk5ScFhiaWs5WWZValAveFliNlRmcnN1Z1Z4NHZYS0VXckp0bjlY?=
 =?utf-8?B?NWo2d0ZnUnhELyt1ZjRscXU5NWxTamxxSVdoa3ZZbktlNFkxQi9MOWsxMDFZ?=
 =?utf-8?Q?1iqrvwEJGgTagjpHjobVlkkQt?=
Content-ID: <F8A9DAA5B579AE499282CE1CBEB0BE2B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35123389-dcdc-4031-3d86-08da8a53279e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:44:57.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNZkkJWMcBOg53k33G9QnzuUQqB1UjldPUwOB1/JZdhXIXY3s4kVGkQCp35+fz120U1c3+/9uKgzWK6XKSoOClrNS7hlkHh5Bz0ui6fImfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_234508_070946_A12F674D 
X-CRM114-Status: GOOD (  15.13  )
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

On 30/08/2022 07:40, Claudiu Beznea - M18063 wrote:
> On 19.08.2022 12:53, Conor Dooley wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Add a reset controller to PolarFire SoC's clock driver. This reset
>> controller is registered as an aux device and read/write functions
>> exported to the drivers namespace so that the reset controller can
>> access the peripheral device reset register.
>>
>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---

>> +static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
>> +{
>> +       struct auxiliary_device *adev;
>> +       int ret;
>> +
>> +       adev = mpfs_reset_adev_alloc(clk_data);
>> +       if (IS_ERR(adev))
>> +               return PTR_ERR(adev);
>> +
>> +       ret = auxiliary_device_add(adev);
>> +       if (ret) {
>> +               auxiliary_device_uninit(adev);
>> +               return ret;
>> +       }
>> +
>> +       ret = devm_add_action_or_reset(clk_data->dev, mpfs_reset_unregister_adev, adev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return 0;
> 
> You can just:
> 	return ret;
> or:
> 	return devm_add_action_or_reset();
> 
>> +}
>> +
>> +#else /* !CONFIG_RESET_CONTROLLER */
>> +
>> +static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
>> +{
>> +       return 0;
>> +}
>> +
>> +#endif /* !CONFIG_RESET_CONTROLLER */
>> +
>>   static int mpfs_clk_probe(struct platform_device *pdev)
>>   {
>>          struct device *dev = &pdev->dev;
>> @@ -465,6 +553,8 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>>                  return PTR_ERR(clk_data->msspll_base);
>>
>>          clk_data->hw_data.num = num_clks;
>> +       clk_data->dev = dev;
>> +       dev_set_drvdata(dev, clk_data);
>>
>>          ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
>>                                          clk_data);
>> @@ -484,6 +574,10 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>>          if (ret)
>>                  return ret;
>>
>> +       ret = mpfs_reset_controller_register(clk_data);
>> +       if (ret)
>> +               return ret;
>> +
>>          return ret;
> 
> Ditto
> 
>>   }
>>

willdo^2

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
