Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF724CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vz3dpdzoMG35qZH9ZWgiAgWpiMWkg9x8lskbJujcZ8=; b=oJpHeB7yf32bWv
	upAp+PVKhZ6gvYqjuQS8vT+3ENX+InEg6IAKPOK19euch/RLzyHtb6ssNebRUmkbrEiSClGz83IB7
	buwvEsqnJ/TRoI8wjvwNsp51mh5gAE+mmIq0qGM+RL0QMMgpeWAu4BQC4314H1r3U5Bw0hyC9oHAZ
	uvgm3jGImmYnyljgh+/wQFMIGxXuOt5tNR2I2Fl06DAU+tudmBLcksmXKqq1IQkyQxD0JhIYJGm4s
	5g8vowDEh7fuwCkSPaYbd0MsHxCUIaXgTBpdAztlb5KpQhRzmZRGUQZx5wMXgASOoSiV8WMwGvd7F
	a7LWuQFLQIh2YnQBVo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0x4-0000000GCHq-14gg;
	Thu, 04 Jun 2026 05:49:10 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0x2-0000000GCHA-0gKo
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 05:49:09 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5176fc0cc72so3904211cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 22:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780552147; cv=none;
        d=google.com; s=arc-20240605;
        b=LeyLl6dq+fypUOQKL9uBCg9+07YE1H6oq0k7yfZ1kooGGXYotbKmxqt8FXTG4SgP+6
         dADTF1JsY1kiisijQ2h88+vV/3DEpT6ugbGtucgb9ed4rQRx6C5YAFqM50Q5ogS52JN6
         TpsekexfeBrG2uFhAIIt1FeT+yD1GrzDDD/9QQ3WeeiKIz9o7DppI9WbxPdbxuTZcIEP
         hye0xmIqYXWZz75WjDXHwMfzVRGt1NcpIO8cCUZ2WwtQqrMqA4GwBUOawkCZ14VTPQAs
         OE08qcx6Yo/ATvR+XDDNZF+NN0L3hSDcBaQ5ZlvfvTUz579ueAC24L6RuH5Iz35ykbm5
         xR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PIUh8wR1+0AAFR8fB6HVLdYG12z8klZ1AKaxwRhBZSw=;
        fh=QX5oeEw+Uqh2xbpBdd6Tbu8FVHOQLHf9CgjSXuhVYXE=;
        b=E0KJ3h8TAsGlm5XuaTMW6X/FfbM7dcCgeLRmkfQqW7ccXFgdQBif6lOBFGsTEgz1VU
         y0eJJsDFXdN8jJ/LghFXoeQWARhclIiyiAOKON0NqTmMMtWDaziktWb7PrVnT26/m13x
         NDPZUAveeAhdXZJdu2Zx7jZT5xetF5XM+fP5aj9m+eWseF4xDvSIhSTRsbbP3JKUVyBa
         hU/+F1Mi2giiSR8QaNitvYaoeqsmo2b/OFVzBOLwBHQ1Jli4Js3lO2M+yKrYl2VhaANN
         Mnd4k/AjLuSnyAUa1u8CAV0wSxEmw+AEWObjtG/0C2U4tdC6pdS1+/oS2nko3tGSBG/6
         opOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780552147; x=1781156947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIUh8wR1+0AAFR8fB6HVLdYG12z8klZ1AKaxwRhBZSw=;
        b=oxtb6/ZZovcD5kGQDvyHS8GBOkE4uABeOSaH0ZQu5QHBISIc5bvCKs60c9d1kBktWg
         9rFwwR08GCx/lkfRfd4zo5ACfvDc04aa+502GBGWTATkpCov2wyt3gKhMNHjIML1ct+J
         EAuY+PFe3560qV+PBeCv6N4AMscAzUHzYRGArJgBHXP7O37Rq/HBSKTwA3/NcuCRznXT
         8zkbRM/KrQz4XEL3q2H/RiEeKzEg6cRFXQ6UumBnmCIlyZts2Xtssx06dgHyJnJ5XFn6
         Gh6VmyF1eawJraGDVvv8J3U/pygliMew0n/U46tcqLdrP3W0LgCf8wKp/CBjvWR6AVwL
         L06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552147; x=1781156947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIUh8wR1+0AAFR8fB6HVLdYG12z8klZ1AKaxwRhBZSw=;
        b=Fu4bSCqs/T+nsVZ6KVp6pwpjGnzuIltKc2SuaQeMqVBwdQg6zbHEXkPZNJK6htk8DG
         59DL2gZ2OfXmRb/qdzsnXtUbHgA0d0J6okA8NXQ4TwzCgEYx+vw+KiLxQfYBeXf//XNT
         EkU+tksXeL3/z/JEXdybMLdlEQrJXlQJ2PzP2epN33g9OXfFq/LN2wpl6U08bjuodDl5
         /5PIhX/66xV+hZhDqfwy0/RF5xZv6bI9/GmboQgpYhPRpPyhkOzw8rB6Y1ZiIOQAIfMc
         txtyHrxQXDDIvf2iYakUhCdewhLRa6DWaCt+fHsY4au3qd2qP51ecB1Q1HPEdUOqxTYA
         pENg==
