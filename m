Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F415DD185FC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTn8WrvtMcjNptKtfw3JI8Vvj3rd5tCqINs9Ck9gnA4=; b=FgIjhMsjzjzg16
	yEmVzNSoItJJvd+K/r4YOvc2bG2vah55lKW1HFpFJTrfF08gFVNh97ZSDHO3cgyeJ9I0Okc80jb5c
	EPSGr8h0bN0+ec6xzDzhKRPXbdWUlRGNcwSgGeTMftCZUSlk4oLvJxCmS9ALdDK5LnDUucIO+Hkdx
	Vpb0LDVLVIl1MhUlOrJJAgiHtKViYZKfKcd8wJy8wiFJSvOztjlEfMt2ljoVL4zO6fcp0X/5j6Xog
	raoV9JYCcVgfNwuLJRtwLpWGkA0ImsQC79rmDTquZMGJZHZob6db6Ve95YeNnEolGNprX99fg9DFh
	mfIpQwX1kCudDKPr7NJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqWk-0000000HFY7-3In4;
	Thu, 08 Jan 2026 13:58:14 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqWh-0000000HFXd-2xoh
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:58:12 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-11f450147cfso233745c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 05:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767880690; cv=none;
        d=google.com; s=arc-20240605;
        b=dIZ8nhsw3uR5ezDq7jo4uWMfGQ+ZHbDzwkkz45b75jwSXcaEwyv7Hkp7R/TE4t/9i2
         TJi2bSVrrF0evqnBv0FbSt8ktm4FsfsvVQDX8iriJnWdE1kWLCOJXe0Svsc8E6D7DFS2
         lYWMstF8ptXkkq6TYAhzh9P+o7+BiLn0Kj3Za0nbthU9pPuhfUqAK72Mcx27KDyNdLej
         zsGYmamfFKG4TRUtG4P3qAIO3dndqIEMybwQ6SgO9p3EAyXynq3tS+4L/uphmlyPGGae
         9K/vGT8ovghEsaatEimfA1AXEcnKNzIlXXOdWeigdx51JAry66INiszCgUb+ZEA6quwJ
         WATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        fh=nnujQRlRDY+guEoQCOiML34I0KXOwwmRpVbsSzNIoDo=;
        b=O+G5N1mwTk5knqaQpT77iV2BE3TQHUaxBduppsDFMgdHmRodABm3fxnQscdKxCPrWv
         Sv5zK/hXCJhFLH9ic4vNWjUxws3hpeaCfy2fLHVhKCT5ERQZg/PdAHK5yzjXJLq3lG0J
         yribUT9wdwh916I10Tcutp1DnxVZwCSQPk4t4eogSitIDbqlVMwnuxf5CtWWWJRKbMQK
         6ITz1SwvCfOlf03BclcXBsoPPdvq1Tzq26iijblgW6EmeSA+i+kxGkFovvqm5g8l3QBY
         Es+quErMu36yLUnFYU/M+LSZ5PBM+Tds6DsKbekyEXzJ3YHkTR14oAkHG9h3PPPjOYNL
         1UrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767880690; x=1768485490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        b=Rn1bEjcFx4JxchLKeCZDS42k/jbRefGgc3D6HhOj2lllDqAvtN3GqNmFzO9hM3Xz3Z
         F5vkyZQbAgI/HkPIJZPUAX4xWtnQIyvU608WRVSsz8wuYAGbfuV9/T634EVwu+rIPejx
         fCzd8Cxzfg4C4l7eOpJA/8HlHVqsX9M72ZnbqGbJix0i+ph8N7Cp0Qd/uZhV74s0L3op
         eHf93z7W/3y16vES+pAzBJc5Lc3v6f0Evr3gSC9TAQmkQOX3ETnY8alCZCnduwXEKDsm
         KbAOpbjYu+JyDkvckxPDulUAsiBKKaUTNSgzTsEWei7foAi/0sdUc7OHckr2/KiFBbzH
         iu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880690; x=1768485490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jKmPkTdOWtk+ML1oyRZShyn9g+7S4FBzcZeJc6y38Q=;
        b=bORCmxFvgk3cwq4BtHFZuVmF34T7PMprBVllc1rUflHZD2Jci5c2TIBRvysjTvax+p
         eaflr8Povczye77ZAh2OELwcjT3ydJbXGPiYLfX1xmoVlzXFOc2iuEMB8XOdL8ATxlVd
         nS+FNQIrYOXDEkz2s0Exnp0luujXQgS3JdMWfHeNQSo7qBwkoN7aRhvmTYCkEQkV4pKB
         zZPi1+GP6DoIzhjLYNNNHRGn+wOIfy0KqeMyS2jUAkpVj6yHUZgi+RwK/I7QlK5QXQrt
         rZOSgKU7nvHi0IHtK8OPCEOZzX2N8EIQ1qLdOZrKcyQCedTa7tRL63sjWkEp5eDn84ZQ
         OkEA==
