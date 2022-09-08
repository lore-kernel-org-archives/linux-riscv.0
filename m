Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B32ECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BH4yZOzefT+2DUYq0V1/vyB4I823JnsJDiw6IxMQCs=; b=CJGjAkcPG2+fVg
	npJv7GAmd5B4RI/jAI6QKJe2t4TLjKaevxETKrj2vL5h8Yp8WDETV6HiOjx9LNOw2DU30fAZK9/2S
	14XZqCBSPQvih6VQ0q80FaI8d0sbhaFf1fc4OZwUqvXydObBjRHeKt9qJptCVFuYQ+eTjOT3QS+bO
	9Hq9Uan/pAnig0mkdxxRQnbZNH73rXEqyfTXPfOmXSq7a32/9n3K/Ewi/M9vtG3FNkM2GNl/dBECW
	tU787oaPaJWqk/PyubZznWx8/r2jlR9VECowgjPUSRipRg35xQkTHbOFrcK0gaWIF9Q6i31bug8o+
	kv74PABGzgEfZlYy8v7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBKD-00HXcL-0b; Thu, 08 Sep 2022 06:47:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBK1-00HXQs-8Y
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619653; x=1694155653;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0ydbOcAwU4eDlQQZkg+qVO6vkBn1EM16z55WihYS61M=;
  b=L2qcYNroi7NX+uB8+PoDFmK8mLoFFNa0fmDpZEFj823Poi6ysT4cIq3O
   C0gkDZwBDfNp+9YiPaxlEJ6h+F1M2j9dJeoJ1nDKgoaoPe6/u1HKNVnpU
   QpHhs7zlMTCSAbFU6is1SlBG5zjUixHW6dp/H3DtY5cANNXcSgYNN3q2q
   dccK5/IoUEo1Q9eJzhkmUAnGfvitj7pnVkjpdMvLWA1GmsJM6zrSjCHQk
   mM1w8vEmx07v0bXxc4RzMZ+PtreAu607kB7zrpI4Kel1z0gDKPi9xTgzc
   0rD2ZyS+LLJuMCNes59RJ/7y/WNNeRwTDWlYw+F7HeG34iqL4qdbsFC/P
   A==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="112686688"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:47:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:47:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 23:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpuR//T9a7zMrCd7goZzBD+l67Tr/QuYNYgqODp5+B1YaIdAbH4UKK+eBd5nKIqyRfvHyRFkTyULAQbV+5BG+teSJP7DPnY2YTFKTYVW0RqgNg26V/bKCf93Ktc9keLjpGTb33AWDirPm67/Bi+iKg6ysAazCUoguCaHbpeKvc+37KsD9NauB+pn1+4p3jeZ3bdnBOwkV3+Lo+PAf+t3rDBHvJCJGZltY6cMQgS/5dTm8PfYzVebmK3TEA9YtVebJQMMFEDi4nmfAVnXEQLpE38c8GU0+rx+J2AQKHpSscZi1VaQGWdx+GFHXylfs7VnCY3j9hjNyIlVeuZXKR7gHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ydbOcAwU4eDlQQZkg+qVO6vkBn1EM16z55WihYS61M=;
 b=M3QemjilSKreonXVtJYrwjaKhd339XAbHURXOHg8sD8jVoS8g/b6K1gbPE7oAj2Kr/yxW/k3nt/69H9wIBCMSPhRUSP55hpE3al1SF3rpncRsjb4K6yG70YZIVPfIeAiTMPmnzO/U5KqFJBgXPfea+hSBIt+NfpCjEWGKIR8tknMB3pY7LqRrJzIXooZqzStjisDvAhe1lmZXcBD/yZV4+GJTSZMSr1X6lHsg5astLt6ZLtEL2swsPYa2lw+lgu8pwauMMlHCblGlkpaf+J31vvimiFGFnngW3RuTmJQzWLgS1toLaydJAdgUiyKYmQixnSv5R3tZtiHUmEwEqQrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ydbOcAwU4eDlQQZkg+qVO6vkBn1EM16z55WihYS61M=;
 b=kndZrEnlOV8V0lATF3PTNxDtq64rudtlKTgF0WumuFmNuUO+L5GRKIcBG8LvUc0CAhByqmd0B8XY/klDu9EJOE9saDPkcRowp+kIRhvb7zP+/NQhcRyfXeb2jHImBLLfiA8tjnprV+6mKrtj/TXU3KwaRnf94Ww4emprCwykWX8=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:47:27 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:47:24 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 12/13] clk: microchip: mpfs: convert periph_clk to
 clk_gate
