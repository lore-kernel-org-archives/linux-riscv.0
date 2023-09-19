Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4813CD5BA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWD+h/AwhiRqSDdNzIRPdm/BD/JTduf0G33KCG+m3Ss=; b=TQeM8BP95YPjMG
	VkJpdW/t7ftAnePyu0uV+KoVdBgZc4tsQr2Dj+TYa9i+qTK689O++XDY4jXgShQSTopkub2mo+2C4
	8dc9PM8nP3/hpk8T9kXRB/WMTJNBOAGxKOLPqLd/vJfzeIUE85onx0+r/gJUvQ+SJ2EUw5o0+7nj3
	llXrAXS0e7ggB5H4Qib2z8SgeaY/entNFSM8DKdw3Su4zYkE8mLZUflTaVCRkJ56SU5k1CH8gKboy
	x+4lgq+xJHyOzn3p8zjFBIty8uwTjkAIIVBltCjZEV+Xl8JuXKaCvJ0WP0oyIVsj59pTNlR2W5qq0
	FJ3+hoaKfiFcBOzqNaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZWf-000Mfr-1H;
	Tue, 19 Sep 2023 12:08:21 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZWc-000Mdt-0M
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 12:08:19 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7aae07e7ba4so705987241.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 05:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695125297; x=1695730097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2iPmpjEwyRg01FPSaJcAL+Fk1h/zdCL91gxz6OrpHQ=;
        b=TQPRcueTnO4/tWYx7ubAZS9cdK+2jHNhA3375h44zUaGeDA0+NMpyqADV622QIi9My
         mb1lYRfVBA0P33wjHclj5X9JPYQ9sFtVtlAsppjeZW206/6sDEC9g/l7tQtLMyhf3/+J
         o+X329KbuD5lCdeZrWprYZ1Zi4v1GGXgRnxzkzCHaqZrJJYXvR4dR9yqZ0YeYDji4219
         TtIE4quTSvHLfp9oxeJ2YeVxmIQscMC7Jf0K0clgN7YPF6f4Zl8sDUujNmutm0fCeNQp
         hmySSKvcKNRcYCViKbVuMf/v99/MZnjXIxQ1AXsOEpNpXfW+KZu6TAkq+Xf3/hRcFxEa
         ZY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695125297; x=1695730097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2iPmpjEwyRg01FPSaJcAL+Fk1h/zdCL91gxz6OrpHQ=;
        b=KpxK3ZbT7Xfwaqf10GD1FV+q+Vb0Jo7Wrjuh31hzeR5Y8W9gdnzNGQW1JgpJe33RPv
         rsmjV615XpO+pJoK0Pj9k8mNlfX2btmr+ZVeIY25bMf4NcNp9KrhzEWYXdjdneGRV+7g
         r65slV1+Ct0TbVzM9drBPkBl35nQEN+nk3KFIq40o+n6me02LFisRvCDOTa7PqV+baVJ
         togn8wXoCwGbo4Bo709HILMFkMf5PSC2YGLIropLfsfxRMwnNDESKu/Gn4tCSRKT7aXs
         VgoKybApS/Tap9Z5c6CTT/FrbIPV4plZ78tfNGhcaoGF8BkdjGMkx3EBoiopqbUNTLXf
         +HxQ==
X-Gm-Message-State: AOJu0Yyf4rlTcOC4P0l+IAh8aCrewPTwTJtEYdjGQZbTXRpgTu3jwnB5
	zDZuJLIuM8ZUT4Hl7gRcIETWbtcG3nOXGn+ByFo=
X-Google-Smtp-Source: AGHT+IH7TN3P7HJQ05oem8BOcqLZTDht3nkk5RIet6AG+k4/cvg4jSeSddT/b2QnHf7bMT6zLQnkiWr6pF/YfiLXevU=
X-Received: by 2002:a1f:cc01:0:b0:48f:e2eb:6dd9 with SMTP id
 c1-20020a1fcc01000000b0048fe2eb6dd9mr8987999vkg.8.1695125297222; Tue, 19 Sep
 2023 05:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230911131224.61924-1-alexghiti@rivosinc.com> <20230911131224.61924-3-alexghiti@rivosinc.com>
