Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BA5C54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Jabl7aYBfkPperjAFSoDfrvNI9d43OfLPXxU3pxg04=; b=YY6QQn/P0xqPii
	RIinhHpPAO+WN6lpDeBQZzcoT9xkE9SD9VB7SqeCv6kuRFWHKDerNd4W/EG2MKoUkybc9hR1vfdCP
	9T24FL1Vea82f1IW+CqK3rpeKDmUDSvEUfrpOxRWcmzIv8IB+ZAoa86ov2IWHb5QnN3y4fsTHQYoR
	7XUhvuhaA9cgFWSoeyZKisMCSLpI/JNDEm0dsgmz8OD7Wg2RHhFjW12Eoq/vJBE9fNGtO/jIxvnpr
	E2BUf4lUHwR4XLuGWozgE+7q+Sx5PsHNUMEhN/uXe62qd9II32R0w/3syylls6Jvd2Cu0nJ/5F8jx
	16+4QzVmhL43xnppVp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUoN-00000008AiH-2FPf;
	Fri, 08 Mar 2024 07:38:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUoJ-00000008Ahc-3DKf
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 07:38:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5131316693cso2318624e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 23:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709883509; x=1710488309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQAkvdiUkr5StdP/yppIaHyxE5vK72hC1JwtmqddXFw=;
        b=Y6NU/uWWhgnIM5OXpT+2G2z4T05xkY7b0h6fgujY2IpDrajZX7/z9U/9Vks763VqZs
         qj4jZ1dtpjj6GHl7VxzVMV9dj11aSCVsNHTsRO84vyU7R66WVS1pfFvjoqTkvqzjBW52
         rUMgjpFLjyrq8jOQpEXBzMNJzFkGIRBiPQnh8D1wADa6eWbcWuUinAtQ044QSGC/znYk
         2ocE/ppmeY3muwt6td/BoQ/Aefr5uTCXKxgK04cCAl2gAlN8ItYcx2WEFXuJdvrqme96
         d3GTG5cH78HJ3Lcwf7rSFn/4LNIq+R8ru8R1GFodDJafl9eCK+m2vS72rshkeMr6S00y
         x6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883509; x=1710488309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQAkvdiUkr5StdP/yppIaHyxE5vK72hC1JwtmqddXFw=;
        b=udMW1GHoSbYJQKTlFC19P7h4OWOd9v6lyWehRzgpWQU73HQUU4GCb4NKOUI+5jImut
         D/5QMYHpK9P8aMDmjx4HrUFUMwjt68I36iqGee1+luatjQMvzqrdW6QTe5kvj4hEhVwt
         2N9ATzXoW1UFJyU4+b/orSPkRhP+CsqA+UdPVgp8RbieRU7RAF2hAW4gZZ/FSiYbxkkr
         D62QynsI2iXFMW2puQOrEEsnhzUeaYKOPibK5XydsxCVWTIZz00f8zYkKL+T7woBMYtm
         xQAnKUfZlR3AAonmv3Az2+sP7FTc/kRCznqYtuLQfsEzAiZqODX/FOutXycohcDrPJRl
         6KlA==
X-Forwarded-Encrypted: i=1; AJvYcCWV8sGMYvDh2xYn3RVwslO5I3xiljXwwXwG2/LTghG367ZUVWn05olx3dc8sVS8sXQV+eW+3AWp/ByurnLHd7KUQ9GEtlFadjM2dP5KbQYV
X-Gm-Message-State: AOJu0YyTRt1r/KlVzw+N1lHg2RIRiEHuJ57oxr5bFPniFhYZsgLZg38a
	Rr/37tH96ZRYyNoAAff7OrYG4D9XOMp7d/2c5tl0TPD77Xh0VGN5+LQ8qKCgW1/wE/BoDImdlxt
	GAjnRYuuAgSAIu/RPINq2MjZqwzE74WQeJTM=
