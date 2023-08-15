Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60899C001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrVvS2EBZo9pNDKzuzUKn75P9Xk9tbzRBJQ12NVREnA=; b=t6ilpZhOfLuyli
	4nodymzW4tRNmNGiBL+T788NvtLM+35G47hVFBxIW4M4DAOrzJY1FuNS36+XR95f3mMAGX2C2zC2x
	WbjradpUYll00bdE+MprEPlIp8IX4CPB/Au88kS9SOnZAH4V7gQ23DJFEdNoSvO3hQAMiG66W+ggv
	bLC1Rt3g0n711//ByzEQpp54SA7kp2E+DEmN/JN0fnschLHFgy/NCtwiakPjOUIXtzD9dnMROn6NL
	J/Rt/59ng+pVKHSNOc/aUegogy/qXR9CteFRfzJKGa1Xf2SacogbWZztlxW8YY8Xs7FSn5y4ZwOsu
	MBkakFMN89/OWt+W7t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVym4-002A5B-0T;
	Tue, 15 Aug 2023 18:28:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVym1-002A4Z-1Y;
	Tue, 15 Aug 2023 18:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vT/NXGTS2ks/1JGDMD/3lsy5RkFYlYyTOccrgk6+woM=; b=Nh1w7wwJAWInfRZXwPq1qzE43g
	t6BQM7iKqHuniqynfPypwEuEn0jvODddSP8IVuYIr/PpiyeHtnDEemBspNWauibka1nNIPoBKwNaa
	9g/p4S3IM/smtiHFsQkpIuBW1nxu43noVwqVzOC1iDeFiMb+eblE6cX04rVifgcsgmHlNm0yWW8S/
	5Fqor+/wzv9AxhAz7gvQItoIgZ+Vvowytn2+Hy/fk9w7xRuVqevU5ZMekY+2GdW735hMNTrwAWuhM
	dYnSKdlonFlk0ZuTcMN4BI5t8lJd0XIlNtaYsMMaryqWAsBeel6xzA2600x+jKNOyQcs7d0sBEprg
	j4QNKxew==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qVylz-00C0pD-2v;
	Tue, 15 Aug 2023 18:28:08 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id AFE01404DF; Tue, 15 Aug 2023 15:28:05 -0300 (-03)
Date: Tue, 15 Aug 2023 15:28:05 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v6 09/10] tools: lib: perf: Implement riscv mmap support
Message-ID: <ZNvDtR/zmlDngjBH@kernel.org>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
 <20230802080328.1213905-10-alexghiti@rivosinc.com>
 <CAP-5=fWZ8GDBn3fUUzjwknLq4KZV4tepX03oDn092zzboC8Dgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fWZ8GDBn3fUUzjwknLq4KZV4tepX03oDn092zzboC8Dgw@mail.gmail.com>
X-Url: http://acmel.wordpress.com
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

