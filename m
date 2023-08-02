Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C326C00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 23:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBramXL7KvjCPRJil+dZvBFcroOepzIf/howiRPqhIk=; b=TGQ5UvEOk8NaVs
	0kMW3nC0LaUL52thYDqJLJ92ddUfzQYNJNIWRnA5ZCbdbhLeYwurplJTxKGVrGkdyUmBb/j/z54gv
	lZ+fZrGGd5HoBe4aPbzSTEMVcA+7Va9kGs0CVMH6eMMHt67yk0d+Oo6/kiusYyhh/7Fed6puqgqZ1
	s3y+f4IOr5azXsbEw8oV+3Ao4HE87FZUFsO1ilkW/zVAuo+FE41SMm+K8Bu+TTKujQwo+BOEzXbmk
	GOiYF8smEHnmmIpmSEwJ0Q0dlTpEovmVeymILsWQGjmBBhi69qtacVqr2W+xkvwAthGI4jVPqYoxG
	WhskO4pY9QdO6RALooWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLHC-0067wA-0v;
	Wed, 02 Aug 2023 23:29:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLHA-0067uE-0J
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 23:29:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bc0075ab7aso35925ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 16:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691018944; x=1691623744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4Cpxp6Pku565KQX/OGtqaeqvGA0IKhVwq6ynNOZ9r0=;
        b=fFTplzOAgW5+YW0+6iv4fkiN86H6j11X1pwoSxH+UbZ6p7iYCmpU0kuNqQBfel9T5G
         TeHCwy18VTn4JwR0FocGU0dkHDSQ01w0aCShr72E11WRUJ0CH751ArFGzoZUkTYgcDou
         gpT/KoBW3YaVs/k6v5HBuDGdwQ8fJdnUpJjdrS7LEtN9Uwz7yeQN9HB4kn1GVc0KUKqc
         DmlFiExHRsSljlkGVAJKSI7bbzKb2/ECq55k51gfA8LRkuFLjGvgB4kOf7KBZm79RD0a
         40vexDUVr9QAtQr7cD7Kllq93RNs7LMjDkavplv45/IYcQbfxyQND1D7JcDZaz5TIdZ5
         l/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691018944; x=1691623744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4Cpxp6Pku565KQX/OGtqaeqvGA0IKhVwq6ynNOZ9r0=;
        b=YaWgHvyClFe/L/eUUvVstISAiuFI75cx7z1ZZpO3D8840zwUP0Zb3JlBYn5tTgWY9V
         lp+VyLDSxxYf8nTRBr6T4dQn23QhkfBiK+ysN3nu5Fwfv41+fuwMMl2q8e4QaAjiqHQJ
         oCbxccfwUm/RvXW3kkscpQrVBL+A1chxqyC7G/8kZu0EH1BPLi2Hj++HBbL8w1UUfpKR
         iFgkRQEVw87fpatuUiWVa9PPvPqtGX5HyKoU0Tac+5dTXJAGjW+78CIYXT7cuu/6G+mh
         rrIlDv2MwfBFVGSfZ1PnVgqxCY7SjA1QMAN5Etybg2FUw14bwS57dhwpLJtoeNDiyRHV
         Oa9w==
X-Gm-Message-State: ABy/qLZvok3y7VsTwDvv/xNKBvle6v+a1uS71dp4QpQNte0ZlwYL4cNg
	fwevzf9H/75ylC2Q3ert97l3+bbFgYjaJp4Rrkpvaw==
X-Google-Smtp-Source: APBJJlG1dr/uy6dgVj2w+3yAHutiDqre/zphK0p3aHVqG2DYCooyBFbGflKhgzehlkYIwCQRRRLEXuzHej99+96ASLI=
X-Received: by 2002:a17:902:c40f:b0:1b0:53dc:1f78 with SMTP id
 k15-20020a170902c40f00b001b053dc1f78mr966525plk.28.1691018944272; Wed, 02 Aug
 2023 16:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org> <ZMgsjx8dwKd4xBGe@google.com> <877cqdqw12.wl-maz@kernel.org>