X-Google-Smtp-Source: AGHT+IF7G6Xk/L/aKLhElFAzkpvBNtVrF1Oyi1lLAdilAWOuLZetAVg+DcZcpdxSjWmHuxxJno1Fz6k/kcFcerGICMk=
X-Received: by 2002:a19:7614:0:b0:513:1e2a:f9c5 with SMTP id
 c20-20020a197614000000b005131e2af9c5mr2915212lff.17.1709883509072; Thu, 07
 Mar 2024 23:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20240307083154.346542-1-haibo1.xu@intel.com> <CAMj1kXGF_PNLYsLugQnm=gW08XuLEbd_C0-4YYzkH1aYRGSaYg@mail.gmail.com>
In-Reply-To: <CAMj1kXGF_PNLYsLugQnm=gW08XuLEbd_C0-4YYzkH1aYRGSaYg@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 8 Mar 2024 15:38:17 +0800
Message-ID: <CAJve8ok1E3viWwQS3+mwt02i07BfA5wAnmhOpTALpEEuuGkpEw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dmi: Add SMBIOS/DMI support
To: Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_233831_833537_F3F14B52 
X-CRM114-Status: GOOD (  37.83  )
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
Cc: linux-efi@vger.kernel.org, Haibo Xu <haibo1.xu@intel.com>, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgNywgMjAyNCBhdCA3OjAw4oCvUE0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbyBIYWlibywKPgo+IFNvbWUgbm90ZXMgYmVsb3cuCj4K
PiBPbiBUaHUsIDcgTWFyIDIwMjQgYXQgMDk6MTgsIEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwu
Y29tPiB3cm90ZToKPiA+Cj4gPiBFbmFibGUgdGhlIGRtaSBkcml2ZXIgZm9yIHJpc2N2IHdoaWNo
IHdvdWxkIGFsbG93IGFjY2VzcyB0aGUKPiA+IFNNQklPUyBpbmZvIHRocm91Z2ggc29tZSB1c2Vy
c3BhY2UgZmlsZSgvc3lzL2Zpcm13YXJlL2RtaS8qKS4KPiA+Cj4gPiBUaGUgY2hhbmdlIHdhcyBi
YXNlZCBvbiB0aGF0IG9mIGFybTY0IGFuZCBoYXMgYmVlbiB2ZXJpZmllZAo+ID4gYnkgZG1pZGVj
b2RlIHRvb2wuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRl
bC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
fCAxMSArKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZG1pLmggICAgICAg
ICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL2Zpcm13YXJl
L2VmaS9yaXNjdi1ydW50aW1lLmMgfCAxMyArKysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCA1MyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vZG1pLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmln
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCAwYmZjZmVjNjdlZDUuLmExMjNhM2U3ZTVm
MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gPiBAQCAtOTE4LDYgKzkxOCwxNyBAQCBjb25maWcgRUZJCj4gPiAgICAgICAg
ICAgYWxsb3cgdGhlIGtlcm5lbCB0byBiZSBib290ZWQgYXMgYW4gRUZJIGFwcGxpY2F0aW9uLiBU
aGlzCj4gPiAgICAgICAgICAgaXMgb25seSB1c2VmdWwgb24gc3lzdGVtcyB0aGF0IGhhdmUgVUVG
SSBmaXJtd2FyZS4KPiA+Cj4gPiArY29uZmlnIERNSQo+ID4gKyAgICAgICBib29sICJFbmFibGUg
c3VwcG9ydCBmb3IgU01CSU9TIChETUkpIHRhYmxlcyIKPiA+ICsgICAgICAgZGVwZW5kcyBvbiBF
RkkKPiA+ICsgICAgICAgZGVmYXVsdCB5Cj4gPiArICAgICAgIGhlbHAKPiA+ICsgICAgICAgICBU
aGlzIGVuYWJsZXMgU01CSU9TL0RNSSBmZWF0dXJlIGZvciBzeXN0ZW1zLgo+ID4gKwo+ID4gKyAg
ICAgICAgIFRoaXMgb3B0aW9uIGlzIG9ubHkgdXNlZnVsIG9uIHN5c3RlbXMgdGhhdCBoYXZlIFVF
RkkgZmlybXdhcmUuCj4gPiArICAgICAgICAgSG93ZXZlciwgZXZlbiB3aXRoIHRoaXMgb3B0aW9u
LCB0aGUgcmVzdWx0YW50IGtlcm5lbCBzaG91bGQKPiA+ICsgICAgICAgICBjb250aW51ZSB0byBi
b290IG9uIGV4aXN0aW5nIG5vbi1VRUZJIHBsYXRmb3Jtcy4KPiA+ICsKPiA+ICBjb25maWcgQ0Nf
SEFWRV9TVEFDS1BST1RFQ1RPUl9UTFMKPiA+ICAgICAgICAgZGVmX2Jvb2wgJChjYy1vcHRpb24s
LW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQ9dGxzIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLXJlZz10
cCAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQ9MCkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZG1p
LmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE4NjEw
NDNmMDJkYwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9kbWkuaAo+ID4gQEAgLTAsMCArMSwyOSBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wICovCj4gPiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgSW50ZWwg
Q29ycG9yYXRpb24KPiA+ICsgKgo+ID4gKyAqIGJhc2VkIG9uIGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20vZG1pLmgKPiA+ICsgKgo+ID4gKyAqIFRoaXMgZmlsZSBpcyBzdWJqZWN0IHRvIHRoZSB0ZXJt
cyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4gPiArICogTGljZW5z
ZS4gIFNlZSB0aGUgZmlsZSAiQ09QWUlORyIgaW4gdGhlIG1haW4gZGlyZWN0b3J5IG9mIHRoaXMg
YXJjaGl2ZQo+ID4gKyAqIGZvciBtb3JlIGRldGFpbHMuCj4gPiArICovCj4gPiArCj4gPiArI2lm
bmRlZiBfX0FTTV9ETUlfSAo+ID4gKyNkZWZpbmUgX19BU01fRE1JX0gKPiA+ICsKPiA+ICsjaW5j
bHVkZSA8bGludXgvaW8uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gKwo+ID4g
Ky8qCj4gPiArICogQWNjb3JkaW5nIHRvIHNlY3Rpb24gMi4zLjYgb2YgdGhlIFVFRkkgc3BlYywg
dGhlIGZpcm13YXJlIHNob3VsZCBub3QKPiA+ICsgKiByZXF1ZXN0IGEgdmlydHVhbCBtYXBwaW5n
IGZvciBjb25maWd1cmF0aW9uIHRhYmxlcyBzdWNoIGFzIFNNQklPUy4KPiA+ICsgKiBUaGlzIG1l
YW5zIHdlIGhhdmUgdG8gbWFwIHRoZW0gYmVmb3JlIHVzZS4KPiA+ICsgKi8KPgo+IFlvdSBjYW4g
ZHJvcCB0aGlzIGNvbW1lbnQsIGl0IGlzIG5vdCByZWFsbHkgYWNjdXJhdGUuCj4KPiAnUmVxdWVz
dGluZyBhIHZpcnR1YWwgbWFwcGluZycgbWVhbnMgdGhlIG1lbW9yeSBpcyBtYXBwZWQgYnkgdGhl
IE9TCj4gaW50byB0aGUgRUZJIHBhZ2UgdGFibGVzIGJlZm9yZSBjYWxsaW5nIGEgcnVudGltZSBz
ZXJ2aWNlLCBzbyB0aGF0IHRoZQo+IGZpcm13YXJlICh3aGljaCBydW5zIHVuZGVyIHRoZSBPUydz
IG1lbW9yeSB0cmFuc2xhdGlvbiByZWdpbWUpIGNhbgo+IGFjY2VzcyB0aGUgY29udGVudHMuCj4K
PiBTTUJJT1MgdGFibGVzIGFyZSBpbmZvcm1hdGlvbmFsIGFuZCBmb3IgY29uc3VtcHRpb24gYnkg
dGhlIE9TIG9ubHksCj4gbm90IGJ5IHRoZSBydW50aW1lIHNlcnZpY2UgaW1wbGVtZW50YXRpb25z
IHRoZW1zZWx2ZXMsIGFuZCBzbyB0aGV5IGNhbgo+IGJlIG9taXR0ZWQgZnJvbSB0aGUgRUZJIHJ1
bnRpbWUgcGFnZSB0YWJsZXMuCj4KClN1cmUuIFRoYW5rcyBmb3IgZWxhYm9yYXRpbmcgb24gaXQg
YW5kIGl0J3MgdmVyeSBoZWxwZnVsIQoKPiA+ICsjZGVmaW5lIGRtaV9lYXJseV9yZW1hcCh4LCBs
KSAgICAgICAgICBpb3JlbWFwX3Byb3QoeCwgbCwgX1BBR0VfS0VSTkVMKQo+ID4gKyNkZWZpbmUg
ZG1pX2Vhcmx5X3VubWFwKHgsIGwpICAgICAgICAgIGlvdW5tYXAoeCkKPiA+ICsjZGVmaW5lIGRt
aV9yZW1hcCh4LCBsKSAgICAgICAgICAgICAgICAgICAgICAgIGlvcmVtYXBfcHJvdCh4LCBsLCBf
UEFHRV9LRVJORUwpCj4gPiArI2RlZmluZSBkbWlfdW5tYXAoeCkgICAgICAgICAgICAgICAgICAg
aW91bm1hcCh4KQo+Cj4gV2h5IG5vdCB1c2UgbWVtcmVtYXAoKSBoZXJlPyBUaGF0IHdpbGwgcmV1
c2UgdGhlIGxpbmVhciBtYXAgaWYgaXQKPiBoYXBwZW5zIHRvIGFscmVhZHkgY292ZXIgdGhlIHJl
Z2lvbi4KPgoKWWVzLCBtZW1yZW1hcCgpIGlzIGJldHRlciBoZXJlLiBXaWxsIHVwZGF0ZSBpdCBp
biB2Mi4KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQoKPiA+ICsjZGVmaW5lIGRtaV9hbGxvYyhs
KSAgICAgICAgICAgICAgICAgICBremFsbG9jKGwsIEdGUF9LRVJORUwpCj4gPiArCj4gPiArI2Vu
ZGlmCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvcmlzY3YtcnVudGltZS5j
IGIvZHJpdmVycy9maXJtd2FyZS9lZmkvcmlzY3YtcnVudGltZS5jCj4gPiBpbmRleCAwOTUyNWZi
NWMyNDAuLmMzYmZiOWU3N2UwMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZp
L3Jpc2N2LXJ1bnRpbWUuYwo+ID4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvcmlzY3YtcnVu
dGltZS5jCj4gPiBAQCAtMTUyLDMgKzE1MiwxNiBAQCB2b2lkIGFyY2hfZWZpX2NhbGxfdmlydF90
ZWFyZG93bih2b2lkKQo+ID4gIHsKPiA+ICAgICAgICAgZWZpX3ZpcnRtYXBfdW5sb2FkKCk7Cj4g
PiAgfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHJpc2N2X2RtaV9pbml0KHZvaWQpCj4g
PiArewo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBPbiByaXNjdiwgRE1JIGRlcGVuZHMg
b24gVUVGSSwgYW5kIGRtaV9zZXR1cCgpIG5lZWRzIHRvCj4gPiArICAgICAgICAqIGJlIGNhbGxl
ZCBlYXJseSBiZWNhdXNlIGRtaV9pZF9pbml0KCksIHdoaWNoIGlzIGFuIGFyY2hfaW5pdGNhbGwK
PiA+ICsgICAgICAgICogaXRzZWxmLCBkZXBlbmRzIG9uIGRtaV9zY2FuX21hY2hpbmUoKSBoYXZp
bmcgYmVlbiBjYWxsZWQgYWxyZWFkeS4KPiA+ICsgICAgICAgICovCj4gPiArICAgICAgIGRtaV9z
ZXR1cCgpOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArY29yZV9pbml0
Y2FsbChyaXNjdl9kbWlfaW5pdCk7Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
