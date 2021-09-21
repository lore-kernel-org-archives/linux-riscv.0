Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E286BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 10:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B39AD60F6D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 10:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B39AD60F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW38+SrtHKrddlKLBLP5Ar5dDSMTRiDZFcEpc5+J/gw=; b=FBUu7xm+Xnkml9
	61WIS7JdvEASJv5Nv/12Rk0ueCGF6Isxp2ckjUfqnD8/6blBM+gFCkvLbiPNpQlznuycg2dx/McWk
	7plQxjp9TABt9eh5CQVMhyjRhbPYmGVqKbbDERO0595fWrQsBvnGj1kKkaIXZoarooHr+/NFL56Q9
	4T9L2+6xv6onpBrgtNMW9/LSaCKnGENOS1BDXP32sZ32Efhgj5LcW9CD3hGJSxx9RNSXDJ7XyEZ2/
	BewltnzAbf/3eF2RT7iY0DpS+0PItF31IjT45/DXdPOu+8kbeOaMvE3tgBJ6LDUM/VsPADfTtdr/a
	sauS6suA5em0Jyw6UwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mScmY-004EqW-Op; Tue, 21 Sep 2021 10:13:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mScec-004ALQ-Tl
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 10:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1632218734; x=1663754734;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=MHtIQu5ARkIuxurd1Etbo6+zjrTtcCwrKQl7eXgFkCU=;
 b=oIYgd5j6y0kJYUxujPBrHOnZAhlTOORQxFQNwHSKx5TZYbFdWZXh2B8C
 Azanjms6dQ8/3pJBlDKKnVrgeF7+HhqkGf9e/UHPNrZkophHgxqj2K6st
 UuV7mjWMaqKZVEJQhjkDZkg8B5I9o0f19CU9reCpXyOPlOxFlkl7skNHv
 RATXYhF6z/RPi8sZngB3K0125Ud02SrmR+bfRiyy8eRFu9waAsCraM4Yz
 B+Lw/KA9ITisTk7AxZwJys3utpJ4rJsPS3uMLURXqvOPyoWYBlqylcoka
 6CWip0OJPDQ2dliHkkRbN5mGk17tCgs9aH8x2lWdd89TZsvWesoq+KLdc Q==;
