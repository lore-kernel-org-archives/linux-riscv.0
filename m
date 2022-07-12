Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FFEC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2G7LbomAfk2fi3SHBRo51PsD8BmBMHk6IZRlLN1pmU=; b=gxaf5+9/PNtmYo
	3pBCfRLwgEmSumqT/xw0y30/HGEyAoLeIsh133RMr5nl8nW14S0Aj3McieZs+Xrm2Ps/G1UCg26lh
	eoVl/yM36aHlSZHF9oP5AZfRNd+59bro33MspU6Vv2LTB6efmf0kvMmrCSQk2mXVAH7MTsSTYsNph
	XR66R+2GKmhKLxemA7NyInLUz/Y1fapBn1XYsRfg7/O44y7X6yYXWhHwp69FSu0fbsWGGXHLkmy5W
	QRhqFAxQ/vChYSvnjx/CXdl3zYx7seeGEosztJlIzdppOVjtwlmY1VDIC2uFszlmPBDTf69Gd6m3y
	jWWZOIWrwiJ+Lof6cBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIDd-00CPnP-SF; Tue, 12 Jul 2022 15:54:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIDa-00CPg2-9i
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 15:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657641274; x=1689177274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YuEaWosT0sNM1PODiO3Nt/G/4aj7xv6KXhT5XJf73SI=;
  b=IeZzUt4FnEMmn6hcb+XuTSKNNxYRXzwiZZdVVgyiB1qGGGftjZuCu6FQ
   c10btbtlT07P7iy+blKwKyQPL1BQxYa2f4DrTJQJGSMfnAG2z38JaxzFq
   lqvayemPtNu7V7BFvzh6CI4Cxo1wKe4WRGfGNkfRIqHId43kV9DRcOij6
   n9kRdiiF3IeWLMYE64po9vTk4l3kFqEkzDZ1jT9y4dQz5+HHKhk9PxKgf
   vyFy5p3EmDC1SFzkUpiHt0zZqy84dpAPXrkm893oymOa39WYveeY4vOgb
   g7Sw1WDw1ZnMZoQojCOZDktrRGKSp/09tyA58isvjI4DaVq1VKr8klTMI
   A==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="164386168"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 08:54:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 08:54:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 08:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6odVZyEGMrrlkDSP5jdahDqiULo/hs5ntrx4EkTKLxqaJRxfqrMMSqkU2+ss+k+bNt5Hy/ibSU5BFzKIeQytECImp9iUEf5HZlD9W3iuh7fiVZl0o+lyOpC92BlDWVihYuYmTqix7I2kdJKNoojkrZfeuhxRhBVSxXwhFtOut12uXo4clYAdBPYmZ9D1x7IbEuKE7DD2WA8eaDY0tvcq4lItjPiDGs15yzGxpS9oAt9Dbw/dCm6goIKgTSG4Jr9Hq0vg6RmjZCbuGMG+WHjYcMgiW6O2ku3v2/HfEe21QsPthitgMsmLZTgbmuaOYhuVZRgWGh3QtOkEwnv/x/LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuEaWosT0sNM1PODiO3Nt/G/4aj7xv6KXhT5XJf73SI=;
 b=dkTF1c0W6Dnh6VhSbgzSh9xeu0WwGEmhfgx04X62Z7kVMkpR47iLcYoXOA1LbHo6eykHdU3YU33j8/jJs9pz3M0WqcuidFzgbcLy7D3r27qg6y6p0xeMt1Ms1hjzwZD8raxKER7Me7StgxftBJpeO4fTVC60jQrQ3TLte7aRDXTM9ANSChjUjZbcEeUJ1TGwaJD2pIqdUWeShM7RSzKbwpOOPMG0dpz8xz4ukLZK0je8hINAVz2DSjaSEhu5iW8eC8S2mnv9HZwHLYQrc9ClWtHgZZSsNdgTFLivDKshGMcDaMV2tybup6dktSZnaZ34CpYAWbGAjOyXMp6EpBwMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuEaWosT0sNM1PODiO3Nt/G/4aj7xv6KXhT5XJf73SI=;
 b=YvLsbreR/Y9NB+2NyhHz8/JFICZ5bz92LxL4L/Wp/A+/mA0SFAmCmXc7GjcdN76CeRvx54os4Lde0upuwKWFhMvmxLMUuTWSqDxJzv2XD72F2CUDE4dHgZ2X3CIvVTKz7lad1xSLz5u24Lnk1j2fXo+D/pPoNubyCJ+uI7XKF/g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Tue, 12 Jul
 2022 15:54:18 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:54:18 +0000
