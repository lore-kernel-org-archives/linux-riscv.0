Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7061C44507
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZbLF5q1WN+U5cjS3DxdlrE7yEA4UCMGr38itcEFqEg=; b=b4SguikthlhA7P
	r6mt9ZFNvY9m44iLS5UOCIQyWwpH2LDa7q0gI062Yn9jv+Agx8O2fu0bsQyd8nkqF2voMoVqY+HjP
	N5NW1NyiyQzWilKoOgy+JrUazJGdDTpEZs5lLKu38JDXtk0I/UwWqEEifHDeQ4WpTLij/+dVMYGAM
	3AvJq98f8kHHQTJjG4y4vD5cj7QR9pD6jZnvugooRPjfldEJIiRgEHbqeCUICRmzO4OnEdfNphypx
	v6yp8Ckf28nNYP2DuqvugSEjoIEm2JNZ1/C9cfp3rRnovMaAv6rjkLVp50UeFCPH+cyQFdT27KWRj
	xUa9YRJp6/B31Jl2jmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFwp-00000009DWL-0l6W;
	Mon, 13 Jul 2026 12:39:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFwm-00000009DVO-2FLV
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:39:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1678476f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783946383; cv=none;
        d=google.com; s=arc-20260327;
        b=MRfYqvF7BgjMG3652kqtKvmBVTyhcsKz/u3D+6gjg8CQzvW/NyzTMJrUnp+3Eoj2IT
         3y88jZMPnSkDFjvs3UFdVty1tJGR9PI2yK+RdPxCZ8rsIZeVn8eiNGE8BMCbyLKXA7cx
         9chq561QZKPm827yydt2md1tcpj0CqBjPtU7gFe7thdvIhlNDkdNzOvTEaaRz1vliYmM
         1xxNj94NCeDeUTm6ODF/nl8PNHOhlR2yMq0nWxmc2Ss/F07YRgUvnROnbXTQWGN5C0GL
         rdNHD1i2rCqAxIGW3QbaAV4k2kSKjUgyOM4S7GbqHAujwehxNqIhWBLHk0HSuSOYKfNW
         xqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNWZP8g0uAP0JL7jY1bzT8JQmyJ8lb4pF2POpRvfaPE=;
        fh=bGgk62Z5O77RWGu/9rH4gKAuvFY25+B668YRwzQgGRs=;
        b=QSFCX1/ZBL71URQAA3xcJ+NxqazI7e44U671rbCFIdvgYRHoeejDb3OepqJoffLeSo
         i5y5EZ10ylRSLOjGR+lljvVyGXpOEeaZ+rU5cd3iYD7aO7hWzuUO2pOzJLopWdZ/f7Lo
         uM+uE1fiEnCfMBJ/aVWVIADLrHLjWKQcD0Cvizde1EGSJMUjQzMzzNiYBCG1MfEFM1nC
         mFZyy4kONpBO8f+tCGrabVVM+ZLVKoEPLJXlYLSNFQ7NgCG668K/1ZSaeeFpCbre2N9I
         c9xU9Qpd3xTJU7E90rLBPJ8ejkZA2tpcoC6xupBb206XVEo8BrXYYWiej3E7y5WofvCQ
         BvCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783946383; x=1784551183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NNWZP8g0uAP0JL7jY1bzT8JQmyJ8lb4pF2POpRvfaPE=;
        b=xu3QNpgEvGrUdBfNXVSR2igFyAGM3KJX+O8us6HdE9F+P9cM9M5wJF3ugoILqUn2X6
         3T4Y4sBamGUAW/CBl91Mu/9uCPPniDpX2+6//7o10+CAPprpJTp1WYCCq4jOu19cptrx
         +tgVj5kbEx2VZyp8XDPSCARsnoFjoV1LmyT8JRfUxuEX33/NM9RgwM5ymHiJntelphcs
         OXoHqf2t1gqvVR7/sH6HOzJV34JpWP0D7lc755oyYDarOkrmCedqTnluYW3EtbT39Axw
         nIvcFm5Q/x+/sQp86xA0F/VWQ7sZKN3AzBEjMXdxjATqOc5noxoYUa0UO7CC06AbBPI3
         RWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946383; x=1784551183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNWZP8g0uAP0JL7jY1bzT8JQmyJ8lb4pF2POpRvfaPE=;
        b=o7kkJNL3GJhFALlcYhH1j2aYj8OFfi8sqALn5DEyzldn/gGRRssbuQu0X9y9VCv3le
         +NiIZkQVcqf53kR4iEZttjU7GvRfQHBJNFpaEuzDgDBucUeC12bFM0mlbSZ6dZ6ZgSKH
         mmoRVSzvUYTiyUFxDvuiNn84pdntWiYDbCgvfcr9LbTARrI6SyPLNXac9hI9fCXvtFlQ
         dvr+aIhNphCJu49eFQsCSGrU0enIeIn8ZAD64+E22Oh/EgbJTJ2C82hhNM8eHg8OqLhp
         G3cZwjo4kYXekGQw+GdeusvMatHoQnGr24evSTvSoKakjY2mO5OK6XKUqdCeL09Rp1++
         x44w==
