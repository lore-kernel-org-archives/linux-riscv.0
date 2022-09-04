Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAB8C54EE9
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8X+d/1nmL3Op373SDatNmc8eob8NPf3AwHXvmHKqVM=; b=m68vAlgHNlQ3OU
	GxWP8WFkE23fPIaGuoLYexXDl+y1Uu/cdf7mkh1XnX0TMG0B5xp0ZPTG/uxRWVWEwVbiyfPel/ytm
	yuresNjA3Tuw2Q0++ULdRe83t++lOPkVat1ZI/OquNdCT18aumY6WiFBHbuGf//7TWHwoh2PmFE0g
	Kzi7Y9jnhkiC9g6CgwchgQfwGWEtUqNvOoDrSvC62IKdYh4HolOpDEICp7ui0z2rfbt/JOy+3MktR
	L3Cx8GPTKWhN8Kathbq0uYQgvgEtqdTO3K10nb+OeG1QwEess118jKH9M4zta1XerTpXW+70c77L4
	/qLE4hN7XmFNZ1ZWnoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmzg-003W1x-KE; Sun, 04 Sep 2022 10:36:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmzd-003VsG-Ea
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662287805; x=1693823805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SAqZuBOvnh018QGCNXfMUC8jNsoDdhGgn/DhLGHSyjc=;
  b=ig94YvNFNqNrZe5ePbFCANu2WvSkVu/qCVgtDahA6M39L8DzHcaiIdMq
   DeaTzhY6jWg9alIMMKQFbABEoI1VLeAZAYaHt47IlEqFhOxjUduxbQQ2E
   vW/aV2eJQ5iE3GB9+mWtnwd1is/I5lYjYPJvIQ2XskTMg8ZKYuIeolPEX
   Zk4eimCy31hfHdBj51MaA+dBTgRiCmSFS0OtQx+5WlGtWjRti6WtV9oiB
   WFdy/+0OA+Tt0hB0WxVNIKWRBecChLHnwHPRoJxa11vyZOD2UZxWmGYAe
   m4MgPZKxKulnGPGsSGPxkf4mXdmxyTb/2jexwzipzZUuLg6m8a3V26xg2
   w==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="189344639"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 03:36:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 03:36:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 4 Sep 2022 03:36:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9Jbd1KxogQcF8rW0NnEHPigq7wNN3NWzZqXIb6BwuTxWGGDeWvq7Up5aQGz7CUKdO3HmgxCLuv6ujj9wG2YBi2fJw60Y7kyvpn6m2aZGx8N8YUBSNv1UlZugE67AFvcoSSrYPD0k92z/Kn0lQI0Hi+obXY3ODNA9Oi/xclC2apDGjn8Q/L5iUFw4QZUjswKoam9neHi6e0ZuUwJ6yA2hwjCjYzDFnUnl9rgA80rFP3tolLDkoWixbwJVOc8l8y+Q1ujTsaJ01h+7BiJZmBwtXZv7iUTY6Nrc34k8I147/+cK2pVtSlCekx7cp6DJ2Nt8JmB+wkyuGnaYGXL2RZNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAqZuBOvnh018QGCNXfMUC8jNsoDdhGgn/DhLGHSyjc=;
 b=HWCLs0voFlngOxpJ5gGa5lKHtcynlKeUdxeYVu5bJ9aGMLnQrmr/68n11mgJgDzinfbk5qlt8WQgC+0+oQq6b/41fxowvO4vfETpQuxjiKJzC09YzuGSzqy/JvxDSnilAI/KInGVJxA25IEd7MK8dlTdop6/qGtDic4hjnfy1GeAJ36SU+mUgzC5h8u8G1phkWwu4Cacgun0hs7HMVvkY3GYLxizrstEKYrArY2clEJzi5DRexVlOFWLlPBikfkO6MFY0sJB3IISd0+YjkRbAoH3C11jLGzsw1z7dJsHsZFnRkfM2jYAFK4oNJs8pKM2BDU3IqypDiqEpfCBP2G4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAqZuBOvnh018QGCNXfMUC8jNsoDdhGgn/DhLGHSyjc=;
 b=Hor3HlOPFgsjR9V2lg7tAyuST+XzPjopjXHpYZ82vidKBKw/wEOteApXBAWi6XceKmKLsBVeDFFOqecBnEq06PxlaHTagEEIbADvPmqR5KzteDyucXmE2NulZifAek4WZDK/4uzoVMSBnEQLSXwaXjmEyL+b0+ooJ/AFnpOCxaU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL0PR11MB3281.namprd11.prod.outlook.com (2603:10b6:208:66::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Sun, 4 Sep
 2022 10:36:39 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 10:36:38 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<heiko@sntech.de>, <jszhang@kernel.org>, <lazyparser@gmail.com>,
	<falcon@tinylab.org>, <chenhuacai@kernel.org>, <apatel@ventanamicro.com>,
	<atishp@atishpatra.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>,
	<lkp@intel.com>
Subject: Re: [PATCH V2 5/6] riscv: elf_kexec: Fixup compile warning
Thread-Topic: [PATCH V2 5/6] riscv: elf_kexec: Fixup compile warning
Thread-Index: AQHYwC/gSov6LLzR/EOOdHeAB9nrWa3PFAuA
Date: Sun, 4 Sep 2022 10:36:37 +0000
Message-ID: <98efc4d8-f846-1ff1-2635-d18b7fca4ac8@microchip.com>
References: <20220904072637.8619-1-guoren@kernel.org>
 <20220904072637.8619-6-guoren@kernel.org>
In-Reply-To: <20220904072637.8619-6-guoren@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a37aeae-129c-4716-98dc-08da8e6158dd
x-ms-traffictypediagnostic: BL0PR11MB3281:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o0+R2Mqa8gS+9wj7L+INNDQnHRqhVKXs6gnssJHLYL/z6rAa/VKNNxGKl53OOb5ixT+sFdTF52311Dy+m784A4kSYwoDLQKYgjwZcuPmWL19IwzS8YReG9itxSU8ynfFUl15yRFi9v51Zt9AZruAGEIpOw6GiVhHnc1bkVKkdh9EThrPKiaLMA1KfEBhbSSgc0EvdYlaI37IkAWKZ1i1PfEfzUjByrzh49LlJr0zL9h180mx3ENCU6coOSdBwZMkxopr4kIeLf/0V91970UtpU9Nc8IkYOmjCP4FBhSBVxJ/vNG0smjPNPzD/LMkQZEWb6FKaKEF+O8PEwt1Gg1gLsVLP3YQVNHruNjxyQoNfcqCnhISnwfCqkApIVZSS05dELKbx7U9dIj6vRAVOYC3LR6E8w32ptYvP2PPJGctZj8HGtIzgcGEfAy19v+5N2h6pf2BHV7Tk6nbEq9Tw66HdMJ5OYd6ZOF8xukr4quX+H9sSgXQ6lK7QHy3nGGJ7XNG1z15F/lPrCBuJJb0fLU7Q3VjBUTEh18f1IG+n2BE52ZAEZAE3LLm4PiRdD//FRKCwC0b7Ncmc+VMVp1YtiFkH7+JnMJ3+tOb7m+bT7k+aTf/zYC1WaOZjOZwwVyjUOMZy97inlPZ5DHmfNgKo12xCduk3tn0jKWipRqEtI8Q3BgdhedgEv2JxjLxCNdufRuShWf9jFa/K9vLn+JDIZ8P+i0BQUcnwvUdhohAxR50MncM1VB6MLpM1Egil/jk660yJbypIkNjiSjAvc9umylMBjKNxgfGA0zPW7aA4g067Zo39RJLoXm6DWyIu7nN/OD4neF/pv4sQq6wdu6Plla7DLFr1nUyA8uyLsH/9kmcslo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(376002)(39850400004)(2616005)(186003)(5660300002)(53546011)(6512007)(6506007)(26005)(38070700005)(31686004)(6486002)(921005)(41300700001)(71200400001)(478600001)(36756003)(83380400001)(38100700002)(31696002)(316002)(86362001)(8936002)(7416002)(54906003)(122000001)(2906002)(64756008)(76116006)(110136005)(66446008)(91956017)(66476007)(8676002)(66556008)(4326008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3RDWTlzMExpckZVbHNLVlFoTDNwVGdOUWdiUzVKdkpaWVpzc25qOE9STldQ?=
 =?utf-8?B?NGhFQythY2FEaUR5cEFFeVlqZi9QdzBMWGlCSFIzckhWeGpVZlkyejlTOEdT?=
 =?utf-8?B?R0VwTTNFaExpdmRlcXluSEJaM1IvOENJWHpxZXp2UnhEMXJGdy9XU0NLV2d3?=
 =?utf-8?B?Ym5QdFVqUjBIcGpISmlCZ091ZGFiUHlmL05sMEQzb2d3MEJQTDh2TE9XTlB0?=
 =?utf-8?B?eHhaNkpUekJDaC9VRVAvbnFiQm0zQmsxWlNhZmpHUDZnVURuNkJDQktFK3ZE?=
 =?utf-8?B?cHdIbzBOcGJ1aU9CZThZQjBOT21vak11aG5BVFFYcWlJU1NvZXRNeXd3OU05?=
 =?utf-8?B?ZHpNNHM2SjNmT3laMW9nTmN1WHJrTjZhMVVCb2hZV0JpUXFDMENrWkQ0YmlR?=
 =?utf-8?B?cGRtYit2VFU0N3dmbFI0ZVV0cWtSQjY2a3J0L3Z0M1NxZlZnYlF0WGhDc1po?=
 =?utf-8?B?Mmg4bDJyeE5FUjJ3Zkw2azJzTXdIbEw1eGxjeHVabG5LcGFPVVF2SG9Qeko2?=
 =?utf-8?B?ZkJ6UkJkS2RJL0w3K2FGNWZtdVR1M0l4Mkw3Uk51bG9jVUlOYnJOUHJUMmVQ?=
 =?utf-8?B?Q3Y3TkdxejRQOFdTYjdYVXg1RFVoMHN5K1kwbFZnRkJJVDM1RWRzWDlVdDlz?=
 =?utf-8?B?a3djbUZqdEtDNkE2MTk0WWlHeVJmaVVHdlBwYlIzYjI0LzJjR3IrQ2RrYVBO?=
 =?utf-8?B?bXNvODlmQUhrd21UQXJEb0w1Q3lvdVpFYzAwZTdqU3ZESDJXcUhNK29qUkFX?=
 =?utf-8?B?TzA1ako5ODNKbXVoYkFVTEVqYnlXeFRycERjVkVpZkN1VVRqODdGMDh2Qkpk?=
 =?utf-8?B?c0Y2QmtCSWdmbUlWVzZucG9DdVJYbXpOeGJLV3JUemJRU20vNitPS1h3Zi8w?=
 =?utf-8?B?cS95eEVhT0JMVkhxZkpqSFVjM2JpTExYL25pWGJ5bU1xSVRuYVlLbUgvTjNa?=
 =?utf-8?B?Wm5DN1JHcjlqZTc3Wk1ZdHVTV3pjTmFVcTFwQ3ZCV21MUjBnb1lycmlMRXNB?=
 =?utf-8?B?S3lPR2E1dFYxZGFRR2FMNWQzNW8rREN2RVh2SUpMbDJXNVJNYXR4RE5CYit4?=
 =?utf-8?B?eFcvc2xhQldwektZcHlXVnlxcHdnOHl6eFIvbmhxUjE4M1h4Q1h2azBlTXlz?=
 =?utf-8?B?RE4zY1RhYzdUSW93WHNvNWFwcjVqcENudTQvQWV6MG94dnFCODd4b1hSTUpi?=
 =?utf-8?B?U2l0RXlNY09wWGVXVVQrMElFanNTUmpVZko1WXlpT3pxL2paSk5YVngvS05M?=
 =?utf-8?B?TFV0MVh5bngvU3ppUzhGN2ZIM3FveFlxK0VwRldEc1dIM1BjbUNKcXVRbnBX?=
 =?utf-8?B?R3FtTGNnNjVLalRMT1MxSUsvOW5zQSs5OUw0VDdxNHZqMWh6WEZJUHdtN2dS?=
 =?utf-8?B?dXpVZk1MU3JhaDhtRXhzUUFOVVhnY0VZcEdPc0hsRGJHV1NCTmY3cVRGeGly?=
 =?utf-8?B?Q2lpbnp3K294Sm5mV3pkK2k2YnliQXlwNmFZRFdsT1VFd0xha1dIdHF2VDl4?=
 =?utf-8?B?RGZMMlV2MGQ4dXJrYTluTklTRlFsRDNGaGxXT1ZsRXFHMHRMUkxxQmRabWFY?=
 =?utf-8?B?UUNHcERNQm1jZ2NrTDJwbXI5aTdwN3VzTkYyaXdEVWNBeEFxVkNOZFFZOFV0?=
 =?utf-8?B?YUoyamV6SS9vUzRIazdtUThVNnFybUZtZ05SbE9KT0RHNGtLREtGR01VcERJ?=
 =?utf-8?B?bTVZdFdWQ2hSZUY2YUpxcUxBM0JyU3VPRUppM1U3OWVLVUJOS3h6a09RWG9Q?=
 =?utf-8?B?cU1BQVlZRnF2Wms2SGRhR01NS2pHb09iNWxpc2NlMXkzMUViVmxNM0p6UmNK?=
 =?utf-8?B?TjZsVnBkbW1kQWFlTHlxZ1loazBDeUZ6NWxZZUtaZTJVTlVFbk4wN25OcmxH?=
 =?utf-8?B?TGl3S1hMR2ErMDFwOTRWaGJXMndDRVVoUDM3VkZsTzlyNlRwMlorYnYyMFEz?=
 =?utf-8?B?V0x0VHZkMU54MlVXcU9YRjdUQW9xT0ZwWTUrdWt3cDJjSWVieEJJMXhyNzFD?=
 =?utf-8?B?Y0xZaVV0aHFQS0NPMmk0R21QMytraTFGZnN5SUVXc0I3eFg4azVXcVlhbUJw?=
 =?utf-8?B?YVJKem4rMjl2eXkrUTM5THF3TmNrZTVLdWJ5d1YvZ1YrdGc3L1lpT2MrQmY1?=
 =?utf-8?Q?2JOAt71aQC3u+AjcOvjCJ/any?=
Content-ID: <C256C4ABA841CE44BC36A66C279D49D2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a37aeae-129c-4716-98dc-08da8e6158dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 10:36:37.9923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sf8nPlyESOZz+MvyxdRrSsOlWLOBG6ki0YDwkWOebwZgoCG+6+DKqSv8ahjhb5uKaSjD9XrhNWBBmOYVP1drfzGiTL/ne05VUY0hRSVasqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_033645_640691_DCC71B1D 
X-CRM114-Status: GOOD (  23.14  )
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

On 04/09/2022 08:26, guoren@kernel.org wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
> O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
> 
> ../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
> ../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
> 'kernel_start' set but not used [-Wunused-but-set-variable]
>   185 |         unsigned long kernel_start;
>       |                       ^~~~~~~~~~~~
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>

Is this then a
Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
?

Could you also add something like:
"If CONFIG_CRYTPO is not enabled, ...." to explain why this
may be unused?

> ---
>  arch/riscv/kernel/elf_kexec.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 0cb94992c15b..bba3723a0914 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -182,7 +182,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>         unsigned long new_kernel_pbase = 0UL;
>         unsigned long initrd_pbase = 0UL;
>         unsigned long headers_sz;
> +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
>         unsigned long kernel_start;
> +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
>         void *fdt, *headers;
>         struct elfhdr ehdr;
>         struct kexec_buf kbuf;
> @@ -197,7 +199,9 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>                              &old_kernel_pbase, &new_kernel_pbase);
>         if (ret)
>                 goto out;
> +#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
>         kernel_start = image->start;
> +#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */

Instead of adding more #ifdefs to the file, could we instead just drop the
kernel_start variable? For the sake of compilation coverage, we could then
also do the following (build-tested only):

-- >8 --
From: Conor Dooley <conor.dooley@microchip.com>
Date: Sun, 4 Sep 2022 11:27:07 +0100
Subject: [PATCH] riscv: elf_kexec: replace ifdef with IS_ENABLED()

IS_ENABLED() gives better compile time coverage than #ifdef.
Replace the ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY in elf_kexec_load()
since none of the code it guards uses a symbol that's missing if it
is not set.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/elf_kexec.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 0cb94992c15b..29cbf655c474 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -248,21 +248,21 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 		cmdline = modified_cmdline;
 	}
 
-#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
-	/* Add purgatory to the image */
-	kbuf.top_down = true;
-	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	ret = kexec_load_purgatory(image, &kbuf);
-	if (ret) {
-		pr_err("Error loading purgatory ret=%d\n", ret);
-		goto out;
+	if (IS_ENABLED(CONFIG_ARCH_HAS_KEXEC_PURGATORY)) {
+		/* Add purgatory to the image */
+		kbuf.top_down = true;
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+		ret = kexec_load_purgatory(image, &kbuf);
+		if (ret) {
+			pr_err("Error loading purgatory ret=%d\n", ret);
+			goto out;
+		}
+		ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
+						     &kernel_start,
+						     sizeof(kernel_start), 0);
+		if (ret)
+			pr_err("Error update purgatory ret=%d\n", ret);
 	}
-	ret = kexec_purgatory_get_set_symbol(image, "riscv_kernel_entry",
-					     &kernel_start,
-					     sizeof(kernel_start), 0);
-	if (ret)
-		pr_err("Error update purgatory ret=%d\n", ret);
-#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
 
 	/* Add the initrd to the image */
 	if (initrd != NULL) {
-- 
2.37.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
