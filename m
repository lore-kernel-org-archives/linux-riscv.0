Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A097C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:CC:Mime-Version:Message-ID:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ai51cSCcAHlANhTNEglMeprX72QNE2E7p8of6Sx7AXo=; b=Ut+b/8o0/UJqGXDDLJLV185pKT
	q57O06gJ2zBpf8kuY9yMfS23hCqSEhuyb2akCqHypaN9WZwD6hWGILsEgwOCKpCwfm0N4/NEDE4K5
	QhzNoMiGq0B8swgHhCGPdv8ML7DpnNIENlvGG4T42tRCtb4r7ZwD33m6CkTMmFM0HjmsRV6o9AAdi
	5VEpuTSx21sWfyiuh6rPfddnHvqkpz15gDlXQ9jGFNIg0Z0Y5pU4NjOlPpO1rjYSfCaBhRPGjM4DN
	SK0TGatEUmpCstL8ZZfl7z6vWdLCCD3unxcf6UaS4yE3DoVEb/KUA2RSgf3PmsHPu01u25jesjpBB
	vmXKdhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD54k-00000001Qae-03HQ;
	Thu, 08 May 2025 17:30:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD528-00000001QAB-18W8
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 17:27:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2264aefc45dso19471295ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725263; x=1747330063; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lj7cyiQKL5aop0XuhE8HLNECrq0rmmRNxk3ltC9EqP0=;
        b=UTpD/JqZ5lHNGEkpRMOZgi//Legx4e2BQazvL/7Lg0r9mUDpH64dDr3N0IEYGh0S76
         aozD1izsbpfkGIFuN7cMgDNBWv7DzHnaY5OG5lonQQ1Zk9/MvfkfADQmRhkwD55JCr0s
         4XUyNWV2H/jbeGUAUXMhbyeQs7JKrmtEpmhI8C1ZctVM6gTlibg08SwoNQb5QWQwnDVY
         TusrZZbzmSoOlifAgukSlQtLv9SYFdmDR+wzXWTLTVtSE4og6VgjsqjclIrmxyKNJc4P
         r8ejqQ6SBAiDQ6Kuc6BorWip9XPQD3IX4BRBtp6l4YgTlAauSW9KpUtX3W1JYhkZy0Dm
         urjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725263; x=1747330063;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj7cyiQKL5aop0XuhE8HLNECrq0rmmRNxk3ltC9EqP0=;
        b=f2miiLYJWtqzX442bSibU0MCtiXn8SQBzBIg/8U0eiN4GWXzssB2lo9HCjD/b3ui7A
         WKXjGwsfD5I9ZrrG1X/YqA3j5uDZEgyUGkIHBmDTmQzJUcbrUa91Kno2NHMWFlF95vJ0
         FhnXz8o1oM6yugnEpmYEkK48YKTWJTg8gB6gTfpqUcWsMp0uO9fLtE2PDWk/MHmdy44t
         xHg30TlSCEhM1j1yK/oeK9aKTeW9fU9EHUEgKShbb6AtQRXqcxk9deXZpSaCVVfmXFab
         awG6CYhAkccRo3+AubWrexeA21SXDl2HPvkd7I8VI1a4qorCS+qKulDxhxtWakRZvUCU
         z6hg==
X-Forwarded-Encrypted: i=1; AJvYcCXn59F2zVs+DhfhFj7m6OMB6XLF7eHAQtbYFWzXjtmf7MeOFGFXatiUJzIldMNWBd/LC4eT+6FIVvcrwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7Ui8k5S2O4vUrdmvtIdfItSSFDr9VgGWc39tFoQze4SgVA+5t
	q79HmGmaXH60tz9r3pv2KonewgZgPQnIBYqeQQ4agvTT6iLxmFYEuc3hJ6iuNS4=
