Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971B5C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7W98usOWdEBLkWub1n2y1reJuQ0ugRpoSoxf6kKIEM=; b=nbXkHjLzPckIdS
	S/s3YxRmhkDNnYIAUt2txWSeB1sLwDzEPhoXMOfIfpd+SaEK+Mgsq+OMhVMrQhhYWE8DWrruXP3N1
	wjY1ZHqVCMCBc19zy32+rojRxc19yoC4IgFhyL4FTanDiFroM4Dn8VIUoHu6IxtatKLtTOK+aLXjT
	iBEiPd1lSzX6TkhMHKQopzB9hiUvtej8cchDX7unTSiBkD5mLT4J1K0CQV69wreiH1Lnfy5vL5OFD
	U7B4jPkImgW1UwOGz6U+adzb7QLLe50tkqBrYkH/GsBMzA1pfUTcyqQ2Pl2HoCi0ibgT60uAK82+1
	WPZtRmWyFFFXJR6odgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKGz-00000000iSW-0nJf;
	Tue, 04 Feb 2025 14:51:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKFc-00000000iEl-2eVE
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 14:50:10 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-305d843d925so45015061fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680606; x=1739285406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=eI7RdI8UXqQ0wGDRArleC9vlbR/fdxhhIdhtcdK1jcvMkjCynCRcEdF0GDgHShK/B3
         oIDgsgCBJacCshbzoQ3PhH9nqDi+NNQAwmGcKzg/dVvNmZmGMMiHss4QmA1bKKIqk+LB
         GQbmrwz9wUbHYEdOuCOWlEVWvJMPqYmb8A+3P2fUZE3YNG0MU54RuY32qeAQtKtyMExi
         VGXyLifzsPW25qUnJLxxxu4vuDKEufs06yzNy11KjVbhvc4UhZWG/IaolgeQf9Y2sKTE
         AOgvGXWRMryeaUnui/7EVJVLbU4tw0dKtKj6Fp6SvMGve5lJ+7V0IDvj2p/8nJM0raAY
         zQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680606; x=1739285406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=l27gfWW8FOQWwg8wAmWyL86zasMIQ6dHv8ADMucv8zXvpfbDzVUJEmr7ZCRtdZjPR3
         oaz8ISFcZz6yPuMh6SLBi2XNqFWDF4XltxR7Z9KPlbYqMQGh2WC/Q56lW/M36Lw9YSFd
         zUMNaLba8b82fDvTlk+36H5UnK3qgU+iCWiGjkVSnrpV3EKN9p8siDmakLKM5L2eLaZh
         dZAuwJwe1fxd7cFd82D1OSwibGkh6BhF4xw5LFA/16DOrMSZ0FcO+iz1D4fXHw8OxHHn
         iBs300mT+IlFyJTZoenJhQpMAQQDyPcdFpS2BK/Std4qt0t5Nk4siRpojU0zvk3jTn5S
         kHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpyYzB4FOaxC9ZXaWJgck8/8lpwzzCoejDjLPvC0UwXFzoom4zw6uzMmlicmCI7xdsNKiZ1TeWuyKF+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw48xlONAOHgclebZJ5a7RCMq42mBTuFyxqvHA+Bqlkcqd5dCk/
	/uEvpI1HNhzCB5uvBwuhdVLx/iJc3iKUF4h9Hr78Vhk5m9Elzjl6lwG33jYtGk92Jbmhep4cwQs
	HaqhW/Hpic7TcMN0M39UjCePdOAkbBw9lC99cVxjMs0A2NN7ASgc=
X-Gm-Gg: ASbGncswJ5psYnYDqLdxqpozBJPMg6PfKrMM9GYJM/wbggSTFNYwEsoD6MqwZfXa2V8
	D04fO2cY6em6RnFbV/1ZCEBxYbHazC8PyIBtVJy0L+XStcJD9veIKpPgurv1ly5su6FMn2c+DMQ
	==
