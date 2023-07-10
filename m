Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C68EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmzjGgYH90kbEsplcs4LnqVwcZ4a01wMEPP4G8BKpdc=; b=KQxKWQ+uNCWroVcwkrThvt+E4t
	X8TKqK9WNtNYUJJeU+w12e8ZsSo7RpX/iSxDoFlsyCDkwF7jQEryUGil11nN0s7EDAKFKs13FiMq/
	xH9/8wstQ9zNt7ozqg3DscR/+ZV1K9uvH759fGNfxG3RaobDqo8oXOy23/LSEewcSJMNOxqqtxw28
	MaujvtsyCCLj87aO33Thu9YW/9ZzfGBKsqrf3gXEYx0lF+qrn3gNfk/oB9eNsz6pO3hdui4CCkMlI
	EBs5Xh73KfKiiQqcdbo0Tx6BtTiZc/kYfFaRAmmQE5qo3k6O7nwuiepJ72L3muGFMbetbSr/oNIAj
	biBCSk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuFj-00CHSv-3A;
	Mon, 10 Jul 2023 17:00:47 +0000
Received: from mail-tycjpn01acsn2080b.outbound.protection.outlook.com ([2a01:111:f403:7010::80b] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIuFg-00CHRz-0z
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 17:00:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLdFMV2kDdRRFwMVZ061TsZ9MSlnxSZNx54I0jvVaNJhK6lLYU9BzJzkLxFDfygJax3l+HjY1WDTHN+efX6BCi0htyi2aekPDoqezMauBr7+1X7vj7c8wc8uJPM2d7qbNz3v8ctHNVOKX330n1rPcacTCagimXgmbSJgmEXBqHzl9gTiLr/S0Za1ueq0GaRqVlqrJ/4lgalT3a6/DcwuCnU89hHhb7UXB5ppRSPoT/jB4armd35Rk+KClwigWhFpnvqVt3VH2O1fkik0ZU+Gpbo16Mwz4beSfkrgYebfO1/kcfr2fm/t/Uo2+cPHRLxkBcSiDmPEZpJ1lHtETOuAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtXbyaTR1eSXD3IOgjkAQzVYxlRNgHriDX/4FLu8tx8=;
 b=WaUJXkc2OALY4LIjbenXgB9XH0USomtAtvx8WcPzoab3xdnYfnMdgon7Auq1bU2l2NCzwKr0I/Oa9vh2Hwh7wEy6S56hXHIIlgzzHVSyiE8sEyf+ge8YE7jF8ixXdI1TOmZqjLkMmQfpf+T7GermrTAJOUPmPp1AB8AUMGhukb3DOh63hmTXZe0/sNmvYzCrLqroKR4xxGDG5jW8v6Vt3qfQPjrNJErLH3D0r7D5GL4/RynoDSjhwyDnVS9Tv3yicLAlLpfv5tCJwVxNFPBhd5MxU97MtgL8+XrDzeU71GTO2riZx4tKTWUs2UVsYO+NQ9x0fG7rGFNsCqJXPd9m9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtXbyaTR1eSXD3IOgjkAQzVYxlRNgHriDX/4FLu8tx8=;
 b=qaqHPJfsiTy03A7+Ch3Jy5WQ2ke7jZbYxl58Crnah2yZiLPzcgfQD+dgqaYgmIxq3SNBxYoNP4lE6oxvfemGCEIzOqHlg1NF2g8KJkNjDxFF7231P31l8PFlR50rCw6uk7cucXfG9HLDV90ki/yGzDRDWh7AT9AzSYytDmVzkbM65EjQZ5wwzV5Ef3t0gMtdKwjmCYegi/LA1xcH4kEJviGSNSCaIIAJGCWbWF866c3NTd736m1o213NsNKyLjqSD+OlkkMwBaa6QTs/caEkRl1Rt4tHYRNJypBe68F1ccn4tPUeyHWXxNLJPqNgxe4mUN7uFJgs7BM1yI14C01d+w==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by OS3P286MB3386.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 16:46:13 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3794:d6cb:1aa2:342e]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::3794:d6cb:1aa2:342e%7]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 16:46:13 +0000
