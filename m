Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrrZTZfkUo9qGEjuYqzBIUjyN7CBlHKezoXOOLEX+fs=; b=nc1rbw/NPKTJwQ
	m8QPzDaJI2JgPil6sTpbF++edJe6KNNgPNskqBW21qUyWxRcnr6ZsEvPIuCpxYLlojsVQTgSVNWJL
	i1KLBFLI88l5vBoCH3Rg2NuMChrLZfsfknCWQpKCvPORPfijQvM/JlpUNT3Xkmy/HQamkZgMv+Su7
	tiKrz3yAJ45WQ6OgoSkgXcKB35d8z/rJnFoFGgPXiT1tKOCxx1hAJJ4xWgDUmbMXq4s9fkERIw6jj
	sIz8zLlYC4vi8/e1DqMmGXwNDwQrPNZRY/fNutX29F2VyCGv2j5YNGPI3F6jtGUJfyMaHaW2MoFAo
	4FfFe1H9EOj3Ax8U+Aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJ4I-009bq4-3e; Fri, 15 Apr 2022 10:20:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJ4E-009bk1-3K
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 10:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650018042; x=1681554042;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Pru2Ncb9GCbEKS4NmHgVYew4FSHFslhcbVROREIqYIs=;
 b=giRzG00b19y66mdT/dQIzestpLnPQNFskmSD+Rz58X93s9PPJWeVoxry
 bSpcEFiEIK5hnQur7xqX2y5VPgmTTmDreUf19YfWhcBOeT8e4RNBXxBw+
 d4Y8dKKuId5vCa4kTyfXD7bsKF/IiuINKnwdpvZN1ecQfMm9z9OGWiczS
 12Up7vlzfZHlJZfsjJjZJsas02slDT2HK3ii7uYB2GX3wFoxU9afGGHpW
 rb+l9iBJQfY7VrQrSLL4onO+CpKrpEsYm+VbEJG4poUJbm4gFQSuabGNe
 Wa1YlaKeSRVaeqiusQFGAKuQwD7S17W/yiavXDI6fZs52IJMCpsHg3PC/ Q==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="92484488"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 03:20:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 03:20:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 15 Apr 2022 03:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QteAX2mN3cfBYzcoHM/eHLQ7+eJYWjQCC/nlVyrlaGaE1jzVf0uWF+KTSgdkcF3jaK4hzv80G9pxRhspUwsoP9krmzjkXkVd4yDnoNsH/X0WGGe3E89JJtBUeA4t00LWrl15ksM79VbwbCFNgGtJme/wbZ0GhXAGYNYEt6btX/evL8FgGKlANU9iapWJSjnChNJb6eVB8iFFXnXps33i8h6OS6YLkEVU3X4SeMH5haFy5lUB2sc8XwiwP889LEgKKuduojCjsWDCyc5IP477as/c3DeZA0Vm/arejay+r+UkP3a+efBq/HlIjR1+jQEPIRKZfYAjXUP+EGUqPA4tUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pru2Ncb9GCbEKS4NmHgVYew4FSHFslhcbVROREIqYIs=;
 b=Z6FD9wxY6frgMPRqLX5dOuy1FaIaEaZMB9PcSWpyFgjPH+GWb3CQWFgl+j93cbk9LUxte/PO/CRhunjJwdi1SdFb/A37AIrqD6iJGUo0MCodIUny37fSJssI7RJfXVY9RXT7eU+lofsQkm/xInYvyZXa4hMo55Br9WJhpMKx343HYQh0wYbCZXyuG+mo7pVxtYiv4TjpYE8LqFiYp3E0e7GF5RFzViQ1c3OvGNHJXY7uDv8KnzZtTKwmYO+1bidzyQiiTiiAKTXQQ9IcqcHk5arqq+khFi4PTTDR3I+HpISwTCRly3ZQvnqoy71eWHtu8pCV2TwrTImJA9lnUbI7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pru2Ncb9GCbEKS4NmHgVYew4FSHFslhcbVROREIqYIs=;
 b=neTTgcegla1MLxFQas6BsaRCf75Uz0hdVqZjbcYDh7GMjMIZXMHgrA+tmonGwJh+ik6nQOhn7BPzb/AE/Iv4DiflgGXfov1zhVK+8KEmTYzYxwGn7gFZDcJV2VnV7Tt6ngeJqsbYtWl/hPm1I1botXM9slZFarvXAk0zsFmY09M=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SN6PR11MB3422.namprd11.prod.outlook.com (2603:10b6:805:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 10:20:33 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 10:20:33 +0000
From: <Conor.Dooley@microchip.com>
To: <herbert@gondor.apana.org.au>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: hwrng: mpfs - Enable COMPILE_TEST
Thread-Topic: hwrng: mpfs - Enable COMPILE_TEST
Thread-Index: AQHYUKQdOKs793R880+LzEocloZDpazwwvmAgAAAhAA=
Date: Fri, 15 Apr 2022 10:20:33 +0000
Message-ID: <d304baf7-7c7a-8e8f-10a2-b6c6144a2fd8@microchip.com>
References: <20220408100911.1638478-1-conor.dooley@microchip.com>
 <20220408100911.1638478-2-conor.dooley@microchip.com>
 <Ylku27J41IMmMe7x@gondor.apana.org.au>
 <cf6b0236-32d7-09c3-db00-702a2a92bf71@microchip.com>
In-Reply-To: <cf6b0236-32d7-09c3-db00-702a2a92bf71@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32368fd7-40b0-4c44-4bfc-08da1ec99339
x-ms-traffictypediagnostic: SN6PR11MB3422:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3422C8B7AF71A35E13F864DD98EE9@SN6PR11MB3422.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LYf9MZTujyFsh8iL/KNmgjMetk4ew0U1atB4fYuAxVOnkWv+lT0fZ+oWqidtqF5OH1YEJRaS1XqrrqVePaUqfC7N4uME1AZPGftJWXkxEykawuHE0Z6T8C5cD3Iji+r+2Kc6ZwMvs6+iQLtnhMeCMQhrosDIOpDbJhDxcylt0xsCSc6fc8TItEww8PxVsO2DLUlvXL/Yg7gg+E1QFYbsoBCl7my0GCiWTWOKSp/ayuvEf4he+EHwtbAx/rIEfTLL5wh+vzuQFhlJ2wAm8Fc4mKL9KnVI34pKTTzMgFoSoAglaT92GwT14PznvQ/m2YdgeCJNIVeG560DWZ/cnIalPTO4yfL4VS6gmGKs5gIxyf8rbn5up2QVYSb0jwAcp2V+II4mXiOcFHdB8a2GRFG9WKDO71ZC/Bta1qRjxbMFU/GfbA4lroXIIxEi66DWhG5YIuRz06HqEBt+j+sbGz107KTkyGq2eE8+KqRskMSqHbutejvfjKX5E4/Ma0pURFrgUhc6XMLA4DK7hfiaTiT838C17eHp4pRV9tpm0ncG0Xwrw85B1Pn8KJv61FJ0bSA+kkGIqU0717yrk76Wazu16tYAeSdqd7yuunjC1VeagV6BjoTLJeca+ahCzreLT1Vy4ua+AZcsO+4AeYQgLv9Q2P19zcp4Ju7BcMy/+U6aswbljMlf28i1kDMbG/59yFwde6hCqQouxgapCKOKHDFLGJ6cUFHU54n+ZnapyO6/PpzZ4ioSpK9YZLJzKzt5nK4q/eeTaUTFQ3a0lQ0z02uoCmp9u4HMpAx/98jeC5flpdP4taJZ7DpeFN2NJfhSLaWcuniNTjps3EfRG15T2TGaaM9zRQ4tmZkx1sZnN4v8U3b6dz2bYrAWYs+c8I4GTrH4rxPPFcBDdzzyWjjNyx/8gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(53546011)(66476007)(64756008)(66446008)(6512007)(6486002)(6506007)(966005)(508600001)(26005)(31686004)(36756003)(186003)(38100700002)(71200400001)(38070700005)(66946007)(2906002)(8676002)(4326008)(5660300002)(76116006)(31696002)(54906003)(86362001)(316002)(8936002)(91956017)(6916009)(122000001)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnR1S200MzA1bHlESnV6b3daMEZrcmJCcVo3aFZEMmpaU1liZk8wT1RNV0lv?=
 =?utf-8?B?cHdjTDh5MzRVSlVBTEVsS0JHaHZCQ3h3MlF0WS9yWXM3dEJlNmZVRnFoV3F0?=
 =?utf-8?B?MkM3MEZaTDBEZFZnT0orUEh5MWY3SzU5cDk1TzA1cW5BR1VkZXpFNUpmb3RX?=
 =?utf-8?B?WVArd3NwRlhoTWhtazBkSStZN3lERWN6bndmQWJ0ME9VbUI0NXkxbGxrQlNV?=
 =?utf-8?B?R0puQ3d1QUlzRHYycVVyYmdmM3lnWnVUdVlZbkI3QnNlaWRUZ1g0SE5NcnJ5?=
 =?utf-8?B?aWpiQzVpdk9KbXl3dkJEQ083dG53TGViRUN5aFBsTy8zNDFmYnhtaVh6RFFa?=
 =?utf-8?B?dmpqdEsxN0pOQnNwekdxSkxLMVREL1kwUUlUMExlZ2d0dmhsVTllM1NyUFZm?=
 =?utf-8?B?WDMrUk9peEN0aFhMcGU5VzQ4bExFZkREU0dEdkNPMjZZRFJuRHFtRjJaT3Vx?=
 =?utf-8?B?MFJqQ2RSM3RGMXI1WHR2ZDMrWTg5VHczYW16dDMrMUlpaHBmaEtQUnBwMU52?=
 =?utf-8?B?OEdteCtPOG5jWVVOTk9HbHh5ejN2WnJTS0RybFl3VlZ1cm9abWh4Z1prQVl6?=
 =?utf-8?B?WjVLdjIwdG1WUkx0VTdVZEQ3ZDhlTEswNElJS2pydjJVSFBQQTZLVFk3bGFz?=
 =?utf-8?B?V1BRVXFCdGlnbC9mZ2hwNW50U3FaaUNuRlVjSVRXa2xVakxudjl6OERyY0Fl?=
 =?utf-8?B?MGVjNUNNLzNxaXNiNm8rTytNckNycGtpaFpDTCsxZUpFbVdTbzNhdTczUmxz?=
 =?utf-8?B?ajNCVHJCZWFRRnNyVnNLa1ZUOEJaYkJFWU43Y0lmckt3cU4wb3Uwek1FaGVH?=
 =?utf-8?B?WVlGbWpBb3JVS2cyMnB5WXhoNTM1Qzh2QWczS0lDRmVjZHFRSVpsc2tCa1hC?=
 =?utf-8?B?T2Q3RXdBbUthQmdKekNOa3FaNXdJZWRyUG1SRU5tVW5vb3pMOVJaRDRFRWNW?=
 =?utf-8?B?bjdWRzc0d05BWWo2TE1ieGhZYk1WajU2c0ovL2JjRWNOR0pLOEduRnd0T3RQ?=
 =?utf-8?B?bkxma2dLdEVCV1IrZUVqTnhVZDdTVUtUK2VPZUFNVXhzYW1HNEVGYkhDTno3?=
 =?utf-8?B?S1Z4dmhNSS9NeWZKOHZpNzNDam5QSkttWm9pcUNJUXlCZnBNTE9HcEk3R0Rz?=
 =?utf-8?B?SU15ZkJ6YmNld1NqdU5FeXFSOGJKMm00UE4xWUtjYk1ESEo5VG1kdGJSTGNK?=
 =?utf-8?B?bnZXbWtFMjYrMVVuYjhPQ2lJcDQyMDVZUU1WSlFYamtnTGwvU2hCWk5vWUlx?=
 =?utf-8?B?amVnd2JocVB3SS9oZzYzMXdhdU1SZ0NYRTF6cnNVanRPTGIyM3VscExKOGNv?=
 =?utf-8?B?OHVKOE5LajRHa2h5ODcycWNMTE1MaU5CcFBMbkU2NGx1RkYxaUZQTC94M2Vr?=
 =?utf-8?B?M25KNXZEeEREY0lUYlIwK0Vad0hhWmdtVWg2Tk9NbTFGWlBXeVVZRWthb0Zk?=
 =?utf-8?B?U2FLWGFnajN5U0graTEzNUp5b0JLTXN5ZmIrQ0hZeThEWGllSzdYVnN2QzZZ?=
 =?utf-8?B?NXBqZTJ6TDd4VUZJdFFTZ1gvZ2E5Tkk3blRSZUVxTTdDSll0Q2ZhTE9EUU1a?=
 =?utf-8?B?OWxSb0UwV3RFMEJoQnFnN1ZyRU9ndThZU3RhVmpGN3RzZzh3S05Zelprd3VS?=
 =?utf-8?B?ckcxTUlvK2RTOUJyWlhWSU94L0thLy9TbjdCVTFDTlNyY2FxT1NjZVYxakJR?=
 =?utf-8?B?RmVieDFSRlJtRjBhNmQ5T2NER0JnMlFiaGFMaTdwMTljT1hBZDVWY25SUS9n?=
 =?utf-8?B?cTV1WHE1ZDM4SXgyR05mUmRoVFRYM0U1eWtzcFlUR1BvbEZwWTc1cTc1SHgx?=
 =?utf-8?B?VWtzZW8zUmprY0xCMk1yaUF5Ynh4QWJBbHdSWktUUWtaeDk0L1BwSUNoRzJp?=
 =?utf-8?B?MzBGMGM2UDVSUHNINEU2b1poL00zVnBxeGgzaGp0cWhBRnk4NTlvVWkxRDdM?=
 =?utf-8?B?MzFEdGdjS0t3Sm9obFMxVkIrZm9hQ0NJWnlmeEl5MFNvZWp5SXQyTSswNmNi?=
 =?utf-8?B?RHRvQ01lYXlidTRIanZQQ09lZmJGczNKZGlWbUJOc3RzcGV5Q0tvdHBoeHhx?=
 =?utf-8?B?LzllcStEWHFLZFdjblhKQ1V0ZVlaNFZxR3RCQXlpQjY1SW43UTVnUVVoOGZx?=
 =?utf-8?B?RGpST3JYdXZCVVlyTGlHZG1UQ0R0ekNVU2lKbTRPVkpRckxWdEtrZllQY3M5?=
 =?utf-8?B?Vm9XdVQrVHErbGNsWlZLSThpUndkZVIrWkdqSENqYVlJdm9kUWEvOXN1SEQ0?=
 =?utf-8?B?Q3RxKzY4bFYvSnRmWmVuYmUwVzV4MHFjcjBQWGZ3SmJMZGl4aURFb2taa0xM?=
 =?utf-8?B?bWZReFVRMVhFSE90WXNITEd2WnRkcVlpdVVFTGVSbEYxVkZGY2RCZz09?=
Content-ID: <E0B148CBDAB15F4B8A16F5314E8B1896@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32368fd7-40b0-4c44-4bfc-08da1ec99339
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 10:20:33.2987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJHT8mtqx6UnHaqvfDbNl2RH3wv2CEszGgU+LGlRv5jtcD7Ul1yhtu90CxSmBlx1VzACsy7HUhv/GrcBPIE4oGGI7rdoHyNA4J3mKb0MRLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_032042_260922_3B3A412E 
X-CRM114-Status: GOOD (  14.11  )
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

On 15/04/2022 10:18, Conor.Dooley@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 15/04/2022 08:37, Herbert Xu wrote:
>> The dependency on HW_RANDOM is redundant so this patch removes it.
>> As this driver seems to cross-compile just fine we could also enable
>> COMPILE_TEST.
> 
> Sorry about that. Compile test makes sense to me too.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com
woops, missing a >.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Thanks for applying my patch :)
> Conor
> 
>>
>> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>>
>> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
>> index 18aa97974b8b..dad084c0ecee 100644
>> --- a/drivers/char/hw_random/Kconfig
>> +++ b/drivers/char/hw_random/Kconfig
>> @@ -387,7 +387,7 @@ config HW_RANDOM_PIC32
>>
>>    config HW_RANDOM_POLARFIRE_SOC
>>        tristate "Microchip PolarFire SoC Random Number Generator support"
>> -     depends on HW_RANDOM && POLARFIRE_SOC_SYS_CTRL
>> +     depends on POLARFIRE_SOC_SYS_CTRL || COMPILE_TEST
>>        help
>>          This driver provides kernel-side support for the Random Number
>>          Generator hardware found on PolarFire SoC (MPFS).
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
