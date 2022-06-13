Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chJ4SezeYXrcOXqnItJXuHWlOBwSDMZ5RsBUOYUgSFA=; b=INYe7oqlcUrF78
	F866vkkSrMtbtmjtQEwDUg8y+KCSj9GgrVS3i0/Q8h1ynEMfYAJtTMxCZEDsHV41vSQk2pG78Hfe6
	HW2ymbrGfieWoUFDrWTvZrO3nRkyaF13zhWiAN0FX0VsRqqV2pSHNYCrLMrUufmwbEbZ/0+39gAS1
	4++1Zhi1sUaZI5kQaK/5jnSSrFRCrSRPfgY0KuY/DY4Y63imT4hv3PJlmzyKN8Nl0vcS0K2pTXauX
	HM3WDLvi8HyTIJBBChFOy4oBb4RaV0Y8zTFXglwWGxR79K/nH49S3JouQygQxqdwu7eOgMQ+jNRY2
	EmaLwP5PrrLQ1z7j92ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ig7-003O8o-V9; Mon, 13 Jun 2022 11:56:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ig5-003O7P-1C
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 11:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655121376; x=1686657376;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8Q5Vi8/J5qbKKRMZA691TAPtHySSM6q/h6jOv0RQgGw=;
  b=TRYCeu2YZluLNKX4tnRSZMwoDb4KhyTkxL7lu9G7NkbT8yWELDSKOP/+
   My7aUWvuQ3NdxVGWzMLsrGb+YFXi/bzeQwzHNUR62yqIFrtHgLE8Kt1xu
   W5NAN0ACUAg/UQFISNzzu0s8h4RFfKF4uz9puR4a5qdlY86rzJPD2Fzd6
   1rAZMoEhZ5N8oMZAhpe1i2/Cs/+1QK+Bx5qduEASVA8OyXJk71M0hivjj
   PHRiSit4vq5vEj0/+ULYQV/pHcL7+vquJxkETioUAnZpBIXM8Y9NEcGsy
   6U1THvAgCyXt8OtT7qjd2TDOX2aTnVXpEXQ9EdQoabsNUNAMv6TqW+Pal
   w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="99743306"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 04:56:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 04:56:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 13 Jun 2022 04:56:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQW58vAI/qZT1/kCap8DC0puMEf/94LS6esakgTCJqqG5mrrLQDsR/XQvLH5iPv+Ao8+dRRpq01EwcvlUxPiwFm1Y3Qa+UAVGCpvIUfKOTHZYKxqoK4lR5CogSZsTuMfpqEUbEHE73upPJltsfXnRbb5oCWM1HmQwEV4N8CZ3xaqFZt4Nu1OL2USBHkRgbadWbFij8Dw4f7sAds596TQBbTqjVEt7mwzcRmMHrrsUbKykwjAG09wXAx8g25It4OpY340eqrDubar0xOPKHWZMudTylWbX8HPW9DxI+hgYSg1/vxkd8M9RgJit/rPWW2fqnOUYsxMjkuLbwXMHWjImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Q5Vi8/J5qbKKRMZA691TAPtHySSM6q/h6jOv0RQgGw=;
 b=oLOULw3ivfugL2Ign4WCS8yvP+AV6vxGv+2Fm3tkqKBTBaMiKzHmx9AOBx4I65FADI/ruOQCzowZ7/aCi9dUpAuR8mC2USqlC1W3yowPK8NGnAd8wU5hEaaXFj4skb8QZYpWs6RGxNjm9mqZrguXDAP6ZpVpgtaQUvo81cGxLVw3DLhmY32shhACWkKgkfkGCW3aYovTy/Jnm3x+GDcnOzGE4UC1uPCnBzbQ9ypc+YvUQwjSK2n6xIIzA7JSGGKhkDolKhfVwKSqUHUty3U5YJ2H1sUe/Ys4gvFOroQLaCJAPSdmqlzXHRNEFJ8Rfo6rHgsTpFYq30F2Ga1/5N55pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Q5Vi8/J5qbKKRMZA691TAPtHySSM6q/h6jOv0RQgGw=;
 b=apq6iz936rC/t+f4dsOyA6sCZ4RpzAFnDQJlUfWqPtJlHuVQnLCxPi57VuBwhHUyeHkGJ+1Y2kPPaCFn6Jt+NFYrRLPJhaK1KBTo/WcbOar5LEWYO5SG6VKGnY2VvyCfxSyoCwzxKsGweflhEKsYCNc7Trt5t/INFtP71GHRPSE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3755.namprd11.prod.outlook.com (2603:10b6:5:140::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Mon, 13 Jun
 2022 11:56:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Mon, 13 Jun 2022
 11:56:07 +0000
From: <Conor.Dooley@microchip.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<lee.jones@linaro.org>
CC: <Daire.McNamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Conor.Dooley@microchip.com>
Subject: Re: [PATCH v2 0/2] Add support for Microchip's pwm fpga core
Thread-Topic: [PATCH v2 0/2] Add support for Microchip's pwm fpga core
Thread-Index: AQHYfxeOm1EkCb4F8E6fiUEwN3NvnK1NOoMA
Date: Mon, 13 Jun 2022 11:56:07 +0000
Message-ID: <4593d704-7f7f-83f9-8fce-2e691d8ba580@microchip.com>
References: <20220613111759.1550578-1-conor.dooley@microchip.com>
In-Reply-To: <20220613111759.1550578-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff1356bc-f070-4077-97f0-08da4d33b36a
x-ms-traffictypediagnostic: DM6PR11MB3755:EE_
x-microsoft-antispam-prvs: <DM6PR11MB375565324FB288E303583C5498AB9@DM6PR11MB3755.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 73JImKjLN4PpDJzAfH8O8nT6v77IQXN9AtK/++sCyG1zdWN5MBmg/MLfv4sVtIgAEeX6oMzyloKq/HiGOcVYsCB0QK/JzBRmxlGrGf/IYyPDD2CFOwGbtv3wpPcJtRh+mGWfb+6r8aBqA4FmjfoUrp/UZ+pEvomASUMo9Kkbs6ln3lSJu6xG+tZIUY6pv+z/YjontzTx1n4aa0LGE1G6GMkzznSJmo0Jryk0L1km6O/6dfKibEXFYftzet72ipIQnkJLqHQD16OY1D0KNrCV66C9x1Kgwho52mAUe+r9R2L4jD4ctZUHGQr/remP2WPUVqVHdfKgpmN1Wj/8rknZOroFWw+SIQ6ske2xHwJ+ZW/DIMl2psWmhQpSZrN0R4TrGOqDJE3YIBFctu7z8W9RrTWNoBqk0kv/TmN0218mAiHLWOkBrQDcONIkou+tZx2xss1lhvRbPXCS8/6GCbXYGgZYp/M2uueeTaCV4Kzduj7T8hCvWjohTcxXgT3sYHERLAKbzQN1g7f19g3OePJMeLk8/rrK1kUc65jDgeOEHhDqWO1qz3pMp7Lqjkh78YpnxY5aFzfEpxWc0Sb+Y2D5Vv/LdIg86TCrkSVuhTUIEdP9awwVlIJnNHVjn7tOO0V8T722r0pHduCsbCWSC8ajlot72jPCxoVoQxDZqbrQqx+H/R5F37YNCHiZ/iZUcyjnqUBhY/q4UDb7nDaKBzQ73eybDJUt/FL1sT0kWg2lwbghG6Ie9na/f/GxrPA1r5/73m9i9mG6FS8zJZnRBgMhwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(186003)(31696002)(86362001)(83380400001)(71200400001)(31686004)(4326008)(8676002)(66476007)(64756008)(91956017)(54906003)(66946007)(36756003)(316002)(110136005)(76116006)(53546011)(6506007)(66556008)(66446008)(5660300002)(2616005)(8936002)(6486002)(38070700005)(38100700002)(6512007)(26005)(122000001)(2906002)(508600001)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anJ5bzdMNlpWS1RCTHFQeHFScHcvV3RFV2dkTzdiRkp2a1R4ZVFaVGw2dEIx?=
 =?utf-8?B?UW5aZGoyZTIrU3BlYUo0UHZBaXlQM2E2a3RaeHNOaGJISHhXSnNldWVsY3FU?=
 =?utf-8?B?ZW1zeTZYKzFNd2VUS3F1SmZRWnBEaE1Ic3I3UmVNMDlMa3k3NjFlRnp2ZURy?=
 =?utf-8?B?OHB5REcwRG9NL3lweHpxcnpaK283WHBETFNLRHQ0N3NsNHVPa29SZkpoZ1dU?=
 =?utf-8?B?RzdVRW94cDFmNnlBdVgyMEV6WFF3bVgvMEdydGV2VzVLMUV2UjliZU9uZG5o?=
 =?utf-8?B?QytTZDA2VUlhY2FqTXhYLytZNlhhelFzRUFJN0xCMDcwVHJpTkRjZ1JvQTla?=
 =?utf-8?B?TFdkUTI3TkZZWnFrWm00bDlyY0ljcEZ4TlVPb2g1d25XSXdHaWZHSjJkK3pJ?=
 =?utf-8?B?TitJSHcwalZPdXJEblVaeW5qRjFPdzBnWHM5NHM5c3ZuU2toUnRXU3FCWDNv?=
 =?utf-8?B?OW9UVkF6b3haNU5jYjNUcVd1aFoxOVJ5c0JIOXhZL2FSMUZKK2Z6SUhZWklK?=
 =?utf-8?B?UW1TalhmTlZzcGo5OC90M2NJQWtFL2svSlZXeHF0cFU1SjQxd1gyMnV6cWla?=
 =?utf-8?B?MVFzVURJSHlaTy9Eb0ZzV3UrR1JRS2JSeEdocnpIdERYZmZ0WlF6VVE0K2RZ?=
 =?utf-8?B?VTJWWEtXdXYzTUNGR0RvL2ZTaXZFbmZIenZXcFVLSVhFOU1UQ1lQV3RyTUNK?=
 =?utf-8?B?YTRDbGNhbFIxbi9YYThNS3NSdXdyVXdWNE9QVVFNK3lSTTk2SndiS00xZTBz?=
 =?utf-8?B?NEV5dHF0QTAxd3pwYkhFak1oWTVIVXpqQmhLOFh1WHZ4TzhxWU01eWtNNzVk?=
 =?utf-8?B?OU1NU2lPOHZyWGVyMGR5R3lvRkkvckxES0NzMUVtaFkxK3k1bFBGSEN6Tjls?=
 =?utf-8?B?Q21aV3QxVUQwR2xmWmg4Mm5EdXRMckxobUdTR0RYamU4WUVFV1RITFRMbDZG?=
 =?utf-8?B?ZndNVEpMa0tTMTNjOVRQblQ5TGs3NllFS2xqbXV2Smp3RTUzUU5KakZGVE9t?=
 =?utf-8?B?aVgxZ3BFR2NENzlxMUlTZENiQTdMQ012T3hjZW9BdkhaKzY5WUczQmtMaTFG?=
 =?utf-8?B?M2ltc3pPanM1NGN3UWNPdW5TaWtHWGRmemZhd2dyc3hMbWlzTmk3RFlsbVla?=
 =?utf-8?B?cnQvTkR1YUtqYVcxbzNtL2VuVzRLbGt2a0ZMUTZrMkt4eEF0ZXJsT3ZmU0tr?=
 =?utf-8?B?TUdvdWlYeWVnT2FTUk41VW41RjRzWnRHNzV5REdvcjVuTkpYa3NFdkhERnhM?=
 =?utf-8?B?MUFwZUZyVDd2VElGVURFb3UvWkNpaWs1cm1oaG5mVVBjUnRoeUxNMkVxY3Ny?=
 =?utf-8?B?eEYxLzBObnZFUXgraGlteXczRVVzTUxDdDV0ZjM3UmlqbExNTUs3Tml2ejV4?=
 =?utf-8?B?Nk14ZDF5UjFiblI5U0J1UEphSnRjQkhxY011eHFzeStZNmpMR3hTRFFtZFIy?=
 =?utf-8?B?Z2x0dm5sV1gvTWptdUJMUElBOEdLMHlhYWRLUmFjYnJXcTROUFZHN1VXS0c3?=
 =?utf-8?B?YXExaXppSHNNblNBNXBoTFBVWGZjZnFMVXlINXZkMGszVzFYTlltT3I3SENa?=
 =?utf-8?B?Uzd6UmJKVGp3NXpGL1ZSaEJURlAvVmZoSVJmQ1AxU2N1RDE3UkJhMWFxYnNr?=
 =?utf-8?B?ZVU4T0JMU3VsRDU5RjJsVy84R201VVF4czFYSGE1R0JxejlDRGo4MjRTSmd6?=
 =?utf-8?B?SW1qMGRNUllnaFlWSTJPN3dqUEhrWEs2TWFwUkRNN3g5QWlOdGYvNlRpTlI3?=
 =?utf-8?B?bmh2bnNDUCt1ejZsbUZNR1E5cHY0ZHZFRSs1bk9Vdm5iUFQwejlhYk9RQjhn?=
 =?utf-8?B?YVU0OGpSRTYxUVBmK1ZtMzRnNjVSYVFZNDAxdnp0MTQ1Uzl1OFV5aFVEOGhx?=
 =?utf-8?B?Q05manIwcjhkNUQ0UWRza2FkS0k4S1lhbnNBUFBheEZDYWhWS2E5NXJXTDJp?=
 =?utf-8?B?b2E2Wlo3Q2JSOERLSVR0OEpmcGxKQ0ZRTlRKVnVmOGJxQ1VsYkwzS05hSCtD?=
 =?utf-8?B?K2VWN3Q3Z2I5TmZNY20wRjlFcXNEbWxadWZ4MTZrRUlzRERiYUh0eXdLcE5j?=
 =?utf-8?B?aTRsa0t0Qm9yRUNMa3pLeFYwYUxKM0JCZnFxQkxGYjZtYnBTQ2ZzZUxOQUFZ?=
 =?utf-8?B?cjg5Rm1jTzlqMVNaeFNNVWxablBnQnlxNHpwdEM4SFBTNStNbEI4THRtemNI?=
 =?utf-8?B?TGJ2ZzA3c1BXVmVJYTV5YjZWNW1BT0hyZmxwUFJZTVdETHkwQnc0aXZ3NkZa?=
 =?utf-8?B?dHRMa2lIMktrZktPRFdmSkp1dmxpRFFtdWtGOEUxcG9oS2FPZ3FWODhGM1RL?=
 =?utf-8?B?ZU44R1RIT2ZUUldxMlU3SlJmQ0lDZ0dkRlhlL1cvK2x6MFhnZXNGUT09?=
Content-ID: <79D8A338D847A2468C38A1C7541B46BC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1356bc-f070-4077-97f0-08da4d33b36a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 11:56:07.4486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5YyaEMgGW8W63WF/dxVLbwd6ECd+l9FsJHNwjTklD9ICjS8OKn4EZJJc9vLx2CmKNP8n5Ea4DPxOAMgjvFDyVsBy60XTmpMI3kQXOb9dJfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_045617_187146_46F76E15 
X-CRM114-Status: GOOD (  23.28  )
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



On 13/06/2022 12:17, Conor Dooley wrote:
> Hey Uwe,
> Got a v2 for you...
> I added some comments explaining the calculations and a documentation link
> so hopefully things are a bit easier to follow.
> 
> Code wise, I went through and sorted out a bunch of issues that cycling
> through the different periods/duties threw up. Along the way I found
> some other problems - especially with the longer periods which I have
> fixed. I also added a write to the sync register in the apply function,
> which will resolve to a NOP for channels without "shadow registers".
> 
> Other than that, I managed to ditch the mchp_core_pwm_registers struct
> entirely but had to add a short delay before reading back the registers
> in order to compute the duty.
> 
> Thanks,
> Conor.

Ah, damn - forgot to mention the 3 sets of changes to the MAINTAINERS entry
again.. There's a change already in spi-next & another change in my patchset
sent for usb.

> 
> Changes from v1:
> - account for edge "quirk" while inverted
> - block changing enabled channels' period
> - document the hardware/driver limitations
> - rearrange get_state() more logically
> - fix cast sizes in get_state()
> - fix remove() and probe error paths
> - delete mchp_core_pwm_registers
> - simplify .apply() logic
> - don't warn in calculate_base()
> - fix period calculation
> - fix duty cycle calculation
> - add COREPWM prefix to defines
> - add a documentation link
> 
> Conor Dooley (2):
>    pwm: add microchip soft ip corePWM driver
>    MAINTAINERS: add pwm to PolarFire SoC entry
> 
>   MAINTAINERS                      |   1 +
>   drivers/pwm/Kconfig              |  10 +
>   drivers/pwm/Makefile             |   1 +
>   drivers/pwm/pwm-microchip-core.c | 310 +++++++++++++++++++++++++++++++
>   4 files changed, 322 insertions(+)
>   create mode 100644 drivers/pwm/pwm-microchip-core.c
> 
> 
> base-commit: 61114e734ccb804bc12561ab4020745e02c468c2
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
