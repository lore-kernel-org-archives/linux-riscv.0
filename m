Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C24606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iKPv8RJl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kRo4Hy0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:From:In-Reply-To:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=jTEPyWjcgOR8EoSgLjUwTWRGJKTmeYmgj4e/YKAOnCY=; b=iKPv8RJl2PJ1uBn1Y+UP9VT+Q/
	LgBJ+Ih/ZM7G1f9DZG2qOlv2GOwsxvNuST2vuyEEtxM23QiKZubhM64HKwtdUQSffjZzjwBeWB6iM
	pSyzVWRmfzDCG/j7JrTTUti40pysDdWR0BIPNaNQBPUum2nVuCvPcwLRzDF6TDfSdHcS2ucw9Zk5q
	G3YVTxs6t7VKwPeInn4XWpaW9w/AnLlpMTQsSBtTocSvJm+trx6/hsJZE9BwkRte3sEAcx6PlQd9O
	jkvVco57vBdYTOPtEJ4w2MGn5rQAuAeLLYRMAkWS77mHEaSWWjpPEqd1q1QFUIWxoBLdxYPT/Lf0a
	cjcz1g1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOix-000000096Ms-2Nfb;
	Thu, 29 Oct 2026 11:55:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOiu-000000096Lz-3dPT
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 11:55:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so1663018e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 04:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793274910; cv=none;
        d=google.com; s=arc-20260327;
        b=GktyX1s7XGB9vy1c6b8TaH9bhc+/yKgPWf5UAWZR6tiNO3cROAvlOqJxFzss+tRGIp
         ncyGBSMZZFtQKbAGDeUnIjDVkb/tslAP8bY16zgN73cXoOVmLqFg5hmzYTM9MXUiUfjw
         lL6u7KVfqMqYPoGRmute6vpr91n2oN+9ZOpY/XnjRFZGbo22SVZNM7TlSufv7O3UPT2y
         6lXRED6KMaWJtX1sXq23oKDsgIGVGF0MqJBlQPZ5LWa+hAGFOIrQWTUXoIuHXwbe+Bxj
         yIn5E+laydp1AlA7jY63nkR1rUTwanD5CEaKgaCrG3llqy7honFTzR30aerocYGRfcHA
         w85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :in-reply-to:references:dkim-signature;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        fh=17d1xy9qXXbzO3fbQxONDbrQDIGk3Vff8kV/ajKfCn8=;
        b=HSLWFunrO0ba1JqShRjo4AVXvQV/RX4gSBMTUyeV/8j3mXk5tAA7FCcp1sI6oCC1aA
         v75UWkh9Wsfb17uDCCu0YdUniLvYY4QrXUOrC5iQgDDKFoIytm60Msojf8dncoJxNWmf
         wgcIgwZtuI3qA7ErSy3RRPKjlUH8+wWQiI4sK8Rkn2cYGirsJlT4n1gP7l5ACp8I/67V
         YU3BIeIJubR4kJPdr3/VUEInY+5UdHnvsrliCoflclfpjxC2NWgvVcPiACh+knAsNQYY
         jkd0aDV8pZ2qbwRvFVRS5q6b3BNDed5NItdAIZWv8YTZvfvYzrTcFOozdApWI0lGiUZc
         ff9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274910; x=1793879710; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=kRo4Hy0zG7vFa9EUQ52Wc9aeREjIPAO7ZoPDMRtiUv1zygBI70968I7nZyinrMgGjs
         JYRiLdzsovCQ0O5uleSlWNln3sYzrcXJ7PqFK9dH1EwWSpeoO6od/grrKAfqTqsbS4Bm
         X+b73N9RWvHLIpwKH8XzKocVdz707EpjbB1D1rSv+WP6DaQKxi3D+EwMaFgwCJVwDeJu
         RD1C5eCaIQBLrFgGhQiG2LqJcztdkCux1k4YxWytrFSkaXT9cLmaniw7dFv+aNcS732U
         4oJBt6nbhmlJpxVBm0TP0v1D9BHW06Uqsi2qIxrhXC+tJwNub94UrrkiCy24MXOC1Ybf
         xm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274910; x=1793879710;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=ado579o8dIHIu6ym/DamzyatRqZ2PNonhQOs7FHFAFzx2F8dZI8R4/k0FR719Vt0oY
         GLbPn7ySRmtz/2TTTxXmoDt13e45uyfYHH/xB3kTgLW6Bm6lyuTy6s6ukqCnz5DDtNnG
         lYc7jFiW52fmiBAlOkc84d6vE2JRakIIZC3sm6xobNZ6TreHeSJjpy7GfVqkbQ0HkjRt
         jNuNgwXYmuArYSKL7IFAj4k/uYoMAktAioyQWDnE8xzT8L+6odNH6m9NFUxEztTBGorx
         7KtcppUX6kGwL5E5UimwRIdI1vdeblSGJ6DfjuLp8WhvZR99URGE3eZMEARKobGmgpHr
         3dzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVsJQnbzX8CgpAAMRIG96071RGcN+5AmmehLiuJGkHfUs60v1kFodSvit6sEzJvDCniGNLEvbOdfz2cg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIirI55tZgCRSM+Fbxq6SNqqbXis9zFVx2tC6LXOWUSshtk3Ox+
	EJCDcdVo/gd6YvVmeUkIa1R3u6Tho+sYxxPUYdSR9Y2H0+p3t6YLThHEcKO16i9cPRU+DvztKBT
	coLa/L202LXuQrn+XUu6zBuooERHizKx/vUzSXihdpw==
X-Gm-Gg: AYBFou0rmFdiTChdWTd1Txu9SOwW+jADfGJ4QPz6jau8Wp/D1h9NHOC85RA+/AymF5O
	MOWUWSsKuXCousNSAzTR1g8D866VIzsC3A44UyIvkflPNdFOJe/wkom44Tk2gW9dp3IxtQgWJnn
	b72BEtGaNy9mCGQOAcTmYrxWazaMwp4N9897Oc/O/hHsznLr3dNOyu5TCNLJXwHCA7OS/pCV2fn
	4SRPodwAIG/mK4Fb0RgWXWyvOPdiAIyKCUaTrJ4Tn6RD5xKe5LTXbUwOlmWwV0NKAXYxOwve2Bi
	k03CfFf8dKxtCu3H0u4iikr7/cdAZf4xEXb2mBoyUa3h4S1tF2DElMEvogxHf+xkcCxmir66ctw
	Wp5gahn7tJgk6kxSVDJdJYUge666gizMEaTA5CA==
X-Received: by 2002:a05:6512:1592:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5bfcad27d03mr1811204e87.37.1793274909843; Thu, 29 Oct 2026
 04:55:09 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com> <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
In-Reply-To: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 29 Oct 2026 06:55:08 -0500
X-Gm-Features: AclHuK9_AGd24eF3VOAo28szXNgJA0RFlLmIywua3jpx-rZ6jgflVyqTuZQeovM
Message-ID: <CACnXVncN5yT7Dmqom6m1SaFO0_MjXeoScTRfGUZ4RVdZKhAnHw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 00/11] riscv: add SBI Supervisor
 Software Events support
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_045512_932669_A7CBF17E 
X-CRM114-Status: UNSURE (   6.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Himanshu,

On 10/29/26 7:38 PM, Himanshu Chauhan wrote:
> Hi Zhanpeng,
>
>> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
>
> I See only 8 patches out of 11.
Oops, I ran into a Gmail smtp system error. I've resent the last 3 patches.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
