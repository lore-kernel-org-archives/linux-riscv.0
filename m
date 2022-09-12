Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C61DECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azTNaK/58q4YQwm1/bnHQKc7Vpx7b1oooRbaBSiTAVA=; b=gjCTtOepmCjpC7
	HfqG5czQIUGwYXjS4GOcfHNgdXm2KNfRBWejq5tdkcEBpxJk8JZGjF+DKPXelhu8qwppPWHi8cLE3
	gX+W1CPthVJlVM2A4ykUh/gfGMndO/+lxYVPGDo+Xh6jKgLrlmHqECerx2H0yO+VZ/p5WNarM9va/
	0q4HeGwfIFxH7iuavEkK8ZceHUFDmjEGYEQsdM2YV1XWakOJpuMxMATe/kcWc8oFygv2G27eanGKo
	eB39RjknWtUEVpU3HOQLg1RMgMETLBXNKpKmcJ1kjQH7puAvhwVt7A876XeG09W3XYEC4M0VEKWqf
	7ng9i75DHOauhQs8+pcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXe4D-007bjc-1h; Mon, 12 Sep 2022 07:41:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXe48-007bh3-Vj
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 07:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662968473; x=1694504473;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TxX/R5vp+n0VJwX6549FSmxOJ5AKy+X4bc53JGFnNzo=;
  b=JlKBAPBRIYSe25PyFHuD+bmhkmqCfZO3C8RNUs7Q5CQTNISjr9O5GN7S
   2GYdVP/dfMuuv6u8uJjrpDe1L4ERxz5CrY7mdcQPX4EmQNHtv9NGegdOx
   kvquWoWpSj5fSqL6NZh9xUhndtmaFfN2gzv81X/x9SZkNbWAE+Hln6JAH
   /xk6SjuASyusuCba4CH2mh7j0J6BJ+q14P2rQwtRVGtvAAoN5pyp3UcSq
   BZYPBPYxyR+HJdd6rA07KZmcumsVdmjILZ08P5HZOMO5rN5oi/BvyNV04
   K4VHzORzqdIqa4XxMyxZAXIC1CjWblqj+24DYNHmqCrwjTnL7nIFz/jbR
   g==;
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; 
   d="scan'208";a="179983799"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Sep 2022 00:41:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 12 Sep 2022 00:41:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 12 Sep 2022 00:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik6nVLAbFeM9VTQfEkGjVu5f3LzRsLWajpjTvKfKIg/G9CoF1b/qa5SsmojVm0kfroD80Bl/MEqZEuPqFPOk6F+GXB5/J1M8Z3bLaSYWzCHKvxeEQwvVN6pP/iLl94KJrn2ZAwJG1NoWFa/cSpWqZNlb+oWJ0zfN5EidZA2GADw77WGC0suLX7qeakHPtbKPvlQK3qNOV776Ssnd9khc28f/hueh15kkyqaUuojrGYH2SZvBG4ymvNOcVYUOr82qcLgvdPS8o+wUp3dKGh1thJArVYVpe/DdSxfM9M2t7/Q+/eL7S4oeOHTjO0kG4OODeC9QtezYzkT6D2u8IV4iwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxX/R5vp+n0VJwX6549FSmxOJ5AKy+X4bc53JGFnNzo=;
 b=ifqgWFMRImk/q/6OEiOsJmd5hanhhA+nQer0D+y0awRTSlDbPa5J645hiVEZdq+A3CBAttSDsYyTkHEnMag/r4VRmew3Q3K5VqOoxb8uMvOGPtHeDWWLZhpUsRLySfmMO6M0RRamr6XtIfVx159Utuj1pIqx5dZUoM479Fju9oJrV81okub2EVdl81hDGEuvtMepgpxNgXI1SxtUfa/4gRlc3bCnb9rVyLoSKAvfUzjgGFvqUE21izknmH4WNGq0+BHv73CWr/n4TdEqBRBZzjqzuHhXGM0d9Aqv8CM+Vqb4b8EMm+CK9KikkopJ57XztWMmZoprXgMEcH9Ovba7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxX/R5vp+n0VJwX6549FSmxOJ5AKy+X4bc53JGFnNzo=;
 b=Q32G12Q0p4yKZP7K0XOyBqzl5Tem/KJWDGQ7t1Xv3PSHrPXiQrku8nVN396W97QHuySOp9xGww9zZcE3YIMem15w7TdO0M4fn3ezjH0WnPs2SleO3jh81IjEzPY4xzdMtdQTinR731PjC8GzCYAooA2W1va5i3ccizAwHU/VtCU=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 07:40:56 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5612.022; Mon, 12 Sep
 2022 07:40:55 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<nathan@kernel.org>
