Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179AFC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 08:45:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F63261406
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 08:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F63261406
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2boChfR+C6qrD9oeOHMgE/w6cn0/6aKp7oITt8EW+Vk=; b=D+XbtWd0IriB/u3uIttcBTYn/
	bledNJW4kYFY4r2Lq/+E2B2EkvR/ckZk/LvrdXt4/jRP72MNXdJ7Gpk0d/HhPzOrbN7aTOQY+AgUJ
	mNzhjuNHhn9wAiaYswmeo3kOamVZIXgWJ6aowk9xpXVgLHL8wUCvemhHufxBlwlyF8LR06zu/MdXa
	iUUzWTuQeNe79I9PhcLzpaQ/x5HntrDxO6rbMoIuwFMd8JovBUb13J1Qk4aA64DYBROtZ1D8wjJs6
	gJ9Zi+KgV+djete2gkzS5nrbbeLq84XMpCskSUOgkjAA0R1fl7NSM0Kf+WDXmcv2G/CZ4nxxwz/PJ
	dA6y+IwJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZrQh-0015qA-Eb; Fri, 23 Apr 2021 08:44:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZrQQ-0015kS-P2
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 08:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=JKup7YFTRNL7RQjMV1Oxac4XUFkkSfWvP3clzcTPivw=; b=rJfrVuU3gMYEGz2LYa35O4XUQZ
 BXtxS2Bm0CcqPYRnZgjj2fBI+Uoe5RtAEvUJW7HmQLN9s6+dF9v9taiFDuKSY+RqzC6gvShbzRkDN
 i4tphxUSEsgzM7srM9iUHThqMO9KLZKwgzY8UJ9R3zZaWWE7X++OMYaF6hFEuEqeuxgQES/rTXFLJ
 1jXhvaxmHv4N8SRfziSV4FJXr6IIvpDIvkHqAi3SU31zs6s23QTobl9aPmIGm+twMrt4g8F5Dcju1
 WKBFP53Lpt7xS1Q9NKFXwAG3nFE68BYYRzeTS96+2+LOIO+vlkV+o81xSrfmncJfz7JdWsMEi6r5a
 99EA7SKw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZrQN-00EGQg-BX
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 08:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1619167471; x=1650703471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JKup7YFTRNL7RQjMV1Oxac4XUFkkSfWvP3clzcTPivw=;
 b=YjWSGUaxRqmF+G4EkxXNy+XHXKP/3W4jwrN+CPWB8eaCHThEDXE0EV9X
 FIPjITjlP9j4A78E1DdEFWi15UmzRwarfouPYsMsEnAy296LKYxlNfldP
 Lna1OQKr0tiuBV8YEJRptWNmmZfvtdQKpo75KWlou0Gzg3QxyD4bx25Yz
 edEgza+XwLJSCSFxBU3a0zYCs639M/NWPtuJ7om89ApyfXazvkbIOJ7Zs
 GMFiyxR+lSc4C3sKGWc5ltdwJ71OeX63twmSymhvh1DfKgn6iWjwXkJNc
 G1O0dfUsMvo6xT2/iVlPyqHN6R25OZ7g+aVbD5UZIuODJfAYvB8asmLXS Q==;
IronPort-SDR: abRCu3xRygMb9eabj8OJbVcLAmcenCPhzV+VGX/CdhNtPPZ/DD3CCdiMBtu8YDjrS7Yl5Cj84d
 /8jBwEAk4mAd1bk1D1AxmlTY5bkKCglBuGiE6/Lrotn0yQeJJCIkf2E0L7u872B6zwM78jjszp
 6uy9bmV7IHkJl1Zh/NE9OPjj+MOmjp912aHK/ucs+WDt6rAXne+4hzny8hWnKW/UAEeL4t2xwi
 Xqu8QMe0bCLSU/jaj+BeDyXOC5t/8lVje5wK0FEx3bp9hVN7d3dZ2jEelbBZRfpFooXXr4FRhz
 x0c=
