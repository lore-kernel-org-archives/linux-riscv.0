Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08ECCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 22:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZeMzdhiVPRyCx6hbKhkRiW9tgXgX2RtTVNAylFFmD0=; b=296uoGPv9szxrD
	AQQCmG3WqCmve3Qm5N9T6VrHZYX5C6Gyxy4gDpx2YawEORK8VQlUHgRPrcH+jR95h7xclj7pn84uj
	aeGCbOb/WdLxTcVJ/VV+uPpd8VANIPUVzq7suTdpfNDsyz3dmUwWNVoXi6EGQajbItAWVGkJJ2sox
	FFzLvjkxErGbcY1Jt34Flz0+pa3bLcsgCx6aPYSdC0sfhzRjktOEyyVjVQGaBrifAjSE1hkHIsksz
	jYgOUCYLQI4XulfplmVYlf0U8N3Afpckl+kgB8zPiJc6DcilBO1uHDL2f9Z6ZEQbzj37vFvuigWJ+
	NUcwc65jDbXVsOW05tgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8g-0000000Ehxt-1QtH;
	Mon, 13 Oct 2025 22:35:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8R8d-0000000EhxC-18ly
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 22:35:32 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7930132f59aso6306222b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760394930; x=1760999730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtxL+uYHTrxBSaf2VJ6n4z+smdSSDd5JBl8pS6dLFSc=;
        b=Q1El54ry1faGdxRhfXPhdSmdJmFo91R/FZJUGLgxPjcgB7bc7/PcIWmOgvtFm5yaB3
         AmVqXlI/o0yS9LibUJqRtLT2lb04N4KAaGw7vS+k1+BbHJPBrpy/iBCL1V3hnt815bSN
         uQqK0eyMuEvUQXGPhxA0M6sGPQqKovjBkoh68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394930; x=1760999730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtxL+uYHTrxBSaf2VJ6n4z+smdSSDd5JBl8pS6dLFSc=;
        b=hz/fYjtHRHEOmfliXZHlRhXDi+bQH1GMP9wXTQ6ZFCty8kxALaeOzBZnEBxeD6icw5
         HR8EbI5gT0caFk5WlwVfS6fudZwyzPOFxejLWKf5WdEnElTfhViMKuOYc2U21Q4abHwK
         iV2me1uF3N8OpoDUYnfyzbbkp6EkA9WQ87E/UWfceD5POjRiRDMIZjnHPv3MFvIP+OE2
         TH1DNnFUGzN+euMsQrxa7KuP+4L1Vo6H5tUSJ7BkmadpwjqT+9W463lFdOYEdCuHop7f
         lgKwGIvf63l9acotJ+gRuPDuWOGsLbO8cX6cPc1xamnUk+7YeZeNUk6RUwOZ2jbHGWfa
         gckw==
X-Forwarded-Encrypted: i=1; AJvYcCVeOpW3u5XjAniDdCk6mt/6VVv3nj4YgOCoYX0MhT7UgppB6ysk+K0YYsLxi9xQnO4s5TafJYiSIXkCxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWJJmZngqcHMAP5BOYSQCpde5sq0Q8Mnp0St+1YJ53QXQj8jBd
	NV8EI1oifvKNcEaK4I47nnR1y8gsfn9PnSRU/1yKBoxG5Y3YgSTZQyDS8yENp+IUO4XaKkgM9OK
	Vbpw=
X-Gm-Gg: ASbGncvUNOkGlMSjpAaftZqWyniFf6ewdwuijmS2bNqHg45pUPB23N7vEXrjjb7xLtD
	MlPoh6OQZjJ+kaTrgec8VicmpTNw9pifSK1f2+0m6zX/h8Oobczm7C9Xw6XHgPqqX3SWZZh5tOB
	8mX4Nf8+XWQ9aY3lZepZrvW9pTKLLXeTYkMDg3TYVNDizPRZUJt9M+iR5gThJjmgvL+SR5u1f8G
	5c7Qtwdd9IfJwE63GRAqQyX42FYlJNafvgowo2WPaHDE6VeFXJGA/WucBfRTeAgy4yyPxqTyUDk
	XjUKa/GjZ1fRZa8Cb71jTq1c+zgps/F1b5T4+YPX0pwHN2LpsZGqyiYHkZRbiH8HR+77pcbyEdl
	qyG+3HLVykPDxXTyALXHJ/oZ0AXB8srJ4pcjLXe+dAwh0ipLvGW7HM4E6sTJ8OV6pjrph6DUThY
	wZx4GvqRuvCw5nMGrMHmo=
X-Google-Smtp-Source: AGHT+IE5wcqooTlgn6IYaOasxaTcJQusyZtu+GHW1WD+9Wxfu2jkgeECuinUYl1Ywz83WDES/ggWxg==
X-Received: by 2002:a05:6a00:2302:b0:781:2177:1c9b with SMTP id d2e1a72fcca58-7938723c480mr33260822b3a.17.1760394929942;
        Mon, 13 Oct 2025 15:35:29 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bc18c96sm12806103b3a.37.2025.10.13.15.35.29
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:35:29 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27ee41e0798so75597005ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 15:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhaIcpYroz2VX6kWu6+K4MGF5/DrbqMWs19AnjN3hbxo/1AR6wS1FUwGSQ2Vv0WQA03STA0ZhQmc5skg==@lists.infradead.org
X-Received: by 2002:a17:902:ebc5:b0:267:bd8d:19e with SMTP id
 d9443c01a7336-290273799f8mr248133945ad.22.1760394928761; Mon, 13 Oct 2025
 15:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251009032838.63060-1-cuiyunhui@bytedance.com> <20251009032838.63060-3-cuiyunhui@bytedance.com>
In-Reply-To: <20251009032838.63060-3-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 15:35:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRp9=5yxR3Q1UhJhBS-wm59yssozKi55W7HGk+S94AjQ@mail.gmail.com>
X-Gm-Features: AS18NWD-PlH4jDf4beOYtPWdSx7chQ77jPK1vKggaxR4OltLXyHgtJF5jyN2qPw
Message-ID: <CAD=FV=XRp9=5yxR3Q1UhJhBS-wm59yssozKi55W7HGk+S94AjQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_153531_328458_26BA956B 
X-CRM114-Status: UNSURE (   8.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBXZWQsIE9jdCA4LCAyMDI1IGF0IDg6MjnigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBFbmFibGUgdGhlIEhBUkRMT0NLVVBfREVURUNU
T1JfUEVSRiBmdW5jdGlvbiBiYXNlZCBvbiBSSVNDLVYgU1NFLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyAgICAgICAgICAgfCAgNCArKysrCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgfCAxMCArKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoK
UmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