X-Forwarded-Encrypted: i=1; AFNElJ81H/iM5Mmnnl113T4z4fL8BgnIsCCaR/3+LJElhNq0N0XVDkqRJIQjjEb3HDmi8nWM8Z5Z5A4x8C2VrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnJX8/V+i98LXunT+sd6+vh3hL8MR7sB9kMasugsttOAoMouL
	PSbKtQEFlyrnU10cE+UuiZPoCyGjd3gY+wB91vsv3fpLA0zTFjSCo1efmjs7ezqK7Tl7SyYZEWz
	61skXJ/aZ3kv845Nx/EHCstHrHYLT04PEyYwPVNtGXQ==
X-Gm-Gg: Acq92OGXjsTNblYqXFserHVEd+zLTO16N2l/alMWVWt2IYbYhPqnHiS/XO56vIDZ5w8
	SHdKaTbFt/EsQbidUAo4GANa/GHLIU4vOxu7aRktZ/sm8P74/3HLURteFqLyM5MF1uRWQRTD36T
	BKRyS1DnTkuygrhnePgAZ7pwL0jMbWysSwf3wGoRK5xstKfX21KfMbEEvi+2dY6wDseidQbahY6
	g2yOnNS/lc/wo511S033R3XVInxfkdnTydYwBl8VAQa5JgH6TSlWz9r39qDYqyMF9rRE7KoutVT
	n4ScBJESJZUj2g4mGTfzSPtJfWVOO+idn+iub4dC86GAlYWUY8OLxm/4lqhmkoNCVZfkXK6GTti
	AbkK5QdLV6ffxDoBwxxsABI0sOYH3VG5qWLoP
X-Received: by 2002:a05:622a:6113:b0:516:df5b:4338 with SMTP id
 d75a77b69052e-517786fe3aamr94112741cf.28.1780552146620; Wed, 03 Jun 2026
 22:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260526031517.1166025-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260526031517.1166025-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 11:18:53 +0530
