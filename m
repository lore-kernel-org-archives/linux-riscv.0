Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEEDC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuSXgvC6FGu2Hu5/n9fu6UNIiBR5hnEBaPz86v2MRFI=; b=bjFgdCJLNJ3g/u
	5Cr3yLnRkxDXRZSS8heorzFCuiYN1tkwhwsGLnuUbY0olH1aNgNIPG28lmgmBXUaNqOKlIkaLGfkf
	VfEUSGvfL0G5Pj2vaua6xOEVSbowxbCbwQlpaavewAJ/YSD8+eWNAT7wu7tcjysHUJcSYGdWNu6p0
	p8Z0+kqFY8Hau5jYbkUH/i03uDrSpAXOphAYToBrBhvkTYXZNQ5+Cu2XXJF/usXOpEKIftUf/cB6M
	agxqobD6DtgZ0Ph7SjocgCugivehu/qbOyCQ5dZwMASQW37nRZPKEgXejfywURDiPSeQDeSusXpI+
	jbPytCA5Uf0Nn0piYjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3LJ-006iyP-Ge; Tue, 13 Sep 2022 10:40:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3Fq-006dxc-2y
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 10:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663065298; x=1694601298;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=J+WLZw9Unp5mpPuI6+FtUJhTxizVpF0ecfb0wRSQ9t4=;
  b=B/jDHKEG4hSM9Yu+4+BygYocWoJxoCq0Qb+sBG5wTLFIjIEcJMS29z8a
   46hA7e7cJ5Jwl6pmEbX5wcCCJivpiomsJ5mUYEKlh42++kqAcVyrv6jxD
   8OwSymYvFKz7s4FER9FAtZJumJyvmx1EAjxTdnwo4/52hzacepRYmE3uu
   z7fjQxnDiqN9OwWRCMwxSH47tKi8o5y9la8M551vNTXe/a64XuDHq60Sx
   8g6GPyBWEjLowjaZqKir4Q+9rsvwNeO18e9m6d4vvZQ+o58x0NWX9UV3j
   L2SWKvoc73slVvTOcQKPz1ploUm+8FyKKZi7RVpuTkCN7ULqTsBjRmHFO
   w==;
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="173604332"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Sep 2022 03:34:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 13 Sep 2022 03:34:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 13 Sep 2022 03:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co6zuYPCCBEVK7kEvZaEe6tcVnYaXmYJwhH1Jigy+Iys/IPldzWqeooefl2j8OFiJxIsvHkSBZuWqmZ/+mjO9XcapJLlhhedTUmO48o49s7JVqTLQnmLJLyrbZrHQi1e73KR2m3I/uZPIOYCxPKQR67novkEQ588rlK5dsDBZsqg/yU5E5jmykUeTuI0VuPGmvryBk1DaiUZ+o96EsAlkgL0O+AAajkTo9VXEi4HWfcfMBFY9Ji0Jgj2xntoSXCj0kJSB5cAmUpkj+Q8tY4La0gQ60nzYVTLKU+ftFMGNzte0qd37+PAS0JjWY7Jufz3VJk3TDljyOHncFm9ZGNP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+WLZw9Unp5mpPuI6+FtUJhTxizVpF0ecfb0wRSQ9t4=;
 b=QIK0vMJTWg6IqpjPyCzkPez0In7X4WZz0keRwbTm/Kd1TTecOO1i+6T3RHFcLqU3iw213OxOh+b8dniOv6kKRqcPFRPZM890NygOBkqPbrxbgbBbggYArWWws7TSyjAtXe+04kdLlr5Ek1GQsbFKaofrfDPzJMO4zR7+PsQ2CGBaUOA6Wpt6nUkE2ofQk3TMGXMTziaSqexvzVpAwJyyFMWyMwWLxTmx+ZlbHYHbIBkvP1zm3P3kPGnG7/151rdGqMp5Y+kZ/tfkhFi3t6QCO7Bs5iHTuJCb0a25e2G2VPn3SkdkBoaB5xMgHOxnY6eNCJ54MQEO8z8CDrzT91bCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+WLZw9Unp5mpPuI6+FtUJhTxizVpF0ecfb0wRSQ9t4=;
 b=PWrQ6VC+RDojXvvUxxK4kS8EwdKzjuDlLlOql/LtEStieJuvHHIGlLVwMBiWZkRl09Ju6DFMunX5V7DBIz1zOjX4FcIO1J9DE0eyp6W+3qc8rAl1B0szU6KL2uFumJtxdnhpcD1MJMYA+1wJiYhiWqFr54XgLzZUQes/1qPpArY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 10:34:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 10:34:44 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 7/7] riscv: Add cache information in AUX vector
