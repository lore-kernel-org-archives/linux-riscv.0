Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E17C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwodwqqiq3KTJczfNeSPseADEZQKRhJ9O1Y4aKES7Vg=; b=Ve+fnL3nKkNFAE
	B5dNpaaNbExIFcd9wCzJEjqQpVp+3Aw0Iz8qdL7zlP2A4f487RCFtm1nZuERpttzwkky3hfUX9G/Q
	G1S4Qhl1ed5WQd3U2j5zFJns8FF0xI6RTkmZAAH2GH9ja4QePuisTV+2eBu7/P9H+wE9+ne8rqraX
	b768gGruVY63DqxZyPCW7cV7y3sjAzgXWfm1lBBQY7ehbQ1HnfrAgG3Zr/1ZAkib1X08BupRxe1Wc
	3nVY0RJthlCrICE9AXYj1XJ1p7GmlISq/RMM7Cj3sEyDYytWOcX72nGIQnozaTXwr5MXwkirNiKhK
	MOlutWut434bfity2qJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTj1K-00000007Z1F-19i5;
	Sat, 27 Jan 2024 13:46:54 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTj1H-00000007Z0k-2ZMd
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 13:46:52 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6029e069e08so20345497b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 05:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706363210; x=1706968010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7l3zAsK78DoVXLg6iPo3Iy7at8rxO0NoQr3L4U6WXQ=;
        b=DpOxCTwgB/Ekq2W13tBI/DuPqVCgKRkF8jz8SPE3Jqgz82pJDqsD2EEq2HxTWUWqnF
         Etz8gQ4CSslTy0h7LuUpp1gb/7PCYZ/8AdNjHaAWwxLavJmrSR8B4qhRulFsdhADGrqM
         7kLRvUlDdQnyA9qcykTEH25Nly0xTDSgFNBjMu1QudwLzO8HHi7Xncb6Yr8VLOx/Gj8v
         tHgrY2J2ko4draC9LTFRhicv4gN0EFgg0wQfgmpM8mDCvgZ66boH1m8bAf9s6pGy2J6R
         MnO9XddFQz8eFrX3vuyde78VWDvhYA4Y1GgF5M00ItR5UJCt2mi3BJS9WbrsH+VHvkJs
         kLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706363210; x=1706968010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7l3zAsK78DoVXLg6iPo3Iy7at8rxO0NoQr3L4U6WXQ=;
        b=jTpug5i4RQbYbvBFlAMMcu3MpXF80NF98MnF/LacZrLHARj6xm2qGL8TmFB5NYPUNa
         /xtqcSLajggGMEyvkdFeDJJAaBeHUq6eI6QjVCDxIDAMaTclvSVvyRzqqSq9wSmfq3A5
         2+A2xiASRxc/PclqMeQ/z4e8A3MyU4C1sE/ZlqeUm6tirMsjd2u9uRAWrXukosmsj4U2
         WVLuERZD98aP4Ag4otEd1C6AoBiAbojIAbSgGNR1OmpLePmNFWWtoQJYNJbLjBSR4CYK
         lUqFa8QtL1m2OTdbp5s9+GHh8Sds1P/2Vq9DYzJqYqJVL+CSGGg6q6aedYR2lBTUNuJU
         SXFQ==
X-Gm-Message-State: AOJu0YySb6sbLGnfUMBe4+3nk542eLCviJfeeCL+pu9+EIxZ1rYCvCub
	J51Ez+Ze+TsbcbOxRgfDvOkcnMbhkeqZ/pvSzdN+lSc1maiILqiTeGPo1XV3FzMxZvZtA9vi2Q+
	8lpAQBwKjA1hgLTUGxfLXNpZQjO4=
