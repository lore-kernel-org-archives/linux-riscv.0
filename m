Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445AEC25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNLEwvS2ieEBxiQxwqFqdj9RN3qm4qM/DfXg/lcI7uw=; b=UfTJFnGDeRgh1f
	SV8fgfTYsXPH6MW1IUeJ+71RBB7CmTJTCT511cyzsrAFB6AGiThTcJQOegAXUouZ3ma9RFpw2whIH
	kWADjYQxSqjItscJTmxwrAfsvtt0khCgoREAmvPxPrk6lT5l3Gu3pMn7TobdJfMSkoztnZP7lMMqH
	4AVTZC6tZd2lw6wr1dnYW8EUETC5qR7sqfVdZCNAshJLW0UZfKibb3gaaIQF2jcC2138SDPe0O2sr
	lXMgobe03H5MQeUl5SJ/RpnHM38TDNnC0RSBDalVsnegXwHTxpNExHcDR+MFhujxPXyeospbItwX+
	3is1oZCNeK2X+b700rRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMZke-00CFPI-Jp; Fri, 12 Aug 2022 18:51:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMZka-00CFNP-RH
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 18:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660330278; x=1691866278;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VuN+AIzVMKowdSQXl/ob2zxUl9fGtnyQnZ+LasYE/VY=;
  b=S3KjejDLXm8pRAnm7/mfC6Kk5g7AkY/QR0MIGxkyoBdMoqU2oag0R5gt
   oZjbRU8Jrlj1iq4MB89E+ntUF7DoS+ejXwTjTJPYaaRels35wpmfJz0tL
   mGNZ8/YKobEVWT6C3b6tFldesy+THx/9Fi8ym4m7fLRa3mBLWrlEFzGCA
   gH/JCTvyo1JE6p8Rzjtl2TcVvuBVnjyYU4+hP9xk0UCof2YUMB0SV/exZ
   bMBIuvBmEZt3TJW7ac2lSntSfkS9+IBcOv3Hp9eiBxif4us5yUvlcPoqH
   rLtG+3JSOHOojRd42t465aCWMIWdg1y0YIMK2UeJLJCTBQ73XojUzxZiW
   A==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="169085341"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 11:51:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 12 Aug 2022 11:51:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 11:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj36wZ/1SD38WHMy4yCs7tEQyR+Z/XAWfpkyQb28oNu+3Mv0BUqiq1AYIJ8JJCaFAcFcFLVhCyw6QsbjOVmzx5n+xvZqQCB+StyRk0/POJCXN+QK9lhQQp9hG0w+oufg5cmahh67cWqC58Ch5woA78azSYS9oi+yxi8h5QbZODDuzbA1py6QYANOKWwZPx8QNNKTbg9KbKotnfQkbYYgYHfadvLTRZjtbxaoHQyVENm1F01Nrw87UFljj/m6aWIVk25DjTvhUIUy/TY2Mn6K/ka0cMqsBCYReMJeFvjgVoABaDo5cgkPOdMUtE3WYcb1XaIj7ZlyFcuRgLYBuPF6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuN+AIzVMKowdSQXl/ob2zxUl9fGtnyQnZ+LasYE/VY=;
 b=NPkVxlW4aYhNB4GHyurQsCS5427c1DtxolcbZtZIT2qrBHIXBoF503wK0cROXbRfF78M88R7AiGJMD7AmORvRGaGEE8BJ0gwryLXMaFmDH7f0L7/vxaeJzkohBxqaorXsjGXKPPex6LUlqDm6HckBM2PGo+IpegPR8T1Ye1DSOcHHG+JiKcO+g69gTIXEgzks3UikVyT3/g4sOidmbdf3FyQ8P7cXRZIK7ZgICwdyVhK+ud+F514LSYx5g1LOBYKTejI4xWC3OuXPQ/oa9S63QsHdA4lIctLhlajtCjWlEnUGTmOkti/FOQoBdPEc4fIIn8dWvo7CZlBuhDY5+kHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuN+AIzVMKowdSQXl/ob2zxUl9fGtnyQnZ+LasYE/VY=;
 b=HICY4bU1xL01Asz8LoAT1K/bVuTJyL3Ef0n/vovTRDhpYrPMIgq8Mb8swkIHYxbUNmZJPaZIfIo72JILCi4wsMYEWlzCMdXRm6IbYuE5LSCefabj0DcNvrE2Vtr47LXl8qG8I74wwnrql/F/zc8ym2CnBNtVudSdCpY7zG6khs4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Fri, 12 Aug
 2022 18:51:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 18:51:00 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>, <mail@conchuod.ie>
