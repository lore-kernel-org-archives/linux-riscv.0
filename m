Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A278CC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 12:42:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDA5207BB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 12:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yaKl1pb7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="02Vv0U2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDA5207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KfHtXPNDKSpsgJmEE3arWeIqxwuac769UsYLgnleGMQ=; b=yaKl1pb7Nz+XJv3BmYIXTzjLM
	XH9XmwAa7BdXO8iPvWYjFGviz29NDFImooKxjLXOXA/keG5pcQbzd5SNJO5STmNxFg8LW7yM2CEiv
	tdNO6nZNY2UiqNlkYOdeikLOFewEJ4915cPUFL9TeLw8ClBjrrF1oboHTQFnhmHxyIJtHAYnRE8d3
	TxJP30r3AMBeodiinhYVki81gr6XTuh6NKwPrhvF1u3D9DLaySGk9IauRugcTBCO/RkDy/0iJKtvj
	xF+HbF2tU788foNi32ANi9bCmHWDrVSzksEZ2U6SRzvbw+ci0lJSHnLoDbaiqsmhdXdez+fQbq3HG
	/r2no/lSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyaYO-0006uC-M5; Thu, 23 Jul 2020 12:42:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyaYJ-0006qW-2b; Thu, 23 Jul 2020 12:42:24 +0000
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 871F722CB3;
 Thu, 23 Jul 2020 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595508141;
 bh=TSMF9Uc+5daioIvdeF9DAcbq0vLaPsBcHFGOkoFFr+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=02Vv0U2Z2CCPFADwEeEcWBIpD7oTHgU7XgKZ+1FwPjghxmWkPnFXN/u4sf2Va5Q6a
 ibEU+v5ji0sjbxBZfAsB+DDxBWImAgC5SQHjUWJhXntACFHImDmLuHNuYXMAQBAGly
 oiOJJ8kGe8NXaes8LDXZiVRn7CWSdyBlK8tqiXWI=
Received: by mail-oo1-f50.google.com with SMTP id s190so1070700ooa.13;
 Thu, 23 Jul 2020 05:42:21 -0700 (PDT)
X-Gm-Message-State: AOAM532ROWxDlFLeGMrStsqCed4f5Uo27sLGt12zUjgugdMInlmokB/L
 LB+duWATNdhkbNok5IlJsNP8pVwFLbqiZFpbTgQ=
X-Google-Smtp-Source: ABdhPJzxPjXzUf2k7YfseaUoCAeLBxiHqfEThV6II5h8ZcTuX1Bw+3ZPhgTLyTbvLwBjiaVbhfmN5Xqev9w0jDnY1OA=
X-Received: by 2002:a4a:b006:: with SMTP id f6mr4328373oon.13.1595508140700;
 Thu, 23 Jul 2020 05:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
 <20200723015127.GE45081@linux.intel.com>
