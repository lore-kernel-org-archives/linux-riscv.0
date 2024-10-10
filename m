Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE718CF11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phaKUBsLR/rdqyGLIihwqF44U4kUq+CH+zyvrbFOtbc=; b=3QhRnLfh9378td
	wRFs6PZ8W53GEzmJfB+SP8zGPJkuuuEFn4pAEt/VW4b9fqaIaZTmVmFCK7Hv0FYuWiZ04iXuVDu2v
	gDSGjuCK9AXUgXwyMkOpWq9uInYE21Qam5XUwWbgJ3kVWr73NmoOAP9wZsTzioNE1592TM8UzLbnj
	fPIpgFu/OMFJWBhcAuLne8b7m6O5WQaiT+Jg0aeL4CLhfLKikr0J3s6XoyJQiZOwsC3k6oCt67d8G
	K9J02K5kRZZBGJpjyHFHVEGDby1mpc3Ft47SK1VV7we1zZqp9ESrLymAdKnr/a9uHwoGPdJpCG/gV
	dBZyXZld+qEKmhEKyBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sys7r-0000000Cglo-1vJZ;
	Thu, 10 Oct 2024 12:18:39 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syram-0000000CamF-1iZ7;
	Thu, 10 Oct 2024 11:44:30 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e1ed14105so42137b3a.3;
        Thu, 10 Oct 2024 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728560667; x=1729165467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bcJ4+CbIja3RwWUGVJCLGPSRxnGjLzpAXTiDnP2l0k=;
        b=N+kY4EppJTw4GWsavIL7FuSsyUuHpk35PtNGNmWcj5fXo0zDJXQMQC6IJuWal+AwRD
         H25xJH9q+NaSqCWpK9MM2sQ9DoPU2NvKnMr6E6OCEgRjQvq1+GlimYDayM6oozUEkaEf
         Kz5+jGW1r5yW4p+IDLc5Zw68pbloKNDHEOnER5k/XnCUx/MK8LO4CktBk4hxW470WTxx
         4UTta4s1T3f4On168V35VBBBLAzOfZAD6a86HaZ+wpYhrrL/9Xf67Vl00rpBtV+UilDt
         8qeDSpOcIkVS6JqqFBiFZrbqNP6OT0vxp2VsYA1yrw7TBVtZXbPwLoTk+pC78sqXsxnl
         /vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728560667; x=1729165467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bcJ4+CbIja3RwWUGVJCLGPSRxnGjLzpAXTiDnP2l0k=;
        b=m22/avGk5r6R1Pm7zwxI1ohBHxQjYhTN71Ec2+bUwJrMjFC+QNQ8Ayc3ubyX7WbnxU
         iYMJQLtAHWIxXeBbph+TErJtMS7J55peN12oZq4pcU3aYV5ItgqDXs/U5XcZ55qczJxM
         OZM4Zr0iKdcvTXG+ckytozXHgbh33Uxd6p8PpHSHSTAkxhIo5ybg7zDWJBP43YhRnbwj
         7eH4koxiyLFAQzh0v+hYCkfW/txQTM5brSJw7AMuf2kOTjR+28nakEeWggQd17BTeac6
         42RvCkodYabrLtfKbVrvMJuFVdRjs4+CjjpO1uFJ87sjfFKhQAGgqfvFHavr+wJnYGOh
         zBdw==
X-Forwarded-Encrypted: i=1; AJvYcCVMNTmKkUTb64bnctynh3DVg+QycRpUyGh/J6O6j+7EUdI6ZYWn/U3aV+uS/dG8F35LuNV71a68D4Q/L7I=@lists.infradead.org, AJvYcCWnzHlefdONTdinhIfKxpGn9S8B0RCHGU65oaZlcW1g3BFImz+mF5Bt38deEghlHvw090aPVpQz6pQ93jnroNpc@lists.infradead.org
X-Gm-Message-State: AOJu0YzN990EU7Jy2YxlCxpK7RSGkC3tYtMX1xXrUgpWlieqM5TfyMlQ
	Q4FIEAG8Ml3ydsVfUuxeTIQQRbxwYY6IPRMuTtrnXhWV6FZhdkOsX6HeM29fnkGAciNjms2fdWf
	3g0oZWMeUYc/0t2sitBwxUz5uAbQ=
X-Google-Smtp-Source: AGHT+IHld3yA7pZMM4j9W1AYfJL3YZl/msv9ucSw1eVQ8vGB3wsRDok/Qzcvy2JYC9NwbCxsuNZ/OZ5hbL022PTBeCI=
X-Received: by 2002:a05:6a00:2d97:b0:71c:5e1b:6871 with SMTP id
 d2e1a72fcca58-71e1dbc8d89mr4146646b3a.6.1728560667291; Thu, 10 Oct 2024
 04:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3> <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net>
In-Reply-To: <20241010113748.GL33184@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Oct 2024 13:44:14 +0200
Message-ID: <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_044428_490897_1EAF391B 
X-CRM114-Status: UNSURE (   9.70  )
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

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMTozN+KAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBTbyBtdWNoIGZvciB0aGUgZGViaWFuICdydXN0LWFs
bCcgcGFja2FnZSBhY3R1YWxseSBpbmNsdWRpbmcgYWxsLiBUaGFua3MKPiBCb3F1biBmb3IgdGVs
bGluZyBtZSBhYm91dCB0aGUgcnVzdGF2YWlsYWJsZSBtYWtlIHRhcmdldC4KClllYWgsIGBydXN0
LWFsbGAgZG9lcyBub3Qgc2VlbSB0byBpbmNsdWRlIGBiaW5kZ2VuYCwgd2hpY2ggSSBndWVzcyB3
YXMKdGhlIGlzc3VlICg/KS4KCkkgZ3Vlc3MgeW91IGhhdmUgaXQgd29ya2luZyBub3csIGJ1dCBm
b3IgdGhlIG5leHQgdGltZSAvIG90aGVycywgd2UKaGF2ZSB0aGUgYGFwdGAgbGluZSBmb3IgRGVi
aWFuIGF0Cmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3J1c3QvcXVpY2stc3RhcnQuaHRtbCNkZWJp
YW4uCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
