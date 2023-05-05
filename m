Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6C4C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwuMtoonjIr8miqxan8GxpEFP5H7+jdmfyOaIh9LDyQ=; b=wH49jxt4yt+/Bf
	Owfo5nVIoX5ndj36ku8xHQoPbfl3pAhpasFGpYGCjrP7uwdQbmVKsGn19EnMX0+fihnXK9zEojp8o
	tg0YTf/XzPt3aL2kfUO5YgDpHqWDHK00XsJQHnFHUzr+0n0Fm8GLPxXhHtSbkR9+ftgHSR6dOjfGb
	Xy8f8Q4FLMu+gzmVaRic35rUuInTAo2Qhb44qntvCd0V393lrOzUareuVmpCa90ozNOxZy2xnmejW
	aC+oZ4XIbITH2/ifFyV2nwTbRHERvhUTfFCTPOO1EI7kQEB9N2fTjg/TaFHs52A33hprd9pLOBx7T
	Hbypqh2vdIbAUN8NZFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pusSW-00AFOm-1M;
	Fri, 05 May 2023 10:14:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pusST-00AFNr-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 10:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683281674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPVIM24PKk5g37ZHgBt57G9GRMgxgcEe7F5iaLYcDqI=;
	b=L/TDs5PAOOPDvU8UwNBPA8QNrhydBmnrLSL7vtoZq4U0uvSPfprlr+U+aT2+VLi7yQF/je
	96NKj7+o92NsYhGO+GBAuRGG9XiUJVXC5sTkoABkkzO2yUeGZA5V6J6Hi/usYO0Hw+pbnJ
	Asd8cDftqacbQmm+2X6jf7awmCdtTGo=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-a4b9WPKjMy6XFiZPPC1hfw-1; Fri, 05 May 2023 06:14:33 -0400
X-MC-Unique: a4b9WPKjMy6XFiZPPC1hfw-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-44fb594a277so1117356e0c.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 03:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683281673; x=1685873673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPVIM24PKk5g37ZHgBt57G9GRMgxgcEe7F5iaLYcDqI=;
        b=X+uJSLkIvvu1OspOwe2U97suwTudml4elSvQK2XRgY5IKOGmUZon+kCanKLeRkdK3z
         YAvMW1tp3cYWYnIpHqrI/3Gd9FkLaFKv9NEbnjkJvHFk+ED5SK6zVzqioz0Vo6h7wehD
         lPkxyXbSTt2QjhpfYzuCpz3TRzTGYKnEz2XPqiNMKFjgrFfUBrvqAKCj4zMEcFY1w0Xc
         ws4IuKBcB+y2jv9Nf2iWnrMsDmUNpGphcml8r1IKeaZyVs22KfJf40DlPMhv4Mm0v+v2
         wC8jGxTsBaVXF+c1n5Gsc5En7tf0D1A8q8asxK2X3Tu5JFIcAAjJxVAOb3AoL8SrWKMP
         l6EA==
X-Gm-Message-State: AC+VfDyBrpFuJdmUwOSjx25Q7OvAECrKsXFuJSnGB5vCVpQ/7caedLGI
	zm41BZFhaWHFIs2t98ehWY9D5cJbAO/92dKVj4ewd8QooabO/EgBeqQmXd+Rn217kfZN2nBaYds
	BCcNIIVM/usoh/pgqvJA9/zrrM7JcgyafjiW/nyDi8sy/
X-Received: by 2002:a67:ed8b:0:b0:42f:fca5:981e with SMTP id d11-20020a67ed8b000000b0042ffca5981emr292989vsp.2.1683281673334;
        Fri, 05 May 2023 03:14:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kgYekDc5jvZq85aeZ+Rv0kw0bccU6lCf3wGCZ87x22sGLYSiEwuOcajU5MZTaLvD93DtKk/3CTlGt+nLMHz4=
X-Received: by 2002:a67:ed8b:0:b0:42f:fca5:981e with SMTP id
 d11-20020a67ed8b000000b0042ffca5981emr292984vsp.2.1683281673030; Fri, 05 May
 2023 03:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