From: <Conor.Dooley@microchip.com>
To: <damien.lemoal@opensource.wdc.com>, <Conor.Dooley@microchip.com>,
	<krzysztof.kozlowski@linaro.org>
CC: <daniel.lezcano@linaro.org>, <Eugeniy.Paltsev@synopsys.com>,
	<sam@ravnborg.org>, <daniel@ffwll.ch>, <paul.walmsley@sifive.com>,
	<vkoul@kernel.org>, <palmer@rivosinc.com>, <airlied@linux.ie>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
	<masahiroy@kernel.org>, <geert@linux-m68k.org>, <niklas.cassel@wdc.com>,
	<dillon.minfei@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<fancer.lancer@gmail.com>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq14CA+AgAA9+YCAAqfOAA==
Date: Tue, 12 Jul 2022 15:54:18 +0000
Message-ID: <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
 <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
In-Reply-To: <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a074618-6277-4f3f-706f-08da641ec7a2
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?bkRFd1pPK2JuSXBkQ3NuWERPT2VYS0pWQWZDZ09xSDFzdm45djlnUmtSdWJh?=
 =?utf-8?B?NkJ0dndjZ3Nxb2EyUkpXYjQwNXYxcWV6bXNWOGFaZ216RlJsYXUvNElTTkpa?=
 =?utf-8?B?dmxhdWFvcGN6M3I3aHN2MC93cFUzTjFPaHViY0dWb3RkZ3U2WkY5WElOdktJ?=
 =?utf-8?B?cm9lREJocmFBd09Ra2s0QVZ4dHhIQjl2Ym94WkRMTllTcEtWUk16b051R3Bj?=
 =?utf-8?B?T0Zla0ZSUklGckhtSzMzRFovNnA2NnpkSkxGUU8yeGFBZVJYWEZnSlp6NjN6?=
 =?utf-8?B?blBXclFtbDF3bG9pRkk3TUlBMnFCTURVV2szWTZFbnFPS1FrZjY0TmlscFht?=
 =?utf-8?B?ZXhXUUlPdm5JMUs2Ynlqczl3VFVmVjFjMVJSb2pOQUVCNW5Ha09ZUFRUQnNi?=
 =?utf-8?B?dzlKOGFTL3V6eWJab2lKdjcraEtsUVRTK0tPWVpUZTZJNzZNUG42dWRQVkFa?=
 =?utf-8?B?MXZDaGIveXFuU214cWwrUFVOVk1PQXJ5U05QRnUvVytweEViMkhVT29nbXNE?=
 =?utf-8?B?MWZncElLT05DOERvR0tFcC9yNkZmSVFxVU5iWGFmaU02NGQvZnA0alBsd3hu?=
 =?utf-8?B?RU9zMmkvMFhKRTFHaGRpMEUzdHoxTXN6T1FmVjFHNHNCdDlSQWh6R0FYWlJt?=
 =?utf-8?B?Nlh0UjBJWnJEUlJ6Vkh3cGEzdFBXVnNIMmJyTktWVzBDWmpXa3lQZ3d5bUFh?=
 =?utf-8?B?YmJ6djNtU3N3MXpoSnZOY2FpK3V1c2l2VFFMd3krS0dNOW5WRU5qUVpFSlYy?=
 =?utf-8?B?Vm9HZ0l4TXZSblc1SlFSS2JYbTludVZSWFVKcmZ3anFTRmZkNitZK0dvRm9m?=
 =?utf-8?B?SC92OUIvLysrWU0rZDhIQUdPaTJ5T05uaENMcnMxZGx3U1k0N3Q2c244WEYx?=
 =?utf-8?B?K3lsREI5dHFDUzEvVUpJd2p4NVBpWHd6V1Q0TytNYVNTQVNVb3hhaWtDWmtw?=
 =?utf-8?B?QWYrWTdyVjc4Zm9objNCRGNWZEl6SUlmalZKdTgrLzhNRStKdDMwNHQzaGdx?=
 =?utf-8?B?TzRSN0FtbEVEbEFweTRQWWVpYUN4MnByNS9sVlA1K05KQUd1R2pSdENYOTV1?=
 =?utf-8?B?cExPWlpFZE9NSitGc0o3Z3Eya2tPQ3BWWlFjS3BGM1ptRTQ3V0NkOHBXZWlZ?=
 =?utf-8?B?Ui9IL0g4d1FkTkJybDB5b0xDWXAyU3BLRmcvUWtBQ1VaNkxoV1ZkNkY4U1Iv?=
 =?utf-8?B?K1BVN1FZMzFFWHhGOHlxMnZiSUc0c2tkQzVMaVIyOGFQREZMRU5mSHc3NHp0?=
 =?utf-8?B?OCszbDlVTkZxNHZSckM2MFBkcHZRcGE5Um10NDBuV3F5M0gvUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(136003)(376002)(346002)(38100700002)(8936002)(83380400001)(2616005)(66446008)(122000001)(31686004)(7416002)(5660300002)(38070700005)(186003)(478600001)(64756008)(66556008)(41300700001)(6512007)(66476007)(110136005)(6506007)(966005)(26005)(54906003)(53546011)(91956017)(86362001)(66946007)(316002)(6486002)(31696002)(8676002)(2906002)(71200400001)(76116006)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFl2K1QwbDF4a3kxSi9laDgvbmJhdmVNU0J2QW1vOGFvaFFnUjd0eXlDcDZM?=
 =?utf-8?B?M0ZVbEdoZzc5K3BYTWZpbmZpMjBZbnhBUk5aV1VPZ2VVaGZZa3lsM291dUZV?=
 =?utf-8?B?blF5T3hST3dtQzlVYitoU3E2UE1ZaTdoNVpxTCs0bTJ6VTJTOHZFNWNnbWFG?=
 =?utf-8?B?RW53U3dCa05jWnZhSVpYbnA2N0FOU1pxN1ZCaEZtS1RpcFhyV1IrWkM0TEVh?=
 =?utf-8?B?VnNHa0FsM2hJWHcvaFR0V2VWZm9mOTB5RGFnak56andGMGdNTExEVkJhcDhC?=
 =?utf-8?B?NUllamNJSDNkV0drM3RHZU9DaHhtUmZTd2RZTGcxL0FvT0ZFUmIyZ1FwaCt6?=
 =?utf-8?B?QUdDdFg5UzlLQnNmd1FLSEkwUDJ1R0k2THdwNkQyMkR4SUJwQS9ETWFvbzdv?=
 =?utf-8?B?V2tyZFBndEtsWGVpK0JTTnNFUEtQTGN0MnYzVXRoRnE1ZTR2YTFSMVN3NGlp?=
 =?utf-8?B?YndTMkFnbmZmYVR3dmxjb3pJakpHbHZSK3VhYlNQWHVOVVdkZ2FnM0YyVWpw?=
 =?utf-8?B?enVOaDdqS0d2ZEVpYzVMM1E0RGx1TS92Z085WmxWQmYyaVVJN1hjVS9rdFh4?=
 =?utf-8?B?Y21pZUZtcXBBaXphYWkrSUk1dFdtMm02RktsSkRJTVVydzNxdFZ3U1Y3clFt?=
 =?utf-8?B?T2pvcGNHeDdPS2poOG9RZGphK29UQ3dVY3dXVHZMKy96SnRjTDN0RlpLbk5m?=
 =?utf-8?B?ckdnZEhNdVFVcEtQdG5EQ2xvcGNDR2xQbDlacWpseTNvNnhqZXdnanZpY2s2?=
 =?utf-8?B?Q0pIVndRYVg2eGdZWWhGNjNtMVkwWTllNW9VNFkyNmVrcFhEQzFuajZxS2Nw?=
 =?utf-8?B?cGM4UlkxZXBHT2RLaHVBcWVQYnVrbVdycmtiYTgrSUtNRUQ4eTBVaGVBNHBI?=
 =?utf-8?B?dlRKbkJQUXBkT2xNdVN6aVFBTDJ0S29qVUhLRzVJcFFVZWZKZCtXVUxYTFFZ?=
 =?utf-8?B?UEhQc1lKeTBPWU92dHRRWXBkbWlhNzFNZmQwYkxpWmU2eXNQRmFsaE1BRFRZ?=
 =?utf-8?B?NGxBODNuNVZuTmwxSEJIS1BEd01ZbmMrSEoxOFozd3FnNmtWdVNsNlQ0YUtZ?=
 =?utf-8?B?NHVuTXlPbldENy83cHI3cE1IcmUvUnVCWkZnWmk1bVVZMm55UTVEdHVDNTNJ?=
 =?utf-8?B?V0xaQmRDYjcxd0xnMFAvM0I5SEgrS2ZsR1Q3MkFCZmVjRTRRZjVDVXZjVEVE?=
 =?utf-8?B?cUttYVpYb3dPcmV3ekpPLzE0Slc1TkJmVUZMT21UU2NlU0poWk93Y1RKaWNh?=
 =?utf-8?B?c3RNYkUxSEkrZjRnYmFCSUw1QTFFcU9RcWhUTUo3UkNncmx2WE1qNkNWNm5h?=
 =?utf-8?B?bmtGR1RlSSs1T3ZPNVovaC9GdXBLZS8wSDlwQ3hnTjFiR2hIeXMxZzRzdDVR?=
 =?utf-8?B?MVJ3UDViTnEvN3Noc0g1SktQWCtyUzRwclJXUjh4WDlPd2xtZkcvckdwMmJY?=
 =?utf-8?B?RGJERzJ2bzkwVVJYR044TzNVRDZwMVpHL0tia2ZZYTF2QUZsaGdsaTVvcWxn?=
 =?utf-8?B?Rkt0Y3ZaNkt2K2JYeHFpU0U0QWtGVCtHaENGUHVMZXg0ZVFPZTVsdUMvV3Z3?=
 =?utf-8?B?NWRsM1dUdEczKzl2dlVweVdlZDRhbk1hWEJlTkl4Ym1MUE1GMGt0ZXB6MTVK?=
 =?utf-8?B?a0Voc0o1NzcvZ0VtdzNiMzZlaW83SGxENHBZTWRGL1VJbmxaZDlCQlhWZG1J?=
 =?utf-8?B?WDhMczdUMnNrWE9LZVBTNkYyYk9VYmlBVnI4TzBaT1l3N1pFZWFBMHZWMDAw?=
 =?utf-8?B?S3hqM2t5VGtlN1dWOERGWEtaQldRVHUyNDQ4TU5MQzBhN1V5KytBc2VDaHd0?=
 =?utf-8?B?WnRUYzJMVzFhT0Y4TEF0bWJ3UHJDRzZWR0hXazhua2pYczA5S0hucVM4Qk1i?=
 =?utf-8?B?QzljUGtGdXRFMUpDRERPN0FDZkhzYkNrZWc5S1l0S2o1dnhRZXFva0JNV01E?=
 =?utf-8?B?WlJncitVR1JtdlRnUGhrN0hqSjY4WDJzWHRpeU5vV0txaEtBNzQvYUZQQW9D?=
 =?utf-8?B?SlJxQlZBQU9NMTVTTjRKWlZ5YXNPaUxzbnRtZ1dSOUhUVllOZEtEeDlnaE82?=
 =?utf-8?B?eFlLSnluYkppdC9PZ05OZTBYeTJpQXE4Q1A4S244dTlPMk9NMHczd2NOaWkx?=
 =?utf-8?B?T3o3ek9abWpEdlErdDVuZmpBc3JaSjNQVmtYaEkwVHUrUVRIMU1Wa0VvUWwx?=
 =?utf-8?B?bmc9PQ==?=
