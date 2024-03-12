Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1D9C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8JxN4VEcT63hrKDTwJQLJHD8qdCL+8pbmdSgY4H5WY=; b=UyvNZHuffRCTpo
	u+O5OayfKiGGNXWEbkOJeP/kbh+AK+0wmLpBQTnYlgPjCE1XVbUuup9+bnkOZ9xdEfL0EJ4j1DPh6
	iHDnRiJLVj7ezP6VV6oYLnrjIADEchyJrm+C6z3gLNqWtgtIzHYxxHpJWJ5ruKiUlTbxWRKJTENDb
	lUvzKFhxcWxkP0L8qun+DtC0gGUih3at5DL2iqmw5Ig62RJwYTR/yrjlkrnfyIl9PLPsCoWzMQcie
	R1ouwUEe63g5wx6U86QZCRCJX3xVn4lzwDOOp2rvaZpZUCueijrsAYIuejXss3GWnHIaExddoTkR1
	1+dLrkYtRtUHWPAFrd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1b3-00000005p0j-2dSo;
	Tue, 12 Mar 2024 12:51:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1b0-00000005p03-0oE4
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:51:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33e88305e7aso872616f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710247864; x=1710852664; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XcneeTlQqVx80XsDcE8uzDGryRXULYiDtuCi92je1w=;
        b=Idix75noJ7Bgar4nov4H1X0X+aPF2R2sxnxmM+XkvgSaU9iFBQFaNBgQLPeGoXTujw
         7tJekpS42Fh2mCq18dUcqycybpTdNGUIS7wkMQD2a1oNgtnoaBWPt0IKNKrU/BsxMjGN
         y0DqayrUyZvrACHmGxeScvALOl2GFc6wtdVz2XD9mwexqzw+6udEBPPzE05UET7S3PVn
         4c6zMzh4nLmhTXqGlxxfmdpbzMdsC3EIYZyr7pl0HZCWjCwYyItu+VbR0pTOZwVrD8SS
         o5FtWnd74e2Bfj4ybi76DV/2SXiLOEvZH1dMV6ho2g7m9//r7VxlmMgLKU0X5TbQQykv
         M04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247864; x=1710852664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XcneeTlQqVx80XsDcE8uzDGryRXULYiDtuCi92je1w=;
        b=XVC64d4Xu8VApOkvQPeVo5RvCd0td3SoZxq0PEeM2yOyBWJ+W7ajVpgoYrJlgZEZPj
         e4zZ04VaTk5iqdpIYu64I0HjZ0HW/KNvUlC+WoNA2k5Vi48vWPXxhKQMuLXMkaa4CBsy
         vkpzHpklt/LzcZwppQ3K98pPdw+mY5q2iwz+ebJju/iIGoPxhXqJDPi/EpFJN8KfuUwp
         bF60E5Hts+iIq5C2BE4GkvQ82D1xm4XWitopcRIyFnAMZKPzEvShcCLTQIow62N9WccW
         FOEiM49Sr3e60cXkiemW1Ftk9lk2h+qGmlgirWkOCX4UWsiruQUpJyMH6eA5Wqty3YrF
         /aQA==
X-Forwarded-Encrypted: i=1; AJvYcCVf7H2rPaW2xGrvlUfCgmxiCf0iymdm3lQrCutxTJzoA+pmYpgaHuRfDls5uqE+Hw/3GLp4GquSlVlfDCJYd66c277IgrR5D1IXCjiHbRQe
X-Gm-Message-State: AOJu0Yy6KCcFkBLL2o6gxHuDZvSE93z0KidOeebDpRQu+CUwC8tYREwH
	pa0WEvuI6bT+qi5QTAjSIpVF+z9XskqOEKzzGDlpFxkhBrxYn0b1SOHfydME5rE=
X-Google-Smtp-Source: AGHT+IGQPKL0D2mr6udRHKipNoY/hSVFVdvCoHjQdr32GAnEEhbARpkvgo5zUSbVSq7mnkqJl9oPBw==
X-Received: by 2002:a05:600c:4f47:b0:413:1bb8:b384 with SMTP id m7-20020a05600c4f4700b004131bb8b384mr7685074wmq.3.1710247864221;
        Tue, 12 Mar 2024 05:51:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e160:2f4e:a2e4:b720? ([2a01:e0a:999:a3a0:e160:2f4e:a2e4:b720])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0041312e8ef2bsm12467684wmo.26.2024.03.12.05.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:51:03 -0700 (PDT)
