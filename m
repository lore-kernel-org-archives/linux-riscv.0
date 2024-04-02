Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F983CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 02:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft/fl4u451weoVqJ8oH4wK9KmsIZj8D2eNn+SErO0jE=; b=v6xmU9LyGzvtlq
	eMXJvYfBOAr6jKJ+bmVYuAoAhPtHQu/zse6AZmauNhuxsaCriPb3oPGfKTYtbjxm/Je7zVXfSqyew
	HERJ7esIftgujNNUBoC+un2iwjOfgTiDx20ecQIiNluhvPTbNtHfVy+l+p1/NmRia7ahAxbiv4VFK
	s266HRr5iDFaZ0YAAAQQQ4Ye8FrUTmKaR2FUVV7isLtFhh4c5D2+lnAmnK8U9If5zeozY3t51piOk
	OyIIFDiIZHm1McvDlSEZ7BD4R8MsoZDAs1b7Y9VsAvW/kbBveYSIOwEenLXWiJUo0y9riTaIgZuhs
	XAxcSkginDfRE9NO8nFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTTM-00000009PAk-3yvO;
	Tue, 02 Apr 2024 02:02:00 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTTJ-00000009P8n-2Re6
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 02:01:59 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-60a3c48e70fso45769077b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 19:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712023311; x=1712628111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvr2WqmK4l25YNAt8b0NZcWlTzIuuYI4Iz17Klvwotc=;
        b=dHZ4oFSEg56ibQX1dgm26FgR+usTC6UqGkCNzlwDIvN03aRyLlKtJJcvjQeHwRyd9S
         pBSfRFAyoPYcrlsidwoyvcJVqCiThskmdJE2C6majDy6yaE/wLo2OVEg9nZ/BdPtndGC
         Vz2RZ7h+unxpFviXYsZLDwA1gEGW0/IarKAu3mTzC0LpodunWEne52GoFnDflzOBv6l7
         Um/5pOp4fbv+fcWmwfROMmQrc3rQKaAEvHOUhi5EKC0kch1Eo3T5mejPwoaE0EvBzTNp
         WP62YrPLGs4IvgSkP7jsVGkdYhyKIKmkEx0+r4JkDI3gd21V1Tm+xoJM+Nbl8StfpKYd
         IZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712023311; x=1712628111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvr2WqmK4l25YNAt8b0NZcWlTzIuuYI4Iz17Klvwotc=;
        b=R5+jIxChAw4iSgMuKUdxPCpUMUrCS565pWs/Kpx/aanBKfAiB9sqEkIw0Xv1mU9hCm
         R3XYFXVp1h/wpgT+GEkIULRGau/yqfDQ0Nfde3akTJ2Ei2g+tp2SBBVwZ2MwRiMcOezo
         jxaLMlqF8SNBg77Cy0vFc/CckTJIHFQKXFLbUEAc+XR9/1DZxEYoCg+kTeFdEb7GUVC3
         t45SrkJpayLYRCZEqXlIt7WAW6P4fRnEt0W6t2/d/ZDCi+9u+zblLACqlWON260I5lbT
         5JoNdtpCh7n5oypQEAN8xQi3cgceKTOhCyNX3PvhV7Ehe++dz4Rxm+VdVFI+n0BYJONF
         jGqg==
X-Gm-Message-State: AOJu0Yy29SeYNFM6LdryMg31B6rXOLLcsGYCB1sfOirmMVyckusF6uex
	zUIKz5h4afClB+WueEiZ8coz3/nq/kc0cu+h/ZvnQPjqiV1Fh0YaseOOT0colwtRSa09MM9E+1v
	mnTu2R9SK1nwT/rn97yLNXGH4M9jRTpjRkzlv6A==
X-Google-Smtp-Source: AGHT+IEiTesJ6e5VvTHdNiIZOlQ0XIWLmXy/mt4x0B4EzVBfFyQZ042yMQyfl2fZmz0rPpzr+oqCLTurlcAbC3agZZc=
X-Received: by 2002:a25:2e04:0:b0:dc7:4f61:5723 with SMTP id
 u4-20020a252e04000000b00dc74f615723mr8867725ybu.39.1712023310864; Mon, 01 Apr
 2024 19:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com> <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
