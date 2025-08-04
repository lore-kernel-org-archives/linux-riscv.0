Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE2C87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fe53V8QSH+9Bhgxo7wK/p39zoX9vl2WcjCeFAzY7i2w=; b=0VjmRGAG6Mzhuj
	uPGn8WcpLB2nxD5VJdfHg2e/D4Xg9urQh+b8oClNk9PbZjEwlwxcUR5Ht8GKmudKMSnssZ0/rxbSM
	mq7FQjVkKvMTwV6qvsUOk73Ibqb+O7jUQKUhXL9FVHoDbkHD2kPaVyp04VGQjmL/rSVhJvG0WHVql
	EQo0AN/Ryr+zwpxS8uu6+Xk8PB8kj60bkhsv3TnAemmtK06yoS3kmCWiuW6rquWqduNKCaxm0Aeuq
	I5pLolftOTBiow1YXrrMcpkRbHA7RJvMxODH5/AhlUOwepimT1XqOMCrvd0zeV79yR4e1uG95Wid+
	odEe6vjYayH1el26C6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj4JO-0000000BRZ1-2uTk;
	Mon, 04 Aug 2025 23:09:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj4JL-0000000BRYZ-3E9P
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 23:09:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-31ef3e9f0adso390141a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Aug 2025 16:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754348983; x=1754953783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrE8b9KIiuoHC4GcqpFRJBb0WIhhrwvoYsW5y95hd+0=;
        b=D85eY4+o/FfBY0REvsa+QoohkLi9RE9beulzOg/4B82skCl1nuYHszcLXt4F9HIop0
         34A8Erna4Mr8l7DVYgpDYBllChfwuVS6NubZdgyXEbajxiNKrI+FGwNiXER3JGMnH7bQ
         qCUtr/36dgrVbvTjXlUuB0kU6wYwR0x7GQWULPjzynOMYoIyHCguEGVZn/uryQe8zgws
         vTWZE8qXuTCursUd67H8Tjh0huijUmwDo4pfJTOcEejHm/K2xtJ5wIJfBhE3PCYFU+X/
         GyS2PD8LRmk+kiKPp5RH2c5YGUz35L/M2u8AVEfYnensAw/HXg955ttR1uHZlgSCLG/F
         y4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754348983; x=1754953783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrE8b9KIiuoHC4GcqpFRJBb0WIhhrwvoYsW5y95hd+0=;
        b=RVSrjZtl0AWiRgZ1T12mAcQAATO6HsoRsldLEvO2sxIjw5u9yFv9c3HK44cIA56jdN
         u5vCznJR/vppNSc6YOn3eu4jrjEUaH46wUM0HdYHD34fUJQSRM2UjvMDlXwJ/l9swBn6
         mgItLExeHQ8KpZUfLJgejcne5erePvk9Bl+hTJMFTLx7kdY1f+upCnY20ee3ns1DoMJJ
         D2yd9q7WGeJ3zouA/HahTaMatZf/0uDHQKUZc9HwfJCYqFpfDIu1GGaTS+LlziQ9i7m3
         vPKXJ1Q4npwoOToT3Fwt0nM51pdI7gshqCUWx9luQMuigmYFT03KMejbT0F1V0CJs1g2
         +g2g==
X-Forwarded-Encrypted: i=1; AJvYcCW5fPMxz50m0mwfF2w4AQw0m2Xz7o4aPMJ3GKJXBHf+t6Oyyyqgfk5vB7Ie+HMbM/od2jKhIZdFyU2QWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlx9LPd8zKakM83rvQdUOxiKhaAtbFR3aO1pnrud110moX/1/+
	4Z1RPadg9TXdEE7qsErx6Ei12/cGjtsEvOjPN0VI8MQcU1efo9An7B/uSN1n/7MRmChYmPSTBS6
	6kW8avdpnPnV4ZiByr2im6l3KgpQ/v1A=
X-Gm-Gg: ASbGncurebs0Z8EB2cm8Q5TO1aM35SZQSGlOZTxyYcy6M+9LLRUFf9MJggPcE61mK6f
	0unnhQL4aNE3tQECm8QLdUx8YOhs54JGn81UgBYim99L6lUVJd86M+K8nsn21EJ4LQWe7IvB0Jk
	PkFLvuvN0vhjBpu4ew8QqL+jhfDKQOCVAUs1HzU+sAaX5ZsuxGV+BtVgadS1lVqW3YdNrgh+10l
	CDxU4Rz
