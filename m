Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C779C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hslkKEQFMmnpsE4OrW5juOvmYYHp+K6a4dH9yFOvvt0=; b=cX9ffQtIB8QWEI
	adSWkrmuFCgOSU1uqLcEg7xA0acIUVoIMYBIitnFZQDWh/76QZksd3nug3Cfp5lFujCM+C2F/cGcD
	nJG5dcuIGM8ONbAMJJ9kSxc6zTfHo5kmWLdDmq2hwr+ydMPAoh76Cf/GlBHnDKQBELUud14AwyDx7
	PvWwXV6uXKP0xJRJ4rVAqbWNWmjjYoBF5t66nF+4hcWg1zoEezNtAYaWzkZ1lDkbJYWkPA/a+apMu
	ZfTJzV4e8xTa4WHgnbgu0jHUjooy7aevNFlX/Y1L0DtjgjPZvG9fQnW2FHEeRIGXR5CfthR5FgWtP
	VoJqSmbBpFJ/+2LWEo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDGEZ-00DVuO-0R;
	Wed, 13 Dec 2023 03:48:31 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDGEW-00DVtd-06
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 03:48:29 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2030f4d1af0so654734fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 19:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702439306; x=1703044106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clomx9PL4E/h6EqVWy6k5UtmANF6+S2n+IcanEDP7iw=;
        b=I45wLELdmvMoFFb1oIJbHiNSJVILyhYzDUzlPoKTTLl1oo4+P0vlgGaoPl8Hvp3ZYz
         vTVADX8Pi67YgSb68Cv3j8zpRo3qjmTbAKoJhCC0yYpVxMEHkMauWm/kR5Idprn8IUw3
         dfa0c7VCD017L2zygnZ3Q6b7NFCJM3z6wkHlocSMhPDw9RnuaroyMWA4+JUQsAPsDQLp
         +nTi+v6/+ly1UIfVmMk0rSyOlhnqCUeH8ds/9mBJvY2JjvT/MlJOSfxwiH8PhVtwUt+S
         55593SRHzhYcieCg5dWEHA0zx5XR706hW1tspx8t2NQ0NrWX1GeaizZ4pmhPa5jF72oY
         73EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702439306; x=1703044106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clomx9PL4E/h6EqVWy6k5UtmANF6+S2n+IcanEDP7iw=;
        b=EqwkKaWSkxW4S82DljeDhdMabxgEqzliuycnq2y7/ns1V048CLbrQpqoMMLFu6zAU9
         6IfW97L/5SdBou0ox1q8XmPPTpMY22O9hdbUwgna0H7qkHPfrsDyL8f+2EW0GXrgVgUZ
         zjn+fGOlt/u58k8fEf0s0xYvvSOawQ3vkxkOsmM3iz8u/k8MKD/i6J3qsg+1Vu9Cdyt2
         wkDYhfn0goKTdgc+LU6jSFWxabXdyiVgAQLrgGtyqmkLj10RkKe/zUYZ0SAjcwbir5/5
         gj0BY2g4ddMAjS/G+b9exrydZWuYIFPC5YME+SfEsMX48sBa3JX5QIXmLydqvDQzZtRR
         g9CQ==
X-Gm-Message-State: AOJu0Yy7aHNgv/FZkWMXARkpLoeodXQuDtXi1KBDsfqX0bCuELIcWiXK
	C7KReGEVmeoTu7dee0CTQjOxDPoL9eDSu8hbwXwuZg==
X-Google-Smtp-Source: AGHT+IHaD7oMNiw44MXxn+uDeF6j7vus4UTyBrcemloFE3EsCuYwUQ2y1gCTT2NYO5EC6m2cG+Vf+ppSjaTtGglMAhY=
X-Received: by 2002:a05:6870:e8c5:b0:203:27d2:8db4 with SMTP id
 r5-20020a056870e8c500b0020327d28db4mr82714oan.108.1702439306195; Tue, 12 Dec
 2023 19:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20231212053501.12054-1-yongxuan.wang@sifive.com> <CAK9=C2VOXj5oCAZEPS24K98UmQycupoJCcATGDNr+HFr9aVCPw@mail.gmail.com>
