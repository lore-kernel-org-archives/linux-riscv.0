Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39573C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaJfaJjnR78oJpkwLx7WeaMMf0epWO0bJOS7Ip/hci8=; b=E082vCcShlAqZO
	W/qyAlMSkODVJ1iBiKGy2Pkut/+T4mkAFNDEBErcEm1KLIBRIHmvhJfAzjwSHqPU3E/JgLRzy2wx+
	1wxHc6XK4hyDVln6ye+zMDYR0CkPlxIdE7drdWeEr8wy3g7kiJobsia9Av9cFMnvH1YZ2fcenIt2I
	xeF+rI7004w8G9q1NlNgqDu37g3xWpUItVZIHTP8ZebCUubSKNGuRt8lf4+dDibvB2ZQYhTRxHnoc
	eWEhSDETMOeqHq+tciJpXG4cKX91xebLnjl3u+pO8PDCj3WjcNconGma78uLP/lzv5X9bx74dclqg
	+GveryKCNdRmhxmqQXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQ8C-00F1yS-1t;
	Mon, 31 Jul 2023 10:28:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQ89-00F1sO-0R
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 10:28:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3177163aa97so4600267f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690799277; x=1691404077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML7AinUDVA2CqBB8483zq1nBkxRS460v6WFiKGGmbXw=;
        b=HDjhzaPlqiuA0S3baU9N7AYN1C6DUjgtDALoeJq5aufWUnbgGfC7ri/9FPQIqGzKbr
         a4Svo1r7W9I/U45tg6vynpKwViqCyi560TPOCUdBIv3WicpMwGVfcjERyOxlBw+mNugr
         D3TNX+y/ZS8TAIXOc5N7gD6//JnB8rEIaEJ6+MldyvnVb3drV/zksbkcg/thXeyRtqn0
         E6NIZzlCLOeAaX7g0CxdtVFcKfhts6SI//feucztq+DAw0weSyfty0scu1tLedenORu6
         ASq+u0mArosRDhMuUYuo1tU82hiiEaKFG2lb9u0XQJ4fsvOEsGH3dBJsFjAQjAjI/3nM
         4CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690799277; x=1691404077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML7AinUDVA2CqBB8483zq1nBkxRS460v6WFiKGGmbXw=;
        b=EWNwwqiR20ABpjeeg2lFCE3PGCDZVXcNV7ukS5zxRB8YwKUGj+sJj4i/UQXyVsM++i
         9qkyrqe/3/xsyRAQ7I7hFtddSxFmhkquB9niultBXXh3DjvkekGiBAbteEaLd90DYE8J
         I6oXdbQkZZxMSmwcpYUaLwqcto6fUqfn/d0QkrGR2iYfnenBOm+P88AK4GA/lW7+A6rn
         5njmhKQLWjm05w+aqDY0nhfhhYrIoOoSzE5p+RLuxckc3umLsgjmPiV1fVTEe820OB8g
         b/WvdsQy0nBQV9pUiIiolPnTxzilWjgbugWec4wQ8Q3PRb6jzRkDf6Q9t76CL/T/9+ja
         QrJw==
X-Gm-Message-State: ABy/qLa8yWjQRvRiTEG5pAfbHoBGrwB0DfVpgqtTHukbt1nHc90hCY/H
	gqXMxjsRxwMwxkarXaTLdXoYGa/Z1TsKZDKEZKUlhA==
X-Google-Smtp-Source: APBJJlEhaO5lz0dS3gmvYAUrPoGWqkGephnAst4AFjzfN8FgSJ7PtOXovOzb/eZPxNwPZcjK76ztR3OHJOwHd8MDE7g=
X-Received: by 2002:a5d:554b:0:b0:317:6816:578c with SMTP id
 g11-20020a5d554b000000b003176816578cmr8613111wrw.5.1690799277292; Mon, 31 Jul
 2023 03:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
 <20230727141428.962286-10-alexghiti@rivosinc.com> <CAP-5=fU5XYXrVnRUidpwjV2LiTsdebfidL43_Qo4Z7TBxMsVGA@mail.gmail.com>
 <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
