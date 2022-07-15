Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23819C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofNACHNWWHR7vsgSiiGc3i6L4jfyDhZ2ldcGz45FAi4=; b=4wI3DMOJDpgvDd
	bNNv+EMKkdRzq2Xn5qZb9zXugcpZrWr5fumDhMbK9dgQ6GVKlDbtVPW/tB2GYDx+qg2rc3vq4UpQ9
	3/62YXZxyqzoSsCXXT25jUPJnRUwLkwXq66jtvj4XBMD1lh7c5sclwstRDpelCI1sEM91MNXbnO1W
	O47652kviUwVjO2BoHcACfdNGgEWQNge2JVOM+UIZF0hi3W2rXxy9exp5NpS/ZtsNDuWQrL9/Py5R
	o7uN7li/p+Jnj9cgD1n8t5/3bbM3eMLDtwd7ciy6SWoJwyypWn6/3BGF91KW7F8UxOmCZlyO6jALH
	Y9M3GBDwmWT7FFY2bCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLwe-007UdB-P8; Fri, 15 Jul 2022 14:05:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLwO-007US2-I3; Fri, 15 Jul 2022 14:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657893912; x=1689429912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VgZl5Y7cUr+dVBQGs0Sko18IYj6xZMhWYA8TWgn2Tlw=;
  b=ZuSeLbmJ9haeDN7Mb3JS1/izZoQWYTYsTtQ4R/lwaWRt0lAAPvlGHf6o
   ndYzr4n7Ih5rO+BHXSlyOc8PD/rk30MfycB3axn/dkGL/Xr8BO5LsrG2D
   43LneT/1Aqloa9IYaDh1tiF/5wdZJHwO6U8fZ1oLNzWn0ltTYIl4WtLmL
   7OVrYlZnWiNZENbYjePV1dks5kuJOUoSkurCz/SbyNBhRSNkzlVINZuzw
   rhwka5NN2Ntx2o3RSivXMskob7qLBmo1m2nS1SsGJLe8z3t4LKPci8+F8
   EajLXSulYTO178zFtLWtL72YX/49RXrddKCCpp0gXaN9PTNREtT9T3rtE
   w==;
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="104643837"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jul 2022 07:04:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 07:04:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 07:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjHQUJqshShWyfdxUEqOrRJlaBoU1qi5sVQm1H29UabA/CZeOWh85EF2AuKTAkpjkVqm1SYPWAXugjpJpfMXHV3E27Ffwp5GyfOYSneHMMjRMtXOUkWhlBzp0gHpw+F7Ssn/FoGoQiZdU0Fy9/idpKXbNNOooH1zSfH+ym/tZxspJSboJTRtZIAqoE5ImdZc/ndQD5HwTYfAEi27Wpw8i+6qww3lzrCMWuhXns7R81ElZkQAQSVEDvN4ppAHgf5GPIbGMm2hqVRCcpt5/KWR5BDlrXbcuymWM/a0HEj2wlwREGoXHQoDL0ApuhgemsT7o0oZlvNjAUzdkGXKERsDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgZl5Y7cUr+dVBQGs0Sko18IYj6xZMhWYA8TWgn2Tlw=;
 b=J9F4u8OXzbjmCOF1Y28T7XS8moR5rojg0J5rV+K/kTLZ6FtXsb/UhBrsOSd9Ow/wWKaqs/A1ZZTZ8GHlif8mjCbvHOklMWO1A8t6wGFABLRz9bJsOPoHSggP4YC5ktnATmZF11Slfy5mVSwF8mVrUDu0WX3WXYzlEK7r3L03t0+ascwGarqewDrhFE7SEXvLyxnCU4T0mRL6Vr0YMTfeZOGct0GjjJ228lz6Aw+kmBxkmPPuY6X7GHILnzBbaZJBiFO5L8mIahy05RyfWgd/6F3v9OH74AQpRybzsreQ1+RAv1DC/0YUVWSysSnnPhqHoRYMtPbyV9PX0QqhkyGMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgZl5Y7cUr+dVBQGs0Sko18IYj6xZMhWYA8TWgn2Tlw=;
 b=ENsO2NSoBusEdAHi98mytzKaBWWyaefnQXPJzSdJw41Y6nXhOsnUX7nuVbQLKl6lAE/+cdWA5XcHFdrmdzsl+XoUxDwWyW6p8m3hOKnZ6wK4tUv3ni2S21xn9NkB+QEOEEtwKOHaVOH8kOrBj4UE5p0j+ru+wMC2O0rmZWzBQY0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 14:04:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 14:04:41 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Topic: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Thread-Index: AQHYlr1LjktvAhTwm0O5ibr9nGIi2q19638AgAAMFQCAAAdOgIAACUEAgAAC4oCAAR0zgIAAAWOAgABQoQA=
