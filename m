Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0BC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbVBPYhZ3WJtvMh72pMVXUqzb4RpY2VmEZQuOq3Mt1c=; b=amzc/gdkYqFYb+
	JcBn2BG78gaJn9l0sThI/XWUkNBgqOWlB1oJU0OFuGdc/kVVkoo+ABkclImQWhfgdNxJkW+iuAjKp
	fsmMJzCVswbgrI/BrD4kXwykuWyhdaN/lRbKcvIl1dYkp87C02vsdHxXJnuTiPM95l5LE3hm7sksZ
	apevingKncqoCpDG2I01BCgiZaFNeDr6Ty2YvRXKi/7UVR/h59vIl3XcAQ+n7TFVwFXpYamAyCjEt
	eV1EXntsQV7v2lrqtwYVJygsH1+yF7MqqHu6mH0OPm5Q3VY/KtWmAoba6GgYfxV+9RSC1CffI4/sD
	gk6R5IVjQ3WwGb5OBcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4jn-00000003bRM-2Psn;
	Fri, 16 Feb 2024 20:23:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4it-00000003bG7-3Hvg;
	Fri, 16 Feb 2024 20:22:54 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708114934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=le97KJdlsGBLqsiJ8aQfiKStXYCU6YwRihA6kx6vD50=;
	b=YNtWCZN+oyza7Psrnp+o015RwbGOpg7nwPBmGlhWYhJoroMvc1j1yPwMbdlPkFxbZ099DY
	cStpTLOPTTibGQZ6dRsFGbknNWj8VO1bsaW0+eIPgqMroaaMzbPCD9kzTrmYNUuMFWb7Rj
	ujCSgGzYaticow53nctzXgJ7gXOWC7OHA853+v+EVBm0Dfhgy8aJUr2OraiKqXEDadV/3w
	6oHgKU9uZR+LgRSztvgBVrr5BHhCt3HKME+aXGG9fOPGB7PbQ3OGIwarKrqfLDj1DRPg+y
	ibA8yxPAnWLA+2R6lNb0h0dxwF1h8gILaiyDbknkPS3KZEXgJ990PuKUR4aPzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708114934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=le97KJdlsGBLqsiJ8aQfiKStXYCU6YwRihA6kx6vD50=;
	b=QdVOnBs3rHq1ra9e49kCrw2tSi/Be1PmqZXRATLKXzAosslD2EHYAtI+BnLejPsm8NkGNU
	OKEsdip73eiy+dBQ==
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v12 14/25] irqchip/sifive-plic: Convert PLIC driver into
 a platform driver
In-Reply-To: <CAAhSdy2aeyJBcMVre12jGwU52oP9Z=1emB-bcYxygdR3QhP+6w@mail.gmail.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-15-apatel@ventanamicro.com> <87jzn4ctks.ffs@tglx>
 <CAAhSdy2aeyJBcMVre12jGwU52oP9Z=1emB-bcYxygdR3QhP+6w@mail.gmail.com>
