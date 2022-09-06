Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDACC38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjLIZOqiCc91u6gqqQxKImLLgTqJnKT6DxwTIMLpyyA=; b=hSsevSSqcmn5MN
	NcZDe3N8X5wbzirUa6Ge3F5sJ6nmjZaXGCgA0UqKZ1f7BT0pK9KHLRY27pWkmcbq+bff5YFTRfRD7
	OhYMLA4FJqj7UH6aJuW3n0t77r2D12TMYamfDZ4iFDl4LFt5ODoXiRDHqlTaCWKJIQT3LJjVDsvKk
	r429Ore/c9CiAeBZG+9muHTIJkRq5g/ZomjTGuCFosyewwjpevjxWIAcOOq0TG1dRvhC9LMfPvmdW
	KWWP7TldA3pX744QcsiQztcSYrphhSp/EV2zjN5mg5tnH1pkUwnIEReFvMjxxS2OoyDRZYHxpt9ye
	eC4rYeg7yQ7nCP4FyAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVURi-00BZg7-9t; Tue, 06 Sep 2022 09:00:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVURa-00BZZN-JP; Tue, 06 Sep 2022 09:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662454830; x=1693990830;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qAyleHoXwWHrgr+ZHJrCMlom7gcdOdYBla6JWqX2TlA=;
  b=tSLZw/aINDJE6wtf9my37+rUQ5lg1ZEf697xewy2y5xbtd/UbjbDIZlk
   lyo+MEyd0BD8/rdlaDLz4VD06yNaEdVYtLBE4JLQNAv1rkvUSPQDTDypY
   Sou/rD+LDrzJiCiH3y/DGodMGSRpfrkOxO+QdHrnRZdfOIabqegexzXXJ
   vXrUP+x6Ayj9blosij5W8yGbkpuVJXQEBZQDvD9OrGiZ5kDXSJ9SdeVka
   HEdUS9Zu/OoP2yc3Lhq46yws0o7h5v36kUzGuLkKaFov/VQfXpHNJENSk
   ud9xcZ4iL1oxGNW2Dc71C0nt09rt8JMdGsoSHQkkb1Mp3gZeipeTivQdE
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="179306321"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 02:00:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 02:00:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 02:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJpC42S8oQYS0YnOZQ6a5PbQx4SlSyu0+Q3H4QgU9xT2fRe7+mh5xOEMIgv0dVS8RBvxrus0/ysHJG2pw2qba56YhJ6Y8UXi5Pfi8YHR9NyqM7AcRMPHN5oIuzpxlpMnw6D2WDREdyihJYp633jSrkYBga9sgPOl5h40n5m8HUiKFjEFXPhT49rfK1cepzFDHQNzeq8x/jnlp+iUiY8dRHFofVL/Y6Y7Q6gaA6XOjkps3Vvv8E+uWw6skXPHCm8qmGYlC1XVgNBBZ5U+XYZ81pN894Zu18e7Jf1rDKxoF52fIEYe/iJxgBQbUyGiY/y7fRPJKIdFofhAsNLcgc41hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAyleHoXwWHrgr+ZHJrCMlom7gcdOdYBla6JWqX2TlA=;
 b=QQlhkd2lCbn/++7O4mu00go/SkTU4J4Ogq3kGMZm9PiXpgYaFzbPMNtV5WL9X5vrovqOyiOmcT/kQJE9fok7pO2Pb9LHGUPUzfHAYtDGFkYjycgtQcdrTkUpwkiCTbmXLIRNM9kJQAcCnuteMaWP3sAQNYKNUhPs0BC+N/l4gXam016yQHjep9WfQOjKtlkKZ7z3m6gkq1Zo664A3NAHW7p69XyCFImAAjLeggI4hFGcvpfDW7uaTssa8fid/NlJ16i1XcGmPiKdPd8dPqpNMeAhmroLinvDhINQtSsTMpocszmqLOMBfuU73k9srRpDx94JGuhCVVApYTd12Eg8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAyleHoXwWHrgr+ZHJrCMlom7gcdOdYBla6JWqX2TlA=;
 b=qX30RuXuuhR0T5liNSP1J8eusy8YdhrrHhO/8LbE6v1dmfhna35DWs74er4P3WFr28cj6pSo9Ha+QFba/sU9i7GuS5EU2LTQcerUCkYO/M4ASiA+0TtX7vgWdzXpKy/6tqX2ysSLW0pY65HNqDPHfKZUlehnAOraeojpdR/FLA8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3270.namprd11.prod.outlook.com (2603:10b6:a03:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 09:00:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 09:00:20 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>
CC: <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <heiko@sntech.de>, <anup@brainfault.org>,
	<atishp@atishpatra.org>
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Thread-Topic: [PATCH 1/3] RISC-V: Output cbom-block-size
Thread-Index: AQHYwcvExmNBI2asc02J8FECeoGTKq3SFO6AgAAEUoCAAAFCgA==
Date: Tue, 6 Sep 2022 09:00:20 +0000
Message-ID: <b24c9045-d0f7-f88a-a34a-ab13b8b1167a@microchip.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
 <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
 <20220906085533.orfbu5gyeur5xj6i@kamzik>
In-Reply-To: <20220906085533.orfbu5gyeur5xj6i@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05399949-a82f-4ff9-3ec0-08da8fe63a23
x-ms-traffictypediagnostic: BYAPR11MB3270:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWeOg1VGuSV6A1b4zyAl5dMDegZC4NamrAkVAC5UbN58+Ms4YMb5ECFkhk0BJ2pSo1eQPh6n7P3Y0vwidtVfWvmuIvYT5U9waqrVnGY8/ywcy7PhjuP0thBOysMT8V1uYASXIqVR32SagKGty7PsvUvw8Q0gX5p7pfKwM4pQPktOCYlJUMn2zCnqR5ziuaU0Qip3TRwrLshI+0YSf4NvQn4kUEAm1KbYSrJPHiQ/Ur5BnY8sQ6Cd4R29GWCKxBlZgRoVwLLtO6hF36fP8U4tcjyq94j1SnqTWJtJdQvHpSY2oSxeLzBgp8dQ+pbY6dARfgNGYwNagSUZBvPHD3XK16GLkEmJ8sC128yd4r5MtP76WKu9+JZFxJXmzJmKmHXMeXkk3o2n0Db6c891ZD8fZr4ns7r1iQU5Em79q1mpT6JbVfJCjtTGIQ2QYWgqKDNrO7tOk461lFlR0gyUFascVjeT+oV/AxHWyMpxS1a28YaB7ibiPJRHhIh64vjuL1CG4GugB4jHndwUQzn9z5D9/x10rwMwFfLdmTZTDOqIrvreJlQPaJjqiy5YqP0DjpjftmrYGL87+9fysTznhlmjPl2STn7mS3E3ykhROLLwUwWHmcPgfTQeXZfizYIn6jkNl0jDJgfVl4iEx0YyyTFEp0tKjKgJJ/0RX4seatWF3BANDTmiKnpgX73CaAbQXyHv9VfNBw9pg3OytChauywJM/aD64UP3wTMeC0uZiBYa6IwEsddwOYYBA9tmp/GW3BlfEmzeGa+x+r/N6oOiMh6RMTZTKJLk+4RUtlPNTppKHZ2+7JMbjzuLGpjc9ShBjm0mFDFkV9pk7ewR6Vipq2zNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(376002)(396003)(136003)(366004)(64756008)(91956017)(6512007)(38100700002)(26005)(41300700001)(6506007)(478600001)(53546011)(122000001)(6486002)(2616005)(186003)(31696002)(38070700005)(86362001)(66476007)(8936002)(71200400001)(83380400001)(5660300002)(36756003)(31686004)(8676002)(54906003)(66556008)(6916009)(2906002)(66446008)(316002)(76116006)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTBzV0xDWEVVSGdvNWU1eVJ1SWVMd0NwQmVjcFRwN1lvZWJDUVI3THErdVdX?=
 =?utf-8?B?MVZsU01lMFl3YUlVUGFDSCtsOXhtVVFGbml3MGg3K3hqYTFGWkt1OWtMR2U4?=
 =?utf-8?B?UURLYzJ0OEZacHhESExYcnRDYzc4UXJOVms4T2x6VEV2OWoyR0VmMEpWMlUr?=
 =?utf-8?B?K25zV1RPYnhrUmk3T1phNlBoZUh0UXdxZGVRdnNHUy85Y3hOUjk0b0x4Zncr?=
 =?utf-8?B?S1VsRDZ1VWMrd2tkNnZTTzdLcTVJaUllMmdYRVBjTFFIOTJtdzVVZndWb2lv?=
 =?utf-8?B?ZzdHQ3dXQ2dDN0doaEVLc0RNanQ3Y2d0NHZuMjFyUnJZdFpuQWRuajlDK3JT?=
 =?utf-8?B?UmE1Q2VkS1M0Z2JQa2hxSFhHNHFXMmRsSGFTNlRJRUxrVVowMEpyaDBpcFZl?=
 =?utf-8?B?aEdydlh2T3EzbWRGQ25QQnA5dmU0UDlSY210L0dpSXRIVERkUndVT00zaUR1?=
 =?utf-8?B?N1ZXSzl0MklxZnJ0NWpZenZLRkN5UmVrSFhFK2JldzJ5WUc3amljek40OGpZ?=
 =?utf-8?B?WVh6OHh0ZklnQVJsSExGblNkZkMraHFrQjZ2UEl4TlJDbm5tbEUrSmp1NlIr?=
 =?utf-8?B?bEJTak9vc1ZNbnV3NGFBQmZzUDFMekR6dXdwd0dveFJDT0RkMUZ1MFVyeE5M?=
 =?utf-8?B?M2NKNFlYOFhjUTB6ZkNJOW5EOXFJWlBRelFUMWpHekZyQmVqd1ZTVk41M3p2?=
 =?utf-8?B?SGxWS1NvT3ZTUWl2cGNwWTM0NTBkZjRQc09tekpqcXkxSWJHSy9UUEZ2VDNp?=
 =?utf-8?B?b1dMQ1l6STBsZEMwNitLRjRTeEd2Y2cyR1diamJwdE1NaTlLRERnUGo3NlZ5?=
 =?utf-8?B?cFRxSC9xMEU4ZjlMUDJmaDdrTWg1VVB5M0tvVUUveWEyZlVjby9veXk0amJo?=
 =?utf-8?B?cndNU0Z2azdhVndBcUlWT2RHQ3R4bERzTGMyYXhYU2M1TGhYZ21YMmd5NFpL?=
 =?utf-8?B?RDJyNXhqKzI3Q3dFVEx5a2JJcFk3eGZCeXIwY0FyMllZQWUwV2pCZFFzazBj?=
 =?utf-8?B?L1NHbzVRVUFJRHFONXRKYVBHR3BJSHpFVzZLUEFBSVE3NWxEcFRQa2FIdVN1?=
 =?utf-8?B?MElmUU1EamhJM2pObnJZN0ZoRmd3SHpGdE1UamFFKzdaOGhGQlVLUU1jTnM2?=
 =?utf-8?B?RXlwV0swN3hJc2RQdmZFT3FkNDN2R2JzYW0xSmhJbFA5RjE3ZDF6WStEVUpU?=
 =?utf-8?B?THgyV2h4eTM3cm5PS1pSZ2ZEWWdsOG03TUpMdUZ3clpOeENUM2tZSkZMaWZk?=
 =?utf-8?B?T0FpVTVpeUMwWS8xYXhLYjNHTmFWS2kvRVJzYVpIQ2U1QXN6S1Uvdmt6cmFY?=
 =?utf-8?B?b0QyRDdqZVMxNldEUldlc3dsZyszK0FBTlhHRFREMzBIR1FPRDJDbkZuRWh6?=
 =?utf-8?B?MG9nNnFnL3BLSnpHcFRXemRZYnJwRHZlNEpNd2h1OHRGK0xFczhBTXBUa2F5?=
 =?utf-8?B?VktEdFcrT1V0bFdQbU12NXlIYnFRQWxHR1dzWUlNOEg1Q3g2R09OcFdTdU1C?=
 =?utf-8?B?Y0llZlFiaWhET3pjb0JZSkRZMnJMa3FSV2RZZy9pbE80c3dxRzE0eEtaRjA5?=
 =?utf-8?B?dVl1RnBUVk1sanhKSHFCTG04WUdXczRNdHZ5VitIeGJEeDNCMVlQOXkvTXN3?=
 =?utf-8?B?dzFzNnljOWVKZTV5RHVUeU9NMnpXV0NGbm16akZnSDBXS3pHdnBOODVTVVlU?=
 =?utf-8?B?ejJCbGZyWU1hRnFrMVkybzJTN2xhTHFSYVA1M0ZrT0NaZjNtVFhmcUN5VUdH?=
 =?utf-8?B?VWJqaEdKV2tNelV5OXRIT1N3TmQzU09qcWQ4Skk2aWRDcU9kOCt6cFhPTzRY?=
 =?utf-8?B?Y2E3MWFJQmJoMlFTUlNLZlJ6cG8rOCsxeEtaeVpwa2wxRWo3ZGt2TmhXdFVz?=
 =?utf-8?B?S0lCNFhjb05yZ2EyMFpFWENmZHRhZFIwZURreUNvQ1Rwb0NRaEpIdnJvc0Jv?=
 =?utf-8?B?eklHWHhrM3BKWFJpK0xEQ1ZvTzZKQ0JRVTZPOENZT1ZWczdUaVd1SktGYmxR?=
 =?utf-8?B?NFd0RHhXcnVqN2lGVkhRbG04K01FV25xQWxoNFI3RVU5b0tiOWJNNk5Md1d6?=
 =?utf-8?B?SGZXTEFhaWVsdTkyaGZMeTZzaDByL3NjZGd4OWZTZXFGWHFvR2piQ3NEd2Ns?=
 =?utf-8?Q?8DFVbdW7qkh56JCfvQNAazJW4?=
Content-ID: <1A0D31BE6C372A4BA31DD69C22AD6B5D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05399949-a82f-4ff9-3ec0-08da8fe63a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 09:00:20.6360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRxSl/wGRgB1Xw0SpNrWd8L9A50O3uA1SHFtKRjqoEai3eHLjzKyycYoY3hX0v5uPM5Ek9RWHcMEnjeFfiCn0dmANg3VNXwaWxd3Qt2I/6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_020030_715991_A52E77CE 
X-CRM114-Status: GOOD (  26.10  )
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

On 06/09/2022 09:55, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.com wrote:
>> On 06/09/2022 09:35, Andrew Jones wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Provide an info message with the block size when the Zicbom extension is
>>> present and the block size has been determined.
>>
>> Why might someone care about this?
> 
> I was unaware of anywhere else besides hardware descriptions where this is
> published. And, while dmesg isn't really publishing it in a way that is
> useful to anything other than human readers either, it at least makes it
> easy for a user to check it for sanity purposes (which is what I used it
> for) or even for applying it if they want to write something that needs it
> and the OS provides U-mode access to CMO.
> 
> I'm not married to the idea, though, so if people would rather have less
> logs than this information, then I'm fine with dropping the patch.

I don't really care either way about logging it, if it helps people to
be able to see it perhaps there's a better location than dmesg -
would {debug,sys}fs be overkill?

I was just more interested in the motivation behind the change itself.
Maybe some of the above in the commit message wuld be nice?

> 
> Thanks,
> drew
> 
>>
>>>
>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>    arch/riscv/mm/cacheflush.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
>>> index e5b087be1577..8595baf8e403 100644
>>> --- a/arch/riscv/mm/cacheflush.c
>>> +++ b/arch/riscv/mm/cacheflush.c
>>> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
>>>                   }
>>>           }
>>>
>>> -       if (probed_block_size)
>>> +       if (probed_block_size) {
>>>                   riscv_cbom_block_size = probed_block_size;
>>> +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
>>> +       }
>>>    }
>>>    #endif
>>> --
>>> 2.37.2
>>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