CC: <ulf.hansson@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<yamada.masahiro@socionext.com>, <piotrs@cadence.com>,
	<linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
Thread-Topic: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
Thread-Index: AQHYrcFxzXmqZluWDkK6zKWVpeVxJ62rZiyAgAA3PgA=
Date: Fri, 12 Aug 2022 18:51:00 +0000
Message-ID: <a368665b-d93f-cf74-a25f-7d1d7fb313c0@microchip.com>
References: <20220811203151.179258-1-mail@conchuod.ie>
 <CAL_JsqLOGLZD6vrNPqDUqYypkz8xoCPJ4DA4JF-BrG=WHWPurw@mail.gmail.com>
In-Reply-To: <CAL_JsqLOGLZD6vrNPqDUqYypkz8xoCPJ4DA4JF-BrG=WHWPurw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9104f30f-fb03-4a26-b0b9-08da7c9399a1
x-ms-traffictypediagnostic: MN0PR11MB6229:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6jpRBdwQqXk99/hEh+3FTKqnQQ9uORtKOs/nMuCV5viZ93QGQ0XDy0V27ytBMr7u6xiE+Po6Dxow/XQo6lYAreXKcuEUMGMAWQ8T4BuUMMROn+R6Gj+wfMHFFNElzY+rjx83a98702Aj+J7BP4+vjtsbkJ1u/x527S4dk2Sg8PqDZISEqiEeGmnGZYoptW9R/7ayTYoWtBE1GGv2g5pACAlyX/yc3XOu0gRgjW2d7742YrsR9Gq5mlL9CV4aJG2CVO1Lz8VF6u6JWez1TnwmAzZBXSRqZLVMgV5By8j7A1eg7VGhvRzguwSQdiMq50qrDiIqs+KLInSKC4kTICl90KHgHnNlDgexwqcOVnuyfMbJMjqxt93e9KBlooPunTBr14cja5OyeAsUAK1J8ZLI501bPKLwjIXYtDhQ/ZYYKgo82zThOsDDHGaKXUEmU/vGvB/dcecdNGB0YNEKlNbO3HalBlgF5qU3SFbtHu1m1ZYjivnVp8JQfCMaYlBzOEcBNktVc3FWExbV2yQfXXNyj/AWTwIdlfEWgDzhQ4eCTULUf9mmD7/jzRPRCwZJnIVREAL0Eld03vOZJC3LYwJ2rMYgPKfcBcBTLF2GqDYTlQ8JXPt6EO+/nT6LactZ6lvBPW4TtecoZp21aIlCFV3fTSkNLNknmPO+msZNTrfnPb4zsAvDo5wy/elRb97or1XbJnVo/fUjQEs373rKtTscUjLK3NVy7LaXkWKILRKL4tMn5q2eYFjDROr4zFEv/lBbYOSdv5pvui6Y8meLGuhe2Qa2pCebOv2VnJGRhC0vGsBuZhlfHUA8SZy3akpBkAaIoTU65HyfXTLGX9Werg2dBH8kMdXcGLLYbgY0gcbwl/MIdtGV++pJRshumZBR6qHx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(39860400002)(376002)(38100700002)(110136005)(41300700001)(122000001)(316002)(31686004)(83380400001)(36756003)(38070700005)(66946007)(186003)(6512007)(2616005)(6486002)(4326008)(8936002)(8676002)(7416002)(478600001)(5660300002)(6506007)(86362001)(2906002)(71200400001)(64756008)(31696002)(53546011)(66556008)(91956017)(66476007)(26005)(66446008)(76116006)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVVyN2RKWVN4eGlyVzJCTEtkdlhDV1NZZ1FmbWZxT2ZSMnk5dVJ0MXB3M0JJ?=
 =?utf-8?B?WGFFZVQyVkpFVm5udndYY2hwWU1nU1BsSklwTTdRSVJ4VW9wU1ptYWhFLytj?=
 =?utf-8?B?WmNnSzJXMno2S01CWjdBTnVvSEZQWDdMQS9iR1duTXhqNUUxeXZyV0VMa3Vm?=
 =?utf-8?B?L1ZuTFV6WnNycmE0U0dHY0liYi96U1BOM1JacTlQU2Y0c1NzSndXbjV6U21n?=
 =?utf-8?B?ZnJJSEx5VmRndHZVQjdtdXR3UGdHZXdvTStDeW1kY1ZVbmlRQThwM1k1WVoy?=
 =?utf-8?B?eVEwNFFBZVJRMVFiTy90d1QzQXlBWG1Ba01uUVgvTitkdlJNb1dkbGQrRXFi?=
 =?utf-8?B?OGQwYXZYOHhEa2FwVGJZUVVrVis0MFNleDNWRUJUem1XdU1OSnFDK2p2Tktt?=
 =?utf-8?B?TTB3OHV6UUova215YUswR2JUWVhPOWNBaHRROTlMdEp4NFhrSTBkMnBaYmUy?=
 =?utf-8?B?dS8ydVdNdkExbU80LzBBcmxoZGtQWlIzS2JCU01IRnhzdm5RYUVMUzhyVjdv?=
 =?utf-8?B?bW1LLzNvR1kyRDJQRnJOa1VUSW9RUWgvRVNGZXVtOVZwNjMrdGkwQzhyV3Zm?=
 =?utf-8?B?ZjhiTGJESzRQcmJyR0Q1c2daMFFqc3I4a2c3RUcrOFlpQW9Nb1NPZUl0OEFK?=
 =?utf-8?B?QXB4b21tV280VUpjeXF3U1hwZFBmZHY3VWFkZ3hhNk0zWjBkR2NuTXg3Skta?=
 =?utf-8?B?M0EwUEN2Z3RxbElnaWQybkdacUdLT3hhTmkzdi9iREMrQ0pVWjBIQU9BM2lY?=
 =?utf-8?B?dDhyMkdsSWQ4YmtjY1dtbGZWTERUUGNUL0J3SUQzTjRWRlE3UHdWQ3J0NFRa?=
 =?utf-8?B?ckZnWHBHYUpJYi9BclpIUEJwaWZtNmVUVmRpWXBWTEVYWk10OTFRWHduQWx1?=
 =?utf-8?B?SzNiNHFNbFEyQmlTOFFHM1d6WVRqNDVqakoxSnRWc0F1L3h0NHdya0E3dzFC?=
 =?utf-8?B?UFI3S3E5SmIzcHdSZXRUMGRvMndOVU5ZVlJmRFJvWUx6K3VNTEg3RU5RVE9P?=
 =?utf-8?B?cXN2cUNPQlI5S3EwaGhjYWd3RytYKzNmazBGU29ZaFhTZnJYb2tnOE02UGo5?=
 =?utf-8?B?MGZOMVQyK2p6dzJwcDM4MnNhdkFiNStUMkxLR1BOUnl4RDkwbXdKMXI2cDdF?=
 =?utf-8?B?bUNGT0RwSjA4eVVoa2MrZU5WYm0wZE91MTlDamJoK25CcWV1R3JEL1p3bkNK?=
 =?utf-8?B?anpDbUhpOXFUa01nZ1ZYVnJyL3d6SXNrNjgvcFR3bFh2Z3B1S3FUekUyblU0?=
 =?utf-8?B?dXQ3L25vNnUzcHhmU2Q3WlMwS2ZrQUVPdUdNZVRiNFNIcTdCSXVETGJnSkVy?=
 =?utf-8?B?YXJ0YmFQQkdra2JkRTl2VWRmZGtHZjV5TGJWK1dGME1uclNvTTlpS2tjUkZU?=
 =?utf-8?B?QzhubXptTG5hazlEUjNZY2FHMnAwZkhBQWRpbmZsaitJZ2NkeUhmY3AvdG94?=
 =?utf-8?B?dTA5dDd1d0g4aWJxVVFSS0Fta2R6bWVWQlk1dXh0NVN3TTJLQTg1SzZSZ2Vn?=
 =?utf-8?B?QThGeGpWbSttOHFyRk9EWmp6ZTZ0U3l5aDEwa21zM24xSWc5c2Nrdk5GNmYr?=
 =?utf-8?B?OWszdnZpcVNUWEVTaE01K1NIeGdpTlY3NTFHR2tXRkZYNFVFY2dmT2FtZzhz?=
 =?utf-8?B?T2VKcTlBWmtDQ2RGUHFRY2dmSFUzWVRpclQwSU5qU2RxaEV4MkJTemkzZGg2?=
 =?utf-8?B?YjgxMzNjMFFjNjlFcktmRm1qNGpGczZ3YzE1cSswWmhidUJwQWhpd1lCcENR?=
 =?utf-8?B?Z3o4VTUvbEE1eFR6VFB4NkFOaS9VWlFPS0N2YXlnUWNwTmhSTWJzU3kxMmE4?=
 =?utf-8?B?a1ZEd3Y4eXdSRnNrL0cwZ2k4MHlJaWJNNEJwM3V1SCtiakFDeTdBblovRFBQ?=
 =?utf-8?B?dVA4ekJXalM4OHV4VUttUzJoOFgzVDl1eHVLMmI1UWxQZTRacVlqeDA1SWRq?=
 =?utf-8?B?TS9hM1NicmJabHYvM3VXUFVvOWZaY3AyTVNYL2xGSnJYejNlbWVoNzg3eVFK?=
 =?utf-8?B?eHhqS2VYWVIwaWc4aUxoVGk1S0xpb2lCNmRXRGRyM3pJVFFLOUpuVkc2dXNa?=
 =?utf-8?B?TEJ1L2tQSHFvdHI5elNRNkxPbi9wMFNBdTRvaDNzVlovZDVQbHZZeG5WRGdH?=
 =?utf-8?Q?Sv3c7ZtACdf924LNjvPR0PQuq?=
