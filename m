Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EB4C28B2B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FGDT+fAVXSoWfHlxHlMvn9N89ydKg+v9hwDyo5fLUo=; b=40oO3IT/9CcGu1
	4JpYdJNJk5DloIedU/anzPqn7eNdkXzIL4/RjUg+OVlGudS8QBzNr6Hu/dr27rueiQ2Jgo/z7lWqP
	pnR2YGx5b6LoprJuY4jasHQYunYVALCGAUzaP+BOXKYZumjvEooQhhPrXNw6euK29rpmPplmo7prB
	J7UVavYb1wcGtQOplJ0Qu5wqUkqjDiap++b1ykAI5o+HwQmUiPYVKA6RaOYy2p6xPS3zi+PSCum3M
	3xD2BkY0YJoAB8GqAolHGpa5BOo2gNxmFEED4JPS0LZ1TXoH9gsK4Ci96swYSA4CRX7yrnQuMI3b4
	X+jDGsjn3CCp6ch9K3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP6ut-00BDEH-E3; Fri, 19 Aug 2022 18:40:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP6uq-00BDD9-Hu
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 18:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660934420; x=1692470420;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sWLXFA05EdczTksO0zzldlD2G9whpYW97DnTwF9NqfM=;
  b=hWbZsX1Q7jz68sO4aJTwbj/+WxIQpPLjoaf/TlEyVh59Qsmrz5hSKAYP
   oVLc2uY/OR8D/lPn9jgU8XHYL7n9TeToyvmxk1RIGwHMLKHQ3AX+bmVJA
   q/PqcouF9t+dbWyfFYwls+eZvrwKlctEZAG+s42kjKfou/diev9UVHZ1f
   ixlrUXpD2ABGWuUEDApJOP/0FNsJQukVtziYTmf2TSAqkI50hygKeX6rj
   3/hL4u3LfGP9tv5v4VsAP70bJf0mLh8lx8luaoV5wYYeUafhitC6EgXz9
   BrCOvopO8U5Zd9vEydIlsb732vIUNWpgaRCG+VcdlMxMyhUpMN1Ek/mwY
   g==;
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="177114447"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 11:40:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 11:40:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 19 Aug 2022 11:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHm52eALpT3yv5LVyjQmVlpQFAeMLX8FmGRZnN140ziXKDL27ATwjDb+8VnaY9G/8g7pohzf7SzXCsKfxPsQcO6yu5XCaIzPJkK6qYYEr1EsbGuDw1Qb0XwIE75RSBMs3Pq+dnFa2oQScVNZp4R0UPUQQfBWPYBwRqXvwYvxvLVzcEm+EewbEJ1c63fQ51tuzqhIhLfyv5Irjyl4SN4LSOIoepMwwHS/UoK0gF1RXbd+zkqrtQX4R2sVo1HCmkFKiBSKcxjFQsxHVu6ndpnWpGdfqARGs4nqxebbH23uGUIeFTseyQF0pKwT/NiBubINjAQuc9dvvzIaaKijQStLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWLXFA05EdczTksO0zzldlD2G9whpYW97DnTwF9NqfM=;
 b=VG82CxA7byEeZwL93c18j6Qu2v28Lo641bpRjgZsSo6oArKzT7i2jLzNXnzHFmonfUDM/iHyhl4GatspTxY837CY8NbN9ZwYKfpbnLaMuN9zRkpD7XWaU9RDnSoyMTuBQlkGkVQm+hLb4INMfuOJ5PusdKRB3pOR2ErxCe6NSu0s/W9VPalbzPGqmJhu2rVudl4/VuByQA7CNgc6tjwFVvb1WDPW4F7vgLRufgWv4YElqHBDDWBKce+gKuPXd3zhDdb9sFQ0O7qnimYLOrZtcabCY9NvLTB1eS4sQ3IsoFEPNWZvxsnzCqO9KJHPiZea3+5e/+MV23DB6uAi5neK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWLXFA05EdczTksO0zzldlD2G9whpYW97DnTwF9NqfM=;
 b=VeL4Ihcpr84G5oucwc7fuRiSk2ipe8pKA94Nv+vNuibnN9lTnTY/qJKt/ceTcJ1Y973gHX4216sC8JUp/3WftY4T0m2ZHzaQaCXzTWQkw/cYDX3mRhAaifD+/lB/hS5qU6zxs1EZ/YdNlRYBC1EB+UzDc1UopK83WEJeQOSclzw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Fri, 19 Aug
 2022 18:40:14 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 18:40:13 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>
