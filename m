Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562CCECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2I8pt2TWvJ5gfY+a4NzwIScYF2N+hKDEUbaJgZDLDo8=; b=OzWsG8vB9hN57H
	LfmDoxcTIdQZtM3L9Z4WV1iA62ci9wu2nsTD783tEvARCMgCx0x5jVnX20vikv9uamksFGK54pZrO
	DetiCEwfyH19Y9G9ySJ9K7zitxlMjjh9le9GiT+cg+odgldCPY0YHJ0g+KGLFJbhyszPER+Tsi2/v
	qzeA2gUkXy1IvfdAW/TNmZpfG0f3wv0zvV6ZFJnsCnMVU9NmuG3XtLDftcu4rp9XqFWnDYp9MP2Cj
	EKhoCgSupZfkSmqY1O/bUYEdDNyoHsci+n552mkxIBTOFIEbKJWPmYMiXDQ1Fvkra3XVVmIJhOVTn
	aTGTgxswXSoe7f81Rbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHlB-009IRA-LI; Mon, 05 Sep 2022 19:27:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHGL-008nmv-Gu
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 18:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-Description;
	bh=jLVO0LZI/bTr0AEDcK+PpEhgLfL4wGaUjomKaPSteAk=; b=cQUGKD8TusVrfDruTtm4BSYN32
	/FbfmkUIXmJ5A8Y1FRRYAQ7euml8q7W2gkVooUCH90AkucqBQYgFYVqbWAM/t6I7eZ2MZMfpTECv3
	jLnkODkwk8jwB/VhvdkbvlXBrFOldJ9J+ou6TJp0J/WfQUfK8PdoXy+GJ75SuxJAK7tiOI51E22NF
	ErfxVmiAZsiciPYmDGKkxQdxsfETeNOGZq7b/5Ky7GiVraUKXVWQ+RVoyKL1NTDG3KtOnLIhDfhV0
	Qq80sf4AjoOcROuV/c7mqOKNtY3x5yqhWzX/XhwegB1rhTxBrA4cjbKw9E1AUjCiwrNLgaVCeR8dO
	bE4ImJqQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVH7b-009vaR-G4
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 18:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662403620; x=1693939620;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=jLVO0LZI/bTr0AEDcK+PpEhgLfL4wGaUjomKaPSteAk=;
  b=rVQqbK97RYLW/LC8dmM1Gu5fcrGJNg4h+zeOO/+vuGwHpMPBQD/dWWYR
   Fo2xwI03M2zF368OJ2LLSiAYy9nOunxbnazShd8KIvzBKG08+oBnwhy25
   aImqf3+cr3iv+XVtR4EKvJUFZ7atPka2hs1NJ71sQ/tZ/5/vZB4uHaz+5
   ciIiO9fsdbxt6RPMCFQ87JEI7o61EH6m+k4yWfvY0ZNFo9EgX+DBpn5kc
   g02wavVvd0aJNzQyDOj2d/HUOVsrUV1lAhDpcyAoc9YbxNLp4sHcRESqp
   32gOGHoi0Uh2sj4bazeHikvHPw3nGiOACrHQqC4Uo3GAogh9xc+j5MAHm
   A==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="172460446"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 11:46:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 11:46:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 11:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiZPfBdxjKvgNaUfM3SfiXe4TJ9bphsjsHt6n8TtIReKQDGqvdjNH+8TvroSkcCXATuUohUU2Or99gXgajZm4BE0yBckU4/LQvQW/K1orrxKyfwSAs/A5EdimjXb+/Px/Bnw9YtyizV3b/kDPGJAxTsLUOhgYXzFsoyCroYpgdeJaiB7d5Fy3N8tAxLwfM6P7nYsfBhYCSPgQJWwgiXRQoqpeUIySIaQVCKtsuxdd4Z2lSPwIrbvk34mjEfzlsSZGG9Y7YA2gQTcl0VdomWy2JZmZjGF/r4ZK5OxUQO7VykX0C4765QjRXW702Ce4tWwfOkyRacNAro0SYS03Gke4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLVO0LZI/bTr0AEDcK+PpEhgLfL4wGaUjomKaPSteAk=;
 b=V3JsUsQA81Ot6KbGtRe0q/sDRxh5mLme7MyO08/Zr0O9yvSkIi5EL2ye+dkLJtvr38/e52vzGNxyXlWVm4x8XxnPD8iPYpCwEohoNSa+BMPs9ZBp8CAG+ehFYmPLPtL0A8642PwAoDZhPtisthbb5Jz/R/mvjEhdIXm/i0iB8dDaiAgmI0lfpJvm301JTxw0O4itT2pGM+cnby7DbtxpV3nHrlFzDpE4TEEymzWGNoMPlVwFUdw0S1m8NO0pfPH2KrWc7vVSE9TgmF1RaM+3B0UPHog5a97SCb6UHI4+SWt+oxclY/AeQGi7DhWzb8SclMwDLeVCsIIeT+1mKzm2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLVO0LZI/bTr0AEDcK+PpEhgLfL4wGaUjomKaPSteAk=;
 b=l3L6t0BBvQ7P3kKOLlJ3iQec3WsZG8hKp+edyijR0b/GnEXMGUXmlI8D82CWyIoFp3Ysn7ESgow45FM0R3A0tgVCsXVc9JUqAAAARqtc3OxJxeTuXxCwPstWlcZaUTTMPa+KYDqffCW4dW7YMeg+iLM/rQ64BjRGLUFqohmcNV8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 18:46:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:46:49 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
