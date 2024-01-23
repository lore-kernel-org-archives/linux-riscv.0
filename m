Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AA5C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uztcLaaBjtOFlgmmozb4xUC4FSqP8SAAs53XW2an9MU=; b=gNkdVE+1bWcXUR
	yBOD2BObPAdn4s+nomvMDwPqJG3XQfMJtAjNqVQ8xAN2UTyYKdtpl9VugvGoL9bO8dBurM06SB7Bl
	LvqeEfZ46elpM/hB9umcItguGRpbjMlOASr10P35bDnuIcVdfDe5TkXpCrTl6PUs66Aa15UX4ym8B
	hLkK3DRSFqMEMoMKYFuKe205u/BusWNcncIkN9hA6bqllRBZqrQ8L55EKkFMWlBiwRIs11jDsiATf
	NTwlVYzXut9AU3GeJm0HwUvP+APyM7l1dQwjTHn9A8Ru/PubQBk20jNJhoa+US4MagPj9Qgzosfr6
	ZrjJZickqd2LV0WC6qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSOuC-000bpY-00;
	Tue, 23 Jan 2024 22:06:04 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSOu8-000bnO-16;
	Tue, 23 Jan 2024 22:06:02 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5958d3f2d8aso430953eaf.1;
        Tue, 23 Jan 2024 14:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706047556; x=1706652356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aysBJhX0WuSz/+ETJ4n6CNlBN6IDxcYCfjo2tVGWMw8=;
        b=D/AC1L/qJxCwmxwucTae4FoygUl2W5MeKC5w24L1hVW37jrBrCom7HGIkbOileXGth
         S/uEj9dpcD3gDCPew4ZCG24hoD7k/3jVO2QOHJ2w/sdT5e0uwXha2mw89m2nI3HisaQ4
         9/JrIdu5vnwfu/cbtZ9pkPSm9eYT+cvQTDK5SRLf83mDRV9RidGzV2vTZg6CuijKGM+P
         RcrXZBd5qOQPQ/q6+q/ghu63vz1BnsMq6MXrvIuYt8ny4SGpuQ4kBJMAZSzVPhRYvvSN
         GJcnqhHgu1InXZVBI2L7u1tSJZ0fQOiLfgeYJgbevk/5EiMh4TRruRgdehpdS+yHLH8g
         /d6w==
X-Gm-Message-State: AOJu0Yzy0XOzP4GYPbcMQgIoId4K+RltmKOKtULz5UhuBGrq8iaIUDoV
	GGAKXIsm2NYKI3mo1tBog8X9XWnSwKSdQrzKmVu+c1UPssyjL4Of/75p+m5Ft+qlxZf9gcdLQm1
	ANnexLHFROp/sBCdI6IRPU5eWCao=
X-Google-Smtp-Source: AGHT+IGxuSonfkyvyqMXYCwyYcKsBELyim/SUL0gp6b7rCRYXwswAvhbx4htB7UWDzGueWKNwDacix1RPMx7M/tNIDM=
X-Received: by 2002:a05:6820:825:b0:599:a348:c582 with SMTP id
 bg37-20020a056820082500b00599a348c582mr614683oob.1.1706047556215; Tue, 23 Jan
 2024 14:05:56 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0h7wsLt8d3ZoLXsK1=crAx66T42WDKNoHcg8CiHpAjS8g@mail.gmail.com>
 <Za/q9jivG4OdZM0f@shell.armlinux.org.uk> <CAJZ5v0gwe02uzAQoX0QDHo35OTEozpbnqC6vukjM3aE6HMq9WQ@mail.gmail.com>
 <ZbADTBLDEFtdglho@shell.armlinux.org.uk> <CAJZ5v0jh-EdrnjkJep++UDo+Uv4hmR7VV4KYVdF4CK2K+5XLtg@mail.gmail.com>
 <ZbAMjZoybVfiAGcT@shell.armlinux.org.uk> <CAJZ5v0gt=MR1JGsPZnZG_AqudA-KMmb4BOa_A6H9B6+Rhe_+JQ@mail.gmail.com>
 <ZbAdAdqqfXRuY3Xj@shell.armlinux.org.uk> <CAJZ5v0gsqbeJc4qX-AefOqu53=rDme2XzFXacWz_0zbVBoaXjw@mail.gmail.com>
 <ZbAoJO8f66Dg0lGF@shell.armlinux.org.uk> <ZbArzbC19L1YxLHi@shell.armlinux.org.uk>
