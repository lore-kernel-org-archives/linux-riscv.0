Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87227CD1288
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 22:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPIw1bRODiA/hapiAVhraS7WVjzXj/2KkN9QZtXG7s0=; b=xS3DhLg593uwYM
	gSWoHKG+/pSERKG6jZk+fNzxjaBnYc7vctmh/1qWTjnMuNJQcqajlGPdigPY8i7kVnlaqCO/ZKdbl
	WsQpNuhSoklwv8vLIWvUHiwP4j2DfGHFnPMDb8IgNecyzjII3i9zgZoHXRcFLkq8EgGBc/TefL37f
	c8lwG0CgnZc/SNefkxp5wQPuqc06MQB6V+xzrujzKbYCxlT3ChW7TSk6opmD9FhEi7fRzbIGwzMe7
	vSbZ9MLf8rPI9ojAPk9CSP/YvKVy3GXK2F3zDVqYU66I3mcbcqy0QUib7vKKKMfU+f+oZAI4yKM/H
	3HG98K3nh33qREsnJQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrQHH-000000091Nt-2vuv;
	Mon, 01 Apr 2024 22:37:19 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrQHD-000000091MP-1gga
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 22:37:16 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d6c9678cbdso59125051fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1712011032; x=1712615832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aY4S4yPUfIj0lcZIhHGm/I+32cExDlXkzSV19aujdnE=;
        b=AqKT3bVOQPepgzkrqwwrR82b6HbHIqxsUYLOwllSdQStQNAkozI5o9BQrkyo8S2PA7
         se/tvGdeD5c2hyfFmIXI2qNPNlSbgEUrVf7YT8qv6MYmFGbQVIaJcqpIsEeKYVqHwGBS
         HpB266HM768mxNl6uZIZ1oM4QaiJKaIcQaIq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712011032; x=1712615832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aY4S4yPUfIj0lcZIhHGm/I+32cExDlXkzSV19aujdnE=;
        b=UTf/2JteipscPMWeql6jof6Z9oVa+tsx3YceJuYNYkxW5IEDYTnccf/7BibTodt7lm
         brzVBNV/JvkiEN/TUqrTESfmPjXeLIr55WaZ0YOa3eixQRBPg1qKJOwXtyufjg1fXFTq
         q3JZyKjBRDAvcaASB/201iGzay9+LHl/ybuN4NazRGy5ijIkVTwdb9sBgDMTOMFgT6gj
         qdr9NqXIlFyG2jddaVxDM8iy5RZZuXzj0A7Oq2AUAPTRngcuouCtTB5wpPJTLj8bgvb4
         SdNAr1lC3NKRziyxeiIud1bDvSBCxaeHsw9t9Qw5VLn8qIvm9nH+cdqHIX55cftZA9W4
         SYMA==
X-Forwarded-Encrypted: i=1; AJvYcCU3chnigZCIwTpBeqJlzOkZdWIs4qgconLtMmfGqSlwWO0d7TCS0/bpn3JmT3ZXJMER/UmqPmYFBWvV9MxHOlRbHb38aiTP9i7F1yGKtUS6
X-Gm-Message-State: AOJu0Yw9uPiB38e13XdBFFJHx37fTELpjSWx57QEq9z8W/aEDreji3fB
	tHYTzbt+tR12noEJoY6oWfQt049H6Fc0p9oBXekmz9NukWQAiCzE/stSAf+qxHTdPuq78lEUOxp
	V/E8GJjsNULek7u61WDKZmpZVx6kHUzs3bLSk
X-Google-Smtp-Source: AGHT+IG/nrfJyiecsCRexI+R+JQkltSWLIGxNJI1MuunG9lO7Xv1PZB0PJSIO5fHcSDuaVZDyAvA8i4t7A+QtlxnzZU=
X-Received: by 2002:a05:651c:14a:b0:2d4:514b:428 with SMTP id
 c10-20020a05651c014a00b002d4514b0428mr6412640ljd.6.1712011032590; Mon, 01 Apr
 2024 15:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240229010130.1380926-1-atishp@rivosinc.com> <20240229010130.1380926-8-atishp@rivosinc.com>
 <20240302-1a3c0df25f2422e1e6abecf3@orel>
