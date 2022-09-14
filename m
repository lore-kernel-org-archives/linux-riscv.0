Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09AEC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 19:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wiT3ULdby/GCT57chj5G12NC84VO+/vwuZMwzot+NY=; b=Go5D0g0l9ARiVs
	aaUQvoyp4UDXPZvVZizcTJSymrvVRKA5OgZQZlG5ZZhgtG0OVhbylCXkZGzrllgCgsLxVATsxJePy
	xu66flB2Smrd2XPnM1OXBIDGDPrjIKtx4fEj7/80TR6q3xYiiTdHbz6TFfYIQYNAFcbf9pJqrMvQT
	l3pJorQjE3Aq79Lgcry0KfsyiYVNGIpz8yNQDFJAXoEpKfgxzM+ASeRApzfR3i2Y3NdTPXV4Pxqbp
	j1U+0OejQ8zuPFPYemxP8zhJG43Pqve2lMLS2rh3rfexT9AUwu+X6LJL6glXj8i4YfFMtKgPA4eyI
	WzY2927Qa64InePed6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYY7M-008Pv7-76; Wed, 14 Sep 2022 19:32:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYY7I-008Paf-G0
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 19:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663183933; x=1694719933;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5PzsC09ezsw9opr10H9WRNLA78jaGmbQCO4DOAw8q9Q=;
  b=jgJPdtR/i/G9GLarvVMMLHMJH/jbeaW/0ScQbKxHn8X+VBT2Nnv3JUwp
   eyV4gB9Q7t5ywpjykPox5g7brGjYhMeqff0X/XGtW0OHFeVS70MZ3waQW
   xSw+VlXYeO+YC1xO+3Xa+uLl9cKbVNodKoFAzcpTnkI6wc7qiikAdHpnR
   qBvYQXu9u+1kRQKvJCKJkwWxUPVB46UBGMn/YEbEj95JkrNTrzXTJ1PEK
   arys9WbyRVl89rO1bXmhjCOGJxPffzKRsp/tCqgq7b90L7zGGfbRkX+yX
   bJFSb9XzNv93vyMwWQh0n3zuyi49zacOt3fEeYT9AYR/1c3qWEHPlVkpc
   g==;
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="180414213"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Sep 2022 12:32:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 14 Sep 2022 12:32:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 14 Sep 2022 12:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5EFQ8m1JpHeUUWO+tQ/Y6IDYg0Ty1GTgQLm7vCWwSpDX6l6DQNdt7Y1vMP3aSEcvA7wil2wSEEoPT/UwdVLxlBUPFzef3+neuxrSm16p9p/VDRM/9b++CtdWWONVF/yycuwNT1yggS3vMCgEnp40bbZXxL1Ddn+aBf5R1D/bT0dOjDSF8LNhyVgVjl+NoL39S2GhvEu60nX4o7BybJ8Dm3p9Q+nZbJQ1p83G4YvCRWtUto37TujdGS/0wFOWf+bQ5Q6KKTCoHlR3Mp2wCkl41605ogio/jomc4Cea9h1Ztih489OWUp1kGWlhVsayJomu5oo4dTXd0FoKjv9+Tcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PzsC09ezsw9opr10H9WRNLA78jaGmbQCO4DOAw8q9Q=;
 b=m7cxJpn2QE2Y3VQL7XkajokwK5GAutIpHCzdEyoWUY08CuOeB05xPn3Q1yW3OJwfmdRaZqsXZehu6SucAlgfYECfDYGZ7AfFC9fnZHnTJb3ZQiXjD2L8YBWEtGy9spdij946DH90X2R/Fhjr5c47FtzdUQo3Q2mKMY5jfAjrqKle0rME0Sa5gNDG9G170Uddp+a4dB3X2bMfkk8tlWWH8Xr9bvBEE2eKkqBksqE/3lQcKkyZxuxmle6jE3zLsM5V1OK6DJQQLh+LbWDkkBhgo5Je9r0RNPh0MSd177zFKIIE5fAjjFYNPyQjAYG+Cx7O5n0PqETcrfGjv9p07tZuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PzsC09ezsw9opr10H9WRNLA78jaGmbQCO4DOAw8q9Q=;
 b=hBCAD5FNR8Rpmo2UVnsunL/59/yxkCA1rl9DMAHISZdCgqjjpL3mBPb4/U9DjUBZymjj+LUND2m/pZywRzWaVZCOKmcQlHCozlicElzhYm9+d9O2oUjf5BufaH4J+mayjB/U7rxBZcaqkgTLLpnGUnB/GaRarfTSGp0BN7P9HvA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 19:32:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 19:32:01 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, <nathan@kernel.org>,
	<mail@conchuod.ie>, <atishp@atishpatra.org>, <ajones@ventanamicro.com>,
	<anup@brainfault.org>, <lkp@intel.com>
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef
 block
