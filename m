Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47702C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJ3i7h/YpwMTYJvYRCCiaIYF3W+cz/IhfpZm/mMGqIU=; b=Ula3EGVNUqVEMX
	uoyR7cFC8Xl1AuIHLcpEV2OHDwIAqWGAMUxHavBeSrvuJ6ivmTOqVRZjPuUyfYlmTuqNI/G6P2+X+
	q+agIJvyw1SqVt0RmAcxWaXumM/8sSNsGxhbObXqrnzJMB4o2Yqn2mJDR28VsI2YdtVNslqKol9/3
	tutRbc8YDgN3uzP2G6TQSnc3e7rOPUABWsHptBuzf1XE9Nur+gvzmubeAXyCTnRwytXMNmlqaQ03n
	eQN9TfIHA0jMAYYhLeBJWF+3E0rN0aPOHw4RROnltrElEd/VYJarGsTNP5v7xP+SYcPde/EJ4usav
	xusIPEvwiPgpOcqPOsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3tD-007uYw-GT; Tue, 13 Sep 2022 11:15:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3su-007uLj-31
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 11:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663067720; x=1694603720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oGb5qsFFlW1EptppGWznnT0sf4yemy5ryDPiAP1Phd8=;
  b=WAdVCRuBC7NmO+LGZ5DWFscBaDMuJco6mFiMpLOV/82DWBwUjDwxDIqF
   ckmr9bBOZ/NVThurHOMAE/Yh0LZQskLjWjIed/oM/wS9HEeVAZx4YZd4M
   F51O3IVG1fvWKdwLD7sZbkdtr1si3qFhCx7x41ARP9ybZ59Zg6FchBnNP
   rdKfUS506t+D4YNQ06pc6k3jLjabz0Vtv5OXaj3Jn6vJPJM14A1U2z/AN
   F4uFbRAEkiBcO8tOnYrA1P3bc5uk+1W/3popzlJAoFCIcPsS2UxXuUxiS
   pYy2mqbEsOWBLpXVcCH3ysNFCFpWlN/gIfpPnB18/1l/NsMfjvj4+q3vY
   w==;
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="190602190"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Sep 2022 04:15:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 13 Sep 2022 04:15:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 13 Sep 2022 04:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8aotVg8rykcu+2cbzFFpeoXNJx1t+7f26bW/DDcRJdjEGI8N77yWQEUwVyVHUnyEgernWBEPcVFzTJNC/w8ygMw9/4pjZZph8jzQCHY5cbTr1AOeQo0dL3QGOaMYSWJ3/x0GDGuqI4XQpcKIk3a4HT9XKbeAA7VhKASn4izp5AtgtR3QfIGBObnZq7SlX9JPhaDqfFRruJX0M9EiSsJ0JTf4knEGBN/JZF6IbXgD6/6Kl6QS8cTpwk97HRmnEwvuecEBRjFFHx2S1VuTW2YpjRAA2hLTOclsRW+G2EvRTGCRsFPTtfoQNfk9JkxSekvWbXVMGqjqHIoV6eiNetkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGb5qsFFlW1EptppGWznnT0sf4yemy5ryDPiAP1Phd8=;
 b=fmcA2/5LIbTf3OmCatjbwt6khSuuzAPqJlmlOSR5TGgPmWhHNYtxFrLryxjjo5h0ZzJZHn0gcf9Hx57YbCvS7tSj+aEfApCUOUhnKdahqY3D7gH+S2yJpuUkeyB6J27jFKUQ00RthpwFkdkBpVof6VqB7SJ5D5u1fOg8JPT14pQjVylSKMfL3+oTfMLOoCvnYW07nis3CuoodCZWFWb5NUthDJccE7sSa181TANNFp/CkGpnOesQ3OFOv/oJ+cE6mi+58NgrcRqZgmwkriSHRiQj32kU22LFIXsG2TCanYfpnwTsS//Zu4I5aS0zDo1NNjhd/25FKAsKfAmKMKqvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGb5qsFFlW1EptppGWznnT0sf4yemy5ryDPiAP1Phd8=;
 b=k87BWnFf7K2cx330fX6BiL4M2za1IJVsxYrFcn3+aw4rqCvFPzcM4ZqkwsmnHltCilt7AaacqbcaESCPZIq5JFgqh1aoCoqN5bx/UGwLPZr8OfuzDZKp01UAYt0h5W11xkSrxTV44NC1dyjsZuQDJ+rrMNZUkeMhuvYFuLiC+sQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 11:15:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 11:15:13 +0000
