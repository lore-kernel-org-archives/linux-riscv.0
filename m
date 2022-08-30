Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E317EECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 06:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxUEd1h4FmwBxNkJXkrZ9CnyQp2Ll8WprdvBizq1IBM=; b=M8DRcSfzr6g9iX
	vhVB1XdmeMAzIJWqUwSRNqahmizbGLtrh7ez3xj37h+4lyPsCnUOxgJZox2bXgZzFR0F8nfRPlUtn
	pbG39mkEFNMpsLnxHS/ezq5OdCVg6kGvqsx0R4Mmeal7TsxQd9ZkRdcTwx7dDCS0y2ke8F8bNGqzN
	8K3p27EamzSBeLOc4vf4V+bz9CsVdwTzuAhRhiurC/+XBKKMVwIhLBFzt0tRgGo9/GcikRBeLvjpu
	RqByPpoYFdEqhIuo984SJmOHb6PdhA0q0tDnmN3xfQ0DGHHl/v+d+N003XvpK8NvV9i3G/7wCSaTI
	wFcg7zv9Vnqf0UeWhSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuvo-00EUBh-Pm; Tue, 30 Aug 2022 06:41:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuvK-00ETsQ-HX
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 06:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661841635; x=1693377635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+CFLE7TlR4qNotwXsryvuL7lqQ32jcEvwLIpHWmr4R8=;
  b=thwWywIrvg5do1n/d4SVbD303J9azlYvKoM2Kxqi9tUTgzY12LL/eqQE
   pJFG9kXqZhXVcqihIhxMcDUmEQQXf8UZICXqn/+S6iwkgajuKwupaeu8D
   ZUtDCKbF25uCCy765P67riaFSWh5WLV9a0QUD8sg3VQ9j/plp9pTPZ40f
   kILK7VmCsZODM/HF9qziuDR5/gy8uH5L1yJoervQn6B8q0T/msGzMXeT3
   1Og/q1x4IUOaoXNBoqh37qx3BoCzYFMcqK4Q0mVOfYdUNMZGO0yJD8j0b
   6p9JgnK2yRdMdYmlxkCUoI/S49KxSXIjkNr2i25CQvfsPVI6+NbXAOkbO
   w==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="178257321"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 23:40:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 23:40:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 29 Aug 2022 23:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/BLMAkqX4nQnGWORwWzFYbxqLIEvw//hbxQfOyuWNdsif2znUNREPNBXWJIfDe+iMU++3cS1QOaclJjPE3zs8kmwiNPC36GN0zgH+mR8lZ4uANXrDzqfnI0lxin7+2AhLjDOfm6LJd/CZ751Em77jf7URvcp0LnS5Q1wzUEncdf4d7klz06NUW3p+Tw4IO3Qq0yY73kz59BbhYR+HpN+aWUkFdoFsPc9CnnzmxaBhIwa2BAyTENjw4CIekzJ2SoKtwmXX8fZLibA/USYXvBR3tkwGBVA811k+Aqzf4fvIlkhvvvcXpa5OojDnWDqSpoLAMF87rxZkfA7XUSuV0hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CFLE7TlR4qNotwXsryvuL7lqQ32jcEvwLIpHWmr4R8=;
 b=eieOxqTqLdJU1MptiYlCWUmjSCKIB1f7RPX4T19ybyxnTIYcic71SLF6VIkvnKUBH61kPjxF5Nfd4xuajGjOL/4dN5KIdOOElprh0YcGO5BCBkyFK3/LvUNUElbAGRxdZ3PJZpp/juVruVqwrHRBxpx6baEg8ve7IkgUuTyz5uvcskVcfPZbecaWB0M/OIKKFtRqB5ZrzoLYx8VqfHO1EgKUZ6ll+JaDJFBNd5ncqrCRfJbStQxIZG0AzfjHX/xY2stz6tuph3lekf7KvYgK4n2wpniK7qGdJc9T+9/SAHIt452oxMrnj9agtTaTI7bcKCAe0vEzt+tU8RAy7oMQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CFLE7TlR4qNotwXsryvuL7lqQ32jcEvwLIpHWmr4R8=;
 b=QuFHb1FYEFoGzr9ihcYM0kSt3un5joxRLID0+4XaISXWz41qDhhB7UnbKp2isopIaqYEpaluyM9fmG+R8KUoi48DnEw6q5u9ypgwa0+dHYe/iasgEzfHufpaX3SlKNNtixTJkt9CNQYhXCiFnWBxPuU1w0PhiQuV/UD2rFST4Yc=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SN6PR11MB3406.namprd11.prod.outlook.com (2603:10b6:805:bb::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:40:22 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%10]) with mapi id 15.20.5566.021; Tue, 30 Aug
 2022 06:40:22 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<p.zabel@pengutronix.de>, <Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 03/13] clk: microchip: mpfs: add reset controller
