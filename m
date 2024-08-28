Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8701C54FA6
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBsRHnFxeBfyO/5afSE62/AwITy+5EdVp2OtlRULkR0=; b=JRTGC4RzXeLZwa
	sFlku0nNJiQrFVoI6+Pbfm0ybPtMXvIKKh4CtHojmYkKlRUAXz8pHqfbGwk3/Qw3gYT5EpWw0NRse
	tHhKFl29gL5iPaV37gvwI5W8Q863jVUUqsC7KSkx6/vFdv2x7b/kJwYqBkreAUOUv0GqLiGqBICTg
	FGl2sG/1nRYZBNuFjv12BLUPlksVGj6bBLaS9SSgSPCk8jHPUcVA5dSk3DqWU7mvsEDGGzSthWJ5l
	riwbVDogkNLb6pBpnXp+6QE3krf7IH8AjdVus432lJ2jCG95Fc+OUEmUklivllcWtl7C05CIxI10R
	W2ZPXIFRMu8VQhUL/dkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjHv5-0000000FKwr-23GF;
	Wed, 28 Aug 2024 12:37:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjHv1-0000000FKvo-3ybY
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 12:37:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-533521cd1c3so7625259e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724848617; x=1725453417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LU8gBC7gh9KYhQpTD3UR8Co3PXakCVXINF1/hXa3PLE=;
        b=YyeFOcQfdWNeNqMpQdjGOxX905jdyyMDC+sfWf05NuG20WpWj6TJ2Wz60zVH4O+gRg
         AteHWr55FTVYIQJf5jjB2lQmdpMhwpftBpL/Zfu//a7MOle9/lSBmpqrsf8zZvscKbob
         2w1Y34oeYt1U7U2bISiAhSqsIHuo6MQu3fWkeyXNkbCPGi2jEAarQI/FsqWD7YB6VQng
         RCnrRYdDyTJAEK4JdDTg+VWPmG7f1TZueKfVv3WdDBXHdVZFy67ui7xoIRIUZCbeQ2Bc
         oLSqIUxfJk+FzqjbHupKipXdtRMS2vm4Axs8htFHXevsxcM7sOMmTMevOUq+JH7t8OXl
         iTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848617; x=1725453417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LU8gBC7gh9KYhQpTD3UR8Co3PXakCVXINF1/hXa3PLE=;
        b=uSdffEmUp7BiRM6tNrW+W+ahGWPwTSI4FWBrBD4jX2ztlK1BJ2quJJmK/UgVgpE/MB
         7KYktw7AhtifhDv62qchEcIpPClTcWHkTc3YHtRtI7T56r5+XLQw2DfRTPNQIILlPbD+
         2cIBEsT1gtuXvURMLPvX4u2Pda0c1NK+CGOLv5JN1i3ocZEn5FkZbdpkWhkD9OvX665S
         Z4i6gGfw7l/Eo4gMOV2mJnRnbXib/fldilYILiBM1FLc5gC2VnfAfIyJG8mHiFX+HEPS
         iDleSz2xruNQT1r2nIS80oukVdf1Ga2uVlv9nk9K9flESGEkdz4eaJmnhNkBzNlyWx30
         8F1w==
X-Forwarded-Encrypted: i=1; AJvYcCWQRLvKJiL96r0LLIxLIpE94D5OGywnmQk0U+x3YEikyOpyL9APHQDzF0khuX6q5LtD1U455Gs2PEhKLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyepz9tewactqYgn0to6jQpH1UU/U3SfOUBidYSTw9OBekxhIS4
	LAfzdt3h+vMbVXkeVf9j/xn7e5HIF0ZF/XPvFBGkcVtk8+pxVw644XUMjuTnzk0IZY3DfsUu95w
	DBEr8b96v6gPZARjSYUeYoxT+1VE5pYzEO0iCzw==
X-Google-Smtp-Source: AGHT+IHpFO6yuQVGJZrGD/WbDSfSLGOtjuiyomFUN7Es+C+tU0dva1fGE6E/R+1C2A5roG4H821o08EF26dNGZYQhvI=
X-Received: by 2002:a05:6512:23a3:b0:52e:d0f8:2d43 with SMTP id
 2adb3069b0e04-53438846f57mr13164571e87.17.1724848617111; Wed, 28 Aug 2024
 05:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240826165210.124696-1-alexghiti@rivosinc.com> <20240827125335.GD4772@willie-the-truck>
