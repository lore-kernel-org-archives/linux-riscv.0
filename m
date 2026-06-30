Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62312C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 08:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEz8psK//Na0vFgVnKYwRF8P1sW3Y16Dbr+4hacvPeE=; b=ZIqByg3mqotx39
	CEjqppF8W5Rl2jS9rZuAZrcazy2VtThw+oP+cbmudG2q6ycHoUq7smywALKfgVc54cROYl1+G8Uzu
	K8zFSyvAk/jbncEq66sYhUFHMnxiVPIiYAZWPj7O0fhCGpHa02h5vmq594+y9G4PPvkoc1RYuHI3V
	cbQJUqmeaNaxSNTT7StnfMUFHTlo6jOF6wHXT2S/+7fFbngqJfOp/eldpKMvYKgxN++g/tFPajYrd
	eC8NF4OS77D85SPbXepA2jyja28MUyFLRfE5KTsfNRiZAjLK0rTo1JYqV9jkdevSfxeYlPEShHBeb
	PjqqJf+CbvBupKp+auEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTw5-0000000GH6c-3IJl;
	Tue, 30 Jun 2026 08:35:17 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTw3-0000000GH6I-03lx
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 08:35:16 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-30c53dc859cso369892eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 01:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782808514; cv=none;
        d=google.com; s=arc-20260327;
        b=mqlh5mwu8JMjEb1qp0rrYTUKxBYlgD0PiPJ1GlouZJM3EWMcEIwYtpN4murfEOz8L2
         SrTQAV5BFyCq4FW05aSxCmp+RC3kD+VqeMgsHzqHrcq5JF94j441oVMGBJ0zPFYnG9m4
         7LM3TVRqei7ASYET/04C2CXCnvbXSdxzCRYlG0rqAg7wI7unlDaGTeW1xTIjOoh2JVn+
         g00545X9wGNDp7gZljPGidMWk7P4u9cBMPEQ442u0CogaNZ4auHKA0BuztPhXgyp3+Pe
         +9Qf+GTMyAZ19oETRIVzNdwGXSb7ypV/apGYmX3SgCHu/R0tMOHJF3rawIFK6K973YVZ
         KVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        fh=mE0zu2c3l/zF9Y7VTZan+MSnZ3yScO+CeT9rW406GZ4=;
        b=bOSratpWFZGIdskUbcsT/GucTqDUqCQkcbcRFqDa6EDctC2uF9HjMIYX58osMqsy+n
         oXje9Uiyr8hShHA5CYg8eh1HPVaFDyZygvpLFZ4fTynK1zbR0LWM2fj04II++QZYhuuI
         qetwBO8hY/PPDWLNz313vxJ559A6b5KWkd6acf4vfLiTLTO/dG0MSxLa+Lg5SCqj+Ipj
         qYfOhycnAeCrqfavONMifFWl2RDBQnEHuF5j1zL6r5d1etaveMK2+TWev9EusjWmv6M2
         1Hj11wUAeQzn9MpT+REcMpmjvMbs1aoBjNpIuKocOUAswQDy7xsinXsQGU9c7xXdd/5H
         re7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782808514; x=1783413314; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=V2WrVqXtUadeuhzFhT58VOPVHdvaWB3U7V+U0NftaoUuIrwZ+eC2+V5ivd7qdA7veB
         N0iUcU8roN7Hxy6ZREKgOVhIhBAhxXyn5JJsf2hX8A5SLJpm0EqAMOY0qgBaYJNwWQ9d
         V3SlcT3DChg8g2y7yj1OliUIhI9S0StGwSyT+eXvnKq/qNzHpV1yNEyLOPtY+gLLCukx
         kYqiF/9JiiUDaR/Z8xr6HYQPFNe9YIySYq7Av76Y88xJkeHR+tfI4jid9Nqf8zozj/uR
         Y/8K6MxrYBlD0RpjSv0OiNo3Z7dBka2xmcCFFS8xiJRm59nUZKS65lAPp7PADcsBmBN3
         O9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808514; x=1783413314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=guesM8VX50Na/WYLomod4GIBnyGT1HNezvvNlfIKFh7pP+R99YcNjJ6cEIcf3J3Yj8
         tBqEgVJQgfEzGUh41TrUcmTUiTVuJuQ5aGXKQU7eff34X4mSl4j0h/ZXUWGyDe4WAUtq
         Vk8XYYS55fLeL0hD0wc04d67ryszyU7uy1H8//HCV8MCIpreAPMgXrp1GvHceNOsO/WD
         1jNGk7PtX3cOrf5d/8wtP0E7s92yKdqUtUEfg0Cf/N9+VJsWeIShn08vq7PxKNgVlL74
         +/uUEEXHVPrcriSvUfunGY0qWSZLjX3KZPAyJ5xzPlG6Ae+WRB8HfqdBFQIDaEB7/DwN
         ACEA==
