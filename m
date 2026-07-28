Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A6FC53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6izqeyFk31XH1TANIkXh6s8Xh0+4yjNU2vstgnUZ1Q=; b=OAkKCSO4LTOmml
	pkLSb7EXwDrLgHOjDJ0YnBDoNBx55eVGucDBmarO3tgTJOvXR781xR9xbmGslTOMNNQYPpOrMuhLv
	roPkoYz3PQ5Z9cHUPjhkVt7NiP4WvtIZWxJThYmEnYhAYOH/phFd7xR7iPuCjDBzJidKU81DJTfxa
	OQZiDtGwqsuqCWKMFci4xE9XfKV5PaNnRLimTVOGWCBmWowppylqOl2DyfGE0XEs9quS1lOf//OU4
	HWCRXNCA73dpA9/liaNG/2GYUz9ZN5BOsQgnHKqzYyspEQz8+UXVQH8OrCoTScRwd/eDsLnbYHqzW
	hubLvESyXgNJ1TglXKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok85-00000005jXh-1Dry;
	Tue, 28 Jul 2026 15:54:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok82-00000005jWX-2zj3
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 15:54:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4720f3bf164so773067f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 08:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785254041; cv=none;
        d=google.com; s=arc-20260327;
        b=Iy5U4iYGomKQVewD8/yj5X7bYU6re/3pIa+Li/lVfjpJQ/DghWzsQR0I6ba3m3h4I9
         OZE+JsNpi9H+b95WQKcailh+NowiDs1NqzUsTYYg3ySeevI8O6zNnrK8BPmxmLBbsMKy
         xZ7nBZgfEhEg6lQhevt5bla1tYaxgWuK/sFKj9ThHmoCsEoHMF58Aah9ZaqaiWJuQ/4E
         JNp1O6XxuUE4FOX8D4qlF2L4BIroK2An5LCEgMBkAMgKzbpdPT657YSIbbJbiKldJHxn
         M4nyvf1db1JSrdk2BGhl+vI5FaNUw6HzR6vMPhVm6eABpkDNp/LyuI1b6llaIWikdvMZ
         0FbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        fh=KXSeuHzFvXcjFcDP1+spYln25I/zKNaUKvU1F3qyxJ4=;
        b=PS+raD8fU9I5WC/zuNM/Ypwz9BBI/f7FkAd0sQ6us8JhTbUMdTQC6X2FEr1dQra8L2
         sPL9TaH6vSyb6kStJBXmY3fZsmOL8ap8UUaMLISUnX6CydVmJ/5D0uyBlxhhiJEBUAK2
         tkH1Uw2mh2UpCroW7X13UiE9hfJdEUblUXpjAlB5p9VDDgvJzFyxLBQPWZa90lLq6X4b
         HRVVPw+NCbz8UKlq5JM2qujPKBm5qTSlSx0eH1AWx6aj8MWHSxFPiI1Y5HdiKqoBuGXv
         O3rKs8P1MwKm11SrRKrvG5G/y+KKZIRsa+wojVNa9YNVbpDMxktwV2VGP+0dax+w3DRh
         RNNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785254041; x=1785858841; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        b=RZaP1lkSKh309fI1zLtqOFu2ZMexPzCm5/rkds+9zeNLbXStK9u/5+c9B+iZi11ZN5
         AULcENnSQehExF8wV9Gk/Ac0UHqAN+OABqB2yYZ3iVMla974SG8TMyz20Jh7HqdAWzWB
         xuaXA9J3g8DJi5IbEzI0EX6fUmtE1gthMZHNy/4AJkIPhCmPrq5smjFArHGZmlhQnDCN
         OdRXt4jPsr4YruMOnOFu1U7ba3ANEaV3SXnsZEr5rDcratWkJKFaMWYZsQXP0fpMpriV
         sNAMXjPi/6+6IY3q1mZF0cW7W0PUmiqSKn83YJr2DfB0c9ktKoA4PVEQzLpRGftMPavz
         recw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254041; x=1785858841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        b=oPGl8wxxA2XAMY8XvRSJo0njUI4NC7O3sFWZC62Ogf508i+s6LThXQ0aHlTC+09Rl6
         eTdJJtGLBkoLIUaF6eD3n7qi0VuED1arHMs/xGhoygXJkaTood+rWUU6Wp0epxPBJiyT
         wV1rMxchp8yVhAu0vEVClgNjVwbTPMHYxZ4kIXzTWR9tga6kGrO3NsXTCILa27iK0qRC
         2RTIyZC7+SU33gHqZTMFwe95tkC6zI9D02ob8VK/TH4/S3izD/jGqSsMqTSf7to9pjWM
         oOAo0GM/BiSu45vm5bUg9EIdW+tCb2P819nYbjz16fV7sM3Hec7DkeNfBupmdYjPENqX
         Ndyg==
