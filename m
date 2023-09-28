Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6824CE7B08
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+08xMURa/giO+eddieTky86QXMivGU75+f5L4gK/MFg=; b=gLuQtVAGxFPoii
	BiKN/YuYnH9C+2FLDqXx7LZzNVp5FRuFqGqdvuWA0pohTUm9jK3mEPeYL50YhV4mo0KhFh7XPVF1x
	dJbz0tMpuyoKZqH/0t8X4xeMUJACVVUYsLdjIBzJOQ2Qw5HpROQIvEUyi6gsoYfn+j1D+T1eHil/3
	cIv2bfdQjfw+hWbuErA+6HSPUHOdpaBeZsqKKrLdzW0tZQSMTctV7TMfrcomkXNfsucNBb+JQ4vlF
	dyIN3rpDVyrqQ2ICfReEcz6Fw0IjtCW81S6CEQOenCp8hBrTsk1sw/SAVzranAHJQRUNzB/eP9yXZ
	vkPhq9/xSQB3d9JVuYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllj9-002YMl-1a;
	Thu, 28 Sep 2023 07:46:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllj6-002YLm-0D
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 07:46:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso14414855e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695887179; x=1696491979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rg1Ne0t86kMdu3fxYJuBqKtXK+ow8wHfug79dUhtVg=;
        b=vNyMaqjNy9sF6kGeRtkgdygbC99KX8ts1xnweaZPXrZThIonbCwJKvz1hwZrUdKmdV
         lHqaJcUv2NzS9JRnruyciVOv7+07t1QM2pH+vCESrytyrbYUZQaZeSIGf2Ph7R1M5uOU
         dV8aM6ibn6BDRuWyc0ywzCzhtZt2kmq63XWEKRZyLyd+JUrfFPzc1utsWWcsgB2uLmfk
         IMRK1qgqDNGw12go8cZ2T2m/PQ9zFPCyXGjl9OKNv3FdJXz+8IFvo0U5Qp/HXOqjujRs
         nz71ki7HNsiX9yFfu2UQ4AX3pY3a/F6xTzjMmqfbyOvYAzujwom8ewLAtoWy6nq5ehTo
         pqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695887179; x=1696491979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rg1Ne0t86kMdu3fxYJuBqKtXK+ow8wHfug79dUhtVg=;
        b=uVb1u66SRV0bXcpqKHwXtT8sIm/nOE2Y2Bj862rgIBcJB9bfP9fs1k8MptBs6DnKcP
         bVjesON5yRhFuF1JR0RzYnfROCA2Atp7dK74lOG1KBiYqbp8jzCLxIveE+7gAUQ/ICFp
         OUzYoRGhhXfqv2wRrItPFnHaBK4SiIat2Y0YJVNCtBrsiooGYGVYaW+IPX4h4ReP3TAl
         jdaOcIRWNGNz8XFcWyegw3xe4TEKHgGAowf+B2fSG54ih1NdKIht/Vt8dKwpIUeerciG
         SV0mjoCx7EWNC2uF/6xL6ZVGu5/qFsHITwzrHThwfXTUhNP1zM9r/Wmw4GREJcnRI18Q
         4jBQ==
X-Gm-Message-State: AOJu0Yw9yE1zqNtIx+CskYErRRl5YqkAKC52Be/m27DvmDSEVMJF3g3z
	42RBAF6f7fnHo/2IZQ+Oxe2rNA==
X-Google-Smtp-Source: AGHT+IEaEzwm/AaCjrVcQWTmxAimbl5qfaBEeSB9TwhWPU7AdIePkuNjOPzyIu1g4Lt4KvFo0Fjd8A==
X-Received: by 2002:a05:600c:3b88:b0:405:1ba2:4fcf with SMTP id n8-20020a05600c3b8800b004051ba24fcfmr449703wms.4.1695887179248;
        Thu, 28 Sep 2023 00:46:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:866e:3285:a245:a33f? ([2a01:e0a:999:a3a0:866e:3285:a245:a33f])
        by smtp.gmail.com with ESMTPSA id t1-20020a1c7701000000b003fe23b10fdfsm22245518wmi.36.2023.09.28.00.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:46:18 -0700 (PDT)
