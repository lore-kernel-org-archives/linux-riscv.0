Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878CAC54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 15:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oy6CdLMC9XslGAhizjzzW+2+vspztJyNZjpLDi6Cu8M=; b=DJZ9lWdfZyrtjk
	J/wdpToVGdToKRTyJj0CVl2ip3+GMJZq8IOCeZ+icfnrZOcBACZGOikjP4upywGNHiuQar2G+5JNO
	yxp0Ilw+9gjEccWY2yJCyICSHyCJi+kqZqWcz6DgwN6OsSdLCKx+COl1X8jdjGs53EH6yc8GVMLs1
	TiGuYAShOT7EfYvSG2HGpLK2VCn4QQGq4tonkSppwFtG/NkL+dLVgppqI6GC1aKYsI/WxRnq0Y/HT
	hrj9yb5pA37IymAgoN16kkI1VTFfbE3uiIXtPzIrOjXflWCy29JfuoYaZ+ScMpOZt01ARFcKcLEvQ
	5wllaF8/MERrdIPbTFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu72-002Fwk-FZ; Mon, 09 Jan 2023 15:31:00 +0000
Received: from smtpout30.security-mail.net ([85.31.212.34] helo=fx304.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu6x-002FsJ-Jc
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 15:30:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by fx304.security-mail.net (Postfix) with ESMTP id D23FB9D0CE
	for <linux-riscv@lists.infradead.org>; Mon,  9 Jan 2023 16:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1673278252;
	bh=2Ol4WvfIDv/pCXWodkK/JAf2l0CqXaG0EOhqPlCz5xY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kz8ddZYg0nJtow93ucAH7WnT8Vqwhr3lvi4IHN8OoSZGNmOScb2xcOeU4ahhPcX9+
	 p9CNBdA/jH2f4K049TrCPM610wwO1NQ4J9xx87Kmzbu7GXz0K8YSAee6gE4pfS7J3i
	 nAosaoMAGS6mHOvc8xjvjf4lK/Nd1xrz4y1l10bc=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id 642369D072; Mon,  9 Jan 2023 16:30:52 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id C72639D077; Mon,  9 Jan
 2023 16:30:51 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 800FA27E03FF; Mon,  9 Jan 2023
 16:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 4D6D327E0401; Mon,  9 Jan 2023 16:30:51 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 NjE5sn82VCRv; Mon,  9 Jan 2023 16:30:51 +0100 (CET)
Received: from [192.168.37.161] (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 8E4D827E03FE; Mon,  9 Jan 2023
 16:30:50 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <af88.63bc332b.c5f73.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 4D6D327E0401
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1673278251;
 bh=AQRkX8OfPpkm9ao22SwrZcjsHp5YTFXu85Lp04m+1A0=;
 h=Message-ID:Date:MIME-Version:To:From;
 b=Nw9h4dkzOwPn5vuhGKIyNNJs3P3x4pfdYEE7ckz9lL13tSkmK4nwamwpUjampl3D6
 LDhJg2t6qBuoBWDfEIexbrFwLh9D9VyJiOWUlwmQC+1j7iIHZ+vEfgfvPWRc9vt9zD
 PN1+BJeuI0U91Om91ZCvoSBebX3S3D5TsBEjM/tE=
Message-ID: <bccad498-3af2-08f1-8264-cf7b438732d3@kalray.eu>
Date: Mon, 9 Jan 2023 16:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
Content-Language: en-us
To: Jeff Xie <xiehuan09@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 bpf@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 devicetree@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Eric
 Paris <eparis@redhat.com>, Ingo Molnar <mingo@redhat.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Jason Baron <jbaron@akamai.com>, Jiri Olsa
 <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Kees Cook <keescook@chromium.org>, Kieran Bingham
 <kbingham@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-audit@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Nick Piggin <npiggin@gmail.com>, Oleg Nesterov
 <oleg@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Moore
 <paul@paul-moore.com>, Paul Walmsley <paul.walmsley@sifive.com>, Peter
 Zijlstra <peterz@infradead.org>, Rob Herring <robh+dt@kernel.org>, Sebastian
 Reichel <sre@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon
 <will@kernel.org>, Alex Michon <amichon@kalray.eu>, Ashley Lesdalons
 <alesdalons@kalray.eu>, Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 Clement Leger <clement.leger@bootlin.com>, Guillaume Missonnier
 <gmissonnier@kalray.eu>, Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Jean-Christophe Pince <jcpince@gmail.com>, Jonathan Borne
 <jborne@kalray.eu>, Jules Maselbas <jmaselbas@kalray.eu>, Julian Vetter
 <jvetter@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>, Julien Villette
 <jvillette@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Marc =?utf-8?b?UG91bGhpw6hz?= <dkm@kataplop.net>,
 Marius Gligor <mgligor@kalray.eu>, Samuel Jones <sjones@kalray.eu>, Thomas
 Costis <tcostis@kalray.eu>, Vincent Chardon
 <vincent.chardon@elsys-design.com>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
 <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
 <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
From: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_073055_807392_AE91FB90 
X-CRM114-Status: GOOD (  19.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSmVmZiwKCk9uIDEvOS8yMyAxNjoxMSwgSmVmZiBYaWUgd3JvdGU6Cj4gT24gTW9uLCBKYW4g
OSwgMjAyMyBhdCA5OjIxIFBNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdy
b3RlOgo+PiBIaSBKZWZmLAo+Pgo+PiBPbiAxLzcvMjMgMDc6MjUsIEplZmYgWGllIHdyb3RlOgo+
Pj4gSGksCj4+Pgo+Pj4gT24gV2VkLCBKYW4gNCwgMjAyMyBhdCAxOjAxIEFNIFlhbm4gU2lvbm5l
YXUgPHlzaW9ubmVhdUBrYWxyYXkuZXU+IHdyb3RlOgo+Pj4+IFtzbmlwXQo+Pj4+Cj4+Pj4gQSBr
dnggdG9vbGNoYWluIGNhbiBiZSBidWlsdCB1c2luZzoKPj4+PiAjIGluc3RhbGwgZGVwZW5kZW5j
aWVzOiB0ZXhpbmZvIGJpc29uIGZsZXggbGliZ21wLWRldiBsaWJtcGMtZGV2IGxpYm1wZnItZGV2
Cj4+Pj4gJCBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRz
Cj4+Pj4gJCBjZCBidWlsZC1zY3JpcHRzCj4+Pj4gJCBzb3VyY2UgbGFzdC5yZWZzCj4+Pj4gJCAu
L2J1aWxkLWt2eC14Z2NjLnNoIG91dHB1dAo+Pj4gSSB3b3VsZCBsaWtlIHRvIGJ1aWxkIHRoZSBr
dngteGdjYyB0byBjb21waWxlIGFuZCB0ZXN0IHRoZSBsaW51eAo+Pj4ga2VybmVsLCBidXQgaXQg
cmVwb3J0ZWQgYSBjb21waWxlIGVycm9yLgo+Pj4gSSB3b25kZXIgd2hhdCB2ZXJzaW9uIG9mIGdj
YyB5b3UgYXJlIHVzaW5nLgo+Pj4KPj4+IE15IGJ1aWxkIGVudmlyb25tZW50Ogo+Pj4gVkVSU0lP
Tj0iMjAuMDQuMiBMVFMgKEZvY2FsIEZvc3NhKSIKPj4+IGdjYyB2ZXJzaW9uIDkuMy4wIChVYnVu
dHUgOS4zLjAtMTd1YnVudHUxfjIwLjA0KQo+Pj4KPj4+Cj4+PiBDb21waWxlIGVycm9yOgo+Pj4g
JCAuL2J1aWxkLWt2eC14Z2NjLnNoIG91dHB1dAo+Pj4KPj4+IC4uLy4uL2JpbnV0aWxzL2xpYmli
ZXJ0eS9maWJoZWFwLmM6IEluIGZ1bmN0aW9uIOKAmGZpYmhlYXBfcmVwbGFjZV9rZXlfZGF0YeKA
mToKPj4+IC4uLy4uL2JpbnV0aWxzL2xpYmliZXJ0eS9maWJoZWFwLmM6Mzg6MjQ6IGVycm9yOiDi
gJhMT05HX01JTuKAmSB1bmRlY2xhcmVkCj4+PiAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24p
Cj4+PiAgICAgIDM4IHwgI2RlZmluZSBGSUJIRUFQS0VZX01JTiBMT05HX01JTgo+Pj4gICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPj4+IFtzbmlwXQo+PiBXaGF0IFNI
QTEgb2YgaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRzIGFyZSB5b3UgdXNp
bmc/Cj4gSSBoYXZlIGV4ZWN1dGVkIHRoZSAic291cmNlIGxhc3QucmVmcyIKCkkgd2FzIHJlZmVy
cmluZyB0byB0aGUgU0hBMSBvZiB0aGUgcmVwbyBpdHNlbGYgKGJ1aWxkLXNjcmlwdHMpLgoKYGxh
c3QucmVmc2AgaXMgYSBzeW1ib2xpYyBsaW5rIHdoaWNoIGNhbiBwb2ludCB0byBzZXZlcmFsIHJl
bGVhc2VzLCAKZGVwZW5kaW5nIG9uICJ3aGVuIiB5b3UgZGlkIHRoZSBjbG9uZS4KCkkgYW0gYXNr
aW5nIHRoaXMgYmVjYXVzZSB3ZSByZWNlbnRseSBwdWJsaXNoZWQgbmV3IHRvb2xjaGFpbnMuCgpJ
IHdhbnQgdG8gbWFrZSBzdXJlIHdoaWNoIG9uZSB5b3UgYXJlIHRyeWluZyB0byBidWlsZC4KCj4+
IFdlIGFyZSBidWlsZGluZyBvdXIgdG9vbGNoYWluIG9uIFVidW50dSAxOC4wNCAvIDIwLjA0IGFu
ZCAyMi4wNCB3aXRob3V0Cj4+IGlzc3VlcywgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBpdCBkb2Vz
IG5vdCB3b3JrIGZvciB5b3UsIGFsdGhvdWdoIGluZGVlZAo+PiB0aGUgZXJyb3IgbG9nIHlvdSBh
cmUgaGF2aW5nIHBvcHMgb3V0IG9uIG15IHNlYXJjaCBlbmdpbmUgYW5kIHNlZW1zIHRvCj4+IGJl
IHNvbWUgd2VsbCBrbm93biBpc3N1ZS4KPiBZZXMsIHRoZXJlIGFyZSBtYW55IGFuc3dlcnMgb24g
dGhlIHdlYiwgYnV0IG5vbmUgb2YgdGhlbSBzb2x2ZSB0aGlzIHByb2JsZW0uCj4KPj4gSWYgdGhl
IGJ1aWxkLXNjcmlwdCBkb2VzIG5vdCB3b3JrIGZvciB5b3UsIHlvdSBjYW4gc3RpbGwgdXNlIHRo
ZQo+PiBwcmUtYnVpbHQgdG9vbGNoYWlucyBnZW5lcmF0ZWQgYnkgdGhlIEdpdEh1YiBhdXRvbWF0
ZWQgYWN0aW9uczoKPj4gaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRzL3Jl
bGVhc2VzL3RhZy92NC4xMS4xICgibGF0ZXN0Igo+PiBtZWFucyAyMi4wNCkKPiBUaGFua3MsIHRo
aXMgaXMgdGhlIGZpbmFsIHNvbHV0aW9uIDstKQpHb29kIHRvIHNlZSBpdCBoZWxwZWQgOikKClJl
Z2FyZHMsCgotLSAKCllhbm4KCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
