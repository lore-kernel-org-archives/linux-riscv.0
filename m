Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FAEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwA6zzoYKYPK5gInuWgOW1rY0QI+ou7Zm4LUgj9WpvQ=; b=GAftJJVqSjppYF
	p48xS+QYLUebSbcMxqKI4R5LhHbX6SM25c5yXwf7znRq4GcaJK7BPdvR17ct3eQkTaQja5I0iwNc7
	608YTWc8yuAlE94vRmQhfSOlSc1qDCXWjy5UyhEE0Q6ONlzBip5wYnK2oYXoDZmAya/EJEEy+uP91
	TpP/OzrisOpG2YU9s+W5eLxs2Zublxuv87MbR1wHUGW85Ml09i9XZFsNUqDSinWmVPJ5Wzrcd2J0a
	s8Uz9VFVcqmcq/POMDmF7UUEjwODCzf9emoJzxOPkM2SFe3k6VvAjAYwWsd4O/gnv9ZHTzLX9I0OP
	zqmYEmEiHmIQ9srgtJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Czw-0000000ABUH-3TKc;
	Wed, 01 May 2024 16:40:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Czs-0000000ABTf-3bQj
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 16:39:58 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2b37731c118so210051a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714581594; x=1715186394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atYkm9Bv1WMdbMlr9D036H2OQplmZ+kaXzy56fOOTJk=;
        b=PjPEX7mJ1xhtJ+GignlDfRnQEPgVXesqcPth2PLRAxGpejU3hW87vpNlhP3yI873zd
         yVhNxhyo02GRDh4Tm8XGfXhtEKliTDIlVcMP+W9aoeRcD7WaeowPtcro4th/m/wiLRDG
         vR1LgjHxk6/5s7Oh6gzi8wS6vlaATAbNdq5Z2KO2wj3gsWH55+XQX4Mgn8Dh9X/LRcJs
         n3w6C4+Y8F9oKrTKlzVe0nUgwSXST7AebasrfLDSNvNqCpvIf2mZOVtbS2eLAL3GBs12
         h8KOlzjOrlsCkpCWHngjTjAX8gzXyGdaEOrR6U9pnI83N8JvgkReJ9CXGSWsIVg8RK8P
         WtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714581594; x=1715186394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atYkm9Bv1WMdbMlr9D036H2OQplmZ+kaXzy56fOOTJk=;
        b=jLKn0OCnc9ZN0+TqCpXbrEpERnPLQrJkX5dtQ2/ZBi9U7ciuvlG5MbapKVjr8LcLvp
         gn03SaSzHozy1S2E3QNLPMKjyaUIc4pA6FK2D4EqTfZmirGBa76WyJ/AvyXIyyeMCpBA
         iAahVObupaQgGr/h3MI7Fs0ERUAowS6/ZZDYpobwb4Gwl6YZajSi5FQOqZRQnizG8rY9
         /dIG1g2FSvtglSkTR8gsndUMqxOagPtuMLlAogA0mpBzNCPms1fp+g+nzAEb+cvGMqWq
         8JUQq047yX5phnyWxBhN1zuEAG/w6yz6CTAT6oWcNJ8lKG64vFnmRXPqKwpCFbwAsCOc
         A2qA==
X-Forwarded-Encrypted: i=1; AJvYcCV7pXmwyrPvsxKCwTd7+1TQLJQUNCbCdElrIGo6gb8S1U/yXWc+n3n3Oo7/SMUabgjz+GLkUL/0fVGGZBeF9Va6vODD1G3/xr7bvhOzjPM6
X-Gm-Message-State: AOJu0YzYyO3YX1GojaEYl8cTKgMJRCmtmk3xQc/ZpR8SjcGNZ4Jsx+Am
	5SClWfzY26v5wo+Qo6e/M2b0EEAtDkDiHLomt8DDxnd+w5LwI/eBNSn31hdz7+x/kFEvmDh/EJA
	X44mQa9BIZQhuQwUpOAQ0QtXiN4E=
