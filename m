Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2D1CCA473
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Lni/wstfjXv/wRKLH7VRnA1dfbtX598exXjCR6KLg8=; b=Zc5lRE5nTDfvRu
	aUwLcxEzwXbxKEhKv3kCeYmMSiIDEwkZnIPPHC2WDZ7iKBObOfY2HejeVae48sadvLZi5vdZvGgYx
	6g8Z1NWgVbQCTI+dPKTiHmWicI+zrgkuo5dfQKLsnguoWodiasOWgGedROfBK8s0YPwFARC4q96W1
	dK8wfFlX8DBMoM6zKJZkU7rnlGdION1prWTtfjmXHDPEyaRl38LTVsWtC5wVVCwsTr1wvDkqb4h0f
	uxF+ffh6rs90X5SL3qIIALvMbRlnpshhMkMmti8dKCn1AyrYQ5kyBix5z7Y3QgFfqgxjOpuD7bjRk
	gZWprS3aAXzpG2cVNPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJvk-002gtK-To; Thu, 09 Jun 2022 15:18:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJvh-002gsf-Vj
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 15:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654787917; x=1686323917;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fxiduRJkZiJNeCIiJa8oYB5OA4MEUEXvubNFG63N4oY=;
  b=H1nxc5eaUFQuKnKpsGkyUQV0UAMQazFcN+a6JztWpWaANHwcJfaLZFIb
   h3knVydgKRWTtpqp98HexvWC2yxb9uxUuvvAkYEldNvfLy+OXi6UfxlaO
   lHzmoQw6xjQwpCVL0z9coOPP+nOm9gU2Ec89Ef4XCK48nrbj3TBTKmI1c
   LW3eUzm1XhndvDb9dikS/19+AFh50NVx95MZQxtT3ZDvNrfZagEwNkHgT
   V1GhQn6sgjTvJoLh4G+y89TA8MaIPfPSd6L5aYAncNaoFgWFOcYNffnA4
   5CeAwRREIWz9ktv95aqFyWPqwK8ZFYm9bqaDSZyW8TKrbkoUkbsG6dHc7
   g==;
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="162644980"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2022 08:18:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 9 Jun 2022 08:18:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 9 Jun 2022 08:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k37ojMBJHikYG9eXQ9aYiY0/GQmU3B8tYaJg0jTzDwI4TgmwhzRN6n4gWDARlfMwzV2i8PLVfmKeox8+IfSsrTB1n+TLH4S1qjYbsaxPKsv1dXxZwSIft5sPRE1iQLjNO4cpzwu7ztsu4xf0t5YVgGHQxOyLyK384bNllep4CfXav77EtqedqwVTPbsdnEWkT3n9oRR5CXEPZ26F4b4Tdm6WAJlPwcPGkrEoAikMxtuir9jhjGV7MawTw/lFGJeJ2YX5eb/zwkI0D+KzPEmvt7CwrcUW2ZC899EkKoTM1pLf8gT1HFhCwZPv6cmHpg4zMbxQGP/+SKHqCX3NBb57/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxiduRJkZiJNeCIiJa8oYB5OA4MEUEXvubNFG63N4oY=;
 b=HWJhJy/v6jdU5Dc3AiGcABWh4YsXFHhgawFN1+ajyg2aRu605z3GpmK5Y5UXqOFXDyveOLdWNVWeID7NZADOGh4I87DoYCqG4rOBCg6vr7umKVLpKTlktfn8eiO/DzIgq/JzC8RO8OiCZqUZ2JK7iD+CkIpmumEoexHeP291/dVDEVrU9fxioIBDONr1M7Uc7zGsZGH+aLVBtUfJRq1djCIEU2DN1bRBisw8Ig6TX+wTnibQ0qejTKIP1mzxtJLbJ7HDwO3DEgkh8M3p7GxmU22a1c0UWNI/d3c8H8st+QnnWSfi+NFFKLMufpsspMTk6tYdpmVVsWANpBw3oc4HLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxiduRJkZiJNeCIiJa8oYB5OA4MEUEXvubNFG63N4oY=;
 b=pEFqyQulyUkqdGEQcWIbR9xGo6Kqkd91hnSleIgzbo9T3A1lJDQnqBx3QSlZnFkj8bwUJ1lnTDtTF5oImq6MMHUmeKws9CIdiPrTreNrVSAlQ9K/n5OFuT4lo9tKcO4ZIM/hZ9Hvxh60FZDRRgCjJGdJh4198dWuEck3C28WBAI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Thu, 9 Jun 2022 15:18:31 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 15:18:31 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>, <atulkhare@rivosinc.com>, <palmer@rivosinc.com>
