Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7345D5D683
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHcbcp5KjpKZDDjHc/hYeH0bzjO+DqExn0OD7furvQc=; b=HYSvUauUv1HRTI
	8W3r1F2B/IQ/Wwrd4kui4EiunNyW21Ped+/R1nEQOXAwBMgZkFVnednZg9jqW9sr1bvHvqDCSHLzM
	rBjBWnpwWCsheGGJhnMdh7SquZB7tZemtgA+kYyyAIUglVJ3tmJ//NBCUs3BxElUehJ3AlKWHdu9N
	si/KtmvUV/qpidn3Yg7M/wWvlG9k7HU56+cmX/f+n8oahxK3WzAIp1r+XCtMnI0iUCmBVCUI0E4bC
	iZZaKtul0/Mn10UJGxXpVkJLrZSAOS+21DwuDd2mPqcNO87rvVw8nmvIUqMCrA4MzO8yz+hveKJHq
	fzQc56OVU78XT8+ykMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98V9-000000088qg-1lfx;
	Thu, 07 Nov 2024 19:49:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t981v-000000083jN-0uQb;
	Thu, 07 Nov 2024 19:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C921F5C4C6E;
	Thu,  7 Nov 2024 19:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E73C4CECC;
	Thu,  7 Nov 2024 19:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731007134;
	bh=tUz0GhcRj0ZxROqC6ULAO/ba2Gcn5tZO8oBwGXYih7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIABmJhOPM5gQ7aJobDAz51TgVD4v06smmwBLjo+3W+IRu0fwDcA2/6HEgiUoSa3E
	 ZiichYPLU5m8WkFGTlGAL1/bVqe//nbrD55Jtn8P0bXqcQ58cwdjGbTUMQAGT3V67R
	 oV6PsAeZvk05AEdHaHBCXlWhJ83NO5OvgKwvDA2ldVCWKtZWhKhzhjx555gHxYc6Kn
	 tRV7gfxi1Z3azWFgw66neiEJVh48t5RBrAVSdtKWOt3UurvhGCX9d2x5+CCNrbuWVa
	 8y3YX/LpV3B7HxG56PTNNkzccFmtoVuEHNhNMMph5xwjU95xoe0KlJzWfejQj60Bpj
	 Ujmu/DK6ORCnw==
Date: Thu, 7 Nov 2024 11:18:50 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Daniel Wagner <dwagner@suse.de>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Shenlin Liang <liangshenlin@eswincomputing.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Steinar H. Gunderson" <sesse@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Dima Kogan <dima@secretsauce.net>,
	Yury Norov <yury.norov@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 16/31] perf dwarf-regs: Pass accurate disassembly
 machine to get_dwarf_regnum
Message-ID: <Zy0SmlDrmksra_OD@google.com>
References: <20241005195541.380070-1-irogers@google.com>
 <20241005195541.380070-17-irogers@google.com>
 <20241007170755.03697b9178ed3dcac24dfa21@kernel.org>
 <CAP-5=fU4hTL1hfB7-FpMnFopJJriZAOXY_8iakW5yHC_gfhTWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fU4hTL1hfB7-FpMnFopJJriZAOXY_8iakW5yHC_gfhTWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_111855_371614_C9F6048A 
X-CRM114-Status: GOOD (  39.22  )
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

