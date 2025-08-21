Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D97CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tok7ACTYGI1auF2D1maFvThRUNb+SdWOPDH/yhKO40o=; b=VEgZzf/YTkuY7E
	duV8XnRULoLnDNp1+01eKiBm7jQCi1f41KH+EGYSTCwbR6ouDahXB3uCD6l8EnZT0uzWDngel/dYa
	uHxIvYZPR4uSN/1epWj7Y6BU3rQMrAhzyrPgAVkIPd/cYQEvvYk+o0eACdlBVPWo34MfTB5tHb5Ax
	BQGTZxHzAH+A+ZgxZrSXbVSMDrn/fdbt5NmUPd9kZv2ZeesrpIe5PqaLCJpLvUaeDoOVxQhALkiiZ
	neroI4pi1N7aI4nHblMxaReQhr/uAZjMdmRtcctJdaN9ecCul8hT+yJfg+5IPS5MFThnZuXOAPt8Q
	QtcDkxRLx0tvPaHd9IpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1oB-0000000GToK-1goW;
	Thu, 21 Aug 2025 09:42:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0P8-0000000GCJo-3PmZ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 08:12:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso3525095e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755763933; x=1756368733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnPqNwnRdJMIc37XxiVZSImeUH9HHnzjQda0KVcM9Yc=;
        b=IwEq/2Av6WTGHhXKrDsVP7nf5K1KJfsiEEyhxBwRe8C9vyA5ss6RmVt04hKmJQhBLg
         3HBUhGaU939WAVITOgWTgeNjmW8l8Sf8UzNITGTBRECwouYAImiwJcOs1ygrwQFRsm1U
         5KQUB8Fotqw8LmeBP+hTDX1AuuQVG+NCs6BG4UmcuP47HBNbW8wJPONJuJSUmsGnm4zz
         8ambbRIr8cvLKqdzk8Qv5xsVLz8LmLsdAwLGXUmIVPslIOjE1skF7jz5zgq74JGJcVQw
         tXDwIjVUbr0DSth79IF4JW8WhigLpj2Stk/EghxBHEjq6yIfI4kfr+boeMwFTo4NeAiq
         KTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763933; x=1756368733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RnPqNwnRdJMIc37XxiVZSImeUH9HHnzjQda0KVcM9Yc=;
        b=YDuyDTNTQO1+T8C4PjDFoP7P3MXBNSfCtLb/eFUkqJ++MhcqeV9T1GbMkvKdEFrzQ6
         HmJfyPxot/CXDPB5yJaiEH/JnwB3vGgxRf/wyS0eBvWLL3ubzl4uwlEKAOabWBGZUmgL
         L2pfsoQYNEAUtGZ8VVZEVQpH7SkqVvd15gh0VQxeBz6oLzr1pb0BFFG6kSrFvXhrG/GP
         VCZWQoB/PYJRePkJEEYLJ2Ek5dhRLX6Lll7MXxcSDfVNy9Z+9NuSttK5HpsFjvV3kPi9
         +V5PpnRq/7IZ8xlvSqioK21TfzpK6EHu2Tsv+ODvlkhDrLa3IGxQndmbe35P5oEyTeRg
         +yaA==
X-Forwarded-Encrypted: i=1; AJvYcCW/zh1Has8K3hkyQXRtOi05WoZ4MvhrsOfx3S7b5Xk1hPsiChhS4JrNejaom8NzWCs+RfXmuslN7OA5Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPisNpFRPZpI7UaVcWUc3kdYzPQR/5SYio5AVh1O6+ZW66pw0t
	NX+4jT7otTTN57zgAeLmNS8JKMt7hojjwGANME88Q97BvNnS97CLS4oyawWpyY9fJuE=
