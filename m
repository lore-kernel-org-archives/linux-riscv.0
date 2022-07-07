Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B05C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWe73kjRbi+XH+sgDNqzhoysUhkJKQcM5wjXcW4HeCo=; b=NvbfsQr+suUnW2
	XxHMng0KRQyRJuBn/vZCVz6XSG1aLvuRO4Dk3alYGGQUM0cN00HmDo3tAyPOZhXEDI1j0Ov52BnYd
	ZlBjVBsLb60/ZCUBvBXJIwZB06JBqcF9YS8rhNNbNle1Upx1WKv4N4NUXrSRPgg8SpDcGDLzGasxA
	LR9z3pTovcydNnBN1kAQeCj9FRV7s2/tYGKH0vJZx94FIWc23/Bsj98RIRmv3D/g2zYNSQGt/vQ8K
	FcNu+gMgkhef0z8uWef6ohuHghFpGiyCYXsfmMqiDv0j6RkmvtvCLMemtBcE7trUUZtZZF5cRAHOZ
	hH/6LRT62Gk6aiIuxBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OXq-00FXq7-B5; Thu, 07 Jul 2022 10:15:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OXn-00FXoi-8c
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 10:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657188934; x=1688724934;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Dh34EWGNy9X4FVYWwohjrEk8b5RetI9nbTzj6J81ygU=;
  b=eHxR05QUK4HWB3oDwM+YHymHWiauRv+7dTkfT40p/Nb9CgpJCG3cyFPT
   4QmASsPgId7dez6DGNOc8UxxmWvrsyS1R8zyCgjnsypT7FuHMNjEA+BM9
   3DHrbremFDqWKDFwPyWxuwlLchdmdKzspJl/qdgI8Q+ygFmiw9RiCkDDx
   VMFSPTLsMUnV43vuJRe/ju+tXFfdOMdJokfmRV+Ue+7/9lqZjzHXqKLOU
   QUT3dSMMemWlW/z0zNLAEVtOJp3drt0LBv5kz+mVyIVtW2/1nvqa5EFlW
   qYKVdycl6Qv1NYGNalC/nKYUoc9AZwNINmUUqcFnh+HRnphgCoFqhqGzb
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="103445800"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2022 03:15:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Jul 2022 03:15:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 7 Jul 2022 03:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AknffSMRXeyl065NY+lvqsdFWFa7DC60McHDVU71KjtF0w5c7m5TKN99FvMyWZFwWSNaNUXJZJDw4PQ3d8bpNSPrbA9QIwYfL8qlOcye2VBoeUJqPFHDBC4TmBfmcc/Oucg51rsXj3Rs9wqNsnZ4ekfgLt1AjNN0csZJc/40Uwes7Tyibpbo4WEFVnY7zOlDmjXDsMbdUO78qvx9u0VhKyMtHIqichztGyE6/xMoSWsijSf1Ko9hnyFkyg3pDODgJ5tVZKm4o6it0/1N0YcR521x31hifoFTfbDV5rX5bXfELkWDcFePPpVSPz3KAg18G/ain4QCEAUBr4/Frq8hVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dh34EWGNy9X4FVYWwohjrEk8b5RetI9nbTzj6J81ygU=;
 b=OtnPbvgmRhZNVcFJ3Bn8GR8AeGrN60RmN06+fymyhWSRwoX+mbbUKyHVgVUXZIVM2u3YYAsppk96t6yiUnF8wsH9JUnV96W8oMLFTBhMqc0FxXgsCXG/lagznWVUKT8BYFpErApuHs2WOejORl6TOHZ7mnzQzD7o0UHYO9tPLiGrLvPpGNp1BhyxTZzrpZZkc/fetC9V3f3YE7Erlol7+dAWFImmqaGf28RNSWCgjuZ3spob1D3bTjYmY//LDVNOrIm/s8DIV5y6v+Faj6Sy8JKRDTMSmSH1y8UN7fvbA4irOOYyM7xigz+beVUGBAxKMbZd/BTsZAM1/OZGFQaWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dh34EWGNy9X4FVYWwohjrEk8b5RetI9nbTzj6J81ygU=;
 b=SNkIUt6sAF2/2Ky3Kn1Dz8d7F7VWqL+gvoddHIbmTg4KgOzB33M2cZuvG35SYG8VyKOTuldrP91+DlekDhpzqjwpsSet4ERF3AUQqM5JncWB57dZff5VVv8KRLt7CQ8F/AfAR5TxBguC/98M6oRrhwpObh1/kGUH0grPrRv6kd4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 10:15:28 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 10:15:27 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <Daire.McNamara@microchip.com>,
	<niklas.cassel@wdc.com>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <zong.li@sifive.com>, <kernel@esmil.dk>,
	<hahnjo@hahnjo.de>, <guoren@kernel.org>, <anup@brainfault.org>,
	<atishp@atishpatra.org>, <changbin.du@intel.com>, <heiko@sntech.de>,
	<philipp.tomsich@vrull.eu>, <linux-riscv@lists.infradead.org>,
	<mail@conchuod.ie>, <linux-kernel@vger.kernel.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH] riscv: arch-topology: fix default topology reporting
