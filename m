Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1142BC4743D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 03:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F826611C1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 03:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F826611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8ygo+ETmSAY/cIP1V7STxXEoBA/Mx3Pxx6NBeUT8eY=; b=fvhNJu5UGqyoZX
	ZSDoOECQ9HdqcJsWKbRLnVByj0lTX3drgnuTxZMoD3l9fNXW965NyAH3IYMNzrUqsV8xvLUPT/Jmu
	RrufaCQC/9Jv7z2vvBrjSh/uEqDUreJ6Y2+k9wqmV8U/iCc9mHX+bJqRtF2DTpenEdf9b44+QaY89
	jwelyMRty/Nvr0hTRYCKADTili1QeqnCLY52q+Vrk/nOrPLIj3MqB5kvBN3Qpz3ngrxoWqZIwFTAo
	OO2gzFDe8KsNqVrSdC0bGnGmFFpFFn3l6uFjtZ8Eo26Gb11K+dmy3AEjaM9dNt65fKCRDnFkfRqSf
	C7/fIKtKX+ldDB7ospFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq65x-001OHR-EU; Mon, 07 Jun 2021 03:38:33 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq65r-001OGI-LX
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 03:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623037106; x=1654573106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yM9LSSDd9c5ygs5enSZQ0Xl/JePrcBV7wJitBq4PGRI=;
 b=lZouWDdfxBqCEwMKbQBIhMGyUmLSOtiuRt/IbamEvqU68bI/AhaTrfwW
 ZeUjDyvQl3D0M5FwgQNRe2uXHazSgp5vWmDF5Q62IZQnbCqRNtXvTp5td
 VuRnSZf8w3Q3EolhXtxAORyBOr1/GrFOaP49a3R1pZQ4HdOMhIdVBNUHb
 o29vGgYnsTQ+wXqe7e9II0CzfqLkq9tFHKZevOoCmqhYXfSUjJMUX6fXy
 r2yfnyfCwUny/EUHhQj8u58niuM0VgqznmUPznmfaF3ANwalepFUQaz/h
 r+9twfK+5VCI4YNXsVKbkTRpmspabFbBS+3cYXPWKXIAzFwK/xrSkXeRt w==;
IronPort-SDR: jq0j9fFt6COp7zarw5FuCs+4biiVs9eOwFQSHuHcQFuXILGFjkk0JgE6jZGR/OOElGklQvAYVp
 987EqpcNPDZqJDivLxsBjFXAakeFOH++yD/Iv7wJ3yuzvuv8s9is4D9XLHc/kkf2B4hEHd9gYT
 zvzjF7DvevuouZCq0NwFyhhaK/Gp648ubEdEFba+llTOpghMWPDRgNO0C3bHhCZmZA+GVmGIQk
 o0TWJ9CyhCOUKLo4frI3GzoaXp9Q0Hu7SHLmUXM/9ejcg6IeuIW0kXQv7R1h7tFWrod8FeLtGR
 olc=