In-Reply-To: <CAHVXubgVAe1WsiZx5Ay+3KPK4u24k_vsnTwFFmBeVsHrGXwhfw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 31 Jul 2023 12:27:46 +0200
Message-ID: <CAHVXubj80rQRShuDS09BeTrfR6nux0A68EMWLbeat8fd_Y3YdA@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
To: Ian Rogers <irogers@google.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
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
X-CRM114-CacheID: sfid-20230731_032801_194922_2D5CF21B 
X-CRM114-Status: GOOD (  30.94  )
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMTI6MTXigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgSWFuLAo+Cj4gT24gRnJpLCBKdWwgMjgs
IDIwMjMgYXQgNzo1M+KAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNzoyOOKAr0FNIEFsZXhhbmRyZSBHaGl0
aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IHJpc2N2IG5vdyBz
dXBwb3J0cyBtbWFwaW5nIGhhcmR3YXJlIGNvdW50ZXJzIHNvIGFkZCB3aGF0J3MgbmVlZGVkIHRv
Cj4gPiA+IHRha2UgYWR2YW50YWdlIG9mIHRoYXQgaW4gbGlicGVyZi4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4g
PiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+
ID4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiAt
LS0KPiA+ID4gIHRvb2xzL2xpYi9wZXJmL21tYXAuYyB8IDY1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRp
b25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS90b29scy9saWIvcGVyZi9tbWFwLmMgYi90
b29scy9saWIvcGVyZi9tbWFwLmMKPiA+ID4gaW5kZXggMGQxNjM0Y2VkZjQ0Li4zNzhhMTYzZjA1
NTQgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL2xpYi9wZXJmL21tYXAuYwo+ID4gPiArKysgYi90
b29scy9saWIvcGVyZi9tbWFwLmMKPiA+ID4gQEAgLTM5Miw2ICszOTIsNzEgQEAgc3RhdGljIHU2
NCByZWFkX3BlcmZfY291bnRlcih1bnNpZ25lZCBpbnQgY291bnRlcikKPiA+ID4KPiA+ID4gIHN0
YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1cm4gcmVhZF9zeXNyZWcoY250dmN0
X2VsMCk7IH0KPiA+ID4KPiA+ID4gKyNlbGlmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ID4KPiA+IFRo
aXMgaXMgc29tZXRoaW5nIG9mIGFuIG9kZCBndWFyZCwgcGVyaGFwczoKPiA+ICNlbGlmIGRlZmlu
ZWQoX19yaXNjdikgJiYgX19yaXNjdl94bGVuID09IDY0Cj4gPgo+ID4gVGhhdCB3YXkgaXQgaXMg
bW9yZSBpbnRlbnRpb24gcmV2ZWFsaW5nIHRoYXQgdGhpcyBpcyByaXNjdiBjb2RlLiBDb3VsZAo+
ID4geW91IGFkZCBhIGNvbW1lbnQgcmVsYXRpbmcgdG8gdGhlIF9fcmlzY3ZfeGxlbiA/Cj4KPiBJ
IGd1ZXNzIEFuZHJldyBhbnN3ZXJlZCB0aGF0IGFscmVhZHkuCj4KPiA+Cj4gPiA+ICsKPiA+ID4g
Ky8qIFRPRE86IGltcGxlbWVudCBydjMyIHN1cHBvcnQgKi8KPiA+ID4gKwo+ID4gPiArI2RlZmlu
ZSBDU1JfQ1lDTEUgICAgICAweGMwMAo+ID4gPiArI2RlZmluZSBDU1JfVElNRSAgICAgICAweGMw
MQo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIGNzcl9yZWFkKGNzcikgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsoeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgcmVn
aXN0ZXIgdW5zaWduZWQgbG9uZyBfX3Y7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiA+ICsgICAgICAgICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNzcnIgJTAsICIgI2Nz
ciAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgOiAiPXIiIChfX3YpIDogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICAgOiAibWVt
b3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPgo+ID4gVG8gYXZv
aWQgdGhlIG1hY3JvIHBhc3RpbmcgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBnbyB3ZWlyZCwgY291
bGQgdGhpcyBiZToKPiA+Cj4gPiBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNzcnIgJTAsICUxIiwK
PiA+ICAgOiAiPXIiKF9fdikgLyogb3V0cHV0cyAqLwo+ID4gICA6ICJpIihjc3IpIC8qIGlucHV0
cyAqLwo+ID4gICA6ICJtZW1vcnkiIC8qIGNsb2JiZXJzICovKQoKRm9yZ290IHRvIGFuc3dlciB0
aGlzIG9uZTogaXQgY29tcGlsZXMsIGJ1dCBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJCmRvbid0IHVu
ZGVyc3RhbmQgdGhlIGRpZmZlcmVuY2UgYW5kIGlmIHRoYXQncyBjb3JyZWN0IChhbGwgbWFjcm9z
IGluCmFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggdXNlICMgdG8gZG8gdGhpcykgYW5kIHdo
YXQgYmVuZWZpdHMgaXQKYnJpbmdzLiBDYW4geW91IGVsYWJvcmF0ZSBtb3JlIG9uIHRoaW5ncyB0
aGF0IGNvdWxkICJnbyB3ZWlyZCI/CgpUaGFua3MgYWdhaW4sCgpBbGV4Cgo+ID4KPiA+IEFsc28s
IHdoeSBpcyB0aGlzIGNsb2JiZXJpbmcgbWVtb3J5PyBXb3J0aCBhZGRpbmcgYSBjb21tZW50Lgo+
Cj4gTm8gaWRlYSwgSSBzZWUgdGhhdCBpdCBpcyBhbHNvIGRvbmUgdGhpcyB3YXkgaW4KPiBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oLiBAQXRpc2ggS3VtYXIgUGF0cmEgLCBAUGFsbWVyIERh
YmJlbHQgPwo+Cj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQo+Cj4gQWxleAo+Cj4gPgo+ID4g
VGhhbmtzLAo+ID4gSWFuCj4gPgo+ID4gPiArICAgICAgICAgICAgICAgIF9fdjsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArfSkKPiA+ID4gKwo+ID4g
PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgY3NyX3JlYWRfbnVtKGludCBjc3JfbnVtKQo+ID4gPiAr
ewo+ID4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkKF9fY3NyX251bSwgX192YWwpICAg
ICAgICAgICB7XAo+ID4gPiArICAgICAgIGNhc2UgX19jc3JfbnVtOiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgICAgIF9fdmFsID0gY3NyX3JlYWQo
X19jc3JfbnVtKTsgICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICAgICBicmVhazsgfQo+
ID4gPiArI2RlZmluZSBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzIoX19jc3JfbnVtLCBfX3ZhbCkgICAg
ICAgICB7XAo+ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWQoX19jc3JfbnVtICsgMCwg
X192YWwpICAgICAgICBcCj4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9u
dW0gKyAxLCBfX3ZhbCl9Cj4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nz
cl9udW0sIF9fdmFsKSAgICAgICAgIHtcCj4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVh
ZF8yKF9fY3NyX251bSArIDAsIF9fdmFsKSAgICAgIFwKPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNl
X2Nzcl9yZWFkXzIoX19jc3JfbnVtICsgMiwgX192YWwpfQo+ID4gPiArI2RlZmluZSBzd2l0Y2hj
YXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVtLCBfX3ZhbCkgICAgICAgICB7XAo+ID4gPiArICAgICAg
IHN3aXRjaGNhc2VfY3NyX3JlYWRfNChfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgICBcCj4gPiA+
ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF80KF9fY3NyX251bSArIDQsIF9fdmFsKX0KPiA+
ID4gKyNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZF8xNihfX2Nzcl9udW0sIF9fdmFsKSAgICAg
ICAge1wKPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzgoX19jc3JfbnVtICsgMCwg
X192YWwpICAgICAgXAo+ID4gPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRfOChfX2Nzcl9u
dW0gKyA4LCBfX3ZhbCl9Cj4gPiA+ICsjZGVmaW5lIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIoX19j
c3JfbnVtLCBfX3ZhbCkgICAgICAgIHtcCj4gPiA+ICsgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVh
ZF8xNihfX2Nzcl9udW0gKyAwLCBfX3ZhbCkgICAgIFwKPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNl
X2Nzcl9yZWFkXzE2KF9fY3NyX251bSArIDE2LCBfX3ZhbCl9Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICB1bnNpZ25lZCBsb25nIHJldCA9IDA7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBzd2l0Y2ggKGNz
cl9udW0pIHsKPiA+ID4gKyAgICAgICBzd2l0Y2hjYXNlX2Nzcl9yZWFkXzMyKENTUl9DWUNMRSwg
cmV0KQo+ID4gPiArICAgICAgIGRlZmF1bHQ6Cj4gPiA+ICsgICAgICAgICAgICAgICBicmVhazsK
PiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXR1cm4gcmV0Owo+ID4gPiAr
I3VuZGVmIHN3aXRjaGNhc2VfY3NyX3JlYWRfMzIKPiA+ID4gKyN1bmRlZiBzd2l0Y2hjYXNlX2Nz
cl9yZWFkXzE2Cj4gPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF84Cj4gPiA+ICsjdW5k
ZWYgc3dpdGNoY2FzZV9jc3JfcmVhZF80Cj4gPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVh
ZF8yCj4gPiA+ICsjdW5kZWYgc3dpdGNoY2FzZV9jc3JfcmVhZAo+ID4gPiArfQo+ID4gPiArCj4g
PiA+ICtzdGF0aWMgdTY0IHJlYWRfcGVyZl9jb3VudGVyKHVuc2lnbmVkIGludCBjb3VudGVyKQo+
ID4gPiArewo+ID4gPiArICAgICAgIHJldHVybiBjc3JfcmVhZF9udW0oQ1NSX0NZQ0xFICsgY291
bnRlcik7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAo
dm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICByZXR1cm4gY3NyX3JlYWRfbnVtKENTUl9USU1F
KTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgI2Vsc2UKPiA+ID4gIHN0YXRpYyB1NjQgcmVhZF9w
ZXJmX2NvdW50ZXIodW5zaWduZWQgaW50IGNvdW50ZXIgX19tYXliZV91bnVzZWQpIHsgcmV0dXJu
IDA7IH0KPiA+ID4gIHN0YXRpYyB1NjQgcmVhZF90aW1lc3RhbXAodm9pZCkgeyByZXR1cm4gMDsg
fQo+ID4gPiAtLQo+ID4gPiAyLjM5LjIKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
