Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16A0D29C2A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:From:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dtvv3G/8X0/gxEiypXGLRtwakqdMZFQsQRZcHKhabs=; b=UnoK5VeGHLfr36
	de+KlEIQCqUl64HtKve4WcXm8G4KOR1gf5BsSJ+UzMQlbVrKEesOPkYC+i6aIy3qDjP45ZVAvhJ65
	CZU+Bi0ooFUWFBSPH4QkaHUx5lLd+qWnfEtNcS+Vmaxakh537DZdWBWEw6yYMrBTGJ+xlPmYSpfCj
	qtTANrnoVRQLeTfHMVe+sLjREY9GMussyG4BQGBmUnMnxCZmL6yaGQBCQ52IZng0sriogAeThyiez
	+7Q5+ZY9QnSXIZ7Rom1bLoGlwlM8gwsycWqhkZyNGqX2i74VYQsZHN+I/FOxRzn3vfi9Xi9R207Ss
	fI174QPHtlcJtGwXyJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq7k-00000002EhE-10mc;
	Mon, 19 Jan 2026 14:21:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq7i-00000002Eh0-3DW7
	for linux-riscv@bombadil.infradead.org;
	Mon, 19 Jan 2026 14:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:References:Cc
	:To:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j4IZdSsV4nvY2CIYd9yiCPF+inHDPdRhDc0D8ICyeKc=; b=VeLe/twdiHtQUlMtR+vBlZp+xV
	rj3+pRnR+EGNlsy7XByimSvE4fcHQzsPAZD9rBeKiqk+CYQLCH6mmOqzBzvGbBgste1rdrQd+XXhx
	VVUg0iFRt8Cf8z1qpZircdfUk1jdjHVjrZOeM9ujFJ4rf5GN7xB8ZLDYvpAQeIn2eqki+35I07BbP
	2Fod8HcOvqa06WRbEITPPBJounXRODSI3gU0/g6Q1XWotWcsY/JGOs4yBQNq7QDa19YkYsgdKIKR1
	0Yrb0nxwOl6sbuChSk4/uwqWFEZdt3ojXH5h8I0V3hNP/Z5+L1DJGQdhLdQsbGJ9fW/aNfRVFOzw/
	b+Xj2gLg==;
Received: from mail-uksouthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c205::1] helo=LO3P265CU004.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq7f-0000000CFNw-0WRN
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwojydT818PIetopUfUVPZi18I23yzGtHWTo0HIjjlJoTRohy9EamiQ97h6KIUHiqp6tcM2tzHHfBfTqraPFq2m0Y+Jj1f1BfuraDQ70Me4ufSdUYbVbjrtYMIbrO8Nh8DL0k7iFgL+4x7RK0nAEqO5on5ZJi5VFkWCXyGjDSAODCQq2lciM3MRUnVrIhtkgQUFXugeqMZqX6SsV/HawAmBTjINQ1dwSB1ohRQg5kguFEE5Cw+0Dt0fw5e8gGR2fwOTWvFM/IRnOo11iVnCEeVOoq9/MC9rzUBmFza/Y1j8+Jy+09uLMgGh/sN93YLjijCG310P+LnSlBIHX/6oCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4IZdSsV4nvY2CIYd9yiCPF+inHDPdRhDc0D8ICyeKc=;
 b=KkYuGf2ZJYwXVZem+6lP7X2zzxjzQyP2dTLFDUAMCU1Ea+FBjkmlKYlD9hYTmYkBAEDbcQUuQkF3DC3wndn0JzMbCOcIateG2CB0rFUSPfTmhg4KryewY75gYWAWch2ikpg/JN6wAvXemTcaBJZ9Rq0PFvi2Pd2HhKVot6Sm6vAQHrNwmdLXKkX9DPGiwtYgAGWSt9CPAaB/VwoQ5UuTr+cGLJervGRe3y8Ot5PUmUMtgtsA77ImgkfV1P2hxSRIfrPneEPsx2UfjjE3V0PSvGDk3FPzNhJ5JBDkd3+Tkbtw5d+iheq50wW0L9VVXmfRTzwZPGQU9pZQ7OBgQlcQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4IZdSsV4nvY2CIYd9yiCPF+inHDPdRhDc0D8ICyeKc=;
 b=DvjNLEZHbIEsm2sdNB2DpV9TVDMP7hnZ+xdYQJbvag6WZbug6+j3S9guDghyFezBN4cRaIxsNYeiNDkKcQEPnk3vI/T22HrY9TBbhOAVZYVhSWfd4XOD/4alLSai9pZJZIuY3ttjESiHAZyDchJ7Hg9RZ3Ohns2VT/lDd7jEn5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3594.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Mon, 19 Jan
 2026 14:20:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:20:44 +0000
