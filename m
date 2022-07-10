Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47044C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Jul 2022 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByPScnVcg642MkysuHyStyfXru0RPoK72zpwEwCPJb4=; b=v5ZOIz8xt8bU01
	kMi+YCzaIXRHdZ5Jx9dWjvOi75pgqiHcXDoCrbpuj1CObPxAcwADJQae6OYSo/RG3gi5etkpj0oKb
	Au8LUnJKkLbh38VXkCWM+cTaheqgRAndBkH8erx7k9g+MKCtdvJa7DVQsoNCiYJnMpvFhlRJJDsKp
	GdVpksHCsyGF6PXj5bt0QDcnv72cDm2sDPnIH8dlnVEoTs+CRo6Iw1dm0F9+jozf7Yz8Bm/apIP3c
	NGSQdkqRW/uvT4ODeejT3lrDjp+HSDYUwQcUd0qS8FJBrler8RLtIxMg072PYnbYUpws0LN/l06qH
	Mhv90JjdefRgSrZ3Q8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAcmJ-00DM2c-Ev; Sun, 10 Jul 2022 19:39:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAcmF-00DLxJ-OW
	for linux-riscv@lists.infradead.org; Sun, 10 Jul 2022 19:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657481975; x=1689017975;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1jopqVqZjlZonGknYBZnD7z03CRuZQK7TDwif9DIxv8=;
  b=r/u+dBoxvVZcey/AYzhJo5mYHlxvVdpq85dZ73BRth3tKK8mQAo+1WUR
   mnk52pm2xLTlTOkDAk933mIXdTsCMNnKju/XSx7tY88lhJ+cz0BxIS+1+
   h7iVfGrOr1pOZ3cJC9fTiZD5JFp3Wo+y1T7Iso8GlZ/MqiOVOLZVhAYi0
   yuEEHy/fXtD9CQP/TT6dPLm/UO5IKYfvSqD5ov6L5gToyokDepjJSIxGB
   TassnLLnbMKQ2sR8ibYvaaro4Q+pv5SJGadIrtVveEGwmeZETQyxHhthi
   je2CG7q12oYxmNH1ZUIidQ29ILUmANv8kD4GT8RGoh+FT1SRwz2zQuFM5
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="164109211"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2022 12:39:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 10 Jul 2022 12:39:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 10 Jul 2022 12:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjnpHe1VdhlWD+SpOIMrB/II8hdxVr00fT046W7/vqtihKjeBQpQz+Yyb19HHVP+Ty+jAUEYEZqbl7hlJPN8oB1eTqJ/2T/jyrqUKg9XXRDRa3AUOkM3bmGNRmHcQFADoI2ci0x3/8kR88DN6MeAnumrZSX+oMyYIXfb2UgMEKMAUR4ObEKiUS73yQUjeAID8wnPkNz4ixIi/nPUu9O1iALW1P67yBi/sQ8PRDjxuN+3H0QSE7mEWyZjpUotcZHmrkXiMt/C9uw0Kx7kQz9ei/Ih6t6iNPxmWhnqe51DNFYVpr4gNOLICzRhn7X+lxIc7hrzkx25nKQ3XF9F0wayzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jopqVqZjlZonGknYBZnD7z03CRuZQK7TDwif9DIxv8=;
 b=g7IhIuiQXdcaZ/1jIOk8aqFYUg15GY7W1grDJzTRAU2p7bNyvRxPrqCOBvQO8CZLu/THODUnhKRw8Rd5WRFSa3RRjTbF4lsKMAuSNJy4ejh5FrGXza/+R4GdSq7Y2+u2QbXd9UeJ1IgVhVaGV9RT78MEp8Zyd/r1eemr0RGTC5vaLnPGSOETtJf2dUDSM97WGf5NQV7876zlB/wUTb8vLb+LjDccOkRb6PZWV1OizV76/4qAOdNUDI+5MWLaqjIQNY7MHZQo2ZFd4wfdrWyRPEMQYnwYHuKtMmBgIy0cwDpGG8JQ8BzXKoai8JMqpiaMJ9AI/ljMoG1PgpEzaSScyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jopqVqZjlZonGknYBZnD7z03CRuZQK7TDwif9DIxv8=;
 b=diTSBoDXcCyRZCse3gpk/cQof7ym+zbqiVZBNaCWlxGmOrQ4QPnLWeM2nxb4ikyrwAcUIVpyxDcRZMdM01ouns8poVNXyzDVMsxrQP09GGPDd2Q6I8gPCqo6YTl14uLoBHgbIj+yUzwekWoDvycjJo7oImjbFjn13dorehBvQB8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Sun, 10 Jul
 2022 19:39:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Sun, 10 Jul 2022
 19:39:24 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <damien.lemoal@opensource.wdc.com>
