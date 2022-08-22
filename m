Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F05C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8W/DfrYIzhVJ4kc8qHpzk/7MT3YYKV46IhkdAbC7vU=; b=cm+59ODInr0WmT
	KGpPw712RFWSFOcvcdq02c1sV5GeXEralPLx67HlXExOnvZUnTnAKhxQsFXJ1G2qCoMf0I9ShtXhO
	mdZukJ24ciPmUd/A531PiqtXtXUBHfX8VGYy/XPKF25NTeaahsPv0/p4nhgFXmW8FxmdlSLdpl6Ja
	yToCp+4llc+6qtuI2Nx48QVGsGXXWVYWEcyLSj3LeldkwxApchgwE4mkQvSLFKLTlf33HmnAn+w16
	u2VB/J6tbZTjkPfamnFawTNsjZGLE8Vql+GW+1DqeOkXtHb+cVnuPukgLar2vZ4Boh6Ickr50/2hi
	K/eFfuyxiKPmNnkfV/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEsS-00ExOp-Qv; Mon, 22 Aug 2022 21:22:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEsO-00ExLl-Eg
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 21:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661203348; x=1692739348;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W8Is5HDEOnKPibowGQS731xLCNRiMhbm6S0atR/C1tU=;
  b=oV3pvwChfM3fp8sS7N7fhYSEaSYO5PhKoIAZLKMWeDZe4ZYNAFOqT2DZ
   26U6ZQuC/mDTvVRKpwJ5DSCzH5iqZlngvV5FHmGRUEVmYGPETySiplr5Z
   oGlbLBSARWmIw2ZAMMMlW53C3yOtLTFCQDmgZ1olz+xCK5eqLO/fd6vg5
   rGXmGQ6QPg9JXQnRKRpQcah/P1b7toUFuW2yiCqluilB0miCBhkAt6HYv
   Qa3lUrOaurePtz4J568jVEJ16KBOMZWQbe6EenUkiFucLDqyHRyIIJ3eC
   nGSlisipk5w4c99j7ec2dK/TYmZu1vhi6WIi2Z7mMXzN4Niv+U20fADLL
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="173604837"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 14:22:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 14:22:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 14:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iavBKQHEEMVOOfbF0B0vAWN+luQS6NKuZ/mUcwgicOnUy6TMduv3KCK1eMFequHue389mlBjj0FPwCIbJCP3kDskQfDhCJLoEDyRvL2dwfac9UxX4yYRuUHNpPHIQnMd+SELFL0TqWKPOZ71Zr91/dwkeKKLqd2PLnArGVyBetGTXIaa8epRu5QbGPsFmE0kJvUPukAnrE76S3ukMU3CNVnGAhpwC/WI+lPEw1JtYgYRnfj5+YoePhb3YtPbdozDm4f70U1j5lNUGDWJ1yygEnvQdk8zstMIDnuulXth6RifHrSNJim9xnoDG9Ty/wQvrFrwC7+pEz7PDki4FYZ+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8Is5HDEOnKPibowGQS731xLCNRiMhbm6S0atR/C1tU=;
 b=O3h1Z5SZz8lVfbYZOoV2eXVmUcosaRRPBrpG+RV4CETGHK029X03nr05WHUCPgr7bB4gGzxSCNGYEuiqL/r5c7iesa9Gh6ZdfojGASd5vKYg0km3L9WjAJEtEKVdevuOaBKATRuHf8abKgUqsDoL3ogJsEVV1WEtUCZWMctDWgJ+dtT/kBXY5hdK6pTZXep8vgrpdUd1Jwqg5LKjGWOa9pzs6St6ytz56wLzKLAIBed2JvQrhKhwXTKc7sHXgcTcgD795aC5UB8EC6926pxea6uevH5a2Cww6sA7ciKMKW4WX/fzObfA8eZtCJQbR0N3aflrmXXSVeA1/VOizUk+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Is5HDEOnKPibowGQS731xLCNRiMhbm6S0atR/C1tU=;
 b=e22ZYfUPY3xaOzh+YxaKTCJknQl6TxYWLrmKR6yflVmj37CcGdIxdfl+ofie1g09G45ZRlqttFVc1rUOePSlwxoqLOcP3dyUCZsEbQwAcBzEAv3vUIMJ8/V4zmw5mk6hlRatL5xSTStSYlmt6VJc+Iw2ZM8SXekWD4iKGK5D7gI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 21:22:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 21:22:20 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v4 0/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Topic: [PATCH v4 0/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Index: AQHYtjy7kpMXEtpP1EuwQt86HG0KbK27bgwA
Date: Mon, 22 Aug 2022 21:22:20 +0000
Message-ID: <58a097b2-ffbc-508a-d98e-9bb567da0f90@microchip.com>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8d6f801-fe02-4675-bc57-08da848465e8
x-ms-traffictypediagnostic: CH0PR11MB5284:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jhYY/inGORAeaWLrl3gV0uNbv3v+wvREZjjXP5NHU1kZasbx+FWpis0tvUVKJrMOJjJz1mIrTUTJln/UxRuoXO3j+q+Ub4csPxzNlyp4akCv+YOEh0KdUvZf5NXpJAMQudlJr97UyQ08js3kc6MPK6oo4JgZa8ePAzZQChkcFIvWSXSYWP2MZAMwIIQZJpI3KGtdwe/pBL1dhz6pyO+uG8Y3fU/wMfBn6rEqfyNpQkmF6vIJXT0HZbvAsuV7kexjxbJPyu4m32mJKi8cEqwJ1Q0J5KKaCZMX1gQLSF3hddAke47Mk8MP1Xo7gRqPsdePwM35NV/UYFLxPgRkQe2ADvny1YFq4ws2dutoz5W/BIYKVH/RFHPbpKhK4veiST1TSSzUMHyQRNYpE124Iv1ILbJcntWKe5/TNeKrZ57IRmfH9larh8o3YqOGMChzdwbdKU4x9xpXbXOEodHRIahHC00wy3LMEn03GaJVPSnhYagJHmkhoKgitkWRlym4eulah9gBV3TO6bvBAroKqpeIQf5Ou6hSsC/FEFt+N7Pv+0awBNPTXfDiu/mqfB5QSNs0IW9Us4h+QcNK+2wU1HDkG+Cec3bRFny39bVCn88GiWpakw1MkMmx/CBcV4QDddy2lXI3crAiTTQNQj+FhJCvA25LcYH7/6UDRR3IiFTR0QjoGjBd4bslFvMgPsFrBVG4/ymgltCt2rRL+lnQwKVS2sEBK3edX4RKoxMS0aF//EDB+qqOd4LoQ/72kR8w71TQ+mAJUGEjrSFFLVYWSMLaAETCMJjWltCl3M/phl6SO2ECiySBpcyC4XdCz7qPvquAHASHx4C3foRbsG/U4sgAcu/pU/Yy9SQ8QchIUhoV10=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39860400002)(122000001)(5660300002)(66446008)(64756008)(66556008)(66946007)(66476007)(38070700005)(8676002)(4326008)(76116006)(91956017)(478600001)(6512007)(316002)(6506007)(6486002)(38100700002)(41300700001)(26005)(966005)(71200400001)(31686004)(8936002)(54906003)(83380400001)(53546011)(2616005)(186003)(110136005)(31696002)(2906002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkZlSWtKRElGclJaT0RWQWlrak5kS3ZpazdqcUU2eDRNelBvclJSUnRSN21O?=
 =?utf-8?B?NnNqc2x6WnV4REdkdFd6eTYyckF3VDZINzJ0NUlEUGRVdmJESzhZQ2hoTm8v?=
 =?utf-8?B?b3plTWQ0TnFHTVdkendYMkxDcHlLbmR2bCt4SDBiNnhjemF0a2ZLUGhRaGQv?=
 =?utf-8?B?MWFzZnBUMFB1TVc3bWZpNjBteHRhMDBwbHJlbkRPSmVybnU4YW5NVW9waGNQ?=
 =?utf-8?B?cjJDU3lXRXFCY3ZUcERYZFhoelBSQ1NzM1Z3akRzOEQzQUJWUVR5a1BGZFJ0?=
 =?utf-8?B?b3Y0VjU1MDZRMFVNd3M4bHk2RW1aUFR6S1VvOW5PQ1pwTnhmRjBBbzdZWG5E?=
 =?utf-8?B?OW91TlhPR2VuTXk3bWpoS3JwQ1RRRGZMNXRKNEVtNlp6MW9UdVgwRUdDUTgx?=
 =?utf-8?B?Zy84NzV3S2UyT0E3YjgyUlVqT0JKNGNpUWtSUDFkblpvRXBjNEdGZnZOdEhl?=
 =?utf-8?B?QncvZ0h2akVpTzdzUTk0ZWwzK2dLbXV2WGpsSUhKREI1eUY5eUZ2cmpUajUw?=
 =?utf-8?B?bjB0Y3Ryenk0RlZ3ZUZIaktoc0pQd3dLMFcrUEhnenlwWmVrbnhZK2pxZUxa?=
 =?utf-8?B?YjJMWitKV3dtS0xCaXZQVTMvRWU3MmFKN2UwRWgwU0hGaVEyRURXbTRmK25h?=
 =?utf-8?B?Lzl5MGRlNjg1Y0krV29YdHhsSktVKzNIby9ObXI1bHUyRVRmQlduVS9aMi9L?=
 =?utf-8?B?NHd4WndiQVdDeExDODRqVzFJVm5aUGxOK3pvVnBXQklGYllFeGlxdGNnankx?=
 =?utf-8?B?RGVTY0Jnakg4WTlYN3UyeWlrSDBqNm9nOFdpRXRvM25UWVgyV0pJZzl0d29L?=
 =?utf-8?B?SWJpdmpzN3ZJL3IwT1g5ai81Y0RtTC9USk13RlVXQ2cwcEYrOVJSeUtrSGdM?=
 =?utf-8?B?UldOSjhaM2lTeWh4NFo0U1RzbmZpLzlWa2xQN2xjZlRRREluejRjZ1AzRC81?=
 =?utf-8?B?TWNRY3NUWGJSZXB6MlZObGd0cytIYmpMQkk0QVkwc2Z5bU5Jc0ZFY3pWVWZZ?=
 =?utf-8?B?VjRDbkdzUTZEKzcwU3ZQTUVmTm44QjF0Q25BZGtuYWhkUVpicWVSYWVRKzY5?=
 =?utf-8?B?VFZIMWVDRE9ROWczK1lIZitwUzJGTnBkekY1MW9jS1pEbllDMG1ob29jRzll?=
 =?utf-8?B?b1V6N0tjWGxlWi82Rnp6ajEybXA0OHZQNDF0UWEyQXpqU0pndjdxKzBpNmtJ?=
 =?utf-8?B?cExVVzVSM3JZMEJ0QXVMeHJOSFNzd1E5d0NyUGZqMlNsN3BSQ2FXenQyRCtQ?=
 =?utf-8?B?QXc3V2RmYXpxcjFvYlErSkFEUlZtU05qKzhpSnZtVnJLUmY3b2oyb0JRS3Js?=
 =?utf-8?B?bFZRMW51Yng4L3BxcUh4RnA1aW9TNGtKR0FlRXQxZzZRQk5PWitVZFZCdjVj?=
 =?utf-8?B?V3BkK3RLdFdxZE9lNmdJQThvSGRSOE5Wb0pUVG5QZG9ZRThlR1ovUG9ESkZy?=
 =?utf-8?B?OGJoT3RZc2wzUVEzWnZoOTBnSnhWV0V4L2NIMDJxYWZYQmd5WWlpamtWSnB6?=
 =?utf-8?B?R3RTbW5NZEg3QkF3TUs4OHR3Q0ErbXNSNFdYbnJJcDlNcjdhYzl5RjVFYkNB?=
 =?utf-8?B?eE9vZW0xTmhCekxPUm8xbFZqVUhLYkQxMk41ZWJjUUgxTUJGd3JFb3VIcjdJ?=
 =?utf-8?B?amZpRnFHdWlHL205QW1sVGxxS3dpb0pjRzUwYjI5Wmg5U2JzY3Q0dUwzNlFK?=
 =?utf-8?B?UlBNMlJJVU1tSXRaYXNVeE13Zy9nV3NLbm1ydG1MVXRKenIrQkFncEVRc21H?=
 =?utf-8?B?YzVjNWg2WTI4cUNCRzZQczVXM0dYZHdIYWhnMkJXankvQUNZYjVodWZndDRI?=
 =?utf-8?B?TU9vVUFvaHhyaGtoOXhDdTBqWEZuaDUrVGorWGt6a2pLK3ZXNjh4ZXBDWERp?=
 =?utf-8?B?WWlUUGx1QzA3SHpGcmxyckNoNjFNMzliMW5jYUdHNG5OelorUUIxZE5iYzBz?=
 =?utf-8?B?d3c2L0ZiSVc3SmQxOXNKVHZaUU5mTUJKclVqRGF2TGVZcnhVZHEzdytGY0cz?=
 =?utf-8?B?MkpYcC9nbm9sOGdWNTJteEticFV3aHFzWXRhWERSNWJya0duQXc5dWZROUF5?=
 =?utf-8?B?MXZvZFpnekNONGw4WGtLekUxdVFoRXRRamk0MjlmckJZNnJxT0hXODZ2UjhU?=
 =?utf-8?B?MDh2ZE43TEZGdm1XRzdlc2ZsSFlzTGttdGRDUFA5RVViakNrcWxjeWJnWFll?=
 =?utf-8?B?WGc9PQ==?=
Content-ID: <518D83C8E7ECD24A8599D600181B4CD7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d6f801-fe02-4675-bc57-08da848465e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 21:22:20.6021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tmVVcRgR4Roo7ICiteXL1Lt7n0DdrZU413YoA/0JJFsS6dSvsgcnBzMxp9XKXMeCFU14gcyPCykoC5iRXTzkq3hwYp5DqZxuc7Hf1WkekxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_142228_698544_93DD8109 
X-CRM114-Status: GOOD (  22.58  )
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

On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

Hey Qingling,
Apologies for yet another mail - but I built allmodconfig
with CONFIG_SVNAPOT=y and got a build error:

  CC      arch/riscv/kernel/asm-offsets.s
In file included from /stuff/linux/arch/riscv/include/asm/tlbflush.h:12,
                 from /stuff/linux/arch/riscv/include/asm/pgtable.h:108,
                 from /stuff/linux/include/linux/pgtable.h:6,
                 from /stuff/linux/include/linux/mm.h:29,
                 from /stuff/linux/arch/riscv/kernel/asm-offsets.c:10:
/stuff/linux/arch/riscv/include/asm/pgtable.h: In function 'pte_pfn':
/stuff/linux/arch/riscv/include/asm/pgtable.h:299:35: error: '_PAGE_NAPOT_SHIFT' undeclared (first use in this function)
  299 |         ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
      |                                   ^~~~~~~~~~~~~~~~~
/stuff/linux/arch/riscv/include/asm/errata_list.h:165:23: note: in definition of macro 'ALT_SVNAPOT_PTE_PFN'
  165 |                   "i"(_napot_shift))
      |                       ^~~~~~~~~~~~
