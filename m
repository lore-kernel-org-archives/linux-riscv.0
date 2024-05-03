Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F7C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 22:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/lN/mh9SfXasZg84FfLcA8Gf7FP8c8OUOLfhhQCFGQ=; b=uidBx9OHB3IfdK
	7ctgkvUKG8f4hI9lRhWDjTWyHvToH/zyum0DXN4fb1EX9PjVsvFZnPQBPc4xtSZdkV3EP9DH4JMMw
	JWn2lvcaMZ5KIV7fd1DcMaJFciDYwXjAKez8LrDO22KX+m4dabXgzs6GahaVvlnzh/b7wslbV8Z4O
	e74uFH1w5jN7ujj6okbAo5NljZp8fqCxOdCIbnQWxYmfEn4FVyWQHgmwvjYj0LyRXVfGR3xkNgY5f
	aPjfQ2/RLrses+KmjH1l6AruLJlNqJTFiwCy/YLXnh77XbYK/Ve15U96Z5l6cpOiXdw9rM6Cld3Vu
	Vhiyf9Yn/M8AW/9t4RLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s31Ci-00000000YuT-2MWA;
	Fri, 03 May 2024 22:16:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s304q-00000000MiU-20FU
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 21:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Rd8OjNaRvWOeeFwsUuLYY+v1uRTD/QKNpcqqy3mvWT0=; b=j7efrqyt4t+7m4MU2n8Nwu6mPp
	LBUsmirFsje+a+I8wPEfw4HshMBZK3Hvwilyz1dOqh5L3MMgUmx7ypkD9xpQJCZ9x9zYp1VtditMX
	ALhnjvgqCHaS9PTMH25PwM5dcJyjAsbYta2tV+QyAIKL79UN/EciHSn8G3sZ/ZgznhutqNoBJRnpb
	Vg4/hLIxwtv6AyANXyA4sYgQAPSZL3Y+PIAGuDQZc9KqO4g+BVphD6hU6naDaIrL80tPGfZvxtv5Z
	DIdzkGbcdMNRzCg9htcDiKnNpdgWqIsjuXq7GY49eGeN3VT8+1zUHRGj5C4W/sgh/Xeuz7GnuZSPa
	vpwCNKVw==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s304m-00000004vm0-3Wal
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 21:04:18 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so89908e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714770211; x=1715375011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd8OjNaRvWOeeFwsUuLYY+v1uRTD/QKNpcqqy3mvWT0=;
        b=K8YZvCHnY10BGt014zoLa/B3H2Td6qMsazBxcYxH1gLToieoQjCrDFDBXRdZEQSV5I
         KAnVNamtGzgoAiUl5RsxPlrCG+DFcPvGCg0gO0McAj3qwbnt3dFJ8XpVS+An1/Ytmxwd
         /GDSGmNhrhV72Z3VrdwDY83+NWP7LvpMmoenmKJmHKiql0AVis8uaQiOBBohsyoZWtR+
         NlNNc1zbJaFIANhDlypnyGf8JOxg4nPJuPTWdIQ2QGurRiVaQ7B8Opz/ooV6RJTUBedf
         dADvguFK+NpsJcCMxJspQG9nlsIbi2o9USrX0oRANdJOSwilvdEs95EPQEJyyGkdyBfe
         OR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714770211; x=1715375011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rd8OjNaRvWOeeFwsUuLYY+v1uRTD/QKNpcqqy3mvWT0=;
        b=XtWhFS4gZ0zaYjIt9FcIOC/5Weegn1ZCi/9eeA7HtBLBzYBDIY4Z0Y50G7DpbqgYlM
         D3gXG4y+O/fflXA/tWat8n2LVDGG39dOmLXn/HrmG3urjOcuSc7PB9HFbuKSO4iuLL8K
         IsIxHqdCB22caoSAhuhDD5CBskq9yRTTJ9NZ/vjTrchhvyQv80fkWTa5QcTUGVTcnk8H
         3soOz6IOAyla6qX45RK/kmjSVMrm2sEvWn4SUVDvW2LfQfHcoQ3dy3LKFqradTFWonOY
         WvufLOAcOb9rkJPNZYu8TrQP9+g1uTsWwwqItTGcjSkPzGp3DuHfQ3JFp2+NL5yvjCyY
         ecTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuTbd7CMysNzUwXDv1GpAadSW1J+5yOAg0vZjuenlJPyUkxQav+ZPR6IHgBUeJiBl6PuAnDSIjp5h1Y+jgMbnX7U7Meg6OE505SRHPYRyO
X-Gm-Message-State: AOJu0YxhYPALZ/Tl3TMx7jXPSaCa+p7eEhEYG0kgecn1UM1ge1uUcOAC
	z/kTFLDD4gSMQnunAQy6m9VopPAcn7TvQiyf8360uguoniMURUm9UGzdeCph+CELG3TheZkg8ZP
	9II2D4/6DwKeXL6Ec6apmrzncsl06RN+kYZCOLg==
X-Google-Smtp-Source: AGHT+IEwpEu81rH/FVNGePHBQCeqISBNzWjs4+w0Krz4xOnwCzY8XdmmXYuma+LSuWoMAtSFSqV0h7lUFLzfoGC8UUs=
X-Received: by 2002:a19:2d5c:0:b0:51f:5760:dd34 with SMTP id
 t28-20020a192d5c000000b0051f5760dd34mr2358407lft.55.1714770211432; Fri, 03
 May 2024 14:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 14:02:54 -0700
Message-ID: <CALs-HsuS_DWoUjwF0ozLH2drWJ7VzfdA-14XocsHNXt9CTT7Wg@mail.gmail.com>
Subject: Re: [PATCH v6 05/17] riscv: Extend cpufeature.c to detect vendor extensions
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
X-CRM114-CacheID: sfid-20240503_220416_922662_D17C4E23 
X-CRM114-Status: UNSURE (   6.56  )
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
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gU2VwYXJhdGUgdmVuZG9yIGV4dGVuc2lvbnMgb3V0
IGludG8gb25lIHN0cnVjdCBwZXIgdmVuZG9yCj4gaW5zdGVhZCBvZiBhZGRpbmcgdmVuZG9yIGV4
dGVuc2lvbnMgb250byByaXNjdl9pc2FfZXh0Lgo+Cj4gQWRkIGEgaGlkZGVuIGNvbmZpZyBSSVND
Vl9JU0FfVkVORE9SX0VYVCB0byBjb25kaXRpb25hbGx5IGluY2x1ZGUgdGhpcwo+IGNvZGUuCj4K
PiBUaGUgeHRoZWFkdmVjdG9yIHZlbmRvciBleHRlbnNpb24gaXMgYWRkZWQgdXNpbmcgdGhlc2Ug
Y2hhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZv
c2luYy5jb20+CgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
