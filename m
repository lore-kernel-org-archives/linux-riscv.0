Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CA6C25B5C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LT0RkYDKEPH3G8Afd2WBGPLkmpn2q8KBwz3lahAkFEc=; b=dSyqlGzFLoHCla
	ofO9kzm0oJmcP60B6TuxgMSkEIC18ZTnLs67TAc+bAT9lcuVQ3XBPgQiyOBV6vkPo99/0Ygev1G6j
	oEdWr0D13vuLnsU5xpg2EXRX3rqLoFE8ubOwzJmetxqT4Idc5vOyPlpKeyuHJUOmAeWBoSmIfR4tl
	fuQpf2gpt5svhaIcbTRmJEeEjAExidvdoibWZqRlPAFFIKu1jSpT9R4dXjvCvG7mA7923tW7IP9NV
	TIDrhU2UqEZLwPmv2+Z5hQcUqaD8FLvdTFmGppZ9sw6Zt+ToVqC7AB8gJLtEs7f1XGekL6WTyVTFw
	eush8rWhTXlEXKuxnj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s31RE-00000000amy-40CY;
	Fri, 03 May 2024 22:31:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30HZ-00000000OTR-2WFe
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 21:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=; b=iXDMCLgc2f5viA7IS8jSS7KVbt
	NGwDt+PmoIK+XP/bqocvP3LjiA8YHPoH4AQFuXNG1IZLOXBrcppuXYvkV0WRRMR26ovU5J71A5tVN
	lxD0IlUnGt9SoVTb1dlE2LI0GmuFFAwR0y0dNrJ2Kc/yf4bsPjsi0ONVb1R3wieUDFzB/I7Zfrgv+
	sdYEEe6CmvshUq7Y729VhKKDqMtfm22r0DkBntQzwliEkMXoDEFZahKUghCTQOxZl/AehbR+Du6fe
	YJoijbR85jXUtO8rzL8EVoyqonI+5zTGVwqCdBqjQg5NdK/xrZX+4Vq7cFct5PMtQ69rLa67scYge
	5lyFeZqQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30HW-00000004xxF-2PMe
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 21:17:28 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a599a3b233cso5670966b.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714771019; x=1715375819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
        b=oFTS1SiJtxoHRtOnnGxspa2/nGcepW78oHibU4mdipBmsqTYJVaduCui9EcCqjXyQp
         KNqpOYNPZaXF8ujWMInFsDtL54iaatr0Jc4z2m4rIE9uoy1wfyX1cz+9gS8CSHQ6ENOq
         tcq4iXtnYYGLgYfVUE5VBG+vIGWaDy+FJRMXrdvm6fj11nnveocnulK6Gy2lk8EiRMwC
         AP+dWuYbRSKCXHWO1xUUnldMiOmXgZDj0jSe5SviKGxAfNuKTXfxkXQ1wxCaEwe9zwrL
         vZcWXZXgI6WGZZZMMph4A6ZK2+IsxNu0KfJIyJloTj5/AF8IZ+eDchtxV76kOM/kpCRs
         OaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714771019; x=1715375819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
        b=FqHMvK2dbDsFuHKMOfzw9xvm48VIGBQBriemdIdDTx1dk/2Q4R8xFYjho2T7RQK/V+
         zBaLvBnyT33cAeo2A67svHJ211p8Ey9Yu3++B2G+QPO4c0Kva35nKxx/vehqIbKHLIUT
         mqWbz/suySeZiLXHFMzby2FE1VT+4sZudHQ/HtfR9jwdxF1KWMWk80uD9zLXja3MGPiu
         uv/v+znGrA196mfX8G7f+HtKkv/zTgXNw3eu1ZNff+lMgciXdsrh9PDskPMJBLGk/762
         hTvjoiBmzY2o0wVfRPJk4tWUrnnVqvMo4gUWSkmbXohwGFTQ2cruYaPYnyca7df3xkGw
         O+8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUqSewTf0jz0C7lvD3dPioMnjxfSeoPgKto/Wq76p126HE2F0fYIZFnEGOi0Tm1dQxwqKrwbEPAJaoVhOcvB2Zh9AVBopkNwpWvF8DUVYG
X-Gm-Message-State: AOJu0YyavLgy7371vL3Hek/Zb0g1TdehjlSi951DTepC7hBjOA7aI4TB
	a/xXi0K5q2fKsuNbuhNJMLP/vhCuAR6i2gsrSvWaOMx1d+J/0NDx0RkrjqS35bWxItpzvj+Md9g
	lEUDdGu2KuQw4mjrpg+YOcNmYUr1kkLtbLt2tyqlDezZ5b/0q320=
X-Google-Smtp-Source: AGHT+IFVGeh8LKuvAXn0wbATQFthajoGa9wA2FpRSy48ryw0IkU/MmVyuccePKcDYu88/CEm2wRejt72X+QG3nu2ZVk=
X-Received: by 2002:a2e:a71f:0:b0:2e1:f255:6673 with SMTP id
 s31-20020a2ea71f000000b002e1f2556673mr3009473lje.13.1714770245520; Fri, 03
 May 2024 14:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 14:03:29 -0700
Message-ID: <CALs-HsuH5KM4OEH3Uo58cq=3Zgr-gd43hhtOuP2tQFDyDUjq2w@mail.gmail.com>
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_221726_635422_EB4455CC 
X-CRM114-Status: UNSURE (   6.09  )
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

T24gRnJpLCBNYXkgMywgMjAyNCBhdCAxMToxOOKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gQWxsIG9mIHRoZSBzdXBwb3J0ZWQgdmVuZG9yIGV4
dGVuc2lvbnMgdGhhdCBoYXZlIGJlZW4gbGlzdGVkIGluCj4gcmlzY3ZfaXNhX3ZlbmRvcl9leHRf
bGlzdCBjYW4gYmUgZXhwb3J0ZWQgdGhyb3VnaCAvcHJvYy9jcHVpbmZvLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5
OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
