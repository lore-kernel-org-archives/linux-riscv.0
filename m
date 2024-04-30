Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A3CC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbvG7efNF/FvI6juhV+30kIXxx2yMp8albFlsHD/smg=; b=XODTfH+/pAxWk/
	GMDid1S5xY4F9N0GCpsWsnS0td8Tztgj8Ef9+s1XDk5IHGkUCe9oOjwV57eFhSPaSC8GdnOYCNV71
	69tFG3GHhLMQd+ZOOn45qVSXl5r0kURUtISl4iILjN03pA4N+Z2z4vNFAytNyoEJuPalT3tQGxCGT
	cuNxIhz/pgIy6oa6vy0FU5hLvDP1C5AY8hettl+g05eBJuZz6RN9+SpHOX367iScZDCMLJkDaqByH
	W4/vOcWaXHl4C7JlAijoRW14VJZckZ8yAmqIG0LFDL3ev/B8feS6MhFE5zatPXEPL9cCMe71jvZi6
	U20mXqP+PHr93Mxn8fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hsm-00000005Q3i-3A42;
	Tue, 30 Apr 2024 07:26:32 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hsj-00000005Q2J-3Ftj
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 07:26:31 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2db239711ebso13031411fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714461987; x=1715066787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvyI3HdmRjoW+CLhdf/TdUb0HyFLPhU7rZbG7Bu9wO4=;
        b=AzL/tg07b6Q9gCYl9A1RfCejcoI/FBXMSbtUBFbx8EpZ+BR3zj7eLDLbDC+ViO2wZQ
         saKZT0u6hrHb5Y6yPfQ6M6BZPwGwhiasR6L/qrfZEiOqJuNxP+ugi5AlvtvRcBf9X9H4
         lfOzt0Kxk0whPR2ONeRDaUGa2NT2FVi2Oo3CQ98e/l9XA9ZL9u/QHW9EsUfN5n6qAHJb
         UuIaPQPqdBV3PU9Cp8S8vY6E9D/fX+1ZeBbU6Tmvstj9krXJ02oPQrNKqbL6dlZckJDV
         zChofQHaOgoGEgQJjirG4mUld8p2JUkibRlok25PLCyXWjC9yZAXDP0a3bMroRgmc96k
         RtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714461987; x=1715066787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvyI3HdmRjoW+CLhdf/TdUb0HyFLPhU7rZbG7Bu9wO4=;
        b=ncRPBFAQPnuornjokU+KHTPj51KAKLubwYXH7HQ4mIOUW9nQQu0HLpCdcydpvMii/i
         48C+aLOkzuOYZDq1e2KY/M3EGwY0eqVYC7JDZ7BykEiZoTXhdpBlisjO4REYA51kdTzs
         /tizli7bwIBFttn7A1H45V7A6+a5rm5RUcZEO02DFzoeJLkY7qydKfjJMHbZrgWTMfJL
         a/7phVUVLYEWgv7YrXzX7aOdI+5/TgmVyxkZOm3IByBvRUm3k/JzUS7BApKO6n/Kh6pL
         nOyi9K2QPS4d0gVjudALuhqFmsC+lIB8jlpzTqFBd33o7PxLH5k0F6vXnOB7McyujGSR
         36yA==
X-Forwarded-Encrypted: i=1; AJvYcCWFXeM0bIGqsTVgENpcQ8FNkfCLobDeqeTfboAm8HwE+eYyVAjw5DWDANhd8jKSWpMLnjpZ3XP3SIHnWa14hs0kkComCvsunD8aO6kf7Zbk
X-Gm-Message-State: AOJu0YweuyzcnIdckdZL5HnPx+jw2uHuZJrfdA+NdQnqBKdUDOJMDE/J
	8vrQuRUpMQ51nFdhWCXr/GMFkE9Juo9ji2LHGkZNXz6m3m5sJdVlZVPQ5bYbCbc=
X-Google-Smtp-Source: AGHT+IF2/6JmkhuEesT0rXrPHpRH7kD8BY37pMN1aCWhBwhe5bjgiO3RpG2IZ9ZZSdnOrjhKRv7i/A==
X-Received: by 2002:a2e:9254:0:b0:2dd:374d:724e with SMTP id v20-20020a2e9254000000b002dd374d724emr7481828ljg.1.1714461987258;
        Tue, 30 Apr 2024 00:26:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:c21b:67fd:90ab:9053? ([2a01:e0a:999:a3a0:c21b:67fd:90ab:9053])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041bff91ea43sm9651380wmq.37.2024.04.30.00.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 00:26:26 -0700 (PDT)
