Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BC3C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV0fqvjcR+3YgYG0AasgR48zj03C/XXcjzNWzUe2foI=; b=kv0iqXcMu7OnUr
	oEB5doG6K2Hf337B+wrgXcbKwLp9uFW/u3voewiNyvEc/+OgAayCEGra9vhm7/V925sUvOMuk3KsP
	Q6eLcLOfeo0ROn/29ieMcpxHbKQelwqfO83wbgnsdz9RKIubM6F/DpJwHOpFdi6bVdaidOEeOGa0i
	wO2m19hhBv9oPd31i8XyR3hWY2gizY+FdHv5x7IjmEDR4L88rHER7uoRECzZTW43yv1+ebi+CUCnQ
	XeivNnLj2vABaC5NA1C6fth/QXPEKdEoGyEf5j0V70B5iUQNamtzhg7dIrEnYrTIZnub5P6kKNG64
	xY2fZM+NiRffVlBR/baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEs6I-001Y1X-8Z; Mon, 09 Jan 2023 13:22:06 +0000
Received: from smtpout30.security-mail.net ([85.31.212.35] helo=fx305.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEs5c-001Xbi-6D
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 13:21:26 +0000
Received: from localhost (fx305.security-mail.net [127.0.0.1])
	by fx305.security-mail.net (Postfix) with ESMTP id 4482130FE7F
	for <linux-riscv@lists.infradead.org>; Mon,  9 Jan 2023 14:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1673270478;
	bh=VTyAgBvawac4uHB7eMyMDicCX2xLvVfQ11WRs4OqUgg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YZ+jS6/1Ma7JCmcJ3+OEDQF6/jdcWUhHaMCMCUIMiS/QRA3hvieFeCchl43TWG6g4
	 8uzP1OQwFTqJST5NGfflnAynHPXH43mmkQhylk6XZiFnOpe64YOUPMjH/EHaBa+r6X
	 XNQwFD9kMcy8gj0OVjfaZ+Y+swU0mq962ckt9ZPA=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id 06FF630FDE8; Mon,  9 Jan
 2023 14:21:18 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx305.security-mail.net (Postfix) with ESMTPS id 4C4CE30FD9E; Mon,  9 Jan
 2023 14:21:17 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 02D7627E03FA; Mon,  9 Jan 2023
 14:21:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id C36D627E03FE; Mon,  9 Jan 2023 14:21:16 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 o0bmnrw4djyi; Mon,  9 Jan 2023 14:21:16 +0100 (CET)
Received: from [192.168.37.161] (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 46FC927E03F5; Mon,  9 Jan 2023
 14:21:16 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <155f.63bc14cd.4a998.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu C36D627E03FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1673270476;
 bh=pFwL+Y0S0qo0MF7wO/awAfpxvBk+/1wXJh5pVmIIW2g=;
 h=Message-ID:Date:MIME-Version:To:From;
 b=XjT0yLLBY18QxivMgV9uczq9z+HpKf5TnyecD/FGL3y5WOfaxlypJyAxpZ8saNN2c
 xkoB4C8EPYxurJyqIoGRHgJxE+LjZeyAAIvw8YYk1DjcyoP679xtmnwZh9BbBCh3Ku
 YVP4+a/ZNoUFvoUsbRjrSO4n7fz2l6dahOcJsTh0=
Message-ID: <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
Date: Mon, 9 Jan 2023 14:21:15 +0100
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
From: Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_052124_758407_133BD5FB 
X-CRM114-Status: GOOD (  18.38  )
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

SGkgSmVmZiwKCk9uIDEvNy8yMyAwNzoyNSwgSmVmZiBYaWUgd3JvdGU6Cj4gSGksCj4KPiBPbiBX
ZWQsIEphbiA0LCAyMDIzIGF0IDE6MDEgQU0gWWFubiBTaW9ubmVhdSA8eXNpb25uZWF1QGthbHJh
eS5ldT4gd3JvdGU6Cj4+IFtzbmlwXQo+Pgo+PiBBIGt2eCB0b29sY2hhaW4gY2FuIGJlIGJ1aWx0
IHVzaW5nOgo+PiAjIGluc3RhbGwgZGVwZW5kZW5jaWVzOiB0ZXhpbmZvIGJpc29uIGZsZXggbGli
Z21wLWRldiBsaWJtcGMtZGV2IGxpYm1wZnItZGV2Cj4+ICQgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0
aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cwo+PiAkIGNkIGJ1aWxkLXNjcmlwdHMKPj4gJCBz
b3VyY2UgbGFzdC5yZWZzCj4+ICQgLi9idWlsZC1rdngteGdjYy5zaCBvdXRwdXQKPiBJIHdvdWxk
IGxpa2UgdG8gYnVpbGQgdGhlIGt2eC14Z2NjIHRvIGNvbXBpbGUgYW5kIHRlc3QgdGhlIGxpbnV4
Cj4ga2VybmVsLCBidXQgaXQgcmVwb3J0ZWQgYSBjb21waWxlIGVycm9yLgo+IEkgd29uZGVyIHdo
YXQgdmVyc2lvbiBvZiBnY2MgeW91IGFyZSB1c2luZy4KPgo+IE15IGJ1aWxkIGVudmlyb25tZW50
Ogo+IFZFUlNJT049IjIwLjA0LjIgTFRTIChGb2NhbCBGb3NzYSkiCj4gZ2NjIHZlcnNpb24gOS4z
LjAgKFVidW50dSA5LjMuMC0xN3VidW50dTF+MjAuMDQpCj4KPgo+IENvbXBpbGUgZXJyb3I6Cj4g
JCAuL2J1aWxkLWt2eC14Z2NjLnNoIG91dHB1dAo+Cj4gLi4vLi4vYmludXRpbHMvbGliaWJlcnR5
L2ZpYmhlYXAuYzogSW4gZnVuY3Rpb24g4oCYZmliaGVhcF9yZXBsYWNlX2tleV9kYXRh4oCZOgo+
IC4uLy4uL2JpbnV0aWxzL2xpYmliZXJ0eS9maWJoZWFwLmM6Mzg6MjQ6IGVycm9yOiDigJhMT05H
X01JTuKAmSB1bmRlY2xhcmVkCj4gKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgICAz
OCB8ICNkZWZpbmUgRklCSEVBUEtFWV9NSU4gTE9OR19NSU4KPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+Cj4gW3NuaXBdCgpXaGF0IFNIQTEgb2YgaHR0cHM6Ly9naXRo
dWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRzIGFyZSB5b3UgdXNpbmc/CgpXZSBhcmUgYnVpbGRp
bmcgb3VyIHRvb2xjaGFpbiBvbiBVYnVudHUgMTguMDQgLyAyMC4wNCBhbmQgMjIuMDQgd2l0aG91
dCAKaXNzdWVzLCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0IGRvZXMgbm90IHdvcmsgZm9yIHlv
dSwgYWx0aG91Z2ggaW5kZWVkIAp0aGUgZXJyb3IgbG9nIHlvdSBhcmUgaGF2aW5nIHBvcHMgb3V0
IG9uIG15IHNlYXJjaCBlbmdpbmUgYW5kIHNlZW1zIHRvIApiZSBzb21lIHdlbGwga25vd24gaXNz
dWUuCgpJZiB0aGUgYnVpbGQtc2NyaXB0IGRvZXMgbm90IHdvcmsgZm9yIHlvdSwgeW91IGNhbiBz
dGlsbCB1c2UgdGhlIApwcmUtYnVpbHQgdG9vbGNoYWlucyBnZW5lcmF0ZWQgYnkgdGhlIEdpdEh1
YiBhdXRvbWF0ZWQgYWN0aW9uczogCmh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2Ny
aXB0cy9yZWxlYXNlcy90YWcvdjQuMTEuMSAoImxhdGVzdCIgCm1lYW5zIDIyLjA0KQoKSSBob3Bl
IGl0IHdpbGwgd29yayBmb3IgeW91LgoKUmVnYXJkcywKCi0tIAoKWWFubgoKCgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
