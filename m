Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A1FEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 13:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIhYf1b0fz1W2fAwxDpt0Lm1BbKmqbsTMsZnDIvN0qQ=; b=i71Ce4vXL7ehv8
	weL30S+6mvonLTPqWCmvvuDafzG1tAeDqGSU+dHWXe7iuTa26l54XiDmyNBkPRLC3bw5HyEzMF0Ee
	A6D+qX3l5md0SSDiTYTbSOiBilx2sQKNioHBlvP+s93iy38IKr2J1hsVfXqAY/rHsflI0E5Sn4Vzi
	bfJPfF9y9dJ/LeVHtKRn4e6cqBb6yp/sZeSFF8cEQOhbEy0Yo24tilMCPAZBIbRE7cQJFQufsZ2Qp
	NsQ3VJS7Nh867f+ajVPLM+l9QwooI1G+pcESfGkwgEOJfHVlcfduUc6nko0hVXHe2gHWSbrZHvvnS
	oB+yq1WUZjJAP2BT8k0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qChDH-003gYa-1t;
	Fri, 23 Jun 2023 13:52:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qChDE-003gXG-18
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 13:52:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51be8edc657so697274a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687528348; x=1690120348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S6OHdItsTA1JwEPFdtVcZWMFJNNUsFlvqd8wRr+OUY=;
        b=nAce8ga+PROGouUoidmVoa9MzzT4VKceza4OhOuRIrN+5JqaA3WkDPC5LeYqt3YuZl
         2HDMZKlnXxn1GxbdtDj4lyz50v9F7oC2oDzNaI6940PB7TEop0jMQqAauMiaJIXqaIsi
         y/bLhiO9HDfI4+5QFBjf6fqhm03lni+3xdGXkzzxj3UrbrdjWks+kde/XVOEiw4kiQSV
         QhKvRfLnp0ekeVOI4extHqhCHK2JjEhKR6dCf5EvjVCuMe9mhUaWBqhHt+3X2csIE2au
         oaAovgYAxbXS4YbjQqIKfJUEYQGiMGXYyrzj6FCFF8rURCWTujhqLNueJ4wQjUXI0t+8
         N/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528348; x=1690120348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S6OHdItsTA1JwEPFdtVcZWMFJNNUsFlvqd8wRr+OUY=;
        b=KDFBB2zL7AhzSZdX7PM0uJhw8WjeP7xOIeflHGQzADt44E5o7aJ/TiRz/BWc3TTPM9
         +rerdS+qxx6XnXIgIpZ27wPftwktBr2J1LwS44bLYm9QKjf45nz5oqMqvu8MPqIKkroh
         AJrSJiDrq5ylqnr7VlmbNl9yvobkjHBOicWJMZkBPW4gZlBkCN/QYMlKu0UlxMs7oCrr
         +X3NfjfZXZmEfyP4J0CTbjWYn4c9rjPKTP/VLZyYDYPRkjvP6mrHkIHEapjb59ckOd+h
         pXmfNgVm6v6ztf/hUBmQa9qZU9jPTYRQSnrxj8RthMg5M7lh+oaDJMypuL7xSMK+iBQ0
         P0eA==
X-Gm-Message-State: AC+VfDxPHpN4o+E6lK/4urSGswWdTXOtYjovMVzL0GaLDKXiacnNdsIs
	5tnhn3d57Xg4rVocbqHYsss82l0oLmd9WrX5jbxdbg==
X-Google-Smtp-Source: ACHHUZ5paNz1Cy14U0D10w5MW6F/Bi3rLn0+7A272F60E7dMKSk92KbX4Dy3Ud9Nb1GD+xk5zK+AHrmxfK2LTcZejxw=
X-Received: by 2002:aa7:d1d4:0:b0:51a:5ae1:b6e5 with SMTP id
 g20-20020aa7d1d4000000b0051a5ae1b6e5mr9949319edp.10.1687528347990; Fri, 23
 Jun 2023 06:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-9-apatel@ventanamicro.com> <CAGETcx-hoPNanAwe4++6roqBXwSdc7z6Ei=-r9z6qFG1U7xVXg@mail.gmail.com>
 <CAAhSdy3WH_nrKC-3AC4RHn9=crh6mPzaKO8jmAeo2j8-VJnT5g@mail.gmail.com>
 <CAGETcx_DkuyZ+c50QmA7eu8vUByfVosABugZpd7R8NgR8Wc-FA@mail.gmail.com>
 <CAK9=C2X4+aTs=+WdE0ba1qPDu67TiAKgE2Rx-qqD5+TJwYCKOQ@mail.gmail.com>
 <CAGETcx_KJURkxEuZOgPZR=fA4CaHnAwwRfU_JLJ28absFWAtzg@mail.gmail.com>
 <CAK9=C2XNAXaorxeNAB02o3_mYe3fsDSHS7rj=5+=q=d67Od60A@mail.gmail.com> <86mt0qbaxg.wl-maz@kernel.org>