IronPort-SDR: n+Mv+AX2wBoujDv0Q+/avb8grPugCG6V0Scl7eySYJUaAQauNvNsNk0WnJDkH5htL6UN9854L4
 qlDePNe9ZxpBDfL9N54/86DieZzJRfgkJc/zeFhxp7NP1YS7BQNT1ie7vFme3kEzzueMnfSsf1
 9FoTMAyeKe6kL4dQRfS3wMda7okwJxDGUIVqbHwhiB5G9XAw/lz+lvyqTE39QWWE+l1KQt5oo8
 NdPtLxUt860FvopWCI548wtZLQU2zKWRqn6g2mR8o5p3vZsJXFREK7Inl7el5Dm2bvZIT0hJhe
 siBcrxdP3VacpB1BOC2PV/hM
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; d="scan'208";a="144954812"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Sep 2021 03:05:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 21 Sep 2021 03:05:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 21 Sep 2021 03:05:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khdMxG1xbG7rdERdrmFAvHaukK17Jf/QZEYg0mVTizedtOoIcwMmMml5ymuqNg8B7BUwHWryOV13uzs3fA6TN1K/Apo+wOHXWa3Fq5oSNSO0g8TGKhSEJGQSt9BLK+SDWzd/MYDoFBKF/YiTELu+dOr5Fxkt6RzW+UspR4T3knS9JmnBqhm2UBh4rXJptC0UOAnvXxyr1eeUX+vjhWk/SEMGWN5nNDCE1y8lC6hA9IlOH0qfEwT92yyV01DGPHEtfyLMtxLCDkRtqGim/MqrGGzIxS098JCbz5CDCbPvAKMPojBAW4Y7ERDyFItJsHecwwsxdzVkGDOJQSq4ac3HUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MHtIQu5ARkIuxurd1Etbo6+zjrTtcCwrKQl7eXgFkCU=;
 b=kEDCoVe5ovkeDSPBBJhsQeHhraYP+YnHTSIeZ+cNGgl9wVFCKDic6hgb6Y6DlGhWZld3SGi+6PAcEwgs/5NHtUY/klaFdH/EJM2al8zMVZ8O1ieGO1Fr5XF6NepBG23l8yO7YxzMZVJr1736xJcMWFwCO3o8hVCynjATzy0330qPNJoY8YgavBlzA+DhgOaRyDFS4JTAqcjr5EOk1Dp11NH67a1OYqM2jng2Hcaqpsvm4UumepX+ImLut1DPARmoyIxBSLlvLlBTrwD1AXaP8hWmBef3/3IVw1FE43eLPJgELhuAwo2MEGBHRErqESNsbvePwxebU2Eyz1WZ57/ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHtIQu5ARkIuxurd1Etbo6+zjrTtcCwrKQl7eXgFkCU=;
 b=LzelMsjBSFqG+8PVPnyGkRA5FgHSBjIHqLqzORKkRzMvpoyFeUD5Qt8jq6yV/g12T6FHqmqB2yWMhu6u1ZKryYo+ler22SXhM6qacxH5YWHGgUw6VKBYsmsrRag0bqecxOLV31atx+2tqNZYGoKfc5UemtCr3Eup74hbyDOAEac=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:05:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::c02e:ee5e:8da8:b99e]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::c02e:ee5e:8da8:b99e%7]) with mapi id 15.20.4523.019; Tue, 21 Sep 2021
 10:05:30 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <ulf.hansson@linaro.org>,
 <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
 <yamada.masahiro@socionext.com>, <piotrs@cadence.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 3/6] riscv: dts: microchip: fix board compatible
Thread-Topic: [PATCH v3 3/6] riscv: dts: microchip: fix board compatible
Thread-Index: AQHXrjGBE+j4P7jIgEKKZtGhx9XcE6uuRAaA
Date: Tue, 21 Sep 2021 10:05:29 +0000
Message-ID: <6091f8ac-1482-ee5b-b5a4-3917ab8b7fba@microchip.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
 <20210920150807.164673-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920150807.164673-3-krzysztof.kozlowski@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21d02ddf-e615-4227-aa4e-08d97ce757bd
