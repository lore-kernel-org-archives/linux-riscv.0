Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BDFEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLDRluslVsHmAYImvQEMqbzXi0RlimgPB7ElpcF+PM0=; b=oSdL7uiupjOjBp
	8MxP9I4lLBZ9IZUlwADgbue21/PmhQWo4VBesAaAbfLwYubonRk4mF1mC4XmRmfdBI+yUTYN7UBUF
	hJr6MxHGZ6N7dswPGoQw838oxyF6nVY1WvQVyWnl4MEDML4gPuDjXWrGmzsRhiz9zdQlYVFRhXxuI
	cM6U8SVq2OwELXlyBKoDtTpqOlnDTu/ENlQ5t3pkBKY+fS7zaYmr0HJaGKw2uktszGE7s4n05Lg6j
	281UxVbceBGPSidPSEmyllSSdSk4SMoIffAQNF36+JO64jYKkoe0GDxa1C7QuHJxzOiGWdKncRehz
	JnFO5gHWtc/THCuh7urQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCakx-002jux-23;
	Fri, 23 Jun 2023 06:58:55 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCakv-002juN-0A
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 06:58:54 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-762490831f6so23082585a.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687503530; x=1690095530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6MxLV0G+8wjjPyHhNyl1peIGiv2q79iBhV+mVZPdj4=;
        b=JVQM3n5xYF8EPptFAT7BTPln3jlmfuqeLKGrK50dma15VqXJhw61wfSX2IorhKeOzP
         LvxzohljeUe7OtNqlpoqBEVeqZzk2bMkS5ijVftn5Vi/Vst8LjqSdV+4EusLDckcC08u
         nHfq9hZxQ8p//lh76hhv3ztrCM1/0HJa8nYn1k6RGlCldEt/3VH97QLvgzEo2NdyKTwL
         tb3ZzJ5RnSAKVqD0TuqNRyM68jtk85saCed5PtP7++Iid95mcVgUE5h5ESBMNeuG5/nl
         Pp1KCQa4Xl83LVTLsskXGvJlTo7FjY4EhRkwaK6+iEfqn3ByiZ2d0CcNvVbTnO92KV3b
         j0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687503530; x=1690095530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6MxLV0G+8wjjPyHhNyl1peIGiv2q79iBhV+mVZPdj4=;
        b=BSdZaO/NCZURKVgX+P5p53QCAVMCB/mclF4aHZ14/3f9uNXlHemWp+Q/U+7mDWkqlD
         hrfquxCTMAeS+pI+OecT+xLS8trssdbH8U4x90Y3zeghlAYONAlTUgkzMb0n5/O50c/1
         M83PyTrvfBV52OmPtmJ47Re1EuuZMxsQIrFRg8K5/GoJbo/NxyHvBibHV1uydP5LDKWY
         RXpKDr2kRa9oF2ywqv8531flNEmb6O1lplbYJoueoACOwA/5MST3YgeWqUkhcyl4Tu3/
         qitGYj9oF7jBajzaCgyVxgvMHHeftW026cgV09XAwvUEUkjq8BGvYdmQjQDDCCPgA3cz
         FxvA==
X-Gm-Message-State: AC+VfDwnQ1hpU2jFwooPD9oiFXfAc2c7QgKDGR3r9qcGPHoIeAddcdZ3
	M3fXS7rX0ARo9N09fmGOil6riPPSL0DTWPkOJ8eWzuErPapK07VnoZK5PA==
X-Google-Smtp-Source: ACHHUZ4tibBXO9qQ/aLB6Q6YFAxrMMB+UqLu27wAzVGJhZwqOhLfra8NRu5Dbcgh//FVDc0Igwx8+d1iIal8nPrt0Fs=
X-Received: by 2002:a05:6214:ccc:b0:621:7d4:e068 with SMTP id
 12-20020a0562140ccc00b0062107d4e068mr29686647qvx.52.1687503530092; Thu, 22
 Jun 2023 23:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230621124133.779572-1-mchitale@ventanamicro.com>
 <20230621124133.779572-2-mchitale@ventanamicro.com> <536551b6-4215-bb2e-d309-6cbfe87205aa@ghiti.fr>
In-Reply-To: <536551b6-4215-bb2e-d309-6cbfe87205aa@ghiti.fr>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 23 Jun 2023 12:28:13 +0530
Message-ID: <CAN37VV6G-hibeSBoFHnrMecuUvgnwGB9t+1XGvWC3Y=fHK+Byg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] riscv: mm: use svinval instructions instead of sfence.vma
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "=Atish Patra" <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_235853_100248_981D30D5 
X-CRM114-Status: GOOD (  30.17  )
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