Message-ID: <99d3eabc-0289-4ace-90a8-ad02dbffd6d2@rivosinc.com>
Date: Tue, 30 Apr 2024 09:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] riscv: kvm: add support for FWFT SBI extension
To: Deepak Gupta <debug@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-2-cleger@rivosinc.com>
 <Ziw8c0X0K3mXjJWK@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Ziw8c0X0K3mXjJWK@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_002629_896623_BF1DAB7E 
X-CRM114-Status: GOOD (  20.25  )
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

CgpPbiAyNy8wNC8yMDI0IDAxOjQ0LCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDQ6MjY6NDBQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgc3VwcG9ydCBmb3IgRldGVCBleHRlbnNpb24gaW4gS1ZNCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICsKPj4g
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaMKgwqDCoMKgwqAgfMKgwqAgMSAr
Cj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaCB8wqAgMzcgKysr
KysrCj4+IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAxICsKPj4gYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gYXJjaC9yaXNjdi9rdm0vdmNwdS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDUgKwo+PiBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCA0ICsKPj4gYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTM2ICsrKysrKysrKysrKysrKysrKysrKwo+PiA4IGZpbGVzIGNoYW5nZWQs
IDE5MCBpbnNlcnRpb25zKCspCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4+IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
Cj4+IGluZGV4IDQ4NGQwNGE5MmZhNi4uYmU2MGFhYTA3ZjU3IDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oCj4+IEBAIC0xOSw2ICsxOSw3IEBACj4+ICNpbmNsdWRlIDxhc20va3Zt
X3ZjcHVfZnAuaD4KPj4gI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9pbnNuLmg+Cj4+ICNpbmNsdWRl
IDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0
Lmg+Cj4+ICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfdGltZXIuaD4KPj4gI2luY2x1ZGUgPGFzbS9r
dm1fdmNwdV9wbXUuaD4KPj4KPj4gQEAgLTE2OSw2ICsxNzAsNyBAQCBzdHJ1Y3Qga3ZtX3ZjcHVf
Y3NyIHsKPj4gc3RydWN0IGt2bV92Y3B1X2NvbmZpZyB7Cj4+IMKgwqDCoMKgdTY0IGhlbnZjZmc7
Cj4+IMKgwqDCoMKgdTY0IGhzdGF0ZWVuMDsKPj4gK8KgwqDCoCB1NjQgaGVkZWxlZzsKPj4gfTsK
Pj4KPj4gc3RydWN0IGt2bV92Y3B1X3Ntc3RhdGVlbl9jc3Igewo+PiBAQCAtMjYxLDYgKzI2Myw5
IEBAIHN0cnVjdCBrdm1fdmNwdV9hcmNoIHsKPj4gwqDCoMKgwqAvKiBQZXJmb3JtYW5jZSBtb25p
dG9yaW5nIGNvbnRleHQgKi8KPj4gwqDCoMKgwqBzdHJ1Y3Qga3ZtX3BtdSBwbXVfY29udGV4dDsK
Pj4KPj4gK8KgwqDCoCAvKiBGaXJtd2FyZSBmZWF0dXJlIFNCSSBleHRlbnNpb24gY29udGV4dCAq
Lwo+PiArwqDCoMKgIHN0cnVjdCBrdm1fc2JpX2Z3ZnQgZndmdF9jb250ZXh0Owo+PiArCj4+IMKg
wqDCoMKgLyogJ3N0YXRpYycgY29uZmlndXJhdGlvbnMgd2hpY2ggYXJlIHNldCBvbmx5IG9uY2Ug
Ki8KPj4gwqDCoMKgwqBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnIGNmZzsKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPj4gYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4+IGluZGV4IGI5NjcwNTI1OGNmOS4uM2EzM2Ji
YWNjMjMzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Ni
aS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPj4gQEAg
LTg2LDYgKzg2LDcgQEAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9u
Cj4+IHZjcHVfc2JpX2V4dF9zcnN0Owo+PiBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3Ni
aV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2hzbTsKPj4gZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1f
dmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9kYmNuOwo+PiBleHRlcm4gY29uc3Qgc3Ry
dWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3N0YTsKPj4gK2V4dGVybiBj
b25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfZndmdDsKPj4g
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9l
eHBlcmltZW50YWw7Cj4+IGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lv
biB2Y3B1X3NiaV9leHRfdmVuZG9yOwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oCj4+IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdmNwdV9zYmlfZndmdC5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uN2RjMWI4MGM3ZTZjCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oCj4+IEBAIC0wLDAgKzEsMzcgQEAKPj4g
Ky8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8KPj4gKy8qCj4+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjMgUml2b3MgSW5jCj4+ICsgKgo+PiArICogQXV0aG9yczoKPj4g
KyAqwqDCoMKgwqAgQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gCj4gbml0OiBw
cm9iYWJseSBuZWVkIHRvIGZpeCBDb3B5cmlnaHQgeWVhciBhbmQgQXV0aG9ycyBoZXJlIDotKQo+
IFNhbWUgaW4gYWxsIG5ldyBmaWxlcyBiZWluZyBpbnRyb2R1Y2VkLgo+IAo+PiArICovCj4+ICsK
Pj4gKyNpZm5kZWYgX19LVk1fVkNQVV9SSVNDVl9GV0ZUX0gKPj4gKyNkZWZpbmUgX19LVk1fVkNQ
VV9SSVNDVl9GV0ZUX0gKPj4gKwo+PiArI2luY2x1ZGUgPGFzbS9zYmkuaD4KPj4gKwo+PiArI2Rl
ZmluZSBLVk1fU0JJX0ZXRlRfRkVBVFVSRV9DT1VOVMKgwqDCoCAxCj4+ICsKPj4gK3N0YXRpYyBp
bnQga3ZtX3NiaV9md2Z0X3NldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNp
Z25lZCBsb25nIGZsYWdzKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29u
ZmlnICpjb25mID0ga3ZtX3NiaV9md2Z0X2dldF9jb25maWcodmNwdSwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZlYXR1cmUpOwo+PiArwqDCoMKgIGlmICghY29uZikKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biBTQklfRVJSX0RFTklFRDsKPiAKPiBDdXJpb3VzLAo+IFdoeSBkZW5pZWQgYW5kIG5vdCBzb21l
dGhpbmcgbGlrZSBOT1RfU1VQUE9SVEVEIE5PVF9BVkFJTEFCTEUgaGVyZT8KCkhleSBEZWVwYWss
CgpTbyBpbmRlZWQsIHRoZSByZXR1cm4gdmFsdWUgaXMgbm90IHRvdGFsbHkgY29ycmVjdCBzaW5j
ZSB0aGUgc3BlYyBzdGF0ZXMKdGhhdCB3ZSByZXR1cm4gIEVERU5JRUQgaWYgZmVhdHVyZSBpcyBy
ZXNlcnZlZCBvciBpcyBwbGF0Zm9ybS1zcGVjaWZpYwphbmQgdW5pbXBsZW1lbnRlZC4gQnV0IGlu
IHRoYXQgY2FzZSBpdCBkb3Mgbm90IGRpc3Rpbmd1aXNoIGJldHdlZW4KZGVmaW5lZCBmZWF0dXJl
cyBhbmQgcmVzZXJ2ZWQgb25lLiBJJ2xsIGFkZCBhIGNoZWNrIGZvciB0aGF0LgoKVGhhbmtzLAoK
Q2zDqW1lbnQKCj4gCj4+ICsKPj4gK8KgwqDCoCBpZiAoKGZsYWdzICYgflNCSV9GV0ZUX1NFVF9G
TEFHX0xPQ0spICE9IDApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gU0JJX0VSUl9JTlZBTElE
X1BBUkFNOwo+PiArCj4+ICvCoMKgwqAgaWYgKGNvbmYtPmZsYWdzICYgU0JJX0ZXRlRfU0VUX0ZM
QUdfTE9DSykKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBTQklfRVJSX0RFTklFRDsKPj4gKwo+
PiArwqDCoMKgIGNvbmYtPmZsYWdzID0gZmxhZ3M7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gY29u
Zi0+ZmVhdHVyZS0+c2V0KHZjcHUsIGNvbmYsIHZhbHVlKTsKPj4gK30KPj4gKwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