Content-ID: <EB78EBC08B26C94A859D406E03D3F7E8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9104f30f-fb03-4a26-b0b9-08da7c9399a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 18:51:00.5737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Efci7DVRvj+gnJs52NxI/SpaNqgPtg1/qMj8ShDJbvmPp9sxqjj14CKXsgHE45hLEjJfMX9v0UBtZV9UkFKwRz/O/KSlE3lDeh8kAEExqeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_115116_969240_CF4E2624 
X-CRM114-Status: GOOD (  13.28  )
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

On 12/08/2022 16:33, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Aug 11, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Upgrading dt-schema to v2022.08 brings with it better handling of
>> unevaluatedProperties, exposing a previously undetected missing
>> property in the cadence sdhci dt-binding:
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: mmc@20008000: Unevaluated properties are not allowed ('card-detect-delay' was unexpected)
>>         From schema: Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Should this have a fixes tag? If anything, it'd be
>> Fixes: 84723eec251d ("dt-bindings: mmc: cdns: document Microchip MPFS MMC/SDHCI controller")
>> but idk.
> 
> No, the common property 'cd-debounce-delay-ms' should be used instead.

While looking for the fixes tag this would require for the dts, I
realised that this is just another of the properties that pre-dated
my involvement with the dt. I think it's in the same category as
ti,fifodepth & was just copied from somewhere else.
I think rather than rename it, it should just be outright deleted.
cd-debounce-delay-ms depends on cd-gpios, and we don't have any
GPIOs wired to the sdcard.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
