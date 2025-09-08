Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD29CA1016
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG3YWWg8AljFQiTFxHixMMPxXuv2D1MQf0D0vdtcR0w=; b=SLWV3f7wWFV1Uz
	H6s00aB5fKcKdPZjy7VRYJ+PadeEqRNx+SQigaIiibVGJMdE9rMgjVg2AiElBw1A8s4Zj6EzDJEsH
	X0DIb9DbQuQtU+YfjmJVQGI3TEzRd5Zfq3gC3NY0dD3o10rW8MCAA0kmZ3V1pGjMr5VkHQCLJbpDf
	Iyzsvl7lKDxgYv38nO8EsXEaIvJAto671IJa9czMUbFZGc+Ml8hzy8x9sF3jzFEEIgKJ8znwyUmCf
	0xRH6BhvfVjPmGdXhdHaSwkjP889C5sE2bqxcRtxsGmEPIdSx+5qxOsz+Zjtay6PO0HpBpizp6Z0i
	QjiQrsDw+DAwXq1nYfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfOS-000000014oF-27N6;
	Mon, 08 Sep 2025 17:11:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbm9-0000000HKhr-1TZA
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 13:19:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so3425500f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Sep 2025 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757337555; x=1757942355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWM82YYVgDfmnz3ZFulMlOndRktGXnF272wdon8Wdvw=;
        b=PqJGSaffzDGeGBD8GQEN7PXCSRLlfe6rb5FgM6IkMzXNZMydXfWJS7I+mWmFWLz7oI
         GBi1OaRsk6TtX7WFg9ykuHTGig84SD4JEDG25XD12xHC6sZPBG/ypjOR8Chzbd93SLDm
         IycB8m8FsObUcmmgl5nsOyNdOnEVDk0KINNDjegFH3mOvTTT1t/WoSRLzyu6V5ZO8vCD
         Eo2Khzw2mhrxx3Bnf48pGkmx6FpaD2SoYHXNXgPNQjYk5ABGJ2H+8yPncVc5HoaixMIZ
         Oe61M6dTpCyDXyo97TW/KeqB2w1kopprPxeC8aBo8q8prSLXC+DbrYxnEm+LCO6MfsyL
         F7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337555; x=1757942355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWM82YYVgDfmnz3ZFulMlOndRktGXnF272wdon8Wdvw=;
        b=nrcOIz2XymijjV9TdTo6DvAXwTBauKQ2Gagag1T1NKH5WTTgHw2zYslShQ78GMAiXk
         PiYCmpbdmADmtzVri0g7JG0pHw+nvZmbEtvvvDLYv2IOzxsxLD7pEqd4eDEDxbW266Px
         HyH/lBOWAOdlxFQPadcyriNC3QhLLryENgQIIhljUkDOsRQUw/GYsYLAGq2Mhm0NRTon
         XxQaEWeHR9Fe0nDjQOt75z5LQjoH7UMC6GrUA41kImvMoGiSXjNG0Y0Jja/ZieGIDARH
         6hNONahS3GCZ5PD3Ky5XP9BA2scSxfuHHbfn4/PJmP5ti+KPgpB9WG00lqPosVXzlN4S
         8hXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQcG3e96zcRshtUIux9Lp1JF6bsCCuVVx3UhdLqjalzYP7DDSCOhLQDrxHoA9Va0O7zL/86HE5kFSumA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEXy2parirJ6rV6AOms2IYNcJSwYmzrQhJskrKW+0LKByhjlrs
	rZkBvdAoXJYDH4VVJ77ezpk2XCHwpMRRR5nYd8ru5dKthRtQleCmx0++2l86gK6kq9yzkKQDp5f
	ZHWdbUqTrf5TODCN5YiGo/8WpfE2egqXIghN4Aimt
X-Gm-Gg: ASbGncuMiFabRgYQKhSsxy78DdC/Vx/Trr1mwWYW7JRD/8O/xgGaKX1o/se0/XyQqDA
	//VU7VjjvkexJpnZsNPNczXmwmz+7bjBts/4opOaaYcXg7EoKwzETux/AC8PaASAdqplIJQPTrN
	m69F5rvdRXNNqXcTnO94srd7ZIVjPVH/1jGxzgX+Egj4xCsRq2kn0oW+34Nwn7ZTHMo9ErLjxAs
	hnV3pd4ypd7ZlbJQZYGp3h+ovKe0tBSyhKTs92W/yv+8F0mrVDb8Zt0KlPXzrxb20dn8PqEV+KJ
	Dj8pbfoU7hg=
