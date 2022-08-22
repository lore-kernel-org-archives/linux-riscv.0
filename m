Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2540FC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 20:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qH5tQwx0eZbl3hdW6CqEpqrc87Zy/sIz0sxmkMW12GM=; b=Hpw5XAhikTH5Fn
	/E+VDAMuS1zG7ST31oqNXMsZMoUuWEyL/E6HXNZgQpI/Ph8hZ0UmCXQKUKSoo73XhaaxXKMwaNahy
	Ys8JGTTf5duKfHNDon2BfIegAsAjqdh6sjrmgiFYbgPH+FZ0fgzlD80WMo+MzMTwN4JWHZL+huSID
	abftq5PF/RP0b6TA8g9QYY1Q1yY0jHGwScdXt/Biyl+pzgqI/9ZK5UI86Vp6+65l84dtCkzvSk/su
	FGyKT1BDPTC+ffQCuxcxUwTezwznHj9DTMUnD/j54JCP8qjE9sN9duviqB+dWMBQb5A+znPhrbY1V
	PB6x4g5OLfH9QAmYYmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEIg-00Eijy-3e; Mon, 22 Aug 2022 20:45:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEIb-00Eifd-6f
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 20:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661201129; x=1692737129;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WY+yD2iYV7wYHezXXwwcRc4HIh5zIAO/QR06DKwDHbk=;
  b=f5qsdoP23ugJF4WHgCllnUFyo5FfoEh6exmlBU416q7onc9yyb9bYtry
   ufM66tp+EFFDWOoMdx9vbae3nEQLBRkOzTaVAcTYeuUQW/AISFZ7nw17L
   JfWe6d06Ne6Zl16KuQQ3CncDCldCHR/N/Ap3LkBR8OxBSL0pF6ppY5co7
   poo/9obacJOX65nbX5FMhrp8iaCOwbfiDcS94bdoPB7XzE2C29kGpkFAF
   mpPS/H0ueoQoqnFfwLkXXn+HmM0mq4jSefknbjZcJOQDG2N32r1wu7ZOi
   ecfbgFtqBuBpKcWDZIi2sRr3hZ2w5qraJ1YMnscZhyj6MEj+Wld5e/Bb1
   g==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="173599437"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 13:45:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 13:45:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 22 Aug 2022 13:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF8afcSSbRskS8RVs1nAVHUgI8IP7fXj/3tc5JLN2G5itx9ESWcPUW2d9l6aya/ZQKOgdvPg6+uqNnIaOl75HVCnudqm6JhPl9TS4WXiwkd6l3HIIzYgdtnRDtCv7J2tP4KaAS5Ms7OxKFgerb+nKtTNTpSs2wO+QGGoS5MMzCz/MoKW4h8Xqd0SmMK+MTJ9crWgBjkz8rQE1rPG29xmKN+U1g06lVLRZAVYs4izbuqw7Y2qIFQTm/s4s4Vd1wSK7WRRBRGmrnC4wirVgedriiZx5gH99+FAjwwgeZqqII8fE3t1BuFHjzkseor7HpalQny2qHXKVL6mEKgH0eckUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WY+yD2iYV7wYHezXXwwcRc4HIh5zIAO/QR06DKwDHbk=;
 b=n49556WSkru9m0TrQeih2l1Lv6EHaFxOU7xQeqDBNjcZ8/BXUrtFlBN8nOnvF+oNS1mmUIMm4BSrkJZk2QCZ0HSYhtz8L0U4swGseh/GBHQWPZvpcKp7Cd/n0GsKkVgWoRl2irvFci5MUtmrUgOXdD5e1PikMF8KaNtZd3OPPIP67Ku2iC6CtrWz52yqwg4U9hRaCRd57seQCVPTvDrJaZwojj5ge4GzOvblbceJD5kyNBpSbEoeiEvtmfEe8NL+HcMDu+M9St8JOhufiiUs95756TxjXCqhDCX7e5gAAwpj1qgKzcdec8d6yuy5sImqUcn3F6GCv8mn6CJJkQG8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WY+yD2iYV7wYHezXXwwcRc4HIh5zIAO/QR06DKwDHbk=;
 b=FGTwjH//jusCBEFA0SQ+ZN5rh5UT9IOEDZk65/4AV0AomVCW170J04AEOPF7g0JqEZD85xnSaQJcSpN70eEYv1gTVgP86OeeCoBiZc2DMEgjBdI+3YCsY+sU7md9giRMdt2fqYF1iPqLOzAsZqf4wT7wsOJRL4pkn93QQC2WjWc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2867.namprd11.prod.outlook.com (2603:10b6:406:b9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 20:45:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 20:45:07 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v4 1/4] mm: modify pte format for Svnapot