Date: Mon, 19 Jan 2026 14:20:43 +0000
Message-Id: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
In-Reply-To: <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3594:EE_
X-MS-Office365-Filtering-Correlation-Id: 52255224-0e98-4ce6-02a8-08de5765ee8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czV1Wmh0QUNLY2Z5QUtYUVZxeWl5aFhtZEtSbDRTZEtTVDZkWVlOVW9QOUoz?=
 =?utf-8?B?NHEvZ1lHWnh0ell1R2VEeGsyNjU1b2U2d2RVWk1nSkFaZVRWbnZlT3pRV3lo?=
 =?utf-8?B?V3pMcDlpMUsyRzdVZTA1QnJzekJ5cXIyWk9wWFExK1NVLytodzhqOGxjQTVX?=
 =?utf-8?B?WmRBVWx3QVgxZVNJT1hPcjF2UWgwRjFNSkU3Q2VDREFvbVRXZndJR0lTY1JP?=
 =?utf-8?B?YmovOTl6aVkwaG85RWtUcWpRbGdKU2VhaEJJTE9jazhtUENtM0xyaVlKdUQ1?=
 =?utf-8?B?TjZzNk5hQUtMRkZlRTQ5cU5LcjdVcHU5SEVCNlFlaEx2TU50NDZmWDdrSmFU?=
 =?utf-8?B?QnlLYVg5QXVybUZJSE9RSFQ3cnJlZHZ0bENObmZyOFlRRTBXcHM0YThvcDVr?=
 =?utf-8?B?NGdzMzNEWjZiSjBMQjkyZWxQUUUwMkcrVDZQUzdNZ24rOFNvZGhmdUZGSEFx?=
 =?utf-8?B?dXdKQjdxcEY5N0lSQUFhMW1id2FTZzQ5VXdGa2c5aGxkMkNYd21WbSttTHM2?=
 =?utf-8?B?ZHN4Q2J3c2RCR2w5ZHFoRDNlUVE3VFk0YlFtbVhMRjh1c0tBdWgxWm9VOVlO?=
 =?utf-8?B?R1VOOHhVa2wzOUhrZ05QcSs2UHpQUlYyYk5DQnpQdXlpQkhYNTVJa1M3L1pk?=
 =?utf-8?B?ejQvMmpIaHh6ckcvVjV3UW1DRURJUmpSeUw5U2kvUFlHZUdKeUszZHpDUXJO?=
 =?utf-8?B?RDR1ZDRNNkNLcmE2Z3Z4VTF2ZzZUNm0yU0lacytkaFp2anRxSHVWTDZvZEZp?=
 =?utf-8?B?WjEwVTl1WExYRUNjcmIxbmRHdnlyOTBwWFgrTnJsakZ5N2pwMkhTRmthSE5R?=
 =?utf-8?B?ZGRCWm5uU2U5bDJzMWgzeEF5S1U5ZU1oYkttU2M3Ukx2QllPVFdCYWdUTEpI?=
 =?utf-8?B?aVlvaURud0U4Rk5yMXg2UG9kcTdYOTJLWG45UzNiVGp0NDhOMXVwKzNRUTll?=
 =?utf-8?B?K1VnWHBxVFlyRjhnR2o5NG9uald3a3NNdWhkczE3OEVCcERtdjhITk1RTk9n?=
 =?utf-8?B?eGJsUEZEVWt1alBIMHVDRWtYRVBsY2JCdXZWV0pERVBHUjFXSmRlWkhpVUdj?=
 =?utf-8?B?L0JwNXlmckN5WW5lK3NzU1N0U1lhUXNuRnJlTCthalFCamhWUmZnMEVydEE0?=
 =?utf-8?B?L2ZQWTdTQnBIdDZUTGhmYlZRU3dqa1RlQ011eitkeWtaOXJ1Y0krYUdrVGRQ?=
 =?utf-8?B?dUNXV2EzY3F4b1R2ZFV6MnpONEUxS250N2VqSWZnNUcvTWhKdExRMmNLNCs3?=
 =?utf-8?B?TTkvMDd3UlEyRnROSEY0cEpIUmlFeGJVSmJhTzd6eTlGdFFNSk0zNDlLZlpy?=
 =?utf-8?B?WTZjVmdlY2Q5cXpqNW5DRjRXUG45bjZyYkd4SFhsV0xqS2xabnp1ZDhjQ1pa?=
 =?utf-8?B?Wm40OUVyMnZ4VFdwTVZOa2NLMEhJczJoellycS9wS1QwUWhTQUJZVmJ3aGtM?=
 =?utf-8?B?YVJoQzRZM1lUd05nWHZnK21MWGh5akRxdUU2ZmUycS9EZk9yN2NURjFKQzJ4?=
 =?utf-8?B?NU44aEZVVmZYSEpPdzgwWHRTb1JOWFB3alhXQzhxYmZMVG9paGJXUTdOVHg3?=
 =?utf-8?B?TGtqNEhiZk1lcUkxdXh3UXN0bkM0Mk13OTNMTlErMUNaSnhPbi8vVit3M1hU?=
 =?utf-8?B?UWx6OWJ4RnlDb0UrN2l4TENjdmZVdmxtYUNrYWE3Nmp3Yzl5Q0l3NFJXNFNY?=
 =?utf-8?B?bzdKQWozd0hwOEZtRHd0bDJobmVVaW5UK3lrTHoxTVBTWk9mRDJHSHBsVURV?=
 =?utf-8?B?VjE1QnlvNFNwbjFOZDl4Qmt2cGRSWDVubGw1SlU5RklheVJhWlkydkFIQkNP?=
 =?utf-8?B?SEtwVmlMSml4elBuSnZCcGJRcHdDWHJ2NUxMZHBwWk1NMjZzRWVMZG9RcjNC?=
 =?utf-8?B?bWV4N29SRnliN3VLd1VnV0R5cFdHMlhHOXQ4QWpMREZHQXZCZll0RGR2Y1VF?=
 =?utf-8?B?dTYwN083OE9oeUZMTUowdEwzd3ZyWkNhWFkrV1NBYnI3NWZWOEtRMkNOcE91?=
 =?utf-8?B?alFpd2d4Ry9LbjYvL3R2TUtvNFB5SUVxTVRDTVBQVm9URlo1VUNlbHdxanlE?=
 =?utf-8?B?UEIrNy9JMjJvUFE0cWxlMFdoRGZGSk1IaG9xYjQ2SXlEdWtWMnBlVXVlaUFH?=
 =?utf-8?B?WXRCNVdIMFVHeXpXYkRKTENERVJDUTE2cGxZS1NkdFQ1a3BRUXlpMFVuWHYr?=
 =?utf-8?B?NlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xPSDdQbmRrcjlzY3dFaHh0MXBoeTY5S21MaHluOE1iVW16Q0I0YVJscEtv?=
 =?utf-8?B?a25abk4xWGpHK0g0Nkk3alVHWFZ6ZEN5NDd4QzMreFJ5ZE1ROG9aaDc2UmZO?=
 =?utf-8?B?d2lMUTdQbi9HK1BEUWJsM0NCd1c2Z010N3BHWC9SZlI0N01nTTFCZUFhWU5X?=
 =?utf-8?B?eUwrRjBBREcvQ3NGK1dIdEEvVnlmS2lQOHJTS0gwbHp6RDZXbmpsQU4rOHFX?=
 =?utf-8?B?dWhFZU9KRVpnTTB0VjU1aytTMG9BdHRHUlh1UW4xWTE1Mi9IcTBMZUNoUTBT?=
 =?utf-8?B?b0lEeTJQMnA2VzFvNHRkOTJxaEJyNnl2L1IzQlhTQy85aXcrV3lGbWtkbmxN?=
 =?utf-8?B?VHkzeXJyZlZsQjk1ZThCL2xPbHV2RDFtMTk5VWNCUzU5a3RYYjQrMWFZZFNF?=
 =?utf-8?B?SXQ3dGFlUjJ1K0podXUycXRHRFVyMS9kd1NIYW1qaFNYQ1U2NjlCS2NoYjRH?=
 =?utf-8?B?MmZ0MDJqZmFqVGNKNWU4WmVBbGZiTWNJWDQvYUJyekRCa3h2QmVqRVpEVXhR?=
 =?utf-8?B?enFCY1I2TDZqNFI3c2JIbW9HYThkVGxqY0RCMDZQUmFzWWhTaVhuOWNYMFl5?=
 =?utf-8?B?QzFjVDBnTUdKYUFvRXRsYmZiWVhUZjNXZFh1UGxrZUxpS1hTWGNiNGJ5RzRl?=
 =?utf-8?B?cHJBL0w0VkRYK2t4ckhnMXdraytQR284Z0tsN1UxNWIrRE9PZnJZZVYzZXYw?=
 =?utf-8?B?djAxbmpncENqeHZWSU4xUDJWYWVnbi9WcmU3aythREt2MmI5ZVF0SVcwMnNq?=
 =?utf-8?B?cHpTK1JLcFlpT2d2eFRsdEhRcVFuRWhwSTlNREEwdUx1b25ydFlraURXY2NK?=
 =?utf-8?B?aThZSGx4SFgxdlVBeEhWWjR4T2dmUjB4L1kwUWZXVHZtTzBlSnVFdjlnMkYr?=
 =?utf-8?B?NVZ1Z0F6Y0xSYXZFOEJKMDlJUzRUbEJmSkMxTVV6bGZEcVR5NEIyckFzTGM0?=
 =?utf-8?B?WTVKaVhFa21iMGZmOU05Ty9JMjNNMmxGcHZDQWJwdWNjRHdxUkZ4WUxKYW5k?=
 =?utf-8?B?Q21VMWNOWTgxZzViWmJkZENRZWI0T2tVMVdmLzJUMjYxdFRwVVR5TkNvN1Iv?=
 =?utf-8?B?UUE1RGQ1dXIzbERtdVhBUmhDVllLL0ozVXc0cDZaOEZFWlBOaUh0aGdGZGJZ?=
 =?utf-8?B?ZUNzMnVGbVp5bEtUbjZHSUpUZWlWejFUcnV6ek90aDJxOTg0R2Z6dkMxYjJn?=
 =?utf-8?B?WjBDcE9RUkE4dXFvd08zeGVZNHpRQmNHZFJJeVBuSzh6bStzRUVVUFEvVGpB?=
 =?utf-8?B?SlZOelViWHV6ZUJmMDdPcWhlNDEyU0cvWUIrQ2JKSHUwdVVua05VWVFHWUlo?=
 =?utf-8?B?a216ZGxnMndaOUI2ZkZRajFqMmVRVVNhWlY5YnRNc0NkSWtnYjB1clFVbWlX?=
 =?utf-8?B?Lzg1aXo3R3JCUG9jY2preTVDRFdkVEREUlg1R0RLb0dKdnlzai9CQlpkOE1R?=
 =?utf-8?B?VVRoS2dsaDJIZnVBRkRsNVN2ZFJWZ0VMMVBpamxlT1JqUnVQTWlBQlg1Qndj?=
 =?utf-8?B?cGQ0NzNiVnlZbkwwN1JGbE9xTHlwKzRYS0FUaEQrdVhZZDdXQXJaRnA5NUl6?=
 =?utf-8?B?eDBkOGNxdTFjUlBuSnJsN212M3Z3QkJqRmFqaC9UODhJYk81a0hGcjBEL2Fh?=
 =?utf-8?B?QVVFSWVubmxqZWxLOUJJZGFsSXh1eCtUU29CUnJYVmtOZm94YmRwRDRObVRz?=
 =?utf-8?B?TExCaGQ1ZlQvL2hBcUhZdGNQc0dtSHpWTzFaUGJjbzJtVTYwc0dpdzdKb2VE?=
 =?utf-8?B?NlZpUWI2LzI1V05Wbm9BMW9EMllCeGUzUVV4dUE4Vmp2NG1iMUROMHQyVGdK?=
 =?utf-8?B?RkdNRTFSZlRnYTlQTGhWU3RpcmRmKzhacFdTWXZGdjN5cjFjNFk3NGgyMm0x?=
 =?utf-8?B?bk5jeW9pZ0dXckR6SDhNR2RlTTAyRWRWSU5uM3lnU0hkQ0w2RnA5NGJZZ1I3?=
 =?utf-8?B?cHZBSDVUNkx6WXNJcHZYSm4wb0JuTGlLYUM2UE4zUFVWMVBIMjBEOHUvTFlE?=
 =?utf-8?B?S0V6aGZQaThIRnR1TDZvNUtqV0xKbGFPS2hQWnp1Q1gzZUkrYnVUdXJsUDEx?=
 =?utf-8?B?STZnQ3ExM2k0UEJGaTBueG5haTNGQlp5UXc2L3dQQ3BNQVlqYVdqNGthNUl5?=
 =?utf-8?B?UWR1T3BjdkJTaWp2ck41RkIwOVdiaFdSZG53dENiUmhkK3RlcTBvbXY3OXhi?=
 =?utf-8?B?VUkrbXZ6bUNUYXBpc2ZRRFl3WUhlT3VmMHJLZGh1dEtBZ29YUWhpNzlEZGEw?=
 =?utf-8?B?WEoweGdCWFhvcy9KenMxdlNxMmJ1a01aNFQ0N2ladTNRdDhSZy9HWWJsYlRY?=
 =?utf-8?B?Z1ByOW9Bc0FUbUZUL2NhdkFLSTkrSkIyRWJMNmtBWG5Fa0VsSTRtZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 52255224-0e98-4ce6-02a8-08de5765ee8c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:20:43.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kltzRxpGrd/OsqgdfbRfN0xAZf0u55tK0fQjSVbJJLIQCwIgvq/xzJ6HuxVZbJaPAsI85XZMH1yo21+ROv47EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_142051_370553_C4502EA4 
