Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EE4C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8TX/ot+l5y05ZonRQcQlvruAr5qk2zHNh4UH+DPvOQ=; b=fEGkxSOBF0h/8y
	gAb0bll+QbLvHom77jSZDaEXurnHToWeeTFO2Zi9gm7ka0Z+l+UvXhcl/SA4GFIi+ppvyiwy5fkQk
	piAG9ppJEGnTBqkN4NefgFl8t0LLrLIDUIaZkr16U90bOWpbyi/7bjvzYwnxJ2savIzxV/tkvCwzb
	jxzGKhp3aBVrVFuBA18DEo/yABXElr/QtxrLb5UliIxv41acGXnlhp7xrhK3WDqLr/WoflwLhcJ35
	O23SArV0A0Nd3tABp2zuJgAg22noW/U24/E+8wAcoYkdex+RTMYwrKRNmpeskHu520fapWVg4R9RT
	9er1zRMfOhMZ0KUQ0sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuTD-002QaY-1K; Mon, 09 Jan 2023 15:53:55 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuT8-002QY7-Ie; Mon, 09 Jan 2023 15:53:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 36so6136460pgp.10;
        Mon, 09 Jan 2023 07:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr5NMyR17w820E39Zxy+TJT5WIxXv3t9mTGHg5DI4M8=;
        b=p925wfq85MYYr0Q3szQHiqh8M9TGBDNLmFWeMdVCKRfm+cOHibl08yqwJoSo2r7XJP
         wq9Jltk/+brtH8hNCZXvq0DxtwSQIazxtjZdEKfg/0vGYUECRtOKJhbchra23Qxq01EI
         LW2KfmroEgha10Hiqqq7sbs4sKftMAXbHM5UfrApMgHovRtAjqup/7ZDx5c66hJHq9Cr
         iYTmJQehTgnexoKO7TcMDfBVxLmHJagL/RtulJH5m9HvVCQxeaP/W6dGAdxxBRvcFDn6
         /uu4CaMMaHvzdo/E1y8HoopqpLRDOCKFzxs2QxX+RtbfC5zpKXwCLbC6QNQfLNGjuHM5
         8s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr5NMyR17w820E39Zxy+TJT5WIxXv3t9mTGHg5DI4M8=;
        b=ditxVNF7roVy++HmY3WxAE3tppK7JbM1zrn5ITAO9SrTwshQevMs3rBalS+NTrJkqc
         h5x3AdBfK5RT5LYGl/vqwaqzma6YtMEdQ+vGpPyWWE1E3Tzri4ggKjioNHPoi8PN/lLe
         s+P/8JQ8M1NTiC27wRyKp+FDMRsHlOLw0TExhbgwhUDiHD/5Q9rlXgdWZD4xGcHBHhH4
         HAMaCxEr6T846d2uc8em26XZg3aATy2VU+h9Vy7M5YdA17ef4r0iFgODe2wogprEPC2n
         WVr72yCzT1zX8ZXfC5+ILK2eFc9BGl9wFIHWyBNTWy68hT5241+lEISuA35BGYNqJr7D
         U5Xw==
X-Gm-Message-State: AFqh2koQIMfz1WrnAnZDccvu170inwHl3LJ32xG40MOY0VQbi0+GMW64
	YnMFcwlChmj1DzQQxFx6o4+h15oisfnXsaA6bv0=
X-Google-Smtp-Source: AMrXdXu5iAQa5w4G/nXooBZotH/u8Cle9aRMcHOGEDe3ZcG1lDUD8XzrRE/n7dp+CGJamrwD1EZHy0OvHYQNsDsudys=
X-Received: by 2002:a63:1e42:0:b0:478:9503:f498 with SMTP id
 p2-20020a631e42000000b004789503f498mr3557980pgm.96.1673279627421; Mon, 09 Jan
 2023 07:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20230103164359.24347-1-ysionneau@kalray.eu> <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
 <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu> <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
 <bccad498-3af2-08f1-8264-cf7b438732d3@kalray.eu>