X-Google-Smtp-Source: AGHT+IHDEbsYQipfejXqFohjxLWs79QcoPD2kP+1yrW9qYk9n/SN/qyoP+wLyuKonmtT1FmQCmqnzeGwlD2OFASKWU0=
X-Received: by 2002:a05:651c:2115:b0:302:3a28:76cf with SMTP id
 38308e7fff4ca-307968e725emr115509751fa.25.1738680606043; Tue, 04 Feb 2025
 06:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
In-Reply-To: <87o6zinl5o.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:19:53 +0530
X-Gm-Features: AWEUYZnsP5bIEqfYtAEgSHeeevhnHrIfy83h-jtA8at0gwbWoWLEsA0X1oOoSQI
Message-ID: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_065008_674070_409C25CD 
X-CRM114-Status: GOOD (  31.30  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCAyOjI24oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMDQgMjAyNSBhdCAxMzoyNCwgQW51
cCBQYXRlbCB3cm90ZToKPiA+IERldmljZXMgKHN1Y2ggYXMgUENJKSB3aGljaCBoYXZlIG5vbi1h
dG9taWMgTVNJIHVwZGF0ZSBzaG91bGQKPiA+IG1pZ3JhdGUgaXJxIGluIHRoZSBpbnRlcnJ1cHQt
Y29udGV4dCBzbyB1c2UgSVJRQ0hJUF9NT1ZFX0RFRkVSUkVECj4gPiBmbGFnIGZvciBjb3JyZXNw
b25kaW5nIGlycWNoaXBzLgo+ID4KPiA+IFRoZSB1c2Ugb2YgSVJRQ0hJUF9NT1ZFX0RFRkVSUkVE
IGZ1cnRoZXIgc2ltcGxpZmllcyBJTVNJQyB2ZWN0b3IKPiA+IG1vdmVtZW50IGFzIGZvbGxvd3M6
Cj4gPgo+ID4gMSkgTm8gbmVlZCB0byBoYW5kbGUgdGhlIGludGVybWVkaWF0ZSBzdGF0ZSBzZWVu
IGJ5IGRldmljZXMgd2l0aAo+ID4gICAgbm9uLWF0b21pYyBNU0kgdXBkYXRlIGJlY2F1c2UgaW1z
aWNfaXJxX3NldF9hZmZpbml0eSgpIGlzIGNhbGxlZAo+ID4gICAgaW4gdGhlIGludGVycnVwdC1j
b250ZXh0IHdpdGggaW50ZXJydXB0IG1hc2tlZC4KPiA+IDIpIE5vIG5lZWQgdG8gY2hlY2sgdGVt
cG9yYXJ5IHZlY3RvciB3aGVuIGNvbXBsZXRpbmcgdmVjdG9yIG1vdmVtZW50Cj4gPiAgICBvbiB0
aGUgb2xkIENQVSBpbiBfX2ltc2ljX2xvY2FsX3N5bmMoKS4KPiA+IDMpIE5vIG5lZWQgdG8gY2Fs
bCBpbXNpY19sb2NhbF9zeW5jX2FsbCgpIGZyb20gaW1zaWNfaGFuZGxlX2lycSgpCj4KPiBJIGhh
dmUgbm8gaWRlYSBob3cgeW91IGNhbWUgdG8gdGhhdCBkZWx1c2lvbi4KPgo+IElSUUNISVBfTU9W
RV9ERUZFUlJFRCBpcyBwYXJ0IG9mIHRoZSBtZWNoYW5pc20gdG8gaGFuZGxlIHRoaXMgaW5zYW5p
dHkKPiBjb3JyZWN0bHkuIEl0IGRvZXMgbm90IHByZXZlbnQgdGhlIGRldmljZSBmcm9tIG9ic2Vy
dmluZyBhbmQgYWN0dWFsbHkKPiB1c2luZyB0aGUgaW50ZXJtZWRpYXRlIHN0YXRlLiBBbGwgaXQg
ZG9lcyBpcyB0byBlbnN1cmUgdGhhdCB0aGUga2VybmVsCj4gY2FuIG9ic2VydmUgdGhpcyBjYXNl
IGFuZCBhY3Qgb24gaXQuCj4KPiBUaGUgZmFjdCB0aGF0IHRoZSBrZXJuZWwgZXhlY3V0ZXMgdGhl
IGludGVycnVwdCBoYW5kbGVyIG9uIHRoZSBvcmlnaW5hbAo+IHRhcmdldCBDUFUgZG9lcyBub3Qg
cHJldmVudCB0aGUgZGV2aWNlIGZyb20gZmlyaW5nIGFub3RoZXIgaW50ZXJydXB0Lgo+IFBDSS9N
U0kgaW50ZXJydXB0cyBhcmUgc3RyaWN0bHkgZWRnZS4gaS5lLiBmaXJlIGFuZCBmb3JnZXQuCj4K
PiBJUlFDSElQX01PVkVfREVGRVJSRUQgc29sZWx5IGVuc3VyZXMgdGhhdCB0aGUgcmFjeSBhZmZp
bml0eSB1cGRhdGUgaW4KPiB0aGUgUENJIGRldmljZSBoYXBwZW5zIGluIHRoZSBjb250ZXh0IG9m
IHRoZSBvcmlnaW5hbCB0YXJnZXQgQ1BVLCB3aGljaAo+IGlzIHJlcXVpcmVkIHRvIGhhbmRsZSBh
bGwgcG9zc2libGUgY2FzZXMgY29ycmVjdGx5Lgo+Cj4gTGV0J3MgYXNzdW1lIHRoZSBpbnRlcnJ1
cHQgaXMgYWZmaW5lIHRvIENQVTAsIHZlY3RvciBBIGFuZCBhIG1vdmUgdG8KPiBDUFUxLCB2ZWN0
b3IgQiBpcyBwZW5kaW5nLiBTbyB3ZSBoYXZlIHRocmVlIHBvc3NpYmxlIHNjZW5hcmlvczoKPgo+
IENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGV2aWNlCj4gaW50ZXJydXB0Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxKSBSYWlzZXMgaW50ZXJydXB0IG9uIENQVTAs
IHZlY3RvciBBCj4gICAuLi4KPgo+ICAgICB3cml0ZV9tc2coKQo+ICAgICAgICAgd3JpdGVfYWRk
cmVzcyhDUFUxKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMikgUmFpc2VzIGlu
dGVycnVwdCBvbiBDUFUxLCB2ZWN0b3IgQQo+ICAgICAgICAgd3JpdGVfZGF0YSh2ZWN0b3IgQikK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMpIFJhaXNlcyBpbnRlcnJ1cHQgb24g
Q1BVMSwgdmVjdG9yIEIKPgo+ICMxIGlzIGhhbmRsZWQgY29ycmVjdGx5IGJlY2F1c2UgdGhlIGlu
dGVycnVwdCBpcyByZXRyaWdnZXJlZCBvbiBDUFUwLAo+ICAgIHZlY3RvciBBLCB3aGljaCBzdGls
bCBoYXMgdGhlIGludGVycnVwdCBhc3NvY2lhdGVkIChpdCdzIGNsZWFuZWQgdXAKPiAgICBfYWZ0
ZXJfIHRoZSBmaXJzdCBpbnRlcnJ1cHQgYXJyaXZlcyBvbiBDUFUxLCB2ZWN0b3IgQikuCj4KPiAj
MiBjYW5ub3QgYmUgaGFuZGxlZCBiZWNhdXNlIENQVTEsIHZlY3RvciBBIGlzIGVpdGhlciBub3Qg
aW4gdXNlIG9yCj4gICAgYXNzb2NpYXRlZCB0byBhIGNvbXBsZXRlbHkgdW5yZWxhdGVkIGludGVy
cnVwdCwgd2hpY2ggbWVhbnMgaWYgdGhhdAo+ICAgIGhhcHBlbnMgdGhlIGludGVycnVwdCBpcyBs
b3N0IGFuZCB0aGUgZGV2aWNlIG1pZ2h0IGJlY29tZSBzdGFsZS4KPgo+ICMzIGlzIGhhbmRsZWQg
Y29ycmVjdGx5IGZvciBvYnZpb3VzIHJlYXNvbnMuCj4KPiBUaGUgb25seSB3YXkgdG8gaGFuZGxl
ICMyIHByb3Blcmx5IGlzIHRvIGRvIHRoZSBpbnRlcm1lZGlhdGUgdXBkYXRlIHRvCj4gQ1BVMCwg
dmVjdG9yIEIgYW5kIGNoZWNraW5nIGZvciBhIHBlbmRpbmcgaW50ZXJydXB0IG9uIHRoYXQuIFRo
ZQo+IGltcG9ydGFudCByb2xlIElSUUNISVBfTU9WRV9ERUZFUlJFRCBwbGF5cyBoZXJlIGlzIHRo
YXQgaXQgZ3VhcmFudGVlcwo+IHRoYXQgdGhlIHVwZGF0ZSBoYXBwZW5zIG9uIENQVTAgKG9yaWdp
bmFsIHRhcmdldCkuIFdoaWNoIGluIHR1cm4gaXMKPiByZXF1aXJlZCB0byBvYnNlcnZlIHRoYXQg
Q1BVMCwgdmVjdG9yIEIgaGFzIGJlZW4gcmFpc2VkLgo+Cj4gVGhlIHNhbWUgY291bGQgYmUgYWNo
aWV2ZWQgYnkgZXhlY3V0aW5nIHRoYXQgaW50ZXJtZWRpYXRlIHRyYW5zaXRpb24gb24KPiBDUFUw
IHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCBieSBhZmZpbmluZyB0aGUgY2FsbGluZyBjb250ZXh0
ICh0aHJlYWQpCj4gdG8gQ1BVMCBvciBieSBpc3N1aW5nIGFuIElQSSBvbiBDUFUwIGFuZCBkb2lu
ZyBpdCBpbiB0aGF0IGNvbnRleHQuIEkKPiBsb29rZWQgaW50byB0aGF0LCBidXQgdGhhdCBoYXMg
aXQncyBvd24gcGlsZSBvZiBpc3N1ZXMuIFNvIGF0IHRoZSBlbmQKPiBtb3ZpbmcgaXQgaW4gdGhl
IGNvbnRleHQgb2YgdGhlIGludGVycnVwdCBvbiB0aGUgb3JpZ2luYWwgQ1BVL3ZlY3Rvcgo+IHR1
cm5lZCBvdXQgdG8gYmUgdGhlIHNpbXBsZXN0IHdheSB0byBhY2hpZXZlIGl0LgoKSSBnb3QgY29u
ZnVzZWQgYmVjYXVzZSBJUlFDSElQX01PVkVfREVGRVJSRUQgdXBkYXRlcyBhZmZpbml0eQp3aXRo
IHRoZSBpbnRlcnJ1cHQgbWFza2VkIHdoaWNoIEkgaW50ZXJwcmV0ZWQgYXMgbWFza2VkIGF0IHRo
ZSBkZXZpY2UKbGV2ZWwuIEFsc28sIFBDSSBNU0kgbWFzay91bm1hc2sgaXMgYW4gb3B0aW9uYWwg
ZmVhdHVyZSBvZiBQQ0kgZGV2aWNlcwp3aGljaCBJIHRvdGFsbHkgbWlzc2VkLgoKSSB3aWxsIGtl
ZXAgdGhlIGludGVybWVkaWF0ZSB0cmFuc2l0aW9uIGluIHRoZSBuZXh0IHJldmlzaW9uLiBUaGFu
a3MgZm9yCnRoZSBjbGFyaWZpY2F0aW9uLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
