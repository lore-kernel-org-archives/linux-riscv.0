Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB58C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+/w8Cjxx70bTkpBjyXdrOHzWc8dSTYjAlLN67IIYng=; b=sz0LjThB3iOLSf
	Kp1lOLT2gs3FQCP8eA8PG/XuKbWjUlrRmQyBlOVDNBTnKfrfLOzAks+OML1Tc375Ns1qb0XTKmKZl
	ovvEiatzFl0Fudgtjh4UgZkAbchYOcqjXLe8NJRWEKsclkpV004Ck6bTAavVXXGBmEWGulTQ3ep5U
	1Etw0hMUBNV5J6f+kqUPJTygWIyclF84mnAUCVdx665rTPnhP4TYDzJ4cYbG01lvpBdrWMGuqSCcV
	43t0pw0KXY2ng68HerCqfPnD9NyAJQg6rBxBbsBnWiU1GNHXrVNLo6oiiULj01FxfvUiR/6RvlT0u
	61zQFZDQyH5Qzj9spXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrGV-00000003scZ-4BqH;
	Tue, 12 Mar 2024 01:49:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrGR-00000003sai-2boz;
	Tue, 12 Mar 2024 01:49:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33e99b62e01so1100246f8f.0;
        Mon, 11 Mar 2024 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710208149; x=1710812949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICoXbIzO4I+bZEbVSY6istDZPedE1yOS9/In+VkiPyM=;
        b=iiE08CefETPTlsPdSTiX5dgMBa6WQIDMjxzBCnqk7ARK0loXDntDmdWKnHZE5ItCcG
         vvFQDzSas2+bN+HDJMq4cbloMFLCmrTFUpm7m1RpgyAB/clyu1ULTmBWFKkRieawsGUP
         d6gMuOiSftUiUYBSdqmJuV9BAi52PRGPM1nI6FxZDEdZhyDa7zh9AQgTeeIW+wk7kUH8
         ykweac1O0YzFQXBDVaT7U04SurztHh5dVx0nuaShPVYjBYapTBRCNS0q1CABvf61xJUR
         h/j+jNDaADZqMGe+KUq7Uyr1e8N+DJBsF8PR4uQNghuM+QS4riotM/qEw2wNaV081EwK
         xPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208149; x=1710812949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICoXbIzO4I+bZEbVSY6istDZPedE1yOS9/In+VkiPyM=;
        b=afmKLvdgjjVw/I0Uypzp0QRUfDV/cG3CKkGu671VHCF7nfUjt8eni71UsvcSWd0Vuv
         9w/0TTXuvftRw+zK7QWY3qMfDsGW9gr3vUdtVV2cUkDsFpQHjK2ypuqVrNdrWmodRZtR
         TZbnTJdkKWWR1Y8eq//HO3LnJT2qzV3zafL/OLjdJ64/V0CTGxtR3kWT8mc9yuTYnrTG
         Ui69Wz5zu9dC/VsYGQ63OWwcFuV9wHz1zVvJg1auBr3qOXMjDBN7GkXDqQsVskqoWqNj
         O7W0OKmuhocJE4/gSh4+EHkPF+5b1zZGf5W3GgyPvpXWHdV+tPwK05v2MSJvuq9UG35r
         f5BA==
X-Forwarded-Encrypted: i=1; AJvYcCUkbWXVZSMH+PwmcFhON/Nxibamhr9gB65z9Pf8ai+K4EEt0NDcVDHSCOLTls1pxSBfT7HmHaD9/F7L+250SOBjETmmwA8Ro+jtDuKRdaMip/ATF+G6IDFTweVtR3Etc8jpZ7tJHH2q6ccQL/0lo9zCyFqjSwQ=
X-Gm-Message-State: AOJu0Ywq/EDC8eOxXb7XdJk6OygIwh0xXzDJTn2XlQxmo8ueZr90c9Dn
	pkg0pCpiKdF4z+yAqKBHSe0Nce7xHb5z/SYJ6JmrPboGHjtvWR9+PE9gx1cEYfyLsD3L4IBO8yT
	aQar2uufxPDrLf0ZCHJo3A0QA/ac=
