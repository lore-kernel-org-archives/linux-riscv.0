Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835CBC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 00:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9n9hUAalsIK4PoA4/WgoBiMrIXxWIblOdc1bUI1zmmA=; b=MSb+CrjV5f2mdP
	ERtAwDHhdhx+s0Lr+2gupXkwE1ktwGySLyeta0CiAAi6mi9NZpi6qfzQkrcsqzjgLrppJojLhlIrt
	eVawtiVW8et7PbXrOqo2lb251FU7C4VIb+WH6N6WMIz0AedpZGQzt6OBUhrBt9BElZgh2YsA42Hzo
	TnLfJuBGg/fIPkjmfSdb5giPe0sRJzZzOrcBJQUO9isA++mPwegqYUKF0XKn9lad9d716MPFK4Ew0
	F0a7OiLsECK3E8nI56nt0I0rK3wpHXn3PgBH/BRDyNS52jUiOD0bFvYYq0XX8+4J/Oppg2LBvksCF
	J1Yy/mLlqFglVDnmFyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xoX-003R9F-03;
	Thu, 23 Nov 2023 00:43:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xoU-003R7j-0B
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 00:43:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3316c6e299eso209475f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 16:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700700197; x=1701304997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4mDM3fOhLxMKv9Qsj/stPbdPgmQsMFznGIuQOD753M=;
        b=FHELgf+GjjWXrhLqFqyXxTjo4KnjW9a5Buhvq0pAptnG9u3yVeXbkMwMAfK+D8du2y
         hDBB9XWPXV0M5MJa2Rmf2RDjSzCOuRvVb8OHHJOZsg9SomEZVff8VeBwpZd0QSQX5RpJ
         y+HS2NZGFXE1hd1wP/iUYbNaZFs7NELAD/mNeiYePbY0E7Kf6iKokZb6mwtQoJCQeRF5
         FB4FBfymR4WueeHErPCkaYZWc2GjnxNawvkpRYEEZHjeGxAWZcpjq3e+am7LPA9g76dE
         F9BIKgGA9IIgQzzY10/XYTY+CJcz99WMgre9Ew6mmTbNXiRnOJiNo2F5NnGZJ9FblePG
         e6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700700197; x=1701304997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4mDM3fOhLxMKv9Qsj/stPbdPgmQsMFznGIuQOD753M=;
        b=J1MtdaAOWurEzOR9PdTKjzgCaP295outmx73OqjjpoOCDai6lMhG4Y9TrhxhNZoqr5
         fos+KQMNIUPYnpgA6NyPb2mG8oB3DA2JQn15spzCfQexf7ihoqhPQNaANWxyWW9U/Vxd
         KEAjny3slCxMURJRs+OFn+cTuTw5AOVNpxsgHQdNJXD2Kgs3NytutSidgPhKAbT9+gbA
         sgYL/usJiZW60LOvYkqESJgO0lwUasPRlsfj7vZeN+gDe+ctfcOafhdHU7eHj7MO7jHW
         1+MYSsfI07a3u2pY4x/L53gCdfW19xs6KjZ4kJ9hNKv0f9sqX/45Xly9lb/u4JFkwrKq
         Cu5A==
X-Gm-Message-State: AOJu0Yw3BKl9qRhRgiKcYX4ywl/yHAlP7rsNjap250xH/h/hMpx80E60
	FsApfOpqnhoHSKQEW+lgOUjyfCKolCuLpmiZ6Ik=
X-Google-Smtp-Source: AGHT+IFaGuLwN1xpFTtgde8hjR8udeumSPNXj31L06f21NbuevuO4pwK/eQWIUQlq/PJPmsAyg32Y1iA4ZTIjeNqURg=
X-Received: by 2002:a05:6000:128d:b0:332:cc15:6bae with SMTP id
 f13-20020a056000128d00b00332cc156baemr2454118wrx.20.1700700196781; Wed, 22
 Nov 2023 16:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com> <20231122111517.GR8262@noisy.programming.kicks-ass.net>
