Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B6EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 18:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yuj3Ej5LDtlqxek4CLpuWgkonGJ80Dsh8hcjZnbp5QI=; b=aaXsSvihfcVvUM
	XjVuBUUOZ2/ZK5thSncFP0dw0btI59DBq5FCvWW5DrCN1AhDfureAGQ5cGm9nMBArFtah/NSPqOxa
	jnQZYhcQxYTOx3PDyCmWDVYDatU8sTNmxhKilOQMNQratHJVicMv03fwPO8/tLwxl8z5zzioGD6um
	Uz6klnzat2we6L/f7Ax5XNujD2T44laQtpVcEuRIOzVBNOkIrZmSfkYxbMS6wecpC1NF/WkL+vXK6
	wXIjNjbeQSIrJygpzBJR0ZpX1GBF4IZXL4ofOXvfes4llGiHLSf+LVtWr7faosJYWN5ylFuZ/HmDw
	esw/PtiamkC1I3P3tNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7Ew-00GlSS-1V;
	Wed, 05 Jul 2023 18:28:34 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7Es-00GlQw-24
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 18:28:32 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-401f4408955so40311cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688581709; x=1691173709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8dndtCGBviDKso48620x/RRDlxyTnfI7vX9Z8Kirm4=;
        b=qHerNChH5eP9A1oGMa/u9oWkmuCgznM2HVxsH+LjQhf818ADYLHImqByT6aQXQhInT
         lsPnmURbNPO6fppcnuOnamesFjBJKNU2VjGsp7/zxpl38hCRF7pbMARmx/fH4RtrBMXV
         lQCBcftHQe7vy8FS1hGBIKM2SVaXZc1yMDHJKL+p6iFTBjybLHnCmhC3ptpPAjUBADqF
         3xClQ5mQkWbYUptl2dibTwnozlhBXkK1U0l3tZ6Z5T6JHE7q8ixwHU+MB8RFml50gCT1
         uyWFL1uZ2eGNwS7NmGPjVfeFoLHTmgcENG6AZUnGhL3wV09Qm91ASD61v7QtiUdM7Tit
         M5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581709; x=1691173709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8dndtCGBviDKso48620x/RRDlxyTnfI7vX9Z8Kirm4=;
        b=NcFdHeWb0HKBma6E9Y4RefLBFsiql3xQrLMG+jgHJgR5wHQEfxE+a0XJIwA5/KP3r5
         JKxCGbSFXAqtFoY9lWGzbHQ2uMSUik7OVyVb35d4GIhzFYq6q2hyaR7zrFQLNGJyhxqB
         LI3lpd5fH5Uk/1Cat44BryPkMwQaVwA3HGP1XPE/2pn0rqBbIDeKGpxYbR8lPTLP5zqu
         ruFxgZnxpCKjCGp+sDtayc4aeYR4mWMnmf7+QeqB/M9SwOl8CiwAhnOBCez58VTEBnrJ
         d/NqHwZqM9RZA2duv1op9cY2zDSI9UmLdj4Ayh+AlnThjpHsr3ouvWZnO1P2V0sXoPBN
         LIkA==
X-Gm-Message-State: ABy/qLYu1NRhCCF+9qx57GzreG+lTfUDdlGps87KOZEZPK8hQv9kdvYg
	fE3LkXs6g6TRUO1P/8ZlkR7+dds09XJMuvbwNNT9CQ==
X-Google-Smtp-Source: APBJJlGb5UHuGR9v4dIzL9FTRyvRdUi3B9fkgynBbnAtVZ2X8ICkvXAlrTkWscrnk/Iu+8sDpm99vm1xuq8baNEkTO8=
X-Received: by 2002:ac8:580b:0:b0:3ed:86f6:6eab with SMTP id
 g11-20020ac8580b000000b003ed86f66eabmr26383qtg.14.1688581709489; Wed, 05 Jul
 2023 11:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com> <20230621175002.2832640-8-rananta@google.com>
 <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
