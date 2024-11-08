Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2DCD64077
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+L+WTEHYeu2iiAH3mbrH2HvhmDF4UpMrclKo/+E48E=; b=nQVQ5Wxw8E7avt
	cs4OZ6IRfiNT/BClBoXUF+sJPmzA/VoNPl3cBW2xb3AyCKculhaNvwW5B8W8N1PqJ9VBRKFKLc5zT
	HF4Qir2xObioAD4DDwvZZwL7zqXI//T2FN8CQxoU9ASWHecPKlBBjQdA4GGhjhpsn8VOARPBdJAFA
	Czj5Jx49uU243d42+BX22AQ/F5j8pM9uRIzN7r2fejCdOmt237w5C5lBD3XbnUzjtZ1gmN+Cvy4Ro
	vEmuRlum/LROOZa6z+tNUpBRjwz7ANgNPF9EqJ4cIcG3iAeK/i/QMCwXTPlA0m+j6JxIpZTzv1C1p
	yXGn+sejNivN5UEfwRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Twj-0000000Bcw2-2Ojy;
	Fri, 08 Nov 2024 18:43:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9TsL-0000000BcIE-1Cw0;
	Fri, 08 Nov 2024 18:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC6CBA4408D;
	Fri,  8 Nov 2024 18:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85CDC4CECD;
	Fri,  8 Nov 2024 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731091107;
	bh=ysbnWIA04niPh4/FnRelxvy/7qgNN9jt3TdDs+ECXHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5x9U7KDBB10MgdIZ5cjW590p6De536vrCk6OUvDIUUWG2j2zr4RwiRpbjUPAeBfJ
	 KA+Mj+0+vl1KNhF2gZGB3soVZT6L4Mq/fgt6ZAkMTvHEaZcF6cD/gm+P3ks6j2M8Ce
	 0aFHCp+CEvssjEwhAJ/3qT904uMtGPDYzowmckVMpkBsiMOPjm/cf5hsu0BkrngexS
	 +ePBbaF3hoEU86XGCPhGZY/Qr3JR9xpJ+Uz3p2yAEsewaPXhnSpWjXv13FrdBVsClu
	 lZ4glEdEamcE+LykLNeeXHS25zbgkF9/5tjYvV8cmic/HB/9XlfQfKa6/YwQ2/kqh8
	 u0Ykcp1J7+p7Q==
Date: Fri, 8 Nov 2024 10:38:24 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
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
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Changbin Du <changbin.du@huawei.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Yang Jihong <yangjihong@bytedance.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>, Atish Patra <atishp@rivosinc.com>,
	Shenlin Liang <liangshenlin@eswincomputing.com>,
	Anup Patel <anup@brainfault.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Steinar H. Gunderson" <sesse@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Dima Kogan <dima@secretsauce.net>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 04/20] perf disasm: Add e_machine/e_flags to struct
 arch
Message-ID: <Zy5aoMnY2nupb7SX@google.com>
References: <20241017002520.59124-1-irogers@google.com>
 <20241017002520.59124-5-irogers@google.com>
 <Zy5Le-xn4gzQ2WLo@google.com>
 <CAP-5=fXe-gJ6pXwdTgGqScCR+mKS2FBfVDsbih7vL-1kPKAvaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXe-gJ6pXwdTgGqScCR+mKS2FBfVDsbih7vL-1kPKAvaA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_103829_458590_10010D6B 
X-CRM114-Status: GOOD (  37.79  )
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