In-Reply-To: <20200723015127.GE45081@linux.intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Jul 2020 15:42:09 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
Message-ID: <CAMj1kXGJhqC+asc6JUNeEkRsHYTzNQVe4-65vKqigbW03gO9Jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_084223_386347_276B73E5 
X-CRM114-Status: GOOD (  22.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Petr Mladek <pmladek@suse.com>,
 Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Philipp Rudo <prudo@linux.ibm.com>, Torsten Duwe <duwe@lst.de>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Vincent Chen <deanbo422@gmail.com>, Omar Sandoval <osandov@fb.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Thomas Huth <thuth@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMyBKdWwgMjAyMCBhdCAwNDo1MiwgSmFya2tvIFNha2tpbmVuCjxqYXJra28uc2Fr
a2luZW5AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0
IDA2OjQ5OjA5UE0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4gPiBKYXJra28gU2Fr
a2luZW4gPGphcmtrby5zYWtraW5lbkBsaW51eC5pbnRlbC5jb20+IGEgw6ljcml0IDoKPiA+Cj4g
PiA+IFJlbmFtZSBtb2R1bGVfYWxsb2MoKSB0byB0ZXh0X2FsbG9jKCkgYW5kIG1vZHVsZV9tZW1m
cmVlKCkgdG8KPiA+ID4gdGV4dF9tZW1mcmVlKCksIGFuZCBtb3ZlIHRoZW0gdG8ga2VybmVsL3Rl
eHQuYywgd2hpY2ggaXMgdW5jb25kaXRpb25hbGx5Cj4gPiA+IGNvbXBpbGVkIHRvIHRoZSBrZXJu
ZWwgcHJvcGVyLiBUaGlzIGFsbG93cyBrcHJvYmVzLCBmdHJhY2UgYW5kIGJwZiB0bwo+ID4gPiBh
bGxvY2F0ZSBzcGFjZSBmb3IgZXhlY3V0YWJsZSBjb2RlIHdpdGhvdXQgcmVxdWlyaW5nIHRvIGNv
bXBpbGUgdGhlIG1vZHVsZXMKPiA+ID4gc3VwcG9ydCAoQ09ORklHX01PRFVMRVM9eSkgaW4uCj4g
Pgo+ID4gWW91IGFyZSBub3QgY2hhbmdpbmcgZW5vdWdoIGluIHBvd2VycGMgdG8gaGF2ZSB0aGlz
IHdvcmsuCj4gPiBPbiBwb3dlcnBjIDMyIGJpdHMgKDZ4eCksIHdoZW4gU1RSSUNUX0tFUk5FTF9S
V1ggaXMgc2VsZWN0ZWQsIHRoZSB2bWFsbG9jCj4gPiBzcGFjZSBpcyBzZXQgdG8gTlggKG5vIGV4
ZWMpIGF0IHNlZ21lbnQgbGV2ZWwgKGllIGJ5IDI1Nk1ieXRlcyB6b25lKSB1bmxlc3MKPiA+IENP
TkZJR19NT0RVTEVTIGlzIHNlbGVjdGVkLgo+ID4KPiA+IENocmlzdG9waGUKPgo+IFRoaXMgaGFz
IGJlZW4gZGVkdWNlZCBkb3duIHRvOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDIwMDcxNzAzMDQyMi42Nzk5NzItMS1qYXJra28uc2Fra2luZW5AbGludXguaW50ZWwuY29tLwo+
Cj4gSS5lLiBub3QgaW50cnVkaW5nIFBQQyBhbnltb3JlIDotKQo+CgpPaywgc28gYWZ0ZXIgdGhl
IGVsYWJvcmF0ZSBkaXNjdXNzaW9uIHdlIGhhZCBiZXR3ZWVuIEplc3NpY2EsIFJ1c3NlbGwsClBl
dGVyLCBXaWxsLCBNYXJrLCB5b3UgYW5kIG15c2VsZiwgd2hlcmUgd2UgcG9pbnRlZCBvdXQgdGhh
dAphKSBhIHNpbmdsZSB0ZXh0X2FsbG9jKCkgYWJzdHJhY3Rpb24gZm9yIGJwZiwga3Byb2JlcyBh
bmQgZnRyYWNlIGRvZXMKbm90IGZpdCBvdGhlciBhcmNoaXRlY3R1cmVzIHZlcnkgd2VsbCwgYW5k
CmIpIHRoYXQgbW9kdWxlX2FsbG9jKCkgaXMgbm90IHN1aXRhYmxlIGFzIGEgZGVmYXVsdCB0byBi
YXNlIHRleHRfYWxsb2MoKSBvbiwKCnlvdSB3ZW50IGFoZWFkIGFuZCBpbXBsZW1lbnRlZCB0aGF0
IGFueXdheSwgYnV0IG9ubHkgY2MnaW5nIFBldGVyLApha3BtLCBNYXNhbWkgYW5kIHRoZSBtbSBs
aXN0IHRoaXMgdGltZT8KClNvcnJ5LCBidXQgdGhhdCBpcyBub3QgaG93IGl0IHdvcmtzLiBPbmNl
IHBlb3BsZSBnZXQgcHVsbGVkIGludG8gYQpkaXNjdXNzaW9uLCB5b3UgY2Fubm90IGRpc21pc3Mg
dGhlbSBvciB0aGVpciBmZWVkYmFjayBsaWtlIHRoYXQgYW5kIGdvCm9mZiBhbmQgZG8geW91ciBv
d24gdGhpbmcgYW55d2F5LiBHZW5lcmljIGZlYXR1cmVzIGxpa2UgdGhpcyBhcmUKdHJpY2t5IHRv
IGdldCByaWdodCwgYW5kIGl0IHdpbGwgbGlrZWx5IHRha2UgbWFueSBpdGVyYXRpb25zIGFuZCBp
bnB1dApmcm9tIG1hbnkgZGlmZmVyZW50IHBlb3BsZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
