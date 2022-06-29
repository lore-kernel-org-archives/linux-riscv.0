Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BF9C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH6S55L9fbHPLUDSDi7Q4hVJVs6UCxq18xd4W+EubZE=; b=MpQu34IIEBHFZa
	xAZJi3O3DOYYTS1K4AXVZtZTG/Ytq4FJUB7uQ9nlnquy1PFMKqENDVM8ot97QmJyRHt5Yvr7srZCb
	d3kYofCjk62zx8CgDjOxmn4gW9eoVEBUAaY0zISoQ7zbAbOxaaDUkAmxwzmrMrRn3vzurRSTHoCz5
	UMqAtRofeOi+3CDfzE5UJTepRqmkBxljFszGrSLM/bOUCfdQ63dvezWzwKNkyatVF1CAUEk7hUjug
	UBtjjh4fIWebuzTRlC5moq+GflYo1BPtHGESdKolS4VriG12sz5QBW/VbB5MAXp+CW69SkiYIkKdy
	6153e3aYKdZ2jRse+/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bou-00DGEb-NI; Wed, 29 Jun 2022 17:49:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bog-00DG5s-6s; Wed, 29 Jun 2022 17:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656524970; x=1688060970;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0dzmVzP2M9KrIiqyIpUnOu7xEeb/0zaVT7pQk/U85pk=;
  b=dp0ZS9xT1KHCqKyMefMUc5TVOU5xr6a/97s1KbsMN3RkwDyeYbs+Wswd
   HjwpnhFxh5NKe2t3dx+5fIZcEWSAzjKtNNdRuAzmHpcq37LB7+lAPsRI5
   gioPPQKydywKcGiFpJKJ9TqpZvJZUDR4Ojk5SxfNs6W/jHO0/RZstsPG6
   c3mNgE6bRu2MNXI2hGCpcmlS0fe/+cLCawOepK4soCuNpDrZlXtgMcheZ
   hfWLy06OX1tZwYGqBDypVHqqgkugX5B08D2GCUnPMQoaPgGickB1hqv79
   YwspXisv/RIRAbPE/LIyTrXtsFeU4uPI9QX5VNH1Ii3WskFiV6JeUm8hQ
   A==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="162630032"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2022 10:49:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Jun 2022 10:49:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 29 Jun 2022 10:49:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvppErm8KZZzobj5Nryxnqa0cLqc+483iWOIViPi2XxKWrcgacu8nkaefmNSnBKKIf2TVTWfJMFS4XI9te7/k9Jep0pXV1XNyMtu9DWm7kjJoH9qG/PoV8WFY6bMx0krUI9/NWp8T8vWQYxo1o1QR00t+KvGtzUCjoRKweza0rpF5fZCylm+c49Qm2QiEwp155cfNimcUnAqyZ1F6OabHZ3QKqseiG6pQjll2ob63bVyfsm1oSkaqWQ2bysbkU+25B6+VCOEGAXQ1yNmK09KcL74B/wy5WEUXqao/2Jl+YDh9dH+7Yeposyua+ZTXXkNeIbZMs8NfiOrCIW1/aXRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dzmVzP2M9KrIiqyIpUnOu7xEeb/0zaVT7pQk/U85pk=;
 b=eUTp+Ge2n4AqSXjSIfj0NKlQMcbv+VNKrS+jttqPhshYtbcA81O5dI0GULFgjk1pTgU6RmThqBIeGpYz9ZVeQPF+xwv8NAplE95XHEI54Z3vmu97OVyXSEQHqsvPo5p8HNZuBUiQxTYFkNX/jk/qG/nn2o3O+W4qV6w9nhYSBni3MUE0n7PEhBXMJf5YaK14GlZ0dqaeGXv43A/9qiMJC4pL34lctfig4t/REhabUxFAZmvNF/TiRCTKnbXMIIT9noMPeugljVMHR3QxTlMjF6NzqKlYpFzN0r98tzvlKcGOJH6Znbm9W+uu3a3F9y63vLRFmeQ3rwwZefHf2QUw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dzmVzP2M9KrIiqyIpUnOu7xEeb/0zaVT7pQk/U85pk=;
 b=DAOL6z/hSTOuG40jV0z//0+jIGGJfmA7GFW7uIRbeR5XVed6GGJdd/iQqTXBtYZZp83BIk1EPstcDIL6oG35AFJYFD4rEOnS8RHPrA7vf/eY7amPMlcjSQv6cedIJxY3hlyrZSnbu+HBDwGpYB7RcoKH0n4r4UFxYOB4T4wvAps=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2091.namprd11.prod.outlook.com (2603:10b6:4:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 17:49:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 17:49:21 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <atishp@atishpatra.org>,
	<atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEA
Date: Wed, 29 Jun 2022 17:49:20 +0000
Message-ID: <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
In-Reply-To: <20220627165047.336669-10-sudeep.holla@arm.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5cdbbba-34f4-4e59-0225-08da59f7b25a
x-ms-traffictypediagnostic: DM5PR1101MB2091:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8OL6pH+bJ0uSkmMPWWHKuyhtD8xV6e2gLshDvdrh9iORkOCgXgZoDDR8VmHpLDys64aI0jc4ETTiJ7m1IXtaKquhYd7/h7IlT0j2ZKdwdJyFj2eC8HXWwKS2d13hnLmK/vApU/+cSXGlOhW1CyrNQsbbp315ui8g9Ffm8K6X+dZV2T4BwHYa7UlGFj5e2h6OO4HYFKs9AEVmb27BWr4oqp7WMk7E7lvaQKxH28rAWe8WfO8Su0Mj4al/VYpBVDU8iXa7+8f/HtrCorrv0/wwDbLJQgjfOLrxAlsJYTvLm/TPm+oYkRpewtibnevZe56OjohblF+yYcH3b3eLG4vzsRpyAuMhYiAPOYm63wzJjcA24dN+HiBj1pAzOLiqXx4Vs6m/mGWXe9/ODKDyyPnyn7jAThiIYWbKlddcYB5RRcg82vp4bEsWx8zFtsq9Zm0nHd4CTowdwdBZFf3FpHwneT9ltn4wB8b4VepNhgeW7fOe7WYXKJi32wYWPny067/FOrOakMV88cQqZL17tApl9F7lg6Qijxn2QrvAZ/NQEwapXH9IbO2lsHgI9lquulLTUzuQQ5B+bU8usKvBIR7CBZCYVpCergBMzph/smgZRwW2iuG2eC+MWrlAK56WGvoOLoZzwv1xAa2AOsgiLX6mUhodcFbLAENkTbjXr1hJhSA+ZMmDCRaenmzZ5oYTKUTNNsls8p6+I0q2IhEf86aFcXffCXodQfKAgWgY7Epvz8TYQMPhcSTdifXDbxZWMlb3RKkWiwfb9NHOixKx3nUktmSE9N9LfVMwHgaz4FlNjwx0qdgt6gA4WLNwVbD+5RCwcqWuZ7R5THTIj0yuKqZztEeBdZ9wYReIkmuh3RXol+YuK+QQjXNrDRHHi9uVby8M1K2jGu6u1wU9zDWqi1/CHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(366004)(396003)(346002)(110136005)(54906003)(4326008)(36756003)(66446008)(966005)(107886003)(41300700001)(26005)(2616005)(71200400001)(66946007)(31686004)(186003)(8676002)(478600001)(38070700005)(6486002)(6512007)(2906002)(5660300002)(316002)(6506007)(7416002)(91956017)(83380400001)(122000001)(53546011)(76116006)(8936002)(64756008)(86362001)(66556008)(66476007)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXM0d3B1VTgyMStPTHJTWTlOblptYXVnVlZQRnduVVM0VnBUL1JuaG4xckpQ?=
 =?utf-8?B?dFZNWWVLMTdFS0JYQzNCUjlsUTdPT0NXaldYS2VnNUlKcmk5U3FLU1NZU1RD?=
 =?utf-8?B?Z212bjBhdTY1bW8vKy8zbnpEc1NsY3c0UHVpLzBpUVZobmNReDgrblQzMkRH?=
 =?utf-8?B?UTQwSkpaRXlQT1dJcUV6dzMvRTZYRlp6UnNib0V2eFhLZlFRMzJHdEJ5WHNz?=
 =?utf-8?B?dkVJV0REL0NTY0UrMFptUUJSQW1oOGJVUnBtOEUxbTlOZzgvTmlXRGl3MENE?=
 =?utf-8?B?ZWlXdU52ZEhEdHdERE9iVlhSN0kvMjFPVm5JQm81Q1M5bDYzR1ZUQVlGek5O?=
 =?utf-8?B?c1FUMGcyeHBlc1RjOHh2cDdNQmY1cmJJSlNqaUgvNzJySnRrMzZlZ25qa3Jq?=
 =?utf-8?B?TkJjcHI5S2xSVURKcmNiY25Yd3FnMzhUWWdyYmdUNklpT2w2U1dSNFB1T1Bs?=
 =?utf-8?B?bytKMktVT0VyUkpEYnZIMVluZWY5NVpkaTJ1d1B4ZFRvQmQzb1B2NjAwdnpH?=
 =?utf-8?B?SHQyVTFZOXl2VlFKek9SRG9LcDV1K3djMUxhUzlwNWs0MWQ0VmxXTnFnNjRI?=
 =?utf-8?B?VG5ldGg3RU1PMXloRkRlQnNjanFUK1FQZGRub3BqTEtiZFYxWVJCcHFlZ2JG?=
 =?utf-8?B?NS9uNU1udUN5QXorNUp0OVlFd2w1RU5kengwQ2lDRC80Mi9aYkFyOXhORHpS?=
 =?utf-8?B?Tk5IRjgwbVRzUlhUOFBGQ2xYZEM5UHBsOVVaQytNTW02Y2Z2QXlxMnFEZUI1?=
 =?utf-8?B?SHVKRDFxVHdYWHdZNzNBR0RWUis4MGs0TDZ6K05jL3hEdWxCMXlpWkgvMStz?=
 =?utf-8?B?clR2YmYyY3kyazZCYllCcEFiR0FubUwwTU8rMVFNMWxteUdlMSt5VWJMcGgv?=
 =?utf-8?B?TjNpTEpza3FCRVRZV21UREp3OTNxOC9pUGdudWFiWnNQRmd2cnFWQmxmRWRT?=
 =?utf-8?B?emF1eVFENTFoS09uZ2k0T2c4UFQzM2VYVXJWKy9ZclFPVm9hYWxGZTV1VTUx?=
 =?utf-8?B?VnBwTVE0a2lRZjQ1S1JkdlJFcFh5U0JScGFJR2t1bkVRZitaRStjTmQ5VitG?=
 =?utf-8?B?cTdKdEhvS0VQcWgrcGhPaUw0M2VYNVJ2dHJOczlwYm9XaVBmN1VkZUZOajV4?=
 =?utf-8?B?WkNxTzNEL1lUTFRPbkRCSmJtd05RcGJaeGNNdjVlaDQ0RC9ieTJnT25sMW95?=
 =?utf-8?B?cjJnUVhUdGxpek1wbnE4UDh1NWNkK3V6NjNZeHljcklGcFc0YjhZaGhOclh4?=
 =?utf-8?B?Y1g4Unp2Mm5TaTdPOExWYjdWK2pSd05obzNVZ0Z2cUp2NTQ0QXVQODNjOXhM?=
 =?utf-8?B?UzloYjN1U09rYlNwSE5TQytLVTVMU1ZJZ1g5bzRqdFNnSnZwWUdpVzU5VmVm?=
 =?utf-8?B?N0FzeTdaTmZCejUxQ29LaDJTRXBpUlR2MngzMDRMQi84a1BiMHZsb0E3bHEr?=
 =?utf-8?B?YXVWdVpvczRiVlEzM0dCVDJJRmx1VXhvRFVsTFVsZFovcUlpb2xMQ2xKZnRX?=
 =?utf-8?B?bUxsRy9RTitGZm96K1dkVENrWUlhYXpYalRaUVU0Ty9XQzlvYkRCdVJ6QXhi?=
 =?utf-8?B?MllwNlU4bEZBM21mSGl6SmNiMmh3QmhLNjgydU9rKyswL0dTSDNaTWx1RTVF?=
 =?utf-8?B?TElWckk3MG1IWHpJeHlOU2l3a2cvNTJXYVk5SFZjK2Z3WmdUSDVQTm5uMUNF?=
 =?utf-8?B?M2xNNUE0d2xjRmllUks0dzV3WnBkQVptUzhSWjJ0WFlIaW5CSkFKbXFtZWli?=
 =?utf-8?B?cW9XMkFSZHBtT2F2Nngwa3orS09lM2NRc1Y1aGVqaGJzeEZpVDVQa1BuaVIy?=
 =?utf-8?B?RmJ3aHRqNGtYOEo0b1JLRFRzaFpoSVNHNmtXNUJBV0ljQUxLWnJKRzIzRHFK?=
 =?utf-8?B?THY0STU4a2xVY2RySGVET3ptYSsxRksyR0JDQ1laOE93TU5zSjJsRm81WnI4?=
 =?utf-8?B?c2VFL0lWWFQ1TitRa3BvVTUrNmN6Ums4R3ZGZUNWdEpFZkxQNWhiQXVGamtN?=
 =?utf-8?B?MWFqMUJUMTY0SWs5aVpJREptc09zMnNudERqcVhGcVVWSk9qZHZReFFEaHc2?=
 =?utf-8?B?dHpnTTlDeWN3c1NmTFNLNEY3U01yeTRRY3RvUUpURUV1dGp1NHNMeC93Q1FJ?=
 =?utf-8?B?dHZhYzJmSVlIY05YaW9vMHJpSERKc2NSOHpWS01rR2w0WHJuYjVGdDVLdktm?=
 =?utf-8?B?bFE9PQ==?=
