Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D32C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REi8q/RvhQ0RWRRlkj+xiCI1HWeTt+HHG8GEFdG32A8=; b=hIzzeahSBboXZK
	PzX5whUXKWPpXN3FCVYkDEbWmbTPeCGNwBQu4ychqgnGbYQypFwGNDrake8IP9RIMpGPAwXKjTT82
	quTpFVrtEvnySEwb3Zj5Zi9F5SX1VkMPnicxsyD8/GvnWZorVMaYSq9xRCqpB2yFvDYEZkf720dnX
	LqCzAsotq3wZ7x0+YsZZOe2F5l0fHyfVRL8W3tydhebX4RjJoGN+OYC3KM2FdjK9fDMnxgEPsTAs3
	gBpmlwcsoi9PHPmkokKHZzvmGRHWrmUnJPGlqucJ/01y3LDZfThwZC4fNdWOsQ4WWzFO+EXddEPvH
	2atlA7VeepvPdxEdGrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEto6-0027x7-AW; Mon, 09 Jan 2023 15:11:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEto1-0027u6-B7; Mon, 09 Jan 2023 15:11:23 +0000
Received: by mail-pf1-x429.google.com with SMTP id s3so3813083pfd.12;
        Mon, 09 Jan 2023 07:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbMyQ+Lk6XMV45ZxQEld3vGI2Hm83HoIjGeiP+5YohY=;
        b=UiyJWV8IESgIQ+htn089mbpQcf/DLM9JuIZW92t4SLyj7AJACTqzJqRhhioRc+Z08O
         ffJigl+z8xYM/epYBQLukDEyeOtTH1tM7SAJbR7WOX7BbZ/FrxXl23ilCtw/lhtOVpeF
         pQDilsaYeJlxPdgOuB2kpOB9N/22VjmvkMgJj3N35N3ajCe35g+vg/lIrj2unu/Evrpx
         fU2zQ9eqCPlN/nNvTZOa47ifIE3siIIOYkbW9vsA3YVH85KM6Oa4xBeI6OXmCZpoM9i2
         b5kAMbdtBNPmjzzxKBYfzZUeGVBUUWf0ZNBmFg9UICKxIcyhk5OqehRsRS1GdlmX7Sb4
         De4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbMyQ+Lk6XMV45ZxQEld3vGI2Hm83HoIjGeiP+5YohY=;
        b=fI5I4sgsS6bmGvxN3lVFKtSJMRMVvtXJ7hT+D1kuE7QYcage9RZ4wUDNg28Pwqa+Ks
         ez6IH/OztvQC9L9vIyc554pqX2f/iAkL3AkzR9Wd816V5F8ckHxNzKM0k+uYgUAYU0TG
         zfBJgkO+8/EinLiVwFFWe/ZI15twpp3CjwTqtRKPFOi8vvrDjWie1HNk/y14uUUjQ0Uy
         UuFGOw16pHUMczuypc5+cxSWuHcXXkX5/+u1XQ9oTx73tAdIsquRTXvDj9aW8hzexNvi
         ZLqLhWVrls/QchEhiiAu0a4uOKXtOvb7aqRwgWQwFAfjgH+yy13Q4zSQFJXq8mZqiats
         Muqw==
X-Gm-Message-State: AFqh2koBuscifz5dk3+t/T+yGt08X6Xiev59AeAc3rVUBL04VuxnXSKT
	/bXX5tdBwl3KO2yVfzYVeyDZtByyp3ruo/72Bdk=
X-Google-Smtp-Source: AMrXdXtaMXZw+A+awBZWMsLxBBg2VbK1BTjUoNNl6u+Vm395uYoqWXtbYO/zcm6KlM3AUdY2y8deWO0NXh0INgA2vaA=
X-Received: by 2002:a63:f957:0:b0:477:98cc:3d01 with SMTP id
 q23-20020a63f957000000b0047798cc3d01mr3281088pgk.505.1673277078970; Mon, 09
 Jan 2023 07:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20230103164359.24347-1-ysionneau@kalray.eu> <CAEr6+ECRh_9App18zmcS6FUR81YYhR=n4kGdeZAtQBsdMB55_A@mail.gmail.com>
 <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
In-Reply-To: <6570d22d-ee19-f8b1-6fb4-bf8865ec4142@kalray.eu>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 9 Jan 2023 23:11:07 +0800
Message-ID: <CAEr6+ECPFeokSULpWzYEYLROYHXNA0PtvdUchT37d4_qVA-PKQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230109_071121_409197_D689215D 
X-CRM114-Status: GOOD (  25.40  )
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

