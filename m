Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52F5C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTyVe1QQSxGhBEyxomt+AU1UFAlV6eSXI718IfcXPWc=; b=NTjISlkuC1zcj9
	boVMfa+F1r6qXCc5cI1aUZ4VItMTUfjfRekN2DYA1Oz1f9ZnOZqIosxCsNcd2XTq1+08Bqg9nS7eF
	hFOQLtKjfdi9rGUXGay2gEs0pqmJL+aeexl2RsIi0qvHyiJv4WBfWZljcX8UcljAj4grAGl2pFrhb
	IDBmrmlDToVdo8X2YRl5fR7gCTsk0nMCZz3qV6yeSJqL3xeTqQ5YXg15srE8PhfQ2+p8kJjmZq8As
	qnS0sCC10f5hpSQObrJsvNh6dC0zVuXlrOhuuPPARBUSLKb63h2HQs9akioidqBakmP45bQgfljDO
	fS8vjvZdPdugnVkOuaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJIm-002TOf-SB; Wed, 17 Aug 2022 13:41:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJIi-002TLf-TK
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 13:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660743701; x=1692279701;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=04TzNo12vno3SD99jaln12hJkslWckg1kdUOW0sCkUE=;
  b=UYgPEg+bTC8TpEcVVH3wRN71gwEBVCe9Dunu7Z8MWGP9iNcqNZYCwpKo
   ZR2kNvY3uPXdP+WU2DI7//EpMGhEXL4WU/EcYGQVOULvBbzBrJLWmJ90f
   1zQHggP7mHbInVqcheKQ3Ra7wxYwCaVp5AUzvHEMXVScbXrP4qT34PMdF
   Z5SqsRUSMjiC7EPvMQdY6RAwutcecKdpi4f492op2r5PGsd806uzDwRb1
   Ng4y5R5j+B5xZYOnVws7tDLQZtfyjT0OdKkXn0oAyGqRd9b7+1NxunhJf
   B252VGSn6A41r33CTYGO+vjIoff+CWyaxeWKJAzkGDNtYuDARaWbGMYpi
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="169698696"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Aug 2022 06:41:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 17 Aug 2022 06:41:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 17 Aug 2022 06:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwJEDDt9wPOdYr7jqrnbW1RR5L5X7dWZvc+zyFDO/PVLoWkVyIK8uEOQHRCDEVDnUFo7eQkpJMJJMqv8aTn4UEFMf4RQHm5CqjLIKx4Y+Fnn5ejBtquhYq6Q3570Imt0dj7s7KQEUZ28Zr91hEB240NRD1z4hxmOYOoA24lXsAeQEQRcFJXLCKVbW4VfAoSxrzSNC2yt+VPUWeL14DQF89PMepwHzbInwXiC/dakufTCls+93BCnpslHVrGZoNEWSTVb2pEQJNoKobiQ2oPbnAUjjYKkuhFIdRKWiO2CUuN1nmehyKMiw05H3m3kICjYgPndugjSzBuZ4ScMbBVw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04TzNo12vno3SD99jaln12hJkslWckg1kdUOW0sCkUE=;
 b=inCl14o4wqocCD48iWuxIR25z1kWiAhwW+owrS1/2v0vxeE/L3nyZLC3oj+OkCMtKBEc2hSbD6q7ER8g9+auhew1PwpZyT3qqVBJB1xTvmXu+fGYDMrgSmHBlS6UdI9NiIO4xQN+o0ilCIZ9eL99XFgWEBV3KCzGy1UQlfmUetImd3Lq2x+PjQEgNwLTWTgSbJ3QCLAgA/vrdJ6VBxTVPMbG68k2/i8r1fSaY0NB4E3cOcuBtwUvfVY2rArmIrMAO45GvmzriOC47KP+cGd9xoMuU51Er2hnrjoQ6LuMh070RAnZYuSu5wDsR5qkxiR9N7pDeveQfW1Fgg91JPJQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04TzNo12vno3SD99jaln12hJkslWckg1kdUOW0sCkUE=;
 b=ShxXUiSLO9EbX4oWnU+5iTBRrdIxJFR5ZvLyxjnhaRIRpksJHtyv4tdCVR1oA9wpkksmvqyHwKd6IyIqHEyJlZFitQTZFrDCuCk5tTjSdfuKG8Z2JvOUTY3TZnDbLMC7PXzauaLB8pE2r0FRc5ZcMXATshOMUVvEKdrqaXpeVL4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4368.namprd11.prod.outlook.com (2603:10b6:208:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Wed, 17 Aug
 2022 13:41:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 13:41:15 +0000
From: <Conor.Dooley@microchip.com>
To: <lkp@intel.com>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <robh+dt@kernel.org>, <krzk@kernel.org>
CC: <kbuild-all@lists.01.org>, <Daire.McNamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v8 3/4] pwm: add microchip soft ip corePWM driver
Thread-Topic: [PATCH v8 3/4] pwm: add microchip soft ip corePWM driver
Thread-Index: AQHYsWkBOIqIOJ12yketXMe3xks8Fq2zGICAgAACpYA=
Date: Wed, 17 Aug 2022 13:41:15 +0000
Message-ID: <9d0c3441-f79e-4e24-74aa-fb6c387c25c5@microchip.com>
References: <20220816120829.719749-4-conor.dooley@microchip.com>
 <202208172150.rEZ2HEYS-lkp@intel.com>
