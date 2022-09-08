Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CC1C6FA82
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEVXmX4CTz65Lm1JJ630bJ/Du10DH3YErLEieQDJYE8=; b=ijwAX1ONZ5ZAZz
	zEvphocX/rZxceX2D2oJ1oYNangMXzRFocEDznTdjc+knFtXEuYOekQ1Tbg0ET8f0WF2cbWRWf+Dh
	j3r7T/hcF0xyn7tiRLUe8uf9gpvXKwcmyJRmxZoldxeyhsRI43d0fHkWnb1ya6veNLy3koptdN85M
	XyAHqLR0jg1RWoz2f94jx0t9OcjswVPOEGLHM/McwnvLbrmTb+PydPT3T+2Tcv+VYOLLHxxGu4WrF
	A0Ry0cPLhzL8DUg9KVEM7sPHNGxh9I+Gpj5OhfGh4l6y0PtAu1FaUGHzg8OOvCPSoctPYjbVZuZOq
	wta9W352l8ouITaAW53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWQpl-009mtv-E9; Thu, 08 Sep 2022 23:21:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWQpf-009mrn-Vc
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 23:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662679275; x=1694215275;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0vohTdmg262YS7SJ9hp+v4gvnn8odag1L2cQNUpRTq4=;
  b=i9Trye4HFnjZnex8/nXmXgV3ST6BiowF2H9wbWyOtq70inaiIlQOFyFO
   y2498KwLhCmMywQUpNSWA3IwTMMgR4nYDo42EXMMp8lQODOT3SUIPk43u
   //3Tc3vrYP7amND03tGwBs4yxnUkbp8EEpLM0j7AOYZUHwyuMR7t9Ms1z
   wgfR6hQ8WrB1YB2tAzp2IDX37137H90btlvyEi1Wo7EPY91FsfGazr5DJ
   783tKuWkoRT/z2JLcRDf1vh4EYkjrxsOLTlXzHdYS68v+uQZFwurqTVTg
   MMa8QsMi0A6VztWsSPLwP4uEOcOAJ3SyY0//7n5jsiyiFQ8i9I3NCIYOS
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="176319090"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 16:21:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 16:21:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 16:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuefonuDwo0kqymvGf3mHWZj/yQgWA/zIGF5+iQd43OJdQS75QzaMY7YIkb9WLlBf6JU2uq+r24X3G5SkQWPXVTbBCVnPwi4SFgcYfZxuWWAGyB17TwAJpisnwR4xQOH1FE4GBIA57Vs2qFv0/qI8A8Gb2gYVya3oo55aYDoUIvP2Q921ZR8UBa0IgF58uVzWsdJc/nYxFs+gSpyCKiALkMlOn6dxxf4pQHXha/aDQ8bphPEV/ZSvNpZgXI4dr32cENX19Fk4cBFT3ypbqID0Og4NIMSBY5vUZ44qNHJXkkhJ7//jBuernrnmGpezfj1U6DygURM7+5sZ96baG/yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vohTdmg262YS7SJ9hp+v4gvnn8odag1L2cQNUpRTq4=;
 b=Y/ub+X0e2GabAbgkh+usswOlsBnMn0XWuLLxaWNW6Ig6y/q5Dza1/YCFsevwY9Em6Ld5dm/O2apKI4mxavzkEJ6x3FAaRBat4MN5IxJu6A/IJyX4u4N2D0B9EV/CX7A3gQBKy13M7wJHWKCcSvszXjasOzgheqcgp/GqzPsgEN1zmqGPU+jERO4XSwJvTU17PocylfQ5JAhklCFegSNwPAwyAwYwuVW117jllDc/Bob3Y6Z8a2an8kVrCnJbSuOt1oV0RK1ayf3XQRTWD9Sxy9VNZ78h6zpvD80+hwGIQtDNuYopOCB2oDO7WdN8izF7l7dfL7ESovkfG0p7X4nqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vohTdmg262YS7SJ9hp+v4gvnn8odag1L2cQNUpRTq4=;
 b=fdLPigRb9yZYuGB73L2Vv2/cND0h9Qm/VgKFOiiSY/XBiwGqs+18DLNKahuHadEYBIByV8eQqB8gWdqww54NSDLu0XWE43S0Ks5FyWplp6ug4yYGqHYx6IJmuv4I3AD2Zs+2F/cjGaheFUs/FuArippKE7ie2tout3zI5/i8XJw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3070.namprd11.prod.outlook.com (2603:10b6:805:d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Thu, 8 Sep
 2022 23:20:59 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 23:20:59 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <ajones@ventanamicro.com>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<heiko@sntech.de>, <anup@brainfault.org>, <mchitale@ventanamicro.com>,
	<atishp@atishpatra.org>, <nathan@kernel.org>, <jrtc27@jrtc27.com>
Subject: Re: [PATCH v3 0/2] Zicbom block size fixes and cleanups
Thread-Topic: [PATCH v3 0/2] Zicbom block size fixes and cleanups
Thread-Index: AQHYwcSsQ+Tt+6ynAk6/98yN/TgzgK3WLfaAgAABzgA=
Date: Thu, 8 Sep 2022 23:20:59 +0000
Message-ID: <5c7c3b14-4f22-2a38-f638-90c599c9e207@microchip.com>
References: <mhng-0b9b374f-4bc3-4626-9ddd-be4fdd25484c@palmer-ri-x1c9>
In-Reply-To: <mhng-0b9b374f-4bc3-4626-9ddd-be4fdd25484c@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SN6PR11MB3070:EE_
x-ms-office365-filtering-correlation-id: 1764154b-93c9-4fd9-285a-08da91f0ca27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 48TzzSqag1Bd2wnGtSkhHz4zwNLl+TR2fD2l3HspgXo9Q3vviP24Xb2vl6+mEf3m/56v3ZluM+k6v5YBtUJuZCumj2ODNIU53HyeS5jtedj2htGdB8EU6b0c0MWDDS8r5B4OGmdGQ745OMaY/YJryCwoyQEG9qzjzSLlXzSmwepj3tcFHl42xuXY8Opo5izwGHU6FmqQDN1CzPVKP/J8gPTQvtR/JABfY7uCv9U4OpG7MBVR0sRUgeWMdvljrhxlfjNMiRrut6IhDIXzlVPrj+eZ8DQfnwtfyLKJLYeuAqyJEtdj9YuWC4BCLZQqRb9baqJaXDIf9HsQHR+q1WJR22RUTpgX3QSKoOVtnNuSawFAQiPbFxDnFiDK3Ny95nO63oN5lWaPRdT4oFVhBHMsobATZ9GvKP+9TCfGow646hJFrZPxpdF6etprer5mzHyyndqTJWnT9x38BUhdLbfTlyY9LFRMWiuDGv4o8ilp7w0SXHPxw7PH2jS9w/fJxEVDff9+X/KMfZ7+5tCisMQAz9mJmK1uHKH1EoAIhZGbfEKMrn4ffHb4KtKfYbSfxHHdCXa37oqq9OEfRP4y1ZNbt72XZBcHunCn5EjQjFYhppaJWuXWGCyFaB8IhZmMatAxvghTt9Vv6koiH+YZbjHK3iZuJ1LHfFJNKvxEiAWUfhO5GqEOn0RKSEeHZNk3zQDQHNMfReoG5OccdHx2+QZ7JW35pvzW3Q8+1nm/JIUK4hvc5ZB1YzqP8Z6P9H+U2lc5Ohdho3Th6O1M0LohMp4ue5KmNjoWpgTKgQ/IK4+rL51aFSkxbYonqwyyqWP05h6TgtfPjKPTOANvKqeP2kAcEXOMfDGHPhrJjWeZVGwGa7g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(136003)(39860400002)(376002)(66946007)(91956017)(66556008)(508600001)(66446008)(66476007)(110136005)(54906003)(966005)(6486002)(2906002)(38070700005)(31686004)(122000001)(36756003)(86362001)(31696002)(316002)(76116006)(38100700002)(53546011)(2616005)(8676002)(71200400001)(6506007)(26005)(41300700001)(4326008)(5660300002)(6512007)(64756008)(83380400001)(186003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Znc0STVneUdXN2NDUzhCSnpyaSthOW9sOXdQU25IdWkwRkh3TVFTc0RRZWR6?=
 =?utf-8?B?TlV5dTh5akZod1VHUk9VWTJtUm4zZUdKbitMVzRBcm52dnpOaHdnaGpNcUZv?=
 =?utf-8?B?VFFKZ1hQdE5lNm5wOVJRVDdqYThXWEdqbk9lYTZEcGNleWIzMVJ6M0drNG9j?=
 =?utf-8?B?T2w0NWJtUkIwTWVWRjZwVnlMQWoxY0N1Z2kxQWdRcFRLRUhjZWJVSXlMUGdN?=
 =?utf-8?B?TzFpbEl5TGxRREcxTURrWXQ5bUtmcGtnTEozT1dSVWlhNjh6VDJ1OHh0NmlP?=
 =?utf-8?B?ZzNlRzhaVVRDMURHT3NYZnIzMzdzRkJBSGFBSG5FTC9ZL0NTd2NsQkszcTBv?=
 =?utf-8?B?RUFIVUE2YTNhbFV2WENzOGlqanQ2bnJzWEVXVEFCVG9sTVozQjNPbkVyb0lD?=
 =?utf-8?B?Y0hoSUp4RUlKZXNWWG5EV0liekZYYUxsandMNjhuSE9yWVMxYmZKcE45Z0pq?=
 =?utf-8?B?OTNhaUlLRUE3MTZpc0lRRnVIczFNRll6MzE4ZFRoQkk3WDdwYThJTnR6QjE4?=
 =?utf-8?B?ZisvcFNuNjZzdVJlSnRHYTBWTHlQNEV6Q0FLb3RYNnhzeW9RNEFYOXppL2Np?=
 =?utf-8?B?SU1aYkFxbEY1dGoxK2pwNXR1bzZ4dFZGK09Nb2E3UDBveU9JSjd4ckxQRzBs?=
 =?utf-8?B?ZU0zWkxiQ21aYk1Wdko4R0NlTmtZd3poS2VqaHU1Qjl4K2pwWGRDdFNEV2lF?=
 =?utf-8?B?azRxNmwzcEZRVE9RUjZ4MmRUd2FObUdVUG11NlA0ZU9OcSthdlFJcnJxODl4?=
 =?utf-8?B?aEVXSjRFYVFjMlZrR05GakdQWDV1bkpoMVNnL0tDRmEzdDBBSzhaM005UmxC?=
 =?utf-8?B?WnNaektaRDZmYlNWN00vdFNHOWFQODVweGNTZFpOL0FEZnBIemRlT3hlYzYw?=
 =?utf-8?B?N0pqbTFWeFU5aTN1QkR3d29CR2E2aVE1U1lqUlhDQTI2SmwxenZuYnJKZDBC?=
 =?utf-8?B?WG1qMDBra1NUQ2RxNEIvbzFVS2k2TEpUQ3NrN1BHMjJhUGVpKzF6d0lsMWM3?=
 =?utf-8?B?MlhnMXNBTFNtdGF3Mm9XR0lFdU1Yd1owTThiVzV0SWpjSklQK0tKaVd1Znds?=
 =?utf-8?B?WloxY2JWZ3cyQjZ1MUNpaDFTZGV3SmJRVkpSemthSFF6R2FhL0hrRHVlZEJP?=
 =?utf-8?B?T2NKOXY4ZFdRZHA3cllLU3d4RWpyQUxORTlEY0FjMVZpekpGR2VobitPSXR6?=
 =?utf-8?B?aTlLbjBzblVldzR5NWxjazdzMnZkUTBKOVhLdXRnbFZ5aXJWemhhYTBLTnkz?=
 =?utf-8?B?aktyRmZmMmhMbXRnUEZaUklVMGJ5MXB3a2tIbXhuTkpackFiNlBmZU5sam1w?=
 =?utf-8?B?REhteTE2UDdQSW56aUlUd3FMM1ZxRDVRWWZwL0k3d1hLUk1nQWdsa0Y2cVkr?=
 =?utf-8?B?eTBudmM0NUdIblBYc0lyVnA5NlVpemZWaUcxRmJnNkdIOGRqU2QveCtuMVE1?=
 =?utf-8?B?cFJnQ1dEalp5NU1zSlJWWW9Oc21XVEFhWjNrcld6aXI3VGhlSTVsY3RwOS9K?=
 =?utf-8?B?NnNPUXVmdFBkM2hoNWxqbUtGcDcxT0YrT0VLTXVEZzBWa1JKdnFJdEpJUHU5?=
 =?utf-8?B?M1BlMEExdFFwdndUYmlsVFdXTHlqNE11bnBzVU9Ja3hkTWk3ZlZJU0s5UG5J?=
 =?utf-8?B?bGNiODBlNklrcytIc2ZoSVE3bis4QWtYUXhtKzVEUWZFMFNMRWs2SVZGelcz?=
 =?utf-8?B?SWxsN0Z2WTB5Vm04RVNldUJ6eWZmYk40V2t2cFhpMDB4dTE1ajVTaDEvK296?=
 =?utf-8?B?MTJ1Sm5lTXNOQnBVdTR2clhVaGw0YTU2ZjRRM1I0MzBxVTlGNDJ6K3g3emsy?=
 =?utf-8?B?WW82dTVPZjFvUWNRcTVQSjgrTTdRL3BIRkhYakZnbVdxMXoySllYWHlMU2Fv?=
 =?utf-8?B?N0lrWk9PTTlFY0tsOGtieUY5MnAzbzU5NlVyc3R0bEdId0dVSXNCQzdBUC9u?=
 =?utf-8?B?NDhNOXpydlYxZFJSblNCeS84TmM4enpiMG42VGlZTDBHbmp2MEQvVnA1SGVW?=
 =?utf-8?B?SEtHSUI3cHFGLzZUTUtWOHdSeVQyZ2c4SGZkeE5takthWHpDbFNLWlRrcFdI?=
 =?utf-8?B?MzlVWWxaRFdjOFdnSTRYWXV6VkM0WFR6K2oySTdreDJDRVlpbktCZmhqREw3?=
 =?utf-8?B?ZU14YUFQQWp5d1huWERXV3p3TFoyVWl6akpOejJ4NWZjQWRyUXp5RTR6WCtQ?=
 =?utf-8?B?Unc9PQ==?=
Content-ID: <368AAA8E42CBC14F8E0B83A8FE44FDC8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1764154b-93c9-4fd9-285a-08da91f0ca27
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 23:20:59.5932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y4KdsQ0tpD9wa2vlj750r2qU59ttlUH9R7Gpow+Z7qrPhjJiWWeAFkEJU17SfUW7GAdOM5UTUNCDYg2aOkqRfWooyFEs4r6kIPLxhp+vwXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_162116_371705_D25ADD1C 
X-CRM114-Status: GOOD (  20.10  )
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

On 09/09/2022 00:14, Palmer Dabbelt wrote:
> On Tue, 06 Sep 2022 00:45:07 PDT (-0700), ajones@ventanamicro.com
> wrote:
>> I collected a couple patches that were necessary for another
>> series. Since some changes were required to the second patch I'm
>> posting in case it simplifies things.
>> 
>> v3: - Applied Anup's move change first to ensure the second patch
>> can compile with Heiko's change.
>> 
>> v2: - First attempt at sending a fixed-up version of the second
>> patch, which mistakenly included Heiko's change without Anup's
>> change.
>> 
>> v1: - The original patches on the list 1. [PATCH v2 2/4] RISC-V:
>> Move riscv_init_cbom_blocksize() to cacheflush.c 
>> 20220829125226.511564-5-apatel@ventanamicro.com 2. [PATCH v2]
>> RISC-V: Clean up the Zicbom block size probing 
>> 20220812154010.18280-1-palmer@rivosinc.com
>> 
>> Anup Patel (1): RISC-V: Move riscv_init_cbom_blocksize() to
>> cacheflush.c
>> 
>> Palmer Dabbelt (1): RISC-V: Clean up the Zicbom block size probing
> 
> Sorry I dropped the ball on this one, but having the fix depend on a
> refactoring isn't the right way to go as those refactorings aren't
> supposed to end up on fixes.  I merged it without the move into
> palmer/riscv-zicbom_fix, but the jet lag is starting to kick in so
> I'm going to not merge it onto fixes for this week.

Good call!

/stuff/linux/arch/riscv/mm/dma-noncoherent.c:15:14: error: redefinition of 'riscv_cbom_block_size' with a different type: 'unsigned int' vs 'int'
unsigned int riscv_cbom_block_size;
             ^
/stuff/linux/arch/riscv/include/asm/cacheflush.h:46:12: note: previous declaration is here
extern int riscv_cbom_block_size;
           ^
1 error generated.

clang-15 w/ zicbom
CONFIG_RISCV_ISA_ZICBOM=y

Hope that's helpful..
Conor.
> 
>> 
>> arch/riscv/errata/thead/errata.c    |  1 + 
>> arch/riscv/include/asm/cacheflush.h |  2 ++ 
>> arch/riscv/kernel/setup.c           |  2 +- 
>> arch/riscv/mm/cacheflush.c          | 40
>> +++++++++++++++++++++++++++++ arch/riscv/mm/dma-noncoherent.c     |
>> 40 ++--------------------------- 5 files changed, 46 insertions(+),
>> 39 deletions(-)
> 
> _______________________________________________ linux-riscv mailing
> list linux-riscv@lists.infradead.org 
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
