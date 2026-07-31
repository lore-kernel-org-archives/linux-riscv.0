Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2387C54F54
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or037RGG2arE2MqMD3mFjIi87ygv1l66LOyZlX8aluM=; b=uX16g/R6Km3N/G
	IXg7KAplmRWQvy7Ak+3Z8HcS+L6wkA95dRDPpsAzWnOyKDFpwlpNfBvZm3fgXr2sHpNWMbTbiBgAo
	oOIsXGbwpQXxgGCbd7d79PVPoBir2dxhcC16rAzgM1yOLRuumDmoU7tHs/p+OlJPlgqUhg5CIF8Ih
	emmrCtIZGuGSSm2/ekfqByBrNc7woQta1wXQchTRJmsJLzcFwpzglOCSSRPrZMjW0xa+mG8GbhxFG
	EruV6j3tG8s9v/WYF+T2nOgPpnZwFKvBs6W4Y+xvkmVYqDut70dWYKXSVuHTxmAokUbM06YQG/T+u
	R2xb6IfSQCNztcmaAHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgF6-0000000BrKT-2RSU;
	Fri, 31 Jul 2026 05:57:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgF4-0000000BrJF-0ABr
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 05:57:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b015532f7bso528939e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 22:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785477428; cv=none;
        d=google.com; s=arc-20260327;
        b=dv9fjuLc4DHmpEAjM5O+MihQTnF7gcII8aYaEUHOO3/WeWNXsmmBMObDuyOub6c1Tw
         M5/xV4rReFu13azEhyK/6I/q9CCNNbK4wgGBBvojl+ffQkkycGUVxI07AdfRbo9gDgCt
         PEtZtXAJekEjRYF//e9u+OOSxLCnlQLkEo8BAl1+43J/x8xdfYerkjPVMXdglNCmdxDm
         HOLgIc2ralaNPfWKGtUNB3TjlYimRdsgqdBxPHryjGzPdFbj4PizRlEopJmL7wbIfHK8
         8/81J3iqmCwXStUhiqYwAW2Yrk8jxYJ8ScCSXoajV3oVvwROquCS4ZmYGuq+1y0m3Pc0
         MPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IipFgVRsoH3iYGVOTYy4qykSaenCoVmPpYiCJWUhT30=;
        fh=NA5zcwLOe2NkXqUF9r3kwZMsdjhzUbEVRGOos8Lv6HQ=;
        b=YlTH2nIetj3xrP04Qgh75XYviENYp5Ua6l0r4s9dxUFALfc9kwc347GPVP4Vj7Ehwj
         qi84QZLtWCX/1TSpKXFxOykWlGDg0KYxGbs0y8R9ImK3eBDncphMNPq8nCcjj8HTLzif
         5I31h/b6pAgk/6RF7MQ7l5C2mA2vsAxrJGiMN0apYBOyVzDSBcO1Kydkh5+cpIW0M5/i
         9sPe0+twFfC0xNOP9OSrYkUiNixc7DluSdynXfjuT1i0nNZ2qDcPvYbPavzeO4L7cmQC
         iSJO3nET1b+4NA9mWg9wj53Ch4HNMtcf7up8vKo8K/K+wLwxFyNvzu/TwEclQI+VEe7z
         /p3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785477428; x=1786082228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IipFgVRsoH3iYGVOTYy4qykSaenCoVmPpYiCJWUhT30=;
        b=zWiKp5DO6ZlSpmEIHcQa+OqxDAN8Y1Sj3ZNxrPTIXnG3JxFbHsoJ3KawLFgv3DoAwB
         KxF3Piuc718/1VVaAxfLckzp6tzY8tVxlN2Lcm7DkF6A0Sy2afHJ+bRYF6TvN8MKi8jR
         0EagmGgSnV32aSEARNbA6fu588j2nGVSjm9IxS3YBHBQRJbJ41csPWAOA/c5wfOo2GZO
         PettrDAqUOztn9N5MxKheAGX674b3dcrkqjaLPsGdvUDl2ZMMlnMdxiqc58lxC6pVv5N
         SQCcSyZ4HE7Fb+4rsrOGBSfQpWRFB9bv1WVCaYYfZatBoxfmqL1YVkjMS0OsXqh/KHzF
         SIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477428; x=1786082228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IipFgVRsoH3iYGVOTYy4qykSaenCoVmPpYiCJWUhT30=;
        b=FeyUsCWtUdLHnsQZoofZfbmebNdsVd1xAs9iHHLAaND9kOQJR1IMKaTrLHXBDgJYuR
         9f5hdprtEP8UkjzYa4mdTzlMzU5pvuXz0MLDExLFSnS6DARhTM6jzBUlRimnxtFEDN3y
         itdHjuaIhOkAzqfMNdWudkZehWlXM2aOtdemmkdQfhSAbpTXzUzwrSqPwHonNdMldqvI
         yq4xMfuANHdiI4SYDodLwZtQEmxBnB6sg32MMkpSTFG8S9S13pdfgYRQrj9XMMF0ihVZ
         ZR1uOvMI63UxNMJ8hRUYeJoTQQu8hpu0k+oiCplnLKV30q8grbt/n1MHsWMSoGjsfeZw
         hQxA==