X-Gm-Features: AVHnY4LyQ7maifTN_o50bMgh-xrYsnwlJAwt9wlqVzVOlVBs2GIDYLsvccHKq1w
Message-ID: <CAAhSdy0RxUMYP-fs5=drG+6iwVEmwiVvHRL2MRieEXP7YiERjg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in AIA IMSIC functions
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Nutty Liu <liujingqi@lanxincomputing.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224908_230054_4BD7C432 
X-CRM114-Status: GOOD (  20.94  )
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

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgODo0NeKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEZ1enplciByZXBvcnRlZCBhIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBpbgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoKSB3aGVuIGEgVkNQ
VSdzIGltc2ljX3N0YXRlIHdhcyBOVUxMIHdoaWxlCj4ga3ZtX3Jpc2N2X2FpYV9pbml0aWFsaXpl
ZCgpIHJldHVybmVkIHRydWUuCj4KPiBUaGUgZ2xvYmFsIGluaXRpYWxpemVkIGZsYWcgaXMgc2V0
IHBlci1WTSBpbiBhaWFfaW5pdCgpLCBidXQgaW1zaWNfc3RhdGUKPiBpcyBhbGxvY2F0ZWQgcGVy
LVZDUFUgaW4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luaXQoKS4gSWYgYSBWQ1BVIGlzCj4g
Y3JlYXRlZCBhZnRlciBhaWFfaW5pdCgpIGhhcyBhbHJlYWR5IHJ1biwgaXRzIGltc2ljX3N0YXRl
IHJlbWFpbnMgTlVMTAo+IHdoaWxlIHRoZSBnbG9iYWwgZmxhZyBpcyB0cnVlLiBXaGVuIHRoaXMg
VkNQVSBpcyBwcmVlbXB0ZWQsIGt2bV9zY2hlZF9vdXQoKQo+IGNhbGxzIGt2bV9hcmNoX3ZjcHVf
cHV0KCkgLT4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX3B1dCgpIC0+Cj4ga3ZtX3Jpc2N2X3ZjcHVfYWlh
X2ltc2ljX3B1dCgpIHdoaWNoIGRlcmVmZXJlbmNlcyBOVUxMLgo+Cj4gQWRkIE5VTEwgcG9pbnRl
ciBndWFyZHMgdG8ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dCgpLCBjb25zaXN0ZW50IHdp
dGgKPiB0aGUgTlVMTCBjaGVja3MgYWxyZWFkeSBwcmVzZW50IGluIGFsbCBvdGhlciBmdW5jdGlv
bnMgaW4gdGhlIHNhbWUgZmlsZS4KPgo+IEFsc28gYWRkIGEgTlVMTCBndWFyZCB0byBrdm1fcmlz
Y3ZfdmNwdV9haWFfaW1zaWNfcmVsZWFzZSgpIGFuZAo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNp
Y19oYXNfaW50ZXJydXB0KCkgZm9yIHRoZSBzYW1lIHJlYXNvbi4KPgo+IEZpeGVzOiA0Y2VjODlk
YjgwYmEgKCJSSVNDLVY6IEtWTTogTW92ZSBIR0VJW0V8UF0gQ1NSIGFjY2VzcyB0byBJTVNJQyB2
aXJ0dWFsaXphdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRA
Z21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2Fz
LmFjLmNuPgo+IEFzc2lzdGVkLWJ5OiBZdWFuU2hlbmc6RGVlcFNlZWstVjMuMgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMg
cGF0Y2ggZm9yIExpbnV4LTcuMgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gv
cmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggODc4NmY1MmNmNjVhMi4uZDM4ZjVkZTA4MzRj
NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTY4Myw2ICs2ODMsOSBAQCBib29sIGt2bV9yaXNj
dl92Y3B1X2FpYV9pbXNpY19oYXNfaW50ZXJydXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gICAgICAgICBib29sIHJldCA9IGZhbHNlOwo+
Cj4gKyAgICAgICBpZiAoIWltc2ljKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4g
Kwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFRoZSBJTVNJQyBTVy1maWxlIGRpcmVjdGx5IGlu
amVjdHMgaW50ZXJydXB0IHZpYSBodmlwIHNvCj4gICAgICAgICAgKiBvbmx5IGNoZWNrIGZvciBp
bnRlcnJ1cHQgd2hlbiBJTVNJQyBWUy1maWxlIGlzIGJlaW5nIHVzZWQuCj4gQEAgLTcyMiw2ICs3
MjUsOSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+ICAgICAgICAgc3RydWN0IGltc2ljICppbXNpYyA9IHZjcHUtPmFyY2guYWlhX2Nv
bnRleHQuaW1zaWNfc3RhdGU7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4gKyAg
ICAgICBpZiAoIWltc2ljKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICAgICAgICAg
aWYgKCFrdm1fdmNwdV9pc19ibG9ja2luZyh2Y3B1KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
Owo+Cj4gQEAgLTczOCw2ICs3NDQsOSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19y
ZWxlYXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGludCBvbGRfdnNmaWxlX2hn
ZWksIG9sZF92c2ZpbGVfY3B1Owo+ICAgICAgICAgc3RydWN0IGltc2ljICppbXNpYyA9IHZjcHUt
PmFyY2guYWlhX2NvbnRleHQuaW1zaWNfc3RhdGU7Cj4KPiArICAgICAgIGlmICghaW1zaWMpCj4g
KyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gICAgICAgICAvKiBSZWFkIGFuZCBjbGVhciBJ
TVNJQyBWUy1maWxlIGRldGFpbHMgKi8KPiAgICAgICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgmaW1z
aWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNp
Yy0+dnNmaWxlX2hnZWk7Cj4gLS0KPiAyLjM0LjEKPgo+IEZvdW5kIGJ5IGZ1enppbmcuIEhlcmUg
aXMgdGhlIHJlcG9ydDoKPgo+IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0
IGF0IHZpcnR1YWwgYWRkcmVzcyBkZmZmZmZmZjAwMDAwMDA2Cj4gTW9kdWxlcyBsaW5rZWQgaW46
Cj4gQ1BVOiAxIFVJRDogMCBQSUQ6IDI2MjI1IENvbW06IHN5ei45LjExMzEgVGFpbnRlZDogRyAg
ICAgICAgVyAgICAgICAgICAgNy4xLjAtcmMxLWdiNjliY2IxM2VkNzAgIzIgUFJFRU1QVAo+IFRh
aW50ZWQ6IFtXXT1XQVJOCj4gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+
IGVwYyA6IGthc2FuX2J5dGVfYWNjZXNzaWJsZSsweDEyLzB4MjAgbW0va2FzYW4vZ2VuZXJpYy5j
OjIxMAo+ICByYSA6IF9fa2FzYW5fY2hlY2tfYnl0ZSsweDE2LzB4NDYgbW0va2FzYW4vY29tbW9u
LmM6NTczCj4gZXBjIDogZmZmZmZmZmY4MGJlYjYyNiByYSA6IGZmZmZmZmZmODBiZTk2MjIgc3Ag
OiBmZjIwMDAwMDAxNjI3NmEwCj4gIGdwIDogZmZmZmZmZmY4YTM5NTMyMCB0cCA6IGZmNjAwMDAw
OGY2ZjUwNDAgdDAgOiBmZmZmZmZmZjg2YTdlODgwCj4gIHQxIDogZmZmZmZmZmY4YTRhNGEwMCB0
MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOiBmZjIwMDAwMDAxNjI3NmIwCj4gIHMxIDogMDAwMDAw
MDAwMDAwMDAzMCBhMCA6IGRmZmZmZmZmMDAwMDAwMDYgYTEgOiBmZmZmZmZmZjg2NzIyM2U0Cj4g
IGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDcgYTQgOiAwMDAwMDAw
MDAwMDAwMDAzCj4gIGE1IDogZGZmZmZmZmYwMDAwMDAwMCBhNiA6IGZmZmZmZmZmODAxMGU3MmMg
YTcgOiAwMDAwMDAwMDAwMDAwMDA0Cj4gIHMyIDogMDAwMDAwMDAwMDAwMDAzMCBzMyA6IGZmZmZm
ZmZmODY3MjIzZTQgczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gIHM1IDogMDAwMDAwMDAwMDAwMDAw
MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiBmZmZmZmZmZjgwMTBlNzJjCj4gIHM4IDogZmZm
ZmZmZmY4NjcyMjNlNCBzOSA6IGZmZmZmZmZmOGEzZGEwODAgczEwOiAwMDAwMDg1YzdiM2QwMDYw
Cj4gIHMxMTogZmY2MDAwMDA4ZjZmNTA0MCB0MyA6IGZmZmZmZmZmOGE0YTRhMDAgdDQgOiBmZmZm
ZmZmZjhhNGE1YTgwCj4gIHQ1IDogMWZmZmZmZmZmMjJlZDdkMSB0NiA6IGZmNjAwMDAwZmZhNGQ3
MTAgc3NwIDogMDAwMDAwMDAwMDAwMDAwMAo+IHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRh
ZGRyOiBkZmZmZmZmZjAwMDAwMDA2IGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4gWzxmZmZmZmZm
ZjgwYmViNjI2Pl0ga2FzYW5fbWVtX3RvX3NoYWRvdyBpbmNsdWRlL2xpbnV4L2thc2FuLmg6NjYg
W2lubGluZV0KPiBbPGZmZmZmZmZmODBiZWI2MjY+XSBrYXNhbl9ieXRlX2FjY2Vzc2libGUrMHgx
Mi8weDIwIG1tL2thc2FuL2dlbmVyaWMuYzoyMTAKPiBbPGZmZmZmZmZmODBiZTk2MjI+XSBfX2th
c2FuX2NoZWNrX2J5dGUrMHgxNi8weDQ2IG1tL2thc2FuL2NvbW1vbi5jOjU3Mwo+IFs8ZmZmZmZm
ZmY4MDJmZTdiYT5dIGthc2FuX2NoZWNrX2J5dGUgaW5jbHVkZS9saW51eC9rYXNhbi5oOjQwMiBb
aW5saW5lXQo+IFs8ZmZmZmZmZmY4MDJmZTdiYT5dIGxvY2tfYWNxdWlyZSBrZXJuZWwvbG9ja2lu
Zy9sb2NrZGVwLmM6NTg0MiBbaW5saW5lXQo+IFs8ZmZmZmZmZmY4MDJmZTdiYT5dIGxvY2tfYWNx
dWlyZSsweDE5OC8weDUwZSBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6NTgyNQo+IFs8ZmZmZmZm
ZmY4NjcyMjNlND5dIF9fcmF3X3JlYWRfbG9ja19pcnFzYXZlIGluY2x1ZGUvbGludXgvcndsb2Nr
X2FwaV9zbXAuaDoxNzQgW2lubGluZV0KPiBbPGZmZmZmZmZmODY3MjIzZTQ+XSBfcmF3X3JlYWRf
bG9ja19pcnFzYXZlKzB4NzYvMHg4MiBrZXJuZWwvbG9ja2luZy9zcGlubG9jay5jOjI0MAo+IFs8
ZmZmZmZmZmY4MDEwZTcyYz5dIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQrMHg3Mi8weDE3
YyBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo3MjgKPiBbPGZmZmZmZmZmODAxMDFiZGE+XSBr
dm1fcmlzY3ZfdmNwdV9haWFfcHV0KzB4Mjg4LzB4MzI0IGFyY2gvcmlzY3Yva3ZtL2FpYS5jOjE1
NQo+IFs8ZmZmZmZmZmY4MDExZjIxMD5dIGt2bV9hcmNoX3ZjcHVfcHV0KzB4NDQvMHg2MTIgYXJj
aC9yaXNjdi9rdm0vdmNwdS5jOjYyMQo+IFs8ZmZmZmZmZmY4MDBkNTBhYT5dIGt2bV9zY2hlZF9v
dXQrMHhkYy8weDI5NiB2aXJ0L2t2bS9rdm1fbWFpbi5jOjY0MDUKPiBbPGZmZmZmZmZmODY3MDVm
YWE+XSBfX2ZpcmVfc2NoZWRfb3V0X3ByZWVtcHRfbm90aWZpZXJzIGtlcm5lbC9zY2hlZC9jb3Jl
LmM6NDkyMyBbaW5saW5lXQo+IFs8ZmZmZmZmZmY4NjcwNWZhYT5dIGZpcmVfc2NoZWRfb3V0X3By
ZWVtcHRfbm90aWZpZXJzIGtlcm5lbC9zY2hlZC9jb3JlLmM6NDkzMSBbaW5saW5lXQo+IFs8ZmZm
ZmZmZmY4NjcwNWZhYT5dIHByZXBhcmVfdGFza19zd2l0Y2gga2VybmVsL3NjaGVkL2NvcmUuYzo1
MTc2IFtpbmxpbmVdCj4gWzxmZmZmZmZmZjg2NzA1ZmFhPl0gY29udGV4dF9zd2l0Y2gga2VybmVs
L3NjaGVkL2NvcmUuYzo1MzMyIFtpbmxpbmVdCj4gWzxmZmZmZmZmZjg2NzA1ZmFhPl0gX19zY2hl
ZHVsZSsweDEwYzgvMHg1MTNjIGtlcm5lbC9zY2hlZC9jb3JlLmM6NzE4OAo+IFs8ZmZmZmZmZmY4
NjcwYTBlMj5dIF9fc2NoZWR1bGVfbG9vcCBrZXJuZWwvc2NoZWQvY29yZS5jOjcyNjcgW2lubGlu
ZV0KPiBbPGZmZmZmZmZmODY3MGEwZTI+XSBzY2hlZHVsZSsweGM0LzB4MzVlIGtlcm5lbC9zY2hl
ZC9jb3JlLmM6NzI4Mgo+IFs8ZmZmZmZmZmY4MDEyMWNjMj5dIGt2bV9yaXNjdl9jaGVja192Y3B1
X3JlcXVlc3RzIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYzo2NzAgW2lubGluZV0KPiBbPGZmZmZmZmZm
ODAxMjFjYzI+XSBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bisweDFkMTYvMHgzMjE0IGFyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYzo4ODUKPiBbPGZmZmZmZmZmODAwZGE4ZWU+XSBrdm1fdmNwdV9pb2N0bCsw
eDUzMi8weDEzY2UgdmlydC9rdm0va3ZtX21haW4uYzo0NDY5Cj4gWzxmZmZmZmZmZjgwZDQ1Yzkw
Pl0gdmZzX2lvY3RsIGZzL2lvY3RsLmM6NTEgW2lubGluZV0KPiBbPGZmZmZmZmZmODBkNDVjOTA+
XSBfX2RvX3N5c19pb2N0bCBmcy9pb2N0bC5jOjU5NyBbaW5saW5lXQo+IFs8ZmZmZmZmZmY4MGQ0
NWM5MD5dIF9fc2Vfc3lzX2lvY3RsIGZzL2lvY3RsLmM6NTgzIFtpbmxpbmVdCj4gWzxmZmZmZmZm
ZjgwZDQ1YzkwPl0gX19yaXNjdl9zeXNfaW9jdGwrMHgxODAvMHgxZTQgZnMvaW9jdGwuYzo1ODMK
PiBbPGZmZmZmZmZmODAwNzhmYjI+XSBzeXNjYWxsX2hhbmRsZXIrMHg5NC8weDExOCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3N5c2NhbGwuaDoxMTIKPiBbPGZmZmZmZmZmODY2ZmE5NGE+XSBkb190
cmFwX2VjYWxsX3UrMHg0M2UvMHg1ZGUgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzozNDIKPiBb
PGZmZmZmZmZmODY3MjY3NTY+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTVlLzB4MTZhIGFyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlM6MjMyCj4gQ29kZTogODA4MiAwN2I3IGUwMDAgMTE0MSAxN2ZkIGU0
MjIgODEwZCAwODAwIDE3ODIgOTUzZSAoNDUwMykgMDAwNQo+IC0tLVsgZW5kIHRyYWNlIDAwMDAw
MDAwMDAwMDAwMDAgXS0tLQo+IC0tLS0tLS0tLS0tLS0tLS0KPiBDb2RlIGRpc2Fzc2VtYmx5IChi
ZXN0IGd1ZXNzKToKPiAgICAwOiAgIDgwODIgICAgICAgICAgICAgICAgICAgIHJldAo+ICAgIDI6
ICAgZTAwMDA3YjcgICAgICAgICAgICAgICAgbHVpICAgICBhNSwweGUwMDAwCj4gICAgNjogICAx
MTQxICAgICAgICAgICAgICAgICAgICBhZGRpICAgIHNwLHNwLC0xNgo+ICAgIDg6ICAgMTdmZCAg
ICAgICAgICAgICAgICAgICAgYWRkaSAgICBhNSxhNSwtMSAjIDB4ZmZmZmZmZmZkZmZmZmZmZgo+
ICAgIGE6ICAgZTQyMiAgICAgICAgICAgICAgICAgICAgZnN3ICAgICBmczAsOChzcCkKPiAgICBj
OiAgIDgxMGQgICAgICAgICAgICAgICAgICAgIHNybGkgICAgYTAsYTAsMHgzCj4gICAgZTogICAw
ODAwICAgICAgICAgICAgICAgICAgICBhZGRpICAgIHMwLHNwLDE2Cj4gICAxMDogICAxNzgyICAg
ICAgICAgICAgICAgICAgICBzbGxpICAgIGE1LGE1LDB4MjAKPiAgIDEyOiAgIDk1M2UgICAgICAg
ICAgICAgICAgICAgIGFkZCAgICAgYTAsYTAsYTUKPiAqIDE0OiAgIDAwMDU0NTAzICAgICAgICAg
ICAgICAgIGxidSAgICAgYTAsMChhMCkgPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uCj4KPiA8PDw8
PDw8PDw8PDw8PDwgdGFpbCByZXBvcnQgPj4+Pj4+Pj4+Pj4+Pj4+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