In-Reply-To: <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 2 Apr 2024 10:01:39 +0800
Message-ID: <CAHh=Yk92=hp+kaTJWL13_jwJ5gzAAi8gbRF=Ns9=yq2trRUQEg@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_190157_872660_816691A0 
X-CRM114-Status: GOOD (  19.09  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5pa8IDIw
MjTlubQz5pyIMTnml6Ug6YCx5LqMIOS4iuWNiDI6MTflr6vpgZPvvJoKPgo+IEhlbGxvLAo+Cj4g
T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMDQ6MTI6MzFQTSArMDgwMCwgTnlsb24gQ2hlbiB3cm90
ZToKPiA+IFJvdW5kIHRoZSByZXN1bHQgdG8gdGhlIG5lYXJlc3Qgd2hvbGUgbnVtYmVyLiBUaGlz
IGVuc3VyZXMgdGhhdAo+ID4gcmVhbF9wZXJpb2QgaXMgYWx3YXlzIGEgcmVhc29uYWJsZSBpbnRl
Z2VyIHRoYXQgaXMgbm90IGxvd2VyIHRoYW4gdGhlCj4gPiBhY3R1YWwgdmFsdWUuCj4gPgo+ID4g
ZS5nLgo+ID4gJCBlY2hvIDExMCA+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9sZWQtY29udHJvbGxl
ci0xL2xlZHMvZDEyL2JyaWdodG5lc3MKPiA+ICQgLmFwcGx5IGlzIG5vdCBpZGVtcG90ZW50IChl
bmE9MSBwb2w9MCAxNzM5NjkyLzQwMzI5ODUpIC0+IChlbmE9MSBwb2w9MCAxNzM5NjMwLzQwMzI5
ODUpCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1zaWZpdmUuYyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gaW5kZXggYTU4
NmNmZTQxOTFiLi5iZWJjYmViYWNjY2QgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20t
c2lmaXZlLmMKPiA+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gQEAgLTEwMSw3
ICsxMDEsNyBAQCBzdGF0aWMgdm9pZCBwd21fc2lmaXZlX3VwZGF0ZV9jbG9jayhzdHJ1Y3QgcHdt
X3NpZml2ZV9kZGF0YSAqZGRhdGEsCj4gPgo+ID4gICAgICAgLyogQXMgc2NhbGUgPD0gMTUgdGhl
IHNoaWZ0IG9wZXJhdGlvbiBjYW5ub3Qgb3ZlcmZsb3cuICovCj4gPiAgICAgICBudW0gPSAodW5z
aWduZWQgbG9uZyBsb25nKU5TRUNfUEVSX1NFQyA8PCAoUFdNX1NJRklWRV9DTVBXSURUSCArIHNj
YWxlKTsKPiA+IC0gICAgIGRkYXRhLT5yZWFsX3BlcmlvZCA9IGRpdjY0X3VsKG51bSwgcmF0ZSk7
Cj4gPiArICAgICBkZGF0YS0+cmVhbF9wZXJpb2QgPSBESVZfUk9VTkRfVVBfVUxMKG51bSwgcmF0
ZSk7Cj4gPiAgICAgICBkZXZfZGJnKGRkYXRhLT5jaGlwLmRldiwKPiA+ICAgICAgICAgICAgICAg
Ik5ldyByZWFsX3BlcmlvZCA9ICV1IG5zXG4iLCBkZGF0YS0+cmVhbF9wZXJpb2QpOwo+ID4gIH0K
SGkgVXdlCj4KPiBwd21fc2lmaXZlX2FwcGx5IGhhcyBhIERJVjY0X1U2NF9ST1VORF9DTE9TRVNU
KCkuIEkgd29uZGVyIGlmIHRoYXQgbmVlZHMKPiBhZGFwdGlvbiwgdG9vPyEKQWNjb3JkaW5nIHRv
IG15IGV4cGVyaW1lbnRzLCBubyBhZGp1c3RtZW50IGlzIG5lY2Vzc2FyeS4KPgo+IEJlc3QgcmVn
YXJkcwo+IFV3ZQo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExpbnV4
IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8g
fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