T24gTW9uLCBKYW4gOSwgMjAyMyBhdCA5OjIxIFBNIFlhbm4gU2lvbm5lYXUgPHlzaW9ubmVhdUBr
YWxyYXkuZXU+IHdyb3RlOgo+Cj4gSGkgSmVmZiwKPgo+IE9uIDEvNy8yMyAwNzoyNSwgSmVmZiBY
aWUgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBXZWQsIEphbiA0LCAyMDIzIGF0IDE6MDEgQU0g
WWFubiBTaW9ubmVhdSA8eXNpb25uZWF1QGthbHJheS5ldT4gd3JvdGU6Cj4gPj4gW3NuaXBdCj4g
Pj4KPiA+PiBBIGt2eCB0b29sY2hhaW4gY2FuIGJlIGJ1aWx0IHVzaW5nOgo+ID4+ICMgaW5zdGFs
bCBkZXBlbmRlbmNpZXM6IHRleGluZm8gYmlzb24gZmxleCBsaWJnbXAtZGV2IGxpYm1wYy1kZXYg
bGlibXBmci1kZXYKPiA+PiAkIGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20va2FscmF5L2J1
aWxkLXNjcmlwdHMKPiA+PiAkIGNkIGJ1aWxkLXNjcmlwdHMKPiA+PiAkIHNvdXJjZSBsYXN0LnJl
ZnMKPiA+PiAkIC4vYnVpbGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPiBJIHdvdWxkIGxpa2UgdG8g
YnVpbGQgdGhlIGt2eC14Z2NjIHRvIGNvbXBpbGUgYW5kIHRlc3QgdGhlIGxpbnV4Cj4gPiBrZXJu
ZWwsIGJ1dCBpdCByZXBvcnRlZCBhIGNvbXBpbGUgZXJyb3IuCj4gPiBJIHdvbmRlciB3aGF0IHZl
cnNpb24gb2YgZ2NjIHlvdSBhcmUgdXNpbmcuCj4gPgo+ID4gTXkgYnVpbGQgZW52aXJvbm1lbnQ6
Cj4gPiBWRVJTSU9OPSIyMC4wNC4yIExUUyAoRm9jYWwgRm9zc2EpIgo+ID4gZ2NjIHZlcnNpb24g
OS4zLjAgKFVidW50dSA5LjMuMC0xN3VidW50dTF+MjAuMDQpCj4gPgo+ID4KPiA+IENvbXBpbGUg
ZXJyb3I6Cj4gPiAkIC4vYnVpbGQta3Z4LXhnY2Muc2ggb3V0cHV0Cj4gPgo+ID4gLi4vLi4vYmlu
dXRpbHMvbGliaWJlcnR5L2ZpYmhlYXAuYzogSW4gZnVuY3Rpb24g4oCYZmliaGVhcF9yZXBsYWNl
X2tleV9kYXRh4oCZOgo+ID4gLi4vLi4vYmludXRpbHMvbGliaWJlcnR5L2ZpYmhlYXAuYzozODoy
NDogZXJyb3I6IOKAmExPTkdfTUlO4oCZIHVuZGVjbGFyZWQKPiA+IChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKPiA+ICAgICAzOCB8ICNkZWZpbmUgRklCSEVBUEtFWV9NSU4gTE9OR19NSU4K
PiA+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPiA+IFtzbmlwXQo+
Cj4gV2hhdCBTSEExIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9rYWxyYXkvYnVpbGQtc2NyaXB0cyBh
cmUgeW91IHVzaW5nPwoKSSBoYXZlIGV4ZWN1dGVkIHRoZSAic291cmNlIGxhc3QucmVmcyIKCj4g
V2UgYXJlIGJ1aWxkaW5nIG91ciB0b29sY2hhaW4gb24gVWJ1bnR1IDE4LjA0IC8gMjAuMDQgYW5k
IDIyLjA0IHdpdGhvdXQKPiBpc3N1ZXMsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaXQgZG9lcyBu
b3Qgd29yayBmb3IgeW91LCBhbHRob3VnaCBpbmRlZWQKPiB0aGUgZXJyb3IgbG9nIHlvdSBhcmUg
aGF2aW5nIHBvcHMgb3V0IG9uIG15IHNlYXJjaCBlbmdpbmUgYW5kIHNlZW1zIHRvCj4gYmUgc29t
ZSB3ZWxsIGtub3duIGlzc3VlLgoKWWVzLCB0aGVyZSBhcmUgbWFueSBhbnN3ZXJzIG9uIHRoZSB3
ZWIsIGJ1dCBub25lIG9mIHRoZW0gc29sdmUgdGhpcyBwcm9ibGVtLgoKPiBJZiB0aGUgYnVpbGQt
c2NyaXB0IGRvZXMgbm90IHdvcmsgZm9yIHlvdSwgeW91IGNhbiBzdGlsbCB1c2UgdGhlCj4gcHJl
LWJ1aWx0IHRvb2xjaGFpbnMgZ2VuZXJhdGVkIGJ5IHRoZSBHaXRIdWIgYXV0b21hdGVkIGFjdGlv
bnM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2thbHJheS9idWlsZC1zY3JpcHRzL3JlbGVhc2VzL3Rh
Zy92NC4xMS4xICgibGF0ZXN0Igo+IG1lYW5zIDIyLjA0KQoKVGhhbmtzLCB0aGlzIGlzIHRoZSBm
aW5hbCBzb2x1dGlvbiA7LSkKCj4KPiBJIGhvcGUgaXQgd2lsbCB3b3JrIGZvciB5b3UuCj4KPiBS
ZWdhcmRzLAo+Cj4gLS0KPgo+IFlhbm4KPgo+Cj4KPgo+CgoKLS0gClRoYW5rcywKSmVmZlhpZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