X-Gm-Gg: ASbGncuvU22vxggGrVWBe6SpFvJ99OR3f0EcD5x4U0Zh5MH0NMDoH0Rc9kxs/t0r0ny
	H+kzUBzckllEtTOezIM5PDAIeS4gx0VsuTLo8SG6RGkvJMAPUCf/Q0ZZfhL6nHqZ+9Ea43wOdKc
	IKP0iyWZfttis2KxI0Suu11tjEhbCT1mSYrwxmlBbJ/5FoV4vIT11JAPtlxCo5/xLYZZzeCdgO1
	dh0ekpQObwj9j+XZawW5gJvCA0DvjmRqSdt47w3O/ZXnCqnNT7pSfv0UUlRNlDXAjEUm8gqeNKl
	VTkPv1ipssk/LtkW3Mi8JeBejCKHbeQfRQ==
X-Google-Smtp-Source: AGHT+IEYd58LeJ0u1CUxMuwZxbkluf8OhO7J3QPqaVyoyBSF/i0V/aUwiGK86VABZzmA4Z6qekYbEw==
X-Received: by 2002:a17:902:d54a:b0:224:26f5:9c1e with SMTP id d9443c01a7336-22fc8b3e307mr2450145ad.2.1746725263193;
        Thu, 08 May 2025 10:27:43 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7741515sm2031635ad.95.2025.05.08.10.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:27:42 -0700 (PDT)