In-Reply-To: <CAK9=C2VOXj5oCAZEPS24K98UmQycupoJCcATGDNr+HFr9aVCPw@mail.gmail.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 13 Dec 2023 11:48:15 +0800
Message-ID: <CAMWQL2gWGYYD1mFHOnd6oQGvAmh6UHb9w++KMOTLbB9p=om-2Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISCV: KVM: should not be interrupted when update the
 external interrupt pending
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_194828_067304_887FEA35 
X-CRM114-Status: GOOD (  33.17  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTI6MDPigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAxMiwgMjAyMyBhdCAxMTowNeKA
r0FNIFlvbmctWHVhbiBXYW5nCj4gPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gVGhlIGVtdWxhdGVkIElNU0lDIHVwZGF0ZSB0aGUgZXh0ZXJuYWwgaW50ZXJydXB0IHBl
bmRpbmcgZGVwZW5kaW5nIG9uIHRoZQo+ID4gdmFsdWUgb2YgZWlkZWxpdmVyeSBhbmQgdG9wZWku
IEl0IG1pZ2h0IGxvc2UgYW4gaW50ZXJydXB0IHdoZW4gaXQgaXMKPiA+IGludGVycnVwdGVkIGJl
Zm9yZSBzZXR0aW5nIHRoZSBuZXcgdmFsdWUgdG8gdGhlIHBlbmRpbmcgc3RhdHVzLgo+Cj4gTW9y
ZSBzaW1wbGVyIFBBVENIIHN1YmplY3QgY2FuIGJlOgo+ICJSSVNDVjogS1ZNOiB1cGRhdGUgZXh0
ZXJuYWwgaW50ZXJydXB0IGF0b21pY2FsbHkgZm9yIElNU0lDIHN3ZmlsZSIKPgo+ID4KPiA+IEZv
ciBleGFtcGxlLCB3aGVuIFZDUFUwIHNlbmRzIGFuIElQSSB0byBWQ1BVMSB2aWEgSU1TSUM6Cj4g
Pgo+ID4gVkNQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICBWQ1BVMQo+ID4KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1NSU1dBUCB0b3BlaSA9IDAKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVGhlIFZDUFUxIGhhcyBjbGFpbWVkIGFsbCB0aGUgZXh0
ZXJuYWwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0IGluIGl0
cyBpbnRlcnJ1cHQgaGFuZGxlci4KPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRvcGVpIG9mIFZDUFUxJ3MgSU1TSUMgPSAwCj4gPgo+ID4gc2V0IHBlbmRpbmcgaW4gVkNQ
VTEncyBJTVNJQwo+ID4KPiA+IHRvcGVpIG9mIFZDUFUxJyBJTVNJQyA9IDEKPiA+Cj4gPiBzZXQg
dGhlIGV4dGVybmFsIGludGVycnVwdAo+ID4gcGVuZGluZyBvZiBWQ1BVMQo+ID4KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xlYXIgdGhlIGV4dGVybmFsIGludGVycnVwdCBw
ZW5kaW5nCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mIFZDUFUxCj4gPgo+
ID4gV2hlbiB0aGUgVkNQVTEgc3dpdGNoZXMgYmFjayB0byBWUyBtb2RlLCBpdCBleGl0cyB0aGUg
aW50ZXJydXB0IGhhbmRsZXIKPiA+IGJlY2F1c2UgdGhlIHJlc3VsdCBvZiBDU1JTV0FQIHRvcGVp
IGlzIDAuIElmIHRoZXJlIGFyZSBubyBvdGhlciBleHRlcm5hbAo+ID4gaW50ZXJydXB0cyBpbmpl
Y3RlZCBpbnRvIHRoZSBWQ1BVMSdzIElNU0lDLCBWQ1BVMSB3aWxsIG5ldmVyIGtub3cgdGhpcwo+
ID4gcGVuZGluZyBpbnRlcnJ1cHQgdW5sZXNzIGl0IGluaXRpYXRpdmUgcmVhZCB0aGUgdG9wZWku
Cj4gPgo+ID4gSWYgdGhlIGludGVycnVwdGlvbiBvY2N1cnMgYmV0d2VlbiB1cGRhdGluZyBpbnRl
cnJ1cHQgcGVuZGluZyBpbiBJTVNJQwo+ID4gYW5kIHVwZGF0aW5nIGV4dGVybmFsIGludGVycnVw
dCBwZW5kaW5nIG9mIFZDUFUsIGl0IHdpbGwgbm90IGNhdXNlIGEKPiA+IHByb2JsZW0uIFN1cHBv
c2UgdGhhdCB0aGUgVkNQVTEgY2xlYXJzIHRoZSBJUEkgcGVuZGluZyBpbiBJTVNJQyByaWdodAo+
ID4gYWZ0ZXIgVkNQVTAgc2V0cyB0aGUgcGVuZGluZywgdGhlIGV4dGVybmFsIGludGVycnVwdCBw
ZW5kaW5nIG9mIFZDUFUxCj4gPiB3aWxsIG5vdCBiZSBzZXQgYmVjYXVzZSB0aGUgdG9wZWkgaXMg
MC4gQnV0IHdoZW4gdGhlIFZDUFUxIGdvZXMgYmFjayB0bwo+ID4gVlMgbW9kZSwgdGhlIHBlbmRp
bmcgSVBJIHdpbGwgYmUgcmVwb3J0ZWQgYnkgdGhlIENTUlNXQVAgdG9wZWksIGl0IHdpbGwKPiA+
IG5vdCBsb3NlIHRoaXMgaW50ZXJydXB0Lgo+ID4KPiA+IFNvIHdlIG9ubHkgbmVlZCB0byBtYWtl
IHRoZSBleHRlcm5hbCBpbnRlcnJ1cHQgdXBkYXRpbmcgcHJvY2VkdXJlIGFzIGEKPiA+IGNyaXRp
Y2FsIHNlY3Rpb24gdG8gYXZvaWQgdGhlIHByb2JsZW0uCj4gPgo+Cj4gUGxlYXNlIGFkZCBhICJG
aXhlczoiIGxpbmUgaGVyZQo+Cj4gPiBUZXN0ZWQtYnk6IFJveSBMaW4gPHJveS5saW5Ac2lmaXZl
LmNvbT4KPiA+IFRlc3RlZC1ieTogV2F5bGluZyBDaGVuIDx3YXlsaW5nLmNoZW5Ac2lmaXZlLmNv
bT4KPiA+IENvLWRldmVsb3BlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZl
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0Bz
aWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA4ICsr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCj4gPiBpbmRleCA2Y2YyM2I4YWRiNzEuLjAyNzhhYTBjYTE2YSAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9h
aWFfaW1zaWMuYwo+ID4gQEAgLTM3LDYgKzM3LDggQEAgc3RydWN0IGltc2ljIHsKPiA+ICAgICAg
ICAgdTMyIG5yX2VpeDsKPiA+ICAgICAgICAgdTMyIG5yX2h3X2VpeDsKPiA+Cj4gPiArICAgICAg
IHNwaW5sb2NrX3QgZXh0aXJxX3VwZGF0ZV9sb2NrOwo+ID4gKwo+Cj4gUGxlYXNlIHJlbmFtZSB0
aGlzIGxvY2sgdG8gInN3ZmlsZV9leHRpcnFfbG9jayIuCj4KPiA+ICAgICAgICAgLyoKPiA+ICAg
ICAgICAgICogQXQgYW55IHBvaW50IGluIHRpbWUsIHRoZSByZWdpc3RlciBzdGF0ZSBpcyBpbgo+
ID4gICAgICAgICAgKiBvbmUgb2YgdGhlIGZvbGxvd2luZyBwbGFjZXM6Cj4gPiBAQCAtNjEzLDEy
ICs2MTUsMTcgQEAgc3RhdGljIHZvaWQgaW1zaWNfc3dmaWxlX2V4dGlycV91cGRhdGUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IGltc2ljICppbXNpYyA9
IHZjcHUtPmFyY2guYWlhX2NvbnRleHQuaW1zaWNfc3RhdGU7Cj4gPiAgICAgICAgIHN0cnVjdCBp
bXNpY19tcmlmICptcmlmID0gaW1zaWMtPnN3ZmlsZTsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKPiA+ICsKPgo+IEFkZCBhIHNob3J0IHN1bW1hcnkgaW4gYSBjb21tZW50IGJsb2Nr
IGFib3V0IHdoeSBleHRlcm5hbCBpbnRlcnJ1cHQKPiB1cGRhdGVzIGFyZSByZXF1aXJlZCB0byBi
ZSBpbiB0aGUgY3JpdGljYWwgc2VjdGlvbi4KPgo+ID4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmaW1zaWMtPmV4dGlycV91cGRhdGVfbG9jaywgZmxhZ3MpOwo+ID4KPiA+ICAgICAgICAgaWYg
KGltc2ljX21yaWZfYXRvbWljX3JlYWQobXJpZiwgJm1yaWYtPmVpZGVsaXZlcnkpICYmCj4gPiAg
ICAgICAgICAgICBpbXNpY19tcmlmX3RvcGVpKG1yaWYsIGltc2ljLT5ucl9laXgsIGltc2ljLT5u
cl9tc2lzKSkKPiA+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV9zZXRfaW50ZXJydXB0
KHZjcHUsIElSUV9WU19FWFQpOwo+ID4gICAgICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X3ZjcHVfdW5zZXRfaW50ZXJydXB0KHZjcHUsIElSUV9WU19FWFQpOwo+ID4gKwo+
ID4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+ZXh0aXJxX3VwZGF0ZV9s
b2NrLCBmbGFncyk7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBpbXNpY19zd2ZpbGVfcmVh
ZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgY2xlYXIsCj4gPiBAQCAtMTAyOSw2ICsxMDM2
LDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbml0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiA+ICAgICAgICAgaW1zaWMtPm5yX2VpeCA9IEJJVFNfVE9fVTY0KGltc2ljLT5ucl9t
c2lzKTsKPiA+ICAgICAgICAgaW1zaWMtPm5yX2h3X2VpeCA9IEJJVFNfVE9fVTY0KGt2bV9yaXNj
dl9haWFfbWF4X2lkcyk7Cj4gPiAgICAgICAgIGltc2ljLT52c2ZpbGVfaGdlaSA9IGltc2ljLT52
c2ZpbGVfY3B1ID0gLTE7Cj4gPiArICAgICAgIHNwaW5fbG9ja19pbml0KCZpbXNpYy0+ZXh0aXJx
X3VwZGF0ZV9sb2NrKTsKPiA+Cj4gPiAgICAgICAgIC8qIFNldHVwIElNU0lDIFNXLWZpbGUgKi8K
PiA+ICAgICAgICAgc3dmaWxlX3BhZ2UgPSBhbGxvY19wYWdlcyhHRlBfS0VSTkVMIHwgX19HRlBf
WkVSTywKPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4gPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpIaSBB
bnVwLAoKVGhhbmsgeW91ISBJIHdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbi4KClJlZ2FyZHMs
CllvbmctWHVhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
