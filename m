Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E28ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDXrEGgNUk68CqX/SWpHE8XXSB00ljuUIgUn8XsvynY=; b=Aq5ZcOJgAPH1qE
	zlO26D9Cklsx5221U6LCpdQIb2tD8HM3t+WXHho5pdWfIFGh+5coXhEqIgiTxQpcW1EtuCqk4lJoa
	y8ZIyhp2yaMmQIeW+6CaBrgqP+2Y/lS6FvLrk6vgeU3pnrjjmFqApx0znSwhp+QpkXVmYj79Hj96t
	Y9aY9e1ehDEJaLdSyiUOopyMrsUigPnbvHul210pqo/VjA0IqiuEXDcPeM81GtCgMaHSVjd4eNpEb
	0HiKh42Zx/iVEi2ZMtm+Irts9pDsXg3O39tkCazJpUVpihCFm4aO92k/puNc0zNa1bO0ymR/iQCJv
	61S0f/bhDSZk6CDIJ8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5Sz-0010uF-Bz; Tue, 30 Aug 2022 17:56:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5Sw-0010sl-QJ
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 17:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661882159; x=1693418159;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V5HSpp8H/fAjUCzaQ4paygRJx7GMmRJfMsF0sb9g3Oc=;
  b=MNsyjCweyvd9YK7znWt5dvg6q5jIm/fHwuK7QeGJd89RdtHGm0gC4Nr2
   FOo0aITnGsRyZFpgyoLjmUWWw6upcqmELugJU5IvF/BpXqJfO9a3N9dNz
   gANhgEfxNCNqenu9Nv960f+w2XW2PVda0CGFS17RGQeusiHDyWgVtfxUd
   6O1pX3p/9HEJFiWaW6F1PrQWWwua2thQxvcLz6Kz4/IUOviJrWRhYT7V9
   0Atk/FPYSnHMFNaxlg7j83X8qfVgThJZSdULPA5+imXkbojcq/caR2Ggt
   4t36AyrY+PbLZxqsAoynOxlm+Fr31OhtAbX6zBHwSh03dl9ibaFU+18H7
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="178358933"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 10:55:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 10:55:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 10:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Avcx6IqjP+VVDLn6ZPh3EVW7BH6sxZqn0EvZMl6ZavA7LUayvPvwkzpc+PEtvpQ6oi0g5p1D6c62HZcoxRRWSyVDoN9v5AeaOBf9uE8u8UxMFCAC31qaM8D3gflO4Qo5o+z9+53r8vDmVyo/ELb5727driXmFb3fEQokQxL7kTGkRtYrOuTvtIEOvOSKgPsm6PaW3rsqpjC/4IShNfwJq28QLHChsAdOgOz5NuLlvYzIFWQYz2fYJpGrClBlRV6v2mUPyl1XB3wGlMGs3D0qOvBXXGr096Q81JyCFtoib1O0EaWVGsukqqEijcp8lpoU65rmSGKrdQD8Ru7YqHkxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5HSpp8H/fAjUCzaQ4paygRJx7GMmRJfMsF0sb9g3Oc=;
 b=h144VfLgeGbNLGloqwYwBXBH5r1IcdGobmaEfhLRaRbIc8P55vemP3bLFt0b0/NyIhgv52b2Ii8G64lU/hTb5T0vVoUaSCyk8YiJpGaqhsSpqpZzR2EV9+SRs14mvFbnWrCTsCmRXwJh77sUaxNouX8SFHAsUPmfIrgbg9iIiTEx0T03T4Ta1Fg+uyZse+XekbNYr/7g4fuVx94N2q5oYoU69qQzaPpge12gGYkCpgoOaU+qUxWLEMvAfcSKhGEn5nM9+buM7y2pr9BM4LAeMR0fAIEjGDu4hxZZ9lecN+jmaHt7chMcTtfXeAIVLBCcycKEvpZcwM+Hb0VIgZ78rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5HSpp8H/fAjUCzaQ4paygRJx7GMmRJfMsF0sb9g3Oc=;
 b=XNeskq9w28dghHsHHFEWwDTbm7+7wZCaIFGyyD3F1AmsoCqMdZOuJn4LDGjV+RCHbWL06UX5IvmOfFWK+9A9jxIh9Qp35jQpm8ddkbWg4jHyRpDpVbUyfNzmdM7WTkQPW1WfDRr/VRWBZZANvT9ZRH1sSJ82ZCFUXWaSmgvg4qY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 30 Aug
 2022 17:55:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 17:55:56 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <Conor.Dooley@microchip.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Daire.McNamara@microchip.com>, <Shravan.Chippa@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Cyril.Jean@microchip.com>, <Lewis.Hanly@microchip.com>,
	<Praveen.Kumar@microchip.com>, <wg@aries-embedded.de>,
	<Hugh.Breslin@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Thread-Topic: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Thread-Index: AQHYvFnwSpVLiReZPUWC5HM7xMt/UK3Hg2QAgAANgQCAABkagIAAAP2AgAAIm4CAAAGfgIAAA1kAgAACPYA=
