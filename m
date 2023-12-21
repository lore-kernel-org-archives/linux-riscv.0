Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2D9C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 02:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHkyJYeWVEjw0T3A6xGLTYGauaDRcNVFM+PRl7Armec=; b=T0mYKlsMZ05FmF
	b/ZQF3oX3fCh4wB+rJyD+mRrCoYJhzVxh+nnM8Y68yPRPY6U48eJ6bduC2rDdihTlCTWhM9Q/zqbl
	6MitEIjcj4URy4tYtUb4EbvYLJfaZsUtB87Yu3zL/iiDgedO79sAV88XQI9rytad+CQvB7nVtPS2N
	BwI0fBlard4wLgmKqRfGaW/BiLSc+H3IjRI3svnVZvZb1SSmHiWKhJM9lsdtI4bZfpKDFibtlP9e5
	mINE2srIqs6jNd4jGs3JXZv0i3ZI6aSY7jOcTTowq0zb/JL5udI6Bc0Gc/PE0tPgoZLi2471teSPg
	2n7GhrgWphgn9d99l3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9H3-001XF4-2A;
	Thu, 21 Dec 2023 02:59:01 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9Gz-001XDw-1x;
	Thu, 21 Dec 2023 02:58:58 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2cc259392a6so2918541fa.2;
        Wed, 20 Dec 2023 18:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703127533; x=1703732333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bBzkO/x8C7pW+ybw+V7AQ5yP+2vx9qyk2y1ClRHSZw=;
        b=IuSqF3XpdVjUuOTTbt/XmAQuZIzjKEx2porSpblycV+dh8T01jMpKUIDCHVxJfGEZC
         eI4IDjer3M6QItXXj4DfZ1HpUZl79IWOtHNFkLt6uqIA3CkgQoHuBVwOZ7wFHP2nfIM/
         uFRHGVEyD17U19iD2I2AOTf77VBcOMN7Hqe5I8ZqRiu6cNLloNzQMiTkLeXTJa1X5BaU
         1zpO7SKfvzAqRjY1tXAG6J4RAqdkGOqRD4m38OHALgNGhUXf1IZnvWlKbO7grpoVUvj9
         h+bZqxL0YMO7GVeGfoGB0OUnDjGbBdQAs99L/dE+xyx8iYAKFCZmfzOuXSrR5svHAw0J
         D+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703127533; x=1703732333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bBzkO/x8C7pW+ybw+V7AQ5yP+2vx9qyk2y1ClRHSZw=;
        b=u/d/+pyZdiESWMe+jPPB8MqwWFVXsq+oRIKFFh7U9Bqsi6SAJIHMPJEAEEAMe6RCCL
         WTCQ8MFCoKtSa9xeG/vnG54i48X0r3ooh+zvQyxPvsrLIL77mjOGb6CEUPWWDeV+xi0D
         azMa81VDwV3JEIYJlqjgfljVVlkD1s+5Q3avV2glFo4Cf3r3vsaeyxePiZWOLzow4Zh9
         j7YpzPoOsqBzxwbgFT9kpWSw3AL55/jgXLS1+7k/Ebhr5njvK6uxA9nr1wbPwybIj+kG
         OML1KMrAhaC+LxRgZkpGLVOcjKiKg+iL+i9XQtP1K+FFXei9v6TZrZGmdtnfEwIEPI2w
         nd2Q==
X-Gm-Message-State: AOJu0YxvPNw3ddpu+KuS3nzEAqnouEhkVP+o/5MFTwDDW+8Q6DO6Y1g1
	ABEbx4qgMDgfRYK9G2S6Fj8Gk3va0qrJ2ph5xVk=
