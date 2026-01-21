Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0742D262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZnembkQ2sK9omuF7B8Lb6URICHWEl9ZdLu//WcjoNA=; b=WTurUPJCi2rpkl
	ttWTGB3YeQflgsi0WeHCgoNU8TL33qE/jwwNJmHdA8nCdLhDEjyCs4vimcHV8ZxL66nuKuy8Bw1I0
	YMdnREoO6vMLS96CUc/bg12a1BMmT9mZzzj5s+8hI5AWMPzIS9sW8w4hFg+Ik/UTiR8SkpO+/Rp0K
	0D/I+wukAvyLvW25Lk5rfpZHTwzBWVOay5stHkDSgkcJbf0KPfoG76FJa3Fjrvt7r9SyFUwyqeKUo
	hCwqw5cADsiaib4fAC46SGKPEYOLxSeOpnYy/eEDzqUmpTuUinksE1pdcNeg8gcH+K1HbU6hz4I4K
	E11fETbzhzruNlZm2jCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSM6-00000004zSU-00ox;
	Wed, 21 Jan 2026 07:10:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSM3-00000004zRk-2vHp
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 07:10:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a35ae38bdfso45125ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 23:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768979414; cv=none;
        d=google.com; s=arc-20240605;
        b=iuzQPqrem7wUVpjriXwoc3AwDcsS9qGeg/+KknuG3t2733r6+3l9+2ANNsJNQrEYe9
         X7TdQQDimtce2aaYrip4vlPUi72DfiKaRRZtxuYJXR8Pyg/8jr/iOTwucO9CnUT0TSL5
         SPcQF7Rh0emrhSeqT8S+PdzCtorY0mm/7YjF6JvwIDFoQaZeuWk4DMC165+TFUxH3lfo
         8yfFnIR8xGi1M/19hgrYx859rCuluC2Htp0Mzd/CD9Ry8kjeijZ1ct941hc6C87Y0IQf
         NpxnTfbRdNb3ePn2uDRkIiBSxKUsMXAU0AEmEhjNl+3EYnmZHBmDHFsqe73wAoJL9h9b
         ns1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        fh=fKmRe9R8irOs4PLTpLFL6gYfdMUed6Oywkvq0wTHa5c=;
        b=TVq/TGi3QfShBiN3vvJ9XvvCNNXBlk9fuw6A6WDKOD5fqA79W/Q9VlUxKGfHe7FqqH
         8AvQd1EZHDrlvQw7Px358n4OAQCVyz9K9i+zOXWXR16RrAoZWnVCtjpPtiT+MIKLwBTC
         JlAx3gM8O/Z2pzfPyYrs3bCEu8ADdqn6fw5qHYSI5AGras492Cu+AvJcmf/kIbRuxApM
         fJ18uEPwP8IzNQCN6phfKjYD23SyMwtcl4Q1W7x3SSyhncgiOrIhHQShn5oPTIDlm+b8
         N7j0DZzl0VOs0oGh6YniMkSv+wHTo3wLkPTPxtlyw14p3KGatQkJ0rbvl4fa+3K+8nW8
         8n7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768979414; x=1769584214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        b=MoVzcfKf6Qf+qaNbDNbyTl2z4yD0Ck2LviL/gNLaqQ7+0nUg7TRVDMibg5nI/QtFuk
         Pvfh5S2IfUIy84+1FMv/cGjq7ogFedetCWqYkPzR15FFhqCn4abgxRXhOTgSXZeMTTRX
         cu0LDyfnl2Xm+RsOa281O76ZfyZjjHY9oobct4sYapz0xUlFhZjD8qo/o81JaFb6SZ2R
         HhABDwk1dphz5mYsH3IMcVYJP0XoowgoFDmk/e0VpHg1QLidAc4PORkaeRN1oGgMfFGq
         5uiXgQDmFLEDw/f1qI2VWyq1ze2/M4D5bTs0rBU0ytQX349PB+CD0V8OMTTA3tmr7pzN
         Ad7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979414; x=1769584214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hJ81YcHVJUXCUDOSqTEo4fpneXYhzAyyqlg4VRJWSOc=;
        b=A9PdqE/7O7hPh3B5EQU6m8YHTEK55Ff45/+2DwM5uBA6ijz945BW7h0nvyEUbWiWGf
         dB65+jJfFRGXDUhWhLKW78fApCNl9eOp22FZc6sgitGN6nETQuVmzizOmzEGjiRyXiH5
         VY+0vRi0BKjhj7eztTksAJEMSp5zG4hZFSoqs26g/7WFeKo6TwzzQe40Mp8iwOf8JIhZ
         nELoYd8rtmHCHEf/HCR8eNZm9FthKUFk2ZNKoktT4RnLdQWFjcXa5NUvxlAb53QRZo5a
         Kag1+ZoyKANPXWfky/5a/omX21om55xBbU2AB+n96xY+xBWTYmoSFwnM4UqflnTVEdUr
         ynHw==
