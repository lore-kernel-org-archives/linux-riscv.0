Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFDC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Es4HFpklaFP7Xj3VOQWQx2YNQ4PeyO64kLyvAPWq76E=; b=A7jP8l98zT6xSa
	mx6yOE3tEJ2Ag/FCHsM3GdroaNBEkJjeZZgtyN2CF0oypivDnGt4cw2HOQBB+Izb8m237eQofXYnc
	W+5C93m80W/J6uDaBTRUv+XoBwHGUwWeKcHmlkppXOxHgRa9xJUJMiexsC/FVRtgh3h5S1niX/YnR
	EkH8iUuQGXS/HRixpIL9IfNT44br5mLbgpVlRVRVwy4ubf2dinyTCO7nIFYVLJmp0OH/mZBiKfpmM
	tR8f5aRpU4PXokNvo0UWmqB4Fg+bsG1APzZYwud9vEnot6RNEpCq9a35VZr2YbVJKUVYm8UuQD9i+
	d7+Psa42jnGyh7q/IvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBKy-0000000EbBU-2Wsn;
	Mon, 29 Jun 2026 12:43:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBKw-0000000EbAl-1U8y
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 12:43:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TB5j8Z2729668
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 12:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=; b=NMdpH6YDeqCM6Ng2
	6l+u1JT4xPqzvjoTIliP40I8uS1vyj+L87A0s/qye2JFugwtFubIXUyRV7TGDunu
	R6AT7ytIJgsoT9qLUDl4wVFliJkW4IuqsH8CbCK3KeaS2RCkVYPYUJb3E2XmVf/n
	n3hDCcBxNJlzKeVUAMJaWhtjvocMm4xmBllzsNmFZBHpLfh9MoNKpAQANg8pAcNm
	TXF0zOy0GX+9LwYTaSDruBciQSlEcjcnL39ePRYOwyzIFsHATrj9EfyXaS+7TQfj
	LXtLZZhSE0HawuL0/q6HT7LO9lTXKMaK7kYXAJnJbjWc2xRjybwKZ0RF9NkF8Rk6
	8fCEwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3qha8bbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 12:43:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fec599568so1562899a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737019; x=1783341819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=;
        b=abki5I7De590Uhrhp2HXKtxsLrHAx3YkCUPVBCAcZf7Oh5r2TAroZeIw8ePLLmn3wO
         o/MP5tEhkqO8f1TDETxm73HTFvngWf+2mPMrJzPxC6nvcdUkOFNhNTya3VMEWKEHpaRb
         DYxENETUscoxzLD+o+Zd4EkZkYdDJHu+qanbEMFlzMENVaHLsZTcKMBeG/Iij/ZJDBUO
         M5hcIE9DM6lFSPGAJRu8zMXWJX3KluXU/0aI1zUcP8kkgyC4mvB1d5FjubHoP66/lYKc
         2qXXwMRFyb7X80vNJ0da6He8L2iWwiO9B6suxrwzc3gwGvgfUjNjAxjtQKzIq17wR/E8
         d3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737019; x=1783341819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=;
        b=GIC/QN8zY4PVMpDUGb8l/3uVy8718wLmhnUH7J1vqY/KLmUOe06HtG2B3DqQIrZkwU
         7JSFecawwlbeFsp69eMkJS4umyfVHH9N6o4l0ADsp2bGOD7A+pmc6yofpM5cQHfGVOID
         Vlx5gGClhZhGwS/4KmZMrILfznEOUSuKrB3Yq49bK11I6KwjKislQBZWHleG+DPWrkVt
         QYVm+MYw/mWOC5ymA1XSEEQl/y/Nknbdl3MC9es/sjBkBKGHI33VoDHq5Zd6iHdGhAYX
         mLn6txVC17UxUjoHnO9lGMI7q6mm4pAjUMxLXvmVl1JYndCLM7OrNIRUdPu+a9Tl+4o9
         u4KA==
X-Forwarded-Encrypted: i=1; AHgh+RrK3ny3gbHjMIR8+MNoQgTxQcLQFg8yu/Zsi6JMJOV0vYFJbXHR7aZ/iEH7ld3FAYWZZKAyflcascW0TA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb6z5kU4kxnkRZZ4lTLuI/QUR4Mj7Pl9npsZ6+m0TKJXCe06z0
	vIA1l+sRJbQyflJ6Fne5EMCoyvo460uhThQECZLAGR3kSI/ad8U00kMDtsY1h89GODLO37yTW2M
	qmVD33NLp6hlg2BvtkoKma4YGBLbDFeFKllt5wac6ipJnsC9bpFu2IIbhRgOoIYgyI6ljZIk=
