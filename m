Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7F2C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USwUREgjlj+oBjvZ3PQiAl4SpAyXQaEWfo30do9QjJY=; b=RQk1IqmByg+7d/
	r548mpz7OzmEnLhVJEJXdpbyE/hA8pjJdI5WZx8/Djl17IeoUXjvMmJ5dy6MIbo6z+aA/ry2aiMgI
	MfCFKcenYdQENeLx6J0q3LTitlHerNy7VUCP0CaejilRq6MYlSh8R38NDKYl3FFEcoR5nRb3+toW7
	noRpLBfpy9IY63TWBOyOPFUkxvsiADcBK5wmKsKdxFUIyc2kiVH3BWfaJFxLF3Gw7wNeBP8U/o7zp
	AIsN7rK09XbJYj2I67rTZ5rJrbV9a90TjsgXVS1qIySucDeS3AJKPPBuVDGFTTGeaY8vXx99jB+Kv
	ZuatC0booqkA+DcN9H1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUXX-00GJSI-16;
	Mon, 31 Jul 2023 15:10:31 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUXT-00GJQN-2z
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:10:29 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-40a47e8e38dso505471cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690816225; x=1691421025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMmlT4xiGpOtC9VGm+XQXDU04xNWVwR28wOF8+RMY3s=;
        b=Y++IoCt4DRCFsvq0LcA2oo34SeicYFBVj7wGzcX/2KR+FrOmMIXEoAA0UUrnTXuM5l
         kG0d//PFEOd4YhsdzpGS3We2jvMrcURWB0Nl4WgdK+0/egyXYEIhbczttmN9c6j0yEls
         VyB5KKxCA0oAZ1zRHYqcVKQVo75Zdrw5iG12PAwDkb/Q0L94PoYf8idDKGtzFzKG8Hdg
         z4fYwAFuBHfWoAdfnh1i4qnMkgFdZAUxbJx+bUpGncVKjfC47HFf+bhts8PnoXJz5ehl
         8EqxeyW2oiWnWSY9alCF/zWuNY9qcZKhg3kAEcfUHfVSGCeUa2tyXQK5eOYJGEn7jpqt
         umIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690816225; x=1691421025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMmlT4xiGpOtC9VGm+XQXDU04xNWVwR28wOF8+RMY3s=;
        b=FtuaMk989UeMRPKCT+JeGHGiYcrmUN//+6wgEMPCO5oCnbGmnsgSEw8pssaOR7Z7Mx
         uK3vgD0wVNJ+gFRZkKYhMeW6S4dqoliFTsq7nek22MG2Ppjx1AYaca/JKZA3LxiwsEkV
         qvWkIFydlxWYOmNACLR8W3wk1sLaifzqxlIJjnfHMp+gGVbw2YBvjS0ozAYaYXcXDpUY
         fgbnJc8mSkFulk+32xSryrzmX6f/ozdmgRcaZn9jHRjryP2WMoyvTRqlVtJZR2Cvvyyw
         Y3nLE1Eeq1YpQxHyI8bkGzY/0la5ctSY+toyl9qwDXdldhxTpWhNMAMP39Bx5aZBV8Mu
         IHSw==
X-Gm-Message-State: ABy/qLa9xMtTL22adTG3ytIHeSgH0rAqufYxx6x3DqefiTWRd6NgsZwd
	llnknFmapS9er4AE7/rEE3EfOe2XG9bnUJdL9XthcA==
X-Google-Smtp-Source: APBJJlF80g4PGoUsmWgES6Mx7Q1A6B085YSp8JisqMkb362UzUiQDX1a393xdAlG961DXd2bHAapUHeUGEeS7d31Wfk=
X-Received: by 2002:a05:622a:188b:b0:403:a43d:bd7d with SMTP id
 v11-20020a05622a188b00b00403a43dbd7dmr426388qtc.4.1690816224935; Mon, 31 Jul
 2023 08:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com> <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
 <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com> <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com>
