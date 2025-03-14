Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E391C28B2F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM3aV6wrcz1umHhtPw1uB+8JPRyEx6l90wWHniR8uM4=; b=e0OgSIOhKzIlTS
	DL8QFLN3PeYa0Avxq+hF+joWuhVIiOqEveQ+43cYI5+URMBq7VKaSZub0dQ2Re8qhJWl3yI+ZQnTC
	MFlR9fbOTFhFRjSRINZa3J7kFesKEb5yrKzxnBSgIK8PBGZpfmONlq7wQ1gwcnZLzgbRhjCG0Iuy/
	COOHjnJ1+cap3qoLNcn9X6elwTFmZYrBB9IShUQT278AByIS6V1kCLD9IicFK78nVKxgZqceNHzLm
	UQB/qfhDdBQwr0ccSua+wpt6M8u3Xz85uTWYNoFSV86a3HdamMlmVJ1HOYJl2lPJEeM/X3RwqZGMf
	bVu4g1H50Ag5nxnxi2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3LV-0000000E1D0-1tbU;
	Fri, 14 Mar 2025 11:36:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt36V-0000000Dz60-1K2y
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:21:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43948021a45so17778245e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741951286; x=1742556086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6XtzYhqUw84uSezb9doRczkUr+a5kXQaPrl1FQvJuA=;
        b=c2dIb5XKJ905mI07O9avDh33FN6bEiJAcomMRSk5GF2ua2hCsp8oxKQtPYmYgmIyp8
         gnpGwIEQvi8D7XgDDNpAGkWsB5PYWd2PacZIf+udp/0cd0h+yiL1uTZ+tvwy8Tw2Hhfe
         4GxSlXnqFnWL1LUa82FMF8SXazW8vg6SEwWFXXVindI+97iMyOn1hZR4nnGQgYe828vh
         PIJA/MD6Apu2YKvIZYxVekm5qo9YI3RPOyvPFHrCS/j9kQdPfBs53V/wMfceBouk/0zc
         BDdPO5alhA15mfT1utEgbD3+V0O5EkKabKAA83K2nKhn87YP4jNqYtYLbFouXqwheJju
         Uebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951286; x=1742556086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6XtzYhqUw84uSezb9doRczkUr+a5kXQaPrl1FQvJuA=;
        b=XNz6gTxwKjf1M22YYobN9onpYAFqJ6yHihKg46apXebkcEF9ImcCG/vZQ+lDEFL6tR
         VZ10L8ppsPuXX3n3myC3JYHPa0XyQ8KGSwdnw7eQ6U6ERDOaBSnWwX07JyOJ/Vk8v6Q3
         tqK8NyBBsqasw0f4mSBKI84qh0jrTmQd8OWXvuHB4/FT+cG7SSrvZPuLGYV+AtEdJUaH
         aFojDKsVC995w4rCknlKZcWFOmjX7jdrRUXbC79TTbC0K6vuJsPGuu4tnrAG+lqJ1MKB
         BndLtToRPd4lSct14QO62pF053moc907EDAGUrdGB440V2ZuXYa/GPRQJ2Om2QLks7F7
         BLfA==
X-Forwarded-Encrypted: i=1; AJvYcCUbi+XtvPpQgOqsAUR5lZeDD3o++kdkkzo1eTmVH6GmUAsLdjerneqHbqUD2rpPu5/uD0bGuqElleVCjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Lp8RF0nShIeTvN85fBloQKweCzwyGEn9VZMyPvG0/yyKn97X
	PLjeMrR5LDnmdiVKpv+mDD1VmAdmI4mSux0+xjwAt6wITxQuWKoA6qarJ+vd1vonJIvwhK7cu8K
	qTWU=
X-Gm-Gg: ASbGncudKLmSCvTiNue7BcEF69TrGNz9D9Vc715mW5z80iiK9C6NeF1sRQeSJNWrAYv
	rIIIVDQ8WsLHrJvbR0BeSXgW7TzgOCe9jywqi18UZCnP1UIQRTjXKK8EYLjT7ag9CTnpRuGtVMf
	CPffugI3DqlYqlMGiHh6sDuHflkW+FbfUO9S4EYVLeRmdXDaEi93i8vMrveS9McJJc5N9nZrEP6
	FMPE5hCXkkc5g9vTxX+4DLrKlg60W8vLK+3u+Sk3HFEShJtxHccj2jUmK5ixAF07j75Ot84oMxL
	SiQqT7+MGTU39kuYTeBH+5HRH6mIdH89wpsTtZYGJWcpKwFFM2OR5v/vt41GU1tmFaBSWeDnhhb
	A/6utBz+jgYC8Ww==
X-Google-Smtp-Source: AGHT+IEYaWqqZpuQnf2ljZyi0dtBkuDfK6pK0aoroD3vMSUCfCqdnElivAtTAt81Xq+zCSEqCysJ0Q==
X-Received: by 2002:a05:600c:190e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d1ec808ebmr27086195e9.13.1741951285516;
        Fri, 14 Mar 2025 04:21:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm14341405e9.28.2025.03.14.04.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:21:25 -0700 (PDT)
Message-ID: <c411446b-e161-48fa-a94b-e04c00f62b01@rivosinc.com>
Date: Fri, 14 Mar 2025 12:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-4-cleger@rivosinc.com>
 <20250313-ce439653d16b484dba6a8d3e@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-ce439653d16b484dba6a8d3e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_042127_360167_C08A085D 
