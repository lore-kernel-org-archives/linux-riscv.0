Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28416C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 18:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rdI5qro+Ihw2NXLB287hdCSKygaU9s/QYjyhvZu/Xk=; b=mfSS3pYS95XMch
	1RFoO4vxKTDhUEwvzPWc0BfVpf2i1+UuX90U22EgiPCzRmr80r/AuSVKuk8i3X5c5N0UGX2fNHenv
	VuIofB8RuK9WpR217NAhGs+UC1CtBo8qIy5RPIBkJJzmpt9JWnv/Tdj8od7rRRnrW2i+4OvzdYMBq
	KAxfnU8+dtlL0ai1FtukonHPMHQOKBVsM+ON00+Xd5x7y4wGgLmURd4N2Hx4UJ8wE2KetX6d/vkS6
	RonDLF4YOfe1GlPjywlvXIbb2qfquyEswvGjkzqLKT+IJF67hbQYJs2+PwhsyJwwvmeHgffvd3qa3
	kjBY0wPaO8LYNiKlX5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQXb8-00GyrR-2Z;
	Mon, 31 Jul 2023 18:26:26 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQXb5-00Gypq-03
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 18:26:25 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-348c7075afcso12505ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690827981; x=1691432781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LZEdaDlAMdQP6JhmjsArIuxox1zxEtjjTY2SzD6PsU=;
        b=5fgkkTfZTjvrkPsV2OAsWS7fGDKlkOo6NBkGxlUad6Djf9YF4mNXTcZwmQCCLJ1nBy
         ytvPZa3KoE6pLMDaS1L4gdmZaOfNzKXtsa1fikLeZSNL0jSNWYpUTY8GHiEMpPSUIhEf
         GKZr2wZjg6oExHWyVPblSGkoydBcnRJu278I6bHizaXll85ZaXfkAb9ISQ34veJLXVin
         H4LgRU66ITkpG1C45xmAlPZe5ifFrojIcI163nCjGKu3BAHmTrdfA2g91PJ4XmMzNAwE
         6qNdJbd/ZgVe0FTRRBae2q8TCC7NnJ6KmTDr6JnJgqJf5rkyLUFJCut3v7Lu9kIPHxwj
         tGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690827981; x=1691432781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LZEdaDlAMdQP6JhmjsArIuxox1zxEtjjTY2SzD6PsU=;
        b=QH8iM97EvzGrwIKddXJNqUD9R7mlBhc0V7bZyPcpj9OIJbAhTytv6dZNjygjn1UYyw
         p3Ku+G4+4gaowMUHVr5cm4YIyjpR/svCWu4/XDFHvphD0ay0LJCz6haRlZ0i9ES/cEN8
         JuqQaa9t+BHkB4/LcuNPIU058EcDRtp3afkhKcurklwqEkvtJgcZTw9vgmtdrVP2+RWJ
         MEBgUPoaMyqvx4E9qPZWLrcxQDwsCEMup+g7buHB5rK7f5nsxMjOuu0fPXt+skxphwOj
         aCQDhZmXShCry+bUMKVUNVwDV2UxAWArWZ4E2tmRudgzqJ8PXVnsv1AcYOScRvZ8vgBb
         hjXA==
X-Gm-Message-State: ABy/qLZ3Vp/UcA5ArtnVEA09bz/CS1tu75ue9mUQ/tOx0xvesBZ2rIay
	u4hfSg8t0mI+wkYHJ1KlEMPQbmff7SR9UNXsXcc6lQ==
X-Google-Smtp-Source: APBJJlHJ2q+Ibhsyd21GC77gr96XZana1MhNnQDJBDO6Init3JyGxBHBc9FYe6705xtGHxT1vNNwqYdqSlhzUk4wwtA=
X-Received: by 2002:a05:6e02:16c5:b0:345:dcdf:206b with SMTP id
 5-20020a056e0216c500b00345dcdf206bmr693992ilx.25.1690827981339; Mon, 31 Jul
 2023 11:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-13-rananta@google.com>
 <87jzulqz0v.wl-maz@kernel.org>