X-Forwarded-Encrypted: i=1; AJvYcCWs8NWBzMX0QYi9KQsfyj0TbufbWKRGs7QS1K5sydPWg4UJNyjCBM8a7oYiV3F0qmYXavPa3TqJvH+AeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqJ3Y1+/U2pKtcsnWnvvQuJfGyBYg2ynCVwph73Be7wjg9Dgfo
	4xoC/59QuuFvDUFlx/nWzLypI3SGFXi8YjBPcb7LO36OuhxSSFJfTlVKB3Qli8Qk9Cf89vsmlnW
	cozHzL+QS4uRMaSDEt+58Z7tCHKLooXk=
X-Gm-Gg: AY/fxX4ovfRX+rB6ti8c6NioLpKBZf1CWwTnjU08uC2nmSYH/A2TJdmnRs7yUsXbBcY
	obq6foy1w3NoNNGdOVQwElJd0I8gP++/WlmTIVFOjFdkpKc/2oGveeaDYqC7dlLZvnNm6gvwREF
	mA3q8LFaS9WDePMTzGsHw1NI5KNoIINeCYJlUQeC+EcAmzYd+9+zUgLLlF8sEKfMw38xyUx6c+c
	jSepSLvPCCxv7WiCjoj7hi6rvW9loqvmOiVo7zp8TT/G16n2mYYK9T9E7zALZR6F2Uruym/pw/t
	CsGtKu/ZDMSzNSjsSqTEcJ41oxdaGzvhmPkfG9leJ+Mr1JSzggMpz55RrUD0+zHTk6w3BHbq6sd
	ovyOgFM1il6Lgye0UyNbR+m4=
X-Google-Smtp-Source: AGHT+IHlnNhSjE3fiGAFdHKCvng7Zuc8n9ttJNcOcaKfOXOHrvEYhA907pjuVU71kxGKClIXln7ajb5XI4DP4iSFO60=
X-Received: by 2002:a05:7301:10c4:b0:2b0:502d:c27c with SMTP id
 5a478bee46e88-2b17d2b80c6mr2509787eec.5.1767880690160; Thu, 08 Jan 2026
 05:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <20260108-delectable-fennec-of-sunshine-ffca19@houat>
In-Reply-To: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 14:57:56 +0100
X-Gm-Features: AQt7F2rtmhmzWGc_DLT6cTXt2EVzqLjQhI34cDZ6wkg42nM_UD7cfFl6t1r9_zk
Message-ID: <CANiq72=38RO9PGAMDtnTK8wj-yRSmg9UOfq7D6af7AwAKwn=DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_055811_770185_CA8B6FF4 
X-CRM114-Status: UNSURE (   8.81  )
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA5OjA34oCvQU0gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFGQUlVLCBlbmNvZGluZyB0aGUgc3RhdGUgb2YgdGhlIGNs
b2NrIGludG8gdGhlIENsayB0eXBlIChhbmQgdGh1cwo+IGZvcmNpbmcgdGhlIHN0cnVjdHVyZSB0
aGF0IGhvbGRzIGl0KSBwcmV2ZW50cyB0aGF0IG11dGF0aW9uLiBJZiBub3QsIHdlCj4gc2hvdWxk
IG1ha2UgaXQgY2xlYXJlciAoYnkgZXhwYW5kaW5nIHRoZSBkb2MgbWF5YmU/KSBob3cgc3VjaCBh
IHBhdHRlcm4KPiBjYW4gYmUgc3VwcG9ydGVkLgoKT25lIHBvc3NpYmlsaXR5IHRvIGNvbnNpZGVy
IGluIGNhc2VzIGxpa2UgdGhpcyBpcyB3aGV0aGVyIHN1cHBvcnRpbmcKYm90aCBjYXNlcyBkaWZm
ZXJlbnRseSBtYWtlcyBzZW5zZSwgaS5lLiBvbmUgZm9yIHRoYXQgY292ZXJzCmVhc2lseS9zYWZl
bHkvLi4uIHRoZSB1c3VhbCAiODAlIiBvZiBjYXNlcywgYW5kIGFub3RoZXIgImFkdmFuY2VkIiBv
bmUKKHBvc3NpYmx5IHVuc2FmZSBldGMuKSBmb3IgdGhlIHJlc3QuCgpXaGlsZSBpdCBtYXkgYmUg
YSBiaXQgbW9yZSB0byBtYWludGFpbiwgaXQgbWF5IHBheSBpdHNlbGYgb2ZmIGJ5Cm1ha2luZyBp
dCBlYXNpZXIgdG8gcmV2aWV3IHRoZSBlYXN5IG9uZXMgaWYgdGhlIG1ham9yaXR5IG9ubHkgbmVl
ZAp0aGF0IGV0Yy4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