X-Forwarded-Encrypted: i=1; AHgh+RpW4yf/ThAg3f0eCKOB77v/7k2bBiJ1dYhQI3FAAAx8N15hxM0WKsmz/yJj5BhFdlYBNDLJuW12rCVaEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp9Qa1xHdrvTGysZ56l+68z2jvofn/5E05my1D3uuoaJEvFVaP
	A6ThWrcAP59xmSRqaAQYILie2Qe8/Rzzh94kx5kLoLnLF88fzVB0Y906gU/vAhRcXuMnFQep7cz
	PrQ9XrUWgEg6fV/4bTZNj7FomyGaqxv1tisWckGlQDA==
X-Gm-Gg: AR+sD10NZ1iRacJJX0bWZlSKcMka9GuuWqDTk8IWwRGM8TYQ/dwpwpV3wCYmrtqgc/l
	d7jNFpOX3Ecch4Ah+PVYd9zMC7OvqlkpoMstvoHpiDimvN3fbMwz0ihshoJMuu9dBhhjb7Fgbqr
	cxV6Zc1DZiO+ZRWJAa9dQ2Dm9U6tLusr7hS6rXzxUD9UWN5mU6M33fEusVqQm4Br+LmZoZePhu+
	ZExyZm+lc7g6W4q/o4LQOLcwzStcKxK/kmUyKX/QpBuXtrWEnAUw14LLp2Xqj4l7HA5URRKjNQn
	1jhWZ1smVcdyTrvYpa93HV6W6P+MELLPgqbeoDQu29380Fy9MHAQv+bBOk6ECSvLgKc4KkQKmHQ
	FPGR6qacobhvZ9h4=
X-Received: by 2002:a5d:5f51:0:b0:45e:dd32:92fa with SMTP id
 ffacd0b85a97d-47fb1e9992amr3932927f8f.12.1785254040632; Tue, 28 Jul 2026
 08:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260709115610.287420-1-yhchen312@gmail.com>
In-Reply-To: <20260709115610.287420-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:23:49 +0530
X-Gm-Features: AUfX_mwzsyiunp_bPATfO_O8RiK5DjkNzGjCdX_kznFgbSWBNjYBF0Izm64N9aI
Message-ID: <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
To: "Yuhang.chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085402_772381_C0C7175D 
X-CRM114-Status: GOOD (  16.45  )
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

