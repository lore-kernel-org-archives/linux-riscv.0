Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6154CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1BySyupI3r/nQqI8naqH5/Cv2IxDZunuSWeay1332Y=; b=3dzO8+b+EmmWvv
	QCtHgw8fzxOfUDpXinlNPnxY8bz76k3J8S201I3408qRZxyOL2iV69LJ3zF69v7sl7Wt1HM/YThus
	Cowu/YXO80DU7aeSl9RTqxjNrVLlRvAyvefmt9IvzEuM9+hLCkcPb+iNqC46q6Yd1AGTEQ9V+Kfs+
	05caYRX8DdzFpU01t1P0eOfhquySmTodeP4jyi/SAB2WlMyera2zG7Wbv9A+bLRHafMeHbA+fU6sv
	VY27MTdTv8Zz2OHouprjVyw06zJcJms/sp+IE4cE3jHGZzTqfkydrU8b+qeCA8ReGW4G5oHIs7zGT
	mb61UScPQ7qTv/fMi1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pob-00000000KtK-0MpZ;
	Wed, 24 Sep 2025 13:45:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PoY-00000000Kry-11hC
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 13:45:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3f2ae6fae12so2812414f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758721544; x=1759326344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Si08GYvs7O7On4M1lZPat5JwQiuJTzJsw49avbAJ8Uw=;
        b=kgDw7cZcYKQf5QRqV1FEPcg3VYVMhjJfaybH9pYLcaK+xR9VchQ/sBLzny+ljCp8jv
         Qza+gUI9n+dB3POkSMdDv1BTOIDZBEuR3y8H72/5TRp+9H3xIyi3WPdBlbUfzVuFXDLg
         N4X0CmApcN8wql4R/CACMH8jMFw3sinOEJytZI28EnAkSyOMsc6B9PvMB6OPmVaTT00Q
         aijIENPT2yG2GAd5S5umfzopO2gKO0+gOg2BDGRIxE5dQJWwGE3uD52xTUgLBqlNmj4u
         3WUziFafjt0OaI/Q3JHVzP01CQ/uN4YZ8LoOfhuuqjlKv09nEiGJmWtvFsZ6V8Pg0pRc
         EeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721544; x=1759326344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Si08GYvs7O7On4M1lZPat5JwQiuJTzJsw49avbAJ8Uw=;
        b=Vr4iB2Fo92PSzk+pgXePr1i3OnURR5Sz8qU84ZBRHii38QSmXh6EVBlK1yYnwVRKDP
         VThnaN8KpJGY9cDDP2mANXfoZARqNYYiyp0DtIj2YihatDJDB7abCWIAuQ9skhg6EL7J
         4VnYUuA6TK0V0/yg4TcUL6678LdEQNNl4IWyT0XGlWZ6Bu8UYeHxyeitryoZbKxyeoMe
         uM03IZ6SD9kDzdMhhTkhJ4dfMc+UWeASjMTNuMoq0oLvb+OWAtj7KuQIOG+ufMZf2GjW
         4zUBC8Ix753TRP0Z+xQJq0bUI/7AY8s6BUVA9kFExshVduFjKsIsvwgv4dxUu4fFkBtm
         zcUg==
X-Forwarded-Encrypted: i=1; AJvYcCVwerZ3BU09GK76RT1K71qeSVa/hkcYnlGGULRY4WcZqCerA1NEKjIE3XF5zem4jv9eKgRmgyWjR8l1hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOajQMrUPN2dRYz1L8+QgARHLgmuGpGnv7DZn2ALpTWQQTXHX2
	ElNnk9PYUC4dXHOJ1uHVYjbUb2jIKdxzITfZT/X21NFzPQH1X9nX9ONzoQr3oN5p9yo=
X-Gm-Gg: ASbGncthYXcYLMPjUxY5X7TJTQ+P6LxrDcDZDJEPJ+ZhZdLwGgZp3jaZqoCL4a01QP0
	JC2N9Cotu4Evl7jCANZ1PpmusylD4zsHXe5PVyJu2315JyeM7nqwDGrmRYcvq0aZexCpLoiXxVH
	04RklNGVtlW5F4sT6hyoZ2wbcqTeBwozbp0Fglm6o/S7zpaVKovkgarf7K/o7eITvayKd1UsqZh
	SEAB4i3svG0EyoWc90afsFKvLAzGpdSmaONCRl/qr84Cb6FkevZzQ0k+hBkO4u9GN3eGDa0X3fu
	ojHWyijEpJ86N7LiibWSgznEt3WWvdgdKpGLA8tSq8QEkF4lH4WzGO5VDnULC8TvjJ4ayoFUWQt
	szBbi6MSvzEK/wWlpzV4dzZRJN2fsFZrM/LVh25/KX61E9u4pfslrCU1WpHwwv2ElA6XZ2TzgwU
	ch3m3++LX2xYMe
X-Google-Smtp-Source: AGHT+IHMbJb58nATRmai0WS9gfnhVJul59uJVjNVhSmasVwwjHrrbyIG7ZESwXwPwm4dgPq89hsCDA==
X-Received: by 2002:a05:6000:2204:b0:3ed:e1d8:bd68 with SMTP id ffacd0b85a97d-40e497c34admr16417f8f.7.1758721543997;
        Wed, 24 Sep 2025 06:45:43 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:bc4b:2611:54b0:29a4? ([2a05:6e02:1041:c10:bc4b:2611:54b0:29a4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e2aacd4dcsm35528145e9.15.2025.09.24.06.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:45:43 -0700 (PDT)
Message-ID: <e6a7cfe5-5443-4e10-981f-ca3811dadef8@linaro.org>
Date: Wed, 24 Sep 2025 15:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 2/2] riscv: Allow for riscv-clock to pick up
 mmio address.
To: aleksa.paunovic@htecgroup.com, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
References: <20250924-riscv-time-mmio-v6-0-9c6158a14b37@htecgroup.com>
 <20250924-riscv-time-mmio-v6-2-9c6158a14b37@htecgroup.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250924-riscv-time-mmio-v6-2-9c6158a14b37@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_064546_292795_C854FEE1 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjQvMDkvMjAyNSAxMzoxMCwgQWxla3NhIFBhdW5vdmljIHZpYSBCNCBSZWxheSB3cm90ZToK
PiBGcm9tOiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPgo+
IAo+IEFsbG93IGZhc3RlciByZHRpbWUgYWNjZXNzIHZpYSBHQ1IuVSBtdGltZSBzaGFkb3cgcmVn
aXN0ZXIgb24gUklTQy1WCj4gZGV2aWNlcy4gVGhpcyBmZWF0dXJlIGNhbiBiZSBlbmFibGVkIGJ5
IHNldHRpbmcgR0NSVV9USU1FX01NSU8KPiBkdXJpbmcgY29uZmlndXJhdGlvbi4KPiBSZWZvcm1h
dCB0aGUgY2xpbnQgdGltZXIgdG8gdXNlIHRoZSBzYW1lIG1lY2hhbmlzbSBpZiBSSVNDVl9NX01P
REUgaXMgc2V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBh
dW5vdmljQGh0ZWNncm91cC5jb20+Cj4gLS0tCgpUaGFua3MgZm9yIHJlc2VuZGluZyBidXQgSSB3
YXMgd2FpdGluZyBmb3IgYSB0YWcgZnJvbSB0aGUgbWFpbnRhaW5lcnMuCgoKCi0tIAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2Vz
L0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdp
dHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