X-CRM114-Status: GOOD (  16.30  )
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

CgpPbiAxMy8wMy8yMDI1IDEzOjQ0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTBQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgRldGVCBleHRlbnNpb24gY2FsbHMuIFRoaXMgd2lsbCBiZSByYXRpZmllZCBpbiBTQkkgVjMu
MCBoZW5jZSwgaXQgaXMKPj4gcHJvdmlkZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQgdGhhdCBjYW4g
YmUgbGVmdCBvdXQgaWYgbmVlZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+PiBpbmRleCAy
NTY5MTBkYjEzMDcuLmFmOGUyMTk5ZTMyZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc2JpLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4gQEAgLTI5OSw5ICsy
OTksMTkgQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVj
dCBjcHVtYXNrICpjcHVfbWFzaywKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+PiArc3RhdGlj
IGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOwo+PiArCj4+ICBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBm
ZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKPj4gIHsKPj4gLQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4+ICsKPj4gKwlpZiAoIXNiaV9md2Z0X3N1cHBv
cnRlZCkKPj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiArCj4+ICsJcmV0ID0gc2JpX2VjYWxs
KFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX0dFVCwKPj4gKwkJCWZlYXR1cmUsIDAsIDAsIDAs
IDAsIDApOwo+PiArCj4+ICsJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJv
cik7Cj4+ICB9Cj4+ICAKPj4gIC8qKgo+PiBAQCAtMzE0LDcgKzMyNCwxNSBAQCBpbnQgc2JpX2Z3
ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKPj4gICAqLwo+PiAgaW50
IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQg
bG9uZyBmbGFncykKPj4gIHsKPj4gLQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsJc3RydWN0IHNi
aXJldCByZXQ7Cj4+ICsKPj4gKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKPj4gKwkJcmV0dXJu
IC1FT1BOT1RTVVBQOwo+PiArCj4+ICsJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJ
X0VYVF9GV0ZUX1NFVCwKPj4gKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7Cj4+
ICsKPj4gKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKPiAKPiBz
YmlfZXJyX21hcF9saW51eF9lcnJubygpIGRvZXNuJ3Qga25vdyBhYm91dCBTQklfRVJSX0RFTklF
RF9MT0NLRUQuCgpOb3Qgb25seSBpdCBkb2Vzbid0IGtub3dzIGFib3V0IERFTklFRF9MT0NLRUQg
YnV0IGFsc28gYW5vdGhlciBidW5jaCBvZgplcnJvcnMuIEknbGwgYWRkIHRoZW0gaW4gYSBzZXBh
cmF0ZSBjb21taXQuCgo+IAo+PiAgfQo+PiAgCj4+ICBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKPj4g
QEAgLTM4OSw2ICs0MDcsOSBAQCBzdGF0aWMgaW50IHNiaV9md2Z0X2ZlYXR1cmVfbG9jYWxfc2V0
KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLAo+PiAgaW50IHNiaV9md2Z0X2FsbF9j
cHVzX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBm
bGFncywKPj4gIAkJCSAgYm9vbCByZXZlcnRfb25fZmFpbCkKPj4gIHsKPj4gKwlpZiAoIXNiaV9m
d2Z0X3N1cHBvcnRlZCkKPj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiArCj4+ICAJaWYgKGZl
YXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCj4+ICAJCXJldHVybiBzYmlfZndm
dF9zZXQoZmVhdHVyZSwgdmFsdWUsIGZsYWdzKTsKPj4gIAo+PiBAQCAtNzE5LDYgKzc0MCwxMSBA
QCB2b2lkIF9faW5pdCBzYmlfaW5pdCh2b2lkKQo+PiAgCQkJcHJfaW5mbygiU0JJIERCQ04gZXh0
ZW5zaW9uIGRldGVjdGVkXG4iKTsKPj4gIAkJCXNiaV9kZWJ1Z19jb25zb2xlX2F2YWlsYWJsZSA9
IHRydWU7Cj4+ICAJCX0KPj4gKwkJaWYgKChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJz
aW9uKDIsIDApKSAmJgo+IAo+IFNob3VsZCBjaGVjayBzYmlfbWtfdmVyc2lvbigzLCAwKQoKT2gg
eWVzIHRoYXQgd2FzIGZvciB0ZXN0aW5nIHB1cnBvc2UgYW5kIEkgaW5jb3JyZWN0bHkgc3F1YXNo
ZWQgaXQuCgo+IAo+PiArCQkgICAgKHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9GV0ZUKSA+
IDApKSB7Cj4+ICsJCQlwcl9pbmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwo+
PiArCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsKPj4gKwkJfQo+PiAgCX0gZWxzZSB7Cj4+
ICAJCV9fc2JpX3NldF90aW1lciA9IF9fc2JpX3NldF90aW1lcl92MDE7Cj4+ICAJCV9fc2JpX3Nl
bmRfaXBpCT0gX19zYmlfc2VuZF9pcGlfdjAxOwo+PiAtLSAKPj4gMi40Ny4yCj4+Cj4gCgpUaGFu
a3MsCgpDbMOpbWVudAoKPiBUaGFua3MsCj4gZHJldwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
