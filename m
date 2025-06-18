Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811AC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxb3uHGMH+EEB3lcBBJ7m6KnTdMnxFOKwnOTrdeuyXo=; b=pSK+c40uf03sLE
	Vm9QcZk0ILpOS3ILlhsdMjkrp4CFGtgyz2st/2ETHxgByWw+FC9ZUnw2c34jJr49HVxjrqLWA/4mR
	88P2GruZHIiDmbdxEEqtAYf9UmaxTZ/2CNivmlRKfu4CuSi/Q+mdvditJGbnvmHqULSApNy334c/j
	EUmLk06DcgdEDMVouG7o1It/EZCI+HhxuataK1zEwN523Eo+EzQeLC/mDqp0ipZMdmS8LX76wBr4Y
	GOuzgXAQhNfxsDqlr++QhYKNOrMAWG9tKi9EBpEOLoG5aYctNjzEKnY4ppSegN6N4tUlUfk1qf9L0
	8yeWH2GrtAEEl9N403Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuh1-0000000AasH-0H9a;
	Wed, 18 Jun 2025 15:27:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt43-0000000AKzf-0Syk
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:42:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-234bfe37cccso89771005ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254174; x=1750858974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
        b=brk/LEDnmWPSJNq/mvjGF64508UFssTWTBndk26u32AHpnCOZanPYJPzugInxheWcf
         ayH9T+nRkpAfIS7urXyoFRQ+/7J2ypomyjef92lJXZQvFDyPTYJRhV1H1P6tu5B+KJ+/
         n5ADvF6KeJUAiMjY168jz4g5Zrema2qzHzYtd4dxAzRbx/k1iSFqsiLeOm5XDtHbYeNw
         2xLgUkynzA+jbmtuNZGoaHY+jvmV7yBglzz/QZRZUJ+m0SFLMXW9LbuG9442NOFdGtak
         uvJwPj514J0lQ42mjK02wwEePI/fgz6tUGHJ4nmRwHrTzlD2Ab8iqr5nu73B6UQecx9w
         Qjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254174; x=1750858974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
        b=RTNDAaZht56qIVr12YPhdQUzhe+dGuAR8TfgtyH2RwWZ4LLLmsQT8SfdASUuOmGtax
         mskxT4arUSEmfX7zwoW+ZjiZuW0Ww2V3rGIzjDGlbwezN50rJ27fpn52Vxpj5p4mRBsn
         AuPfvjVKFMszStfNKLjt8JBy19Yb7UqcfvBA6alTdTfo1I/E5LzF711/JqNQWA4EKzdT
         Tqb8G1ruG08EmM2dzU9o7qN3ZYlAiSaSOyPfcT7djHXzLvdcVTd3Eo2pCcPv1qUxO04p
         wiBQD3HLKcmHJvbCpfq/16lNbXp0FVw9nhJMjlkUVv8uAlFPSbZ4vWXq9xbfd9kzAbJg
         mAYw==
X-Forwarded-Encrypted: i=1; AJvYcCWT5+Pj0a+t9zK028Z23Cg39RtP1JjE8us+JjGFcIuUOj35Sbr0HLC0XXw+tOLvPb2pKxWaTOijazFVLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKdin6SldW3g2iV8xeW+i6b7pN3vi2iFTPeDnsABAWqLxZV0JQ
	XgJvAY6xiFAAXo5Jcr/hHtk5SJEgNVFpAY4JJBsm2KpEwTE5ya6dGQ/ghGchmtlC29Vz8xSxiaE
	Gtmguq0AAeq+x5vN9lWKs1d1KWNIFxX80VRKfSXFDzw==
X-Gm-Gg: ASbGnctshx9nAOo9WBs0y+MGOY6qWKh2lDSWgdBVlrBuqFt/Smgk9z1ZxoNXC0nCHy3
	Pd9Jw4lHxP3Y8ADuVpfAZLRlbtLEkLHokyue7TpHfG4wNn70boUw0BJEZ1RkhfhRzDJTOCiaerf
	w7iggL/LQgCyvIB7kbb9k9OMlw++wo+0Iaa1Idoeq3wMcmvneP5B6AENz2YREmtc8Ai3dZCVQaY
	g==
X-Google-Smtp-Source: AGHT+IElrVhMfyL96c9QVT6DbL+Lc21boXjlquqgqsoD4fhNOqUmdIoDw1JXTFKsvyhQJ4W4uPfVUPd6XCcj78sx+6c=
X-Received: by 2002:a17:903:46c8:b0:234:c22:c612 with SMTP id
 d9443c01a7336-2366b17b6d8mr272722965ad.43.1750254174423; Wed, 18 Jun 2025
 06:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:42:40 +0200
X-Gm-Features: AX0GCFuzTphnup-dhM3gVd1jGswJjfqrqmNVH_fP0A_YpAvwshbZGGJ4zdPhw5k
Message-ID: <CAMRc=MfKx+S-8yYpab1YO0XsGN6a9-ybJpyRoyN6wCrKcm=j2w@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_064255_146226_F0A91285 
X-CRM114-Status: UNSURE (   9.81  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTI6MjLigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IFVwZGF0ZSB0aGUgaW1nLHBvd2VydnIt
cm9ndWUueWFtbCB0byBpbmNsdWRlIHRoZSBULUhFQUQgVEgxNTIwIFNvQydzCj4gc3BlY2lmaWMg
R1BVIGNvbXBhdGlibGUgc3RyaW5nLgo+Cj4gVGhlIHRoZWFkLHRoMTUyMC1ncHUgY29tcGF0aWJs
ZSwgYWxvbmcgd2l0aCBpdHMgZnVsbCBjaGFpbgo+IGltZyxpbWctYnhtLTQtNjQsIGFuZCBpbWcs
aW1nLXJvZ3VlLCBpcyBhZGRlZCB0byB0aGUKPiBsaXN0IG9mIHJlY29nbml6ZWQgR1BVIHR5cGVz
Lgo+Cj4gVGhlIHBvd2VyLWRvbWFpbnMgcHJvcGVydHkgcmVxdWlyZW1lbnQgZm9yIGltZyxpbWct
YnhtLTQtNjQgaXMgYWxzbwo+IGVuc3VyZWQgYnkgYWRkaW5nIGl0IHRvIHRoZSByZWxldmFudCBh
bGxPZiBjb25kaXRpb24uCj4KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBVbGYgSGFuc3NvbiA8dWxm
LmhhbnNzb25AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8
bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29s
YXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