X-Google-Smtp-Source: AGHT+IFjSj9fcvGgclrt2uVXMQc5eZzeD36hnbx/1QwTeUfZ8T3zw8xE5Ei6zyAbQg85xb3R6cvvnoz9yGYt46etz/w=
X-Received: by 2002:a5d:5f47:0:b0:3cf:ef30:c819 with SMTP id
 ffacd0b85a97d-3e627b712cfmr5610348f8f.4.1757337554607; Mon, 08 Sep 2025
 06:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-distill-lint-1ae78bcf777c@spud>
In-Reply-To: <20250908-distill-lint-1ae78bcf777c@spud>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Sep 2025 15:19:02 +0200
X-Gm-Features: AS18NWCUVBew4vUh8r_LLedLxLSYsoQ9pdJJZqEHSkY4P6yHIK6L_lJbY-hCLEI
Message-ID: <CAH5fLghqe8sxLD3vk6VLbA8UoMgEw1iNxgE8uETAeCnRz1D0DQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_061917_406387_82756346 
X-CRM114-Status: GOOD (  15.09  )
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

T24gTW9uLCBTZXAgOCwgMjAyNSBhdCAzOjEz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBUaGUga2VybmVsIHVzZXMgdGhlIHN0YW5kYXJkIHJ1c3RjIHRhcmdldHMg
Zm9yIG5vbi14ODYgdGFyZ2V0cywgYW5kIG91dAo+IG9mIHRob3NlIG9ubHkgNjQtYml0IGFybSdz
IHRhcmdldCBoYXMga2NmaSBzdXBwb3J0IGVuYWJsZWQuIEZvciB4ODYsIHRoZQo+IGN1c3RvbSA2
NC1iaXQgdGFyZ2V0IGVuYWJsZXMga2NmaS4KPgo+IFRoZSBIQVZFX0NGSV9JQ0FMTF9OT1JNQUxJ
WkVfSU5URUdFUlNfUlVTVEMgY29uZmlnIG9wdGlvbiB0aGF0IGFsbG93cwo+IENGSV9DTEFORyB0
byBiZSB1c2VkIGluIGNvbWJpbmF0aW9uIHdpdGggUlVTVCBkb2VzIG5vdCBjaGVjayB3aGV0aGVy
IHRoZQo+IHJ1c3RjIHRhcmdldCBzdXBwb3J0cyBrY2ZpLiBUaGlzIGJyZWFrcyB0aGUgYnVpbGQg
b24gcmlzY3YgKGFuZAo+IHByZXN1bWFibHkgMzItYml0IGFybSkgd2hlbiBDRklfQ0xBTkcgYW5k
IFJVU1QgYXJlIGVuYWJsZWQgYXQgdGhlIHNhbWUKPiB0aW1lLgo+Cj4gT3JkaW5hcmlseSwgYSBy
dXN0Yy1vcHRpb24gY2hlY2sgd291bGQgYmUgdXNlZCB0byBkZXRlY3QgdGFyZ2V0IHN1cHBvcnQK
PiBidXQgdW5mb3J0dW5hdGVseSBydXN0Yy1vcHRpb24gZmlsdGVycyBvdXQgdGhlIHRhcmdldCBm
b3IgcmVhc29ucyBnaXZlbgo+IGluIGNvbW1pdCA0NmUyNGE1NDVjZGI0ICgicnVzdDoga2FzYW4v
a2J1aWxkOiBmaXggbWlzc2luZyBmbGFncyBvbiBmaXJzdAo+IGJ1aWxkIikuIEFzIGEgcmVzdWx0
LCBpZiB0aGUgaG9zdCBzdXBwb3J0cyBrY2ZpIGJ1dCB0aGUgdGFyZ2V0IGRvZXMgbm90LAo+IGUu
Zy4gd2hlbiBidWlsZGluZyBmb3IgcmlzY3Ygb24geDg2XzY0LCB0aGUgYnVpbGQgd291bGQgcmVt
YWluIGJyb2tlbi4KPgo+IEluc3RlYWQsIG1ha2UgSEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lO
VEVHRVJTX1JVU1RDIGRlcGVuZCBvbiB0aGUgb25seQo+IHR3byBhcmNoaXRlY3R1cmVzIHdoZXJl
IHRoZSB0YXJnZXQgdXNlZCBzdXBwb3J0cyBpdCB0byBmaXggdGhlIGJ1aWxkLgo+Cj4gQ0M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogY2E2MjdlNjM2NTUxZSAoInJ1c3Q6IGNmaTog
YWRkIHN1cHBvcnQgZm9yIENGSV9DTEFORyB3aXRoIFJ1c3QiKQo+IFNpZ25lZC1vZmYtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZpZXdlZC1ieTogQWxp
Y2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