In-Reply-To: <bccad498-3af2-08f1-8264-cf7b438732d3@kalray.eu>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 9 Jan 2023 23:53:35 +0800
Message-ID: <CAEr6+EC0SCXLrQ2YNYyCyMK1Z9=3=ajbbLP+RKSsARGsmJO9YA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
To: Yann Sionneau <ysionneau@kalray.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	bpf@vger.kernel.org, Christian Brauner <brauner@kernel.org>, devicetree@vger.kernel.org, 
	Eric Biederman <ebiederm@xmission.com>, Eric Paris <eparis@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Jason Baron <jbaron@akamai.com>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Kieran Bingham <kbingham@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-audit@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nick Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Moore <paul@paul-moore.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, Alex Michon <amichon@kalray.eu>, 
	Ashley Lesdalons <alesdalons@kalray.eu>, Benjamin Mugnier <mugnier.benjamin@gmail.com>, 
	Clement Leger <clement.leger@bootlin.com>, Guillaume Missonnier <gmissonnier@kalray.eu>, 
	Guillaume Thouvenin <gthouvenin@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, 
	Jonathan Borne <jborne@kalray.eu>, Jules Maselbas <jmaselbas@kalray.eu>, 
	Julian Vetter <jvetter@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>, 
	Julien Villette <jvillette@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Luc Michel <lmichel@kalray.eu>, 
	=?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>, 
	Marius Gligor <mgligor@kalray.eu>, Samuel Jones <sjones@kalray.eu>, Thomas Costis <tcostis@kalray.eu>, 
	Vincent Chardon <vincent.chardon@elsys-design.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_075350_636860_7F948EFC 
X-CRM114-Status: GOOD (  29.41  )
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

