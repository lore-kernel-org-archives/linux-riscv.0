Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81136C52D71
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzdhHnzum33p55DNQOhQ0I4ozF/yhl12931r/RZxdDQ=; b=Gmv7vk7wTxHjuw
	zTNERjz1kt3u3VatPa5/gUen5yeWjVL2TbiiFzfYs3wh4N52FM1zbHo3ASzy9XinPzZ3cVOtnYmsF
	WaW7EPmZmykvl6Iu8Cei3m+qNa7VOvij77yLCfNuzSFcV6PzUPxPuhik5eJPJ8k3TePh4KdUzPRkb
	hP0ttlszQIhRW2kIpsLVyEdCwqAgTFs2ezfLyfFMVAkzdEO6JekQV5RDtyCf0TMwHZYIXiol80i6o
	XZlMBQFtK5MIytLIr3yfrmkC5IpIZawIdESRIDQjddrdglj/Ksu/imwr+iUWd7Zz+d8dg2owqjb6M
	yEdP/Y5Nr/UIFwGUdKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scIl9-0000000ANQP-2IC6;
	Fri, 09 Aug 2024 06:05:55 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scIl6-0000000ANPy-3fR4
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 06:05:54 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3db50abf929so1249593b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 23:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723183551; x=1723788351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx3FfVfdiP9K1YQ4WlF6JZNFpHKhTks7LWEP0de0u1U=;
        b=nv+2e/GlGjyNovpIZDJpsm3gFQ9Kddfqunmx+ayfBTNuqUjJiXZPZ/DoWvqQFJTrh0
         CvgPpMg0Hfmz8dP/UVa0epIjb4LdF4itGKSz+a8I+ez/2pasNrxU5jSaucbfdiJkRgUZ
         yGusF+YWgt871Hv0Fovgncb8OCo2IIoO3XwUx9fr45SFURLP8uRrIdUxO8rFymhdYjq6
         HUQJnn31m4lzyfZE4/zic/lNa8vMfHowanVE3fbW4uOcti/Xw0uHunFVUG0UeT07h4Mt
         PHC7kcvlqPKQyuogQ0si27w8U1Fm6Z0J81FYIFXoL0jHE+RW8T0k4pfAtezc1rlfDjRb
         2zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723183551; x=1723788351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fx3FfVfdiP9K1YQ4WlF6JZNFpHKhTks7LWEP0de0u1U=;
        b=b/J1QUATU7QbdM4YEGDQ52I8Hw8MX4nfwKsgHeSmIlbhC7l6O+ONIhQpXfwilRonCm
         WxG656m3gQQEdyyWVmRw1QzSUMfBvGbirMrtB6si3kKTnCE5yj3Iz2GlXCTmNy8aJBAJ
         5r6Y12Dgo8JDMbM4mOCoZDpSWf3lXFtqWYKAZ1niegDQSM+lTHsyFuYKlB1r17Febf99
         /Bc++a9SzHYAoMhaVNiHoinHHH+o8ukDfkw+is9SYB+XyGjOE/fvYPX0b62a4FbGt+M7
         PIIeQIGXPzSXamYcGM3J1Dqt6P6L1FoErcs009+ztFuj7mvNOwPJAnW0GeiHc7nxKzTK
         fHeA==
X-Forwarded-Encrypted: i=1; AJvYcCVxQU59kyC2PbqrO+WjGfFVnqQyZCXWzZlm7garK08ULoHVNWvpO+tkhE2N1DceovKaJwLnwsAtXoRuTXORo1iXijLbEYD0p8D3Iw4nhOYC
X-Gm-Message-State: AOJu0YzfCyxItkK7BqLR4sZHj46w+nu3pavWhbVoH8clmmIJRD+BIfyz
	4WGNce4Cjv1037D2Ndmcr/Z71vnSGojwFENG8wlrVfxeSIfoHIvrLjW/R00cZSQQ+RkC/DlEBXU
	D6wn+/6l4KyR0nBdN5OIHt3JbnGZincVi2Yg5mw==