Date: Tue, 30 Aug 2022 17:55:55 +0000
Message-ID: <d24f2886-3a16-6d02-bbc4-0232f1636b5c@microchip.com>
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-3-conor.dooley@microchip.com>
 <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
 <27b8aa9e-9173-b40e-8f9c-a53fa5ba36c8@microchip.com>
 <1065bc99-d73a-9d19-7f09-26cd862fe0c7@linaro.org>
 <69027950-f18d-c9a7-9f0b-d73ef68197c7@microchip.com>
 <dc3bd6c6-852d-30a5-2ec1-ab5f7fd1488c@linaro.org>
 <8ae5c383-1c04-e16e-83a6-26861640deb1@microchip.com>
 <a494ab3f-fc43-e1c7-e30f-09838d743ed5@linaro.org>
In-Reply-To: <a494ab3f-fc43-e1c7-e30f-09838d743ed5@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00f57b34-f85a-46c4-fda5-08da8ab0e325
x-ms-traffictypediagnostic: CH0PR11MB5409:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Yt3eBgyU1XUXShYlxs4tMpZIUaVjqbLeDH2DvdJZREizaqCMRobcDlHroatBc93egIcT9NvE3iA/QT44k++FMjUnXng6QVELK4BzY2baHWmQ48Kgz0clHAndqSiOvqn29d2Wlkx++8APvRCrtSi0UCxB142diub1yyyvVrrpiTaTQNL/ZBXX70BpmdGDrUWyJTOz7eLaSCZHGUl6jra2JtyddsTq5Vf8kfUO8u5hrXb8io8m8pH5Q6n42fKZILZICudARwFYGaTYu3NK/Yfr9odzz8/xY3XqjeHBDG21gzTTf2r/r7Yh3XDYFT77CIHMy4aigfk3Fuv1ofXugC22AooM1JJLyCUDp4FujtkXDwd98Os05cMYNbvZ0yWl0mkgsRr/UoHlQZTqL087twi2/RovDPLOO3hUH0kRyN+OEaMPgR8jiHrBu5wQrdmT8NVyZc+9oRM/QrCQkApwxvd0QM+10wglikJ3LMKE87nWhilwAc9VIouTAotTl+bydlM4bIQ/V1YDJSklmij25IBt3obAo13yzUqvPNzkD3Cf7d2sxbJEk+jcOEY1IHY6gGWBZGwEcpAuaAzF3LztxIGAat7uY1QQAmqNIXqVpQDgUMr1bxAboiNcTlMggjqsxAVL9IXeNHteln8UXsezeX9J8Mj+9PwrSUKiSEVR2zKFlLYUMu3AmM6d/8ZnSaKMCRXw8rO7+6gEzf236Yco/LZaqRX6iXWi0vGRVIwIsO7BvH4SzAPjuQ8m6pKpRoidwe5bUdFdocHMjr9/9IHf9vr7fDCGpJJlFT+OcC4HZqkWWb2nvZSQRbRg9JHvtLGcddvnwQchVXBdLVok7KVqM5ulw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(136003)(346002)(396003)(83380400001)(8676002)(66556008)(66946007)(64756008)(76116006)(66446008)(4326008)(6486002)(91956017)(478600001)(316002)(71200400001)(6636002)(110136005)(54906003)(66476007)(5660300002)(8936002)(2906002)(7416002)(38070700005)(122000001)(31686004)(38100700002)(86362001)(31696002)(53546011)(36756003)(26005)(6506007)(186003)(2616005)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2wrbGtKdVBxSVZlRWpZUG5aaCtQN2xFOXc2Z1pPVWxnMHF6R0RsNEZ5eEhK?=
 =?utf-8?B?aDZ0Q29ZSE81TXFHUW90OVVhYXBxSm5XYTIrdlVFeTd5U0ZlZ05SNVc1T0Fh?=
 =?utf-8?B?elU2Y1VoUFRNeXY0M0tremJzMGJkQnFDYVhaUVluV1h3Qll6TFF4Yk1KcTk4?=
 =?utf-8?B?Ykp1VElUSUd4VHJENWNBb09CazVIYjB5ODU1QmJHTW5VSkVlWXJ6U1JESWdL?=
 =?utf-8?B?dHhZYnZ2cU1iL21tOHFpUUVlSlRNSkpQR2ZpOUgzd1NXOXF1NjZSTUNpVHFQ?=
 =?utf-8?B?R3JsVjl3V3lKeFgwYVRKek1mQVorQTRDeDZXVklESkR4dU1VSjBmb3NPSWNO?=
 =?utf-8?B?c0o4NHo3aTFyNmlEbHBIblg5eXUyRjVPbSt6MVlGNzhKb1dIOU53SXZncGJJ?=
 =?utf-8?B?N0NaRS8zNHRWbkZaUDc5d0pDNnVEeUFveFdNeWdsYUpsV0YyTjdPTmVVNi9J?=
 =?utf-8?B?MXU4WU1FTDJ0U3A1dXhKMWlUK0ZGRmJuSDlvYWN5SU55TzdmeC9uNmNsQTdY?=
 =?utf-8?B?QkU1SUlOZUFTdlE5VXRFUGNiRXRpK2JzbSs0SVBVS2tScHRvOFlQWi9VRy8z?=
 =?utf-8?B?bXpVUkNrYllzYVZwK2J2em51US9VdlFzUW02T0kxVk1jQU41dGs3enl6eEVQ?=
 =?utf-8?B?QitybStHNXRwdDV1aU5yeWRZZElFemNxL3VzZ0hHeXkxM1pnYWRXYlh2eHVF?=
 =?utf-8?B?bVdHN1ZLa3lmeFZ1NzljODF4RHg1QjlXcGUrOW9QblpHT0xGLzBuUlBsbUdH?=
 =?utf-8?B?SmRCVjFPbTZrZzgwRVJrZGtaY2dhRkRPdEZobXN3NC9ma1dqSFgwMmZyOTFF?=
 =?utf-8?B?cVJqejZDNy9VVDZHb1hSWXRycklBRDV0STQ3K09xc0lJUnFMck5YdnJXT2Va?=
 =?utf-8?B?M2N4TnlKMmg5SDFoVGpmRFVmb09JaUNnc0xva2xwMC9Gbmx2N3JLWDR4SnVV?=
 =?utf-8?B?RS9wNFhBVjRYWFVyVmJHU2thUGQ3aWdsb3JBWVdlaTlvdjdmaEIza28zSkhi?=
 =?utf-8?B?dnZPSVZxS2hva2JJS3IzSnF6SUN5azhYQm0waTRzVnJ6cGgwUW1JMHlzME9r?=
 =?utf-8?B?TXNPWGR0VnFpcDZXYjNkRklISnExYXdhK1p2Ui9RSkNVUDl2QU1RbTA3VTBT?=
 =?utf-8?B?dFZjV2tLVjVkU2dtSm1aaG9sS2sxWnBtUU13UzBhU0lIVm1GNlp5TDAyVm1E?=
 =?utf-8?B?dzc5bGhhamlEenAzcHdWWHpUcmVkazdmUXpiQmpLMm9udm0yWWUwMkhuckJT?=
 =?utf-8?B?TEtsdXYxSXk0QkppRklpLy9qOHZkZmRYZ3VtWWZpS0FYdjBUR2kwVkxVem14?=
 =?utf-8?B?bkZOTy92TlZDZCtscWc1UlE2aEZKMU5zYTJvS29rSkdNN2VURUh3ZENqTEY5?=
 =?utf-8?B?eEJqUFFibXB6TTl0V0ltSGlhaWtkK3ZKclB3T0p1SE0wN0xnQlI1bnlPR3BN?=
 =?utf-8?B?ZFhGLzFDK2pWejRIWHBRREZQcG5hRUxta3YxaENvUGJOSGcxL2ljMmpCVEg1?=
 =?utf-8?B?R2QxTGh2VHlDaFQzemVBQkIrS1c3cUxyMFlyb1NsYVY4UEtTYzNFRE82ZGQz?=
 =?utf-8?B?RGVaWk0ydHkvRFdmdFcreTlvMG5EcTlmNml2S2twVkd1YVFtOTVib084eFdx?=
 =?utf-8?B?R1k5ZzJQSUw0b200ekFmVXFVTi9KMkV1SVJZUSt0d3RaVStZcEs2aFhpcjZv?=
 =?utf-8?B?M2U2QU9sTStkT0czcm44Z0Ezd1FKSHVaL1ZtaTlGcWtVYkxlY0xiUm1UQjJP?=
 =?utf-8?B?bzY1MytRNkU4bFNmRmxaejNpMjNaaWlDN3JjWWVOWG1VVWRONnpiYW1vVE81?=
 =?utf-8?B?angxbU9kUTBDNEFReHdTLzRMTkpwVzZJTU9JMmdXWXNudWdmMHBZQndKQkRM?=
 =?utf-8?B?V21KdVhJZEs1TnBZOVhoMUNqR01pZDJ3T0oybjlQRU9oVk9NMStXMnVCYXI3?=
 =?utf-8?B?MXNBekwwSHNXTDE3VXBjM05JRkIrMkJrS2orNktVS1Z0czR2K2J4SE1xdlNx?=
 =?utf-8?B?VDMya0x0cU5ORkwzZ0hxMmlqblJoekRuM0h1TVJzR1hTQks2WjZlQklPSGNQ?=
 =?utf-8?B?Q1VzcWltR0t1WDhlcVJLdW5Ya1M1V3dPcStDQjNNU0FwOEtYb0M2cmZob2VV?=
 =?utf-8?B?WjhkdFFwVFVmLzdVeXJaZXNEcmZTczRHSEozS29BSXF1QlZmMmJDUXNScDVW?=
 =?utf-8?B?TFE9PQ==?=
