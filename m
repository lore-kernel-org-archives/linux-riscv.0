Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B644EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLevY97VE76iwhN+HYdjzywvbVqdrgvK2Ors1TQPnlY=; b=ALV0jCpQJsEZJC
	9jGzTCeV0rkMPkXSj+0wIwbi0fOnKxSsrtrxFU31TLOtz4XOLEXlSbQSWdphAeVWMFHa4wapdVZpl
	/WDdOFchmp+7l87SayCeg/V1XJy64C5DF/7W6VidSbIn2S5FbBntU0ryhN1fpzEk8QCycT4J0tq6J
	OqZVzogH/6CWn2xHJ4f1P8bOyJ6t2kurCMRTFwOohIAdc+mOuCgQnTDmmSddA3ShaJ9vK4bzNQkNT
	8NQ6BFGjMXMfNYc3qmopthaFfxZPDbCds7CZBBAjTJSRkGZPhzp0bCUdZZ5zxPfa/2uQIfeGAiQpu
	cEt5gT70bLNZcVWI4GGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUti-002X6N-2W;
	Thu, 06 Jul 2023 19:44:14 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUtf-002X5m-1J
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 19:44:13 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1b060bce5b0so1057051fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 12:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688672650; x=1691264650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SGElb+Cjoak0I4zPNzDjmpmoeqnFLgwOuefnbY+DcUM=;
        b=GYbfjK/dBOzfrC3LdokX6emCTCUITzUzD4IwxQihJPxLHlNZIx7FQNvubq/lXTUwv4
         v5OZlsEUUzdw3/pgshLWaK1d4+c9YRGBkPzWp5VORq5G1UIIYY+CNSAYXzPi7Qj4Efnk
         6qOOuY//c+/1iVlLzoydR4oBi34zZDwTNNxkvfKP6vEYWjxyiaySnzn3fVYsAizhXd4a
         gZlwa+SHTIznp1aHB4o/0LDxHW80/WI0EMVJPc4wGKxVjCdoPR65mlmSGwsSWSvHUSBW
         iFuBO9sdHQyPDSC+2J8qKePdcjbEaMwcH6Nqodj29kOSAnFZcAhJ8WlTttmkrETRfFiA
         CJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688672650; x=1691264650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGElb+Cjoak0I4zPNzDjmpmoeqnFLgwOuefnbY+DcUM=;
        b=K7QzbVF9FKQZWohpr4DeVvLyEkqUscaZO1zu+lO5Nm1s6HnN4QJSqmda3zzwvLqmC7
         g6/ZvuIJZlsFG8L/ykL97EkpQ71dmzBjwROPzxZQzntqWXQnh647ij0ZR6PQUMZ+bw93
         xaMnNmpw+DzRkeyr1TeTJU8Pia4HGmmRRoHzOtKCIC22GKrN/GHHQiFQd9HgNes0T6A0
         oBiokamPEqYQJ5WjXhLr+SpeXARccykpHQ8M8mgt40/nppn1ZGRbJHoYQUQaBLb1Agti
         IBLvYb3bYOvio5ybIEIqHU3EexP28Er3rAD1bB6yRaP9G3qiXqG7odvsxm7JjKW7eAUw
         u/DA==
X-Gm-Message-State: ABy/qLZFDvjTqrGt7Lm2EAJ6fvOalWPX6n/vtf6JS4R8pCvkOcG05H4y
	qwih0cwP5Bx7K3Qy2ZGWeK3cjyI02yVUrS8Xzpk=
X-Google-Smtp-Source: APBJJlHZ0k/cH2+H+rv2it2rZ5NOkvziEyhzyL8dFDU6pYzvsoXjPCmJMZqqpsc2XlTAyPXLtP2Kzg==
X-Received: by 2002:a05:6870:40cb:b0:1b3:f8b7:55b4 with SMTP id l11-20020a05687040cb00b001b3f8b755b4mr3666684oal.35.1688672649796;
        Thu, 06 Jul 2023 12:44:09 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id nh8-20020a17090b364800b00256bbfbabcfsm150364pjb.48.2023.07.06.12.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:44:09 -0700 (PDT)