Message-ID: <TY3P286MB261191B29FB384110094181C9830A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Tue, 11 Jul 2023 00:46:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Cc: wiagn233@outlook.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH 7/9] drm/verisilicon: Add drm plane funcs
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-8-keith.zhao@starfivetech.com>
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20230602074043.33872-8-keith.zhao@starfivetech.com>
X-TMN: [ckAf4fRsxL5VXSkCBt9Dec8pYHmYIjKPXdK6cpxYssf8QtV8xRsCWP8qdmovhcE1]
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID: <828bb5bd-5399-d862-da50-777a18abb1ae@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|OS3P286MB3386:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4cd8b4-d2cd-4069-232c-08db81652ba3
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TXxo7p6a+r8y0O/enmghtvt/7B0XQiDFw97JQYi4R3wn0/kvzOy2dBq5acmuwq27m8KXLAofj2BZWX7YxIKQ+GWUfrh043IYOGP+V57W8/xVPBHIVFjlCrnDgtrcYE7Iei4LYfcpcIkJu42h8vcVCKNJ3U4TvKvGRHG52XVy0gwFm0DQPws+ymXyF8BO9NHo9J74TNq0ICYiZ1G8Azs0Jkxb3icTk8dn+AIVVnJsRR/YJPPmHTZ16QLbX42PTRtvE2OCgf+C9/SP5g8CtQK6PGsbLptVZo/OzAEt0qhckomt0D9PO1PBQSB8sOMnqHMXl5BPfm3WlonmnwzNjJaQwg2YMjfBBZXPA0jkiNafRUouSd8W3FH8ihBwrlOfFzMAd7J99kSfDZB0/H7ANumP/qPMzYTzYJ2aIqnRPDer11W6BdeubfccviVcXmTNv/ofmY5ssRsHINccmcMNCNMh0sHgSZjlIqXu5PXCOcFTwPRiucEy0RvCuMrdO89Tk6HUcxd+4RGs+CwiX0s5uMYCA5suvcgmpo92RWRjK4en0e0Zg6PJid2LS0yY0uz6bSk3obEYcWvj/6jYWcoZefqMj7qb+saqYAVihee/uFaRGsWKhuJye3MVA+6zZk4yfwcrtgw7mH6POItXWZZnOnDdVcwXQzVb7ZAUi2ptVa4uDY4kjuDlvXFYZCBSaDHHYg5z/C5sf+9SEb5HP28nsclTJLJIkbpvYZxvbm/yqyTTWnSfnr+KhmMzsRG+PN2345ZhR7E8gsp+eJkdgkMiqrg9l1Jsl1QHVS9d5Y=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: isM5A7bCylkw6gTy7PmxXGzJuYDahYQj7e1eU99ITvsklzRYvcJev0aAGj45f+w9vNY2PEUnakjE0oSj0v1RjLUNA01QAeo7bcH7CeDukTFRhpwY1RxQubKFarixEtnsMz+1YMc/Y0uw9I3IICmfvWg5Zo1IRnJ611/E6mpiXAe2bn9BfJMAbZk7IerKpaqMN305T7a9pLpefFjZEVWFDq8Eu+kmsbF7wGYZH+kwWD4vNwD3gy4I6NLBocwmSxOqZTrSTGh9th/hThMffGn1AqvNhf1p2yAss1SuSiVBBP/Ddf9y8NNkX/rnehHq1KZBHqFSNh9dvXrsPpBg+gN8NBrvg0p6fliFi5LyC6XNIpvjdrgNqdIR26b6SR9TDkVniw5kzucmygEPuXbcPuO3ci7WLAuiHMSyVgkV2UvqH9cZ02oaa7n7scwLXA9llu7k3ELQqxhU1KhCIZAmy5BrCdYhB3gVeFDTJSxHvAo2yuk1Z5WWerVV/k3wEmNOU26vrJ3dETjTIF0gjlGwP/1do7oLfuiEUrd/gbOJ+PoP8g0aEHojyqpF6FssBpWIPS/uJFnWCiTWvz81pBazrJnsyNpmnfadGpVYg8lqFpkIAb4XP2qrsdpuo0qpZ2C+jGrd
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RytNQ1EzUDVRbnhYK3Q4R0xieVlVY3ZRRFFGaktjMzB0OFJMSEpKQ1A4S0JQ?=
 =?utf-8?B?ZlBDaXJhclBwU05KUGdBdDZHVnZxNVcxZGJGTTg1RGxYYWhxTTRUMUNnSDV3?=
 =?utf-8?B?ZnhpdEZLK2FPZnBid1ZSSDFnUHFURW1UQUVVdWtvSDZUWXZKczh1WFhDN2Jv?=
 =?utf-8?B?N3dRRVhTK2N2S1RDVUZuUzFYU29GRndwWHBXaUZMNHRRYTFHdHFEd3R6d09Y?=
 =?utf-8?B?UlpWUHJWbWQzSHAwaXlyRmp3UW5SV2JnMEloajZjOHJVU0pBclZNY0U3Zm9X?=
 =?utf-8?B?alhzalpxTUltV3MwOE0zYWcwQUpPK2tUMGpHMXJmcVZDYkQzTlRpOWlEaU9t?=
 =?utf-8?B?Z0duTlJYUXRrS3pKVUZkNktvdHdTdHVEdUJ4dE9oRzFMU3lFZzZ4UVRxZFZ3?=
 =?utf-8?B?N0Z0TGQvbEpYZWZGN0I2WjhXMy9xa1I4WXA2cG1jV21FQ2h0QmtBOE5mZ1l6?=
 =?utf-8?B?SjcvcDZRLzdoM1IxOWQ4dkxhaHByajVGL0ZicWtCbmt0NjVtd3JSWU9YUEc5?=
 =?utf-8?B?U25lYUxyZ3EzTWFQd2xlT3J6cllSazNaanpOaFY2Y052MWdFUUJxajhiK1B2?=
 =?utf-8?B?YnVndFM5ZDQrcEJ1WlZ2b3ZFMGZiUTBWRzlPYnJacDZiSVhsY3gyU2tMbllP?=
 =?utf-8?B?R2JJc2N0Ym5IMFNHOUFQQVBZTFFkM0hxQnlnb1ZOVjA3WXcvYWovNFZ3UEpo?=
 =?utf-8?B?V0U1eVI2YmdJdldBdTBYckJ4Qjk2UjBOYTVDcFI5ZlltaE9xdUMxYVM1MS9B?=
 =?utf-8?B?SWNiS2NLSk5mUm9nT0E2d1FtcjF2UGd6a0FvZUJxbmxzNlI0UjBNL3B0bTFR?=
 =?utf-8?B?aFd3dnpTWjJsZmRTMzRFaTcwNFVaanpXVjZ5Y1greUw2TWhPUUF1U3lkTkRw?=
 =?utf-8?B?cFNmQXNQWEJkeTZteUNjRk1uUS9jRjhpUTVrQ213UU9XU01wTHhEa05DcEg3?=
 =?utf-8?B?cEk3cGVTRENJWStacTlBYmhYaGNNM3VtMmJjWHZKTVBobDVlNTBJNktvWGVi?=
 =?utf-8?B?Ri9aM1NDNzlaSGVSWmxrYU8xeG9rS1YvNGV4cE4za1pEcVJjbytQcWh2Y0VP?=
 =?utf-8?B?UVh5ZFJMZ09OZTNDQ2NVdyttbXJNSmZSblNwM3BTSmVuZk5rSUZ5WHVTUFRV?=
 =?utf-8?B?R1dTM0tsMVV2Ry83Y1gwb0Zydmk3dWhUNGVHVjMyenZsS3Z5bWNhOFYxOVBv?=
 =?utf-8?B?dmU2aUtMOVRyQUxxVE1GZ3ZxNXVBQ1FhNHIrbHVZbExGK05FNWtyQVpjQUZI?=
 =?utf-8?B?Z2NQT2dBWXpjZTNkQWhiZzJLOHZzMEhZN0pSd0ZyOVNFR2pZRGEyL2tqYzdV?=
 =?utf-8?B?QXpOVnVwQUQwMUtPWkJnQkNpUlFVeS8vVm9ONE5VazhoVzB1ZDJDVFpFVndW?=
 =?utf-8?B?RDNoQlNFNHdwRWJsbXVWSHZpY0I0dGxJQzJrSWgyaC84am8xMHJNNmQrSXk1?=
 =?utf-8?B?UEswSEhoYW1RQ1Q3M25ab09MYTd5cXc5TVI1ek1Pc0t3REpUSWVTNERvZC8w?=
 =?utf-8?B?dkZZVE04czBheGxNVWwyS3BIMlJ4azVObEJ4bnk3S3JzQlpsNFZ5b2dvME1Y?=
 =?utf-8?B?bnhydWd6MXRpbWhwMVdyNlgxVjRCZFJjUS9QbG5PY0tJZnpROEV5T3BzRGJq?=
 =?utf-8?B?NDhsbmNIbWw4dXRxSFlCTzRmanc2blJ0cTdZMmhaUGFJM012Z1BFRldKSFZi?=
 =?utf-8?B?SStuYWNpTXFPTFhYbFhUWlVOdTRKK0ljaVFZbG16M00wVXJxYm0yWk5RPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4cd8b4-d2cd-4069-232c-08db81652ba3
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 16:46:13.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB3386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_100044_361426_25F507D0 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Keith,
> +
> +static void vs_plane_atomic_update(struct drm_plane *plane,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);
> +	unsigned char i, num_planes;
> +	struct drm_framebuffer *fb;
> +	struct vs_plane *vs_plane = to_vs_plane(plane);
> +	//struct drm_plane_state *state = plane->state;
> +	struct vs_crtc *vs_crtc = to_vs_crtc(new_state->crtc);
> +	struct vs_plane_state *plane_state = to_vs_plane_state(new_state);
> +	//struct drm_format_name_buf *name = &plane_state->status.format_name;
> +
> +	if (!new_state->fb || !new_state->crtc)
> +		return;
> +
> +	fb = new_state->fb;
> +
> +	num_planes = vs_get_plane_number(fb);
> +
> +	for (i = 0; i < num_planes; i++) {
> +		struct vs_gem_object *vs_obj;
> +
> +		vs_obj = vs_fb_get_gem_obj(fb, i);
> +		vs_plane->dma_addr[i] = vs_obj->iova + fb->offsets[i];

There is a dcache flush operation here in downstream driver. Is that a 
cache coherence problem?

Best regards,

Shengyu

> +	}
> +
> +	plane_state->status.src = drm_plane_state_src(new_state);
> +	plane_state->status.dest = drm_plane_state_dest(new_state);
> +
> +	vs_plane->funcs->update(vs_crtc->dev, vs_plane, plane, state);
> +}
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