Thread-Topic: [PATCH] riscv: arch-topology: fix default topology reporting
Thread-Index: AQHYkWi/AAEA7OGPIkSptAwercRHiK1yqzOAgAAG9gA=
Date: Thu, 7 Jul 2022 10:15:27 +0000
Message-ID: <cf4e5296-03b1-f8d4-9742-4d176dcbef25@microchip.com>
References: <20220706184558.2557301-1-mail@conchuod.ie>
 <20220707095037.i2pjcc7zcf4pi3ht@bogus>
In-Reply-To: <20220707095037.i2pjcc7zcf4pi3ht@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f435b02a-408b-4cfc-8e11-08da60019d5f
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1QdRs4OoAaa/f/yIhxvdHxU/EkVDWEKF00Fd5vLMcUSiftbh4JvDBGb37SCumZilkPbOR7NV5x/HtqqAN71Zqta/pbsv6RWvPLxp8naOM5Dfolh952b+2/Z8E31ZltDE/u5pEoTG8Hj+7IQEFrTfVNIbO8mBMjRU8mTgXRoxh6xFdKfBPs+zzPIYxSUHmMSTX+nX7ljKh/l8JjcSWnkdEzZ0jQ1qlZRkzdMIOxITspxXdu58VkhJ/lBUSniQoaa+h8ePyGoIo3UO4j6/Soi8Lsgm8bMRopbTd26HaP6AvC9MESECpt1efksL+a8Shr3Ds8p7uRnI+Z2PBhDuS8XTjpMlv0MK8oqo98HvxrKBLDdGQaRy+N/IxgB5MS1WadhYNomMKJc8EXhv2kF/4mKGEaHlCPz3AAekv7dNfBeERwDH/h0gudO2iWUK2JHK0d1EGBeMBc08QmmF1FYtYTYomAcrfjgfx5+Rs1CTSdMr0zKJoS5R4RT65XBAsHqFALSs2N/Oy2gS2cKlgTGult6COO2nY9CJLaXxE/u0/SpEuQ4sXHFN77oLkTTc9fZA8EKkMh1GKthyySSEpkNnRIcT7yhd/RyNQmviM15c/fNJldg3e+LGuEeWA7scQGQXwJW3Ns+pqwZ3/Ib2GHimmhXphNImOto7LhD9JLD+IPhqQzNwZkkQ6GozPY2ml7rqsy43E/cD7mpWQmETeTg5MY+Kxq6rf6InRFThDqFGeMFr2C17+FoMByo/UkJ0FFvQ2X96eWHyc4PkzCwlVL56T9YGv2sASHyTIzcS1WBXKEVTqX3GpKSOTP1yJibBuGSohmRqPa/L3gijwa0BUEjL7bpmJxaTewTj47LwHiIeDAT1UtiLtorynX8Y5kgHRa2xkr7L7KS4Yo0rhOoNfcnXB7LRcAMR61GsWKQs7qMbRGQ8q5Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(66946007)(66556008)(4326008)(122000001)(66446008)(76116006)(2906002)(31696002)(86362001)(91956017)(8676002)(8936002)(36756003)(31686004)(38100700002)(66476007)(64756008)(53546011)(5660300002)(83380400001)(41300700001)(7416002)(6512007)(316002)(6506007)(2616005)(186003)(6486002)(38070700005)(54906003)(71200400001)(966005)(478600001)(26005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dCtrcUFKWldxYVRyOUxYdElaNDdRM1ZLTkZrTldZYkVvRGNvLzZVdmF6KzR2?=
 =?utf-8?B?Sm9HakZ2NzkyeTc2ZHk0UWFOSkpsaW1xRURwNkhYTDYyRXozSnVzUWVMM2N1?=
 =?utf-8?B?N2JqVnNKMnorS2tacmt4Z1FWWlQwL2hGZXpRelNPYVlNOURGWFBmUUJiMEJt?=
 =?utf-8?B?dmtUYTlHSkZRSytPcTRvcm5oVzJleHR6VVEzMTljN3RjVmc4S1JLbjFPYitr?=
 =?utf-8?B?Ky9TZEhFWEhna2IzQTlRYnZiamx4RDMza3lpbnk4ajMxWkgxd1JRdTRTOUZx?=
 =?utf-8?B?LzIrVGFUSjR1ZS9IWStxaXlvaFhNRmV5Vkl2NG1KbDlQTHYreG5uV0REakVq?=
 =?utf-8?B?UGpncWlKS1o5a09aYnBVRjZLMTJ4SHJabHB0KzJJaG12ZHZVQWhXMUNQRk9T?=
 =?utf-8?B?N3NnVm1KaVl3dEt5bnpDUnh0NWZWYUlLK1QxYzRqOU1IUTJ1WjNQb0ExdjVF?=
 =?utf-8?B?V2hPTU5rNmVzWVhnTHY2QnNqRkJLdmpiYVUrQXEzOFNpZG5mZWt0VGFRNU80?=
 =?utf-8?B?NlA0VEIyYVRGRXY3SkNKSTBUdVdjaENqeDE3R1VwV01oY2I5akhRWUtjTUJG?=
 =?utf-8?B?WE80enhNbUd4Z055VmtzaldkSnA1dENGUDN5bjZrL2ZxWHYwV3BLL0NNZHZ2?=
 =?utf-8?B?Q3o1QjNkckZ6cFRpS1pBMXRpVGZwNHNMMVZRVldsbi9CWkZGUnNmQytENE91?=
 =?utf-8?B?NDJMa2JUb0pOYkdJdnovenV0SXJMdUx3NndsbzV2bmVGVldmOHl5cmd3M0t5?=
 =?utf-8?B?OVM5UmE1QjhRV3pNWWcwaUQ1TjVDTFladlhRdmxGeXNuRWJIZjFvMUxGMWZZ?=
 =?utf-8?B?aVdCaWlRNFM4aXFva2RzVnR4a2tiUHZyVzQyd250V1NLdnZTVmlZV2dzVXZZ?=
 =?utf-8?B?dktYUEVoVEk2b1RqcGpCR0kzZm5NaW9YdFhMVTJQRVJ5Ty9tTHVPRmpaaHk0?=
 =?utf-8?B?MnhTODJZdUwvZ2JvY1Y4d3JHYks5TVZZb3dYdXlQN1NJOUtmMnZBSnY5cW5H?=
 =?utf-8?B?TVdwS1FSL0hhVDZqZDVMY3N1cTI4cVlwcGNwQ3p1TXVDSGVsS2RpRjdpQTNK?=
 =?utf-8?B?anlyYmc3V1BpczRDMmFtckRuVnQ2Z3hnTEQ4WlRPMzBROG5EaEU0dDd2bjF3?=
 =?utf-8?B?YjQvNXg4R2RyQVJacTRjQldGUnJLVXBkMFk1d0tSSHFpRVI1N1NyK0FDaCtt?=
 =?utf-8?B?ZkdZWU1BQkNNMC95eFFhYVBtekNFSTVmaFgxcWx0b0ZOV3hVUXVMazNCL2pD?=
 =?utf-8?B?MklRTWdRWFYxd2FJbUpyMHFwcFJLMEZkc3d2RzE1SDZDYTdmM3pBckNyMTJt?=
 =?utf-8?B?UW1xTEFxcCttaGkvR0JKOGtkeXNqdkVVbTMrdTQxZFl1dmtPcm5CY2llcDBV?=
 =?utf-8?B?ZXRjeVU0MG5WTGFDT3U4eTduYUlaZy91WlVINkh1MWk4ZzRwNFlGcnBJak5p?=
 =?utf-8?B?OXU0ZW8zVzlYU3FMaVNoajJqdS9lVHpKTmdQODdxeG1PM0xqdU9qOXBZbE1S?=
 =?utf-8?B?cDFaM0k4OW1kMVV6a28zRnBIeXg4MnJ1R1ZvbjExU3EzRnJKQjR5dHJZSGpv?=
 =?utf-8?B?NlN0UzlrNktoTjFtSFltcmYxYVBvWGJDNVJYZnpmUFNScWNBTTM5OStpY3B0?=
 =?utf-8?B?bGxUY2ZrZmdmSmpYUllwcExHdGhUcmpOcU1MSGRhS3hFWDBPZXEvV0hiNDNj?=
 =?utf-8?B?ZHJ5aGlMN0hKQkpJWG4vNHROUGxQQnlIRmxHTm9zbUFwcTd6ejB4WjU0bmgz?=
 =?utf-8?B?SUFZVEk2dWxHbUFnaThMSGc3M3NnZHVSZmRzRTlFYTdjdnBnbHVEdVBwcWlx?=
 =?utf-8?B?akl2MHd6KzZZMkZxOUZqRDYxVDc0N0xaL3Y5RThPYUFNY05uUG1FQURIZXFV?=
 =?utf-8?B?US9ITStscUFtWTVqMGpMVCtzUHhiaWJ6YXNheDQvV2VaZE05cVRpNVdYUllu?=
 =?utf-8?B?N2lranhnSTZsdlJ3TWpOYUUrdG9ReGdoYTJ4VjlIQ0JIbGVsTFd5emxVTmtY?=
 =?utf-8?B?UzBiSTQ5STBVT1A4UFZFVVMxR1hxNFBScnRpenNzRmFMcnRJWGE0Z05VNzZW?=
 =?utf-8?B?N0NqQitqVEFKM2VEVFFLVXZXZERLQ0VxR2VYWnZNQ0hlcm5wWnMrbzNuZzJJ?=
 =?utf-8?Q?YJ4MGr7spJMyUVdo/j9AImE3I?=
Content-ID: <FC372F27663C8D4BAB5F7801D8DA3811@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f435b02a-408b-4cfc-8e11-08da60019d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 10:15:27.7396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNx9V9a4roXf6hJtdG2N2Lw2e0XD4LIUyxkK4TViDeF5kAEb+yCmapWvFZPnYD5Y8t4VfDQjLL43CUoTRzDxswl7J6QjWJXVH09fDV07/mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_031535_389375_955B6C8C 
X-CRM114-Status: GOOD (  19.20  )
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

On 07/07/2022 10:50, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jul 06, 2022 at 07:45:59PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> RISC-V has no sane defaults to fall back on where there is no cpu-map
>> in the devicetree.
>> Without sane defaults, the package, core and thread IDs are all set to
>> -1. This causes user-visible inaccuracies for tools like hwloc/lstopo
>> which rely on the sysfs cpu topology files to detect a system's
>> topology.
>>
>> Add sane defaults in ~the exact same way as ARM64.
>>
>> CC: stable@vger.kernel.org
>> Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
>> Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
>> Link: https://github.com/open-mpi/hwloc/issues/536
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>
>> Sudeep suggested that this be backported rather than the changes to
>> the devicetrees adding cpu-map since that property is optional.
>> That patchset is still valid in it's own right.
>>
>>   arch/riscv/include/asm/topology.h | 13 +++++++++++++
>>   arch/riscv/kernel/Makefile        |  1 +
>>   arch/riscv/kernel/smpboot.c       |  4 ++++
>>   arch/riscv/kernel/topology.c      | 32 +++++++++++++++++++++++++++++++
>>   4 files changed, 50 insertions(+)
>>   create mode 100644 arch/riscv/include/asm/topology.h
>>   create mode 100644 arch/riscv/kernel/topology.c
>>
> 
> [...]
> 
>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>> index f1e4948a4b52..d551c7f452d4 100644
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -32,6 +32,7 @@
>>   #include <asm/sections.h>
>>   #include <asm/sbi.h>
>>   #include <asm/smp.h>
>> +#include <asm/topology.h>
>>
>>   #include "head.h"
>>
> 
> [...]
> 
>>   void __init smp_prepare_cpus(unsigned int max_cpus)
>> @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
>>        mmgrab(mm);
>>        current->active_mm = mm;
>>
>> +     store_cpu_topology(curr_cpuid);
>>        notify_cpu_starting(curr_cpuid);
>>        numa_add_cpu(curr_cpuid);
>>        update_siblings_masks(curr_cpuid);
> 
> If the above store_cpu_topology calls update_siblings_masks if required,
> probably you can drop this explicit call here.

Yeah, store_cpu_topology() does call update_siblings_masks().
I'll respin tonight with this (and the lkp error) fixed.

Thanks Sudeep,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
