Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D58C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEcKnKxuCCYGj2ZsIbLLcJh7ha9IxSwDlnCl5DxRyyE=; b=nAGNmtbV4S8Id6
	UD92O3adU1djkJF8UxuEhozLc56V6mL5uiD5/ZEGmUCDYQZcrX1nt97Aw1Afytc/Mibz1qWZ67TIz
	kjsaibhz9aeZN6+AXmwJVmHJD+IYU9hH9eHOB5AcNaK3b+dzZWsIxvHTXRE+r5SeMEQOypvMHWesC
	jMmGagKZs0PMe+CsBztibTOmiWv3UOtLT2u5dZbI/x09nQ/FvtFY8Y9heeCohSS7pkZwzW/VYlaKY
	uJMXvwtZGs5p+kwmAUY5Pa/PnbwO/plLsa9i1sAmjbK/A+EetjXu6lGXmt5EH19qi51Yryxo707B8
	35U5oFmlLjft1kmBUZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkIe8-000000097dK-2t7T;
	Wed, 13 Mar 2024 07:03:28 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkIe5-000000097cm-3x8N
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 07:03:27 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-609eb87a847so4757837b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710313404; x=1710918204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFWOcVjJhlCMu7ivMUq4weKGRS0HwvtE+hAXKTxSvTw=;
        b=VO7unQxkWvDbzs2/nOou62HHwtyo7AJEVTG8xc8BnT+Uzp4lZyv7gt3ohIrmeTK3bs
         iN7D7XRNbgHKU/YwrYULmk6sAAM1SdW63TpLGWS6pOIw0WtCqVY5/rCcSWB40Pi3uCQ8
         EF2sj3CM4e7j5hecGHQAbs1N/TfDZdSMnvATkUGCp76kfMpmbb6oQUyAke1bpEOCRpGb
         XWygNL3icgovVx1LaQabzN0Qsv/BnsA4BHSLg1gu7mSh8GIfxvk0z/lIf8A0KGlj8V0x
         znH4w8xWffw4T2zvV+HXXHrOCSH/Vra6ernJvGJ68yxYjoWybsLLTpGSS+EOWYWItdOi
         xRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710313404; x=1710918204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFWOcVjJhlCMu7ivMUq4weKGRS0HwvtE+hAXKTxSvTw=;
        b=OUK4/S88Chff8U00VUaRgApBXRCx3BlGRTKu/Qtytxvd/KSgMzzUo6NPaSU5RnQqGO
         mWeQZv4eVybuCV8GUoFzyyfhnrhikmAg9eo/w5mrihSVysaQ5OBgWCL080zYKTCbQIsR
         q4yjvc5wOEF5Q7w4M63osoZ7s0KgVhpuR+9wJctMuD68jMVP4nMJSug+syd8+Px2XFKX
         kNMdzfpGAaxfn8nZMbS88KjUMbzAUa935RWu5tToAlma3UfltlGAeVU6k8FLn7TlAUsV
         eSPeCxnLmbAVSb+/smdW2/keLwq0TEGmusFFwwrVT/QugnQfBA8PpXJm+Q1xKOrTcm8q
         SPkw==
X-Gm-Message-State: AOJu0YzP/sAnmEAZ8nuyf8QhizyvkM3hEDEwUi+dH/GD0rwf3rB3d1S8
	WdRjnigYm9CuRViBnPIPqfB1taOszCbeub6D7za1l1dAb5W+jmfeXvnCDyTQ50D8ejRCl3gxOHl
	/RC/FaVwitMymlk6xpZryNC788pblYU+EpV2W4g==
X-Google-Smtp-Source: AGHT+IEWg6J8SSbgaMQdOgmA6O1JPwqeNCqjoSPRLk1+Ewwyynuq5WwP8mrlTHkLBtcAaPkXvYjYuBZ1K/nKoo6DQjc=
X-Received: by 2002:a0d:d908:0:b0:60a:2540:424 with SMTP id
 b8-20020a0dd908000000b0060a25400424mr1026041ywe.23.1710313403398; Wed, 13 Mar
 2024 00:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240312123627.9285-1-andy.chiu@sifive.com> <20240312123627.9285-5-andy.chiu@sifive.com>
 <ca9e6689-4d7e-4428-8b2e-e732923d1001@sifive.com>