Content-ID: <AC6D1AEC3A3E6A48B162046F1A198EC3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f57b34-f85a-46c4-fda5-08da8ab0e325
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 17:55:55.5516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnAqo4xPxY014J2DU/t+mBlMCaYJG7N0bwC7oRkwoEmkGXgzLAIq0NxUdyAG+WYP4arYv04GZgeQsb4yMEZZy4C12O87WbOwBJNUQjH0u0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_105558_879340_A60824AB 
X-CRM114-Status: GOOD (  16.42  )
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

On 30/08/2022 18:47, Krzysztof Kozlowski wrote:
> On 30/08/2022 20:35, Conor.Dooley@microchip.com wrote:
>> On 30/08/2022 18:30, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 30/08/2022 19:59, Conor.Dooley@microchip.com wrote:
>>>>>> w dts were
>>>>>> needed so that the gpio-hog could be set correctly. Out of curiosity, I can
>>>>>> have the same compatible in multiple devicetrees right? In that case, it
>>>>>> would just be "aries,m100pfsevp" here and I could put that in both?
>>>>>> Would make things easier..
>>>>>
>>>>> Depends, but I would say for this case rather not. The compatible should
>>>>> identify the board. If the boards are different, one compatible should
>>>>> not identify both of them. Imagine U-Boot (or something else) trying to
>>>>> match the DTS.
>>>>
>>>> It is the same board though, the way the bootloader works is that if it
>>>> detects an SD-card it will use that to boot from, and if not will fall back
>>>> to the emmc.
>>>
>>> Wait, I might miss that part. So this is exactly the same hardware with
>>> the same SoM/SoC, same eMMC and SD card, except that one has plugged
>>> this SD card (as it is hot-pluggable)?
> 
> Then two thoughts:
> 1. It is indeed one compatible because it is exactly the same hardware
> (I don't consider plugged SD card as part of it, just like plugged USB).

Cool.

> 
> 2. Then I don't think you should have two boards in the kernel. It's
> fine if bootloaders have two of them or to store an overlay in the
> kernel or somewhere. But two boards for the same board differing by
> hot-plug setup is not for Linux kernel.

Fine by me too. Easy enough to sort that out in u-boot or w/e (and do
whatever suits in a vendor tree).

Thanks Krzysztof :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