X-Google-Smtp-Source: AGHT+IH0ci03Wi0rl7FcYFahEcFUmauqEvWpxNG5kQwx4t0HGO1FQxQnKW46ZdilMOOTy/X9M79z6M4R5QoZlsdJz5M=
X-Received: by 2002:adf:f045:0:b0:33e:a5e1:eccc with SMTP id
 t5-20020adff045000000b0033ea5e1ecccmr214107wro.68.1710208149304; Mon, 11 Mar
 2024 18:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com> <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:48:58 -0700
Message-ID: <CAADnVQK57PziY+xdzW=d3HaG-bn87E3p9zf7thvmqV1t0iR4Yg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/9] bpf: refactor the modules_array to ptr_array
To: Menglong Dong <dongmenglong.8@bytedance.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_184911_695102_5DBFA122 
X-CRM114-Status: GOOD (  21.96  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNOKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gUmVmYWN0b3IgdGhlIHN0cnVjdCBtb2R1
bGVzX2FycmF5IHRvIG1vcmUgZ2VuZXJhbCBzdHJ1Y3QgcHRyX2FycmF5LCB3aGljaAo+IGlzIHVz
ZWQgdG8gc3RvcmUgdGhlIHBvaW50ZXJzLgo+Cj4gTWVhbndoaWxlcywgaW50cm9kdWNlIHRoZSBi
cGZfdHJ5X2FkZF9wdHIoKSwgd2hpY2ggY2hlY2tzIHRoZSBleGlzdGluZyBvZgo+IHRoZSBwdHIg
YmVmb3JlIGFkZGluZyBpdCB0byB0aGUgYXJyYXkuCj4KPiBTZWVtcyBpdCBzaG91bGQgYmUgbW92
ZWQgdG8gYW5vdGhlciBmaWxlcyBpbiAibGliIiwgYW5kIEknbSBub3Qgc3VyZSB3aGVyZQo+IHRv
IGFkZCBpdCBub3csIGFuZCBsZXQncyBtb3ZlIGl0IHRvIGtlcm5lbC9icGYvc3lzY2FsbC5jIGZv
ciBub3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBi
eXRlZGFuY2UuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAgfCAxMCArKysr
KysrKysKPiAga2VybmVsL2JwZi9zeXNjYWxsLmMgICAgIHwgMzcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBrZXJuZWwvdHJhY2UvYnBmX3RyYWNlLmMgfCA0OCArKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTQgaW5z
ZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9icGYuaCBiL2luY2x1ZGUvbGludXgvYnBmLmgKPiBpbmRleCAwZjY3N2ZkY2ZjYzcuLjk5Nzc2
NWNkZjQ3NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9icGYuaAo+IEBAIC0zMDQsNiArMzA0LDE2IEBAIHN0cnVjdCBicGZfbWFwIHsKPiAg
ICAgICAgIHM2NCBfX3BlcmNwdSAqZWxlbV9jb3VudDsKPiAgfTsKPgo+ICtzdHJ1Y3QgcHRyX2Fy
cmF5IHsKPiArICAgICAgIHZvaWQgKipwdHJzOwo+ICsgICAgICAgaW50IGNudDsKPiArICAgICAg
IGludCBjYXA7Cj4gK307Cj4gKwo+ICtpbnQgYnBmX2FkZF9wdHIoc3RydWN0IHB0cl9hcnJheSAq
YXJyLCB2b2lkICpwdHIpOwo+ICtib29sIGJwZl9oYXNfcHRyKHN0cnVjdCBwdHJfYXJyYXkgKmFy
ciwgc3RydWN0IG1vZHVsZSAqbW9kKTsKPiAraW50IGJwZl90cnlfYWRkX3B0cihzdHJ1Y3QgcHRy
X2FycmF5ICphcnIsIHZvaWQgKnB0cik7Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIg
KmJ0Zl9maWVsZF90eXBlX25hbWUoZW51bSBidGZfZmllbGRfdHlwZSB0eXBlKQo+ICB7Cj4gICAg
ICAgICBzd2l0Y2ggKHR5cGUpIHsKPiBkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9zeXNjYWxsLmMg
Yi9rZXJuZWwvYnBmL3N5c2NhbGwuYwo+IGluZGV4IGY2M2Y0ZGE0ZGI1ZS4uNGYyMzBmZDFmOGU0
IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4gKysrIGIva2VybmVsL2JwZi9z
eXNjYWxsLmMKPiBAQCAtNDc5LDYgKzQ3OSw0MyBAQCBzdGF0aWMgdm9pZCBicGZfbWFwX3JlbGVh
c2VfbWVtY2coc3RydWN0IGJwZl9tYXAgKm1hcCkKPiAgfQo+ICAjZW5kaWYKPgo+ICtpbnQgYnBm
X2FkZF9wdHIoc3RydWN0IHB0cl9hcnJheSAqYXJyLCB2b2lkICpwdHIpCj4gK3sKPiArICAgICAg
IHZvaWQgKipwdHJzOwo+ICsKPiArICAgICAgIGlmIChhcnItPmNudCA9PSBhcnItPmNhcCkgewo+
ICsgICAgICAgICAgICAgICBhcnItPmNhcCA9IG1heCgxNiwgYXJyLT5jYXAgKiAzIC8gMik7Cj4g
KyAgICAgICAgICAgICAgIHB0cnMgPSBrcmVhbGxvY19hcnJheShhcnItPnB0cnMsIGFyci0+Y2Fw
LCBzaXplb2YoKnB0cnMpLCBHRlBfS0VSTkVMKTsKPiArICAgICAgICAgICAgICAgaWYgKCFwdHJz
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsgICAgICAgICAg
ICAgICBhcnItPnB0cnMgPSBwdHJzOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGFyci0+cHRy
c1thcnItPmNudF0gPSBwdHI7Cj4gKyAgICAgICBhcnItPmNudCsrOwo+ICsgICAgICAgcmV0dXJu
IDA7Cj4gK30KPiArCj4gK2Jvb2wgYnBmX2hhc19wdHIoc3RydWN0IHB0cl9hcnJheSAqYXJyLCBz
dHJ1Y3QgbW9kdWxlICptb2QpCgpEb24ndCB5b3UgbmVlZCAndm9pZCAqbW9kJyBoZXJlPwoKPiAr
ewo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gYXJyLT5jbnQgLSAxOyBp
ID49IDA7IGktLSkgewo+ICsgICAgICAgICAgICAgICBpZiAoYXJyLT5wdHJzW2ldID09IG1vZCkK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiArICAgICAgIH0KPiArICAg
ICAgIHJldHVybiBmYWxzZTsKPiArfQoKLi4uCgo+IC0gICAgICAgICAgICAgICBrcHJvYmVfbXVs
dGlfcHV0X21vZHVsZXMoYXJyLm1vZHMsIGFyci5tb2RzX2NudCk7Cj4gLSAgICAgICAgICAgICAg
IGtmcmVlKGFyci5tb2RzKTsKPiArICAgICAgICAgICAgICAga3Byb2JlX211bHRpX3B1dF9tb2R1
bGVzKChzdHJ1Y3QgbW9kdWxlICoqKWFyci5wdHJzLCBhcnIuY250KTsKCkRvIHlvdSByZWFsbHkg
bmVlZCB0byB0eXBlIGNhc3Q/IENvbXBpbGVyIGRvZXNuJ3QgY29udmVydCB2b2lkKioKYXV0b21h
dGljYWxseT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
