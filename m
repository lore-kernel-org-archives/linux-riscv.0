Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7439C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PgPc2Qd3LqjXURZOfOsviaU6Ez1FlPJPNc4u+F/HJw=; b=An43AOhujkwP1h
	dB5jT53+/KwGJIN47/Ld4LxKtR/UXcJK6PhRfeo8QpGPHIUH6W+ceT13cW8Gp3287raNNuQxXz33J
	r9L4Dyw+J3ev+K2pr+jgc2U13lNHwKv0LJPovvH7OTV47hhJzKRbwFT8pjIkkzIhuiQA80fBN3Zo5
	7/9LvjdF3wB4Y6OUrGUGnb+1ul1J9jFQbDllSZLJHnJqfx7vKFNvEzZ1AlvysOAave7zIRRoQoeMJ
	AdMsQGZR6HoRbLP3vMk4zexZgzT5cHFfNdEBtZcZwQvdQHb8lcHKNX9j4fL9QTVtDRL+Nm0eVgvP/
	kvuitEgcLp6iZVXIFJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4oK7-0000000Gx4O-2pxo;
	Wed, 08 May 2024 20:55:36 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4oK3-0000000Gx3C-3ytU
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 20:55:33 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-439b1c72676so38211cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715201728; x=1715806528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9cCFRumEUZXr872nsxQhcwfTBKNt7qNhphTqHRAp1M=;
        b=u51DPIbXtDud0uTaLKcvrinv/6Mj0A3MD5m+DwZfqKXhJi6UIC1bPfx2YfWTyA/qoJ
         l/vZ8bljERQHsiO6bZJT3JbfS352WPSJbRAkIaSQdYl2/S5Q4wXbuxvSUY+MzmUPdMx0
         aIDP2owJHnL9yswKm+JjlOPv7ZttEQEytwBgijOukWRaRGkW+lrlTmmw6QEUHV6sRpTL
         HYmdetCnM9y+0EhCcfHha4chvzRquY3O7WXRzT3+tyeOf8xAqUggMYP2QaSof9PCjUpG
         PF003AJgveNaTA9PL+C3FXbbqE5bBuGGrik78nKsCjUIGuhcObcpnyROWtW1YW0aB7Cq
         On0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715201728; x=1715806528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9cCFRumEUZXr872nsxQhcwfTBKNt7qNhphTqHRAp1M=;
        b=rjsMO5qn5tizgPDCct2H/jKHKQ+AA4XBG/ZzbqzJSpnB9azIzHky0bYkwYgqtRAvvk
         T4bX4xYwmt+o9xOkeijPTPnFDDtnG9Vu/FKvodzru1fzMKrX9QhCCN18WgpxoNPyc2DU
         HaIivBylYdH2OyyrdtpiUbUojovCNtUAc/Uw7AscqZPIeFiHZG9QmmrxxTJuL1bv0ezq
         NPpnQyCVUBcUc/uQEGCMSkjXffAfuMcr7McFIlpJIXD/ZFCmEzTglfXvCZ026xtqVI6U
         UC8wsCE8HJl8kMCNM7mUdZn/atzDmTCcr5AGRtKFdXGftGAPzbqD0j4QTA8hZ5rixeP9
         k7cg==
X-Forwarded-Encrypted: i=1; AJvYcCWbnq2wf7TFII3R3LQx7SEDmWTjVEDpj/z+Y9necDrIR9KAbtjnEgD+PRRA+36/iPlNhUfFU7C+oQGJpAUaYGVMn3ptQvQeXox9Js/PoZEV
X-Gm-Message-State: AOJu0Yz8B74T+V4NphAoNZZhuJOcJlzoOS6YQu3H9Sdumy5UJBUooZ/c
	VZDUfTrhjdAndGqRnBvq6xh0DkOP6jxFgmGEAFHoaKIBeGT6ui05NvsrIx0FlIYpNt6U4uC7G0q
	3Ps6qG58DEDDb3jCQU2qdPgdMyFq4wLU5cLsV
X-Google-Smtp-Source: AGHT+IHnzHng5HPCtzW2YQxVbhXNmbYaa2vf+AuPNt99IlQUhDdxEePQbrydQQyRYb5fnsUFEZ6a0RiX6W43XX8Iaqw=
X-Received: by 2002:a05:622a:608a:b0:439:d5e3:1f31 with SMTP id
 d75a77b69052e-43def5aa252mr772661cf.4.1715201727807; Wed, 08 May 2024
 13:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240430040822.1133339-1-apatel@ventanamicro.com>
