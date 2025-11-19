Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC49CF3979
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaAVYb6A9T2Dw+Aeq9VZvKaaPAfyaygIcD7+GdRNIJ8=; b=Im+jrPLsqAYHi1
	rt98hlCgyYknZ/FlCM28k6pXN0t8XkL8Fojx//F7QT+Ypiag8HT5+11fp2AUtvqGVM4Hlr/zwLcmQ
	JDu1KUmBit9tuGeEHYDI32ucLH/SWox/jKeRYXz6/YTKrSWy5JAinRltcH+tlsouGnQUqYMiwWdGq
	BcxBybf4S69cjul/MQyKqPRcJrCIS3OJzZiBsHgdx8PUkCgYMxBSVLe6MSwkF9g97mnrqGNm5FfSF
	W0lwDsvrOaLn+3fpQHul61CO1TSpHUoaTmzrCHxCXZeeXjrykCWkC8JSaGW27lXZY0ihleZdOgBtc
	VUgdIKYl5D/vbJ8eWGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlke-00000003xkz-1sMv;
	Wed, 19 Nov 2025 17:13:52 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlkc-00000003xgv-1MQw
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 17:13:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so11824568a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Nov 2025 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763572428; x=1764177228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ScLEPaDNKwNDHYN2M6HmBfbD1YaSDauJ2NXX4LmK1I=;
        b=cjaIOIdsZzoaUpDIYrJ5c5vDdGXgGN+eMP0i8h+eCheIb886RsMoShkmCfbmCDWrgM
         R5w0i3wohD7gnrxAhFq6KSATjSURqaglGUf13GnQDlfiy1S1feoOfHcspkrn2Dm3wjE1
         FIf6AZO3ojBfMeU7qA/358RBimO8lC51Pnt5NpIBo8oCuwONzZ14uHyWAdSj6WB7NAoa
         ZxlPzfrl30bGVZ6Rag8BROQcQpPqaavJBd1EQFUGtqNhGrWcOQCohymTT32CcEJuyvL8
         N48XcKnndaAPmMgtzq2a4Ok4vbmyz5onlLQIw+001wJW4uKA2EtFjkuOL5Id+o3PrwQz
         Jo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572428; x=1764177228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ScLEPaDNKwNDHYN2M6HmBfbD1YaSDauJ2NXX4LmK1I=;
        b=C7dITglxx5zntcsrqcICP4mV/SwUbSYt3ETXmuD1WcIC+1Fto8id6DFgTuKipXfAUr
         H3h+oCM11WUkqVojytoBG5l/+QD18PTj2+b1MzgNAjQwPOgv52P1AYhXPGSuVoEkgb44
         9/vb6kYtZ0M5BwfHD9UJAzQNugp6cx9v15qiPFRO4dRmJM6DTmxtUkAD1Yc98SmZb9bj
         IRntzOG3FFPC0bxITg30A7en0zOz9/w5GpjRpHqG9X9XpaTJUVHKCaeIOrRBXJvwbsL2
         Ld3Ci/of31gpfpYEa8ERGNlqBVcs1ksrw4vds0GkW7HzTil3IqD57F4nXxmwO6PWj0Ub
         8gow==
X-Gm-Message-State: AOJu0YyBwfIXV4UxFiyRF6LXMuDnw8FFsjaHwWL63vGZwnVo+egU1DHn
	XQfOdLOWMZH6vf33fS7bvHABFITRy8vNe9TgI2UZUBED+Te5GEo5FKR8ey6Tc6qwO0Mr4V8TUe6
	ux8ycMdBvrpDLHEn2IRuDlLqxMwSo1V4=
X-Gm-Gg: ASbGnctK/PXtY3WlLz6LUnqbMjg1pQme4Ox1pIAPT+DK3IlZMjpqlbeX2athLAei+M/
	7yWH4dGx0oWabn13Y51LfGFxAvPadhXQRqjqWpL0NjrGAGhQTTMnWNeswIagVwZfFl7FTRHvpej
	uyKvPmZMaiDoZEwiV7oc8P3u3K67sTVzRjoUDeiAMJXoqEeG7H00xkYxQ8jEHkAM0XuDDeGGnqi
	pls8lke1MkWviiGtHSGuFnQvlbfAGIXmFUxHpniOHnkQPJZgKvr4MP5vmALwtd7Pdneroxl9Kfw
	OsXSysxOwgCB2Q==