In-Reply-To: <86mt0qbaxg.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Jun 2023 19:22:15 +0530
Message-ID: <CAAhSdy3eW_urQ_716DdBp8SN2zFN3oMMOt695cW4EQbejraVhw@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] irqchip: Add RISC-V advanced PLIC driver
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Saravana Kannan <saravanak@google.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev, Android Kernel Team <kernel-team@android.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_065232_616727_02E0B666 
X-CRM114-Status: GOOD (  31.27  )
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

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNjoxOeKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gW2hlcmUsIGxldCBtZSB0cmltIGFsbCBvZiB0aGlzIG5vbnNlbnNl
Li4uXQo+Cj4gT24gRnJpLCAyMyBKdW4gMjAyMyAxMjo0NzowMCArMDEwMCwKPiBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+IE5vLiBNeSBwcmV2aW91cyBl
bWFpbCBhc2tpbmcgeW91IHRvIE5PVCB1c2UgSVJRQ0hJUF9ERUNMQVJFKCkgYW5kCj4gPiA+IGlu
c3RlYWQgdXNlIElSUUNISVBfUExBVEZPUk1fRFJJVkVSX0JFR0lOL0VORCgpIG1hY3Jvcy4KPiA+
Cj4gPiBJIHRyaWVkIElSUUNISVBfUExBVEZPUk1fRFJJVkVSX0JFR0lOL0VORCgpIG1hY3JvcyBi
dXQgdGhlc2UKPiA+IG1hY3JvcyBhcmUgbm90IHN1aXRhYmxlIGZvciBBUExJQyBkcml2ZXIgYmVj
YXVzZSB3ZSBuZWVkIHBsYXRmb3JtIGRldmljZQo+ID4gcG9pbnRlciBpbiB0aGUgQVBMSUMgcHJv
YmUoKSB0byBjcmVhdGUgcGxhdGZvcm0gTVNJIGRldmljZSBkb21haW4gKHJlZmVyLAo+ID4gcGxh
dGZvcm1fbXNpX2NyZWF0ZV9kZXZpY2VfZG9tYWluKCkpLgo+Cj4gT2ggY29tZSBvbi4gSG93IGhh
cmQgaGF2ZSB5b3UgdHJpZWQ/IEhhdmUgeW91IGV2ZW4gbG9va2VkIGF0IHRoZSBvdGhlcgo+IGRy
aXZlcnMgaW4gdGhlIHRyZWUgdG8gc2VlIGhvdyB0aGV5IHNvbHZlIHRoaXMgaW5zdXJtb3VudGFi
bGUgcHJvYmxlbQo+IHdpdGggYSAqc2luZ2xlKiBsaW5lIG9mIGNvZGU/Cj4KPiAgICAgICAgIHBk
ZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG5vZGUpOwo+Cj4gVGhhdCdzIGl0LgoKUGxlYXNl
IHNlZSB0aGUgYmVsb3cgZGlmZi4gSSB0cmllZCB0aGUgc2FtZSB0aGluZyBidXQgc3RpbGwgdGhl
IEFQTElDIGRvZXMKbm90IGdldCBwcm9iZWQgd2l0aG91dCB0aGUgRldOT0RFX0ZMQUdfQkVTVF9F
RkZPUlQgZmxhZy4gUGxlYXNlCm5vdGUgdGhhdCB0aGUgY3VycmVudCBBUExJQyBkcml2ZXIgd29y
a3MgdW5tb2RpZmllZCBmb3IgYm90aCBEVCBhbmQgQUNQSQpidXQgdXNpbmcgb2ZfZmluZF9kZXZp
Y2VfYnlfbm9kZSgpIGhlcmUgYnJlYWtzIEFDUEkgc3VwcG9ydC4KCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLmMKYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWFwbGljLmMKaW5kZXggMWU3MTBmZGY1NjA4Li45YWU5ZTdmYjkwNWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMuYworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWFwbGljLmMKQEAgLTE3LDYgKzE3LDcgQEAKICNpbmNsdWRlIDxsaW51eC9pcnFkb21h
aW4uaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9tc2kuaD4K
KyNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgoKQEAgLTczMCwzNiArNzMxLDEyIEBA
IHN0YXRpYyBpbnQgYXBsaWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICAg
ICByZXR1cm4gMDsKIH0KCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhcGxpY19t
YXRjaFtdID0gewotICAgIHsgLmNvbXBhdGlibGUgPSAicmlzY3YsYXBsaWMiIH0sCi0gICAge30K
LX07Ci0KLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFwbGljX2RyaXZlciA9IHsKLSAg
ICAuZHJpdmVyID0gewotICAgICAgICAubmFtZSAgICAgICAgPSAicmlzY3YtYXBsaWMiLAotICAg
ICAgICAub2ZfbWF0Y2hfdGFibGUgICAgPSBhcGxpY19tYXRjaCwKLSAgICB9LAotICAgIC5wcm9i
ZSA9IGFwbGljX3Byb2JlLAotfTsKLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGFwbGljX2RyaXZl
cik7Ci0KLXN0YXRpYyBpbnQgX19pbml0IGFwbGljX2R0X2luaXQoc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlLAorc3RhdGljIGludCBfX2luaXQgYXBsaWNfb2ZfaW5pdChzdHJ1Y3QgZGV2aWNlX25v
ZGUgKmRuLAogICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KQogewot
ICAgIC8qCi0gICAgICogVGhlIEFQTElDIHBsYXRmb3JtIGRyaXZlciBuZWVkcyB0byBiZSBwcm9i
ZWQgZWFybHkKLSAgICAgKiBzbyBmb3IgZGV2aWNlIHRyZWU6Ci0gICAgICoKLSAgICAgKiAxKSBT
ZXQgdGhlIEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIGZsYWcgaW4gZndub2RlIHdoaWNoCi0gICAg
ICogICAgcHJvdmlkZXMgYSBoaW50IHRvIHRoZSBkZXZpY2UgZHJpdmVyIGNvcmUgdG8gcHJvYmUg
dGhlCi0gICAgICogICAgcGxhdGZvcm0gZHJpdmVyIGVhcmx5LgotICAgICAqIDIpIENsZWFyIHRo
ZSBPRl9QT1BVTEFURUQgZmxhZyBpbiBkZXZpY2Vfbm9kZSBiZWNhdXNlCi0gICAgICogICAgb2Zf
aXJxX2luaXQoKSBzZXRzIGl0IHdoaWNoIHByZXZlbnRzIGNyZWF0aW9uIG9mCi0gICAgICogICAg
cGxhdGZvcm0gZGV2aWNlLgotICAgICAqLwotICAgIG5vZGUtPmZ3bm9kZS5mbGFncyB8PSBGV05P
REVfRkxBR19CRVNUX0VGRk9SVDsKLSAgICBvZl9ub2RlX2NsZWFyX2ZsYWcobm9kZSwgT0ZfUE9Q
VUxBVEVEKTsKLSAgICByZXR1cm4gMDsKKyAgICByZXR1cm4gYXBsaWNfcHJvYmUob2ZfZmluZF9k
ZXZpY2VfYnlfbm9kZShkbikpOwogfQotSVJRQ0hJUF9ERUNMQVJFKHJpc2N2X2FwbGljLCAicmlz
Y3YsYXBsaWMiLCBhcGxpY19kdF9pbml0KTsKKworSVJRQ0hJUF9QTEFURk9STV9EUklWRVJfQkVH
SU4oYXBsaWMpCitJUlFDSElQX01BVENIKCJyaXNjdixhcGxpYyIsIGFwbGljX29mX2luaXQpCitJ
UlFDSElQX1BMQVRGT1JNX0RSSVZFUl9FTkQoYXBsaWMpCgo+Cj4gPiBGdXJ0aGVyLCBJIHRyaWVk
IHNldHRpbmcgdGhlICJzdXBwcmVzc19iaW5kX2F0dHJzIiBmbGFnIGluICJzdHJ1Y3QKPiA+IHBs
YXRmb3JtX2RyaXZlciBhcGxpY19kcml2ZXIiIGp1c3QgbGlrZSB0aGUKPiA+IElSUUNISVBfUExB
VEZPUk1fRFJJVkVSX0VORCgpIG1hY3JvIGJ1dCB0aGlzIGRpZCBub3Qgd29yay4KPgo+IEknbSBu
b3Qgc3VyZSBob3cgcmVsZXZhbnQgdGhpcyBpcyB0byB0aGUgY29udmVyc2F0aW9uLgoKSXQncyBy
ZWxldmFudCBiZWNhdXNlIHRoZSBvbmx5IGRpZmZlcmVuY2UgaW4gdGhlIHBsYXRmb3JtX2RyaXZl
cgpyZWdpc3RlcmVkIGJ5IElSUUNISVBfUExBVEZPUk1fRFJJVkVSX0VORCgpIGFuZAoic3RydWN0
IHBsYXRmb3JtX2RyaXZlciBhcGxpY19kcml2ZXIiIGlzIHRoZSAic3VwcHJlc3NfYmluZF9hdHRy
cyIgZmxhZy4KClVuZm9ydHVuYXRlbHksIHNldHRpbmcgdGhlICJzdXBwcmVzc19iaW5kX2F0dHJz
IiBmbGFnIGRvZXMgbm90CmhlbHAgYXMgd2VsbC4KCj4KPiAgICAgICAgIE0uCj4KPiAtLQo+IFdp
dGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4K
ClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