In-Reply-To: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 5 May 2023 12:14:22 +0200
Message-ID: <CABgObfYtH-Lxsoe+X1FVv3s_q6N07pvfxQ6Ta5yDtepExteePw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.4
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_031437_300212_C1966E58 
X-CRM114-Status: GOOD (  17.00  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgNzozNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjQ6Cj4gMSkgT05FX1JFRyBpbnRlcmZhY2UgdG8gZW5h
YmxlL2Rpc2FibGUgU0JJIGV4dGVuc2lvbnMKPiAyKSBaYmIgZXh0ZW5zaW9uIGZvciBHdWVzdC9W
TQo+IDMpIEFJQSBDU1IgdmlydHVhbGl6YXRpb24KPiA0KSBGZXcgbWlub3IgY2xlYW51cHMgYW5k
IGZpeGVzCj4KPiBQbGVhc2UgcHVsbC4KPgo+IFBsZWFzZSBub3RlIHRoYXQgdGhlIFppY2JveiBz
ZXJpZXMgaGFzIGJlZW4gdGFrZW4gYnkKPiBQYWxtZXIgdGhyb3VnaCB0aGUgUklTQy1WIHRyZWUg
d2hpY2ggcmVzdWx0cyBpbiBmZXcKPiBtaW5vciBjb25mbGljdHMgaW4gdGhlIGZvbGxvd2luZyBm
aWxlczoKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBhcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20va3ZtLmgKPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IGFyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwo+IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+Cj4gSSBhbSBub3Qg
c3VyZSBpZiBhIHNoYXJlZCB0YWcgY2FuIG1ha2UgdGhpbmdzIGVhc3kKPiBmb3IgeW91IG9yIFBh
bG1lci4KCkRvbmUsIGZpbmFsbHkuCgpUaGFua3MsCgpQYW9sbwoKPiBSZWdhcmRzLAo+IEFudXAK
Pgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmE4ZjU3YWUyZWIwN2FiMzlh
NmYwY2NhZDYwYzc2MDc0MzA1MTAyNjoKPgo+ICAgTGludXggNi4zLXJjNyAoMjAyMy0wNC0xNiAx
NToyMzo1MyAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1y
aXNjdi02LjQtMQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJmNGQ1OGY3NjM1
YWVjMDE0NDI4ZTczZWY2MTIwYzRkMDM3N2M0MzA6Cj4KPiAgIFJJU0MtVjogS1ZNOiBWaXJ0dWFs
aXplIHBlci1IQVJUIEFJQSBDU1JzICgyMDIzLTA0LTIxIDE4OjEwOjI3ICswNTMwKQo+Cj4gLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+IEtWTS9yaXNjdiBjaGFuZ2VzIGZvciA2LjQKPgo+IC0gT05FX1JFRyBpbnRlcmZhY2Ug
dG8gZW5hYmxlL2Rpc2FibGUgU0JJIGV4dGVuc2lvbnMKPiAtIFpiYiBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNCj4gLSBBSUEgQ1NSIHZpcnR1YWxpemF0aW9uCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQW5kcmV3IEpv
bmVzICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogQWxwaGFiZXRpemUgc2VsZWN0cwo+Cj4gQW51
cCBQYXRlbCAoMTApOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2Ug
dG8gZW5hYmxlL2Rpc2FibGUgU0JJIGV4dGVuc2lvbnMKPiAgICAgICBSSVNDLVY6IEtWTTogQWxs
b3cgWmJiIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAgICAgICBSSVNDLVY6IEFkZCBBSUEgcmVs
YXRlZCBDU1IgZGVmaW5lcwo+ICAgICAgIFJJU0MtVjogRGV0ZWN0IEFJQSBDU1JzIGZyb20gSVNB
IHN0cmluZwo+ICAgICAgIFJJU0MtVjogS1ZNOiBEcm9wIHRoZSBfTUFTSyBzdWZmaXggZnJvbSBo
Z2F0cC5WTUlEIG1hc2sgZGVmaW5lcwo+ICAgICAgIFJJU0MtVjogS1ZNOiBJbml0aWFsIHNrZWxl
dGFsIHN1cHBvcnQgZm9yIEFJQQo+ICAgICAgIFJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3VidHlw
ZSBmb3IgQ1NSIE9ORV9SRUcgaW50ZXJmYWNlCj4gICAgICAgUklTQy1WOiBLVk06IEFkZCBPTkVf
UkVHIGludGVyZmFjZSBmb3IgQUlBIENTUnMKPiAgICAgICBSSVNDLVY6IEtWTTogVXNlIGJpdG1h
cCBmb3IgaXJxc19wZW5kaW5nIGFuZCBpcnFzX3BlbmRpbmdfbWFzawo+ICAgICAgIFJJU0MtVjog
S1ZNOiBWaXJ0dWFsaXplIHBlci1IQVJUIEFJQSBDU1JzCj4KPiBEYXZpZCBNYXRsYWNrICgxKToK
PiAgICAgICBLVk06IFJJU0MtVjogUmV0cnkgZmF1bHQgaWYgdm1hX2xvb2t1cCgpIHJlc3VsdHMg
YmVjb21lIGludmFsaWQKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgICAg
IHwgMTA3ICsrKysrKysrKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAg
ICB8ICAgOCArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAgICAgfCAxMjcg
KysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICB8ICAx
NCArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgICA4ICstCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgfCAgNTEgKysrKy0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgfCAgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS9LY29u
ZmlnICAgICAgICAgICAgICAgIHwgIDEwICstCj4gIGFyY2gvcmlzY3Yva3ZtL01ha2VmaWxlICAg
ICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAg
ICAgIHwgMzg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNj
di9rdm0vbWFpbi5jICAgICAgICAgICAgICAgICB8ICAyMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9t
bXUuYyAgICAgICAgICAgICAgICAgIHwgIDI4ICsrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
ICAgICAgICAgICAgICAgIHwgMTk0ICsrKysrKysrKysrKystLS0tCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfaW5zbi5jICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aS5jICAgICAgICAgICAgIHwgMjQ3ICsrKysrKysrKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfYmFzZS5jICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS92
bS5jICAgICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgYXJjaC9yaXNjdi9rdm0vdm1pZC5jICAg
ICAgICAgICAgICAgICB8ICAgNCArLQo+ICAxOSBmaWxlcyBjaGFuZ2VkLCAxMTI5IGluc2VydGlv
bnMoKyksIDkxIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fYWlhLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
