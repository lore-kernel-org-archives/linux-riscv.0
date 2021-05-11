Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68FBC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 09:26:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0DF96157F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 09:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0DF96157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MlQqJYIW59+4E50zSndWTz+f5LEs9sruBol1AQt+QKw=; b=LJTEte75AS0rjEMNvLb0keilo
	WlmeRYyDdeIz5YB/3iOpwAjUZNZPcSNf/5xZvaMH/Aumv3c01728E0K/cnINwh0mV1an3u305M6tc
	eo4nw/oAzCn0Cyfnad3tqX7ODfcWLFLGoKGX06aUuCMP4MDL1rwSKNg4cWVQ9MZP3wtaT71GQgLty
	q+L/H5c47BTXh/rjbvaUoCIDjS00mY2OrBkNOw/SF2k397Zu+ifmzaYqpfqdoFo7XanywxueRekNq
	NhpJvMke+peUNDy6QTYjBxCH013+p8EqUoApnh4Sf6VJObElrh00FTVzZDhrRBBjZ1B30t0EOu4V9
	aLtyVE00g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgOdy-00Gh8n-M9; Tue, 11 May 2021 09:25:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOdn-00Gh8N-Gq; Tue, 11 May 2021 09:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=SxEDkhQ4NDmmQJU/qD2f8WKt2ZN30zjdTiLd/JmT63A=; b=UCdQu3uuMIueJIL/6YseFwXm9N
 H0v5JsM3cFzO0QwgddTJ7xpngR47jvO6LfcHP5uiiN8a1Wy9qkviYsnMtcjNlXp3VE9smJKQnoMyH
 LWZrjrmzH9TOXhxQ8FP0UM71sxpmSWT1U4pM5+VgPV/iBJQCG/Vesc9x/SuT8Sg4pIWTmPO/g/ujj
 3XYXqh+YkyHVvDcOFd4WRxH1MBVpMTpjN8eZO2caWjUOmImJuHE3H7jH3daSuFacC+IF2ic3DtxAY
 I2Yh86ECBuK1ZuuS+/TzpUx63Lxm2kGmgs85rY4c7qme9HF1m6itTyKIh8J8bCcl9NRB42SZBW18X
 aRGrHDmw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOdj-009QZu-MP; Tue, 11 May 2021 09:25:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAA5561469;
 Tue, 11 May 2021 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620725119;
 bh=SxEDkhQ4NDmmQJU/qD2f8WKt2ZN30zjdTiLd/JmT63A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qYIzsO6/tiOl8TGJ6a2eiShRAv5ZaMzH0UMz1Okj8KRt9xtY+LR/anIcVUrTbZiX4
 89BZ53+EXyXMYuHsL+U06kiuxNXt/5HwXMQCdDP/VjD4quHGFE+7gbD3gJVXax5DaY
 uPQ39ZXYcixN6FyJ12+nOvdmqwpol10wPiVFzbtkGhu9sXEQXyPXQcHwYGaPn1WAFe
 4EHVQRoUTs78Ah0GJIhGex565u4aOD5+o97KCk6BlvJCrZe2QVlJEyby3BUR9BJh2D
 ihJkCCdqkHc4Kaa3576AZpMqo1MX3GKHjJMVLdhoGH+hccpOnzojw8qINBpykxkRxP
 IMzqRB+GVylEA==
Date: Tue, 11 May 2021 11:25:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210511112508.4547bca8@coco.lan>
In-Reply-To: <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_022519_812719_864FC9C4 
X-CRM114-Status: GOOD (  15.09  )
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

RW0gTW9uLCAxMCBNYXkgMjAyMSAxNDo0OTo0NCArMDEwMApEYXZpZCBXb29kaG91c2UgPGR3bXcy
QGluZnJhZGVhZC5vcmc+IGVzY3JldmV1OgoKPiBPbiBNb24sIDIwMjEtMDUtMTAgYXQgMTM6NTUg
KzAyMDAsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggc2VyaWVz
IGlzIGRvaW5nIGNvbnZlcnNpb24gb25seSB3aGVuIHVzaW5nIEFTQ0lJIG1ha2VzCj4gPiBtb3Jl
IHNlbnNlIHRoYW4gdXNpbmcgVVRGLTguIAo+ID4gCj4gPiBTZWUsIGEgbnVtYmVyIG9mIGNvbnZl
cnRlZCBkb2N1bWVudHMgZW5kZWQgd2l0aCB3ZWlyZCBjaGFyYWN0ZXJzCj4gPiBsaWtlIFpFUk8g
V0lEVEggTk8tQlJFQUsgU1BBQ0UgKFUrRkVGRikgY2hhcmFjdGVyLiBUaGlzIHNwZWNpZmljCj4g
PiBjaGFyYWN0ZXIgZG9lc24ndCBkbyBhbnkgZ29vZC4KPiA+IAo+ID4gT3RoZXJzIHVzZSBOTy1C
UkVBSyBTUEFDRSAoVStBMCkgaW5zdGVhZCBvZiAweDIwLiBIYXJtbGVzcywgdW50aWwKPiA+IHNv
bWVvbmUgdHJpZXMgdG8gdXNlIGdyZXBbMV0uICAKPiAKPiBSZXBsYWNpbmcgdGhvc2UgbWFrZXMg
c2Vuc2UuIEJ1dCByZXBsYWNpbmcgZW1kYXNoZXMg4oCUIHdoaWNoIGFyZSBhCj4gZGlzdGluY3Qg
Y2hhcmFjdGVyIHRoYXQgaGFzIG5vIGRpcmVjdCByZXBsYWNlbWVudCBpbiBBU0NJSSBhbmQgd2hp
Y2gKPiBwZW9wbGUgZG8gKmRlbGliZXJhdGVseSogdXNlIGluc3RlYWQgb2YgaHlwaGVuLW1pbnVz
IOKAlCBkb2VzIG5vdC4KPiAKPiBQZXJoYXBzIHN0aWNrIHRvIHRob3NlIHR3bywgYW5kIGFueSBj
YXNlcyB3aGVyZSBhbiBlbWRhc2ggb3IgZW5kYXNoIGhhcwo+IGJlZW4gdXNlZCB3aGVyZSBVKzAw
MkQgSFlQSEVOLU1JTlVTICpzaG91bGQqIGhhdmUgYmVlbiB1c2VkLgoKT2suIEknbGwgcmV3b3Jr
IHRoZSBzZXJpZXMgZXhjbHVkaW5nIEVNL0VOIERBU0ggY2hhcnMgZnJvbSBpdC4KSSdsbCB0aGVu
IGFwcGx5IG1hbnVhbGx5IHRoZSBjaGFuZ2VzIGZvciBFTS9FTiBEQVNIIGNoYXJzIAoocHJvYmFi
bHkgb24gYSBzZXBhcmF0ZSBzZXJpZXMpIHdoZXJlIGl0IHNlZW1zIHRvIGZpdC4gVGhhdCBzaG91
bGQKbWFrZSBlYXNpZXIgdG8gZGlzY3VzcyBzdWNoIHJlcGxhY2VtZW50cy4KCj4gQW5kIHBsZWFz
ZSBmaXggeW91ciBjb3ZlciBsZXR0ZXIgd2hpY2ggbWFkZSBubyByZWZlcmVuY2UgdG8gJ2dyZXAn
LCBhbmQKPiBvbmx5IHByZXNlbnRlZCBhIGNvbXBsZXRlbHkgYm9ndXMgYXJndW1lbnQgZm9yIHRo
ZSBjaGFuZ2UgaW5zdGVhZC4KCk9LIQoKUmVnYXJkcywKTWF1cm8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