X-IronPort-AV: E=Sophos;i="5.82,245,1613458800"; d="scan'208";a="52245758"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Apr 2021 01:44:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Apr 2021 01:44:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 23 Apr 2021 01:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Brnnbq5aAIQ0DC6CBnrTZtLntdzzay/cqu0d1OJ65xUM1FEFikRrUs1351Y9/S+bQDmfY/ob2Xdrl1jUjzKmxTW9hJxVj1SFYQtwUMqTMmscvH1Ahu5isuQqJsmM2i9P/Wzkoy/QlGUmWc7WmlyV6XJ7Bcz/yshiGelahvijC0ZJgDRM0OLiUdvaHmQjgJdcWpEC9ruJEZn+OMWFyLD45u42oU5l8fWyBIiV42AunGJZfTa3b9izkvjuPWKv4egp21/Y9RMluiICYhVOBR0wCuMT2NARx0lhDJ7mbE13cHCG7NabBlAqcNQZXcjGLQAutFyUkiYtvWuWAcolMpHoiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKup7YFTRNL7RQjMV1Oxac4XUFkkSfWvP3clzcTPivw=;
 b=kpeGtWj+SWBIcG2e09Ho/NGBZgPI8Eu+g6KwXz8Is5mC6012zcT4G+ajfNA+eLi1uXQfSXwBuP8knobQ3L/ptL4I8GTb2v+0eaoS+dFckGOg/UZqfHOEW0SNt1pVhV/Iw7VnE87t6bf66kg96c9DFVVzby3wctzzx033RPBtKHZSA7QNpGwD1hjbKngx8zPZd+pqMwFYhsOlXCsX3JPvYAm3n/+N8Qsj7IM5yw2Vd4GfEv6kUZle7IbuMMFj9stT739ZoUg1Hde62BIl/kQNCs4XAZa2b517u0o58aIo8WPMhWempoWKIzm007RcK50tKPXEd2JEXL1JIFl06VuLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKup7YFTRNL7RQjMV1Oxac4XUFkkSfWvP3clzcTPivw=;
 b=M6tV4LT5uAI6ByCCfaPmwyZH3vavIBp1ORZeqfHVQQ6STSKlEJrjW+6F3ekyIMyxgqkm6r1TWMkpfS4+mnHaEPLi4LKtK5+G1imXwfTQ1ArpXe7BhndzuFau790ot2oQ2oiLodPkuqj1GLnD/A1KGg4wUsKOtlm0DIKpcZVz4gk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1776.namprd11.prod.outlook.com (2603:10b6:300:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 08:44:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::1ddb:df6a:6208:ccf9%5]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 08:44:24 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <atishp@atishpatra.org>
CC: <Atish.Patra@wdc.com>, <linux-kernel@vger.kernel.org>,
 <aou@eecs.berkeley.edu>, <Alistair.Francis@wdc.com>, <Anup.Patel@wdc.com>,
 <bjorn@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
 <robh+dt@kernel.org>, <Daire.McNamara@microchip.com>,
 <Ivan.Griffin@microchip.com>, <Lewis.Hanly@microchip.com>