From: <Conor.Dooley@microchip.com>
To: <lkp@intel.com>, <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [palmer:riscv-zicbom_fix 7/7]
 arch/riscv/mm/dma-noncoherent.c:15:14: error: redefinition of
 'riscv_cbom_block_size' with a different type: 'unsigned int' vs 'int'
Thread-Topic: [palmer:riscv-zicbom_fix 7/7]
 arch/riscv/mm/dma-noncoherent.c:15:14: error: redefinition of
 'riscv_cbom_block_size' with a different type: 'unsigned int' vs 'int'
Thread-Index: AQHYx1+dQ8XuRBA4WUKWCV7rij/3VK3dNW8A
Date: Tue, 13 Sep 2022 11:15:13 +0000
Message-ID: <e3a97c2b-3b97-0463-800e-2a471b027adb@microchip.com>
References: <202209131858.0qmW0TEk-lkp@intel.com>
In-Reply-To: <202209131858.0qmW0TEk-lkp@intel.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SJ1PR11MB6178:EE_
x-ms-office365-filtering-correlation-id: 2c0cd554-ff7a-4d8f-69d9-08da95793a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8B696REsazlnS6y3BW9twF5EuKkkv5SDeQBZ0eUZf0xZeZMubcXAj+EVDA5Wh9TX30cYnoJxr46rVmoCIrvCxygLFJIKgWf9s147HfUSaOhWziQVurEwKN7EyylTpaLLSvdiHWKD4aIPiZT96iTVP9Z5+aDEDfUsYZripF25zAESFV4gmH4VCN9TVKm6tBJKa7Pe6/PqkpAbMfPw+t2gmf0SmKi9uYVT3pUGrza9k71SU8lBbL/ix5zM4o3gaVeoa2dwYEN5FCRxHdveRDGTOy2h/0RZWLyt38mLT6SjBuIEwwuDbt3P+87jVb1crqS71UfTybqzqCTFdfxWDA+Nh1z2N4Mi4j4TTlWNVy/EgXWGmVJjxEHLa0h3tzZr3SsFDFIBZE7F6wdonAFTrExXbFotHrGpS5qofjiYi/HxgNzJS7vPmOreQ5K/j1yp1T90e9nOzn0KsKbXuyetUkkOQ91EUNkJ7QxWDD2msi5V2jRsZst+Nr5r959WLtzQzr8EV5LIAEeT83i/Xkiqr+uKT3/wgAoucudSF06m9bAOc2uMiTkz+Bct4k1qAxB6lLDqNyswyacjqRBLHsoyLJ8g4i0RidOW3fQpCVdUNH8cX44mgJLXqL5/6tip6fltQcUl5LXS4YCKr6OMrF8DP0f5xWrUfMtam85lIHpoM0eHgLdIjO7j7DWYfuZu/0QYMvFV3RFXhMThMqqYidSO2+Et/747hdH8oFWeKCCTlv6DoPb7HIWu5QTFdu0sdr6oGTwbxSv3o9AvqzGH+gEV78nLONtnn2pVhKbiYb1GWdhDTEriFCYaCqEDx8mJISMtkpMVMHPPsoVJpnazBdPsMY363Ul2idTxdIX09Yjt5zqOn1LZtGAvIQkZE80ON4/EMmYL237ZpRRtQermZY3kJP/2ew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(8936002)(71200400001)(110136005)(83380400001)(6512007)(38100700002)(966005)(26005)(31696002)(8676002)(6506007)(76116006)(38070700005)(66446008)(64756008)(66476007)(186003)(86362001)(66946007)(66556008)(4326008)(6486002)(53546011)(5660300002)(2616005)(91956017)(316002)(31686004)(122000001)(2906002)(36756003)(41300700001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2FsVE9rbHh0SFFLMFlCVnZ0YlBVbXBacm4zWnE3MlVIOUlIKzh2dVNLYmxD?=
 =?utf-8?B?YWhhc21halBGZzNSOWY5c2hpUzVhYTdKSmk1QThkVGRhQVVMazM3NWlMU1Y0?=
 =?utf-8?B?WktVK0dPYU9xdUV2cUxUR2VzM3dUV1VoZkF6VjBLZXptcElmbEsydzlzTmJ2?=
 =?utf-8?B?RGtEei9XWnlUYlRWUkZUSlpTVVB4RmJqNzRkTi9TU1RtSFdiT1RyV2xORTdr?=
 =?utf-8?B?cmdhcFdlRHRXWUtQTHdVeERZdFpPTGJacTZ3djNEQmZKT2pBeEtZamovMkJC?=
 =?utf-8?B?a2VPem5uZTFJUGQ3REhwY05MblVTUUJES05saVA4MG5ka3c1MjEzT2tCdGhU?=
 =?utf-8?B?akhpMjI3alhhVlJoWGtURmpYVmY3TUtxM2szbnpnV21YN0pyVC9OVUtYS0ww?=
 =?utf-8?B?d3JWc09hV2pILy9BQmxUYjRneStJVGs3Wm5yRXZ5NWNUaXd1NFdjam02Mkpi?=
 =?utf-8?B?cGdySnVVK3U3alFBNmxyaGxZQ3BSRFNEZkJZYnhSUGQyeGp5aWJkaTRqZnFW?=
 =?utf-8?B?RDR6MDhtemhnVXJqMDR1QkhWMGJBTi80Vm5JZ1hGcVM5Z2RSSzcydXU0MFNy?=
 =?utf-8?B?ZHhZblZ5Q2l2ZWtoaUtEK0g4UXlRMWZGQklLeEE2YmViaHVlMHh5VTlybC8w?=
 =?utf-8?B?WjBoeWJvZmdZQ3ZtYlR4UkNtTFZtcXd2UVdkTW43RE03RVliTDg4c0tCMXIw?=
 =?utf-8?B?dnNaTFhuazI4dHA2YUoxUk51aVAwaUpMVy9SMm5jZVlJN0I0MmxGcy9oYm1S?=
 =?utf-8?B?RTlQSjU0S0dqVkY5L2RuUy9LZWNJRDBBUWxKT3lXbGxyUGJoZWxCMWhUSFFM?=
 =?utf-8?B?UitnZFh1ZmM1ZkswQ0R5ZVpKMm5mV2h6V0g3N2pwSjBSRUEwVTg4Y2l4R002?=
 =?utf-8?B?Uno1SVVYN3R0R09qSGI2d3FYU094SGJwRjArTnBxbno5V1o5SnFPQXczbVVQ?=
 =?utf-8?B?U2ZBc3RjcUxkdmsrdlV1ZG1RZTRDWmh1eEhZdkV4R3MyMUNOV0lkdktyNmpT?=
 =?utf-8?B?eThuZ3E4NTA2R3JsVThGLzJmUVpKMzA5Qjlpd25rRmpiUGNEWVJvOHFTV2FW?=
 =?utf-8?B?a1BWRXM3bDkxNFNZVzNXYzNiZlJHUjlNS0o2MVZDK1pKWk1jM0xEZ1BIYTZM?=
 =?utf-8?B?eCtQN1pjZjdENmdsb09QcWVob3lEREJKMDRIYmZacm5RbGNSdkYzaU4rMXBn?=
 =?utf-8?B?SGdSM3BRcGRYZ3dVaU9kbi9sZ1dLT3B3S1BPVHVFdmZOSUo4Q3M1elE3a0Q5?=
 =?utf-8?B?VEN2S3R1MDkyaE5LL085UGUxRjRxQWdxVFpFVXJJTkRhdlNNYUs5Z2g4RE9o?=
 =?utf-8?B?MWJIbUFqMjBhZitXSGE1cHY0dmFiZEtJUnRFRVROUGVTanFwdnpRRlNlMEVX?=
 =?utf-8?B?RjFpWlhHbG5kb05WOVg2MDdtZitTWnFrSjZhS21XeUF1MklyWWdneGRVMk5k?=
 =?utf-8?B?M3JmcDdtdVlnSTJtUGJ1U3llS3lKOENZSjM1QWV2V3NsanA3VUJJdHBhTGFF?=
 =?utf-8?B?VVdIRnljTHo1dmptVUZhTGRISFBoU09pOGZudXdaRTVEYU9teTR1bm9LWStF?=
 =?utf-8?B?Y1BQaDQyNDFDV1JXSUFaTGlOYVVScklaQ2I1V1kyOE1nUkg1MmtXWWgyOXM1?=
 =?utf-8?B?WTkybERVV29rUmtjYnc2RDBzWFFMSUZ2ODNnaVhGWjhrT0lEb2w4TUNZU3Jp?=
 =?utf-8?B?bldISFNZa1A1NDl3MXR5SERKSTZaMWRCSzJjdGhUUExSTGZrNlhkbG00MFpT?=
 =?utf-8?B?WWxndFpMZzNCUEVJNUZYOUs3akkvc1dqSWdXalVVaXpmS0JOc0JlZFVhNVN0?=
 =?utf-8?B?TXk0SlN3TE5mQUo3cndrMDBUS3ZxSTcrdU01OU5JRXVPOWozSkpadmZUcDI5?=
 =?utf-8?B?bXo3WDNGOW8xa3JWQmxGMFhLeTJCVFNIaWxETSs1R1pxRm9FRFp6VUpXZ2gw?=
 =?utf-8?B?Y05LaFBwZnRWcEJqUXc0U2JzajhqYkVNU09NbmNrdjcvajdza25Bb2lhRkpO?=
 =?utf-8?B?U2J6T3d1eGtlN1VtUVRYaHRqT3B1V1Niem1vSHNwb1ltcEpVQTl3Wk9TN2w1?=
 =?utf-8?B?MDJmc1VDNFZJdmVJYng1WUdobEkydDV3SmpDd0FjRjFwUEVVVG1jVzlJM2F3?=
 =?utf-8?B?Y0V2TlluS1lQSlNleUx2MGNsOVZrU0RCTjdpd2IvdlpwbVUzbldiUFplZmpD?=
 =?utf-8?B?cGc9PQ==?=
Content-ID: <D68EC8C807AE094B806D26E6A5981907@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0cd554-ff7a-4d8f-69d9-08da95793a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 11:15:13.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlsjpITpks75B32hZsTIRwXejahq7fDUmfvIiGBYFJxfZLRG//zoa4y6M1wRfohMzBAxEi7zohyY7ZX4iZ2TGeRKLIAigaUtws7cNrWnIrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_041520_159592_14417354 
X-CRM114-Status: GOOD (  12.59  )
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

I got a minor heart attack here for a minute, before I  realised
that this was the original one on the riscv-zicbom branch not the
patch I sent last night! /phew

On 13/09/2022 11:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git riscv-zicbom_fix
> head:   933c80bff1907722a069a0d8bdce283183e4b203
> commit: 933c80bff1907722a069a0d8bdce283183e4b203 [7/7] RISC-V: Clean up the Zicbom block size probing
> config: riscv-buildonly-randconfig-r005-20220912 (https://download.01.org/0day-ci/archive/20220913/202209131858.0qmW0TEk-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install riscv cross compiling tool for clang build
>          # apt-get install binutils-riscv-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=933c80bff1907722a069a0d8bdce283183e4b203
>          git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
>          git fetch --no-tags palmer riscv-zicbom_fix
>          git checkout 933c80bff1907722a069a0d8bdce283183e4b203
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/riscv/mm/dma-noncoherent.c:15:14: error: redefinition of 'riscv_cbom_block_size' with a different type: 'unsigned int' vs 'int'
>     unsigned int riscv_cbom_block_size;
>                  ^
>     arch/riscv/include/asm/cacheflush.h:46:12: note: previous declaration is here
>     extern int riscv_cbom_block_size;
>                ^
>     1 error generated.
> 
> 
> vim +15 arch/riscv/mm/dma-noncoherent.c
> 
>      14	
>    > 15	unsigned int riscv_cbom_block_size;
>      16	static bool noncoherent_supported;
>      17	
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
