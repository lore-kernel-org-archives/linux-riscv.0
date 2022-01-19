Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8F4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzGJNUeEiEq+oZ4snKogztGWsjnE0GojRiWRJVy7pW4=; b=K+V0bMqd8H6LHF
	tZAtU3DWteo87aYFTQ3hP/JuFBsvURmJFJP3zms39/8ZAdbcvJl/Nr5nSUao2bdaFafInOTy3Oymq
	Qg/N1//5m4zNUBTlCUcPzDDv5FWmhKW6CQManjfXQBLRV5RMkyZKYdEzLxm0a6Upm9mYVr0CyJwZz
	F4JQYaaSJEzlK+/vtERMVTE/PZp2qCjwQP0mxSPsZY43biE3TFil9gwg2MDv4nwWdL8rpxkhMaXvQ
	ag1nGL9R7NelGttAI58rjEeebO7B+tT5nwGOOEAC3nGuM8e7QtNKfwVBln+TGwDQSzSo6XAY80MUG
	GcoGA05CUzDEAmQ4EKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA8Uq-00509N-Uz; Wed, 19 Jan 2022 10:47:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA8Uh-005069-Ho
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 10:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642589231; x=1674125231;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uIwbv7QOZ9cFr+vBJUh6MLQb31mLzWR0PoPASWeIUQc=;
 b=PZNUkR+/7nq4XywaxLghkj5kzkzE4WR6pGAddmlQtsWeKmZnrc7ZTpPd
 n6sOpKbaeTkEyHxsiC21AUgv/gWnZ6tSc0tQmUcNJJCfj1rWRu77a5c5j
 kcg816A5A57RI6QBcnwAhevwIsmeo6g6e0z2JEqJHBgvq/7gkrMpn2FbN
 OZedBaQjISuXy22Cx+dvc/k4UNxcbsSUn3rd7iGAufJS/xNu9maLyVz1r
 Mr21GOVkRnxWwhlvyey6f8ZI5wKo+E+l0S2MNftP364Ui6JuyAwXb8nDS
 jgz2Eoy3cpyE/LARByVXw1/6wepJSWDA33diUbeevGTKv7UnFQix26aiX Q==;
