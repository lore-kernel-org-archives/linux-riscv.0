Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B42C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPA4zeSC4/EupFRW9zqhtGqDZSITbcHMPw13Nr7rkC8=; b=TK88hdI2gReINL
	nyYlu2ZIDrGiZREVFsGYEeZmr0xXmh7mgWs9KqXU+yOQpVHMJbolg+ZTgpRcOFKTUAbFYm8NDZKGU
	ekb04CXDNdFj6scqpGuyPpQRapf2whn/glZtE/cnfeLYbkOSedimB7TM1cnXmIMuB1yMz9H3/ZdKy
	8B9OWe6PZ4gdX1ySPsiER75DKF7SsLc4+KZiiDYqd/DonJfdGQhUEoT3K0Epx0l8D+/1y27qBLTaZ
	SGTsanB7uIlBJaHK/NDldkZB2sHIqDI/cn2YrZ6gfjQ34uGmnNl2mzfSyMWDwMBY+N+IyO89QVYwR
	suMbF6CWvyuYiQREaLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3aWG-004kfX-9a; Tue, 21 Jun 2022 09:50:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3aWC-004kc1-S7
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 09:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655804996; x=1687340996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OHLN+xKuDAdOkKYz5NeK2fZyO7BGajeFpWnzu5OM59I=;
  b=MaeR8RxcX4ikvmfigIGBAx5l4CBJQ8x58fK6WEUTXQjvBXoMFjOEmxB9
   NwUT10uotoaVrR5BQwxTyPIgJcdrvHL/tZS9FC5bG0otVwv4UhzDEhZlS
   KRBr7mu7v/AFGJas3mhO4t9Ed5Le97q8Dl55srxKA0X+Jsd2MiXpJ73oZ
   pB+HQjqyd7f4JOW0vyfsZszUx5Z0tW4nSxeK2R66inUTaOStSXnCjTAH9
   nMwMCHlQHZCqvKBQ1TdxJDw0H2oBnjVgUUpkBOTit6Wmv2IRJ6CDd2Oby
   EAJY1mpb6BtYeuVZAlqfS/v6uDeKRe8Ct1k2qTt1do3sT10l539pcqmsE
   w==;
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="169260295"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2022 02:49:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 21 Jun 2022 02:49:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Jun 2022 02:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+mhLOCMyH0q3eiXe7lt/vfSYhHn0a6tZdG9tQQi7BZY74snnpTm2TEFA9HW6KwmdSDcTO71O9CxNuQjv9PH9W/kK8OpZ0w3HUdV7P5fQ705vmT4z00ssKbsiIoJTZY8Z2ZeqCG6/KELwd0H0TQT25qJw5hV2gx/9dqpGzX+RmpdIZ+znudVaNQoFS+9ZaEX68uJ+XnIguxdl74+fyMjg3JlKPR0hI9iv0q1lSaSwnj5DgqjCZQWdK3jIb7c6XWEh0vw3GBLBS2oIoUl1wmJfhtto9RDkpREPphGDdIr1DISiWYBrUb3v1eZCa9iDfFrUncHxOYGma1KRixe8junCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHLN+xKuDAdOkKYz5NeK2fZyO7BGajeFpWnzu5OM59I=;
 b=UWODXtY5qjJ/Nt40NPikt/yNK8u7LOa5todzZ0WliLDz2wNuR3LGU7OKuADMoM5UZELknxL8otGvc2ziulvoVLnioYWxq63keHxioTEEDZUcI4mtZzVT2hnodO5KIFUCokd+fSRAj9CkiP/l5oJKrEqu5A0jdULAo+mmRePcRdeZM3BOcEP2gui0n051itQy2RB2MIzKpuDB/N7/x9JqpxeeBvZHNyop6pKna+aHc3JE2iriRWNDi2fNOT6xW3xOIR/ZcPQuhZS9tSZk+t20RW0iMJsPqfHagmg4wsrTPOY2038zogYuPn/3tc7WgKu2YT5JANNoOC9WwsMKhtguOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHLN+xKuDAdOkKYz5NeK2fZyO7BGajeFpWnzu5OM59I=;
 b=cM/yCs6g1ahmWjyqX1/rR9c0YMHqKYKxmVmR/8Jw1mBgGJI45eCIjriJNEq4aSzXDaRg64gzeCU5RIOxMDF6aq8BZsXQcRpIR4moDafW4AuoyJyJbM00pTkXZLouxPHMlEWX1MNAek/LUcW8XsbI972JeWt9Rz4YouwFm65fLKU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB0044.namprd11.prod.outlook.com (2603:10b6:4:64::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Tue, 21 Jun
 2022 09:49:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 09:49:40 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <fancer.lancer@gmail.com>, <tglx@linutronix.de>, <sam@ravnborg.org>,
	<mail@conchuod.ie>, <Eugeniy.Paltsev@synopsys.com>,
	<daniel.lezcano@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <masahiroy@kernel.org>, <geert@linux-m68k.org>,
	<lgirdwood@gmail.com>, <niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<jee.heng.sia@intel.com>, <thierry.reding@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<airlied@linux.ie>, <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
	<palmer@dabbelt.com>, <broonie@kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@rivosinc.com>, <daniel@ffwll.ch>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQCAAAjWAIACL32A
Date: Tue, 21 Jun 2022 09:49:40 +0000
Message-ID: <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
In-Reply-To: <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b131e88f-9245-43ac-b541-08da536b5c87
x-ms-traffictypediagnostic: DM5PR11MB0044:EE_
x-microsoft-antispam-prvs: <DM5PR11MB00448ABD1E6B357ACC2EFFAC98B39@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mLg8IczmC7qZm9u6rZ3reECn6Xxb8PUB5xPFgmyiUL542ZreA708ESiHbBVYul08B4WxpYbFeJpKO3ZJJRVaWUT4H93YX/z8N7Yh6BkKSy1PzcSqItXUafcgVi9BHTfklk7BUiIx9bW46Hx6LiAOM9ybg8AZblhVnnyBqacVDTXLCPWpCpfJgE6ZfKd6zFG7QpwBsj1fTpsBOXfMSum6K+BeAveQg5H36Ozsl9y/M7c2nB9jTyDCLxJ48q0w4ZhEtcBikxWPBATDFIEUuRKZYLW3ryTDt8nVVRzUJsIK2NqmbqQHxv+oA0IJ8Y5ZBeJd2s7uZHtEXcaZ22U62+8/crbKHnm6FoE0IKWGw0AflDzIvKHNAyLM+65nRE2UnZMOiiv0erETmdeTd62WKqhuDjMn0meGT1Me2wcjjaU6hxNQdZY9sxGuS/5MBHY1BceLupsTjB2itxBtsRDjDbkH4PzqvmbCBPY63sS0Whv3ZMsvaJ8SyxbQVuxnnbT+WO9H3k2s+FbQtl0byZo5x7DCPdkYi+DGBGmoHkWv2m5qP0zvVTfWvDEV9ipwDBA7u7s1q/j7gTybF8ey9KjqUgyxDASy7unbYrCo1inYXdFNEFmbaqeCpcRvjM8eNf3/bQ03idX6smWyocev/Cc/spYhSNcHpIj6p7WO7XcwBBuqF+AAGDEhNvWfR9oK41tROAhbrewP7lHoRyRzlcSQnge5sinlRGYYLcKtVhRHd8iIrz0mYdmf/GTh7tog1GVxrr9Rk62zpuxIosgez6zH62f7TQGdyBAtNrMxN/0FJ9ohEfxXDq6im6hPJOlKNbp7DBi4O6mVP2iKT26AGNmsM7JECmLqS5scna+VN1HLJ9cmvOw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(136003)(396003)(39860400002)(376002)(38070700005)(2616005)(186003)(83380400001)(122000001)(7406005)(8936002)(2906002)(4326008)(5660300002)(31686004)(36756003)(7416002)(53546011)(6506007)(91956017)(110136005)(316002)(71200400001)(8676002)(478600001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(6512007)(26005)(41300700001)(966005)(38100700002)(6486002)(31696002)(54906003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amJJeGNYUTFNOXZHY1EvTlpnY2M3VGpZb0lpZzVYRC96MUZUYytWaGxPV3Bs?=
 =?utf-8?B?V0w1alBFMTdDOFc5amdqRzRqM3dkK1kxdkRrQjdrdnJSVzZXUzQ3aWpPeEtN?=
 =?utf-8?B?bnZHVkF0enVLcVBHTTUzL3N4bGtLZFU0Z3ZmakNRTWp0VmhzazZWcnAvQVI2?=
 =?utf-8?B?blAyN2E0ZDFYa1VQR29kc2NtWkRwcDVVV0V0aldhVWMrRE9HcFpaKy9IWS9J?=
 =?utf-8?B?cGZSLys3VGF0QWJZaXI5amFUKzZKS3FuemNUMGhMdmNlQ0ZqRmsyRVo2MUwz?=
 =?utf-8?B?a1hQYk1zSUJiWHd3dHRKdGY0NFZ5TSs3UDdMN21ia1VFbGtkRjAxdGNYMDMy?=
 =?utf-8?B?WndwVElTbW85QlFIRmNJYTBmcDR5ZFUrN1puZUdzWE5ZR0ZjRDcxakVpZHBI?=
 =?utf-8?B?OUhzdVYzT2pUckVxWXZadmx4bjJ1UlczcGxoYWhzYTRHTUovckFON0k5Q3k1?=
 =?utf-8?B?dFF2WHhnd3FKMEdjb1M1TU91QVFDZnlhMDJtODNxWGo3MzY5Mkd6M1htUmha?=
 =?utf-8?B?WXRLSG9oYnoyNlNxaEQ1d3NzN0pLektyZHdhVVNXa0duQzFXanVGMzA5MWtK?=
 =?utf-8?B?bXdZV2MwMnFxL0JQR3NkVC9ORGIvT2lzNFM2UFJYRXFIeEo2d2NUR2Q0bi9E?=
 =?utf-8?B?Zzd6RFFkUUVzeFFKbUlnNWdwZDNQN0E4N3VuekIzem5heXNGeERTZkR0OUR1?=
 =?utf-8?B?NUtCbHo3NzJ0RldLQ1VpRE9EUXVaMFZHYzMzWWJNakRWaUFwUXZ1OFVpZUtH?=
 =?utf-8?B?MllPZ0FRZ0dzam1yRklPck02bm01MkM1YlRUK0J4YWxOWXRLY1VSb3NUenVo?=
 =?utf-8?B?Rlp3TU9WVXFHTVNGWjdRZjZHNHYzbUEzT3VrVTBNWUZJcEhZNjYyRkw1N3g5?=
 =?utf-8?B?QmgrQ2xHMnFZa3hjTVAxcW8wYU9EQlNIRGF3YW5keTRrN1E0eWVnUXphL1dM?=
 =?utf-8?B?UXdEcnB3Wnp5VEkzdlRXbG5JbngxSkZWcUJzTVJENGVqTWd2bUFrWXAxZTlF?=
 =?utf-8?B?RHlvR1EreDNsQ0ZZNitMKzNtQ3ZXNWVIWnExWFMrQWJBdkZ2THVIYmthSFBV?=
 =?utf-8?B?UjJRVGlUS1RtMEZOT21QS2pzZUU2Wi9PQ3V3VDlvbTlYbkFiRFRCVXAyWE9a?=
 =?utf-8?B?VWozcEZVcEhTSmtiTmpBZU5wc2lwSHhTSFBWbHNKLzlsN1JUT2JvQXd6cnJI?=
 =?utf-8?B?c3J5djNNN3pPbE1yZnUwRjRkTWlJV1dHajdDKyt2VzVkQ1BQbUNtM0g4aDZZ?=
 =?utf-8?B?NlltTnBaVUpvQ2M4Y0NKVlFzekJQYU1IUlNrQlJ3VDlqVkZmdVZXVTFYOFJz?=
 =?utf-8?B?QkYvL2dvdERSVnk2aldFVFNVSjVOTzFodWh2eitpcFV4YWZ0dEd3QkVORGxF?=
 =?utf-8?B?YWtXaFBpdVdScno2aG1lNExqT0lZSkJSTElYV3ZEQ2daRElVak43UzdZUjdv?=
 =?utf-8?B?TVlaTzA0WmpPOEI2bkg0NDUvQ0VRaUtYZTFLYjdUdllCS0hBWnM5UThIV2V4?=
 =?utf-8?B?bUxwWW9STlhBdUJCeHV3WkwzQnlQRnZuSXJQa0pvV0pLMUpDdEMxanNjWWUz?=
 =?utf-8?B?eUp6UFV5cVNRS3Z0eFlZNEh0VTBqdHRaU1JodFc4a243ZWNOWFNrMGY4Q3o1?=
 =?utf-8?B?elFLRHBsSFdJU2x4YVBhbUxPbW1NdWMrQ2lQRExYbXorUFZ0VXlEcG9BNytU?=
 =?utf-8?B?cGxxTjFjc3JWL0w4dFovZ1ovaENnVXB6dFoxelJXdG5ibm1BUmZxVTdHYVhC?=
 =?utf-8?B?cHI1THpTSnhseTQzZ0g0UlM1WU1FWGUvODhLcldYMFFQM2gwQmVRSUM3RTBQ?=
 =?utf-8?B?OW82ZUFLbkZrWmNvWEpTQzdneUZPTHhQc1hrcXNWQTU1QW5XZkpxZjNYbmQv?=
 =?utf-8?B?dWYyVXMzUmlCOUN4ZDcrNHdlaWtZRHdqOWoyQ0dNY1cvS0NoY1psTGJzWWZR?=
 =?utf-8?B?cUJlK2kxN0NKMHBlYldwc01BR3kwNnNKbjNqaURqQmtUWmVlbkJQUGluMVZ1?=
 =?utf-8?B?eWJaYURxeE12OU5va1pqU3RSdG9zYWE0bVBLbjkzSlcxZThBdnpwMmp3eThl?=
 =?utf-8?B?cUtaMXk2RHVHQnBwc0FHSmQ0SHpkNnBhNndyc3pRZnZGWE1KTUpWM0JicXR0?=
 =?utf-8?B?YkpSUFN5UjZzT3Y3Zk53MFJKZi96M0pxSHE4Yll6MFFYSWFYeVJlTWt4ZEZT?=
 =?utf-8?B?cnRHWTRwWW9uSHI4ZWRpdnlZcmwzQ3l1Qy9Ba2xSWk9NTWhVV0R4T2ZaV053?=
 =?utf-8?B?K3Nja2FBekJzbXlkaDlwWStSVEdYWXlFRnJRSkhlSjhpTzFSandsNGxkSTl2?=
 =?utf-8?B?VnpQb0V6ZWh3b2dkWjlwUGVnelU1cTZ0OUF2aFFqN3BpSG9QTXhndz09?=
Content-ID: <245476FDFB81AB4E966157C506C86088@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b131e88f-9245-43ac-b541-08da536b5c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 09:49:40.5037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t97DO1wte3DbGIM2nmkW4MtcJ45txWuca8s5dJJdWSSD36VaFY5bf2HJHkxI3RKuBhHiF+X7GJjIlxQXjnWwk8sXODVBD2DaK4rOmdhXlGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_024956_944948_74AA5FBC 
X-CRM114-Status: GOOD (  17.03  )
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

On 20/06/2022 01:25, Damien Le Moal wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
>> On 20/06/2022 00:38, Damien Le Moal wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 6/18/22 21:30, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> The k210 memory node has a compatible string that does not match with
>>>> any driver or dt-binding & has several non standard properties.
>>>> Replace the reg names with a comment and delete the rest.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>> ---
>>>>   arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>>   1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>> index 44d338514761..287ea6eebe47 100644
>>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>>
>>>>        sram: memory@80000000 {
>>>>                device_type = "memory";
>>>> -             compatible = "canaan,k210-sram";
>>>>                reg = <0x80000000 0x400000>,
>>>>                      <0x80400000 0x200000>,
>>>>                      <0x80600000 0x200000>;
>>>> -             reg-names = "sram0", "sram1", "aisram";
>>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>>> -                      <&sysclk K210_CLK_SRAM1>,
>>>> -                      <&sysclk K210_CLK_AI>;
>>>> -             clock-names = "sram0", "sram1", "aisram";
>>>>        };
>>>
>>> These are used by u-boot to setup the memory clocks and initialize the
>>> aisram. Sure the kernel actually does not use this, but to be in sync with
>>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>>> kernel work fine with both u-boot internal DT and the kernel DT.
>>
>> Right, but unfortunately that desire alone doesn't do anything about
>> the dtbs_check complaints.
>>
>> I guess the alternative approach of actually documenting the compatible
>> would be more palatable?
> 
> Yes, I think so. That would allow keeping the fields without the DTB build
> warnings.

Hmm looks like that approach contradicts the dt-schema;
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/memory.yaml

@Rob,Krzysztof what is one meant to do here?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
