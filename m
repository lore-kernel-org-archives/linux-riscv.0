Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C7AC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ07EEf5W1+zo9TkaSyQfxJ9GTTYJoTReYY7ii1Xd9U=; b=ModE8nGyu46F+k
	C4sarrFk3sokQr3rrV+xrpTby4abIi7h/oxZGN2baB00nVIg6o8UyS4Fy6e3bBl1r1KC57cmTl3hK
	/rjG20hUl7lm5zRZnfUIemDOgtOo7JsAMG12cH/w++opYq2aoTHAyTkmQbhiwGNi3QBxPq8W0vxqS
	EkK+FN6QOT4iOv9VP8fWbM7VH1XTON5RMMXsbgm59Vn4XUWg3hHSiKDJFF18g4tY9Wx/A2z9Dm9SY
	aymuKVK9eluKXBDPi/rv570RhjzAJ3cEUMH1Hc09ztK4xBae87/kN+kyb4n1bRGiIGL2G6U5ZFV5j
	p4dHxtnrV1UjWJNS1OFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sARU6-00000008apx-2Vxd;
	Fri, 24 May 2024 09:45:10 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sARU3-00000008aou-0Rrd
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 09:45:08 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5b96a78639aso310362eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 02:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716543905; x=1717148705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j4TcFLwKZ63jXxAt8CKouxIWdbn5YR4fDya592Qmcs=;
        b=BBq+RbAzjK7eGNTNftEBJEB8ZkVZg79K5ACEBPKyN+8gkaMKKxTf7E4ccejVv3vCzz
         2BaU2vfpM5B0JAFlVNz912deld/SIcY0XiL6peg3jku6YPOfxPmkRnocIMItFH6xStMa
         /QahrXfqc3ZH3JZsGsEV6hbFni7TlwXNSrFfwRwa7pd2hMQ1jzKp55o1+DTqS5FyMKfg
         mnSXldd6RFLZ/LYOQ6kggRokN9qJUFyTq5RcepXsoraOhv3G/fcf+pWtNPqEsa+tv182
         6mBTNEFB5MRthTgUwpM2jlP1Newl+iq4jQQHbnqwZ4uIFygUlHpyfRVzT8oNDTiSqWHa
         R85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716543905; x=1717148705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6j4TcFLwKZ63jXxAt8CKouxIWdbn5YR4fDya592Qmcs=;
        b=oBSKPOeoFwjtPw3tWhhKv9/WH7mR06Bk72pZ8mCI/wHcgN6UuBtooBdKIrY1XX98CQ
         +QRc1MyfE5Oerhqr5s5AjJmmbUaGwJvoteCr9kEX24O96F5eSn8zm4OsIDyvXqiSMzug
         uTB0dkwJSFvSlSEa4Av2x/CpZYGro4JQ3rC4WukVg+OOkk1P65gJLb2cpgbPTHM0xdPn
         RhIaUriiv0AcX2QK9NoAcCIZKn+xv8dz0CrAO2c1AajzVKjsGdIwiwJ7cxUkgogpLhxQ
         nsx+S6MeYVrP3eYjyYhH9erYjyg/od7oNNtePhKJzXL1ZCj5nyDH6R4NlaG2RNNYFg3l
         Tr7Q==
X-Gm-Message-State: AOJu0YxTvWJWBc7hnENp0g6KXFUD32EYOx7WksqoiaaM5VM4T/qKTyVe
	JuGADPYtQ/6ih2COTv0K/+UYw6npwQ5VVfulgnk4qcHgBNtyZEjXChiLSgLwrrizLV8pXQZSDX0
	jbsJpe5bNwxnAT2148bf5tAw4Y0H6MLGePpdhQQ==