/stuff/linux/arch/riscv/include/asm/pgtable.h:299:35: note: each undeclared identifier is reported only once for each function it appears in
  299 |         ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
      |                                   ^~~~~~~~~~~~~~~~~
/stuff/linux/arch/riscv/include/asm/errata_list.h:165:23: note: in definition of macro 'ALT_SVNAPOT_PTE_PFN'
  165 |                   "i"(_napot_shift))
      |                       ^~~~~~~~~~~~
In file included from /stuff/linux/include/linux/mm.h:29,
                 from /stuff/linux/arch/riscv/kernel/asm-offsets.c:10:
/stuff/linux/include/linux/pgtable.h: At top level:
/stuff/linux/include/linux/pgtable.h:1457:20: error: redefinition of 'p4d_clear_huge'
 1457 | static inline void p4d_clear_huge(p4d_t *p4d) { }
      |                    ^~~~~~~~~~~~~~
In file included from /stuff/linux/include/linux/pgtable.h:6,
                 from /stuff/linux/include/linux/mm.h:29,
                 from /stuff/linux/arch/riscv/kernel/asm-offsets.c:10:
/stuff/linux/arch/riscv/include/asm/pgtable.h:763:20: note: previous definition of 'p4d_clear_huge' with type 'void(p4d_t *)'
  763 | static inline void p4d_clear_huge(p4d_t *p4d) { }
      |                    ^~~~~~~~~~~~~~
