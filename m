Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D51C48291
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iVtr00hY6UVGanh9x71zM5rTV0QwnFgJeFQL9uWdbI=; b=zi9BHdmglv45Dm
	oYYwdqbAL0bof6WFFoh+ISenkm1zt8b0SwZUfzMmyDCJr+N7fhCJdnh/grFJvMWoQYD2IeBmQNDtx
	/7YGAX9GC5yJ1LXx8d9WKNSYUM8xtoXMH3PVa9I5DLA4w0ru9E7uv/kJsL4UMX3/xj440FHxv5Jfv
	+hv/pj1SHmHE9fqTZbju729ZCg0Mil9x3AuvjF3I/EoRgRLlObzgpjcgFSz9lpcP1mwP6M5eifWLt
	LiYO6Q+KB2PP4zRtSrBrH7Lti4Z3Hd+sZ8kYfbw+nG/X254LP7u84PzdtC1ll23J3SKASDx7b2OLh
	ceCCIf1xSC236OVoL8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWx3b-00000002yNq-3Zxg;
	Mon, 05 Feb 2024 11:22:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWx3Y-00000002yNM-2s3s
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 11:22:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5114b2b3b73so1223112e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Feb 2024 03:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707132151; x=1707736951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7imZCnAB2BRzpFq0lQpC3tiKdvRf86B/0eG5F0Tr2c=;
        b=gVsoHFXbXO+iPx7ClbAEdDldIU2Q5NGFYRXrLQwg9hNW/7i2RRv7kd+2Lq9UqHLfZR
         Pn0ObvztZmEyURoxGKROaXJG00hssETNqnA+I8pnhvvrrE+mGB1Ia9x92zsLjduG1SBg
         p0wWWKsx7rVpebjj6RZyCiCRMycyePBAxnxb3ej/iucgfMjp7H7SqjQDX0byT422+XXf
         8v1Kiv1k4uuTsPLPYJ47KGPANk1ZirkuExK3Ev6thOzA1xQBdOlDlc6t0W/jHnBpR6D8
         AaJLAXOTPvOKj7Y/DuO5AD55Ki06bOfaBdZv/RYXTJAykh4dn1MPWOzgQ2C28narTRAq
         BWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707132151; x=1707736951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7imZCnAB2BRzpFq0lQpC3tiKdvRf86B/0eG5F0Tr2c=;
        b=GuCs+jJrt0Ulg3RjS0gAL9KPZxUiDM5Fv9sIHYsVOnKiSGWf2wyvJlRzmJi05oNihF
         32ghvn6aOZPunGMyWYUIScDtS0ZziOuxhaPZQ0n5UXWrX7U7CgoHFGpypeIChOl4/o3P
         B7FJRUXbyKtKX2Ul+JmZkKGMr8qdumfxaI36gF4OC1NRIjepIJiKNJO5TicCtILcnHk7
         L/UtS0f0USa6rX8/+rQHcu6WT4q951MMK+SmY/dy9PF1rLz4X/2JU7EIlZnnD1kFwyQi
         pPOE8PJ/dG2yEhS/j0V8Dnahea9amNHgX9pSwozRL2VenX7D5TRzSbtzGLo8qQe/UcJx
         +WEA==
X-Gm-Message-State: AOJu0Yw6yff9haDX+k8y17gnc1GbpFrJN0kYOysoN9NXOPtDe1I/fMXM
	tZunLCztJX26WuZThf6pXqD8ygi/J3lCdTEv0Ig5hcz7EuX00/93gO4eGEWttYKqjIiiyBuT0Pf
	j+JeNKSKwFaWeu7//L8UMMXjYILTBSGWtR9ks2A==
X-Google-Smtp-Source: AGHT+IFoGGjXGqAu16JDDCqGU3bjaj/m5eJUYjXRJM01WedE3gsJ3YD96S1TQxXofJKgEMZ7A5dhrTAmreEdlMB5YrE=
X-Received: by 2002:a05:6512:3d0a:b0:511:548f:8eef with SMTP id
 d10-20020a0565123d0a00b00511548f8eefmr968517lfv.49.1707132150834; Mon, 05 Feb
 2024 03:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20240205042955.833752-1-apatel@ventanamicro.com>
 <d5e21238-89f4-444e-9c35-f4a28e01052e@ghiti.fr> <CAK9=C2XEmFBDB6R5f+L9++7ojhWb8rJK-e-vgFrDmsi2=DMOBw@mail.gmail.com>
 <87y1bzch0u.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87y1bzch0u.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 5 Feb 2024 16:52:18 +0530