In-Reply-To: <20240827125335.GD4772@willie-the-truck>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 28 Aug 2024 14:36:46 +0200
Message-ID: <CAHVXubiwHe+5nD0kftRwnNdqAhP1ofSoaUzk4vhDKPrYXVz88g@mail.gmail.com>
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
To: Will Deacon <will@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_053700_251369_31A29343 
X-CRM114-Status: GOOD (  21.19  )
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

SGkgV2lsbCwKCk9uIFR1ZSwgQXVnIDI3LCAyMDI0IGF0IDI6NTPigK9QTSBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDA2OjUy
OjEwUE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEFzIHJlcG9ydGVkIGluIFsx
XSwgdGhlIHVzZSBvZiBzbXBfcHJvY2Vzc29yX2lkKCkgaW4KPiA+IHBtdV9zYmlfZGV2aWNlX3By
b2JlKCkgbXVzdCBiZSBwcm90ZWN0ZWQgYnkgZGlzYWJsaW5nIHRoZSBwcmVlbXB0aW9uLCBzbwo+
ID4gc2ltcGxlIHVzZSBnZXRfY3B1KCkvcHV0X2NwdSgpIGluc3RlYWQuCj4gPgo+ID4gUmVwb3J0
ZWQtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgo+ID4gQ2xvc2VzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDgyMDA3NDkyNS5SZU1LVVBQM0BsaW51
dHJvbml4LmRlLyBbMV0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgfCA3ICsrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBpbmRleCAzMWExN2E1NmViM2Iu
LjI1YjFiNjk5YjNlMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMKPiA+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IEBAIC0xMzczLDEx
ICsxMzczLDE1IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+Cj4gPiAgICAgICAvKiBTQkkgUE1VIFNuYXBzcGhvdCBpcyBv
bmx5IGF2YWlsYWJsZSBpbiBTQkkgdjIuMCAqLwo+ID4gICAgICAgaWYgKHNiaV92Ml9hdmFpbGFi
bGUpIHsKPiA+ICsgICAgICAgICAgICAgaW50IGNwdTsKPiA+ICsKPiA+ICAgICAgICAgICAgICAg
cmV0ID0gcG11X3NiaV9zbmFwc2hvdF9hbGxvYyhwbXUpOwo+ID4gICAgICAgICAgICAgICBpZiAo
cmV0KQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X3VucmVnaXN0ZXI7Cj4gPgo+
ID4gLSAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX3NuYXBzaG90X3NldHVwKHBtdSwgc21wX3By
b2Nlc3Nvcl9pZCgpKTsKPiA+ICsgICAgICAgICAgICAgY3B1ID0gZ2V0X2NwdSgpOwo+ID4gKwo+
ID4gKyAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX3NuYXBzaG90X3NldHVwKHBtdSwgY3B1KTsK
PiA+ICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIC8q
IFNuYXBzaG90IGlzIGFuIG9wdGlvbmFsIGZlYXR1cmUuIENvbnRpbnVlIGlmIG5vdCBhdmFpbGFi
bGUgKi8KPiA+ICAgICAgICAgICAgICAgICAgICAgICBwbXVfc2JpX3NuYXBzaG90X2ZyZWUocG11
KTsKPiA+IEBAIC0xMzkxLDYgKzEzOTUsNyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZGV2aWNlX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICovCj4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9lbmFibGUoJnNi
aV9wbXVfc25hcHNob3RfYXZhaWxhYmxlKTsKPiA+ICAgICAgICAgICAgICAgfQo+ID4gKyAgICAg
ICAgICAgICBwdXRfY3B1KCk7Cj4KPiBBcmUgeW91IHN1cmUgaXQncyBzYWZlIHRvIGVuYWJsZSB0
aGUgc3RhdGljIGtleSB3aXRoIHByZWVtcHRpb24gZGlzYWJsZWQ/Cj4gSSB0aG91Z2h0IHRoYXQg
Y291bGQgYmxvY2sgb24gYSBtdXRleC4KClllcCwgaXQgc2VlbXMgeW91J3JlIHJpZ2h0LCB0aGFu
a3MgZm9yIGp1bXBpbmcgaW4uCgpJJ20gZGlzY3Vzc2luZyB3aXRoIEF0aXNoIGhvdyB0byBmaXgg
dGhhdCBkaWZmZXJlbnRseSwgSSdsbCBiZSBiYWNrCndpdGggYW5vdGhlciB2ZXJzaW9uIHZlcnkg
c29vbi4KClRoYW5rcyBhZ2FpbiwKCkFsZXgKCj4KPiBXaWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