CC: <Conor.Dooley@microchip.com>, <anup@brainfault.org>,
	<linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prabhakar.csengg@gmail.com>, <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Topic: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Index: AQHYsLouMPh7rdo3sEeVwwyr+jl3hq22lMeA
Date: Fri, 19 Aug 2022 18:40:13 +0000
Message-ID: <e9b00bb5-bb78-091f-9c10-96c156690469@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cfc8428-ca4d-4e5b-dcd7-08da82124113
x-ms-traffictypediagnostic: SJ0PR11MB5940:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z+jycG90yJ6X8tvecnxzh7GvBeweXEOS77nT6A5eToZTnS05wGtTS45w+gcmxN5iqGqZssvvPIJNQtZgBql13zWKObicEIYqopvgrIyUfAVf1FX+VTdGFPFQ9VKl7XzBJLPw4c3pziqbyfIkdMCuqhmSQmwtCXwRbVvxPIRzs8AmovwV5ycWv/rMOJIaFUrNVrj3iOoSYcB8su1I1y7rPA3DwTUAelN9EidD8043By8GKyoIuZsvdtEdNRl+PUfRhlR33TmS/lusuTrp2tCVt1Of6JeiDSnF/T1lBgMDFZ7pitG0Fp6ZzVj+33nlq5eL8feeTLjKayaeHu4rbTaNcJZ1zycIlgo17TKZHsHq2ilDwC0KcfkXmSDfOQ01TNWcsT71XoNxn5mGdiCuoA7a2Wi4D0EnGefZ5XrCVGy10jWtaoTi+p/tWarquXXbm3rVlg0EW69SZ4gTBfPrF83D3YxWvZTvOvJKA/ncbUq8y4VmKSYU2FLcnTtRlUArR6QSZ7iLXatHNKlnY4+1ESUAMRCW619bmUpZYajpJvm3oZ/qNKG/UxEcs23fMUw5iO6dt/bZsAzJH61woUopWtHGldY66+DicThQV7U5+ioTuf98wcVy1+QOARkRVHf3ExTro5gqevaUbkOAWAJ/LZ/Wp7Z4iVEEhRapQ8Sd0Nl90uTX1PN7Vec/3VCJC1eMzkoI8FMa8qPk5RKY19dnQoqldsb2/6leuMiW9TiW1eOmTnQjruyl+whydAc4Mz4z7QPUqTyf5dD7Lpm3xR+295s+JbIkZLxK1rScKjszpciugF3OlHCkWRGYoV8v/y30IcM48d/d9AKerBFPVFMMAVT44g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39860400002)(6486002)(54906003)(36756003)(110136005)(66476007)(76116006)(4326008)(31686004)(64756008)(66946007)(66556008)(71200400001)(66446008)(91956017)(478600001)(8676002)(38070700005)(8936002)(41300700001)(5660300002)(2616005)(7416002)(31696002)(316002)(86362001)(53546011)(6506007)(2906002)(26005)(38100700002)(6512007)(122000001)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXdHQ0h4RGZ1ZiswR1ZxMDlIU3NNSzBGOFhQZGtnKzNVNzNPTWQrMnAwcUJD?=
 =?utf-8?B?WTV2czN1WE1MSlBDd2lSNVhjZlY2SWRzMzZPVnN1NmNrUXVrcHNxR2xWV3dX?=
 =?utf-8?B?Q0ViZ0FtRnpWVnZocWdGTlNEQ1lxOWNXb2xENjEyRkRVMzE3SGFYWlZLdHhp?=
 =?utf-8?B?N3BWME5aTGxzTUY5SEx0RzRJQVV3cDc3RnVTNXdSM0xWQk5UT0NkOVd2N25L?=
 =?utf-8?B?OFJaY1haeHhBcitiazNSbGZBN1RaYWlab3BQYmZvc2syelJ2VzBGWjQrdENk?=
 =?utf-8?B?YUV5aWVBeHNkQisrR1NjcEpkK3FuMGFiczBLNXRnMmxjMnhOeEdRNURwQ0pX?=
 =?utf-8?B?bnczRnhCLzZnRnU0UVZNbGh3Ty9WdnZEZ3cyYzhoZXVkMit5QjlyeXN3MSs1?=
 =?utf-8?B?RjJFTmN6QWN0YWlmRk5DNzNrTWZDcmRuYndaci8xL3RDSHpwYlVYOXQ5bzJ5?=
 =?utf-8?B?N25ubUx2UkJjbHdkSmN4NUg0bzRvTVl5ekFPMHJuZkxuWHczUnhxdzl5b3du?=
 =?utf-8?B?YmlnT21aZ081amRQN1pCZkhGT1llOXRoc3JCQXprdlQrSUYzZEpMY2h1elJa?=
 =?utf-8?B?SS9uaTZ1RVNWNW81MHJLNitoU251TTdsSkxwL21HRllTWkw1S0Z6NGNybk5n?=
 =?utf-8?B?RVJoM0tDS2w2R2dqRHE1azVITjcyWFVxcGs0NEoram5zRExSeWl6NHM0QllO?=
 =?utf-8?B?b2U1dStEWXh6Z05ycjEvZjlqcHpJTC81SG5LVFVSZUZOMFBvb3pIakpRQml5?=
 =?utf-8?B?WXF4VnJ5UXU2ZURWQTJCTkFld2dZK0tiaXJmWVNld3JlWm1qSWwvSk90ZHQ4?=
 =?utf-8?B?WUsxN2JrWVNVLzVZdjEwekZwTE8zMG9VS2craGt1VHVZWkg5TjN5ZjRjZnFR?=
 =?utf-8?B?NjYyMFVUS3FnOTh3Z29VS2VRMEg2NGQ2dnFyc0xkblptTU53d0t0NjJFUUtV?=
 =?utf-8?B?TncwV2VtSHhRQnZCZXpwdjQvRHNleWNlZTc2K3krTkJiU09JQTV2T0VITjZP?=
 =?utf-8?B?SHV2TUpHUVNPVllRZzRCTUx3TXlhdWVibnlXb0pENTk0UkJtK09vSWhKeTU4?=
 =?utf-8?B?UGRtUjM4UnlqTi8yVFRuVjV6dk9vNXkrbnVFWUkrTDlHbWR1Y0wyYmI2WXlx?=
 =?utf-8?B?ZXNlUGxTaGROM3pIVWVrc0QwRGx3MTRJczYzN0IzRTFPa2ZRZFhmNHYvRjlk?=
 =?utf-8?B?RnJFZGFjd2NwWXpoaCsvaHh5anc4dUpJUTdmU1R0bHFKb1daN1JPeVJGOTVV?=
 =?utf-8?B?bkdOSzRaQ1dFK2l0NGZ6aWU4VkJVc1cxS2xLMGZlK01JVFYrc1YvV3Jjakpl?=
 =?utf-8?B?VGV0YjVTODhSand0cWpIN3NQYnEzV1ZUV2RGWkRHV1V5SVRHRXc4MVU2K1Yy?=
 =?utf-8?B?dk9LVWt3YXY1RHpGcTRuMVBuSlhvMkVDaEhEeXQrdGFwa0FzWWFVNGorZXBO?=
 =?utf-8?B?R1FSbU1NUlVYdUtjcjRVbUZMRVoxSjNiNjczNU1hdDBDM3hEczcrYmk1NElv?=
 =?utf-8?B?ZUNBc282dlpJVlgrQWtBOFlSTElQbURWdVBnS0NPS0czVFNsbE5XK3Q2TGFQ?=
 =?utf-8?B?bnhRbWRObCtzbFd0Qm1WbDQzeS9hZlYxRCtkQXRFbHR2aE5CQitDemZYd2t1?=
 =?utf-8?B?NGcrU0QyM0I1NG4xOWlZeDVqYnJXcHM3WU84bEpQdUZlM3IrYkRtMjZ6M2JY?=
 =?utf-8?B?ZkloMU5hMTcyVmJET0QyNWx4dkdUOVhVREQ3cW9vRTdlTXV3OEczaGM5djBF?=
 =?utf-8?B?SWxPdnJJMWxiQkFSa2FvekRQcURHNkhNait4eFBmM0xUT0dZQVZvb1ZHYzVn?=
 =?utf-8?B?WmpEcmpnK3UxTHk0MUFQQ0NrZ0NxQUx4a0RBODNiVEhWbE9oUlNkT2ZuQ1Vt?=
 =?utf-8?B?QUd6UUVGdE9ER3liZHlTNW1zNm9hMjhzdVlGNFpvSzI2TmVMRitCRWNUejdz?=
 =?utf-8?B?bGpNbnRkUWZZRVdkaHZ4UGhLQ1RuVDU2dnA5Q2Z2TFBndmJ2Wi9LWW9PZDB3?=
 =?utf-8?B?dTdlS1dPRDdmalpFVnllVTBCU2JQR3dnNWNWVjhHZGhpeEI2TmdSb0ltblpX?=
 =?utf-8?B?aTk3bG5kQjE4MHNlYWpvYWwvbnNaMWR5MTBJZitnTmFrbVJzeXJiR3lZNFl3?=
 =?utf-8?Q?Loj0vFgkMiqgGNEvXZ2W6G4V9?=