In-Reply-To: <87jzulqz0v.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 11:26:09 -0700
Message-ID: <CAJHc60zGzAqWw2iZwNEG_bWERXkz_io7ae-K_tf_kh6xcOBxLA@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] KVM: arm64: Use TLBI range-based intructions for unmap
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_112623_058359_E027CED7 
X-CRM114-Status: GOOD (  33.61  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgNjoxMuKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAyMiBKdWwgMjAyMyAwMzoyMjo1MSArMDEwMCwKPiBS
YWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+
IFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHRoZSBzdGFnZS0yIHVubWFwIHdhbGtlciB0
cmF2ZXJzZXMKPiA+IHRoZSBnaXZlbiByYW5nZSBhbmQsIGFzIGEgcGFydCBvZiBicmVhay1iZWZv
cmUtbWFrZSwgcGVyZm9ybXMKPiA+IFRMQiBpbnZhbGlkYXRpb25zIHdpdGggYSBEU0IgZm9yIGV2
ZXJ5IFBURS4gQSBtdWx0aXR1ZGUgb2YgdGhpcwo+ID4gY29tYmluYXRpb24gY291bGQgY2F1c2Ug
YSBwZXJmb3JtYW5jZSBib3R0bGVuZWNrIG9uIHNvbWUgc3lzdGVtcy4KPiA+Cj4gPiBIZW5jZSwg
aWYgdGhlIHN5c3RlbSBzdXBwb3J0cyBGRUFUX1RMQklSQU5HRSwgZGVmZXIgdGhlIFRMQgo+ID4g
aW52YWxpZGF0aW9ucyB1bnRpbCB0aGUgZW50aXJlIHdhbGsgaXMgZmluaXNoZWQsIGFuZCB0aGVu
Cj4gPiB1c2UgcmFuZ2UtYmFzZWQgaW5zdHJ1Y3Rpb25zIHRvIGludmFsaWRhdGUgdGhlIFRMQnMg
aW4gb25lIGdvLgo+ID4gQ29uZGl0aW9uIGRlZmVycmVkIFRMQiBpbnZhbGlkYXRpb24gb24gdGhl
IHN5c3RlbSBzdXBwb3J0aW5nIEZXQiwKPiA+IGFzIHRoZSBvcHRpbWl6YXRpb24gaXMgZW50aXJl
bHkgcG9pbnRsZXNzIHdoZW4gdGhlIHVubWFwIHdhbGtlcgo+ID4gbmVlZHMgdG8gcGVyZm9ybSBD
TU9zLgo+ID4KPiA+IFJlbmFtZSBzdGFnZTJfcHV0X3B0ZSgpIHRvIHN0YWdlMl91bm1hcF9wdXRf
cHRlKCkgYXMgdGhlIGZ1bmN0aW9uCj4gPiBub3cgc2VydmVzIHRoZSBzdGFnZS0yIHVubWFwIHdh
bGtlciBzcGVjaWZpY2FsbHksIHJhdGhlciB0aGFuCj4gPiBhY3RpbmcgZ2VuZXJpYy4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5j
b20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jIHwgNjcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU4IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQva3ZtL2h5cC9wZ3RhYmxlLmMgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4gPiBp
bmRleCA1ZWYwOThhZjE3MzYuLmNmODg5MzNhMmVhMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJt
NjQva3ZtL2h5cC9wZ3RhYmxlLmMKPiA+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxl
LmMKPiA+IEBAIC04MzEsMTYgKzgzMSw1NCBAQCBzdGF0aWMgdm9pZCBzdGFnZTJfbWFrZV9wdGUo
Y29uc3Qgc3RydWN0IGt2bV9wZ3RhYmxlX3Zpc2l0X2N0eCAqY3R4LCBrdm1fcHRlX3Qgbgo+ID4g
ICAgICAgc21wX3N0b3JlX3JlbGVhc2UoY3R4LT5wdGVwLCBuZXcpOwo+ID4gIH0KPiA+Cj4gPiAt
c3RhdGljIHZvaWQgc3RhZ2UyX3B1dF9wdGUoY29uc3Qgc3RydWN0IGt2bV9wZ3RhYmxlX3Zpc2l0
X2N0eCAqY3R4LCBzdHJ1Y3Qga3ZtX3MyX21tdSAqbW11LAo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBrdm1fcGd0YWJsZV9tbV9vcHMgKm1tX29wcykKPiA+ICtzdHJ1Y3Qgc3Rh
Z2UyX3VubWFwX2RhdGEgewo+ID4gKyAgICAgc3RydWN0IGt2bV9wZ3RhYmxlICpwZ3Q7Cj4gPiAr
ICAgICBib29sIGRlZmVyX3RsYl9mbHVzaF9pbml0Owo+ID4gK307Cj4gPiArCj4gPiArc3RhdGlj
IGJvb2wgX19zdGFnZTJfdW5tYXBfZGVmZXJfdGxiX2ZsdXNoKHN0cnVjdCBrdm1fcGd0YWJsZSAq
cGd0KQo+ID4gK3sKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBJZiBGRUFUX1RMQklSQU5HRSBp
cyBpbXBsZW1lbnRlZCwgZGVmZXIgdGhlIGluZGl2aWR1YWwKPiA+ICsgICAgICAqIFRMQiBpbnZh
bGlkYXRpb25zIHVudGlsIHRoZSBlbnRpcmUgd2FsayBpcyBmaW5pc2hlZCwgYW5kCj4gPiArICAg
ICAgKiB0aGVuIHVzZSB0aGUgcmFuZ2UtYmFzZWQgVExCSSBpbnN0cnVjdGlvbnMgdG8gZG8gdGhl
Cj4gPiArICAgICAgKiBpbnZhbGlkYXRpb25zLiBDb25kaXRpb24gZGVmZXJyZWQgVExCIGludmFs
aWRhdGlvbiBvbiB0aGUKPiA+ICsgICAgICAqIHN5c3RlbSBzdXBwb3J0aW5nIEZXQiwgYXMgdGhl
IG9wdGltaXphdGlvbiBpcyBlbnRpcmVseQo+ID4gKyAgICAgICogcG9pbnRsZXNzIHdoZW4gdGhl
IHVubWFwIHdhbGtlciBuZWVkcyB0byBwZXJmb3JtIENNT3MuCj4gPiArICAgICAgKi8KPiA+ICsg
ICAgIHJldHVybiBzeXN0ZW1fc3VwcG9ydHNfdGxiX3JhbmdlKCkgJiYgc3RhZ2UyX2hhc19md2Io
cGd0KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGJvb2wgc3RhZ2UyX3VubWFwX2RlZmVyX3Rs
Yl9mbHVzaChzdHJ1Y3Qgc3RhZ2UyX3VubWFwX2RhdGEgKnVubWFwX2RhdGEpCj4gPiArewo+ID4g
KyAgICAgYm9vbCBkZWZlcl90bGJfZmx1c2ggPSBfX3N0YWdlMl91bm1hcF9kZWZlcl90bGJfZmx1
c2godW5tYXBfZGF0YS0+cGd0KTsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBTaW5j
ZSBfX3N0YWdlMl91bm1hcF9kZWZlcl90bGJfZmx1c2goKSBpcyBiYXNlZCBvbiBhbHRlcm5hdGl2
ZQo+ID4gKyAgICAgICogcGF0Y2hpbmcgYW5kIHRoZSBUTEJJcycgb3BlcmF0aW9ucyBiZWhhdmlv
ciBkZXBlbmQgb24gdGhpcywKPiA+ICsgICAgICAqIHRyYWNrIGlmIHRoZXJlJ3MgYW55IGNoYW5n
ZSBpbiB0aGUgc3RhdGUgZHVyaW5nIHRoZSB1bm1hcCBzZXF1ZW5jZS4KPiA+ICsgICAgICAqLwo+
ID4gKyAgICAgV0FSTl9PTih1bm1hcF9kYXRhLT5kZWZlcl90bGJfZmx1c2hfaW5pdCAhPSBkZWZl
cl90bGJfZmx1c2gpOwo+ID4gKyAgICAgcmV0dXJuIGRlZmVyX3RsYl9mbHVzaDsKPgo+IEkgcmVh
bGx5IGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UncmUgdGVzdGluZyBoZXJlLiBUaGUgYWJpbGl0
eSB0bwo+IGRlZmVyIFRMQiBpbnZhbGlkYXRpb24gaXMgYSBmdW5jdGlvbiBvZiB0aGUgc3lzdGVt
IGNhcGFiaWxpdGllcwo+IChyYW5nZStGV0IpIGFuZCBhIHNpbmdsZSBmbGFnIHRoYXQgaXMgb25s
eSBzZXQgb24gdGhlIGhvc3QgZm9yIHBLVk0uCj4KPiBIb3cgY291bGQgdGhhdCBjaGFuZ2UgaW4g
dGhlIG1pZGRsZSBvZiB0aGUgbGlmZSBvZiB0aGUgc3lzdGVtPyBpZgo+IGZ1cnRoZXIgYmVncyB0
aGUgcXVlc3Rpb24gYWJvdXQgdGhlIG5lZWQgZm9yIHRoZSB1bm1hcF9kYXRhIGRhdGEKPiBzdHJ1
Y3R1cmUuCj4KPiBJdCBsb29rcyB0byBtZSB0aGF0IHdlIGNvdWxkIHNpbXBseSBwYXNzIHRoZSBw
Z3QgcG9pbnRlciBhcm91bmQgYW5kIGJlCj4gZG9uZSB3aXRoIGl0LiBBbSBJIG1pc3Npbmcgc29t
ZXRoaW5nIG9idmlvdXM/Cj4KRnJvbSBvbmUgb2YgdGhlIHByZXZpb3VzIGNvbW1lbnRzIFsxXSAo
dXNlZCBpbiBhIGRpZmZlcmVudCBjb250ZXh0KSwKSSdtIGdpdmVuIHRvIHVuZGVyc3RhbmQgdGhh
dCBzaW5jZSB0aGVzZSBmZWF0dXJlIGNoZWNrcyBhcmUgZ292ZXJuZWQKYnkgYWx0ZXJuYXRpdmUg
cGF0Y2hpbmcsIHRoZXkgY2FuIHBvdGVudGlhbGx5IGNoYW5nZSAoYXQgcnVudGltZT8pLiBJcwp0
aGF0IG5vdCB0aGUgY2FzZSBhbmQgSSBoYXZlIG1pc3VuZGVyc3Rvb2QgdGhlIGlkZWEgaW4gY29t
bWVudCBbMV0KZW50aXJlbHk/IElzIGl0IHNvbGVseSB1c2VkIGZvciBvcHRpbWl6YXRpb24gcHVy
cG9zZXMgYW5kIHNldCBvbmx5Cm9uY2U/CklmIHRoYXQncyB0aGUgY2FzZSwgSSBjYW4gZ2V0IHJp
ZCBvZiB0aGUgV0FSTl9PTigpIGFuZCB1bm1hcF9kYXRhLgoKLSBSYWdoYXZlbmRyYQoKWzFdOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWkdQUGoxQVhTMFVhaDJVZ0BsaW51eC5kZXYvCj4g
ICAgICAgICBNLgo+Cj4gLS0KPiBXaXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3JtLCBwcm9n
cmVzcyBpcyBub3QgcG9zc2libGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