X-Forwarded-Encrypted: i=1; AJvYcCVNBEQvYB2D1ecnm6J8v9SD+qrX0zLUZlK0jCpBeNxOcsZ3H0xqRdMimeO2Jf0qJl+ky98o8pwYNGp0Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ljmN41SmqQ5vmDiBeHggEGHcPf5DhMa8RtdUH9/lP0wdUHmJ
	XsL+iaG7sjpm6Nxy7NfO2/dD7P8top/YZ1WX6//b/fo5e6uQGYqgNPzO5l2cuJRw0kJC3FeMNlD
	+kMvllWRZ5Q16zBQmjeGm7rIVdefx6hZaptqKJJBG
X-Gm-Gg: AZuq6aJc3MKXndREjtKIXG6RBrL7eHv4f0T2lr3YPpwd2rOlFN/2ulPyA9jtIlQSkUO
	juseyLRZwsaD+hLjLXoe2C+lm9FWR1RjZ/SZXlxk6yZCGCqbrr85axUsFyVKfh1Stx9NhAOS5tz
	v1Jt+ZbpzNF0c/OYf8KDfW4mgOdnrNEeeNql36zMkmmYQAyGqqf2ecDUFkZcYAbRgK4Nxfe8K7H
	Qu+uin+46Mwn3N/od7lRqyLg2m/KfdVd1x951hmmpZ+HpN6oUlcYE+WZUmBmfbtCSMjNz3v3JYP
	d7pLxds=
X-Received: by 2002:a17:902:e746:b0:290:8ecf:e9f9 with SMTP id
 d9443c01a7336-2a7a2443b58mr1503495ad.7.1768979413636; Tue, 20 Jan 2026
 23:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com> <20260117052849.2205545-9-irogers@google.com>
 <aW_OV72q5rAVrgRE@x1> <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