In-Reply-To: <202208172150.rEZ2HEYS-lkp@intel.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd77e50d-a596-4352-43db-08da8056284e
x-ms-traffictypediagnostic: MN2PR11MB4368:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f8SgbvhDHdZd/1tsrJhmk+uIn0IHreLSia7STm6D+9GCxMC1cHC+VGGT2ZlQrtIev9Fqzu1+ib7XktNBXPzYUn0xG6z4igtQIYAZ7hUcu+u5dMvgBa72G0vAk4cCFUGBf0ryQrpT4NGGdvrJZm8XPQMOcQhOaiJOxFyH1ifbcN/mqKzyWd70AI+1RzEUoTqSptULCi0oWzmmiXm8jsnkkIzjbDH0Gw3jDEaCIkIR7gBhcU3rkmMKuCnzxj5fQQ1tOJPVMbTywk06onAyG36s8PZZwbe9oftVAosAdafiqle0egeAjuXZbyzWFdnk+9q878EyCB21BaO44YAAXBabiHOwtzK9Xj4kTKXL0xxE1DJqABu8zSB/ysXlpO7a7qUajfhaURJ2J8+Q4ePrtd4+jdILNp3B+QXfrn3sMf6mm9kqxDcauN6L9y3gy34KnnHSOOggqWbOwkMsUWRZI4rviGc7MZSaRAo+km6CzoY22x7RNT78T+QpzN7Iq388O9nCzlvhjAHOkbloW2pHzqh4h+z2VWvJTMXzxJP1Xy34npq89EC31+9GvjHav8HkCNe/7oh2aNNbU5F0Bq6wH4ZVqe8vd7SX+SxNmQyY9Kip6wnd5pIrwKrDG5QS9hU4grDy6a9gsBuHcPrBn9mWO1vHRmSUzm5KRcAx3FeFZn0iz3Te0IQSeHLaihQVtUPdGXFFAOzaZwljSEag3REqiVXYMOAXqGmeCmwJ2RWn8lYMjKkb9g6nSUw9CuBUfFDAfFdhEpFx7kQPLVGmIDN40fMMSz0/xrMR7PmlGDJgYaDeFZ3Ma4daE9hJFLO0DPcSnz9bQiJa9aUf6R1Mv0ljTIVKmfw2AmSXYJRFlGcMVnyCoaS35AlNCRHB4wDF45cM2s0EKMy6q417IU8+aw9VdEAsofB248WUdD0am3PmkiRC3QcSFaA6KxVDQZQfuUBEsu9O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39860400002)(110136005)(316002)(122000001)(36756003)(38100700002)(38070700005)(76116006)(66476007)(31686004)(4326008)(91956017)(66556008)(66946007)(66446008)(64756008)(8676002)(53546011)(71200400001)(5660300002)(2906002)(26005)(86362001)(966005)(186003)(6512007)(41300700001)(83380400001)(54906003)(31696002)(6486002)(7416002)(8936002)(478600001)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2owbzlaMFlqNmZ0TE5SejlNL3ZhTXc0M2JNcXNKV0hQYXhPSENKSWdQa0FL?=
 =?utf-8?B?UDlzaFRyTHcrZE1VS01xUGlWcXhyMVZrMGpUcnpvV0dwc3U4NmI2UXR1aDJW?=
 =?utf-8?B?QW5VazRuVkVQMFBhd3FoMzVIRmFBSmFXSjNleXpaVXF1MEhWbkZaQnU2dVNz?=
 =?utf-8?B?RXpnY2xrbDVNK29CMndhSGdDRUZzeS9UT1lrdkt3U1IwWTdqSElRODkveHQr?=
 =?utf-8?B?aFpieHg3Ujk3Y1luUERoVDlWSjg4ZWZZRXZJbTFUNGQzMU5LaEdna0E2YlZk?=
 =?utf-8?B?bEVJcVdyd1l6emF2ZTlRVHNTd09jWjk0RkM2aHo5SklVcnQzWWlJWW5rcUw2?=
 =?utf-8?B?V0p4ZXRQWkVpeFlsOFR0bXUwS1NSY3RyZDBlTU9tMzY0WTlIMWNiVko4VTFx?=
 =?utf-8?B?QUUvOXhDV2hPNjg2ZDVKV0xFUHpHbE9DUzYrT05URVlVcEJPa09xM3hHUVk0?=
 =?utf-8?B?TUx5TnVCNWZORzgzbTkvd0NsUUdOYjU0Zk5QZTV0dkJoZ1pUSjBRQ2NiVm1R?=
 =?utf-8?B?MWcxYlphRXJDU1dLZFhLWHNDcGlaWDhqZXRUMXhIRVo0Qng2amUwc3RWNVdV?=
 =?utf-8?B?NngvbE1ycjdGTnRieDJ5ZStWOTFON1k0Q2UvUG9SbC94azdNOTdrd3FZUFVZ?=
 =?utf-8?B?cFR1U3Y2VUwybXdUOFhrYXhzYXh5clhxUVNsajFCNXlqaDF5SnJXVEYvTGU2?=
 =?utf-8?B?RXlZR1VzT1UzcDNlczZQY3JvV2IyVVBGWjhNcDh3UHRDREtEdis3RFBXcmdN?=
 =?utf-8?B?Yk9LV01TK3FOM0xtM0lLWFlTL0djMWxkVE0xVU96eVFiQ1RDaSt1MkpGdThq?=
 =?utf-8?B?TVBqT0lXdXlIcGo1OHdRRU5tMVU0ZjZNUThNOWg4eDVHWjJXWDFBU1g2S3Nv?=
 =?utf-8?B?bHdCMFNKaW9LNTVtUzVYUFlVTFg3Y0tUQUZMN1kwcVFpRFNlSjczQm5pY3VV?=
 =?utf-8?B?eG5PVXgzY2ZkSjRkMjI3czByWWtyTU5kTXRqUTFYcEw5bDFGb0FPM3dCZ09P?=
 =?utf-8?B?Y2x5cUFjVnNEekVUR1JKRUIyV21najlXVm00TlVVWTIwOU5TeWhQeGNnRDI5?=
 =?utf-8?B?Nm5xdmVCczYrZzdzZ1p2bFgzUm5rS29seURvVWg1N2ZYUzlxRjR0VHBWL05V?=
 =?utf-8?B?WjZpSEtkNjZkWUZDS1Rrem5LM2pMTEJyNklpbXI5UnZTMTg4T0Jyb3NhdkVo?=
 =?utf-8?B?MzA3RUFnU0xGc1ZsaDkyMnVOclFUS09xd1NBYXR0SERDUjJ4MUNNL0s4cUFa?=
 =?utf-8?B?MXVqdThBQ1dhMDUxbDFPZ0FXL3dqMDcya1lXUEtzL25xZHMxY1luWmdrblpa?=
 =?utf-8?B?QThBNHFZNlcyZEVoYTR5UHlQZUZMbG9yOTRaQWNaN0k0WHl2QlZ6RE1rN2pM?=
 =?utf-8?B?S0ZmN0xUdTJPcVlhMVJYRCs0eWZEb25IalYvUUoxZ0NVVUJEcjdGNlZaVGox?=
 =?utf-8?B?QzlIUW5HcGpsRnNKZitheWFxMXNzQVloWWZxZEk1TVdDcEU3YVpYbUd4cVVn?=
 =?utf-8?B?WktQM29qZXZjV0dxSnRvOXh5VmtxcFRtc0NDbXBuN2NtUXZQUjl1VnBncENi?=
 =?utf-8?B?RVhDalFnZFJTOGFTa1BaMmd5emlQMHRlZWo5MGVHeFNETlAzcDd4K1A3eks0?=
 =?utf-8?B?NSs5cEcxbEdxSEltQTlYK29zSVJ3c0VCUU1Ga05CLzZlTUFGdGY5eXpXZ0NW?=
 =?utf-8?B?Q3l1Z0xFRzhRV0ZrckEvVXBSczRlbDVJVnNzMjBYdVpFWk94bnE1SDkwekFo?=
 =?utf-8?B?V0htRko3L01MdkR0SHlmajRtTy9SeWJXeUVNZmphNFdSWnV6TFJHSUVSZWw5?=
 =?utf-8?B?MEYrNW5rQk0ySXFSMS9LZmNuQUllMmNROUQ2MVpxWDM1NllvWVY2b3NOUE42?=
 =?utf-8?B?YmlXMjhTbmg4TlRyUHE3ZzY0Q3ZmRGhCQjFCdi9KaFFWU3crOU9ldHlwVWtn?=
 =?utf-8?B?a2VLcHh1eG5WZ21hRGZKTnhNUkZxNXpkaFBnQ2dNa05BWmxyeWhGdkNZWlcr?=
 =?utf-8?B?QkVPODdBdEg5eDVhQzVRa1pBL2QxMjFXL2N2d0R3VU1VQzdnQ241bnpSNUpm?=
 =?utf-8?B?Q2EzMGpwOFhlL3dmVkRSL1NIN081R3E1aU9CZHc4L3NBNGF4OGVQY2NJSVh4?=
 =?utf-8?Q?nyjtueHWjFBN7nWyvOWagIw9t?=