T24gVGh1LCBKdWwgOSwgMjAyNiBhdCA1OjI24oCvUE0gWXVoYW5nLmNoZW4gPHloY2hlbjMxMkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEga2VybmVsIGNvbW1hbmQtbGluZSBvcHRpb24sIGt2
bS1yaXNjdi53ZmlfdHJhcF9wb2xpY3k9dHJhcHxub3RyYXAsCj4gdGhhdCBjb250cm9scyB3aGV0
aGVyIGEgV0ZJIGV4ZWN1dGVkIGJ5IGEgVlMtbW9kZSBndWVzdCB0cmFwcyBpbnRvIEtWTQo+IChI
Uy1tb2RlKSBvciBleGVjdXRlcyBuYXRpdmVseS4KPgo+IE1lYXN1cmVkIHJlc3VsdHMgKHdmaV9l
eGl0X3N0YXQgZGVsdGEgLyBndWVzdCB3YWtlIGNvdW50IG92ZXIgMyBzKToKPgo+ICAgcG9saWN5
ICAgICAgICBXRklfRVhJVFMgICBXQUtFX0NOVAo+ICAgLS0tLS0tLS0tLSAgICAtLS0tLS0tLS0g
ICAtLS0tLS0tLQo+ICAgZGVmYXVsdCAgICAgICAyOTUgICAgICAgICAyOTQgICAgICAoPT0gdHJh
cCwgbm8gcmVncmVzc2lvbikKPiAgIHRyYXAgICAgICAgICAgMjk1ICAgICAgICAgMjk0Cj4gICBu
b3RyYXAgICAgICAgICAgMCAgICAgICAgIDI5OAo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVuZzpk
ZWVwc2Vlay12NC1wcm8KPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNj
YXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5j
bj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWhhbmcuY2hlbiA8eWhjaGVuMzEyQGdtYWlsLmNvbT4KPiAt
LS0KPiAgLi4uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgMTQg
KysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8
IDQ0ICsrKysrKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IGI1NDkzYTdmOGYyMi4uZWU2NjAzYjMwMDMzIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMu
dHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQKPiBAQCAtMzI1NCw2ICszMjU0LDIwIEBAIEtlcm5lbCBwYXJhbWV0ZXJzCj4KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBub3RyYXA6IGNsZWFyIFdGSSBpbnN0cnVjdGlvbiB0cmFwCj4KPiAr
ICAgICAgIGt2bS1yaXNjdi53ZmlfdHJhcF9wb2xpY3k9Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgW0tWTSxSSVNDVl0gQ29udHJvbCB3aGVuIHRvIHNldCB0aGUgV0ZJIGluc3RydWN0aW9uCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgdHJhcCBmb3IgS1ZNIFZNcy4gV2hlbiBzZXQsIGEgVlMt
bW9kZSBXRkkgdHJhcHMgaW50bwo+ICsgICAgICAgICAgICAgICAgICAgICAgIEtWTSBhbmQgaXMg
ZW11bGF0ZWQ7IHdoZW4gY2xlYXIsIHRoZSBndWVzdCBleGVjdXRlcwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIFdGSSBuYXRpdmVseSBhbmQgYmxvY2tzIHVudGlsIGEgVlMtbW9kZSBpbnRlcnJ1
cHQKPiArICAgICAgICAgICAgICAgICAgICAgICAoZS5nLiB0aGUgc3N0YyB0aW1lcikgaXMgcGVu
ZGluZy4KPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHJhcDogc2V0IFdGSSBpbnN0cnVj
dGlvbiB0cmFwIChIU1RBVFVTLlZUVz0xKQo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBu
b3RyYXA6IGNsZWFyIFdGSSBpbnN0cnVjdGlvbiB0cmFwIChIU1RBVFVTLlZUVz0wKQo+ICsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBEZWZhdWx0cyB0byB0cmFwLCBwcmVzZXJ2aW5nIHRoZSBw
cmV2aW91cwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuY29uZGl0aW9uYWwgYmVoYXZpb3Iu
Cj4gKwoKVGhpcyB3b3VsZCBtZWFuIHRoYXQgZm9yIHRoZSAibm90cmFwIiBwb2xpY3kgdGhlIFZD
UFUgd291bGQgbmV2ZXIKc2xlZXAgYW5kIGluY3JlYXNlIGhvc3QgQ1BVIHV0aWxpemF0aW9uIGV2
ZW4gd2hlbiBWQ1BVIGlzIGlkbGUuCklzIHRoaXMgZXhwZWN0ZWQgYmVoYXZpb3VyID8KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
