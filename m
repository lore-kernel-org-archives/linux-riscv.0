Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87A5C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3veuJIQjapSd6pIa9TfE9nnlde6HEMnwmvLNZ0vsls=; b=AGOYjXdHrtb3rV
	mJ49HpiInAekqfLnktLL9s7zG+UM6qXMkFPT0tMO05qiGkwJIqhFWaPQoZVriaZmZZAuKdZzkDuz5
	zJLgLsvlBysBhFkT5EMstdX+WCjgR6s5H+tuidiXX4435HB3AR3X7uKhm7PmMvy9iFli0K7cvBkTm
	qva55JaJPG/pss4etqAY0BXq7r+DfKYrTIk5KObUsB1g6J+DrHcB7e8n4Hq1gsT1vOP4fejG1e0dK
	Q1v8vQtz5FheEGovOiQLlBl8KdkWxVkIbBl1z1hHFk5oW4WIKAAcoLYPELZTzfSDfyK/8ht7fXw3n
	CYAX3jSnA0vhcOAudMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLJX-0068QP-2e;
	Wed, 02 Aug 2023 23:31:35 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLJT-0068OA-2J
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 23:31:33 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-348c7075afcso30425ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 16:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691019090; x=1691623890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6aDWW1qzsmHKwnYtEop3+qy3EYV7hPBKqzqy/Xvj3s=;
        b=m3NlnJaByfDr7ifVkA4srlAokcnVrFW3hDZwqBExiqhz24rs0QjM2nw/BsJBND5pr4
         mW9AqnlkRlkZElVUaCeZrttBixkxw3SRCaBG00nOi12/VpeLFGUYeY01TMCYMOl3+Tav
         DMmDZSMrZyf53Md4l2VEqpF5J/2e7WQ9uapV9VkkN0uoEYwSjnLRWHZAFc68fY/va7nY
         sYMH6TZb7CrcUljoIDnhXXxcRMO+K68PA3ew5CVCMs+lXOPx9XdxJaBWgJ4Iarmf8m3O
         /9j8tmIGjn580lJx6nvJDZgVg26+1gjB/A9scOVbUOLX23/TiZdgE9tEaoHaYbM06VME
         Mp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691019090; x=1691623890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6aDWW1qzsmHKwnYtEop3+qy3EYV7hPBKqzqy/Xvj3s=;
        b=f6qVmqSUXypZg2Rlezz5a3gzMTOPQ8V0za6x1PH+mtygy9VMz+F7Qx4or+XEoM3zrw
         wijhL0nJGQ3L7N5ilSzGfjkn0kxEmyvQGT7Etk1aGn15ciVcTUmq/JFJe2Pe+8qtmZyv
         yrOsAKtdy+3IYogxuAsx69NiJAlgYSDNkOl1iVDRQHkkLwiu5fhsLgADwZX698VIrpSt
         l0BHAuczNFzUQfCmXWas9pqdvfDjJDtrfxBxWTJq9SOSICu+EuVSN7cI7GNrYEmFntZw
         WCMHHXduQqUw6z5ZTcP2LZ51XRON2vWo9ObQK23Ye74nZPh50KJLj7s2FKHptcYocwdj
         aNIg==
X-Gm-Message-State: ABy/qLbPi0+iFJ5T6Ma9/LRrV0BjhSXLCtbudWO/FEfrkuwqYJtl46Gh
	pQN5/6HCv8w4yiw2iyr9he3LMNdI00YWE/5Si7EYJw==
X-Google-Smtp-Source: APBJJlHxlDzzHqPKBL2W2e8S5hxlmOS5GdG0S/eXkBRCshMRiYbddtmdl3QEWYXTh530kMhJWBHbbqF5IT4rpQ1iYo4=
X-Received: by 2002:a05:6e02:144d:b0:346:48bd:da43 with SMTP id
 p13-20020a056e02144d00b0034648bdda43mr1329597ilo.4.1691019090536; Wed, 02 Aug
 2023 16:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-7-rananta@google.com>
 <87r0otr579.wl-maz@kernel.org> <CAJHc60zqOeWXf3kh5hKL6DL3g4znmHaH-TqC0QDcBrWPsHAEXQ@mail.gmail.com>
 <875y5xqvvm.wl-maz@kernel.org>
In-Reply-To: <875y5xqvvm.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 2 Aug 2023 16:31:18 -0700
Message-ID: <CAJHc60zujOMwGUzc=yGeioy5Vz+wzx2HkcJpF=2aLDPZ-mVMEA@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
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
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_163131_758212_1714071B 
X-CRM114-Status: GOOD (  22.86  )
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