Message-ID: <c9db8acf-98fe-4533-8fa1-7a4394e51e21@rivosinc.com>
Date: Thu, 28 Sep 2023 09:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] riscv: report misaligned accesses emulation to
 hwprobe
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230926150316.1129648-7-cleger@rivosinc.com>
 <CALs-HssC7oEg0H84D4_gkHpujhBbOOqX-W3k=WrD3SBEGHmaYg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HssC7oEg0H84D4_gkHpujhBbOOqX-W3k=WrD3SBEGHmaYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_004624_306775_7FA9A148 
X-CRM114-Status: GOOD (  29.65  )
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

CgpPbiAyNi8wOS8yMDIzIDIzOjU3LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDI2
LCAyMDIzIGF0IDg6MDPigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBod3Byb2JlIHByb3ZpZGVzIGEgd2F5IHRvIHJlcG9ydCBpZiBtaXNhbGln
bmVkIGFjY2VzcyBhcmUgZW11bGF0ZWQuIEluCj4+IG9yZGVyIHRvIGNvcnJlY3RseSBwb3B1bGF0
ZSB0aGF0IGZlYXR1cmUsIHdlIGNhbiBjaGVjayBpZiBpdCBhY3R1YWxseQo+PiB0cmFwcyB3aGVu
IGRvaW5nIGEgbWlzYWxpZ25lZCBhY2Nlc3MuIFRoaXMgY2FuIGJlIGNoZWNrZWQgdXNpbmcgYW4K
Pj4gZXhjZXB0aW9uIHRhYmxlIGVudHJ5IHdoaWNoIHdpbGwgYWN0dWFsbHkgYmUgdXNlZCB3aGVu
IGEgbWlzYWxpZ25lZAo+PiBhY2Nlc3MgaXMgZG9uZSBmcm9tIGtlcm5lbCBtb2RlLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0t
LQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgIDYgKysrCj4+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgfCAgNiArKy0KPj4gIGFyY2gvcmlz
Y3Yva2VybmVsL3NldHVwLmMgICAgICAgICAgICB8ICAxICsKPj4gIGFyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4g
IDQgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPj4gaW5kZXggZDAzNDViZDY1OWM5Li5jMWYw
ZWYwMmNkN2QgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4+IEBAIC04
LDYgKzgsNyBAQAo+Pgo+PiAgI2luY2x1ZGUgPGxpbnV4L2JpdG1hcC5oPgo+PiAgI2luY2x1ZGUg
PGFzbS9od2NhcC5oPgo+PiArI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+Cj4+Cj4+ICAvKgo+PiAg
ICogVGhlc2UgYXJlIHByb2JlZCB2aWEgYSBkZXZpY2VfaW5pdGNhbGwoKSwgdmlhIGVpdGhlciB0
aGUgU0JJIG9yIGRpcmVjdGx5Cj4+IEBAIC0zMiw0ICszMyw5IEBAIGV4dGVybiBzdHJ1Y3Qgcmlz
Y3ZfaXNhaW5mbyBoYXJ0X2lzYVtOUl9DUFVTXTsKPj4KPj4gIHZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2VzcyhpbnQgY3B1KTsKPj4KPj4gK2Jvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9p
ZCk7Cj4+ICsKPj4gK2Jvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1
KTsKPj4gK3ZvaWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7Cj4+ICsKPj4gICNl
bmRpZgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IGluZGV4IDFjZmJiYTY1ZDExYS4uZmJiZGU4
MDBiYzIxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IEBAIC01NjgsNiArNTY4LDkg
QEAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzKGludCBjcHUpCj4+ICAgICAgICAgdm9pZCAq
c3JjOwo+PiAgICAgICAgIGxvbmcgc3BlZWQgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0xP
VzsKPj4KPj4gKyAgICAgICBpZiAoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUp
KQo+IAo+IFRoaXMgc3BvdCAocmVmZXJlbmNlZCBiZWxvdykuCj4gCj4+ICsgICAgICAgICAgICAg
ICByZXR1cm47Cj4+ICsKPj4gICAgICAgICBwYWdlID0gYWxsb2NfcGFnZXMoR0ZQX05PV0FJVCwg
Z2V0X29yZGVyKE1JU0FMSUdORURfQlVGRkVSX1NJWkUpKTsKPj4gICAgICAgICBpZiAoIXBhZ2Up
IHsKPj4gICAgICAgICAgICAgICAgIHByX3dhcm4oIkNhbid0IGFsbG9jIHBhZ2VzIHRvIG1lYXN1
cmUgbWVtY3B5IHBlcmZvcm1hbmNlIik7Cj4+IEBAIC02NDUsOSArNjQ4LDEwIEBAIHZvaWQgY2hl
Y2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQgY3B1KQo+PiAgICAgICAgIF9fZnJlZV9wYWdlcyhwYWdl
LCBnZXRfb3JkZXIoTUlTQUxJR05FRF9CVUZGRVJfU0laRSkpOwo+PiAgfQo+Pgo+PiAtc3RhdGlj
IGludCBjaGVja191bmFsaWduZWRfYWNjZXNzX2Jvb3RfY3B1KHZvaWQpCj4+ICtzdGF0aWMgaW50
IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2Jvb3RfY3B1KHZvaWQpCj4+ICB7Cj4+ICAg
ICAgICAgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcygwKTsKPj4gKyAgICAgICB1bmFsaWduZWRfZW11
bGF0aW9uX2ZpbmlzaCgpOwo+PiAgICAgICAgIHJldHVybiAwOwo+PiAgfQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVw
LmMKPj4gaW5kZXggZTYwMGFhYjExNmE0Li4zYWY2YWQ0ZGY3Y2YgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAu
Ywo+PiBAQCAtMjYsNiArMjYsNyBAQAo+PiAgI2luY2x1ZGUgPGFzbS9hY3BpLmg+Cj4+ICAjaW5j
bHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4K
Pj4gKyNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+PiAgI2luY2x1ZGUgPGFzbS9jcHVfb3Bz
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KPj4gICNpbmNsdWRlIDxhc20v
cGd0YWJsZS5oPgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+IGluZGV4IGI1
ZmIxZmYwNzhlMy4uZmE4MWY2OTUyZmE0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+IEBAIC05LDExICs5LDE0IEBACj4+ICAjaW5jbHVkZSA8bGludXgvcGVyZl9l
dmVudC5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L2lycS5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3N0
cmluZ2lmeS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+Cj4+Cj4+ICAjaW5jbHVkZSA8
YXNtL3Byb2Nlc3Nvci5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPj4gICNpbmNsdWRl
IDxhc20vY3NyLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5oPgo+PiArI2luY2x1
ZGUgPGFzbS9od3Byb2JlLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4KPj4g
ICNkZWZpbmUgSU5TTl9NQVRDSF9MQiAgICAgICAgICAgICAgICAgIDB4Mwo+PiAgI2RlZmluZSBJ
TlNOX01BU0tfTEIgICAgICAgICAgICAgICAgICAgMHg3MDdmCj4+IEBAIC0zOTYsOCArMzk5LDEw
IEBAIHVuaW9uIHJlZ19kYXRhIHsKPj4gICAgICAgICB1NjQgZGF0YV91NjQ7Cj4+ICB9Owo+Pgo+
PiArc3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5Owo+PiArCj4+ICAvKiBz
eXNjdGwgaG9va3MgKi8KPj4gLWludCB1bmFsaWduZWRfZW5hYmxlZCBfX3JlYWRfbW9zdGx5ID0g
MTsgICAgICAgLyogRW5hYmxlZCBieSBkZWZhdWx0ICovCj4+ICtpbnQgdW5hbGlnbmVkX2VuYWJs
ZWQgX19yZWFkX21vc3RseTsKPj4KPj4gIGludCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0cnVj
dCBwdF9yZWdzICpyZWdzKQo+PiAgewo+PiBAQCAtNDEyLDYgKzQxNyw5IEBAIGludCBoYW5kbGVf
bWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAgICAgICAgIGlmICghdW5h
bGlnbmVkX2VuYWJsZWQpCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4+Cj4+ICsgICAg
ICAgaWYgKHVzZXJfbW9kZShyZWdzKSAmJiAoY3VycmVudC0+dGhyZWFkLmFsaWduX2N0bCAmIFBS
X1VOQUxJR05fU0lHQlVTKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtMTsKPj4gKwo+PiAg
ICAgICAgIGlmIChnZXRfaW5zbihyZWdzLCBlcGMsICZpbnNuKSkKPj4gICAgICAgICAgICAgICAg
IHJldHVybiAtMTsKPj4KPj4gQEAgLTUxMSw2ICs1MTksOSBAQCBpbnQgaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICAgICAgICAgaWYgKCF1bmFsaWduZWRf
ZW5hYmxlZCkKPj4gICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPj4KPj4gKyAgICAgICBpZiAo
dXNlcl9tb2RlKHJlZ3MpICYmIChjdXJyZW50LT50aHJlYWQuYWxpZ25fY3RsICYgUFJfVU5BTElH
Tl9TSUdCVVMpKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+PiArCj4+ICAgICAgICAg
aWYgKGdldF9pbnNuKHJlZ3MsIGVwYywgJmluc24pKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJu
IC0xOwo+Pgo+PiBAQCAtNTg1LDMgKzU5Niw1MyBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfc3Rv
cmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Cj4+ICAgICAgICAgcmV0dXJuIDA7Cj4+ICB9Cj4+
ICsKPj4gK2Jvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQo+PiAr
ewo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgZW11bGF0ZWQgPSAxLCB0bXBfdmFyOwo+PiArCj4+
ICsgICAgICAgLyogVXNlIGEgZml4dXAgdG8gZGV0ZWN0IGlmIG1pc2FsaWduZWQgYWNjZXNzIHRy
aWdnZXJlZCBhbiBleGNlcHRpb24gKi8KPj4gKyAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAo
Cj4+ICsgICAgICAgICAgICAgICAiMTpcbiIKPj4gKyAgICAgICAgICAgICAgICIgICAgICAgIlJF
R19MIiAlW3RtcF0sIDEoJVtwdHJdKVxuIgo+PiArICAgICAgICAgICAgICAgIiAgICAgICBsaSAl
W2VtdWxhdGVkXSwgMFxuIgo+PiArICAgICAgICAgICAgICAgIjI6XG4iCj4+ICsgICAgICAgICAg
ICAgICBfQVNNX0VYVEFCTEUoMWIsIDJiKQo+PiArICAgICAgIDogW2VtdWxhdGVkXSAiK3IiIChl
bXVsYXRlZCksIFt0bXBdICI9ciIgKHRtcF92YXIpCj4+ICsgICAgICAgOiBbcHRyXSAiciIgKCZ0
bXBfdmFyKQo+PiArICAgICAgIDogIm1lbW9yeSIpOwo+PiArCj4+ICsgICAgICAgaWYgKCFlbXVs
YXRlZCkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4gKwo+PiArICAgICAgIHBl
cl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkgPQo+PiArICAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEOwo+IAo+IEZvciB0aWRpbmVzcywgY2Fu
IHdlIG1vdmUgdGhlIGFzc2lnbm1lbnQgb2YgdGhpcyBwZXItY3B1IHZhcmlhYmxlIGludG8KPiBj
aGVja191bmFsaWduZWRfYWNjZXNzKCksIGF0IHRoZSBzcG90IEkgcmVmZXJlbmNlZCBhYm92ZS4g
VGhhdCB3YXkKPiBwZW9wbGUgbG9va2luZyB0byBzZWUgaG93IHRoaXMgdmFyaWFibGUgaXMgc2V0
IGRvbid0IGhhdmUgdG8gaHVudAo+IHRocm91Z2ggbXVsdGlwbGUgbG9jYXRpb25zLgoKQWdyZWVk
LCB0aGF0IHNlZW1zIGJldHRlci4KCj4gCj4+ICsKPj4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPj4g
K30KPj4gKwo+PiArdm9pZCBfX2luaXQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCkK
Pj4gK3sKPj4gKyAgICAgICBpbnQgY3B1Owo+PiArCj4+ICsgICAgICAgLyoKPj4gKyAgICAgICAg
KiBXZSBjYW4gb25seSBzdXBwb3J0IFBSX1VOQUxJR04gY29udHJvbHMgaWYgYWxsIENQVXMgaGF2
ZSBtaXNhbGlnbmVkCj4+ICsgICAgICAgICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3Mg
cmVxdWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKPj4gKyAgICAgICAgKiBDUFUu
Cj4+ICsgICAgICAgICovCj4+ICsgICAgICAgZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+
PiArICAgICAgICAgICAgICAgaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNw
dSkgIT0KPj4gKyAgICAgICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1V
TEFURUQpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+ICsgICAgICAg
ICAgICAgICB9Cj4+ICsgICAgICAgfQo+PiArICAgICAgIHVuYWxpZ25lZF9jdGwgPSB0cnVlOwo+
IAo+IFRoaXMgZG9lc24ndCBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgYSBDUFUgaXMgaG90cGx1Z2dl
ZCBsYXRlciB0aGF0Cj4gZG9lc24ndCBtYXRjaCB3aXRoIHRoZSBvdGhlcnMuIFlvdSBtYXkgd2Fu
dCB0byBhZGQgYSBwYXRjaCB0aGF0IGZhaWxzCj4gdGhlIG9ubGluaW5nIG9mIHRoYXQgbmV3IENQ
VSBpZiB1bmFsaWduZWRfY3RsIGlzIHRydWUgYW5kCj4gbmV3X2NwdS5taXNhbGlnbmVkX2FjY2Vz
c19zcGVlZCAhPSBFTVVMQVRFRC4KClNvIGFjdHVhbGx5LCB0aGlzIHdpbGwgcmVxdWlyZSBhIGJp
dCBtb3JlIHBsdW1iaW5nIGFzIEkgcmVhbGl6ZSB0aGUKc3dpdGNoIHRvIGRpc2FibGUgbWlzYWxp
Z25tZW50IHN1cHBvcnQgaXMgZ2xvYmFsLiBUaGlzIHN3aXRjaCBzaG91bGQKb25seSBiZSBkaXNh
YmxlZCBhdCBib290IHdoaWNoIG1lYW5zIEkgd29uJ3QgYmUgYWJsZSB0byBkaXNhYmxlIGl0IGF0
CnJ1bnRpbWUgKHdoaWxlIGhpb3RwbHVnZ2luZyBhIENQVSkgZm9yIENQVSBkZXRlY3Rpb24uIFRo
ZXJlIGFyZSBtdWx0aXBsZQp3YXlzIHRvIGhhbmRsZSB0aGF0OgoKMS0gSGF2ZSBhIHBlci1jcHUg
c3dpdGNoIGZvciBtaXNhbGlnbm1lbnQgaGFuZGxpbmcgd2hpY2ggd291bGQgYmUKZGlzYWJsZWQg
b25seSB3aGVuIGRldGVjdGlvbiBpcyBuZWVkZWQuCgoyLSBBc3N1bWUgdGhhdCBvbmNlIGRldGVj
dGVkIGF0IGJvb3QtdGltZSwgZW11bGF0aW9uIHdpbGwgbm90IGNoYW5nZS4KCk5vdCBzdXJlIHdo
aWNoIG9uZSBpcyBiZXR0ZXIgdGhvdWdoLiBBZHZpY2UgYXJlIHdlbGNvbWVkLgoKQ2zDqW1lbnQK
Cj4gCj4gLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