In-Reply-To: <ZbArzbC19L1YxLHi@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Jan 2024 23:05:43 +0100
Message-ID: <CAJZ5v0jvek=W-FNhiY_0DQha2wDCUv7YW_4jaHUeX0DbYJOX6Q@mail.gmail.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include 'present'
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_140600_378875_24833C9C 
X-CRM114-Status: GOOD (  24.06  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMTA6MTLigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkK
PGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAyMywgMjAyNCBh
dCAwODo1NzowOFBNICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gPiBPbiBU
dWUsIEphbiAyMywgMjAyNCBhdCAwOToxNzoxOFBNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3
cm90ZToKPiA+ID4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgOTowOeKAr1BNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo+ID4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCltjdXRdCgo+
ID4gU29ycnksIG5vIHBvaW50IGNvbnRpbnVpbmcgdGhpcy4KPgo+IExldCBtZSBiZSBjbGVhciB3
aHkgSSdtIGV4aGFzcGVyYXRlZCBieSB0aGlzLgo+Cj4gSSd2ZSBiZWVuIGdpdmluZyB5b3UgYSB0
ZWNobmljYWwgYXJndW1lbnQgKEFybTY0IHN1cHBvcnRpbmcgQUNQSQo+IGhvdHBsdWcgQ1BVLCBi
dXQgQUNQSV9IT1RQTFVHX0NQVT1uKSBmb3IgbWFueSBtYW55IGVtYWlscy4gWW91Cj4gc2VlbWVk
IHRvIG1pc3VuZGVyc3RhbmQgdGhhdCwgZXhwZWN0aW5nIEFDUElfSE9UUExVR19DUFUgdG8gYmVj
b21lCj4gWSBsYXRlciBpbiB0aGUgc2VyaWVzLgo+Cj4gV2hlbiB0aGF0IGJlY2FtZSBjbGVhciB0
aGF0IGl0IHdhc24ndCwgeW91J3ZlIGNoYW5nZWQgdGFjay4gSXQgdGhlbgo+IGJlY2FtZSBhYm91
dCB3aGV0aGVyIHR3byBmdW5jdGlvbnMgZ2V0IGNhbGxlZCBvciBub3QuCj4KPiBXaGVuIEkgcG9p
bnRlZCBvdXQgdGhhdCB0aGV5IGFyZSBzdGlsbCBnb2luZyB0byBiZSBjYWxsZWQsIG9oIG5vLAo+
IGl0J3Mgbm90IGFib3V0IHdoZXRoZXIgdGhvc2UgdHdvIGZ1bmN0aW9ucyB3aWxsIGJlIGNhbGxl
ZCBidXQKPiBob3cgdGhleSBnZXQgY2FsbGVkLgoKQXMgSSd2ZSBzYWlkIGFscmVhZHkgaW4gdGhp
cyB0aHJlYWQsIGl0IGlzIGFsbCBhYm91dCB3aGF0ICJBQ1BJLWJhc2VkCkNQVSBob3RwbHVnIiBt
ZWFucyB0byBlYWNoIG9mIHVzLgoKSSBrbm93IHdoYXQgaXQgbWVhbnMgdG8gbWU6IFJ1bm5pbmcg
dGhlIGNvZGUgdGhhdCBpcyBjb21waWxlZCB3aGVuCkFDUElfSE9UUExVR19DUFUgaXMgc2V0IHZp
YSB0aGUgcHJvY2Vzc29yIHNjYW4gaGFuZGxlci4KCkknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0
IGl0IG1lYW5zIHRvIHlvdS4KCllvdSBhcmUgc2F5aW5nIHRoYXQgdGhlIGNvbmZpZyBvcHRpb24g
bmFtZSBuZWVkcyB0byBiZSBjaGFuZ2VkLApiZWNhdXNlIGl0IGlzIGdvaW5nIHRvIHN0YXkgTiBm
b3IgQVJNNjQgYW5kIGl0IHdpbGwgc3VwcG9ydAoiQUNQSS1iYXNlZCBDUFUgaG90cGx1ZyIgYW5k
IEknbSBub3Qgc3VyZSB3aGF0IGV4YWN0bHkgeW91IG1lYW4gYnkKdGhpcy4KClRvIG1lLCB0aGlz
IGp1c3QgbWVhbnMgdGhhdCBBUk02NCBpcyBub3QgZ29pbmcgdG8gdXNlIHRoZSBwcm9jZXNzb3IK
c2NhbiBoYW5kbGVyIGluIHRoZSB3YXkgaXQgaXMgdXNlZCBvbiB4ODYuCgo+IEVzc2VudGlhbGx5
LCB3aGF0IHRoaXMgY29tZXMgZG93biB0byBpcyB0aGF0IF95b3VfIGhhdmUgbm8gdGVjaG5pY2Fs
Cj4gYXJndW1lbnQgYWdhaW5zdCB0aGUgY2hhbmdlLCBqdXN0IF95b3VfIGRvbid0IHBlcnNvbmFs
bHkgd2FudCBpdAo+IGFuZCBpdCBkb2Vzbid0IG1hdHRlciB3aGF0IGp1c3RpZmljYXRpb24gSSBj
b21lIHVwIHdpdGgsIHlvdSdyZQo+IGFsd2F5cyBnb2luZyB0byB0ZWxsIG1lIHNvbWV0aGluZyBk
aWZmZXJlbnQuCgpTb3JyeSwgYnV0IEknbSBqdXN0IG5vdCBjb252aW5jZWQgYnkgeW91ciBqdXN0
aWZpY2F0aW9uLgoKPiBTbyB3aHkgbm90IHN0YXRlIHRoYXQgeW91IHBlcnNvbmFsbHkgZG9uJ3Qg
d2FudCBpdCBpbiB0aGUgZmlyc3QKPiBwbGFjZT8gV2h5IHRoaXMgZ2FtZSBvZiBjYXQgYW5kIG1v
dXNlIGFuZCB0aGUgY29uc3RhbnRseSBjaGFuZ2luZwo+IGFyZ3VtZW50cy4gSSBndWVzcyBpdCdz
IHRvIHdhc3RlIGRldmVsb3BlcnMgdGltZS4KPgo+IFdlbGwsIEknbSBjYWxsaW5nIHlvdSBvdXQg
Zm9yIHRoaXMsIGJlY2F1c2UgSSdtIHRoYXQgcGlzc2VkIG9mZgo+IGF0IHRoZSBhbW91bnQgb2Yg
dGltZSB5b3UncmUgY2F1c2luZyB0byBiZSB3YXN0ZWQuCgpBbmQgSSBkb24ndCBoYXZlIHRvIHN1
ZmZlciB0aGlzIGtpbmQgb2YgYWJ1c2UuICBTb3JyeS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