Thread-Topic: [PATCH v3 03/13] clk: microchip: mpfs: add reset controller
Thread-Index: AQHYvDtgRP7/JvC6V0Gr24BMzSA6RQ==
Date: Tue, 30 Aug 2022 06:40:21 +0000
Message-ID: <8726cec3-858a-b0c2-ab26-c1e2d2702776@microchip.com>
References: <20220819095320.40006-1-conor.dooley@microchip.com>
 <20220819095320.40006-4-conor.dooley@microchip.com>
In-Reply-To: <20220819095320.40006-4-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8d48df0-d32f-4ddd-bd74-08da8a52833c
x-ms-traffictypediagnostic: SN6PR11MB3406:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: unalSm4uCn4S2jZ+mPu4EZgIeyYg369uFw48mYQk9YvBH2sgnoVCLY5BPO7nA9VDuhgK42TeOOB5iFnLaFncYvt4S2JXU/1twKbY9BqaZ98WWzfyYq0QvuedXr74EHjAJjDr+jPcqx2NzWXK+dMIGlfeIqqjGkovYPFQDdz2NKVDp3PhfXO1oWSjrjW9pybfE9ZnEC7M8SXjPO5xHWc3xutKg7LuuTd1D1tN3tR+pUCwR+x1W39vxA92nfwOqsO9R1YhxDoQKhGSso/ackqKVEZmgoLWLaopi8apvadgesaZu9sJ+WtVoZtRs50gjiSFzE+TkJQl3WOenpds/OWL/g4ur2lH/+ugFlDEQdhdOV8DiwfHr5OsLVF9XP9Kj3DPBp8Sw+E1YOoibqxVJeZ6TGdfWJbvwOXRaN04OXWhOIM+tG9l8+sem2/BwUNYC7KfveTgUiGJ++KvRkQC1Btx8Fn9hGALCXyzHhakcs7WfTOUQV1MxRCMjzWZfgi8zkgTz+Ls34FYFDM5pIc5QOeY/yeT/nzERC3lhPXo9xOBagiLIWGtV51h8ITQr0UvodQsXyz8sx9D/e7Drxrpe5B4ore872Pzh6LWKYcUBOTQhaHuXrduJ6RE67cXDe6vxXMrpVmgn9IDiioZeFKZR+qdZHwFt7ZyU9imgiMCqlQdBuhEMsK+7sTREn5/J8L6VjzaE++QkI7QJahPjXr54w6Ae9qYjAlURIuWDInU1gYQY0wvY8gzmhG7YbLEqXzFveg7fd1/CsRg4JwRuEkPhW5On+MejsddIY+pC+V3yy3+miTglL2Nbr564v1sFpSLr5iaF3sJQja6R2QiojvgjKGR1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(376002)(346002)(39860400002)(2616005)(83380400001)(186003)(8676002)(4326008)(64756008)(66446008)(66556008)(66946007)(66476007)(53546011)(76116006)(71200400001)(2906002)(6486002)(7416002)(5660300002)(8936002)(41300700001)(478600001)(6512007)(6506007)(26005)(91956017)(54906003)(316002)(6636002)(38070700005)(31696002)(86362001)(110136005)(36756003)(31686004)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0txaFN0dGZzWk1BVWwyMVpDTE5NRkZ0ajQvcW5RMTEzbXpoUmFXWGxKeGpk?=
 =?utf-8?B?VWQraXkvSzZtazI4bDY1M3BYL2s1UG5EbU9YOElmSHRqejBqc1VEZnlLV1d0?=
 =?utf-8?B?cHBac3I2Ym5XWlluUXpJeHNCNGVlbU5IdCsyeTFnak9KL3RqWmlvTXF3VW9p?=
 =?utf-8?B?Q1ZaWDd3a3RtbkoxdEsrZ1IxWWxsQ05ZeFZTdzZTMktlRVp2cGJZcHZ5MFBl?=
 =?utf-8?B?M3pyMmNJMGdxWGVuVElVNnU4b1p4MDVHeld6OEtXNExqSEU3MFowem9IWGJJ?=
 =?utf-8?B?V2lmalF6a0srUWFFQzRaMDJyK00vaEorMWlodlQyNVBXU2xuMVM0bHNrcUF0?=
 =?utf-8?B?NlYyM3ppc2VtT25mU1BlYjRyMk5rMU1rZTlSM0hMdm0zM251OERuWjNvaUVy?=
 =?utf-8?B?TldHbngrdGIzVFlmUFd5MzJxcFdFMWVENEU0TXJhcXd2VmRUY1dhSDcrTGw1?=
 =?utf-8?B?ckZBekhqZUxJclJQTEtLeDZGL2theXVJSlNhVHVGVXJSYXBsMmUyenpCbkZ0?=
 =?utf-8?B?SkVjVG13QWRpS1ZHYVNwSWdhaWFIdVA5TXpRU0gxTGhoNEFrcHpkRFlWbk9r?=
 =?utf-8?B?NCtpU0JZSVR5T3J1VVZsaTJGb3pOOTMzalVybzNnUVQ2eTFmTWh0T2dkcmxk?=
 =?utf-8?B?WHN1Wm9MbkxBZVFSRGRMTDRwdm40Z3NuZEh1Yy9jdVNPN3lpd296ZHowdUlB?=
 =?utf-8?B?ZTBPK0VRSmtqOUFoVFZIL1ZpM0gvV1VrcTZ4QnlmbVIvL3ovUW9aK3YzZUJJ?=
 =?utf-8?B?ZiswUUVFNVN6YUpmL3ozRm9mREVrWXR3SzNtUEpLVE5ENXAyd055OXpOUGNX?=
 =?utf-8?B?RldNYVVzQnhycEt6UGxWWERMbVRvSXI5SVBBdDhqeG5RazFkUzl4dEt4YVRo?=
 =?utf-8?B?b3VVUlI0aXgzWEZwMFhDTnlpUHBZa1JBOG94QTc0Tkg1amN6V2JSWWtYSGJK?=
 =?utf-8?B?K1JGRkY4QUx1eGJjN1N1UVhML2Y1OEZvREdlbmoxU3g4RE1yV3VqZWVqZGJi?=
 =?utf-8?B?M243LzlTYk9qOExaVUlodisyTnNkM0RqMGlDZmJITUlmRVllY1gyWGREN3Fj?=
 =?utf-8?B?ZG5SckpWV2hwMld4ek1kSndVdWVnVDJObDJXUTRsa2FraTl5eVdtWndmVEc3?=
 =?utf-8?B?cUsrZVVXTTdYaTJXbW90c2wwNFhSSlJFNTR3K3dwZ0s1MFNCQTh5Ny80UjRs?=
 =?utf-8?B?ZzRyN3J4UU53QkVpaHNxREJkSVJKZC9DYU9QbUZGYjlxbjZGbkhjNG0zWkFD?=
 =?utf-8?B?NUdiYSsrNmNTdjluWGJLSGpDZSt0RkNUR1FZRjZLUFVwZEFzcGZZeGdpMFpO?=
 =?utf-8?B?c3RlZGxZWGhqbzZCbll5NkkvaFcwM21sTEtZRzZBTjdOdzQ4UytvMXgrdmxQ?=
 =?utf-8?B?ZHE4QzV3NGNqUzMrTUZNcDY5YU1UN0VoMlBGc2t2eStuOENmMDYrWTZvWnFP?=
 =?utf-8?B?RGg0UjdXaDVyTVJmOHlpc2VTZjJLbHkvTmMyWkdRSFVjY0J6NlpKK1NmTHVE?=
 =?utf-8?B?cWZKSW1sRG1JYnNSRzNvSm9qTyswRWlvdTlDRDlFWk1UaFJQVVVFRDR3TU5s?=
 =?utf-8?B?d2k4TkxUanZrdUdraFEvOW9RWUVPWlZWN2JJV2k3dll5TWpHSkpqNWZVWFQz?=
 =?utf-8?B?VmxLRVA4aHRDWmxmL1UyNGdlWjJBUGZ0Wkl6V2U0TEdFU2FsN1haUmoybWxy?=
 =?utf-8?B?VnpoNTdUeWFzczB0MWdqcUtTZHpCU2Q4NVdTcHlnM0tFazlNYXllYVo4UW1G?=
 =?utf-8?B?dWgxVVZFYjU5MlYyQkRMQnFoK2JHN0txbThwdnJQUTBOMUxOaEtqWFJXS0RX?=
 =?utf-8?B?SjBvL1VSV3psOUtWaDErWXlhS2tmdjVTSFhjUkhKeDgweUNKcWhkWXV0V0FS?=
 =?utf-8?B?MGtYeVRPTUxZai9kM3lnNDlaYys1bXAvVXY4amdvdW1pakNUV2JnL1FPaDZ1?=
 =?utf-8?B?YXNXbEZMMFo2MlJMc3JtZjlDaVVJS1J1L3FSaWoxblJ4RTJKOWRLU3Y3M201?=
 =?utf-8?B?Uzd0aUl1SlRmclNOc1RpZXZIS3JwRnZhZWVZRVJMOUJ6Rjhxdms1Yjk2RUx5?=
 =?utf-8?B?SHdpNzE0MFdpS21KS0ZtR2pnQS9HUVVPc1FoTnpIMTgyUE4wNFdDUHRaK2tT?=
 =?utf-8?B?Wm9rNnM2bjM4QjUrQ1ZLaFExUzVFdlJ4V2tIYkFad2t4enhaemRYQWMrbGFB?=
 =?utf-8?B?YXc9PQ==?=