Message-ID: <9b694179-6c69-4a82-93d2-d721193282ae@rivosinc.com>
Date: Tue, 12 Mar 2024 13:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1, 4/6] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-5-andy.chiu@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240312123627.9285-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_055106_255665_AE6829D2 
X-CRM114-Status: GOOD (  18.90  )
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

CgpPbiAxMi8wMy8yMDI0IDEzOjM2LCBBbmR5IENoaXUgd3JvdGU6Cj4gTXVsdGlwbGUgVmVjdG9y
IHN1YmV4dGVuc2lvbnMgYXJlIGFkZGVkLiBBbHNvLCB0aGUgcGF0Y2ggdGFrZXMgY2FyZSBvZgo+
IHRoZSBkZXBlbmRlbmNpZXMgb2YgVmVjdG9yIHN1YmV4dGVuc2lvbnMgYnkgbWFjcm8gZXhwYW5z
aW9ucy4gU28sIGlmCj4gc29tZSAiZW1iZWRkZWQiIHBsYXRmb3JtIG9ubHkgcmVwb3J0cyAienZl
NjRmIiBvbiB0aGUgSVNBIHN0cmluZywgdGhlCj4gcGFyc2VyIGlzIGFibGUgdG8gZXhwYW5kIGl0
IHRvIHp2ZTMyeCB6dmUzMmYgenZlNjR4IGFuZCB6dmU2NGYuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oIHwgIDUgKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oCj4gaW5kZXggNTM0MGY4MTg3NDZiLi4yNGVmZWE0NGYxYWIgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oCj4gQEAgLTgwLDYgKzgwLDExIEBACj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aRkEJCTcxCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVFNPCQk3Mgo+ICAjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWkFDQVMJCTczCj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkUzMlgJCTc0
Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkUzMkYJCTc1Cj4gKyNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aVkU2NFgJCTc2Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NEYJCTc3Cj4gKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NEQJCTc4Cj4gIAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfTUFYCQkxMjgKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX0lOVkFMSUQJCVUzMl9NQVgKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggODk4NmNlYjU4MTg4Li4zYWEwZGYzZjNiNDEgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTIwMSw2ICsyMDEsNDAgQEAgc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByaXNjdl96dmJiX2V4dHNbXSA9IHsKPiAgCVJJU0NWX0lTQV9FWFRf
WlZLQgo+ICB9Owo+ICAKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNU
CVwKPiArCVJJU0NWX0lTQV9FWFRfWlZFMzJGLAkJXAo+ICsJUklTQ1ZfSVNBX0VYVF9aVkUzMlgs
Cj4gKwo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QJXAo+ICsJUklT
Q1ZfSVNBX0VYVF9aVkU2NEYsCQlcCj4gKwlSSVNDVl9JU0FfRVhUX1pWRTY0WCwJCVwKPiArCVJJ
U0NWX0lTQV9FWFRfWlZFMzJGX0lNUExZX0xJU1QKPiArCj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aVkU2NERfSU1QTFlfTElTVAlcCj4gKwlSSVNDVl9JU0FfRVhUX1pWRTY0RCwJCVwKPiArCVJJ
U0NWX0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QKPiArCj4gK3N0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgcmlzY3ZfenZlMzJmX2V4dHNbXSA9IHsKPiArCVJJU0NWX0lTQV9FWFRfWlZFMzJGX0lN
UExZX0xJU1QKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZl
NjRmX2V4dHNbXSA9IHsKPiArCVJJU0NWX0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QKPiArfTsK
PiArCj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjRkX2V4dHNbXSA9IHsK
PiArCVJJU0NWX0lTQV9FWFRfWlZFNjREX0lNUExZX0xJU1QKPiArfTsKPiArCj4gK3N0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjR4X2V4dHNbXSA9IHsKPiArCVJJU0NWX0lTQV9F
WFRfWlZFMzJYLAo+ICsJUklTQ1ZfSVNBX0VYVF9aVkU2NFgKPiArfTsKPiArCj4gK3N0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgcmlzY3Zfdl9leHRzW10gPSB7Cj4gKwlSSVNDVl9JU0FfRVhUX1pW
RTY0RF9JTVBMWV9MSVNUCj4gK307Cj4gKwo+ICAvKgo+ICAgKiBUaGUgY2Fub25pY2FsIG9yZGVy
IG9mIElTQSBleHRlbnNpb24gbmFtZXMgaW4gdGhlIElTQSBzdHJpbmcgaXMgZGVmaW5lZCBpbgo+
ICAgKiBjaGFwdGVyIDI3IG9mIHRoZSB1bnByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbi4KPiBAQCAt
MjQ4LDcgKzI4Miw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNh
X2V4dFtdID0gewo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoZCwgUklTQ1ZfSVNBX0VYVF9kKSwK
PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHEsIFJJU0NWX0lTQV9FWFRfcSksCj4gIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShjLCBSSVNDVl9JU0FfRVhUX2MpLAo+IC0JX19SSVNDVl9JU0FfRVhUX0RB
VEEodiwgUklTQ1ZfSVNBX0VYVF92KSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh2LCBS
SVNDVl9JU0FfRVhUX3YsIHJpc2N2X3ZfZXh0cyksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSho
LCBSSVNDVl9JU0FfRVhUX2gpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemljYm9tLCBSSVND
Vl9JU0FfRVhUX1pJQ0JPTSksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNib3osIFJJU0NW
X0lTQV9FWFRfWklDQk9aKSwKPiBAQCAtMjgzLDYgKzMxNywxMSBAQCBjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiAgCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHp0c28sIFJJU0NWX0lTQV9FWFRfWlRTTyksCj4gIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJT
RVQoenZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCLCByaXNjdl96dmJiX2V4dHMpLAo+ICAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJDKSwKPiArCV9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVCh6dmUzMmYsIFJJU0NWX0lTQV9FWFRfWlZFMzJGLCByaXNjdl96dmUzMmZf
ZXh0cyksCgpIaSBBbmR5LAoKTml0OiBTaW5jZSBSSVNDVl9JU0FfRVhUX1pWRTMyRiBpcyBhbHJl
YWR5IHVzZWQgaGVyZSBhcyAuaWQsIHlvdSBkb24ndApuZWVkIHRvIGluc2VydCBpdCBpbiB0aGUg
cmlzY3ZfenZlMzJmX2V4dHMgYXJyYXkuIEl0IHdvbid0IGh1cnQgYnV0IHRoZQpleGlzdGluZyBl
eHRlbnNpb25zIHRoYXQgdXNlcyB0aGUgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKCkgbWFjcm8g
ZG9uJ3QKZG8gdGhhdC4KCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmUzMngsIFJJU0NWX0lT
QV9FWFRfWlZFMzJYKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NGYsIFJJU0NW
X0lTQV9FWFRfWlZFNjRGLCByaXNjdl96dmU2NGZfZXh0cyksCj4gKwlfX1JJU0NWX0lTQV9FWFRf
U1VQRVJTRVQoenZlNjRkLCBSSVNDVl9JU0FfRVhUX1pWRTY0RCwgcmlzY3ZfenZlNjRkX2V4dHMp
LAo+ICsJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2ZTY0eCwgUklTQ1ZfSVNBX0VYVF9aVkU2
NFgsIHJpc2N2X3p2ZTY0eF9leHRzKSwKCkRpdHRvIGZvciB0aGUgbGFzdCAzIF9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVCgpLgoKQXBhcnQgZnJvbSB0aGF0LCBpdCBsb29rcyBnb29kICEKClRoYW5r
cywKCkNsw6ltZW50Cgo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaCwgUklTQ1ZfSVNBX0VY
VF9aVkZIKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2ZmhtaW4sIFJJU0NWX0lTQV9FWFRf
WlZGSE1JTiksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pW
S0IpLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
