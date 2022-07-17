Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4E4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66vaj+Tt97ctyF+FLuDLXlQc2cBGJkMVsUeQGAWYvp0=; b=RIvPeBEgAyEYA4
	MoFDHM1sYW60ckaR3F6x/Zn114QcEE1Sx4gpEvDfdKn7t67XMtg5fS2c8VtRByNcuVhvbrQ9nEx1y
	zvqqU90GiCRywMNlTtWhyxrCInEVWK01Q2RuL4H3Ga52lFWNLKjGnF+gtlq9j3KEVVu8vrEMUu084
	h6ePirqoDewk94W9ZnXU9PNpdY979B09jM+LMCM4tPCXBCH1tn5dbxC1/smP+br7P/sAnUhx0BRSD
	ov8bwoK7axlOT0nfkxiy+LqqSH7OZxViJPBVnmgproS6gTRiDo85BUlwYJ6hN0gZDB5vH5c+JP9BD
	8vyssV8QJOfE6JztsaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD6U5-007drx-SE; Sun, 17 Jul 2022 15:47:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD6U1-007dpv-Fm
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 15:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658072821; x=1689608821;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P+rz1JuhmU23sxx67dkitcEIB+Uub/rxWcBwxRn2iu0=;
  b=EnFDQFLlIskNwlw5IPwBLKXxRKs7tzEYF9U0hClF2XqYl+PJL2HROz8G
   eXlipDk2lNcGHvT2Gz0RnQCFB9cdlv5DRQJ2+bjuSTDWZzc8iMc5rUkyX
   zfESqGslwf+Q5V4oUPz/tFQI7H1jQ24tjaze4diVvVNS6xQlsC/Oqxnft
   wxPZT1ZAy99xpYPGUMQjSy80KxPIXbHvywpl5+SgeB3XsniM/+cM97l0a
   poMQHUPRP0Q5Svdb5JgbP5DkJHyaP3LhWa0yaVnSS6u0gx8jX2YHV9VD+
   YdcAMKkhf7bjxXeXbB5h2IA309AtYhQP57iSO1ugSei1o1Knho5keJpZG
   A==;
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="182532157"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2022 08:46:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 17 Jul 2022 08:46:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 17 Jul 2022 08:46:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SddeibbZeEJ0B4Q1Jrv7JldwmDa8KmP29toVdRzh6myA8R7af4LJkLTWy0UGCI9jItGC6JX9Cqv4BMuW6otoWINibs7m1N18DHLc59/knN9ThuB0ngDQC5H80gFFVqGenHNrKad5bI01iRQyNH9wiaROkgv/eGB+2ErxXacCNx6DA8peV8ozUigPYQBChlmwi6uVzyx/mf64Wce+jsL2IaG/zXFh1eBojH8qj42RF5NgvTg8EJojuzNO5sfbSHp4jt/EdKatw4/VzRqzkU/VBcC/u9hg8vyyqI77U8f+095V+L2EjJ4X1zO/u14Oox7QkpsB+2q38eVEGlKZcpehVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+rz1JuhmU23sxx67dkitcEIB+Uub/rxWcBwxRn2iu0=;
 b=gg1KlorE3gXIhbLS5jbkWw1CEkj30JRtKlS6NEnGFe0KXtM+PU7mjBExqHzl3IoD5o9nBkza0YAnl7oYnK5LYA9i3VfMY+EEUL0C4RNNf0WlPkrJxuPpMG5Bd1Om+EAFGU+Bi/gwyP05evSMnu/tRbTECbEfcJG1V3LwaP9ExXx8ZoNcDZs3pQdktm1kXLshAh3MvX5i9UJg6bQ3IhtKZTX5okWLuXlCMiYeKk1O4GJsF8POIIcmXSfP/KiZa70CG9gAs69goZRPtZeaxXYymAlnB7LAQ3wyjn7bSDO1zCwTuug0k2LNrk9fRNwVqeidHIO8l0VD74WCkccQ+/62ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+rz1JuhmU23sxx67dkitcEIB+Uub/rxWcBwxRn2iu0=;
 b=OGgeQWDEdEKh7ENqRXUJbRMvbkW9A3H7V6FfG8sBkysikQWIEyErCh6wvb2ESJrXCsql/mcR9xgroIpk77LZb/J+f/dn0+iYECMEAVpP984xD/APeXXmMcjB6kmKrGcxKJ8XAYSlmpEQOhSgfC7eVpQrR5DetdKzXy+Q9SZE7tU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Sun, 17 Jul
 2022 15:46:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Sun, 17 Jul 2022
 15:46:41 +0000