Content-ID: <C74F171FE1DDAE488D4EC0A1292CBB1A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d48df0-d32f-4ddd-bd74-08da8a52833c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:40:21.9781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJAqFOCrCTPLsQsIaK5GwZetl+y4wkbc1c9sHwRDRWP0E02i1JqSkfC/SPOFTWh/+5S7KwEyfdGxaD62xTu1LRUMW4XZgHY3CAzdrj6OEto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_234034_697960_E3464B0E 
X-CRM114-Status: GOOD (  22.33  )
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

On 19.08.2022 12:53, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add a reset controller to PolarFire SoC's clock driver. This reset
> controller is registered as an aux device and read/write functions
> exported to the drivers namespace so that the reset controller can
> access the peripheral device reset register.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Kconfig    |   1 +
>  drivers/clk/microchip/clk-mpfs.c | 116 ++++++++++++++++++++++++++++---
>  include/soc/microchip/mpfs.h     |   8 +++
>  3 files changed, 114 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index a5a99873c4f5..b46e864b3bd8 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -6,5 +6,6 @@ config COMMON_CLK_PIC32
>  config MCHP_CLK_MPFS
>         bool "Clk driver for PolarFire SoC"
>         depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
> +       select AUXILIARY_BUS
>         help
>           Supports Clock Configuration for PolarFire SoC
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 9e41f07b3fa6..1034f7d69660 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -3,12 +3,14 @@
>   * Daire McNamara,<daire.mcnamara@microchip.com>
>   * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
>   */
> +#include <linux/auxiliary_bus.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +#include <soc/microchip/mpfs.h>
> 
>  /* address offset of control registers */
>  #define REG_MSSPLL_REF_CR      0x08u
> @@ -30,6 +32,7 @@
>  #define RTCREF_OFFSET          (CLK_RTCREF - CLK_ENVM)
> 
>  struct mpfs_clock_data {
> +       struct device *dev;
>         void __iomem *base;
>         void __iomem *msspll_base;
>         struct clk_hw_onecell_data hw_data;
> @@ -304,10 +307,6 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
> 
>         spin_lock_irqsave(&mpfs_clk_lock, flags);
> 
> -       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> -       val = reg & ~(1u << periph->shift);
> -       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> -
>         reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
>         val = reg | (1u << periph->shift);
>         writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> @@ -341,12 +340,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
>         void __iomem *base_addr = periph_hw->sys_base;
>         u32 reg;
> 
> -       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> -       if ((reg & (1u << periph->shift)) == 0u) {
> -               reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> -               if (reg & (1u << periph->shift))
> -                       return 1;
> -       }
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       if (reg & (1u << periph->shift))
> +               return 1;
> 
>         return 0;
>  }
> @@ -441,6 +437,98 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
>         return 0;
>  }
> 
> +/*
> + * Peripheral clock resets
> + */
> +
> +#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
> +
> +u32 mpfs_reset_read(struct device *dev)
> +{
> +       struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
> +
> +       return readl_relaxed(clock_data->base + REG_SUBBLK_RESET_CR);
> +}
> +EXPORT_SYMBOL_NS_GPL(mpfs_reset_read, MCHP_CLK_MPFS);
> +
> +void mpfs_reset_write(struct device *dev, u32 val)
> +{
> +       struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
> +
> +       writel_relaxed(val, clock_data->base + REG_SUBBLK_RESET_CR);
> +}
> +EXPORT_SYMBOL_NS_GPL(mpfs_reset_write, MCHP_CLK_MPFS);
> +
> +static void mpfs_reset_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +}
> +
> +static void mpfs_reset_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       auxiliary_device_uninit(adev);
> +
> +       kfree(adev);
> +}
> +
> +static struct auxiliary_device *mpfs_reset_adev_alloc(struct mpfs_clock_data *clk_data)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return ERR_PTR(-ENOMEM);
> +
> +       adev->name = "reset-mpfs";
> +       adev->dev.parent = clk_data->dev;
> +       adev->dev.release = mpfs_reset_adev_release;
> +       adev->id = 666u;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(adev);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return adev;
> +}
> +
> +static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = mpfs_reset_adev_alloc(clk_data);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       ret = devm_add_action_or_reset(clk_data->dev, mpfs_reset_unregister_adev, adev);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