Thread-Topic: [PATCH v4 1/4] mm: modify pte format for Svnapot
Thread-Index: AQHYtjy/dezAEDXP00GY+f86YFwxca27Y6UA
Date: Mon, 22 Aug 2022 20:45:07 +0000
Message-ID: <6d6e196d-9943-b62b-eb4a-e658a7f4e15f@microchip.com>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
 <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09f03ae7-a428-4939-2bae-08da847f329d
x-ms-traffictypediagnostic: BN7PR11MB2867:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 38dwX1SZagb3o2fId73GBNEOF0+yyACbU83FCrY+roUsYHuc932DFKqeopd1wtR/upmuwgWKZZrLpzOk0RgUGFbkam71RnajfLjrK1p+qQ6Hh7fbX5aVIGwWvP71jBNcpb9A4vkM8uDyO22q6C84T9CVx3Az0oWcaVxCIvplSktHTpWTXdwBy37lbuXSukp9f0D86q2CMIYRkcSRK9ENP+ZjqdceQLbg2WGgQwr4xUZN+eHTIV27W5lZKsIhZfraxV6T3dEYyh3i88Ap70S68T0NsxYF5+5ztgsLxqSV1EOTx/PhtXznJmWB5nLQFZmD8Ij+iVw2E+BcHY5AdY2TMlcjRoKnIbi+dqJGI0AUVomJvls0+GMLCLfPxlNeBMhEeiekQ8Ze8I8daP+sK5rdQoppkljl3gL005/kvGS50WV7YvcV1l3VM7DXgSeQNK//xe4udrNomEJzVEown7iDpLon4pNU/Oe1gpzlizUTE2VpJgiRMeGOeaKugXQK8JuShDBXlpjY1d98Y50g776Q4J1euOrmmenxa/L7KCP+g+jbB8uhLHsa4Vk4wnL2WiyM9G3AikG8o2LHZz8BN1fWtjGUSBURAoYITH64Qte2fYG8DrwY6MyCr5EyOzLYin55vjRmQ2lyK/QwxkKLn8fLLALJN0yhtADEqJF6ayjpQ+bzUK1tfsl9BvLFzLyvHN9Ws5IPAGtYS1mK0H+kVlfE3RExLgTQFYDex9ppo4H2J5nkxKMRwJm1Z+fufk0/tr/7e1FgIysdzgvfBny9bxSJ9+FX3dzJ7wGlbsO7mtedQ7BshD9n7OJ+s2pIeGclbJbjYFjxHqAoD7+HB85HZAgSM6QJ3VL5lg5P5DL5EE7adxU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(376002)(39860400002)(36756003)(31686004)(8676002)(31696002)(4326008)(86362001)(38070700005)(76116006)(66946007)(66556008)(91956017)(110136005)(64756008)(66446008)(66476007)(316002)(2616005)(186003)(6486002)(966005)(38100700002)(478600001)(71200400001)(54906003)(53546011)(6506007)(6512007)(26005)(5660300002)(41300700001)(122000001)(2906002)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVU3WUptZ3NUNWw5djFvY1VHajVUK3RiM05XS0trYUwzaWdaVUEwei9JcWxr?=
 =?utf-8?B?QXBYWXVDREV3UkNpUVA0Mmg2SUo3YnRYOHRZOTZtNFROeEhUN2tiMFFIdnVo?=
 =?utf-8?B?ZUw0dUpwenNxVVcwdC8xdzJFTExxVi9YSDBTbkE1aTQxZWFrazVkVy9qN0NM?=
 =?utf-8?B?ckQ4OWozbGVPa1prUWh1eWhNUHd3WkpUejhmYU5uWE9DL1pXRXkrQVp5TDRI?=
 =?utf-8?B?RjlFenpPZ3BkRFM2bXo5Nyt5YXlKQlJpVm16NmNQaThTSGRqb3NEcUo2ZWtr?=
 =?utf-8?B?QmlDaE5ZUG1IK0pPQU84N2NZSEY2cjQ2WFQvckhBWURlbmQrRTBDclNRdzh5?=
 =?utf-8?B?STFtcEthdkNTREJsclp3N0dsL25vOVZ1c0V2NXpKYnFsK0xpNDBNMCtuVm9w?=
 =?utf-8?B?cko4OXVZN1E0cGRyU21OOXRCVGF3ZmhhTzUrSi9WenlKZUp0R0tyN24zbjI1?=
 =?utf-8?B?Y3hzbjFobGRyalAvZEQ2b0xFN3lWYlJQU3lkNnVRWjFMcHRaamtoc3BJUnZ3?=
 =?utf-8?B?U0JFOTJLVTVja0Rka1ZkS1JmN1Q2YytyVVYwdm9jMTEwblRNeWVHTndoWGNT?=
 =?utf-8?B?OUVobGxjbzh3eUtydWV3R0w2QVB5UUtuS2ZKUWIrbVE4TVVIbEc0MVBKMStt?=
 =?utf-8?B?TnFXUDRHR3F0bWFKeXJxdGpxem9STWdyZko5R2loV29vRUd6dkdnVnc0cURX?=
 =?utf-8?B?MjN0dVpSU243eU4xVXV6VnZUVWxkdEYwSUNmbjhrMVJnVi9oY1dtV0gyWkV3?=
 =?utf-8?B?a0xyRHpDdWhnQ2tuWTVubG9mZmhKMUVSRTdSUkF2NjJZQStoZ3h2cmVueTU3?=
 =?utf-8?B?SnROMUtLSkdrZURKaDJBdFdUbHBMdk5sMnBwOWxPVGtsaTNTZGJkRGl3RFpj?=
 =?utf-8?B?SFhZOENtcDhQdkdoQkNDVkpqS21YUjFPMk95SmRZSDN3bm1rbmFBV01WcEgz?=
 =?utf-8?B?UVRHZGYvcE5DNTA0NWdtRURsTUQ0RElqTXFPMEZsT3NacFZTTVFIcCtWQURO?=
 =?utf-8?B?MU1Sd0h3eE9yVEFURnpReEo2VVZZRCtZbGVDUUtXSllQZUNrWE5HZi9QZ1hp?=
 =?utf-8?B?Um9QVnpmbkZ6Vy9SNHFjYmxTZ2ZOa1FZVXhkNDdINUhNeXdEci9JN3NFejJr?=
 =?utf-8?B?QXgwd0NCN2tkSGZDamVSaXlwREo4S25JdGNjaDZKSEk4dDFiRnlUMk1qc09D?=
 =?utf-8?B?Qkk3azRMUlZqendadDZlT3B3Tlkzc1pUVkVnUXBSUzFRSUhvQUVIcEs3NnVO?=
 =?utf-8?B?V2FNMjB5NDl3T1JuT0JNMExDMUdiN3gzeFFuNzAyZ21haVovZVdINDI1S25P?=
 =?utf-8?B?bVh5Z0hjaXpYenN5TUpjRXZCL0JPcEZBUFhQelMxZDRWZnBldjFRYWR4STBx?=
 =?utf-8?B?alFxM0ZFR2RLdVBxNWQ3L3dCdXBOeXlqaGpaeGU2U0pOMzUxWFcrd283Wi8w?=
 =?utf-8?B?eDdPakVYVVM0R1RqdlZyc25lbkRWOFZjY3VhbEtFMXp0eTljWG1KTG9RLzl6?=
 =?utf-8?B?WXZ2MzhYdEg2MzBMWlA3T3ZPaVF6bHArNTJCT2JlcGRSS0l6dWZLVFdzc1ZP?=
 =?utf-8?B?UmZuT0ZRYm9XUXZBcUdZM3FVejhhbzZkNVhicjdTaTdXSjRkTU5JYXV2dTVL?=
 =?utf-8?B?MytndVczeVpOUytLR2tnNmtNSUtrNjQ1SjJ3N0I3Znc0cDF2Mm1INUpUQ0NQ?=
 =?utf-8?B?U0EwL25ZczByQ3RoN0Z0b1dxaWlYZ2c0MTcyaWlzV3hJUWo5dlhlZVpodEZY?=
 =?utf-8?B?aTZyZGFxeUsxRGtLYTBmK2paU054THEwcmR6a3ZnSUtFanQxaHdZMmdySlo2?=
 =?utf-8?B?V1gwQ1FReEJSOU1VMWpXMHVLSGVPTjlvRDBJYmlDclhsRVFPU1MwcGRGY1kz?=
 =?utf-8?B?NlhYTGFUbGxDMVFvbTJNNzlNMmd0aHJWWEIxQk44amNhR3o0M09HVnlWZUtr?=
 =?utf-8?B?SldtSWJaa21wd1JmYUhOLzdhZWpmWk0zUGJkSGpwOUVncmZ3UkZlYWRVNGdk?=
 =?utf-8?B?OW16QzZIUzk4bGRaS2VZMjd6VTZaTVlKM1UxR21GZXVYZHI1V2FMbGlrL1cx?=
 =?utf-8?B?LzdyZ1RRVlVnWkc2REdxTHZzNEZ4eitUSjVpSG5GWGVkNU5KdVp5eEIrU1ZX?=
 =?utf-8?B?bGVmdE1MTzJ1VUMrZGhCcERhL1kzSmpvRnJkdWJVdS9ZSGJpUFJjRDBudGhH?=
 =?utf-8?B?WkE9PQ==?=