X-Google-Smtp-Source: AGHT+IFJhLQKZrKheOpp5g5ZHWB5tU803FXCdkL1IkQzwwg5UM6oxYDf7ckc24PT/Pj4gwSFC+muNtf44ryFkoh0xeA=
X-Received: by 2002:a81:8411:0:b0:602:d19d:7853 with SMTP id
 u17-20020a818411000000b00602d19d7853mr1231429ywf.38.1706363210302; Sat, 27
 Jan 2024 05:46:50 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud>
In-Reply-To: <20240126-eccentric-jaywalker-3560e2151a92@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jan 2024 14:46:38 +0100
Message-ID: <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_054651_686644_ACC71825 
X-CRM114-Status: GOOD (  15.79  )
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

T24gRnJpLCBKYW4gMjYsIDIwMjQgYXQgMTE6MDHigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSXMgdGhhdCBldmVuIG5lZWRlZD8gV2UgYWxyZWFkeSBoYXZl
IEFSQ0hfU1VQUE9SVFNfQ0ZJX0NMQU5HIGFuZCBBRkFJVQo+IHJ1c3Qgc3VwcG9ydHMgaXQgaWYg
Y2xhbmcgZG9lcywgc28gYSBzZWNvbmQgb3B0aW9uIGlzIHN1cGVyZmx1b3VzPwoKRnJvbSBhIHF1
aWNrIGxvb2ssIEkgZG9uJ3Qgc2VlIGl0IGVuYWJsZWQgaW4gYW55IFJJU0MtViBidWlsdC1pbgp0
YXJnZXQgaW4gYHJ1c3RjYCB5ZXQuCgpJdCBtYXkgYWxzbyBzdGlsbCBiZSB0aGUgY2FzZSB0aGF0
IEtDRkkgbmVlZHMgc29tZSB0d2Vha3MgZm9yLCBzYXksClJJU0MtViwgYmVmb3JlIHRoZSBmbGFn
IGFjdHVhbGx5IHdvcmtzLCBpLmUuIHdlIGNvdWxkbid0IGp1c3QgdGVzdCB0aGUKZmxhZyBpbiB0
aGF0IGNhc2UgLS0gUmFtb246IGhvdyBsaWtlbHkgaXMgaXQgdGhhdCBSSVNDLVYgd291bGQgd29y
ayBpZgpLQ0ZJIHdvcmtzIGZvciBhYXJjaDY0IGFuZCB4ODZfNjQ/Cgo+IEknbSByZWFkaW5nIGJh
Y2sgd2hhdCBJIHdyb3RlLCBhbmQgSSBtdXN0IGhhdmUgYmVlbiB0cnlpbmcgdG8gZ2V0IG91dAo+
IHRoZSBkb29yIG9yIHNvbWV0aGluZyBiZWNhdXNlIG5vbmUgb2YgaXQgcmVhbGx5IG1ha2VzIHRo
YXQgbXVjaCBzZW5zZS4KPiBPZiBjb3Vyc2UgYW4gdW5rbm93biBvcHRpb24gc2hvdWxkIGJlIGRl
dGVjdGFibGUgYXQgYnVpbGQgdGltZSBhbmQgbm90Cj4gYmUgYSBzaWxlbnQgYnJlYWthZ2UuIE1h
eWJlIEkgc2hvdWxkIGhhdmUgd3JpdHRlbiB0aGUgcGF0Y2ggZm9yIHRoaXMKPiBiZWZvcmUgc2Vu
ZGluZyB0aGUgbWFpbCByYXRoZXIgdGhhbiB3cml0aW5nIHRoZSBtYWlsIGJhc2VkIG9uIHdoYXQg
d2FzCj4gaW4gbXkgaGVhZC4KCk5vIHdvcnJpZXMsIGl0IGhhcHBlbnMuIEkgcHJvYmFibHkgYWRk
ZWQgdG8gdGhlIGNvbmZ1c2lvbiB3aGVuIEkKcmVwbGllZCB3aXRoIHRoZSAidGVzdGluZyB0aGUg
dW5zdGFibGUgZmxhZyIuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
