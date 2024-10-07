Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF74CFB446
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUTuASZEzBv3Yp22SeKOXb5XPtmgdA13wVuToOIxweI=; b=ygH0y3oQ8O7NmW
	5Z0R8s5egxnzGZ4wcQuFNsoEKq83bzkwpNCmcB+Net6KndkHnnwY6E1y/Nl180CfZ+Fo8DrlWRi39
	oDcHjl/n1yiHrp/SvW93PthGiwzBlDAIp1ZlRtgkLewyCkLEfnbjoNjqqwCzuZoarPLON5VALaDlK
	WS5P0MrvUu76xSWWR0d4OmPQQwjTgpTM5ZwmO/WPkM9BMNFLBwZ7IsvNWV+At+pCus7ohNA2YLp/J
	UbW1N5L6BlaNIQ/Wfp5pzkmLg/79P2ZwQMRWAtPMBZ1xQ7V3vHzNVeb9IvED9DA3IDSC+9aQH/6Ay
	bVJ7PApGoQU4gjWTQiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpx7-000000031Bk-1c2U;
	Mon, 07 Oct 2024 15:47:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpx3-0000000319E-2dZF
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 15:47:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20b4a090f3eso263985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728316033; x=1728920833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrYqnjJpJB2lRJdraSxJi37iXg6kEfvU/vqtEVr4XQ0=;
        b=Y6wD6jaWqmWGp+6Qwk7lOGxcZjGxHVVMYCOGuJtzH26jXuuC9Jo2hlYiYgKM5Qen1V
         9s0gXTEqbigepxdUvAx5pXqF4TPyOT4AbGOpPFav55LpCr6JKfw3cli9a3rT7r25x/mL
         6F3mPaRs2WzeDd92gpuNFjtG9q1sqAtrF5PjV5FvcwvUkKlyYIBJ3WCzqK9KTHXeL7+y
         efrr8v3V+lpkYRVJe66Eek5GMYNRmAidHP7u/CZmkPYsIURdEx8Xeo5QoZNdu9GMQOQZ
         vmldcmCLk3TexRK/24kEHHUZ+SGg7hG6a6b0/RalvOX7XwSo4qmrZns1Cuu7b7KjqA62
         V1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728316033; x=1728920833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrYqnjJpJB2lRJdraSxJi37iXg6kEfvU/vqtEVr4XQ0=;
        b=da3l41OHDy8U3wq6qebBm4zDvDq39kjMf57kTaYjf3648/Gwuvacg5BdfGHAp4LK9h
         dWDL3eA/hKFqrEnUIwudSN5y2yEKbazJB6iDrH4+1TnwFx4UUf8kfa6e+XlQe4dZkQhI
         4Vsa3UXVYLVMACU3K95RH0oUfG98HHSVYEydsJVjyAnDIn+29J7MTjBaPF1DIbXVKLRj
         f7EkeYs0EpPBEEzNlCaal5FlMgW1UmpXNQTV9Jvw6N1iOm5SiYptIw9+rQqFWJR+Vb4r
         HXPIkBv+uW79+LwTxqe+s72jlixoUWaxt20rjcp5X3sP87IIrLkpq6jaPWGBhKwaNUmX
         QXAw==
X-Forwarded-Encrypted: i=1; AJvYcCXmPFLrd5ureAoexVMjOKieYwX0n27uuuLxxeLTu7HQAub40l/i3vP8cKtxzkEjCzU4T+d9OEll3rZGFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzV+CCBxw9sF66kze0pw4bh0qhGJSSIxvm2XTCtkQJUNawEvw2
	xATZIGsClax6E1AagMTQDWyMvPk+O6stM5hNSMOoQ9wpab5jviV0dJfyabRZP2vHauufflssMmG
	A3IdJZKRhnms01jdzCxhQtsYtOgdUDyWHFHZl
X-Google-Smtp-Source: AGHT+IGwu4PJ1LIQLyt4RHgM7VecbrJWT3jfoSUY3o0Fb4S+9czwyhW4r49SVjqTMABhYHxG7QyAo4EIkLYc5TDV9ys=
X-Received: by 2002:a17:902:daca:b0:1fb:172a:f3d4 with SMTP id
 d9443c01a7336-20c15ab20b3mr3586035ad.8.1728316031023; Mon, 07 Oct 2024
 08:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com> <20241005195541.380070-17-irogers@google.com>
 <20241007170755.03697b9178ed3dcac24dfa21@kernel.org>