X-Google-Smtp-Source: AGHT+IGJHPrvnGt2Ru34bEuu9VEKW4Ddr4y1BwS+bbHJIUMRrvHhhF9Knr8M3TPrt5vBdMTPh9CciXS8rGxFOeFA2n4=
X-Received: by 2002:a2e:95d2:0:b0:2cc:7c8c:574b with SMTP id
 y18-20020a2e95d2000000b002cc7c8c574bmr1956176ljh.77.1703127532313; Wed, 20
 Dec 2023 18:58:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702371136.git.haibo1.xu@intel.com> <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org> <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
 <f98879dc24f948f7a8a7b5374a32bc04@kernel.org> <CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
 <87zfy5t1qt.wl-maz@kernel.org>
In-Reply-To: <87zfy5t1qt.wl-maz@kernel.org>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 21 Dec 2023 10:58:40 +0800
Message-ID: <CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] KVM: selftests: Enable tunning of err_margin_us
 in arch timer test
To: Marc Zyngier <maz@kernel.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, 
	wchen <waylingii@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Minda Chen <minda.chen@starfivetech.com>, 
	Samuel Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_185857_660297_F42837E7 
X-CRM114-Status: GOOD (  26.70  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgOTo1OOKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMCBEZWMgMjAyMyAxMzo1MToyNCArMDAwMCwKPiBI
YWlibyBYdSA8eGlhb2JvNTV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBEZWMg
MjAsIDIwMjMgYXQgNTowMOKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiAyMDIzLTEyLTIwIDA2OjUwLCBIYWlibyBYdSB3cm90ZToKPiA+ID4g
PiBPbiBXZWQsIERlYyAyMCwgMjAyMyBhdCAyOjIy4oCvQU0gTWFyYyBaeW5naWVyIDxtYXpAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4+Cj4gPiA+ID4+IE9uIFR1ZSwgMTIgRGVjIDIwMjMgMDk6
MzE6MjAgKzAwMDAsCj4gPiA+ID4+IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90
ZToKPiA+ID4gPj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2lu
Y2x1ZGUvdGltZXJfdGVzdC5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUv
dGltZXJfdGVzdC5oCj4gPiA+ID4+ID4gaW5kZXggOTY4MjU3Yjg5M2E3Li5iMWQ0MDVlNzE1N2Qg
MTAwNjQ0Cj4gPiA+ID4+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvdGltZXJfdGVzdC5oCj4gPiA+ID4+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4gPiA+ID4+ID4gQEAgLTIyLDYgKzIyLDcgQEAgc3Ry
dWN0IHRlc3RfYXJncyB7Cj4gPiA+ID4+ID4gICAgICAgaW50IG5yX2l0ZXI7Cj4gPiA+ID4+ID4g
ICAgICAgaW50IHRpbWVyX3BlcmlvZF9tczsKPiA+ID4gPj4gPiAgICAgICBpbnQgbWlncmF0aW9u
X2ZyZXFfbXM7Cj4gPiA+ID4+ID4gKyAgICAgaW50IHRpbWVyX2Vycl9tYXJnaW5fdXM7Cj4gPiA+
ID4+Cj4gPiA+ID4+IC4uLiBleGNlcHQgdGhhdCB5b3UgYXJlIHN0b3JpbmcgaXQgYXMgYSBzaWdu
ZWQgdmFsdWUuIFNvbWUgY29uc2lzdGVuY3kKPiA+ID4gPj4gd291bGRuJ3QgaHVydCwgcmVhbGx5
LCBhbmQgd291bGQgYXZvaWQgaXNzdWVzIHdoZW4gcGFzc2luZyBsYXJnZQo+ID4gPiA+PiB2YWx1
ZXMuCj4gPiA+ID4+Cj4gPiA+ID4KPiA+ID4gPiBZZXMsIGl0J3MgbW9yZSBwcm9wZXIgdG8gdXNl
IGFuIHVuc2lnbmVkIGludCBmb3IgdGhlIG5vbi1uZWdhdGl2ZSBlcnJvcgo+ID4gPiA+IG1hcmdp
bi4KPiA+ID4gPiBTdG9yaW5nIGFzIHNpZ25lZCBoZXJlIGlzIGp1c3QgdG8ga2VlcCB0aGUgdHlw
ZSBjb25zaXN0ZW50IHdpdGggdGhhdAo+ID4gPiA+IG9mIHRpbWVyX3BlcmlvZF9tcwo+ID4gPiA+
IHNpbmNlIHRoZXJlIHdpbGwgYmUgJysnIG9wZXJhdGlvbiBpbiBvdGhlciBwbGFjZXMuCj4gPiA+
ID4KPiA+ID4gPiAgICAgICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2Fy
Y2hfdGltZXIuYwo+ID4gPiA+ICAgICAgICAgLyogU2V0dXAgYSB0aW1lb3V0IGZvciB0aGUgaW50
ZXJydXB0IHRvIGFycml2ZSAqLwo+ID4gPiA+ICAgICAgICAgIHVkZWxheShtc2Vjc190b191c2Vj
cyh0ZXN0X2FyZ3MudGltZXJfcGVyaW9kX21zKSArCj4gPiA+ID4gICAgICAgICAgICAgIHRlc3Rf
YXJncy50aW1lcl9lcnJfbWFyZ2luX3VzKTsKPiA+ID4KPiA+ID4gQnV0IHRoYXQncyBleGFjdGx5
IHdoeSB1c2luZyBhIHNpZ25lZCBxdWFudGl0eSBpcyB3cm9uZy4KPiA+ID4gV2hhdCBkb2VzIGl0
IG1lYW4gdG8gaGF2ZSBhIGh1Z2UgKm5lZ2F0aXZlKiBtYXJnaW4/Cj4gPiA+Cj4gPgo+ID4gSGkg
TWFyYywKPiA+Cj4gPiBJIGFncmVlIHRoYXQgbmVnYXRpdmUgdmFsdWVzIGFyZSBtZWFuaW5nbGVz
cyBmb3IgdGhlIG1hcmdpbi4KPiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBuZWdh
dGl2ZSBtYXJnaW4gc2hvdWxkIGJlIGZpbHRlcmVkIGJ5Cj4gPiBhc3NlcnRpb24gaW4gYXRvaV9u
b25fbmVnYXRpdmUoKS4KPgo+IE5vLiBQbGVhc2UuCj4KPiBhdG9pX25vbl9uZWdhdGl2ZSgpIHJl
dHVybnMgYSB1aW50MzJfdCwgd2hpY2ggaXMgd2hhdCBpdCBzaG91bGQgZG8uCj4gVGhlIGJ1ZyBp
cyBzcXVhcmVseSBpbiB0aGUgdXNlIG9mIGFuICdpbnQnIHRvIHN0b3JlIHN1Y2ggdmFsdWUsIGFu
ZCBpdAo+IGlzIHRoZSAqc3RvcmFnZSogdGhhdCB0dXJucyBhIHBvc2l0aXZlIHZhbHVlIGludG8g
YSBuZWdhdGl2ZSBvbmUuCj4KClRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGluZm8hCgpNYXkgSSB1
bmRlcnN0YW5kIHRoYXQgeW91ciBjb25jZXJuIGlzIG1haW5seSBmb3IgYSBwbGF0Zm9ybSB3aXRo
IDY0Yml0IGludCB0eXBlLAp3aGljaCBtYXkgdHJpZ2dlciB0aGUgcG9zaXRpdmUgdG8gbmVnYXRp
dmUgY29udmVydD8KCklmIHNvLCBJIHRoaW5rIHdlIG1heSBuZWVkIHRvIGRvIGEgY2xlYW4gdXAg
Zm9yIHRoZSB0ZXN0IGNvZGUgc2luY2UKc2V2ZXJhbCBvdGhlcgpwbGFjZXMgaGF2ZSB0aGUgc2Ft
ZSBpc3N1ZS4KClJlZ2FyZHMsCkhhaWJvCgo+ICAgICAgICAgTS4KPgo+IC0tCj4gV2l0aG91dCBk
ZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3MgaXMgbm90IHBvc3NpYmxlLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
