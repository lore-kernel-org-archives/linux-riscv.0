Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766FEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3z5otCWtDoCePBngpqO3Nc8Bp9N8q6ocL6b0YZ1XvHM=; b=wX8rMxgw4lB00x
	lTdhhssP2FQcRs7RGFJRAHw1DVcEd6Eb+1v7cwQIww4XOSSy9k72DIGk+jL9oJ3GHQumvRG0UhHdE
	nnorL1/NDnsR3nbK1zUiqFRvW4cfOpOtHVO2+7vVJ+l4VsqKsGcgV9V7ZtVcq0FuBn6cK4gKnMQG8
	4pbODUAMiV2gABCyDikNCwxAF4Wp+hMWW/y092GYt48xVmi7QUZJ40v6GDp/tZLVBk2RJbCgwo6FG
	HCzygrPb1gsdi6ADS/yipEb/0P9tp8vm/KLtE7QJVNHtn/Bkz/F/s+Dd0yZ/2SHfr6QMfspLWgwGL
	9Z7CRYcF2qHl6UU3WdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0jYB-003fHY-3e; Mon, 13 Jun 2022 12:52:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0jY7-003fFW-TT
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 12:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655124727; x=1686660727;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XTEOi1MTxvCvwnh9QWQBbVNj8ztgNQQMgqiapfNzLcM=;
  b=Uj0SdLevc6aUpZPwh/xemnaD6ZBMP6wEsfzTNxSTxzpsmPC2KQCShcr5
   stBgTi83UYVxFgtX3P6GdFHy1ETkG/xdrXQPJ/wwbdK9le3QKzyJ5kjLF
   0ktt9Thee4bslgcEkmQLFzSl5le0E2ddnP6oYHjDQQNuOVunv9xbUA3AY
   RfkZ7qSnbtnYE3vaJ+Ij6gZDKAu2Ci0CWFf4vPvryWw/WDYW5FJmQai6v
   ut8ovOMzfS8WpdMBWO9PZyH0rJJ74TcMYP1QwOVDrYgnqGnCz9AS0d9Vu
   V4TsEYouMVDEJc2yhAivTDKgyEBlG0+Kaggr55OUDGwTyuqeDYI5A5NGV
   A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="99754575"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 05:52:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 05:52:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 13 Jun 2022 05:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEk2NQbBnwsC6XDLWDw/XSuUA8Q9Vw+nx9IOT4p++fG8MtjtdnyUiL3dPu36y3yNNomNwbHR6oHRkE45IHOQL9GsNjMe5bMCt1G/fVlgMgmpXF1WqLeqAVNbrMv8OCmT50DRJgkL3vP3QZrSA7ME+Q02s2BQls3K9GVVr1U4B/WltnxSrw2xGN1v4yXT5nzs4P6UoWhh7h7LyMPFGRjXyd9DxQH23mTAtQbGIu8mvo2qdw3mFhP+qOiPEBUkVKvllat61M8GbQhNU2aOROmj3hcjmwFuEzO/oJc/cb0vTA/3tjIGD0zGtBivIr0ovxiXFS4uZITdoVTTLDxQLQl6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTEOi1MTxvCvwnh9QWQBbVNj8ztgNQQMgqiapfNzLcM=;
 b=C6UfWuUCqNYVqdSr9RuI6HoYCfJJRxtdsL9/6aUvvt5iUagbqUUrTndUhx9GevlIbva3kKkec5Cv/zdTz6DHf+1D5L7p0JqlB4BgzurC8Z293kcatdZ84oWkNwiOW2CiyyxFwcyJbScwPchIK5LDMuiWuhgw18ywr+C2y5eaFKiS8IaBO61BR3+bLVKtSfFgR9zhKlGNOdg7OsBMtdg0O7XuYJTl8EMgQoO/LfPU69LkLl+adfyANBHV1SfJM9l0svOQFZx0HnLpDmGfkdAdGP/CG6FpZDfjYgq3V7Q9kDj+hSaLf5eHAFlaC1unwOwwJt93uAKL3jetbbPxjk3K/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTEOi1MTxvCvwnh9QWQBbVNj8ztgNQQMgqiapfNzLcM=;
 b=PK1iuryxjYRBiHPntAF592Wr3CArZckMF1hI9VpSSsqEmIrtNj0Ujt2Q8A59SxLa4EnkRNOzFzkz6EH0nwY+knDlRUfGKb4PO9aQTiBjRUzrbHef9K72cKR8HepjqatBtfLGS6zUwIElt9wysAUUdM4/69Xo/NrvtmZyGcnRREE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW3PR11MB4665.namprd11.prod.outlook.com (2603:10b6:303:5d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 12:52:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Mon, 13 Jun 2022
 12:52:00 +0000
From: <Conor.Dooley@microchip.com>
To: <mkl@pengutronix.de>
CC: <wg@grandegger.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Conor.Dooley@microchip.com>
Subject: Re: [PATCH net-next 0/2] Document PolarFire SoC can controller
Thread-Topic: [PATCH net-next 0/2] Document PolarFire SoC can controller
Thread-Index: AQHYejvb6k0j61Qol0aP+WnBuEsVo61DiDiAgAAJ94CAAAp4gIAABvEAgAmwQAA=
Date: Mon, 13 Jun 2022 12:52:00 +0000
Message-ID: <4c5b43bd-a255-cbc1-c7a3-9a79e34d2e91@microchip.com>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
 <20220607071519.6m6swnl55na3vgwm@pengutronix.de>
 <51e8e297-0171-0c3f-ba86-e61add04830e@microchip.com>
 <20220607082827.iuonhektfbuqtuqo@pengutronix.de>
 <0f75a804-a0ca-e470-4a57-a5a3ad9dad11@microchip.com>
In-Reply-To: <0f75a804-a0ca-e470-4a57-a5a3ad9dad11@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d33f39e-69ef-49b0-9fab-08da4d3b81be
x-ms-traffictypediagnostic: MW3PR11MB4665:EE_
x-microsoft-antispam-prvs: <MW3PR11MB4665D4DD96E61511D9A211C098AB9@MW3PR11MB4665.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 21+MzvV3EL3M6ba1jVfTNdHgJGmBGMACy0KC0GBiC+XQaDDw62C+1tGkrh54HExNpWDWxVa/4KoSLQKHlTnSgfaNosYTMecO6fujaV45o2M1HDTq+4T6yWA6TWhjGPJtRT2ZM8jE6eurbOWbZ9jh7Ca8WGYC6hH9uCv8n54llMf9ZnyjZT/SXoH7GRavgSLZF3uFbe/BcpMdJ1HIZsoz+8EiRWb5/epA702OHnc8e1eenl+S+pLxaUpbFBNauD7DAuD/UTjZ/gedsXUnzKJjDsqGTTl5Qhsspv45L6SCUqXfyAk68xoM/Aw4KPnDB/dw96RnqBln+vDTmuGgFvV9wX1rGXKR/QrGLNSDoVmdA+nXtxNC4R81uhi5dISaTmbCSSYiZV0vgrAHgJnx77IUIU1F//U0FX8uMjRskvK9blhK2cRytyCepW2/FJMOzAeBCj5f8jnF8T6wM0naYa19uk+96Til0/JgM2+pI7JzA5rKtSFhgwYSm8LJ3uGUjIuE+fbIlKuGOu9HMAPj2QTgHgwVVgbeqbaxZSUIZnFkjDTvKoFgenyA32aQvZy1agWU5t5xahCS9XFaJ1mo2197wjDIWwfev6qfHFs3wftSmE+djcxLJMTPSmBksx9lxOlSmo1Mt4Hl4QWJkcsmZnrXbFVeO2uRf3DtcomDmb5nMELKJsy+PmO7KhpELXhIaKfCW1nsNM2mFE0jN6hYUYCQSil8VlKiTPIRVL6RZTk4yJ3Rc146JLM1Pqq3SY/KF0BiDg8lur8vEj80fcBok9Zr3MyTg1njKW+evKe7rbtA94b+dCVTcsouZDgDBcW0Jt6lfn1Sw3OvtPABPOTybrRmw17Q4vATiQZ5hYOQLgQDhKSecc9AcKzj/BuyGyHkYo1UELQAYw29Enfq3WRBCQB/cA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(8676002)(64756008)(4326008)(91956017)(66556008)(66476007)(66446008)(2906002)(66946007)(76116006)(508600001)(6916009)(31686004)(966005)(7416002)(6486002)(83380400001)(5660300002)(26005)(6512007)(8936002)(38100700002)(6506007)(53546011)(71200400001)(31696002)(122000001)(54906003)(316002)(36756003)(86362001)(107886003)(2616005)(38070700005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1M3Y1BOMy8xeWtFNHJkNHIzdXMxa3c1d3JmVElkSFVFQ2EvWmlZTFgvb2tq?=
 =?utf-8?B?L1hEWGlTZ1RUZ2sxUnFuQ1hYMEpvQWxrL2hUUEpqekd5MlovT0xIVHdSY2JO?=
 =?utf-8?B?NUEybThpQVBreXNNeWUxcm1QdjZNWkVRblNSSWFhV1FJcmlEMHAwUnpQQTZn?=
 =?utf-8?B?TFpwRUROVElZUm1memVFcDlrZE93Y2s3VWdXR2VaUFlxUklyZVMxREtncnB3?=
 =?utf-8?B?OXVHYzltMTlaM3YrRnZ3R0FNeWRVKytjUVZ6N0JMRi9FMkhqYk11ZnJtT00v?=
 =?utf-8?B?bnNKQUMySXhlVUF1NXJvSlU4Ymw0aTFzUGNYQWxqU1Z4eFZhSFVqellSajYx?=
 =?utf-8?B?TzkzaVZ1NEpUU1N3OFE2aUFrUGdZZWR1TGZsT2ZjN2s5NnRyOC9oTjVFYTI1?=
 =?utf-8?B?UXc1NTAxSlFOT2JTd1NISXREb3pRbCtHa1BNbnZDeFhWSHErTk1veFc3NzMr?=
 =?utf-8?B?UThNb2F3dzV3YkEzbEVwZk5mS05pbFczMjdGRmtZZnBLYmN0UmF2akNEdDZK?=
 =?utf-8?B?cEUvNmVUNEYvMHlxK2FyZ09NNG9RMlFzN1Z3NmZnbms0a2o4OXhMdERySDdR?=
 =?utf-8?B?cis4Q01ub0MrMkVUbmcvVnFpUG8vUnVPVFdoVk02UUQ2cDhFeER1Z29xUHlH?=
 =?utf-8?B?M0lyK0xsUnJxZWlCZ3BWTUtYcnZWT1NXYXlHSTNTc0VYNFp1MVdpN3ZFTk9X?=
 =?utf-8?B?SGNZR0JDTmhWNm1qNzVDWmF4ZWx6c3lwVVlNNkttQlk4ajM3cksvZXkyZWRF?=
 =?utf-8?B?VEpkRnN1UWFSdSs3ZGlHRnFzb29scEd5T3VyUWhmdkQyQWcxQklZMzVxcys2?=
 =?utf-8?B?dEd5TUpmSTlGNTZaVS83WkQ3SnRGQkFDZ0lQdndlVE1Kd0xxZUlQcUxsQ2dU?=
 =?utf-8?B?VCtsN2hWcjVWZ1RtQTdxeEhFUW9CMVMyMm4rZ3RRYzkvWHh5M281ekRoYjAw?=
 =?utf-8?B?MDZMNXo0TmFQU0RFaFNVQ0MzOXhmcG56eHlFQWRtdWNQaWxLMDZNOGcxVCtz?=
 =?utf-8?B?bzBpVzBkSzR4SjNJRnZsNXIwdm1KcTNWaDMrOVlDamFJSWVsMmdEQjRadUpJ?=
 =?utf-8?B?ZkY3YWFSbTV5VzNLbzJTakpFQzFuNHZFUk5JbVg5SndDanJZSWNhR05WT0xG?=
 =?utf-8?B?VlE0QW1nbXl2U0lQWENtZ3g0TEt6VS9KR25wQy90K2kyNU52c0RYa1FqQ2dF?=
 =?utf-8?B?WHZ2VUsyRHpJdk5HNnJvN2w1WlNUd28xMlNxVnJadW82MHZ4emp6ZXFlMXJK?=
 =?utf-8?B?MEFJLzJvenZYRTZ2Q1RJVG9pMUhIQVloL2dLVy9lazJhOEJlMHBqOXNqMm5x?=
 =?utf-8?B?T1pibEk2OEN6VDE5NkhWZ3NyTjhqRmd0UGhYM2FuT3Z3SFFRY3Q3UStPODBm?=
 =?utf-8?B?aWl5TUV3czQ1blQ3Uldyc3RmazFWY1RLV1VvY2F1TjdYZnp4R0F2Q2Y3SVho?=
 =?utf-8?B?VDdEMUdQOHhGbVRQd0ZsV0JwcllkWGpWSHRyK3pBOEJuRUJGdVJYRVloMnRl?=
 =?utf-8?B?bHNVenVpZFFDS0xVUVlrZE93bVlhdVQ2cWZnT3JzdmRHdzVNK3J1ajRmY0Zv?=
 =?utf-8?B?ZHVpMUxNdWZtTlRCcmkyT051MERURFdmZFY0VUxzNjgyWDVySXJ3aDdKbzl6?=
 =?utf-8?B?QjBLWVMzNTJ2cHpMeUlrd290SzBldTNNVGJaN3FXVElXMXNYdkRuY3BxNVU2?=
 =?utf-8?B?SzJ4cVZpYktPL0RieEtSckVXdXJFaHk4cTFMdVM0K0xML2JXN1ppalFSWTRC?=
 =?utf-8?B?Y0NNNFFKSC9MUkpKb3p6bll1NVk3UFQ1NDNML1I0YzdVWEpTQmxYN3c0a3FX?=
 =?utf-8?B?Q2lBTS8rZ1huQjFOVFRGdjFtRnU3L0JlY1N3ODhpd1ltMUpqMzlDZDZzRlZo?=
 =?utf-8?B?U0VwQmNXbUNnRVJIMURla3dIY1A5eVR6VHgvZE1VSU40Y040bzljZXhrNU1Q?=
 =?utf-8?B?TS9tRzRncDVBb0FaUDZhVW5ZOXVId1Roek1aR29jVmxmeFpsK1c4Q2VVT0g3?=
 =?utf-8?B?SXF3K0dEQ3BIVUkzWEswajFIYitkUWQwZ1J6by9ZTjdFKzhQMlZ4WlRrQnEv?=
 =?utf-8?B?TThDelVDSllNV256cWx4bjFqMkhWUDdOR25xdkgzMGxJeXQxYkN0QUFiNHcx?=
 =?utf-8?B?b2VXSGNhYXVuTnhSdE5kSzJNNUMwZHl1T29HQlhTM2JwQU5MNEwySHFtUFNi?=
 =?utf-8?B?aU81WkJiSDliOE9qNVJ0MVQxS2M4ZWNjWnlack1RUXNmRW5NRk82YWdnSlNa?=
 =?utf-8?B?cWllUllOc2NhTHRTLzlHVEdpTVRtNDYzaE5UenhmUUFqOExBaG5BcHhwVGxS?=
 =?utf-8?B?SGZJblJrNnNaOG1FTi96T3RvMnhucGgraW4wcDNLSnlPSC9HcFB0b2prakNT?=
 =?utf-8?Q?wWn3gHPheFBQd6Fc=3D?=
Content-ID: <03EB708565E47944AD8385E3C222E96D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d33f39e-69ef-49b0-9fab-08da4d3b81be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 12:52:00.1040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7HYlq+KKBNoibx1gty/FW7KkN3WheY7t+jh5vC0b+yo238DjW/vf49MyntLvyeQbVbetHt6x+G/siuz4WtHdxB5oQUx8dNyAoHnRTBkEF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_055208_100653_9FD169DE 
X-CRM114-Status: GOOD (  16.97  )
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


On 07/06/2022 09:54, Conor.Dooley@microchip.com wrote:
> On 07/06/2022 09:28, Marc Kleine-Budde wrote:
>> On 07.06.2022 07:52:30, Conor.Dooley@microchip.com wrote:
>>> On 07/06/2022 08:15, Marc Kleine-Budde wrote:
>>>> On 07.06.2022 07:54:58, Conor Dooley wrote:
>>>>> When adding the dts for PolarFire SoC, the can controllers were
>>>>                                               ^^^
>>>>> omitted, so here they are...
>>>>
>>>> Nitpick:
>>>> Consider writing "CAN" in capital letters to avoid confusion for the not
>>>> informed reader.
>>>
>>> Yeah, sure. I'll try to get over my fear of capital letters ;)
>>
>> :)
>>
>>>> Is the documentation for the CAN controller openly available? Is there a
>>>> driver somewhere?
>>>
>>> There is a driver /but/ for now only a UIO one so I didn't send it.
>>
>> Brrrrr...
> 
> Yeah, I know..
> 
>>
>>> There's an online doc & if the horrible link doesn't drop you there
>>> directly, its section 6.12.3:
>>> https://onlinedocs.microchip.com/pr/GUID-0E320577-28E6-4365-9BB8-9E1416A0A6E4-en-US-3/index.html?GUID-A362DC3C-83B7-4441-BECB-B19F9AD48B66
>>>
>>> And a PDF direct download here, see section 4.12.3 (page 72):
>>> https://www.microsemi.com/document-portal/doc_download/1245725-polarfire-soc-fpga-mss-technical-reference-manual
>>
>> Thanks. The documentation is quite sparse, is there a more detailed one?
> 
> Nope, that's all I've got...
> 
>> The register map cannot be downloaded directly anymore. For reference:
>>
>> http://web.archive.org/web/20220403030214/https://www.microsemi.com/document-portal/doc_download/1244581-polarfire-soc-register-map
> 
> Oh that sucks. I know we have had some website issues over the weekend
> which might be the problem there. I'll try to bring it up and find out.
> 

Hey Marc,
Doc is still not available but should be getting fixed.
What do I need to do for this binding? Are you happy to accept it without
a driver if I add links to the documentation and a working link to the
register map?
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