X-Google-Smtp-Source: AGHT+IGFIKBWwor5HCxddEY7lVVhOpYghG/6YgqoMARyswVM0a2K6hwWrVWCLssLhFPWigqNmZW4+L59Jt821fkVrMs=
X-Received: by 2002:a05:6820:551:b0:5b2:3782:7848 with SMTP id
 006d021491bc7-5b961c730e4mr2126522eaf.6.1716543905042; Fri, 24 May 2024
 02:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231102120129.11261-1-yongxuan.wang@sifive.com> <b96e25d7-c8ec-44bd-baf9-c5166389f10e@ghiti.fr>
In-Reply-To: <b96e25d7-c8ec-44bd-baf9-c5166389f10e@ghiti.fr>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 24 May 2024 17:44:54 +0800
Message-ID: <CAMWQL2jPE-EFGymzAy5WqiC=E-Zp684cT-JvK+6cfk12Yhs5ww@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add Svadu Extension Support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com, 
	conor.dooley@microchip.com, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_024507_284910_A3C4F5C0 
X-CRM114-Status: GOOD (  17.44  )
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

SGkgQWxleGFuZHJlLAoKT24gRnJpLCBNYXkgMjQsIDIwMjQgYXQgNToxOOKAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBZb25nLVh1YW4sCj4KPiBPbiAw
Mi8xMS8yMDIzIDEzOjAxLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IFN2YWR1IGlzIGEgUklT
Qy1WIGV4dGVuc2lvbiBmb3IgaGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRzLiBUaGlz
Cj4gPiBwYXRjaCBzZXQgYWRkcyBzdXBwb3J0IHRvIGVuYWJsZSBTdmFkdSBleHRlbnNpb24gZm9y
IGJvdGggaG9zdCBhbmQgZ3Vlc3QKPiA+IE9TLgo+ID4KPiA+IC0tLQo+ID4gdjM6Cj4gPiAtIGZp
eCB0aGUgY29udHJvbCBiaXQgbmFtZSB0byBBRFVFIGluIFBBVENIMSBhbmQgUEFUQ0gzCj4gPiAt
IHVwZGF0ZSBnZXQtcmVnLWxpc3QgaW4gUEFUQ0g0Cj4gPgo+ID4gdjI6Cj4gPiAtIGFkZCBDby1k
ZXZlbG9wZWQtYnk6IGluIFBBVENIMQo+ID4gLSB1c2UgcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxp
a2VseSgpIHRvIHJ1bnRpbWUgcGF0Y2ggdGhlIGJyYW5jaCBpbiBQQVRDSDEKPiA+IC0gdXBkYXRl
IGR0LWJpbmRpbmcKPiA+Cj4gPiBZb25nLVh1YW4gV2FuZyAoNCk6Cj4gPiAgICBSSVNDLVY6IERl
dGVjdCBhbmQgRW5hYmxlIFN2YWR1IEV4dGVuc2lvbiBTdXBwb3J0Cj4gPiAgICBkdC1iaW5kaW5n
czogcmlzY3Y6IEFkZCBTdmFkdSBFbnRyeQo+ID4gICAgUklTQy1WOiBLVk06IEFkZCBTdmFkdSBF
eHRlbnNpb24gU3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiA+ICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0
czogQWRkIFN2YWR1IEV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdHQKPiA+Cj4gPiAgIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCAgfCAgNiArKysrKysK
PiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgICB8
ICAxICsKPiA+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgICAg
ICB8ICA2ICsrKysrKwo+ID4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAg
ICAgICAgICAgIHwgIDEgKwo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+ID4gICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKysrCj4gPiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVn
LmMgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiA+ICAgOSBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4gPgo+Cj4gV2lsbCB5b3Ugc3BpbiBhIG5l
dyB2ZXJzaW9uIGZvciB0aGlzPwo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+CgpZZXMsIEkgaGF2ZSBm
aW5pc2hlZCB0aGUgbmV3IHZlcnNpb24uIEkgd291bGQgc2VuZCBvdXQgdGhlIHBhdGNoc2V0IGFz
CnNvb24gYXMgcG9zc2libGUuCgpSZWdhcmRzLApZb25nLVh1YW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
