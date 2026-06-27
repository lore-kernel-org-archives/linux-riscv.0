Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AD0C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BywNVQFE7zaN08NjW34LxpP7g+QZHWQ7UvNrl1+javQ=; b=xR5UpwVNxNiotL
	R1R5yqClCR7SqN55D+Kxm/4crslZ9E2PU//1B2Jwn3tAgnCgelOJf/B9RupN717AW4XqjnOMquj7d
	C/xC7jyuVKEeHzAsxQdgw/QHDaGXIB9Wq+36e8T0eP2FoECYKLBnDnsAgmOSOkoVX2tXMIGCPAHYQ
	JaXlOwqkHndG/7DS5X95gUv8dgvoauq5fM80cNQzmQxGkdeeoMU/oWGgnsG/jQyFtlRvC9Z+Z4sBt
	kaIJo6go7H2UJh2XIbXNprhLgmBnwXeV7uty9oytprlv/OFHYbJ7jwl1F6t5J7Ky1Yj0vj+O1IrqJ
	NhHWiFz1Dj40kqHSE7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbfg-0000000CniG-21mu;
	Sat, 27 Jun 2026 22:38:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdbfd-0000000CnhV-1P0X
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 22:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782599919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nq/qbeOSvV0DP48ZHPx+WEEivWUHK4HRs81Tz5g5RA0=;
	b=QFl7UUcxVqZ144xQJdvrj7T1lTH223L5pxVh7Cdrr9un7l6W8aO6nxDAxFfZHVAz1YsW+c
	QFjzxT4jjnuHLFPP1OQvV1jwaAQeoyarQtf3bOqpwmHEvooci1G2ybT2hMYFkSl2A+ybdG
	Bpkju1EQD+YakAwAXDreTD7mzxN4WN8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-2wsX8HO5MnWX-uemxxmMfw-1; Sat, 27 Jun 2026 18:38:37 -0400
X-MC-Unique: 2wsX8HO5MnWX-uemxxmMfw-1
X-Mimecast-MFC-AGG-ID: 2wsX8HO5MnWX-uemxxmMfw_1782599917
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dc3be1ebb4so57125876d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jun 2026 15:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782599917; x=1783204717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nq/qbeOSvV0DP48ZHPx+WEEivWUHK4HRs81Tz5g5RA0=;
        b=TiH7j+AB6jyWrw47sCT/WBx4vE94VYo9V8f7S8vE6Trhz+Jh107yE1g2ybmuva1w/H
         W2duRbqtcZPxWBHXEM17PrIFW7+YmtgUWXWioRuA08QkXU8ga/yrCX3P2FJXyKhaay9x
         8tJGe35w/ilo/Mh7608MQty/29ncxkij0s5dRLJNj2hNBlfYW3aDN3jTMLx5usFEpJL9
         Aozubz/wUcL6wDtu7Z4v6M/MU6RTkK8+w7iTakhLjJ6CB4FNzIaTauARR/vXsvv/69t5
         mE8W2Po7FMCekZtAdx6HdgD23pKv7uip9I3P7b450HRMYdnAc05eBXeHcjrEx9ny6FfO
         UEDA==
X-Forwarded-Encrypted: i=1; AFNElJ+CAeIGeEgCIkhc5gO/6KJW0WdqDGpCo4HtsPPd9WIxNAACdLud8Xp0tUl/cJztSErK1LfN2k79W3D5Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr0JANpcK3SdRHXDFTUE9exE7Bv7Bu9xlVRVpxX5oAjqGDayq8
	888TgQOeoMV9AwG7d9T+8geRBAfXvsrgRygoelnm6poVmKP//k8H1dPc4dS0+Lwqj4hGnV95QtB
	cw6dKGQaQtzVHL1TOcQiM8V9R7TwqdONr7XeLD+JdSYWV62fHZVYL7OT6gji0qsaBp1dM/m+Giq
	qFLAN0Hkq4FqCZ+OWwtJUgObKV3U5Kl9LoXicHbvVQdvD5
X-Gm-Gg: AfdE7ckYl/6EBfqldJmHBaRTASriX5okRIPQmTfcX5+r4kKOrPGbMuNigCfCpfZiT0r
	9/gxUeI3+BCsbZnsGW0hTwVMFmNsF7qQXjU6teTG8vMQCU9R4PGtuNVXD74sjKYsd8G9zWJEFWE
	kkkF5WyQa7j5v8TIqUtVmO0LIcVmnM4R6z8LJCEm5AFCg7tlcsnGilzv/m77WrJGxBvR4=
