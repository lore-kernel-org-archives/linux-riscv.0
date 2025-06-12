Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E1DC71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1OARlwJRihcSZwSpi21Qd93sB/fQlM7GVUHtwRZeq8=; b=T293YBOSgA65a4
	VoAa0qToE27iIS53U+ABFftHFztM2dslqR56URrLraMOhPv1gNW9OM26itKkez4rPwo11vrB8hcQu
	2OEmHgk/ggKyBUiQiy2N5ku60zoD6ofwfwu9RuzOG9WXNal492/46pDWFSpJD6gIqxKXiN2TOhWTm
	EzEGhpRO02ln+h1J/Gb3F2+WigUWTnfhCrRgDmmMNCWyP8JBzPmAcnziWdwrXv62fY2Ia2CPC4dy6
	4d0p18oCqZI1/d2OSVIzcCjt6c/JDltVgO/+v7ukMQfrvPslbaoi7RFHpp0RGhS6GLzkRIGKi8dY8
	mRNJybdVm/TmgzXWGu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY0T-0000000C17R-37SL;
	Thu, 12 Jun 2025 02:49:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPX43-0000000Buf8-0hZt
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 01:49:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso77121166b.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749692949; x=1750297749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeRmmiJk7dyHe2xsIaa6eDpe9k71PqYl6SPvF++88pc=;
        b=m8Dj0JBuCsI6e31QJfud0yd5J9tNDDmuLoU/rEFWXnLp3JO/6JXMmESNrw5245NDkv
         cbT2GMO75ALS17u63dJPZBDLHnhaVUzITkHkT5qS/fF0Wo3vXcf8vDnCYRQPNj5FaCT1
         j5YfjGKDVi4OfVTgGeacyFBHR65iXQMEWqyfHPz4rJxEDl9y+V9EQxqIVaoCrr8y4vqJ
         xP8CIoV97DNBYKZEJ4gXav5CLBbeSn7P3zxrGEsS55LgfpEp/94Z3k5JJZrHgFpNMct1
         8x//wuU2/2PiDZJDcASAdrugkmJU8VSlPQHoEIDWODttZqdG7JCF7nC2m/6EDLRr1u0d
         lZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692949; x=1750297749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeRmmiJk7dyHe2xsIaa6eDpe9k71PqYl6SPvF++88pc=;
        b=ovUagNiyjUdqceKgUZZTBy7lsN9ExjQwAxdv2ZGB06MyjCLtuO4lhtZgw3fjET+ZN0
         zhcAyJ/KEz3gKK6FbdmN0FgsXyPIZckwTmbsHREpkH0myYHLeQRQMusgVQ3fLLNQROb7
         rRE05nUfYVHcbFdxW+IsBaY5V2Tl2ZuMmWZOJSJ0Q+FOO6cLoLvCH+vemml8c47bDL/6
         5fyCeBnh9A0DlfSa8IHhP47S0fGqGuZKiARSCu3hM8eQr1QcpX/HH41CaCSh0mEMB3hT
         brQIVeIpshBBFhWwyofYQORldKEQnvsAkJdSOqh2YpAPMYGUWV98I8/zoTHu4FjuqINj
         5rNw==
X-Forwarded-Encrypted: i=1; AJvYcCXVP9zFb7Pr7twwRsQirf53e2EG6v+am47OXJTbHMznu4lYaOR/vfeXmDLdODb5D1EQLUoxwaTjnJ5m2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx05nv3jupzgukKWBt/VZ8W3xJm2//zFVkitH0iu8n378nU8oJ4
	MazPKz/FC8Y5Bhb5Lj0byAkgvJ0Obg+ZTGIpptWnbxGTg7FTjmJ9gUXnPHOhZeMB+mbdNPMKjO1
	9kcrq49MD5lok+t7j+J51cofBtcHtXQFHy1D+r18rEQ==
X-Gm-Gg: ASbGnctIXvKviOkG8qCJn5cYd8ZpJ/CeXBHb5UalzbNJfWWYC7TPwvOQ5/9e277yKZF
	gLt7EXuzVNIUm/3BYQ4/TJQ+fAB0LM0AuJ+sD9sAVGXY6pEn+Y0880dJrEI7ftNbLKU1nUTD3Pa
	HVHyItoga6mMz5xIALq8z9MXxB3FuT8mKUWpBydJGbbgbCvvx1FHlh/9A=
X-Google-Smtp-Source: AGHT+IFqEcHJsmVoMqXHHPFn7yHeR1oDGdJeaYWXWqBT/PegqYwsZ5z0ffozW4eWFgBnqvaTPT/vq7D0XhuX7E2hMC8=
X-Received: by 2002:a17:907:1c19:b0:ade:2c48:1ba7 with SMTP id
 a640c23a62f3a-adea9a57710mr122939966b.55.1749692949426; Wed, 11 Jun 2025
 18:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-2-guodong@riscstar.com>
 <20250611-kabob-unmindful-3b1e9728e77d@spud> <20250612000354-GYA127864@gentoo>
In-Reply-To: <20250612000354-GYA127864@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 12 Jun 2025 09:48:55 +0800
X-Gm-Features: AX0GCFvb3rY5RbOdj--6bI5I0CRQw5-xjkK6pB9t5n94l_np5ZJaDhu5M4gwDF4
Message-ID: <CAH1PCMbZRhrrKy0TV7D9_nOKkPNuX7gXyyxtzhf_q7vcfhBB_Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT PDMA compatibility
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, elder@riscstar.com, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_184911_209137_153FDD7D 
X-CRM114-Status: GOOD (  20.35  )
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