In-Reply-To: <8c1fefd6-4f4c-42a7-9007-5c9df3975080@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 20 Jan 2026 23:10:01 -0800
X-Gm-Features: AZwV_Qg0iOIpO5Pzoy2b7YabxBnL-fqXhU8D44tCtQG-FBoEqke8sFeoam8z8tY
Message-ID: <CAP-5=fXUw=LLXX6Pzrab37TTrVrMdHJim1QOnvbP9gXsRQZFUg@mail.gmail.com>
Subject: Re: [PATCH v1 08/23] perf perf_regs: Switch from arch string to int e_machine
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Chun-Tse Shao <ctshao@google.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_231015_755510_252194A3 
X-CRM114-Status: GOOD (  25.11  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTA6NTjigK9QTSBNaSwgRGFwZW5nIDxkYXBlbmcxLm1p
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDEvMjEvMjAyNiAyOjQ5IEFNLCBBcm5h
bGRvIENhcnZhbGhvIGRlIE1lbG8gd3JvdGU6Cj4gPiBPbiBGcmksIEphbiAxNiwgMjAyNiBhdCAw
OToyODozNFBNIC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4+IFRoZSBhcmNoIHN0cmluZyBy
ZXF1aXJlcyBtdWx0aXBsZSBzdHJjbXAgdG8gaWRlbnRpZnkgdGhpbmdzIGxpa2UgdGhlCj4gPj4g
SVAgYW5kIFNQLiBTd2l0Y2ggdG8gcGFzc2luZyBpbiBhbiBlX21hY2hpbmUgdGhhdCBpbiB0aGUg
YnVsayBvZiBjYXNlcwo+ID4+IGlzIGNvbXB1dGVkIHVzaW5nIGEgY3VycmVudCB0aHJlYWQgbG9h
ZC4gVGhlIGVfbWFjaGluZSBhbHNvIGFsbG93cwo+ID4+IGlkZW50aWZpY2F0aW9uIG9mIDMyLWJp
dCB2cyA2NC1iaXQgcHJvY2Vzc2VzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSWFuIFJvZ2Vy
cyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4+IC0tLQo+ID4+ICB0b29scy9wZXJmL2J1aWx0aW4t
c2NyaXB0LmMgICAgICAgICAgICAgICAgICAgfCAgMTcgKystCj4gPj4gIHRvb2xzL3BlcmYvdXRp
bC9ldnNlbC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArKy0KPiA+PiAgdG9vbHMvcGVy
Zi91dGlsL3BlcmZfcmVncy5jICAgICAgICAgICAgICAgICAgIHwgMTA1ICsrKysrKysrKysrLS0t
LS0tLQo+ID4gWyBJbmNsdWRlIGR3YXJmLXJlZ3MuaCB0byBnZXQgY29uZGl0aW9uYWwgZGVmaW5l
cyBmb3IgRU1fQ1NLWSBhbmQgRU1fTE9PTkdBUkNILCBub3QgYXZhaWxhYmxlIGluIG9sZCBkaXN0
cm9zIF0KPiA+Cj4gPiAtIEFybmFsZG8KPgo+IFNlZW1zIHRoZSBjaGFuZ2Ugd291bGQgaW50cm9k
dWNlIHRoZSBiZWxvdyBidWlsZGluZyBlcnJvci4KPgo+IHV0aWwvcGVyZl9yZWdzLmM6IEluIGZ1
bmN0aW9uIOKAmHBlcmZfcmVnX25hbWXigJk6Cj4gdXRpbC9wZXJmX3JlZ3MuYzo0ODoxNDogZXJy
b3I6IOKAmEVNX0xPT05HQVJDSOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcwo+IGZ1
bmN0aW9uKQo+ICAgIDQ4IHwgICAgICAgICBjYXNlIEVNX0xPT05HQVJDSDoKPiAgICAgICB8ICAg
ICAgICAgICAgICBefn5+fn5+fn5+fn4KPiB1dGlsL3BlcmZfcmVncy5jOjQ4OjE0OiBub3RlOiBl
YWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5Cj4gb25jZSBmb3IgZWFj
aCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCj4gdXRpbC9wZXJmX3JlZ3MuYzogSW4gZnVuY3Rpb24g
4oCYcGVyZl9hcmNoX3JlZ19pcOKAmToKPiB1dGlsL3BlcmZfcmVncy5jOjExNDoxNDogZXJyb3I6
IOKAmEVNX0xPT05HQVJDSOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4KPiB0aGlzIGZ1bmN0
aW9uKQo+ICAgMTE0IHwgICAgICAgICBjYXNlIEVNX0xPT05HQVJDSDoKPiAgICAgICB8ICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn4KPiB1dGlsL3BlcmZfcmVncy5jOiBJbiBmdW5jdGlvbiDigJhw
ZXJmX2FyY2hfcmVnX3Nw4oCZOgo+IHV0aWwvcGVyZl9yZWdzLmM6MTQzOjE0OiBlcnJvcjog4oCY
RU1fTE9PTkdBUkNI4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbgo+IHRoaXMgZnVuY3Rpb24p
Cj4gICAxNDMgfCAgICAgICAgIGNhc2UgRU1fTE9PTkdBUkNIOgo+ICAgICAgIHwgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fgo+Cj4gSXQgbG9va3MgRU1fTE9PTkdBUkNIIGlzIG5vdCBkZWZpbmVk
IGluIHRoZSA8ZWxmLmg+IGhlYWRlciBmaWxlLCBub3Qgc3VyZQo+IHdoaWNoIG9uZSBpcyBiZXR0
ZXIsIGluY2x1ZGUgIGR3YXJmLXJlZ3MuaCBzdWdnZXN0ZWQgYnkgQXJuYWxkbyBvciBkaXJlY3QK
PiBhZGQgdGhlIGRlZmluZSwKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvcGVyZl9y
ZWdzLmMgYi90b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMKPiBpbmRleCBiNThkNTliODRmYjEu
LmNlODM5ZGYxOWZhMyAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMK
PiArKysgYi90b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMKPiBAQCAtNiw2ICs2LDEwIEBACj4g
ICNpbmNsdWRlICJ1dGlsL3NhbXBsZS5oIgo+ICAjaW5jbHVkZSAiZGVidWcuaCIKPgo+ICsjaWZu
ZGVmIEVNX0xPT05HQVJDSAo+ICsjZGVmaW5lIEVNX0xPT05HQVJDSCAgICAgICAgICAgMjU4Cj4g
KyNlbmRpZgoKT3IgI2luY2x1ZGUgPGR3YXJmLXJlZ3MuaD4gd2hpY2ggSSB0aGluayBpcyB0aGUg
Zml4IEFybmFsZG8gaXMKY2FycnlpbmcgYXQgdGhlIG1vbWVudC4KClRoYW5rcywKSWFuCgo+ICsK
PiAgaW50IF9fd2VhayBhcmNoX3NkdF9hcmdfcGFyc2Vfb3AoY2hhciAqb2xkX29wIF9fbWF5YmVf
dW51c2VkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNoYXIgKipuZXdfb3Ag
X19tYXliZV91bnVzZWQpCj4gIHsKPgo+Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
