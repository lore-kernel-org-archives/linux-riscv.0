Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F04C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtbJmUlMpkvBWOnM/trtuxIsBALA/YsTzd2b3PkKcR4=; b=KEAecgQjAX5q12
	jVYdYItQICES9+3iH+D4n6voU4f1+7JGnqhCIzJHCJSpSp+/i81DW01vKrVIc2A9G8Q/fLlOPEM28
	LsVXmfGe8/fncIshQMNy+hCu/ThyFfUeB+THDxmhHhnGJQlzJW1uvPD03CB0tir3496SB4t10Thka
	cHMn4Eti+xE93nskiMdVAkJ4KcTyQcWnOrS0uQENc44h9zr7AW0RkxLcPP6GpBk+8MBnD37AugtUT
	SzNGy0LNpBgQ3FPttN87r4AOK38U+D3KkJEbS12MYTjHDTW9/EFdvR9zUpPZRHEhyblLV6nJZsgmF
	DpOL8+xKIRcANEbxW8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhTG-00000001r4i-03En;
	Fri, 19 Jul 2024 06:52:02 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUhTC-00000001r40-0LTa
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 06:51:59 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3d93df6b54dso832034b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 23:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721371917; x=1721976717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOrnXxWvbVRsS08Q5SrQnWsHda2iVamAcSxg6GkGdcw=;
        b=Alj95H+cZil9tzDxMuLFUprLxtP2OfqJmpcMSEoqsolvsGZlMwf/N6EM0VpxZrlrsp
         wncfnmEwdi78Yo0u+PPMHB7flwAb6nmiqVBI5y4/3lK4SMlCMeEuE19ocdrj1IOTGb+V
         VPRe//wc3YhQIdpO2QeGy3tbVnyJAnez1NH+J3FxNdTr+uhUsdN6f9HdPnCyKlXwg2cZ
         tcicveASaO7g1TidslisdPLdpcHWMPcvfKIZlqZbCakOT1dGaMknS6A6wLoUtqx9fHif
         FHhz3EeN5wExXkJFA/eCAvP8+/91jRW+fu01tUcP8AxmUKFMEASBndhaF3Y7/XqQwVEi
         M1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721371917; x=1721976717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOrnXxWvbVRsS08Q5SrQnWsHda2iVamAcSxg6GkGdcw=;
        b=KLD4d6og+1QuCjLxKcsjVQNpkESxkuVyd+uOnwaJSeFQE+Iw7lPQqEFMAjzuRSqHL9
         spP3n4xL9o1u7cMs/MaZ5tUK4/0BptQ63jbvzW1qr63Yav4fN4MKkXVyrA/4v4idn0ZC
         4OaUjovB9uHX3PzArFRywQNHGBnTdA//IA2VG/GKTKUJjvNU3ou66ysvW7LQZl+6Xy+P
         eD5613i2cjEoz5q0p3n4k6evmbp4aXsac+xK4K1kT+cRaERLMNhxZtrSkXzP/uHo+03B
         pvXtnLIdCU+xMme6VoBFH0/DeAK0BqQ4b3XYZH3N8K3gyqO3OxUYGWdhYSh2trYfips2
         hSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnD4AfR950B/ixLzPQtznauHPPNR0PEJ01C89K2kxz7NLeIUcYdJAkmA6DnoWt5zEeGiSGp58stC2//rz3rGTXj3fYNMwOYH9N7afi+NSN
X-Gm-Message-State: AOJu0YyqDx96eABpFLIPh4Q5Sd0n7kfO4jZ5S4WkKq0uI85gNJwWjsqC
	rR87/DFxYDKm0250XxfU+/3FMSeR9EcDaunbXy5PBfgEKLp6M8lbMoPnr9ofFBq0+qCIetlQMoN
	s+oQH1ayx/kYfveC9Q5jX3sVajABkx7E1uyRqew==
X-Google-Smtp-Source: AGHT+IHbQam/E7zhkcddpAOBTeSvSJMP46EYDtweZ41PTxcwvfNsqz0vSMmC/XB0/o5+90ZNsqHlqdZ0Awb+viDokRc=
X-Received: by 2002:a05:6808:1301:b0:3d9:3a3e:48b9 with SMTP id
 5614622812f47-3dad7792029mr6306813b6e.45.1721371916843; Thu, 18 Jul 2024
 23:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
 <20240712083850.4242-4-yongxuan.wang@sifive.com> <60555952-7307-41ed-bd6f-17a179089596@sifive.com>
In-Reply-To: <60555952-7307-41ed-bd6f-17a179089596@sifive.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 19 Jul 2024 14:51:46 +0800
Message-ID: <CAMWQL2hCkEeTOqk5tHhhmsxKNknzGfLq=UOQ3Xx94L59YyA_WQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Add Svade and Svadu Extensions
 Support for Guest/VM
