Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DA8C32772
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1efhXiK+k4770kV5Hzk7dHjCNJGXDoyZtJCHUcQ76ts=; b=orG8zaInQmd5qU
	+N2RlMaFuGdf3fI7k0wmsKpqqahwAUfWpp71pqbhw2RzB0MGizgX7HeqkX0rYNmz09fs7+riQY3g4
	5+CuCKKR6Rr+l7aaI8MSEuzd0LEk0wMVo3kcpRgjeGupoPUfi9PBdmLp60dC5O9OXg/j/cxTn6jbR
	IhIFXEvR4M1WAYxh3z4H0ssRxewRLSXmxe5gzz/+Tn2LM6/xOwMA8F7iwnRUQ1K+uB86vabLyL7yE
	JZUveI7YlCslqQ19w9KIShimxHMly8nzcI2DU6dHxlZp96lFnLT7zP6jlW1ZgHRmbWqhnrt7hlm54
	UIVaqsGXM0KhvcpMvbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7BV-009hse-5z; Mon, 22 Aug 2022 13:09:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ7BR-009hcP-2E
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 13:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661173777; x=1692709777;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gYC33D4d/n5kbQgmjS5V991GFgQQSt1d6IxPCQ4PZbw=;
  b=imwQaryb3yA89fwADAhw/5S7vp8Q8YN1aPDk75SWqENjHrRObnvKxkzP
   IWU0A8B81mkn4S7jTHAjTTGW069JkAnYeHatMpqxwMRt3oM48GmWH46Hy
   xdX2BSdP/DiOftJoNwJeGjm4Uvg6V2Eq8+uETS+iXH9go5NvZ0Iv0ygud
   +cGzybB1UjYcbsTWxzPpZ5tm9bXm54ObO72w69ZArCSQLa0jseLSMlREU
   wFCc/VY4UCzhADM8pFsNrEJ4yCw7Zo8/0GpTiiS09kmUEhzNErm45c0hX
   JpeWEL6rvABjVCfKYwp51cr02UXi5cpqir1HVm3BJ76UvyCPCjziUsvqZ
   g==;
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="170345028"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 06:09:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 06:09:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 22 Aug 2022 06:09:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqxoSK+rM+UW1haFFAd8GbWix3un27lNBN2OlP6tRu9OnO6fVBx54zLHelqJt9ZD1gM/V9N7mxPnHcj6Pm7ra15mzRxSSNqxUAYlV4syegGMCkOWWunjYTEG3clgE3m0x7uTu2l/vZlhmKL16wZSrWfXzBy+ZjZ3Ort4aVXdqhnKUbBaq4SyfLRz6AZEu3+6TxVES6koPMyEE2WqdKdmQC2Y7MAV5Zg7qQU45AJuog1XZxoBhXUE7bgt82jPN0u6feYDxghlJMRHDARtVbOa7jkoJCsiIq3GePD3ZqLXflvdVtzKGsR2mxXuPCRDilwon/vxh4jHHCHSY1wDjBpx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYC33D4d/n5kbQgmjS5V991GFgQQSt1d6IxPCQ4PZbw=;
 b=XgeV0K7ZSJ3tBSt2+30FgT5JNyXKNYMtCnms6otmx5vquOgYMchgrNRlBL7cTZ1JN5RgpY+Fe1LWAVvJhBLDdfrsHNGsKCe1Wq+Lxb81vD7N/pzZh0TkTu5/j48Ls6sIQSBtYg+1Ww3g0zstUAUy6MNzrt3Av6gembcD80dvNxSP/i2y3WHI4EC/7O2qV8KXPE9KVsTuKtbYBlwPPfZQc0KhYuLwFUdiB0szZpJ3Q79S6TOJ0K3M8ly2fECmr5J7tnnoQ9HLHtiY9I6SsbYPOQtATaLWPUrHqnPiLOT9r9S3D8BMaMiQt3kLX9qaZQ4wTTYOwfFxKroPIXsVljU2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYC33D4d/n5kbQgmjS5V991GFgQQSt1d6IxPCQ4PZbw=;
 b=QUtxES5OdQQdYHyzeCvwQT9pqSsut2LUf6EXLa3C4dPeXL5JbfHn87bSLBYVDoisBsYjfxCQkU0GUDlKpPcKOuolDEvInJ2PwvQBR9iFy6bS+mMpR8zOtPRS8gAMO84zt/oa/rxqk5VIwxTpgGxg6xKhhWBijgns9bALCayiQDY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1705.namprd11.prod.outlook.com (2603:10b6:3:e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Mon, 22 Aug 2022 13:09:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:09:30 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v3 0/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Topic: [PATCH v3 0/4] riscv, mm: detect svnapot cpu support at runtime
Thread-Index: AQHYticZnIOyLB/mjkiETDz0y33oJa265HIA
Date: Mon, 22 Aug 2022 13:09:30 +0000
Message-ID: <68abb82e-d865-98f1-2333-dc2f9c9fd56b@microchip.com>
References: <20220822125904.3972860-1-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822125904.3972860-1-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05a2cff7-eaa6-4972-725c-08da843f8cbe
x-ms-traffictypediagnostic: DM5PR11MB1705:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SUoRNhqvfjKGfT4CT4ag5wkWrT3MyWjxQDGVCPRw+cf4jg6SLlXY75ijtpkZNHKAuk4qxzNkq49rPTHmCcVZ9u6YYFcVNwouehooWOHjIkVk6oeTEEvqoC4z/d6Oyrl8lRbpQSJo5928qE5BTE2TNQg8k5IUOlsLc7y6DznVNLIjlrhMPraJtBsgsjmLVmzYohuwlcl36nwIcd+E145FC2WgiZmaEVJialX0jFsvonGHH409dwzVstxufyr7RDPc7hotYTqZoFA1TOWLe55rVc0ylQ1IlUvNfvnBO6mjKYrcimWuZePbvKoF5cqrsb5rbTM1I1EJwqdit+0gWulp+poJNDmNwiq9OtmsPcvn6wP9WMgw0eVbQkB/zJkoc9l66SxwMFOgymos+XkU3uV6BbaT69qqPDURgVWl53ATPap3aVivB+BIppRi0du45VdzLyd4fzew3G3Otl2B9gJUA8DwFv1Cg/aPzaQgjOW1Kn5MOmmCd4fYM746zebOs9OHbT42g/VjoMjCHqrjA4OUlq3d4iJXWJhrMJUGPLWDAYWP3MOsKExL5wzLiMM96Eibk02GInneUAPL3Zf/nGAK23jx/TicXtq2aaiaghScmvDen7zTaHnxYrwr9mIwaM8STrg61rXuqx338ydfJ1Y1QFbXRbrpPTwnf8zmLQMh+Ek4U9pToOEkx/y8vbnEKMYLZOML9R0B/Cp8tgiZMjsQxKrLOGIFOwmvpRtAmoUFfUKVQMXevgYIpEqb2gMPARpgbhhrVGmfkHhArvJLWJb9btU2cpTP6lzj55NNXV+QU+753PlIxPiiCx54dQW8XSnt0deIMJM+YjxuRYTLTqDxlM9hjO+UPsOB436feV7a4I8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(39860400002)(396003)(136003)(91956017)(38070700005)(8676002)(64756008)(4326008)(66446008)(478600001)(6486002)(966005)(66556008)(66476007)(76116006)(66946007)(41300700001)(2906002)(31696002)(53546011)(6506007)(6512007)(26005)(86362001)(2616005)(186003)(5660300002)(8936002)(54906003)(110136005)(316002)(122000001)(36756003)(31686004)(38100700002)(71200400001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVV1VFI5SEpwejkwUTNZOFNpZDNzMDBzQ1o3WmhCYXV1QlNNUUVZYTEzbkxO?=
 =?utf-8?B?Umt1R1NwZER1NURTTnE2MGVnMWUyaldRdlhaay9TZHMwckUvMVB1aXZlaWg0?=
 =?utf-8?B?NUJMMHo0bXViblFqL1hpMEtZVkZrdXBsSlJJcE50cFkzMGd4M0dQZ3NIekxx?=
 =?utf-8?B?bUtkSUNLdW4xUjNFVVNHRXVIeGE5dFZrZXpZUlVpcGhxTjdkQnV3T3FMY0xE?=
 =?utf-8?B?d0ttRUxoRzhabVBaQVVkOUh5eHBqZHlJSzl3eG9QMC9TYVdmc0U3ZTN3WGV5?=
 =?utf-8?B?MXhJSEx5ZXVWZXRLZ3BlVTZqWVJkZm1Ta0hrcm9Ga1BkQW53UGVLQ1AwUXhs?=
 =?utf-8?B?MTA5aWdBaVhIYU9DekF3aGJWSGlZMFhVYXlqa1d1b2JIeXVoVDN6YWN4SUdQ?=
 =?utf-8?B?SWYwRlpLc1hTYm5qeEVmaDhNaGxSY2o1M0VhdjMySkc1eUhhYWVycTE2K3lx?=
 =?utf-8?B?ZTBDcDZpNHpwdHJBZnA4MkhUTko2VW5ibUpuR0xrNFI0bmJzU1NJcUJKWjM4?=
 =?utf-8?B?VXJncGZ3U3NDcGN2VlJud1N1dWxYMVlMY2kvS2ZjL2hCcWRNWDJiVldQNGdO?=
 =?utf-8?B?MlRWdnRFUWV6SWxTcXlvcmpUa01GVjlHY1VYdWFrdlB6NUZOcjNHeVArYXZ1?=
 =?utf-8?B?RnhKSTBxZGh6MUoyQ2p1NTlqUjRVVG50eUw0VmF5VEFza25sUlg5QVYxcTM2?=
 =?utf-8?B?TWdZZTFmejhJUUNtZ1hWWDBOOWc3YnhFMm1KUWc0R1BtSFlFcVVpdi9lQ3dP?=
 =?utf-8?B?dEd6aHlUV3NLR1pvNHpaZTB1bFdZdnMyVUFtZzd0aTczQ2F5bU1aV1BKY1Mx?=
 =?utf-8?B?ZGRvekVXS1J0Zkc5Q1RpbWVjV3IxK09lNlZkeXNaOENDOStndTQxY24xQXF4?=
 =?utf-8?B?bTlhRXIva285RXpoOFFNdEtEWVoxd1VhN0J2SHc0ejFBNVlJRjdVYm8raDda?=
 =?utf-8?B?ckpMdGJOU0lvNFRPY3lRYzZpVHVrbDVtcTVvRkY5RmpkWVVacDJhWlJ1aFY2?=
 =?utf-8?B?M1pwVUNTdEYrSXVVY2xWTjNaQ1NDdmF1ZFV3SjJkQVZWUWhlTWJmRmNGNWdM?=
 =?utf-8?B?MjU1dnlhZVFYbC9LTEFuanRKczJuS0NqU2VxdlFPd3c1T0hWSUxKVzlhZ2tu?=
 =?utf-8?B?TUQ0UWtYS21pQ0JpWGZkL2ZTNjZLaGJFczM1UWx5dk5KVUJoS1h0eTVEQXZs?=
 =?utf-8?B?WlJOemlYdlJrNnlVQXYzSTJlRlBIaTA2emdlS3NqT1ZleEZBbC9Pd3FBcHhi?=
 =?utf-8?B?OU40eCt2cHJ2VjN3bDBTY25UdFdKR0VwcXN5ejlybUtJUkl4ekYxVGtneTVh?=
 =?utf-8?B?WVF1dG8zMnBtbnN4dzF6czJmSDF6bWs0Y3ozUzVERE1ST0YxUmNCTDdSL2Zu?=
 =?utf-8?B?QzNGMnhzU0hteFRCR3prNVZGalM5dXo5ZW9MWmk2a1N1M1FncDl3SmkxUDFW?=
 =?utf-8?B?VmdzZ2RmNFJwcjhXQUJ2cWVEVlJNYTY3c3lGZUEvQ3BENzhXWFRPanFRSGla?=
 =?utf-8?B?TElCN01vS3Z0bmdicW5HUm5xeUJ2VEJxQzdrLzJzbFhMeWZjblQvbGJDbE1i?=
 =?utf-8?B?Z1FWNmJKVGxGNzA2VjkzalQzaVp0MWJDL2FSNWFKZU1EMG93b2lvUi9NczZi?=
 =?utf-8?B?MElQL2dCQXllM0F3MS9DRlJiV1RQK1ZhMTAvYWRmZURXNFg2Znh6dDkxaDlK?=
 =?utf-8?B?QldyQ2xYaWUySlV4ZTlwcWdOM3VWKzNGOEQwdDdpVkFoL1RockZLOU1tMnp6?=
 =?utf-8?B?WGtJRzI4d0hCSUpsS2FMS2NJcFdWdnlqZWx4T1RuVGk4NXJ3MHJEamUrL3RV?=
 =?utf-8?B?OEpCUFJXYnQwd08vOTNxK1llbzRpeWFhb0c0SHp3VFV2STM3ekptWmltSm9y?=
 =?utf-8?B?dXhNWlh1anpvYkZYY2ZoODZ0NWNiVUk3M2g1NkFuZXFVcHNTTUJZdG51bjZ2?=
 =?utf-8?B?aGZBdllURk91R1JyTEZtZHZEQjkwaTlab1dUVkRETnRwZ0dOTkRqUFE4Mk9P?=
 =?utf-8?B?RDlZdlNQa3N2dDRORUhtZ24xUlZqa3ViZk00U1IyN2JBSk9TUy9ZTEVXTEk5?=
 =?utf-8?B?VWNkQStsWjR1UjlyS2dnemt3dXpIVWtuNTV5WFAvRmpHSUIwZUxaRElDaThX?=
 =?utf-8?Q?QsH3sikwALXqUsHMZJA9l1yMG?=
Content-ID: <DC60ED0F04308C47AD5048841E9D2FA9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a2cff7-eaa6-4972-725c-08da843f8cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 13:09:30.4819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Te4+uyTrpsqCkvWgIhxAOY7H8YlTYsV4VkZgu89qTde3xZ8IQWk2od+2jAkCr2aZ+MjjFrFspaI3U4wqHhbtuGn7e2PM2GzxGnvcnUyZa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1705
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_060937_488034_ED4546CC 
X-CRM114-Status: GOOD (  13.91  )
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

Hey,

On 22/08/2022 13:59, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in Linux Kernel's boot process
> and hugetlb fs.
> 
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"Svnapot support". Its default value is off, and people can set
> it on if they allow kernel to detect Svnapot hardware support and leverage it.
> 
> Tested on:
>    - qemu rv64 with "Svnapot support" off and svnapot=true.
>    - qemu rv64 with "Svnapot support" on and svnapot=true.
>    - qemu rv64 with "Svnapot support" off and svnapot=false.
>    - qemu rv64 with "Svnapot support" on and svnapot=false.

I applied this to v6.0-rc1 and got a bunch of checkpatch complaints.
Some of the CHECK level ones may be invalid, but could you see to
the others please?
Thanks,
Conor.


./scripts/checkpatch.pl --strict --terse -g v6.0-rc1..HEAD
93b854a885f0b34bef287db048fc4f4505a05ab2:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
93b854a885f0b34bef287db048fc4f4505a05ab2:69: CHECK: Macro argument reuse '_val' - possible side-effects?
93b854a885f0b34bef287db048fc4f4505a05ab2:114: CHECK: Prefer using the BIT macro
93b854a885f0b34bef287db048fc4f4505a05ab2:117: CHECK: Prefer using the BIT macro
93b854a885f0b34bef287db048fc4f4505a05ab2:119: CHECK: Prefer using the BIT macro
93b854a885f0b34bef287db048fc4f4505a05ab2:133: ERROR: open brace '{' following function definitions go on the next line
93b854a885f0b34bef287db048fc4f4505a05ab2:135: WARNING: Missing a blank line after declarations
93b854a885f0b34bef287db048fc4f4505a05ab2:163: WARNING: Missing a blank line after declarations
93b854a885f0b34bef287db048fc4f4505a05ab2:164: CHECK: Alignment should match open parenthesis
93b854a885f0b34bef287db048fc4f4505a05ab2:197: CHECK: Please use a blank line after function/struct/union/enum declarations
total: 1 errors, 3 warnings, 6 checks, 157 lines checked
fd3c74a08431b73897fc61bc7081082d4fd267d9:80: WARNING: Missing a blank line after declarations
fd3c74a08431b73897fc61bc7081082d4fd267d9:91: WARNING: Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()
total: 0 errors, 2 warnings, 0 checks, 113 lines checked
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:73: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:74: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:77: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:80: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:83: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:84: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:86: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:90: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:93: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:96: CHECK: extern prototypes should be avoided in .h files
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:97: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:126: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:212: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:226: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:235: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:251: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:278: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:291: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:308: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:325: CHECK: Alignment should match open parenthesis
bac3dfa35183e296fce1b6bc4b57f2bcaa63e4cc:335: CHECK: Alignment should match open parenthesis
total: 0 errors, 0 warnings, 21 checks, 311 lines checked
50b1c316e41a52532295929bb02e857431bdf15e:90: CHECK: Consider using #include <linux/pgtable.h> instead of <asm/pgtable.h>
50b1c316e41a52532295929bb02e857431bdf15e:95: CHECK: Alignment should match open parenthesis
50b1c316e41a52532295929bb02e857431bdf15e:102: CHECK: Logical continuations should be on the previous line
total: 0 errors, 0 warnings, 3 checks, 74 lines checked

> 
> Changes in v2:
>    - detect Svnapot hardware support at boot time.
> Changes in v3:
>    - do linear mapping again if has_svnapot
> 
> Qinglin Pan (4):
>    mm: modify pte format for Svnapot
>    mm: support Svnapot in physical page linear-mapping
>    mm: support Svnapot in hugetlb page
>    mm: support Svnapot in huge vmap
> 
>   arch/riscv/Kconfig                   |  10 +-
>   arch/riscv/include/asm/errata_list.h |  24 ++-
>   arch/riscv/include/asm/hugetlb.h     |  31 +++-
>   arch/riscv/include/asm/hwcap.h       |   1 +
>   arch/riscv/include/asm/mmu.h         |   1 +
>   arch/riscv/include/asm/page.h        |   2 +-
>   arch/riscv/include/asm/pgtable-64.h  |  14 ++
>   arch/riscv/include/asm/pgtable.h     |  67 +++++++-
>   arch/riscv/include/asm/vmalloc.h     |  20 +++
>   arch/riscv/kernel/cpu.c              |   1 +
>   arch/riscv/kernel/cpufeature.c       |  17 ++
>   arch/riscv/kernel/setup.c            |  11 +-
>   arch/riscv/mm/hugetlbpage.c          | 239 ++++++++++++++++++++++++++-
>   arch/riscv/mm/init.c                 |  47 ++++--
>   14 files changed, 461 insertions(+), 24 deletions(-)
> 
> --
> 2.35.1
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