In-Reply-To: <20231122111517.GR8262@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Nov 2023 16:43:05 -0800
Message-ID: <CAADnVQLhWFKcxno53zqGtuiWwUcw+TU8gB2eCBRPQC=2y5vrFw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_164326_095145_40300117 
X-CRM114-Status: GOOD (  24.65  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMzoxNeKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPgo+IFRvIGJlIHZlcnkgZXhwbGljaXQsIGxldCBtZSBs
aXN0IGFsbCB0aGUgdmFyaW91cyBmb3JtcyBvZiBmdW5jdGlvbgo+IGNhbGxzOgo+Cj4gVHJhZGl0
aW9uYWw6Cj4KPiBmb286Cj4gICAuLi4gY29kZSBoZXJlIC4uLgo+ICAgcmV0Cj4KPiBkaXJlY3Qg
Y2FsbGVyOgo+Cj4gICBjYWxsIGZvbwo+Cj4gaW5kaXJlY3QgY2FsbGVyOgo+Cj4gICBsZWEgZm9v
KCVyaXApLCAlcjExCj4gICBjYWxsIColcjExCj4KPiBJQlQ6Cj4KPiBmb286Cj4gICBlbmRicjY0
Cj4gICAuLi4gY29kZSBoZXJlIC4uLgo+ICAgcmV0Cj4KPiBkaXJlY3QgY2FsbGVyOgo+Cj4gICBj
YWxsIGZvbyAvIGNhbGwgZm9vKzQKPgo+IGluZGlyZWN0IGNhbGxlcjoKPgo+ICAgbGVhIGZvbygl
cmlwKSwgJXIxMQo+ICAgLi4uCj4gICBjYWxsIColcjExCj4KPgo+IGtDRkk6Cj4KPiBfX2NmaV9m
b286Cj4gICBtb3ZsICQweDEyMzQ1Njc4LCAlcmF4Cj4gICAoMTEgbm9wcyB3aGVuIENBTExfUEFE
RElORykKPiBmb286Cj4gICBlbmRicjY0ICh3aGVuIGFsc28gSUJUKQo+ICAgLi4uIGNvZGUgaGVy
ZSAuLi4KPiAgIHJldAo+Cj4gZGlyZWN0IGNhbGxlcjoKPgo+ICAgY2FsbCBmb28gLyBjYWxsIGZv
bys0Cj4KPiBpbmRpcmVjdCBjYWxsZXI6Cj4KPiAgIGxlYSBmb28oJXJpcCksICVyMTEKPiAgIC4u
Lgo+ICAgbW92bCAkKC0weDEyMzQ1Njc4KSwgJXIxMGQKPiAgIGFkZGwgLTE1KCVyMTEpLCAlcjEw
ZCAob3IgLTQgd2l0aG91dCBDQUxMX1BBRERJTkcpCj4gICBqZSAxZgo+ICAgdWQyCj4gMTpjYWxs
IColcjExCj4KPgo+IEZpbmVJQlQgKGJ1aWxkcyBhcyBrQ0ZJICsgQ0FMTF9QQURESU5HICsgSUJU
ICsgUkVUUE9MSU5FIGFuZCBydW50aW1lCj4gcGF0Y2hlcyB0aGluZ3MgdG8gbG9vayBsaWtlKToK
Pgo+IF9fY2ZpX2ZvbzoKPiAgIGVuZGJyNjQKPiAgIHN1YmwgJDB4MTIzNDU2NzgsICVyMTBkCj4g
ICBqeiBmb28KPiAgIHVkMgo+ICAgbm9wCj4gZm9vOgo+ICAgb3NwIG5vcDMgKHdhcyBlbmRicjY0
KQo+ICAgLi4uIGNvZGUgaGVyZSAuLi4KPiAgIHJldAo+Cj4gZGlyZWN0IGNhbGxlcjoKPgo+ICAg
Y2FsbCBmb28gLyBjYWxsIGZvbys0Cj4KPiBpbmRpcmVjdCBjYWxsZXI6Cj4KPiAgIGxlYSBmb28o
JXJpcCksICVyMTEKPiAgIC4uLgo+ICAgbW92bCAkMHgxMjM0NTY3OCwgJXIxMGQKPiAgIHN1Ymwg
JDE2LCAlcjExCj4gICBub3A0Cj4gICBjYWxsIColcjExCgpHb3QgaXQuIFRoYXQgaGVscHMgYSBs
b3QhCllvdSBraW5kIG9mIGhhdmUgdGhpcyBjb21tZW50IHNjYXR0ZXJlZCB0aHJvdWdoIGFyY2gv
eDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCmJ1dCBoYXZpbmcgaXQgaW4gb25lIHBsYWNlIGxpa2Ug
YWJvdmUgd291bGQgZ28gYSBsb25nIHdheS4KQ291bGQgeW91IHBsZWFzZSBhZGQgaXQgdG8gYXJj
aC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCm9yIGFyY2gveDg2L2luY2x1ZGUvYXNtL2NmaS5oIG5l
eHQgdG8gZW51bSBjZmlfbW9kZSA/Cgo+ID4gSSdtIG5vdCBzdXJlIGRvaW5nIGNmaV9icGZfaGFz
aCBjaGVjayBpbiBKSVRlZCBjb2RlIGlzIGNvbXBsZXRlbHkgc29sdmluZyB0aGUgcHJvYmxlbS4K
PiA+IEZyb20gYnBmX2Rpc3BhdGNoZXJfKl9mdW5jKCkgY2FsbGluZyBpbnRvIEpJVGVkIHdpbGwg
d29yaywKPiA+IGJ1dCB0aGlzIGVtaXRfcHJvbG9ndWUoKSBpcyBkb2luZyB0aGUgc2FtZSBqb2Ig
Zm9yIGFsbCBicGYgcHJvZ3MuCj4gPiBTb21lIGJwZiBwcm9ncyBjYWxsIGVhY2ggb3RoZXIgZGly
ZWN0bHkgYW5kIGluZGlyZWN0bHkuCj4gPiBicGZfZGlzcGF0Y2hlcl8qX2Z1bmMoKSAtPiBKSVRl
ZF9CUEZfQSAtPiBKSVRlZF9CUEZfQi4KPiA+IEEgaW50byBCIGNhbiBiZSBhIGRpcmVjdCBjYWxs
ICh3aGljaCBjZmkgZG9lc24ndCBjYXJlIGFib3V0KSBhbmQKPiA+IGluZGlyZWN0IHZpYSBlbWl0
X2JwZl90YWlsX2NhbGxfaW5kaXJlY3QoKS0+ZW1pdF9pbmRpcmVjdF9qdW1wKCkuCj4gPiBTaG91
bGQgd2UgY2FyZSBhYm91dCBmaW5laWJ0L2tjZmkgdGhlcmUgdG9vPwo+Cj4gVGhlIHdheSBJIHVu
ZGVyc3Rvb2QgdGhlIHRhaWwtY2FsbCB0aGluZyB0byB3b3JrIGlzIHRoYXQgaXQganVtcHMgdG8K
PiBicGZfcHJvZyArIFg4Nl9UQUlMX0NBTExfT0ZGU0VULCB3ZSBhbHJlYWR5IGVtaXQgYW4gZXh0
cmEgRU5EQlIgdGhlcmUgdG8KPiBtYWtlIHRoaXMgd29yay4KPgo+IFNvIHRoZSBBIC0+IEIgaW5k
aXJlY3QgY2FsbCBpcyBvdGhlcndpc2UgdW5hZG9ybmVuIGFuZCBvbmx5IG5lZWRzIEVOREJSLgo+
Cj4gSWRlYWxseSB0aGF0IHdvdWxkIHVzZSBrQ0ZJL0ZpbmVJQlQgYnV0IHNpbmNlIGl0IGFsc28g
c2tpcHMgc29tZSBvZiB0aGUKPiBzZXR1cCwgdGhpcyBnZXRzIHRvIGJlIG5vbi10cml2aWFsLCBz
byBJJ3ZlIGxldCB0aGlzIGJlIGFzIGlzLgoKSSBzZWUuIHllYWguIFRoZSBzZXR1cCBpcyBub3Qg
dHJpdmlhbCBpbmRlZWQuIEtlZXAgYXMtaXMgaXMgZmluZS4KCj4gU28gdGhlIGtDRkkgdGhpbmcg
aXMgJ25ldycgYnV0IHJlYWRpbHkgaW5zcGVjdGVkIGJ5IG9iamR1bXAgb3IgZ29kYm9sdDoKPgo+
ICAgaHR0cHM6Ly9nb2Rib2x0Lm9yZy96L3NHZTE4ejNjYQo+Cj4gKEBTYW1pLCB0aGF0IC5MdG1w
MTUgdGhpbmcsIEkgZG9uJ3Qgc2VlIHRoYXQgaW4gdGhlIGtlcm5lbCwgd2hhdAo+IGNvbXBpbGVy
IGZsYWcgbWFrZXMgdGhhdCBnbyBhd2F5PykKCkkgYWxzbyBub3RpY2VkIHRoaXMgZGlzY3JlcGFu
Y3kuIEl0IGRvZXNuJ3Qgc2VlbSB0byBiZSB1c2VkLgpMb29rcyB3ZWlyZCB0byBzcGVuZCA4IGJ5
dGVzIHRvIHN0b3JlIC1zaXplb2YodWQyKQoKPiBBcyB0byBGaW5lSUJULCB0aGF0IGhhcyBhIGJp
ZyBjb21tZW50IGluIGFyY2gveDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCj4gd2hlcmUgSSByZXdy
aXRlIHRoZSBrQ0ZJIHRoaW5nIGludG8gRmluZUlCVC4gSSBjYW4gcmVmZXIgdGhlcmUgdG8gYXZv
aWQKPiBkdXBsaWNhdGluZyBjb21tZW50cywgd291bGQgdGhhdCB3b3JrPwoKSnVzdCB0aGUgYWJv
dmUgY29tbWVudCBzb21ld2hlcmUgd291bGQgd29yay4KSSB3b3VsZG4ndCB3b3JyeSBhYm91dCBk
dXBsaWNhdGlvbi4gVGhpcyBpcyB0cmlja3kgc3R1ZmYuCldoZW4gZ2NjIGZvbGtzIGdldCBhcm91
bmQgaW1wbGVtZW50aW5nIGtjZmkgdGhleSB3aWxsIGZpbmQgaXQgdXNlZnVsIHRvby4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