X-Gm-Gg: ASbGncsH+VMtizwzQL7pFetal0KIPGWcOb1RgbY5/Xj1yJcawq+9tY0iXwESaTjm79p
	IxqshzZQl0HEPQKbMtTjUQeQtUV7gZw6yKOh+oAweY8ChIB4EpQtec9Rae73l9EyroSnvTkgnRW
	8QAgslTDgKHAfZGVJxAlDkeYx3p/uSqHI93NoO4aZOLidwCCloI5rudooW8qATR/RmV0BNAq2Mg
	M4GVWJEF3hcPh4LJmHjDDavzpvXi79YtzbjXt95DCDOg+1zVA1D7/xu4KwGsVMEXASxrsbFpv+0
	7qHQL5pl9hBWgDNn20AAk553GF1Hb2iWQWezAryYj4uwcQ5i4wE9KfM8SjLLmwwuTfw5A8VojEX
	nREjPZFO1fTc+d7Dvqk1+49TGkvCDCwAdwsneN61GaNzjnG5CRaVkaOsEnftLknCeD2KuqwXk2X
	a9T9rDKLQ7x+ji
X-Google-Smtp-Source: AGHT+IHdhYS0MRSPzzW3UprEmG6p659Pq++hTQXcf3C6FUIxInpMAwyfL1/KDCaz5DbATd0JncFKyA==
X-Received: by 2002:a05:6000:4283:b0:3c3:8e05:f72d with SMTP id ffacd0b85a97d-3c496da8a46mr1312520f8f.33.1755763932852;
        Thu, 21 Aug 2025 01:12:12 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:b63f:533e:fab7:5343? ([2a02:1807:2a00:3400:b63f:533e:fab7:5343])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879fe5sm10591690f8f.2.2025.08.21.01.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:12:12 -0700 (PDT)
Message-ID: <b98cfa73-c6ec-4006-bf84-febbbdea8804@hammernet.be>
Date: Thu, 21 Aug 2025 10:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: add UART resets for Soc K1
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250807191817.157494-1-hendrik.hamerlinck@hammernet.be>
 <20250820231917-GYB1065530@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250820231917-GYB1065530@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_011215_089254_E87C0DEA 
X-CRM114-Status: GOOD (  19.99  )
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