You can just:
	return ret;
or:
	return devm_add_action_or_reset();

> +}
> +
> +#else /* !CONFIG_RESET_CONTROLLER */
> +
> +static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
> +{
> +       return 0;
> +}
> +
> +#endif /* !CONFIG_RESET_CONTROLLER */
> +
>  static int mpfs_clk_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -465,6 +553,8 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(clk_data->msspll_base);
> 
>         clk_data->hw_data.num = num_clks;
> +       clk_data->dev = dev;
> +       dev_set_drvdata(dev, clk_data);
> 
>         ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
>                                         clk_data);
> @@ -484,6 +574,10 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
> 
> +       ret = mpfs_reset_controller_register(clk_data);
> +       if (ret)
> +               return ret;
> +
>         return ret;

Ditto

>  }
> 
> @@ -491,7 +585,7 @@ static const struct of_device_id mpfs_clk_of_match_table[] = {
>         { .compatible = "microchip,mpfs-clkcfg", },
>         {}
>  };
> -MODULE_DEVICE_TABLE(of, mpfs_clk_match_table);
> +MODULE_DEVICE_TABLE(of, mpfs_clk_of_match_table);
> 
>  static struct platform_driver mpfs_clk_driver = {
>         .probe = mpfs_clk_probe,
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 6466515262bd..f916dcde457f 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -40,4 +40,12 @@ struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
> 
>  #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
> 
> +#if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
> +
> +u32 mpfs_reset_read(struct device *dev);
> +
> +void mpfs_reset_write(struct device *dev, u32 val);
> +
> +#endif /* if IS_ENABLED(CONFIG_MCHP_CLK_MPFS) */
> +
>  #endif /* __SOC_MPFS_H__ */
> --
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
