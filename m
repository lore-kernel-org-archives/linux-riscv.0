Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D855EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR4h1lh/RlUke/VPjsTznCo9QC5fdJQTnwi+ufkhYJc=; b=mFZpi1FKmeS+d7
	BuKD7NxS8fNyBF3DCCF6/9//lVNGwKom3bi/SnZ+bDilqUxWkqpdN7k/a3cA68P0NnqGZqKjKP9Gf
	ojMeA2bpWFaA/N8Jno/jGL/4mQtpAVI0vS5ApBkyi+nQPBc+N/uEJ/JkgnmJNYJzMIdcw7qzmLPBj
	iwMGHsqgn6AkhujuXELpyojzFHYbUOP4Ixm4MEgGm8T6STTMtNJhuHPNiyfEulvxu2eBMt1Gu1Bh+
	I9/hPNJVKsjTxJjIHH/ei7xAT6pGnstrR62aofFT1VI5WdUWsHK0gLUZlDar/KFiZG+GZT10NlZg3
	aqHRBMA/EHFv0uibjFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5ET-00C9ci-2N;
	Tue, 12 Dec 2023 16:03:41 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5EQ-00C9bi-1w
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 16:03:40 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso81491421fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702397014; x=1703001814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP8xfxj50VGqrIkZIkHug1SrPRuuFi/XxUsjHmRpfqM=;
        b=oqyKmke6LZrcujQawYE/2RcWFVoYAO6myPY45SyhJo9kHMLND+I+0CcLmsyOzJ93JZ
         b0ua0tyMp+PNkEIQa7iCaZg4467+EUcWQU+NmRM+VprBoPrRv5zbRwFz/bGncgYwWxcu
         CUYLd6MLfs5W3Xih7P//oP1o6a8ov2SDf4rE5RQDGsmWdR3Bu4xpSH0tEEqeYqYGlDAl
         AWsdK+i+zMXvnV6wNBf3dBoBIG2G56ndF5MDx9G9IOmRD4Ru9iwlTEvb96I7/mhM7zHZ
         +PV/iat85BFGwTOnq1euw//IKs3fdIYVUs8bwY4duzS3zo+fPiu/9tpgfoTwgWAYpAFP
         fphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702397014; x=1703001814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP8xfxj50VGqrIkZIkHug1SrPRuuFi/XxUsjHmRpfqM=;
        b=m8h4uO+MmS8BxX6ZXVoxCLoOBOBQZPIeHu26eKeng0zPwytx/AmH7AEmex63PCUKVJ
         2pesvFCBpgTFKXglUK+MXhYXY2uHv60KY60oJQRjTNb5mAj9YlMCTzJZSJPYb89zY8Yv
         OfgMhw3ZF3pyYMXLgwp0D684KcbUxNOV0L61i4xqFMQ3dD8ZbY6MqMKZUfrMiWgCFtgk
         KGc8j/20CWQTTROkDgcYCih4jTV/b105K5f5wwJBXQ4im5YW0z8yUlW8RqOv4re2SpKk
         RTbY+za9fwpr/5VjpL3DPA4FdpccPK5sUOQ5Rpo5posRvgRG0r4PZ5S8hVV4s4mqBtfF
         Lpuw==
X-Gm-Message-State: AOJu0Yx6iu5GWGYQOyvrrMnMfpqT3ipF3sFsyP5YsEENmvxpgVTeGoOA
	8iRMP6OlytuCTLQhJen8xan5hDe5o2NB6Fqq4vdH6g==
X-Google-Smtp-Source: AGHT+IEz0+50MDCsAQHZ+397Z3sl+6IBS7BadUyZHh4qtGCJPyOtz95wQCVulFs0PwkrFNz1kcnuxWiP/zSSNoxxtu8=
X-Received: by 2002:a2e:97c7:0:b0:2ca:24e0:f87f with SMTP id
 m7-20020a2e97c7000000b002ca24e0f87fmr2556071ljj.56.1702397013574; Tue, 12 Dec
 2023 08:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20231212053501.12054-1-yongxuan.wang@sifive.com>