X-Google-Smtp-Source: AGHT+IH9qVt/8p/ZzN/bKmmQQSZrFPfCdVcRg2/ZJQ47K9yCmaJysyJJWGSuxK+4eLs3XYg++rCaK5WXpND3Jm9u4Iw=
X-Received: by 2002:a17:90a:af8f:b0:2b2:7e94:c5e0 with SMTP id
 w15-20020a17090aaf8f00b002b27e94c5e0mr3030873pjq.20.1714581594182; Wed, 01
 May 2024 09:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240430175834.33152-1-puranjay@kernel.org> <20240430175834.33152-2-puranjay@kernel.org>
In-Reply-To: <20240430175834.33152-2-puranjay@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 May 2024 09:39:42 -0700
Message-ID: <CAEf4Bzb2NY+wuK159Xb8F9Nu4CuVoYJ6WWR3_0LeTAi+zONewQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] riscv, bpf: add internal-only MOV
 instruction to resolve per-CPU addrs
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huawei.com>, puranjay12@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_093956_931052_419AA8E2 
X-CRM114-Status: GOOD (  23.42  )
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

T24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMTA6NTjigK9BTSBQdXJhbmpheSBNb2hhbiA8cHVyYW5q
YXlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBTdXBwb3J0IGFuIGluc3RydWN0aW9uIGZvciByZXNv
bHZpbmcgYWJzb2x1dGUgYWRkcmVzc2VzIG9mIHBlci1DUFUKPiBkYXRhIGZyb20gdGhlaXIgcGVy
LUNQVSBvZmZzZXRzLiBUaGlzIGluc3RydWN0aW9uIGlzIGludGVybmFsLW9ubHkgYW5kCj4gdXNl
cnMgYXJlIG5vdCBhbGxvd2VkIHRvIHVzZSB0aGVtIGRpcmVjdGx5LiBUaGV5IHdpbGwgb25seSBi
ZSB1c2VkIGZvcgo+IGludGVybmFsIGlubGluaW5nIG9wdGltaXphdGlvbnMgZm9yIG5vdyBiZXR3
ZWVuIEJQRiB2ZXJpZmllciBhbmQgQlBGCj4gSklUcy4KPgo+IFJJU0MtViB1c2VzIGdlbmVyaWMg
cGVyLWNwdSBpbXBsZW1lbnRhdGlvbiB3aGVyZSB0aGUgb2Zmc2V0cyBmb3IgQ1BVcwo+IGFyZSBr
ZXB0IGluIGFuIGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV9udW1iZXJdLiBSSVND
ViBzdG9yZXMKPiB0aGUgYWRkcmVzcyBvZiB0aGUgdGFza19zdHJ1Y3QgaW4gVFAgcmVnaXN0ZXIu
IFRoZSBmaXJzdCBlbGVtZW50IGluCj4gdGFza19zdHJ1Y3QgaXMgc3RydWN0IHRocmVhZF9pbmZv
LCBhbmQgd2UgY2FuIGdldCB0aGUgY3B1IG51bWJlciBieQo+IHJlYWRpbmcgZnJvbSB0aGUgVFAg
cmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSkuCj4KPiBPbmNlIHdl
IGhhdmUgdGhlIGNwdSBudW1iZXIgaW4gYSByZWdpc3RlciB3ZSByZWFkIHRoZSBvZmZzZXQgZm9y
IHRoYXQKPiBjcHUgZnJvbSBhZGRyZXNzOiAmX19wZXJfY3B1X29mZnNldCArIGNwdV9udW1iZXIg
PDwgMy4gVGhlbiB3ZSBhZGQgdGhpcwo+IG9mZnNldCB0byB0aGUgZGVzdGluYXRpb24gcmVnaXN0
ZXIuCj4KPiBUbyBtZWFzdXJlIHRoZSBpbXByb3ZlbWVudCBmcm9tIHRoaXMgY2hhbmdlLCB0aGUg
YmVuY2htYXJrIGluIFsxXSB3YXMKPiB1c2VkIG9uIFFlbXU6Cj4KPiBCZWZvcmU6Cj4gZ2xvYi1h
cnItaW5jICAgOiAgICAxLjEyNyDCsSAwLjAxM00vcwo+IGFyci1pbmMgICAgICAgIDogICAgMS4x
MjEgwrEgMC4wMDRNL3MKPiBoYXNoLWluYyAgICAgICA6ICAgIDAuNjgxIMKxIDAuMDUyTS9zCj4K
PiBBZnRlcjoKPiBnbG9iLWFyci1pbmMgICA6ICAgIDEuMTM4IMKxIDAuMDExTS9zCj4gYXJyLWlu
YyAgICAgICAgOiAgICAxLjM2NiDCsSAwLjAwNk0vcwo+IGhhc2gtaW5jICAgICAgIDogICAgMC42
NzYgwrEgMC4wMDFNL3MKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xpbnV4
L2NvbW1pdC84ZGVjOTAwOTc1ZWYKPgo+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxw
dXJhbmpheUBrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBpbmRleCAxNWU0ODJmMmM2
NTcuLjk5ZDcwMDZmMTQyMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IEBAIC0xMiw2
ICsxMiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9zdG9wX21hY2hpbmUuaD4KPiAgI2luY2x1ZGUg
PGFzbS9wYXRjaC5oPgo+ICAjaW5jbHVkZSA8YXNtL2NmaS5oPgo+ICsjaW5jbHVkZSA8YXNtL3Bl
cmNwdS5oPgo+ICAjaW5jbHVkZSAiYnBmX2ppdC5oIgo+Cj4gICNkZWZpbmUgUlZfRkVOVFJZX05J
TlNOUyAyCj4gQEAgLTEwODksNiArMTA5MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29u
c3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBlbWl0X29yKFJWX1JFR19UMSwgcmQsIFJWX1JFR19UMSwg
Y3R4KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X212KHJkLCBSVl9SRUdfVDEsIGN0
eCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIH0g
ZWxzZSBpZiAoaW5zbl9pc19tb3ZfcGVyY3B1X2FkZHIoaW5zbikpIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmQgIT0gcnMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBlbWl0X212KHJkLCBycywgY3R4KTsKPiArI2lmZGVmIENPTkZJR19TTVAKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qIExvYWQgY3VycmVudCBDUFUgbnVtYmVyIGluIFQxICov
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X2xkKFJWX1JFR19UMSwgb2Zm
c2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSVl9SRUdfVFAsIGN0eCk7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiA8PCAzIGJlY2F1c2Ugb2Zmc2V0cyBhcmUgOCBieXRlcyAqLwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9zbGxpKFJWX1JFR19UMSwgUlZfUkVHX1Qx
LCAzLCBjdHgpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogTG9hZCBhZGRy
ZXNzIG9mIF9fcGVyX2NwdV9vZmZzZXQgYXJyYXkgaW4gVDIgKi8KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVtaXRfYWRkcihSVl9SRUdfVDIsICh1NjQpJl9fcGVyX2NwdV9vZmZz
ZXQsIGV4dHJhX3Bhc3MsIGN0eCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBBZGQgb2Zmc2V0IG9mIGN1cnJlbnQgQ1BVIHRvICBfX3Blcl9jcHVfb2Zmc2V0ICovCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X2FkZChSVl9SRUdfVDEsIFJWX1JFR19U
MiwgUlZfUkVHX1QxLCBjdHgpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
TG9hZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gaW4gVDEgKi8KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGVtaXRfbGQoUlZfUkVHX1QxLCAwLCBSVl9SRUdfVDEsIGN0eCk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBBZGQgdGhlIG9mZnNldCB0byBSZCAqLwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9hZGQocmQsIHJkLCBSVl9SRUdf
VDEsIGN0eCk7CgppcyB0aGlzIHRoZSByaWdodCBsZXZlbCBvZiBjb2RlIGluZGVudGF0aW9uPwoK
PiArI2VuZGlmCj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgaWYgKGltbSA9
PSAxKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogU3BlY2lhbCBtb3YzMiBmb3IgemV4
dCAqLwo+IEBAIC0yMDM4LDMgKzIwNTcsOCBAQCBib29sIGJwZl9qaXRfc3VwcG9ydHNfYXJlbmEo
dm9pZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIH0KPiArCj4gK2Jvb2wgYnBmX2pp
dF9zdXBwb3J0c19wZXJjcHVfaW5zbih2b2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gdHJ1ZTsK
PiArfQo+IC0tCj4gMi40MC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