Content-ID: <0182169B8398CC4F92E8405D8B660742@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a074618-6277-4f3f-706f-08da641ec7a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 15:54:18.7298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErUC4Y6SVxdPR+vdGK/OLujyQCvqJsr0nynDl4AOQfmylnJxJupF4e9eH/jXKK5uto9gWqOOfXhTt/B4bUpwpbJdxyKLUKiLdQbHJUyXDIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_085434_438531_B3826324 
X-CRM114-Status: GOOD (  18.72  )
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

On 11/07/2022 00:21, Damien Le Moal wrote:
> On 7/11/22 04:39, Conor.Dooley@microchip.com wrote:
>> Damien, Krzysztof,
>>
>> I know this particular version has not been posted for all that
>> long, but this binding is (functionally) unchanged for a few
>> versions now. Are you happy with this approach Damien?
>> U-Boot only cares about the compatible & the clocks property,
>> not the regs etc.
>>
>> I (lazily) tested it in U-Boot with the following diff:
> 
> If both the kernel and u-boot still work as expected with this change, I
> am OK with it.

It's all yours so Krzysztof :)

Thanks,
Conor.

> 
>>
>> diff --git a/arch/riscv/dts/k210.dtsi b/arch/riscv/dts/k210.dtsi
>> index 3cc8379133..314db88340 100644
>> --- a/arch/riscv/dts/k210.dtsi
>> +++ b/arch/riscv/dts/k210.dtsi
>> @@ -82,11 +82,14 @@
>>  
>>         sram: memory@80000000 {
>>                 device_type = "memory";
>> +               reg = <0x80000000 0x400000>, /* sram0 4 MiB */
>> +                     <0x80400000 0x200000>, /* sram1 2 MiB */
>> +                     <0x80600000 0x200000>; /* aisram 2 MiB */
>> +               u-boot,dm-pre-reloc;
>> +       };
>> +
>> +       sram_controller: memory-controller {
>>                 compatible = "canaan,k210-sram";
>> -               reg = <0x80000000 0x400000>,
>> -                     <0x80400000 0x200000>,
>> -                     <0x80600000 0x200000>;
>> -               reg-names = "sram0", "sram1", "aisram";
>>                 clocks = <&sysclk K210_CLK_SRAM0>,
>>                          <&sysclk K210_CLK_SRAM1>,
>>                          <&sysclk K210_CLK_AI>;
>>
>> If so, could you queue this for 5.20 please Krzysztof, unless
>> you've got concerns about it?
>>
>> Thanks,
>> Conor.
>>
>> On 05/07/2022 22:52, Conor Dooley wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The k210 U-Boot port has been using the clocks defined in the
>>> devicetree to bring up the board's SRAM, but this violates the
>>> dt-schema. As such, move the clocks to a dedicated node with
>>> the same compatible string & document it.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>>> new file mode 100644
>>> index 000000000000..f81fb866e319
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>>> @@ -0,0 +1,52 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Canaan K210 SRAM memory controller
>>> +
>>> +description:
>>> +  The Canaan K210 SRAM memory controller is responsible for the system's 8 MiB
>>> +  of SRAM. The controller is initialised by the bootloader, which configures
>>> +  its clocks, before OS bringup.
>>> +
>>> +maintainers:
>>> +  - Conor Dooley <conor@kernel.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - canaan,k210-sram
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: sram0 clock
>>> +      - description: sram1 clock
>>> +      - description: aisram clock
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: sram0
>>> +      - const: sram1
>>> +      - const: aisram
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/k210-clk.h>
>>> +    memory-controller {
>>> +        compatible = "canaan,k210-sram";
>>> +        clocks = <&sysclk K210_CLK_SRAM0>,
>>> +                 <&sysclk K210_CLK_SRAM1>,
>>> +                 <&sysclk K210_CLK_AI>;
>>> +        clock-names = "sram0", "sram1", "aisram";
>>> +    };
>>> --
>>> 2.37.0
>>>
>>
> 
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