SGkgQWxleCwKCk9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDk6MTTigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Cj4gSGkgTWF5dXJlc2gsCj4KPiBPbiAyMS8wNi8y
MDIzIDE0OjQxLCBNYXl1cmVzaCBDaGl0YWxlIHdyb3RlOgo+ID4gV2hlbiBzdmludmFsIGlzIHN1
cHBvcnRlZCB0aGUgbG9jYWxfZmx1c2hfdGxiX3BhZ2UqCj4gPiBmdW5jdGlvbnMgd291bGQgcHJl
ZmVyIHRvIHVzZSB0aGUgZm9sbG93aW5nIHNlcXVlbmNlCj4gPiB0byBvcHRpbWl6ZSB0aGUgdGxi
IGZsdXNoZXMgaW5zdGVhZCBvZiBhIHNpbXBsZSBzZmVuY2Uudm1hOgo+ID4KPiA+IHNmZW5jZS53
LmludmFsCj4gPiBzdmludmFsLnZtYQo+ID4gICAgLgo+ID4gICAgLgo+ID4gc3ZpbnZhbC52bWEK
PiA+IHNmZW5jZS5pbnZhbC5pcgo+ID4KPiA+IFRoZSBtYXhpbXVtIG51bWJlciBvZiBjb25zZWN1
dGl2ZSBzdmludmFsLnZtYSBpbnN0cnVjdGlvbnMKPiA+IHRoYXQgY2FuIGJlIGV4ZWN1dGVkIGlu
IGxvY2FsX2ZsdXNoX3RsYl9wYWdlKiBmdW5jdGlvbnMgaXMKPiA+IGxpbWl0ZWQgdG8gUFRSU19Q
RVJfUFRFLiBUaGlzIGlzIHJlcXVpcmVkIHRvIGF2b2lkIHNvZnQKPiA+IGxvY2t1cHMgYW5kIHRo
ZSBhcHByb2FjaCBpcyBzaW1pbGFyIHRvIHRoYXQgdXNlZCBpbiBhcm02NC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+
ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyB8IDYyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gaW5kZXggNzdiZTU5
YWFkYzczLi5hZGUwYjVjZjhiNDcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZs
dXNoLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gQEAgLTUsNiArNSwx
MiBAQAo+ID4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiA+ICAgI2luY2x1ZGUgPGFzbS9z
YmkuaD4KPiA+ICAgI2luY2x1ZGUgPGFzbS9tbXVfY29udGV4dC5oPgo+ID4gKyNpbmNsdWRlIDxh
c20vaHdjYXAuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2luc24tZGVmLmg+Cj4gPiArCj4gPiArI2Rl
ZmluZSBoYXNfc3ZpbnZhbCgpICAgICAgICByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJ
U0NWX0lTQV9FWFRfU1ZJTlZBTCkKPiA+ICsKPiA+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyB0bGJf
Zmx1c2hfYWxsX3RocmVzaG9sZCBfX3JlYWRfbW9zdGx5ID0gUFRSU19QRVJfUFRFOwo+Cj4KPiBU
aGUgdGhyZXNob2xkIGlzIHF1aXRlIGhpZ2ggdG8gbWU6IGludGVybmFsbHksIHdlIGNvbXB1dGVk
IHRoYXQKPiBzb21ldGhpbmcgbGlrZSA1MCB3b3VsZCBiZSBhIGdvb2QgYmV0LCBiZWNhdXNlIHRv
IG1lLCA1MTIgKiBzZmVuY2Uudm1hCj4gKG9yIHN2aW52YWwgZXF1aXZhbGVudCkgdGFrZXMgd2F5
IG1vcmUgdGltZSB0aGFuIGp1c3QgZmx1c2hpbmcgdGhlIHdob2xlCj4gdGxiIChldmVuIHdpdGgg
dGhlIHdob2xlIHJlZmlsbCBJJ2Qgc2F5KS4gSG93IGRpZCB5b3UgZ2V0IHRoaXMgbnVtYmVyPwo+
IEFuZCB0aGlzIHZhbHVlIGlzIG1pY3JvLWFyY2hpdGVjdHVyZSBkZXBlbmRlbnQsIHNvIHdlIG5l
ZWQgdG8gZmluZCBhCj4gY29uc2Vuc3VzIG9yIGEgbWVjaGFuaXNtIHRvIGFsbG93IGEgdmVuZG9y
IHRvIGNoYW5nZSBpdC4KSSBoYWQgYm9ycm93ZWQgdGhpcyBsaW1pdCBmcm9tIEFSTTY0IGJ1dCBJ
IGFncmVlIHRoYXQgdGhpcyBpcwptaWNyby1hcmNoaXRlY3R1cmUgc3BlY2lmaWMuClNvIGhvdyBh
Ym91dCB3ZSBtYWtlIHRoaXMgYSBnbG9iYWwgdmFyaWFibGUgYW5kIGxldCB0aGUgcGxhdGZvcm0g
b3ZlcnJpZGUgaXQ/Cj4KPiBGWUksIHg4NiB0aHJlc2hvbGQgaXMgMzMgKGNhbid0IGZpbmQgcmln
aHQgbm93IHRoZSBwb2ludGVyIHNvcnJ5KS4KPgo+Cj4gPgo+ID4gICBzdGF0aWMgaW5saW5lIHZv
aWQgbG9jYWxfZmx1c2hfdGxiX2FsbF9hc2lkKHVuc2lnbmVkIGxvbmcgYXNpZCkKPiA+ICAgewo+
ID4gQEAgLTI2LDE5ICszMiw2MyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxi
X3BhZ2VfYXNpZCh1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBs
b2NhbF9mbHVzaF90bGJfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIHN0cmlkZSkKPiA+ICAgewo+ID4g
LSAgICAgaWYgKHNpemUgPD0gc3RyaWRlKQo+ID4gLSAgICAgICAgICAgICBsb2NhbF9mbHVzaF90
bGJfcGFnZShzdGFydCk7Cj4gPiAtICAgICBlbHNlCj4gPiArICAgICBpZiAoKHNpemUgLyBzdHJp
ZGUpIDw9IHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkKSB7Cj4KPgo+IElmIHNpemUgaXMgbm90IGFs
aWduZWQgb24gc3RyaWRlLCB5b3UgY291bGQgZ2V0IGFub3RoZXIgcGFnZSB0byBmbHVzaCBzbwo+
IHlvdSBkbyBub3QgcmVzcGVjdCB0aGUgdGhyZXNob2xkLiBJbiBteSBwYXRjaHNldCwgSSB1c2Vk
IERJVl9ST1VORF9VUC4KT2suIFdpbGwgY2hhbmdlIGl0IGluIHRoZSBuZXh0IHJldmlzaW9uLgo+
Cj4KPiA+ICsgICAgICAgICAgICAgaWYgKGhhc19zdmludmFsKCkpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBhc20gdm9sYXRpbGUoU0ZFTkNFX1dfSU5WQUwoKSA6OjogIm1lbW9yeSIpOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHdoaWxlIChzaXplKSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoU0lOVkFMX1ZNQSglMCwgemVybykKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IDogInIiIChzdGFydCkg
OiAibWVtb3J5Iik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydCArPSBz
dHJpZGU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoc2l6ZSA+IHN0cmlk
ZSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSAtPSBzdHJp
ZGU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgPSAwOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoU0ZFTkNFX0lO
VkFMX0lSKCkgOjo6ICJtZW1vcnkiKTsKPiA+ICsgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICB3aGlsZSAoc2l6ZSkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX3BhZ2Uoc3RhcnQpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHNpemUgPiBzdHJpZGUpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemUgLT0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aXplID0gMDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIH0K
PiA+ICsgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwo
KTsKPiA+ICsgICAgIH0KPiA+ICAgfQo+ID4KPiA+ICAgc3RhdGljIGlubGluZSB2b2lkIGxvY2Fs
X2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBzdHJpZGUsIHVuc2lnbmVkIGxv
bmcgYXNpZCkKPiA+ICAgewo+ID4gLSAgICAgaWYgKHNpemUgPD0gc3RyaWRlKQo+ID4gLSAgICAg
ICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZV9hc2lkKHN0YXJ0LCBhc2lkKTsKPiA+IC0gICAg
IGVsc2UKPiA+ICsgICAgIGlmICgoc2l6ZSAvIHN0cmlkZSkgPD0gdGxiX2ZsdXNoX2FsbF90aHJl
c2hvbGQpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKGhhc19zdmludmFsKCkpIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoU0ZFTkNFX1dfSU5WQUwoKSA6OjogIm1lbW9y
eSIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHdoaWxlIChzaXplKSB7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoU0lOVkFMX1ZNQSglMCwgJTEpIDog
OiAiciIgKHN0YXJ0KSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiciIgKGFzaWQpIDogIm1lbW9yeSIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHNpemUgPiBzdHJpZGUpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNpemUgLT0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxz
ZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID0gMDsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYXNtIHZv
bGF0aWxlKFNGRU5DRV9JTlZBTF9JUigpIDo6OiAibWVtb3J5Iik7Cj4gPiArICAgICAgICAgICAg
IH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgd2hpbGUgKHNpemUpIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX2FzaWQoc3Rh
cnQsIGFzaWQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKz0gc3Ry
aWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNpemUgPiBzdHJpZGUp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgLT0gc3RyaWRl
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID0gMDsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICB9Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAg
ICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGxfYXNpZChhc2lkKTsKPiA+ICsgICAgIH0KPiA+ICAg
fQo+ID4KPiA+ICAgc3RhdGljIHZvaWQgX19pcGlfZmx1c2hfdGxiX2FsbCh2b2lkICppbmZvKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