Date: Fri, 15 Jul 2022 14:04:41 +0000
Message-ID: <343b8031-f2d7-0d53-6967-d2e5925703cf@microchip.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
 <0abd0acf-70a1-d546-a517-19efe60042d1@microchip.com>
 <20220714150100.aqvmdgjkymc2dr5t@bogus>
 <f9b13298-5a0b-34ee-44b9-90168205cc59@microchip.com>
 <20220714160016.honjpzg35ccq4fto@bogus>
 <50b3316b-aed0-2ef1-a7ff-69aa3991d7e4@microchip.com>
 <20220715091121.mvwsopbh52c3zztc@bogus>
 <8146f6e0-0682-4876-95d0-01e99141330d@microchip.com>
In-Reply-To: <8146f6e0-0682-4876-95d0-01e99141330d@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e1a0ab6-3be1-4fc1-58ed-08da666af65a
x-ms-traffictypediagnostic: SJ1PR11MB6275:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xG180yTi9BhBuHR+HY2Zk/7AaJAJHpVCXNLHHr9x+Ooh4e3JJfS1kWfn624kU+sKIIfay/uoFt2HuO16+WO3I+/E3vJHYPxvxCLwRxU8aT037JsKxLMXmEXuiQuopmeGxzfyopmlTOFmVv04ZyU7Y/NG6ttamgGDcvzAMnZXPi2GGDRe/kRbwphU0F0WA/PPdqiogNZ0TMhPphlKSboi8DCugO3R4OMSFJYWnL2OBzJIIDsWmAbmQlVmb19Ms4GNt3Nj0VKy40SPMl/gC+VIDism4N5vviOGU3Du8I+K79UFZjr3iaeuUuYGAcrhEzeSpOckyY2uz4Y/r9Zf1j6mNK3cutl4PwxGtmbiVMfDQYI6rcyon7SW8hTjb/vhOTTctZqAcXplKdGxpAHYqGancvoS1zCRB99t1gwQ8vqV0RzR+2/CtMSEZTRKjWWTsB05n5NZmLXH8rQZJjsShMjsK/2EH4l7hnnCtRLO78Dl9jbxNrY/BZMOphfkdZ5oqFPm8fgoPx0hkI4BINkqjejEi+F67PqVqGE4xmBVqXBTCiQ4g8NL7m2r18wfBVwWPONpvU4cZ7UNRnGodYsHF2Ru5CKAI3C42yu516HwNILxwSZbap5yao8cWACnoRDHPluxJeRz2t+yb+2++T2ZerX55b94GCjTFvJz4PaUTHuGLvdI5jUvSqbnqUyG0Pg3dhijNHNbb2BZF26hf8Z3xWa42Hukty5hvjwtHVfY/rusgmt3u+orFxkc8tnxu6HESulGqpUgJ3pOAhvX/FxxJuRDlU1tgvjPuQ0F8n+guDF2QoRDO4WJC0L6sIQdMujCBg1pMjUZUzvR9YWppIOkuTOeT60SYPq8mLrKGuXKNazV4KcoO+bJz+TlHCydFX9ZFSGf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(39860400002)(136003)(376002)(396003)(26005)(2616005)(6512007)(6486002)(71200400001)(8676002)(41300700001)(2906002)(31696002)(86362001)(66476007)(122000001)(5660300002)(53546011)(6506007)(478600001)(54906003)(4744005)(6916009)(38070700005)(316002)(4326008)(91956017)(66946007)(31686004)(8936002)(36756003)(83380400001)(38100700002)(76116006)(66446008)(66556008)(186003)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anhFYTluclJPMWU0WlE0N0c1d04rd01OWElKc2pqTktPV3dqMSt1YkJ1VVNo?=
 =?utf-8?B?L21Kd3ZBMnR6Q1ZFemd4cm9FSDEybDFWNlVCWVJ5ODU2c2txTExpSmsyd0JB?=
 =?utf-8?B?cnJCSlpLNS9OUGdVc2JMMGRtcXpnTHk4UWVGQ3phTTBTQlRDSXVYTmxnMWpP?=
 =?utf-8?B?SmQrRlh6ZjRLSisyMkdOSkxTMFlHcjFmVVNOQ2gvU3UweG1ldDZxRGIyc2U1?=
 =?utf-8?B?a3l4VnNRNTMwemhEUTBwZ0J2by9xcFNKWWFCdTl1Qy91cU1DckVyU0dRRXl0?=
 =?utf-8?B?eFJsTHhCNTRHQ0t3ZmtJdEVELzlxTjJBYXZScVQ1WlR0ZTBDcDhmNUw5SnF5?=
 =?utf-8?B?T2syYzFPRnBNdFpOSTF1dkpVd3VnSU1RUzFIYVIrQlhKdHp3d1RjcEVRNVBO?=
 =?utf-8?B?aWI1TldOV3JFdEV5Y2dRbFVHV2NINmUyN3ppaXRndk1ERDhzR0tmVDFaSVZ3?=
 =?utf-8?B?WVM3ZC9ZTW5EdUxQYkVWd09CNlhVT2RmdzBoekRxYVVRamNsYVVLZ0JUOUZx?=
 =?utf-8?B?dDB5blE3NGt3V2tNOE01RVQ0R2VsRnQyL3pweVhvZWdjR2plNUtyWENGKzNL?=
 =?utf-8?B?OWNXRHZDQXg3SlRQRE1xSXZ0VG13QlZFVHFrV2JGcmZLa1kyYXhZN1ZHcWph?=
 =?utf-8?B?YXY1VHRabXpoSlJLbExseTFKa2NsRG9FQWNhTi9jMGJnMnJNMlVQRGVCdC9t?=
 =?utf-8?B?QzV2bGJjOTNWUWVPbXVRVENvaHdEdFgzOW9tcHo5dTBNZXpPMDI0RVVoM3lK?=
 =?utf-8?B?YXpqamVNYUlnaWptYThDbzRwQ0tJRGhTTjV2Zm1KVGMzRVVVaGQ1VWZxY1c0?=
 =?utf-8?B?d1oxQXVWRHBqSW9IUlZIQk5DRyswQnFRdkRPYjIwVnR0RmREWDNKQkRWSEc5?=
 =?utf-8?B?V2xqRm5pc0o5WEJMVEtYcE1EM0pydkd5bXpSNE5HYXVuVmN4SjAraUxxbVR0?=
 =?utf-8?B?TUI1cStwNkNMeklQUFFpSmpiNXdJV0ZaYTlTS3Q4MjBmUGlPWHFsZFFOTHdl?=
 =?utf-8?B?YUUwQ1RZU29BMXZDNDRJQXpHT2xKTk02bDh6ZmRnWGcyZk5YdU84MCt4bHNy?=
 =?utf-8?B?SzZRSytmeE1XU3cyWlFIa1JhYWI2YlUwKzFwK1E4djVwclM2allIbFhhc1Y1?=
 =?utf-8?B?TytSMGE3dytkdnNZWC9kQnlhWFcvNzVsaUFIZW5DK3BUY2ZTYXRMTUJ5alYr?=
 =?utf-8?B?NTA0RGZsYjJJM1E2M0grV0o4Zjk1Uzl1bVNVa2tkRE8zY1g3L3oyUm9ROW90?=
 =?utf-8?B?T1pjQTZra21SSjYzZzE0eWJZdEduK0ZURU0zUDFsN0ZtYUhkNjl0ODlOaGs2?=
 =?utf-8?B?Qnl3QWRIcm5rbjBHZmM4aXpodStUZzd2NkpWTXVDZGdWR0tEUG5HOEtXcWZ2?=
 =?utf-8?B?TytLekt3VisxMTRiUFdnSTd3M3ZCb0h4TWlaN095S1dnYjRlVm9kcTdXS29r?=
 =?utf-8?B?UGxDZHVtNmlqb3oreWt0V3B4U1JiMWRzWVdjRkdyQ2Q3KzZpazc2OVlRemlC?=
 =?utf-8?B?U2QwNVRXTlZHZTFBN0oremxPbStqTnM2ekxHQlZkeU9zaFoxVnNoNzZCa3dr?=
 =?utf-8?B?QUZ4aVl4Tm0xQkJVTWFLOGViKzYzelM2a3BtR2pFSnZoRWwxeHFiM0JTdlEw?=
 =?utf-8?B?RlNSd003UUhaa2duaWxEelJGVjhOYi82T08vZzlJNk5PM2RoOEJ2U1NYNG1G?=
 =?utf-8?B?WGlKV05EUEU5bVhTL3VjS2ZYMEZpMGV6Wkt1TmcyRTJYN3VvTC9GNDFyaWdY?=
 =?utf-8?B?bk56aEE1VVhIcHdNMnRQSWgyc1NSSmxSMUtvMTFrdy9VSkFQTlNLSWpCQXNn?=
 =?utf-8?B?Qm5SUitLZS9SbmgrdkRWaDRJbW55MzJER1YxV3FzN0ZYZndBclJTeFF5MXVj?=
 =?utf-8?B?a0R1bWZVV3hEN0NoUmc2WXdmaEpNM1ZOMkxpSThFMVVROUVPOGhSTE5iclBG?=
 =?utf-8?B?KzNKSjRlaG0wYjY3UnBQaFZ1RUs4OEFZdEZDNlVtWUF6VFdadERxRHFzcFRP?=
 =?utf-8?B?aWF3ejlzYmlQUzV5Umd4UXRhRW5rVVJuTkFMN1B3dUJIL3M2RUNmWTlVTkcw?=
 =?utf-8?B?d1VpeFRjNldMRkE1ZU51WlROVFliNnZkK1ZtQnp4Ynk0S3JPNXhFajJwSGsz?=
 =?utf-8?Q?JlmWmtiYXgy6Jc3fpC+XeK80q?=