X-Forwarded-Encrypted: i=1; AHgh+RqT3xR3ZECYlAj3SLD/8tUcciOol6EzqnU5pz1Y9+HhAgtLSwF1RnPUFc7l3P0Q3jzqhUckaMyueA368w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxff3wsQ9d4vZtypftuMxmQ0ZAi+3Rh0SI3STO9U5+G+hDHsk9
	QZHNSzoj+OMGqcQ/IF0PJUXBLtwgXF4YBzOLoSIwYtxOOTeDkGV55ZOS/tueWnUs5MemzrLt+qS
	Db1hjymeN1BmzetNVW8/3lHAW0NwMugJdT511M72avQ==
X-Gm-Gg: AfdE7cle4j1yJ097NKZOG51Uxh13PNsihIQf+KUbgeZ52VsEiFK4UXF0thSHkolV061
	dPRQXSEG3o6Iw/luDmxjSbaHCp6+z5e2iXb/XngiLOJdM5JKKJTLhMSUjdxVWVq5+/zkfzUBVuq
	lrFPDBCu3mYBXMUz1v5/ElPIvnznFatZTvaJ1dS74TDrv1Y52Q0a1dh7okkXW+Sn5fRTM5sAPdK
	LMR6bz0S4DHxDwS7x+TabMeUrPGgG6AOX5F0e3lmSsSjuub6wfLlEMuLxKkm3QS1IhqI6dDqzBz
	6XfhgLn8Y5ChkNbQflZ5LQN1u3zo2/ydcpwKUkjJIeay1YziLrH91s6UB4bauUg2JaLb3WclSGz
	lAh9qKJsToUEqcP4n1dQcUxDoRQ==
X-Received: by 2002:adf:e185:0:b0:477:71ef:5d81 with SMTP id
 ffacd0b85a97d-47f2dc8cd0bmr11146687f8f.6.1783946382636; Mon, 13 Jul 2026
 05:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260701075239.95542-1-fredwudi0305@gmail.com>
In-Reply-To: <20260701075239.95542-1-fredwudi0305@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 18:09:30 +0530
X-Gm-Features: AUfX_mwXj_7QcwyUg7nnOIiO2RcCPbUhH-15KvTXyB0HOEvvnkqibyEafWCL2JM
Message-ID: <CAAhSdy1YZYA6etr+Z552QNSGKM-iMpU7uGwDcYGydpb0b4qULg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: Skip preventive hfence.gvma for new G-stage
 mappings with Svvptc