X-IronPort-AV: E=Sophos;i="5.83,254,1616428800"; d="scan'208";a="175732252"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jun 2021 11:38:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJBGfi0gWejM6NplGFWXNvfhcRjp0yabv+83TyhabdLwT0+a6Dvk6Xk2U5uAb9e/jBAHEHLxI8GO16/hm891aBzcwgdx32IYR2fINa05JS2m75CwR25VcYvEt9UkKGsOV5SIXet5q/cjHagEkREdsCAh4QnhQt5rbWn9uRZHaBHZ/Qbs+iR2mHK6Z7z7GHuhiLZbRkE/7vKU2ObB/AOpt2mNOB7CRXfUdXGOy+hiC5EWC12y8R6xlp/QzmSTd5tiPZpg7LWzSlGUl8eRYa9TGS906PL6kOPVugJZSiOemY6Dh8e/ht16jNAyao5FqiENDCr03yvmWAltZpvaVpKdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM9LSSDd9c5ygs5enSZQ0Xl/JePrcBV7wJitBq4PGRI=;
 b=ftzBvILs/ln+vcctsygvTPKyMKY8mixs2b73IsIArB6K1ocjWyrygTeYqf2Pag9dUoktn4EAVwetHZoXkaIzJ5GZ/ruWOUGIzA3MNJaQjuAojXLg20NVq/eb3HECRY2IBFcBSD7y6UfPGii+7X/DhUE23X/qxleoJego38ARp/SDEtpmQ7xdu2AnUfKqs7T+vmsXUOpEkwsZaQRvLuQ21zTCrJCgA3So6I6TgoM8G8T+WffEU3EibMfANa3lledBaztJKwnoWLUharH5r09M8h+J7Id2ooBTsK41R3hBil5kK+7gX6YTn7rrKRfrZFfjxyipvsIX15bfOAIaenM5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM9LSSDd9c5ygs5enSZQ0Xl/JePrcBV7wJitBq4PGRI=;
 b=ravX0AhFZjoFNsTpDbE2QJQecc3W8uUMf1JSCz5nIMiYz58NJNiDNBObrpxABdK1itnx2jUOnwKGGcd3XgUTN4/u66refrBLzQmZbUbJ3dAByDPGbe9jNhK97NFOVi2rfSBngitIPMo2+RfOfQEUZd8KxHTQg6ZtcA0z6PXNaVs=
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7780.namprd04.prod.outlook.com (2603:10b6:5:359::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Mon, 7 Jun
 2021 03:38:23 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 03:38:23 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, Palmer
 Dabbelt <palmer@dabbelt.com>
CC: "anup@brainfault.org" <anup@brainfault.org>, "drew@beagleboard.org"
 <drew@beagleboard.org>, Christoph Hellwig <hch@lst.de>, "wefu@redhat.com"
 <wefu@redhat.com>, "lazyparser@gmail.com" <lazyparser@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "guoren@linux.alibaba.com" <guoren@linux.alibaba.com>, Paul Walmsley
 <paul.walmsley@sifive.com>
Subject: RE: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Topic: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Thread-Index: AQHXTGyTk+HLcFgtPEChsdrUswIwKarqRJuAgAAMWQCAAABbgIAADXqAgAAFs4CABEeUAIAMkQUAgAaHrgCAABm6QIAFdrYAgACrsNA=
Date: Mon, 7 Jun 2021 03:38:23 +0000
Message-ID: <CO6PR04MB7812614750AE3CA78D49C0AD8D389@CO6PR04MB7812.namprd04.prod.outlook.com>
References: <mhng-a5f8374f-350b-4c13-86e8-c6aa5e697454@palmerdabbelt-glaptop>
 <mhng-c0406cea-776b-49d2-a223-13a83d3a7433@palmerdabbelt-glaptop>
 <CO6PR04MB7812D8905C6EEBDE8513866F8D3C9@CO6PR04MB7812.namprd04.prod.outlook.com>
 <CAJF2gTRH6OVB1RrOyp88LDvX3fV0doJxNTM61trWxJsLaX0X0g@mail.gmail.com>
In-Reply-To: <CAJF2gTRH6OVB1RrOyp88LDvX3fV0doJxNTM61trWxJsLaX0X0g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.167.153.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96206912-0038-4d86-e3ae-08d92965b3b3
x-ms-traffictypediagnostic: CO6PR04MB7780:
x-microsoft-antispam-prvs: <CO6PR04MB77808DE56883FC419FE942508D389@CO6PR04MB7780.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CAgsIWz36F+f5JzRniXdxHVNk6KBp26pmNX8+7lBT+HdlMZVuFINoAow+Pi4SX94jG5JMa+rXRLvolZysDJ2xYOK0dpYFAwcUu6xSTL4ijpMvovgTsSIc/gL7v/EWzK3kMoxhwJ22d+odI420XN6kPXIvem7UFbU7B3EfidECCVTD4LXa2BtH1RrxkWMlXllZ/uPCibwMwjqLuFh/lWdY8THkPWhps4CwWXNLyKXuas/9OU2tFqVY5cUqqKLfwcithC8Z0H6UuSBJfIGMVVRuHvVJmFOowP3LhEX46DCcXABgOHjM0b1uFy16QxVciBCy9LYPba3YX51jflCWhwB9eqBNg/Ynu1jOAE0dSa3pcN3YmGrcRu4hCb9GaGeO68vXa63V+7CR2mFC9wU4QDuxr51frmvoqYxEukzQgXa1YqxU6VQZFLetVmx9Lygujh5KDTh9X91vzF/h+woQJibEC89d3rArw/MUahQkI+KOAe8oFK/itO+RwcCiTNsWnS2EuNbQC6MDj78I9LznsKiabiU7ZJzLWemjmYPWmG+1UnWcsmOzWABx7aXqYkKiL2VxEdKN1wpabsbE86ku35WhqJC3z7sxJEVsbMXLWUjfqFcPGfwhcipkGUWD5Cgw+sEfZRbpNPBJrlQkuNlKaTTDVdFAlXZi54fR2BqKv7VPS7DpQET1PH8yXXXGoSXAWGsVAGKTugz1wxuvIqQKqzalhVdcUMlPTLjGhP9b2syxNKxg0yNhktGv+AygpNBW/0opTO437ZesYy4CZeynVVWVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(966005)(7416002)(30864003)(478600001)(186003)(2906002)(66446008)(83380400001)(8936002)(66556008)(66946007)(38100700002)(122000001)(71200400001)(86362001)(55016002)(8676002)(66476007)(64756008)(9686003)(53546011)(6506007)(7696005)(26005)(76116006)(316002)(52536014)(110136005)(5660300002)(33656002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OGVVZEsrVi9rZFZaMUFYOVR0TjZUUEdNd3lrNkJMaDdWem9YZEQ1dHZWWURq?=
 =?utf-8?B?a0pYVkx5SDJONXYrOHpCR1JVQUlpbGVQNzIrK0djSGd4ME9YUzg3cDZDZE1U?=
 =?utf-8?B?ZnZqeHduUjd4dnpyL09RTTliRC96NUgzTWpwcHRxOEU5RGJQa3AyaTMzaG1M?=
 =?utf-8?B?eEw4bXRVUW5uV015UENyeXZOMGo2akJucmorWG5ZM2pZZ1JGZlBrbDQ0dVdr?=
 =?utf-8?B?WEVwelV0UHpNMHpxV2lRWnNnVnJHUXU3WlVlTGRjaGNGT0hKTDVwVWJZalpj?=
 =?utf-8?B?Z2hLb3JaZUMyMmZmQUNnSXpOSWtRM09SVExxb2luQmNWMjZucnZMSEZZc2ox?=
 =?utf-8?B?Qy8vTzQ0MzB2eHlBb24yMmJlOEdvWTJaUEgvUDdoV0xiYndwUDFKRmVlY0Y0?=
 =?utf-8?B?T3NXR0dLMGdhLzBHV0ZNcHlqOXNrVFZYTGJwLyt0ek9TOHRIS2VqblZUQ1hD?=
 =?utf-8?B?aE5yWmxkYkFSQnByQ1dCeFUvcWliUWxvOFNGQnozVnBrUU91MUhSN1ZabzRM?=
 =?utf-8?B?S2Joek9oMjkrNWZzTXhxVktjTE5RMmtoRmhBMnVjbWZnNkpDQTlWNWZnNXc4?=
 =?utf-8?B?aG1wR0N5L0NRZTRCZ1l3dVhEMmNRWTdmaE53MlJNdUw4WXppOUR6UGdMeFdp?=
 =?utf-8?B?enplMmp1WHVRNjFLUm40dEcreFdJZUhIQkRLRlNCd2dXblFJRFBQTWtFd3ZT?=
 =?utf-8?B?V3E4QlE5MGVSOGNxdHQ0cWluOEZ5cEJMN2FnYW1DSmVhOFMwWmpLdVJNenZi?=
 =?utf-8?B?Q3NPREduVmMyUW1wckZtNU9DV1VwQUZmMlhOWVV0MFdxTUpUSGVKQjJOM2w0?=
 =?utf-8?B?Z3JTVHJWcFhYSlMyWWw3clRMVHJuSUZvcTRMVFR0QnkwTXJLMklsYVVKZElr?=
 =?utf-8?B?Mm9OaWVjQmc1aXVrL3pRYXFZdHFHVkEwSkVwbXBSWmJtNzZNd1FUeGxTZTI4?=
 =?utf-8?B?bUoxd3ZqeC9kK0FKTGcrSWVRNkpVZlRFNE9NMEQ5WWIrdHdQaDVoZGoxRUxv?=
 =?utf-8?B?a2NYSUIrYVdUeWViekl6SzZ6OTBocXZXMmE5Mkd3K0FBallpM3VUVkF6WnRs?=
 =?utf-8?B?Nmp2bzlpbkg3eldpUHZicW1FVldpMzFQN1BDOGlZVUxocFJrZHU4ZzYwaTQ1?=
 =?utf-8?B?Um1UN3JvZ0JwRXNPWkpFOVE0MDlSd1RmUWFQdk1vN3dsSFQ0M1A4T09rWTdv?=
 =?utf-8?B?VXozWkxSb1hNcWR0K2k0dDJDc3lRaVF1OUhFcnNTaUZyRHVFUkEzMjl0c3My?=
 =?utf-8?B?V3gzbTM4OWdndFlrNkJ1bThoak9neUprNmdKTEFhQ0Fra2VaV2RJUDkyREdI?=
 =?utf-8?B?R0d5QXZ6S2NRc2pkQWN2Q1BUNE5BcEl5K21jZWhzRWI0V01hdVZWbG96NWRv?=
 =?utf-8?B?VUYwV3VqT0piZFd3UzFuK05YVkNJUG1nZGhWakdKNlFpRkdWMHd0d09FZU9y?=
 =?utf-8?B?MTIrOXpRSlQ2VGQ4amk2Z1R2TXJnSFJ3eUVEYlpzL2FXZnNwY3BhaGFUQkM1?=
 =?utf-8?B?bkQyYlNZU2tjUGtpRDZSWXJUWWtPek8ySkwxUDdIa2FsQTlwaHJhZklTU24z?=
 =?utf-8?B?SVJwMG1yZkRjd0lYaklXbHhrenhEMEtQYTczNXRNZU8wblMyWmEvdllGK0d1?=
 =?utf-8?B?RnI5MnV3SnYyY21YSkRXeFdlQmFmMUpoRSsveDYydkprbmI2dzNLbHlBU1N3?=
 =?utf-8?B?UFVhUU9SNU5lbVBJZU5ydVBwUGdxSXlVNHpELy9uUlE0eklRNDk5K1RUWHFm?=
 =?utf-8?Q?DYFvsDS9xzEQvBCSDZ00K84NFt96ccZk0oSEI38?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96206912-0038-4d86-e3ae-08d92965b3b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 03:38:23.1040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oAtcBDrf8sJK6U/Yq7cv5Y+rsaZ9VbFR+Y5ETei3tU02XHwKZeh76PPurjwrwf7v26l7rDqghHY5rOg4J/Fuqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_203827_759833_F39D1352 
X-CRM114-Status: GOOD (  43.45  )
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



> -----Original Message-----
> From: Guo Ren <guoren@kernel.org>
> Sent: 06 June 2021 22:42
> To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra <atishp@atishpatra.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>; anup@brainfault.org;
> drew@beagleboard.org; Christoph Hellwig <hch@lst.de>; wefu@redhat.com;
> lazyparser@gmail.com; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-arch@vger.kernel.org; linux-
> sunxi@lists.linux.dev; guoren@linux.alibaba.com; Paul Walmsley
> <paul.walmsley@sifive.com>
> Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
> 
> Hi Anup and Atish,
> 
> On Thu, Jun 3, 2021 at 2:00 PM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Palmer Dabbelt <palmer@dabbelt.com>
> > > Sent: 03 June 2021 09:43
> > > To: guoren@kernel.org
> > > Cc: anup@brainfault.org; drew@beagleboard.org; Christoph Hellwig
> > > <hch@lst.de>; Anup Patel <Anup.Patel@wdc.com>; wefu@redhat.com;
> > > lazyparser@gmail.com; linux-riscv@lists.infradead.org; linux-
> > > kernel@vger.kernel.org; linux-arch@vger.kernel.org; linux-
> > > sunxi@lists.linux.dev; guoren@linux.alibaba.com; Paul Walmsley
> > > <paul.walmsley@sifive.com>
> > > Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
> > >
> > > On Sat, 29 May 2021 17:30:18 PDT (-0700), Palmer Dabbelt wrote:
> > > > On Fri, 21 May 2021 17:36:08 PDT (-0700), guoren@kernel.org wrote:
> > > >> On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org>
> > > wrote:
> > > >>>
> > > >>> On Wed, May 19, 2021 at 12:24 PM Drew Fustini
> > > <drew@beagleboard.org> wrote:
> > > >>> >
> > > >>> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig
> > > wrote:
> > > >>> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > > >>> > > > Since the existing RISC-V ISA cannot solve this problem,
> > > >>> > > > it is better to provide some configuration for the SOC
> > > >>> > > > vendor to
> > > customize.
> > > >>> > >
> > > >>> > > We've been talking about this problem for close to five years.
> > > >>> > > So no, if you don't manage to get the feature into the ISA
> > > >>> > > it can't be supported.
> > > >>> >
> > > >>> > Isn't it a good goal for Linux to support the capabilities
> > > >>> > present in the SoC that a currently being fab'd?
> > > >>> >
> > > >>> > I believe the CMO group only started last year [1] so the
> > > >>> > RV64GC SoCs that are going into mass production this year
> > > >>> > would not have had the opporuntiy of utilizing any RISC-V ISA
> > > >>> > extension for handling cache management.
> > > >>>
> > > >>> The current Linux RISC-V policy is to only accept patches for
> > > >>> frozen or ratified ISA specs.
> > > >>> (Refer, Documentation/riscv/patch-acceptance.rst)
> > > >>>
> > > >>> This means even if emulate CMO instructions in OpenSBI, the
> > > >>> Linux patches won't be taken by Palmer because CMO specification
> > > >>> is still in draft stage.
> > > >> Before CMO specification release, could we use a sbi_ecall to
> > > >> solve the current problem? This is not against the specification,
> > > >> when CMO is ready we could let users choose to use the new CMO in
> Linux.
> > > >>
> > > >> From a tech view, CMO trap emulation is the same as sbi_ecall.
> > > >>
> > > >>>
> > > >>> Also, we all know how much time it takes for RISCV international
> > > >>> to freeze some spec. Judging by that we are looking at another
> > > >>> 3-4 years at minimum.
> > > >
> > > > Sorry for being slow here, this thread got buried.
> > > >
> > > > I've been trying to work with a handful of folks at the RISC-V
> > > > foundation to try and get a subset of the various in-development
> > > > specifications (some simple CMOs, something about non-caching in
> > > > the page tables, and some way to prevent speculative accesse from
> > > > generating coherence traffic that will break non-coherent systems).
> > > > I'm not sure we can get this together quickly, but I'd prefer to
> > > > at least try before we jump to taking vendor-specificed behavior here.
> > > > It's obviously an up-hill battle to try and get specifications
> > > > through the process and I'm certainly not going to promise it will
> > > > work, but I'm hoping that the impending need to avoid forking the
> > > > ISA will be sufficient to get people behind producing some
> > > > specifications in a timely
> > > fashion.
> > > >
> > > > I wasn't aware than this chip had non-coherent devices until I saw
> > > > this thread, so we'd been mostly focused on the Beagle V chip.
> > > > That was in a sense an easier problem because the SiFive IP in it
> > > > was never designed to have non-coherent devices so we'd have to
> > > > make anything work via a series of slow workarounds, which would
> > > > make emulating the eventually standardized behavior reasonable in
> > > > terms of performance (ie, everything would be super slow so who really
> cares).
> > > >
> > > > I don't think relying on some sort of SBI call for the CMOs whould
> > > > be such a performance hit that it would prevent these systems from
> > > > being viable, but assuming you have reasonable performance on your
> > > > non-cached accesses then that's probably not going to be viable to
> > > > trap and emulate.  At that point it really just becomes silly to
> > > > pretend that we're still making things work by emulating the
> > > > eventually ratified behavior, as anyone who actually tries to use
> > > > this thing to do IO would need out of tree patches.  I'm not sure
> > > > exactly what the plan is for the page table bits in the
> > > > specification right now, but if you can give me a pointer to some
> > > > documentation then I'm happy to try and push for something
> compatible.
> > > >
> > > > If we can't make the process work at the foundation then I'd be
> > > > strongly in favor of just biting the bullet and starting to take
> > > > vendor-specific code that's been implemented in hardware and is
> > > > necessarry to make things work acceptably.  That's obviously a
> > > > sub-optimal solution as it'll lead to a bunch of ISA
> > > > fragmentation, but at least we'll be able to keep the software stack
> together.
> > > >
> > > > Can you tell us when these will be in the hands of users?  That's
> > > > pretty important here, as I don't want to be blocking real users
> > > > from having their hardware work.  IIRC there were some plans to
> > > > distribute early boards, but it looks like the foundation got
> > > > involved and I guess I lost the thread at that point.
> > > >
> > > > Sorry this is all such a headache, but hopefully we can get things
> > > > sorted out.
> > >
> > > I talked with some of the RISC-V foundation folks, we're not going
> > > to have an ISA specification for the non-coherent stuff any time
> > > soon.  I took a look at this code and I definately don't want to
> > > take it as is, but I'm not opposed to taking something that makes the
> hardware work as long as it's a lot cleaner.
> > > We've already got two of these non-coherent chips, I'm sure more
> > > will come, and I'd rather have the extra headaches than make
> > > everyone fork the software stack.
> >
> > Thanks for confirming. The CMO extension is still in early stages so
> > it will certainly take more time for them. After CMO extension is
> > finalized, it will take some more time to have actual RISC-V platforms with
> CMO implemented.
> >
> > >
> > > After talking to Atish it looks like there's likely to be an SBI
> > > extension to handle the CMOs, which should let us avoid the bulk of
> > > the vendor-specific behavior in the kernel.  I know some people are
> > > worried about adding to the SBI surface.  I'm worried about that
> > > too, but that's way better than sticking a bunch of vendor-specific
> > > instructions into the kernel.  The SBI extension should make for a
> > > straight-forward cache flush implementation in Linux, so let's just plan on
> that getting through quickly (as has been done before).
> >
> > Yes, I agree. We can have just a single SBI call which is meant for
> > DMA sync purpose only which means it will flush/invalidate pages from
> > all cache levels irrespective of the cache hierarchy (i.e.
> > flush/invalidate to RAM). The CMO extension might more generic cache
> > operations which can target any cache level.
> >
> > I am already preparing a write-up for SBI DMA sync call in SBI spec. I
> > will share it with you separately as well.
> >
> > >
> > > Unfortunately we've yet to come up with a way to handle the
> > > non-cacheable mappings without introducing a degree of
> > > vendor-specific behavior or seriously impacting performance (mark
> > > them as not valid and deal with them in the trap handler).  I'm not
> > > really sure it counts as supporting the hardware if it's massively
> > > slow, so that really leaves us with vendor-specific mappings as the only
> option to make these chips work.
> >
> > A RISC-V platform can have non-cacheable mappings is following
> > possible
> > ways:
> > 1) Fixed physical address range as non-cacheable using PMAs
> > 2) Custom page table attributes
> > 3) Svpmbt extension being defined by RVI
> >
> > Atish and me both think it is possible to have RISC-V specific DMA ops
> > implementation which can handle all above case. Atish is already
> > working on DMA ops implementation for RISC-V.
> Not only DMA ops, but also icache_sync & __vdso_icache_sync. Please have a
> look at:
> https://lore.kernel.org/linux-riscv/1622970249-50770-12-git-send-email-
> guoren@kernel.org/T/#u