Content-ID: <8E6B8E73D939B945BED3C2BFBCD1F144@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cdbbba-34f4-4e59-0225-08da59f7b25a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 17:49:20.9915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9W6NG6cLZMkNTvNcR0V245r56jPsze3G+WzS0wxKCGlWrAwLAwPosu2SVMJi5f5e0B9/oTl8moG3qTvXBzRgpVjiOwWDmnRsTQ//eB2EYaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_104930_617505_9A4D229A 
X-CRM114-Status: GOOD (  16.09  )
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

On 27/06/2022 17:50, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The cacheinfo is now initialised early along with the CPU topology
> initialisation. Instead of relying on the LLC ID information parsed
> separately only with ACPI PPTT elsewhere, migrate to use the similar
> information from the cacheinfo.
> 
> This is generic for both DT and ACPI systems. The ACPI LLC ID information
> parsed separately can now be removed from arch specific code.

Hey Sudeep,
I bisected broken boot on PolarFire SoC to this patch in next-20220629 :/
I suspect the issue is a missing "next-level-cache" in the the dt:
arch/riscv/boot/dts/microchip/mpfs.dtsi

Adding next-level-cache = <&cctrllr> fixes the boot.
Not sure what the resolution here is, old devicetrees are meant to keep
booting, right?

Thanks,
Conor.