Thread-Topic: [PATCH v4 12/13] clk: microchip: mpfs: convert periph_clk to
 clk_gate
Thread-Index: AQHYw07aDGSKR8/N+0mpk6vSMUaEFg==
Date: Thu, 8 Sep 2022 06:47:24 +0000
Message-ID: <bd7ab590-744b-f780-df61-a0113876d26c@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-12-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-12-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c5ced1c-909e-4345-ea0d-08da9165fcde
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ADSeA/ghi0t0fQmDVwPkfPDgiUPSBKKIvxuoxdsn+aExc8/dfXkU8wFf0nAPzQ8buyDPkvr1Yr56CYpx7gYUjgINEBp7cELsYYMzVW/wGzShmS456VRAgxN0PeHh0wRCpB5sLlG6TGzgpOJyG591r+cLR+o3815Rky0wMnBkGc9SSWgna07Ym9zR5Bh2bYva/nwgzCbwxdnSb2E0uALi8uPira/KkMACVoqJbT3if6Vm0BPxlzdB6Sn4h4YlC/JMtimkP9374TTINYM1To3SYoXFLX4wVwiIjcjgVxb7EOoVXjfzLKOx5F5IlQiAMAmV1Aonv1qAAs9+bXkcnRfZgwmpMYkIcD/JbKEp1VsGgkQvK+DkeTuo/z1X8KrAIvCFGAgffNsQ1nFa9LpPfBu01Hqiyuh/Wj3hLMz8qY8p4G7bigsQExphldgDN05lbZG9PZ3tjCChV/WV841p57hRwvN+okFTSPsvgri5nfn8RuLZuJeU+NHx5TG4yGaqRA/JJL6oqJ2/vRHvzmhe9Xz+VD7TnZgYe4CsSUmucPWFubrZKGJKPxWeIRpw7i6vqmP1hqmgYcUhvZ58BtwNvfAEavFUdkRzhy99LxuoIlNXuPg0nsivAeu58rGrvvRPcAZEmrcyPqGMH5tvuMBIlbAv/fLPZYY06JFoD1JzrlVkFef1WIPKedgLlQD74B/HArH2WEYzd6DPMVGcmsuTx+mPk5wxvFxNi4YO9neyOooIBNnMwLrsGKTxXF4pukTUJlU1iGf7AFjD9p4dTs+pe0W4ZqrFRCYObEA3oOXVkb4RWAXzUqjslzwdLzNqN2BIjH7cEygegmHDlJOZmoEfvnXqcQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkw1UG9heS9YUFE3a1NJTEpOamVZTHE4a0w1RkRwc0ZoVkt1ajdIdHJLM3gw?=
 =?utf-8?B?bWN0Z0FYTjYxemhtQnp3VkNWTkZhY0xodm11cUhUbmZ0dTJoRG12MHJNZWsy?=
 =?utf-8?B?NkxXZHNzZkhBL0JIcHpHb3dKWFRndmJhWE1GL0VPWlVPUGFJOGx0akg3b3hh?=
 =?utf-8?B?aVZQekxNN1F5bVpIVUJ3MlF5UjcyYjYxTTQ2bzdMelpzUkFMM0JnVkovUE13?=
 =?utf-8?B?UC9kN2c0b1pUVW5HRzNjQnp5V0tqcGhCOEJUaEExR3lHNmRtVjVxUnhSbStL?=
 =?utf-8?B?dVNTNjQ1VENwbSsxdVBqZUoxZTdsS1crWTM3YzR1L21KckhTQUlnMll1UzI5?=
 =?utf-8?B?N2VObnlua2I5eURmNWlIMHJzdW1ZWWJHcURUakVHbjhVS3VZZXFURFFGbW5m?=
 =?utf-8?B?QVB5WXVsQlR4ODJFOTB1OWEzT0hBRFNyRUtEa0J6TFNmQ2VCY3VnM0ZrRXlQ?=
 =?utf-8?B?ek5jMEp2d2Ntak1KTStPZlgzVXdiNUFSU04wVVdDakdLdDgyQ1ZEczlzV3Y2?=
 =?utf-8?B?RUZsWWdEUmMyR3VCbTZHOVR0VVdJYzhleFkzRWllNldzcXJRR05kaXdFUWcr?=
 =?utf-8?B?cnJWeXRuQVh1bnNZTGd4cEFDNjZiN01wYVlRTW0rMXJ4ZjJwRXJZQ3ZRZ3ho?=
 =?utf-8?B?bk1LcDJaTnFzRXB6TGs4NVAzTVpkbEY5NHJJYVJGa1ExOENVTnlNcHUwY2tV?=
 =?utf-8?B?RmRBNFltWGlkMVRkZTgzTkJoV2dpaG1Iejl3NEhLOG1IdS8wTXY4K0RWVXVW?=
 =?utf-8?B?QWVSVDczdVZnWGxmRXlKZ05UZjE5QmVLRmEwY3VhVjcxZFRlR3l3UnkwK0kr?=
 =?utf-8?B?RDdkZmF0OER5SlUwQTRuTUcwK3dDUVd2T3J0OWZZbm1SSDN6MktNeDV6RUhF?=
 =?utf-8?B?NDF5YUNjcGpOenRER21qcHdodCtvRXlBOTd1a0xiRG9nZnRHcTNlanNyWUFz?=
 =?utf-8?B?MWVwTnZyWUhHSDNFQVc2MEtMYlFmVW5XRnNaWVBXSXVURlltUVdkWU44QXdZ?=
 =?utf-8?B?c1FrSGtIaklNbXpuZUVtdVVGbTJWYWUvdGxwaUpOUkZ5TVBxQkxVNmZNQkw0?=
 =?utf-8?B?SzFCeGJlRXpxd1duMEh0N1ZVUkg0d2pZMUlKeFV3T1lBaUdBdHg2eUdGQ0R1?=
 =?utf-8?B?RUpuMjl6WGRYLy9FRzI0bWJPaXgyUDJzandaMVlLREFPTmVVSGFnZUo5SG5m?=
 =?utf-8?B?V29MV25SWUNqOUVnKzJVWUJiRUVNYW83ODIvWHV6RmhrM3g5VWMrdENqbHBs?=
 =?utf-8?B?ZVNpendXd0NyRU5JM1B1cHNQdzVJTDdDQ3FXeDFmRnVtMXFZaU1YM0hBM2pX?=
 =?utf-8?B?LzR1dUJnSnRzZmlDM2pyRjkrWjF1YjRIbXRVdjJsRnM1bkI2VURuR0VtR3l6?=
 =?utf-8?B?bEYxRHRSL09TQXBacmlxRVMwNGtJTGNpaFRhemhwSGhoU1Q3RjN3YnZOUWtp?=
 =?utf-8?B?L29obnQvTFM1WFJzbkl1MG1CL01xV0xxUmFDbE9SVHltV0M5WFI5NldhcC9q?=
 =?utf-8?B?OERYV0VONEhUS2pJTnhvYkZhUHFaTWlaYm42cmFEdHhmMXhWU2JEcFlmLzF1?=
 =?utf-8?B?RkhzVjhIUzRyTFg1eVBBZjBaR0drSkFLWEs3andjbDJyN3hoeU84VzZZalc2?=
 =?utf-8?B?WjRVWkwybktqcDlvWG1GUmlTamdoQzdwVHJuenhCK2x4RjVsS0ZpYVpodlg5?=
 =?utf-8?B?VFdTZmxBTVlMdVgraW1ubE5tRk1Zb0hxeS9mT1RIRWh2akJsZ3lsZE50YXpn?=
 =?utf-8?B?cWJCWHJtSnVhMzA5d2R0VEU3RWp0clhVeVByLzZuZ1gwZGxRUUZFNXl5OUY4?=
 =?utf-8?B?bWpPcCsySnZhaVNKNDdkRUEyTEViNGRvaURMQ1JRMjNHekZLYTdqZXVjTjVu?=
 =?utf-8?B?N3B6aElnRHZkZk5XeXFnVjNITmU1cituQTJEdzYraXZhL3pISUY3c09SVkxU?=
 =?utf-8?B?V3ZlMmFCOWp3bXVjVUtXTDNINHh5VjNDRHMzeGxOTCtVSUlXTmZLL3c2WlB6?=
 =?utf-8?B?SVlWMXJEbHQzUGMzZmI1NmtQdC9xQm5aak9xQlRaUUJnSGhYeDhmOUNyeXlu?=
 =?utf-8?B?UU9KZC9CTk5wSWxXdkorV3Y2Q0VhU011b1VucHJsaU92NHJpeUluRUVzb3ln?=
 =?utf-8?B?Wk5uQklFM0FSci9QZGE1dUhYdWNUVXYvQ25Ydjl6MGF0UGpzeDdjKzhSeVpu?=
 =?utf-8?B?OHc9PQ==?=