The icache_sync and __vdso_icache_sync will have to be addressed
differently. The SBI DMA sync extension cannot address this.

It seems Allwinner D1 have more non-standard stuff:
1) Custom PTE bits for IO-coherent access
2) Custom data cache flush/invalidate for DMA sync
3) Custom icache flush/invalidate

Other hand, BeagleV has only two problems:
1) Custom physical address range for IO-coherent access
2) Custom L2 cache flush/invalidate for DMA sync

From above #2, can be solved by SBI DMA sync call and
Linux DMA ops for both BeagleV and Allwinner D1

On BeagleV, issue #1 can be solved using "dma-ranges".

On Allwinner D1, issues #1 and #3 need to be addressed
separately.

I think supporting BeagleV in upstream Linux is relatively
easy compared to Allwinner D1.

@Guo, please check if you can reserve dedicated
physical address range for IO-coherent access (just like
BeagleV). If yes, then we can tackle issue #1 for Allwinner
D1 using "dma-ranges" DT property.

Regards,
Anup

> 
> 
> >
> > >
> > > This implementation, which adds some Kconfig entries that control
> > > page table bits, definately isn't suitable for upstream.  Allowing
> > > users to set arbitrary page table bits will eventually conflict with
> > > the standard, and is just going to be a mess.  It'll also lead to
> > > kernels that are only compatible with specific designs, which we're
> > > trying very hard to avoid.  At a bare minimum we'll need some way to
> > > detect systems with these page table bits before setting them, and
> > > some description of what the bits actually do so we can reason about
> them.
> >
> > Yes, vendor specific Kconfig options are strict NO NO. We can't
> > give-up the goal of unified kernel image for all platforms.
> >
> > Regards,
> > Anup
> 
> 
> 
> --
> Best Regards
>  Guo Ren
> 
> ML: https://lore.kernel.org/linux-csky/
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