X-Forwarded-Encrypted: i=1; AHgh+RqfcVPFb99RCKujBglNse3iTi4iVI3Ua70fBZ1WUmv8TU/hPT0pNDYHlZqZ1z22VxYLKByoFwfKH0KQzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm36yw4Y9jHwWSD4n163U/vN2O1FMGHVn51c6kYCH6XfXP3FV9
	EoBqX7OLJbozbabWu1GTy98JYnG2IQUjnwupwshCa+7GeyirX4mJPAS/eVcYF7StqM1yoX7XNg3
	rDAjFETU92VYhvG9TtzIfahZXMOi2WGJ1pnUdIwnBxw==
X-Gm-Gg: AR+sD12aFuJWRR2YJxhApU45rhtzhn+FXkC/FLI4X3p02xID9Bv0TZh7Ore/4YiT+jO
	b9Frbmi5GjbLl7aKeH0GKPrW3s/dR33zUoizGNCQzQx4biROXGUxquazs6pUrPLG++00wE//Lp0
	3pIFcO6DSzGLGUShNchm0SPy3+Q4RtWrN8DzR7nKO1Q2tY1mMCs39APm0HxrE5t/YKbJAQyu7UJ
	Zn4c5cGImLjUstiEfxfB7ERolTfnMwj9aNBUgaDWv+Lu8muwM9CLNiNLOC2gSm0wWb8SHO9SKkF
	eA0X8LJmhv4pABnZeaMRTOmhEbH9dDsenB6O8MrJt30ldV2ew+rdsLzTErKscI5zoFR2SHcr+o8
	CxV4HgqPqq4b4Jp5FlBE7W1fx7mZiS3CXloHkPtERstFv8i2PlXG2k/g/2aI91mbW
X-Received: by 2002:a05:6512:a93:b0:5ae:c3c1:822a with SMTP id
 2adb3069b0e04-5b2e1fff9c2mr193171e87.58.1785477427605; Thu, 30 Jul 2026
 22:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2026 11:26:53 +0530