X-Forwarded-Encrypted: i=1; AHgh+RotQDWW7v4H0MxsyoGSimu6S1+5zHBaHOXDHT9LJbSuYaq3XZEYuVdqh1j4d8pAn9t4ftPgazSKNL5awQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9vN0X9ZFmG1dmlA+IATUYbn1hA8U9c3Z6+iM1feiBwS3gelLX
	wds/pms3Ll8Pcko31KDEA0+XFG+w/9TndhyNFMDOYxEZJKOcbieskiN1cEcQlBwT/JBjPhdMbuw
	KwsPHciprT5cUszPES6RhODQj/LR/tiI=
X-Gm-Gg: AfdE7cnFcHoOwUbm1HgfLbfjIpdUMYzR/E5q+fyNTIn8atbuHaJYwAA4OtoXAdOMVnz
	0PtzVUYVo18rDnHNWpD2toRJhR1cLkZifsbrD5nuasMrHZZEq91m9DmuwQQBVxMdB1dmPoRktqT
	tkLZy6IX5jQYshILogqNyzmeuQ4coVeGLe2Sa2tJb74VYQt1m6yCOSN2xuSGeDPHEhw8SqxpzZx
	svvpyMQ98u5h4MZ7FWNo60NeOEdBv2iHIA3E9Sw4bN4fqIp462aPsK1WoQWfPXkuRdd5tAvRZ08
	1Cil0xFe01lTfCxZUJeAPyXFVU4LtO+jl96ySoFTu0AOj5L9sY72L2RA39cn2QsxNRLbfyTLfoP
	LanOPS9146ZbB
X-Received: by 2002:a05:7300:6ca1:b0:30e:dda8:e0ba with SMTP id
 5a478bee46e88-30ee150954cmr1003565eec.6.1782808513710; Tue, 30 Jun 2026
 01:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev> <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
In-Reply-To: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 10:35:00 +0200
X-Gm-Features: AVVi8CdhtqV-BYuDJ7-_rhOqSdDxdGUExu9BuuQ1x0bjmiH_24JXcG_HI6rxurs
Message-ID: <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_013515_057225_8645BA75 
X-CRM114-Status: UNSURE (   9.40  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgMjo0M+KAr1BNIFpob25ncWl1IEhhbgo8emhvbmdxaXUu
aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSWYgdGhlIHByZWZlcnJlZCBzdHlsZSBp
cyB0byBwbGFjZSBlYWNoIGltcG9ydGVkIGl0ZW0gb24gaXRzIG93biBsaW5lLAo+IHNob3VsZG4n
dCBpbXBvcnRzIHN1Y2ggYXMKPgo+ICAgICAgY3B1LCBjcHVmcmVxLAo+Cj4gYmUgZm9ybWF0dGVk
IHNpbWlsYXJseSBhcyB3ZWxsPwoKSW5kZWVkLCBnb29kIGV5ZXMuCgpUbyBkbyB3aGF0IHdlIHdh
bnQsIGBydXN0Zm10YCBuZWVkcyB0aGUgYC8vYCBhdCB0aGUgZW5kIG9mIHRoYXQgbGV2ZWwKdG9v
IChpbiB0aGUgZnV0dXJlLCBpdCB3aWxsIGJlIHdpdGhvdXQgdGhlIGAvL2ApLCBpLmUuIHRoZSBw
YXRjaApwcm9iYWJseSBwYXNzZXMgYHJ1c3RmbXRjaGVja2AsIGJ1dCBpdCBzdGlsbCBuZWVkcyB0
byBzcGxpdCB0aGF0IGxpbmUKYW5kIGFkZCB0aGUgb3RoZXIgYC8vYC4KCkNoZWVycywKTWlndWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
