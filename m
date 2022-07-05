Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF92EC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaiYWvBYpJ3kw/JlYX/tr1LZsL3d0QdwEoysvrH8/2M=; b=F4vhLPSqPdbjNT
	YPgIWAyF/z6a+9tnBfH5UR175gxnrb5JYaA96swf6QyfP7Lumyg8THbsMardfk+H2SdaoDH5UBsmK
	B3pW/is5RqlcphJcbU6CWvILSBO0eEFxEXoZEkrmk10mI+JZz6rNgu4xZamMqasMzhjRrH2cWb5aq
	mFFk8NTjazKXmmBaL4AZOpBFNol8wX6iysYLKmb0aCJfUnoeA5XysqD2XuFZN9wu6lJbUhZfZnGYb
	bisNzwaM/orBXFQcBkEgwotf51Grbp6hIlR7Ip2DfZGZouwX3zc9X05IOQUpl/dEK8EXNlppUKPdc
	JHaLGIghdGW2I+ofunVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pZ2-002kQj-Qt; Tue, 05 Jul 2022 20:54:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pUF-002iG3-Fb
	for linux-riscv@bombadil.infradead.org; Tue, 05 Jul 2022 20:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=r2pm/lAfroyKcUkX5Rgggs3XnYxOHFrQWrbiunnOFUs=; b=hJLuvm5bA68IKZNp5/GDdYHdkx
	hftFCxaauMU4Udkktp7LKwXoFLiSbNzBi7e561CIAp/RYXTwHi5Fvw7MbU1KZRD+lgtIqnDjUePH+
	HjAynCyaLKdTDE39mcXu6YM82KBKdrfkEoCLonizgmtIA8TqkdBwg75jSEMAgAIVh3Vaev5/I0FpH
	1FCzKQX3H2CN3H9+v2IUCDCE2bbiYZgPOLb6Yc6hUTeNXjpyXOwgxdtKyYlBAxLUUt0pZBxloDt7i
	E4IuGL37/rpogk4UL+d5pNMPyEgsUYwDgB7VIeW2xiARdB02CdEj1hHuFtWfhANZUTD//iTwYKOKu
	+7yJTogw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pF2-0008eB-9d
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 20:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657053233; x=1688589233;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r2pm/lAfroyKcUkX5Rgggs3XnYxOHFrQWrbiunnOFUs=;
  b=bekAMwe2YnrOA5UGnrg5TKU3yRkydJqJ92fDkZqgoQI/nzGqEHJwYLb+
   pBcAGe2JvzBtmqDk/Yru0X7i57p+97lwJUWI4fnp9kHrNf8N2EBkk7jwT
   MLuFgl4W2J+E47HAdZO1oE/QhIr91FGxrLX1k1yWAUb2fhzI3POha/FTa
   B4w8n6BCllCBxxBgLPbweJ8LszX0P1Bw1B9UV09hiaDSk+m66EH6MTG7N
   aQ76nQl5LicdIpF8EQJ6zT5UbVBEyjw73R6Wi3SmA2NFnIoNpwtJ0uDln
   y8ZNYLtsSuPaYngow7O9e3nhS7fu9CWjEPtX7jv0diV3nMkKXoKTx6HUc
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="170878579"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 13:33:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 13:33:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 13:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU0RbRpb8G9sfeFKXBhq9fQiJshgJ3N0srcjnUTa2b4d6wTVN2cQ6I7+nkcQpUONuF1kQF8fj9EODm2oBnzm/c7N/bbD2wGJwNgdjQmC38wq88PY9R0jQNTToZ+ZdA6IPuypya/I3xOul2+k2PkJGxXp+rD6chIyjykMZUomtz6uNd/Hc79U3I5GCTAFi4eOUk3rRp2CMouJTRGX9KEv4rMXsO8aEGJa05Qav+R5dXXIlcnPYqeiEki0qxF9/9vZGgWTpBdLKmIrxMCxkD6/pWRJMRqV3lzdrXdZ5c7T2mBehP32+XRRwmxu8OEmeCrdxvyByOL9BqGt+OjHjIhjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2pm/lAfroyKcUkX5Rgggs3XnYxOHFrQWrbiunnOFUs=;
 b=k+7tTXej9yIaQlF/m1BrxfR9trFIvWs7CtlPIjOLIco3Fld4xVArqz2TLtCGxd0uWV2OceyIXerXTrJ8NewUQVEfknUdygWrJZX+inG03S4C75yL+rX6Y+BD9K7R1M+v2bSo4NBEjQdg1YF7kbkBhTfJWuQWniMeu8upGbnTHLGH7581rSsXAAjrGZs8jmAGZK9nGxKvENX02k7U7b9H5owTYslm+d0WT8j4PuuUT/04rleMiQ1o+UE2d9EG1qnxgcCdQ7rfpM+lPrOejCIg2kh9/hhsxQEFGZtUnwcMubatNtgXcHXzi/L0tS3MHF25OyUB2ZSUcWJ3EKwqTE91vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2pm/lAfroyKcUkX5Rgggs3XnYxOHFrQWrbiunnOFUs=;
 b=nt29APNKauaxGaISYPhe/oIfmB0bxMsG1TDgbYuDvAsP0tNKh3ETbZ5Ni0FqIByU7CIw2M6E7mTEXRPTqLen4gLy5Cn59Jq4TSrxARUDYyl35CyiibHiOZtk7eXFURDtUIGBBVideCpm+vnSdAcD8swCYuQshs9WPhEkGgYQpow=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3051.namprd11.prod.outlook.com (2603:10b6:5:61::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 20:33:39 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 20:33:39 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <Conor.Dooley@microchip.com>,
	<niklas.cassel@wdc.com>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <zong.li@sifive.com>, <kernel@esmil.dk>,
	<hahnjo@hahnjo.de>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Brice.Goglin@inria.fr>
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Topic: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Index: AQHYkKIdHc6oV2H//EKJV+LfcdW+Dq1wN82AgAAD8QA=
Date: Tue, 5 Jul 2022 20:33:39 +0000
Message-ID: <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
In-Reply-To: <20220705201931.nfwi5rlku7ykmydr@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8aef5462-c34d-4ec9-ec1b-08da5ec5a4b2
x-ms-traffictypediagnostic: DM6PR11MB3051:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3bVJIroV/sB1knJPVFpCp3gDajoveSJsnnhvF85OKpzP4zCN3mc1n+MIKApoGikzsAVUvt18fb56n5atjG+d4S8m2s82raN6qJ2d+GSX3oq0XZHc30kxc0xw5guYEl+nyYj2VwWRS6Gw/Hhixo9kjb1yBYBYvhW02sDroKPDsxz1BNOtWi0NdknxBNOIB/drlHM67q461uZlfZNT/xYQyiGArWQQClB60xhSenWMnh7b6qITqUPmbv75l3iF6fRxJCNe2zcJphNh09Q3aUIPm/J6BefHEC6UgckGFaEofrqvp2Itiad6SN8iMf267zZIGuKfyZTvDLth3nt4E9POOcMf/jRqkZ49Sl5XCylEe0139ywaOKOKNFQFMSCg96fzB9m7MSHNA8z+KVanGLqSLDsWx4X1syACJhlhN2z/yjuRjzuqKr77WKb31IdFjwEAJ3+RO7DiJSQM7LE7DX0q26A79xpnlF7K2hlgo8KE1HDxs9j3KDU5oeKnWYYcNiTM5h1YDxWOurbQPYf+IYZPCI71ElLwKfQ1EAlaWgD0hHPBFNr6LFtKzL+chxEci3CdsWvJhbqjwaRy1eqqVD8+Azj8NVWJ7S8qbZZ8UzfGc86qJM82//9NI8klOCNF6YH8M+ynnpNkAt7EHz2USKzR8/w/2X07Njj7gdWSq8PU/ziQh5RLweWtgtMOv52BXnMbs8WeM6BPCLTxJW+ImzCatSqfpim8bzM0IJgd6A6NZP3rBOCKAqJf6L94NaJduHSVvoUq+BCDzg9oi2auOxFuhQZTk9iik+Ufe5NdCi1rlfGhzR/qPczeDscnxr/GEjdytKC0o726YnGPDaM+nwOI7et/YxN19wuRwGETAlGgafyQnnYZ7cM1ppKZIa90m92o
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(39860400002)(366004)(376002)(6486002)(38100700002)(2616005)(66946007)(4326008)(66476007)(64756008)(66446008)(91956017)(316002)(38070700005)(8676002)(122000001)(478600001)(66556008)(71200400001)(76116006)(54906003)(6512007)(53546011)(6916009)(26005)(86362001)(83380400001)(186003)(41300700001)(2906002)(6506007)(7416002)(5660300002)(36756003)(31686004)(8936002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXBhZ25ISzhKS0lOMVcyYWpDWGppV2pIU0dtNTA0N21RMVFZQm9JeDQ3bktq?=
 =?utf-8?B?UWhWaTdFd3AwVkRaV1hWR21xNnBuN0pDSGFSZUd1d0tRNG1QTWE3NmlDYitl?=
 =?utf-8?B?WEg1eHIrY2traEZMY2pJMkovSkZpZWRSRmhRWUdLbC9tM1NZcG5KNTdXTDYw?=
 =?utf-8?B?Yitqdko5UXQyaHdWeEJBQUhEMng2RCtDMzdiOFhXRHlETjd0VDJTbUhxOTg4?=
 =?utf-8?B?ampycUQvQjZmeXNJbEFweWdWNzlGY1JsZXBUYmh2OSszRUVocHkyc2U5MjVu?=
 =?utf-8?B?NUo4VEk3Q0wrdzkrVlI1bFg0SDVScXZKcmNYTHVnbTlSOFQ3UGQ3MG1qNmR6?=
 =?utf-8?B?TUV1R0NXMVBGdzh5Z3lEVUQ2a1NJQTZ6ZC9Ha2RQUGw1VUh5MkpVYm9QSFlB?=
 =?utf-8?B?V0xWUHErSjdhVkxUalEzSXJGaSs0ZjUwTFhqWVl0TG9zbWtOeVlPTEhBVE85?=
 =?utf-8?B?bVdVd0VSNERIVU9td0FYUDN4bnRzUXNSN1Fqc2VwUk0rNGsvR3hqNmZLeWxK?=
 =?utf-8?B?eVdEUDFhZG43YU1uQjZ2M3VXaHRIQWZUNi9kRUpzY1pTVWpNeWVRWW80YnNW?=
 =?utf-8?B?T0dYRGVVc0FFSGgzMWZZc1NUZm5wRlkyNVBCeGdiUlZsL2J2M2pZWW1lM09Z?=
 =?utf-8?B?SEQyTVRtQVdhVGhhOFBZZlJrTXlkdzY5RVNWelVITFlFZkZVWGQyMlgvcGs5?=
 =?utf-8?B?SHRFeHVtem4xM3VoM3ppM1RhbWp1Y1EyVHZmaE1PeHVOdU9NUnZMazNDaS9Y?=
 =?utf-8?B?NEpaeG9GRHp5ZThDV1h0TmFxMFJSK2UvRFpSL3IwOFloNFJ3K0M5enFMcko3?=
 =?utf-8?B?WldMek4wLzBRSXFqTi9sMURVVnN0MjkyZlRPZXVxOU9UYUFXYkIvUHBDWnFh?=
 =?utf-8?B?RlpiWFVidEpQbDZabzlndHA3cXNCVzc4cWcrdUdncWhVT0ZlTWJUSDVwbEQy?=
 =?utf-8?B?bFdPV0J2US9WNUxIQUZZYTA0RmJlcHdqRTg2LzVDa2hoSE91UHFxdnd4UWVU?=
 =?utf-8?B?Yzl6LzhtWUFQTWZGOEMzNVNGandqYnBKQTk3V09acllsa1BuTDJ5a01ralc0?=
 =?utf-8?B?bmdYWm82RnhuTUZVS3RWNGZ3ZkVGYXVBT25BNytLWElnbkZFSzhHQmNZZHBk?=
 =?utf-8?B?a3Z3eFVMMHBvalJlWklRbkhObUcrU3ZEYmFLMUZrT0hQRXR0ejArMi9JYlVC?=
 =?utf-8?B?NGVtVGVuVEhGR2QvS28wY2JMRlJNYktac0IzeThDTnhIeEJtaVUycUNwYkIw?=
 =?utf-8?B?cElDTWZUeGE0MG02ckdCS2RzVk5Fako0TkNkUnIwZ1RJZFkwdkowcTh6ODdl?=
 =?utf-8?B?aHdXUnhPaHlxNUFnOHoybm1ndTFsdG1DUGdlZTZpWXZxSFBYVnVOVzN5SDdZ?=
 =?utf-8?B?Z2NZSjM5clJzMHhjaUhFbTVpdGFqdjNpYjl0L1VwOU1qZnA5S3gwRERlUzBw?=
 =?utf-8?B?ZUlOK3REcXZ2bVBmOXNBRGtOYVovald1NmpJRE9VdWR3MlVmYm1CVGZKT2dO?=
 =?utf-8?B?VmhRU0lSVFFvRG1RdTFCbVE5SE15R1VWNytXSCt6STl2cTJsaWlXNXFyeWVO?=
 =?utf-8?B?NUpaWnd5QmFKVDVDcE51eXlya0xVOU9aN2w5aTk2SCsxOHI3R3k2QVZXWlRt?=
 =?utf-8?B?MUxNcVZURytta1ZGeGpMWE4wWTM2bU5BM3NHQThaQkJoVVFldFlZZExPRnNt?=
 =?utf-8?B?N2FkenBpL3k4dlY5OXhPeUVNcUdwQlUvcjVjOHFGdUoydjNxUGdZamJhNExS?=
 =?utf-8?B?NTVpeHA0K0tuMSswQWtIWXNKcXdXMEVnRFpJYVdCTHpTWHFwQlVtQ2lzWFZq?=
 =?utf-8?B?Tm4vN1kwbGh0QTNpOFExMS95eURvMzJTLzkvMkdidDBIUWkrZjhBRnFubUsw?=
 =?utf-8?B?VTRRM2M0U3pGVHIzVW1xL0xFVkdCbTdqL2RoaHNpejBIbU83dktldVRvWjc0?=
 =?utf-8?B?Y2F6c1RHdnpUOFFxSm05TkFMa21nenNLVlF2ME8wZUZqQXRBT3ordGEzZ0xn?=
 =?utf-8?B?bXF5N0tSV0hwSndTY0dKbUdzQ0gyUFZxUlBKODAxVUpFTHJYd0dVMEpLaXNr?=
 =?utf-8?B?UE9sVTNGL1cyc1UvUExTTWtqUUNjYWwyL0M2d1RkdHFDaG52NzZMZHRkbUlo?=
 =?utf-8?B?Smo2dXNSNWtJUU5WY2xwUGFWTXNBTlhqd1BlbXBka0drVFhTTy9SaU03czRS?=
 =?utf-8?B?M1E9PQ==?=
Content-ID: <F2F373F34B86604F9F403DFB3F33C4E5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aef5462-c34d-4ec9-ec1b-08da5ec5a4b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 20:33:39.0791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /tKTSSqIEacVpY4g/85Oh8/ucizH0/F0tXYYnrevqUvBJ5jaxImmXs5zGxpndO+/HRhzHLjMaXhItkli43JbVcS/CWqQT1I2Y9jip2EgarE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_213353_471612_738AA25C 
X-CRM114-Status: GOOD (  18.43  )
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



On 05/07/2022 21:19, Sudeep Holla wrote:
> On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> It was reported to me that the Hive Unmatched incorrectly reports
>> its topology to hwloc, but the StarFive VisionFive did in [0] &
>> a subsequent off-list email from Brice (the hwloc maintainer).
>> This turned out not to be entirely true, the /downstream/ version
>> of the VisionFive does work correctly but not upstream, as the
>> downstream devicetree has a cpu-map node that was added recently.
>>
>> This series adds a cpu-map node to all upstream devicetrees, which
>> I have tested on mpfs & fu540. The first patch is lifted directly
>> from the downstream StarFive devicetree.
>>
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> I would recommend to have sane defaults in core risc-v code in case of
> absence of /cpu-map node as it is optional. The reason I mentioned is that
> Conor mentioned how the default values in absence of the node looked quite
> wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
> default values if arch_topology fails to set based on DT/ACPI.
> 

Yeah the defaults are all -1. I'll add some sane defaults for a v2.
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