In-Reply-To: <877cqdqw12.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 2 Aug 2023 16:28:52 -0700
Message-ID: <CAJHc60xAUVt5fbhEkOqeC-VF8SWVOt3si=1yxVVAUW=+Hu_wNg@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_162908_152018_89E263BE 
X-CRM114-Status: GOOD (  18.20  )
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

U3VyZSwgSSdsbCBjaGFuZ2UgaXQgdG8ga3ZtX2FyY2hfZmx1c2hfdm1fdGxicygpIGluIHY4LgoK
VGhhbmtzLApSYWdoYXZlbmRyYQoKT24gV2VkLCBBdWcgMiwgMjAyMyBhdCA4OjU14oCvQU0gTWFy
YyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIDMxIEp1bCAyMDIz
IDIyOjUwOjA3ICswMTAwLAo+IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1bCAyNywgMjAyMywgTWFyYyBaeW5naWVyIHdyb3Rl
Ogo+ID4gPiBPbiBTYXQsIDIyIEp1bCAyMDIzIDAzOjIyOjQxICswMTAwLAo+ID4gPiBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gU3RvcCBkZXBlbmRpbmcgb24gQ09ORklHX0hBVkVfS1ZNX0FSQ0hfVExCX0ZMVVNIX0FMTCBh
bmQgb3B0IHRvCj4gPiA+ID4gc3RhbmRhcmRpemUgb24ga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YnMoKSBzaW5jZSBpdCBhdm9pZHMKPiA+ID4gPiBkdXBsaWNhdGluZyB0aGUgZ2VuZXJpYyBUTEIg
c3RhdHMgYWNyb3NzIGFyY2hpdGVjdHVyZXMgdGhhdCBpbXBsZW1lbnQKPiA+ID4gPiB0aGVpciBv
d24gcmVtb3RlIFRMQiBmbHVzaC4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgYWRkcyBhbiBleHRyYSBm
dW5jdGlvbiBjYWxsIHRvIHRoZSBBUk02NCBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoKQo+ID4gPiA+
IHBhdGgsIGJ1dCB0aGF0IGlzIGEgc21hbGwgY29zdCBpbiBjb21wYXJpc29uIHRvIGZsdXNoaW5n
IHJlbW90ZSBUTEJzLgo+ID4gPgo+ID4gPiBXZWxsLCB0aGVyZSBpcyBubyBzdWNoIHRoaW5nIGFz
IGEgInJlbW90ZSBUTEIiIGFueXdheS4gV2UgZWl0aGVyIGhhdmUKPiA+ID4gYSBub24tc2hhcmVh
YmxlIG9yIGlubmVyLXNoYXJlYWJsZSBpbnZhbGlkYXRpb24uIFRoZSBub3Rpb24gb2YgcmVtb3Rl
Cj4gPiA+IHdvdWxkIGltcGx5IHRoYXQgd2UgdHJhY2sgd2hvIHBvdGVudGlhbGx5IGhhcyBhIFRM
Qiwgd2hpY2ggd2UKPiA+ID4gb2J2aW91c2x5IGRvbid0Lgo+ID4KPiA+IE1heWJlIGt2bV9hcmNo
X2ZsdXNoX3ZtX3RsYnMoKT8gIFRoZSAicmVtb3RlIiBwYXJ0IGlzIG1pc2xlYWRpbmcgZXZlbiBv
biB4ODYgd2hlbgo+ID4gcnVubmluZyBvbiBIeXBlci1WLCBhcyB0aGUgZmx1c2ggbWF5IGJlIGRv
bmUgdmlhIGEgc2luZ2xlIGh5cGVyY2FsbCBhbmQgYnkga2lja2luZwo+ID4gInJlbW90ZSIgdkNQ
VXMuCj4KPiBZdXAsIHRoaXMgd291bGQgYmUgbXVjaCBiZXR0ZXIuCj4KPiBUaGFua3MsCj4KPiAg
ICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dy
ZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