From: <Conor.Dooley@microchip.com>
To: <maz@kernel.org>, <Conor.Dooley@microchip.com>
CC: <Lewis.Hanly@microchip.com>, <linux-riscv@lists.infradead.org>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYmONENpwHvjgotEKXOSINBvKPca2AzRoAgABQpwCAACn4gIAAC0QAgAFZ34CAAAougA==
Date: Sun, 17 Jul 2022 15:46:41 +0000
Message-ID: <528e8935-4929-863a-ef5e-5b49d1d8aeba@microchip.com>
References: <20220716071113.1646887-1-lewis.hanly@microchip.com>
 <20220716071113.1646887-2-lewis.hanly@microchip.com>
 <87r12l4aaj.wl-maz@kernel.org>
 <2d7f72d3e89686d3ba5cff5df8cfe443d04fc5f4.camel@microchip.com>
 <87o7xp3pz2.wl-maz@kernel.org>
 <a50d0f6e-0b35-4090-2ba6-9de680d23aa2@microchip.com>
 <87v8rvzsfc.wl-maz@kernel.org>
In-Reply-To: <87v8rvzsfc.wl-maz@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21b96548-63f4-4ac0-1bc1-08da680b8b5c
x-ms-traffictypediagnostic: SJ0PR11MB6573:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3iH3yvDhS+lBgNZhWComvfJMuDzUvwbllspE47CUCX6u0b+619q7IRoK/yK3/bLQcZ6GtrUC8t0WWq0ognxCLnoI5LrrVPvYXcyD5oRzXWbneJTVBqQ7Omh0kDtlEz+aM6nGgULSJc0lTw3NC0o5YiG23z9q/Q+9b8lajXjsFQAnpnhHrpVOBASfzDvL8HFFytnJFDFtCrDiq15pWplgngXpdJPyY5SJ7AVccsYsC6P2O+WzX6iANHyvCPwQf9OiJF+JHe8qyzZoyCml1ba3ov4Hci8jM0tIsCE/iwbc4bTJyuYCl41o0xREwb+AHueCPribYRCwBJ0dox5eWQifVj4ZjfTKeEInV2AA5nWjTaq8/cwd0J4TBOfqkKrQd1wn69UJm8e/cD+J6FW7dtejHv5G+qHJFIKRnu33TMd/+fCEhqWOjbmsa/2BVLHLjq479EMQL13jm+u8rSfvHgD+rTS9QJJ99z4pKAT50GnHO0Z2EcSCCHxjJyArRO5LANFPDKye3fAtt0wC/zqoJpzmaD2+DKg9ysWTy+GgwQ+j91o8QDyXSoVzdwmp5Knpu2zs0aopJ2yHuOJIzIiHQHh67qRQFYWoo3XW+cLiBrYK8HEP4J4JTHHi9801UfiiGMT6Oz8Qkff6ps0DJtZ09rj7n5YC2UXYpWDII8yuHRo94OlDt+gygl0Fu6351zS7LcgnxuhkueW1uAlNBWKKlmtQy592kbs/Iq9qxcR8W/POWTJF7PVe/r/sziVHd4qnixeHGP85xBirJGrDXobbX0MPIvZ9dWulhRnWr9AZGomLQko2mwGLbzp1VfGV9CPPJ4PKmAHb4/3Ysg+7Ywexjpo6fs4o1NOmyyAF59A7JC/pCrmzJLwc0U86OWnkGYtAC/tySL4CN4KugBMSXzpj73M+f+gAi0xT1cdpwOy3sh/yFFa32jrCySvbhZriO45+VXk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39850400004)(366004)(396003)(346002)(2906002)(91956017)(53546011)(66556008)(41300700001)(64756008)(8676002)(71200400001)(38100700002)(4326008)(66946007)(38070700005)(6512007)(6506007)(122000001)(6486002)(110136005)(107886003)(316002)(76116006)(36756003)(66446008)(966005)(31696002)(31686004)(8936002)(478600001)(186003)(26005)(66476007)(2616005)(83380400001)(5660300002)(54906003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVNraEJOK1h2NlBjRlNXVW1OdDRJaEIrSW41cURXOTgydG1WdTI5UW1Scksr?=
 =?utf-8?B?U0hCL1A5U3dadWZsSkMxdXczVlZ5MUJZd3k0OGx6b3hVL0Z5ZExrVjhaRFpw?=
 =?utf-8?B?c3NQOGhnN0oyMURTWlNLL2dHbi9QZHR1YzdBWkU0SGRWUGhIb3lHd3ovd0dt?=
 =?utf-8?B?QmhUbHlYL3pXcjZvcE45SEVMcVM1d1lOOSs0T0pPYkhMZEw2MGdMaGNHU20x?=
 =?utf-8?B?dm5iSU5XNGdDTWFTZGhuamd2T1NpTnR5UE0xUHBDWERlMnB5Y0hEeTFkNE5q?=
 =?utf-8?B?NjgwSytoV0oxUTdvSCs5UHpGTGZKcyt2Rkd5UVhHL3l3RGp1U0syMGZLV3NR?=
 =?utf-8?B?VVJnYVptazEzSmhWTWlIUjc3TkV6UzJpWTRyQjI1YmxzbWpxRGhFMlcxMGh6?=
 =?utf-8?B?bVpMaWlsTHJ3V09jTEZWc1htUFJyeGtPRUNkbThMNEhDcnNPWHJhdWNJZmJv?=
 =?utf-8?B?QTdKS1pxYU9STFU2WG94cWNOZ1RPenBiYldQbXFibDFmVlJGVlNaaVdYb2l2?=
 =?utf-8?B?Y1VmajA1aHFBSEcyalE5U2FHWUQzY1BnNnFYdUpmUHJzL1d3cEhNSlN5KzYy?=
 =?utf-8?B?Sk5RRGwwMG82V3VTbzkraEtocTVBV1BJVlNaalRuS2lRNFVUZEtSc1VQSFFF?=
 =?utf-8?B?V3R4cWQ3Q1E1QWJxeTdTTmRLZndPY2hOV1NJWitiWTJjcjR3TUpoQUxjVWhx?=
 =?utf-8?B?WFFEOWpNbUREOGJrRVNTVmQzY0pkYmVHTmdWdzZrK3o3N21MbW9PUEFTUitV?=
 =?utf-8?B?N0ZyRWE2aWZ6RlZpb1p2U1pPY0VrMXlpRGJzUmplZ0xteTUxY0tnVzZTQTJp?=
 =?utf-8?B?RU1pN0VPN0JtQk5aQ2lsMUdsQy9abWtRQXorcUhnKzZHcTAwUGR5L3VtVTk3?=
 =?utf-8?B?SWhySVlYMHRjNUNmMWRXRDcveGU2dVV3SnFkMnp0aEYrWE5YWnc0QXpUT0FQ?=
 =?utf-8?B?MmJ2RURIUVNwb0VpaU1GYXdQQ1FQRHJtWWpVaENIYzRHcXZneE5hdlkvYXVU?=
 =?utf-8?B?S0VrakVqcE9NdC84ZGErZ1p2eFV2MW1iS0svdGQ0WW9jMlQzNUJZTmJpQ2N6?=
 =?utf-8?B?SHNHT0pTQzFzeElpQTBvMVdWV1o4ODh5MmJYbnNCRFNWOWJ2YnVDdFc2VVg1?=
 =?utf-8?B?V0hwa0hxQjFPanQ3ZVIzdmJXcnlwNmpTWmF4MUNxWlVsSGlTOXQ4UXgycDhl?=
 =?utf-8?B?YWt5M2hRN0VveU1hTzFSa1NockdPK08xWTFnbWQzOG1pa3h4dFIweFBuRlRU?=
 =?utf-8?B?S1BxQmRLSlh2NVBCNTJ0OHUzRHphR0g5eTA2d0FNSGZBVWFXd1JmelRNU0c4?=
 =?utf-8?B?K0ZuZ0x6LzB6WnBvYytPWEh3U29ndmNiNEFQeUhjVWk2VFpCVDBSa2tVZXZv?=
 =?utf-8?B?dGNiZjdWcW1zdEc1Ny9rU0VCOTZCdWlRbzBvQmZQOVZjWU04MVpmNTB5Nlps?=
 =?utf-8?B?WFJYb0d5UVJ1UVlsU0h3aHNGWDRsUlpPMUVCSWRGWm5sbkxFRVFFdVNJZ1lZ?=
 =?utf-8?B?NEd6R0RJZEs5dkxzd2grSkVlWC9MUjQvTk9JTm5PQTlsNEZIREVldzc2WTVX?=
 =?utf-8?B?bHZ6OGJqN3ByakdySWVBOHdjbzdSc3lkYkJNV1RoU1I4WjdtNEFXc1Y2UkRa?=
 =?utf-8?B?RlplMWxIVlZpV0lrVWZHb0tVVzlHMURHVkx0QkY1dEFNWk0vU2tkZWo4UHlx?=
 =?utf-8?B?ekNCbTZjd3pIQUtqdW5XUlpiaEt2NEU4MHRSZVQyNEhLNzBMTHFiQXV4VGxm?=
 =?utf-8?B?T21HUWNla3FkVVVkbE80ZGZiZWdYb1JBZjFDV2Y2aUFmZS9rdm5tUmdMOVA5?=
 =?utf-8?B?VFBETTR6UGNpU3REOTdiVWgva0dZNE5neDUySzBPSkJaVkh6aXh4TXh4aysr?=
 =?utf-8?B?TGM2Z0ZoL3JkMlBtM0FtQzJOS3A2QjlFY0lDUDlZaThITWd5a0pZUGZDaFhJ?=
 =?utf-8?B?aDRsTUNXU1hvRFk2WmFLaTlkUWNiQ2Fxb0VaazFBd2N1d0FHRUJwSFNrbUtx?=
 =?utf-8?B?cE9qL2VhbWtTY1B3djU0a09HU2t5RUoybmtRQ2lLdHFBNk1WcGJXZkFzZXFt?=
 =?utf-8?B?L0RDTHI3dVBsbHpuSlBjQ1E1S1A3SUJ5d25QaDdvSGRrQU9oOExiYjAxYnRT?=
 =?utf-8?Q?Qepp3wyxn1SOrx+ZWSbgkU6ce?=
Content-ID: <A1855194603AD94DB67EEA4AAB64BAFA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b96548-63f4-4ac0-1bc1-08da680b8b5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2022 15:46:41.8032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hb16HYAGeIA6AD3lFi/UfHyayGc9jPjLhPi/9cHUqeNp0DBWH1ccU5Ik4VHHbukrwGEXhbggekKFbZfeJ+IlaM+wxtRBL90umN36bX6/BWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_084701_562286_05EC7E2C 
X-CRM114-Status: GOOD (  19.43  )
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

On 17/07/2022 16:10, Marc Zyngier wrote:
> On Sat, 16 Jul 2022 19:32:20 +0100,
> <Conor.Dooley@microchip.com> wrote:
>>
>> On 16/07/2022 18:52, Marc Zyngier wrote:
>>> On Sat, 16 Jul 2022 16:21:48 +0100,
>>> <Lewis.Hanly@microchip.com> wrote:
>>>>
>>>> Thanks Marc,
>>>>
>>>> On Sat, 2022-07-16 at 11:33 +0100, Marc Zyngier wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>> know the content is safe
>>>>>
>>>>> On Sat, 16 Jul 2022 08:11:13 +0100,
>>>>> <lewis.hanly@microchip.com> wrote:
>>>>>> From: Lewis Hanly <lewis.hanly@microchip.com>
>>>>>>
>>>>>> Add a driver to support the Polarfire SoC gpio controller.
>>>>>>
>>>>>> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
>>>>>
>>>>> [...]
>>>>>
>>>>>> +static int mpfs_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>>>>>> +                                        unsigned int child,
>>>>>> +                                        unsigned int child_type,
>>>>>> +                                        unsigned int *parent,
>>>>>> +                                        unsigned int *parent_type)
>>>>>> +{
>>>>>> +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
>>>>>> +     struct irq_data *d = irq_get_irq_data(mpfs_gpio-
>>>>>>> irq_number[child]);
>>>>>
>>>>> This looks totally wrong. It means that you have already instantiated
>>>>> part of the hierarchy, and it is likely that you will get multiple
>>>>> hierarchy sharing some levels, which isn't intended.
>>>>
>>>> Some background why I use the above.
>>>> We need to support both direct and non-direct IRQ connections to the
>>>> PLIC. 
>>>> In direct mode the GPIO IRQ's are connected directly to the PLIC and
>>>> certainly no need for the above. GPIO's can also be configured in non-
>>>> direct, which means they use a shared IRQ, hence the above.
>>>
>>> That's unfortunately not acceptable. You need to distinguish which one
>>> is which, and separate them. Your non-direct mode certainly requires
>>> special handling, and is not fit for a hierarchical mode.
>>
>> Unfortunately, the configuration is not fixed on the silicon level. The
>> SoC has 3 GPIOs (with 32 lines each). The interrupt configuration looks
> 
> Let's start with a bit of terminology so that we can understand each
> other:
> - GPIO: a single piece of wire
> - GPIO block: a set of wires with a common programming interface
> 
> As I understand it, you have 3 GPIO blocks, each with 32 GPIOs, for a
> total of 96 external lines. Correct?

Correct.

> 
>> something like the below:
>> GPIO#             width    IRQ#
>> ==================================
>> gpio0/2           14       [26:13]
>> gpio1/2           24       [50:27]
>> gpio0_non_direct  1         51
>> gpio1_non_direct  1         52
>> gpio2_non_direct  1         53
>>
>> Depending on what the bootloader/firmware does, these can be configured
>> differently (done prior to linux starting). By default, 14 GPIOs from
>> GPIO0 are fed into their own interrupt lines & ditto for 24 from GPIO1.
>> The remaining GPIO0 & GPIO1 lines go into the corresponding non-direct
>> interrupt. If they bootloader/firmware configures something different,
>> a "direct" interrupt line can be switched to a GPIO2 line instead.
> 
> What does non-direct mean? Multiplexing inputs into a single output?

non-direct being "not directly connected to the PLIC", so yes. The
interrupts without a direct connection are muxed into a per GPIO block
interrupt.

> Can you individually mask/unmask the input lines that are in this mode
> (the kernel calls this a "chained irqchip")?

Each GPIO line has an interrupt enable bit in it's config register.

> 
> How does this switch between direct and non-direct happen? Do you have
> some sort of external pad to GPIO line routing? It would really help
> if you could point people at an actual specification for these blocks
> rather than paraphrasing things.

GPIO is discussed on page 85 of the TRM:
https://www.microsemi.com/document-portal/doc_download/1245725-polarfire-soc-fpga-mss-technical-reference-manual

The register map is here:
https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/SupportingCollateral/V1_4_Register_Map.zip

PFSOC_MSS_TOP_SYSREG/GPIO_INTERRUPT_FAB_CR is the register that can
switch a line between direct/non-direct mode.

GPIO_*_LO are as you might expect are the GPIO block registers


> 
>>
>> Something like the following (the interrupts are offset by 13 here, as
>> the global interrupts feed into the PLIC at an offset):
>>
>> * global int  GPIO_INTERRUPT_FAB_CR
>>                 0               1
>>     0       GPIO0 bit 0     GPIO2 bit 0
>>     1       GPIO0 bit 1     GPIO2 bit 1
>>     .
>>     .
>>     12      GPIO0 bit 12    GPIO2 bit 12
>>     13      GPIO0 bit 13    GPIO2 bit 13
>>     14      GPIO1 bit 0     GPIO2 bit 14
>>     15      GPIO1 bit 1     GPIO2 bit 15
>>     .
>>     .
>>     .
>>     30      GPIO1 bit 16    GPIO2 bit 30
>>     31      GPIO1 bit 17    GPIO2 bit 31
>>     32          GPIO1 bit 18
>>     33          GPIO1 bit 19
>>     34          GPIO1 bit 20
>>     35          GPIO1 bit 21
>>     36          GPIO1 bit 22
>>     37          GPIO1 bit 23
>>     38  Or of all GPIO0 interrupts who do not have a direct connection enabled
>>     39  Or of all GPIO1 interrupts who do not have a direct connection enabled
>>     40  Or of all GPIO2 interrupts who do not have a direct connection enabled
>>
>> Since we can tell based on the interrupt number in the device tree
>> whether a line is in direct mode - can you suggest what the most 
>> appropriate irq structure for the driver?
> 
> The topology must be described in DT one way or another, and I don't
> really want to rely on a fixed interrupt number that will change from
> one version to another.

Yeah, that was my gut feeling too.

> 
> In any case:
> 
> - direct interrupts should be handled as a hierarchy, mostly like the
>   code currently does, but definitely without the probing hack.
> 
> - muxed interrupts (non-direct?) should be handled via a chained
>   irqchip, using a different irqdomain, as the topology is radically
>   different.

Thanks.

> 
>> Although for extending this driver to the "soft" IP core, it may be easier
>> to just create a "microchip,gpio-direct-mode-mask" property or similar and
>> use that to figure out what configuration a line is in.
> 
> My guts feeling is that this will eventually end-up biting you, as
> people will want to change the direct/non-direct status of an
> interrupt at boot time, without depending on the FW to do that on
> their behalf.

I am inclined to not allow that in all honesty. Because this is an FPGA,
there's configuration based on the contents of the FPGA fabric that has
to be done by something before an OS can be brought up & we have to draw
a line somewhere for what's reasonable for Linux to do.

> 
> In any case, this driver needs some serious rewriting.

Thanks for your help Marc.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