X-Google-Smtp-Source: AGHT+IHaUR/BZOF1mE4d26qoLAX0jJ1FBSRJZVz2DTf4hfAj2tLEfjd+PkHRvYZNcY/6s0Eg4S0/m0G8spS1t23ZWKQ=
X-Received: by 2002:a05:6871:691:b0:261:1c5e:29d3 with SMTP id
 586e51a60fabf-26c62c5637emr647903fac.12.1723183551453; Thu, 08 Aug 2024
 23:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240808081412.24553-1-yongxuan.wang@sifive.com>
 <CAAhSdy3VKMngwHxOg5+z6pK3QgZnLv=3+hpZBeUm87L_e62aUQ@mail.gmail.com> <87ikwbytfz.ffs@tglx>
In-Reply-To: <87ikwbytfz.ffs@tglx>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 9 Aug 2024 14:05:39 +0800
Message-ID: <CAMWQL2h94Sk5N6BkTe0aNcPd7QR2Q2s3-632K5aRdCh5hPYSew@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv-aplic: manually set pending for the
 pre-existing interrupts
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_230552_951856_AD78F4C9 
X-CRM114-Status: GOOD (  27.96  )
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

SGkgQW51cCBhbmQgVGhvbWFzLAoKT24gVGh1LCBBdWcgOCwgMjAyNCBhdCAxMDozNOKAr1BNIFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgQXVn
IDA4IDIwMjQgYXQgMTg6NTYsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBNb3JlIGFwcHJvcHJpYXRl
IHBhdGNoIHN1YmplY3Qgc2hvdWxkIGJlOgo+ID4KPiA+IGlycWNoaXA6IHJpc2N2LWFwbGljOiBy
ZXRyaWdnZXIgaW50ZXJydXB0IGluIE1TSSBtb2RlIHVwb24gd3JpdGUgdG8KPiA+IHNvdXJjZWNm
ZyByZWdpc3Rlcgo+Cj4gQW5kIHRoZSBjb3JyZWN0IG9uZSB3b3VsZCBiZToKPgo+ICAgICBpcnFj
aGlwL3Jpc2N2LWFwbGljOiBSZXRyaWdnZXIgTVNJIGludGVycnVwdCBvbiBzb3VyY2UgY29uZmln
dXJhdGlvbgo+Cj4gMSkgVGhlIHByZWZpeCBpcyBjb3JyZWN0Cj4KPiAyKSBTZW50ZW5jZSBzdGFy
dHMgd2l0aCBhIHVwcGVyY2FzZSBsZXR0ZXIKPgo+IDMpIEl0IHVzZXMgdW5kZXJzdGFuZGFibGUg
d29yZHMuIHNvdXJjZWNmZyBpcyBhIGltcGxlbWVudGF0aW9uIGRldGFpbAo+ICAgIHdoaWNoIGlz
IGlycmVsZXZhbnQgZm9yIHRoZSBoaWdoIGxldmVsIG92ZXJ2aWV3IG9mIGEgY2hhbmdlbG9nCj4g
ICAgc3ViamVjdCwgd2hpY2ggaXMgdmlzaWJsZSBpbiB0aGUgc2hvcnQgbG9nLgo+Cj4gPiBPbiBU
aHUsIEF1ZyA4LCAyMDI0IGF0IDE6NDTigK9QTSBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2Fu
Z0BzaWZpdmUuY29tPiB3cm90ZToKPiA+Pgo+ID4+IFRoZSBzZWN0aW9uIDQuNS4yIG9mIHRoZSBS
SVNDLVYgQUlBIHNwZWNpZmljYXRpb24gc2F5cyB0aGF0IGFueSB3cml0ZQo+ID4+IHRvIGEgc291
cmNlY2ZnIHJlZ2lzdGVyIG9mIGFuIEFQTElDIG1pZ2h0IChvciBtaWdodCBub3QpIGNhdXNlIHRo
ZQo+ID4+IGNvcnJlc3BvbmRpbmcgaW50ZXJydXB0LXBlbmRpbmcgYml0IHRvIGJlIHNldCB0byBv
bmUgaWYgdGhlIHJlY3RpZmllZAo+ID4+IGlucHV0IHZhbHVlIGlzIGhpZ2ggKD0gMSkgdW5kZXIg
dGhlIG5ldyBzb3VyY2UgbW9kZS4KPiA+Cj4gPiBBZGQgcXVvdGVzIGFyb3VuZCB0aGUgdGV4dCBm
cm9tIFJJU0MtViBBSUEgc3BlY2lmaWNhdGlvbi4KPiA+Cj4gPj4KPiA+PiBJZiBhbiBpbnRlcnJ1
cHQgaXMgYXNzZXJ0ZWQgYmVmb3JlIHRoZSBkcml2ZXIgY29uZmlncyBpdHMgaW50ZXJydXB0Cj4g
Pj4gdHlwZSB0byBBUExJQywgaXQncyBwZW5kaW5nIGJpdCB3aWxsIG5vdCBiZSBzZXQgZXhjZXB0
IGEgcmVsZXZhbnQKPiA+PiB3cml0ZSB0byBhIHNldGlwIG9yIHNldGlwbnVtIHJlZ2lzdGVyLiBX
aGVuIHdlIHdyaXRlIHRoZSBpbnRlcnJ1cHQKPiA+PiB0eXBlIHRvIHNvdXJjZWNmZyByZWdpc3Rl
ciwgaWYgdGhlIEFQTElDIGRldmljZSBkb2Vzbid0IGNoZWNrIGFuZAo+ID4+IHVwZGF0ZSB0aGUg
cGVuZGluZyBiaXQsIHRoZSBpbnRlcnJ1cHQgbWlnaHQgbmV2ZXIgYmVjb21lcyBwZW5kaW5nLgo+
ID4KPiA+IFRoZSBzZWNvbmQgc2VudGVuY2UgYWJvdmUgY2FuIGJlIHJlLXdyaXR0ZW4gYXMgZm9s
bG93czoKPiA+Cj4gPiBXaGVuIGludGVycnVwdCB0eXBlIGlzIGNoYW5nZWQgaW4gc291cmNlY2Zn
IHJlZ2lzdGVyLCB0aGUgQVBMSUMKPgo+IHRoZSBpbnRlcnJ1cHQgdHlwZSAuLi4gaW4gdGhlIHNv
dXJjZS4uLi4KPgo+ID4gZGV2aWNlIG1pZ2h0IG5vdCBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgcGVu
ZGluZyBiaXQsIHRoZSBpbnRlcnJ1cHQKPgo+IGJpdCAsIHNvIHRoZSAuLi4KPgo+ID4gbWlnaHQg
bmV2ZXIgYmVjb21lIHBlbmRpbmcuCj4KPiA+Cj4gPiBEZWZpbmUgQVBMSUMgTVNJIG1vZGUgc3Bl
Y2lmaWMgaXJxX3NldF90eXBlKCkgbGlrZSBiZWxvdzoKPiA+Cj4gPiBpbnQgYXBsaWNfbXNpX2ly
cV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKQo+Cj4gc3Rh
dGljIDopCj4KPiA+IHsKPiA+ICAgICAgICBpbnQgcmM7Cj4gPgo+ID4gICAgICAgIHJjID0gYXBs
aWNfaXJxX3NldF90eXBlKGQsIHR5cGUpOwo+Cj4gICAgICAgICAgaW50IHJjID0gYXBsaWMuLi4K
Pgo+ID4gICAgICAgIGlmIChyYykKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4KPiA+
ICAgICAgICAvKgo+ID4gICAgICAgICAqIFVwZGF0aW5nIHNvdXJjZWNmZyByZWdpc3RlciBmb3Ig
bGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMKPiA+ICAgICAgICAgKiByZXF1aXJlcyBpbnRlcnJ1
cHQgcmV0cmlnZ2VyaW5nIHdoZW4gQVBMSUMgaW4gTVNJIG1vZGUuCj4KPiBBUExJQyBpcyBpbiAu
Li4uCj4KPiA+ICAgICAgICAgKi8KPiA+ICAgICAgICBhcGxpY19tc2lfaXJxX3JldHJpZ2dlcl9s
ZXZlbChkKTsKPgo+IFRoYW5rcywKPgo+ICAgICAgICAgdGdseAoKVGhhbmtzIGEgbG90ISBJIHdp
bGwgZml4IHRoZW0gaW4gdGhlIG5leHQgdmVyc2lvbi4KClJlZ2FyZHMsCllvbmctWHVhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
