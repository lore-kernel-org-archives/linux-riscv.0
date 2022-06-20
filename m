Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A90C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbSl0g9NuHCSokN+Vu/quOeKzhCfu9P8n/Nf08HkElM=; b=cZ2Fr4eL7Aume0
	70HrgwD7//r8ATEhXjgfJD0jL7mBKNC3Zt2Krv50Lcs1+F7Uf+TdB98Ah+XxF3u1llyJYvj0lQsOp
	8JSSalzseTFQFiCeXw+oBu0/purC11Ml9LEOz3mILYZYOv1idZXvCB1eAoeESUqLMCfV7EVaPhsoL
	pYUv6PSQgxHF6q3KY84dAx6hNkVngH+TlHaJMBdomGUSc11//Yt4AMz+PHybaCoykafiZIn5Ramyp
	EAC7tk9pzUxegG0eAX92YplCe5xTpRItaCIyKzhGtJMDJJiLBhOK7pctk7ZR1sM0JS0bvl0O8UYHI
	l8koE+UT0OhOuJErDm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JYG-001HwM-Ub; Mon, 20 Jun 2022 15:42:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JYD-001Hu6-Ec
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 15:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655739773; x=1687275773;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=H4FMk8TSi2z1Gt40QPfdLRb3v+LfBwU8KnmjTVYKG+Y=;
  b=K1pA63N1bEXikK0l4uC4/BzYd6+5mT5OrbgKzskeOWDUzlU3RQgMJyil
   9VT+effaeNeCFmnLk+k1Rl15f/33nZy8358olnYML+uPuLiiMv1yDvo+B
   z90hrM/YOCLhS7jKkrpIDVdmIPgE67yF8LSGwqXr3bm+fUjIegumHcj1q
   6flSoJJuDevM17dwnj4oHDlp+0gVYv9TFHTTg3qNNDCDnl1kulkz3/Xzk
   OzCjjeuGxA9HXEGZPrwwRwmhiVN4v668ScrFk6cuyhWykiXH/mHoEZZTL
   e65KGULwet3zQNDbVZtuAyJRGUfr2p2wqUMwkZLtCU4kZoUbB+zJyTzFJ
   g==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="100861258"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2022 08:42:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 08:42:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Jun 2022 08:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJKl6DPocBj9dEY2oUFEnJV0zOBI4iQQjU2Q8OpdcqQkReTdid7LY9lMO6WIWwoT/CqxLCSPmhtB/xX/GCwA9qbJdQUSoQsUbeFnu8FaWwOJsh3sCtSIxoCxii/YGcgI2fOl/wpxtakQ4ObxgqVTjWUbnYB+mz/Kpvc3vVeVrMWKsvroML5PpIfMTVi/XsJ2Jd9qptHcRyv6EMs9YYpeyP4PvNQVswc4gy4pLDaRKIYYCVYad1+tCRKz8C/dZnGuHt1X+XG5ME+9I37A4HtplDoUpZL2ZEAoAXR/+lJ0qz8J3XKwvn+c7KX8b6r4lO5XGJ+OqDnTarN28SCV1qoPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4FMk8TSi2z1Gt40QPfdLRb3v+LfBwU8KnmjTVYKG+Y=;
 b=jDyIu107wWp37+cDbGwULFGb+BQZR7uZOU46uMP/UhQqnKCJfE946ePhM9TbTAfQ5uEwIhUIKTm4tZ+EARtzqrp64WP/J1itxrIcqWX97R5mFv+JRMfP/LXekjTGyiMObIdWbPVVYAEzMsg4Onw4bsKj8ixG9/fzmjvNMVXCLaDnweSAp4I8Tm8WuMivIg1a6FeWakNhIjop0T0wwnxne+ckXf72sfgXCCEmPkX4d7qqCEb53Kwc/lq9u/N8wX5beBWAFtBbdA0kArVhDY39QO/okEoairgfkeucgnARF2vTF4gY965Upr7ltZQ7ZHtfufzWzPlVTsJxo6tYHVrUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4FMk8TSi2z1Gt40QPfdLRb3v+LfBwU8KnmjTVYKG+Y=;
 b=IjNoUfwexz+PoEUgId3wD+l7MJ60VKVeWmXvEkaej5/dw47hY43aQEOIKcFcdWutghfX/QnbcBjxRzgFU1cSYI0IS6F2tvmbRNI63BxdS8n1GJIhrLNordGz279DukqZQ+3f8iJE2zQDAPPkjqWkI5AL5AVrI2Ad4bwCuUczEnY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH2PR11MB4503.namprd11.prod.outlook.com (2603:10b6:610:46::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 15:42:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Mon, 20 Jun 2022
 15:42:44 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>
Subject: Re: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Thread-Topic: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Thread-Index: AQHYhJz75cmfv8WW10Se/zFPHweEZ61Yb4iA
Date: Mon, 20 Jun 2022 15:42:44 +0000
Message-ID: <9611eca5-0e38-e64b-58c3-a4e67422e011@microchip.com>
References: <20220620115549.1529597-1-apatel@ventanamicro.com>
In-Reply-To: <20220620115549.1529597-1-apatel@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b79d9d6-04bd-46a8-c410-08da52d384a9
x-ms-traffictypediagnostic: CH2PR11MB4503:EE_
x-microsoft-antispam-prvs: <CH2PR11MB45030167AE8EE2CDC5608B9798B09@CH2PR11MB4503.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GHsHiarrm1dMf3ultIk0IVL9NbkBTRpae1MLFmBht3nKAycYQBI7s0Oxz8HEp+QfjFGdC1QFUsI8FPDPFLfQ+K9ISTiIk/9qk+/W1Gc6+r2OwrriuqVt5vwjT7lR72d2Q3zj3vueDcMDiDjiBlReHSxy4JuJRRBFRmV0tqfmAk1Mg1XPA0fT4i4BhlOMxXItWZZCauDRq/j41TfD53nAay6EWBl513GvY4UKRJDO5EmFqqtLxXkpI6SYRvDyrpbnmINeEKVXaKwXEweRHAwrykHKSWiQDk35VVcKBAOcxB+ioi/Xut9UrSS2WbXwX8wPyi6yE1Zo0LxU2XoTXvyM7E5r8SUo52wrXK6HY5kX0TlAtIEMF6Tbpmf4vLWBsgt7KMYOqNJbJZDVjpzo1GGphSq2NMAtfLGzCRawvJkZIqet2aHD+UydpUe8GvAD/35rsm7I7Vnv56CHFrd1ke+xbHVQ/Xw//MK/bSc1C2FVeg2ELI03ya95GdlbcrJ479hi9KqWJ78dc3m0rbLrN3fVeQ2o+eYSCHGqvehfrYuoZHLtKD1aBHWWrUKkM054e8DXBP9BZNAY0AYb1GSpu+i1nowqTIvodmi+syK3B2UVzzy//MFQacnsuzgl+mDIboxoK3C+NoWIxnBmcY4x0YHUcaPIibsjb3xDOchkmgUzawEmqYeQlD8ZcR1JtTKQCLWfU1AjEprpkjmqkhCBicTpQH7tc93yEN170U+4jv4jONoUmNnMxxJOWNj15agSMctO/HrsdqfgbJ5QUtOZb8fR8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(39860400002)(376002)(346002)(5660300002)(6506007)(186003)(83380400001)(4326008)(7416002)(122000001)(38100700002)(66556008)(2906002)(64756008)(53546011)(6512007)(54906003)(110136005)(38070700005)(6486002)(316002)(66476007)(478600001)(2616005)(41300700001)(26005)(36756003)(91956017)(71200400001)(76116006)(86362001)(8936002)(31686004)(31696002)(66946007)(8676002)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGRIcWNxd0szcXFsZzJDR2JtQWJSbWg5dzI0akdxc0lPK1VnZzhnUVBTaVgz?=
 =?utf-8?B?ZmhCRUo1NFRuQnBZSTM4dW4xemIvTWpRZ3pOaUpHZDQ0OVBVUVlBQ0pNYWNL?=
 =?utf-8?B?ejZraXRpd1d3M213bVdTL05tMHRKNmNhRUJEaFRkaFcwQ0xDT0pPZzdLUWVH?=
 =?utf-8?B?OHRjWGhBOUJiUm5DOHNrbGZKYk5FYUF3TG8yYlh0aWhOd1UzUjB6bG5SY2ta?=
 =?utf-8?B?VzJ5QWxrVzVBVWVyTDYxNDdXMXcvQUJPeFlxRnBYdzNQenlhSEVhQWYwaGsw?=
 =?utf-8?B?MDJjNVhiMWcrbEVHRlRLYXo0VWxaUE5WYUJ6azFJVjN4ZSs2cXBRQnFvV2J4?=
 =?utf-8?B?RDNzWEozL28xQVBJcWZEK1Y1SUtaRzhsSTQ0VmhoZ2s2aFRBU3lBdDJwRkVz?=
 =?utf-8?B?Z3NOa2t0SXMwek56UktOeGk4ZFE2ZFo1MW1tWHpQNDNHUUR6OU50Y1ZwQmZn?=
 =?utf-8?B?RVJqSWM5REhrT3M2Rm40TDd1UzVzWjdXRXRrZTF2emNtMFBBWmdYNjNGNHFW?=
 =?utf-8?B?dENlRENVQTA5RFBIaENvQjQ5SW8xYTZERHVYZ2pPdmRZR1NWdUdIcEtrdk1S?=
 =?utf-8?B?TEtUQ1lLZ0VFak9wQm80TVE2WFM3N1FxNkc2azR1ZnlxTGJqeXJGbzRJL0tT?=
 =?utf-8?B?MjExVUVTNFhCR29RUU1KSmNnbFdhZ1NTZlFwSFNvbDVUT1F1QzhOK3hXQ1BP?=
 =?utf-8?B?eUNmQ0VqemFoTjZ0a0JGeGxJL1JHaVZqdmxpdVFWcUxqejJ2SlRPdzBiNVEv?=
 =?utf-8?B?WHhvbzRDQzVRYms0dm5pZkxIMVF6VFJ0VWdvSkMwZVVJV0dYa0owTHJLRDVu?=
 =?utf-8?B?OU9sbDd2aUp4UFIrcSt3K3hCRzY2a0tHTVd4M0pPQ3BmNmhBdGx1WmVELzJ3?=
 =?utf-8?B?TDdWcnJjcG0yQzVQL2g3dGxuSWJWMTN3bUdZQ1JESVZ3eTY3WjVtemlFbEhH?=
 =?utf-8?B?U2VGQUk0Um52UGJoa1RFY1hwR3hxTUdZekVYVUsyZjk3QU92QXhuSnptR2V4?=
 =?utf-8?B?WkFNSHBPU21HZ2Q2VHlYTHU5cm05M0Y2MWpNczVnYUVLV3lmSUM5emxkekpi?=
 =?utf-8?B?OXRsNEF0a1dQTUlIbW11dXJCTEovbnE4VndFRlk1dXJTbE9qdkN1aUxrT2tu?=
 =?utf-8?B?ZzFIKzczbUEwd0ozMFRET3Fpa050OXhaOHc4MTZzOW43RUYrMWhHNWVyYkU3?=
 =?utf-8?B?ckxYbkFWRG5OWFVaVEhGTTI4NUlEbGZkVEJTLzdtUzRmVENhMEM4dnNjNmYy?=
 =?utf-8?B?Qm16UTk5ZkJuT0hWaGJENlZGaEhoSUh4N3BiV3JSSmYwdjF4WC9lWGxFUzYw?=
 =?utf-8?B?WjhKd1FsTVBRM0RwWHZwMzR2NWM3QzNvc2dIa1R6eUhTRlVFaVFpS08xNE9s?=
 =?utf-8?B?bXpCcHdROUVlcVBrckI0eHJPMWpjbDZPSkhFNWR5aE4yNy92dG1sL1BFVGpZ?=
 =?utf-8?B?Z2JkM1VtU01FWkkxYjdIWmR6c3JVUGtSVVhHa3IzS2VISmtQWE1Gd2kwcnV6?=
 =?utf-8?B?V25aeDlVTy94eExKcFFRRStiTkZURE43UnFaeFM5dW94MWhuYUZuOHEzenpr?=
 =?utf-8?B?T3lrakp6QllNVVMxRDlhbnRXbFVhWW55bmJ1bFk3ajBZUVNJNEwxdm5BWnhZ?=
 =?utf-8?B?MVhvS3FQQjlkY250TkVEYXdJNXcrUEs5bXZsRjFSOVZ6T2E2V1lsQnl6aDJW?=
 =?utf-8?B?ZDcxNThlWWdRRFZ3a3FoSHpYUnk4VkVraXl5ZEwvaHZWelR0eG9QcUpDeklN?=
 =?utf-8?B?aUZwM25MSTZQNVFsbjBWTm5Wa0JQcnBOdWVST1pNOG5GOWxrNVd4WmhKVzEz?=
 =?utf-8?B?ZUJ1aFNsdUFFZVhScE5XbUdqUXdUVG43Q2xxOCtvYVNUaXBsWDdEMU5FMmlG?=
 =?utf-8?B?a1JlbnZpUlpYdmN4MUQreHBSdFMwQkdGYW5hd2xYY0NmMVVNQzZYWVEya3Jm?=
 =?utf-8?B?WWk5NVhJNlQwcXJPVVNQbCtmRENPeG5FNjdYUGMzZGNTSWdlRmh2R1NWOGNW?=
 =?utf-8?B?eWZUcS9ibE91c1NuN05zRnRDUFJwYVB4OHByY2JJaGNjUjlrTmFqWU5hOWRW?=
 =?utf-8?B?TW91enBwYWxiRzRLUVZmR1BiMXBRSmlqbnpRR3RUZGZEb3FuTjBURjgwam5x?=
 =?utf-8?B?S1NzdU81RHViNGN3YW44dzA2cno3STVyb1ZVL2RMbUtqaGdLdlR1UjM3OWF6?=
 =?utf-8?B?SVJMZU5KL2lCVVppSXkwbXBmNVBGUkRzWUg1RTVJRDRJZ1hxWmxHMUJ4bFhO?=
 =?utf-8?B?akhxYWJoeEgvcTdOUnpFZm1TN1YrS0xkOFd1b3JESmdsOTNscTFMTWxNWkl6?=
 =?utf-8?B?VWQ1ZHZ0bXErN0dZcmhTSjRsYWt2MDdOeDFaUloybXU1cGh5UjJrTnhCaHF4?=
 =?utf-8?Q?EgTB3l5adUTxgen0=3D?=
Content-ID: <DB97AF574575564C9EC8AA96BD043167@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b79d9d6-04bd-46a8-c410-08da52d384a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 15:42:44.3173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGWQbTsdXWz0rmx3ms3w80uA/Vq1ic8k71YGojYVS+mm35hwV34Y5kZ3lUJE+kPonZqupEdIxrK1OJ25GncvzrSzKtVIkaJhvibvYw03fdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_084253_881843_1C2FA50C 
X-CRM114-Status: GOOD (  23.58  )
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
Cc: arnd@arndb.de, anup@brainfault.org, linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com, atishp@atishpatra.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey Anup,
Tested it & got back the (sadly boring) 0s that are set in
my hardware.

Two comments below.

Thanks,
Conor.

On 20/06/2022 12:55, Anup Patel wrote:
> Identifying the underlying RISC-V implementation can be important
> for some of the user space applications. For example, the perf tool
> uses arch specific CPU implementation id (i.e. CPUID) to select a
> JSON file describing custom perf events on a CPU.
> 
> Currently, there is no way to identify RISC-V implementation so we
> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..c037b8691bbb 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,13 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
>  
> +#include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> +#include <asm/csr.h>
>  #include <asm/hwcap.h>
> +#include <asm/sbi.h>
>  #include <asm/smp.h>
>  #include <asm/pgtable.h>
>  
> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
>  }
>  
>  #ifdef CONFIG_PROC_FS
> +
> +struct riscv_cpuinfo {
> +	unsigned long mvendorid;
> +	unsigned long marchid;
> +	unsigned long mimpid;
> +};
> +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> +
> +static int riscv_cpuinfo_starting(unsigned int cpu)
> +{
> +	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if defined(CONFIG_RISCV_SBI)

This should be #if IS_ENABLED(CONFIG_RISCV_SBI) to match the
other users

> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> +#elif defined(CONFIG_RISCV_M_MODE)

Ditto

> +	ci->mvendorid = csr_read(CSR_MVENDORID);
> +	ci->marchid = csr_read(CSR_MARCHID);
> +	ci->mimpid = csr_read(CSR_MIMPID);
> +#else
> +	ci->mvendorid = 0;
> +	ci->marchid = 0;
> +	ci->mimpid = 0;
> +#endif
> +
> +	return 0;
> +}
> +
> +static int __init riscv_cpuinfo_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
> +				riscv_cpuinfo_starting, NULL);
> +	if (ret < 0) {
> +		pr_err("cpuinfo: failed to register hotplug callbacks.\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +device_initcall(riscv_cpuinfo_init);
> +
>  #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
>  	{							\
>  		.uprop = #UPROP,				\
> @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
>  {
>  	unsigned long cpu_id = (unsigned long)v - 1;
>  	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> +	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>  	const char *compat, *isa;
>  
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
> @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
>  	if (!of_property_read_string(node, "compatible", &compat)
>  	    && strcmp(compat, "riscv"))
>  		seq_printf(m, "uarch\t\t: %s\n", compat);
> +	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> +	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> +	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>  	seq_puts(m, "\n");
>  	of_node_put(node);
>  
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