Thread-Topic: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
Thread-Index: AQHYwQIC51d6t8FVA0+5gd672Syjta3RLbEA
Date: Mon, 5 Sep 2022 18:46:49 +0000
Message-ID: <2a22c6ac-dc0e-7066-8f5f-04c428c77ee2@microchip.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
 <20220905083125.29426-3-zong.li@sifive.com>
In-Reply-To: <20220905083125.29426-3-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80c2a82b-730e-423a-e9c4-08da8f6efda4
x-ms-traffictypediagnostic: DM6PR11MB4674:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bR1tgar0dFmWdFFgqowmBzoK7Cv4EEvyoN1Pzuc1I9w1svwPdKDkAMqqkuJn8p6toKMfMoi25Y/gOO6U7+cZEAC/2eFo7cGhZBlr46vc5vxvH8RSHlxHK3xEeeTxl2QUJGtrrUQcPlNOwMa9bOVAMD74W8gMd/RPyKJx7Sp1+OVS85cQxbNmo8dcKX4dhLf+hl3iiC9EBuRndC1vRIK9mWNOR1VOB2jb6OjiLUJIWMfTrKOuH96+vbh5PeETO12XmQwyD5haiPb/SCJtNGz59ODZ+dBERK8IiIoZX44H9yp89oUZmO/KB9luvXm+0b6KFf53LXCaWW2A/H3Q4VGTrveS3HZPo+Ce784kERSZxwoNSadzhdkrcCL8Lib9EOXbWrxw7Xc62FrUmKeP9u1zd8z0xu/q2AjZUzIh8zolyLV+46gZBakQnelgz1t8StrOW+9AHu7bo6SV/zkBPWtlA85Jz0Iee+S3SkHIQ7WxGdGCMwNlAYALr2ZAmCMYmK5LuLPMNrFByo5IvzNDnblzZ4Mhbsl9KfsljlJoIAanN9sRt3aeIwwuG0oaK7ptqIt8+1LZgIxHWVxM6E7/UviP4loeTstyWX1jmv4Qou6+YAY9petTG4Wm0AzvJ3KRf23eRlDHEV07TqtPOEvi5/ScHuxhHWfNnmfmb4ABgEft3mgwheTlEm7+Z9UKpaCOdSLv93EVi17asoKni9XPaYGtzorhmhAeki2V3PwBrdSxQX6+RCYXpeeInvg5s92ZCs8jDuAQZxBiOvvSliH5QbExfKdJyA3P9Ce087V7YvwnCxPhh7Dm3Wi3Gb5h9Ci6XacCVMVmJCDWVEPihMTS75PV3yL/7vfQQEQbk1U2NBK5XU8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(376002)(366004)(39860400002)(346002)(136003)(396003)(122000001)(38100700002)(31686004)(36756003)(71200400001)(186003)(2616005)(110136005)(316002)(91956017)(8936002)(6486002)(6506007)(76116006)(66476007)(66446008)(478600001)(5660300002)(64756008)(8676002)(66946007)(86362001)(921005)(31696002)(38070700005)(53546011)(7416002)(83380400001)(66556008)(26005)(2906002)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDJXNzRqd1cvY3Q4Szg3UXNlU0tsQnBBYjB5L05oUC8wNDBibmNYNUdFQm9o?=
 =?utf-8?B?Q3RKQ1JOQU01bFRFR1h5MFFpYU1tb0FVL29JbHg2cy9TWFpNeVhkMlB4LzZQ?=
 =?utf-8?B?RGp1OWc3SEJHU082QkpjamgyenpzV3dKMUlWWkR1YWRkSUN5aUdCZDhWcnB1?=
 =?utf-8?B?b3d3aSt3dFNuM3ZuV2VVanBpRmE1dndWR0lmUmE0em5ZOUhuMUpzWWhDQzlS?=
 =?utf-8?B?LzBCYkZKR25ibnNhaHBOWTBZWUhKcmtxTnRJbUpxdnhCdXdpdkRKU3p1eTIv?=
 =?utf-8?B?NjFPT1NsOEY5Y0dVV296cWlnMTJZN0ZKNkUwRTBNaGxkMDg0cXRKdG1OOE0y?=
 =?utf-8?B?a1hHTU1IUVVBUHpVdHNUNS9pS1FmSWRMOVo3cnNqWjEwU3Zyd2NvSHl3Z3VL?=
 =?utf-8?B?RytPT0wvZkJhNDlFZjZlZWZ5bThpT0pTNlA5OXV5OTBLWEk4N0t4b3dTWUt5?=
 =?utf-8?B?MnNHeC9EQkR5c2hKMXlsb2puTWxtRVoweE0yYUVXQlhkYWlKeWRicHErbzJq?=
 =?utf-8?B?YzJUeHRBZHdCc0F4OFZoeTJFNnpuUHNhRXNQdzJpN1NnRFFWalJ1WllzRW1j?=
 =?utf-8?B?SXVkWkh2NXk4NGNYSkVXZTdqMWhrK0l6UzIwUC9RUlhjbDhVRXRkeXVRdWpw?=
 =?utf-8?B?a2dVU0l3aHpoUFo1c2dnckJ3Z0ZVdkcrYmxJcDlMSFpZS244UE1xcnVObjZ6?=
 =?utf-8?B?ZVJNYUY2K0E1cmZpY0RzUTQvcnRoL2FBMGl6KytMMGNJTXFuVnVUdFpxRklE?=
 =?utf-8?B?Y0V0SWdWanE5eHdobFQ5eXQ2UGhNczRVVlU4ajhLTmxWWXAxT2p1clV3Ulht?=
 =?utf-8?B?alNESzFBeEFNaWYxdTJuWUVrRmVzeU9RVjhqNnFvVVVYVWFOdjNpeGJlNHFx?=
 =?utf-8?B?SUJmNmpHMlBJd3hYYVAvbXVHYlQ3bFRBRGJtQ0kzcU5haU1iUGNvejVtZ3Mx?=
 =?utf-8?B?blR0ZGZXUlkzc2dmakdsNlpwZW82bG5McW1sdmtueWFTMXByek9wWm9CQXVW?=
 =?utf-8?B?YTdqVHhDaWh1Nk9JZ2xFelF6cjRIUUxHcS8vSklMeDlJbzlWM1ljQjh5dkEr?=
 =?utf-8?B?cVlBem5BVm4zS3daK3o5dmpFS01kdXkwbGVWakZ5SU9LVWd5YmxYYy9xSE83?=
 =?utf-8?B?bVpHNVNNb2JLVVFQREtGZWNxUCtBWFZlWlNVQkRQdzl3SDN0aTVBclUyRmpO?=
 =?utf-8?B?TXcyRE9aVTQ0U0pQNlFFVnA3clpZcnRjMWxiOW4vbkh5cG5SY3llcW1HeDFW?=
 =?utf-8?B?QlMyRmhtYk1udUNlY0VHMzNqdVhTbUxBY3JNTkdJaWpOREhadW81UXNMcUl2?=
 =?utf-8?B?dEpQVTRKdHYzemN0Nm81Qk54bTZsaEhIL0xEdGpyYUNYelJyakErL0ZYSXdC?=
 =?utf-8?B?a0tibitva25KQ1F4bThJOFk4VUZQY2wxbkNTbEhDbTB3NXFzR3RtcWRsQ0g4?=
 =?utf-8?B?ZWRnZEt5Wnl3VjJPdzB2VmZSalBlUHl1aXhTQjYzWTFraEgxckNxSlhCcEpi?=
 =?utf-8?B?WW5XYVF2dThEV3hDTURld3ZlSDk4M0hLbzBJS2drd0RYUVJFL1AyNDVLWEcy?=
 =?utf-8?B?VmJvS0x2UjB4UkIyd1dEMzhWZndXUWpwWU1OQjlCM1hQV3dNMWtJb3ZSZ096?=
 =?utf-8?B?aU9zeCtJTUFLbDlnaWRHeXZIQ2YyUXIwUTNXRElpMXo3c2ZBWWJWZUJsazQ3?=
 =?utf-8?B?M1pQU0FQb0hGNXd0bTdUQ29aMW5QZDNFNWp6NWZxRVlGR0lMRFk3Qmlwc2Z4?=
 =?utf-8?B?aWtuVm5pV1FzN0RnUnNGRnN2RXJ3ZDRGQmRSTTVXcHRGejkvRVBZK3JCU0Fh?=
 =?utf-8?B?VWhqSUhjWjJtbC8xR3BPd1drZXl0QnhEQmNKSUVmSWQyR2hwYXdDNFY2NW9M?=
 =?utf-8?B?YUQyb25PWHY5d2JtUjBYS3dwNjdZL0ZML0VkejBETE82K3VEWGVHSEV1M2xS?=
 =?utf-8?B?bmFjMWJRbVkxanlyejU2aXNJUkhGendGNGM5UXVncUJCc0dwR2hJZFFsOEV3?=
 =?utf-8?B?RjNBemV0emxrQW1DT2tQdVdVYTBBVFJ2VkdQc2tyeDFxbENsWnN4WEtJWlNV?=
 =?utf-8?B?eWYyRzRiUk1helF5S3dnL2F5VGhUSVBhODRBVFRWZm9nRTZWamxmL002cENT?=
 =?utf-8?Q?u6jByUiYRNNpkHNqZ9g54q0NC?=