In-Reply-To: <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 31 Jul 2023 08:10:12 -0700
Message-ID: <CAP-5=fWwzuGZ6a6Z38ndsb7gw7_uwS0a2VGXx08hMeiK8eZ91w@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_081027_969415_2916024F 
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMzoyN+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAzMSwgMjAyMyBhdCAxMjox
NeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGkgSWFuLAo+ID4KPiA+IE9uIEZyaSwgSnVsIDI4LCAyMDIzIGF0IDc6NTPigK9QTSBJ
YW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUs
IEp1bCAyNywgMjAyMyBhdCA3OjI44oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IHJpc2N2IG5vdyBzdXBwb3J0cyBtbWFw
aW5nIGhhcmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRvCj4gPiA+ID4gdGFr
ZSBhZHZhbnRhZ2Ugb2YgdGhhdCBpbiBsaWJwZXJmLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gPiA+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+
IFJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiAt
LS0KPiA+ID4gPiAgdG9vbHMvbGliL3BlcmYvbW1hcC5jIHwgNjUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjUgaW5z
ZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYi9wZXJmL21t
YXAuYyBiL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gPiA+IGluZGV4IDBkMTYzNGNlZGY0NC4u
Mzc4YTE2M2YwNTU0IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+
ID4gPiA+ICsrKyBiL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gPiA+IEBAIC0zOTIsNiArMzky
LDcxIEBAIHN0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIp
Cj4gPiA+ID4KPiA+ID4gPiAgc3RhdGljIHU2NCByZWFkX3RpbWVzdGFtcCh2b2lkKSB7IHJldHVy
biByZWFkX3N5c3JlZyhjbnR2Y3RfZWwwKTsgfQo+ID4gPiA+Cj4gPiA+ID4gKyNlbGlmIF9fcmlz
Y3ZfeGxlbiA9PSA2NAo+ID4gPgo+ID4gPiBUaGlzIGlzIHNvbWV0aGluZyBvZiBhbiBvZGQgZ3Vh
cmQsIHBlcmhhcHM6Cj4gPiA+ICNlbGlmIGRlZmluZWQoX19yaXNjdikgJiYgX19yaXNjdl94bGVu
ID09IDY0Cj4gPiA+Cj4gPiA+IFRoYXQgd2F5IGl0IGlzIG1vcmUgaW50ZW50aW9uIHJldmVhbGlu
ZyB0aGF0IHRoaXMgaXMgcmlzY3YgY29kZS4gQ291bGQKPiA+ID4geW91IGFkZCBhIGNvbW1lbnQg
cmVsYXRpbmcgdG8gdGhlIF9fcmlzY3ZfeGxlbiA/Cj4gPgo+ID4gSSBndWVzcyBBbmRyZXcgYW5z
d2VyZWQgdGhhdCBhbHJlYWR5Lgo+ID4KCk5vdCBzdXJlLiBJIHN0aWxsIHRoaW5rIGl0IGxvb2tz
IHdlaXJkOgouLi4KI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykK
Li4uCiNlbGlmIGRlZmluZWQoX19hYXJjaDY0X18pCi4uLgojZWxpZiBfX3Jpc2N2X3hsZW4gPT0g
NjQKLi4uCiNlbHNlCnN0YXRpYyB1NjQgcmVhZF9wZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNv
dW50ZXIgX19tYXliZV91bnVzZWQpIHsgcmV0dXJuIDA7IH0Kc3RhdGljIHU2NCByZWFkX3RpbWVz
dGFtcCh2b2lkKSB7IHJldHVybiAwOyB9CiNlbmRpZgoKVGhlIGZpcnN0IHR3byBhcmUgY2xlYXJs
eSAjaWZkZWYtaW5nIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBhc3NlbWJseQpjb2RlLCB1bmRlciB3
aGF0IGNvbmRpdGlvbnMgSSBnZXQgUklTQy1WIGNvZGUgIMKvXCjjg4QpL8KvIEF0IGxlYXN0IHdv
cnRoCmEgY29tbWVudCBsaWtlICJjc3JyIGlzIG9ubHkgYXZhaWxhYmxlIHdoZW4geW91IGhhdmUg
eGxlbnMgb2YgNjQKYmVjYXVzZSAuLi4iCgo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiArLyogVE9E
TzogaW1wbGVtZW50IHJ2MzIgc3VwcG9ydCAqLwo+ID4gPiA+ICsKPiA+ID4gPiArI2RlZmluZSBD
U1JfQ1lDTEUgICAgICAweGMwMAo+ID4gPiA+ICsjZGVmaW5lIENTUl9USU1FICAgICAgIDB4YzAx
Cj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIGNzcl9yZWFkKGNzcikgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyh7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAg
ICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPiA+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNzcnIg
JTAsICIgI2NzciAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICAgICAgICAgICA6ICI9ciIgKF9f
dikgOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgICAg
ICAgICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gPgo+ID4gPiBUbyBhdm9pZCB0aGUgbWFjcm8gcGFzdGluZyB0aGF0IGNvdWxkIHBvdGVudGlh
bGx5IGdvIHdlaXJkLCBjb3VsZCB0aGlzIGJlOgo+ID4gPgo+ID4gPiBfX2FzbV9fIF9fdm9sYXRp
bGVfXyAoImNzcnIgJTAsICUxIiwKPiA+ID4gICA6ICI9ciIoX192KSAvKiBvdXRwdXRzICovCj4g
PiA+ICAgOiAiaSIoY3NyKSAvKiBpbnB1dHMgKi8KPiA+ID4gICA6ICJtZW1vcnkiIC8qIGNsb2Ji
ZXJzICovKQo+Cj4gRm9yZ290IHRvIGFuc3dlciB0aGlzIG9uZTogaXQgY29tcGlsZXMsIGJ1dCBJ
IGhhdmUgdG8gYWRtaXQgdGhhdCBJCj4gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgZGlmZmVyZW5jZSBh
bmQgaWYgdGhhdCdzIGNvcnJlY3QgKGFsbCBtYWNyb3MgaW4KPiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oIHVzZSAjIHRvIGRvIHRoaXMpIGFuZCB3aGF0IGJlbmVmaXRzIGl0Cj4gYnJpbmdz
LiBDYW4geW91IGVsYWJvcmF0ZSBtb3JlIG9uIHRoaW5ncyB0aGF0IGNvdWxkICJnbyB3ZWlyZCI/
CgpTbyByYXRoZXIgdGhhbiB1c2UgYW4gaW5wdXQgY29uc3RyYWludCBmb3IgdGhlIGFzbSBibG9j
ayB5b3UgYXJlIHVzaW5nCnRoZSBDIHByZXByb2Nlc3NvciB0byBwYXN0ZSBpbiB0aGUgY3NyIGFy
Z3VtZW50LiBJZiBjc3IgaXMgc29tZXRoaW5nCmxpa2UgIjEiIHRoZW4gaXQgbG9va3MgZ29vZCBh
bmQgeW91J2xsIGdldCAiY3NyciAlMCwxIi4gSWYgeW91IHBhc3MKc29tZXRoaW5nIGxpa2UgIjEg
PDwgMzEiIHRoZW4gdGhhdCB3aWxsIGJlIHBhc3RlZCBhcyAiY3NyciAlMCwgMSA8PAozMSIgYW5k
IHRoYXQgc3RhcnRzIHRvIGdldCB3ZWlyZCBpbiB0aGUgY29udGV4dCBvZiBiZWluZyBpbiB0aGUK
YXNzZW1ibGVyIHdoZXJlIGl0IGlzIHVubGlrZWx5IHRoZSBDIG9wZXJhdG9ycyB3b3JrLiBVc2lu
ZyB0aGUgaW5wdXQKY29uc3RyYWludCBhdm9pZHMgdGhpcywgY2F1c2VzIHRoZSBDIGNvbXBpbGVy
IHRvIGNoZWNrIHRoZSB0eXBlIG9mIHRoZQphcmd1bWVudCBhbmQgeW91J2xsIHByb2JhYmx5IGdl
dCBtb3JlIGludGVsbGlnaWJsZSBlcnJvciBtZXNzYWdlcyBhcyBhCmNvbnNlcXVlbmNlLgoKPgo+
IFRoYW5rcyBhZ2FpbiwKPgo+IEFsZXgKPgo+ID4gPgo+ID4gPiBBbHNvLCB3aHkgaXMgdGhpcyBj
bG9iYmVyaW5nIG1lbW9yeT8gV29ydGggYWRkaW5nIGEgY29tbWVudC4KPiA+Cj4gPiBObyBpZGVh
LCBJIHNlZSB0aGF0IGl0IGlzIGFsc28gZG9uZSB0aGlzIHdheSBpbgo+ID4gYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jc3IuaC4gQEF0aXNoIEt1bWFyIFBhdHJhICwgQFBhbG1lciBEYWJiZWx0ID8K
Ckl0IHdvdWxkIHNlZW0gdG8gbWFrZSBzZW5zZSB0aGVuIG5vdCB0byBoYXZlIGEgbWVtb3J5IGNv
bnN0cmFpbnQgdW50aWwKd2Uga25vdyB3aHkgd2UncmUgZG9pbmcgaXQ/CgpUaGFua3MsCklhbgoK
PiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMhCj4gPgo+ID4gQWxleAo+ID4KPiA+ID4K
PiA+ID4gVGhhbmtzLAo+ID4gPiBJYW4KPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAgICAgIF9f
djsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICt9
KQo+ID4gPiA+ICsKPiA+ID4gPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY3NyX3JlYWRfbnVtKGlu
dCBjc3JfbnVtKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVh
ZChfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgICAge1wKPiA+ID4gPiArICAgICAgIGNhc2UgX19j
c3JfbnVtOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAg
ICAgICAgICAgX192YWwgPSBjc3JfcmVhZChfX2Nzcl9udW0pOyAgICAgICAgICAgIFwKPiA+ID4g
PiArICAgICAgICAgICAgICAgYnJlYWs7IH0KPiA+ID4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nz
cl9yZWFkXzIoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ID4gPiA+ICsgICAgICAgc3dp
dGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICAgIFwKPiA+ID4gPiAr
ICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtICsgMSwgX192YWwpfQo+ID4gPiA+
ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAg
IHtcCj4gPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMCwg
X192YWwpICAgICAgXAo+ID4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8yKF9fY3Ny
X251bSArIDIsIF9fdmFsKX0KPiA+ID4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgo
X19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ID4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9j
c3JfcmVhZF80KF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgIFwKPiA+ID4gPiArICAgICAgIHN3
aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0gKyA0LCBfX3ZhbCl9Cj4gPiA+ID4gKyNkZWZp
bmUgc3dpdGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAge1wKPiA+
ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkg
ICAgICBcCj4gPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVtICsg
OCwgX192YWwpfQo+ID4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIoX19jc3Jf
bnVtLCBfX3ZhbCkgICAgICAgIHtcCj4gPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFk
XzE2KF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgXAo+ID4gPiA+ICsgICAgICAgc3dpdGNoY2Fz
ZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0gKyAxNiwgX192YWwpfQo+ID4gPiA+ICsKPiA+ID4gPiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0ID0gMDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBz
d2l0Y2ggKGNzcl9udW0pIHsKPiA+ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIo
Q1NSX0NZQ0xFLCByZXQpCj4gPiA+ID4gKyAgICAgICBkZWZhdWx0Ogo+ID4gPiA+ICsgICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAg
ICByZXR1cm4gcmV0Owo+ID4gPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMgo+ID4g
PiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF8xNgo+ID4gPiA+ICsjdW5kZWYgc3dpdGNo
Y2FzZV9jc3JfcmVhZF84Cj4gPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzQKPiA+
ID4gPiArI3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMgo+ID4gPiA+ICsjdW5kZWYgc3dpdGNo
Y2FzZV9jc3JfcmVhZAo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgdTY0IHJl
YWRfcGVyZl9jb3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVyKQo+ID4gPiA+ICt7Cj4gPiA+ID4g
KyAgICAgICByZXR1cm4gY3NyX3JlYWRfbnVtKENTUl9DWUNMRSArIGNvdW50ZXIpOwo+ID4gPiA+
ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgdTY0IHJlYWRfdGltZXN0YW1wKHZvaWQpCj4g
PiA+ID4gK3sKPiA+ID4gPiArICAgICAgIHJldHVybiBjc3JfcmVhZF9udW0oQ1NSX1RJTUUpOwo+
ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICAjZWxzZQo+ID4gPiA+ICBzdGF0aWMgdTY0IHJl
YWRfcGVyZl9jb3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVyIF9fbWF5YmVfdW51c2VkKSB7IHJl
dHVybiAwOyB9Cj4gPiA+ID4gIHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1
cm4gMDsgfQo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zOS4yCj4gPiA+ID4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
