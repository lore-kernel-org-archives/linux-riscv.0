Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A81C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9mG0ltTVjnI2wegCmwhfLgv7Aoqe1vtULLwB/2YR+Q=; b=oY3lLjFGtO/LqQ
	0ER7mNvKaGCAcC08KjEFWMspU+hGNoF3a1sC6bEmfwRTEsZLPleOark9GRqXi43RQS1J9CD5IohF+
	5IygZhZoDA1kX9j/r7+IJEJOKXNavrI8v7/eQ1RSvcMM7IGLNbq43hEYbMw11FijToqWhhf1f+fle
	UzRGnnWI4BcZma0anvFwUx5H70EXxsl+NezwFiJhdlgY1WrBvTmPOq62J19F4VOBTef8ZhPn/zsyJ
	eOc68voTQaGjptMZdM/gG06l6TBw8qzJ36XeQ3RnXAtP+f6Xqs4513vGB5gjGahN0x18X/iroQeVL
	GL1Ujpre0DgDcgBsavOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxCEP-0025ex-1d;
	Sun, 29 Oct 2023 20:17:57 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxCEM-0025e2-2L
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 20:17:56 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-49dd3bb5348so1532425e0c.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698610672; x=1699215472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qknPkF/GhioNTqsfL8PFnCh2jVNaQR/cXCoqmSLii5U=;
        b=TDo6NwCJvC6anSrSxSp2j92SY+5xnpJ8akfHXU/RSxk6GrXG1ltQevQeuL0tRPZ2P5
         sihgGYUKphVUPv/iMvnCGtd8KpDF3B7JQkuVjR9mQhbdDB/7GefN6/hYOpNyDh+Cf+EY
         HLnOil/BI037iwj6iCaelHNaYKLVPMQMHTU8ucyf9r8ebEte78RJ+G3nmzVhj2DSEu1A
         aaxoSnWoGOhbzIvnC/3ZKBUxhT4CJhhGTfv55PCXnKQLj+M6+dZccFEv4xg+fB6gJYVs
         7dvEe+1Ge9vA6XVDwPHr+zmVjbATBQzzfY8aJbRngeY490puH5ijBB/VXSnyjTOyaSX2
         PNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698610672; x=1699215472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qknPkF/GhioNTqsfL8PFnCh2jVNaQR/cXCoqmSLii5U=;
        b=h5kC/3NaMIg4xVqreEpqRFE3b3y3QHronPQXRT1d+3XZDE0VVwmni7i1OmRK9JZvJd
         R+Lw4KO1RDIdBYUAQkvg3qWxJJdY3Z3nTBlQbTBt7YxXbYzPNPwwtzrhT9EW4P4qJRmf
         dmKmoh26/X0dqd85rFHvSu16mZeLssUlPq1veC3QJGh9xFumwcFPthb/RAKvgPFBBV8i
         tAzWlfMJiFJgEw8jaDUKbbSpJJoYNeKvxCs7NTSKV0WlQt6OsGnSoW5h6mWzFlzbOyFR
         1QUaF52fcQcdbS/HTGtKul7EPbOKh5IeP26KB7ER/flj2NCU28VpVo7PmZOe71YKBaUO
         tvNg==
X-Gm-Message-State: AOJu0Ywbx4OfmugQrWwBW29tVpvpqElheB8B9+PNwGnEIt6X9Vl5bQD3
	nP9JbsgD7b5D1x0Kd8PakSBi1fnoBIv671todL0=
X-Google-Smtp-Source: AGHT+IE5zqFYBvu9XQ7wx3aCUfgWrL3jx20mGsGKxg8tg0GI13mG8EhWtlf6S8LkhPqjgCQ9LcKtSnt1Q9U/FbEwrnk=
X-Received: by 2002:a1f:ad04:0:b0:495:cace:d59c with SMTP id
 w4-20020a1fad04000000b00495caced59cmr6820612vke.0.1698610671799; Sun, 29 Oct
 2023 13:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231019140151.21629-1-alexghiti@rivosinc.com> <20231019140151.21629-3-alexghiti@rivosinc.com>
