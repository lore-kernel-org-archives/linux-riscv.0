Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB2C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 22:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IA1dcPFb59BVwquPEZzlbUMHlSDzrK7GyO51Ar/vVuk=; b=C2MTGuk2YvL7pz
	zgexfX/2EgobZ1tLUEn7qErMfzzn1B6cvSRZ5ed+rfZMV7NWiWY/B46IGASIErbmlAw0klPyqtlZ2
	WgEGCUDAzzETXpJrfKEpaCPnoZAe261sx78ru+5TKlwUTtvn2Z5eJFrzf+8xOg4mGdR1zva6a2To0
	LQnUQIqgdq8GhQTTNYzo2PyYZzMTEzH14ampQZ+Fc5vVJnNE3j+Kh+NUoPWhD7uUijj4A3sOl0iKm
	uGc9jpXrZvjLmyr6UlVUtWbw/36LZLuf/PI0LCXYBBlHW+neWSdAJ7dJR9patl+xmL2Emf+8gorJV
	AdJXjSP0Hy9YgvumCooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOPwY-000000051Rf-49OC;
	Mon, 01 Jul 2024 22:56:18 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOPwW-000000051RE-1jRE
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 22:56:18 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52cdf2c7454so7456813e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 15:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719874575; x=1720479375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdJUfDYOyf/WJJ9zrH24ztlqBOCblPzsJzyTcSzB/DA=;
        b=uUToMDEVRBKst/fQkR7oHBcLGS0fwHlew56DZlZhlM+VXcvhde6c9/CzDXnhBusuj4
         qvXeBinWP5LIUxV3XlwNB80DmGDLL8B34URbGFzsrEp0nbXeMVyIBMx2gkZhZNrKp2SU
         zOyAZE8hfO40HiYZdKKtTpo+kdH4NK9Cbxn4ul4VhUS+pucErYIaQZUZMZcY7Zm9abvO
         qmjN+bOT4dW4y+DdWpJdnuzhDSxWKR9EsSku4a5KCgauKJxtbMQeSauPjyC7cTxVnp3A
         UQf3SODdgaLVmP7JQ4bwYoMclxL8ldOQJEdoQibGvtd658PQKjhfx5K4BQU6MdnTCHT/
         Y0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719874575; x=1720479375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdJUfDYOyf/WJJ9zrH24ztlqBOCblPzsJzyTcSzB/DA=;
        b=moOKPK83sZ2Kp5dsaGE1sis/ynyAaHdXkWS4m0kUK5BV1p+CB+/mgkSgjqdgJPM8z7
         Eg5HXhNx4ZcEa1rcXc8dPvlMG8XeCoGTYUWOpQfqDF+O54jeXtkM785c4lHl3eXFCZ5c
         kC7PZbmpb7lrXA0fTCdV1WObTt5m5vU9RUjI3zw+wxAFV9xBV88SN3yO1153uINgBohC
         2nOZWWcACGc1kcAAYf5Prhc8lH7pAC0O9W2Dfe4Oa4irGEsUhdRhET+yQiTJDoOnfHng
         nEDIHAxZRz1STahlRu+bsODjqL1hDZfp0EJ/oG+Dsl9oTQ9JAct3dbriq+h9/W3sPVQw
         ZSlA==
X-Gm-Message-State: AOJu0Yw+SD59wxd/73M3eU8bP26ob36P1leo9bC8S8OWdH7Lsa5px9ll
	ozBMStnikmpcv+o2Z/VfkB0wDCjYwg2e3uxs0RKlvIINvaK1oWqFMaQ69g/1BtnfBIZbaKQCbal
	xFOH/O6tKw5TIQKA1GxeLQbqKoI4cGdr6k76Rex0dYHfik2k57vk=
X-Google-Smtp-Source: AGHT+IHFoX0TblQJwZ+l7iqTozuVaBmypZrrJQg9ZDiu8wwUJWTW/D2dHfLDkj0hkIeaAJGWSulK7BcCs24nFJxPIgo=
X-Received: by 2002:a05:6512:6ce:b0:52c:d2ab:693a with SMTP id
 2adb3069b0e04-52e82705af2mr6381035e87.54.1719874574664; Mon, 01 Jul 2024
 15:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240625005001.37901-1-jesse@rivosinc.com> <20240625005001.37901-9-jesse@rivosinc.com>
In-Reply-To: <20240625005001.37901-9-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 1 Jul 2024 15:55:37 -0700
Message-ID: <CALs-HsueQrj5_VX0jZP4RrxL18PoGB4Q_mbAbf9c9phX9wNaxQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] RISC-V: hwprobe: Document unaligned vector perf key
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_155616_480562_E667C2EF 
X-CRM114-Status: GOOD (  18.77  )
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