To: Samuel Holland <samuel.holland@sifive.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_235158_153839_8F20DBEE 
X-CRM114-Status: GOOD (  25.30  )
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

SGkgU2FtdWVsLAoKT24gRnJpLCBKdWwgMTksIDIwMjQgYXQgODoyMuKAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFlvbmctWHVhbiwK
Pgo+IE9uIDIwMjQtMDctMTIgMzozOCBBTSwgWW9uZy1YdWFuIFdhbmcgd3JvdGU6Cj4gPiBXZSBl
eHRlbmQgdGhlIEtWTSBJU0EgZXh0ZW5zaW9uIE9ORV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IFZN
TSB0b29scyB0bwo+ID4gZGV0ZWN0IGFuZCBlbmFibGUgU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lv
bnMgZm9yIEd1ZXN0L1ZNLiBTaW5jZSB0aGUKPiA+IGhlbnZjZmcuQURVRSBpcyByZWFkLW9ubHkg
emVybyBpZiB0aGUgbWVudmNmZy5BRFVFIGlzIHplcm8sIHRoZSBTdmFkdQo+ID4gZXh0ZW5zaW9u
IGlzIGF2YWlsYWJsZSBmb3IgR3Vlc3QvVk0gYW5kIHRoZSBTdmFkZSBleHRlbnNpb24gaXMgYWxs
b3dlZAo+ID4gdG8gZGlzYWJsZWRvbmx5IHdoZW4gYXJjaF9oYXNfaHdfcHRlX3lvdW5nKCkgaXMg
dHJ1ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2Fu
Z0BzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggfCAgMiArKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8ICAzICsr
Kwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDE1ICsrKysrKysrKysr
KysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IGluZGV4IGU4NzhlN2NjMzk3OC4uYTVlMGMzNWQ3ZTlh
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IEBAIC0xNjgsNiArMTY4
LDggQEAgZW51bSBLVk1fUklTQ1ZfSVNBX0VYVF9JRCB7Cj4gPiAgICAgICBLVk1fUklTQ1ZfSVNB
X0VYVF9aVFNPLAo+ID4gICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkFDQVMsCj4gPiAgICAgICBL
Vk1fUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiwKPiA+ICsgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NW
QURFLAo+ID4gKyAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZBRFUsCj4gPiAgICAgICBLVk1fUklT
Q1ZfSVNBX0VYVF9NQVgsCj4gPiAgfTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiBpbmRleCAxN2UyMWRmMzZjYzEu
LjY0YTE1YWY0NTllMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiBAQCAtNTQwLDYgKzU0MCw5IEBAIHN0YXRp
YyB2b2lkIGt2bV9yaXNjdl92Y3B1X3NldHVwX2NvbmZpZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gPiAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhLCBaSUNCT1op
KQo+ID4gICAgICAgICAgICAgICBjZmctPmhlbnZjZmcgfD0gRU5WQ0ZHX0NCWkU7Cj4gPgo+ID4g
KyAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYSwgU1ZBRFUpKQo+ID4g
KyAgICAgICAgICAgICBjZmctPmhlbnZjZmcgfD0gRU5WQ0ZHX0FEVUU7Cj4KPiBUaGlzIGlzIGNv
cnJlY3QgZm9yIG5vdyBiZWNhdXNlIHBhdGNoIDEgZW5zdXJlcyB0aGUgaG9zdCAoYW5kIHRoZXJl
Zm9yZSBhbHNvIHRoZQo+IGd1ZXN0KSBuZXZlciBoYXMgYm90aCBTdmFkZSBhbmQgU3ZhZHUgYXZh
aWxhYmxlLiBXaGVuIHRoYXQgY2hhbmdlcywgdGhpcyBjaGVjawo+IHdpbGwgbmVlZCB0byBhZGQg
YW4gIiYmICFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2EsIFNWQURFKSIgY29uZGl0
aW9uIHNvCj4gaXQgbWF0Y2hlcyB0aGUgYmVoYXZpb3IgZGVzY3JpYmVkIGluIHRoZSBEVCBiaW5k
aW5nLiBUaGVyZSdzIG5vIG5lZWQgdG8gcmVzZW5kCj4gdG8gbWFrZSB0aGlzIGFkZGl0aW9uLCBi
dXQgaWYgeW91IGRvLCBpdCB3b3VsZG4ndCBodXJ0IHRvIGluY2x1ZGUgaXQgc28gaXQncyBub3QK
PiBmb3Jnb3R0ZW4gbGF0ZXIuIChJdCBsb29rcyBtYXliZSBsaWtlIHY2IG9ubHkgcGFydGlhbGx5
IGltcGxlbWVudGVkIEFuZHJldydzCj4gc3VnZ2VzdGlvbj8pCj4KPiBSZXZpZXdlZC1ieTogU2Ft
dWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4KClllYWgsIHNpbmNlIHRo
ZSBQQVRDSDEgY2FuIGVuc3VyZSB0aGF0IG9ubHkgU3ZhZGUgb3IgU3ZhZHUgd2lsbCBiZSB1c2Vk
LCBzbyBJCnJlbW92ZWQgdGhlIFN2YWRlIGNoZWNraW5nIHRoZXJlLiBJIHdpbGwgYWRkIGl0IGJh
Y2sgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhhbmsKeW91IQoKUmVnYXJkcywKWW9uZy1YdWFuCgo+
ID4gKwo+ID4gICAgICAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNB
X0VYVF9TTVNUQVRFRU4pKSB7Cj4gPiAgICAgICAgICAgICAgIGNmZy0+aHN0YXRlZW4wIHw9IFNN
U1RBVEVFTjBfSFNFTlZDRkc7Cj4gPiAgICAgICAgICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5z
aW9uX2F2YWlsYWJsZShpc2EsIFNTQUlBKSkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+ID4gaW5kZXgg
NjI4NzRmYmNhMjlmLi40NzRmZGVhZmU5ZmUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4g
PiBAQCAtMTUsNiArMTUsNyBAQAo+ID4gICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgo+ID4g
ICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4gICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVf
dmVjdG9yLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLmg+Cj4gPiAgI2luY2x1ZGUgPGFz
bS92ZWN0b3IuaD4KPiA+Cj4gPiAgI2RlZmluZSBLVk1fUklTQ1ZfQkFTRV9JU0FfTUFTSyAgICAg
ICAgICAgICAgR0VOTUFTSygyNSwgMCkKPiA+IEBAIC0zOCw2ICszOSw4IEBAIHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2FycltdID0gewo+ID4gICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFNTQUlBKSwKPiA+ICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU0NPRlBNRiksCj4gPiAg
ICAgICBLVk1fSVNBX0VYVF9BUlIoU1NUQyksCj4gPiArICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZB
REUpLAo+ID4gKyAgICAgS1ZNX0lTQV9FWFRfQVJSKFNWQURVKSwKPiA+ICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihTVklOVkFMKSwKPiA+ICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKPiA+
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ID4gQEAgLTEwNSw2ICsxMDgsMTIgQEAg
c3RhdGljIGJvb2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2VuYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxv
bmcgZXh0KQo+ID4gICAgICAgICAgICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2
YWlsYWJsZShOVUxMLCBSSVNDVl9JU0FfRVhUX1NTQUlBKTsKPiA+ICAgICAgIGNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfVjoKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJpc2N2X3ZfdnN0YXRlX2N0
cmxfdXNlcl9hbGxvd2VkKCk7Cj4gPiArICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NWQURV
Ogo+ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgKiBUaGUgaGVudmNmZy5B
RFVFIGlzIHJlYWQtb25seSB6ZXJvIGlmIG1lbnZjZmcuQURVRSBpcyB6ZXJvLgo+ID4gKyAgICAg
ICAgICAgICAgKiBHdWVzdCBPUyBjYW4gdXNlIFN2YWR1IG9ubHkgd2hlbiBob3N0IG9zIGVuYWJs
ZSBTdmFkdS4KPiA+ICsgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgIHJldHVybiBh
cmNoX2hhc19od19wdGVfeW91bmcoKTsKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4gICAgICAgfQo+ID4gQEAgLTE2Nyw2ICsxNzYsMTIgQEAgc3RhdGljIGJv
b2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkK
PiA+ICAgICAgIC8qIEV4dGVuc2lvbnMgd2hpY2ggY2FuIGJlIGRpc2FibGVkIHVzaW5nIFNtc3Rh
dGVlbiAqLwo+ID4gICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU0FJQToKPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VY
VF9TTVNUQVRFRU4pOwo+ID4gKyAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVkFERToKPiA+
ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICogVGhlIGhlbnZjZmcuQURVRSBp
cyByZWFkLW9ubHkgemVybyBpZiBtZW52Y2ZnLkFEVUUgaXMgemVyby4KPiA+ICsgICAgICAgICAg
ICAgICogU3ZhZGUgaXMgbm90IGFsbG93ZWQgdG8gZGlzYWJsZSB3aGVuIHRoZSBwbGF0Zm9ybSB1
c2UgU3ZhZGUuCj4gPiArICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
YXJjaF9oYXNfaHdfcHRlX3lvdW5nKCk7Cj4gPiAgICAgICBkZWZhdWx0Ogo+ID4gICAgICAgICAg
ICAgICBicmVhazsKPiA+ICAgICAgIH0KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
