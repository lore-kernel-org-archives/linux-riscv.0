Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3699AC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6f65dvr8ozLFsCXDFl9x5Kn2WeVKU6W4w3sfKYWiXY=; b=CixCAY4yeMVC7a
	UzGtR3LGOKk4h2doASo5nyjmr2Tirt4jGS2WLt+WmmYKWBS43C0NFtR02NjDMk2fLLRtMhe3jsb0v
	e5Jbf91DVcfwXPNfwf7UiQ+Qo/sNaRYSYQc7pyVzoIUEGPEnWKlLbIV35IDewkcKTYwx2ecmi7tnM
	YcC5kPvZ82KdQz/k1BvCwIYF+lPjk1NLqMklfbOjs4B3+oFjb99TiCEb4hvgX61QWKzV9aC5FZSeZ
	SucSOTaw49EoRQzBOJKtbM/ZO0YdiHO3DALMToNSYMdGrnNLx5bjV4y+4couNrKxQuME5X8Xivdh+
	tHvACS7N1VIhGdBq0TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNco6-001ULB-Sr; Mon, 15 Aug 2022 16:19:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcnx-001U8v-Ak
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 16:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660580345; x=1692116345;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x9HiBHET/jyi3yS/RVm21y3yDHuFwxkACYyxEW0BBNY=;
  b=2K/J1gCZy+8rPFH+vSna/VnH/Kd1EvpB/Pp/0XuK9bPoQ9rXHUW2hPEN
   kDTdwWVjGYBgSXqlbIcHtPbB2lwxX5paVXqUmSMFL92YHdm0swKhXrj9s
   B2wpwS9k9vyesMVxiTk0afki2egQ+P2sP54jTyVkarDPGKuwqxdCcqHtL
   rjm4u1YwPo9PZT0ik80ItFb9gbMfDUA78lAzbwgAO6bsWEHFjrCjb2067
   h1ThZOBE+A3GdOnnp35aUq1N5LOi6qCp562vHfbMMfpFcVV/gseT6DF1K
   JDMzFgITDZqwDdfvjgrB+RqbhraEQoaHTRAH7pqnc5AhyglFAyYV5wuQD
   A==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="186523207"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 09:19:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 09:19:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 09:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfD2kpkBk3M/Z+mS75i70++ms0Bz/Gk/uhHqMVnZ05BZ3afeYQQRce3FzQYchyyiZ6PIvYFcGJ7P3oTZQScvd4hFFPS0lMiE+lns4Q7uKnTf5WsmNxzAljnCIbJ8HVHHSuHEGlibWc70W+1T5QKBe0sotpuMJ15YymunI61jsbNzXQ8g4hX+UCUS661k6Nr3a2aKKSQvX5zMiPRJJ21DRiqap7dzDqG1FohgHBvJojUCE/ByhyKkwJqRFEZV8XDoUwdSrrUUl9Uc4C/T7BwBt7KNp3zhmSttcpOSl7CmsaahcR7waUv3v12yo/hEp3+eDKMz+cf8HrUy5vViBnxSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9HiBHET/jyi3yS/RVm21y3yDHuFwxkACYyxEW0BBNY=;
 b=RzVHgeBKGk5DlAO+969fYQZkMMdTkfBSObSDMkX6iT0aXlRbTtXQ40SbyfCtRt1RUCmKBC6DrYDx8X3h5kN6Uc10rLNztAQ7Zco7OcOYUf1SXKSkzHqGOVilIc33KRBwn74c0/HnAixutbdWt6skKByy6e8GcIoMDLvuuVK0OX13Rh84bv/8q3+TV/VJFSKpRRtSQvuYwh8gP6T71zm1pR/sZmSppj3lfyH/5P7tRufpns0Ew6MsY+g+NWPRQxcZNBJE64MXl+iaRWPrfyy4Pbghc/wF7CuwYpJJWWowl7KF/gw+fFSNaM5RsCrJrY4WJJ9yA5kzOUiHxk+r+G7U6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9HiBHET/jyi3yS/RVm21y3yDHuFwxkACYyxEW0BBNY=;
 b=Co60OiQpgLHQ7ZcWmu/AQQAQA4MMetqNmzOac14m5b1LVgDeudb2NoDYeU+5ELEGYWzjvDnLMXiokQ2T63TqxEInHxtCU+3wKmTi9aJKU2Kpe6c7o+BObp8Ch7gTn4U/udp6E+gbJSv2Dwj19fKMWSY+ZIHAvuAnLmNZ5S1JYMY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1769.namprd11.prod.outlook.com (2603:10b6:3:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 16:18:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:18:52 +0000
From: <Conor.Dooley@microchip.com>
To: <Lewis.Hanly@microchip.com>, <linux-gpio@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<maz@kernel.org>
CC: <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYsJ/HwsKWI4ziKk+4Z6/CkrdV+a2wJCmA
Date: Mon, 15 Aug 2022 16:18:51 +0000
Message-ID: <23a69be6-96d3-1c28-f1aa-555e38ff991e@microchip.com>
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
 <20220815120834.1562544-2-lewis.hanly@microchip.com>
In-Reply-To: <20220815120834.1562544-2-lewis.hanly@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 797df481-4b5b-45c8-584f-08da7ed9d7c7
x-ms-traffictypediagnostic: DM5PR11MB1769:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VlMsrtTvwjMnpoZQOAB6reRZA1/EOhR1ShxE0wRZGieMfZBjJOddU36FeoQciMYyjjI49QP4EUbTDKWXbQmUgWcr3fGB8Q1bg52eu3R+JaSkM+dDVIs5tC9LS8NSihp5ygIjiOUUsTc01ZNKnRzRIUFakYyah3fsVimQkCHJdZxcGDzIti+C/5PAM6UJf4ldL7lxwV0fgIPqBVJMuskeSqpg3olCeRBU5V6zJjZbqC8xHpKWcxkZ6e0w13pSg4sYetDliLKsvKHy61L1R5uCoq6anq2+RJSXo25GRpdCQDuq8KzggOGS4o+5rArLg6PlS9E77MRj5+eXcdyRIV/I/AvlLWNJvdZCKvv1peozc0Wc1tqXQQwW4h15Y7VKjL3l45v/yjCywJeW3t6O7PUsdkgD4fJxGrOd4QiNVvcAt9H89F3EnTYx8YnAaRUp7/fN5zXb5DFdPVnwb5Zhc4WRUYVrHhqIIfdcg0XNrCTv/evK+PAYQjR7ddjHKkPPoVh17hi21AEuYNt6+7drKAPXeU7JYHw80/deu31I0g1Ry4R7SBrkc4ghqdobk6O6YWBetkpUmioJ4y4zFa4eOLsGXqmO7FrzrOH9IZU0f5wNETMpZcarQIsE+FAuYS0ZWjHVPE2dbHImReo/OswIj3Tjkz6tzijWRsrileT3hY+5xVa/G/+sX7Xa4vKv6GA34MUivm0B+Bd4mbukasXRwR6dFM5SVXZxbkWLBmDLdMXsVad+8bmonlO/hOVwaCWLtY5vGDEzCafwFeYiZz85m0vRezwyaEy6p8sduy3iIOUQaI41UNMS3TynOa2BZIMgihhAq7D/Rq9N1vAcvRgYtTOw46FbX7lMlFw9ZNxGtGH4W94dt1fNcyz6/RnkHVv6AR6eV1O5rM4WfiOX31ET7dyUWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(39860400002)(366004)(6486002)(83380400001)(966005)(6506007)(478600001)(26005)(186003)(41300700001)(53546011)(6512007)(2616005)(316002)(110136005)(8676002)(31686004)(36756003)(66476007)(8936002)(66446008)(4326008)(91956017)(76116006)(66556008)(64756008)(66946007)(2906002)(107886003)(38070700005)(5660300002)(30864003)(71200400001)(86362001)(31696002)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVVneWQ3bmVreDdWQ1BOTGJua2pWMzhUNFRhS2Z3a2ZxZCt5bUVZWWluL2ZW?=
 =?utf-8?B?eHJHYWlBT0dxc2w4UDFtd0pRZWpCREFKVW5mL01taVlFRnNaVDJnNGZQVlpL?=
 =?utf-8?B?YkN4Wi9RaTBlMlhSTHRta05MTG9RWUY4dWFiRUc3c2RHN0tXNEZvMUhua1pl?=
 =?utf-8?B?dldUc1dTT2Q4WTZRMUUyTFpsSEdsVXV3MDErUWJlU2p6c1oyRFR5UlJuK3VG?=
 =?utf-8?B?Qzgxb0IxK2hHK3FuVlRrTjZwRGl0RUptVUZHSk54MDZVV2pwdGloazJTQ205?=
 =?utf-8?B?NHJZRkF5all1NEZQTEtZMjY2MG9jUTBrZEd4bXJhT1ZETFNRTURlbjZ5alUv?=
 =?utf-8?B?OXUrSmtkVlFXNmxtNFphbFFDcitxMUJXK0RsczJRS284Q3RBYWIvVGUvOEw4?=
 =?utf-8?B?M3JOSzE3eWFHbXdXMm4wanplcWpvWlNnVnNucVcvMmtOZ1ZXd2c1djdTT1BP?=
 =?utf-8?B?YUJzaTNZOUU5Q1B3eEkybzhQcUY4VURBajJZVWtxaXZlaE1zTTZGVmMxeDlE?=
 =?utf-8?B?dTVVK2RocnFpZ25PeDZLZnBYK0RjMDBqUmVyVzQzbDI0MlBqZjQveTk4N01j?=
 =?utf-8?B?Nko2cEpyc0M4ZkRRR05ROWpFQkNnbS9rd2IyT3cvb3NlMDJMcWxCM0hwbTNX?=
 =?utf-8?B?RFNPT0d1ajlYZllhcjc1cUROR0kxMnN2S0l3TnRiMlllVTZMSnV6RmJSZUpV?=
 =?utf-8?B?Z1hhN1BKQUlYWjN2S09pOFZUUW5vYUF6MmwyN1k1WURXVFlYOStJa1ZsMDhC?=
 =?utf-8?B?M1VVSWtjRVZoTUs1SWluZU9TaWsvOXV4RjFNVFNpc0QvQ2ZiZmxhbFdkbkRY?=
 =?utf-8?B?Z2dZSG9Ra0pZaVYwQnc1N3QwZ0sxNjFEdUZqS2FYRXhyaGwvSnF4KzFvVnFp?=
 =?utf-8?B?T2FiUTZUUmVQWjJnTEFmM3BPVVk5Kytwd1VLR1RoL2lxRHdiczMvUmsxS2t4?=
 =?utf-8?B?UWxYMnk4TDBJaVNkM2tDL3ZWZE1iZHROKzd1eS9VOFllT1RzZktRakNYekdx?=
 =?utf-8?B?WXRTTGd4aUh1NWtValI1MSsreGJqc05wcGJMZ1p4VWFJUGsxckVuKzJJNzY1?=
 =?utf-8?B?bjVGNnJubWlySVpkV0NVYWpFZFdpRlV4TmV2aHVRNG9yV1RpeVIwQlBPdWdC?=
 =?utf-8?B?QVZBb29FYVNEckUydjQydFNLY3gvdWNmVkF6ZGd2dDcrUzNxeW41U21oNXN0?=
 =?utf-8?B?WXZ1RkEvaGJ0akZDa1RLV05qNk1YZm85ZjZKbU9pWWxIMXNldEJQR0VtM1pw?=
 =?utf-8?B?L1MzYktlaHZ0YW9pTFcyZzhHYnJzMlVrM1p4b3BrSXlOcEJYL0lLaFFKYThD?=
 =?utf-8?B?aFdiNFJHMTlPT3pZNUVmVGdTMlZkTG1tOHV5MVZoeEJpZklUb3dVMG5wUlgx?=
 =?utf-8?B?VEp0ZUpZMWpjcXoxSDJwcEdLYzMzaTFidkF4NVBMcDZvWVVUVXBwWkZhYkhm?=
 =?utf-8?B?YW40TkR4YkpjeHo1WUVjNWkrQUVzTWprcXk5TE1UVEJJY0ZacmI2VmFHUzBU?=
 =?utf-8?B?bFhKc29PQnA1T0Y4cVNjRUptSkxUS0QyUVZNSWloTFlQZWcycy92OVpYMUxZ?=
 =?utf-8?B?Yk0rTHJtSklwUkFTWTFza1BycnRxVm43TFhVMXU2clpvaUczWlJqRHhTOGpI?=
 =?utf-8?B?L1g2Y3JKVzNYL3k4VFR3LzI1N0d4bXRVeEp5QVFJenozaTV1SlRvV0FrZnBS?=
 =?utf-8?B?QlllSGlZb3ZPRDY4dlhXZnFhbmZvYWI1dHllUUg0bHo3dTBXcjJPS0x3VUJL?=
 =?utf-8?B?S3FVWEJvK1I3YlNWUTJpWTdGVWxtd2doangwZFNOSm9ZM3pyZ09WSWRaNEZD?=
 =?utf-8?B?Q29hbC9tcUtHVW11TmFQeDlxWVV2Z3VXbk5sa0JxbHlwTTFPeFBFdlNiM3BL?=
 =?utf-8?B?OWhOUjhlTHhaMFVtVW42bGZpRGdxVzkwcHhRZnJaZlZmb2toaVNvNy93cW8y?=
 =?utf-8?B?Ymp3M1g5dnQrMVlQOEFMMnpXUHZoa3lSR2JEZmJ3bnZhYkl6T3FtOE1aWS92?=
 =?utf-8?B?citLQWd1RU9uaVpxVlZpMzdoblFWNDFDREdWSWIrTGtzOWoxZlhMZER3c1k3?=
 =?utf-8?B?V3YvNERHZG5WUW01UlU0RS9SSEVabTVKcENwdzRaSjBRVkhUeVZybVdxdWtO?=
 =?utf-8?Q?wlxC0ASTeJUXFkIZKuQzAQeX5?=
Content-ID: <F72F076BF9ECCB43976E181F754E4188@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797df481-4b5b-45c8-584f-08da7ed9d7c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 16:18:51.9358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibOEa/zkgtvaOqDlagcfpl/mUw9XwLvzXFrLPPCuDCjcW6oXT/ytT8G5eK04Z3LBQFz44uvgIfe4drokSFobSo7pH+MCbTMKMA3mFxZfCRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_091908_392571_8617FAD3 
X-CRM114-Status: GOOD (  25.30  )
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

Lewis, Marc,

Top posting this bit as it's important context & a quest that I don't
have a specific place to ask.

So I have two concerns/questions about this patch, of which both
relate to interrupt handling. From the cover:

> Changed the interrupt handling from Hierarchical flow to chained
> interrupt flow. The reason for the change was with hierarchical flow we
> requried a interrupt number mapping array to work with our HW and this
> was not acceptable. On reviewing the architecture the chained interrupt
> flow works better for our hardware and configurations which are not
> fixed in Silicon.

Previously we discussed the configurations of the hardware:
https://lore.kernel.org/linux-riscv/87v8rvzsfc.wl-maz@kernel.org/

To recap, the SoC has 96 GPIOs but fewer interrupts. To provide
access to all 96 GPIOs (32 per block) there is a muxed interrupt
per block too. Whichever GPIOs do not have a direct connection
to the plic and lumped into the muxed interrupt. Which interupts
are muxed or direct is set by a single register, not part of
any of the 3 GPIO blocks. On a per block level, there is no set
configuration for which interrupts are direct or muxed - all or
no GPIO interrupts may be muxed.

My first question is how are individual GPIOs & their interrupts
related? As the interrupt mapping is sparse, how do we know that
interrupt 26 specifically corresponds to GPIO 14 on block 0, but
all 31 other GPIOs are using interrupt 51? Maybe this is never something
that matters or I have missed something.

Second question is inline @ mpfs_gpio_irq_handler().
 
On 15/08/2022 13:08, lewis.hanly@microchip.com wrote:
> From: Lewis Hanly <lewis.hanly@microchip.com>
> 
> Add a driver to support the Polarfire SoC gpio controller
> 
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> ---
>  drivers/gpio/Kconfig     |   7 +
>  drivers/gpio/Makefile    |   1 +
>  drivers/gpio/gpio-mpfs.c | 317 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 325 insertions(+)
>  create mode 100644 drivers/gpio/gpio-mpfs.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 0642f579196f..303ea7f6f7bc 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -490,6 +490,13 @@ config GPIO_PMIC_EIC_SPRD
>  	help
>  	  Say yes here to support Spreadtrum PMIC EIC device.
>  
> +config GPIO_POLARFIRE_SOC
> +	bool "Microchip FPGA GPIO support"
> +	depends on OF_GPIO
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support the GPIO device on Microchip FPGAs.
> +
>  config GPIO_PXA
>  	bool "PXA GPIO support"
>  	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index a0985d30f51b..e04061ac5a28 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -120,6 +120,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
>  obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
>  obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
>  obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
> +obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
>  obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
>  obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
>  obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> new file mode 100644
> index 000000000000..00e68a8b891d
> --- /dev/null
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: (GPL-2.0)
> +/*
> + * Microchip PolarFire SoC (MPFS) GPIO controller driver
> + *
> + * Copyright (c) 2018-2022 Microchip Technology Inc. and its subsidiaries
> + *
> + * Author: Lewis Hanly <lewis.hanly@microchip.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define MPFS_GPIO_CTRL(i)		(0x4 * (i))
> +#define MAX_NUM_GPIO			32
> +#define MPFS_GPIO_EN_INT		3
> +#define MPFS_GPIO_EN_OUT_BUF		BIT(2)
> +#define MPFS_GPIO_EN_IN			BIT(1)
> +#define MPFS_GPIO_EN_OUT		BIT(0)
> +
> +#define MPFS_GPIO_TYPE_INT_EDGE_BOTH	0x80
> +#define MPFS_GPIO_TYPE_INT_EDGE_NEG	0x60
> +#define MPFS_GPIO_TYPE_INT_EDGE_POS	0x40
> +#define MPFS_GPIO_TYPE_INT_LEVEL_LOW	0x20
> +#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
> +#define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
> +#define MPFS_IRQ_REG			0x80
> +#define MPFS_INP_REG			0x84
> +#define MPFS_OUTP_REG			0x88
> +
> +struct mpfs_gpio_chip {
> +	void __iomem *base;
> +	struct clk *clk;
> +	raw_spinlock_t	lock;
> +	struct gpio_chip gc;
> +};
> +
> +static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, bool value)
> +{
> +	unsigned long reg = readl(addr);
> +
> +	__assign_bit(bit_offset, &reg, value);
> +	writel(reg, addr);
> +}
> +
> +static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +	gpio_cfg |= MPFS_GPIO_EN_IN;
> +	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
> +	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +
> +	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_index, int value)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
> +	gpio_cfg &= ~MPFS_GPIO_EN_IN;
> +	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG, gpio_index, value);
> +
> +	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> +				   unsigned int gpio_index)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	u32 gpio_cfg;
> +
> +	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +	if (gpio_cfg & MPFS_GPIO_EN_IN)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int mpfs_gpio_get(struct gpio_chip *gc,
> +			 unsigned int gpio_index)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +
> +	return !!(readl(mpfs_gpio->base + MPFS_INP_REG) & BIT(gpio_index));
> +}
> +
> +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
> +			     gpio_index, value);
> +
> +	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +}
> +
> +static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	int gpio_index = irqd_to_hwirq(data);
> +	u32 interrupt_type;
> +	u32 gpio_cfg;
> +	unsigned long flags;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
> +		break;
> +	}
> +
> +	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> +
> +	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
> +	gpio_cfg |= interrupt_type;
> +	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
> +
> +	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static void mpfs_gpio_irq_unmask(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> +
> +	mpfs_gpio_direction_input(gc, gpio_index);
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> +			     MPFS_GPIO_EN_INT, 1);
> +}
> +
> +static void mpfs_gpio_irq_mask(struct irq_data *data)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> +	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> +
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
> +	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> +			     MPFS_GPIO_EN_INT, 0);
> +}
> +
> +static const struct irq_chip mpfs_gpio_irqchip = {
> +	.name = "mpfs",
> +	.irq_set_type = mpfs_gpio_irq_set_type,
> +	.irq_mask	= mpfs_gpio_irq_mask,
> +	.irq_unmask	= mpfs_gpio_irq_unmask,
> +	.flags = IRQCHIP_MASK_ON_SUSPEND,
> +};
> +
> +static void mpfs_gpio_irq_handler(struct irq_desc *desc)
> +{
> +	struct irq_chip *irqchip = irq_desc_get_chip(desc);
> +	struct mpfs_gpio_chip *mpfs_gpio =
> +		gpiochip_get_data(irq_desc_get_handler_data(desc));
> +	unsigned long status;
> +	int offset;
> +
> +	chained_irq_enter(irqchip, desc);
> +
> +	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
> +	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
> +		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
> +		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
> +	}
> +

My concern here is for a potential race or missed interrupts.
As this interrupt handler is going to be used for [1..32] different
interrupts at the same time, any time it is hit it will clear all of
the GPIOs pending interrupt bits - even for GPIOs that are not using
the interrupt that triggered the handler. Again, maybe I have missed
something that ensures that cannot be a problem, but I would like to
be convinced.

Thanks,
Conor.

> +	chained_irq_exit(irqchip, desc);
> +}
> +
> +static int mpfs_gpio_probe(struct platform_device *pdev)
> +{
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct mpfs_gpio_chip *mpfs_gpio;
> +	struct gpio_irq_chip *girq;
> +	int i, ret, ngpios, nirqs;
> +
> +	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
> +	if (!mpfs_gpio)
> +		return -ENOMEM;
> +
> +	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mpfs_gpio->base))
> +		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base), "failed to ioremap memory resource\n");
> +
> +	clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "devm_clk_get failed\n");
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	mpfs_gpio->clk = clk;
> +
> +	ngpios = MAX_NUM_GPIO;
> +	device_property_read_u32(dev, "ngpios", &ngpios);
> +	if (ngpios > MAX_NUM_GPIO)
> +		ngpios = MAX_NUM_GPIO;
> +
> +	raw_spin_lock_init(&mpfs_gpio->lock);
> +	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
> +	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
> +	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
> +	mpfs_gpio->gc.get = mpfs_gpio_get;
> +	mpfs_gpio->gc.set = mpfs_gpio_set;
> +	mpfs_gpio->gc.base = -1;
> +	mpfs_gpio->gc.ngpio = ngpios;
> +	mpfs_gpio->gc.label = dev_name(dev);
> +	mpfs_gpio->gc.parent = dev;
> +	mpfs_gpio->gc.owner = THIS_MODULE;
> +
> +	nirqs = of_irq_count(node);
> +	if (nirqs > MAX_NUM_GPIO) {
> +		ret = -ENXIO;
> +		goto cleanup_clock;
> +	}
> +	girq = &mpfs_gpio->gc.irq;
> +	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
> +	girq->handler = handle_simple_irq;
> +	girq->parent_handler = mpfs_gpio_irq_handler;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->num_parents = nirqs;
> +	girq->parents = devm_kcalloc(&pdev->dev, nirqs,
> +				     sizeof(*girq->parents), GFP_KERNEL);
> +	if (!girq->parents) {
> +		ret = -ENOMEM;
> +		goto cleanup_clock;
> +	}
> +	for (i = 0; i < nirqs; i++)
> +		girq->parents[i] = platform_get_irq(pdev, i);
> +
> +	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
> +	if (ret)
> +		goto cleanup_clock;
> +
> +	platform_set_drvdata(pdev, mpfs_gpio);
> +
> +	return 0;
> +
> +cleanup_clock:
> +	clk_disable_unprepare(mpfs_gpio->clk);
> +	return ret;
> +}
> +
> +static int mpfs_gpio_remove(struct platform_device *pdev)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(&mpfs_gpio->gc);
> +	clk_disable_unprepare(mpfs_gpio->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_of_ids[] = {
> +	{ .compatible = "microchip,mpfs-gpio", },
> +	{ /* end of list */ }
> +};
> +
> +static struct platform_driver mpfs_gpio_driver = {
> +	.probe = mpfs_gpio_probe,
> +	.driver = {
> +		.name = "microchip,mpfs-gpio",
> +		.of_match_table = mpfs_of_ids,
> +	},
> +	.remove = mpfs_gpio_remove,
> +};
> +builtin_platform_driver(mpfs_gpio_driver);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