Content-ID: <8983126E131C72489E1AB59331F9B87A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c2a82b-730e-423a-e9c4-08da8f6efda4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:46:49.0802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOjTvzCksygJGdH5n8RZUKhJCzzI0QtlCCC1Dbi3Sj3w5vb/tefztG8uwEHWwz1o9+RJRMVOqsUdTSJaC9gQRhvVwKR715b4XE6oLqaZN68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_194659_922796_5F08FF4B 
X-CRM114-Status: GOOD (  12.49  )
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

Noticed a another thing, sorry..

On 05/09/2022 09:31, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Since composable cache may be L3 cache if pL2 cache exists, we should use
> its original name composable cache to prevent confusion.
> 
> Apart from renaming, we also add the compatible "sifive,ccache0" into ID
> table.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/soc/sifive/Kconfig                    |   6 +-
>  drivers/soc/sifive/Makefile                   |   2 +-
>  .../{sifive_l2_cache.c => sifive_ccache.c}    | 163 +++++++++---------
>  .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
>  4 files changed, 94 insertions(+), 93 deletions(-)
>  rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (35%)
>  rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
> 

> -static ssize_t l2_write(struct file *file, const char __user *data,
> +static ssize_t ccache_write(struct file *file, const char __user *data,
>                         size_t count, loff_t *ppos)

You need to fix the alignment here as per checkpatch:
CHECK: Alignment should match open parenthesis
#112: FILE: drivers/soc/sifive/sifive_ccache.c:53:
+static ssize_t ccache_write(struct file *file, const char __user *data,
+                       size_t count, loff_t *ppos)

>  {
>         unsigned int val;
> @@ -57,75 +57,76 @@ static ssize_t l2_write(struct file *file, const char __user *data,
>         if (kstrtouint_from_user(data, count, 0, &val))
>                 return -EINVAL;
>         if ((val < 0xFF) || (val >= 0x10000 && val < 0x100FF))
> -               writel(val, l2_base + SIFIVE_L2_ECCINJECTERR);
> +               writel(val, ccache_base + SIFIVE_CCACHE_ECCINJECTERR);
>         else
>                 return -EINVAL;
>         return count;
>  }
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