CC: <daniel.lezcano@linaro.org>, <Eugeniy.Paltsev@synopsys.com>,
	<sam@ravnborg.org>, <daniel@ffwll.ch>, <paul.walmsley@sifive.com>,
	<vkoul@kernel.org>, <palmer@rivosinc.com>, <airlied@linux.ie>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
	<masahiroy@kernel.org>, <geert@linux-m68k.org>, <niklas.cassel@wdc.com>,
	<dillon.minfei@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<fancer.lancer@gmail.com>, <thierry.reding@gmail.com>, <mail@conchuod.ie>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq14CA+A
Date: Sun, 10 Jul 2022 19:39:24 +0000
Message-ID: <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
In-Reply-To: <20220705215213.1802496-5-mail@conchuod.ie>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e244c075-bc2a-48b9-3042-08da62abe4c9
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?YXBSQStoc2paOUFPOWd1dGp0VkpLeXcwLzJvQWZUQVlIQUZCeG5WN0Jpc3FB?=
 =?utf-8?B?WURRVW1HKzcvZUJpQ3VNTStLVk5mcUVQTmZ1ckRrcTVBTXFGU0UrVW9EZUVW?=
 =?utf-8?B?OTFQV3Z1WGJkNlc4UUdONFRqekRwTmNMRlN5SFZETk1DWE5JQzJUNFJyUFgy?=
 =?utf-8?B?aWVXcGxmU0d1azBZdk83VVFMZGUzbjBjT2FzMXE2WE1QSGVPOHduL1NSSGo4?=
 =?utf-8?B?cHVYRm8vWUJ0NWVmRVNlR05pZ09Rb1d0dHJ1OElEeGxGTkFsZ0I2dU0rYXox?=
 =?utf-8?B?SG5RbHRZcjI2QXo0QXdKc24rTzlPenZUekZZdnpTT3NlVk55WGZ2aXFFY2Nk?=
 =?utf-8?B?NTBBWWgycU5PRHpMWmhlQlg4S1RPaFkzanYzQUNLVFhrUWNuaFdYV1RWcW0z?=
 =?utf-8?B?am1wVEVlcThWU2xZUE10ckJ5aGdhZlpyaTFndVJobkt3MUc2dzdnelk5c2hq?=
 =?utf-8?B?b2xXQnBTaVovZFdEcno5cjVlcTUza2dUaVg0NGE0US9GWXZWTUpYcEltMGFW?=
 =?utf-8?B?RlRMOE5vbTRZMm1vS284bThlOEtUMlhFdkdWT0JJLzJWS1drSFFKMWJ1ZHdT?=
 =?utf-8?B?WjQvemp6QUZyWXVOWEJpZ2d2by8yL1NEZ3dUTzJoZWdCaDRMemZTVU1IM1RC?=
 =?utf-8?B?VXpIV043TGF2bkYrQVQ0aTRaMWkxcThOTldWb1JtZEU3KzE5MnpCYVRCKzN6?=
 =?utf-8?B?MWpOZ2I3Rkt6QXBTWk9uMFZZZXRCQUJxbGhiUDFwekZ3NlFTYzV3YnRWZTF2?=
 =?utf-8?B?bjlOM1ZURFhxc0xiZFZBQUlZZ0Vad05zNk1aOW1lTHl4Ri9Celcyb1c4THFO?=
 =?utf-8?B?QVRsZmVzT0hXVlJCdkFoaXg4NktCYTNHTXdHTnhNYmZLZHRvR0dqbWZVWTBX?=
 =?utf-8?B?MVNoMy9rSEFQRGVmcEp4TkJ5cGFqTGpMMFlqVjVlN3VaWnVwK3U4N2hsV1Bi?=
 =?utf-8?B?MFlnSjEyL1RFSHpkOGJWL0gwblpvMVpuWGhzc0R0ZWhrQXZHT2VtUlRTekRS?=
 =?utf-8?B?c3dhTEU0d1JSRDRNbFUxOUtzYWEvN0hCTEpPcmhHQzhUUG85KzdvaWdONGhz?=
 =?utf-8?B?U2xhWklXRjhHbDR5NWxuUE4yUFlCNVowN0YzTUErQllPcjZuTUpHTm9SYzlo?=
 =?utf-8?B?RFVRdWhMWHN0ODllbSsyOHlJbGFDaGpLd2Q2V1E3M01MQVptYVlYMTFZMnV2?=
 =?utf-8?B?MWZoVDB3R25zS29BbW9UcHA5K3A4MHQxb1daaWt3azhqSEVGL3hqc1luZHND?=
 =?utf-8?B?ZHpzQm9PL2c1MURIa1lqMEE0enFEUkczUnZVeFpPeUlaSkVrdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(41300700001)(53546011)(26005)(478600001)(66446008)(122000001)(966005)(6486002)(2906002)(6512007)(31696002)(38070700005)(7416002)(5660300002)(6506007)(8936002)(31686004)(54906003)(83380400001)(2616005)(186003)(38100700002)(66476007)(76116006)(36756003)(8676002)(91956017)(71200400001)(110136005)(4326008)(64756008)(66556008)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFZ1WDEremlaekFGS29QZWJhSVFoUFJYeC9UVjJJRjVQUnVXYkxiRTRFdERW?=
 =?utf-8?B?TGxuVVI5WjF6UU5aZC90Q2RSamlmTUFnQkJCd0xyZTkwU2htVnUwczVYN21j?=
 =?utf-8?B?aCtZbm1PeG5GQStSaFY4WmFaZzVZeG1iYnoyQUZNY1pQenlKVkFFTVd1RWUw?=
 =?utf-8?B?N0VCQjhSZml6QjNJK2N2Qk9lUE11cTk2WjRxUllkSisrVDRXVjNYUzJ0ZEx1?=
 =?utf-8?B?MGVyRnRCOWlQQlU1Rnlab2g0QStvaW8zdi91cnBKN1ptNDNWMU5KQWxRSzk4?=
 =?utf-8?B?VnZFY3dYeml2NHRXWEZyajl3dEp2WjVOWGY5UlV2MjdqTlFRMVl0LzZUZmZy?=
 =?utf-8?B?cFpPUFdlZnQvNnVPcGlUOTdsSjVzRXRva0c1RDl0LzI5d2tQZk5wcVRMZEJR?=
 =?utf-8?B?dEZ5cjQ3YTA2SFBHeTRFcnJISXhLSW9hQmtBR25vQ2hQT0NQelRObzNFRkdt?=
 =?utf-8?B?QlpxOEZXLy9QS0FDOWFNM0tPQTk5SHNzNUdsc0FnQ3NMZ0lGanQ2cGd4UXFE?=
 =?utf-8?B?S082TkdlWFZUMGVoRVNwdzM4U2tJbW9OUzNIOU9tWFZ6dDBPUnYxM29OVFBS?=
 =?utf-8?B?b2dmRGtqTVg3dkJ6OHEvUkc5MkZ0TU1wcW5EbVdzWCtCOW96UURLL0tyd1Vy?=
 =?utf-8?B?YjY2Z29DNmFGN0tMZ2hkT2tkOTNrOWczM2txMTJvWDJwVkJLQTNsMFBlMmt1?=
 =?utf-8?B?QUJrMksxdkZYMHJkaThITlFiMkc2TzI0T09lZWJBMnFJODVVQ3dzY05pbU1P?=
 =?utf-8?B?VU4vZjBGVmlmZkROSXFzT2ptSWVNcUcxRzlLcFoxNGRvNTdxbVFYYjV1NE9r?=
 =?utf-8?B?ek5WZ3NjUERDbzF6NTJIOFdmcUJ1c3liY09Rb1JWcmZMTXJXbnJiQzFWejdW?=
 =?utf-8?B?T042R1g3anZGMnlyd2l5dnN6TlFlSEVCemhvQlpWVWtPclBLMjY1Wm0rWjBT?=
 =?utf-8?B?RldmMUxkWTh5bmFNYkdoM1QveXN4Z0tVT3lXTE5Xamt2elRoNjRwbllibVdz?=
 =?utf-8?B?QWI2WW9JVllVOXpWNEZhQTI0SkphUHdpYkloS282aEUwRGQ0R280SzJmRTN2?=
 =?utf-8?B?Z1dMNzhHY2NSckRrNkJFa2UwWUllbjI5bmcwaDF6bDNBdTM1TWx4cldaTXdW?=
 =?utf-8?B?VVBDN0lyUDFNMUsrZGJZcmVSVEtpQ09jcld2T21wOTcxcTg2K0pITVZMUUdU?=
 =?utf-8?B?enlHdzk4Wk5CSEpLejB6ODdyTk5yeTNPRTNQdEo3ekVabnFTZ3o1Ymc5d3A2?=
 =?utf-8?B?VUJodlVSVk4raVJVUVNlOExwTWZJcjhxR2xDa2t1Z0h6NFVlZzdZRmMxOXNJ?=
 =?utf-8?B?LzdtcXB0c0xyVlZQa1Nza2xNd25EZE5qSVRaQTRNOTJwZU5wa2phbU1qaFpE?=
 =?utf-8?B?dEY3czZKWHd0aTlnNWlSck9ZYmxoS3ZkNTNzK0RmY29iWTQwanlmYzA4RXRV?=
 =?utf-8?B?TDNvbXNST25WMDVWMG55VWI1MEhCVFdaV2tGdEhUZVJCWkVHdmxLZzM1bTh6?=
 =?utf-8?B?Qk5jaXZITnc3djhtS3NhR3RlbjRmVDdmSzhQQWlTTC9udEY0ekZXN3h2OThS?=
 =?utf-8?B?NUxpRytkR25aYkxhSzJWQ2w4c2o4TmJEcXJ2RDVlT1FzVXEvVjc5TlhKYy9S?=
 =?utf-8?B?MlZvWE1YSEMxYXZtVVdFSE9mY3RkMUtTWXdIa1k3MndRSkR6U0tRS3lPblox?=
 =?utf-8?B?SUNlVHN5b0U4ZGtkQjNnd0Z6cTE3SkQwenZVelNSTER4NzdDUFhnbWFwUmgz?=
 =?utf-8?B?UkQ4STgzeCtNLzR4VkNOVDN5MnY0aUhTMVRKVlNVRndtbE9qeGNhMUtQdW1F?=
 =?utf-8?B?d0VpbWV2L0liVmEwSXdWaDRFZ2x3akEzb3JGWlp2eTQ3K3RmUGVpd2NKcWtl?=
 =?utf-8?B?UENiUXhzb2wwN2tKNXYxY21EOVRZcE14a294QktsUGc0S3c0QWR0MmlxdDVz?=
 =?utf-8?B?ZkFqQ2tnUzZVOTl2U3Y2VFR4dUpHcFhnd2s2ZFc5TWNnY2VHa3NqOE52dmNI?=
 =?utf-8?B?T3ZvaUk0aUg0RUViQlg1V002UC9QN0dNeCtPaCtrMjRKY0xibGN3U3Q5SEs3?=
 =?utf-8?B?NGwyL1phQmZmRmFzZUFJYlFNbExHM2RCbHlxUFdnM1pFdUpSSTFoMFAwSFBC?=
 =?utf-8?Q?s3oCMBPpebqkuyoyHfCtEVZ/q?=