In-Reply-To: <20231019140151.21629-3-alexghiti@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 Oct 2023 20:17:25 +0000
Message-ID: <CA+V-a8sjeT3_BR2waskiZ1zCXFi+R2z67R7SznyjV_2+vGzU8A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_131754_783990_B971F2CF 
X-CRM114-Status: GOOD (  19.12  )
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

T24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMzowNOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
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
b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgfCAzMSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KVGVzdGVkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+ICMKT24gUlovRml2ZSBTTUFSQwoKQ2hlZXJz
LApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGluZGV4IGZhMDMyODk4NTNkOC4uNTkzMzc0NGRmOTFh
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlz
Y3YvbW0vdGxiZmx1c2guYwo+IEBAIC0zLDYgKzMsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvbW0u
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4KPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiAg
I2luY2x1ZGUgPGFzbS9tbXVfY29udGV4dC5oPgo+Cj4gQEAgLTE0Nyw3ICsxNDgsMzUgQEAgdm9p
ZCBmbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9u
ZyBhZGRyKQo+ICB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGVuZCkKPiAgewo+IC0gICAgICAgX19mbHVzaF90bGJfcmFuZ2Uodm1hLT52bV9tbSwgc3Rh
cnQsIGVuZCAtIHN0YXJ0LCBQQUdFX1NJWkUpOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzdHJp
ZGVfc2l6ZTsKPiArCj4gKyAgICAgICBpZiAoIWlzX3ZtX2h1Z2V0bGJfcGFnZSh2bWEpKSB7Cj4g
KyAgICAgICAgICAgICAgIHN0cmlkZV9zaXplID0gUEFHRV9TSVpFOwo+ICsgICAgICAgfSBlbHNl
IHsKPiArICAgICAgICAgICAgICAgc3RyaWRlX3NpemUgPSBodWdlX3BhZ2Vfc2l6ZShoc3RhdGVf
dm1hKHZtYSkpOwo+ICsKPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfU1ZOQVBPVAo+ICsgICAg
ICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBBcyBzdGF0ZWQgaW4gdGhlIHByaXZp
bGVnZWQgc3BlY2lmaWNhdGlvbiwgZXZlcnkgUFRFIGluIGEKPiArICAgICAgICAgICAgICAgICog
TkFQT1QgcmVnaW9uIG11c3QgYmUgaW52YWxpZGF0ZWQsIHNvIHJlc2V0IHRoZSBzdHJpZGUgaW4g
dGhhdAo+ICsgICAgICAgICAgICAgICAgKiBjYXNlLgo+ICsgICAgICAgICAgICAgICAgKi8KPiAr
ICAgICAgICAgICAgICAgaWYgKGhhc19zdm5hcG90KCkpIHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoc3RyaWRlX3NpemUgPj0gUEdESVJfU0laRSkKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cmlkZV9zaXplID0gUEdESVJfU0laRTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBlbHNlIGlmIChzdHJpZGVfc2l6ZSA+PSBQNERfU0laRSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cmlkZV9zaXplID0gUDREX1NJWkU7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZWxzZSBpZiAoc3RyaWRlX3NpemUgPj0gUFVEX1NJWkUpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJpZGVfc2l6ZSA9IFBVRF9TSVpFOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGVsc2UgaWYgKHN0cmlkZV9zaXplID49IFBNRF9TSVpFKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyaWRlX3NpemUgPSBQTURfU0laRTsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJpZGVfc2l6ZSA9IFBBR0VfU0laRTsKPiArICAgICAgICAgICAgICAgfQo+ICsjZW5kaWYK
PiArICAgICAgIH0KPiArCj4gKyAgICAgICBfX2ZsdXNoX3RsYl9yYW5nZSh2bWEtPnZtX21tLCBz
dGFydCwgZW5kIC0gc3RhcnQsIHN0cmlkZV9zaXplKTsKPiAgfQo+ICAjaWZkZWYgQ09ORklHX1RS
QU5TUEFSRU5UX0hVR0VQQUdFCj4gIHZvaWQgZmx1c2hfcG1kX3RsYl9yYW5nZShzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiAtLQo+IDIuMzkuMgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