In-Reply-To: <20240302-1a3c0df25f2422e1e6abecf3@orel>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 1 Apr 2024 15:37:01 -0700
Message-ID: <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_153715_519573_39BDB123 
X-CRM114-Status: GOOD (  36.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBNYXIgMiwgMjAyNCBhdCAxMjoxNuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMDU6MDE6
MjJQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPiBDdXJyZW50bHksIHdlIHJldHVybiBh
IGxpbnV4IGVycm9yIGNvZGUgaWYgY3JlYXRpbmcgYSBwZXJmIGV2ZW50IGZhaWxlZAo+ID4gaW4g
a3ZtLiBUaGF0IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkgYXMgZ3Vlc3QgY2FuIGNvbnRpbnVlIHRv
IG9wZXJhdGUKPiA+IHdpdGhvdXQgcGVyZiBwcm9maWxpbmcgb3IgcHJvZmlsaW5nIHdpdGggZmly
bXdhcmUgY291bnRlcnMuCj4gPgo+ID4gUmV0dXJuIGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2Rl
IHRvIGluZGljYXRlIHRoYXQgUE1VIGNvbmZpZ3VyYXRpb24KPiA+IGZhaWxlZC4gQW4gZXJyb3Ig
bWVzc2FnZSBpbiBrdm0gYWxyZWFkeSBkZXNjcmliZXMgdGhlIHJlYXNvbiBmb3IgZmFpbHVyZS4K
Pgo+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIHBlcmYgc3Vic3lzdGVtIHRvIGtub3cg
aWYgdGhlcmUgbWF5IGJlCj4gYSBjb25jZXJuIHRoYXQgcmVzb3VyY2VzIGFyZSB0ZW1wb3Jhcmls
eSB1bmF2YWlsYWJsZS4gSWYgc28sIHRoZW4gdGhpcwoKRG8geW91IG1lYW4gdGhlIGhhcmR3YXJl
IHJlc291cmNlcyB1bmF2YWlsYWJsZSBiZWNhdXNlIHRoZSBob3N0IGlzIHVzaW5nIGl0ID8KCj4g
cGF0Y2ggd291bGQgbWFrZSBpdCBwb3NzaWJsZSBmb3IgYSBndWVzdCB0byBkbyB0aGUgZXhhY3Qg
c2FtZSB0aGluZywKPiBidXQgc29tZXRpbWVzIHN1Y2NlZWQgYW5kIHNvbWV0aW1lcyBnZXQgU0JJ
X0VSUl9OT1RfU1VQUE9SVEVELgo+IHNiaV9wbXVfY291bnRlcl9jb25maWdfbWF0Y2hpbmcgZG9l
c24ndCBjdXJyZW50bHkgaGF2ZSBhbnkgZXJyb3IgdHlwZXMKPiBzcGVjaWZpZWQgdGhhdCBzYXkg
InVuc3VwcG9ydGVkIGF0IHRoZSBtb21lbnQsIG1heWJlIHRyeSBhZ2FpbiIsIHdoaWNoCj4gd291
bGQgYmUgbW9yZSBhcHByb3ByaWF0ZSBpbiB0aGF0IGNhc2UuIEkgZG8gc2VlCj4gcGVyZl9ldmVu
dF9jcmVhdGVfa2VybmVsX2NvdW50ZXIoKSBjYW4gcmV0dXJuIEVOT01FTSB3aGVuIG1lbW9yeSBp
c24ndAo+IGF2YWlsYWJsZSwgYnV0IGlmIHRoZSBrZXJuZWwgaXNuJ3QgYWJsZSB0byBhbGxvY2F0
ZSBhIHNtYWxsIGFtb3VudCBvZgo+IG1lbW9yeSwgdGhlbiB3ZSdyZSBpbiBiaWdnZXIgdHJvdWJs
ZSBhbnl3YXksIHNvIHRoZSBjb25jZXJuIHdvdWxkIGJlCj4gaWYgdGhlcmUgYXJlIHBlcmYgcmVz
b3VyY2UgcG9vbHMgd2hpY2ggbWF5IHRlbXBvcmFyaWx5IGJlIGV4aGF1c3RlZCBhdAo+IHRoZSB0
aW1lIHRoZSBndWVzdCBtYWtlcyB0aGlzIHJlcXVlc3QuCj4KCkZvciBvdGhlciBjYXNlcywgdGhp
cyBwYXRjaCBlbnN1cmVzIHRoYXQgZ3Vlc3RzIGNvbnRpbnVlIHRvIHJ1biB3aXRob3V0IGZhaWx1
cmUKd2hpY2ggYWxsb3dzIHRoZSB1c2VyIGluIHRoZSBndWVzdCB0byB0cnkgYWdhaW4gaWYgdGhp
cyBmYWlscyBkdWUgdG8gYSB0ZW1wb3JhcnkKcmVzb3VyY2UgYXZhaWxhYmlsaXR5LgoKPiBPbmUg
Y29tbWVudCBiZWxvdy4KPgo+ID4KPiA+IEZpeGVzOiAwY2I3NGI2NWQyZTUgKCJSSVNDLVY6IEtW
TTogSW1wbGVtZW50IHBlcmYgc3VwcG9ydCB3aXRob3V0IHNhbXBsaW5nIikKPiA+IFJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jICAgICB8IDE0ICsrKysrKysrKy0tLS0tCj4gPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfcG11LmMgfCAgNiArKystLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gPiBpbmRleCBi
MTU3NGMwNDNmNzcuLjI5YmY0Y2E3OThjYiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiA+IEBAIC0y
MjksOCArMjI5LDkgQEAgc3RhdGljIGludCBrdm1fcG11X3ZhbGlkYXRlX2NvdW50ZXJfbWFzayhz
dHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUsIHVuc2lnbmVkIGxvbmcgY3QKPiA+ICAgICAgIHJldHVybiAw
Owo+ID4gIH0KPiA+Cj4gPiAtc3RhdGljIGludCBrdm1fcG11X2NyZWF0ZV9wZXJmX2V2ZW50KHN0
cnVjdCBrdm1fcG1jICpwbWMsIHN0cnVjdCBwZXJmX2V2ZW50X2F0dHIgKmF0dHIsCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHVuc2ln
bmVkIGxvbmcgZWlkeCwgdW5zaWduZWQgbG9uZyBldnRkYXRhKQo+ID4gK3N0YXRpYyBsb25nIGt2
bV9wbXVfY3JlYXRlX3BlcmZfZXZlbnQoc3RydWN0IGt2bV9wbWMgKnBtYywgc3RydWN0IHBlcmZf
ZXZlbnRfYXR0ciAqYXR0ciwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHVuc2lnbmVkIGxvbmcgZWlkeCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZXZ0ZGF0YSkKPiA+ICB7Cj4g
PiAgICAgICBzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQ7Cj4gPgo+ID4gQEAgLTQ1NCw3ICs0NTUs
OCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2goc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVpZHgsIHU2NCBldnRkYXRhLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0
ZGF0YSkKPiA+ICB7Cj4gPiAtICAgICBpbnQgY3RyX2lkeCwgcmV0LCBzYmlyZXQgPSAwOwo+ID4g
KyAgICAgaW50IGN0cl9pZHgsIHNiaXJldCA9IDA7Cj4gPiArICAgICBsb25nIHJldDsKPiA+ICAg
ICAgIGJvb2wgaXNfZmV2ZW50Owo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBldmVudF9jb2RlOwo+
ID4gICAgICAgdTMyIGV0eXBlID0ga3ZtX3BtdV9nZXRfcGVyZl9ldmVudF90eXBlKGVpZHgpOwo+
ID4gQEAgLTUxMyw4ICs1MTUsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfY2ZnX21h
dGNoKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjdHJfYmEKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBrdnBtdS0+ZndfZXZlbnRbZXZlbnRfY29kZV0uc3RhcnRlZCA9IHRy
dWU7Cj4gPiAgICAgICB9IGVsc2Ugewo+ID4gICAgICAgICAgICAgICByZXQgPSBrdm1fcG11X2Ny
ZWF0ZV9wZXJmX2V2ZW50KHBtYywgJmF0dHIsIGZsYWdzLCBlaWR4LCBldnRkYXRhKTsKPiA+IC0g
ICAgICAgICAgICAgaWYgKHJldCkKPiA+IC0gICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
c2JpcmV0ID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0Owo+ID4gKyAgICAgICAgICAgICB9Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAg
c2V0X2JpdChjdHJfaWR4LCBrdnBtdS0+cG1jX2luX3VzZSk7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUu
Ywo+ID4gaW5kZXggN2VjYTcyZGYyY2JkLi5iNzAxNzllOWU4NzUgMTAwNjQ0Cj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfcG11LmMKPiA+IEBAIC00Miw5ICs0Miw5IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRf
cG11X2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+
ID4gICNlbmRpZgo+ID4gICAgICAgICAgICAgICAvKgo+ID4gICAgICAgICAgICAgICAgKiBUaGlz
IGNhbiBmYWlsIGlmIHBlcmYgY29yZSBmcmFtZXdvcmsgZmFpbHMgdG8gY3JlYXRlIGFuIGV2ZW50
Lgo+ID4gLSAgICAgICAgICAgICAgKiBGb3J3YXJkIHRoZSBlcnJvciB0byB1c2Vyc3BhY2UgYmVj
YXVzZSBpdCdzIGFuIGVycm9yIHdoaWNoCj4gPiAtICAgICAgICAgICAgICAqIGhhcHBlbmVkIHdp
dGhpbiB0aGUgaG9zdCBrZXJuZWwuIFRoZSBvdGhlciBvcHRpb24gd291bGQgYmUKPiA+IC0gICAg
ICAgICAgICAgICogdG8gY29udmVydCB0byBhbiBTQkkgZXJyb3IgYW5kIGZvcndhcmQgdG8gdGhl
IGd1ZXN0Lgo+ID4gKyAgICAgICAgICAgICAgKiBObyBuZWVkIHRvIGZvcndhcmQgdGhlIGVycm9y
IHRvIHVzZXJzcGFjZSBhbmQgZXhpdCB0aGUgZ3Vlc3QKPgo+IFBlcmlvZCBhZnRlciBndWVzdAo+
Cj4KPiA+ICsgICAgICAgICAgICAgICogb3BlcmF0aW9uIGNhbiBjb250aW51ZSB3aXRob3V0IHBy
b2ZpbGluZy4gRm9yd2FyZCB0aGUKPgo+IFRoZSBvcGVyYXRpb24KPgoKRml4ZWQgdGhlIGFib3Zl
IHR3by4KCgo+ID4gKyAgICAgICAgICAgICAgKiBhcHByb3ByaWF0ZSBTQkkgZXJyb3IgdG8gdGhl
IGd1ZXN0Lgo+ID4gICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAgcmV0ID0ga3Zt
X3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2godmNwdSwgY3AtPmEwLCBjcC0+YTEsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwLT5h
MiwgY3AtPmEzLCB0ZW1wLCByZXRkYXRhKTsKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KPiBUaGFu
a3MsCj4gZHJldwoKCgotLQpSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