Date: Fri, 16 Feb 2024 21:22:13 +0100
Message-ID: <878r3kcg7e.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_122217_059176_5AA676C5 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMTYgMjAyNCBhdCAyMjo0MSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmks
IEZlYiAxNiwgMjAyNCBhdCA5OjAz4oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+PiBJIGRvbid0IHRoaW5rIHRoYXQgcmVtb3ZpbmcgdGhlIHNldHVwIHBy
b3RlY3Rpb24gaXMgY29ycmVjdC4KPj4KPj4gQXNzdW1lIHlvdSBoYXZlIG1heGNwdXM9TiBvbiB0
aGUga2VybmVsIGNvbW1hbmQgbGluZSwgdGhlbiB0aGUgYWJvdmUKPj4gZm9yX2VhY2hfb25saW5l
X2NwdSgpIGxvb3Agd291bGQgcmVzdWx0IGluIGNwdWhwX3NldHVwID09IHRydWUgd2hlbiB0aGUK
Pj4gaW5zdGFuY2VzIGZvciB0aGUgbm90IG9ubGluZWQgQ1BVcyBhcmUgc2V0IHVwLCBubz8KPgo+
IEEgcGxhdGZvcm0gY2FuIGhhdmUgbXVsdGlwbGUgUExJQyBpbnN0YW5jZXMgd2hlcmUgZWFjaCBQ
TElDCj4gaW5zdGFuY2UgdGFyZ2V0cyBhIHN1YnNldCBvZiBIQVJUcyAob3IgQ1BVcykuCj4KPiBQ
cmV2aW91c2x5IChiZWZvcmUgdGhpcyBwYXRjaCksIHdlIHdlcmUgcHJvYmluZyBQTElDIHZlcnkg
ZWFybHkgc28gb24KPiBhIHBsYXRmb3JtIHdpdGggbXVsdGlwbGUgUExJQyBpbnN0YW5jZXMsIHdl
IG5lZWQgdG8gZW5zdXJlIHRoYXQgY3B1aHAKPiBzZXR1cCBpcyBkb25lIG9ubHkgYWZ0ZXIgUExJ
QyBjb250ZXh0IGFzc29jaWF0ZWQgd2l0aCBib290IENQVSBpcwo+IGluaXRpYWxpemVkIGhlbmNl
IHRoZSBwbGljX2NwdWhwX3NldHVwX2RvbmUgY2hlY2suCj4KPiBUaGlzIHBhdGNoIGNvbnZlcnRz
IFBMSUMgZHJpdmVyIGludG8gYSBwbGF0Zm9ybSBkcml2ZXIgc28gbm93IFBMSUMKPiBpbnN0YW5j
ZXMgYXJlIHByb2JlZCBhZnRlciBhbGwgYXZhaWxhYmxlIENQVXMgYXJlIGJyb3VnaHQtdXAuIElu
IHRoaXMKPiBjYXNlLCB0aGUgY3B1aHAgc2V0dXAgbXVzdCBiZSBkb25lIG9ubHkgYWZ0ZXIgUExJ
QyBjb250ZXh0IG9mIGFsbAo+IGF2YWlsYWJsZSBDUFVzIGFyZSBpbml0aWFsaXplZCBvdGhlcndp
c2Ugc29tZSBvZiB0aGUgQ1BVcyBjcmFzaAo+IGluIHBsaWNfc3RhcnRpbmdfY3B1KCkgZHVlIHRv
IGxhY2sgb2YgUExJQyBjb250ZXh0IGluaXRpYWxpemF0aW9uLgoKWW91J3JlIG1pc3NpbmcgdGhl
IHBvaW50LgoKQXNzdW1lIHlvdSBoYXZlIDggQ1BVcyBhbmQgMiBQTElDIGluc3RhbmNlcyBvbmUg
Zm9yIENQVTAtMyBhbmQgb25lIGZvcgpDUFU0LTcuCgpBZGQgIm1heGNwdXM9NCIgb24gdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUsIHRoZW4gb25seSB0aGUgZmlyc3QgNCBDUFVzCmFyZSBicm91Z2h0
IHVwLgoKU28gYXQgcHJvYmUgdGltZSBjcHVfb25saW5lX21hc2sgaGFzIGJpdCAwLDEsMiwzIHNl
dC4KCldoZW4gdGhlIGZpcnN0IFBMSUMgaXQgcHJvYmVkIHRoZSBsb29wIHdoaWNoIGNoZWNrcyB0
aGUgY29udGV4dCBmb3IgZWFjaApvbmxpbmUgQ1BVIHdpbGwgbm90IGNsZWFyIGNwdWhwX3NldHVw
IGFuZCB0aGUgaG90cGx1ZyBzdGF0ZSBpcyBpbnN0YWxsZWQuCgpOb3cgdGhlIHNlY29uZCBQTElD
IGlzIHByb2JlZCAodGhlIG9uZSBmb3IgdGhlIG9mZmxpbmUgQ1BVcyA0LTcpIGFuZCB0aGUKbG9v
cCB3aWxsIGFnYWluIG5vdCBjbGVhciBjcHVocF9zZXR1cCBhbmQgaXQgdHJpZXMgdG8gaW5zdGFs
bCB0aGUgc3RhdGUKYWdhaW4sIG5vPwoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
