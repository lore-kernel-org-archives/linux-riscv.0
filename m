Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACCC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbQN74WmgcQkT5bilM9XqlAkBc/FX+r4U/FFyvzQJ14=; b=g/HeowOXqcwSGa
	oPLr3ftiNpwFWG+3uoaty1WVfM+5DpyFZnVTL7kEb//hzhn2uNZguVpQ3V889uJDNvlQ3JuTCtkvB
	MABgNcveGCm3zhGAfPjBA+VTFO3rlHn0nb3Ia1fI+GxfjllsA6sjp0F0INwPoTkewJGMRvvMGMVDg
	JLXTO8ZBFWr2ESYySFzFXsaGemYayZihh/1xoZhPJ3OEo+vv7pM9DSBF/kdRzC9SONmvzyokn/FPy
	BXC3wB7P+dg5ySbjGv2XQvHmuaMHNUDExy2s9GKRVXsfXqICrG9wLaxh4CiSljD7+Ks9AMmLgKPVf
	ZJjCD8srCp38X17wyC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dYE-00DoOw-1T; Wed, 29 Jun 2022 19:40:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dXm-00DoEy-6b; Wed, 29 Jun 2022 19:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656531610; x=1688067610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AXDdVDR3eQM3qFbCpQwAF2f84S3RFb2qa+7g1PoVlOQ=;
  b=qzpQ3+Ll6xAfNGJlPCSTtoZnUgoUkTQob6FbLe+jz8BHHkddPhsdYxHx
   4MHIjcKnVhqlYaJvoTgnuzMdyHPGxXBXO/OQYlzhAiSA5/+0EjCXTtYQ7
   +4Vl65H7nHKJ989dmE0o6KT/3gvVptJA8m2UIIaOWs4iiCQU8DMbgVoaz
   227XfZSLc0oK5TTpcQHIfSijF6IxcWWCu4K0TVtvydyVlFnpeXs5KSBf0
   2P5nJJMeZEj0P1XVPrMTjh4qrSNB136mKH9T54ld1iuasRUUtjcO3S72C
   0vJVsZqEDcjDZhuyFg4qfQtEVJaiKvO1JTm0zzMb5NikTnKNkrNg+aohk
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="180092651"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2022 12:39:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Jun 2022 12:39:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 29 Jun 2022 12:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE00B6n1IerHIw/NvCyQWFwOMuI4kJLvm21d0h+JPZXTv6bTPjE0zHybZqCRGnR4WPr+wg5kAovy3JcK8VmUqM8eBZqfQnVVTXhXS3Yt/3DSFM5HtfuJ0xFUmqGWRUFbRik9RWHP0xlTeYwGdPjFbDudnLYfEuP06sFMNeZwJVtyLLDdlfEo4aXPu4fKy6UyqkD5INK1ngh+83O4IMTvShKoS6WarVB1N8L035zkSjvPQhmXULWIQbwQCShi6hfENldvatAQZXizLGILW7JUp8bOCkfGqFyy23l2sO/Ub48jtFDB15DdExSAvG/Rex1PKZPjw489RalU69+HR7XmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXDdVDR3eQM3qFbCpQwAF2f84S3RFb2qa+7g1PoVlOQ=;
 b=TuP07PNVJOKLXqG6k4aL0dXS6OLGNjiYf9M6YkiYA7k/lyjbhL2nTaG+z+o9xq6N6EinE+T2oDSDsG4/aKktW7PF4hhK1xHXPE/rWARGAom0Bx4FAWgyiVAas/MImLJGXvRP32J1Ykkt6EhPceCVwTxmOdsCkQNJOI3NYnuwr49b+KuRLFB1Ht4NI9nkdhIbzkQ7SNXM4MD9R7tnzfMXytOuKw/rAjm2wKITY1nsK48Eqgoz4VXSuTvoN7b0MBKwHyzuqNp6g/4CtrqSwqzZefxpLjOM2ygeILnLomjy4NHWvMcBzcvty1nCZII+WlS93wQZs4/U3D4tfVw/qXQaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXDdVDR3eQM3qFbCpQwAF2f84S3RFb2qa+7g1PoVlOQ=;
 b=WTKshRoPWc7rqzS5wcL9kpWJCyboq54GD15Rr9a6WVRHS9xgFrZ3yF/LmfDAAMV7sSxCgvsSZUg4vhscagA+3zWn9pq86iF7sfX2zyLfzUCY1rzHqk5+pXnXVmlSvKHcqrrBfBair8+Is8uYX1nfXAEEW3f/hDyPEkpBpp5zDwg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 19:39:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 19:39:44 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAargIAAEAyA
Date: Wed, 29 Jun 2022 19:39:43 +0000
Message-ID: <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
In-Reply-To: <20220629184217.krzt6l7qadymbj6h@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0b11931-f2f7-45af-b322-08da5a071df2
x-ms-traffictypediagnostic: IA1PR11MB6121:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 46/XQpNnq876ghPQV6lOBYDnlWdrKG4CafgADTjzrFITIDgj97QI5eA5OD8iZhc2ebJgquniphI0f7lhZ8M966cmAq9KT4fy9lTaOchpt0Oic0Ox6GmXe6YrVcVr4I/6WSwNhB56Q2N0NdBPZ0+mjLPR9WGPIF3tbqzuNm5BQPsP23gyWAKcol6ocgnZ4VOUOvxa/qB/PwTEjpRYdPIKY3XFEMnY7GyebPGmNbNURvxwfxoNrNb5dqR7LJGGkmSYmUMbgTpzEn2/reTt2iLgGwCnz+UXaPVpRPeXInYqTAq7zqO3UEsD8ZG+GVUUkO7mBl4oqmi2Nau39M0D0PcMCZy2FIB4nENlGngvNpC14MyLpM5jW/ucnPdlN+j0Y6IV1TkhD7VVD7CLaMJGE9pLCqKgjUuPKyLDwDQBXIB9dcTdZezHp17wlzqSInWaZsu7C4Ea5/fgEDLu1aZE7AnhVK/KVu+AKFy3iDQhgm0vgtKV4sAIlP9lqSO91OD+jTa/BjlCQJBZ7JMLXHfV2wTGMkbFfDQaiztHN378Xb1OCSPBQv43EibY++PFyXNpJihe6SDJus04CnBwzK0ot82tqn1NQhXPCkP5TxvZAkFxXzg5YBsPmpKDISR//kQUvOVQ5XuUY4oo27NjfzNl4njbiv7O3o+1xi9xw3uj9J6bzyGyHKeVnqTXEScN3nc6+fREnFQhxZf0d3jMhZwJAulTh9gpvVV2e0BhAyatrb27Kjnhvf4shAwEaxpw+MSYN8i2jEa9xiqjcHIi7xuM9VyQD6M4M9zn4+eFCnJmhpnVOLbXVy+PkG3f12/TayQl7iq41rEqUgR6h+39mVEUI8vf0WyKgsPXvgl/hUl0qjiOf0eeidOtkCDnQklkKkohlL5MwfWTawdFl292U32lhVatSw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(366004)(396003)(39860400002)(346002)(86362001)(2906002)(54906003)(6486002)(6506007)(76116006)(478600001)(31686004)(2616005)(7416002)(71200400001)(91956017)(5660300002)(66946007)(8936002)(4326008)(66476007)(8676002)(66556008)(6512007)(53546011)(26005)(186003)(316002)(122000001)(6916009)(31696002)(41300700001)(38100700002)(64756008)(36756003)(38070700005)(66446008)(107886003)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0QxeVpET24wcEY1cWY2U3NucWdSLzFScFVwN3JTQU9LOFZUNzZsZEVFbFhD?=
 =?utf-8?B?VlpqWGcraE1nZDFENFRaWkRvVmdyeDljS1VyRURhaGhSSmZLQXQyR0Y4RkdO?=
 =?utf-8?B?Q1RIYThJTmhJN2FaaHJqSFBoYmRnZFg2MG1BQ1FhN0ZoYTFMRC84Rzl4dHk4?=
 =?utf-8?B?TFJFWURqMjF3VUVqQ005cmV5dGZmeTVpWk13d1RBYjVqMUw5V2ltL0ovWW0z?=
 =?utf-8?B?Y2d6ZVJkeVVuYUN1Y3d6M291eFBoVXIwMGpTOGUzMVFIa2JIZzBLQ3lTdUU3?=
 =?utf-8?B?eERjQTN4aDFIU1ZaRnRiRjl0NWxjUDUrb3NVREs2amdMLy9jVXZMRjFrbEV0?=
 =?utf-8?B?Z1FUSDAyT0lxS3pkN005SUZhTFpzZlpxZlFyN2NIaUs5S3hpQ1FUREd4cjB2?=
 =?utf-8?B?RTArTDJZdGp2SkJ2N2JzL2lweDJRVEVIL0ZRcmFuamkxWlk1OUp1N1AvQnRN?=
 =?utf-8?B?MkRhRlNYdmx3OXdic0labHAxcU5pbVduT2g3VERSMnJXY1NRVkFMZWhQUGdD?=
 =?utf-8?B?VitZTGo3TVB3SkNqODdGMC9TbjNLeFNKZXdvZVFVZHh5QWxCVDlKRFllVnM5?=
 =?utf-8?B?ODl0UDNqYXpCNVZxV05VNm9yS2VRWm10NisxK0l6dlBkZ1RHTDJYK0o5R3VB?=
 =?utf-8?B?NmR5K2Y1Qko0Q3V6Uy9ETjB2SWZvNE5LbHpmY3BoUXdKL3RkWlBtWGN0SWYx?=
 =?utf-8?B?N055L21qLzhodkp5N1oyZFo5SVRuTXhWK1FNUzR5U1BGRmpFcEpzQUswUlZC?=
 =?utf-8?B?b05OM3NoRXBOZERnaFRuQWRnSk1xN1ZTWmZrMk9yU0VZbnlnQ0VRRTg5SVRQ?=
 =?utf-8?B?TklFSXNQV3BNRTMrWjZUZ2svTWhWMXlPTmRxRHpSZC82QWYyL3Jka09rWWFm?=
 =?utf-8?B?M3luekVMbHQ3dnNJeklnOGYzVlV6ZE1UNE5EL21wQ2dPUGxUaGxSdzBMeG9o?=
 =?utf-8?B?K3Nac0tyZkxTVkZlTzBpdmd5VFZ3T2o0S2E0c3c2MkNJS3U1QUorcVg2c2t2?=
 =?utf-8?B?ZENsVEtFYjMvNXhjWG1rMXpiWWtkS0h4djdmZHl0MGtYc01zVVJXRmdyMUpq?=
 =?utf-8?B?Q21QWmhneGlrdXJTY2NRTUpiNGpjM0srUXhRWkcvdG1ONG80OVBlSGJWL1R0?=
 =?utf-8?B?TEc3dUdJTHNxWkJ2eWJrKzFjYzA2WWtoTXhRRWllSEpKRmpEbWp2N2FEUzM1?=
 =?utf-8?B?d0I4ZUEwMzNFbVpMc0o5L2V4YmlpTEdZWWRsTzN0Z3pYdVNYNkttb1NFSmFo?=
 =?utf-8?B?dW91SHhpQnFReWdpT3RhVGN6amo2L282dlczK09FRnRTVGNCQUU0aGcwODFH?=
 =?utf-8?B?S0hieStmazgrZHJ2WkludTBXbjIvK2RlUEZWQyt4M3NXZHpabjFUN0tsRmQw?=
 =?utf-8?B?WW9xZ09NVHF5aWFSR2JLcGpCRlhmZXRSdkVjVTRZZUxHeGsyazh0YjdNMTRn?=
 =?utf-8?B?RXR5Q2lSMU1paktIaVl5QmZrZGdTd1phalo5dW9uTGJCZFhtMGNXZDJZOFRS?=
 =?utf-8?B?R0JJL1ptbHZDNzdJL1g0Q0o0Ry91VFY0TUFKRzJCdXMyUU9MU1JWQVBqQkc1?=
 =?utf-8?B?WHVwc2dhWmNYZzFKUmxiSUxDQzkzeUtiVldadkNLWXpkZEJOZ1E3ZVdPbDlo?=
 =?utf-8?B?MS9CSG1sSjVISXFway90V3JDbHlWV25WdGNIM3BhbFJmcmcrQWdhZldsZEht?=
 =?utf-8?B?K2k1Z3Q2K2dEdmlPUStKcUZ5ZW00Q0NsMTQxbzZyQTRURERVV1BWNDMrb0Ux?=
 =?utf-8?B?NnRMRkZ6SFhNckZyN0d4THRQdW9ucHF3TStVc3lndjcxR2ErbUsyd3Z1UGw2?=
 =?utf-8?B?NVhHTHM4N2cveDdhNS85UnhZZkp5MUJjSFJndUVGUUJpVHRJWFVON3Mva2dm?=
 =?utf-8?B?Yi9MdFpqNURVc1dSYXRqaVBVTTlTYktOWTB0U0ljZXJGZmZScG9Kb2ZFYzlT?=
 =?utf-8?B?Zk9EaDlPTnFSK3NwRGVuMzhNNU9LMWx6SS80c1piK3c0NUwzaDdQMDBiT05F?=
 =?utf-8?B?dFF1NUhPSjlVdVBmb1F1dHVnMU13aGlKNVVXZXEyc1gzK2VBM3ZwUGttQUQ4?=
 =?utf-8?B?SGVFeUl0eEQzdklaYjZWZFBqRjVOWTBDcFdua3hrVWlacG5ab2tiM3hUT2hF?=
 =?utf-8?B?L3hGUHVEbU11WFprSXkxdSszWnZCZkR4ZG1pZzFMaitFVnFvWDQrMG9Qdm9F?=
 =?utf-8?B?K3c9PQ==?=