make[3]: *** [/stuff/linux/scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
make[2]: *** [/stuff/linux/Makefile:1205: prepare0] Error 2
make[2]: Leaving directory '/stuff/brsdk/work/linux'
make[1]: *** [Makefile:222: __sub-make] Error 2
make[1]: Leaving directory '/stuff/linux'
make: *** [Makefile:179: allmodconfig] Error 2

> 
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in Linux Kernel's boot process
> and hugetlb fs.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"Svnapot support". Its default value is off, and people can set
> it on if they allow kernel to detect Svnapot hardware support and leverage it.
> 
> Tested on:
>   - qemu rv64 with "Svnapot support" off and svnapot=true.
>   - qemu rv64 with "Svnapot support" on and svnapot=true.
>   - qemu rv64 with "Svnapot support" off and svnapot=false.
>   - qemu rv64 with "Svnapot support" on and svnapot=false.
> 
> Changes in v2:
>   - detect Svnapot hardware support at boot time.
> Changes in v3:
>   - do linear mapping again if has_svnapot
> Changes in v4:
>   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> 
> Qinglin Pan (4):
>   mm: modify pte format for Svnapot
>   mm: support Svnapot in physical page linear-mapping
>   mm: support Svnapot in hugetlb page
>   mm: support Svnapot in huge vmap
> 
>  arch/riscv/Kconfig                   |  10 +-
>  arch/riscv/include/asm/errata_list.h |  24 ++-
>  arch/riscv/include/asm/hugetlb.h     |  30 +++-
>  arch/riscv/include/asm/hwcap.h       |   1 +
>  arch/riscv/include/asm/mmu.h         |   1 +
>  arch/riscv/include/asm/page.h        |   2 +-
>  arch/riscv/include/asm/pgtable-64.h  |  14 ++
>  arch/riscv/include/asm/pgtable.h     |  70 +++++++-
>  arch/riscv/include/asm/vmalloc.h     |  22 +++
>  arch/riscv/kernel/cpu.c              |   1 +
>  arch/riscv/kernel/cpufeature.c       |  18 ++
>  arch/riscv/kernel/setup.c            |  11 +-
>  arch/riscv/mm/hugetlbpage.c          | 250 ++++++++++++++++++++++++++-
>  arch/riscv/mm/init.c                 |  47 +++--
>  14 files changed, 477 insertions(+), 24 deletions(-)
> 
> --
> 2.35.1
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
