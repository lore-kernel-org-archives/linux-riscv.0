Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF03C3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajGFRo+oygJMF0rmf5P+QkhTvNc540SQHlQxRfNfnpc=; b=iVJosRtIl0D2Hm
	oqSB3WCXw+5VPrRAIj0E2a7WgrHM11HGio/rUuCDRj3epWDs1H1OdnfVBY51T9SMzb2W2ho8uzT26
	evlV76s3vj46t6l74vZlwEIA4QCuIz0gpP3ArQTrnsP8C6M39hKyj8IH6QUE5JuEZzjinCEFWHioX
	OeM8EzoZQlidGjrxGHzPvnwdhOqCDrMZzTORQqEbVUns421YDLMw4vZIV9hYexrOy4kE12KLVMYZY
	Ca3PCwQD3sbZWhUiHKE7V2l7gfovkOtrqtDWZQwVWlZ/SXDU5xrGj+XxgwlKB8azkc1+PZSXNO/Kr
	bPuPkPu3YQDZ3Lxu2x4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDMJ-0000000FSRJ-2Ahy;
	Wed, 14 May 2025 14:45:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCwM-0000000FOFP-1nCx
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:18:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so3375348f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747232313; x=1747837113; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=usL1t88pP5pAsn7gA9i/dYktPmXIFLgC/CCDH3NlIWNvkuvseL8U/FSxX9WCq4JPYp
         5MzGih91FNNebAmxQkrsD+pqFRNQGCkP30XDLpvWQtxkgNAxnKvfsvSX+V3mtwGPoVrz
         15ILhvVuQM2oPAHsA/H4OqcEYwVAZlSiN1ZWycKsbZNghusSFQtppAq5yhRncMb2E7Ke
         gJUWEIIopyKPd+6CEbw/xkI3wxcgah10wp+i0q7pgVoxLMDPse/gqymqvOVKfTmfLlBJ
         L13Fp2RgCr9OLsVXMaEPMzhYohxL6++exb94NtwYCngrOkXHI5p2vpLuwzKIgV5AJSlV
         gPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232313; x=1747837113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUz3GV+6dO1qGU9AwxqVGKIzfxuE+8NTURqqLEaoFC8=;
        b=pIagXEQcz3D/2Z5fXdRkjCfq4E2X+FEXlZ4znCiHRRMYKmXyiKee17UgIpXdPXksqP
         eFHxQTfYBXLvsZZrLQRS5BUSBSd5Y3Hqres/U40jnqj3MajgQ34AQkT7+uC6x2aN9TKh
         nNYpaiLBXLAHAv4XdFboZlHtsyV0wgW6fYhf5CSiXXLCbznUHiQebt7S98GK+NEhauMz
         w5+D1nygQZbZtSWfBtqbZaIia4BhV6wf6ZwAvwHRhHrWr56W29L2MxCJfNuyvJmF8jyR
         Kp6vpw38TezVi+H1fZ9hVsvu/EYXrncKbUnK2L6wnV/0kNgV/QYGcnyToZ8M5/3WT6lS
         7XUw==
X-Forwarded-Encrypted: i=1; AJvYcCV/K4EvU8ebz/tqEcejt3Y5DzekZjhHtYLWm9YaviBYToqCQ6HiX6zUWffA0KNDRSNcu1MN5xmYe14hvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb/5AL/ZXv9wZhDIPKDvArMn/T41D22ZrwuqVIt0wAEhlpGzZ2
	WPwN/IntqO0QxvfKFmSz+gJNlStlaSO/rz321Bx/UvxkEvIhD2vfIzQ/m3BMHrk=
X-Gm-Gg: ASbGncvMdxoB7vLoxqn33yy/36JGjUPj5IQEKoGztjsCphKbfQ/9GiXWHq3EcoILhqd
	uG+UXH+UW6BmEndDahFhcIPkFs6I1rBaM4kxDnHyMRgnbmhSvPIqRg1fsIN+dbxpfCr7oJKfhzf
	hpiEbWappEDQrP8b5fND9TUsYv1qtTon24sKhtJQzgDZDFUibbh/q50wFsOpVIZmzzpC48dynFK
	/z/a9K0v6dF+dJdPtb7HaXwwB98sNlTPz4UBurgzdOoigM/ZbdEq3YSoXRtihBmfwlQpBEOLvi6
	jfYGQ5nlB6+XImY90Gh/i4YCENG31MkuaUB5N2wiGJwtfEvQLZvqNWZYQnr4QQvkMennBJ0RhYb
	kU8zxx+aRg4PXYQ==
X-Google-Smtp-Source: AGHT+IH4+d+Pry2CNpgKUNvxX7a5CyUBEerUkhvVVYoJxhPCGMW/etsCZMqBlMg4OuejtHCSPvBihg==
X-Received: by 2002:a05:6000:40c9:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a3496c1ebdmr3217848f8f.25.1747232312583;
        Wed, 14 May 2025 07:18:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm19729450f8f.86.2025.05.14.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:18:31 -0700 (PDT)
Date: Wed, 14 May 2025 16:18:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Message-ID: <aCSmNRTVXQ51xj0m@mai.linaro.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_071834_465403_7A997DE0 
X-CRM114-Status: UNSURE (   8.10  )
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

T24gTW9uLCBBcHIgMDcsIDIwMjUgYXQgMDk6MDY6MDZBTSArMDgwMCwgSW5vY2hpIEFtYW90byB3
cm90ZToKPiBMaWtlIFNHMjA0MiwgU0cyMDQ0IGltcGxlbWVudHMgYW4gZW5oYW5jZWQgQUNMSU5U
LCBzbyBhZGQgbmVjZXNzYXJ5Cj4gY29tcGF0aWJsZSBzdHJpbmcgZm9yIFNHMjA0NCBTb0MuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiAt
LS0KCkFwcGxpZWQsIHRoYW5rcwoKLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0
dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