SGVsbG8sCgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgpPbiBNb24sIE9jdCAwNywgMjAyNCBh
dCAwODo0Njo1OUFNIC0wNzAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+IE9uIE1vbiwgT2N0IDcsIDIw
MjQgYXQgMTowOOKAr0FNIE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4KPiA+IE9uIFNhdCwgIDUgT2N0IDIwMjQgMTI6NTU6MjYgLTA3MDAKPiA+IElhbiBS
b2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBSYXRoZXIgdGhhbiBw
YXNzIDAvRU1fTk9ORSwgdXNlIHRoZSB2YWx1ZSBjb21wdXRlZCBpbiB0aGUgZGlzYXNtCj4gPiA+
IHN0cnVjdCBhcmNoLiBTd2l0Y2ggdGhlIEVNX05PTkUgY2FzZSB0byBFTV9IT1NULCByZXdyaXRp
bmcgRU1fTk9ORSBpZgo+ID4gPiBpdCB3ZXJlIHBhc3NlZCB0byBnZXRfZHdhcmZfcmVnbnVtLiBQ
YXNzIGEgZmxhZ3MgdmFsdWUgYXMKPiA+ID4gYXJjaGl0ZWN0dXJlcyBsaWtlIGNza3kgbmVlZCB0
aGUgZmxhZ3MgdG8gZGV0ZXJtaW5lIHRoZSBBQkkgdmFyaWFudC4KPiA+ID4KPiA+Cj4gPiBEb2Vz
IHRoaXMgY2hhbmdlIHRoZSBjb21tYW5kIG91dHB1dCB3aGVuIHdlIHVzZSBpdCBmb3IgY3Jvc3Mt
YnVpbGQKPiA+IGVudmlyb25tZW50PyBFLmcuIHJlbW90ZSBhcmNoIGlzIGRpZmZlcmVudCBmcm9t
IGhvc3QgYXJjaD8gSWYgc28sCj4gPiBwbGVhc2UgYWRkIG91dHB1dCBleGFtcGxlcyB3aXRoL3dp
dGhvdXQgdGhpcyBjaGFuZ2UuCj4gCj4gVGhlIGNhc2VzIHdoZXJlIHRoaXMgd291bGQgYXBwbHkg
YXJlIHNtYWxsIGFzIGdldF9hcmNoX3JlZ251bSBpcyBvbmx5Cj4gaW1wbGVtZW50ZWQgZm9yIHg4
Ni4gZ2V0X2R3YXJmX3JlZ251bSBsaWtld2lzZSBvbmx5IHdvcmtzIGZvciB4ODYgYW5kCj4gaXQg
aXMgb25seSBjYWxsZWQgYnkgYW5ub3RhdGUuCgpZZXAsIGl0J3MgdXNlZCBvbmx5IGluIHRoZSBk
YXRhIHR5cGUgcHJvZmlsaW5nLiAgSSBkb24ndCBleHBlY3QgaXQgdG8Kd29yayBpbiB0aGUgY3Jv
c3MgZW52aXJvbm1lbnQgeWV0LiAgVGhpcyBjaGFuZ2UgbW92ZXMgaXQgY2xvc2VyIHRvIHRoZQp3
b3JraW5nIHN0YXRlIHRob3VnaC4gOikKCgo+IEluIHRoaXMgY29kZSB3aXRob3V0IHRoaXMgcGF0
Y2ggdGhlIGJlaGF2aW9yIGlzIHRvIHJldHVybiAtRU5PVFNVUCwgaWUKPiB0aGUgY29kZSBpcyBz
ZXQgdXAgdG8gZmFpbCBhbmQgdGhpcyBjb2RlIGp1c3QgbWFrZXMgaXQgbm90IGZhaWwgZm9yCj4g
dGhlIHg4NiBjYXNlICh3aGVuIG5vdCBvbiB4ODYpIHdpdGggY29kZSB0aGF0IGlzIHdlbGwgdGVz
dGVkIG9uIHg4Ni4KPiBUaGUgY29kZSBleGlzdHMgYXMgeDg2IHJlZ2lzdGVycyBtYXkgYmUgdGhl
IHNhbWUgZHdhcmYgbnVtYmVyIGJ1dCBoYXZlCj4gZGlmZmVyZW50IG5hbWVzOiBlLmcuIHJheCwg
ZWF4LCBheCwgYWwuIEknbSBub3Qgc3VyZSB0aGlzIHJlYWNoZXMgYQo+IGhpZ2ggY29tcGxleGl0
eSBsZXZlbCBmb3IgZXh0ZW5zaXZlIHRlc3RpbmcuIEknbGwgc2VlIGlmIEkgY2FuIGdyYWIgYW4K
PiB4ODYgcGVyZi5kYXRhIGZpbGUgdG8gYW5hbHl6ZSBvbiBBUk0sIGJ1dCBJIGRvbid0IHRoaW5r
IGRvaW5nIHRoaXMKPiBzaG91bGQgZ2F0ZSB0aGUgc2VyaWVzLgoKWWVwLCBhcyBJIHNhaWQgaXQn
cyBub3Qgc3VwcG9ydGVkIHlldCBhbmQgSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIGdvYWwKb2Yg
dGhpcyBwYXRjaCBzZXJpZXMuICBTbyBwcm9iYWJseSBpdCdzIG9rIHRvIG1lcmdlIGl0IHdpdGhv
dXQgdGhlCmV4dGVuc2l2ZSB0ZXN0aW5nLgoKVGhhbmtzLApOYW1oeXVuZwoKPiAKPiA+ID4gU2ln
bmVkLW9mZi1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIHRvb2xzL3BlcmYvdXRpbC9hbm5vdGF0ZS5jICAgICAgICAgICB8IDYgKysrLS0tCj4gPiA+
ICB0b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy5jICAgICAgICAgfCA4ICsrKysrKy0tCj4gPiA+
ICB0b29scy9wZXJmL3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmggfCA1ICsrKy0tCj4gPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUuYyBiL3Rvb2xzL3BlcmYv
dXRpbC9hbm5vdGF0ZS5jCj4gPiA+IGluZGV4IDM3Y2U0M2M0ZWI4Zi4uYjFkOThkYTc5YmU4IDEw
MDY0NAo+ID4gPiAtLS0gYS90b29scy9wZXJmL3V0aWwvYW5ub3RhdGUuYwo+ID4gPiArKysgYi90
b29scy9wZXJmL3V0aWwvYW5ub3RhdGUuYwo+ID4gPiBAQCAtMjI5Miw3ICsyMjkyLDcgQEAgc3Rh
dGljIGludCBleHRyYWN0X3JlZ19vZmZzZXQoc3RydWN0IGFyY2ggKmFyY2gsIGNvbnN0IGNoYXIg
KnN0ciwKPiA+ID4gICAgICAgaWYgKHJlZ25hbWUgPT0gTlVMTCkKPiA+ID4gICAgICAgICAgICAg
ICByZXR1cm4gLTE7Cj4gPiA+Cj4gPiA+IC0gICAgIG9wX2xvYy0+cmVnMSA9IGdldF9kd2FyZl9y
ZWdudW0ocmVnbmFtZSwgMCk7Cj4gPiA+ICsgICAgIG9wX2xvYy0+cmVnMSA9IGdldF9kd2FyZl9y
ZWdudW0ocmVnbmFtZSwgYXJjaC0+ZV9tYWNoaW5lLCBhcmNoLT5lX2ZsYWdzKTsKPiA+ID4gICAg
ICAgZnJlZShyZWduYW1lKTsKPiA+ID4KPiA+ID4gICAgICAgLyogR2V0IHRoZSBzZWNvbmQgcmVn
aXN0ZXIgKi8KPiA+ID4gQEAgLTIzMDUsNyArMjMwNSw3IEBAIHN0YXRpYyBpbnQgZXh0cmFjdF9y
ZWdfb2Zmc2V0KHN0cnVjdCBhcmNoICphcmNoLCBjb25zdCBjaGFyICpzdHIsCj4gPiA+ICAgICAg
ICAgICAgICAgaWYgKHJlZ25hbWUgPT0gTlVMTCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtMTsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICBvcF9sb2MtPnJlZzIgPSBnZXRf
ZHdhcmZfcmVnbnVtKHJlZ25hbWUsIDApOwo+ID4gPiArICAgICAgICAgICAgIG9wX2xvYy0+cmVn
MiA9IGdldF9kd2FyZl9yZWdudW0ocmVnbmFtZSwgYXJjaC0+ZV9tYWNoaW5lLCBhcmNoLT5lX2Zs
YWdzKTsKPiA+ID4gICAgICAgICAgICAgICBmcmVlKHJlZ25hbWUpOwo+ID4gPiAgICAgICB9Cj4g
PiA+ICAgICAgIHJldHVybiAwOwo+ID4gPiBAQCAtMjQwNSw3ICsyNDA1LDcgQEAgaW50IGFubm90
YXRlX2dldF9pbnNuX2xvY2F0aW9uKHN0cnVjdCBhcmNoICphcmNoLCBzdHJ1Y3QgZGlzYXNtX2xp
bmUgKmRsLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4g
PiA+Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBpZiAoKnMgPT0gYXJjaC0+b2JqZHVtcC5y
ZWdpc3Rlcl9jaGFyKQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcF9sb2Mt
PnJlZzEgPSBnZXRfZHdhcmZfcmVnbnVtKHMsIDApOwo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBvcF9sb2MtPnJlZzEgPSBnZXRfZHdhcmZfcmVnbnVtKHMsIGFyY2gtPmVfbWFj
aGluZSwgYXJjaC0+ZV9mbGFncyk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBlbHNlIGlm
ICgqcyA9PSBhcmNoLT5vYmpkdW1wLmltbV9jaGFyKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9wX2xvYy0+b2Zmc2V0ID0gc3RydG9sKHMgKyAxLCAmcCwgMCk7Cj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwICYmIHAgIT0gcyArIDEpCj4gPiA+
IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy5jIGIvdG9vbHMvcGVyZi91
dGlsL2R3YXJmLXJlZ3MuYwo+ID4gPiBpbmRleCA3YzAxYmM0ZDdlNWIuLjEzMjEzODdmNjk0OCAx
MDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2R3YXJmLXJlZ3MuYwo+ID4gPiArKysg
Yi90b29scy9wZXJmL3V0aWwvZHdhcmYtcmVncy5jCj4gPiA+IEBAIC03MCw3ICs3MCw3IEBAIF9f
d2VhayBpbnQgZ2V0X2FyY2hfcmVnbnVtKGNvbnN0IGNoYXIgKm5hbWUgX19tYXliZV91bnVzZWQp
Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAvKiBSZXR1cm4gRFdBUkYgcmVnaXN0ZXIgbnVtYmVyIGZy
b20gYXJjaGl0ZWN0dXJlIHJlZ2lzdGVyIG5hbWUgKi8KPiA+ID4gLWludCBnZXRfZHdhcmZfcmVn
bnVtKGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGludCBtYWNoaW5lKQo+ID4gPiAraW50IGdl
dF9kd2FyZl9yZWdudW0oY29uc3QgY2hhciAqbmFtZSwgdW5zaWduZWQgaW50IG1hY2hpbmUsIHVu
c2lnbmVkIGludCBmbGFncyBfX21heWJlX3VudXNlZCkKPiA+ID4gIHsKPiA+ID4gICAgICAgY2hh
ciAqcmVnbmFtZSA9IHN0cmR1cChuYW1lKTsKPiA+ID4gICAgICAgaW50IHJlZyA9IC0xOwo+ID4g
PiBAQCAtODQsOCArODQsMTIgQEAgaW50IGdldF9kd2FyZl9yZWdudW0oY29uc3QgY2hhciAqbmFt
ZSwgdW5zaWduZWQgaW50IG1hY2hpbmUpCj4gPiA+ICAgICAgIGlmIChwKQo+ID4gPiAgICAgICAg
ICAgICAgICpwID0gJ1wwJzsKPiA+ID4KPiA+ID4gKyAgICAgaWYgKG1hY2hpbmUgPT0gRU1fTk9O
RSkgewo+ID4gPiArICAgICAgICAgICAgIC8qIEdlbmVyaWMgYXJjaCAtIHVzZSBob3N0IGFyY2gg
Ki8KPiA+ID4gKyAgICAgICAgICAgICBtYWNoaW5lID0gRU1fSE9TVDsKPiA+ID4gKyAgICAgfQo+
ID4gPiAgICAgICBzd2l0Y2ggKG1hY2hpbmUpIHsKPiA+ID4gLSAgICAgY2FzZSBFTV9OT05FOiAg
IC8qIEdlbmVyaWMgYXJjaCAtIHVzZSBob3N0IGFyY2ggKi8KPiA+ID4gKyAgICAgY2FzZSBFTV9I
T1NUOgo+ID4gPiAgICAgICAgICAgICAgIHJlZyA9IGdldF9hcmNoX3JlZ251bShyZWduYW1lKTsK
PiA+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+ID4gICAgICAgZGVmYXVsdDoKPiA+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaCBiL3Rvb2xzL3Bl
cmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaAo+ID4gPiBpbmRleCBmNGY4N2RlZDVlM2QuLmVl
MGE3MzQ1NjRjNyAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2luY2x1ZGUvZHdh
cmYtcmVncy5oCj4gPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3Mu
aAo+ID4gPiBAQCAtOTMsMTIgKzkzLDEzIEBAIGludCBnZXRfYXJjaF9yZWdudW0oY29uc3QgY2hh
ciAqbmFtZSk7Cj4gPiA+ICAgKiBuYW1lOiBhcmNoaXRlY3R1cmUgcmVnaXN0ZXIgbmFtZQo+ID4g
PiAgICogbWFjaGluZTogRUxGIG1hY2hpbmUgc2lnbmF0dXJlIChFTV8qKQo+ID4gPiAgICovCj4g
PiA+IC1pbnQgZ2V0X2R3YXJmX3JlZ251bShjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQg
bWFjaGluZSk7Cj4gPiA+ICtpbnQgZ2V0X2R3YXJmX3JlZ251bShjb25zdCBjaGFyICpuYW1lLCB1
bnNpZ25lZCBpbnQgbWFjaGluZSwgdW5zaWduZWQgaW50IGZsYWdzKTsKPiA+ID4KPiA+ID4gICNl
bHNlIC8qIEhBVkVfTElCRFdfU1VQUE9SVCAqLwo+ID4gPgo+ID4gPiAgc3RhdGljIGlubGluZSBp
bnQgZ2V0X2R3YXJmX3JlZ251bShjb25zdCBjaGFyICpuYW1lIF9fbWF5YmVfdW51c2VkLAo+ID4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbWFjaGluZSBf
X21heWJlX3VudXNlZCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IG1hY2hpbmUgX19tYXliZV91bnVzZWQsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncyBfX21heWJlX3VudXNlZCkKPiA+ID4g
IHsKPiA+ID4gICAgICAgcmV0dXJuIC0xOwo+ID4gPiAgfQo+ID4gPiAtLQo+ID4gPiAyLjQ3LjAu
cmMwLjE4Ny5nZTY3MGJjY2Y3ZS1nb29nCj4gPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBNYXNhbWkg
SGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
