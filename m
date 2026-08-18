Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8D7C5DF7D
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRJ0EwlLaNQw2zEPq0ew1j8Bo+IbfwV1BMzHVrQcSgU=; b=Uz4Lv6c5a9Fnzu
	2oZDN2EcFF+ug8SxSQzyRKYMXYOKLaOHW6wH2PqtX+7dfsH/EnNUQIMytwZOQ9onkanp1Vg3UPUci
	Q21mcx+nAEsA5tEQVyOZgcdSMP5H6GI9GDatI+7OR3G0uWumSnCEf+wAtytNVibKcvCVekzW63o3a
	+os6i2OrnbJ6Mjx8+va456yaBNeyoTwZaICIAwEkgG4nqcZV1Z3Vs3VRSzzGq+V6htvdsz6j8san7
	N3xHwkrcpda4/U9ws65P/OzItm0ty7/Z5GvZPpX+jXiWfiduwc/CaHO5Q0/OG+psssdLAQUy9cob3
	WCb8ttxEPs5aHtQWrTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwISA-00000007t1x-2is3;
	Tue, 18 Aug 2026 11:58:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIS9-00000007t1m-1wzd
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 11:58:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 645EF601DE
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 11:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC931F000E9
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787054280;
	bh=XKvpuhGOPbv8JCt779JZ4GIg/qJ5Sfy6ojxNg7/AzzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y2itKOHZ1Mnet1zHwg5XtX1JhFrFSmUObrDdtPi12AxNF5VMjvFPNo8kqGlpnpeAn
	 NTS3pnbO1qM+nhrpTCFn5AlETHOXPAHh+NN2dKDSuKxb4E4Hq8keA3rtE1Gobr9gxs
	 c1bizEj38yKoa9EoXQhLMLFN33faqhMKNdFrJGPfnjI2QIMUCYT+Iwx3H+A57nVTSd
	 CclTRaaJR+ow2lz9L/Nc2RpLmriXlQD/iOqJagXKzYuhIDVQ/y5ZHBDj2mw3Y/F233
	 BLQfO1LmolBF6fzxuUNujNphjxReJkk6ijWzuSewWCnAs8CEbGDyM/6wQS/ErtNCqS
	 ENidzBiQt6Szw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so37943381fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 04:58:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RosNfseOHcnA/rTfa8QjRqejdpnwFcvmDKI7kZLsjLQ4SLa2FiXZiDJVDSBocU7nkTCfGR4E/PqpwObSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU0+dHbigIyVTIHjbCrh5AudFUyjpcno3QtbZv+RvWSvjKupL9
	GQHwTQ53LEFQbFsMpvJovDWaalVKuyYAS/3vUqiDZzjyOXeXCCa/3f/Shrm7klEPnEISufv/fHw
	cIAJbLzjVgZWJj3Pf9tF8Okq/5dgNgqo=
X-Received: by 2002:a05:651c:30ca:b0:3a1:1d3b:67f1 with SMTP id
 38308e7fff4ca-3a1751ed6f9mr11681411fa.7.1787054278515; Tue, 18 Aug 2026
 04:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAJZ5v0g3pVxLgXBAHho5B+kfAiQQkQHGoO-1uBxp0OyXiGGcRQ@mail.gmail.com>
 <20260818034110.1067658-1-peixin.xie@linux.spacemit.com>
In-Reply-To: <20260818034110.1067658-1-peixin.xie@linux.spacemit.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 18 Aug 2026 13:57:29 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jwAvynHo+ctq_CJJCKPDFct7DBj8SbDhKvWp7KZM0wwQ@mail.gmail.com>
X-Gm-Features: AcwNN1VT3s4C1GHK_DVVrKqoeuQkWt6_4B_3wLCbIvEsEaFXd2oU1DdrdTKsH9I
Message-ID: <CAJZ5v0jwAvynHo+ctq_CJJCKPDFct7DBj8SbDhKvWp7KZM0wwQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: scan: Drop power resource references for deferred devices
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: rafael@kernel.org, dlan@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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

T24gVHVlLCBBdWcgMTgsIDIwMjYgYXQgNTo0MeKAr0FNIFBlaXhpbiBYaWUKPHBlaXhpbi54aWVA
bGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDEyLCAyMDI2IGF0IDAz
OjE1OjI3UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gSGF2ZSB5b3UgY29u
c2lkZXJlZCBkcm9wcGluZyB0aGUgYWNwaV9idXNfaW5pdF9wb3dlcigpIGNhbGwgZnJvbQo+ID4g
YWNwaV9idXNfZ2V0X3Bvd2VyX2ZsYWdzKCkgYW5kIGRvaW5nIGl0IG9ubHkgb25jZSB3aGVuIHRo
ZSBkZXZpY2UgZ2V0cwo+ID4gcmVhZHkgZm9yIGVudW1lcmF0aW9uPwo+Cj4gVGhhbmsgeW91IGZv
ciB0aGUgc3VnZ2VzdGlvbi4gSSB0ZXN0ZWQgdGhpcyBhcHByb2FjaCBvbiB0aGUgU3BhY2VtaVQg
SzMKPiBwbGF0Zm9ybSBhbmQgaXQgd29ya3MgYXMgZXhwZWN0ZWQuCj4KPiBJbiBhZGRpdGlvbiB0
byByZW1vdmluZyB0aGUgYWNwaV9idXNfaW5pdF9wb3dlcigpIGNhbGwsIEkgc2V0Cj4gZGV2aWNl
LT5mbGFncy5pbml0aWFsaXplZCB0byBmYWxzZSBhdCB0aGUgZW5kIG9mIGFjcGlfYnVzX2dldF9w
b3dlcl9mbGFncygpCj4gdG8gbWFyayB0aGUgZGV2aWNlIHBvd2VyIHN0YXRlIGFzIG5vdCB5ZXQg
aW5pdGlhbGl6ZWQuCgpJbnN0ZWFkIG9mIGRvaW5nIHRoaXMsIElNViBpdCB3b3VsZCBiZSBiZXR0
ZXIgdG8gcmVtb3ZlIHRoZSBzZXR0aW5nIG9mCmRldmljZS0+ZmxhZ3MuaW5pdGlhbGl6ZWQgdG8g
MSBpbiBhY3BpX2luaXRfZGV2aWNlX29iamVjdCgpIGFuZCBzZXQgaXQKdG8gMSBpbiBhY3BpX2Fk
ZF9wb3dlcl9yZXNvdXJjZSgpLgoKPiBUaGlzIGNhdXNlcyB0aGUgZXhpc3RpbmcgcGF0aCBpbiBh
Y3BpX2J1c19hdHRhY2goKSB0byBjYWxsIGFjcGlfYnVzX2luaXRfcG93ZXIoKSBvbmNlIHRoZQo+
IGRldmljZSBpcyByZWFkeSBmb3IgZW51bWVyYXRpb24uCj4KPiBUaGUgcG93ZXIgcmVzb3VyY2Ug
cmVmZXJlbmNlcyBhcmUgbm93IGJhbGFuY2VkIGFuZCBydW50aW1lIHN1c3BlbmQgYW5kCj4gcmVz
dW1lIGNvbnRpbnVlIHRvIHdvcmsgY29ycmVjdGx5LiBJIHdpbGwgc2VuZCBhIHYyIGluIG5leHQg
Y291cGxlIGRheXMuCgpQbGVhc2UgZG8sIGJ1dCBwbGVhc2UgdGFrZSB0aGUgY29tbWVudCBhYm92
ZSBpbnRvIGNvbnNpZGVyYXRpb24uCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