T24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgNTo1MuKAr1BNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnQga2V5IGZvciByZXBvcnRpbmcgdGhlIHNwZWVk
IG9mIHVuYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMuCj4gVGhlIGRlc2NyaXB0aW9ucyBhcmUgdGhl
IHNhbWUgYXMgdGhlIHNjYWxhciBlcXVpdmFsZW50IHZhbHVlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4gLS0tCj4gVjEgLT4gVjI6Cj4gICAt
IE5ldyBwYXRjaAo+IFYyIC0+IFYzOgo+ICAtIFNwZWNpZnkgYWNjZXNzIHdpZHRoCj4gLS0tCj4g
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCB8IDE2ICsrKysrKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKPiBpbmRleCA3MDg1YTY5NGI4MDEuLmQxMDJiNGExNmQ1NSAxMDA2
NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiArKysgYi9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiBAQCAtMjM2LDMgKzIzNiwxOSBA
QCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4KPiAgKiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKPiAg
ICByZXByZXNlbnRzIHRoZSBzaXplIG9mIHRoZSBaaWNib3ogYmxvY2sgaW4gYnl0ZXMuCj4gKwo+
ICsqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9WRUNfTUlTQUxJR05FRF9QRVJGYDogQW4g
ZW51bSB2YWx1ZSBkZXNjcmliaW5nIHRoZQo+ICsgIHBlcmZvcm1hbmNlIG9mIG1pc2FsaWduZWQg
dmVjdG9yIGFjY2Vzc2VzIG9uIHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KPiArCj4g
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9WRUNfTUlTQUxJR05FRF9VTktOT1dOYDogVGhl
IHBlcmZvcm1hbmNlIG9mIG1pc2FsaWduZWQKPiArICAgIGFjY2Vzc2VzIGlzIHVua25vd24uCj4g
Kwo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfVkVDX01JU0FMSUdORURfU0xPV2A6IDMy
Yml0IG1pc2FsaWduZWQgYWNjZXNzZXMgYXJlIHNsb3dlcgo+ICsgICAgdGhhbiBlcXVpdmFsZW50
IGJ5dGUgYWNjZXNzZXMuICBNaXNhbGlnbmVkIGFjY2Vzc2VzIG1heSBiZSBzdXBwb3J0ZWQKCkRv
IHlvdSB0aGluayBpdCdzIHdvcnRoIHNwZWNpZnlpbmcgdGhhdCB3ZSdyZSB0YWxraW5nIGFib3V0
IGJ5dGUKYWNjZXNzZXMgdXNpbmcgdmVjdG9yIHJlZ2lzdGVycz8gSW4gb3RoZXIgd29yZHMsIGNs
YXJpZnlpbmcgdGhhdCB3ZSdyZQpub3QgY29tcGFyaW5nIG1pc2FsaWduZWQgdmVjdG9yIGxvYWRz
IHRvIGxvYWRzL3N0b3JlcyBpbnRvIHRoZSBzY2FsYXIKcmVnaXN0ZXJzLiBNYXliZSBzb21ldGhp
bmcgbGlrZToKCjMyLWJpdCBtaXNhbGlnbmVkIGFjY2Vzc2VzIHVzaW5nIHZlY3RvciByZWdpc3Rl
cnMgYXJlIHNsb3dlciB0aGFuIHRoZQplcXVpdmFsZW50IHF1YW50aXR5IG9mIGJ5dGUgYWNjZXNz
ZXMgdmlhIHZlY3RvciByZWdpc3RlcnMuIE1pc2FsaWduZWQKYWNjZXNzZXMgbWF5IC4uLgoKLUV2
YW4KCj4gKyAgICBkaXJlY3RseSBpbiBoYXJkd2FyZSwgb3IgdHJhcHBlZCBhbmQgZW11bGF0ZWQg
Ynkgc29mdHdhcmUuCj4gKwo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfVkVDX01JU0FM
SUdORURfRkFTVGA6IDMyYml0IG1pc2FsaWduZWQgYWNjZXNzZXMgYXJlIGZhc3Rlcgo+ICsgICAg
dGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuCj4gKwo+ICsgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfVkVDX01JU0FMSUdORURfVU5TVVBQT1JURURgOiBNaXNhbGlnbmVkIGFjY2Vzc2Vz
IGFyZQo+ICsgICAgbm90IHN1cHBvcnRlZCBhdCBhbGwgYW5kIHdpbGwgZ2VuZXJhdGUgYSBtaXNh
bGlnbmVkIGFkZHJlc3MgZmF1bHQuCj4gLS0KPiAyLjQ1LjIKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
