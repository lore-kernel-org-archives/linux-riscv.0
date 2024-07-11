Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC245C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arz/oGq1sBavB1ARf/WM/hgeEQJmtg80+e101SMsAZw=; b=wy5ozuyxDhAyrt
	Qr2R08hYT+4zwqB5I1+0Yj8hEKQW0oy66p9XWCsCuNxTKM+Qb9ikvHDD4cBF3peXKoacpADrmZSyX
	IltKiF8CZh0zlX5LpK+OgC6Kdfdb58vtmMBn8EmCbwT/GsWAVHDFYRtoGvzUgGeRkHQrxBoagd9ve
	ee7Moim0MqU0gYDXZMV6YM946srk1uJIc3CApyhm1SBXelKsQuSZyvK06r4YbuOfRBvKSZgfe5XS+
	WcAlX6DWlj179GAbFVmAzyo63upN2wj4yqSCiMBET21O0lUw+8uiOeEc9wLCtaxUOG8axAYJJAUGZ
	lpkF9NkiywgCCZX0DIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS0M1-0000000FL7V-2FhH;
	Thu, 11 Jul 2024 20:25:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS0Lx-0000000FL6j-1CXB
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 20:25:24 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so854596a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720729520; x=1721334320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iMO3QJaNwKPEg2fkW9ocZ2ZzNc4qbi0eB4IVGf7OvXg=;
        b=ZxmDp0LpF2dLwcgdxERk2VKuDFEyQeAw4TDQq1uJUOGxoPynd0Dhg+zLOKt9TyHsIO
         +ylpfr+w+tcsSoRRTul8bjYk5J5U9p7IxXUqWkDmDdR37QS5vwoM0ebNgJvgGMk+FlqP
         lYSMruiEApA4G+n6m+ap8x14kDjz21OkibhS6eOc4/rzrZwHIUAT1bs/+U+n4SGr+RcY
         i60Gwc+idSfpL8b7Iv57IyOe44gNqzPGQqtX7qthohDomeM9I7iiggEQhtGtCiu9ohuO
         ExywmJzSmfrAUzb0u2aT+2joIKKHnoxi7U3tLbcLTm56fhTPoKrsz8BeoPN7M5DC6JQm
         XWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720729520; x=1721334320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMO3QJaNwKPEg2fkW9ocZ2ZzNc4qbi0eB4IVGf7OvXg=;
        b=py5RemgMx/XA0epjOXy8mOe7n8lXV6ed4FQCxa1Kp1X4EpFiq6ANbc92wlhc8kjkdv
         IXPAyVUVs6guVy0O52K7z/NlsvAHraYsnPoCEDej+Gz2xAoREAJRmIhxlBjUn7bjk23B
         vzBN5x6UfWdD0BDFoj7ENZn7jEBQpzYB47ynXTSt5BxRiFs1duwLqlltHyiAgU817pab
         hmkeSic4wCXa49iHwu07d8VQ/QIp3orG0kedHg3Q5AaXzjn3uMwnFiGUyrjKCUHAVuPt
         VMtMW4+DmJ3kgsh0aKaTNEY8vVdI567wLkjpmCVrABiI9qihXLNnmbkPht20gwdIwO8v
         Jd1Q==
X-Gm-Message-State: AOJu0YzLRa1+Q12PmsJP9XHqA0BC928DH7mH34/07zG+7Ar35fSLFiIp
	0y55LG39xtgXjBoNUuYt0W5K723CGJwjb1FMcr1psKycxLdIrSnN+tzKg+N1zlA=
X-Google-Smtp-Source: AGHT+IGd8D3/XoSU3Ju/bMAEpeWWMsStCF3C8xFRAptThUUyXilcXDIM/pIU++epptacQ5dkqr485g==
X-Received: by 2002:a05:6a21:1690:b0:1c0:e322:e8c5 with SMTP id adf61e73a8af0-1c29821b544mr9879373637.26.1720729519712;
        Thu, 11 Jul 2024 13:25:19 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad3460sm54408745ad.295.2024.07.11.13.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 13:25:19 -0700 (PDT)
Message-ID: <ed410b0f-0062-4fbb-97e0-86fd492fb5ca@rivosinc.com>
Date: Thu, 11 Jul 2024 16:25:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] RISC-V: Check scalar unaligned access on all CPUs
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>,
 Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-4-jesse@rivosinc.com>
 <CALs-HsvE9PzTrhVO0umh3KaJuLQLdk-h8sYKBg7XA4a-MXAmOg@mail.gmail.com>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <CALs-HsvE9PzTrhVO0umh3KaJuLQLdk-h8sYKBg7XA4a-MXAmOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_132521_546925_15D0DE0B 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzEwLzI0IDExOjU1LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIE1vbiwgSnVuIDI0LCAy
