Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3827FC54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXtYDaEV9uCcB/zDWKltfYHjFpOtzFjBR1pDGeNU9nw=; b=lp1t5md6Q9m3iO
	XMoPit9AhmKAY4lGS+pG0RbDYAX2tDUTbR+ZSSmJAHoYhemxC44Z6MpJWYJsPwIup4t+e0GCN6bCb
	6cNmSAhZlRbsd5AGch/dPhdcilIq0CKWKYJLaH7Zzf3FQaELw+62Ol7XNV1KC4deEU21LfQvcwiwL
	hGoV2ouFHF5I20Qn4mmg7Bwjp58U8yF+UryJTuaGsvmJwyMQCvUUcAHki117WwYHyprrrXi60TZlj
	Bg5o0HnP1oCjGMCKTPG9VCGXqrnl+FiZv17ZkvYBDuPEqVLDIPU5xoE65dyovn7uB6Z6NC1hf/lEO
	+2K+poeNdw0ndv5XkpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJxp-008z85-Po; Mon, 16 Jan 2023 07:31:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHJxm-008z5n-AM; Mon, 16 Jan 2023 07:31:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so6574688pjg.4;
        Sun, 15 Jan 2023 23:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOOg7H5N+Z63OpUC/u+N5UvkbhcnIUC0AQSISCJusN4=;
        b=bNV/0vag1ZvLMpWwA4mawziLzieesOHeeP/uolhRj/Qp/fgoUEgKS7N3HGAUJ0hwEi
         NNrZZvSk5PRav8zwcMHaV79OCbj1kyAbRLaXuJBlAkL2qROgelytvjsBqXyclWatD66P
         Ugj2u4a35Qg8LB7A0QOSbJbcpeoiYZd4m2f45lFwkXfct6yFrIw9H9B2+WHzTF0gvm5o
         AshIWCnV/8OV2oXEADbsYpB4TvdLkd4l84BBzh3/uu9idPKpYXziuWROZgnCLNhU+sJN
         JRZO8KK8t6UrpaZbxL3OVAvsgPDH3MoIn0oJGJSBPHnnWKgt3Ul15ZHKTohvJxgO9iV7
         E02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOOg7H5N+Z63OpUC/u+N5UvkbhcnIUC0AQSISCJusN4=;
        b=BLKXa6OEMAd7x2U+UnvW9UlM3ya9Hj3cAnTKa2A/e+HxW/jvijhbYLejeXKJJWpv0V
         Y1E5F4mm0/iU05zVb6Mk6jo3+6nEMzpj67LPaKHEk19jlq2hYeKVGqgSEpLAgIvOo8eQ
         g2ne6+lzeyE9aMq+mG/NRXyUqKdxNJxzdGhFuNn3L6Z14RMAVhtx2IuHn7YtLOR4Nv/i
         u1/iO082VobGmg49kexXiExakB9SSZPywzFkESSTs+8W/NNxVgo+k20bvNtzpx5LOxyx
         Ofq2b8G1PivU0LTZiWKEikJ4OMRzi6JO7LKesmQxBZ7S5FOIahneqlQoUrQtyCmavqhb
         X5+A==
X-Gm-Message-State: AFqh2koJUMY4Vn7WLU1BmVhriFQ+fStVRaREVdvCKmKTLB0+45smVCyh
	ATXgP5h7qA00SfNe4JADNTxcxEAEHj3cXSyikTM=
X-Google-Smtp-Source: AMrXdXsHaNFvTcwq7IYjoURTRKB9mLY6RlfohU9xRx/ch1k9FfnZTPFe5NEyMuszQC6sWUU/1ki2k4jRifdInbi8kL8=
X-Received: by 2002:a17:90b:1112:b0:223:dd6f:13b2 with SMTP id
 gi18-20020a17090b111200b00223dd6f13b2mr6617650pjb.56.1673854283697; Sun, 15
 Jan 2023 23:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20230103164359.24347-1-ysionneau@kalray.eu> <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
 <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu> <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
 <bccad498-3af2-08f1-8264-cf7b438732d3@kalray.eu> <CAEr6+EC0SCXLrQ2YNYyCyMK1Z9=3=ajbbLP+RKSsARGsmJO9YA@mail.gmail.com>
In-Reply-To: <CAEr6+EC0SCXLrQ2YNYyCyMK1Z9=3=ajbbLP+RKSsARGsmJO9YA@mail.gmail.com>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 16 Jan 2023 15:31:11 +0800
Message-ID: <CAEr6+EC4e5QsodG_SpTVMBoGfW1GDAgUfBphahgrqy52vXFB+Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230115_233126_402061_7E6B285C 
X-CRM114-Status: GOOD (  33.07  )
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

