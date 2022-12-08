Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4B8C3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 05:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjJLZYpyIk+5GnPjT1nWDUx8C6YVcosuukWF2ogi0MQ=; b=cFvBfvFbban2af
	+vz7y1W9WEy6MrJC7l2HfmmZnySwBkMruImV3/2unfkS032sKdYXlNBzrfor8/CUZcWfd8I7ppdQ7
	XYDpJTxi/CQF6TOkO78m0JUY5vHKtjkWDVyedV+e1t0IAM+Z/7Z++YKF2i2xOBWjZ3h1PfNPmJD7P
	B9mDktLNFyWEOSPFai5EbdSCks2ThK0bmY9Dwk025xpGM7OsO+ySd5erz/uGOvdEuI9QEPWyCKbyy
	JTAQhPr+O+fDaiZUtNVqkKhWnLx73G9Ami46BY3ODsHH5kzfkqIGrRxido0Vla3VFORF8EMQR0eNn
	tw50R23nh8z8VDt6CqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3949-001yXr-7A; Thu, 08 Dec 2022 05:03:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3944-001yT2-AM
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 05:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670475800; x=1702011800;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pxJXDJGKQrX82RBnHn5FXXbtXsMEbh8I6Fc7PXHJz1U=;
  b=sW+I3HFOm2pq02u349x8hhC957m+s8IUlgv4oDtVIJHYn/jpno8b6owC
   U1A9qwH2rq9tJeLtM8nbUtSp3vapzM8e1+xXrFIonuu+vAUQtoae3InhG
   dZStngrPY70haFdhyVFXgJaH1yle16bOJiGslMlAbo60TtOti1HvNZXrz
   52vW574q7dCkk66uUVtcA0gm8SIBGfCFV1yx8xkKSoEINqcwvPeEUCjIN
   DOLKthxVR52eXXgDl7EUg1LI6FAXAXOtuW/zmd7MyYS5nor8AbOubLnBs
   jE0K+oxwJ/szBCnlLw/y3uB913MGdxjzxjNjN0w2GUO44OOiaF0rlI6v2
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; 
   d="scan'208";a="127061786"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Dec 2022 22:03:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Dec 2022 22:03:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Dec 2022 22:03:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8ZmYM/gXJtL76A5OToZuCejsUC8SpcdsxJkm8dIhuCZ+Ob+41W9lqrr2m3Z/90ewH/ESV3t9wQm53yxmymwlK/RlorXkxQWTYYmUv6gQmgm3gQcjwu+AbhnjzLKyZl9izc7MZW8z7pGkIoc3QKrb9j7ZbRN/OXfYSc6MSOVUb+Jc+ROIkv+o5ok6bgBahMDJUFp+NcJdH2y73GasyLua+VAvvsyXYaiXUd4ygH5e1RU3l4URzgGx01QVShfyqqghmPQ/m3714FjnwC9T5/tzVi1fZhPsDF73rHvma3Vg74kvwklZE+SOpU3e9VnsKXRMzxxu8xioUd+/Cz3o9InFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxJXDJGKQrX82RBnHn5FXXbtXsMEbh8I6Fc7PXHJz1U=;
 b=VFJ9scF8qfeU4G6a+etGRYacwRJge3/pPr9ov74eOvr7/f94T4aD6vBAtERtrQrSClBzPBD+Tm6y6t3qweBKCqF2+f+U4XYSYBZ7JVe/0nR5du5URUVQObZuHB7NsbPJuNDxkr/1WTv6VoYCDRndm2p8sa0q0G7eQioFtwidJKDbBOGTjwOxKgle2XNrrRBmAMFD1ult8EtDHCendweTiFuSwj4LRSk5I9pAmDsaTv/FZPcEBFBMN2NxxNKphkgHCGjvqn9vYOFyMS1qxqaLJ+E8xRKoqD5Qbsh2oJmA2ffAC52m/gAWj7pl6YFfq255/ztH4/bFN7c8UTP/JtUjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxJXDJGKQrX82RBnHn5FXXbtXsMEbh8I6Fc7PXHJz1U=;
 b=dYenBCx9VHyfSCkw7SKd6Fv/yx6GAqGcxYpk/uThmhQ7xY6RsEHVD8KoE2u/ronrxQ6Z536gLIzE5mSCqw2pBqqbQJbpNwmJkYajS10wyDnOJ+6Sr/m7pOizj9eOmSEuPjgLjM4Vtp4xFWJ3GoVnMCM/eTOm8xbJ0HPFnVDH2h8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5440.namprd11.prod.outlook.com (2603:10b6:5:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 05:03:15 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 05:03:15 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<christoph.muellner@vrull.eu>, <prabhakar.csengg@gmail.com>,
	<philipp.tomsich@vrull.eu>, <ajones@ventanamicro.com>,
	<emil.renner.berthing@canonical.com>, <jszhang@kernel.org>
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Thread-Topic: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Thread-Index: AQHZCmcOBUK3+nmnA0ymKzVA+UicKa5i5Z4AgAAejgCAAGvGAA==
Date: Thu, 8 Dec 2022 05:03:15 +0000
Message-ID: <734c72c6-b749-6969-c245-cc473df0cd57@microchip.com>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-13-heiko@sntech.de> <Y5D8CHkJZGmQKxdh@spud>
 <4261102.ElGaqSPkdT@phil>
In-Reply-To: <4261102.ElGaqSPkdT@phil>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM4PR11MB5440:EE_
x-ms-office365-filtering-correlation-id: 8e3f25a1-e6e9-47bb-67b9-08dad8d9836c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZnVnIm+MX9cjoew+RI6yvz9G8F667obqcKHUT6zw554RcIIZh0hrPwkZDRNFX538i60Zgd0+U9oidwB/kjdlebxAoOt5ViOv2XbG+U0DAvq7ZqO/cILBenLmis6Hf9CSQ6bQzq78E+0QkNqhp9XgNnNUEWe52FhGxsCbWjIVnuJJQSB/eUsZj1y3lUxlJNMZ5miq4PjMwVkdQBlpNl5RsuQD7vW9Rpyv+FwX6j4zZ23JMwCKbsWesdMsMUkFBco5oF/jxiFFTwQkPDP2WlJJD13GCIB2BepPeAIs0a1ZuI3Fwz8PL4EUdHuNEIiKZrLTpzaUXpXeBt5LrHVwTrTmasnYPhib8XQuy7OcrhxMi4AOYayXUuRdVXrV8IIiUMYoxWTBTg5RSFPKvaiYew7WWD1wne7kpuR23fzVJzK29bw85JLcP+0mERFjgMx4XtPtmNFdagLbrQUgg4kohty/OxOIrpxmu1ik5Iv1HTRAU8ikCynpRAk4rkJa8DsxDN5CF7YL/jCpeGkOv7I8pyjUWFgNZ74/HRaLBGh3/OToULiTNwykj1skygQDp5oJAhdugF7cZl6WItM9jK9u3WbAr+qmNXj4dyF0Vs/cbShEkJjhlPYcH3f/sjphCRWwfIh+qkHXdeKNRfyYSv6VEwYYPYCA8WqlokFz5vB2V4wTbSUutW6eKrV1kYxlkQnweD1CGNkwS1jb4U+Fme69pN1Iiumur4YF9dUEueWwV5lcfgl256V8I5DyccCEK7mh7DxxG2n+UQhgnRjWaU+xHVW9JQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(478600001)(122000001)(71200400001)(8936002)(86362001)(31696002)(2906002)(38070700005)(38100700002)(5660300002)(4326008)(7416002)(41300700001)(91956017)(8676002)(64756008)(53546011)(66476007)(26005)(6512007)(6506007)(186003)(66556008)(2616005)(110136005)(6486002)(66446008)(66946007)(316002)(76116006)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTU3STV0bDdOeCtnT0xIVDZKN3hRTFcrV0dwZmsxY0VINnpsN1ZtRGgrUmFi?=
 =?utf-8?B?NmhQNC9zUkxqUEkwcXRsWWlDWElPYkMzb2FXVENtdEtUSjJXQ1dnbUlmajI4?=
 =?utf-8?B?T0NWVnI1eGNQYnlTT0E4Nml0cmR6bnZCbjV1c3F5aUlGVHk2bm16Z09MamVz?=
 =?utf-8?B?OHBBa0p2SDRIVWVMVkJIT0RXTldUT1Z3WVpiNk5VZlpKQkFEdSsyUXZPcUYr?=
 =?utf-8?B?dU5aSUx1TGV4WWZPamJzR3pObzF3cW5RM1V6NFo5TmcrOWlsRk9ySGxiSWNO?=
 =?utf-8?B?aGtoWW1pdjRXTGxYNlNiSkxkaEtMRXMvYkNLQTVYZ3IraVVGa1NBNlhWdUVG?=
 =?utf-8?B?U2VyUDEwaTRRK3F2RGdCNWdYdzA5OU05V3ZhNEt6UEJTVGZPeEVZWWZkK1Np?=
 =?utf-8?B?elQ1TmtQNGIzNVMyUU1ReFNYVUVqSStuYXNoZ3FrUnFoS2tuV01EakRFREdp?=
 =?utf-8?B?MDJGU3FHcnUxdFJ3QStqRU9TYnNzaUZwMnVadFRzVFZSRWdEYlBSNm9kcnlH?=
 =?utf-8?B?YnhTK21XT3JQMmVvdXd3b1BNZmc2TExDdjc5WHFabWs3R2t5SWZOSGtQOStY?=
 =?utf-8?B?clJlR3lHTThUME9YbFNpV09DaXZObTErU0daYWZMN2Joeld0V0hwTWVQSGkz?=
 =?utf-8?B?QThIRmlKVmxaSmMwcXRHU2VhOHpoZXBlUUIxZzl6VjlXbTNRQmg4QWx1c3hv?=
 =?utf-8?B?ejVTc0ZUeGVQVlNDZWs4Q3pwcGd0b3JoTEZWMmYwTk1sZDBxeUs0VnhOVGlE?=
 =?utf-8?B?Z1VhNFFJTnl3U3I5OWpmRGZzenhROGY2R1RuUnFEK2lxTUpvT2lXUEY1NjE5?=
 =?utf-8?B?eVE2T05OVi96ajh1ZDYyM1FFY0pRV1JwWmhYNGZzQWk0Y3B6c1c0N2J3eUlM?=
 =?utf-8?B?bG1wYjkvMlRxSHAyV2pPNjlzM24zRUd5ZjVJcWw4eEJDYlFxOTF3MjM3ejVs?=
 =?utf-8?B?YkdQYzNSVDRqZk1sWUdXa0tZMjBOT253Uzlid0svdlp5dXhIYnZyLytLR1Zm?=
 =?utf-8?B?ZW8rRGtJQnM5NENCbG04d0I5Ym9maHdzeDFjMmN6SWprWkpRN3J6d2htMERo?=
 =?utf-8?B?dTFqaTFkUnpxL0pxeFdkY1BYSWpTbS9hZ1hFMmE3K21LQnFYSmNqaUo4UzNY?=
 =?utf-8?B?VDg4aVg1aUFWU0lmcE5meU4zbFVPdkVBOW85c1FNZFdyNGlwc2lrQ05ld245?=
 =?utf-8?B?d05BcEMzK2tvMVdPYmx2WlNtbC82ZklJdzVYN2hjbWg1RVg2Y21IUFlOd21s?=
 =?utf-8?B?azN3VkxxbUxXeW5WMmFWNlZDREl6L1kzY3lKbGVUUGV0dEpGbDlvQlRGZFU2?=
 =?utf-8?B?Ty9DalZDdloyakhvN1hCTW9NejYzVW9BYnFCTXdCNXZubXZjaUtRTTg0dDIz?=
 =?utf-8?B?T0VFVTFBVisxdkg1eVRDVWx1cnNaQ1dQWXVyaUVzVnd3RGI2RHpyZWc4b3BT?=
 =?utf-8?B?ekVBdS9GRjdUeXB3c0xLWVJPOTNEQnl0VkVJY1NXSUtWdjhCOXhlbU9hdzE3?=
 =?utf-8?B?b0UwVjlYOEdCa2lGb3JPUEZOcUQ0RUZRTGl3SFFsTW5PeVVnb294ZXc5OVZk?=
 =?utf-8?B?ZXZWaGJLZVN1MXN1OVdocXNOcWhmWnFRUmtoNk05bDU2WmtCQWFtaGwrVXlU?=
 =?utf-8?B?WTA0LzRmMVJHY09OK2I3N05aNVkvMHd0ejdqWWczTUM2UHQrOCtRdGpPd3Nh?=
 =?utf-8?B?NHdINXdNczlISnRyZWFQQ2NuazhSWlorbENKalNpTERqdzN1VVVxV3c1NjVY?=
 =?utf-8?B?ZXZZa01TYnB6V1ZCK0FuWGZUdXdoZDc3Sk0rRlRZTnI0ZTJ4UVpoM3NrYmxM?=
 =?utf-8?B?cml3MEM4RzNZU3gxSU1yZ3lCSzdxeFNiTFlUMW5kb3YyZnZXbFZwWXhYZGFN?=
 =?utf-8?B?NU56SlZUWGZCOXo5dk1nbk1lZFAzWmNaZzdLOWZnN3hsNmx5aWtJYmRYc2lB?=
 =?utf-8?B?SCt3VzdIUnU5YUdjRTZXZWljMkliRG5NNzRzRE9KYTNBeDhhZlJqdjRqdTRG?=
 =?utf-8?B?dHU2b3o4MzZoZXQ5SEZybGI1bEJGWXdDNmwwV3BwQnQ4cEw5Wkpibk1yWmRm?=
 =?utf-8?B?Zi84N1BNRllpeHozZ3FHZm9LL1FTZXVKRmF3c0gvd05PR0dvc2NwRCtZQUVy?=
 =?utf-8?Q?zO6+LXbo6LF8ENGUAaMdcVmvS?=
Content-ID: <0E010C8B20FB294797B0003A416C8F04@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3f25a1-e6e9-47bb-67b9-08dad8d9836c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 05:03:15.0300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weZTNd2cj9ZzazzbCdSLbH/14V4oXYABqNEbKi75lQQwOa9kbdMVJCdKf3XgSAt1uibrm9dXu5d8XKC9XItl3auQqW7Uvyh40mabJ5S7Vq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_210320_459181_4276E6A2 
X-CRM114-Status: GOOD (  22.72  )
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

On 07/12/2022 22:37, Heiko Stuebner wrote:
> Am Mittwoch, 7. Dezember 2022, 21:48:08 CET schrieb Conor Dooley:
>> On Wed, Dec 07, 2022 at 07:08:21PM +0100, Heiko Stuebner wrote:
>>> From: Heiko Stuebner <heiko.stuebner@vrull.eu>

>>> +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>>> +                                 int patch_offset)
>>> +{
>>> +   int num_instr = len / sizeof(u32);
>>
>> instr...
>>
>>> +   int i;
>>> +
>>> +   /*
>>> +    * stop one instruction before the end, as we're checking
>>> +    * for auipc + jalr
>>> +    */
>>> +   for (i = 0; i < num_instr; i++) {
>>> +           u32 inst = riscv_instruction_at(alt_ptr + i * sizeof(u32));
>>
>> ...inst...
>>
>>> +
>>> +           /* may be the start of an auipc + jalr pair */
>>> +           if (riscv_insn_is_auipc(inst) && i < num_instr - 1) {
>>
>> ...insn.
>>
>> Is there a reason for that?
> 
> I guess more of a generational issue - with the code spanning
> too much time :-)
> 
> So poll question, what would be preferred?
> I think I remember seeing all of them somewhere, so I'm unsure what
> to standardize on.

I'd vote for insn, since it's used in the functions you're calling.

>> Also, I've gotten myself slightly confused about the loop. You "stop one
>> instruction before the end" but the main loop goes from 0 -> num_instr.
>> The inner loop then checks for i < num_instr - 1. What am I missing that
>> prevents the outer loop from stopping at num_instr - 1 instead?
> 
> The idea with this is to allow a
>          if(riscv_insn_is_jal(inst))
>                  riscv_alternative_fix_jal(...)
> 
> etc, and everything else is a single instruction so needs one more
> loop iteration, only for auipc+jalr do we want to stop one earlier.
> 
> So to get this alternatives_fix_offsets() main entry point I
> made the loop do the one iteration more again.

Right, fair enough in my book :)

Thanks,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