In-Reply-To: <20241007170755.03697b9178ed3dcac24dfa21@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 7 Oct 2024 08:46:59 -0700
Message-ID: <CAP-5=fU4hTL1hfB7-FpMnFopJJriZAOXY_8iakW5yHC_gfhTWg@mail.gmail.com>
Subject: Re: [PATCH v2 16/31] perf dwarf-regs: Pass accurate disassembly
 machine to get_dwarf_regnum
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Guilherme Amadio <amadio@gentoo.org>, 
	Changbin Du <changbin.du@huawei.com>, Daniel Bristot de Oliveira <bristot@kernel.org>, 
	Daniel Wagner <dwagner@suse.de>, Aditya Gupta <adityag@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Oliver Upton <oliver.upton@linux.dev>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Chen Pei <cp0613@linux.alibaba.com>, 
	Dima Kogan <dima@secretsauce.net>, Yury Norov <yury.norov@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_084713_698222_9C8FBC0E 
X-CRM114-Status: GOOD (  32.22  )
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

T24gTW9uLCBPY3QgNywgMjAyNCBhdCAxOjA44oCvQU0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFt
YXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsICA1IE9jdCAyMDI0IDEyOjU1OjI2IC0w
NzAwCj4gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+ID4gUmF0aGVy
IHRoYW4gcGFzcyAwL0VNX05PTkUsIHVzZSB0aGUgdmFsdWUgY29tcHV0ZWQgaW4gdGhlIGRpc2Fz
bQo+ID4gc3RydWN0IGFyY2guIFN3aXRjaCB0aGUgRU1fTk9ORSBjYXNlIHRvIEVNX0hPU1QsIHJl
d3JpdGluZyBFTV9OT05FIGlmCj4gPiBpdCB3ZXJlIHBhc3NlZCB0byBnZXRfZHdhcmZfcmVnbnVt
LiBQYXNzIGEgZmxhZ3MgdmFsdWUgYXMKPiA+IGFyY2hpdGVjdHVyZXMgbGlrZSBjc2t5IG5lZWQg
dGhlIGZsYWdzIHRvIGRldGVybWluZSB0aGUgQUJJIHZhcmlhbnQuCj4gPgo+Cj4gRG9lcyB0aGlz
IGNoYW5nZSB0aGUgY29tbWFuZCBvdXRwdXQgd2hlbiB3ZSB1c2UgaXQgZm9yIGNyb3NzLWJ1aWxk
Cj4gZW52aXJvbm1lbnQ/IEUuZy4gcmVtb3RlIGFyY2ggaXMgZGlmZmVyZW50IGZyb20gaG9zdCBh
cmNoPyBJZiBzbywKPiBwbGVhc2UgYWRkIG91dHB1dCBleGFtcGxlcyB3aXRoL3dpdGhvdXQgdGhp
cyBjaGFuZ2UuCgpUaGUgY2FzZXMgd2hlcmUgdGhpcyB3b3VsZCBhcHBseSBhcmUgc21hbGwgYXMg
Z2V0X2FyY2hfcmVnbnVtIGlzIG9ubHkKaW1wbGVtZW50ZWQgZm9yIHg4Ni4gZ2V0X2R3YXJmX3Jl
Z251bSBsaWtld2lzZSBvbmx5IHdvcmtzIGZvciB4ODYgYW5kCml0IGlzIG9ubHkgY2FsbGVkIGJ5
IGFubm90YXRlLgpJbiB0aGlzIGNvZGUgd2l0aG91dCB0aGlzIHBhdGNoIHRoZSBiZWhhdmlvciBp
cyB0byByZXR1cm4gLUVOT1RTVVAsIGllCnRoZSBjb2RlIGlzIHNldCB1cCB0byBmYWlsIGFuZCB0
aGlzIGNvZGUganVzdCBtYWtlcyBpdCBub3QgZmFpbCBmb3IKdGhlIHg4NiBjYXNlICh3aGVuIG5v
dCBvbiB4ODYpIHdpdGggY29kZSB0aGF0IGlzIHdlbGwgdGVzdGVkIG9uIHg4Ni4KVGhlIGNvZGUg
ZXhpc3RzIGFzIHg4NiByZWdpc3RlcnMgbWF5IGJlIHRoZSBzYW1lIGR3YXJmIG51bWJlciBidXQg
aGF2ZQpkaWZmZXJlbnQgbmFtZXM6IGUuZy4gcmF4LCBlYXgsIGF4LCBhbC4gSSdtIG5vdCBzdXJl
IHRoaXMgcmVhY2hlcyBhCmhpZ2ggY29tcGxleGl0eSBsZXZlbCBmb3IgZXh0ZW5zaXZlIHRlc3Rp
bmcuIEknbGwgc2VlIGlmIEkgY2FuIGdyYWIgYW4KeDg2IHBlcmYuZGF0YSBmaWxlIHRvIGFuYWx5
emUgb24gQVJNLCBidXQgSSBkb24ndCB0aGluayBkb2luZyB0aGlzCnNob3VsZCBnYXRlIHRoZSBz
ZXJpZXMuCgpUaGFua3MsCklhbgoKPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBSb2dlcnMgPGlyb2dl
cnNAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS5jICAg
ICAgICAgICB8IDYgKysrLS0tCj4gPiAgdG9vbHMvcGVyZi91dGlsL2R3YXJmLXJlZ3MuYyAgICAg
ICAgIHwgOCArKysrKystLQo+ID4gIHRvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3Mu
aCB8IDUgKysrLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS5j
IGIvdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMKPiA+IGluZGV4IDM3Y2U0M2M0ZWI4Zi4uYjFk
OThkYTc5YmU4IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMKPiA+
ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS5jCj4gPiBAQCAtMjI5Miw3ICsyMjkyLDcg
QEAgc3RhdGljIGludCBleHRyYWN0X3JlZ19vZmZzZXQoc3RydWN0IGFyY2ggKmFyY2gsIGNvbnN0
IGNoYXIgKnN0ciwKPiA+ICAgICAgIGlmIChyZWduYW1lID09IE5VTEwpCj4gPiAgICAgICAgICAg
ICAgIHJldHVybiAtMTsKPiA+Cj4gPiAtICAgICBvcF9sb2MtPnJlZzEgPSBnZXRfZHdhcmZfcmVn
bnVtKHJlZ25hbWUsIDApOwo+ID4gKyAgICAgb3BfbG9jLT5yZWcxID0gZ2V0X2R3YXJmX3JlZ251
bShyZWduYW1lLCBhcmNoLT5lX21hY2hpbmUsIGFyY2gtPmVfZmxhZ3MpOwo+ID4gICAgICAgZnJl
ZShyZWduYW1lKTsKPiA+Cj4gPiAgICAgICAvKiBHZXQgdGhlIHNlY29uZCByZWdpc3RlciAqLwo+
ID4gQEAgLTIzMDUsNyArMjMwNSw3IEBAIHN0YXRpYyBpbnQgZXh0cmFjdF9yZWdfb2Zmc2V0KHN0
cnVjdCBhcmNoICphcmNoLCBjb25zdCBjaGFyICpzdHIsCj4gPiAgICAgICAgICAgICAgIGlmIChy
ZWduYW1lID09IE5VTEwpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4K
PiA+IC0gICAgICAgICAgICAgb3BfbG9jLT5yZWcyID0gZ2V0X2R3YXJmX3JlZ251bShyZWduYW1l
LCAwKTsKPiA+ICsgICAgICAgICAgICAgb3BfbG9jLT5yZWcyID0gZ2V0X2R3YXJmX3JlZ251bShy
ZWduYW1lLCBhcmNoLT5lX21hY2hpbmUsIGFyY2gtPmVfZmxhZ3MpOwo+ID4gICAgICAgICAgICAg
ICBmcmVlKHJlZ25hbWUpOwo+ID4gICAgICAgfQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiBAQCAt
MjQwNSw3ICsyNDA1LDcgQEAgaW50IGFubm90YXRlX2dldF9pbnNuX2xvY2F0aW9uKHN0cnVjdCBh
cmNoICphcmNoLCBzdHJ1Y3QgZGlzYXNtX2xpbmUgKmRsLAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICBpZiAo
KnMgPT0gYXJjaC0+b2JqZHVtcC5yZWdpc3Rlcl9jaGFyKQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgb3BfbG9jLT5yZWcxID0gZ2V0X2R3YXJmX3JlZ251bShzLCAwKTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wX2xvYy0+cmVnMSA9IGdldF9kd2FyZl9yZWdu
dW0ocywgYXJjaC0+ZV9tYWNoaW5lLCBhcmNoLT5lX2ZsYWdzKTsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBlbHNlIGlmICgqcyA9PSBhcmNoLT5vYmpkdW1wLmltbV9jaGFyKSB7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBvcF9sb2MtPm9mZnNldCA9IHN0cnRvbChzICsgMSwg
JnAsIDApOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHAgJiYgcCAhPSBz
ICsgMSkKPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy5jIGIvdG9v
bHMvcGVyZi91dGlsL2R3YXJmLXJlZ3MuYwo+ID4gaW5kZXggN2MwMWJjNGQ3ZTViLi4xMzIxMzg3
ZjY5NDggMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy5jCj4gPiAr
KysgYi90b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy5jCj4gPiBAQCAtNzAsNyArNzAsNyBAQCBf
X3dlYWsgaW50IGdldF9hcmNoX3JlZ251bShjb25zdCBjaGFyICpuYW1lIF9fbWF5YmVfdW51c2Vk
KQo+ID4gIH0KPiA+Cj4gPiAgLyogUmV0dXJuIERXQVJGIHJlZ2lzdGVyIG51bWJlciBmcm9tIGFy
Y2hpdGVjdHVyZSByZWdpc3RlciBuYW1lICovCj4gPiAtaW50IGdldF9kd2FyZl9yZWdudW0oY29u
c3QgY2hhciAqbmFtZSwgdW5zaWduZWQgaW50IG1hY2hpbmUpCj4gPiAraW50IGdldF9kd2FyZl9y
ZWdudW0oY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgaW50IG1hY2hpbmUsIHVuc2lnbmVkIGlu
dCBmbGFncyBfX21heWJlX3VudXNlZCkKPiA+ICB7Cj4gPiAgICAgICBjaGFyICpyZWduYW1lID0g
c3RyZHVwKG5hbWUpOwo+ID4gICAgICAgaW50IHJlZyA9IC0xOwo+ID4gQEAgLTg0LDggKzg0LDEy
IEBAIGludCBnZXRfZHdhcmZfcmVnbnVtKGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGludCBt
YWNoaW5lKQo+ID4gICAgICAgaWYgKHApCj4gPiAgICAgICAgICAgICAgICpwID0gJ1wwJzsKPiA+
Cj4gPiArICAgICBpZiAobWFjaGluZSA9PSBFTV9OT05FKSB7Cj4gPiArICAgICAgICAgICAgIC8q
IEdlbmVyaWMgYXJjaCAtIHVzZSBob3N0IGFyY2ggKi8KPiA+ICsgICAgICAgICAgICAgbWFjaGlu
ZSA9IEVNX0hPU1Q7Cj4gPiArICAgICB9Cj4gPiAgICAgICBzd2l0Y2ggKG1hY2hpbmUpIHsKPiA+
IC0gICAgIGNhc2UgRU1fTk9ORTogICAvKiBHZW5lcmljIGFyY2ggLSB1c2UgaG9zdCBhcmNoICov
Cj4gPiArICAgICBjYXNlIEVNX0hPU1Q6Cj4gPiAgICAgICAgICAgICAgIHJlZyA9IGdldF9hcmNo
X3JlZ251bShyZWduYW1lKTsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBkZWZh
dWx0Ogo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3Mu
aCBiL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaAo+ID4gaW5kZXggZjRmODdk
ZWQ1ZTNkLi5lZTBhNzM0NTY0YzcgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3V0aWwvaW5j
bHVkZS9kd2FyZi1yZWdzLmgKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJm
LXJlZ3MuaAo+ID4gQEAgLTkzLDEyICs5MywxMyBAQCBpbnQgZ2V0X2FyY2hfcmVnbnVtKGNvbnN0
IGNoYXIgKm5hbWUpOwo+ID4gICAqIG5hbWU6IGFyY2hpdGVjdHVyZSByZWdpc3RlciBuYW1lCj4g
PiAgICogbWFjaGluZTogRUxGIG1hY2hpbmUgc2lnbmF0dXJlIChFTV8qKQo+ID4gICAqLwo+ID4g
LWludCBnZXRfZHdhcmZfcmVnbnVtKGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGludCBtYWNo
aW5lKTsKPiA+ICtpbnQgZ2V0X2R3YXJmX3JlZ251bShjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25l
ZCBpbnQgbWFjaGluZSwgdW5zaWduZWQgaW50IGZsYWdzKTsKPiA+Cj4gPiAgI2Vsc2UgLyogSEFW
RV9MSUJEV19TVVBQT1JUICovCj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUgaW50IGdldF9kd2FyZl9y
ZWdudW0oY29uc3QgY2hhciAqbmFtZSBfX21heWJlX3VudXNlZCwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYWNoaW5lIF9fbWF5YmVfdW51c2VkKQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1hY2hpbmUg
X19tYXliZV91bnVzZWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZmxhZ3MgX19tYXliZV91bnVzZWQpCj4gPiAgewo+ID4gICAgICAgcmV0dXJuIC0x
Owo+ID4gIH0KPiA+IC0tCj4gPiAyLjQ3LjAucmMwLjE4Ny5nZTY3MGJjY2Y3ZS1nb29nCj4gPgo+
Cj4KPiAtLQo+IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