T24gRnJpLCBOb3YgMDgsIDIwMjQgYXQgMTA6MTk6NTJBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBGcmksIE5vdiA4LCAyMDI0IGF0IDk6MzPigK9BTSBOYW1oeXVuZyBLaW0gPG5hbWh5
dW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDI0IGF0IDA1
OjI1OjA0UE0gLTA3MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+IEN1cnJlbnRseSBmdW5jdGlv
bnMgbGlrZSBnZXRfZHdhcmZfcmVnbnVtIG9ubHkgd29yayB3aXRoIHRoZSBob3N0Cj4gPiA+IGFy
Y2hpdGVjdHVyZS4gQ2FycnkgdGhlIGVsZiBtYWNoaW5lIGFuZCBmbGFncyBpbiBzdHJ1Y3QgYXJj
aCBzbyB0aGF0Cj4gPiA+IGluIGRpc2Fzc2VtYmx5IHRoZXNlIGNhbiBiZSB1c2VkIHRvIGFsbG93
IGNyb3NzIHBsYXRmb3JtIGRpc2Fzc2VtYmx5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJ
YW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgdG9vbHMvcGVy
Zi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyAgICAgICB8IDIgKysKPiA+ID4gIHRv
b2xzL3BlcmYvYXJjaC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgICAgfCAyICsrCj4g
PiA+ICB0b29scy9wZXJmL2FyY2gvYXJtNjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgIHwg
MiArKwo+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMg
ICAgICB8IDcgKysrKysrLQo+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL2xvb25nYXJjaC9hbm5vdGF0
ZS9pbnN0cnVjdGlvbnMuYyB8IDIgKysKPiA+ID4gIHRvb2xzL3BlcmYvYXJjaC9taXBzL2Fubm90
YXRlL2luc3RydWN0aW9ucy5jICAgICAgfCAyICsrCj4gPiA+ICB0b29scy9wZXJmL2FyY2gvcG93
ZXJwYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyAgIHwgMiArKwo+ID4gPiAgdG9vbHMvcGVyZi9h
cmNoL3Jpc2N2NjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICB8IDIgKysKPiA+ID4gIHRvb2xz
L3BlcmYvYXJjaC9zMzkwL2Fubm90YXRlL2luc3RydWN0aW9ucy5jICAgICAgfCAyICsrCj4gPiA+
ICB0b29scy9wZXJmL2FyY2gvc3BhcmMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgICAgIHwgMiAr
Kwo+ID4gPiAgdG9vbHMvcGVyZi9hcmNoL3g4Ni9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyAgICAg
ICB8IDMgKystCj4gPiA+ICB0b29scy9wZXJmL3V0aWwvZGlzYXNtLmggICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNCArKysrCj4gPiA+ICAxMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9h
cmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyBiL3Rvb2xzL3BlcmYvYXJjaC9hcmMvYW5u
b3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ID4gaW5kZXggMmYwMGU5OTVjN2UzLi5lNTYxOTc3MGEx
YWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9hcmMvYW5ub3RhdGUvaW5zdHJ1
Y3Rpb25zLmMKPiA+ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL2FyYy9hbm5vdGF0ZS9pbnN0cnVj
dGlvbnMuYwo+ID4gPiBAQCAtNSw1ICs1LDcgQEAgc3RhdGljIGludCBhcmNfX2Fubm90YXRlX2lu
aXQoc3RydWN0IGFyY2ggKmFyY2gsIGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQo+ID4gPiAg
ewo+ID4gPiAgICAgICBhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gPiA+ICAgICAgIGFyY2gt
Pm9iamR1bXAuY29tbWVudF9jaGFyID0gJzsnOwo+ID4gPiArICAgICBhcmNoLT5lX21hY2hpbmUg
PSBFTV9BUkM7Cj4gPiA+ICsgICAgIGFyY2gtPmVfZmxhZ3MgPSAwOwo+ID4gPiAgICAgICByZXR1
cm4gMDsKPiA+ID4gIH0KPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9hcm0vYW5u
b3RhdGUvaW5zdHJ1Y3Rpb25zLmMgYi90b29scy9wZXJmL2FyY2gvYXJtL2Fubm90YXRlL2luc3Ry
dWN0aW9ucy5jCj4gPiA+IGluZGV4IDJmZjZjZWRlYjljNS4uY2Y5MWE0MzM2MmIwIDEwMDY0NAo+
ID4gPiAtLS0gYS90b29scy9wZXJmL2FyY2gvYXJtL2Fubm90YXRlL2luc3RydWN0aW9ucy5jCj4g
PiA+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9hcm0vYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+
ID4gQEAgLTUzLDYgKzUzLDggQEAgc3RhdGljIGludCBhcm1fX2Fubm90YXRlX2luaXQoc3RydWN0
IGFyY2ggKmFyY2gsIGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQo+ID4gPiAgICAgICBhcmNo
LT5hc3NvY2lhdGVfaW5zdHJ1Y3Rpb25fb3BzICAgPSBhcm1fX2Fzc29jaWF0ZV9pbnN0cnVjdGlv
bl9vcHM7Cj4gPiA+ICAgICAgIGFyY2gtPm9iamR1bXAuY29tbWVudF9jaGFyICAgICAgICA9ICc7
JzsKPiA+ID4gICAgICAgYXJjaC0+b2JqZHVtcC5za2lwX2Z1bmN0aW9uc19jaGFyID0gJysnOwo+
ID4gPiArICAgICBhcmNoLT5lX21hY2hpbmUgPSBFTV9BUk07Cj4gPiA+ICsgICAgIGFyY2gtPmVf
ZmxhZ3MgPSAwOwo+ID4gPiAgICAgICByZXR1cm4gMDsKPiA+ID4KPiA+ID4gIG91dF9mcmVlX2Nh
bGw6Cj4gPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL2FyY2gvYXJtNjQvYW5ub3RhdGUvaW5z
dHJ1Y3Rpb25zLmMgYi90b29scy9wZXJmL2FyY2gvYXJtNjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25z
LmMKPiA+ID4gaW5kZXggZjg2ZDlmNDc5OGJkLi5kNDY1ZDA5M2U3ZWIgMTAwNjQ0Cj4gPiA+IC0t
LSBhL3Rvb2xzL3BlcmYvYXJjaC9hcm02NC9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYwo+ID4gPiAr
KysgYi90b29scy9wZXJmL2FyY2gvYXJtNjQvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+ID4g
QEAgLTExMyw2ICsxMTMsOCBAQCBzdGF0aWMgaW50IGFybTY0X19hbm5vdGF0ZV9pbml0KHN0cnVj
dCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkKPiA+ID4gICAgICAgYXJj
aC0+YXNzb2NpYXRlX2luc3RydWN0aW9uX29wcyAgID0gYXJtNjRfX2Fzc29jaWF0ZV9pbnN0cnVj
dGlvbl9vcHM7Cj4gPiA+ICAgICAgIGFyY2gtPm9iamR1bXAuY29tbWVudF9jaGFyICAgICAgICA9
ICcvJzsKPiA+ID4gICAgICAgYXJjaC0+b2JqZHVtcC5za2lwX2Z1bmN0aW9uc19jaGFyID0gJysn
Owo+ID4gPiArICAgICBhcmNoLT5lX21hY2hpbmUgPSBFTV9BQVJDSDY0Owo+ID4gPiArICAgICBh
cmNoLT5lX2ZsYWdzID0gMDsKPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+Cj4gPiA+ICBvdXRf
ZnJlZV9jYWxsOgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3Rh
dGUvaW5zdHJ1Y3Rpb25zLmMgYi90b29scy9wZXJmL2FyY2gvY3NreS9hbm5vdGF0ZS9pbnN0cnVj
dGlvbnMuYwo+ID4gPiBpbmRleCA1MzM3YmZiN2Q1ZmMuLjE0MjcwMzExZDIxNSAxMDA2NDQKPiA+
ID4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+
ID4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMKPiA+
ID4gQEAgLTQzLDYgKzQzLDExIEBAIHN0YXRpYyBpbnQgY3NreV9fYW5ub3RhdGVfaW5pdChzdHJ1
Y3QgYXJjaCAqYXJjaCwgY2hhciAqY3B1aWQgX19tYXliZV91bnVzZWQpCj4gPiA+ICAgICAgIGFy
Y2gtPmluaXRpYWxpemVkID0gdHJ1ZTsKPiA+ID4gICAgICAgYXJjaC0+b2JqZHVtcC5jb21tZW50
X2NoYXIgPSAnLyc7Cj4gPiA+ICAgICAgIGFyY2gtPmFzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMg
PSBjc2t5X19hc3NvY2lhdGVfaW5zX29wczsKPiA+ID4gLQo+ID4gPiArICAgICBhcmNoLT5lX21h
Y2hpbmUgPSBFTV9DU0tZOwo+ID4gPiArI2lmIGRlZmluZWQoX19DU0tZQUJJVjJfXykKPiA+ID4g
KyAgICAgYXJjaC0+ZV9mbGFncyA9IEVGX0NTS1lfQUJJVjI7Cj4gPiA+ICsjZWxzZQo+ID4gPiAr
ICAgICBhcmNoLT5lX2ZsYWdzID0gRUZfQ1NLWV9BQklWMTsKPiA+ID4gKyNlbmRpZgo+ID4KPiA+
IEJ5IG1vdmluZyB0aGlzIGludG8gdGhlIGdlbmVyYWwgY29kZSwgaXQgc2hvdWxkIHRha2UgY2Fy
ZSBvZiBvbGQgc3lzdGVtcwo+ID4gdGhhdCBkb2Vzbid0IGhhdmUgdGhlIG1hY3JvLgo+ID4KPiA+
ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHV0aWwvZGlzYXNtLmM6MTA5Ogo+ID4gICAvbGludXgv
dG9vbHMvcGVyZi9hcmNoL2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmM6IEluIGZ1bmN0aW9u
ICdjc2t5X19hbm5vdGF0ZV9pbml0JzoKPiA+ICAgL2xpbnV4L3Rvb2xzL3BlcmYvYXJjaC9jc2t5
L2Fubm90YXRlL2luc3RydWN0aW9ucy5jOjUwOjI1OiBlcnJvcjogJ0VGX0NTS1lfQUJJVjEnIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ID4gICAgICA1MCB8ICAgICAg
ICAgYXJjaC0+ZV9mbGFncyA9IEVGX0NTS1lfQUJJVjE7Cj4gPiAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+ID4gICAvbGludXgvdG9vbHMvcGVyZi9hcmNo
L2Nza3kvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmM6NTA6MjU6IG5vdGU6IGVhY2ggdW5kZWNsYXJl
ZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBh
cHBlYXJzIGluCj4gCj4gRUZfQ1NLWV9BQklWMSBpcyBkZWZpbmVkIGluIGVsZi5oIGFuZCBoYXMg
YmVlbiB0aGVyZSBhdCBsZWFzdCA1IHllYXJzIGluIGxpYmVsZjoKPiBodHRwczovL3NvdXJjZXdh
cmUub3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21taXQ7Zj1saWJlbGYvZWxmLmg7aD05Yzgy
OTQyYWU3MzU1YTMyMjZjNTNhOTJjMmM3M2IzMzE5M2M1ZTMzCj4gSSBzdXNwZWN0ZWQgdGhlIGlz
c3VlIGhlcmUgaXMgbWlzc2luZyBlbGYuaCBpbmNsdWRlLCBidXQgdGhlIC5jIGZpbGUKPiBpcyBp
bmNsdWRlZCBpbiB0b29scy9wZXJmL3V0aWwvZGlzYXNtLmMgYW5kIHRoYXQgbXVzdCBoYXZlIGEK
PiB0cmFuc2l0aXZlIGRlcGVuZGVuY3kgZ2l2ZW4gb3RoZXIgdGhpbmdzIGFyZSBidWlsZGluZy4g
RG8geW91IHdhbnQgbWUKPiB0byBzZW5kIGEgcGF0Y2ggbWFraW5nIHRoaXMgY29uZGl0aW9uYWwg
d2l0aCBleHRyYSAjaWZkZWZzIG9yIHJlLXNlbmQKPiB0aGUgc2VyaWVzPwoKWWVhaCwgaXQncyB1
bmZvcnR1bmF0ZSBidXQgSSB0aGluayB3ZSBjYW4gaGF2ZSBhIHNtYWxsIGluY3JlbWVudGFsIGRp
ZmYKaGVyZSB0byBkZWZpbmUgdGhlbSBpZiBpdCdzIG5vdCB0aGVyZS4gIFRoZW4gSSdsbCBzcXVh
c2ggaXQgdG8gdGhlCnBhdGNoLgoKPiAKPiA+IEFsc28sIEkgdGhpbmsgX19DU0tZQUJJVjJfXyBp
cyBkZWZpbmVkIG9ubHkgd2hlbiB0aGUgaG9zdCBpcyBjc2t5LiAgU28KPiA+IGl0J2xsIHVzZSBB
QkkgdjEgb24gY3Jvc3MgZW52LiAgSSdtIG5vdCBzdXJlIGlmIGl0J3MgYSBwcm9ibGVtLiAgV2Ug
bWF5Cj4gPiBuZWVkIHRvIHNhdmUgdGhlIEFCSSBzb21ld2hlcmUgaW4gdGhlIG1ldGFkYXRhIGxh
dGVyLgo+IAo+IEFncmVlZC4gSW4gZ2VuZXJhbCB3ZSBzaG91bGQgcmVhZCBlX21hY2hpbmUgYW5k
IGVfZmxhZ3MgZnJvbSB0aGUgRUxGCj4gZmlsZSwgc28gSSdtIG5vdCBzdXJlIG5ldyBtZXRhZGF0
YSBpcyBuZWVkZWQuIFRoaXMgcGF0Y2ggaXMgdHJ5aW5nIHRvCj4gbGF5IGdyb3VuZHdvcmsgZm9y
IHRoYXQuCgpJIHVuZGVyc3RhbmQgdGhhdC4gIFllYWggaXQgc2hvdWxkIGNvbWUgZnJvbSB0aGUg
YmluYXJ5LgoKVGhhbmtzLApOYW1oeXVuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