Content-ID: <E24B5C207BD9FC4FA3BA36AE2F9C5866@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f03ae7-a428-4939-2bae-08da847f329d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 20:45:07.0751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvqOWC7NEhuCvu1fXjiuljKu4D68khaLwvwmUNs2typc5Lw1JogI6R5PGA7PJyb3nTbx986mFKDj/xHe+gF6LD8Z1IeVyf9RkTmhlHMsAC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_134529_719554_55DFA4C7 
X-CRM114-Status: GOOD (  24.71  )
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

Hey Qinglin Pan,
Couple comments below.

On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> This commit adds two erratas to enable/disable svnapot support, patches code
> dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT
> compile option is set. It will influence the behavior of has_svnapot
> function and pte_pfn function. All code dependent on svnapot should make
> sure that has_svnapot return true firstly.
> 
> Also, this commit modifies PTE definition for Svnapot, and creates some
> functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
> PTE. Until now, only 64KB napot size is supported in draft spec, so some
> macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 



> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index dc42375c2357..a23b71cf5979 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -74,6 +74,20 @@ typedef struct {
>   */
>  #define _PAGE_PFN_MASK  GENMASK(53, 10)
> 
> +/*
> + * [63] Svnapot definitions:
> + * 0 Svnapot disabled
> + * 1 Svnapot enabled
> + */
> +#define _PAGE_NAPOT_SHIFT 63
> +#define _PAGE_NAPOT      (1UL << _PAGE_NAPOT_SHIFT)

Is there any reason not to just make this BIT(_PAGE_NAPOT_SHIFT)?

> +#define NAPOT_CONT64KB_ORDER 4UL
> +#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
> +#define NAPOT_CONT64KB_SIZE (1UL << NAPOT_CONT64KB_SHIFT)

Ditto here, BIT(NAPOT_CONT64KB_SHIFT)?

> +#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1)

GENMASK(NAPOT_CONT64KB_SIZE, 0) no?

> +#define NAPOT_64KB_PTE_NUM (1UL << NAPOT_CONT64KB_ORDER)

BIT(NAPOT_CONT64KB_ORDER)?

> +#define NAPOT_64KB_MASK (7UL << _PAGE_PFN_SHIFT)

GENMASK() here too maybe? But not sure if it adds to readability.

> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..37547dd04010 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -264,10 +264,41 @@ static inline pte_t pud_pte(pud_t pud)
>         return __pte(pud_val(pud));
>  }
> 
> +static inline bool has_svnapot(void)
> +{
> +       u64 _val;
> +
> +       ALT_SVNAPOT(_val);
> +       return _val;
> +}
> +
> +#ifdef CONFIG_SVNAPOT
> +
> +static inline unsigned long pte_napot(pte_t pte)
> +{
> +       return pte_val(pte) & _PAGE_NAPOT;
> +}
> +
> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
> +{
> +       unsigned long napot_bits = (1UL << (order - 1)) << _PAGE_PFN_SHIFT;

I would probably prefer to write this as BIT(order - 1) << _PAGE_PFN_SHIFT

> +       unsigned long lower_prot =
> +               pte_val(pte) & ((1UL << _PAGE_PFN_SHIFT) - 1UL);

pte_val(pte) & GENMASK(_PAGE_PFN_SHIFT,0)?

> +       unsigned long upper_prot = (pte_val(pte) >> _PAGE_PFN_SHIFT)
> +                                  << _PAGE_PFN_SHIFT;

Why are you shifting this down & then back up again? Could you not just
reuse the negated mask here so the zeroing looks more intentional?

> +
> +       return __pte(upper_prot | napot_bits | lower_prot | _PAGE_NAPOT);
> +}
> +#endif /* CONFIG_SVNAPOT */
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> -       return __page_val_to_pfn(pte_val(pte));
> +       unsigned long _val  = pte_val(pte);
> +
> +       ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
> +                           _PAGE_PFN_MASK, _PAGE_PFN_SHIFT);
> +       return _val;
>  }
> 
>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 0be8a2403212..d2a61122c595 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -96,6 +96,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>         __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +       __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..8cf52f0c5f1a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -204,6 +204,7 @@ void __init riscv_fill_hwcap(void)
>                                 SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>                                 SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>                                 SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> +                               SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>                         }
>  #undef SET_ISA_EXT_MAP
>                 }
> @@ -284,6 +285,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>         return false;
>  }
> 
> +static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
> +{
> +#ifdef CONFIG_SVNAPOT
> +       switch (stage) {
> +       case RISCV_ALTERNATIVES_EARLY_BOOT:
> +               return false;
> +       default:
> +               return riscv_isa_extension_available(NULL, SVNAPOT);
> +       }
> +#endif
> +
> +       return false;
> +}
> +
>  /*
>   * Probe presence of individual extensions.
>   *
> @@ -301,6 +316,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>         if (cpufeature_probe_zicbom(stage))
>                 cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);

I wonder why BIT wasn't used here either?

> 
> +       if (cpufeature_probe_svnapot(stage))
> +               cpu_req_feature |= (1U << CPUFEATURE_SVNAPOT);

Could use it here too..

Using BIT() here looks like a no-brainer, have I missed something?
Thanks,
Conor.

> +
>         return cpu_req_feature;
>  }
> 
> --
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