X-Received: by 2002:a05:622a:5809:b0:517:5f04:f23f with SMTP id d75a77b69052e-51a7212ec0cmr162164001cf.4.1782599916917;
        Sat, 27 Jun 2026 15:38:36 -0700 (PDT)
X-Received: by 2002:a05:622a:5809:b0:517:5f04:f23f with SMTP id
 d75a77b69052e-51a7212ec0cmr162163781cf.4.1782599916504; Sat, 27 Jun 2026
 15:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com> <CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
 <CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com> <CAO7dBbW55P9eibE5o74s8Hn+fsZ5CeasyEtLMcpkCM=kVzF7zQ@mail.gmail.com>
In-Reply-To: <CAO7dBbW55P9eibE5o74s8Hn+fsZ5CeasyEtLMcpkCM=kVzF7zQ@mail.gmail.com>
From: Tao Liu <ltao@redhat.com>
Date: Sun, 28 Jun 2026 10:38:00 +1200
X-Gm-Features: AVVi8Cc1IgNnVY-oF9acv_xVzyt_jMPxm05ZHOf7GFa7ENYpBTtJTdXSdt5FR2E
Message-ID: <CAO7dBbVfMtHDocudv2LgoJR1dNy8CufjB8SEz=BZ+hK6Ycu6Yw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S3xn-DGZx-g04AolpYyB7hZZRH-OOkn8VEPhXzUaJvk_1782599917
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_153841_473857_922EB591 
X-CRM114-Status: GOOD (  32.15  )
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

