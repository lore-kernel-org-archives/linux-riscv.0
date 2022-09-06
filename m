Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC63ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10EOk5auiROBJ0uCaqtTgg9VjkMEaVr1yG08dsSt8k8=; b=2aKDXcL4DqmhQc
	jO1L/p8Ca90AC0M2OJPo5aC4cO55ytA5NIrg1PezEsrZlpkIM0T5UHinat6qigs/DlXlxp2Ns4Dwz
	KiyF/TPt7p+WxXOJ7VUp78n5C4F6cmOVYbO1fQjD7V4QOkT0uULEwlLdojoWfU5TiI5dHN+7u6VkY
	8w2Jo6J9c0gMuqyi9gw7VNcoWOMxggrQbqJ4/Jpljbr6IhzgHwepsonc1vJrjxM8ysCm9QtDRYcL3
	oS3gnyuz6c3psfRELWvJry+z6Njm/PZGC71AcaJcFQtjT8YTHVJGeZrhEa/KxiGiLLepvpzRaUESW
	VKo6EeAjvIaMC8VGzDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTNK-00Aws8-A8; Tue, 06 Sep 2022 07:52:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTNH-00AwqC-9E
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 07:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662450719; x=1693986719;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bj2z2j2rJ8qKMdq/LIJMEzmthDMjzOh4/wISkjnSTNg=;
  b=TJplxMNGhckeZBMWEbv49f89JKKkBFvmde9+VLUehJ+E01jVb7rNl685
   SQ9dR+ENfDiMH9mWE0OwSIj4TwxyLmrDoCPbjTavF+ahmVFojXoQe1n2/
   jvYB6txOPiOrSs83RQFpARs7pEs+m3eTj9D+e6kMFZnnmYL2hoZIXPaNZ
   DGksfXYdTrkPkd+C2QW0n02IDdeJw9tySb4YXz0g44ZI9QEZy0DsbaJVy
   qpfnSB2BGgczqOVxjj0RAlXlbWBCt7Pn4IstH0H3eBcKbEMcu8j+D11UU
   uJSxY3S/xTZBScHVqqMXNVejrmlfLlTJVnsYLFsGImlClgURN0BMhMNpj
   w==;
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="179298227"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 00:51:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 00:51:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 00:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7kIJqmzKfS+yoi5hYnCU9s4AlwV8XMGcmEeWhhVceXN7Wi+VziJn3q+y7yVBd53PHPFDTpTjQSpB5/U/NqC/WSvLRKUAMUsrvOa10UWCB2XYBCV65MWQlPB7gJekcgv6TLm6bIA5wmZpmSkqstlJ9MOPoVy4FOcjCiS2YWvXU268YqxgrvjlIKY67MjoIjTu8LeCt/0gJhTsQGzD8IhVVnOYba8ejTXeBxDV/lKn4kngLpQVnGTEK4qlat8RJ3hwBQuz3e9NKLpS7MKv4OspbndXk9G2tJ2BnOGuHdlPxqUGvon6kcZEE/RMTVRyzKyT4WH7ftS4sCfVopVi9OR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj2z2j2rJ8qKMdq/LIJMEzmthDMjzOh4/wISkjnSTNg=;
 b=n246uGVdELjXcb5nv2NFuLQvHkcsmHMyP0Gsla8HH75z1u01beUzLQDuwuipbzR0Wcbdl+Q/f3uukdfEuaJt93eQDWJhPmkM/Oxlnk+7GQQe7XCYX5FA28bEglExi3WrMogW+DnijovBK4Y0+Bki8YFR884zgkRACND1USCMaCJ5XeyBlm7vwZ2xLuVS9qYzCEDxQ4JQoXqfkZQbc6rUslDEcwuTX8FdUIhPEvYgnfy+/PhZ0Ba3UgspcO+2JpTEixewqYRNqlxktA+AMuhV3jFOtzeIjaAJZh3X0MVVhXnf7tC89HCRiVZQAxfEomrxr5dKNc0/h+Ti37SeV2yXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bj2z2j2rJ8qKMdq/LIJMEzmthDMjzOh4/wISkjnSTNg=;
 b=LN9IQv7BqcIPnK2kKakJ0/igZidco2SD1xxzNXDH/XrnW04jIBM1kHzzkqexUJEJUjsKj9PhwUUliqQ8gqAGjGJk8xJwQTjud9AG7UiSEiFE4GZH/U75WqtDbACw7586tTSj3IB5N6F24WlQWLOmkYGiMerKW6vb8AeOssu1lrQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3464.namprd11.prod.outlook.com (2603:10b6:a03:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 07:51:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:51:39 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
	<palmer@rivosinc.com>, <heiko@sntech.de>, <anup@brainfault.org>,
	<mchitale@ventanamicro.com>
CC: <atishp@atishpatra.org>, <nathan@kernel.org>, <jrtc27@jrtc27.com>,
	<apatel@ventanamicro.com>
Subject: Re: [PATCH v3 1/2] RISC-V: Move riscv_init_cbom_blocksize() to
 cacheflush.c
Thread-Topic: [PATCH v3 1/2] RISC-V: Move riscv_init_cbom_blocksize() to
 cacheflush.c
Thread-Index: AQHYwcS09SK09TZ3KUqFnsHWW0Do2a3SB2AA
Date: Tue, 6 Sep 2022 07:51:39 +0000
Message-ID: <e2a6cad0-5e8c-a125-4d8d-2c80d5f215c8@microchip.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <20220906074509.928865-2-ajones@ventanamicro.com>
In-Reply-To: <20220906074509.928865-2-ajones@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cac6193-ed07-49a3-c7f7-08da8fdca1e2
x-ms-traffictypediagnostic: BYAPR11MB3464:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IwD8kCt40FnQdj49+WRtEhUbPpVaIlbWl5UPfkiYx/czs0dc7r2e/aqsbrKxQSX3X/p6eYqaZA2eS6KHjE3v28G15AvnWnLo3FJMMLd6902MGKqFneYeVwo4BniN1zPW4CImrVW7puK3z5D1dtwrkIBrYPrv8zbGQW9KG2LqMfpnAcr0r6bqcZ3Sdjdb3u97EegrJiFpLS5n6IZryWTEjpqPF5gqmOCvuKlFawzw2cz5uQVi1V3y1wb03DOU1KV0Bhgtvz4G/EVSkD4HgJNnOBO2cFrX4VvSXFOb3AAbKh6K/FEuFAvXERF6AVkwoS0AsGtvhytaqbgh2Tk/ksB3Q0aOsR8LACmaVLSKp0vYFyUruRPFt/WWUvNFmK/lKAAc7vIOElcig9C1VmGuCN4DNh86OjwpjUh7PorljA3G0YzAu1WLozRJDqLzah9+OdsTioRFQVCnbib1xbvY9yDsa9jtJoYHSHTZrLLYsOluzCxmJ69pE0NInHhobbOBFDDklPKtYPlZoy66+F6MiHNdjHph+tvtqFQN5qcEC1HVCOdTKQO+uai6c4PjthYVKgKuPVfrI3mOdMgZDl3iQ2KBcd/RURXZZz7VvBwCOhOHJBEBTfspGpfAISeN4EmrKhQ88CUYVdF/FXKs04qM2B1epHWxUOOw03XwZPiE6OGFz/BPJBJ5Toxcm/42r4Wrrqlu+Dt8KxgYrK2SBrYYekyDHW8XlkWhhNuc6c46lSkpFznFkIUhxzNF0JRsxpwMeZffEOqElRpzq+QJSTx0prQL75OgbcnQQdIpm78EZvbm9hW9mjRFNc0URWyTQ1bo4lKNe8qPL6Yh8wQuZiRu5Z1EAyZnYNjXGikMj5e9bDyOEwKh9GbSMRlLx8STAaN2F2jIvsRwhhGGVePHhzRK3bAEyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(136003)(376002)(346002)(2616005)(186003)(71200400001)(41300700001)(5660300002)(38070700005)(110136005)(8936002)(54906003)(83380400001)(316002)(6506007)(6512007)(53546011)(26005)(86362001)(66946007)(76116006)(2906002)(122000001)(91956017)(31686004)(66556008)(8676002)(66446008)(478600001)(6486002)(966005)(7416002)(38100700002)(4326008)(64756008)(36756003)(66476007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk5ValdOeHU0VktzYThTZEJVWVFSRllXRjBBeXFRRUFwNlFxUEplSWJJK0RZ?=
 =?utf-8?B?dmZsYWMzMnhOUENZdEVlZVU2Z0VEcTZCaGl3eHpjRWFBTjFWSEJzRzc1Q1Ez?=
 =?utf-8?B?K1kvYy9jTHBtOENwTXJ0ZDhWanZiSldiRllWN3Q2K2JkOHFxRm42UlZ2elpB?=
 =?utf-8?B?azJVcXdRZnRWaGI5L0p2UlZvNjE2SFBjVzdHVVpidGZVRmRkUjNNdjdIUVBT?=
 =?utf-8?B?a0greXBMWXJSc2pqY25zd2Y0Wmlic0R2cFdHa0M1cWhDZUZDSlN1eG1hVi9G?=
 =?utf-8?B?M0xBQzUvem9PMXgyWWw4TUlZUmNRYzAvSFlsMVhYY080N0k4UDArd2VtVS93?=
 =?utf-8?B?bm1UUjZhdzFPMjJGRnlZM0lLMFhOdU4zN1V0SnIweDBrV2lCc2FUTDA1aUJm?=
 =?utf-8?B?azY0OGRjdEU0bVJUR1BybjIvcTdoN2V3ZE52Y1BWd09ETmNPMXROY01DMUx5?=
 =?utf-8?B?dXQ5MCtEQ0ZEVTIzaG1XSWZicEJVc25seVJnRHVTMWQyRXRTKzJlMWU5OE8v?=
 =?utf-8?B?NThyeUQyYUh5RXk1Zmd0T3ZvTExjTEwvSlhlSmZnUEIva0w3ZTF4cjhhZ1B6?=
 =?utf-8?B?VzJqai9xbEZVdWE5S1llbm43cTNsNHNoR0NTVlZjZGdFVnhBSmhQdFM5d1lv?=
 =?utf-8?B?QnRPSGhTUEVtRU8xNU1aMGhSVGVFS2lBZEtkSWdzbmtJdllvNFFtSE5YQzRS?=
 =?utf-8?B?R2h6b0VmeXlvSWtWU01uMWpjSEdXK2hTRUhIZFVhb3ZoNkY4amo1VUsyK0Zr?=
 =?utf-8?B?ZjZ0bS9WQkRxUTV5WVBSMUh4UlFjWnplRWpsTWtVL2pza08wajBNeVlITlBD?=
 =?utf-8?B?d3NqMGJIRDZtbmgwUWh0MDE5YjBITXArb0hHVElKWDRMN2hoT05lTUZIaExt?=
 =?utf-8?B?SGFqOHlXQ2ZzSHFqbkZicS9XNE4vSzhoVzhHZXdFUFo5TlR1SFpXSEd5Y1V3?=
 =?utf-8?B?cUJ2NjdhUEJnTlRVL1Y2ZjJ1REg0a2kvVEZJU2NENE5aU3M5NUNqSjdwQXVZ?=
 =?utf-8?B?bmhodTdOL0UvWGpyZjByOUQxbmNtdWZRdXFiK3h3cFRZYTdPRlJZMTZ5UjRK?=
 =?utf-8?B?ME9Sd29TMzNZaGhodHJjcXJjZ2k1Um1VZUdqZHBZSmgwNy9wSDJKa3NHejBy?=
 =?utf-8?B?dXNQMEF2TDBqeEJ1Ty9oYTY1R1BLNmlvTU9ydUNGQmNRTFcvQmw0TGQ2QmlU?=
 =?utf-8?B?T1JzRlZJOFI4ZDhqQmdFKzdub2lkcmZ6dXlEdCtrV1gxUFlZMCt3RlQxOEhp?=
 =?utf-8?B?eXQzOHhxYU5GOFlGcmgvWUxmRWxqSkV2OG8vbWdPUzJPWVlLc0FMYXcrbVJJ?=
 =?utf-8?B?SWd2ZFJIUG9jSnE3WWcvdXJSUE0rZWZKLy9mbUFBQkhUQ29rbEJiSSs2WHBi?=
 =?utf-8?B?U1RTQXVybVloczJUSk9ib0FXZW5PQyt1VHRUYkFodU1UcnRYZGZlM1BxTWs2?=
 =?utf-8?B?UGh5aHZITnVHdUJBTXU4NVZUN2p4NHFhYmhJM0hpN2QyZmM4ZDhHY0Exelps?=
 =?utf-8?B?L1NnaHJDN0lHbW02T0tWekJTSXhpVEw2dVRSelMvRlZIRkVBKzBqQmFrUlJT?=
 =?utf-8?B?a2NvU2V1a3NVUzFnRW1yMDk3VGMxMVZaVks2RG9Cb1dtdWVGUGVyM3BtYkZQ?=
 =?utf-8?B?d1hyUWZNUm90RXZhNjJDWlZXcFhoVmtlNkJHT3NvclVBMXFrRFByaUxjMGo5?=
 =?utf-8?B?cERML2FHTmhkVEhYSzJIM0lmUVNTYTRXdUoyTS8yVkNEemtqNGpmYWpIRDY2?=
 =?utf-8?B?TDFLUE8yNURvcFRoZk9FWTlOOW5jNFhKMEJFSmk3T1RtMEZ3emd5dzVmTkhE?=
 =?utf-8?B?Q0E4VzVtbW1yS0l4bSswWnpFSVMyMUQrNEV2VFBucGFJbWljN1VFWXBaMXZ6?=
 =?utf-8?B?aXRUdDZnS3pGYmE0MmdOM2k4OUZFL3hsbkU2OXdUTlVkTEFRSDdjZjF6Q2JG?=
 =?utf-8?B?Tm1PcDJicHZmNEg0L2JzTVByMFdWMFNsQlJpRDhPc0JkeWZkQUxqRGJ0dHBq?=
 =?utf-8?B?V0VmRGszdHo4RndzeVAyVWREaitOZlEwWVN0VWkwZ05TR2xQdzBZVUkxN1dU?=
 =?utf-8?B?SkZwK3Q5cVVPMUlqNmxLcDlhc1QxVTlpQnp0bkRBazMrSUl6cW92akNjcHVV?=
 =?utf-8?Q?wlMd86gytR5A++5JcNyiXK0CU?=
Content-ID: <5473F56E51480148B7AC23BB6364BEFA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cac6193-ed07-49a3-c7f7-08da8fdca1e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 07:51:39.7292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7e37fN6/AOvjtPEjY0LF0MWvDNsbawO8EHrO/TNYDV6dij/26hMdDM7OTiOwW+Od7JB1VkMTldGXT80UV2giN9RsMQM0ZtdiNEJoFfkBjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_005159_354273_FD739CCA 
X-CRM114-Status: GOOD (  20.92  )
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

On 06/09/2022 08:45, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Anup Patel <apatel@ventanamicro.com>
> 
> The riscv_cbom_block_size parsing from DT belongs to cacheflush.c which
> is home for all cache maintenance related stuff so let us move the
> riscv_init_cbom_blocksize() and riscv_cbom_block_size to cacheflush.c.
> 
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Carried over from [0]:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

0 - https://lore.kernel.org/linux-riscv/f8fc601a-9c2d-6b20-c2f0-78ba5ef81832@microchip.com/


> ---
>   arch/riscv/include/asm/cacheflush.h |  2 ++
>   arch/riscv/mm/cacheflush.c          | 39 +++++++++++++++++++++++++++++
>   arch/riscv/mm/dma-noncoherent.c     | 38 ----------------------------
>   3 files changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a60acaecfeda..de55d6b8deeb 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -42,6 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> 
>   #endif /* CONFIG_SMP */
> 
> +extern unsigned int riscv_cbom_block_size;
> +
>   #ifdef CONFIG_RISCV_ISA_ZICBOM
>   void riscv_init_cbom_blocksize(void);
>   #else
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..336c5deea870 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,6 +3,8 @@
>    * Copyright (C) 2017 SiFive
>    */
> 
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <asm/cacheflush.h>
> 
>   #ifdef CONFIG_SMP
> @@ -86,3 +88,40 @@ void flush_icache_pte(pte_t pte)
>                  flush_icache_all();
>   }
>   #endif /* CONFIG_MMU */
> +
> +unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
> +
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +void riscv_init_cbom_blocksize(void)
> +{
> +       struct device_node *node;
> +       int ret;
> +       u32 val;
> +
> +       for_each_of_cpu_node(node) {
> +               unsigned long hartid;
> +               int cbom_hartid;
> +
> +               ret = riscv_of_processor_hartid(node, &hartid);
> +               if (ret)
> +                       continue;
> +
> +               if (hartid < 0)
> +                       continue;
> +
> +               /* set block-size for cbom extension if available */
> +               ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> +               if (ret)
> +                       continue;
> +
> +               if (!riscv_cbom_block_size) {
> +                       riscv_cbom_block_size = val;
> +                       cbom_hartid = hartid;
> +               } else {
> +                       if (riscv_cbom_block_size != val)
> +                               pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> +                                       cbom_hartid, hartid);
> +               }
> +       }
> +}
> +#endif
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..3f502a1a68b1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -8,11 +8,8 @@
>   #include <linux/dma-direct.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/mm.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>   #include <asm/cacheflush.h>
> 
> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
>   static bool noncoherent_supported;
> 
>   void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -75,41 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>          dev->dma_coherent = coherent;
>   }
> 
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -void riscv_init_cbom_blocksize(void)
> -{
> -       struct device_node *node;
> -       int ret;
> -       u32 val;
> -
> -       for_each_of_cpu_node(node) {
> -               unsigned long hartid;
> -               int cbom_hartid;
> -
> -               ret = riscv_of_processor_hartid(node, &hartid);
> -               if (ret)
> -                       continue;
> -
> -               if (hartid < 0)
> -                       continue;
> -
> -               /* set block-size for cbom extension if available */
> -               ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> -               if (ret)
> -                       continue;
> -
> -               if (!riscv_cbom_block_size) {
> -                       riscv_cbom_block_size = val;
> -                       cbom_hartid = hartid;
> -               } else {
> -                       if (riscv_cbom_block_size != val)
> -                               pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> -                                       cbom_hartid, hartid);
> -               }
> -       }
> -}
> -#endif
> -
>   void riscv_noncoherent_supported(void)
>   {
>          noncoherent_supported = true;
> --
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