Content-ID: <BCD10CE1E9875B408B078CAC9B6AF971@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e244c075-bc2a-48b9-3042-08da62abe4c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2022 19:39:24.3510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXbiP2Muc+eTRQG2pHroAdmCdat1UsbxLId1+924b/36igh4jn+7dhpBCJg10V027cs8U41REAGoVtSyA2XgYa/8tBVffgcL2pKmGLk7H3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_123935_908676_60386995 
X-CRM114-Status: GOOD (  20.42  )
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

Damien, Krzysztof,

I know this particular version has not been posted for all that
long, but this binding is (functionally) unchanged for a few
versions now. Are you happy with this approach Damien?
U-Boot only cares about the compatible & the clocks property,
not the regs etc.

I (lazily) tested it in U-Boot with the following diff:

diff --git a/arch/riscv/dts/k210.dtsi b/arch/riscv/dts/k210.dtsi
index 3cc8379133..314db88340 100644
--- a/arch/riscv/dts/k210.dtsi
+++ b/arch/riscv/dts/k210.dtsi
@@ -82,11 +82,14 @@
 
        sram: memory@80000000 {
                device_type = "memory";
+               reg = <0x80000000 0x400000>, /* sram0 4 MiB */
+                     <0x80400000 0x200000>, /* sram1 2 MiB */
+                     <0x80600000 0x200000>; /* aisram 2 MiB */
+               u-boot,dm-pre-reloc;
+       };
+
+       sram_controller: memory-controller {
                compatible = "canaan,k210-sram";
-               reg = <0x80000000 0x400000>,
-                     <0x80400000 0x200000>,
-                     <0x80600000 0x200000>;
-               reg-names = "sram0", "sram1", "aisram";
                clocks = <&sysclk K210_CLK_SRAM0>,
                         <&sysclk K210_CLK_SRAM1>,
                         <&sysclk K210_CLK_AI>;

If so, could you queue this for 5.20 please Krzysztof, unless
you've got concerns about it?

Thanks,
Conor.

On 05/07/2022 22:52, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> new file mode 100644
> index 000000000000..f81fb866e319
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K210 SRAM memory controller
> +
> +description:
> +  The Canaan K210 SRAM memory controller is responsible for the system's 8 MiB
> +  of SRAM. The controller is initialised by the bootloader, which configures
> +  its clocks, before OS bringup.
> +
> +maintainers:
> +  - Conor Dooley <conor@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - canaan,k210-sram
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: sram0 clock
> +      - description: sram1 clock
> +      - description: aisram clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: sram0
> +      - const: sram1
> +      - const: aisram
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +    memory-controller {
> +        compatible = "canaan,k210-sram";
> +        clocks = <&sysclk K210_CLK_SRAM0>,
> +                 <&sysclk K210_CLK_SRAM1>,
> +                 <&sysclk K210_CLK_AI>;
> +        clock-names = "sram0", "sram1", "aisram";
> +    };
> --
> 2.37.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