Content-ID: <EBE8BB20E51E6C40AAB55AF8547280FF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfc8428-ca4d-4e5b-dcd7-08da82124113
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 18:40:13.9032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biQkpO3KJ77MY279bORdy0gdAtXV5VeKPdyZsQg9xsbUNfEQBiBdfxtoOxJvQyRoiJaQ5hI+puHHbYVnbL3SmAOq+a922PyRtTuVcHob0u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_114020_646142_066DE949 
X-CRM114-Status: GOOD (  26.29  )
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

Hey Prabhakar,
(btw should I use Lad or Prabhakar?)

On 15/08/2022 16:14, Lad Prabhakar wrote:
> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> Single).
> 
> Below is the list of IP blocks added in the initial SoC DTSI which can be
> used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * Dropped including makefile change
> * Updated ndev count
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> 
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> new file mode 100644
> index 000000000000..b288d2607796
> --- /dev/null
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/Five SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/clock/r9a07g043-cpg.h>
> +
> +/ {
> +	compatible = "renesas,r9a07g043";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	/* clock can be either from exclk or crystal oscillator (XIN/XOUT) */
> +	extal_clk: extal-clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;

What's the value in having the clock-frequency here if the board .dtsi
overwrites it? dtbs_check will complain if someone forgets to fill it
IIUC & what the missing frequency means is also kinda obvious, no?

That aside, by convention so far we have put things like extals or
reference clocks below the /cpus node. Could you do the same here too
please?

> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <24000000>;
> +
> +		ax45mp: cpu@0 {
> +			compatible = "andestech,ax45mp", "riscv";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			status = "okay";
> +			riscv,isa = "rv64imafdc";
> +			mmu-type = "riscv,sv39";
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <0x40>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <0x40>;
> +			clocks = <&cpg CPG_CORE R9A07G043_AX45MP_CORE0_CLK>,
> +				 <&cpg CPG_CORE R9A07G043_AX45MP_ACLK>;

I've been on a bit of a topology-fixing binge lately, so I noticed
that you are missing a link to the l2 cache here. FWIW this does show
up in userspace with things like "lstopo" so it might be nice to add
that in from the start. You don't need to have a driver for it at all,
just the entry itself & a "next-level-cache" entry for the CPU.

Other than those two things, and this l2 one is in the "nice to have"
category:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +
> +			cpu0_intc: interrupt-controller {
> +				#interrupt-cells = <1>;
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +			};
> +		};
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&plic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scif0: serial@1004b800 {
> +			compatible = "renesas,scif-r9a07g043",
> +				     "renesas,scif-r9a07g044";
> +			reg = <0 0x1004b800 0 0x400>;
> +			interrupts = <412 IRQ_TYPE_LEVEL_HIGH>,
> +				     <414 IRQ_TYPE_LEVEL_HIGH>,
> +				     <415 IRQ_TYPE_LEVEL_HIGH>,
> +				     <413 IRQ_TYPE_LEVEL_HIGH>,
> +				     <416 IRQ_TYPE_LEVEL_HIGH>,
> +				     <416 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
> +			clock-names = "fck";
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
> +			status = "disabled";
> +		};
> +
> +		cpg: clock-controller@11010000 {
> +			compatible = "renesas,r9a07g043-cpg";
> +			reg = <0 0x11010000 0 0x10000>;
> +			clocks = <&extal_clk>;
> +			clock-names = "extal";
> +			#clock-cells = <2>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <0>;
> +		};
> +
> +		sysc: system-controller@11020000 {
> +			compatible = "renesas,r9a07g043-sysc";
> +			reg = <0 0x11020000 0 0x10000>;
> +			status = "disabled";
> +		};
> +
> +		pinctrl: pinctrl@11030000 {
> +			compatible = "renesas,r9a07g043-pinctrl";
> +			reg = <0 0x11030000 0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			gpio-ranges = <&pinctrl 0 0 152>;
> +			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_GPIO_RSTN>,
> +				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
> +				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
> +		};
> +
> +		plic: interrupt-controller@12c00000 {
> +			compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
> +			#interrupt-cells = <2>;
> +			#address-cells = <0>;
> +			riscv,ndev = <512>;
> +			interrupt-controller;
> +			reg = <0x0 0x12c00000 0 0x400000>;
> +			clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
> +			power-domains = <&cpg>;
> +			resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
> +			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
> +		};
> +	};
> +};
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