CC: <Conor.Dooley@microchip.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Topic: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Index: AQHYe5EWlaN9eJ6DkkaWySyozCpPXK1HL+2AgAABSgA=
Date: Thu, 9 Jun 2022 15:18:31 +0000
Message-ID: <57776fa5-4eaf-7074-9bc1-5401da637980@microchip.com>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <20220609151353.GA3805719-robh@kernel.org>
In-Reply-To: <20220609151353.GA3805719-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a119cd43-76b6-41e2-c7ee-08da4a2b5017
x-ms-traffictypediagnostic: DM4PR11MB6044:EE_
x-microsoft-antispam-prvs: <DM4PR11MB60441B68C70403361220DCD598A79@DM4PR11MB6044.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bn2I6k5Nm6JphaSHdKz7oVMoge45liBZCsT0Rsh7n5i9UtD7OWeD6qQFWzTuKHZvnKn6fmzCO7pYA6SPoba8CUuX2o1xUmvDYkFACNA078PA/9Bx7Bpmexm7F/m0OR4M4l3l/pBbz7MUCjvtWYGeoqqOu/HuphwNm7LTXeQVxlaDprlqJNe8vP1duqh1B/uaxEHfOfQH/47OmqeTGCkRT4s8PLsQPTUPXEtODDS01SDueyY2F/WuaD/8Gc7s9lBEP+sC83E5nvVphPtgOLP5f+fGBMrYmjNkpd/2n7VrEAuIgpyB13EEVvd12jt6NDYSbZRlrfhqiZdUzcyUS/SOZlkAogLI1/9TdmcjTuKLIeX34Usj3wB3paP2Ilx0Ipq2swmQNLo/e8yFIPmsG5qMoxX/DQuaH0CeVWrRxL3iSjjQnB6z+/OkbGeQo41silqZDlgixKdEMh/DVAXAykyYkG1oHBBhY8Uw/zsx6rzp+YN7G1RGkn+5wzgyROzuo2y13TE0kbh/4Lqz+8WoXYznYXRcloyhpyxNIdhc1YBw4Kxj4PQOtQ9Ge+JJux2h4nXj+7ztNXs+9LqUL00cJd8k/ewV4G06rdsfX41YAEv0LLAFk1YHYfzu/CswLugc4apYw7cm7fG/1rhZ5zEN5iVzBfGTws3r9zRneIk1sJWkkSIA00N8fLDrG+G+s6CgO6WLf8aAtzXfuvhvHaAMHt8eaznh/Bx7Pss1Fdj8Xugu+9mxu9WpXOmUc0zJyClOjG3V4CPvmDFFhg4Dol7Qdx1rA45/PZHWQv40Cqoip+GqepD5Y1uu/8kLmEoXHXALYW8HLtoNR1ZMbwzfmwFy8OvR1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(966005)(8936002)(122000001)(508600001)(6486002)(26005)(6512007)(53546011)(38100700002)(2906002)(186003)(86362001)(6506007)(31686004)(5660300002)(91956017)(2616005)(31696002)(36756003)(8676002)(64756008)(66476007)(66446008)(76116006)(4326008)(66556008)(66946007)(316002)(38070700005)(71200400001)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWxlaW9EWnlCSDhSOXdGWjgyaUo0eUpvQ05vK3B3QWtDUHlRcXYwSU9TRG5H?=
 =?utf-8?B?LzBGbVJOT0VHUGJPZ2dRM0tMbnN3Qy9VcWUrMGFkVi9IS1Ezb2tBQlZLbS80?=
 =?utf-8?B?SW8wdGZkRWR4N2RYUjVjWFhUb1dlU2RRTGt2WTdqTUIxR3RiSnVVUXJuY0Z2?=
 =?utf-8?B?OVhtRWNVbVphWW9UdEVLR1NjdVFiTlh5Ly9WWHVRS0E1dVVURHJmUjdiTk9t?=
 =?utf-8?B?QWd0bE1FazdWejVjdXY0UkJYNmxoRnB3N0VhNkR5L1FYMkNrRkQ5aUh4TW5C?=
 =?utf-8?B?ZlRQQXZJZElSMkVwQkQraVgzYldGWHNSV1dmb28yUGNUWFR1dk5ocWJCOWdC?=
 =?utf-8?B?V3lYU2dOemRXWkJXWXhERlgrWEx0OXRQRXl4RGlJODZ0dmZUcEhaWE95ZWtX?=
 =?utf-8?B?Rklkd3VtTzhhV1BUa3ZJZHpKOUVvbFFWRjJXTHpiQkhFNEtiWjhnRW1ucElo?=
 =?utf-8?B?WmtFRFB4dk01YS80alViVTFVVFBuNHU4YlpTOFR6b08wdW83WjRTdjhBakhu?=
 =?utf-8?B?aVFhUXBKakhoT0kxVjhNUStvS2tkSHNZOHZGMEcwMkRldVROM0JQS3ZEbmxT?=
 =?utf-8?B?SENTaWphUFFsaXJQVGNHampRVHhIejZVVVRhd0FaMUQ3NnUvdDFiZGdyd3FD?=
 =?utf-8?B?aisvUDVsKy90TlBFbXQ4TGdNblJwV0RMczFpT1QxRWdMNHlpSkZFU3BsYXh6?=
 =?utf-8?B?YWw0c0lsVnZPSmdNUVEyUk1kYjhtVkthbDJ1eXFQYU10aWtQc3Zkak5hZnBL?=
 =?utf-8?B?L0JtRWF0dkY5QmRiYlo2V0pXNEFyTHNNQXl0cHJmOXRjbmFZQ0tneUFlbXVi?=
 =?utf-8?B?YXdPWGJtdW9PamtRTjlGTFV1cFZSVzJGMVJvSjZLVXdPM1dGSG1FTlNxUUlV?=
 =?utf-8?B?OHcybzJCZGhBdEM2bDExamxCdXZNbjMySEJxZ0dWaUp1THFiRGFoWkJHQW5j?=
 =?utf-8?B?SmdEc2FIendTRG9wNDJXL2tHRzhaQmVBWDArK3JTb3RZbDl6SjEyanFqQXZ1?=
 =?utf-8?B?OVNDVVQyYjVja1orK0hRdmdYdkFjSnF4cGNmUk5pTnZPTnlJMGZLRE5qMUl3?=
 =?utf-8?B?SURwczQvKzhVcGZqNzFqUHJmdHIxbzJvdVlaek1vZWQyU3VocThsVnkwR2Rv?=
 =?utf-8?B?NHdKcG9xT3FOR2x0aVBmSGxlclRIMnJabXJkdE1VUnV2Q2RRclVSRm0xMHBM?=
 =?utf-8?B?RmtLakxYY05raHo2NUNPTVN6WkEyK01kcWJYei9pVHN1Tnc1enNva2IvS0N4?=
 =?utf-8?B?clhOVGswUmNVdWdXQTZ4WnptSnZ2VktneklHV0ppakc1ejE3ZzgyVGNOUWo5?=
 =?utf-8?B?MlRKbXQ1aU44K25oRjBwdWtEMm5LWFQwbnBhQzY4NTZVcUljUXBEQStVRElG?=
 =?utf-8?B?a2x3dHNsbFBtZWhueWxQK05qZkMwam1idzJWd1J0bm5GN1J4RjF1VTVpRVk3?=
 =?utf-8?B?cWw1UHpYWXNsU0dpc3g0dW9MbHFOV3V0U2c2VHZtblJwMTNPdzF0aThTaHdX?=
 =?utf-8?B?UTNUU2hXVXlkNmVOd2dUL25mamRyaWhNYUh4MmQ2MHF3ZmR4ZEFub2N1Um5p?=
 =?utf-8?B?cks5TUIxRExDV1ExaW9YNjRFWGxuWFNKNWtKdEtlNGJ2MmNIZnF5U3RYZVht?=
 =?utf-8?B?KzkvRTA2NFlSZmgyMHU4QWdrd2tsT2wwOVNpNmdubVJObk03cCtOT3k4OXc2?=
 =?utf-8?B?VEhWRmI3Wld2aFFCS01oMUluczRoSWFXREYwMWlmTTk2NGxJK0VOTFViQ3pI?=
 =?utf-8?B?TlkyMm1DVEhDNWZBZ283b2RXMlNySG0wSHR6UTN2Tzk0WEZtUno1N3hLNDBT?=
 =?utf-8?B?eERIekZsNnc0WTJ4eDU0bVhUWUxadjVGa1d3elBBTmdwa292TVovNGlqMEVp?=
 =?utf-8?B?NzZRYnNLSzZKa2FpcDdrNWsvb0JmcDVrZmRmS290bzlVUXpyTVAybTQvMktu?=
 =?utf-8?B?bFJtZC9DK1g3dmJHQm1idzJSdG0vTEk4eUpheXIrRGs5NCtxS0dPWGd2aWxZ?=
 =?utf-8?B?ZnpZUjM4SFNMWGRXdDZqZVgyRmhNV2xiMnF5OVVQL3VmOVZ6a0Fvd3BBK1JP?=
 =?utf-8?B?bE93SFFqN01ianJIa0NodWk5czljRXRtNkFSZDd4NkkrQ3Zvd0ZrdFRhcmd4?=
 =?utf-8?B?QVdJbzM0VDlkbnNzdXZXKy95NkZONjJ4eGwwQndDSVJJRHgzOUFQaGJsbVgy?=
 =?utf-8?B?MkpHNVVRaUl1VVRBNXBLM2pIcHVVYXJwT2VseG1zcWlzTjV0ZjFtL2pmdnRL?=
 =?utf-8?B?YXpXN3JpQWRDamNvTStueWFPUUh0OU8wamJhS1lMM0J0eExqcng2eS9kV2lR?=
 =?utf-8?B?QW55Q3NKdnNWZHplWUgxTUZ1L2w5bGthYjZRRUJNVTlnTU8vc0wzalNHRlht?=
 =?utf-8?Q?LTJAxciy8yzI5nL8=3D?=