MDI0IGF0IDU6NTHigK9QTSBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPiB3cm90ZToK
Pj4KPj4gT3JpZ2luYWxseSwgdGhlIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxs
X2NwdXMgZnVuY3Rpb24KPj4gb25seSBjaGVja2VkIHRoZSBib290IGhhcnQuIFRoaXMgZml4ZXMg
dGhlIGZ1bmN0aW9uIHRvIGNoZWNrIGFsbAo+PiBoYXJ0cy4KPj4KPj4gRml4ZXM6IDcxYzU0YjNk
MTY5ZCAoInJpc2N2OiByZXBvcnQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBlbXVsYXRpb24gdG8gaHdw
cm9iZSIpCj4+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+
Cj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IC0tLQo+PiBWMSAtPiBWMjoKPj4gICAt
IE5ldyBwYXRjaAo+PiBWMiAtPiBWMzoKPj4gICAtIFNwbGl0IHBhdGNoCj4+IC0tLQo+PiAgIGFy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDIzICsrKysrKy0tLS0tLS0tLS0t
LS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gaW5kZXggYjYyZDVh
MmY0NTQxLi44ZmFkYmUwMGRkNjIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzX21pc2FsaWduZWQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKPj4gQEAgLTUyNiwzMSArNTI2LDE3IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9y
ZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gICAgICAgICAgcmV0dXJuIDA7Cj4+ICAgfQo+Pgo+
PiAtc3RhdGljIGJvb2wgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQo+
PiArc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKnVudXNlZCkKPj4gICB7Cj4+ICsgICAgICAgaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKPj4gICAgICAgICAgbG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGln
bmVkX2FjY2Vzc19zcGVlZCwgY3B1KTsKPj4gICAgICAgICAgdW5zaWduZWQgbG9uZyB0bXBfdmFy
LCB0bXBfdmFsOwo+PiAtICAgICAgIGJvb2wgbWlzYWxpZ25lZF9lbXVfZGV0ZWN0ZWQ7Cj4+Cj4+
ICAgICAgICAgICptYXNfcHRyID0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV047Cj4+
Cj4+ICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKPj4gICAgICAgICAgICAgICAgICAi
ICAgICAgICJSRUdfTCIgJVt0bXBdLCAxKCVbcHRyXSlcbiIKPj4gICAgICAgICAgICAgICAgICA6
IFt0bXBdICI9ciIgKHRtcF92YWwpIDogW3B0cl0gInIiICgmdG1wX3ZhcikgOiAibWVtb3J5Iik7
Cj4+IC0KPj4gLSAgICAgICBtaXNhbGlnbmVkX2VtdV9kZXRlY3RlZCA9ICgqbWFzX3B0ciA9PSBS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQpOwo+PiAtICAgICAgIC8qCj4+IC0gICAg
ICAgICogSWYgdW5hbGlnbmVkX2N0bCBpcyBhbHJlYWR5IHNldCwgdGhpcyBtZWFucyB0aGF0IHdl
IGRldGVjdGVkIHRoYXQgYWxsCj4+IC0gICAgICAgICogQ1BVUyB1c2VzIGVtdWxhdGVkIG1pc2Fs
aWduZWQgYWNjZXNzIGF0IGJvb3QgdGltZS4gSWYgdGhhdCBjaGFuZ2VkCj4+IC0gICAgICAgICog
d2hlbiBob3RwbHVnZ2luZyB0aGUgbmV3IGNwdSwgdGhpcyBpcyBzb21ldGhpbmcgd2UgZG9uJ3Qg
aGFuZGxlLgo+PiAtICAgICAgICAqLwo+PiAtICAgICAgIGlmICh1bmxpa2VseSh1bmFsaWduZWRf
Y3RsICYmICFtaXNhbGlnbmVkX2VtdV9kZXRlY3RlZCkpIHsKPj4gLSAgICAgICAgICAgICAgIHBy
X2NyaXQoIkNQVSBtaXNhbGlnbmVkIGFjY2Vzc2VzIG5vbiBob21vZ2VuZW91cyAoZXhwZWN0ZWQg
YWxsIGVtdWxhdGVkKVxuIik7Cj4+IC0gICAgICAgICAgICAgICB3aGlsZSAodHJ1ZSkKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4+IC0gICAgICAgfQo+IAo+IFRoaXMg
Y2h1bmsgd2FzIG1lYW50IHRvIGRldGVjdCBhbmQgcmVmdXNlIHRvIHJ1biBvbiBhIHN5c3RlbSB3
aGVyZSBhCj4gaGV0ZXJvZ2VuZW91cyBDUFUgaXMgaG90cGx1Z2dlZCBpbnRvIGEgcHJldmlvdXNs
eSBob21vZ2Vub3VzIHN5c3RlbS4KPiBUaGUgY29tbWl0IG1lc3NhZ2UgZG9lc24ndCBtZW50aW9u
IHRoaXMgY2hhbmdlLCBob3cgY29tZSB5b3UKPiBkZWxldGVkIGl0PwoKU29ycnkgZm9yIHRoZSBs
b25nIHdhaXQuCkkgZG8gbm90IHJlbWVtYmVyIHdoeSBJIHJlbW92ZWQgdGhpcy4KWW91ciByaWdo
dCBpdCBzaG91bGRuJ3QgYmUgcmVtb3ZlZCwgSSBhZGRlZCBpdCBiYWNrLgoKVGhhbmtzLApKZXNz
ZSBUYXViZQo+IAo+IAo+PiAtCj4+IC0gICAgICAgcmV0dXJuIG1pc2FsaWduZWRfZW11X2RldGVj
dGVkOwo+PiAgIH0KPj4KPj4gICBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRf
YWxsX2NwdXModm9pZCkKPj4gQEAgLTU2Miw4ICs1NDgsMTEgQEAgYm9vbCBjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4+ICAgICAgICAgICAqIGFjY2Vzc2Vz
IGVtdWxhdGVkIHNpbmNlIHRhc2tzIHJlcXVlc3Rpbmcgc3VjaCBjb250cm9sIGNhbiBydW4gb24g
YW55Cj4+ICAgICAgICAgICAqIENQVS4KPj4gICAgICAgICAgICovCj4+ICsgICAgICAgc2NoZWR1
bGVfb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCk7Cj4+ICsKPj4g
ICAgICAgICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+IC0gICAgICAgICAgICAgICBpZiAo
IWNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoY3B1KSkKPj4gKyAgICAgICAgICAgICAg
IGlmIChwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpCj4+ICsgICAgICAgICAg
ICAgICAgICAgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEKQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiAgICAgICAgICB1bmFsaWduZWRf
Y3RsID0gdHJ1ZTsKPj4gLS0KPj4gMi40NS4yCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