In-Reply-To: <20231212053501.12054-1-yongxuan.wang@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Dec 2023 21:33:22 +0530
Message-ID: <CAK9=C2VOXj5oCAZEPS24K98UmQycupoJCcATGDNr+HFr9aVCPw@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISCV: KVM: should not be interrupted when update the
 external interrupt pending
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_080338_640359_2B752915 
X-CRM114-Status: GOOD (  28.85  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMTE6MDXigK9BTSBZb25nLVh1YW4gV2FuZwo8eW9uZ3h1
YW4ud2FuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBlbXVsYXRlZCBJTVNJQyB1cGRhdGUg
dGhlIGV4dGVybmFsIGludGVycnVwdCBwZW5kaW5nIGRlcGVuZGluZyBvbiB0aGUKPiB2YWx1ZSBv
ZiBlaWRlbGl2ZXJ5IGFuZCB0b3BlaS4gSXQgbWlnaHQgbG9zZSBhbiBpbnRlcnJ1cHQgd2hlbiBp
dCBpcwo+IGludGVycnVwdGVkIGJlZm9yZSBzZXR0aW5nIHRoZSBuZXcgdmFsdWUgdG8gdGhlIHBl
bmRpbmcgc3RhdHVzLgoKTW9yZSBzaW1wbGVyIFBBVENIIHN1YmplY3QgY2FuIGJlOgoiUklTQ1Y6
IEtWTTogdXBkYXRlIGV4dGVybmFsIGludGVycnVwdCBhdG9taWNhbGx5IGZvciBJTVNJQyBzd2Zp
bGUiCgo+Cj4gRm9yIGV4YW1wbGUsIHdoZW4gVkNQVTAgc2VuZHMgYW4gSVBJIHRvIFZDUFUxIHZp
YSBJTVNJQzoKPgo+IFZDUFUwICAgICAgICAgICAgICAgICAgICAgICAgICAgVkNQVTEKPgo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1NSU1dBUCB0b3BlaSA9IDAKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFRoZSBWQ1BVMSBoYXMgY2xhaW1lZCBhbGwgdGhlIGV4
dGVybmFsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQgaW4gaXRz
IGludGVycnVwdCBoYW5kbGVyLgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
b3BlaSBvZiBWQ1BVMSdzIElNU0lDID0gMAo+Cj4gc2V0IHBlbmRpbmcgaW4gVkNQVTEncyBJTVNJ
Qwo+Cj4gdG9wZWkgb2YgVkNQVTEnIElNU0lDID0gMQo+Cj4gc2V0IHRoZSBleHRlcm5hbCBpbnRl
cnJ1cHQKPiBwZW5kaW5nIG9mIFZDUFUxCj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsZWFyIHRoZSBleHRlcm5hbCBpbnRlcnJ1cHQgcGVuZGluZwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgb2YgVkNQVTEKPgo+IFdoZW4gdGhlIFZDUFUxIHN3aXRjaGVzIGJh
Y2sgdG8gVlMgbW9kZSwgaXQgZXhpdHMgdGhlIGludGVycnVwdCBoYW5kbGVyCj4gYmVjYXVzZSB0
aGUgcmVzdWx0IG9mIENTUlNXQVAgdG9wZWkgaXMgMC4gSWYgdGhlcmUgYXJlIG5vIG90aGVyIGV4
dGVybmFsCj4gaW50ZXJydXB0cyBpbmplY3RlZCBpbnRvIHRoZSBWQ1BVMSdzIElNU0lDLCBWQ1BV
MSB3aWxsIG5ldmVyIGtub3cgdGhpcwo+IHBlbmRpbmcgaW50ZXJydXB0IHVubGVzcyBpdCBpbml0
aWF0aXZlIHJlYWQgdGhlIHRvcGVpLgo+Cj4gSWYgdGhlIGludGVycnVwdGlvbiBvY2N1cnMgYmV0
d2VlbiB1cGRhdGluZyBpbnRlcnJ1cHQgcGVuZGluZyBpbiBJTVNJQwo+IGFuZCB1cGRhdGluZyBl
eHRlcm5hbCBpbnRlcnJ1cHQgcGVuZGluZyBvZiBWQ1BVLCBpdCB3aWxsIG5vdCBjYXVzZSBhCj4g
cHJvYmxlbS4gU3VwcG9zZSB0aGF0IHRoZSBWQ1BVMSBjbGVhcnMgdGhlIElQSSBwZW5kaW5nIGlu
IElNU0lDIHJpZ2h0Cj4gYWZ0ZXIgVkNQVTAgc2V0cyB0aGUgcGVuZGluZywgdGhlIGV4dGVybmFs
IGludGVycnVwdCBwZW5kaW5nIG9mIFZDUFUxCj4gd2lsbCBub3QgYmUgc2V0IGJlY2F1c2UgdGhl
IHRvcGVpIGlzIDAuIEJ1dCB3aGVuIHRoZSBWQ1BVMSBnb2VzIGJhY2sgdG8KPiBWUyBtb2RlLCB0
aGUgcGVuZGluZyBJUEkgd2lsbCBiZSByZXBvcnRlZCBieSB0aGUgQ1NSU1dBUCB0b3BlaSwgaXQg
d2lsbAo+IG5vdCBsb3NlIHRoaXMgaW50ZXJydXB0Lgo+Cj4gU28gd2Ugb25seSBuZWVkIHRvIG1h
a2UgdGhlIGV4dGVybmFsIGludGVycnVwdCB1cGRhdGluZyBwcm9jZWR1cmUgYXMgYQo+IGNyaXRp
Y2FsIHNlY3Rpb24gdG8gYXZvaWQgdGhlIHByb2JsZW0uCj4KClBsZWFzZSBhZGQgYSAiRml4ZXM6
IiBsaW5lIGhlcmUKCj4gVGVzdGVkLWJ5OiBSb3kgTGluIDxyb3kubGluQHNpZml2ZS5jb20+Cj4g
VGVzdGVkLWJ5OiBXYXlsaW5nIENoZW4gPHdheWxpbmcuY2hlbkBzaWZpdmUuY29tPgo+IENvLWRl
dmVsb3BlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlh
X2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IGluZGV4IDZjZjIzYjhhZGI3
MS4uMDI3OGFhMGNhMTZhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBAQCAtMzcsNiArMzcsOCBAQCBz
dHJ1Y3QgaW1zaWMgewo+ICAgICAgICAgdTMyIG5yX2VpeDsKPiAgICAgICAgIHUzMiBucl9od19l
aXg7Cj4KPiArICAgICAgIHNwaW5sb2NrX3QgZXh0aXJxX3VwZGF0ZV9sb2NrOwo+ICsKClBsZWFz
ZSByZW5hbWUgdGhpcyBsb2NrIHRvICJzd2ZpbGVfZXh0aXJxX2xvY2siLgoKPiAgICAgICAgIC8q
Cj4gICAgICAgICAgKiBBdCBhbnkgcG9pbnQgaW4gdGltZSwgdGhlIHJlZ2lzdGVyIHN0YXRlIGlz
IGluCj4gICAgICAgICAgKiBvbmUgb2YgdGhlIGZvbGxvd2luZyBwbGFjZXM6Cj4gQEAgLTYxMywx
MiArNjE1LDE3IEBAIHN0YXRpYyB2b2lkIGltc2ljX3N3ZmlsZV9leHRpcnFfdXBkYXRlKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICAgICAgICAgc3RydWN0IGltc2ljICppbXNpYyA9IHZj
cHUtPmFyY2guYWlhX2NvbnRleHQuaW1zaWNfc3RhdGU7Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWNf
bXJpZiAqbXJpZiA9IGltc2ljLT5zd2ZpbGU7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdz
Owo+ICsKCkFkZCBhIHNob3J0IHN1bW1hcnkgaW4gYSBjb21tZW50IGJsb2NrIGFib3V0IHdoeSBl
eHRlcm5hbCBpbnRlcnJ1cHQKdXBkYXRlcyBhcmUgcmVxdWlyZWQgdG8gYmUgaW4gdGhlIGNyaXRp
Y2FsIHNlY3Rpb24uCgo+ICsgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmltc2ljLT5leHRpcnFf
dXBkYXRlX2xvY2ssIGZsYWdzKTsKPgo+ICAgICAgICAgaWYgKGltc2ljX21yaWZfYXRvbWljX3Jl
YWQobXJpZiwgJm1yaWYtPmVpZGVsaXZlcnkpICYmCj4gICAgICAgICAgICAgaW1zaWNfbXJpZl90
b3BlaShtcmlmLCBpbXNpYy0+bnJfZWl4LCBpbXNpYy0+bnJfbXNpcykpCj4gICAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl92Y3B1X3NldF9pbnRlcnJ1cHQodmNwdSwgSVJRX1ZTX0VYVCk7Cj4gICAg
ICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3Vuc2V0X2ludGVycnVw
dCh2Y3B1LCBJUlFfVlNfRVhUKTsKPiArCj4gKyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZpbXNpYy0+ZXh0aXJxX3VwZGF0ZV9sb2NrLCBmbGFncyk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9p
ZCBpbXNpY19zd2ZpbGVfcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgY2xlYXIsCj4g
QEAgLTEwMjksNiArMTAzNiw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfaW5pdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICBpbXNpYy0+bnJfZWl4ID0gQklUU19UT19V
NjQoaW1zaWMtPm5yX21zaXMpOwo+ICAgICAgICAgaW1zaWMtPm5yX2h3X2VpeCA9IEJJVFNfVE9f
VTY0KGt2bV9yaXNjdl9haWFfbWF4X2lkcyk7Cj4gICAgICAgICBpbXNpYy0+dnNmaWxlX2hnZWkg
PSBpbXNpYy0+dnNmaWxlX2NwdSA9IC0xOwo+ICsgICAgICAgc3Bpbl9sb2NrX2luaXQoJmltc2lj
LT5leHRpcnFfdXBkYXRlX2xvY2spOwo+Cj4gICAgICAgICAvKiBTZXR1cCBJTVNJQyBTVy1maWxl
ICovCj4gICAgICAgICBzd2ZpbGVfcGFnZSA9IGFsbG9jX3BhZ2VzKEdGUF9LRVJORUwgfCBfX0dG
UF9aRVJPLAo+IC0tCj4gMi4xNy4xCj4KPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