X-Gm-Features: AUfX_mwuaZ3aS-ay5M9hKbAlT0MobWOtVi1EJNb4YGPNHeO6jd96joBWaB7jDwQ
Message-ID: <CAAhSdy3bBQTwj80cmBvWYfqWgO1e8_Y85x=QG46UamGEbYy+UQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] RISC-V: KVM: Optimize hfence request handling for
 SMP guests
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_225710_102309_2AC26BE3 
X-CRM114-Status: GOOD (  16.30  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCA2OjIy4oCvUE0gV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFv
MjU1QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIGhmZW5j
ZSByZXF1ZXN0IGhhbmRsaW5nIGluIFJJU0MtViBLVk0sCj4gdGFyZ2V0aW5nIHNjZW5hcmlvcyB3
aGVyZSBtdWx0aXBsZSBWQ1BVcyBhcmUgcnVubmluZyBhbiBTTVAgZ3Vlc3QuCj4KPiBUaGUgZmly
c3QgcGF0Y2ggSW50cm9kdWNlIG1ha2VfeGZlbmNlX3JlcXVlc3Rfbm9kYXRhIGZvciBGRU5DRS5J
Cj4gcmVxdWVzdHMgYW5kIG1vdmVzIHRoZSBoZmVuY2UgZGF0YS90eXBlIHZhbGlkYXRpb24gb3V0
IG9mIHRoZQo+IFZDUFUgbG9vcCB0byBhdm9pZCByZWR1bmRhbnQgY2hlY2tzIG9uIGV2ZXJ5IGl0
ZXJhdGlvbi4KPgo+IFRoZSBzZWNvbmQgcGF0Y2ggZml4ZXMgYSBtb3JlIHN1YnRsZSBwZXJmb3Jt
YW5jZSBpc3N1ZTogd2hlbiBvbmUKPiBWQ1BVJ3MgaGZlbmNlIHF1ZXVlIGJlY29tZXMgZnVsbCBh
bmQgdHJpZ2dlcnMgYSBmYWxsYmFjaywgdGhlCj4gY3VycmVudCBjb2RlIGFwcGxpZXMgdGhlIGZh
bGxiYWNrIHRvIGFsbCBWQ1BVcyBpbmRpc2NyaW1pbmF0ZWx5Lgo+IFRoaXMgdW5uZWNlc3Nhcmls
eSBkZWdyYWRlcyBoZWFsdGh5IFZDUFVzIGFuZCBjYW4gY2F1c2UgdGhlaXIKPiBxdWV1ZXMgdG8g
ZmlsbCB1cCBwcmVtYXR1cmVseSBkdWUgdG8gbGFjayBvZiBwcm9jZXNzaW5nIGl0Lgo+Cj4gV2l0
aCB0aGVzZSBjaGFuZ2VzLCBmYWxsYmFjayBpcyBhcHBsaWVkIG9ubHkgdG8gdGhlIFZDUFVzIHRo
YXQKPiBhY3R1YWxseSBuZWVkIGl0LCBwcmVzZXJ2aW5nIHRoZSBlZmZpY2llbmN5IG9mIHRoZSBu
b3JtYWwgcGF0aAo+IGZvciBvdGhlcnMuCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIEZpeCB0aGUg
cGF0Y2gwMSBicm9rZW4gdGhlIEtWTV9SRVFfRkVOQ0VfSSByZXF1ZXN0KFNhc2hpa28gQUkgcmV2
aWV3KS4KPgo+ICAtIExpbmsgdG8gdjE6Cj4gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2LzIwMjYwNzA3MTEzNzE1LjQxMzI2NS0xLXdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24v
Cj4KPiBXYW5nIFllY2hhbyAoMik6Cj4gICBSSVNDLVY6IEtWTTogSW50cm9kdWNlIG1ha2VfeGZl
bmNlX3JlcXVlc3Rfbm9kYXRhIGZvciBGRU5DRS5JIHJlcXVlc3RzCj4gICBSSVNDLVY6IEtWTTog
U2VwYXJhdGUgcmVxIGFuZCBmYWxsYmFja19yZXEgbWFza3MgaW4KPiAgICAgbWFrZV94ZmVuY2Vf
cmVxdWVzdAo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jIHwgNDYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQzLjUKPgoKVGhlIFBBVENIMiBpcyBh
IGZpeCBpbmRlcGVuZGVudCBvZiBQQVRDSDEgc28gcmUtb3JkZXIKYW5kIG1ha2UgUEFUQ0gyIGFz
IGZpcnN0IHBhdGNoIHdoaWNoIGNhbiBiZSBhcHBsaWVkCmluZGVwZW5kZW50IG9mIFBBVENIMQoK
UmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