In-Reply-To: <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 5 Jul 2023 11:28:18 -0700
Message-ID: <CAJHc60xQtjvVsWRE=w-pAioNJW6uh-qKuZz2wp6bkT=X4oCm5A@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 07/11] KVM: arm64: Define kvm_tlb_flush_vmid_range()
To: Gavin Shan <gshan@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_112830_698960_7FAA9A2E 
X-CRM114-Status: GOOD (  19.36  )
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

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCA1OjMx4oCvUE0gR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDYvMjIvMjMgMDM6NDksIFJhZ2hhdmVuZHJhIFJhbyBBbmFu
dGEgd3JvdGU6Cj4gPiBJbXBsZW1lbnQgdGhlIGhlbHBlciBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFu
Z2UoKSB0aGF0IGFjdHMKPiA+IGFzIGEgd3JhcHBlciBmb3IgcmFuZ2UtYmFzZWQgVExCIGludmFs
aWRhdGlvbnMuIEZvciB0aGUKPiA+IGdpdmVuIFZNSUQsIHVzZSB0aGUgcmFuZ2UtYmFzZWQgVExC
SSBpbnN0cnVjdGlvbnMgdG8gZG8KPiA+IHRoZSBqb2Igb3IgZmFsbGJhY2sgdG8gaW52YWxpZGF0
aW5nIGFsbCB0aGUgVExCIGVudHJpZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5k
cmEgUmFvIEFuYW50YSA8cmFuYW50YUBnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20va3ZtX3BndGFibGUuaCB8IDEwICsrKysrKysrKysKPiA+ICAgYXJjaC9h
cm02NC9rdm0vaHlwL3BndGFibGUuYyAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysK
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4gPgo+Cj4gSXQgbWF5IGJl
IHJlYXNvbmFibGUgdG8gZm9sZCB0aGlzIHRvIFBBVENIWzA4LzExXSBzaW5jZSBrdm1fdGxiX2Zs
dXNoX3ZtaWRfcmFuZ2UoKSBpcwo+IG9ubHkgY2FsbGVkIGJ5IEFSTTY0J3Mga3ZtX2FyY2hfZmx1
c2hfcmVtb3RlX3RsYnNfcmFuZ2UoKSwgd2hpY2ggaXMgYWRkZWQgYnkgUEFUQ0hbMDgvMTFdLgo+
IEluIGVpdGhlciB3YXksIHRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZToKPgpBaCwgdGhlIHBh
dGNoZXMgMTAgYW5kIDExIGFsc28gY2FsbCBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UoKSwgc28K
cHJvYmFibHkgaXQncyBiZXR0ZXIgdG8ga2VlcCB0aGUgZGVmaW5pdGlvbiBpc29sYXRlZD8KClJl
Z2FyZHMsClJhZ2hhdmVuZHJhCj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNoYW4gPGdzaGFuQHJlZGhh
dC5jb20+Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9wZ3Rh
YmxlLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmgKPiA+IGluZGV4IDRj
ZDY3NjJiZGE4MDUuLjFiMTIyOTVhODM1OTUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
a3ZtX3BndGFibGUuaAo+ID4gQEAgLTY4Miw0ICs2ODIsMTQgQEAgZW51bSBrdm1fcGd0YWJsZV9w
cm90IGt2bV9wZ3RhYmxlX3N0YWdlMl9wdGVfcHJvdChrdm1fcHRlX3QgcHRlKTsKPiA+ICAgICog
ICAgIGt2bV9wZ3RhYmxlX3Byb3QgZm9ybWF0Lgo+ID4gICAgKi8KPiA+ICAgZW51bSBrdm1fcGd0
YWJsZV9wcm90IGt2bV9wZ3RhYmxlX2h5cF9wdGVfcHJvdChrdm1fcHRlX3QgcHRlKTsKPiA+ICsK
PiA+ICsvKioKPiA+ICsgKiBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UoKSAtIEludmFsaWRhdGUv
Zmx1c2ggYSByYW5nZSBvZiBUTEIgZW50cmllcwo+ID4gKyAqCj4gPiArICogQG1tdTogICAgIFN0
YWdlLTIgS1ZNIE1NVSBzdHJ1Y3QKPiA+ICsgKiBAYWRkcjogICAgVGhlIGJhc2UgSW50ZXJtZWRp
YXRlIHBoeXNpY2FsIGFkZHJlc3MgZnJvbSB3aGljaCB0byBpbnZhbGlkYXRlCj4gPiArICogQHNp
emU6ICAgIFNpemUgb2YgdGhlIHJhbmdlIGZyb20gdGhlIGJhc2UgdG8gaW52YWxpZGF0ZQo+ID4g
KyAqLwo+ID4gK3ZvaWQga3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKHN0cnVjdCBrdm1fczJfbW11
ICptbXUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBhZGRy
LCBzaXplX3Qgc2l6ZSk7Cj4gPiAgICNlbmRpZiAgICAgIC8qIF9fQVJNNjRfS1ZNX1BHVEFCTEVf
SF9fICovCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYyBiL2Fy
Y2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxlLmMKPiA+IGluZGV4IDNkNjFiZDNlNTkxZDIuLmRmOGFj
MTRkOWQzZDQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4g
PiArKysgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4gPiBAQCAtNjMxLDYgKzYzMSwy
NiBAQCBzdGF0aWMgYm9vbCBzdGFnZTJfaGFzX2Z3YihzdHJ1Y3Qga3ZtX3BndGFibGUgKnBndCkK
PiA+ICAgICAgIHJldHVybiAhKHBndC0+ZmxhZ3MgJiBLVk1fUEdUQUJMRV9TMl9OT0ZXQik7Cj4g
PiAgIH0KPiA+Cj4gPiArdm9pZCBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9z
Ml9tbXUgKm1tdSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90
IGFkZHIsIHNpemVfdCBzaXplKQo+ID4gK3sKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgcGFnZXMs
IGludmFsX3BhZ2VzOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFzeXN0ZW1fc3VwcG9ydHNfdGxiX3Jh
bmdlKCkpIHsKPiA+ICsgICAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9mbHVzaF92
bWlkLCBtbXUpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAgICB9Cj4gPiArCj4g
PiArICAgICBwYWdlcyA9IHNpemUgPj4gUEFHRV9TSElGVDsKPiA+ICsgICAgIHdoaWxlIChwYWdl
cyA+IDApIHsKPiA+ICsgICAgICAgICAgICAgaW52YWxfcGFnZXMgPSBtaW4ocGFnZXMsIE1BWF9U
TEJJX1JBTkdFX1BBR0VTKTsKPiA+ICsgICAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3Rs
Yl9mbHVzaF92bWlkX3JhbmdlLCBtbXUsIGFkZHIsIGludmFsX3BhZ2VzKTsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgYWRkciArPSBpbnZhbF9wYWdlcyA8PCBQQUdFX1NISUZUOwo+ID4gKyAgICAg
ICAgICAgICBwYWdlcyAtPSBpbnZhbF9wYWdlczsKPiA+ICsgICAgIH0KPiA+ICt9Cj4gPiArCj4g
PiAgICNkZWZpbmUgS1ZNX1MyX01FTUFUVFIocGd0LCBhdHRyKSBQQUdFX1MyX01FTUFUVFIoYXR0
ciwgc3RhZ2UyX2hhc19md2IocGd0KSkKPiA+Cj4gPiAgIHN0YXRpYyBpbnQgc3RhZ2UyX3NldF9w
cm90X2F0dHIoc3RydWN0IGt2bV9wZ3RhYmxlICpwZ3QsIGVudW0ga3ZtX3BndGFibGVfcHJvdCBw
cm90LAo+Cj4gVGhhbmtzLAo+IEdhdmluCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