> 
> Link: https://lore.kernel.org/r/20220621192034.3332546-10-sudeep.holla@arm.com

btw, why is this link in the patch? Why is a link to v4 relevant?
Links to both v4 and v5 exist in your for-linux-next branch.

Log:
git bisect start
# bad: [c4ef528bd006febc7de444d9775b28706d924f78] Add linux-next specific files for 20220629
git bisect bad c4ef528bd006febc7de444d9775b28706d924f78
# good: [b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3] Linux 5.19-rc2
git bisect good b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
# bad: [95c758a8899c4e8825a35a62a6f31667991217f9] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect bad 95c758a8899c4e8825a35a62a6f31667991217f9
# bad: [5cbb9aeefe0070b627cd5c5528e6e63701561d57] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
git bisect bad 5cbb9aeefe0070b627cd5c5528e6e63701561d57
# good: [2e6556bae3e453cf27f3fb9c6144080e2a61707e] Merge branch 'libnvdimm-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
git bisect good 2e6556bae3e453cf27f3fb9c6144080e2a61707e
# good: [17efe76af33f6af09a821acce2e2e4e84819d381] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
git bisect good 17efe76af33f6af09a821acce2e2e4e84819d381
# good: [5aeeaf40d31288e8efa6ff2cbd952b13de077aa9] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
git bisect good 5aeeaf40d31288e8efa6ff2cbd952b13de077aa9
# bad: [f64dfa36b325d107d8aca9727410343bd86d37dc] Merge branch 'stm32-next' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
git bisect bad f64dfa36b325d107d8aca9727410343bd86d37dc
# good: [89459a2aef8832f044c8fbbec54b46cec05156c8] Merge branch 'next/dt' into for-next
git bisect good 89459a2aef8832f044c8fbbec54b46cec05156c8
# bad: [24cdefc96973ff1a1f6702470ad91ab019e5fedd] Merge branch 'arch_topology' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-linux-next
git bisect bad 24cdefc96973ff1a1f6702470ad91ab019e5fedd
# bad: [0d71f236f0a1067aba7660d056a9061b5877bf52] arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
git bisect bad 0d71f236f0a1067aba7660d056a9061b5877bf52
# good: [be6ab2e822888b8d9983d670fdabc09d753fd24f] cacheinfo: Use cache identifiers to check if the caches are shared if available
git bisect good be6ab2e822888b8d9983d670fdabc09d753fd24f
# bad: [854a3115f9ec0b889015c6854fbc0c1d69a46e4a] arm64: topology: Remove redundant setting of llc_id in CPU topology
git bisect bad 854a3115f9ec0b889015c6854fbc0c1d69a46e4a
# bad: [3b23bb2573e65b11be8f4b89023296dee7f06c0b] arch_topology: Use the last level cache information from the cacheinfo
git bisect bad 3b23bb2573e65b11be8f4b89023296dee7f06c0b
# good: [2f7b757eb69df296554bd39b0b2b2f4da678c736] arch_topology: Add support to parse and detect cache attributes
git bisect good 2f7b757eb69df296554bd39b0b2b2f4da678c736
# first bad commit: [3b23bb2573e65b11be8f4b89023296dee7f06c0b] arch_topology: Use the last level cache information from the cacheinfo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