X-Gm-Gg: AfdE7cmCQcS44/kFGNU/zk4Oy6Z4lL/Ni89AXaJzhR5EVd4QKsWh+Ck4ZR0RRIXgQzE
	cmOPCptRhSwhC8FA6xF4uLU4X4n+x7RR74l7A9WFxE3Vw1J/rDsyHShXDXBgvUX3oFfs8WiSbVA
	A+K+RtjnVbYKREJr4z0SmB5SK3CQaSLXDwWXsbLsCkFVCBSPXPmgYKkOFYSHCW+xcwVaCUN9REJ
	ch7H7XS2DcZ2lbOTR/0wXF65RtENvzC5FPO/czAwsifJ+yOtaGqCRqzzrB4sC+riz7uz8VrakhX
	jDhdiTxFDmserDRdt4oYOj9ppbIoWYO2KTe5/0VGE26HQ9h9qrYdxocnI3P2tdiPZqFXzyd/uqH
	ytTdf+QQITGjL6UZRjTGc5fNaBWuggHP4uRfduYbb32J137IyfK9kE9qWhvA0VtOCrVhp2RWCQO
	F0XA6LQg==
X-Received: by 2002:a17:90b:4ecd:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-37f9ce2229dmr7491028a91.30.1782737019082;
        Mon, 29 Jun 2026 05:43:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-37f9ce2229dmr7491002a91.30.1782737018606;
        Mon, 29 Jun 2026 05:43:38 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37eaff87f61sm5602580a91.17.2026.06.29.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:43:38 -0700 (PDT)
Message-ID: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:43:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
        Abdiel Janulgue <abdiel.janulgue@gmail.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andreas Hindborg
 <a.hindborg@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
        Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Jens Axboe <axboe@kernel.dk>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-block@vger.kernel.org,
        netdev@vger.kernel.org, nova-gpu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, zhongqiu.han@oss.qualcomm.com
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
X-Proofpoint-GUID: _f_iKXNKAUlKZlGqoa-anK0HkbnRJZIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfXwGGGoeG5qL8h
 EA8bzZeCLqG3K/ca7Z7Vy1eoQM6yR4Wec02v5QND05Wbm0TASTIIG3AzCtQhaAvW3Qq1j/MIGJl
 MiVfen4jOU+By6OwMT4uDsjY+zMno4cvwy5SEgD3Lp5i5DG/S4CIukBok3sdqtQTnJoE46jcG9j
 jxpKPjMWakIE0/3WZI4EaBv/AgKVCFXXRk/x2QTbrn5gbtgc8w+VxjJ3/GgM9trVAIiZWg7D94m
 GtA6u6EEmCdxO+ft3Aqs1w17XseCivjnVbTM3j54JYwi3ZAtzqTEeuJ+2jfrCZmhpmCNHkI7lRp
 j9ePg9t+UeVhq59vh1xHL8aWEFUGc+uv6OR0MY3ptjfQ1mCg7zMHLhoQBMF0eZdnZOjGWIra9i5
 fUDajfI87zvFZ8cuuYnNhgqGkdlnp0G0Qpt4PzZcpNvrlh74xtNKGJ6UpwjxpQr9+qp1Ya1Egv+
 Yir9Yydrid/Wur2neUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfXzGnRSYHO/WLH
 0mi1zgVFAtpjv+NdpQwAFMDI2c64yobHz1LaZGOVBUvG3YM/KJ6x+cdxdM0C6ncBnJPQGZMpJLj
 fP37ZP/ZQ/99SJ7GKezzHxWEMq6eezY=
X-Authority-Analysis: v=2.4 cv=O9UJeh9W c=1 sm=1 tr=0 ts=6a42687c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=ecjbvcZnrCEMvoAzKiMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _f_iKXNKAUlKZlGqoa-anK0HkbnRJZIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054342_512923_F821D1A1 
X-CRM114-Status: GOOD (  16.04  )
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

On 6/29/2026 11:38 AM, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
>   drivers/cpufreq/rcpufreq_dt.rs | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Hi Guru Das,

> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 10106fa13095..6f83cf8955a6 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -6,7 +6,10 @@
>       clk::Clk,
>       cpu, cpufreq,

The change seems reasonable according to the Rust coding guidelines:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/tree/Documentation/rust/coding-guidelines.rst#n44

     "each item goes into its own line, and braces are used as soon as
      there is more than one item in a list."

If the preferred style is to place each imported item on its own line,
shouldn't imports such as

     cpu, cpufreq,

be formatted similarly as well? Have you run: "make LLVM=1 rustfmtcheck" 
on this change?

>       cpumask::CpumaskVar,
> -    device::{Core, Device},
> +    device::{
> +        Core,
> +        Device, //
> +    },
>       error::code::*,
>       macros::vtable,
>       module_platform_driver, of, opp, platform,

Likewise?

> 


-- 
Thx and BRs,
Zhongqiu Han

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
