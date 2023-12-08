Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C32C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmqIY87Zgrt2gbE9uYtGCciDXTKyP1A5cMgTtd1rgxo=; b=3ayo1dCQlFlUQY
	XNI93Xg/iVwn3CBnggG0hFl5K4wIEfBoTN+F6eylKceLwV77lZjg+oC6qznjy6gBYBZeCUwiqYqDF
	qJ8UXgBErneo1d4H5QPWuTU7YbNoOtasypjlBw1l7DylWfVHJQ497GHn8322ov5idmEJ0PdckygBa
	QuJQmoMaQJUygoMD5e0eOzTpGTcJUcDZBckVM8Ud/hqcqqjdUqNZNuCnT75lBks0rohB/VGXANAmc
	BCMsysOaNHHhUR/4dTM9oloxGK97uBeWntM/9r2UbgOpEAsnuH0EDiHtC1eZdUpUXOBhLceYfuf/d
	Ea1yvJV9q4c374vsCebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhey-00GWK8-2K;
	Fri, 08 Dec 2023 20:41:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhev-00GWIm-0z
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 20:41:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33350fcb2c7so1816344f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 12:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702068075; x=1702672875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj7pq+OIwUID+JMsGrWjS7UT9Bcii1A8UE8TU13OktE=;
        b=XTz2DZAFp9QN9V0pYVrAT/V6MMg2iplLLU+T1cVr8L0WDLBcd5NMxrdlz9CP0Bmet4
         iAYxnksh6F98eUka7EiI9BipT9MYmWkJ0EgDMLAVEuj2SxDsLuvPhvERr7/k2Z7OYSKH
         PYsae7+zKxbu+UfX5sGO5yqMxhaCZh2NQC4ysz+dOYRFlduiiiWg5duYuNUPYQC+LvMq
         ACzz65Gx2LnSVCa/ZxZ2RezBhQEvaPma1CA2bR60lrh4okjecjwyRufY1Cs3bBkEXTxg
         RIUVmXVJjE/HXnBXb9RJJnDGYWlVzofOCcswc1xhiaFogl/6FqDmwFMjongvwcne4O0p
         RbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702068075; x=1702672875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj7pq+OIwUID+JMsGrWjS7UT9Bcii1A8UE8TU13OktE=;
        b=pZFX/nmxV47swsmuDQ4uHRJs89VffVcjeEbtN8+ff7L7Smy5ri2Kv03RPjhKqRSb4I
         mUgSo/FhZmIkQqC71CvACZN+0xNSmsPT0z154gFnoLnMfkUkXW+V0o1JVX5Yady6iWpW
         oHVGqvxuAQufl7HvcbTypxQ27GERSnEZaQSO93dUxlfP+gDXKGza2QHmFdPBcWpFoUiM
         toCj5XZ+IpP+Tllh9fpSPagGzoYm3OXq3/srQrgjvsi+UrIHgWaJBgw6Yl5InF6Zz+dz
         WvR2gTXJoaZb+TUoAozgMpR27xu5gBe9aNUupamqjktmwRKgumefWL1NW30KlNdYLVUj
         eHlw==
X-Gm-Message-State: AOJu0YzPifIHbfj9Ffz9BcDT9zT1N4P9lTvyEOiRkYXjp2SCnMcF5DDM
	Lo0gYPF3LqJbs3vaK6O0YGxx3gMeqBSLgWQkhks=
X-Google-Smtp-Source: AGHT+IERcqiD0C/8xjZJmHAgSBT2DdIylL4yKHY4jgZtfjgalQtcY6Jcz2MAn3dQVMGiGBWeMdU28s7aF98ziv0/pdE=
X-Received: by 2002:adf:f00f:0:b0:333:2f14:7642 with SMTP id
 j15-20020adff00f000000b003332f147642mr344840wro.61.1702068075072; Fri, 08 Dec
 2023 12:41:15 -0800 (PST)
MIME-Version: 1.0
References: <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net> <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net> <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net> <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net> <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
 <20231208203535.GG36716@noisy.programming.kicks-ass.net>