RW0gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMDk6NDQ6MjlBTSAtMDcwMCwgSWFuIFJvZ2VycyBlc2Ny
ZXZldToKPiBPbiBXZWQsIEF1ZyAyLCAyMDIzIGF0IDE6MTPigK9BTSBBbGV4YW5kcmUgR2hpdGkg
PGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IHJpc2N2IG5vdyBzdXBwb3J0
cyBtbWFwaW5nIGhhcmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRvCj4gPiB0
YWtlIGFkdmFudGFnZSBvZiB0aGF0IGluIGxpYnBlcmYuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IElhbiBS
b2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KClRoYW5rcywgYXBwbGllZC4KCi0gQXJuYWxkbwoK
IAo+IFRoYW5rcywKPiBJYW4KPiAKPiA+IC0tLQo+ID4gIHRvb2xzL2xpYi9wZXJmL21tYXAuYyB8
IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9s
aWIvcGVyZi9tbWFwLmMgYi90b29scy9saWIvcGVyZi9tbWFwLmMKPiA+IGluZGV4IDBkMTYzNGNl
ZGY0NC4uMjE4NDgxNGIzN2RkIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGliL3BlcmYvbW1hcC5j
Cj4gPiArKysgYi90b29scy9saWIvcGVyZi9tbWFwLmMKPiA+IEBAIC0zOTIsNiArMzkyLDcyIEBA
IHN0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIpCj4gPgo+
ID4gIHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1cm4gcmVhZF9zeXNyZWco
Y250dmN0X2VsMCk7IH0KPiA+Cj4gPiArLyogX19yaXNjdl94bGVuIGNvbnRhaW5zIHRoZSB3aXRk
aCBvZiB0aGUgbmF0aXZlIGJhc2UgaW50ZWdlciwgaGVyZSA2NC1iaXQgKi8KPiA+ICsjZWxpZiBk
ZWZpbmVkKF9fcmlzY3YpICYmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ID4gKwo+ID4gKy8qIFRPRE86
IGltcGxlbWVudCBydjMyIHN1cHBvcnQgKi8KPiA+ICsKPiA+ICsjZGVmaW5lIENTUl9DWUNMRSAg
ICAgIDB4YzAwCj4gPiArI2RlZmluZSBDU1JfVElNRSAgICAgICAweGMwMQo+ID4gKwo+ID4gKyNk
ZWZpbmUgY3NyX3JlYWQoY3NyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgX192
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIF9fYXNt
X18gX192b2xhdGlsZV9fICgiY3NyciAlMCwgJTEiICAgICAgICAgICAgIFwKPiA+ICsgICAgICAg
ICAgICAgICAgOiAiPXIiIChfX3YpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICAgICAgICAgICAgIDogImkiIChjc3IpIDogKTsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICBfX3Y7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICt9KQo+ID4gKwo+ID4gK3N0YXRpYyB1bnNp
Z25lZCBsb25nIGNzcl9yZWFkX251bShpbnQgY3NyX251bSkKPiA+ICt7Cj4gPiArI2RlZmluZSBz
d2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSwgX192YWwpICAgICAgICAgICB7XAo+ID4gKyAg
ICAgICBjYXNlIF9fY3NyX251bTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiArICAgICAgICAgICAgICAgX192YWwgPSBjc3JfcmVhZChfX2Nzcl9udW0pOyAgICAgICAgICAg
IFwKPiA+ICsgICAgICAgICAgICAgICBicmVhazsgfQo+ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9j
c3JfcmVhZF8yKF9fY3NyX251bSwgX192YWwpICAgICAgICAge1wKPiA+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3JfcmVhZChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICAgIFwKPiA+ICsgICAgICAg
c3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0gKyAxLCBfX3ZhbCl9Cj4gPiArI2RlZmluZSBz
d2l0Y2hjYXNlX2Nzcl9yZWFkXzQoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ID4gKyAg
ICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMCwgX192YWwpICAgICAgXAo+
ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMiwgX192YWwpfQo+
ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF84KF9fY3NyX251bSwgX192YWwpICAgICAg
ICAge1wKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSArIDAsIF9f
dmFsKSAgICAgIFwKPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSAr
IDQsIF9fdmFsKX0KPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMTYoX19jc3JfbnVt
LCBfX3ZhbCkgICAgICAgIHtcCj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChfX2Nz
cl9udW0gKyAwLCBfX3ZhbCkgICAgICBcCj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRf
OChfX2Nzcl9udW0gKyA4LCBfX3ZhbCl9Cj4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFk
XzMyKF9fY3NyX251bSwgX192YWwpICAgICAgICB7XAo+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nz
cl9yZWFkXzE2KF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgXAo+ID4gKyAgICAgICBzd2l0Y2hj
YXNlX2Nzcl9yZWFkXzE2KF9fY3NyX251bSArIDE2LCBfX3ZhbCl9Cj4gPiArCj4gPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgcmV0ID0gMDsKPiA+ICsKPiA+ICsgICAgICAgc3dpdGNoIChjc3JfbnVt
KSB7Cj4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIoQ1NSX0NZQ0xFLCByZXQpCj4g
PiArICAgICAgIGRlZmF1bHQ6Cj4gPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAg
IH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIHJldDsKPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9j
c3JfcmVhZF8zMgo+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzE2Cj4gPiArI3VuZGVm
IHN3aXRjaGNhc2VfY3NyX3JlYWRfOAo+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQK
PiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8yCj4gPiArI3VuZGVmIHN3aXRjaGNhc2Vf
Y3NyX3JlYWQKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHU2NCByZWFkX3BlcmZfY291bnRlcih1
bnNpZ25lZCBpbnQgY291bnRlcikKPiA+ICt7Cj4gPiArICAgICAgIHJldHVybiBjc3JfcmVhZF9u
dW0oQ1NSX0NZQ0xFICsgY291bnRlcik7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB1NjQgcmVh
ZF90aW1lc3RhbXAodm9pZCkKPiA+ICt7Cj4gPiArICAgICAgIHJldHVybiBjc3JfcmVhZF9udW0o
Q1NSX1RJTUUpOwo+ID4gK30KPiA+ICsKPiA+ICAjZWxzZQo+ID4gIHN0YXRpYyB1NjQgcmVhZF9w
ZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIgX19tYXliZV91bnVzZWQpIHsgcmV0dXJu
IDA7IH0KPiA+ICBzdGF0aWMgdTY0IHJlYWRfdGltZXN0YW1wKHZvaWQpIHsgcmV0dXJuIDA7IH0K
PiA+IC0tCj4gPiAyLjM5LjIKPiA+CgotLSAKCi0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
