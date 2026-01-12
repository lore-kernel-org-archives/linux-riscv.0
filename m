Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE0D25050
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcCgubdWgKsxCPyAN/3agb2XtqOJgoHrbbbtnJ0Ejr0=; b=HGxhquxKzHMYPg
	7nFQZ16+LUb1i6M30uP2F8fV1Q4UU2U/2pmqO/G2Xy2v68Nu+fDNzQ89sxdHMYfBriSERF4YIn0iM
	ERBe38rO68f7m/d0VRULrs12TaOCtFjSEHG2es3M/ixagLU9/vfvy31MwtEw8VBPyCZgl8DW1vg0z
	/dlWb7i9htUIoiWNvre0VTqDXglbA0cAOJ6gO4KeJ7GeGq8Ui4ESO1O0vS/4DY6rDrmZIQ3LMepr9
	MvYg9KMNUifooPegkwI6U6f861r48cmzL9iMgZnS67sQfxckJFkmnnsDBEadThalSjGGb0nop8SKX
	D+vn8cUF2F60pTE7bP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDkH-000000052bp-3AhK;
	Mon, 12 Jan 2026 08:57:53 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDkF-000000052bG-3OaQ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 08:57:52 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-78d6a3c3b77so54439847b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768208270; x=1768813070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOTnLPv4tv9bJjvux1j20Y+ExCg3MSBOD5unB3qoASs=;
        b=MfZXAvabezg8U1sTsTUDsJCsMkjNsxEz1qEjMTTciIS45wkLuiExHQI0iBwxKp7L0B
         jRKJbqntYdmMcKliw5JJftzvUePo6Q3lZkQOzfCGSOCpWljX8I7c7YcVHh7fmKxpVqax
         jsJYH295uUqJnql9ps/r/9xzsO3fWwTIjM3WK8Oi2PQ3W/VawiD7Sn19iElGhop7IecU
         7qx7p5yNdUaF4TVYbSXO73YkSz8vv2xub0O161+zP+O4N2hIeiyiXa7RNmwhm7JDuSwh
         GuX6QyFk5WwlXoa8QLGtmUuGFbNxM5CdGJLK5I3DiPM7ph6PqPf3mPtiLazw686COhTo
         5Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768208270; x=1768813070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOTnLPv4tv9bJjvux1j20Y+ExCg3MSBOD5unB3qoASs=;
        b=SsCgHwf2yLqU45XLpgFK73YbRBp7R1StG2B3CkEy35B8hd74kbhyd+HI5ND8h6s5kY
         883gBO8+1bRwQl55dRzrtW1jLlf5MCpyvu6svglPnrkVXCFc85+KQv2uiIhOnjd6G2/9
         sliFBMZ5Tm1kk6gR2G3Ob/2DCSQzxJNEUC7YZSMOIjjsw4QWPlPfvPtmHEm4ZXRjf8ji
         70xdLoyGFgns5rQ+vbINSzg6vg8BtoT9e08klAR0zxHPcLpMM2LazmnZTE+G+0OT6AyJ
         zr4GZK+YS5iI5ap2GZsg9YpKWGpKZlBFw+9HzHAr0HXPbFMwt6Bldrhf76GPmdPVAHcK
         b3lA==
X-Forwarded-Encrypted: i=1; AJvYcCXCI09cj7aiZ3GfbuDKyO72rbeso/1sxZ3SUYERqLLgRrcrLRcSVEocBYNeYgByqLY5D46Uki2MdVR15g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMC6ASBLfVtVB/j60wlMRy+OB83XUrG6gum85JIdCB8LpabkQS
	OMCFeH2TntJyCI6LD6iXdGg6OYEolJxN8uMmBTwn0FwEKsnrucETdbIYHL5k9UIteNCNVu8Hh45
	oxqLEvRZDRu+IqOlLFCjeWTvdnbW7T8+dRnrcPSZ5wbT3GWSgdUv/DibY0tAH
X-Gm-Gg: AY/fxX7w34XYHVO7bj0jzwQeJ3UFxTaOKYoh1jDet3JSrMEffQc1LquHQ1LKOv6RTxs
	r7XTAaNwX4Jy5ZrNIjFuOh5UIqTnzPWTsbDe8VXBOlbjqiVa/gBHraNgv9fYSeWbWB6M6NHe+gL
	KaqxoEgewckiBtnRH/o6S7lTwocACWesblo1/jh5FfI4r0IOqCbd51jR6xARQ+c0623DUdjqm0y
	aqT+vZYp9ZvhmWJXYwifJsL//E1vpP06vpzzcMVatdr2lm5fZqzoyk1GVK68bbo8v8svRRPFj3W
	C+ndSLS7xXBTnk1H/kNAx+qZYKQWQVpLzxC5mvIFiV9W