In-Reply-To: <20231208203535.GG36716@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Dec 2023 12:41:03 -0800
Message-ID: <CAADnVQJzCw=qcG+jHBYG0q0SxLPkwghni0wpgV4A4PkpgVbGPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_124117_349707_1488F212 
X-CRM114-Status: GOOD (  17.63  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAxMjozNeKAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAwOCwgMjAyMyBhdCAxMTo0MDoy
N0FNIC0wODAwLCBBbGV4ZWkgU3Rhcm92b2l0b3Ygd3JvdGU6Cj4KPiA+IHR5cGVkZWYgdm9pZCAo
KmJ0Zl9kdG9yX2tmdW5jX3QpKHZvaWQgKik7Cj4gPiAgICAgICAgIGJ0Zl9kdG9yX2tmdW5jX3Qg
ZHRvcjsKPiA+IGJ1dCB0aGUgYnBmX2Nncm91cF9yZWxlYXNlIHRha2VzICdzdHJ1Y3QgY2dyb3Vw
KicuCj4gPiBGcm9tIGtjZmkgcG92IHZvaWQgKiA9PSBzdHJ1Y3QgY2dyb3VwICogPwo+ID4gRG8g
d2UgbmVlZCB0byBjaGFuZ2UgaXQgdG8gJ3ZvaWQgKmNncnAnID8KPgo+IFllcywgZG9pbmcgdGhh
dCBuYWl2ZWx5IGxpa2UgdGhlIGJlbG93LCBnZXRzIG1lIGxvdmVseSB0aGluZ3MgbGlrZToKPgo+
IHZhbGlkYXRlX2Nhc2U6RkFJTDpleHBlY3RfbXNnIHVuZXhwZWN0ZWQgZXJyb3I6IC0yMgo+IFZF
UklGSUVSIExPRzoKPiA9PT09PT09PT09PT09Cj4gPT09PT09PT09PT09PQo+IEVYUEVDVEVEIE1T
RzogJ1Bvc3NpYmx5IE5VTEwgcG9pbnRlciBwYXNzZWQgdG8gdHJ1c3RlZCBhcmcwJwo+ICM0OC83
ICAgIGNncnBfa2Z1bmMvY2dycF9rZnVuY19hY3F1aXJlX3VudHJ1c3RlZDpGQUlMCj4gcnVuX3N1
YnRlc3Q6UEFTUzpvYmpfb3Blbl9tZW0gMCBuc2VjCj4gbGliYnBmOiBleHRlcm4gKGZ1bmMga3N5
bSkgJ2JwZl9jZ3JvdXBfcmVsZWFzZSc6IGZ1bmNfcHJvdG8gWzE0OF0gaW5jb21wYXRpYmxlIHdp
dGggdm1saW51eCBbMTI1NjEwXQo+IGxpYmJwZjogZmFpbGVkIHRvIGxvYWQgb2JqZWN0ICdjZ3Jw
X2tmdW5jX2ZhaWx1cmUnCj4KPgo+IEJ1dCBsZXQgbWUgdHJ5IHJlYnVpbGRpbmcgZXZlcnl0aGlu
Zy4uCj4KPgo+IC0tLQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL2hlbHBlcnMuYyBiL2tlcm5l
bC9icGYvaGVscGVycy5jCj4gaW5kZXggYjNiZTU3NDJkNmYxLi4wNzhiMjA3YWY3ZjAgMTAwNjQ0
Cj4gLS0tIGEva2VybmVsL2JwZi9oZWxwZXJzLmMKPiArKysgYi9rZXJuZWwvYnBmL2hlbHBlcnMu
Ywo+IEBAIC0yMTQ1LDEwICsyMTQ1LDExIEBAIF9fYnBmX2tmdW5jIHN0cnVjdCB0YXNrX3N0cnVj
dCAqYnBmX3Rhc2tfYWNxdWlyZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnApCj4gICAqIGJwZl90YXNr
X3JlbGVhc2UgLSBSZWxlYXNlIHRoZSByZWZlcmVuY2UgYWNxdWlyZWQgb24gYSB0YXNrLgo+ICAg
KiBAcDogVGhlIHRhc2sgb24gd2hpY2ggYSByZWZlcmVuY2UgaXMgYmVpbmcgcmVsZWFzZWQuCj4g
ICAqLwo+IC1fX2JwZl9rZnVuYyB2b2lkIGJwZl90YXNrX3JlbGVhc2Uoc3RydWN0IHRhc2tfc3Ry
dWN0ICpwKQo+ICtfX2JwZl9rZnVuYyB2b2lkIGJwZl90YXNrX3JlbGVhc2Uodm9pZCAqcCkKClll
YWguIFRoYXQgd29uJ3Qgd29yay4gV2UgbmVlZCBhIHdyYXBwZXIuClNpbmNlIGJwZiBwcm9nIGlz
IGFsc28gY2FsbGluZyBpdCBkaXJlY3RseS4KSW4gcHJvZ3MvdGFza19rZnVuY19jb21tb24uaAp2
b2lkIGJwZl90YXNrX3JlbGVhc2Uoc3RydWN0IHRhc2tfc3RydWN0ICpwKSBfX2tzeW07Cgp0aGFu
IGxhdGVyIGJvdGggbGliYnBmIGFuZCB0aGUgdmVyaWZpZXIgY2hlY2sgdGhhdAp3aGF0IGJwZiBw
cm9nIGlzIGNhbGxpbmcgYWN0dWFsbHkgbWF0Y2hlcyB0aGUgcHJvdG8Kb2Ygd2hhdCBpcyBpbiB0
aGUga2VybmVsLgpFZmZlY3RpdmVseSB3ZSdyZSBkb2luZyBzdHJvbmcgcHJvdG90eXBlIGNoZWNr
IGF0IGxvYWQgdGltZS4KCmJ0dyBpbnN0ZWFkIG9mIEVYUE9SVF9TWU1CT0xfR1BMKGJwZl90YXNr
X3JlbGVhc2UpCmNhbiBfX0FERFJFU1NBQkxFIGJlIHVzZWQgPwpTaW5jZSBpdCdzIG5vdCBhbiBl
eHBvcnQgc3ltYm9sLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