Date: Thu, 6 Jul 2023 12:44:07 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] RISC-V: Framework for vendor extensions
Message-ID: <ZKcZhz7rPd41Z2DK@ghost>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
 <20230705-thead_vendor_extensions-v1-1-ad6915349c4d@rivosinc.com>
 <5947209.lOV4Wx5bFT@basile.remlab.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5947209.lOV4Wx5bFT@basile.remlab.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_124411_463394_C2B7F6C8 
X-CRM114-Status: GOOD (  27.80  )
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

T24gVGh1LCBKdWwgMDYsIDIwMjMgYXQgMDc6Mjk6MzdQTSArMDMwMCwgUsOpbWkgRGVuaXMtQ291
cm1vbnQgd3JvdGU6Cj4gTGUgdG9yc3RhaW5hIDYuIGhlaW7DpGt1dXRhIDIwMjMsIDYuMzAuMTcg
RUVTVCBDaGFybGllIEplbmtpbnMgYSDDqWNyaXQgOgo+ID4gQ3JlYXRlIEtjb25maWcgZmlsZXMs
IE1ha2VmaWxlcywgYW5kIGZ1bmN0aW9ucyB0byBlbmFibGUgdmVuZG9ycyB0bwo+ID4gcHJvdmlk
ZSBpbmZvcm1hdGlvbiB2aWEgdGhlIHJpc2N2X2h3cHJvYmUgc3lzY2FsbCBhYm91dCB3aGljaCB2
ZW5kb3IKPiA+IGV4dGVuc2lvbnMgYXJlIGF2YWlsYWJsZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3YvS2J1aWxkICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgYXJjaC9yaXNj
di9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L0tjb25m
aWcudmVuZG9yICAgICAgICAgICAgIHwgIDMgKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od3Byb2JlLmggICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
YyAgICAgICAgIHwgNDAKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tIGFy
Y2gvcmlzY3YvdmVuZG9yX2V4dGVuc2lvbnMvTWFrZWZpbGUgfAo+ID4gIDMgKysrCj4gPiAgNiBm
aWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LYnVpbGQgYi9hcmNoL3Jpc2N2L0tidWlsZAo+ID4gaW5k
ZXggYWZhODNlMzA3YTJlLi5iZWEzODAxMGQ5ZGIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L0tidWlsZAo+ID4gKysrIGIvYXJjaC9yaXNjdi9LYnVpbGQKPiA+IEBAIC0zLDYgKzMsNyBAQAo+
ID4gIG9iai15ICs9IGtlcm5lbC8gbW0vIG5ldC8KPiA+ICBvYmotJChDT05GSUdfQlVJTFRJTl9E
VEIpICs9IGJvb3QvZHRzLwo+ID4gIG9iai15ICs9IGVycmF0YS8KPiA+ICtvYmoteSArPSB2ZW5k
b3JfZXh0ZW5zaW9ucy8KPiA+ICBvYmotJChDT05GSUdfS1ZNKSArPSBrdm0vCj4gPiAKPiA+ICBv
YmotJChDT05GSUdfQVJDSF9IQVNfS0VYRUNfUFVSR0FUT1JZKSArPSBwdXJnYXRvcnkvCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBp
bmRleCBjMTUwNWM3NzI5ZWMuLjE5NDA0ZWRlMGVlMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMjc2LDYgKzI3
Niw3IEBAIGNvbmZpZyBBU19IQVNfT1BUSU9OX0FSQ0gKPiA+IAo+ID4gIHNvdXJjZSAiYXJjaC9y
aXNjdi9LY29uZmlnLnNvY3MiCj4gPiAgc291cmNlICJhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRh
Igo+ID4gK3NvdXJjZSAiYXJjaC9yaXNjdi9LY29uZmlnLnZlbmRvciIKPiA+IAo+ID4gIG1lbnUg
IlBsYXRmb3JtIHR5cGUiCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcu
dmVuZG9yIGIvYXJjaC9yaXNjdi9LY29uZmlnLnZlbmRvcgo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjEzYWMzZTZmZWQ1Cj4gPiAtLS0gL2Rldi9udWxs
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcudmVuZG9yCj4gPiBAQCAtMCwwICsxLDMgQEAK
PiA+ICttZW51ICJWZW5kb3IgZXh0ZW5zaW9ucyBzZWxlY3Rpb24iCj4gPiArCj4gPiArZW5kbWVu
dSAjICJWZW5kb3IgZXh0ZW5zaW9ucyBzZWxlY3Rpb24iCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiA+IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d3Byb2JlLmggaW5kZXggNzg5MzZmNGZmNTEzLi5mYWRiMzhiODMyNDMgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmgKPiA+IEBAIC05LDUgKzksNiBAQAo+ID4gICNpbmNsdWRlIDx1
YXBpL2FzbS9od3Byb2JlLmg+Cj4gPiAKPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tF
WSA1Cj4gPiArI2RlZmluZSBSSVNDVl9IV1BST0JFX1ZFTkRPUl9FWFRFTlNJT05fU1BBQ0UgKFVM
KDEpPDw2MykKPiAKPiBJc24ndCB0aGlzIFVCIG9uIDMyLWJpdCBSSVNDLVYgPwpIbW0sIHllYWgg
aXQgd291bGQgYmUsIGJ1dCB0aGUgaHdwcm9iZSBzeXNjYWxsIGlzIGJhc2VkIG9uIGEgNjQgYml0
IGtleQp1c2luZyB0aGUgX19zNjQgdHlwZS4gVGhlcmUgY291bGQgYmUgYW4gYWx0ZXJuYXRpdmUg
dmVuZG9yIHNwYWNlIGF0IHRoZQp0b3Agb2YgMzItYml0cyBmb3IgdGhvc2UgbWFjaGluZXMuCj4g
Cj4gPiAKPiA+ICAjZW5kaWYKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4gPiBpbmRleCAyNmVmNTUy
NmJmYjQuLjIzNTFhNWY3YjhiMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4gQEAg
LTE4OCw5ICsxODgsMzUgQEAgc3RhdGljIHU2NCBod3Byb2JlX21pc2FsaWduZWQoY29uc3Qgc3Ry
dWN0IGNwdW1hc2sKPiA+ICpjcHVzKSByZXR1cm4gcGVyZjsKPiA+ICB9Cj4gPiAKPiA+ICtzdGF0
aWMgaW50IGh3cHJvYmVfdmVuZG9yKF9fdTY0IG12ZW5kb3JpZCwgc3RydWN0IHJpc2N2X2h3cHJv
YmUgKnBhaXIsCj4gPiArCQkJIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzKQo+ID4gK3sKPiA+
ICsJc3dpdGNoIChtdmVuZG9yaWQpIHsKPiA+ICsJZGVmYXVsdDoKPiA+ICsJCXJldHVybiAtMTsK
PiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIHZv
aWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ICAJCQkg
ICAgIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzKQo+ID4gIHsKPiA+ICsJaW50IGVycjsKPiA+
ICsKPiA+ICsJaWYgKCgodW5zaWduZWQgbG9uZykgcGFpci0+a2V5KSA+PSAKPiBSSVNDVl9IV1BS
T0JFX1ZFTkRPUl9FWFRFTlNJT05fU1BBQ0UpIHsKPiA+ICsJCXN0cnVjdCByaXNjdl9od3Byb2Jl
IG12ZW5kb3JpZCA9IHsKPiA+ICsJCQkua2V5ID0gUklTQ1ZfSFdQUk9CRV9LRVlfTVZFTkRPUklE
LAo+ID4gKwkJCS52YWx1ZSA9IDAKPiA+ICsJCX07Cj4gPiArCj4gPiArCQlod3Byb2JlX2FyY2hf
aWQoJm12ZW5kb3JpZCwgY3B1cyk7Cj4gPiArCQlpZiAobXZlbmRvcmlkLnZhbHVlICE9IC0xVUxM
KQo+ID4gKwkJCWVyciA9IGh3cHJvYmVfdmVuZG9yKG12ZW5kb3JpZC52YWx1ZSwgcGFpciwgCj4g
Y3B1cyk7Cj4gPiArCQllbHNlCj4gPiArCQkJZXJyID0gLTE7Cj4gPiArCX0KPiA+ICsKPiA+ICAJ
c3dpdGNoIChwYWlyLT5rZXkpIHsKPiA+ICAJY2FzZSBSSVNDVl9IV1BST0JFX0tFWV9NVkVORE9S
SUQ6Cj4gPiAgCWNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfTUFSQ0hJRDoKPiA+IEBAIC0yMTcsMTMg
KzI0MywyMSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3By
b2JlCj4gPiAqcGFpciwKPiA+IAo+ID4gIAkvKgo+ID4gIAkgKiBGb3IgZm9yd2FyZCBjb21wYXRp
YmlsaXR5LCB1bmtub3duIGtleXMgZG9uJ3QgZmFpbCB0aGUgd2hvbGUKPiA+IC0JICogY2FsbCwg
YnV0IGdldCB0aGVpciBlbGVtZW50IGtleSBzZXQgdG8gLTEgYW5kIHZhbHVlIHNldCB0byAwCj4g
PiAtCSAqIGluZGljYXRpbmcgdGhleSdyZSB1bnJlY29nbml6ZWQuCj4gPiArCSAqIGNhbGwsIGlu
c3RlYWQgYW4gZXJyb3IgaXMgcmFpc2VkIHRvIGluZGljYXRlIHRoZSBlbGVtZW50IGtleQo+ID4g
KwkgKiBpcyB1bnJlY29nbml6ZWQuCj4gPiAgCSAqLwo+ID4gIAlkZWZhdWx0Ogo+ID4gKwkJZXJy
ID0gLTE7Cj4gPiArCQlicmVhazsKPiA+ICsJfQo+ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiBTZXR0
aW5nIHRoZSBlbGVtZW50IGtleSB0byAtMSBhbmQgdmFsdWUgdG8gMCBpbmRpY2F0ZXMgdGhhdAo+
ID4gKwkgKiBod3Byb2JlIHdhcyB1bmFibGUgdG8gZmluZCB0aGUgcmVxdWVzdGVkIGtleS4KPiA+
ICsJICovCj4gPiArCWlmIChlcnIgIT0gMCkgewo+ID4gIAkJcGFpci0+a2V5ID0gLTE7Cj4gPiAg
CQlwYWlyLT52YWx1ZSA9IDA7Cj4gPiAtCQlicmVhazsKPiA+ICAJfQo+ID4gIH0KPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvdmVuZG9yX2V4dGVuc2lvbnMvTWFrZWZpbGUKPiA+IGIv
YXJjaC9yaXNjdi92ZW5kb3JfZXh0ZW5zaW9ucy9NYWtlZmlsZSBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lODE1ODk1ZTkzNzIKPiA+IC0tLSAvZGV2L251bGwK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvdmVuZG9yX2V4dGVuc2lvbnMvTWFrZWZpbGUKPiA+IEBAIC0w
LDAgKzEsMyBAQAo+ID4gK2lmZGVmIENPTkZJR19SRUxPQ0FUQUJMRQo+ID4gK0tCVUlMRF9DRkxB
R1MgKz0gLWZuby1waWUKPiA+ICtlbmRpZgo+IAo+IAo+IC0tIAo+IOODrOODn+ODu+ODh+ODiy3j
gq/jg7zjg6vjg6Ljg7MKPiBodHRwOi8vd3d3LnJlbWxhYi5uZXQvCj4gCj4gCj4gCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
