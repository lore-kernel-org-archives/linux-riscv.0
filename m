Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE81DE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 18:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kc8vyi+JRLRC4UnArQYhzx98PTbbAzcI70IyHQj4sk=; b=TZMPKkmaV+BHgD
	2v937Qt+5Iu7nbfXCu/b8Zyp9prywG/W45ekiq6XL2RFYs0/Srlpu61obcMU9IVrKuCt59ChpsPsx
	nsr036ocd+RQQlLZwtnbyJiB4lN3q3V4ArXJRhv15rEJq30Jk0JLxcPR5Bm1WKpyRxOVqURrjJZYC
	7klPrsGHBLEw8Y2280g3gfFKL3gMpiajVF9ZVbA9JnBndDiyWFr6vXXXqTsUs+XoSBah4ZPQXKaY7
	bU7TVPUI1M8WRSRtcwCRzHi+XE3gIc5Co13XcRzsCiGo9ArssLlBTPuIkLc+pfX7c0BwUSgOkt6cm
	0cRA+qScKdSZPAro1qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyzL-0000000HTJl-0gah;
	Wed, 18 Dec 2024 18:41:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyzI-0000000HTIs-24Gk
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 18:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DED6CA40191;
	Wed, 18 Dec 2024 18:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9084FC4CECD;
	Wed, 18 Dec 2024 18:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734547295;
	bh=1Pk+Poo09suXrcvpVp1oeGmHxV7JSee/hgW3Otg+GAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uy330i6btvqwZgD3agJyLdpKiwp+PX1tQV0zDq654AyMEhBdyQm/UEzu8RrjK4RLB
	 7yT8BbG7fFfUcVyRZ6KSRe8bBpM/uPoVL/JNstJi/clCMSjO/C23S4q9Q0pwWfoMZa
	 /uM2ofy+8XL3Xf6Ytbedoi3zgGU0YyRIlY37c/AI1JeJwXdTRvwkss2UkqjETmbexE
	 T+kv6sITMUtX0NeLDbFdKv0cH5uY43wx/jXrgd+z4V57L+/AHPiROUog9JbuOcWfjb
	 av1xFUrtzpAt7r4YmRzkhTEiC2FLWU2lOn/zYQporOQJUHJpA2dCL1zA91sM+YFWYh
	 QT3q8QjhL1CLQ==
