Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DD1CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 22:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Db+6xhxvTdWie2onjvUNeh8MUuob2A89J3FORtBPqqs=; b=CqFOKEWWUKlJmA
	vlicBOG3S/ggQL51wPvUzkCVeEHlzaaW+oSCtWmCwEdO3z6JS+Ijhx36Z8Na/ww72UBe/uvOc2MeI
	rLbNndtOHicHx//Mqc6MkvogdfqMgQk2nh0eafuwg0AZ1dA+CZftGSOeFj8WvuTnfU+vvr+ixGBib
	GNlEmUYH8Mh7V56Fg9/Ra7aVwBzLBD+6TAeIsuYNNs4SNtaEqiewqTn0eqOxECUICg/hRrIF95bjk
	lYpOvqx3r9/AnnhUiukMXjQntAGWz1xoUC8LkVN9TEOvFdSASdyk54e5wI+sNlpOY+y4lC5D93RsM
	baFOgLqvqGwkgP57lcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9t6V-000000098E0-0mJd;
	Fri, 17 Oct 2025 22:39:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9t6R-000000098CV-33zr
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 22:39:17 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59052926cf9so2696355e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760740753; x=1761345553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=;
        b=RSNEZMv+B+Pw9n60M6YAQCbXx2XBqc2gPj1nDGQICv7TMBR8dJKUE+/qqzEfbIRBQv
         95R/k4SAaWd2WuhEAhInlA0S/dQFyNihtz8uqA9LxOu7iCw1XL0IfPhAqmb7VzztMQEG
         nhtLd4+WygnMW364oK1EEmKkFu3aG5Nrm8y7iBkD+8pdsJKaFYKz8mhMyLEOrlj8L4MY
         ZLFG6nNNNo3GLZmT5F7aNPqqpNRgvfRzUAJAr/7PqXAlH5fJWUS70Z8iEGU+vbOOYyBa
         d2yEQLcRHRRWZtmJbAFNAiA6QDOLYG7pUhQTPw+sOvv8EL5s/BsDCkFADu0+fJZ6v7XT
         gpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760740753; x=1761345553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoqzKQNFCddpnwTwWMxWSsHCHOracpeEvFEON9b+5D0=;
        b=CAVk2y5NB93I40BT5qwHV3vFkvaDPCRgntq7qU+dgYh1wkiByfKvDeSBSDJanWqPc+
         AieOCEmB7WPrYd8NXZCYONCgzUx+xk4yO29CBeNaxkuKZBrKE/Pl7EfuknJgyiJkZSiC
         Qqw6twe5STbCDkgZ/GWT+4FzKRDnFNIMjyrGTaFrLG8D/8OZQV/IUWLM8XuYoV9Hcvr/
         Tlbed4KWRLJJfqRX2xT7qnzqCAFokSdVah998yJhVhYsPOBFHOhKJYhQFmmaieoY1oPB
         m/jmVuoeK3YLwsC/3uXIDWoMhLaUyNhBp6TsheAAvX4budqaM4ZiMDZQSGj5tFHGI6cz
         jgaA==
X-Forwarded-Encrypted: i=1; AJvYcCWlp6ZmDUjCdqad/G0/Z3MT8Ug5IGOrC1LQjvkQD4HDkinwGJHJKZ6H8RQdGmKz+BXts9lV4BS5DAsNQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNB8fwYihXeNrku23pPkxWsy6521DejCWxvAjo9xEt3zK95Fsw
	9mGtEyuWDNlmUAityV8lIGL44ix35/THkBFiAkOjFRR5aBZzsy/76So592W0KZsq3atuUztlnMY
	KB1hSjZNjZ4yQNBZOi49ZbpPGBinrm5IGMZ5EJpog