Thread-Topic: [PATCH v5 7/7] riscv: Add cache information in AUX vector
Thread-Index: AQHYxzi8Jbge1xGIPUuqsebcZoFnIK3dKm4A
Date: Tue, 13 Sep 2022 10:34:44 +0000
Message-ID: <88298aa6-6786-12a7-8559-2b49ee1081e2@microchip.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
 <20220913061817.22564-8-zong.li@sifive.com>
In-Reply-To: <20220913061817.22564-8-zong.li@sifive.com>
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
x-ms-office365-filtering-correlation-id: e32348c3-b024-4c01-965e-08da957392fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hUJdaXll1VtSIcYcmllwa2QANUyz98ePpHCPQO/MGJkaaP2YeC8yO9erT44XzfJIwKJrg8E7vlWSjN7vBCaaPOA9pojbwwz465V4NXDi+htsdLE8c+jqLW0/EX+raEdiYKcNPO+p146IV9bKe61RuECOFiwhCFwmNACCnAgbUj6VFk5y9eejNSA1fNQlaUzh9UZMbW0r2V+fpcI/fR/0+b7Y3Tn+NEJ1UffISo4nu6tw80nBZXa3Srt8VfJTNpSd/5XOsgKWKbuPMtHbdoKWUj/CO96p4Gl1DjS3Q4ljF+4hdoNZgecMZo1P2Y8dzimi61J6KtzJ1qoSu/5sIUn8PMRnZam+Dd5f3SP/8QkY0DV0liRkPlnTaAhTaafZMo5vPBhg8BwAYhgCbH5ttDeXgNktoa75cPwE1qcnaCJ6bVpHSED3npfIAuY46JYU7YOzCmIBleO60NBikiYY6N2ML4CtXtDA2s2r4mKJ4wRnj9RnOaxKtV/qPMPtATeHpP6dWE75RnV7H9Dt9sw2hpe34HkwYNsR3uijpTSFT5Fk0eBr3qq/CRE/rnYMaFK4UoD/C8Ltt436oybhGyMxoFTKnpu7TUkPQIN6E/IJx2G/3Ml2k+KJ0NDUnNSVFQxZCH/NPnjvcs+sVBRqQxCxSMLHP15lBtTJciXGdQIyq+woE7Aaom3pzmYOrIcA5dhHpMzY/AD7C4YpCHvN091BKSyoMgpWWuYKudBF2+T0iV+mlwV2csFqg7ANqGkyH5takJICdmWgbnPG9U74uVLxzHQRU8WbpA/hzjfFPUpCQxkp7DMmJVks4jbtvgZj4HWhnALYwiHFkuV/46DAM/Gm6ZGvSfW/HZsSTZnC3GgHQY5JXkewKJblZ6BjiewSb515ce+s0nPtheNTUe3hPMi+wrya5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(66946007)(316002)(110136005)(66476007)(64756008)(66446008)(26005)(6506007)(31686004)(6512007)(38100700002)(91956017)(36756003)(8936002)(5660300002)(8676002)(2906002)(122000001)(31696002)(76116006)(86362001)(83380400001)(38070700005)(53546011)(186003)(921005)(71200400001)(66556008)(6486002)(41300700001)(478600001)(2616005)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDdKNkIyQ2oyN2FMdUNpZC83R1ZYN29NckRya1ZsZ1Nyem9BQTJjeTJxNUpM?=
 =?utf-8?B?WmRsdWRRNkN6cHJ4bys0YmJCK2M5QkNJLzRCUkhZTk56WW52NXZTb0RJR0JD?=
 =?utf-8?B?dDBtS1hTY0MzTGxyZVRJbytZa0VLcndkc3JRaHRjU3I4RlA2L2MxayttM1RK?=
 =?utf-8?B?WTdkbGtHdkNKdW4wemVwaXFoWk5teWw2K2xhYUw5ZndzSjNzSHhHM1BnTGJW?=
 =?utf-8?B?TjVMQ0NJNFVwTTdpa2VmbndLT2crZU1XTlRadEYwNDhheER4U25jdzRkWjgv?=
 =?utf-8?B?em5tWWFyM1RieSs3SVVUS3NhQzcwQU9LSEpTWFM1ajhUYTAvaVo3dmhQN2xX?=
 =?utf-8?B?SmlYSiswYmRNOXpQR2kwYjVvVTg3SzVTWG94WExsUldDTm03SXhYU01qTzN6?=
 =?utf-8?B?Y0JMOEpieGVtTDVFZjd5eE52NTJ5TVpXRVB5d0tJRTVhTjFxSDl2dzl4ci8y?=
 =?utf-8?B?ODl3S3FlcE0wWHM4RUxHTzEzeGdORmY2WXI5YXYzelB3c2tlWXpMVEtKSzhu?=
 =?utf-8?B?M09ValdMM2hBMDRHeVNMd1k1ZnJ6cml0OVpwdHhtaXpSTlNON0FnM0lvaXRm?=
 =?utf-8?B?aCsrYTRYNlNpQ1J6Ui9HaGZ0dEk2RXoxWXRQajNYUmUycEpKTm5EMDEwUTZI?=
 =?utf-8?B?UE50Y0x4djRyWWpXdi9WQUx3dEJSUlAveGVZVGNjTUk3Q2lnWllwRDczeUtT?=
 =?utf-8?B?OGhXVFAyTGt2ay8rNUVIOWw0V281SE5qcG9rQk5GOWJnMDI0Q080L0FoT0Vp?=
 =?utf-8?B?cWlyWWxCUUZJTHZRd05aa1JTV1VtMlkrVkVyVEJRbXUwcGhLOHN0QmZWWnQr?=
 =?utf-8?B?Zy9nUXB3em9YMkRZMHozQzRwUmdYR25GS3QrNnhIK1ZjYzZRSUk2d1ZYU0M5?=
 =?utf-8?B?ZTNic0hpUlZBRURPT1NyL0JkQzZTejBqenZROU82N0VtWUs0aTUvWG4vTVVn?=
 =?utf-8?B?WE5GM0VFcCtsUDNsR3E4M213aWVhU05yWGFLQ0hWMmZBTitzaEozNmRUc3dZ?=
 =?utf-8?B?Q0thNWp2QnBENDNnQm5aN3RjUEo1RGlEQ01RMEpOYmFLTHNhaUh5c3J1YmhM?=
 =?utf-8?B?NWJKMDcyTXNVb0tGSXBJQ0daUVc0aUlBWUFkZDB5RFNKMDZ3N2ZOeURDS0dF?=
 =?utf-8?B?OVVCb2tXakxKWmpiUWlqZlQ3Q3BMNnI1ZGZNdGNwQk9SMERsSHZiWng2alpp?=
 =?utf-8?B?bWZ1ZkZmSVBIOXF5UitlbFl0K3BBc3FRbEZVeHlIbUxqczFCdGZkUjB1ZzhP?=
 =?utf-8?B?cTJKR3Z6Q0MwMnFaTnZweC90U3Bjano2N0Z4cnlqcUhZTm5PR25XNDA2Q1p2?=
 =?utf-8?B?SWloSFlOWG9jSGplYzlQalVmdDl2T1dhWFJ2T2JHeVdlU2FFYzlCUXNwSmt6?=
 =?utf-8?B?bmZpMm1hd3N4Vi9QeEdZL3o1cTgxUlZRNkNab0tMUTBiVGJieUttTEVldWRm?=
 =?utf-8?B?cnhnRTVRaE54LzlUb1hhc2tyak1qOUwxazNKTzdrVUdTdFJYb0xyZlhoeith?=
 =?utf-8?B?QzRBS2o5Y0RQdGZtOVNyc0JldGxLcFM0TlRvYXpId01EN3lWTWRqT055NHdM?=
 =?utf-8?B?TkZYaVV1dUR4Ni9xQ1VUU2FQQThFcnlpL00yVkpyTTlXeUlabnR4VEFnUzF2?=
 =?utf-8?B?WHBOYlcyNmVvaDRVNU5rc0ZWN3J4cVgzOWZ3Q3hiTTErd0gxSE1OZHdkTGkx?=
 =?utf-8?B?YXNHelI5MWh4N2IreDhvYmxONFdRc08xMGxwdGVLZC93RS9zY2N5VGloM1BM?=
 =?utf-8?B?NHRyejVOYWgzWjJ3cjVYdGpEaG9QdEc5TktnQ0VMWDYvVVI2Sk1VMjgzTXd2?=
 =?utf-8?B?bWt3eEs3MlVCTDIwOFNhMWpwNDI4V3hFZnZxL3E5dEtzVEhPekI1ZVQ0c2ls?=
 =?utf-8?B?cXZVcFVCTmNZN0VNYXM4VW5rWnlORUp6RVpJNnJjNVRWYnBKM0djMGdkRGxh?=
 =?utf-8?B?NWVCeEtuMEY3dEJ5aWExZGZCVG1KaFpuRC8zZzdlMHlTaWdtZkZ6SXEyNFA3?=
 =?utf-8?B?TnRVMk43Ti9iMEtTVzEycjJka2xRVWhPZjR5cWVFakpRWW00Ly85VlBxbGND?=
 =?utf-8?B?TlE0QXNKNXBoa01pY05LWUVyUzhaZE9zNzlaTnZDTnJyNDBTZWZXSUM1MURs?=
 =?utf-8?B?OVNZajV4MXVCZmgzOXVZS2xpRjZGUDhLRzMyeWFXOWowcDJvcUhHK3d6V1lu?=
 =?utf-8?B?Znc9PQ==?=