X-Google-Smtp-Source: AGHT+IHL6qC6Bkth83Jc0kDsLdGPlb1zjnY+NAdd3aSclQU4CUJsna2Gp1MfFiPTsIdJiiM4QkEp+AQp/YU/RgU4yqo=
X-Received: by 2002:a05:690e:1917:b0:644:7ad3:6528 with SMTP id
 956f58d0204a3-6471679490amr11838822d50.41.1768208270556; Mon, 12 Jan 2026
 00:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-11-d492f3a30ffa@riscstar.com> <20260110095707-GYA12783@gentoo.org>
In-Reply-To: <20260110095707-GYA12783@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 12 Jan 2026 16:57:38 +0800
X-Gm-Features: AZwV_QjrjPKzZ_O6yKHBkitCXrxqQZum-hZ1CkViiN7l5vhVdnYqXq_Ns-pXHZ0
Message-ID: <CAH1PCMbXhELJZnUv11izJSqSuzWd0QgvdDKaGXmUefLuUx7-PQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005751_859391_734EB8F3 
X-CRM114-Status: GOOD (  26.64  )
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

SGksIFlpeHVuCgpPbiBTYXQsIEphbiAxMCwgMjAyNiBhdCA1OjU34oCvUE0gWWl4dW4gTGFuIDxk
bGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+Cj4gSGkgR3VvZG9uZywKPgo+IEkgaGF2ZSBhIG1pbm9y
IGNvbW1lbnQgZm9yIHRoZSBzdWJqZWN0LCBpdCdzIGtpbmQgb2YgbGl0dGxlIGJpdCByZWR1bmRh
bnQuLgo+IHNvLCBob3cgYWJvdXQgKGFsc28gYXBwbHkgdG8gcGF0Y2ggMTApOgo+Cj4gW1BBVENI
IHY0IDEwLzExXSByaXNjdjogZHRzOiBzcGFjZW1pdDogYWRkIGluaXRpYWwgc3VwcG9ydCBmb3Ig
SzMgU29DCj4gW1BBVENIIHY0IDExLzExXSByaXNjdjogZHRzOiBzcGFjZW1pdDogYWRkIEszIFBp
Y28tSVRYIGJvYXJkIHN1cHBvcnQKClRoYW5rcyBmb3IgdGhlIHJldmlldy4gU3VyZSwgSSBjYW4g
ZG8gaXQgdGhhdCB3YXkuCgo+Cj4gT24gMTM6MTggU2F0IDEwIEphbiAgICAgLCBHdW9kb25nIFh1
IHdyb3RlOgo+ID4gSzMgUGljby1JVFggaXMgYSAyLjUtaW5jaCBzaW5nbGUtYm9hcmQgY29tcHV0
ZXIgZXF1aXB0ZWQgd2l0aCBhIFNwYWNlbWlUCj4gPiBLMyBTb0MuCj4gPgo+ID4gVGhpcyBtaW5p
bWFsIGRldmljZSB0cmVlIGVuYWJsZXMgYm9vdGluZyBpbnRvIGEgc2VyaWFsIGNvbnNvbGUgd2l0
aCBVQVJUCj4gPiBvdXRwdXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3Vv
ZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+IHY0OiBObyBjaGFuZ2UuCj4gPiB2MzogTm8g
Y2hhbmdlLgo+ID4gdjI6IEFkZCBhbGlhc2VzIG5vZGUgaW4gdGhpcyBib2FyZCBEVC4KPiA+ICAg
ICBVcGRhdGUgdGhlIG1lbW9yeSBub2RlIHRvIHJlZmxlY3QgdGhlIGhhcmR3YXJlIHRydXRoLiBB
ZGRyZXNzCj4gPiAgICAgIHN0YXJ0cyBhdCAweDEwMDAwMDAwMCAoNEcpIGJvdW5kYXJ5Lgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZSAgICAgICAgfCAg
MSArCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1waWNvLWl0eC5kdHMgfCAz
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlCj4g
PiBpbmRleCA5NTg4OWU3MjY5ZDEuLjdlMmI4NzcwMjU3MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUKPiA+IEBAIC00LDMgKzQsNCBAQCBkdGItJChDT05GSUdf
QVJDSF9TUEFDRU1JVCkgKz0gazEtbWlsa3YtanVwaXRlci5kdGIKPiA+ICBkdGItJChDT05GSUdf
QVJDSF9TUEFDRU1JVCkgKz0gazEtbXVzZXBpLXByby5kdGIKPiA+ICBkdGItJChDT05GSUdfQVJD
SF9TUEFDRU1JVCkgKz0gazEtb3JhbmdlcGktcjJzLmR0Ygo+ID4gIGR0Yi0kKENPTkZJR19BUkNI
X1NQQUNFTUlUKSArPSBrMS1vcmFuZ2VwaS1ydjIuZHRiCj4gPiArZHRiLSQoQ09ORklHX0FSQ0hf
U1BBQ0VNSVQpICs9IGszLXBpY28taXR4LmR0Ygo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazMtcGljby1pdHguZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9z
cGFjZW1pdC9rMy1waWNvLWl0eC5kdHMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjAzN2NlNzU3ZTViYwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1waWNvLWl0eC5kdHMKPiA+IEBAIC0wLDAg
KzEsMzggQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlU
KQo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1IFNwYWNlbWlUIChIYW5nemhvdSkg
VGVjaG5vbG9neSBDby4gTHRkCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1IEd1b2RvbmcgWHUg
PGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+IHN0cmljdGx5LCBzaG91bGQgdXBkYXRlIHRvIGNvdmVy
IGN1cnJlbnQgeWVhciAtIHdoaWNoIGlzIDIwMjYgbm93CgpZZXMsIHRoYXQncyBhIG1pc3Rha2Uu
IEhhcHB5IE5ldyBZZWFyLCAyMDI2IQpJIHdpbGwgZml4IHRoYXQuCgo+Cj4gPiArICovCj4gPiAr
Cj4gPiArI2luY2x1ZGUgImszLmR0c2kiCj4gPiArCj4gPiArLyB7Cj4gPiArICAgICBtb2RlbCA9
ICJTcGFjZW1pVCBLMyBQaWNvLUlUWCI7Cj4gPiArICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0
LGszLXBpY28taXR4IiwgInNwYWNlbWl0LGszIjsKPiA+ICsKPiA+ICsgICAgIGFsaWFzZXMgewo+
ID4gKyAgICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+IC4uCj4gPiArICAgICAgICAgICAg
IHNlcmlhbDIgPSAmdWFydDI7Cj4gPiArICAgICAgICAgICAgIHNlcmlhbDMgPSAmdWFydDM7Cj4g
PiArICAgICAgICAgICAgIHNlcmlhbDQgPSAmdWFydDQ7Cj4gPiArICAgICAgICAgICAgIHNlcmlh
bDUgPSAmdWFydDU7Cj4gPiArICAgICAgICAgICAgIHNlcmlhbDYgPSAmdWFydDY7Cj4gPiArICAg
ICAgICAgICAgIHNlcmlhbDcgPSAmdWFydDc7Cj4gPiArICAgICAgICAgICAgIHNlcmlhbDggPSAm
dWFydDg7Cj4gPiArICAgICAgICAgICAgIHNlcmlhbDkgPSAmdWFydDk7Cj4gPiArICAgICAgICAg
ICAgIHNlcmlhbDEwID0gJnVhcnQxMDsKPiBJIHRoaW5rIHdlIG9ubHkgYWRkIGFsaWFzZXMgZm9y
IGRldmljZXMgd2hpY2ggYWN0dWFsbHkgZW5hYmxlZAoKU3VyZS4gSSBzZWUgeW91ciBwb2ludC4K
ClRoZXJlIGFyZSBkaWZmZXJlbnQgc3R5bGVzIGV4aXN0aW5nIGluIHRoZSBrZXJuZWwgZHRzLiBs
aWtlIHNvcGhnbywgYW5kIHRoZWFkLgpJIGNoZWNrZWQgdGgxNTIwLWxpY2hlZS1waS00YS5kdHMs
IHdoaWNoIGhhcyBhbGlhc2VzIGZvciBzZXJpYWwwLTUsIGJ1dApvbmx5IGVuYWJsZXMgdWFydDAg
YWN0dWFsbHkuCgpIb3dldmVyLCBmb3IgU3BhY2VtaVQgY29udmVudGlvbiwgYW5kIHNldmVyYWwg
b3RoZXJzLCBJIHNlZSBhIGRpZmZlcmVudCBzdHlsZS4KSW4gazEgYm9hcmRzLCBib3RoIGsxLW1p
bGt2LWp1cGl0ZXIuZHRzIGFuZCBrMS1iYW5hbmFwaS1mMy5kdHMgb25seSBoYXZlIHRoZQpzZXJp
YWwwIGFsaWFzLCB3aXRoIG9ubHkgdWFydDAgZW5hYmxlZC4KCkZvciBTcGFjZW1pVCBLMyBib2Fy
ZHMsIHRvIGZvbGxvdyB0aGUgY29udmVudGlvbiwgSSB3aWxsIHJlbW92ZSB0aGUgdW51c2VkCmFs
aWFzZXMgYW5kIGZpeCB0aGF0IGluIG15IG5leHQgdmVyc2lvbi4KCkJlc3QgcmVnYXJkcywKR3Vv
ZG9uZyBYdQoKPgo+ID4gKyAgICAgfTsKPiA+ICsKPiA+ICsgICAgIGNob3NlbiB7Cj4gPiArICAg
ICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDAiOwo+ID4gKyAgICAgfTsKPiA+ICsKPiA+
ICsgICAgIG1lbW9yeUAxMDAwMDAwMDAgewo+ID4gKyAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9
ICJtZW1vcnkiOwo+ID4gKyAgICAgICAgICAgICByZWcgPSA8MHgxIDB4MDAwMDAwMDAgMHg0IDB4
MDAwMDAwMDA+Owo+ID4gKyAgICAgfTsKPiA+ICt9Owo+ID4gKwo+ID4gKyZ1YXJ0MCB7Cj4gPiAr
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+
Cj4gLS0KPgo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