x-ms-traffictypediagnostic: MW3PR11MB4521:
x-microsoft-antispam-prvs: <MW3PR11MB4521B29A926A19EB7D81E17F98A19@MW3PR11MB4521.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XurNaMj9RC6nNbe4T5pfp+cbrPesog70VEmhlarrkHkkJYFbUBrGNvqQqy5hG07iPw+JTayygkYPeYFu89X66MkwTr/McFqDknW0TUB/3QXNWL+FIgMjnls2ymskTsFCX4bIZYeTKHj2HCOxgV8WXFl9tYMePPGWuGeUEVptkYVmIsj4Q3tq3XKexdlL5+Lx7jnwii9hA7Z2YTogYy89dPQy6kvEPgvHEzgvsBz39PDlMGQIszabnPcbmCQnmaxSwfylYuZ9Y6boGP3IfVO/k7Sh7OjftT5x/jIfnIw19AObbXGb+J3xGfrRIAIOOYSWLBvFZUdNAYfshKRAUYpNtdbxmVD4q9t6Fui5CUCX9fzNVWcr2mAINcXNLQD3uu06PCRMtRjwYo10VcVCgMyXD7B/VmHtMU4QgPdksnlI/RYXXv5ZFlorOKO/R4Cli1wy/AeYa9wnLi5MHiX4G7p/5W+VKVHlJT4+cYUyadKoCDzPBSQ88TMySceGfAVwuColKeZtuVk0gyJb6EVe4EEAcZRLIuCDUNLDUjgO+usW4ZaGYMUn6lbz0Ku3fj1PhjrCmdBz8dy4t+PsKDU6IvvZI8Mhgy/7o8iHu5N6dRL/91HCfY0YijCgsA2Ef8CmTKudP3Y+i9GY9KaSL+3165tcVvHKQCvKDD55qjBhB1NdASeDk4QKoRZwMJPJcsBlht1p0gHsUDdWPcH+7oYPpu4ble89zer4WaPaPC6DlgaVOnVtC33NrPfO5PQh6sIVq6JOojW3c9lmM80do9/C3rau7zfQKDIufj85kQaZ0AfokNs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66446008)(5660300002)(6486002)(508600001)(38100700002)(122000001)(36756003)(8936002)(31686004)(66946007)(66476007)(2616005)(186003)(921005)(110136005)(38070700005)(86362001)(6512007)(316002)(53546011)(91956017)(71200400001)(76116006)(26005)(83380400001)(7416002)(6506007)(64756008)(2906002)(31696002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEZ5c24rRWYxb2dTdFdMYUU4RnpGL09EUktBOEQvMkpVTGJ3UHBnS2F4ei9W?=
 =?utf-8?B?ajBUUEVFVk1EQ04xKzJWWTVPV3hoalJ2VDJaK2ZTSWpzeFpMbStNZm45OTJn?=
 =?utf-8?B?U0YyWngxL2JZbzNsV29SdzFnNFdlN0VJNTMyVnVka2lCQ2lVMkpjSlF4ZXQx?=
 =?utf-8?B?YXRObXJtNkNrZ0ZpUCszRGZ6bEk3WllORDh6d25NcWxsV0R2ejQ2Sm45YlJi?=
 =?utf-8?B?a2pDRzROd2RHcjNVWUd5VG15T29vN3h1QzJzRjA5TDk1eGRSL0hpYUxXUW9H?=
 =?utf-8?B?Y2hhTHkzQ0Y1YWlpa2RndGhZUGJLMjNPb3hEOWpiN0J5TlN2OUU1ZjlIR01a?=
 =?utf-8?B?NXFhZHkxUVZRcG1FaDE0YTZJZkgrNmU2b1lYdXVvTFJ4UU94akd5QmU3a05m?=
 =?utf-8?B?dUkvdUxnMVQ3Y0d3UzFuRVBjNEtkTDFhUFhKOU1MUGU4OHZXS2JSSVBsc2Z3?=
 =?utf-8?B?cVUrcm5iVDhVU2Z3OS8wTkV4ZjYxQjhVMmZTdnR6aGtWbDZwU1dMcU9pN28z?=
 =?utf-8?B?TFlpMXE5dWhiRkRtSnJEVjk1elArM3ZXb1pabWowTDIrc2pYaHlxMlFTN3NY?=
 =?utf-8?B?b1ZzR0o3bkdFU0s2U3NyU1o0c1B6QVY5VGZSRVJ4eGJEeGpDVzAwOUU4WStZ?=
 =?utf-8?B?M1o1UE1takFZc0JxdnpDM1ZTMGlwa01rNEFJcWdYNURQUkllY0hFKzlXZm5B?=
 =?utf-8?B?N1JsMkszUkZVV2l4VUdLQ1U0Z2dGTXpjODRUeU5SZTlraFZHaXJyUzU5VlpZ?=
 =?utf-8?B?d2JITUlCY3IrMllKcVEreWkvc2R6UGhDWklsSHZwOFpKdytOeE1TalBoODNt?=
 =?utf-8?B?elJKOXhTcEk2RXY0dEY0R2xzRyswTHhpL29hTWQ2WjRZZVgveFB0bVRFdWJq?=
 =?utf-8?B?L1hBRVJaKzE3dnB2dVEweEN4Sy9VNGZUcFlZSitmMVI3eGxzRGt2OVJFZkFy?=
 =?utf-8?B?cEVmS0xrUUlXNVduUFNuZkZmMnlIcVI5U1NmT0xYMGFVNkJqaWRCMERkek9t?=
 =?utf-8?B?em9scG10aVAvNFYvWWZMN3Q2endIcE1DRWVZZWdxbDVqb3lZenVLUjNhWUNP?=
 =?utf-8?B?RFE2eVZzb280SjJ6NUxTYWF5V2U1TlRYWUt2dmllcFVHdjNuUlJDVEV4d2N1?=
 =?utf-8?B?ZVBYUU1Nd2xsZmdKSUwyT05ocC9XS3dIa1ZvTHRLc01yS3lvMnVPR2kvVHVp?=
 =?utf-8?B?Yk12UmMxZDJQMi8zZGNVcnI3aHRJK3NqOHdCUkZwSExDNHh1TTNJeE1tQlJB?=
 =?utf-8?B?MHFiWVc2KzRRaHFWQ0VLY2o5NTFOWU5qZjNXQVFtR2ovaGcwUXYxOVBUZlgz?=
 =?utf-8?B?VDZZVEc4VVBpQ0g5YTNlbndHcjczVjR5ZVhIakViV1l6c05yeEs2M3M0NUN4?=
 =?utf-8?B?RStuTFN6QkhPaFYrcXlCcWpHVW1kZ0hwZGZOcG9MZStPQldyMnJUYTU0eC9Y?=
 =?utf-8?B?VDUxZlV3UU1lcjYzM0lvZXJiMTF1cmU1ZUJNVnloVnhqYUFIUndiQ0RLMjJ5?=
 =?utf-8?B?T1RNVjRLQXBCNXlDNndORnRFR004Unc5UVl1YVJrUzRFUGFKbXhFdnMyUXdm?=
 =?utf-8?B?aHRVamgxK2N3MytCRDRSK0FORTMyUWhHbVgvMkhTTk9xUVdGOFlINGZ1aHpK?=
 =?utf-8?B?cm8rNDZxc1c5QmJaYTJjcStpU296ZnkrbzBQUUFETFRWZnd6eTdRVThmYXFX?=
 =?utf-8?B?ditRcUVwTXdpeURrVkhVNWtvRDFsRE5LVTBERDFhc045TW9idHoyN2IrMUx2?=
 =?utf-8?Q?DnJKR/yohk1BNCkZTU=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <B2B1282FF43CD749B8BF0436BD5AE255@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d02ddf-e615-4227-aa4e-08d97ce757bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 10:05:29.8912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZT++ontP/LXuHneZMUlVrqzSrJDIfHYOF90+WgcVgIvlKt+dIGFum624dtNZhhiI4ZsI6h96WYCw7ZdbQqnhVSa9b0lXxImN/4ErwXRfxto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_030535_087065_66C6C643 
X-CRM114-Status: GOOD (  16.44  )
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

On 20/09/2021 16:08, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> According to bindings, the compatible must include microchip,mpfs.  This
> fixes dtbs_check warning:
>
>    arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v1:
> 1. Use microchip,mpfs for microchip-mpfs.dtsi, suggested by Geert.
> ---
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 +-
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index 3b04ef17e8da..07f1f3cab686 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -10,7 +10,7 @@
>
>   / {
>          model = "Microchip PolarFire-SoC Icicle Kit";
> -       compatible = "microchip,mpfs-icicle-kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>
>          aliases {
>                  ethernet0 = &emac1;
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 93730afe6c58..5084b93188f0 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -7,7 +7,7 @@ / {
>          #address-cells = <2>;
>          #size-cells = <2>;
>          model = "Microchip MPFS Icicle Kit";
> -       compatible = "microchip,mpfs-icicle-kit";
> +       compatible = "microchip,mpfs";
>
>          chosen {
>          };
> --
> 2.30.2
>
Reviewed-by: Conor Dooley<conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