Subject: Re: [PATCH v5 01/14] clk: microchip: mpfs: fix clk_cfg array bounds
 violation
Thread-Topic: [PATCH v5 01/14] clk: microchip: mpfs: fix clk_cfg array bounds
 violation
Thread-Index: AQHYxnr+LkYxG+U/bEmm+KoIuS7Thg==
Date: Mon, 12 Sep 2022 07:40:55 +0000
Message-ID: <6399e437-37ed-eaac-22fc-34087ea14083@microchip.com>
References: <20220909123123.2699583-1-conor.dooley@microchip.com>
 <20220909123123.2699583-2-conor.dooley@microchip.com>
In-Reply-To: <20220909123123.2699583-2-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: 3a99d213-cef2-438f-f96f-08da94922091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uiuHUaLMepwl5v/S5UBfcd258hj3i1RBVectut5EjDYT3/uokqQCPIJ6lvcL9mUjOnXlKsYeVEXfErCCej4oJtZOm8um1ObzFtmMJxl3vN8yhvDB+oQXTSDaZ1KUR9nl8rtZDtaXu4bHp1KcBkgXZkQ2yrru2oUp7Fc9AgTE+EkMVpqeQhFflA7YqZ2TMYS87YT4/PMRJ0fa8ar0wRtByIkrHhd0Lwhu+00fsBCewy8MJJ7kOqjllTTdfFbuPNsnlbivUhvnmhPL6ycGowwgC5IPGjvbmD6V8pletKkm2dbgEtZanLx4Nhq7R3xp58n43d1tDU1gdekUtK+LWct7sBiM1ChUDJ+HJAN1pUSbkDbb0Iv/Ni/f+IwH0WftABPuvHMIYjsaGyYgnjLSmFsj5E0jihwnYv3qJBhhcQ/fzr5Mytcwnb+H8k8UiRvasC+AlZO0QujtnJIcqgIQJ7NF4wGfMLcHfiKGPDlbzOQo306p12UaTB3qEK7T7uducvAyBtPRtoYWEAKrj59pXv4ZsoAVyPAxBWolPUj/xdZdDKUK/IGA6Z+Wl09w21f8HGEWWM5kxGD5dL4Ixjy+TUMs8oUBfpDbDkYqhWu1fWcJvsAqKf0PA4/8oOTIjD5/T8tDbal94ks/B954ojORwgsAf5UvVeW8H0Gm+RrqDwxdvCkEe0dmMjEqMVd2yi676XxlDhrqiVQvksFmjteLfzfhrjnxFe8PKd49L4C3llBl1zvtWR9WFx3NFLmzPMKx5V8Ccs8UUOC5T8rftTmjtlcUZ1jlktNAxbNqyaaIY7sxu+K52QeseqRqgzLFmXq6uKy3EaYEME3G+S33knbeL+cx/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(376002)(366004)(39860400002)(2616005)(36756003)(31686004)(186003)(41300700001)(6512007)(2906002)(5660300002)(7416002)(26005)(6506007)(83380400001)(53546011)(8936002)(38100700002)(6486002)(66946007)(8676002)(64756008)(66446008)(66476007)(478600001)(86362001)(76116006)(71200400001)(31696002)(91956017)(122000001)(66556008)(4326008)(38070700005)(45080400002)(54906003)(316002)(6636002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk1wcVU3SFlkbXFLY0NVNlVnMWZBajlMNkVNa0JvM3c1dXlMc1RKNkJiUlRx?=
 =?utf-8?B?QXZwVWFBaFI5NEpRTkNscFZOUEJKb1JqMTR5R1BMT0tmSDNpSDRKYzFITlJS?=
 =?utf-8?B?TzhldG04b1VUWWw0aXk4Y3VyRG5qUnBpVXBMRlhkY3FDV2t5aVFZWWprZzVn?=
 =?utf-8?B?SWYxak9jdjZ2dURDTVYwSHJiVkdJU1doYU5iNzBLamRPUFovbDVpNXpVZlU5?=
 =?utf-8?B?QlU3MTRFaWZhOTdzZHpPdms1N0R5VmFZV3dBWUJVY0RrejFLbXpKQmVBV0pY?=
 =?utf-8?B?WG14U2o0ODM1bFZFR25xdnVBSFJOVEVpQ1hoQWE0bGp0Z2doTzJJOHJ3Misx?=
 =?utf-8?B?STJXU0d3SW5rTXpUU0w1ZSs0RmJpNUIvUDVXRXNZcVAwUVpacHdDaUZiRDdF?=
 =?utf-8?B?bTMyQmREL2VjRGFZdWZmTVhtVFNoOVA3VVdqN2JGc1JNQTBNMEtOUm40UmVl?=
 =?utf-8?B?OEUwTHdjRFRDOXRnT2VCVFYzaHE2WXp3RmlVbU11STZvV01DcUhqSGpiU0Vr?=
 =?utf-8?B?bkRGWWFMRVlMaGNUMVQ2RFh1Rms1L01kbFBhMTNKUm03eDFzTThCUDRXM2Uw?=
 =?utf-8?B?Q0MweWExZitxV3dsdUFjallCV29idU0zb3EyOGthTHF0SGJoVjdvN29GOFU2?=
 =?utf-8?B?U3BRc0N0M2xqMDZUOFY4TS80T09pZWRBZEJVRXRaL3ozdGhQV0tQRGthN0N2?=
 =?utf-8?B?WlA4UmRaU283TzgyVnNkaDNNWlRKSmtvR3B2THBqWllEZTFYVW9IVnZmam9p?=
 =?utf-8?B?RGVsc21ENzEzUFdjRFd4OTFaeGpCYjNVNjJVZ2ZTY3R4OW1pbDN2N3ZTNWg4?=
 =?utf-8?B?OFRhTy9nU0lYbEd2U0xBcDNVYXU5OHVGTExSNExKMjJCS0xZRExqdVBmdzZP?=
 =?utf-8?B?SjUxYVlDOVFheDlPZlZBeDdNK292ZGtOOThBRTFqZmduQjJSSHhlcVZEMEJr?=
 =?utf-8?B?WVJheFJXNHhzd2cvRU5CenZNbk9DRUxZc0l6YzY3REE1Znd0RllXQ2R5N3NK?=
 =?utf-8?B?c2VRQW1XN09DbVVFSGtaN0ZKSjVzcDMxVHpNWUVybWM0WWVTZVVtZU9pU1Az?=
 =?utf-8?B?L2dvL25iaVJQUUljeTdrT2lOZGxqa3VyRzJOU1Q0dXNoT1MvVFN2Nkt2MHVt?=
 =?utf-8?B?Smlpc3E3SjlvQ1Z2RlF0ZUxremswVWdnd1k3WGluR1ZSTHBMbUhKanM2V2FB?=
 =?utf-8?B?RGJzaUdCOGZ6RW4vUm5xQkpyRkl6MTJLV3E0UHJJcitGdGZLS1UyQ3VWbXdu?=
 =?utf-8?B?QklQWGJxQ3NJT2RPK3dMK1lsOE5sWlFzcDY5bHc2WElObmI0Tlp5bGJVeXpY?=
 =?utf-8?B?NUtoS0VTNDh6UmZSbkJ1c29EYnFLcVZJVGlXdFdjSitxMzNvTERuRkRJZTNL?=
 =?utf-8?B?cDBZMnhObmM4OGxFKzVSdWhtR1p6MWFSbEZSOUhQU2JkSW5aZDlrMFYwa2hv?=
 =?utf-8?B?RmV1UEo2dytiMllJVlhPRk9adXNpSko0SFAzcWl1WTNzU0RhU0FFSkJWQ0o5?=
 =?utf-8?B?T0RWY0pFUzAxVHRHL2FPL0w0SW94R2pXcmwreWEvZ3hpK2ZUSFpkajFFQWlv?=
 =?utf-8?B?dGdGNEtYSE9QTUJWK3Z0Uk4vUzhiOUIvZXVZNlpXaFZzV2dIZVJqNmNsWWhZ?=
 =?utf-8?B?SHdjSENxTUUyUTBUSngyZkJBcnBucitkNjZNSEJ3dXdQdGpvSkFaYzlsMkQz?=
 =?utf-8?B?eVR2K1Zqb2ZBZEJNQWZOaFFVLy9NZlVKWURVTTg4NnhMZDNoZ0l1N1I0bFdi?=
 =?utf-8?B?SDJlQzlrRVBlNFhZSkVCWThmMHA0MlE2V1NqREI3VXE5UmthVkdGcXhTZysy?=
 =?utf-8?B?TmY4RXpUZVdNRE1kcDJoeExjSVM2SkhLN2IzbjhRdi90RkduaUgzRE9CNjB1?=
 =?utf-8?B?NGp3eEVGRlduUkpUbjkyQ0pvWFd5aWJnRzkxSVpqRExXcEV1anZmWW9ORmxC?=
 =?utf-8?B?c01mbHlpSmxVNGd4UDROODNrZ084YlJxamcxK3Y3YURadlhBaW53SXZzUGZV?=
 =?utf-8?B?S0hFSjJiMnhucytLalpQUWhqKzRGRlFhOCtWbUJNdWlpOUFJWkh1R1U3ZmN5?=
 =?utf-8?B?YlhvTDVZYitNY011eXd5QTkwb3h1TUlwa1FoZ2YrYVBBV25XYlJCaytZcmJB?=
 =?utf-8?Q?Grrf0ea/2OVg3ZNH40wjtF5lr?=
Content-ID: <1CDA6FC939FF9B4FAEA8A69518704630@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a99d213-cef2-438f-f96f-08da94922091
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 07:40:55.8763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vieaTbJhsAT1sEswDlekewA4QxxEoGW8Hll6rRzUXQIkvd02C7D+qcPjJPCs9c6tmCA5GRFl3DriZPweVW//Le/7SLVV9mj7A0IzuKUBgdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_004113_072374_78AFEC9D 
X-CRM114-Status: GOOD (  24.56  )
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

On 09.09.2022 15:31, Conor Dooley wrote:
> There is an array bounds violation present during clock registration,
> triggered by current code by only specific toolchains. This seems to
> fail gracefully in v6.0-rc1, using a toolchain build from the riscv-
> gnu-toolchain repo and with clang-15, and life carries on. While
> converting the driver to use standard clock structs/ops, kernel panics
> were seen during boot when built with clang-15:
> 
> [    0.581754] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b1
> [    0.591520] Oops [#1]
> [    0.594045] Modules linked in:
> [    0.597435] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-00011-g8e1459cf4eca #1
> [    0.606188] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.613012] epc : __clk_register+0x4a6/0x85c
> [    0.617759]  ra : __clk_register+0x49e/0x85c
> [    0.622489] epc : ffffffff803faf7c ra : ffffffff803faf74 sp : ffffffc80400b720
> [    0.630466]  gp : ffffffff810e93f8 tp : ffffffe77fe60000 t0 : ffffffe77ffb3800
> [    0.638443]  t1 : 000000000000000a t2 : ffffffffffffffff s0 : ffffffc80400b7c0
> [    0.646420]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000000
> [    0.654396]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.662373]  a5 : ffffffff803a5810 a6 : 0000000200000022 a7 : 0000000000000006
> [    0.670350]  s2 : ffffffff81099d48 s3 : ffffffff80d6e28e s4 : 0000000000000028
> [    0.678327]  s5 : ffffffff810ed3c8 s6 : ffffffff810ed3d0 s7 : ffffffe77ffbc100
> [    0.686304]  s8 : ffffffe77ffb1540 s9 : ffffffe77ffb1540 s10: 0000000000000008
> [    0.694281]  s11: 0000000000000000 t3 : 00000000000000c6 t4 : 0000000000000007
> [    0.702258]  t5 : ffffffff810c78c0 t6 : ffffffe77ff88cd0
> [    0.708125] status: 0000000200000120 badaddr: 00000000000000b1 cause: 000000000000000d
> [    0.716869] [<ffffffff803fb892>] devm_clk_hw_register+0x62/0xaa
> [    0.723420] [<ffffffff80403412>] mpfs_clk_probe+0x1e0/0x244
> 
> In v6.0-rc1 and later, this issue is visible without the follow on
> patches doing the conversion using toolchains provided by our Yocto
> meta layer too.
> 
> It fails on "clk_periph_timer" - which uses a different parent, that it
> tries to find using the macro:
> \#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
> 
> If parent is RTCREF, so the macro becomes: &mpfs_cfg_clks[33].cfg.hw
> which is well beyond the end of the array. Amazingly, builds with GCC
> 11.1 see no problem here, booting correctly and hooking the parent up
> etc. Builds with clang-15 do not, with the above panic.
> 
> Change the macro to use specific offsets depending on the parent rather
> than the dt-binding's clock IDs.
> 
> Fixes: 1c6a7ea32b8c ("clk: microchip: mpfs: add RTCREF clock control")
> CC: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 070c3b896559..f0f9c9a1cc48 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -239,6 +239,11 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
>  	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
>  }
>  
> +#define CLK_CPU_OFFSET		0u
> +#define CLK_AXI_OFFSET		1u
> +#define CLK_AHB_OFFSET		2u
> +#define CLK_RTCREF_OFFSET	3u
> +
>  static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>  	CLK_CFG(CLK_CPU, "clk_cpu", "clk_msspll", 0, 2, mpfs_div_cpu_axi_table, 0,
>  		REG_CLOCK_CONFIG_CR),
> @@ -362,7 +367,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
>  				  _flags),					\
>  }
>  
> -#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
> +#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT##_OFFSET].hw)
>  
>  /*
>   * Critical clocks:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