X-Google-Smtp-Source: AGHT+IH1uFH1KAXD6GBBvZtSK4gxmxnIP3aOIMcwoGpeUoxH+7GptC/maaoOxBcynoToxbAD/EDonUS0Jy9v0p7iqok=
X-Received: by 2002:a17:90b:1804:b0:31f:55a7:6504 with SMTP id
 98e67ed59e1d1-321162c71c9mr7131328a91.5.1754348982575; Mon, 04 Aug 2025
 16:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
 <CGME20250717090833eucas1p16c916450b59a77d81bd013527755cb21@eucas1p1.samsung.com>
 <20250717-rust-next-pwm-working-fan-for-sending-v12-3-40f73defae0c@samsung.com>
 <42C9DF97-2E0F-453B-800A-1DA49BF8F29F@collabora.com> <8ad10cc3-6e7d-4a8b-b6f6-9568403ee2b3@samsung.com>
In-Reply-To: <8ad10cc3-6e7d-4a8b-b6f6-9568403ee2b3@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 Aug 2025 01:09:30 +0200
X-Gm-Features: Ac12FXxpw2EiBASGKxIRYM6i3YaHMXDUJFrbm7UTkLYwIhJtTP30cGnZkc_aEBs
Message-ID: <CANiq72=MvuhdcBoXKPMCzUQbFW2xEifZ9nO0OoXESGN3=R_1tQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] rust: pwm: Add complete abstraction layer
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_160943_806306_52E0EC54 
X-CRM114-Status: GOOD (  10.24  )
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCAxMjoyOeKAr0FNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gU28gSSBkaWQgdHJ5IHRoaXMgYW5kIGl0
IGRvZXMgd29yaywgaG93ZXZlciBpdCByZXN1bHRzIGluIGEgY3J5cHRpYwo+IGxpbmtlciBlcnJv
cjoKPiBsZC5sbGQ6IGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBydXN0X2J1aWxkX2Vycm9yCj4g
Pj4+IHJlZmVyZW5jZWQgYnkgcHdtX3RoMTUyMC4yYzJjMzkzODMxMjExNGMtY2d1LjAKPiA+Pj4g
ICAgICAgICAgICAgICBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLm86KDxrZXJuZWw6OnB3bTo6QWRh
cHRlcjxwd21fdGgxNTIwOjpUaDE1MjBQd21Ecml2ZXJEYXRhPj46OnJlYWRfd2F2ZWZvcm1fY2Fs
bGJhY2spIGluIGFyY2hpdmUgdm1saW51eC5hCj4gPj4+IHJlZmVyZW5jZWQgYnkgcHdtX3RoMTUy
MC4yYzJjMzkzODMxMjExNGMtY2d1LjAKPiA+Pj4gICAgICAgICAgICAgICBkcml2ZXJzL3B3bS9w
d21fdGgxNTIwLm86KDxrZXJuZWw6OnB3bTo6QWRhcHRlcjxwd21fdGgxNTIwOjpUaDE1MjBQd21E
cml2ZXJEYXRhPj46OnJvdW5kX3dhdmVmb3JtX3RvaHdfY2FsbGJhY2spIGluIGFyY2hpdmUgdm1s
aW51eC5hCj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLnZtbGludXg6OTE6IHZtbGlu
dXhdIEVycm9yIDEKPgo+IEkgYXNzdW1lIHRoaXMgY291bGQgYmUgZml4ZWQgYXQgc29tZSBwb2lu
dCB0byBiZXR0ZXIgZXhwbGFpbiB3aGF0Cj4gZmFpbGVkPwoKWWVzLCBpdCB3b3VsZCBiZSBuaWNl
IHRvIGltcHJvdmUgdGhhdCAtLSBJIGtlZXAgc29tZSByZWZlcmVuY2VzIGF0Cmh0dHBzOi8vZ2l0
aHViLmNvbS9SdXN0LWZvci1MaW51eC9saW51eC9pc3N1ZXMvMzU0ICgiYnVpbGRfYXNzZXJ0Iiku
CgpJZGVhbGx5IHdlIHdvdWxkIGdldCBzb21lIGNvbXBpbGVyIHN1cHBvcnQgZm9yIHRob3NlLgoK
Q2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