Content-ID: <64F765DEB321CD428EE5357BE7CD0343@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1a0ab6-3be1-4fc1-58ed-08da666af65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 14:04:41.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuODSdNBd5aErnWPmvRUsDmW7cmrRjAeJpCIg2INjL1t5YFWGk3I0nlgpTCmJ+a9Hzk0lqde4TIyFwsAm2pu1KJPfJcpBXpW3ruR7oC2a10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_070512_902650_4C68A84C 
X-CRM114-Status: GOOD (  15.58  )
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

On 15/07/2022 10:16, Conor Dooley wrote:
> On 15/07/2022 10:11, Sudeep Holla wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Thu, Jul 14, 2022 at 04:10:36PM +0000, Conor.Dooley@microchip.com wrote:
>>> With the GFP_ATOMIC, behaviour is the same as before for me.
>>>
>>
>> So you still get -ENOMEM failure on your platform. It is fine, just that
>> I am bit curious to know why as it succeeds at device_initcall later.
>> I was hoping this might fix your memory allocation failure.
> 
> Correct. 

I take that back. On today's next with patch 2 applied, I don't see a
problem with no memory, so this does appear to have sorted the memory
allocation failure. Sorry for misleading you & thanks!

With my patches for store_cpu_topology on RISC-V I do see it though,
when called on the boot cpu. I must have mixed up which I had tested.
I have a fix for that though & will update my patches later.

Thanks & apologies!
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