Date: Thu, 08 May 2025 10:27:42 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:26:58 PDT (-0700)
Subject: Re: [PATCH v6 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
In-Reply-To: <20250424173204.1948385-12-cleger@rivosinc.com>
Message-ID: <mhng-0c7b576b-882d-4020-996d-adb1b2bbcc4b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
CC: cleger@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  anup@brainfault.org, atishp@atishpatra.org, shuah@kernel.org, corbet@lwn.net,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, cleger@rivosinc.com,
  samuel.holland@sifive.com, ajones@ventanamicro.com, debug@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_102744_316369_71919C3B 
X-CRM114-Status: GOOD (  23.86  )
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

T24gVGh1LCAyNCBBcHIgMjAyNSAxMDozMTo1OCBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPiBUaGUgRldGVCBTQkkgZXh0ZW5zaW9uIHdpbGwgbmVlZCB0byBkeW5hbWlj
YWxseSBhbGxvY2F0ZSBtZW1vcnkgYW5kIGRvCj4gaW5pdCB0aW1lIHNwZWNpZmljIGluaXRpYWxp
emF0aW9uLiBBZGQgYW4gaW5pdC9kZWluaXQgY2FsbGJhY2tzIHRoYXQKPiBhbGxvd3MgdG8gZG8g
c28uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgOSArKysr
KysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICB8ICAyICsrCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKClRoZXJl
J3MgNCBLVk0gcGF0Y2hlcyBpbiBoZXJlIHdpdGhvdXQgYW4gQWNrIGZyb20gQXRpc2ggb3IgQW51
cC4gIApUaGV5J3JlIGFsbCB0aWVkIHVwIGluIHRoZSBTQkl2MyBzdHVmZiwgc28ganVzdCBMTUsg
aWYgeW91IHdhbnQgbWUgdG8gCnRha2UgdGhlbSBpbnRvIHRoYXQgc3RhZ2luZyBicmFuY2ggb3Ig
aWYgeW91IHdhbnQgbWUgdG8gd2FpdC4KCkZvciBub3cgSSdtIGdvaW5nIHRvIGdvIGxvb2sgYXQg
b3RoZXIgc3R1ZmYsIG5vIHJ1c2ggb24gbXkgZW5kLgoKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdmNwdV9zYmkuaAo+IGluZGV4IDRlZDYyMDNjZGQzMC4uYmNiOTA3NTdiMTQ5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gQEAgLTQ5LDYgKzQ5LDE0IEBAIHN0
cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHsKPgo+ICAJLyogRXh0ZW5zaW9uIHNwZWNpZmlj
IHByb2JlIGZ1bmN0aW9uICovCj4gIAl1bnNpZ25lZCBsb25nICgqcHJvYmUpKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSk7Cj4gKwo+ICsJLyoKPiArCSAqIEluaXQvZGVpbml0IGZ1bmN0aW9uIGNhbGxl
ZCBvbmNlIGR1cmluZyBWQ1BVIGluaXQvZGVzdHJveS4gVGhlc2UKPiArCSAqIG1pZ2h0IGJlIHVz
ZSBpZiB0aGUgU0JJIGV4dGVuc2lvbnMgbmVlZCB0byBhbGxvY2F0ZSBvciBkbyBzcGVjaWZpYwo+
ICsJICogaW5pdCB0aW1lIG9ubHkgY29uZmlndXJhdGlvbi4KPiArCSAqLwo+ICsJaW50ICgqaW5p
dCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiArCXZvaWQgKCpkZWluaXQpKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSk7Cj4gIH07Cj4KPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwo+IEBAIC02OSw2ICs3
Nyw3IEBAIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICprdm1fdmNwdV9zYmlf
ZmluZF9leHQoCj4gIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgaW50IGlkeCk7Cj4gIGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKPiAgdm9pZCBrdm1fcmlz
Y3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICt2b2lkIGt2bV9yaXNj
dl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPgo+ICBpbnQga3ZtX3Jp
c2N2X3ZjcHVfZ2V0X3JlZ19zYmlfc3RhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQg
bG9uZyByZWdfbnVtLAo+ICAJCQkJICAgdW5zaWduZWQgbG9uZyAqcmVnX3ZhbCk7Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGlu
ZGV4IDYwZDY4NGM3NmM1OC4uODc3YmNjODVjMDY3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC0xODUsNiArMTg1
LDggQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3Bvc3RjcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+Cj4gIHZvaWQga3ZtX2FyY2hfdmNwdV9kZXN0cm95KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
PiAgewo+ICsJa3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5pdCh2Y3B1KTsKPiArCj4gIAkvKiBDbGVh
bnVwIFZDUFUgQUlBIGNvbnRleHQgKi8KPiAgCWt2bV9yaXNjdl92Y3B1X2FpYV9kZWluaXQodmNw
dSk7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCBkMWM4M2E3NzczNWUuLjMxMzlmMTcxYzIwZiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmkuYwo+IEBAIC01MDgsNSArNTA4LDMxIEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVf
c2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAJCXNjb250ZXh0LT5leHRfc3RhdHVz
W2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwo+ICAJCQkJCUtWTV9SSVNDVl9TQklfRVhU
X1NUQVRVU19ESVNBQkxFRCA6Cj4gIAkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJM
RUQ7Cj4gKwo+ICsJCWlmIChleHQtPmluaXQgJiYgZXh0LT5pbml0KHZjcHUpICE9IDApCj4gKwkJ
CXNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfVU5B
VkFJTEFCTEU7Cj4gKwl9Cj4gK30KPiArCj4gK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2RlaW5p
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArCXN0cnVjdCBrdm1fdmNwdV9zYmlfY29u
dGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4dDsKPiArCWNvbnN0IHN0cnVj
dCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqZW50cnk7Cj4gKwljb25zdCBzdHJ1Y3Qg
a3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+ICsJaW50IGlkeCwgaTsKPiArCj4gKwlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsgaSsrKSB7Cj4gKwkJZW50cnkgPSAmc2Jp
X2V4dFtpXTsKPiArCQlleHQgPSBlbnRyeS0+ZXh0X3B0cjsKPiArCQlpZHggPSBlbnRyeS0+ZXh0
X2lkeDsKPiArCj4gKwkJaWYgKGlkeCA8IDAgfHwgaWR4ID49IEFSUkFZX1NJWkUoc2NvbnRleHQt
PmV4dF9zdGF0dXMpKQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJaWYgKHNjb250ZXh0LT5leHRf
c3RhdHVzW2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFIHx8Cj4g
KwkJICAgICFleHQtPmRlaW5pdCkKPiArCQkJY29udGludWU7Cj4gKwo+ICsJCWV4dC0+ZGVpbml0
KHZjcHUpOwo+ICAJfQo+ICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