In-Reply-To: <ca9e6689-4d7e-4428-8b2e-e732923d1001@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 13 Mar 2024 15:03:12 +0800
Message-ID: <CABgGipXfGT2trehqGHTiCtN6ux+V_2Q3x_1BzNcf-FM2guCu6w@mail.gmail.com>
Subject: Re: [v1, 4/6] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa detection
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Yangyu Chen <cyy@cyyself.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_000326_079169_C051F775 
X-CRM114-Status: GOOD (  20.13  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTI6MDHigK9QTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbmR5LAo+Cj4gT24gMjAyNC0wMy0x
MiA3OjM2IEFNLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiBNdWx0aXBsZSBWZWN0b3Igc3ViZXh0ZW5z
aW9ucyBhcmUgYWRkZWQuIEFsc28sIHRoZSBwYXRjaCB0YWtlcyBjYXJlIG9mCj4gPiB0aGUgZGVw
ZW5kZW5jaWVzIG9mIFZlY3RvciBzdWJleHRlbnNpb25zIGJ5IG1hY3JvIGV4cGFuc2lvbnMuIFNv
LCBpZgo+ID4gc29tZSAiZW1iZWRkZWQiIHBsYXRmb3JtIG9ubHkgcmVwb3J0cyAienZlNjRmIiBv
biB0aGUgSVNBIHN0cmluZywgdGhlCj4gPiBwYXJzZXIgaXMgYWJsZSB0byBleHBhbmQgaXQgdG8g
enZlMzJ4IHp2ZTMyZiB6dmU2NHggYW5kIHp2ZTY0Zi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oIHwgIDUgKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaAo+ID4gaW5kZXggNTM0MGY4MTg3NDZiLi4yNGVmZWE0NGYxYWIgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gQEAgLTgwLDYgKzgwLDExIEBACj4gPiAg
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGQSAgICAgICAgICAgIDcxCj4gPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pUU08gICAgICAgICAgIDcyCj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pB
Q0FTICAgICAgICAgIDczCj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMyWCAgICAgICAg
IDc0Cj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMyRiAgICAgICAgIDc1Cj4gPiArI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0WCAgICAgICAgIDc2Cj4gPiArI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1pWRTY0RiAgICAgICAgIDc3Cj4gPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0
RCAgICAgICAgIDc4Cj4gPgo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9NQVggICAgICAgICAg
ICAxMjgKPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfSU5WQUxJRCAgICAgICAgICAgICAgICBV
MzJfTUFYCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBpbmRleCA4OTg2Y2ViNTgxODguLjNh
YTBkZjNmM2I0MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMjAxLDYg
KzIwMSw0MCBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2YmJfZXh0c1tdID0g
ewo+ID4gICAgICAgUklTQ1ZfSVNBX0VYVF9aVktCCj4gPiAgfTsKPiA+Cj4gPiArI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNUICAgICAgXAo+ID4gKyAgICAgUklTQ1ZfSVNB
X0VYVF9aVkUzMkYsICAgICAgICAgICBcCj4gPiArICAgICBSSVNDVl9JU0FfRVhUX1pWRTMyWCwK
PiA+ICsKPiA+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QgICAgICBc
Cj4gPiArICAgICBSSVNDVl9JU0FfRVhUX1pWRTY0RiwgICAgICAgICAgIFwKPiA+ICsgICAgIFJJ
U0NWX0lTQV9FWFRfWlZFNjRYLCAgICAgICAgICAgXAo+ID4gKyAgICAgUklTQ1ZfSVNBX0VYVF9a
VkUzMkZfSU1QTFlfTElTVAo+ID4gKwo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NERf
SU1QTFlfTElTVCAgICAgIFwKPiA+ICsgICAgIFJJU0NWX0lTQV9FWFRfWlZFNjRELCAgICAgICAg
ICAgXAo+ID4gKyAgICAgUklTQ1ZfSVNBX0VYVF9aVkU2NEZfSU1QTFlfTElTVAo+ID4gKwo+ID4g
K3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlMzJmX2V4dHNbXSA9IHsKPiA+ICsg
ICAgIFJJU0NWX0lTQV9FWFRfWlZFMzJGX0lNUExZX0xJU1QKPiA+ICt9Owo+ID4gKwo+ID4gK3N0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjRmX2V4dHNbXSA9IHsKPiA+ICsgICAg
IFJJU0NWX0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRp
YyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjRkX2V4dHNbXSA9IHsKPiA+ICsgICAgIFJJ
U0NWX0lTQV9FWFRfWlZFNjREX0lNUExZX0xJU1QKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjR4X2V4dHNbXSA9IHsKPiA+ICsgICAgIFJJU0NW
X0lTQV9FWFRfWlZFMzJYLAo+ID4gKyAgICAgUklTQ1ZfSVNBX0VYVF9aVkU2NFgKPiA+ICt9Owo+
ID4gKwo+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3Zfdl9leHRzW10gPSB7Cj4g
PiArICAgICBSSVNDVl9JU0FfRVhUX1pWRTY0RF9JTVBMWV9MSVNUCj4gPiArfTsKPiA+ICsKPiA+
ICAvKgo+ID4gICAqIFRoZSBjYW5vbmljYWwgb3JkZXIgb2YgSVNBIGV4dGVuc2lvbiBuYW1lcyBp
biB0aGUgSVNBIHN0cmluZyBpcyBkZWZpbmVkIGluCj4gPiAgICogY2hhcHRlciAyNyBvZiB0aGUg
dW5wcml2aWxlZ2VkIHNwZWNpZmljYXRpb24uCj4gPiBAQCAtMjQ4LDcgKzI4Miw3IEBAIGNvbnN0
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ID4gICAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoZCwgUklTQ1ZfSVNBX0VYVF9kKSwKPiA+ICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHEsIFJJU0NWX0lTQV9FWFRfcSksCj4gPiAgICAgICBfX1JJU0NWX0lT
QV9FWFRfREFUQShjLCBSSVNDVl9JU0FfRVhUX2MpLAo+ID4gLSAgICAgX19SSVNDVl9JU0FfRVhU
X0RBVEEodiwgUklTQ1ZfSVNBX0VYVF92KSwKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBF
UlNFVCh2LCBSSVNDVl9JU0FfRVhUX3YsIHJpc2N2X3ZfZXh0cyksCj4KPiBZb3UgY2FuIHVzZSBy
aXNjdl96dmU2NGRfZXh0cyBoZXJlIChvciAjZGVmaW5lIHJpc2N2X3ZfZXh0cyByaXNjdl96dmU2
NGRfZXh0cykKPiB0byBhdm9pZCBhbGxvY2F0aW5nIGEgZHVwbGljYXRlIHN1YmV4dGVuc2lvbiBs
aXN0LgoKWWVzLCBJIHNob3VsZCBkbyB0aGF0LCB3aWxsIGNoYW5nZSB0aGF0IGluIHYyCgo+Cj4g
UmVnYXJkcywKPiBTYW11ZWwKPgo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoaCwgUklT
Q1ZfSVNBX0VYVF9oKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppY2JvbSwgUklT
Q1ZfSVNBX0VYVF9aSUNCT00pLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljYm96
LCBSSVNDVl9JU0FfRVhUX1pJQ0JPWiksCj4gPiBAQCAtMjgzLDYgKzMxNywxMSBAQCBjb25zdCBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiA+ICAgICAgIF9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp0c28sIFJJU0NWX0lTQV9FWFRfWlRTTyksCj4gPiAgICAgICBf
X1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCLCByaXNjdl96
dmJiX2V4dHMpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNB
X0VYVF9aVkJDKSwKPiA+ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmUzMmYsIFJJ
U0NWX0lTQV9FWFRfWlZFMzJGLCByaXNjdl96dmUzMmZfZXh0cyksCj4gPiArICAgICBfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmUzMngsIFJJU0NWX0lTQV9FWFRfWlZFMzJYKSwKPiA+ICsgICAgIF9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NGYsIFJJU0NWX0lTQV9FWFRfWlZFNjRGLCByaXNj
dl96dmU2NGZfZXh0cyksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRk
LCBSSVNDVl9JU0FfRVhUX1pWRTY0RCwgcmlzY3ZfenZlNjRkX2V4dHMpLAo+ID4gKyAgICAgX19S
SVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2ZTY0eCwgUklTQ1ZfSVNBX0VYVF9aVkU2NFgsIHJpc2N2
X3p2ZTY0eF9leHRzKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2ZmgsIFJJU0NW
X0lTQV9FWFRfWlZGSCksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZobWluLCBS
SVNDVl9JU0FfRVhUX1pWRkhNSU4pLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZr
YiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwKPgoKVGhhbmtzIQpBbmR5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