Message-ID: <CAK9=C2U9K+u2r8xNcguqpROKeDhKSBoQCrDW1Y_Qa_MU-SBqnw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Don't use IPIs in flush_icache_all() when
 patching text
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_032232_760245_CFA08BE6 
X-CRM114-Status: GOOD (  34.52  )
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

T24gTW9uLCBGZWIgNSwgMjAyNCBhdCA0OjMw4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4g
d3JpdGVzOgo+Cj4gPiBPbiBNb24sIEZlYiA1LCAyMDI0IGF0IDExOjUy4oCvQU0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPiA+Pgo+ID4+IEhpIEFudXAsCj4gPj4KPiA+
PiBPbiAwNS8wMi8yMDI0IDA1OjI5LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4+ID4gSWYgc29tZSBv
ZiB0aGUgSEFSVHMgYXJlIHBhcmtlZCBieSBzdG9wIG1hY2hpbmUgdGhlbiBJUEktYmFzZWQKPiA+
PiA+IGZsdXNoaW5nIGluIGZsdXNoX2ljYWNoZV9hbGwoKSB3aWxsIGhhbmcuIFRoaXMgaGFuZyBp
cyBvYnNlcnZlZAo+ID4+ID4gd2hlbiB0ZXh0IHBhdGNoaW5nIGlzIGludm9rZWQgYnkgdmFyaW91
cyBkZWJ1ZyBhbmQgQlBGIGZlYXR1cmVzLgo+ID4+ID4KPiA+PiA+IFRvIGF2b2lkIHRoaXMgaGFu
Zywgd2UgZm9yY2UgdXNlIG9mIFNCSS1iYXNlZCBpY2FjaGUgZmx1c2hpbmcKPiA+PiA+IHdoZW4g
cGF0Y2hpbmcgdGV4dC4KPiA+PiA+Cj4gPj4gPiBGaXhlczogNjI3OTIyODQzMjM1ICgiUklTQy1W
OiBVc2UgSVBJcyBmb3IgcmVtb3RlIGljYWNoZSBmbHVzaCB3aGVuIHBvc3NpYmxlIikKPiA+PiA+
IFJlcG9ydGVkLWJ5OiBCam9ybiBUb3BlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiA+PiA+IENsb3Nl
czogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vYmpvdG8vMDRhNTgwNTY4Mzc4ZjNiNTQ4M2FmMDdj
ZDlkMjI1MDEKPiA+PiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5h
bWljcm8uY29tPgo+ID4+ID4gLS0tCj4gPj4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2Fj
aGVmbHVzaC5oIHwgNyArKysrLS0tCj4gPj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL2hpYmVybmF0
ZS5jICAgICAgIHwgMiArLQo+ID4+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAgICAg
ICAgICB8IDQgKystLQo+ID4+ID4gICBhcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYyAgICAgICAg
ICB8IDcgKysrKy0tLQo+ID4+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCj4gPj4gPgo+ID4+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNo
LmgKPiA+PiA+IGluZGV4IGExMjlkYWM0NTIxZC4uNTYxZTA3OWYzNGFmIDEwMDY0NAo+ID4+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiA+PiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gPj4gPiBAQCAtMzIsNyArMzIsOCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2Up
Cj4gPj4gPiAgICAqIFJJU0MtViBkb2Vzbid0IGhhdmUgYW4gaW5zdHJ1Y3Rpb24gdG8gZmx1c2gg
cGFydHMgb2YgdGhlIGluc3RydWN0aW9uIGNhY2hlLAo+ID4+ID4gICAgKiBzbyBpbnN0ZWFkIHdl
IGp1c3QgZmx1c2ggdGhlIHdob2xlIHRoaW5nLgo+ID4+ID4gICAgKi8KPiA+PiA+IC0jZGVmaW5l
IGZsdXNoX2ljYWNoZV9yYW5nZShzdGFydCwgZW5kKSBmbHVzaF9pY2FjaGVfYWxsKCkKPiA+PiA+
ICsjZGVmaW5lIGZsdXNoX2ljYWNoZV9yYW5nZShzdGFydCwgZW5kKSBmbHVzaF9pY2FjaGVfYWxs
KHRydWUpCj4gPj4gPiArI2RlZmluZSBmbHVzaF9pY2FjaGVfcGF0Y2hfcmFuZ2Uoc3RhcnQsIGVu
ZCkgZmx1c2hfaWNhY2hlX2FsbChmYWxzZSkKPiA+PiA+ICAgI2RlZmluZSBmbHVzaF9pY2FjaGVf
dXNlcl9wYWdlKHZtYSwgcGcsIGFkZHIsIGxlbikgXAo+ID4+ID4gICAgICAgZmx1c2hfaWNhY2hl
X21tKHZtYS0+dm1fbW0sIDApCj4gPj4gPgo+ID4+ID4gQEAgLTQzLDEyICs0NCwxMiBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPj4g
Pgo+ID4+ID4gICAjaWZuZGVmIENPTkZJR19TTVAKPiA+PiA+Cj4gPj4gPiAtI2RlZmluZSBmbHVz
aF9pY2FjaGVfYWxsKCkgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpCj4gPj4gPiArI2RlZmluZSBm
bHVzaF9pY2FjaGVfYWxsKHdhbnRfaXBpKSBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCkKPiA+PiA+
ICAgI2RlZmluZSBmbHVzaF9pY2FjaGVfbW0obW0sIGxvY2FsKSBmbHVzaF9pY2FjaGVfYWxsKCkK
PiA+PiA+Cj4gPj4gPiAgICNlbHNlIC8qIENPTkZJR19TTVAgKi8KPiA+PiA+Cj4gPj4gPiAtdm9p
ZCBmbHVzaF9pY2FjaGVfYWxsKHZvaWQpOwo+ID4+ID4gK3ZvaWQgZmx1c2hfaWNhY2hlX2FsbChi
b29sIHdhbnRfaXBpKTsKPiA+PiA+ICAgdm9pZCBmbHVzaF9pY2FjaGVfbW0oc3RydWN0IG1tX3N0
cnVjdCAqbW0sIGJvb2wgbG9jYWwpOwo+ID4+ID4KPiA+PiA+ICAgI2VuZGlmIC8qIENPTkZJR19T
TVAgKi8KPiA+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oaWJlcm5hdGUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2hpYmVybmF0ZS5jCj4gPj4gPiBpbmRleCA2NzFiNjg2YzAxNTgu
LjM4OGYxMGUxODdiYSAxMDA2NDQKPiA+PiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hpYmVy
bmF0ZS5jCj4gPj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oaWJlcm5hdGUuYwo+ID4+ID4g
QEAgLTE1Myw3ICsxNTMsNyBAQCBpbnQgc3dzdXNwX2FyY2hfc3VzcGVuZCh2b2lkKQo+ID4+ID4g
ICAgICAgfSBlbHNlIHsKPiA+PiA+ICAgICAgICAgICAgICAgc3VzcGVuZF9yZXN0b3JlX2NzcnMo
aGliZXJuYXRlX2NwdV9jb250ZXh0KTsKPiA+PiA+ICAgICAgICAgICAgICAgZmx1c2hfdGxiX2Fs
bCgpOwo+ID4+ID4gLSAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfYWxsKCk7Cj4gPj4gPiArICAg
ICAgICAgICAgIGZsdXNoX2ljYWNoZV9hbGwodHJ1ZSk7Cj4gPj4gPgo+ID4+ID4gICAgICAgICAg
ICAgICAvKgo+ID4+ID4gICAgICAgICAgICAgICAgKiBUZWxsIHRoZSBoaWJlcm5hdGlvbiBjb3Jl
IHRoYXQgd2UndmUganVzdCByZXN0b3JlZCB0aGUgbWVtb3J5Lgo+ID4+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4g
Pj4gPiBpbmRleCAzN2U4N2ZkY2Y2YTAuLjcyMWUxNDRhNzg0NyAxMDA2NDQKPiA+PiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiA+PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3BhdGNoLmMKPiA+PiA+IEBAIC0xODIsNyArMTgyLDcgQEAgaW50IHBhdGNoX3RleHRfc2V0X25v
c3luYyh2b2lkICphZGRyLCB1OCBjLCBzaXplX3QgbGVuKQo+ID4+ID4gICAgICAgcmV0ID0gcGF0
Y2hfaW5zbl9zZXQodHAsIGMsIGxlbik7Cj4gPj4gPgo+ID4+ID4gICAgICAgaWYgKCFyZXQpCj4g
Pj4gPiAtICAgICAgICAgICAgIGZsdXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90KXRwLCAodWlu
dHB0cl90KXRwICsgbGVuKTsKPiA+PiA+ICsgICAgICAgICAgICAgZmx1c2hfaWNhY2hlX3BhdGNo
X3JhbmdlKCh1aW50cHRyX3QpdHAsICh1aW50cHRyX3QpdHAgKyBsZW4pOwo+ID4+ID4KPiA+PiA+
ICAgICAgIHJldHVybiByZXQ7Cj4gPj4gPiAgIH0KPiA+PiA+IEBAIC0yMTcsNyArMjE3LDcgQEAg
aW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXpl
X3QgbGVuKQo+ID4+ID4gICAgICAgcmV0ID0gcGF0Y2hfaW5zbl93cml0ZSh0cCwgaW5zbnMsIGxl
bik7Cj4gPj4gPgo+ID4+ID4gICAgICAgaWYgKCFyZXQpCj4gPj4gPiAtICAgICAgICAgICAgIGZs
dXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90KSB0cCwgKHVpbnRwdHJfdCkgdHAgKyBsZW4pOwo+
ID4+ID4gKyAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfcGF0Y2hfcmFuZ2UoKHVpbnRwdHJfdCkg
dHAsICh1aW50cHRyX3QpIHRwICsgbGVuKTsKPiA+PiA+Cj4gPj4gPiAgICAgICByZXR1cm4gcmV0
Owo+ID4+ID4gICB9Cj4gPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNo
LmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+ID4+ID4gaW5kZXggNTVhMzRmMjAyMGE4
Li4wM2NkM2Q0ODMxZWYgMTAwNjQ0Cj4gPj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1
c2guYwo+ID4+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+PiA+IEBAIC0x
NywxMSArMTcsMTIgQEAgc3RhdGljIHZvaWQgaXBpX3JlbW90ZV9mZW5jZV9pKHZvaWQgKmluZm8p
Cj4gPj4gPiAgICAgICByZXR1cm4gbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOwo+ID4+ID4gICB9
Cj4gPj4gPgo+ID4+ID4gLXZvaWQgZmx1c2hfaWNhY2hlX2FsbCh2b2lkKQo+ID4+ID4gK3ZvaWQg
Zmx1c2hfaWNhY2hlX2FsbChib29sIHdhbnRfaXBpKQo+ID4+ID4gICB7Cj4gPj4gPiAgICAgICBs
b2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7Cj4gPj4gPgo+ID4+ID4gLSAgICAgaWYgKElTX0VOQUJM
RUQoQ09ORklHX1JJU0NWX1NCSSkgJiYgIXJpc2N2X3VzZV9pcGlfZm9yX3JmZW5jZSgpKQo+ID4+
ID4gKyAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX1NCSSkgJiYKPiA+PiA+ICsgICAg
ICAgICAoIXdhbnRfaXBpIHx8ICFyaXNjdl91c2VfaXBpX2Zvcl9yZmVuY2UoKSkpCj4gPj4gPiAg
ICAgICAgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaShOVUxMKTsKPiA+PiA+ICAgICAgIGVsc2UK
PiA+PiA+ICAgICAgICAgICAgICAgb25fZWFjaF9jcHUoaXBpX3JlbW90ZV9mZW5jZV9pLCBOVUxM
LCAxKTsKPiA+PiA+IEBAIC04Nyw3ICs4OCw3IEBAIHZvaWQgZmx1c2hfaWNhY2hlX3B0ZShwdGVf
dCBwdGUpCj4gPj4gPiAgICAgICBzdHJ1Y3QgZm9saW8gKmZvbGlvID0gcGFnZV9mb2xpbyhwdGVf
cGFnZShwdGUpKTsKPiA+PiA+Cj4gPj4gPiAgICAgICBpZiAoIXRlc3RfYml0KFBHX2RjYWNoZV9j
bGVhbiwgJmZvbGlvLT5mbGFncykpIHsKPiA+PiA+IC0gICAgICAgICAgICAgZmx1c2hfaWNhY2hl
X2FsbCgpOwo+ID4+ID4gKyAgICAgICAgICAgICBmbHVzaF9pY2FjaGVfYWxsKHRydWUpOwo+ID4+
ID4gICAgICAgICAgICAgICBzZXRfYml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFncyk7
Cj4gPj4gPiAgICAgICB9Cj4gPj4gPiAgIH0KPiA+Pgo+ID4+Cj4gPj4gU2luY2UgcGF0Y2hfdGV4
dF9jYigpIGlzIHJ1biBvbiBhbGwgY3B1cywgY291bGRuJ3Qgd2UgY29tcGxldGVseSBhdm9pZAo+
ID4+IGFueSByZW1vdGUgaWNhY2hlIGZsdXNoIGJ5IHNsaWdodGx5IGNoYW5naW5nIHBhdGNoX3Rl
eHRfY2IoKSBpbnN0ZWFkIGFzCj4gPj4gZm9sbG93cz8KPiA+Cj4gPiBVbmZvcnR1bmF0ZWx5IHBh
dGNoX3RleHRfY2IoKSBpcyBub3QgdGhlIG9ubHkgdXNlciBvZiBwYXRjaF90ZXh0X25vc3luYwo+
ID4gc2luY2UgcGF0Y2hfdGV4dF9ub3N5bmMoKSBhbmQgcGF0Y2hfdGV4dF9zZXRfbm9zeW5jKCkg
YXJlIGNhbGxlZCBkaXJlY3RseQo+ID4gZnJvbSBvdGhlciBwbGFjZXMgYXMgd2VsbC4KPgo+IFll
YWguIFRoZXJlIGlzIG9uZSBtb3JlIHN0b3BfbWFjaGluZSgpIHRleHQgcGF0Y2hpbmcgdXNlciwg
YW5kIHRoYXQncwo+IGZ0cmFjZS4gZnRyYWNlIGlzIHVzaW5nIHN0b3BfbWFjaGluZSgpIHdpdGgg
dGhlIGxhc3QgYXJndW1lbnQgc2V0IHRvCj4gTlVMTCwgc28gb25seSBwYXRjaGluZyBvbiAqYW55
KiBoYXJ0LiBDb250aW51aW5nIG9uIEFsZXgnIGlkZWEgd291bGQgYmUKPiB0byBwbGFjZSBhbiBJ
UEkgZmx1c2ggaW4gZnRyYWNlX2FyY2hfY29kZV9tb2RpZnlfcG9zdF9wcm9jZXNzKCksCj4gdW5m
b3J0YXRlbHkgdGhhdCdzIHRvbyBsYXRlIHNpbmNlIHdlJ3JlIGFscmVhZHkgbW92ZWQgb24gZnJv
bQo+IHN0b3BfbWFjaGluZSgpLgo+Cj4gPiBXZSBoYXZlIHRvIHVwZGF0ZSBhbGwgdXNlcnMgb2Yg
cGF0Y2hfdGV4dF9ub3N5bmMoKSBhbmQKPiA+IHBhdGNoX3RleHRfc2V0X25vc3luYygpIHRvIG1v
dmUgdG8gbG9jYWwgaWNhY2hlIGZsdXNoZXMgd2hpY2gKPiA+IGlzIGEgbXVjaCBiaWdnZXIgY2hh
bmdlLgo+Cj4gT25seSB0aGUgZnRyYWNlIHN0b3BfbWFjaGluZSgpIHVzZXIsIHJpZ2h0PyBBbGV4
IHNvbHV0aW9uIGlzIHN1ZmZpY2llbnQKPiBmb3IgcGF0Y2hfdGV4dCgpLiBJJ20gbm90IGEgc3Vw
ZXIgZmFuIG9mIGNvbmRpdGlvbmFsbHkgY2FsbGluZyBpbnRvIFNCSQo+IGFuZCBwYXNzaW5nIGFy
b3VuZCBib29sZWFuIGNvbnRleHQgZmxhZ3MgYXMgYSB3b3JrYXJvdW5kLi4uIDotKCBBbnkKPiBv
dGhlciBhbHRlcm5hdGl2ZXM/CgpJIHdhcyBzZWVpbmcgaGFuZyBiZWNhdXNlIG9mIHBhdGNoX3Rl
eHRfbm9zeW5jKCkgZ2V0dGluZyBjYWxsZWQgZnJvbQp0aGUgQlBGIHBhdGggaW4gbXkgZGVidWcg
c2Vzc2lvbnMuCgpJIGFtIGNlcnRhaW5seSBub3QgYSBmYW4gb2YgdGhlIGFwcHJvYWNoIHRha2Vu
IGJ5IHRoaXMgcGF0Y2ggYnV0IHRoaXMgaXMKdGhlIHNtYWxsZXN0IGFtb3VudCBvZiBjaGFuZ2Ug
SSBjb3VsZCBjb21lLXVwIGFzIEZJWFVQLiBXZSBzaG91bGQKY2VydGFpbmx5IGhhdmUgYSBzZXBh
cmF0ZSBwYXRjaCB0byBkbyB0aGlzIGluIGEgcHJvcGVyIHdheS4KCj4KPiBUaGUgb2J2aW91cyBm
aXhpbmcgdGV4dCBwYXRjaGluZyBub3QgdG8gYmUgY29tcGxldGx5IHVzZWxlc3Mgb24gUklTQy1W
LAo+IGJ1dCB0aGF0J3MgYW4gZXZlbiBiaWdnZXIgcGF0Y2guLi4KPgoKSSBhZ3JlZS4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