In-Reply-To: <20230911131224.61924-3-alexghiti@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Sep 2023 13:07:51 +0100
Message-ID: <CA+V-a8soezvPad=m4m2CN5QJ5qVOAxyjA6z=w3fUu7h8EF_B-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_050818_153800_7DBFD485 
X-CRM114-Status: GOOD (  21.67  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMjoxNOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBmbHVzaF90bGJfcmFuZ2UoKSB1c2VzIGEgZml4
ZWQgc3RyaWRlIG9mIFBBR0VfU0laRSBhbmQgaW4gaXRzIGN1cnJlbnQgZm9ybSwKPiB3aGVuIGEg
aHVnZXRsYiBtYXBwaW5nIG5lZWRzIHRvIGJlIGZsdXNoZWQsIGZsdXNoX3RsYl9yYW5nZSgpIGZs
dXNoZXMgdGhlCj4gd2hvbGUgdGxiOiBzbyBzZXQgYSBzdHJpZGUgb2YgdGhlIHNpemUgb2YgdGhl
IGh1Z2V0bGIgbWFwcGluZyBpbiBvcmRlciB0bwo+IG9ubHkgZmx1c2ggdGhlIGh1Z2V0bGIgbWFw
cGluZy4gSG93ZXZlciwgaWYgdGhlIGh1Z2VwYWdlIGlzIGEgTkFQT1QgcmVnaW9uLAo+IGFsbCBQ
VEVzIHRoYXQgY29uc3RpdHV0ZSB0aGlzIG1hcHBpbmcgbXVzdCBiZSBpbnZhbGlkYXRlZCwgc28g
dGhlIHN0cmlkZQo+IHNpemUgbXVzdCBhY3R1YWxseSBiZSB0aGUgc2l6ZSBvZiB0aGUgUFRFLgo+
Cj4gTm90ZSB0aGF0IFRIUHMgYXJlIGRpcmVjdGx5IGhhbmRsZWQgYnkgZmx1c2hfcG1kX3RsYl9y
YW5nZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2
b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgfCAzOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgpUZXN0ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJo
YWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4gIwpPbiBSWi9GaXZlIFNNQVJDCgpD
aGVlcnMsClByYWJoYWthcgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
IGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gaW5kZXggZmEwMzI4OTg1M2Q4Li41YmRhNmQ0
ZmVkOTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTMsNiArMyw3IEBACj4gICNpbmNsdWRlIDxsaW51
eC9tbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zY2hl
ZC5oPgo+ICsjaW5jbHVkZSA8bGludXgvaHVnZXRsYi5oPgo+ICAjaW5jbHVkZSA8YXNtL3NiaS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+Cj4KPiBAQCAtMTQ3LDcgKzE0OCw0MyBA
QCB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25l
ZCBsb25nIGFkZHIpCj4gIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgZW5kKQo+ICB7Cj4gLSAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZSh2bWEtPnZtX21t
LCBzdGFydCwgZW5kIC0gc3RhcnQsIFBBR0VfU0laRSk7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IHN0cmlkZV9zaXplOwo+ICsKPiArICAgICAgIHN0cmlkZV9zaXplID0gaXNfdm1faHVnZXRsYl9w
YWdlKHZtYSkgPwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHVnZV9wYWdlX3Np
emUoaHN0YXRlX3ZtYSh2bWEpKSA6Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
QUdFX1NJWkU7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9TVk5BUE9UCj4gKyAgICAg
ICAvKgo+ICsgICAgICAgICogQXMgc3RhdGVkIGluIHRoZSBwcml2aWxlZ2VkIHNwZWNpZmljYXRp
b24sIGV2ZXJ5IFBURSBpbiBhIE5BUE9UCj4gKyAgICAgICAgKiByZWdpb24gbXVzdCBiZSBpbnZh
bGlkYXRlZCwgc28gcmVzZXQgdGhlIHN0cmlkZSBpbiB0aGF0IGNhc2UuCj4gKyAgICAgICAgKi8K
PiArICAgICAgIGlmIChoYXNfc3ZuYXBvdCgpKSB7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgb3JkZXIsIG5hcG90X3NpemU7Cj4gKwo+ICsgICAgICAgICAgICAgICBmb3JfZWFjaF9u
YXBvdF9vcmRlcihvcmRlcikgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5hcG90X3NpemUg
PSBuYXBvdF9jb250X3NpemUob3JkZXIpOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoc3RyaWRlX3NpemUgIT0gbmFwb3Rfc2l6ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAobmFwb3Rf
c2l6ZSA+PSBQR0RJUl9TSVpFKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
aWRlX3NpemUgPSBQR0RJUl9TSVpFOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYg
KG5hcG90X3NpemUgPj0gUDREX1NJWkUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJpZGVfc2l6ZSA9IFA0RF9TSVpFOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsc2Ug
aWYgKG5hcG90X3NpemUgPj0gUFVEX1NJWkUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJpZGVfc2l6ZSA9IFBVRF9TSVpFOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVs
c2UgaWYgKG5hcG90X3NpemUgPj0gUE1EX1NJWkUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJpZGVfc2l6ZSA9IFBNRF9TSVpFOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmlkZV9zaXplID0gUEFH
RV9TSVpFOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAg
ICAgICAgfQo+ICsgICAgICAgfQo+ICsjZW5kaWYKPiArCj4gKyAgICAgICBfX2ZsdXNoX3RsYl9y
YW5nZSh2bWEtPnZtX21tLCBzdGFydCwgZW5kIC0gc3RhcnQsIHN0cmlkZV9zaXplKTsKPiAgfQo+
ICAjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4gIHZvaWQgZmx1c2hfcG1kX3Rs
Yl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwK
PiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