In-Reply-To: <20240430040822.1133339-1-apatel@ventanamicro.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 8 May 2024 13:54:48 -0700
Message-ID: <CAGETcx8C81OAfpTVBqk1yRdcwFG5v7v0PWVF6Udg2gPK0vH9dQ@mail.gmail.com>
Subject: Re: [PATCH v3] of: property: Add fw_devlink support for interrupt-map property
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_135532_036135_9CED2F06 
X-CRM114-Status: GOOD (  27.45  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgOTowOOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFNvbWUgb2YgdGhlIFBDSSBjb250cm9sbGVycyAoc3Vj
aCBhcyBnZW5lcmljIFBDSSBob3N0IGNvbnRyb2xsZXIpCj4gdXNlICJpbnRlcnJ1cHQtbWFwIiBE
VCBwcm9wZXJ0eSB0byBkZXNjcmliZSB0aGUgbWFwcGluZyBiZXR3ZWVuCj4gUENJIGVuZHBvaW50
cyBhbmQgUENJIGludGVycnVwdCBwaW5zLiBUaGlzIHRoZSBvbmx5IGNhc2Ugd2hlcmUKPiB0aGUg
aW50ZXJydXB0cyBhcmUgbm90IGRlc2NyaWJlZCBpbiBEVC4KPgo+IEN1cnJlbnRseSwgdGhlcmUg
aXMgbm8gZndfZGV2bGluayBjcmVhdGVkIGJhc2VkIG9uICJpbnRlcnJ1cHQtbWFwIgo+IERUIHBy
b3BlcnR5IHNvIGludGVycnVwdCBjb250cm9sbGVyIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHBy
b2JlZAo+IGJlZm9yZSBQQ0kgaG9zdCBjb250cm9sbGVyLiBUaGlzIGFmZmVjdHMgZXZlcnkgcGxh
dGZvcm0gd2hlcmUgYm90aAo+IFBDSSBob3N0IGNvbnRyb2xsZXIgYW5kIGludGVycnVwdCBjb250
cm9sbGVycyBhcmUgcHJvYmVkIGFzIHJlZ3VsYXIKPiBwbGF0Zm9ybSBkZXZpY2VzLgo+Cj4gVGhp
cyBjcmVhdGVzIGZ3X2RldmxpbmsgYmV0d2VlbiBjb25zdW1lcnMgKFBDSSBob3N0IGNvbnRyb2xs
ZXIpIGFuZAo+IHN1cHBsaWVyIChpbnRlcnJ1cHQgY29udHJvbGxlcikgYmFzZWQgb24gImludGVy
cnVwdC1tYXAiIERUIHByb3BlcnR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBh
dGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAtIE5vIG5l
ZWQgZm9yIGEgbG9vcCB0byBmaW5kICNpbnRlcnJ1cHQtY2VsbHMgcHJvcGVydHkgdmFsdWUKPiAt
IEZpeCBub2RlIGRlLXJlZmVyZW5jZSBsZWFrIHdoZW4gaW5kZXggaXMgZ3JlYXRlciB0aGFuIG51
bWJlcgo+ICAgb2YgZW50cmllcyBpbiBpbnRlcnJ1cHQtbWFwIHByb3BlcnR5Cj4gQ2hhbmdlcyBz
aW5jZSB2MToKPiAtIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uIGJhc2VkIG9uIFJvYidzIHN1
Z2dlc3Rpb24KPiAtIFVzZSBvZl9pcnFfcGFyc2VfcmF3KCkgZm9yIHBhcnNpbmcgaW50ZXJydXB0
LW1hcCBEVCBwcm9wZXJ0eQo+IC0tLQo+ICBkcml2ZXJzL29mL3Byb3BlcnR5LmMgfCA1MCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA1MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5j
IGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gaW5kZXggYTYzNThlZTk5Yjc0Li43MzI2Y2EwN2Fk
ZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gKysrIGIvZHJpdmVycy9v
Zi9wcm9wZXJ0eS5jCj4gQEAgLTEzMTEsNiArMTMxMSw1NSBAQCBzdGF0aWMgc3RydWN0IGRldmlj
ZV9ub2RlICpwYXJzZV9pbnRlcnJ1cHRzKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gICAgICAg
ICByZXR1cm4gb2ZfaXJxX3BhcnNlX29uZShucCwgaW5kZXgsICZzdXBfYXJncykgPyBOVUxMIDog
c3VwX2FyZ3MubnA7Cj4gIH0KPgo+ICtzdGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpwYXJzZV9p
bnRlcnJ1cHRfbWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIGludCBp
bmRleCkKPiArewo+ICsgICAgICAgY29uc3QgX19iZTMyICppbWFwLCAqaW1hcF9lbmQsICphZGRy
Owo+ICsgICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBzdXBfYXJnczsKPiArICAgICAgIHUz
MiBhZGRyY2VsbHMsIGludGNlbGxzOwo+ICsgICAgICAgaW50IGksIGltYXBsZW47Cj4gKwo+ICsg
ICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19PRl9JUlEpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPiArCj4gKyAgICAgICBpZiAoc3RyY21wKHByb3BfbmFtZSwgImludGVycnVw
dC1tYXAiKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgICAgaWYg
KG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiI2ludGVycnVwdC1jZWxscyIsICZpbnRjZWxscykp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsgICAgICAgYWRkcmNlbGxzID0gb2Zf
YnVzX25fYWRkcl9jZWxscyhucCk7Cj4gKwo+ICsgICAgICAgaW1hcCA9IG9mX2dldF9wcm9wZXJ0
eShucCwgImludGVycnVwdC1tYXAiLCAmaW1hcGxlbik7Cj4gKyAgICAgICBpZiAoIWltYXAgfHwg
aW1hcGxlbiA8PSAoYWRkcmNlbGxzICsgaW50Y2VsbHMpKQo+ICsgICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsKPiArICAgICAgIGltYXBfZW5kID0gaW1hcCArIGltYXBsZW47Cj4gKwo+ICsgICAg
ICAgc3VwX2FyZ3MubnAgPSBOVUxMOwo+ICsgICAgICAgd2hpbGUgKGltYXAgPCBpbWFwX2VuZCkg
ewo+ICsgICAgICAgICAgICAgICBhZGRyID0gaW1hcDsKPiArICAgICAgICAgICAgICAgaW1hcCAr
PSBhZGRyY2VsbHM7Cj4gKwo+ICsgICAgICAgICAgICAgICBzdXBfYXJncy5ucCA9IG5wOwo+ICsg
ICAgICAgICAgICAgICBzdXBfYXJncy5hcmdzX2NvdW50ID0gaW50Y2VsbHM7Cj4gKyAgICAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBpbnRjZWxsczsgaSsrKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHN1cF9hcmdzLmFyZ3NbaV0gPSBiZTMyX3RvX2NwdShpbWFwW2ldKTsKPiArICAgICAg
ICAgICAgICAgaW1hcCArPSBpbnRjZWxsczsKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChvZl9p
cnFfcGFyc2VfcmF3KGFkZHIsICZzdXBfYXJncykpCkNhbiB5b3UgbGVhdmUgYSBjb21tZW50IGFi
b3ZlIHRoaXMgY2FsbCBzYXlpbmcgb2ZfaXJxX3BhcnNlX3JhdygpCnVwZGF0ZXMgc3VwX2FyZ3Mu
bnA/IEl0J3MgcmVhbGx5IGEgcHJvYmxlbSB3aXRoIHRoZSBmdW5jdGlvbiBJTU8sIGJ1dAphIGNv
bW1lbnQgaGVyZSB3b3VsZCBiZSBoZWxwZnVsLgoKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghaW5kZXgpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHN1cF9hcmdzLm5wOwo+ICsKPiArICAgICAgICAgICAgICAg
b2Zfbm9kZV9wdXQoc3VwX2FyZ3MubnApOwo+ICsgICAgICAgICAgICAgICBzdXBfYXJncy5ucCA9
IE5VTEw7CgpXaHkgZG8geW91IG5lZWQgdG8gc2V0IGl0IHRvIE5VTEw/IENhbiB3ZSBqdXN0IGRl
bGV0ZSB0aGlzIGxpbmU/CgpJZiB5b3UgdGFrZSBjYXJlIG9mIHRoZXNlIG1pbm9yIGNvbW1lbnRz
LCB0aGVuCgpSZXZpZXdlZC1ieTogU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNv
bT4KCi1TYXJhdmFuYQoKPiArICAgICAgICAgICAgICAgaW1hcCArPSBzdXBfYXJncy5hcmdzX2Nv
dW50ICsgMTsKPiArICAgICAgICAgICAgICAgaW5kZXgtLTsKPiArICAgICAgIH0KPiArCj4gKyAg
ICAgICByZXR1cm4gTlVMTDsKPiArfQo+ICsKPiAgc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
cGFyc2VfcmVtb3RlX2VuZHBvaW50KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnByb3Bf
bmFtZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IGluZGV4KQo+IEBAIC0xMzU5LDYgKzE0MDgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1
cHBsaWVyX2JpbmRpbmdzIG9mX3N1cHBsaWVyX2JpbmRpbmdzW10gPSB7Cj4gICAgICAgICB7IC5w
YXJzZV9wcm9wID0gcGFyc2VfbXNpX3BhcmVudCwgfSwKPiAgICAgICAgIHsgLnBhcnNlX3Byb3Ag
PSBwYXJzZV9ncGlvX2NvbXBhdCwgfSwKPiAgICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9p
bnRlcnJ1cHRzLCB9LAo+ICsgICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2ludGVycnVwdF9t
YXAsIH0sCj4gICAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfcmVndWxhdG9ycywgfSwKPiAg
ICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9ncGlvLCB9LAo+ICAgICAgICAgeyAucGFyc2Vf
cHJvcCA9IHBhcnNlX2dwaW9zLCB9LAo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