X-CRM114-Status: GOOD (  31.53  )
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

On Wed Jan 7, 2026 at 3:09 PM GMT, Daniel Almeida wrote:
> The current Clk abstraction can still be improved on the following issues:
>
> a) It only keeps track of a count to clk_get(), which means that users have
> to manually call disable() and unprepare(), or a variation of those, like
> disable_unprepare().
>
> b) It allows repeated calls to prepare() or enable(), but it keeps no track
> of how often these were called, i.e., it's currently legal to write the
> following:
>
> clk.prepare();
> clk.prepare();
> clk.enable();
> clk.enable();
>
> And nothing gets undone on drop().
>
> c) It adds a OptionalClk type that is probably not needed. There is no
> "struct optional_clk" in C and we should probably not add one.
>
> d) It does not let a user express the state of the clk through the
> type system. For example, there is currently no way to encode that a Clk is
> enabled via the type system alone.
>
> In light of the Regulator abstraction that was recently merged, switch this
> abstraction to use the type-state pattern instead. It solves both a) and b)
> by establishing a number of states and the valid ways to transition between
> them. It also automatically undoes any call to clk_get(), clk_prepare() and
> clk_enable() as applicable on drop(), so users do not have to do anything
> special before Clk goes out of scope.
>
> It solves c) by removing the OptionalClk type, which is now simply encoded
> as a Clk whose inner pointer is NULL.
>
> It solves d) by directly encoding the state of the Clk into the type, e.g.:
> Clk<Enabled> is now known to be a Clk that is enabled.
>
> The INVARIANTS section for Clk is expanded to highlight the relationship
> between the states and the respective reference counts that are owned by
> each of them.
>
> The examples are expanded to highlight how a user can transition between
> states, as well as highlight some of the shortcuts built into the API.
>
> The current implementation is also more flexible, in the sense that it
> allows for more states to be added in the future. This lets us implement
> different strategies for handling clocks, including one that mimics the
> current API, allowing for multiple calls to prepare() and enable().
>
> The users (cpufreq.rs/ rcpufreq_dt.rs) were updated by this patch (and not
> a separate one) to reflect the new changes. This is needed, because
> otherwise this patch would break the build.
>
> Link: https://crates.io/crates/sealed [1]
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs |   2 +-
>  drivers/gpu/drm/tyr/driver.rs  |  31 +---
>  drivers/pwm/pwm_th1520.rs      |  17 +-
>  rust/kernel/clk.rs             | 399 +++++++++++++++++++++++++++--------------
>  rust/kernel/cpufreq.rs         |   8 +-
>  5 files changed, 281 insertions(+), 176 deletions(-)
>
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 31e07f0279db..f1bd7d71ed54 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -41,7 +41,7 @@ struct CPUFreqDTDevice {
>      freq_table: opp::FreqTable,
>      _mask: CpumaskVar,
>      _token: Option<opp::ConfigToken>,
> -    _clk: Clk,
> +    _clk: Clk<kernel::clk::Unprepared>,
>  }
>  
>  #[derive(Default)]
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 09711fb7fe0b..5692def25621 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -2,7 +2,7 @@
>  
>  use kernel::c_str;
>  use kernel::clk::Clk;
> -use kernel::clk::OptionalClk;
> +use kernel::clk::Enabled;
>  use kernel::device::Bound;
>  use kernel::device::Core;
>  use kernel::device::Device;
> @@ -37,7 +37,7 @@ pub(crate) struct TyrDriver {
>      device: ARef<TyrDevice>,
>  }
>  
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  pub(crate) struct TyrData {
>      pub(crate) pdev: ARef<platform::Device>,
>  
> @@ -92,13 +92,9 @@ fn probe(
>          pdev: &platform::Device<Core>,
>          _info: Option<&Self::IdInfo>,
>      ) -> impl PinInit<Self, Error> {
> -        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
> -        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
> -        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
> -
> -        core_clk.prepare_enable()?;
> -        stacks_clk.prepare_enable()?;
> -        coregroup_clk.prepare_enable()?;
> +        let core_clk = Clk::<Enabled>::get(pdev.as_ref(), Some(c_str!("core")))?;

Ah, more turbofish.. I'd really want to avoid them if possible.

Any disadvantage on just ask the user to chain `.get().prepare_enable()?`? This
way it is also clear that some action is performed.

Alternatively, I think function names that mimick C API is also fine, e.g.
`Clk::get_enabled`.

> +        let stacks_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("stacks")))?;
> +        let coregroup_clk = Clk::<Enabled>::get_optional(pdev.as_ref(), Some(c_str!("coregroup")))?;
>  
>          let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
>          let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
> @@ -145,17 +141,6 @@ impl PinnedDrop for TyrDriver {
>      fn drop(self: Pin<&mut Self>) {}
>  }
>  
> -#[pinned_drop]
> -impl PinnedDrop for TyrData {
> -    fn drop(self: Pin<&mut Self>) {
> -        // TODO: the type-state pattern for Clks will fix this.
> -        let clks = self.clks.lock();
> -        clks.core.disable_unprepare();
> -        clks.stacks.disable_unprepare();
> -        clks.coregroup.disable_unprepare();
> -    }
> -}
> -
>  // We need to retain the name "panthor" to achieve drop-in compatibility with
>  // the C driver in the userspace stack.
>  const INFO: drm::DriverInfo = drm::DriverInfo {
> @@ -181,9 +166,9 @@ impl drm::Driver for TyrDriver {
>  
>  #[pin_data]
>  struct Clocks {
> -    core: Clk,
> -    stacks: OptionalClk,
> -    coregroup: OptionalClk,
> +    core: Clk<Enabled>,
> +    stacks: Clk<Enabled>,
> +    coregroup: Clk<Enabled>,
>  }
>  
>  #[pin_data]
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 043dc4dbc623..f4d03b988533 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -23,7 +23,7 @@
>  use core::ops::Deref;
>  use kernel::{
>      c_str,
> -    clk::Clk,
> +    clk::{Clk, Enabled},
>      device::{Bound, Core, Device},
>      devres,
>      io::mem::IoMem,
> @@ -90,11 +90,11 @@ struct Th1520WfHw {
>  }
>  
>  /// The driver's private data struct. It holds all necessary devres managed resources.
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  struct Th1520PwmDriverData {
>      #[pin]
>      iomem: devres::Devres<IoMem<TH1520_PWM_REG_SIZE>>,
> -    clk: Clk,
> +    clk: Clk<Enabled>,
>  }
>  
>  impl pwm::PwmOps for Th1520PwmDriverData {
> @@ -299,13 +299,6 @@ fn write_waveform(
>      }
>  }
>  
> -#[pinned_drop]
> -impl PinnedDrop for Th1520PwmDriverData {
> -    fn drop(self: Pin<&mut Self>) {
> -        self.clk.disable_unprepare();
> -    }
> -}
> -
>  struct Th1520PwmPlatformDriver;
>  
>  kernel::of_device_table!(
> @@ -326,9 +319,7 @@ fn probe(
>          let dev = pdev.as_ref();
>          let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
>  
> -        let clk = Clk::get(dev, None)?;
> -
> -        clk.prepare_enable()?;
> +        let clk = Clk::<Enabled>::get(dev, None)?;
>  
>          // TODO: Get exclusive ownership of the clock to prevent rate changes.
>          // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index d192fbd97861..6323b40dc7ba 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -80,17 +80,78 @@ fn from(freq: Hertz) -> Self {
>  mod common_clk {
>      use super::Hertz;
>      use crate::{
> -        device::Device,
> +        device::{Bound, Device},
>          error::{from_err_ptr, to_result, Result},
>          prelude::*,
>      };
>  
> -    use core::{ops::Deref, ptr};
> +    use core::{marker::PhantomData, mem::ManuallyDrop, ptr};
> +
> +    mod private {
> +        pub trait Sealed {}
> +
> +        impl Sealed for super::Unprepared {}
> +        impl Sealed for super::Prepared {}
> +        impl Sealed for super::Enabled {}
> +    }

I guess it's time for me to work on a `#[sealed]` macro...

> +
> +    /// A trait representing the different states that a [`Clk`] can be in.
> +    pub trait ClkState: private::Sealed {
> +        /// Whether the clock should be disabled when dropped.
> +        const DISABLE_ON_DROP: bool;
> +
> +        /// Whether the clock should be unprepared when dropped.
> +        const UNPREPARE_ON_DROP: bool;
> +    }
> +
> +    /// A state where the [`Clk`] is not prepared and not enabled.

Do we want to make it explicit that it's "not known to be prepared or
enabled"?

> +    pub struct Unprepared;
> +
> +    /// A state where the [`Clk`] is prepared but not enabled.
> +    pub struct Prepared;
> +
> +    /// A state where the [`Clk`] is both prepared and enabled.
> +    pub struct Enabled;
> +
> +    impl ClkState for Unprepared {
> +        const DISABLE_ON_DROP: bool = false;
> +        const UNPREPARE_ON_DROP: bool = false;
> +    }
> +
> +    impl ClkState for Prepared {
> +        const DISABLE_ON_DROP: bool = false;
> +        const UNPREPARE_ON_DROP: bool = true;
> +    }
> +
> +    impl ClkState for Enabled {
> +        const DISABLE_ON_DROP: bool = true;
> +        const UNPREPARE_ON_DROP: bool = true;
> +    }
> +
> +    /// An error that can occur when trying to convert a [`Clk`] between states.
> +    pub struct Error<State: ClkState> {
> +        /// The error that occurred.
> +        pub error: kernel::error::Error,
> +
> +        /// The [`Clk`] that caused the error, so that the operation may be
> +        /// retried.
> +        pub clk: Clk<State>,
> +    }

I wonder if it makes sense to add a general `ErrorWith` type for errors that
carries error code + data.

Best,
Gary

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
