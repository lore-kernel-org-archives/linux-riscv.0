Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E5FC3DA6E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 01:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/fqsylZyR7mrcJj0QtmXVg3WGe24be4JcwNzKMSfJs=; b=kOjNmPE7iAR9cG
	M0qMJ/ZZEZ47b4oeWsds4scNmWNfweGhgV4cI6r053ByxquNOtgYR+XRmNvhz/Dh2dIH0YF7d9yo1
	DcuYv7AJUisLYE/gmiU83gwkR6poUbQuHK/b+JDfQauyQyoLYO36LNC1kJquM73uPLhtH4rPitGup
	AfKZWjaSLIGwOzKyuxy+ZACgTO4zO1Ze47c/BsLT9EWSv93et7Wf2galYGUaBfw5jCNgCQsE1IW1V
	144P6iY4B5L/v+dKAfk+V0ljiz383MDVgXIk7wIsewj1cfSeYsV0vgkC1OH+PxDrxnSysV7jTePia
	mBhmfKEGfkMd51olZDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN0re-006d1N-0J;
	Tue, 09 Jan 2024 01:25:10 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN0rb-006d0H-0G
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 01:25:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ccb923c4d2so25486921fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 17:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1704763500; x=1705368300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LI7RsQHT+MQ0HPpr0l5UjU5EPgbfYzbdDPhebxTuko=;
        b=UZVvtE94OdcaaP2iJ90gHoWmHr33PcDTOIi/xH53cNpyGQzswXjllkBBgZwS4Och2w
         Lp72aXn3RBHQdbp9R60nMEUCNiwDGnvLAENqx3j0JRw2Edb+2q2ZWHdJFuHVzGgIcWRu
         4jlj3gvX8gmYV3NgVh70aBSBopnRgXMfP8JgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704763500; x=1705368300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LI7RsQHT+MQ0HPpr0l5UjU5EPgbfYzbdDPhebxTuko=;
        b=IrUOwMfROuW1Bc94F4HG/tOW06m8AEyBAGho6yPeaHcPQWg2TUu7BoT9y1HFz1n/U0
         jCDZGdtG3b8akjP5CHtYfrKWdgC9jC5wXuiVvZrh4tDjw73yKSHwvyR6FnZ28xTitneH
         gGGh5C2QCTnB7g/OenqGJ+umGxZbzhBz0Yakc5l1WzN+1dXQrPRKv9b8fVkXt+9IvZPB
         OUy3bRdODHSPyKXHuNm3ej+qGCZV9CrHp41yy0Q4BThjai9Lz8xjoth2n3cqK4XJfZyj
         GNXT9EUH+udkXNdYuLMgCCmvozeOfYEyUfiTmADxKQOz5TvnnxYNRlZz1onpXsn+d6Dl
         vc7w==
X-Gm-Message-State: AOJu0Ywt9ntVNhCAnTzT7ydUS3cSkVInNrmA0gvq622wDKzguuEFyxpe
	99oxxf0SwzyezptqROUu34qbKh0dKsKhyMFjgR2g5AyJRvrm
X-Google-Smtp-Source: AGHT+IEflcpw5PPeAqRFQj+i1KPY2cKdFJ6LjrWaNQDuSU8haUzGWHGve+ARfSRu5qj9ZC0cKrYONFwvq/ROkyUWIr8=
X-Received: by 2002:a2e:9212:0:b0:2cc:da2a:d266 with SMTP id
 k18-20020a2e9212000000b002ccda2ad266mr1270020ljg.71.1704763500076; Mon, 08
 Jan 2024 17:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com> <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com>
In-Reply-To: <20240108-fencei-v5-2-aa1e51d7222f@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Jan 2024 17:24:47 -0800
Message-ID: <CAOnJCUJQ-M1bVC_VhogMLo47mRyk3Pzq-GFH5P7ADn70BN9ObA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX
 prctl
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_172507_119832_814B8791 
X-CRM114-Status: GOOD (  24.62  )
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