SGVsbG8gWWl4dW4sCgpPbiA4LzIxLzI1IDAxOjE5LCBZaXh1biBMYW4gd3JvdGU6Cj4gSGkgSGVu
ZHJpaywgCj4KPiBPbiAyMToxOCBUaHUgMDcgQXVnICAgICAsIEhlbmRyaWsgSGFtZXJsaW5jayB3
cm90ZToKPj4gQWRkIHJlc2V0IGNvbnRyb2wgZW50cmllcyBmb3IgYWxsIFVBUlRzIGluIHRoZSBT
cGFjZU1JVCBLMSBTb0MgRGV2aWNlIFRyZWUuCj4+IFVBUlQwIHdhcyBmdW5jdGlvbmFsIGFzIGl0
IGRpZCBub3QgbmVlZCBhIHJlc2V0LiBCdXQgdGhlIG90aGVyIFVBUlRzIHdlcmUKPj4gdW5hYmxl
IHRvIGFjY2VzcyB0aGVpciByZWdpc3RlcnMgd2l0aG91dCB0aGUgcmVzZXQgYmVpbmcgYXBwbGll
ZC4KPj4KPiAuLgo+PiBBbHRob3VnaCBwZXJoYXBzIG5vdCBuZWVkZWQgSSBkaWQgYWRkIHRoZSBy
ZXNldCBmb3IgVUFSVDAgYXMgd2VsbCwKPj4gdG8gZW5zdXJlIGNvbnNpc3RlbmN5IGFjcm9zcyBh
bGwgVUFSVHMuIFdpdGggdGhlIGN1cnJlbnQtc3BlZWQgc2V0IHRvCj4+IDExMjUwMCBiYXVkIHJh
dGUsIGl0IG1hdGNoZXMgdGhlIGZhY3RvcnkgVS1Cb290IHNldHRpbmdzLgo+PiBUaGlzIHNob3Vs
ZCBub3QgZ2l2ZSBpc3N1ZXMgd2l0aCBlYXJseSBjb25zb2xlIHVzYWdlLiBCdXQgcGVyaGFwcyBp
dCBjb3VsZAo+PiBiZSBhIGdvb2QgaWRlYSB0byBsZXQgc29tZWJvZHkgZWxzZSBjb25maXJtIHRo
aXMgYXMgd2VsbC4KPj4KPiBBZGRpbmcgcmVzZXQgdG8gVUFSVDAgaXMganVzdCBmaW5lLCBzbyB3
ZSBkb24ndCBuZWVkIHRvIHByZXN1bWUgaXQgd2lsbAo+IHJlbHkgb24gYm9vdGxvYWRlciB0byBk
ZS1hc3NlcnQgdGhlIGNvbnRyb2xsZXIKPgo+IHBsZWFzZSB3cml0ZSBjaGFuZ2Vsb2dzIGluIGlt
cGVyYXRpdmUgbW9vZCwgeW91IGNhbiBmb2xsb3cKPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9wcm9jZXNzL21haW50YWluZXItdGlwLmh0bWwjY2hhbmdlbG9nCk9rLCBJ
4oCZbGwgdXBkYXRlIHRoZSBjaGFuZ2Vsb2cgYWNjb3JkaW5nbHkgaW4gdjIuCj4KPj4gVGVzdGVk
IHRoaXMgbG9jYWxseSBvbiBib3RoIE9yYW5nZSBQaSBSVjIgYW5kIEJhbmFuYSBQaSBCUEktRjMg
Ym9hcmRzLiAKPj4gSSBlbmFibGVkIHRoZSBVQVJUOSBhbmQgd2FzIGFibGUgdG8gdXNlIGl0IHN1
Y2Nlc3NmdWxseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGVuZHJpayBIYW1lcmxpbmNrIDxoZW5k
cmlrLmhhbWVybGluY2tAaGFtbWVybmV0LmJlPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazEuZHRzaSB8IDEwICsrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKPj4g
aW5kZXggYWJkZThiYjA3Yzk1Li43YTUxOTZhOTgwODUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEuZHRzaQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLmR0c2kKPj4gQEAgLTY2Nyw2ICs2NjcsOCBAQCB1YXJ0MDogc2VyaWFsQGQ0
MDE3MDAwIHsKPj4gIAkJCQljbG9ja3MgPSA8JnN5c2Nvbl9hcGJjIENMS19VQVJUMD4sCj4+ICAJ
CQkJCSA8JnN5c2Nvbl9hcGJjIENMS19VQVJUMF9CVVM+Owo+PiAgCQkJCWNsb2NrLW5hbWVzID0g
ImNvcmUiLCAiYnVzIjsKPiAuLgo+PiArCQkJCWN1cnJlbnQtc3BlZWQgPSA8MTE1MjAwPjsKPiBw
bGVhc2UgZHJvcCB0aGlzIHByb3BlcnR5LCBkdHNpIGZpbGUgc2hvdWxkIGNvbnRhaW4gZ2VuZXJp
YyBpbmZvIGZvciBTb0MsCj4gZXZlbiBpbiByZWFsIGNhc2VzLCBhbGwgYm9hcmRzIHVzZSBVQVJU
MCBhcyBzZXJpYWwgb3V0cHV0IGFuZCBjb25maWd1cmVkCj4gYXQgYmF1ZHJhdGUgMTE1MjAwLCBp
dCBzdGlsbCBiZSBhYmxlIHRvIGFsdGVyIHRvIGRpZmZlcmVudCBmcmVxdWVuY3kuLgo+Cj4gYmVz
aWRlcywgaWYgeW91IHJlYWxseSB3YW50IHRvIHNldCBiYXVkcmF0ZSwgdGhlbiBJJ2Qgc3VnZ2Vz
dCB0byBjb25maWd1cmUKPiBpdCBhdCBib2FyZCBzcGVjaWZpYyBkdHMgZmlsZSwgCj4gICBzdGRv
dXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKVW5kZXJzdG9vZCwgSeKAmWxsIGRyb3AgdGhl
IGBjdXJyZW50LXNwZWVkYCBwcm9wZXJ0eS4gSXQgd29ya3Mgd2l0aG91dCBpdC4KClRoYW5rcyBm
b3IgdGhlIHJldmlldy4KCktpbmQgcmVnYXJkcywKSGVuZHJpawoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