Thread-Topic: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef
 block
Thread-Index: AQHYyEeGuo8Fx4+tsUK8Avc6BmWIUq3fUMIA
Date: Wed, 14 Sep 2022 19:32:01 +0000
Message-ID: <e7e5a415-e097-a56e-880b-fa0488d2b73a@microchip.com>
References: <20220914143648.74022-1-heiko@sntech.de>
In-Reply-To: <20220914143648.74022-1-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|BN9PR11MB5307:EE_
x-ms-office365-filtering-correlation-id: 642be515-a154-4512-9807-08da9687cc03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cb0W/Va0YQvQ401mz9lxfvlL/5KSdVTR3t+I00jqZwgyfiJj7HP1NKO3QLmMhiCfyos+FWpuqdDDAR0maYecyjHrJuggp4mqnhkh6Ep8WN41BykEsl5SQKMue07epq+BEfI1wy4/5sfgb2C0g3Rlg5JJzrnHLuKqdbTv8cxFSzmozkwNR2KeBVb9vJ0G/yF/9XrhBuSoSnqHUyZlcGNlpYhDbEHowgGD6wY/Ruj2mQTsuCpIg7qVES9ZvajBTpD+RbSue0EBEbwr2V4upSZhiu7xEYwNy8k/Prw7x4L0wCf/wHvdgNmaZrOe+J/ilXu7fOr1RJ6PGEUKh/x3fttaqXogTD95Hn+1rC13Gukdm16eCgL2t9W5zs3wAjoxF2R9XWVq3ajaC7d/UNQbo8yNxgEDrcquPR2BpTEjsHUGoJJniSo48vbBi2BGndOnNHuevHTXTTLhUBOH3pztZyPspXIcE3TtJ1ywSkvrpC72TRtfilF8fF4MTmeOm9B6ss393ZgXrn3LsPDyNoPeLQVG4MAwJjgB1fqzAQrrDBrWo5HLhplpY4YHeezQlaGv6942OGwe5GJ3p02WzMSrpRtwO0lGsi/McnuJ4PvBVvLVT8GlbTCXfrH97e1pier8TICGQytNpGPrunKWG5BgHQ7P+EkHpsdt976nJ6zlNL2w2gIc95pHghIgqJHGz/OWZ+AIwFG1+2i7nPTBsi6UiAmTIG9bd2SKim2u6j4drTt299JrIkrSdV9QKEYBeqWpYbDZvWGotgPBgUMG1qd3pry6mlb6mNo4qe74fyqU1rhy3JULUqp+qLkrwnjc6iMIWgFcjytb5UXWQETMQnWOq6kFjBZ48/zi31bfIP8Y+Uu2J8OHf/lMzOJFkxof9sMZk3ER5fdP2vRDbGn2qCJSCPEFig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(66446008)(66946007)(54906003)(26005)(6506007)(36756003)(38100700002)(31686004)(6512007)(91956017)(966005)(5660300002)(316002)(8936002)(8676002)(76116006)(110136005)(4326008)(31696002)(86362001)(64756008)(66476007)(38070700005)(6486002)(2906002)(186003)(83380400001)(71200400001)(66556008)(53546011)(122000001)(41300700001)(478600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUliQzUzcG93anZiOWxFcUYrK2lRWGdLa3lsc2pVK3o2em1BdzFPRGgvSjRB?=
 =?utf-8?B?MjllRnlHa0tFK0Z5YmRZUVZ1dUVxTVhCMkdJZ29tU1laZURZb2Q5TlMxc1I3?=
 =?utf-8?B?eHhjSDRkc1hpbGxneG1wb2pQWUttU3p3RU0xa3g4dVFNS2FyTTZOUkdJeVJp?=
 =?utf-8?B?b0gzRm5mSmhLYUM1blRvKzN6clZUWFMzRWN3S3pnVDMyYVNyQjRjVHdxeUF0?=
 =?utf-8?B?WVNQTTIvSjFocFp3cU10N01QSHIybXRONkRHZDE3NHRqUnlwU1pqcElodFpU?=
 =?utf-8?B?THljSU1zYnd5WjM1SS9VazlzVnhWb1IyT0VBYktadm1GbjJVejRBbFRyOUVZ?=
 =?utf-8?B?Q1NuOFhqTHhKdm4ySEtlTndZa0FFTzJYYzNtSVdaSSt0L1pTTGs2YWlvejFR?=
 =?utf-8?B?RHk2Y0VCdzRwUXN6Q0crWmdkcitLWGhKVjc2N2NnSU82UVBqTlNyWFZIQjNw?=
 =?utf-8?B?SWhhR3dXSENxSitWcUdpdVlRRWRhSGl5dVBLWGlwT0pXelFCK1RkTG1sVC9I?=
 =?utf-8?B?N2p0QmdlUGJtZm5icHlJcUFUL3BvTkRjeGNyNW83TS8zTGNnRDlUR2dwb3E5?=
 =?utf-8?B?ZS83UkllNitYdFFpZEJxVHhRRkl3RGpkY2RwaTMvbFlzQXhOVlRQSlZUUVM4?=
 =?utf-8?B?NTV5eC9pNVNGbDQ2dVZTYUFya2VuaHJiMzNLNkNNcEd2UVBUS0RjM2l6N2hL?=
 =?utf-8?B?WUgxWGFaeWJUQU8rd20zVmF5a1c2a2NEcW1vd0NwdnAydk1oYWJKaXMxMmF0?=
 =?utf-8?B?Q3ZWQko0eVVlYnlEaFVmcy9zR1ZmZzFBL3NRdVEwT1JlbXpwVTJxbi9CWEJW?=
 =?utf-8?B?T09ScjVYcU5OaEtseFBIVXh3dmpzb09sdmtXdmhrZGtmcjJvZ0doSEJnUW1Z?=
 =?utf-8?B?TWkwbEhmRjFxU2plMDhwWkl1UEJ0bzZ3VHpXdE04OWtlRTFEbXlvRWp6U2hN?=
 =?utf-8?B?UVN3SDNDYzh1NWRiaUZTTm1IVUorQ21YQ01jUXZCNGp6dVVaMCtBcjdUVUp4?=
 =?utf-8?B?dkdVOGMwaHVqQ3haVjE5OC8vOGxlZUo0WElBd0Fqd3FFdm1LT0NVd3FxaEt5?=
 =?utf-8?B?WlBTSHNYb09hd1FBQzNYRjNrbk9XeWxGcGFDTUhBVHBCQnpkbmR2Nm9TRUlR?=
 =?utf-8?B?a0dFSVM3d0xmQTJ0aEc3eXBwS3pkSlFnZnhDU3F1K3FVUm1WelI1a0FrbStt?=
 =?utf-8?B?bHIvOXVFSGloOU55Lzk2MHZUbFkyOEVRWUdNYVJ2TTBLYTRWZVU4YlRQN05J?=
 =?utf-8?B?OFZwemNsZ2k0RXNhWHI5aHFZMG1yWFd2UUtPU1lUQ2lJcE51Y3EreUtkaXFY?=
 =?utf-8?B?a0sxZGZ0aGY2MUh2WXV6SjV4eVZzMWlsRUJyUXhFcjZpblQybjhrdUZBQmZ1?=
 =?utf-8?B?V0ZWdmVRYkRPdXI2bzdwNmRlODhzWFp4TFlQZHJRckxBN0dOZmt4REFrMU9S?=
 =?utf-8?B?YUtNbDJOcVkwUUNKTHg0RExhM1ZVbFo0ZExvMnJBNFE1MTltbzNyZlYrN0lx?=
 =?utf-8?B?TndYcmptY3U2TjFPdDFzdi9TSTNOVklNOUViWUt6ODYxV3BzN08yZHI5MmVE?=
 =?utf-8?B?UXhVRW1RQ1kzSnpDclF4dlJNZW5uM0k1bVFmZzZSbjVqa0RQRmxGZlpvd3A5?=
 =?utf-8?B?WXNpcS9MaUUrQXQ2cVY0eDRxR25GdWM2Y1IxQjRQY2dqUFI1MVVUYWRselUy?=
 =?utf-8?B?NUZLV1JJQkdKN2FwWmtKc0R0aWZYamxXOHFNb0x2a21RbHJ4cjBmQmo2RWVR?=
 =?utf-8?B?RUFlTkVSZ3pxWWNZNlR6UUxLTE1iQnV3ZEJ1M01qRGROZXQ5MzJkVG5tWEt1?=
 =?utf-8?B?MTF2Z1hiWTJMb3pJekhJSUhSaEt5VytWNnB2VzladEZEVzVCUHhMVytXMmFr?=
 =?utf-8?B?ZFQ0Nnp6TGtvQ0o3VjhaMjg0Z2wzeUYwdEZjMHFLaW1xV1VIV2JzcldqK0Qw?=
 =?utf-8?B?QlRZYml4dGIyc0FTN1RVWnJDdDJ0YzVWU3VwVk83MlpmcUwrOTFJb2xVb3dO?=
 =?utf-8?B?TTZWOFF4elVoQTRxV2NlTGFtTEJmbDg0THByYkVBSmE2SjZ4OFNQUmJSMEE2?=
 =?utf-8?B?NG45d1A5NW84bE53WU0wK3NPSmlyNnRmc1d0aEg1NjdlRzdzZTlaelRYUURO?=
 =?utf-8?B?bTBYZm9RdzNrYzNKdDVJMFJhMTV0czJWckVLSisvdmJWVndpZDN4UElIR3c4?=
 =?utf-8?B?cUE9PQ==?=
Content-ID: <0A4ABF0ADA453C46A23D4431034FED77@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642be515-a154-4512-9807-08da9687cc03
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 19:32:01.3416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kivucI3prcCY+X6rrd+hxRfzuWgEEXwTS4UOPf1XuTvFFicz3BshigRb7fuGatnjKa3//ikkkOiUZ8f+PEg8lVJZQ6nR+JNo4QPXWxmey9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_123212_798661_8B38D846 
X-CRM114-Status: GOOD (  19.38  )
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

On 14/09/2022 15:36, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> riscv_cbom_block_size is used by all current non-coherent dma operations,
> not only the zicbom variant. So move it over the block also containing
> the riscv_noncoherent_supported() prototype.
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

I accidentally fetched palmers repo rather than riscv & noticed he
pushed a fix there for this too:
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=zicbom-fix

I think Palmer's solution is slightly nicer, but to me either makes
little difference, just getting things squared away for 6.0 is all
I care about at this point.

Either this or the one on Palmer's branch is:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/cacheflush.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a89c005b4bbf..5c16d901d3da 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #endif /* CONFIG_SMP */
> 
>  #ifdef CONFIG_RISCV_ISA_ZICBOM
> -extern unsigned int riscv_cbom_block_size;
>  void riscv_init_cbom_blocksize(void);
>  #else
>  static inline void riscv_init_cbom_blocksize(void) { }
>  #endif
> 
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +extern unsigned int riscv_cbom_block_size;
>  void riscv_noncoherent_supported(void);
>  #endif
> 
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