T24gTW9uLCBKYW4gOSwgMjAyMyBhdCAxMTozMCBQTSBZYW5uIFNpb25uZWF1IDx5c2lvbm5lYXVA
a2FscmF5LmV1PiB3cm90ZToKPgo+IEhpIEplZmYsCj4KPiBPbiAxLzkvMjMgMTY6MTEsIEplZmYg
WGllIHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gOSwgMjAyMyBhdCA5OjIxIFBNIFlhbm4gU2lvbm5l
YXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3RlOgo+ID4+IEhpIEplZmYsCj4gPj4KPiA+PiBP
biAxLzcvMjMgMDc6MjUsIEplZmYgWGllIHdyb3RlOgo+ID4+PiBIaSwKPiA+Pj4KPiA+Pj4gT24g
V2VkLCBKYW4gNCwgMjAyMyBhdCAxOjAxIEFNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBrYWxy
YXkuZXU+IHdyb3RlOgo+ID4+Pj4gW3NuaXBdCj4gPj4+Pgo+ID4+Pj4gQSBrdnggdG9vbGNoYWlu
IGNhbiBiZSBidWlsdCB1c2luZzoKPiA+Pj4+ICMgaW5zdGFsbCBkZXBlbmRlbmNpZXM6IHRleGlu
Zm8gYmlzb24gZmxleCBsaWJnbXAtZGV2IGxpYm1wYy1kZXYgbGlibXBmci1kZXYKPiA+Pj4+ICQg
Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cwo+ID4+Pj4g
JCBjZCBidWlsZC1zY3JpcHRzCj4gPj4+PiAkIHNvdXJjZSBsYXN0LnJlZnMKPiA+Pj4+ICQgLi9i
dWlsZC1rdngteGdjYy5zaCBvdXRwdXQKPiA+Pj4gSSB3b3VsZCBsaWtlIHRvIGJ1aWxkIHRoZSBr
dngteGdjYyB0byBjb21waWxlIGFuZCB0ZXN0IHRoZSBsaW51eAo+ID4+PiBrZXJuZWwsIGJ1dCBp
dCByZXBvcnRlZCBhIGNvbXBpbGUgZXJyb3IuCj4gPj4+IEkgd29uZGVyIHdoYXQgdmVyc2lvbiBv
ZiBnY2MgeW91IGFyZSB1c2luZy4KPiA+Pj4KPiA+Pj4gTXkgYnVpbGQgZW52aXJvbm1lbnQ6Cj4g
Pj4+IFZFUlNJT049IjIwLjA0LjIgTFRTIChGb2NhbCBGb3NzYSkiCj4gPj4+IGdjYyB2ZXJzaW9u
IDkuMy4wIChVYnVudHUgOS4zLjAtMTd1YnVudHUxfjIwLjA0KQo+ID4+Pgo+ID4+Pgo+ID4+PiBD
b21waWxlIGVycm9yOgo+ID4+PiAkIC4vYnVpbGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPj4+Cj4g
Pj4+IC4uLy4uL2JpbnV0aWxzL2xpYmliZXJ0eS9maWJoZWFwLmM6IEluIGZ1bmN0aW9uIOKAmGZp
YmhlYXBfcmVwbGFjZV9rZXlfZGF0YeKAmToKPiA+Pj4gLi4vLi4vYmludXRpbHMvbGliaWJlcnR5
L2ZpYmhlYXAuYzozODoyNDogZXJyb3I6IOKAmExPTkdfTUlO4oCZIHVuZGVjbGFyZWQKPiA+Pj4g
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ID4+PiAgICAgIDM4IHwgI2RlZmluZSBGSUJI
RUFQS0VZX01JTiBMT05HX01JTgo+ID4+PiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fgo+ID4+PiBbc25pcF0KPiA+PiBXaGF0IFNIQTEgb2YgaHR0cHM6Ly9naXRodWIu
Y29tL2thbHJheS9idWlsZC1zY3JpcHRzIGFyZSB5b3UgdXNpbmc/Cj4gPiBJIGhhdmUgZXhlY3V0
ZWQgdGhlICJzb3VyY2UgbGFzdC5yZWZzIgo+Cj4gSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBTSEEx
IG9mIHRoZSByZXBvIGl0c2VsZiAoYnVpbGQtc2NyaXB0cykuCj4KPiBgbGFzdC5yZWZzYCBpcyBh
IHN5bWJvbGljIGxpbmsgd2hpY2ggY2FuIHBvaW50IHRvIHNldmVyYWwgcmVsZWFzZXMsCj4gZGVw
ZW5kaW5nIG9uICJ3aGVuIiB5b3UgZGlkIHRoZSBjbG9uZS4KPgo+IEkgYW0gYXNraW5nIHRoaXMg
YmVjYXVzZSB3ZSByZWNlbnRseSBwdWJsaXNoZWQgbmV3IHRvb2xjaGFpbnMuCj4KPiBJIHdhbnQg
dG8gbWFrZSBzdXJlIHdoaWNoIG9uZSB5b3UgYXJlIHRyeWluZyB0byBidWlsZC4KClVuZm9ydHVu
YXRlbHkgSSBkZWxldGVkIHRoaXMgcmVwbyBhIGZldyBtaW51dGVzIGJlZm9yZSB5b3UgYXNrZWQg
bWUgOy0oCkJ1dCBJIHJlbWVtYmVyIHRoYXQgSSBjbG9uZWQgdGhpcyByZXBvIHR3byBkYXlzIGFn
by4KaXQgc2hvdWxkIGJlOiAgbGFzdC5yZWZzIC0+IHJlZnMvNC4xMS4wLnJlZnMKCgo+ID4+IFdl
IGFyZSBidWlsZGluZyBvdXIgdG9vbGNoYWluIG9uIFVidW50dSAxOC4wNCAvIDIwLjA0IGFuZCAy
Mi4wNCB3aXRob3V0Cj4gPj4gaXNzdWVzLCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IGRvZXMg
bm90IHdvcmsgZm9yIHlvdSwgYWx0aG91Z2ggaW5kZWVkCj4gPj4gdGhlIGVycm9yIGxvZyB5b3Ug
YXJlIGhhdmluZyBwb3BzIG91dCBvbiBteSBzZWFyY2ggZW5naW5lIGFuZCBzZWVtcyB0bwo+ID4+
IGJlIHNvbWUgd2VsbCBrbm93biBpc3N1ZS4KPiA+IFllcywgdGhlcmUgYXJlIG1hbnkgYW5zd2Vy
cyBvbiB0aGUgd2ViLCBidXQgbm9uZSBvZiB0aGVtIHNvbHZlIHRoaXMgcHJvYmxlbS4KPiA+Cj4g
Pj4gSWYgdGhlIGJ1aWxkLXNjcmlwdCBkb2VzIG5vdCB3b3JrIGZvciB5b3UsIHlvdSBjYW4gc3Rp
bGwgdXNlIHRoZQo+ID4+IHByZS1idWlsdCB0b29sY2hhaW5zIGdlbmVyYXRlZCBieSB0aGUgR2l0
SHViIGF1dG9tYXRlZCBhY3Rpb25zOgo+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVp
bGQtc2NyaXB0cy9yZWxlYXNlcy90YWcvdjQuMTEuMSAoImxhdGVzdCIKPiA+PiBtZWFucyAyMi4w
NCkKPiA+IFRoYW5rcywgdGhpcyBpcyB0aGUgZmluYWwgc29sdXRpb24gOy0pCj4gR29vZCB0byBz
ZWUgaXQgaGVscGVkIDopCj4KPiBSZWdhcmRzLAo+Cj4gLS0KPgo+IFlhbm4KPgo+Cj4KPgo+CgoK
LS0gClRoYW5rcywKSmVmZlhpZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