T24gTW9uLCBKYW4gOSwgMjAyMyBhdCAxMTo1MyBQTSBKZWZmIFhpZSA8eGllaHVhbjA5QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiA5LCAyMDIzIGF0IDExOjMwIFBNIFlhbm4gU2lv
bm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3RlOgo+ID4KPiA+IEhpIEplZmYsCj4gPgo+
ID4gT24gMS85LzIzIDE2OjExLCBKZWZmIFhpZSB3cm90ZToKPiA+ID4gT24gTW9uLCBKYW4gOSwg
MjAyMyBhdCA5OjIxIFBNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3Rl
Ogo+ID4gPj4gSGkgSmVmZiwKPiA+ID4+Cj4gPiA+PiBPbiAxLzcvMjMgMDc6MjUsIEplZmYgWGll
IHdyb3RlOgo+ID4gPj4+IEhpLAo+ID4gPj4+Cj4gPiA+Pj4gT24gV2VkLCBKYW4gNCwgMjAyMyBh
dCAxOjAxIEFNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3RlOgo+ID4g
Pj4+PiBbc25pcF0KPiA+ID4+Pj4KPiA+ID4+Pj4gQSBrdnggdG9vbGNoYWluIGNhbiBiZSBidWls
dCB1c2luZzoKPiA+ID4+Pj4gIyBpbnN0YWxsIGRlcGVuZGVuY2llczogdGV4aW5mbyBiaXNvbiBm
bGV4IGxpYmdtcC1kZXYgbGlibXBjLWRldiBsaWJtcGZyLWRldgo+ID4gPj4+PiAkIGdpdCBjbG9u
ZSBodHRwczovL2dpdGh1Yi5jb20va2FscmF5L2J1aWxkLXNjcmlwdHMKPiA+ID4+Pj4gJCBjZCBi
dWlsZC1zY3JpcHRzCj4gPiA+Pj4+ICQgc291cmNlIGxhc3QucmVmcwo+ID4gPj4+PiAkIC4vYnVp
bGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPiA+Pj4gSSB3b3VsZCBsaWtlIHRvIGJ1aWxkIHRoZSBr
dngteGdjYyB0byBjb21waWxlIGFuZCB0ZXN0IHRoZSBsaW51eAo+ID4gPj4+IGtlcm5lbCwgYnV0
IGl0IHJlcG9ydGVkIGEgY29tcGlsZSBlcnJvci4KPiA+ID4+PiBJIHdvbmRlciB3aGF0IHZlcnNp
b24gb2YgZ2NjIHlvdSBhcmUgdXNpbmcuCj4gPiA+Pj4KPiA+ID4+PiBNeSBidWlsZCBlbnZpcm9u
bWVudDoKPiA+ID4+PiBWRVJTSU9OPSIyMC4wNC4yIExUUyAoRm9jYWwgRm9zc2EpIgo+ID4gPj4+
IGdjYyB2ZXJzaW9uIDkuMy4wIChVYnVudHUgOS4zLjAtMTd1YnVudHUxfjIwLjA0KQo+ID4gPj4+
Cj4gPiA+Pj4KPiA+ID4+PiBDb21waWxlIGVycm9yOgo+ID4gPj4+ICQgLi9idWlsZC1rdngteGdj
Yy5zaCBvdXRwdXQKPiA+ID4+Pgo+ID4gPj4+IC4uLy4uL2JpbnV0aWxzL2xpYmliZXJ0eS9maWJo
ZWFwLmM6IEluIGZ1bmN0aW9uIOKAmGZpYmhlYXBfcmVwbGFjZV9rZXlfZGF0YeKAmToKPiA+ID4+
PiAuLi8uLi9iaW51dGlscy9saWJpYmVydHkvZmliaGVhcC5jOjM4OjI0OiBlcnJvcjog4oCYTE9O
R19NSU7igJkgdW5kZWNsYXJlZAo+ID4gPj4+IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
PiA+ID4+PiAgICAgIDM4IHwgI2RlZmluZSBGSUJIRUFQS0VZX01JTiBMT05HX01JTgo+ID4gPj4+
ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+Cj4gPiA+Pj4gW3NuaXBd
Cj4gPiA+PiBXaGF0IFNIQTEgb2YgaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3Jp
cHRzIGFyZSB5b3UgdXNpbmc/Cj4gPiA+IEkgaGF2ZSBleGVjdXRlZCB0aGUgInNvdXJjZSBsYXN0
LnJlZnMiCj4gPgo+ID4gSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBTSEExIG9mIHRoZSByZXBvIGl0
c2VsZiAoYnVpbGQtc2NyaXB0cykuCj4gPgo+ID4gYGxhc3QucmVmc2AgaXMgYSBzeW1ib2xpYyBs
aW5rIHdoaWNoIGNhbiBwb2ludCB0byBzZXZlcmFsIHJlbGVhc2VzLAo+ID4gZGVwZW5kaW5nIG9u
ICJ3aGVuIiB5b3UgZGlkIHRoZSBjbG9uZS4KPiA+Cj4gPiBJIGFtIGFza2luZyB0aGlzIGJlY2F1
c2Ugd2UgcmVjZW50bHkgcHVibGlzaGVkIG5ldyB0b29sY2hhaW5zLgo+ID4KPiA+IEkgd2FudCB0
byBtYWtlIHN1cmUgd2hpY2ggb25lIHlvdSBhcmUgdHJ5aW5nIHRvIGJ1aWxkLgo+Cj4gVW5mb3J0
dW5hdGVseSBJIGRlbGV0ZWQgdGhpcyByZXBvIGEgZmV3IG1pbnV0ZXMgYmVmb3JlIHlvdSBhc2tl
ZCBtZSA7LSgKPiBCdXQgSSByZW1lbWJlciB0aGF0IEkgY2xvbmVkIHRoaXMgcmVwbyB0d28gZGF5
cyBhZ28uCj4gaXQgc2hvdWxkIGJlOiAgbGFzdC5yZWZzIC0+IHJlZnMvNC4xMS4wLnJlZnMKCkl0
IHNob3VsZCBiZSBteSBvd24gZW52aXJvbm1lbnRhbCBwcm9ibGVtLgpJIHJlaW5zdGFsbGVkIHRo
ZSBzeXN0ZW0gb25jZSBhbmQgaXQgaGFzIGJlZW4gYWJsZSB0byBjb21waWxlIG5vcm1hbGx5IDst
KQoKSW4gdGhlIHBhc3QgZmV3IGRheXMsIEkgaGF2ZSByZXZpZXdlZCBhbG1vc3QgYWxsIHRoZSBj
b2RlcywKd2hpY2ggaXMgdmVyeSBtZWFuaW5nZnVsIGZvciBtZSB0byBsZWFybiwgdGhhbmsgeW91
IHRlYW0uCgoKPgo+ID4gPj4gV2UgYXJlIGJ1aWxkaW5nIG91ciB0b29sY2hhaW4gb24gVWJ1bnR1
IDE4LjA0IC8gMjAuMDQgYW5kIDIyLjA0IHdpdGhvdXQKPiA+ID4+IGlzc3VlcywgSSBkb24ndCB1
bmRlcnN0YW5kIHdoeSBpdCBkb2VzIG5vdCB3b3JrIGZvciB5b3UsIGFsdGhvdWdoIGluZGVlZAo+
ID4gPj4gdGhlIGVycm9yIGxvZyB5b3UgYXJlIGhhdmluZyBwb3BzIG91dCBvbiBteSBzZWFyY2gg
ZW5naW5lIGFuZCBzZWVtcyB0bwo+ID4gPj4gYmUgc29tZSB3ZWxsIGtub3duIGlzc3VlLgo+ID4g
PiBZZXMsIHRoZXJlIGFyZSBtYW55IGFuc3dlcnMgb24gdGhlIHdlYiwgYnV0IG5vbmUgb2YgdGhl
bSBzb2x2ZSB0aGlzIHByb2JsZW0uCj4gPiA+Cj4gPiA+PiBJZiB0aGUgYnVpbGQtc2NyaXB0IGRv
ZXMgbm90IHdvcmsgZm9yIHlvdSwgeW91IGNhbiBzdGlsbCB1c2UgdGhlCj4gPiA+PiBwcmUtYnVp
bHQgdG9vbGNoYWlucyBnZW5lcmF0ZWQgYnkgdGhlIEdpdEh1YiBhdXRvbWF0ZWQgYWN0aW9uczoK
PiA+ID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cy9yZWxlYXNlcy90
YWcvdjQuMTEuMSAoImxhdGVzdCIKPiA+ID4+IG1lYW5zIDIyLjA0KQo+ID4gPiBUaGFua3MsIHRo
aXMgaXMgdGhlIGZpbmFsIHNvbHV0aW9uIDstKQo+ID4gR29vZCB0byBzZWUgaXQgaGVscGVkIDop
Cj4gPgo+ID4gUmVnYXJkcywKPiA+Cj4gPiAtLQo+ID4KPiA+IFlhbm4KPiA+Cj4gPgo+ID4KPiA+
Cj4gPgo+Cj4KPiAtLQo+IFRoYW5rcywKPiBKZWZmWGllCgoKCi0tClRoYW5rcywKSmVmZlhpZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