Content-ID: <288B27A671B1304EAB9153ED6EF0B9F4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5ced1c-909e-4345-ea0d-08da9165fcde
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:47:24.6382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IEP21V8+ggWYmLcrvcsmEGjj14EAZIAIeKcfEnhFF3zdJOncTcUpYMd3PBw1ew9gKMgQByN8o7hQLQWqvQRm/ogDOascK5361vxXC9O+6Kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234733_497178_1F1A6948 
X-CRM114-Status: GOOD (  20.73  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> With the reset code moved to the recently added reset controller, there
> is no need for custom ops any longer. Remove the custom ops and the
> custom struct by converting to a clk_gate.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 72 +++-----------------------------
>  1 file changed, 6 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 88a200e88e54..fa46176eb9ca 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -58,19 +58,11 @@ struct mpfs_cfg_hw_clock {
>  	u32 reg_offset;
>  };
>  
> -struct mpfs_periph_clock {
> -	void __iomem *reg;
> -	u8 shift;
> -};
> -
>  struct mpfs_periph_hw_clock {
> -	struct mpfs_periph_clock periph;
> -	struct clk_hw hw;
> +	struct clk_gate periph;
>  	unsigned int id;
>  };
>  
> -#define to_mpfs_periph_clk(_hw) container_of(_hw, struct mpfs_periph_hw_clock, hw)
> -
>  /*
>   * mpfs_clk_lock prevents anything else from writing to the
>   * mpfs clk block while a software locked register is being written.
> @@ -273,64 +265,12 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>   * peripheral clocks - devices connected to axi or ahb buses.
>   */
>  
> -static int mpfs_periph_clk_enable(struct clk_hw *hw)
> -{
> -	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> -	struct mpfs_periph_clock *periph = &periph_hw->periph;
> -	u32 reg, val;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&mpfs_clk_lock, flags);
> -
> -	reg = readl_relaxed(periph->reg);
> -	val = reg | (1u << periph->shift);
> -	writel_relaxed(val, periph->reg);
> -
> -	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> -
> -	return 0;
> -}
> -
> -static void mpfs_periph_clk_disable(struct clk_hw *hw)
> -{
> -	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> -	struct mpfs_periph_clock *periph = &periph_hw->periph;
> -	u32 reg, val;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&mpfs_clk_lock, flags);
> -
> -	reg = readl_relaxed(periph->reg);
> -	val = reg & ~(1u << periph->shift);
> -	writel_relaxed(val, periph->reg);
> -
> -	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> -}
> -
> -static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
> -{
> -	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
> -	struct mpfs_periph_clock *periph = &periph_hw->periph;
> -	u32 reg;
> -
> -	reg = readl_relaxed(periph->reg);
> -	if (reg & (1u << periph->shift))
> -		return 1;
> -
> -	return 0;
> -}
> -
> -static const struct clk_ops mpfs_periph_clk_ops = {
> -	.enable = mpfs_periph_clk_enable,
> -	.disable = mpfs_periph_clk_disable,
> -	.is_enabled = mpfs_periph_clk_is_enabled,
> -};
> -
>  #define CLK_PERIPH(_id, _name, _parent, _shift, _flags) {			\
>  	.id = _id,								\
> -	.periph.shift = _shift,							\
> -	.hw.init = CLK_HW_INIT_HW(_name, _parent, &mpfs_periph_clk_ops,		\
> +	.periph.bit_idx = _shift,						\
> +	.periph.hw.init = CLK_HW_INIT_HW(_name, _parent, &clk_gate_ops,		\
>  				  _flags),					\
> +	.periph.lock = &mpfs_clk_lock,						\
>  }
>  
>  #define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
> @@ -390,13 +330,13 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
>  		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
>  
>  		periph_hw->periph.reg = data->base + REG_SUBBLK_CLOCK_CR;
> -		ret = devm_clk_hw_register(dev, &periph_hw->hw);
> +		ret = devm_clk_hw_register(dev, &periph_hw->periph.hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     periph_hw->id);
>  
>  		id = periph_hws[i].id;
> -		data->hw_data.hws[id] = &periph_hw->hw;
> +		data->hw_data.hws[id] = &periph_hw->periph.hw;
>  	}
>  
>  	return 0;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