Content-ID: <353FC3D00A53AF4F95C29B00C3C38B17@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32348c3-b024-4c01-965e-08da957392fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 10:34:44.5813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50YK+U/t/hp6lyNCsW+gCumB1GV0pTjFVdLHl4Tq7EiyYLiFmoKylsgzgM8S+4mQq9KztaMeP/WRkDIXJHVDlP4EdTV88hNMAPrP+5BnBfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_033459_328094_D6DDE57B 
X-CRM114-Status: GOOD (  17.79  )
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

On 13/09/2022 07:18, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> There are no standard CSR registers to provide cache information, the
> way for RISC-V is to get this information from DT. sysconf syscall
> could use them to get information of cache through AUX vector.
> 
> The result of 'getconf -a|grep -i cache' as follows:
> LEVEL1_ICACHE_SIZE                 32768
> LEVEL1_ICACHE_ASSOC                2
> LEVEL1_ICACHE_LINESIZE             64
> LEVEL1_DCACHE_SIZE                 32768
> LEVEL1_DCACHE_ASSOC                4
> LEVEL1_DCACHE_LINESIZE             64
> LEVEL2_CACHE_SIZE                  524288
> LEVEL2_CACHE_ASSOC                 8
> LEVEL2_CACHE_LINESIZE              64
> LEVEL3_CACHE_SIZE                  4194304
> LEVEL3_CACHE_ASSOC                 16
> LEVEL3_CACHE_LINESIZE              64
> LEVEL4_CACHE_SIZE                  0
> LEVEL4_CACHE_ASSOC                 0
> LEVEL4_CACHE_LINESIZE              0
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Zong Li <zong.li@sifive.com>
> ---