T24gV2VkLCBBdWcgMiwgMjAyMyBhdCA4OjU44oCvQU0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDMxIEp1bCAyMDIzIDE4OjM2OjQ3ICswMTAwLAo+IFJh
Z2hhdmVuZHJhIFJhbyBBbmFudGEgPHJhbmFudGFAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMzo1OOKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBTYXQsIDIyIEp1bCAyMDIzIDAzOjIyOjQ1ICsw
MTAwLAo+ID4gPiBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gQ3VycmVudGx5LCB0aGUgY29yZSBUTEIgZmx1c2ggZnVuY3Rp
b25hbGl0eSBvZiBfX2ZsdXNoX3RsYl9yYW5nZSgpCj4gPiA+ID4gaGFyZGNvZGVzIHZhZTFpcyAo
YW5kIHZhcmlhbnRzKSBmb3IgdGhlIGZsdXNoIG9wZXJhdGlvbi4gSW4gdGhlCj4gPiA+ID4gdXBj
b21pbmcgcGF0Y2hlcywgdGhlIEtWTSBjb2RlIHJldXNlcyB0aGlzIGNvcmUgYWxnb3JpdGhtIHdp
dGgKPiA+ID4gPiBpcGFzMmUxaXMgZm9yIHJhbmdlIGJhc2VkIFRMQiBpbnZhbGlkYXRpb25zIGJh
c2VkIG9uIHRoZSBJUEEuCj4gPiA+ID4gSGVuY2UsIGV4dHJhY3QgdGhlIGNvcmUgZmx1c2ggZnVu
Y3Rpb25hbGl0eSBvZiBfX2ZsdXNoX3RsYl9yYW5nZSgpCj4gPiA+ID4gaW50byBpdHMgb3duIG1h
Y3JvIHRoYXQgYWNjZXB0cyBhbiAnb3AnIGFyZ3VtZW50IHRvIHBhc3MgYW55Cj4gPiA+ID4gVExC
SSBvcGVyYXRpb24sIHN1Y2ggdGhhdCBvdGhlciBjYWxsZXJzIChLVk0pIGNhbiBiZW5lZml0Lgo+
ID4gPiA+Cj4gPiA+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+ID4gPiA+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50YUBnb29n
bGUuY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFy
aW5hc0Bhcm0uY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRo
YXQuY29tPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRo
YXQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RsYmZs
dXNoLmggfCAxMDkgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+ID4gPiBpbmRleCA0MTJhM2I5YTNjMjUu
LmY3ZmFmYmEyNWFkZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3RsYmZsdXNoLmgKPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKPiA+ID4gPiBAQCAtMjc4LDE0ICsyNzgsNjIgQEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNo
X3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ID4gPiA+ICAgKi8KPiA+ID4g
PiAgI2RlZmluZSBNQVhfVExCSV9PUFMgUFRSU19QRVJfUFRFCj4gPiA+ID4KPiA+ID4gPiArLyog
V2hlbiB0aGUgQ1BVIGRvZXMgbm90IHN1cHBvcnQgVExCIHJhbmdlIG9wZXJhdGlvbnMsIGZsdXNo
IHRoZSBUTEIKPiA+ID4gPiArICogZW50cmllcyBvbmUgYnkgb25lIGF0IHRoZSBncmFudWxhcml0
eSBvZiAnc3RyaWRlJy4gSWYgdGhlIFRMQgo+ID4gPiA+ICsgKiByYW5nZSBvcHMgYXJlIHN1cHBv
cnRlZCwgdGhlbjoKPiA+ID4KPiA+ID4gQ29tbWVudCBmb3JtYXQgKHRoZSBvcmlnaW5hbCB3YXMg
Y29ycmVjdCkuCj4gPiA+Cj4gPiBJc24ndCB0aGUgZm9ybWF0IHRoZSBzYW1lIGFzIG9yaWdpbmFs
PyBPciBhcmUgeW91IHJlZmVycmluZyB0byB0aGUKPiA+IGZhY3QgdGhhdCBpdCBuZWVkcyB0byBi
ZSBwbGFjZWQgaW5zaWRlIHRoZSBtYWNybyBkZWZpbml0aW9uPwo+Cj4gTm8sIEknbSByZWZlcnJp
bmcgdG8gdGhlIG11bHRpbGluZSBjb21tZW50IHRoYXQgc3RhcnRzIHdpdGg6Cj4KPiAgICAgICAg
IC8qICBXaGVuIHRoZSBDUFUgZG9lcyBub3Qgc3VwcG9ydCBUTEIgcmFuZ2Ugb3BlcmF0aW9ucy4u
Lgo+Cj4gaW5zdGVhZCBvZiB0aGUgcmVxdWlyZWQ6Cj4KPiAgICAgICAgIC8qCj4gICAgICAgICAg
KiBXaGVuIHRoZSBDUFUgZG9lcyBub3Qgc3VwcG9ydCBUTEIgcmFuZ2Ugb3BlcmF0aW9ucwo+Cj4g
d2hpY2ggd2FzIGNvcnJlY3QgYmVmb3JlIHRoZSBjb21lbnQgd2FzIG1vdmVkLgo+Ck9oIEkgc2Vl
ISBJJ2xsIGZpeCBpdCBpbiB2OC4KClRoYW5rcywKUmFnaGF2ZW5kcmEKPiBUaGFua3MsCj4KPiAg
ICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dy
ZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