SGkgQmFvcXVhbiwKCk9uIEZyaSwgSnVuIDI2LCAyMDI2IGF0IDg6MzjigK9QTSBUYW8gTGl1IDxs
dGFvQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSGkgQmFvcXVhbiwKPgo+IEdsYWQgdG8gc2VlIHlv
dXIgbWVzc2FnZSBhZ2FpbiEKPgo+IFRoYW5rcyBmb3IgdGhlIEFjayBhbmQgdGhlIHN1Z2dlc3Rp
b24gZm9yIHRoZSBjb21tZW50LCBJIHdpbGwgYWRkIGl0Cj4gaW4gdGhlIG5leHQgdmVyc2lvbi4K
Pgo+IEluIHRoZSBtZWFudGltZSwgSSB3aWxsIGNoZWNrIGlmIHNpbWlsYXIgaXNzdWUgZXhpc3Rz
IG9uIExvb25nQXJjaCBhcyB3ZWxsLgo+Cj4gVGhhbmtzLAo+IFRhbyBMaXUKPgo+IE9uIEZyaSwg
SnVuIDI2LCAyMDI2IGF0IDg6MDTigK9QTSBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gQWRkIGtleGVjIE1MIHRvIENDLgo+ID4KPiA+IE9uIEZyaSwgSnVuIDI2LCAy
MDI2IGF0IDc6NDbigK9BTSBUYW8gTGl1IDxsdGFvQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBLaW5kbHkgcGluZywgYW55IGNvbW1lbnRzPwo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+
IFRhbyBMaXUKPiA+ID4KPiA+ID4gT24gRnJpLCBNYXkgMjksIDIwMjYgYXQgMzozNeKAr1BNIFRh
byBMaXUgPGx0YW9AcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBBIE5VTEwgcG9p
bnRlciByZWZlcmVuY2UgaXNzdWUgaXMgbm90aWNlZCBpbiByaXNjdidzIG1hY2hpbmVfa2V4ZWNf
cHJlcGFyZSwKPiA+ID4gPiB3aGVyZSBpbWFnZS0+c2VnbWVudFtpXS5idWYgbWlnaHQgYmUgTlVM
TCBhbmQgY29waWVkIHVuY2hlY2tlZC4KPiA+ID4gPgo+ID4gPiA+IFRoZSBOVUxMIGJ1ZiBjb21l
cyBmcm9tIHNlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX2tleGVjLmM6Cj4gPiA+ID4gaW1hX2Fk
ZF9rZXhlY19idWZmZXIoKSwgd2hlcmUga2J1ZiBpcyBhZGRlZCBieSBrZXhlY19hZGRfYnVmZmVy
KCksCj4gPiA+ID4gYnV0IGtidWYuYnVmZmVyIGlzIE5VTEwuCj4gPiA+ID4KPiA+ID4gPiBGaXgg
dGhpcyBieSBzaW1wbHkgYWRkaW5nIGEgY2hlY2sgYmVmb3JlIGNvcHkuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBUYW8gTGl1IDxsdGFvQHJlZGhhdC5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYyB8IDMgKysrCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9tYWNoaW5lX2tleGVjLmMKPiA+ID4gPiBpbmRleCAyMzA2Y2UzZTVmMjIuLmQ4MWQ1NzZmOWNi
NSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMK
PiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPiA+ID4gPiBA
QCAtNDEsNiArNDEsOSBAQCBtYWNoaW5lX2tleGVjX3ByZXBhcmUoc3RydWN0IGtpbWFnZSAqaW1h
Z2UpCj4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChpbWFnZS0+c2VnbWVudFtpXS5tZW1zeiA8
PSBzaXplb2YoZmR0KSkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
PiA+ID4gPgo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoaW1hZ2UtPnNlZ21lbnRbaV0uYnVm
ID09IE5VTEwpCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+
ID4gKwo+ID4KPiA+IFRoaXMgaXMgYSBnb29kIGZpeCwgbWF5YmUgd2UgY2FuIGFkZCBjb2RlIGNv
bW1lbnRzIHRvIGV4cGxhaW4gaXQgYXMKPiA+IGJlbG93LCBqdXN0IGZvciByZWZlcmVuY2UuCj4g
Pgo+ID4gICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAgICAgICAgICAqIFNvbWUgc2VnbWVu
dHMgKGUuZy4gSU1BKSByZXNlcnZlIHNwYWNlIGJ1dCBoYXZlIG5vIGJ1ZmZlcgo+ID4gICAgICAg
ICAgICAgICAgICogbG9hZGVkIHlldC4gU2tpcCB0aGVtIGFzIHRoZXkgY2Fubm90IGNvbnRhaW4g
YW4gRkRULgo+ID4gICAgICAgICAgICAgICAgICovCj4gPiBBbmQgaXMgdGhlcmUgYW55IG90aGVy
IHBsYWNlIHdoZXJlIHRoZSBzaW1pbGFyIGlzc3VlIGV4aXN0cz8gZS5nIG9uIExvb25nQXJjaD8K
CkkgaGF2ZSB0ZXN0ZWQgaW4gTG9vbmdBcmNoLCBpdCBkb2Vzbid0IGhhdmUgdGhlIHNpbWlsYXIg
aXNzdWUuIFRoZQpyZWFzb24gaXMsIGluIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC9tYWNoaW5lX2tl
eGVjLmM6bWFjaGluZV9rZXhlY19wcmVwYXJlKCksCnRoZSB1bmNoZWNrZWQgbWVtY3B5KCkgb25s
eSBoYXBwZW5zIGZvciBub25lIGtleGVjIGZpbGUgbG9hZCwgaG93ZXZlcgppbWFfYWRkX2tleGVj
X2J1ZmZlcigpIHJlcXVpcmVzIGtleGVjIGZpbGUgbG9hZC4gU28gdGhlIGNvbmRpdGlvbgppc24n
dCBtZXQuCgo+ID4KPiA+IE90aGVyIHRoYW4gYWJvdmUgY29uY2VybnMsIHRoaXMgcGF0Y2ggbG9v
a3MgZ29vZCB0byBtZToKPiA+Cj4gPiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5j
b20+CgpUaGFua3MgZm9yIHlvdXIgY29kZSByZXZpZXcgYW5kIHN1Z2dlc3Rpb25zIQoKVGhhbmtz
LApUYW8gTGl1Cgo+ID4KPiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGltYWdlLT5maWxlX21v
ZGUpCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KCZmZHQsIGltYWdlLT5z
ZWdtZW50W2ldLmJ1Ziwgc2l6ZW9mKGZkdCkpOwo+ID4gPiA+ICAgICAgICAgICAgICAgICBlbHNl
IGlmIChjb3B5X2Zyb21fdXNlcigmZmR0LCBpbWFnZS0+c2VnbWVudFtpXS5idWYsIHNpemVvZihm
ZHQpKSkKPiA+ID4gPiAtLQo+ID4gPiA+IDIuNDcuMAo+ID4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKPiA+ID4KPiA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