Subject: Re: [PATCH v4 0/5] Add Microchip PolarFire Soc Support
Thread-Topic: [PATCH v4 0/5] Add Microchip PolarFire Soc Support
Thread-Index: AQHXEGjfyHY3Lwb47ka+mUu46lH7pKqcFkWAgB3OHgCAB4nfgIAAM2YAgAB3PwA=
Date: Fri, 23 Apr 2021 08:44:24 +0000
Message-ID: <a708ab6d-d354-a924-ff06-84dab48595ec@microchip.com>
References: <mhng-8a0f200a-fc9e-4e6b-a881-433a024e8b69@palmerdabbelt-glaptop>
In-Reply-To: <mhng-8a0f200a-fc9e-4e6b-a881-433a024e8b69@palmerdabbelt-glaptop>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85fe6b18-cc72-4a23-65b9-08d90633ff53
x-ms-traffictypediagnostic: MWHPR11MB1776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB177658CF428E8551E9B9986598459@MWHPR11MB1776.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJKlsgyKxvoS1Q7gW6RzCEjZGlYedOUbGjanMTW3LzwwR/ULS+GBZdMuc13kcyZQKQl/h2KE+Nd+gyFkJ5+akqa+M45tiuCfhosAyLSlFgaNX+YDR1r3Ytax9BWcENdVvkkhHZpQ7sWllBj29OQAMP/wjWFVTB3BPuKN88Gn42AOQgHN9Qh+Ala6lqaSPhpn7zIXegthqHMLyMzihklEHjgMXZHClbMgpMiSEvZHENln7CofvjT5vQoo8MDjwQgE8iPVg/Xxkj9jYR4TtIqTZ1x92/VdlzEhdzsuH/INJjXygy1UKWXlvevA1+uidHfRtuekdwk1u/PmD1A6iJdBQZPyV9ZgwHZrb/1IWzxlzYLc+QgA27gwWHW7T8IaCuVjFHex8e+Rjudr5ZRO6X4oFnvbivEP2wGgsPdjQwDiYaFuMeAwNu8fSNa5ivreGysi6itxfWFi0VRvtjVbPSb3+kk8WAeoh2ecy41botBdhjdSmhzQylc1tQDbOMnXX26XBhBXY2njbuJdvyJp3h5l/FzoQZY9AAlqncpCvn0fXFwpvswyCybXJavU3n/WlqxPDdzCLbqZaBvw2V2TJ3V2F1j3P3yVDBGeuRkK3eeO8cWtnR8aFbNiQa48xZBwz8td+fn35GkGbbAR5wozfGJliCfTec6Xl6uVnpAYNZB3kehgV5qL9EPhmX9WCnB4LqFIbUhpBfCz3AKmXdfs4Bv7v2xrnFbgFpi5HEnC7VeUHwpIuhAVRDv7eToJi76JlSgxhkgQZTX/msjwmeFelU3KYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(396003)(366004)(346002)(86362001)(8676002)(31696002)(5660300002)(6486002)(7416002)(186003)(4326008)(26005)(316002)(53546011)(2906002)(6506007)(31686004)(107886003)(66946007)(66476007)(66556008)(54906003)(966005)(8936002)(66446008)(478600001)(36756003)(64756008)(91956017)(2616005)(122000001)(110136005)(76116006)(6512007)(71200400001)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWQ1QzhXWTduY3prTlcxY2YzQU1JaGxka2lwV0Z5N2N6WWN0L1RleFRHN3Nt?=
 =?utf-8?B?NFpjdHgyUjU5Z25QR0tOMnJPUTRTMjUyclVselg0Y2w1dm9zd1hQaTZERUJV?=
 =?utf-8?B?bXdTMHBqRlpCU3dBVE1QOXVwVUN4M0JFd1JjTUhWOUFxM1JSL0ZadTR1VWxP?=
 =?utf-8?B?MlZQUHA2VWdyQ3M3ZVlHU2E5OHNLdkI4dFAybXFSdHpDaU1WamZ5eDBCelNk?=
 =?utf-8?B?VjRvOWQwZUIyblo4amNRM09Sb0NGUThhNFRoZXRTK0UzcFBhNUcvT0xVZ1NC?=
 =?utf-8?B?WGptUStTbmplOHJybjFUbnZSNnpFQVpsMlZ0b3ZpdnZLYUEzQXZqWkVhZ1Ja?=
 =?utf-8?B?T2czOEovZUhSY0EyeDRJdzltcWp6UlEwczNnaWdCM3g4L0JqY1dxZTFRSEZI?=
 =?utf-8?B?YnJmNWZsbWVKdmlyd2E5QUs4Y2NYRDAxTlAwa1RYQ1VzdDVuRHM0UGZIV3VR?=
 =?utf-8?B?NlpXUDdRK3VoOGE1SjVxQnEyNUFGaUx2MUhLandTbktqeFpnZTZ5OXF0K1pv?=
 =?utf-8?B?Ymg5T0JGK3d5YUZwbUl1NWdDZUcvOHlUZE4vS2VKcVROWUpOcGtZQ2VMNTBJ?=
 =?utf-8?B?R1ZGVVB0ZkpKUTZpd0MvS0RpVEw3a3M3SjBPM29MQUxUc3lNQnJQQlk4NHpk?=
 =?utf-8?B?TDBEMWVPMDBPNzZvQ2J1bjM1OE4yL3h5Ri9XRG1icy9XU2o4WGFrcUlsZGx2?=
 =?utf-8?B?UHZCYjFKR2w5WW1DZnM1RkVUVy9ST0lKOHRuenBpZ0Q1UGx0dnc0aTM4MWp0?=
 =?utf-8?B?cE9Oekpucnp4TzJLUzhCOE9YODRkYWdxY3pWTW5PTCsrTVlzM3RmM0pHbC9z?=
 =?utf-8?B?d1lhbzF4OWVxdjc1cWtjMkdYV281YTlMbVpra1VWbmVVanJqSG9rbW1GNEo4?=
 =?utf-8?B?S2ZiQWZBOFN3OEJmNFBEcHd3ME8zLytwR1VnMXc5cG0wcnZ5ZXI1Mmd2UHZZ?=
 =?utf-8?B?MkgwY3hDNm9ramRkeUdScHhhNVhLV1hKWXo2ZktoaHhLcWRiOGtUVmhyRkg3?=
 =?utf-8?B?U094UkZya2ZQeUdGdjc5WkpuRGNtdWRneUJYNXRvT0RuUDVYMndBcHRYcEt2?=
 =?utf-8?B?aDlJK3hiMVVUbzRCVDI5TndZZGplaVVDcFBnUVdZaWY0elVsVTVGT09uUGlK?=
 =?utf-8?B?TmNuOFNqRWV6L1RtZUpIVTZJSlRDSGJHWnl5Ynh4R25mUkU0N0VEQkwrcmsx?=
 =?utf-8?B?MWtKSUw1YmVvT2RzcGlDWjdSc0lhOG1LeW4weEFMVGxHMWk3a001N3NqWlVx?=
 =?utf-8?B?cmRHTUdDS21MN0JsODZ1UUNUSkhFZk5OaUZtekFBQU15dDg5TFJ4NE15eXRz?=
 =?utf-8?B?OEdLQ2gvOVFhbC9DV2NRaHg0bHN2VnVVcU5FVWRLVTV6YlY2bzRFYm4yY25k?=
 =?utf-8?B?THVjdmIvQmpjWEZlc3QvTG9XVGtlYmtudGlNaXMyMGViYjhRdlNURUhPcXhL?=
 =?utf-8?B?b0NDdGlGZjBxakQyRVF5dUI2MnNWVU9OVDRiL2RWdHhuaUtDWG9NcEhyM2xF?=
 =?utf-8?B?eFJscVBvQnMzbjl1c1d1dmJ2VmhWUUZieGpwRGtCSWpZczBUMnhreEFMdmFU?=
 =?utf-8?B?dENGbjVZZzJHa3BmVGtPUEp3bzRBQjV4SkFHN2RIMnM1SjZ6UWtHVmZvMnlw?=
 =?utf-8?B?WXpNczNaTE9iK3lkcWFsN1Fpakp3N0VxYUF1OWptT3ZnNjgyWnMrMjhPMlhE?=
 =?utf-8?B?Y0lIVitjM2JiREcwamNSZ0ZWandZZG0rVGVDRnNJMWV2VjROWmRrV2hRRGZK?=
 =?utf-8?Q?T7Am1JsgAco8WS9vDJiNnbQGWg0Zd0nwzFRH7rV?=