IronPort-SDR: GWmD5OryHM/A7Esj9VjXxTblNHdd/mIg/dH4X68Tc9CLng7HXG5+Xfp60IYAQIFv8Mv8eScG/M
 RQ0lzVh9UvXzVelde5+OkOipONljNEYwp/b+XbXvBta8qpA/HIpuu/m0v6U1ePVV0kO/TeeP5p
 xbMq3/Ikz4oC+/1JrRox1q1deBdlO2rZ198GW0gbq8ZTELkFP3zQTAoX0ZuhvQ207TN+d+mPwF
 Evz2j2jP1UmRB41SQHXrRILSjpJEytd8zXI8LTuvtxa7rErfnxWCyVIi8JtFNe0lHrTUCeKPFK
 pwuSOYVp+ocSk600YuCqw7Kt
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="143183443"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jan 2022 03:47:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 19 Jan 2022 03:47:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 19 Jan 2022 03:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF7+LUlxQRbLMfqmOdYwukFt6JR3B1dZUKojXhvxSAL5MilVXgeDg6ZbdzFPXKmwi5fNDYdV3ZdTusGCpQ3gHjFu2pqpvcx07PyFMYM2MKL5k2Gdk356TLjjE6lH8k3jnTdFZ8D3Q3c/IrTofEiuta7xNMpobEN3ptf3oIFW/O1SHqziVrqGg+Y9K/2SZ02gneJBbz41vg82UBYW5lu+F4+ZyG8FUyAaIleEzQphLLTXJoMgcFdJ51qOxUvy5APQ6Vy1phqwboOdscS2/xyYsOrQZMrjaWeTc1vaq96s2x+E7LmIjcYGPdA15S62ClEk6UQXryN7thhqaI3oasnl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIwbv7QOZ9cFr+vBJUh6MLQb31mLzWR0PoPASWeIUQc=;
 b=Qhh2EXXvm5lfo9a5QtkdFBb5v0/WvgCySkhPcHAjeaXVArWceqlyZ2CMCmCvYUtAbnwTEU0VozPKMpa7xhYbtzyg06lgx/lc/TQqpjJy7pEkybqhK5A64jF7Ftt4FBlLyr/VzRggPIRuEif8kI0052Eczz+gIHGCvb8UpYtnqZbeQgXX/B+9lw/9z1yS+H2Htck+cQTCjWcRMmvtxQj7N7jRonHgFzZihjwd8XQxIxPk39b4LQ8VI1gD7d9k5bl3g4CYm/4gXYuFY3SZMoRaHExMlCQadNwvDG4jaYCD6JaD8/1/ArsG86LDTpsS0QRcgfHNSnberMw9KyFzLhLtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIwbv7QOZ9cFr+vBJUh6MLQb31mLzWR0PoPASWeIUQc=;
 b=im9iEMQcOjJwRBNcEhOaRNB0PwtifwErRl6kjpfihgXxjLVB7lliFds+6zIOi5IBr4CopYep2Mh3vUNLhq5YipBblX7RceuEXlUw425mmxDhyB5IrHW6KSXzvkiRwXLo7McqVMH0a4X5zmzSkx3b+ooY0ct7i7Fq/yVYEllcuzk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BN8PR11MB3635.namprd11.prod.outlook.com (2603:10b6:408:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 10:47:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 10:47:02 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: Re: [PATCH v4 04/14] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Thread-Topic: [PATCH v4 04/14] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Thread-Index: AQHYC5JHlwCm00sMh0CKnKu25x3n7KxprYKAgAB/2oA=
Date: Wed, 19 Jan 2022 10:47:02 +0000
Message-ID: <262b1a79-1119-4767-f3f4-7a77824d1bc9@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-5-conor.dooley@microchip.com>
 <YeeBgQMOg49CXigi@robh.at.kernel.org>
In-Reply-To: <YeeBgQMOg49CXigi@robh.at.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9291386d-8365-4115-14e6-08d9db3906e3
x-ms-traffictypediagnostic: BN8PR11MB3635:EE_
x-microsoft-antispam-prvs: <BN8PR11MB36359DAA9C91584A366087AC98599@BN8PR11MB3635.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YH8fqtMQcTdPZfz/d+N2cfLJc+UlS/a90uGEQzR6aaY+JJmjr2cdS8QM8pt9kX8Q6l2p7ymhYlfCZwl5CPXFpnapToJoE81aWuYEORSCzNyzPyBo/WngUtIx3Gci94N5MiKeT4Yx9P2kEi/pfVThEgloFqqVjJzh5updFrwYaQ0fu3Citn7paVXjbuJPh8L5pjN82mpMWOo3UE7VOSWdnOGihndZDqn/sBd/8v4Uhvr6dgYcgzIxosN3dDDHS2dUvXo5a+WT4npaVHh3+kxXuRz810TqGLDGZav3LZt6MFLLRLlDTh50pCwSgqjkQeaA95U2zEs89KOGwm/g8C2I0bW9m/aCbtMrlWD0cmw2nvpw2Khf+hIVId7sY7CAlqogUtu9gbnSK/BkJn7TPQyCODZfBfaOaqcMaPToT70cSwl3kUHOIcS4txvBHK1o+Wt2oAy7fn2vn3BctpwgIoFa5oi4v2kMUm6J8i7stDbqwW3sKuxYZGzkTCSKwYPceO2BVsnYk7nnQZfOX9hbiiLyzq/Pw7mlGP+huv8wGliVA+24mtpzcOMFC4+lcADpMnDfpfo/hoBSO6I5aGXef9Wi4ZoEY6XxDOP62QAujv4nRBvqY7B3iXpa8Xr0YN5n9X/fOLCUI+NBO6VaHn4RFZ5U/ufG8mjCKQcTV1A9GFeh6qatVU6vdJCIxdfqV6W4FEA7wKDVRY9aF86qJA8ybgG2EXdwQb8+C/QyPIY9C0SYJctgV6o2DFLhxQ2ZHbemabud8lct1FZtYCxq295yEPykiH0ovJQl6rlXwv9JJQUuwcF4bLQVWvEK1ay0jYvxjulbR3xSiwbU2YM+yvgKvsPURO2uG9yIW7Dru8MgVGGKhzANfJwBRz42eNr+uGGo0yDzGoAMZbwuj+tS1QtGRGZcyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(6486002)(38070700005)(91956017)(6506007)(2906002)(66946007)(53546011)(64756008)(38100700002)(66556008)(26005)(31696002)(83380400001)(54906003)(76116006)(2616005)(186003)(31686004)(8936002)(36756003)(86362001)(5660300002)(316002)(6916009)(8676002)(122000001)(966005)(508600001)(4326008)(7416002)(71200400001)(6512007)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDBnMHVkQ1lpTnhMc2p1VmkvM0RrS2EwM0JUUTk5TFhpWUpnZDBmK3FnYVFB?=
 =?utf-8?B?L09zWmtXOWVoQnJ4aEJzeWtSOUJ3bER1VWpWUWVGSjN0VzJES2QyK1c0U2lt?=
 =?utf-8?B?ajRBOERTc0JXUjI4eVFOa2ZOOFJ1UGExWWdqSDgyUmkrVDJteUpjY1VXTGVV?=
 =?utf-8?B?NGN5cU5DOHFLTHY3Um5CaTdFS1BtSDB1RFJ1ZU9mWXlqTVNER2pBSW5uM3Mv?=
 =?utf-8?B?azgyejlPYmdyTW9KVXpVWGxJcmZHSmxQVVZ6NlJnK0dFTnZOd2dEaXNjZlg4?=
 =?utf-8?B?WnhKSVA3b0RSVEJWbytBMXJOQ3o0VHUyeVVhZVFESTN6Mm50UWNBZ2pab2ZG?=
 =?utf-8?B?cHc0S0VkYUxmSk43OHFtdmtiYkJMcXhneFRLOHhScmhrbHFDVnNFaEVVWkdO?=
 =?utf-8?B?c28vZ1BvVFMrNHZxVzh6T2YraUxvcDQrQTNacHZrcmNuYjcxVWNIU1dDVGlH?=
 =?utf-8?B?cnc2cWJTcWh4MkE5SGV3R2NKYVp0dmJyb0J4NHE5T1hFYVpxUXVKREZHWlVk?=
 =?utf-8?B?c2xkWjcyajZ0NjVlbHRDaU93eU1RNnRCSUtYY2pxSDRRN2JZYTlrNmtNZEZh?=
 =?utf-8?B?MUJsR0V4cWdEbmw5VmNSR0xtYW9TSjVJcXU3QjNTTHEyNlovN25iSmRON3JI?=
 =?utf-8?B?VlU0VmRhdWRUaElIcDRLa1pNYkFWNDJya0VESGM5eHNCdjhzVkhSYXZDSmg5?=
 =?utf-8?B?eW9XS2c5VktZMTNIbk1UTjZ2eEJMVDkrTVhVa0FpT012UzArY0hhVVg0Zmlj?=
 =?utf-8?B?SFdWU1h4ZElmV0Qxa2VDZ3lFRFhkd054ZHlLNDVYenMvcGRlbDRDcWd5VmEx?=
 =?utf-8?B?akZubzBvUDJXcjJGT2NyeTYwN2JEdDFVWmdBSzNuUnlIL0JCT0xHZ0FFQ0Q4?=
 =?utf-8?B?MXoxbkVCVTJvQzRHM0p3REdvWElZa0hvd21iaXBGSnZvQ3hBbHpscTZiMjE3?=
 =?utf-8?B?c0JMY2RMcnROMVF3Q2FBV1M1RGM3Wm16M243YW5KckQxSnFXOElrdTZ5YXVN?=
 =?utf-8?B?QjlqMHpJdzlBeXYwY3kwVGpOK1R6cXRGYTREWmxLd2phQitqcFBrUCs4SlZ2?=
 =?utf-8?B?cmhiZndXNU5OaGhWcElTQ044d3UzT2dHRU5DT0xYM3cyVlhucGFVeWVaSzVM?=
 =?utf-8?B?YVVLLzdmaXRWWEVXTkVldGxlOVMrZmIwZTFuQ0NobE9oMWwzb2Y2bFY0U1Nl?=
 =?utf-8?B?TjhaaFI5b01LTGo2R0l2UUo1amNKcytVdDBhL2JGcUxhK2FIR1ltS3lNdmdQ?=
 =?utf-8?B?Umg0cnNYSWdRcFhWTThlQjUralVWZjFTOS91ZW12RW0vN2l4M1N5NWUzOTBw?=
 =?utf-8?B?OFBPVXM1ZHkxSmRwemlRWTFhdjcwQkU0bzJ1bzU1a0Ywei9iQlM0NVlCbDRk?=
 =?utf-8?B?STRuVSt2Q2cxTWpqV001T2ZvQ0Q2allWekNQSytUVVZyenIvSlBnL2U2OFVq?=
 =?utf-8?B?by9CRTcwVU9jZkM4MkI1QWxvQUtMZDV5WThDdG5OQWt2SS9FVE9pd3BIbThL?=
 =?utf-8?B?TkUxdUx6bGxLR1VuQUlMeTNaUEtRSExWSGM4K2ZucFpLSFZXQkFDNTJwRS90?=
 =?utf-8?B?emJMY0cyUGZNQVhYajNGbWdlVE1rQUxqMmNxU0tkSk5kRmhpa1hXbWcxM0l3?=
 =?utf-8?B?Tkg0Tjd6U2RCR2V0NlN5M2NadVh6VEE1dFRYckZ4QU5saHRIYitUQzNIeEQ0?=
 =?utf-8?B?N0pIZjg1L3ZlcmM4YnhWREFSZlpEZDM4MTNnS0tSRjdHbGRLNUpLcmJhbnB1?=
 =?utf-8?B?WkRrT3ZQcFpmT3dUMmhhRjUwRVNvY04vZ0pxU1lCYjdlSGh1THh0dzBBWVpH?=
 =?utf-8?B?M0l3WkxwbXY4YnNQU2Vxc09RMWtzOXY4QXowSHlxUHh4cTh3Y1VCd3o2dHFk?=
 =?utf-8?B?SUE3NFJJV0NCekxRUUE4UkU3Qit0TVBZamxVTXYyOUo3YkJuTWwydEJ0bWFn?=
 =?utf-8?B?Tlh3amJNUGo4TnF6ckp4Wm5NTFhyNEw2LzZGU3ZOQmJ5L0Z3Zk9MNXYvOTNM?=
 =?utf-8?B?ZTYweFpJQ1AyQWJrTzdrVGVIVTBnRWYvY2F0TFZ1Y3lrQlpNTzltS1B3cU83?=
 =?utf-8?B?QkJwOHR0SjBsUlZTTWFud0VSTTI4bjdmZXV1dlNpYUF6RzhzVk9nWXcyNDlO?=
 =?utf-8?B?dU9aL1U4aXhvSzVHb3dXWmdnWkVnMkF5UmJTSVk4aHB4b0xxamJUSEExZWJJ?=
 =?utf-8?B?NXl5QlJJOHFqaHNPSjVYRUhjbkQ5NHdSNDRGTWZsTVBxOUR2bUJraExUTTFz?=
 =?utf-8?B?WUhlNE00Z29ZaEd2aE9wM1pZZGlBPT0=?=
Content-ID: <60E716E93557974DBDD5C9DAABAE98E7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9291386d-8365-4115-14e6-08d9db3906e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 10:47:02.3250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xGaostysbC/SxV/XUggeWSXa346VZsLtyW0WNg0SisA/LFQ5cHMkZD5QDIY9ieF+gokdITieGCFxFfCW7vK8U1l1mdN+nVaOO+Dxmc6bcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_024711_835901_EE9C5E88 
X-CRM114-Status: GOOD (  19.84  )
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

On 19/01/2022 03:12, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Jan 17, 2022 at 11:07:45AM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the real time clock on
>> the Microchip PolarFire SoC.
>>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/rtc/microchip,mfps-rtc.yaml      | 63 +++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>> new file mode 100644
>> index 000000000000..d57460cbe5e3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
>> +
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
>> +
>> +allOf:
>> +  - $ref: rtc.yaml#
>> +
>> +maintainers:
>> +  - Daire McNamara <daire.mcnamara@microchip.com>
>> +  - Lewis Hanly <lewis.hanly@microchip.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - microchip,mpfs-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 2
> 
> Need to define what each one is.
Sure.
> 
>> +
>> +  microchip,prescaler:
>> +    description: |
>> +      The prescaler divides the input frequency to create a time-based strobe (typically 1 Hz) for
>> +      the calendar counter. The Alarm and Compare Registers, in conjunction with the calendar
>> +      counter, facilitate time-matched events. To properly operate in Calendar or Binary mode,
>> +      the 26-bit prescaler must be programmed to generate a strobe to the RTC.
>> +    maxItems: 1
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Can't you calculate this based on the clock input freq?

I mistakenly thought this was set when the bitstream was programmed to 
the FPGA but it is just an APB register & should be calculated. I'll 
drop the property.

> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: rtc
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
>> +    rtc@20124000 {
>> +        compatible = "microchip,mpfs-rtc";
>> +        reg = <0x20124000 0x1000>;
>> +        clocks = <&clkcfg CLK_RTC>;
>> +        clock-names = "rtc";
>> +        interrupts = <80>, <81>;
>> +    };
>> +...
>> --
>> 2.32.0
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