Date: Wed, 18 Dec 2024 15:41:32 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z2MXXFhUzoQmW4xV@x1>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z2IXl5cuKQJInJb0@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_104136_656912_2ED20712 
X-CRM114-Status: GOOD (  21.75  )
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6MzA6MTVQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0IGF0IDA0OjE4OjMyUE0gLTA4MDAsIElhbiBS
b2dlcnMgd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxp
ZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+IEFmdGVyIGJpbnV0
aWxzIGNvbW1pdCBlNDNkODc2IHdoaWNoIHdhcyBmaXJzdCBpbmNsdWRlZCBpbiBiaW51dGlscyAy
LjQxLAo+ID4gPiByaXNjdiBubyBsb25nZXIgc3VwcG9ydHMgZHVtcGluZyBpbiB0aGUgbWlkZGxl
IG9mIGluc3RydWN0aW9ucy4gSW5jcmVhc2UKPiA+ID4gdGhlIG9iamR1bXAgd2luZG93IGJ5IDIt
Ynl0ZXMgdG8gZW5zdXJlIHRoYXQgYW55IGluc3RydWN0aW9uIHRoYXQgc2l0cwo+ID4gPiBvbiB0
aGUgYm91bmRhcnkgb2YgdGhlIHNwZWNpZmllZCBzdG9wLWFkZHJlc3MgaXMgbm90IGN1dCBpbiBo
YWxmLgoKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9z
aW5jLmNvbT4KCj4gPiBSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29t
PgoKPiA+ID4gQSBiaW51dGlscyBwYXRjaCBoYXMgYmVlbiBzZW50IGFzIHdlbGwgdG8gZml4IHRo
aXMgaW4gb2JqZHVtcCBbMV0uCgo+ID4gPiBMaW5rOiBodHRwczovL3NvdXJjZXdhcmUub3JnL3Bp
cGVybWFpbC9iaW51dGlscy8yMDI0LURlY2VtYmVyLzEzODEzOS5odG1sIFsxXQoKPiA+ID4gQ2hh
bmdlcyBpbiB2MjoKPiA+ID4gLSBEbyBvYmpkdW1wIHZlcnNpb24gZGV0ZWN0aW9uIGF0IHJ1bnRp
bWUgKElhbikKPiA+ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjQxMjE2LXBlcmZfZml4X3Jpc2N2X29ial9yZWFkaW5nLXYxLTAtYjc1OTYyNjYwYTliQHJpdm9z
aW5jLmNvbQoKPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYwo+ID4g
PiBAQCAtMTgzLDkgKzI0NCwzMCBAQCBzdGF0aWMgaW50IHJlYWRfdmlhX29iamR1bXAoY29uc3Qg
Y2hhciAqZmlsZW5hbWUsIHU2NCBhZGRyLCB2b2lkICpidWYsCj4gPiA+ICAgICAgICAgY29uc3Qg
Y2hhciAqZm10Owo+ID4gPiAgICAgICAgIEZJTEUgKmY7Cj4gPiA+ICAgICAgICAgaW50IHJldDsK
PiA+ID4gKyAgICAgICB1NjQgc3RvcF9hZGRyZXNzID0gYWRkciArIGxlbjsKPiA+ID4gKwo+ID4g
PiArICAgICAgIGlmIChJU19FTkFCTEVEKF9fcmlzY3YpKSB7Cgo+ID4gTm90IHN1cmUgaWYgdGhl
cmUgaXMgYSBjb25zaXN0ZW5jeSBpc3N1ZSBoZXJlLiBFbHNld2hlcmUgd2UncmUganVzdAo+ID4g
dXNpbmcgaWZkZWYsIHN1Y2ggYXM6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJm
L3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJmLXRvb2xzLW5leHQjbjY5CiAKPiBJIGRv
bid0IGhhdmUgYW55IHN0cm9uZyBmZWVsaW5ncyBhYm91dCB0aGF0LiBJIGNhbiBjaGFuZ2UgaXQg
dG8gYmUgYW4KPiBpZmRlZi4gT24gb3RoZXIgbGlzdHMgSSBoYXZlIGJlZW4gdG9sZCB0byB1c2Ug
SVNfRU5BQkxFRCB3aGVuZXZlcgo+IHBvc3NpYmxlLCBidXQgaXQncyBvbmx5IGEgc21hbGwgZGlm
ZmVyZW5jZS4KCkNhbid0IHdlIGp1c3QgdXNlIHVuYW1lIGhlcmU/CgpTbyB0aGF0IHdlIGRvbid0
IHVzZSBrY29uZmlnLmggc2luY2UgaXRzIG5vdCB1c2VkIGluIHRvb2xzL3BlcmYvIGFuZAptYWtl
cyBpdCBsb29rcyBsaWtlIHBlcmYgaXMgaW4gbG9ja3N0ZXAgd2l0aCB0aGUga2VybmVsIHNvdXJj
ZSB0cmVlCnZlcnNpb24gaXQgd2FzIGNvbXBpbGVkIGZyb20/CgokIGdpdCBncmVwIGtjb25maWcu
aCB0b29scy9wZXJmLwokCgpCVFcsIHdoYXQgd291bGQgaGFwcGVuIGlmIEkgY29sbGVjdGVkIGEg
cGVyZi5kYXRhIGZpbGUgb24geDg2XzY0IGFuZAp3b3VsZCByZWFkIGl0IGluIGEgUmlzY1YgbWFj
aGluZSB3aXRoIHN1Y2ggYSBvYmpkdW1wIHZlcnNpb24/IFRoZSBzYW1lCnByb2JsZW0/CgotIEFy
bmFsZG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