Content-ID: <70B43A1FA43A1344BFF81A1E223CA9BA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd77e50d-a596-4352-43db-08da8056284e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 13:41:15.7781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJaBVqnnxn1cH9nB6f53jEV4WJ649blXJbA4XO+gUy7MoXpYzzU4+jvFp/yEbSqpKthVtXQL1tYayd5kt0hoYqqHFsAabxmf8ns7a8XJXEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_064141_084203_EC5C44C6 
X-CRM114-Status: GOOD (  15.64  )
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

On 17/08/2022 14:31, kernel test robot wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.0-rc1]
> [cannot apply to thierry-reding-pwm/for-next robh/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/Microchip-soft-ip-corePWM-driver/20220816-201744
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220817/202208172150.rEZ2HEYS-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/961e375a245186c8ec2c40e48e5baf40a112f14a
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Conor-Dooley/Microchip-soft-ip-corePWM-driver/20220816-201744
>          git checkout 961e375a245186c8ec2c40e48e5baf40a112f14a
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     arch/mips/kernel/head.o: in function `kernel_entry':
>     (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
>     init/main.o: in function `set_reset_devices':
>     main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
>     main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
>     init/main.o: in function `debug_kernel':
>     main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
>     main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
>     init/main.o: in function `quiet_kernel':
>     main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
>     main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
>     init/main.o: in function `warn_bootconfig':
>     main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
>     main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
>     init/main.o: in function `init_setup':
>     main.c:(.init.text+0x234): relocation truncated to fit: R_MIPS_26 against `_mcount'
>     main.c:(.init.text+0x254): additional relocation overflows omitted from the output
>     mips-linux-ld: drivers/pwm/pwm-microchip-core.o: in function `mchp_core_pwm_enable':
>>> pwm-microchip-core.c:(.text.mchp_core_pwm_enable+0x1cc): undefined reference to `__udivdi3'

Ah god, not this again...
I assume it's "sleep_range(period / 1000, period / 1000 * 2);"

I'll take a look & send v9 later in the week.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
