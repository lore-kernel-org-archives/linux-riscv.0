Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D44C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiEJXGC1DMl3TeMd9AU8UGh70H5R+ni+GGwwFONpDUI=; b=HR0aJVtjsDSufp
	AXSJrh7ogEyayDDu7GtHBTTxKzSh8dIpMK2MbV8yZKMVdo6yVRfOqjo0+USg+9OzVevnWQimtArTY
	Ce8vX5rHfqKk1sLNPpHLzLABtYtiYLThdME8sSCMaF1sYx6nZ7eOl9j0NJ7aXIvFNmX9TUc2t6kWD
	SpqQqaQvPyJskjtTBaqT96zlcC9C5sMFxz4JNw1O0EE/enXbxG1FHRCA8me92dACEifBIBuhE2Hg6
	Rk82ZTKuqV9sHynwGD/TQToJTs2y2Mw/wK8pH/SXpXce/W3nhxjo+KgRC1u5jlrIeM443KbRsncs1
	oS42wr8LvudJunsjI7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNeAI-002WY8-8d; Mon, 15 Aug 2022 17:46:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNdTD-001zpK-OZ
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 17:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660582905; x=1692118905;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cXfJbjzjUFPoxdjG0aETm0Eo11krSTw105yNFPSLCJA=;
  b=JzujnIx+4A3ZAJgb71aHBO4Uph79hXnTGaDC2R9+HwCWBXnbnC+cFyLO
   mb9Iw3exu/l7WFgBg0YW58xjNSSUxkYJOY5chHZDaUvQBf4AmMYgooxvG
   CRl8Yha1W1/aNAtWB2L7s77TocNVvDtBB72uJiyBzmAZxDl47Cm1W5Aci
   zWjaIsHmH/Xc7ViAS81dN3gyay32bgGdj0FLqHLG03Vh1yqb0hCLWNxif
   WnDn0gSepRAQft9pz1i/bQ+WFK8PHjIFR0VL3AwUEydmkYd447AyBlTxy
   2DgiwHGOKN1N6yumHquy+V2hlyRsrvUZL6jtdKJcqnhAn7C6hMGPrySHq
   A==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="176299883"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 10:01:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 10:01:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 10:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikFLhInhMM6ITwL0meBmkGCA1W0rET+FB1gGtl+2fydUPgy6pTxxXr1cmQaO+0Ckx8S2Y1FO+bhSJIdA2tDlyfere8ExUvwWG+Mi473K23NVFHt3T6U2Sj+ILiwqVlCmguMtiQlpay+25tPRbXLTfTgypMj8C77xnJpcjmbKya2z+wrj45wZe4On4snHFBiy+kKhsKwLz0BPbCGYojDvVL7TF06NPb1uf38YA02cSwuW47A4WYxuWbTozhuyY5SU7jgalXjaxwplSBjRjNoBilDub+pqOmZwp2KmZrdbgAgyDTr5ZFiPurSaanPmvr0ef3Nb9la90lyRddg0mg9YZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXfJbjzjUFPoxdjG0aETm0Eo11krSTw105yNFPSLCJA=;
 b=SZItvimomeSM1asFI2U3nkenSZs3R/9lLStPhPriXAdt5qyp+BvvIbMTlSSlr3Gii1p7D/UAOl0NeU5tsFBl/ANsyXZmVtHzFNMw+AIbSJjdwtavSLHaFjr+Sx82O3LoqSNq04WfpUTANKnOgjgh+N1N6z6VLYtK6j9KRIiqL5VNu+j3twA//Y/VSLowZqEj0UjAi48eoRf3+eu7zSuz1x+N0yS3tFfgN0OQMJgkyjGdSEyDC4caqhh5LFhTLantyfAXufPRtpT0/HJR0oR67Nc8NKjdtStm/4a2fB2V+fy6xkb2cf3flYyYscHquMvUcCiVBpkMNXPBIoHPRMt29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXfJbjzjUFPoxdjG0aETm0Eo11krSTw105yNFPSLCJA=;
 b=lhdf+VgJZGJz2/1vBxHbBXlkDvmHkEnn8FFQFwCwpt++ZlDo35PNUEMYsqlteNLjssVkMFvUQirMiNo1wRT2EXD5Tig2RG7MVp7wdGakPh1DneGaiNfRM2VwMLJ8WcxZEV1/7Yr2tQ7D+SCuig3CllG2qkI6kgsGbTfIuboUTfk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2706.namprd11.prod.outlook.com (2603:10b6:406:b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 17:01:37 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 17:01:37 +0000
From: <Conor.Dooley@microchip.com>
To: <andre.przywara@arm.com>, <samuel@sholland.org>
CC: <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Thread-Topic: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Thread-Index: AQHYsGUwgMumzpPtekanQb2zMhKHQ62v8GmAgABAKYA=
Date: Mon, 15 Aug 2022 17:01:37 +0000
Message-ID: <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
In-Reply-To: <20220815141159.10edeba5@donnerap.cambridge.arm.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21a67cb5-abc0-44c5-9e01-08da7edfd0fc
x-ms-traffictypediagnostic: BN7PR11MB2706:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AzIcfRBKdmqueRnuaRJEE0M61Ppv4rJDRdB0xxIDPbwo/KfvUE8rwYnTalMFrqtTYucxhlvilRPz5cxb3RfjOmn6sz+s1GCmQ7vyVWM1dSdAyc55H1TJ+QUMQqt6uto+QMUcbT1yyvHvhGJGnsK7920Yek8eQbsI+XhIZtJlzjXO9zn5mNrjzZ29pOP2u9lB28k7g1GhNYFdLheiZ/SdIAWukWclJRs7Logv/5MkXuwAVMrP0pIO9PmXfG0+K8iDiK9yZ7gJ0gMgNoEOi/qXsmBAcRtrLcAfH+Gq7Oq+FaN0K/X8OcIxVvePHWVx8VtlReBIDWXVE8f17dPBiiPROGeppJvEHdl1SH7mqXqE30XEz1EexXlkCdzlZ3aK4aduP63po1Zj8YYmZnmAScRuZUSqUUnGRcWerctkmiE8IH35LdhWymOkJlhSWdDkVRnxU4jH04tCTazIIVvcwZvQ126epYJ/XEwXn/ONC7NnlfOYkdx0KRVHZlIBVpV5u/lIHgMv5ngNHd5UB57E28WLuOe0SLtxMl0PemSjykBvwgLe7U6k7xwVnks7Mkiv54Zz7PhDLx+rL6Vthx7p/VdYbySCnFaTPy+QZ27BIP+dGZ+LZOYS1D49DSxhsJl8cpSMYlJPKOdW6lI+U6Z6q3hTqMji4UknRZ9ywfn8ABJg2h0JnJgLOm83OWT7XsSIdhW2LrUh6puFZ/woI2Rpf3N0TSVGfURKIkVB94vdm1MNgksdQikV0AvkKpcSm6CLOIOjSm6mk1bItBaHIr0ahgcp8OD87g2PKi+UmyLi00xXVQuMPo6jUiWfrv67gniwGCGvqIcjmZ/mWDrLSDq9ePUJOAi3MB4v+W+TbsCjUxD8pis=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(136003)(346002)(366004)(66556008)(8676002)(4326008)(66446008)(5660300002)(76116006)(66476007)(316002)(64756008)(54906003)(110136005)(91956017)(7416002)(30864003)(8936002)(66946007)(38100700002)(122000001)(2906002)(38070700005)(31696002)(86362001)(478600001)(53546011)(36756003)(6506007)(71200400001)(6486002)(41300700001)(83380400001)(6512007)(2616005)(26005)(31686004)(186003)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0FlY1dDc3pvNGhSajR4alJhSXFFcThISVlWZ3dhZWRBeS9JQms4c2NjTEk4?=
 =?utf-8?B?SDZxNVRiT1JmWHNxWE1DUnhyd0cvVDZ0N2xta1ZLT2JqNnlZSlBQY2Y1RDZt?=
 =?utf-8?B?N2E1ejIwRWIrYXNheDQzYXBpSzUwMlB4cnFqRG1iR2c2dkoyMG16VlIvWCtL?=
 =?utf-8?B?NHJ2VGlTeGFYaC9PcHpZeXZhL2xlQ1IzTzdjY2YzS08yYmtvalBucDk5aGly?=
 =?utf-8?B?SWVsOVFocUtSL2xTcHZFeWljaGhhSTFTaGNKOU9KZktnQnA1SFNwVjBCQ2No?=
 =?utf-8?B?RVVDRVdEYjJYaFFWTm5KN1JqU01nRXV3SDVxRk9WakQzM25NRVBlKzA2Rm1Z?=
 =?utf-8?B?bFBjM00rQVRPWDdQYXJOakdPdnFMcUtTOU1MV016VGN5RU5Ud0FRWWx1Nkkr?=
 =?utf-8?B?bXJ0cHkyUjJOb0grbHBocUlaa21TVGJ3VDFhN0JTcDdjL1FxcHJDQVZud0dt?=
 =?utf-8?B?YURJblhpd2ZqZ2xZUEE0c3JOOEsyblltOUloczlzYUU0YWljUlg2dVZoVE9y?=
 =?utf-8?B?Y2gwdVIzT1BmSXYwbW5QcHBSOVloTWYzbEhHdkFCZUVTbTV3ZURsTkJteEJ6?=
 =?utf-8?B?bFh0eFRhaUZkbnRUY1h4Zk1RVDNQL3lLZzZrMkRxVUdFQkI3RWZUdUc0RnNM?=
 =?utf-8?B?OHV1NnRTNEZSdFduYlh0Snkwbm55N3RQcEdRRDhBdmIyTWZvNmY3RlBWMVQ0?=
 =?utf-8?B?VVh6LzNYcFRvZHpOY3BZQXR6UXFTWjY0Y2hNNnE3b2ZBdjZGTml5cTVDSlZp?=
 =?utf-8?B?MkgvV3NQVFdnd3dJVVJlaWFYTGxxSG96TEV1WmtqR2xNanI4bXhwT2ZvRlR3?=
 =?utf-8?B?OE9YTXlJVVhKZ2d4Z2FXemNPODd2Qldtay9IQ1FOL21lbkZHemt2Q05PQUEv?=
 =?utf-8?B?VCtPODQ5aWFoYXE1OEIyZDk0ajF4RlgwbE9ESitRVHlOQ3ZDVU5jYmR3UDA2?=
 =?utf-8?B?NkZlTjdGdmtaRm9DUWNQR0s5VjFROTU0T0pTaVljS2VnZkQyVDhna3QzaHNh?=
 =?utf-8?B?QVZVZVB2bjFsdXl5U2NVYmUwWGQ0ZGkwZTlod0VXVWpUN1RLdThvOU5wNlE1?=
 =?utf-8?B?OTAxK0ovUFltSWNXeVVEZEFPZFJZRXphUEl0cGNFQ3ovRUpzaWk3REpwa2ty?=
 =?utf-8?B?TlpxMEtLak5PcGJrR0E1UDB2L1Ivd29mZ0wydFVXMjZGUTBHV2V1bmQ5RVBn?=
 =?utf-8?B?b2NRbXZQZUwwT2JKWHZ6VmhTNE9GV0NTUTBnZUVnUzJKbXpYbndXRXNEdUhX?=
 =?utf-8?B?OEhyUmVueU12TGJaQ21vb2VKeFlzYTZlWXJ5cm5rSFVMK0VUQ3lqZ2dPelV1?=
 =?utf-8?B?NnNNQ0ttcVRsaW5HK2JUN2pDTmVPQ3A0Rll0bERHcUJkTCszeVdqRTdOSXJ0?=
 =?utf-8?B?UmgwV21TM0ViUW56alF5REgwMFAyTnZ4SXQyUkh6a1FGOGpraitTSTRHQ1g1?=
 =?utf-8?B?YitmY0MvMDRWWkFMZG84OWYxSGE1OUp5d0xCSDl1d2pMVVJ0QkNEampwVzFC?=
 =?utf-8?B?WmlENXNjQ0kvRVBTUEVzTWI3MjJ6dXUwak90VUtmNFpMbWRGekVjRUdoeTlT?=
 =?utf-8?B?UlNqYWNVYXVQZGJ1RncrcWdpTGl0L09DdU04bFJJU2xadWpvM1VtOVpjY1lm?=
 =?utf-8?B?RlpCeWNISEtveDdoVHduRDZWT0J2ODZJN0FCVFZQOVNzM210OXdmdi9LMVVV?=
 =?utf-8?B?VEJQcXBLcTd3Q0FpWThoVU5NMnhkRWJGRkVLUTdJSzVWRzBKN1RZK0ZSaHJX?=
 =?utf-8?B?bzFTOHM5K3o2bU5KTTBVQlZlSVdvamtvdVl0QUtFemxQR2RlWE4rZGxqUHBD?=
 =?utf-8?B?U1RVY3YzZUk1VXRzWjJ3MExNWWhkNzQxZFVQYTFEeEZKNElhbFNsR3FnNmVM?=
 =?utf-8?B?cDJZY0xLVWtBb29Kb2dUWnM1ZEJld3ZrNVpFeGtXS2N5ZXJwTnlVWGRsandz?=
 =?utf-8?B?R3BsQUloRmZPMFVEeCtKV3d0SmM0TnJHVUNmYWErRVc0cjlQQkN5VTh4QVFY?=
 =?utf-8?B?NTYrTVN2cHBjUlVKRGdKS0FyV1dLKzk5VlhDWTJzNnZFY25DbU81UzBlSGFi?=
 =?utf-8?B?RDlIVEpyUDZ3QUJvZU9BcklaL2V4Z2VKZnhhSW5lbUQvSGszWFpvaGpPdlJI?=
 =?utf-8?Q?AGPAY1LnJIjQUOAS+OQSM5WYI?=
Content-ID: <9926C191AB74BF44807A98518A5CDE4D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a67cb5-abc0-44c5-9e01-08da7edfd0fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 17:01:37.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0EnQqXrjsv53A1S/kCYoHXPPeR27ujY9pAe+MDNtNChNBKJTa3BUion4JAXSBsQoqaJKUxYcLc+uPw4kbv7cqccnfWN9YW+uHdlg9CYoOsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2706
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_100144_107190_86D09EEE 
X-CRM114-Status: GOOD (  27.12  )
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

On 15/08/2022 14:11, Andre Przywara wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, 15 Aug 2022 00:08:09 -0500
> Samuel Holland <samuel@sholland.org> wrote:
> 
> Hi,
> 
> thanks for all the efforts in getting those SoC peripherals supported!
> 
>> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
>> one HiFi 4 DSP. The SoC is based on a design that additionally contained
>> a pair of Cortex A7's. For that reason, some peripherals are duplicated.
> 
> So because of this, the Allwinner R528 and T113 SoCs would share almost
> everything in this file. Would it be useful to already split this DT up?
> To have a base .dtsi, basically this file without /cpus and /soc/plic,
> then have a RISC-V specific file with just those, including the base?
> There is precedence for this across-arch(-directories) sharing with the
> Raspberry Pi and Allwinner H3/H5 SoCs.

For those playing along at home, one example is the arm64 bananapi m2
dts which looks like:
> /dts-v1/;
> #include "sun50i-h5.dtsi"
> #include "sun50i-h5-cpu-opp.dtsi"
> #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
>
> / {
> 	model = "Banana Pi BPI-M2-Plus v1.2 H5";
> 	compatible = "bananapi,bpi-m2-plus-v1.2", "allwinner,sun50i-h5";
> };

I think this is a pretty good idea, and putting in the modularity up
front seems logical to me, so when the arm one does eventually get
added it can be done by only touching a single arch.

Thanks,
Conor.
> 
> Or do you plan to leave that for when support for the ARM core versions is
> actually submitted? But I don't think we need any extra *code* for that,
> it's just the DT?
> 
> Cheers,
> Andre.
> 
> 
>>
>> This devicetree includes all of the peripherals that already have a
>> documented binding.
>>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>
>>  arch/riscv/boot/dts/Makefile                 |   1 +
>>  arch/riscv/boot/dts/allwinner/Makefile       |   1 +
>>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi | 900 +++++++++++++++++++
>>  3 files changed, 902 insertions(+)
>>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
>> index ff174996cdfd..f292e31bdb2c 100644
>> --- a/arch/riscv/boot/dts/Makefile
>> +++ b/arch/riscv/boot/dts/Makefile
>> @@ -1,4 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> +subdir-y += allwinner
>>  subdir-y += sifive
>>  subdir-y += starfive
>>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>> diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
>> new file mode 100644
>> index 000000000000..f66554cd5c45
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/allwinner/Makefile
>> @@ -0,0 +1 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>> new file mode 100644
>> index 000000000000..d1429274f22e
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>> @@ -0,0 +1,900 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
>> +
>> +#include <dt-bindings/clock/sun6i-rtc.h>
>> +#include <dt-bindings/clock/sun8i-de2.h>
>> +#include <dt-bindings/clock/sun8i-tcon-top.h>
>> +#include <dt-bindings/clock/sun20i-d1-ccu.h>
>> +#include <dt-bindings/clock/sun20i-d1-r-ccu.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/reset/sun8i-de2.h>
>> +#include <dt-bindings/reset/sun20i-d1-ccu.h>
>> +#include <dt-bindings/reset/sun20i-d1-r-ccu.h>
>> +#include <dt-bindings/thermal/thermal.h>
>> +
>> +/ {
>> +     #address-cells = <1>;
>> +     #size-cells = <1>;
>> +
>> +     cpus {
>> +             timebase-frequency = <24000000>;
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             cpu0: cpu@0 {
>> +                     compatible = "thead,c906", "riscv";
>> +                     device_type = "cpu";
>> +                     reg = <0>;
>> +                     clocks = <&ccu CLK_RISCV>;
>> +                     clock-frequency = <24000000>;
>> +                     d-cache-block-size = <64>;
>> +                     d-cache-sets = <256>;
>> +                     d-cache-size = <32768>;
>> +                     i-cache-block-size = <64>;
>> +                     i-cache-sets = <128>;
>> +                     i-cache-size = <32768>;
>> +                     mmu-type = "riscv,sv39";
>> +                     riscv,isa = "rv64imafdc";
>> +                     #cooling-cells = <2>;
>> +
>> +                     cpu0_intc: interrupt-controller {
>> +                             compatible = "riscv,cpu-intc";
>> +                             interrupt-controller;
>> +                             #address-cells = <0>;
>> +                             #interrupt-cells = <1>;
>> +                     };
>> +             };
>> +     };
>> +
>> +     de: display-engine {
>> +             compatible = "allwinner,sun20i-d1-display-engine";
>> +             allwinner,pipelines = <&mixer0>, <&mixer1>;
>> +             status = "disabled";
>> +     };
>> +
>> +     osc24M: osc24M-clk {
>> +             compatible = "fixed-clock";
>> +             clock-frequency = <24000000>;
>> +             clock-output-names = "osc24M";
>> +             #clock-cells = <0>;
>> +     };
>> +
>> +     soc {
>> +             compatible = "simple-bus";
>> +             ranges;
>> +             interrupt-parent = <&plic>;
>> +             dma-noncoherent;
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +
>> +             dsp_wdt: watchdog@1700400 {
>> +                     compatible = "allwinner,sun20i-d1-wdt";
>> +                     reg = <0x1700400 0x20>;
>> +                     interrupts = <138 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&osc24M>, <&rtc CLK_OSC32K>;
>> +                     clock-names = "hosc", "losc";
>> +                     status = "reserved";
>> +             };
>> +
>> +             pio: pinctrl@2000000 {
>> +                     compatible = "allwinner,sun20i-d1-pinctrl";
>> +                     reg = <0x2000000 0x800>;
>> +                     interrupts = <85 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <87 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <89 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <91 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <93 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <95 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_APB0>,
>> +                              <&osc24M>,
>> +                              <&rtc CLK_OSC32K>;
>> +                     clock-names = "apb", "hosc", "losc";
>> +                     gpio-controller;
>> +                     interrupt-controller;
>> +                     #gpio-cells = <3>;
>> +                     #interrupt-cells = <3>;
>> +
>> +                     /omit-if-no-ref/
>> +                     i2c0_pb10_pins: i2c0-pb10-pins {
>> +                             pins = "PB10", "PB11";
>> +                             function = "i2c0";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     i2c2_pb0_pins: i2c2-pb0-pins {
>> +                             pins = "PB0", "PB1";
>> +                             function = "i2c2";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     lcd_rgb666_pins: lcd-rgb666-pins {
>> +                             pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
>> +                                    "PD6", "PD7", "PD8", "PD9", "PD10", "PD11",
>> +                                    "PD12", "PD13", "PD14", "PD15", "PD16", "PD17",
>> +                                    "PD18", "PD19", "PD20", "PD21";
>> +                             function = "lcd0";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     mmc0_pins: mmc0-pins {
>> +                             pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
>> +                             function = "mmc0";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     mmc1_pins: mmc1-pins {
>> +                             pins = "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
>> +                             function = "mmc1";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     mmc2_pins: mmc2-pins {
>> +                             pins = "PC2", "PC3", "PC4", "PC5", "PC6", "PC7";
>> +                             function = "mmc2";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     rgmii_pe_pins: rgmii-pe-pins {
>> +                             pins = "PE0", "PE1", "PE2", "PE3", "PE4",
>> +                                    "PE5", "PE6", "PE7", "PE8", "PE9",
>> +                                    "PE11", "PE12", "PE13", "PE14", "PE15";
>> +                             function = "emac";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     rmii_pe_pins: rmii-pe-pins {
>> +                             pins = "PE0", "PE1", "PE2", "PE3", "PE4",
>> +                                    "PE5", "PE6", "PE7", "PE8", "PE9";
>> +                             function = "emac";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     uart0_pb8_pins: uart0-pb8-pins {
>> +                             pins = "PB8", "PB9";
>> +                             function = "uart0";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     uart1_pg6_pins: uart1-pg6-pins {
>> +                             pins = "PG6", "PG7";
>> +                             function = "uart1";
>> +                     };
>> +
>> +                     /omit-if-no-ref/
>> +                     uart1_pg8_rts_cts_pins: uart1-pg8-rts-cts-pins {
>> +                             pins = "PG8", "PG9";
>> +                             function = "uart1";
>> +                     };
>> +             };
>> +
>> +             ccu: clock-controller@2001000 {
>> +                     compatible = "allwinner,sun20i-d1-ccu";
>> +                     reg = <0x2001000 0x1000>;
>> +                     clocks = <&osc24M>,
>> +                              <&rtc CLK_OSC32K>,
>> +                              <&rtc CLK_IOSC>;
>> +                     clock-names = "hosc", "losc", "iosc";
>> +                     #clock-cells = <1>;
>> +                     #reset-cells = <1>;
>> +             };
>> +
>> +             lradc: keys@2009800 {
>> +                     compatible = "allwinner,sun20i-d1-lradc",
>> +                                  "allwinner,sun50i-r329-lradc";
>> +                     reg = <0x2009800 0x400>;
>> +                     interrupts = <77 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_LRADC>;
>> +                     resets = <&ccu RST_BUS_LRADC>;
>> +                     status = "disabled";
>> +             };
>> +
>> +             codec: audio-codec@2030000 {
>> +                     compatible = "simple-mfd", "syscon";
>> +                     reg = <0x2030000 0x1000>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +
>> +                     regulators@2030348 {
>> +                             compatible = "allwinner,sun20i-d1-analog-ldos";
>> +                             reg = <0x2030348 0x4>;
>> +                             nvmem-cells = <&bg_trim>;
>> +                             nvmem-cell-names = "bg_trim";
>> +
>> +                             reg_aldo: aldo {
>> +                             };
>> +
>> +                             reg_hpldo: hpldo {
>> +                             };
>> +                     };
>> +             };
>> +
>> +             i2s0: i2s@2032000 {
>> +                     compatible = "allwinner,sun20i-d1-i2s",
>> +                                  "allwinner,sun50i-r329-i2s";
>> +                     reg = <0x2032000 0x1000>;
>> +                     interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2S0>,
>> +                              <&ccu CLK_I2S0>;
>> +                     clock-names = "apb", "mod";
>> +                     resets = <&ccu RST_BUS_I2S0>;
>> +                     dmas = <&dma 3>, <&dma 3>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #sound-dai-cells = <0>;
>> +             };
>> +
>> +             i2s1: i2s@2033000 {
>> +                     compatible = "allwinner,sun20i-d1-i2s",
>> +                                  "allwinner,sun50i-r329-i2s";
>> +                     reg = <0x2033000 0x1000>;
>> +                     interrupts = <43 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2S1>,
>> +                              <&ccu CLK_I2S1>;
>> +                     clock-names = "apb", "mod";
>> +                     resets = <&ccu RST_BUS_I2S1>;
>> +                     dmas = <&dma 4>, <&dma 4>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #sound-dai-cells = <0>;
>> +             };
>> +
>> +             i2s2: i2s@2034000 {
>> +                     compatible = "allwinner,sun20i-d1-i2s",
>> +                                  "allwinner,sun50i-r329-i2s";
>> +                     reg = <0x2034000 0x1000>;
>> +                     interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2S2>,
>> +                              <&ccu CLK_I2S2>;
>> +                     clock-names = "apb", "mod";
>> +                     resets = <&ccu RST_BUS_I2S2>;
>> +                     dmas = <&dma 5>, <&dma 5>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #sound-dai-cells = <0>;
>> +             };
>> +
>> +             timer: timer@2050000 {
>> +                     compatible = "allwinner,sun20i-d1-timer",
>> +                                  "allwinner,sun8i-a23-timer";
>> +                     reg = <0x2050000 0xa0>;
>> +                     interrupts = <75 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <76 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&osc24M>;
>> +             };
>> +
>> +             wdt: watchdog@20500a0 {
>> +                     compatible = "allwinner,sun20i-d1-wdt-reset",
>> +                                  "allwinner,sun20i-d1-wdt";
>> +                     reg = <0x20500a0 0x20>;
>> +                     interrupts = <79 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&osc24M>, <&rtc CLK_OSC32K>;
>> +                     clock-names = "hosc", "losc";
>> +                     status = "reserved";
>> +             };
>> +
>> +             uart0: serial@2500000 {
>> +                     compatible = "snps,dw-apb-uart";
>> +                     reg = <0x2500000 0x400>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_UART0>;
>> +                     resets = <&ccu RST_BUS_UART0>;
>> +                     dmas = <&dma 14>, <&dma 14>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +             };
>> +
>> +             uart1: serial@2500400 {
>> +                     compatible = "snps,dw-apb-uart";
>> +                     reg = <0x2500400 0x400>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_UART1>;
>> +                     resets = <&ccu RST_BUS_UART1>;
>> +                     dmas = <&dma 15>, <&dma 15>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +             };
>> +
>> +             uart2: serial@2500800 {
>> +                     compatible = "snps,dw-apb-uart";
>> +                     reg = <0x2500800 0x400>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_UART2>;
>> +                     resets = <&ccu RST_BUS_UART2>;
>> +                     dmas = <&dma 16>, <&dma 16>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +             };
>> +
>> +             uart3: serial@2500c00 {
>> +                     compatible = "snps,dw-apb-uart";
>> +                     reg = <0x2500c00 0x400>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_UART3>;
>> +                     resets = <&ccu RST_BUS_UART3>;
>> +                     dmas = <&dma 17>, <&dma 17>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +             };
>> +
>> +             uart4: serial@2501000 {
>> +                     compatible = "snps,dw-apb-uart";
>> +                     reg = <0x2501000 0x400>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_UART4>;
>> +                     resets = <&ccu RST_BUS_UART4>;
>> +                     dmas = <&dma 18>, <&dma 18>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +             };
>> +
>> +             uart5: serial@2501400 {
>> +                     compatible = "snps,dw-apb-uart";
>> +                     reg = <0x2501400 0x400>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_UART5>;
>> +                     resets = <&ccu RST_BUS_UART5>;
>> +                     dmas = <&dma 19>, <&dma 19>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +             };
>> +
>> +             i2c0: i2c@2502000 {
>> +                     compatible = "allwinner,sun20i-d1-i2c",
>> +                                  "allwinner,sun8i-v536-i2c",
>> +                                  "allwinner,sun6i-a31-i2c";
>> +                     reg = <0x2502000 0x400>;
>> +                     interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2C0>;
>> +                     resets = <&ccu RST_BUS_I2C0>;
>> +                     dmas = <&dma 43>, <&dma 43>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             i2c1: i2c@2502400 {
>> +                     compatible = "allwinner,sun20i-d1-i2c",
>> +                                  "allwinner,sun8i-v536-i2c",
>> +                                  "allwinner,sun6i-a31-i2c";
>> +                     reg = <0x2502400 0x400>;
>> +                     interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2C1>;
>> +                     resets = <&ccu RST_BUS_I2C1>;
>> +                     dmas = <&dma 44>, <&dma 44>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             i2c2: i2c@2502800 {
>> +                     compatible = "allwinner,sun20i-d1-i2c",
>> +                                  "allwinner,sun8i-v536-i2c",
>> +                                  "allwinner,sun6i-a31-i2c";
>> +                     reg = <0x2502800 0x400>;
>> +                     interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2C2>;
>> +                     resets = <&ccu RST_BUS_I2C2>;
>> +                     dmas = <&dma 45>, <&dma 45>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             i2c3: i2c@2502c00 {
>> +                     compatible = "allwinner,sun20i-d1-i2c",
>> +                                  "allwinner,sun8i-v536-i2c",
>> +                                  "allwinner,sun6i-a31-i2c";
>> +                     reg = <0x2502c00 0x400>;
>> +                     interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_I2C3>;
>> +                     resets = <&ccu RST_BUS_I2C3>;
>> +                     dmas = <&dma 46>, <&dma 46>;
>> +                     dma-names = "rx", "tx";
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             syscon: syscon@3000000 {
>> +                     compatible = "allwinner,sun20i-d1-system-control";
>> +                     reg = <0x3000000 0x1000>;
>> +                     ranges;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +
>> +                     regulators@3000150 {
>> +                             compatible = "allwinner,sun20i-d1-system-ldos";
>> +                             reg = <0x3000150 0x4>;
>> +
>> +                             reg_ldoa: ldoa {
>> +                             };
>> +
>> +                             reg_ldob: ldob {
>> +                             };
>> +                     };
>> +             };
>> +
>> +             dma: dma-controller@3002000 {
>> +                     compatible = "allwinner,sun20i-d1-dma";
>> +                     reg = <0x3002000 0x1000>;
>> +                     interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
>> +                     clock-names = "bus", "mbus";
>> +                     resets = <&ccu RST_BUS_DMA>;
>> +                     dma-channels = <16>;
>> +                     dma-requests = <48>;
>> +                     #dma-cells = <1>;
>> +             };
>> +
>> +             sid: efuse@3006000 {
>> +                     compatible = "allwinner,sun20i-d1-sid";
>> +                     reg = <0x3006000 0x1000>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +
>> +                     ths_calib: ths-calib@14 {
>> +                             reg = <0x14 0x4>;
>> +                     };
>> +
>> +                     bg_trim: bg-trim@28 {
>> +                             reg = <0x28 0x4>;
>> +                             bits = <16 8>;
>> +                     };
>> +             };
>> +
>> +             mbus: dram-controller@3102000 {
>> +                     compatible = "allwinner,sun20i-d1-mbus";
>> +                     reg = <0x3102000 0x1000>,
>> +                           <0x3103000 0x1000>;
>> +                     reg-names = "mbus", "dram";
>> +                     interrupts = <59 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_MBUS>,
>> +                              <&ccu CLK_DRAM>,
>> +                              <&ccu CLK_BUS_DRAM>;
>> +                     clock-names = "mbus", "dram", "bus";
>> +                     dma-ranges = <0 0x40000000 0x80000000>;
>> +                     #address-cells = <1>;
>> +                     #size-cells = <1>;
>> +                     #interconnect-cells = <1>;
>> +             };
>> +
>> +             mmc0: mmc@4020000 {
>> +                     compatible = "allwinner,sun20i-d1-mmc";
>> +                     reg = <0x4020000 0x1000>;
>> +                     interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
>> +                     clock-names = "ahb", "mmc";
>> +                     resets = <&ccu RST_BUS_MMC0>;
>> +                     reset-names = "ahb";
>> +                     cap-sd-highspeed;
>> +                     max-frequency = <150000000>;
>> +                     no-mmc;
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             mmc1: mmc@4021000 {
>> +                     compatible = "allwinner,sun20i-d1-mmc";
>> +                     reg = <0x4021000 0x1000>;
>> +                     interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
>> +                     clock-names = "ahb", "mmc";
>> +                     resets = <&ccu RST_BUS_MMC1>;
>> +                     reset-names = "ahb";
>> +                     cap-sd-highspeed;
>> +                     max-frequency = <150000000>;
>> +                     no-mmc;
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             mmc2: mmc@4022000 {
>> +                     compatible = "allwinner,sun20i-d1-emmc",
>> +                                  "allwinner,sun50i-a100-emmc";
>> +                     reg = <0x4022000 0x1000>;
>> +                     interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
>> +                     clock-names = "ahb", "mmc";
>> +                     resets = <&ccu RST_BUS_MMC2>;
>> +                     reset-names = "ahb";
>> +                     cap-mmc-highspeed;
>> +                     max-frequency = <150000000>;
>> +                     mmc-ddr-1_8v;
>> +                     mmc-ddr-3_3v;
>> +                     no-sd;
>> +                     no-sdio;
>> +                     status = "disabled";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +             };
>> +
>> +             usb_otg: usb@4100000 {
>> +                     compatible = "allwinner,sun20i-d1-musb",
>> +                                  "allwinner,sun8i-a33-musb";
>> +                     reg = <0x4100000 0x400>;
>> +                     interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
>> +                     interrupt-names = "mc";
>> +                     clocks = <&ccu CLK_BUS_OTG>;
>> +                     resets = <&ccu RST_BUS_OTG>;
>> +                     extcon = <&usbphy 0>;
>> +                     phys = <&usbphy 0>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             usbphy: phy@4100400 {
>> +                     compatible = "allwinner,sun20i-d1-usb-phy";
>> +                     reg = <0x4100400 0x100>,
>> +                           <0x4101800 0x100>,
>> +                           <0x4200800 0x100>;
>> +                     reg-names = "phy_ctrl",
>> +                                 "pmu0",
>> +                                 "pmu1";
>> +                     clocks = <&osc24M>,
>> +                              <&osc24M>;
>> +                     clock-names = "usb0_phy",
>> +                                   "usb1_phy";
>> +                     resets = <&ccu RST_USB_PHY0>,
>> +                              <&ccu RST_USB_PHY1>;
>> +                     reset-names = "usb0_reset",
>> +                                   "usb1_reset";
>> +                     status = "disabled";
>> +                     #phy-cells = <1>;
>> +             };
>> +
>> +             ehci0: usb@4101000 {
>> +                     compatible = "allwinner,sun20i-d1-ehci",
>> +                                  "generic-ehci";
>> +                     reg = <0x4101000 0x100>;
>> +                     interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_OHCI0>,
>> +                              <&ccu CLK_BUS_EHCI0>,
>> +                              <&ccu CLK_USB_OHCI0>;
>> +                     resets = <&ccu RST_BUS_OHCI0>,
>> +                              <&ccu RST_BUS_EHCI0>;
>> +                     phys = <&usbphy 0>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             ohci0: usb@4101400 {
>> +                     compatible = "allwinner,sun20i-d1-ohci",
>> +                                  "generic-ohci";
>> +                     reg = <0x4101400 0x100>;
>> +                     interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_OHCI0>,
>> +                              <&ccu CLK_USB_OHCI0>;
>> +                     resets = <&ccu RST_BUS_OHCI0>;
>> +                     phys = <&usbphy 0>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             ehci1: usb@4200000 {
>> +                     compatible = "allwinner,sun20i-d1-ehci",
>> +                                  "generic-ehci";
>> +                     reg = <0x4200000 0x100>;
>> +                     interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_OHCI1>,
>> +                              <&ccu CLK_BUS_EHCI1>,
>> +                              <&ccu CLK_USB_OHCI1>;
>> +                     resets = <&ccu RST_BUS_OHCI1>,
>> +                              <&ccu RST_BUS_EHCI1>;
>> +                     phys = <&usbphy 1>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             ohci1: usb@4200400 {
>> +                     compatible = "allwinner,sun20i-d1-ohci",
>> +                                  "generic-ohci";
>> +                     reg = <0x4200400 0x100>;
>> +                     interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_OHCI1>,
>> +                              <&ccu CLK_USB_OHCI1>;
>> +                     resets = <&ccu RST_BUS_OHCI1>;
>> +                     phys = <&usbphy 1>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             emac: ethernet@4500000 {
>> +                     compatible = "allwinner,sun20i-d1-emac",
>> +                                  "allwinner,sun50i-a64-emac";
>> +                     reg = <0x4500000 0x10000>;
>> +                     interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
>> +                     interrupt-names = "macirq";
>> +                     clocks = <&ccu CLK_BUS_EMAC>;
>> +                     clock-names = "stmmaceth";
>> +                     resets = <&ccu RST_BUS_EMAC>;
>> +                     reset-names = "stmmaceth";
>> +                     syscon = <&syscon>;
>> +                     status = "disabled";
>> +
>> +                     mdio: mdio {
>> +                             compatible = "snps,dwmac-mdio";
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +                     };
>> +             };
>> +
>> +             display_clocks: clock-controller@5000000 {
>> +                     compatible = "allwinner,sun20i-d1-de2-clk",
>> +                                  "allwinner,sun50i-h5-de2-clk";
>> +                     reg = <0x5000000 0x10000>;
>> +                     clocks = <&ccu CLK_BUS_DE>, <&ccu CLK_DE>;
>> +                     clock-names = "bus", "mod";
>> +                     resets = <&ccu RST_BUS_DE>;
>> +                     #clock-cells = <1>;
>> +                     #reset-cells = <1>;
>> +             };
>> +
>> +             mixer0: mixer@5100000 {
>> +                     compatible = "allwinner,sun20i-d1-de2-mixer-0";
>> +                     reg = <0x5100000 0x100000>;
>> +                     clocks = <&display_clocks CLK_BUS_MIXER0>,
>> +                              <&display_clocks CLK_MIXER0>;
>> +                     clock-names = "bus", "mod";
>> +                     resets = <&display_clocks RST_MIXER0>;
>> +
>> +                     ports {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             mixer0_out: port@1 {
>> +                                     reg = <1>;
>> +
>> +                                     mixer0_out_tcon_top_mixer0: endpoint {
>> +                                             remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
>> +                                     };
>> +                             };
>> +                     };
>> +             };
>> +
>> +             mixer1: mixer@5200000 {
>> +                     compatible = "allwinner,sun20i-d1-de2-mixer-1";
>> +                     reg = <0x5200000 0x100000>;
>> +                     clocks = <&display_clocks CLK_BUS_MIXER1>,
>> +                              <&display_clocks CLK_MIXER1>;
>> +                     clock-names = "bus", "mod";
>> +                     resets = <&display_clocks RST_MIXER1>;
>> +
>> +                     ports {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             mixer1_out: port@1 {
>> +                                     reg = <1>;
>> +
>> +                                     mixer1_out_tcon_top_mixer1: endpoint {
>> +                                             remote-endpoint = <&tcon_top_mixer1_in_mixer1>;
>> +                                     };
>> +                             };
>> +                     };
>> +             };
>> +
>> +             tcon_top: tcon-top@5460000 {
>> +                     compatible = "allwinner,sun20i-d1-tcon-top";
>> +                     reg = <0x5460000 0x1000>;
>> +                     clocks = <&ccu CLK_BUS_DPSS_TOP>,
>> +                              <&ccu CLK_TCON_TV>,
>> +                              <&ccu CLK_TVE>,
>> +                              <&ccu CLK_MIPI_DSI>;
>> +                     clock-names = "bus", "tcon-tv0", "tve0", "dsi";
>> +                     clock-output-names = "tcon-top-tv0", "tcon-top-dsi";
>> +                     resets = <&ccu RST_BUS_DPSS_TOP>;
>> +                     #clock-cells = <1>;
>> +
>> +                     ports {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             tcon_top_mixer0_in: port@0 {
>> +                                     reg = <0>;
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <0>;
>> +
>> +                                     tcon_top_mixer0_in_mixer0: endpoint@0 {
>> +                                             reg = <0>;
>> +                                             remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_top_mixer0_out: port@1 {
>> +                                     reg = <1>;
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <0>;
>> +
>> +                                     tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
>> +                                             reg = <0>;
>> +                                             remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
>> +                                     };
>> +
>> +                                     tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
>> +                                             reg = <2>;
>> +                                             remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_top_mixer1_in: port@2 {
>> +                                     reg = <2>;
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <0>;
>> +
>> +                                     tcon_top_mixer1_in_mixer1: endpoint@1 {
>> +                                             reg = <1>;
>> +                                             remote-endpoint = <&mixer1_out_tcon_top_mixer1>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_top_mixer1_out: port@3 {
>> +                                     reg = <3>;
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <0>;
>> +
>> +                                     tcon_top_mixer1_out_tcon_lcd0: endpoint@0 {
>> +                                             reg = <0>;
>> +                                             remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer1>;
>> +                                     };
>> +
>> +                                     tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
>> +                                             reg = <2>;
>> +                                             remote-endpoint = <&tcon_tv0_in_tcon_top_mixer1>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_top_hdmi_in: port@4 {
>> +                                     reg = <4>;
>> +
>> +                                     tcon_top_hdmi_in_tcon_tv0: endpoint {
>> +                                             remote-endpoint = <&tcon_tv0_out_tcon_top_hdmi>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_top_hdmi_out: port@5 {
>> +                                     reg = <5>;
>> +                             };
>> +                     };
>> +             };
>> +
>> +             tcon_lcd0: lcd-controller@5461000 {
>> +                     compatible = "allwinner,sun20i-d1-tcon-lcd";
>> +                     reg = <0x5461000 0x1000>;
>> +                     interrupts = <106 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_TCON_LCD0>,
>> +                              <&ccu CLK_TCON_LCD0>;
>> +                     clock-names = "ahb", "tcon-ch0";
>> +                     clock-output-names = "tcon-pixel-clock";
>> +                     resets = <&ccu RST_BUS_TCON_LCD0>,
>> +                              <&ccu RST_BUS_LVDS0>;
>> +                     reset-names = "lcd", "lvds";
>> +                     #clock-cells = <0>;
>> +
>> +                     ports {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             tcon_lcd0_in: port@0 {
>> +                                     reg = <0>;
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <0>;
>> +
>> +                                     tcon_lcd0_in_tcon_top_mixer0: endpoint@0 {
>> +                                             reg = <0>;
>> +                                             remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
>> +                                     };
>> +
>> +                                     tcon_lcd0_in_tcon_top_mixer1: endpoint@1 {
>> +                                             reg = <1>;
>> +                                             remote-endpoint = <&tcon_top_mixer1_out_tcon_lcd0>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_lcd0_out: port@1 {
>> +                                     reg = <1>;
>> +                             };
>> +                     };
>> +             };
>> +
>> +             tcon_tv0: lcd-controller@5470000 {
>> +                     compatible = "allwinner,sun20i-d1-tcon-tv";
>> +                     reg = <0x5470000 0x1000>;
>> +                     interrupts = <107 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&ccu CLK_BUS_TCON_TV>,
>> +                              <&tcon_top CLK_TCON_TOP_TV0>;
>> +                     clock-names = "ahb", "tcon-ch1";
>> +                     resets = <&ccu RST_BUS_TCON_TV>;
>> +                     reset-names = "lcd";
>> +
>> +                     ports {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>> +
>> +                             tcon_tv0_in: port@0 {
>> +                                     reg = <0>;
>> +                                     #address-cells = <1>;
>> +                                     #size-cells = <0>;
>> +
>> +                                     tcon_tv0_in_tcon_top_mixer0: endpoint@0 {
>> +                                             reg = <0>;
>> +                                             remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
>> +                                     };
>> +
>> +                                     tcon_tv0_in_tcon_top_mixer1: endpoint@1 {
>> +                                             reg = <1>;
>> +                                             remote-endpoint = <&tcon_top_mixer1_out_tcon_tv0>;
>> +                                     };
>> +                             };
>> +
>> +                             tcon_tv0_out: port@1 {
>> +                                     reg = <1>;
>> +
>> +                                     tcon_tv0_out_tcon_top_hdmi: endpoint {
>> +                                             remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
>> +                                     };
>> +                             };
>> +                     };
>> +             };
>> +
>> +             riscv_wdt: watchdog@6011000 {
>> +                     compatible = "allwinner,sun20i-d1-wdt";
>> +                     reg = <0x6011000 0x20>;
>> +                     interrupts = <147 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&osc24M>, <&rtc CLK_OSC32K>;
>> +                     clock-names = "hosc", "losc";
>> +             };
>> +
>> +             r_ccu: clock-controller@7010000 {
>> +                     compatible = "allwinner,sun20i-d1-r-ccu";
>> +                     reg = <0x7010000 0x400>;
>> +                     clocks = <&osc24M>,
>> +                              <&rtc CLK_OSC32K>,
>> +                              <&rtc CLK_IOSC>,
>> +                              <&ccu CLK_PLL_PERIPH0_DIV3>;
>> +                     clock-names = "hosc", "losc", "iosc", "pll-periph";
>> +                     #clock-cells = <1>;
>> +                     #reset-cells = <1>;
>> +             };
>> +
>> +             rtc: rtc@7090000 {
>> +                     compatible = "allwinner,sun20i-d1-rtc",
>> +                                  "allwinner,sun50i-r329-rtc";
>> +                     reg = <0x7090000 0x400>;
>> +                     interrupts = <160 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&r_ccu CLK_BUS_R_RTC>,
>> +                              <&osc24M>,
>> +                              <&r_ccu CLK_R_AHB>;
>> +                     clock-names = "bus", "hosc", "ahb";
>> +                     #clock-cells = <1>;
>> +             };
>> +
>> +             plic: interrupt-controller@10000000 {
>> +                     compatible = "allwinner,sun20i-d1-plic",
>> +                                  "thead,c900-plic";
>> +                     reg = <0x10000000 0x4000000>;
>> +                     interrupts-extended = <&cpu0_intc 11>,
>> +                                           <&cpu0_intc 9>;
>> +                     interrupt-controller;
>> +                     riscv,ndev = <176>;
>> +                     #address-cells = <0>;
>> +                     #interrupt-cells = <2>;
>> +             };
>> +     };
>> +};
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