T24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgODowM+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IE9uIDE3OjI3IFdlZCAxMSBKdW4gICAgICwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+ID4gT24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDg6NTc6MTZQTSArMDgwMCwgR3VvZG9u
ZyBYdSB3cm90ZToKPiA+ID4gQWRkICJzcGFjZW1pdCxwZG1hLTEuMCIgY29tcGF0aWJsZSBzdHJp
bmcgdG8gc3VwcG9ydCBTcGFjZW1pVCBQRE1BCj4gPiA+IGNvbnRyb2xsZXIgaW4gdGhlIE1hcnZl
bGwgTU1QIERNQSBkZXZpY2UgdHJlZSBiaW5kaW5ncy4gVGhpcyBlbmFibGVzOgo+ID4gPgo+ID4g
PiAtIFN1cHBvcnQgZm9yIFNwYWNlbWlUIFBETUEgY29udHJvbGxlciBjb25maWd1cmF0aW9uCj4g
PiA+IC0gTmV3IG9wdGlvbmFsIHByb3BlcnRpZXMgZm9yIHBsYXRmb3JtLXNwZWNpZmljIGludGVn
cmF0aW9uOgo+ID4gPiAgICogY2xvY2tzOiBDbG9jayBjb250cm9sbGVyIGZvciB0aGUgRE1BCj4g
PiA+ICAgKiByZXNldHM6IFJlc2V0IGNvbnRyb2xsZXIgZm9yIHRoZSBETUEKPiA+ID4KPiA+ID4g
QWxzbywgYWRkIGV4cGxpY2l0ICNkbWEtY2VsbHMgcHJvcGVydHkgZGVmaW5pdGlvbiB0byBhdm9p
ZAo+ID4gPiAibWFrZSBkdGJzX2NoZWNrIFc9MyIgd2FybmluZ3MgYWJvdXQgdW5ldmFsdWF0ZWQg
cHJvcGVydGllcy4KPiA+ID4KPiA+ID4gVGhlICNkbWEtY2VsbHMgcHJvcGVydHkgaXMgZGVmaW5l
ZCBhcyAyIGNlbGxzIHRvIG1haW50YWluIGNvbXBhdGliaWxpdHkKPiA+ID4gd2l0aCBleGlzdGlu
ZyBBUk0gZGV2aWNlIHRyZWVzLiBUaGUgZmlyc3QgY2VsbCBzcGVjaWZpZXMgdGhlIERNQSByZXF1
ZXN0Cj4gPiA+IGxpbmUgbnVtYmVyLCB3aGlsZSB0aGUgc2Vjb25kIGNlbGwgaXMgY3VycmVudGx5
IHVudXNlZCBieSB0aGUgZHJpdmVyIGJ1dAo+ID4gPiByZXF1aXJlZCBmb3IgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSB3aXRoIFBYQSBkZXZpY2UgdHJlZSBmaWxlcy4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgLi4uL2JpbmRpbmdzL2RtYS9tYXJ2ZWxsLG1tcC1kbWEueWFtbCAgICAgICAgICAgfCAxNyAr
KysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
PiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kbWEvbWFydmVsbCxtbXAtZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZG1hL21hcnZlbGwsbW1wLWRtYS55YW1sCj4gPiA+IGluZGV4IGQ0NDdkNTIwN2JlMC4u
ZTExN2E4MTQxNGJkIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZG1hL21hcnZlbGwsbW1wLWRtYS55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvbWFydmVsbCxtbXAtZG1hLnlhbWwKPiA+ID4gQEAg
LTE4LDYgKzE4LDcgQEAgcHJvcGVydGllczoKPiA+ID4gICAgICAgIC0gbWFydmVsbCxwZG1hLTEu
MAo+ID4gPiAgICAgICAgLSBtYXJ2ZWxsLGFkbWEtMS4wCj4gPiA+ICAgICAgICAtIG1hcnZlbGws
cHhhOTEwLXNxdQo+ID4gPiArICAgICAgLSBzcGFjZW1pdCxwZG1hLTEuMAo+ID4KPiA+IFlvdSBu
ZWVkIGEgc29jLXNwZWNpZmljIGNvbXBhdGlibGUgaGVyZS4KPiA+Cj4gaXMgdGhlIHZlcnNpb24g
bnVtYmVyICgxLjAgaGVyZSkgYWN0dWFsbHkgZG9jdW1lbnRlZCBhbnl3aGVyZT8KPgo+IG90aGVy
d2lzZSBJJ2Qgc3VnZ2VzdCB1c2luZyAic3BhY2VtaXQsazEtcGRtYSIgd2hpY2ggZm9sbG93IHRo
ZSBjb252ZW50aW9uCj4gd2hpY2ggYWxyZWFkeSBkb25lIGZvciBzcGFjZW1pdCBpbiBvdGhlciBj
b21wb25lbnRzLi4KPgoKVGhhbmtzIENvbm9yIGFuZCBZaXh1bi4gSSB3aWxsIHRha2UgdGhpcyBj
b21wYXRpYmxlIHN0cmluZwoic3BhY2VtaXQsazEtcGRtYSIuCgotR3VvZG9uZwoKPiAtLQo+IFlp
eHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