This _looks_ completely sane to me, but it is well beyond my
paygrade... FWIW:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>   arch/riscv/include/asm/elf.h         | 4 ++++
>   arch/riscv/include/uapi/asm/auxvec.h | 4 +++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 14fc7342490b..e7acffdf21d2 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -99,6 +99,10 @@ do {                                                         \
>                  get_cache_size(2, CACHE_TYPE_UNIFIED));         \
>          NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,                        \
>                  get_cache_geometry(2, CACHE_TYPE_UNIFIED));     \
> +       NEW_AUX_ENT(AT_L3_CACHESIZE,                            \
> +               get_cache_size(3, CACHE_TYPE_UNIFIED));         \
> +       NEW_AUX_ENT(AT_L3_CACHEGEOMETRY,                        \
> +               get_cache_geometry(3, CACHE_TYPE_UNIFIED));     \
>   } while (0)
>   #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
>   struct linux_binprm;
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
> index 32c73ba1d531..fb187a33ce58 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -30,8 +30,10 @@
>   #define AT_L1D_CACHEGEOMETRY   43
>   #define AT_L2_CACHESIZE                44
>   #define AT_L2_CACHEGEOMETRY    45
> +#define AT_L3_CACHESIZE                46
> +#define AT_L3_CACHEGEOMETRY    47
> 
>   /* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH    7
> +#define AT_VECTOR_SIZE_ARCH    9
> 
>   #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