X-Google-Smtp-Source: AGHT+IGPqudSHkAepFQ3b+rHTQnc4FElpTzu4SX+b8Uq9wDSKvNcGP8RyB4VJ8j96k9r9CqmCjCNXNverRt/OiFLdaU=
X-Received: by 2002:a17:907:d9e:b0:b73:9792:919b with SMTP id
 a640c23a62f3a-b739792959cmr1395383666b.13.1763572427760; Wed, 19 Nov 2025
 09:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20251108194207.1257866-1-geomatsi@gmail.com> <20251108194207.1257866-2-geomatsi@gmail.com>
In-Reply-To: <20251108194207.1257866-2-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 19 Nov 2025 11:13:36 -0600
X-Gm-Features: AWmQ_bmYPTA3o-mmhZqHQ7F4r325dcAcnrVFdesuISHWwObV6P-SoMU0wqhgGqg
Message-ID: <CAFTtA3PK8kU6dsHdOT8Gj=ov9UbguSWv8+aQjtnvkx6hFWZGkg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] selftests: riscv: test ptrace vector interface
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_091350_412293_57C7E014 
X-CRM114-Status: GOOD (  23.35  )
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

T24gU2F0LCBOb3YgOCwgMjAyNSBhdCAxOjQy4oCvUE0gU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9t
YXRzaUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgdGVzdCBjYXNlIHRvIGNoZWNrIHB0cmFj
ZSBiZWhhdmlvciBpbiB0aGUgY2FzZSB3aGVuIHZlY3Rvcgo+IGV4dGVuc2lvbiBpcyBzdXBwb3J0
ZWQgYnkgdGhlIHN5c3RlbSwgYnV0IHZlY3RvciBjb250ZXh0IGlzIG5vdAo+IHlldCBlbmFibGVk
IGZvciB0aGUgdHJhY2VkIHByb2Nlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgTWF0eXVr
ZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPGFuZHli
bmFjQGdtYWlsLmNvbT4KCj4gLS0tCj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0
b3IvLmdpdGlnbm9yZSB8ICAxICsKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVj
dG9yL01ha2VmaWxlIHwgIDUgKy0KPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rv
ci92X3B0cmFjZS5jIHwgODUgKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQs
IDkwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92X3B0cmFjZS5jCj4KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yLy5naXRpZ25vcmUgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvLmdpdGlnbm9yZQo+IGluZGV4IDdk
OWM4N2NkMDY0OS4uZDIxYzAzYzNlZTBlIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L3ZlY3Rvci8uZ2l0aWdub3JlCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcmlzY3YvdmVjdG9yLy5naXRpZ25vcmUKPiBAQCAtMiwzICsyLDQgQEAgdnN0YXRlX2V4
ZWNfbm9saWJjCj4gIHZzdGF0ZV9wcmN0bAo+ICB2X2luaXR2YWwKPiAgdl9leGVjX2luaXR2YWxf
bm9saWJjCj4gK3ZfcHRyYWNlCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L3ZlY3Rvci9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3Zl
Y3Rvci9NYWtlZmlsZQo+IGluZGV4IDZmNzQ5N2Y0ZTdiMy4uYzE0YWQxMjdlN2ZiIDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci9NYWtlZmlsZQo+ICsr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci9NYWtlZmlsZQo+IEBAIC0y
LDcgKzIsNyBAQAo+ICAjIENvcHlyaWdodCAoQykgMjAyMSBBUk0gTGltaXRlZAo+ICAjIE9yaWdp
bmFsbHkgdG9vbHMvdGVzdGluZy9hcm02NC9hYmkvTWFrZWZpbGUKPgo+IC1URVNUX0dFTl9QUk9H
UyA6PSB2X2luaXR2YWwgdnN0YXRlX3ByY3RsCj4gK1RFU1RfR0VOX1BST0dTIDo9IHZfaW5pdHZh
bCB2c3RhdGVfcHJjdGwgdl9wdHJhY2UKPiAgVEVTVF9HRU5fUFJPR1NfRVhURU5ERUQgOj0gdnN0
YXRlX2V4ZWNfbm9saWJjIHZfZXhlY19pbml0dmFsX25vbGliYwo+Cj4gIGluY2x1ZGUgLi4vLi4v
bGliLm1rCj4gQEAgLTI2LDMgKzI2LDYgQEAgJChPVVRQVVQpL3ZfaW5pdHZhbDogdl9pbml0dmFs
LmMgJChPVVRQVVQpL3N5c19od3Byb2JlLm8gJChPVVRQVVQpL3ZfaGVscGVycy5vCj4gICQoT1VU
UFVUKS92X2V4ZWNfaW5pdHZhbF9ub2xpYmM6IHZfZXhlY19pbml0dmFsX25vbGliYy5jCj4gICAg
ICAgICAkKENDKSAtbm9zdGRsaWIgLXN0YXRpYyAtaW5jbHVkZSAuLi8uLi8uLi8uLi9pbmNsdWRl
L25vbGliYy9ub2xpYmMuaCBcCj4gICAgICAgICAgICAgICAgIC1XYWxsICQoQ0ZMQUdTKSAkKExE
RkxBR1MpICReIC1vICRAIC1sZ2NjCj4gKwo+ICskKE9VVFBVVCkvdl9wdHJhY2U6IHZfcHRyYWNl
LmMgJChPVVRQVVQpL3N5c19od3Byb2JlLm8gJChPVVRQVVQpL3ZfaGVscGVycy5vCj4gKyAgICAg
ICAkKENDKSAtc3RhdGljIC1vJEAgJChDRkxBR1MpICQoTERGTEFHUykgJF4KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZfcHRyYWNlLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9wdHJhY2UuYwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi42YTRiNWEyYWI0YTIKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZfcHRyYWNl
LmMKPiBAQCAtMCwwICsxLDg1IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKPiArI2luY2x1ZGUgPHN5cy9wdHJhY2UuaD4KPiArI2luY2x1ZGUgPHN5cy90eXBl
cy5oPgo+ICsjaW5jbHVkZSA8c3lzL3dhaXQuaD4KPiArI2luY2x1ZGUgPHN5cy93YWl0Lmg+Cj4g
KyNpbmNsdWRlIDxzeXMvdWlvLmg+Cj4gKyNpbmNsdWRlIDx1bmlzdGQuaD4KPiArI2luY2x1ZGUg
PGVycm5vLmg+Cj4gKwo+ICsjaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9lbGYuaD4KPiArCj4gKyNpbmNsdWRlICIuLi8uLi9rc2VsZnRlc3RfaGFybmVzcy5oIgo+
ICsjaW5jbHVkZSAidl9oZWxwZXJzLmgiCj4gKwo+ICt2b2xhdGlsZSB1bnNpZ25lZCBsb25nIGNo
bGRfbG9jazsKPiArCj4gK1RFU1QocHRyYWNlX3Zfbm90X2VuYWJsZWQpCj4gK3sKPiArICAgICAg
IHBpZF90IHBpZDsKPiArCj4gKyAgICAgICBpZiAoIWlzX3ZlY3Rvcl9zdXBwb3J0ZWQoKSkKPiAr
ICAgICAgICAgICAgICAgU0tJUChyZXR1cm4sICJWZWN0b3Igbm90IHN1cHBvcnRlZCIpOwo+ICsK
PiArICAgICAgIGNobGRfbG9jayA9IDE7Cj4gKyAgICAgICBwaWQgPSBmb3JrKCk7Cj4gKyAgICAg
ICBBU1NFUlRfTEUoMCwgcGlkKQo+ICsgICAgICAgICAgICAgICBUSF9MT0coImZvcms6ICVtIik7
Cj4gKwo+ICsgICAgICAgaWYgKHBpZCA9PSAwKSB7Cj4gKyAgICAgICAgICAgICAgIHdoaWxlIChj
aGxkX2xvY2sgPT0gMSkKPiArICAgICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoIiIg
OiA6ICJnIihjaGxkX2xvY2spIDogIm1lbW9yeSIpOwo+ICsKPiArICAgICAgICAgICAgICAgYXNt
IHZvbGF0aWxlICgiZWJyZWFrIiA6IDogOiApOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAg
ICAgICAgICAgc3RydWN0IF9fcmlzY3Zfdl9yZWdzZXRfc3RhdGUgKnJlZ3NldF9kYXRhOwo+ICsg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZsZW5iOwo+ICsgICAgICAgICAgICAgICBzaXpl
X3QgcmVnc2V0X3NpemU7Cj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBpb3ZlYyBpb3Y7Cj4gKyAg
ICAgICAgICAgICAgIGludCBzdGF0dXM7Cj4gKyAgICAgICAgICAgICAgIGludCByZXQ7Cj4gKwo+
ICsgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoImNzcnIgJVt2bGVuYl0sIHZsZW5iIiA6IFt2
bGVuYl0gIj1yIih2bGVuYikpOwo+ICsKPiArICAgICAgICAgICAgICAgQVNTRVJUX0dUKHZsZW5i
LCAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIFRIX0xPRygidmxlbmIgaXMgbm90IHZhbGlk
OiAlbHVcbiIsIHZsZW5iKTsKPiArCj4gKyAgICAgICAgICAgICAgIC8qIGF0dGFjaCAqLwo+ICsK
PiArICAgICAgICAgICAgICAgQVNTRVJUX0VRKDAsIHB0cmFjZShQVFJBQ0VfQVRUQUNILCBwaWQs
IE5VTEwsIE5VTEwpKTsKPiArICAgICAgICAgICAgICAgQVNTRVJUX0VRKHBpZCwgd2FpdHBpZChw
aWQsICZzdGF0dXMsIDApKTsKPiArICAgICAgICAgICAgICAgQVNTRVJUX1RSVUUoV0lGU1RPUFBF
RChzdGF0dXMpKTsKPiArCj4gKyAgICAgICAgICAgICAgIC8qIHVubG9jayAqLwo+ICsKPiArICAg
ICAgICAgICAgICAgQVNTRVJUX0VRKDAsIHB0cmFjZShQVFJBQ0VfUE9LRURBVEEsIHBpZCwgJmNo
bGRfbG9jaywgMCkpOwo+ICsKPiArICAgICAgICAgICAgICAgLyogcmVzdW1lIGFuZCB3YWl0IGZv
ciBlYnJlYWsgKi8KPiArCj4gKyAgICAgICAgICAgICAgIEFTU0VSVF9FUSgwLCBwdHJhY2UoUFRS
QUNFX0NPTlQsIHBpZCwgTlVMTCwgTlVMTCkpOwo+ICsgICAgICAgICAgICAgICBBU1NFUlRfRVEo
cGlkLCB3YWl0cGlkKHBpZCwgJnN0YXR1cywgMCkpOwo+ICsgICAgICAgICAgICAgICBBU1NFUlRf
VFJVRShXSUZTVE9QUEVEKHN0YXR1cykpOwo+ICsKPiArICAgICAgICAgICAgICAgLyogdHJ5IHRv
IHJlYWQgdmVjdG9yIHJlZ2lzdGVycyBmcm9tIHRoZSB0cmFjZWUgKi8KPiArCj4gKyAgICAgICAg
ICAgICAgIHJlZ3NldF9zaXplID0gc2l6ZW9mKCpyZWdzZXRfZGF0YSkgKyB2bGVuYiAqIDMyOwo+
ICsgICAgICAgICAgICAgICByZWdzZXRfZGF0YSA9IGNhbGxvYygxLCByZWdzZXRfc2l6ZSk7Cj4g
Kwo+ICsgICAgICAgICAgICAgICBpb3YuaW92X2Jhc2UgPSByZWdzZXRfZGF0YTsKPiArICAgICAg
ICAgICAgICAgaW92Lmlvdl9sZW4gPSByZWdzZXRfc2l6ZTsKPiArCj4gKyAgICAgICAgICAgICAg
IC8qIFYgZXh0ZW5zaW9uIGlzIGF2YWlsYWJsZSwgYnV0IG5vdCB5ZXQgZW5hYmxlZCBmb3IgdGhl
IHRyYWNlZSAqLwo+ICsKPiArICAgICAgICAgICAgICAgZXJybm8gPSAwOwo+ICsgICAgICAgICAg
ICAgICByZXQgPSBwdHJhY2UoUFRSQUNFX0dFVFJFR1NFVCwgcGlkLCBOVF9SSVNDVl9WRUNUT1Is
ICZpb3YpOwo+ICsgICAgICAgICAgICAgICBBU1NFUlRfRVEoRU5PREFUQSwgZXJybm8pOwo+ICsg
ICAgICAgICAgICAgICBBU1NFUlRfRVEoLTEsIHJldCk7Cj4gKwo+ICsgICAgICAgICAgICAgICAv
KiBjbGVhbnVwICovCj4gKwo+ICsgICAgICAgICAgICAgICBBU1NFUlRfRVEoMCwga2lsbChwaWQs
IFNJR0tJTEwpKTsKPiArICAgICAgIH0KPiArfQo+ICsKPiArVEVTVF9IQVJORVNTX01BSU4KPiAt
LQo+IDIuNTEuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