Content-ID: <27425DCB30352E4DAD1EECE1F061958B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a119cd43-76b6-41e2-c7ee-08da4a2b5017
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 15:18:31.3662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y66gjU/J2ZEW9OSiYub68N2Mb1Jzlh0cnJcTt757KRxN/BBvvuWL+EYAsMj5JaH/RCKXdLfKcGCDSEnaDJYgnyHFH5u49+s5f5UdF7trbPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_081838_128985_C4255921 
X-CRM114-Status: GOOD (  17.87  )
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

On 09/06/2022 16:13, Rob Herring wrote:
> On Wed, Jun 08, 2022 at 04:39:23PM -0700, Atul Khare wrote:
>> The patch series fixes dt-schema validation errors that can be reproduced
>> using the following: make ARCH=riscv defconfig; make ARCH=riscv
>> dt_binding_check dtbs_check
>>
>> This is a rebased version of https://tinyurl.com/yvdvmsjd, and excludes
>> two patches that are now redundant.
>>
>> Atul Khare (2):
>>   dt-bindings: sifive: add cache-set value of 2048
>>   dt-bindings: sifive: add gpio-line-names
> 
> Your series is not properly threaded. git-send-email does this for you 
> by default unless you tell it not to.

Aye, v1 was the same.
@Palmer could you please give Atul a hand w/ mail client/send email
things?

Thanks,
Conor.

> 
>>
>>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml      | 3 +++
>>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> --
>> 2.34.1
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