T24gTW9uLCBKYW4gOCwgMjAyNCBhdCAxMDo0MuKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gUHJvdmlkZSBkb2N1bWVudGF0aW9uIHRoYXQgZXhw
bGFpbnMgaG93IHRvIHByb3Blcmx5IGRvIENNT0RYIGluIHJpc2N2Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdCB8IDg4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QgfCAg
MSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9jbW9keC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvY21vZHgucnN0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmFmZDcwODZjMjIyYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvY21vZHgucnN0Cj4gQEAgLTAsMCArMSw4OCBAQAo+ICsuLiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMAo+ICsKPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gK0NvbmN1
cnJlbnQgTW9kaWZpY2F0aW9uIGFuZCBFeGVjdXRpb24gb2YgSW5zdHJ1Y3Rpb25zIChDTU9EWCkg
Zm9yIFJJU0MtViBMaW51eAo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArCj4gK0NNT0RYIGlz
IGEgcHJvZ3JhbW1pbmcgdGVjaG5pcXVlIHdoZXJlIGEgcHJvZ3JhbSBleGVjdXRlcyBpbnN0cnVj
dGlvbnMgdGhhdCB3ZXJlCj4gK21vZGlmaWVkIGJ5IHRoZSBwcm9ncmFtIGl0c2VsZi4gSW5zdHJ1
Y3Rpb24gc3RvcmFnZSBhbmQgdGhlIGluc3RydWN0aW9uIGNhY2hlCj4gKyhpY2FjaGUpIGFyZSBu
b3QgZ3VhcmFudGVlZCB0byBiZSBzeW5jaHJvbml6ZWQgb24gUklTQy1WIGhhcmR3YXJlLiBUaGVy
ZWZvcmUsIHRoZQo+ICtwcm9ncmFtIG11c3QgZW5mb3JjZSBpdHMgb3duIHN5bmNocm9uaXphdGlv
biB3aXRoIHRoZSB1bnByaXZpbGVnZWQgZmVuY2UuaQo+ICtpbnN0cnVjdGlvbi4KPiArCj4gK0hv
d2V2ZXIsIHRoZSBkZWZhdWx0IExpbnV4IEFCSSBwcm9oaWJpdHMgdGhlIHVzZSBvZiBmZW5jZS5p
IGluIHVzZXJzcGFjZQo+ICthcHBsaWNhdGlvbnMuIEF0IGFueSBwb2ludCB0aGUgc2NoZWR1bGVy
IG1heSBtaWdyYXRlIGEgdGFzayBvbnRvIGEgbmV3IGhhcnQuIElmCj4gK21pZ3JhdGlvbiBvY2N1
cnMgYWZ0ZXIgdGhlIHVzZXJzcGFjZSBzeW5jaHJvbml6ZWQgdGhlIGljYWNoZSBhbmQgaW5zdHJ1
Y3Rpb24KPiArc3RvcmFnZSB3aXRoIGZlbmNlLmksIHRoZSBpY2FjaGUgd2lsbCBubyBsb25nZXIg
YmUgY2xlYW4uIFRoaXMgaXMgZHVlIHRvIHRoZQo+ICtiZWhhdmlvciBvZiBmZW5jZS5pIG9ubHkg
YWZmZWN0aW5nIHRoZSBoYXJ0IHRoYXQgaXQgaXMgY2FsbGVkIG9uLiBUaHVzLCB0aGUgaGFydAo+
ICt0aGF0IHRoZSB0YXNrIGhhcyBiZWVuIG1pZ3JhdGVkIHRvIG1heSBub3QgaGF2ZSBzeW5jaHJv
bml6ZWQgaW5zdHJ1Y3Rpb24gc3RvcmFnZQo+ICthbmQgaWNhY2hlLgo+ICsKPiArVGhlcmUgYXJl
IHR3byB3YXlzIHRvIHNvbHZlIHRoaXMgcHJvYmxlbTogdXNlIHRoZSByaXNjdl9mbHVzaF9pY2Fj
aGUoKSBzeXNjYWxsLAo+ICtvciB1c2UgdGhlIGBgUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9D
VFhgYCBwcmN0bCgpIGFuZCBlbWl0IGZlbmNlLmkgaW4KPiArdXNlcnNwYWNlLiBUaGUgc3lzY2Fs
bCBwZXJmb3JtcyBhIG9uZS1vZmYgaWNhY2hlIGZsdXNoaW5nIG9wZXJhdGlvbi4gVGhlIHByY3Rs
Cj4gK2NoYW5nZXMgdGhlIExpbnV4IEFCSSB0byBhbGxvdyB1c2Vyc3BhY2UgdG8gZW1pdCBpY2Fj
aGUgZmx1c2hpbmcgb3BlcmF0aW9ucy4KPiArCj4gK3ByY3RsKCkgSW50ZXJmYWNlCj4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArQ2FsbCBwcmN0bCgpIHdpdGggYGBQUl9SSVNDVl9TRVRf
SUNBQ0hFX0ZMVVNIX0NUWGBgIGFzIHRoZSBmaXJzdCBhcmd1bWVudC4gVGhlCj4gK3JlbWFpbmlu
ZyBhcmd1bWVudHMgd2lsbCBiZSBkZWxlZ2F0ZWQgdG8gdGhlIHJpc2N2X3NldF9pY2FjaGVfZmx1
c2hfY3R4Cj4gK2Z1bmN0aW9uIGRldGFpbGVkIGJlbG93Lgo+ICsKPiArLi4ga2VybmVsLWRvYzo6
IGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4gKyAgICAgICA6aWRlbnRpZmllcnM6IHJpc2N2
X3NldF9pY2FjaGVfZmx1c2hfY3R4Cj4gKwoKRG9jdW1lbnQgdGhlIGFyZ3VtZW50cyBvZiB0aGUg
cHJjdGwgYXMgd2VsbCA/Cgo+ICtFeGFtcGxlIHVzYWdlOgo+ICsKPiArVGhlIGZvbGxvd2luZyBm
aWxlcyBhcmUgbWVhbnQgdG8gYmUgY29tcGlsZWQgYW5kIGxpbmtlZCB3aXRoIGVhY2ggb3RoZXIu
IFRoZQo+ICttb2RpZnlfaW5zdHJ1Y3Rpb24oKSBmdW5jdGlvbiByZXBsYWNlcyBhbiBhZGQgd2l0
aCAwIHdpdGggYW4gYWRkIHdpdGggb25lLAo+ICtjYXVzaW5nIHRoZSBpbnN0cnVjdGlvbiBzZXF1
ZW5jZSBpbiBnZXRfdmFsdWUoKSB0byBjaGFuZ2UgZnJvbSByZXR1cm5pbmcgYSB6ZXJvCj4gK3Rv
IHJldHVybmluZyBhIG9uZS4KPiArCj4gK2Ntb2R4LmM6Ogo+ICsKPiArICAgICAgICNpbmNsdWRl
IDxzdGRpby5oPgo+ICsgICAgICAgI2luY2x1ZGUgPHN5cy9wcmN0bC5oPgo+ICsKPiArICAgICAg
IGV4dGVybiBpbnQgZ2V0X3ZhbHVlKCk7Cj4gKyAgICAgICBleHRlcm4gdm9pZCBtb2RpZnlfaW5z
dHJ1Y3Rpb24oKTsKPiArCj4gKyAgICAgICBpbnQgbWFpbigpCj4gKyAgICAgICB7Cj4gKyAgICAg
ICAgICAgICAgIGludCB2YWx1ZSA9IGdldF92YWx1ZSgpOwo+ICsgICAgICAgICAgICAgICBwcmlu
dGYoIlZhbHVlIGJlZm9yZSBjbW9keDogJWRcbiIsIHZhbHVlKTsKPiArCj4gKyAgICAgICAgICAg
ICAgIC8vIENhbGwgcHJjdGwgYmVmb3JlIGZpcnN0IGZlbmNlLmkgaXMgY2FsbGVkIGluc2lkZSBt
b2RpZnlfaW5zdHJ1Y3Rpb24KPiArICAgICAgICAgICAgICAgcHJjdGwoUFJfUklTQ1ZfU0VUX0lD
QUNIRV9GTFVTSF9DVFhfT04sIFBSX1JJU0NWX0NUWF9TV19GRU5DRUksIDApOwo+ICsgICAgICAg
ICAgICAgICBtb2RpZnlfaW5zdHJ1Y3Rpb24oKTsKPiArCj4gKyAgICAgICAgICAgICAgIHZhbHVl
ID0gZ2V0X3ZhbHVlKCk7Cj4gKyAgICAgICAgICAgICAgIHByaW50ZigiVmFsdWUgYWZ0ZXIgY21v
ZHg6ICVkXG4iLCB2YWx1ZSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAg
fQo+ICsKPiArY21vZHguUzo6Cj4gKwo+ICsgICAgICAgLm9wdGlvbiBub3J2Ywo+ICsKPiArICAg
ICAgIC50ZXh0Cj4gKyAgICAgICAuZ2xvYmFsIG1vZGlmeV9pbnN0cnVjdGlvbgo+ICsgICAgICAg
bW9kaWZ5X2luc3RydWN0aW9uOgo+ICsgICAgICAgbHcgYTAsIG5ld19pbnNuCj4gKyAgICAgICBs
dWkgYTUsJWhpKG9sZF9pbnNuKQo+ICsgICAgICAgc3cgIGEwLCVsbyhvbGRfaW5zbikoYTUpCj4g
KyAgICAgICBmZW5jZS5pCj4gKyAgICAgICByZXQKPiArCj4gKyAgICAgICAuc2VjdGlvbiBtb2Rp
ZmlhYmxlLCAiYXd4Igo+ICsgICAgICAgLmdsb2JhbCBnZXRfdmFsdWUKPiArICAgICAgIGdldF92
YWx1ZToKPiArICAgICAgIGxpIGEwLCAwCj4gKyAgICAgICBvbGRfaW5zbjoKPiArICAgICAgIGFk
ZGkgYTAsIGEwLCAwCj4gKyAgICAgICByZXQKPiArCj4gKyAgICAgICAuZGF0YQo+ICsgICAgICAg
bmV3X2luc246Cj4gKyAgICAgICBhZGRpIGEwLCBhMCwgMQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2lu
ZGV4LnJzdAo+IGluZGV4IDRkYWIwY2I0YjkwMC4uZWVjZjM0N2NlODQ5IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaW5kZXgucnN0Cj4gQEAgLTEzLDYgKzEzLDcgQEAgUklTQy1WIGFyY2hpdGVj
dHVyZQo+ICAgICAgcGF0Y2gtYWNjZXB0YW5jZQo+ICAgICAgdWFiaQo+ICAgICAgdmVjdG9yCj4g
KyAgICBjbW9keAo+Cj4gICAgICBmZWF0dXJlcwo+Cj4KPiAtLQo+IDIuNDMuMAo+CgoKLS0KUmVn
YXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