To: "Dylan.Wu" <fredwudi0305@gmail.com>
Cc: palmer@dabbelt.com, atish.patra@linux.dev, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, zhouquan@iscas.ac.cn, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_053944_592299_A8EE945D 
X-CRM114-Status: GOOD (  18.28  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCAxOjIz4oCvUE0gRHlsYW4uV3UgPGZyZWR3dWRpMDMwNUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRm9yIEludmFsaWQtPlZhbGlkIEctc3RhZ2UgbGVhZiBQVEUg
dXBkYXRlcywgdGhlIGZsdXNoIGluCj4ga3ZtX3Jpc2N2X2dzdGFnZV9zZXRfcHRlKCkgaXMgcHJl
dmVudGl2ZS4gV2hlbiBTdnZwdGMgaXMgYXZhaWxhYmxlLCBuZXcKPiB2YWxpZCBQVEVzIGJlY29t
ZSB2aXNpYmxlIHRvIHRoZSBwYWdlLXRhYmxlIHdhbGtlciB3aXRoaW4gYSBib3VuZGVkCj4gdGlt
ZSwgc28gYW4gaW1tZWRpYXRlIGhmZW5jZS5ndm1hIGlzIHVubmVjZXNzYXJ5Lgo+Cj4gU2tpcCBn
c3RhZ2VfdGxiX2ZsdXNoKCkgZm9yIHRoYXQgY2FzZS4gUGVybWlzc2lvbi1yZXN0cmljdGluZyB1
cGRhdGVzCj4gY29udGludWUgdG8gdXNlIHRoZSBleGlzdGluZyBmbHVzaCBwYXRoLgo+Cj4gQXNz
aXN0ZWQtYnk6IFl1YW5TaGVuZzogZGVlcHNlZWstdjQtcHJvCj4gQ28tZGV2ZWxvcGVkLWJ5OiBR
dWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhv
dSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogRHlsYW4uV3UgPGZyZWR3
dWRpMDMwNUBnbWFpbC5jb20+CgpUaGUgcGF0Y2ggc3ViamVjdCBpcyB1bm5lY2Vzc2FyaWx5IGxv
bmcgYW5kIG5lZWRzIHNvbWUgc2ltcGxpZmljYXRpb24uCkFsc28sIHRoZXJlIGlzIG1pbm9yIHdh
cm5pbmcgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC5wbCByZWxhdGVkIHRvCmluY2x1ZGUgb2YgYXNt
L2NwdWZlYXR1cmUuaC4gSSB3aWxsIHRha2UgY2FyZSBvZiBib3RoIG9mIHRoZXNlIGF0IHRoZQp0
aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExpbnV4LTcu
Mi1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgfCA3
ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMKPiBpbmRleCBjNGMzYjc5NTYuLjdiODA1MTEyZCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4g
QEAgLTEwLDYgKzEwLDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGd0YWJsZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9nc3RhZ2UuaD4KPiArI2lu
Y2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPgo+ICAj
aWZkZWYgQ09ORklHXzY0QklUCj4gIHVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9tYXhf
cGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQgPSAzOwo+IEBAIC0xNzEsOCArMTczLDExIEBAIGlu
dCBrdm1fcmlzY3ZfZ3N0YWdlX3NldF9wdGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPiAg
ICAgICAgIH0KPgo+ICAgICAgICAgaWYgKHB0ZV92YWwoKnB0ZXApICE9IHB0ZV92YWwobWFwLT5w
dGUpKSB7Cj4gKyAgICAgICAgICAgICAgIGJvb2wgd2FzX2ludmFsaWQgPSAhcHRlX3ZhbCgqcHRl
cCk7Cj4gICAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgbWFwLT5wdGUpOwo+IC0gICAgICAg
ICAgICAgICBpZiAoZ3N0YWdlX3B0ZV9sZWFmKHB0ZXApKQo+ICsgICAgICAgICAgICAgICBpZiAo
Z3N0YWdlX3B0ZV9sZWFmKHB0ZXApICYmCj4gKyAgICAgICAgICAgICAgICAgICAhKHdhc19pbnZh
bGlkICYmCj4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoUklTQ1ZfSVNBX0VYVF9TVlZQVEMpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBnc3Rh
Z2VfdGxiX2ZsdXNoKGdzdGFnZSwgY3VycmVudF9sZXZlbCwgbWFwLT5hZGRyKTsKPiAgICAgICAg
IH0KPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