Content-ID: <FA690A4AD4119C4C8642E70DAF5AD8F6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b11931-f2f7-45af-b322-08da5a071df2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 19:39:43.9437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRLQvEgenrh1AnN75fXUobCC/vqC2jBabo7DRQ7rW/sl+KCw33V2RfmxWjbqH6oyH9B+4CWyJy121yXkLKU+2jSCz99tIpYzGA5yUSkjFHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_124010_325675_9689895C 
X-CRM114-Status: GOOD (  17.74  )
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

On 29/06/2022 19:42, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
>>
>> No, no it doesn't. Not sure what I was thinking there.
>> Prob tested that on the the last commit that bisect tested
>> rather than the one it pointed out the problem was with.
>>
>> Either way, boot is broken in -next.
>>
> 
> Can you check if the below fixes the issue?

Unfortunately, no joy.
Applied to a HEAD of 3b23bb2573e6 ("arch_topology: Use the
last level cache information from the cacheinfo").
Thanks,
Conor.

> Assuming presenting L1 as
> LLC might be causing issue.
> 
> Regards,
> Sudeep
> 
> -->8
> diff --git i/drivers/base/cacheinfo.c w/drivers/base/cacheinfo.c
> index 167abfa6f37d..a691317f7fdd 100644
> --- i/drivers/base/cacheinfo.c
> +++ w/drivers/base/cacheinfo.c
> @@ -60,7 +60,8 @@ bool last_level_cache_is_valid(unsigned int cpu)
> 
>         llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);
> 
> -       return (llc->attributes & CACHE_ID) || !!llc->fw_token;
> +       return (llc->type == CACHE_TYPE_UNIFIED) &&
> +              ((llc->attributes & CACHE_ID) || !!llc->fw_token);
> 
>  }
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