Content-ID: <61C1BA55E3000D47A7E7E5739116806A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fe6b18-cc72-4a23-65b9-08d90633ff53
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 08:44:24.5494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yn7vDcXQj9kdThZ0vkBZQa7jUVb1QnPe5LGB4k48EJeVYVOemcTxdgASbWN6sqXO+BGeN3VOHHEP1yZCUHIlRwv5a0/Kpy21RYUUN/yh1qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_014431_629342_388A0237 
X-CRM114-Status: GOOD (  33.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjMvMDQvMjAyMSAwMjozNywgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4NCj4gT24gVGh1LCAyMiBBcHIgMjAyMSAxNToz
MzozOSBQRFQgKC0wNzAwKSwgYXRpc2hwQGF0aXNocGF0cmEub3JnIHdyb3RlOg0KPj4gT24gU2F0
LCBBcHIgMTcsIDIwMjEgYXQgODoyNiBQTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEu
b3JnPiANCj4+IHdyb3RlOg0KPj4+DQo+Pj4gT24gTW9uLCBNYXIgMjksIDIwMjEgYXQgOToxNyBQ
TSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiANCj4+PiB3cm90ZToNCj4+PiA+
DQo+Pj4gPiBPbiBXZWQsIDAzIE1hciAyMDIxIDEyOjAyOjQ4IFBTVCAoLTA4MDApLCBBdGlzaCBQ
YXRyYSB3cm90ZToNCj4+PiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBtaW5pbWFsIHN1cHBvcnQgZm9y
IE1pY3JvY2hpcCBQb2xhciBGaXJlIFNvYyANCj4+PiBJY2ljbGUga2l0Lg0KPj4+ID4gPiBJdCBp
cyByZWJhc2VkIG9uIHY1LjEyLXJjMSBhbmQgZGVwZW5kcyBvbiBjbG9jayBzdXBwb3J0Lg0KPj4+
ID4gPiBPbmx5IE1NQyBhbmQgZXRoZXJuZXQgZHJpdmVycyBhcmUgZW5hYmxlZCB2aWEgdGhpcyBz
ZXJpZXMuDQo+Pj4gPiA+IFRoZSBpZGVhIGhlcmUgaXMgdG8gYWRkIHRoZSBmb3VuZGF0aW9uYWwg
cGF0Y2hlcyBzbyB0aGF0IG90aGVyIA0KPj4+IGRyaXZlcnMNCj4+PiA+ID4gY2FuIGJlIGFkZGVk
IHRvIG9uIHRvcCBvZiB0aGlzLiBUaGUgZGV2aWNlIHRyZWUgbWF5IGNoYW5nZSBiYXNlZCBvbg0K
Pj4+ID4gPiBmZWVkYmFjayBvbiBiaW5kaW5ncyBvZiBpbmRpdmlkdWFsIGRyaXZlciBzdXBwb3J0
IHBhdGNoZXMuDQo+Pj4gPiA+DQo+Pj4gPiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCBv
biBRZW11IGFuZCBQb2xhciBGaXJlIFNvYyBJY2ljbGUga2l0Lg0KPj4+ID4gPiBJdCBkZXBlbmRz
IG9uIHRoZSB1cGRhdGVkIGNsb2NrLXNlcmllc1syXSBhbmQgbWFjYiBmaXhbM10uDQo+Pj4gPiA+
IFRoZSBzZXJpZXMgaXMgYWxzbyB0ZXN0ZWQgYnkgTGV3aXMgZnJvbSBNaWNyb2NoaXAuDQo+Pj4g
PiA+DQo+Pj4gPiA+IFRoZSBzZXJpZXMgY2FuIGFsc28gYmUgZm91bmQgYXQuDQo+Pj4gPiA+IA0K
Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hdGlzaHAwNC9saW51eC90cmVlL3BvbGFyZmlyZV9zdXBw
b3J0X3Vwc3RyZWFtX3Y0DQo+Pj4gPiA+DQo+Pj4gPiA+IFsxXSANCj4+PiBodHRwczovL2xpc3Rz
Lm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMC0xMC9tc2cwODU4Mi5odG1s
DQo+Pj4gPiA+IFsyXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1jbGsvbXNn
NTQ1NzkuaHRtbA0KPj4+ID4gPg0KPj4+ID4gPiBDaGFuZ2VzIGZyb20gdjMtPnY0Og0KPj4+ID4g
PiAxLiBGaXhlZCBmZXcgRFQgc3BlY2lmaWMgaXNzdWVzLg0KPj4+ID4gPiAyLiBSZWJhc2VkIG9u
IHRvcCBvZiBuZXcgY2xvY2sgZHJpdmVyLg0KPj4+ID4gPiAzLiBTRCBjYXJkIGZ1bmN0aW9uYWxp
dHkgaXMgdmVyaWZpZWQuDQo+Pj4gPiA+DQo+Pj4gPiA+IENoYW5nZXMgZnJvbSB2Mi0+djM6DQo+
Pj4gPiA+IDEuIEZpeGVkIGEgdHlwbyBpbiBkdCBiaW5kaW5nLg0KPj4+ID4gPiAyLiBJbmNsdWRl
ZCBNQUlOVEFJTkVSUyBlbnRyeSBmb3IgUG9sYXJGaXJlIFNvQy4NCj4+PiA+ID4gMy4gSW1wcm92
ZWQgdGhlIGR0cyBmaWxlIGJ5IHVzaW5nIGxvd2VyY2FzZSBjbG9jayBuYW1lcyBhbmQgDQo+Pj4g
a2VlcGluZyBwaHkNCj4+PiA+ID7CoMKgwqAgZGV0YWlscyBpbiBib2FyZCBzcGVjaWZpYyBkdHMg
ZmlsZS4NCj4+PiA+ID4NCj4+PiA+ID4gQ2hhbmdlcyBmcm9tIHYxLT52MjoNCj4+PiA+ID4gMS4g
TW9kaWZpZWQgdGhlIERUIHRvIG1hdGNoIHRoZSBkZXZpY2UgdHJlZSBpbiBVLUJvb3QuDQo+Pj4g
PiA+IDIuIEFkZGVkIGJvdGggZU1NQyAmIFNEY2FyZCBlbnRyaWVzIGluIERULiBIb3dldmVyLCBT
RCBjYXJkIGlzIA0KPj4+IG9ubHkgZW5hYmxlZA0KPj4+ID4gPsKgwqDCoCBhcyBpdCBhbGxvd3Mg
bGFyZ2VyIHN0b3JhZ2Ugb3B0aW9uIGZvciBsaW51eCBkaXN0cm9zLg0KPj4+ID4gPg0KPj4+ID4g
PiBBdGlzaCBQYXRyYSAoNCk6DQo+Pj4gPiA+IFJJU0MtVjogQWRkIE1pY3JvY2hpcCBQb2xhckZp
cmUgU29DIGtjb25maWcgb3B0aW9uDQo+Pj4gPiA+IGR0LWJpbmRpbmdzOiByaXNjdjogbWljcm9j
aGlwOiBBZGQgWUFNTCBkb2N1bWVudGF0aW9uIGZvciB0aGUNCj4+PiA+ID4gUG9sYXJGaXJlIFNv
Qw0KPj4+ID4gPiBSSVNDLVY6IEluaXRpYWwgRFRTIGZvciBNaWNyb2NoaXAgSUNJQ0xFIGJvYXJk
DQo+Pj4gPiA+IFJJU0MtVjogRW5hYmxlIE1pY3JvY2hpcCBQb2xhckZpcmUgSUNJQ0xFIFNvQw0K
Pj4+ID4gPg0KPj4+ID4gPiBDb25vciBEb29sZXkgKDEpOg0KPj4+ID4gPiBNQUlOVEFJTkVSUzog
YWRkIG1pY3JvY2hpcCBwb2xhcmZpcmUgc29jIHN1cHBvcnQNCj4+PiA+ID4NCj4+PiA+ID4gLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvbWljcm9jaGlwLnlhbWzCoCB8wqAgMjcgKysNCj4+
PiA+ID4gTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICsNCj4+PiA+ID4gYXJjaC9yaXNj
di9LY29uZmlnLnNvY3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA3ICsNCj4+PiA+ID4gYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+Pj4gPiA+IGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvbWljcm9jaGlwL01ha2VmaWxlwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArDQo+Pj4g
PiA+IC4uLi9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xlLWtpdC5kdHPCoMKgIHzCoCA3
MiArKysrDQo+Pj4gPiA+IC4uLi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRz
acKgwqDCoCB8IDMyOSANCj4+PiArKysrKysrKysrKysrKysrKysNCj4+PiA+ID4gYXJjaC9yaXNj
di9jb25maWdzL2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNCArDQo+Pj4gPiA+IDggZmlsZXMgY2hhbmdlZCwgNDUwIGluc2VydGlvbnMoKykNCj4+PiA+
ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9taWNyb2NoaXAueWFtbA0KPj4+ID4gPiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvTWFrZWZpbGUNCj4+PiA+ID4gY3JlYXRlIG1vZGUg
MTAwNjQ0IA0KPj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZz
LWljaWNsZS1raXQuZHRzDQo+Pj4gPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4+PiBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy5kdHNpDQo+Pj4gPg0KPj4+ID4g
SSBoYWQgdGhpcyBsZWZ0IGluIG15IGluYm94IHdhaXRpbmcgZm9yIGVpdGhlciBzb21lIHJldmll
d3MgdG8gDQo+Pj4gY29tZSBpbiBvciBhIHYyLA0KPj4+ID4gYnV0IEkgZG9uJ3Qgc2VlIGFueS7C
oCBEaWQgSSBtaXNzIHNvbWV0aGluZz8NCj4+PiA+DQo+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIHJl
cGx5LiBJIGFtIG9uIHZhY2F0aW9uIHVudGlsIE1heS4gSSB0aGluayBJIHNhdw0KPj4+IGFsbCB0
aGUgcGF0Y2hlcyBoYXZlIGFscmVhZHkgYmVlbiByZXZpZXdlZC4NCj4+PiBMZXQgbWUga25vdyBp
ZiBpdCBpcyBub3QgdGhlIGNhc2UuDQo+Pj4NCj4+IEkgY3Jvc3MgY2hlY2tlZCBhbmQgYWxsIHRo
ZSBwYXRjaGVzIGFyZSByZXZpZXdlZC1ieS4NCj4+IEBwYWxtZXI6IElzIGl0IHBvc3NpYmxlIHRv
IHRha2UgdGhpcyBzZXJpZXMgZm9yIDUuMTMgTVcgPw0KPg0KPiBJIHN0aWxsIGRvbid0IHNlZSBh
bnkgcmV2aWV3cyBmb3IgdGhlIG1haWxib3ggZHJpdmVyLCBkaWQgaXQganVzdCBnZXQNCj4gbG9z
dCBvbiB0aGUgd2F5IHRvIG1lPw0KDQp0aGUgbWFpbGJveCBkcml2ZXIgaGFzIHJldmlld2VkLWJ5
IHRhZ3Mgb24gdHdvIG9mIHRoZSBmaXZlIHBhdGNoZXMgKHJvYiANCm9uIHRoZSBkdC1iaW5kaW5n
IGVudHJpZXMpLg0KdjYgd2FzIHNldCBvbiB0aGUgMjNyZCBidXQgaGFzbid0IGdvdCBhbnkgYXR0
ZW50aW9uIG9uIHRoZSBvdGhlciB0aHJlZSANCnBhdGNoZXMgeWV0DQpob3dldmVyIHRoYXQncyBu
b3QgaW4gdGhpcyBwYXRjaCBzZXQsIG9ubHkgZGVwZW5kcyBvbiBpdA0KDQo+DQo+Pg0KPj4+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+PiA+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdA0KPj4+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KPj4+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdg0KPj4+DQo+Pj4NCj4+Pg0KPj4+IC0tIA0KPj4+IFJlZ2FyZHMsDQo+Pj4gQXRp
c2gNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