X-Gm-Gg: ASbGncufFS1C3jrmsvHuTdudJ0XMaBEQwY2EUSqqW2V1tm2oJOQyXpC2iIZ++KbLsAC
	hbTm+3iTQdsC0iyXeWHr1Yl4uwTOsYysMvHSBai9XjkzAYQZkb2WyTI3euzEieATReedVL9+mrl
	eZCYEd8nNAFGhHz004NF2ci8ouDlEFX8UXFWqflrPo8Vp8W2CO8EU26VqNneXnJ9nF4Tq+nyKny
	8rXVEuU6kroywZ2xgbzNOjwu0AT5RjCkit2Fzstz4DqtKQukguAuR47VjCwv0FWkOy8+CVt
X-Google-Smtp-Source: AGHT+IHS0n4/1zDhYDG11j/phEtQioVcSLIhzKZxyKRafka2oa60va2EzlIsG9E+0PXvk8E7U9fUvkCXKxOf+kRpoho=
X-Received: by 2002:a05:6512:131d:b0:590:6119:6b73 with SMTP id
 2adb3069b0e04-591d85aa092mr1710058e87.48.1760740752394; Fri, 17 Oct 2025
 15:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
In-Reply-To: <aBPhs39MJz-rt_Ob@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 17 Oct 2025 15:38:45 -0700
X-Gm-Features: AS18NWAC2AsnIEyOuBJBf6AwyLhxj7CRd7TcYAURWBeq_wPcJYz0GvazO3M1Rc0
Message-ID: <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_153915_784780_C4A06DD4 
X-CRM114-Status: GOOD (  11.49  )
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

T24gVGh1LCBNYXkgMSwgMjAyNSBhdCAyOjAz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+IE9uIFRodSwgTWF5IDAxLCAyMDI1LCBEYXZpZCBNYXRs
YWNrIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgcmVuYW1lcyB0eXBlcyBhY3Jvc3MgYWxsIEtWTSBz
ZWxmdGVzdHMgdG8gbW9yZSBhbGlnbiB3aXRoCj4gPiB0eXBlcyB1c2VkIGluIHRoZSBrZXJuZWw6
Cj4gPgo+ID4gICB2bV92YWRkcl90IC0+IGd2YV90Cj4gPiAgIHZtX3BhZGRyX3QgLT4gZ3BhX3QK
Pgo+IDEwMDAwJSBvbiB0aGVzZS4KPgo+ID4gICB1aW50NjRfdCAtPiB1NjQKPiA+ICAgdWludDMy
X3QgLT4gdTMyCj4gPiAgIHVpbnQxNl90IC0+IHUxNgo+ID4gICB1aW50OF90ICAtPiB1OAo+ID4K
PiA+ICAgaW50NjRfdCAtPiBzNjQKPiA+ICAgaW50MzJfdCAtPiBzMzIKPiA+ICAgaW50MTZfdCAt
PiBzMTYKPiA+ICAgaW50OF90ICAtPiBzOAo+Cj4gSSdtIGRlZmluaXRlbHkgaW4gZmF2b3Igb2Yg
dGhlc2UgcmVuYW1lcy4gIEkgdGhvdWdodCBJIHdhcyB0aGUgb25seSBvbmUgdGhhdAo+IHRyaXBw
ZWQgb3ZlciB0aGUgdWludE5OX3Qgc3R1ZmY7IGF0IHRoaXMgcG9pbnQsIEkndmUgcHJvYmFibHkg
bG9zdCBob3VycyBvZiBteQo+IGxpZmUgdHJ5aW5nIHRvIHR5cGUgdGhvc2UgdGhpbmdzIG91dC4K
CldoYXQgc2hvdWxkIHRoZSBuZXh0IHN0ZXAgYmUgaGVyZT8gSSdkIGJlIGhhcHB5IHRvIHNwaW4g
YSBuZXcgdmVyc2lvbgp3aGVuZXZlciBvbiB3aGF0ZXZlciBiYXNlIGNvbW1pdCB5b3UgcHJlZmVy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
