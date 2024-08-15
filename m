Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE15C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LqxyFXGNbVQlG6dh7FBe1hYoD+wUeKOH/B45G4WAiEU=; b=zRVWu6NYCXeoVTyUjpIEMlT8tw
	KwKt85h2/08F/cB2muh4msdg99iNdnFZB3cgvJ9iSQ34/QfhwjF+cuAIjjOr5pOG2FVz9cDgfYNFZ
	FCHickXH7b+jUieOlQQJ9eRETFvosxiooBFu1HbfG0GMgklzZk1SrGgzIwsqbe1dD7vhZIuJ9IAIn
	Rh2UNCTxFMv6eaN6dO3cSKB7hBWYHmxPURsuvkgZjG5ir5Ca1OqbAexz67Ga0GwfWl4H0bD6bIT0N
	Yn5Xf/fOl9VwOwZ8K1/l2UgrkS5hNOBV3TsoAgrYfp+tcqnsnmZPH96YZv3I1Hnbg7Yu1XarfgHPT
	aIt4tctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sePui-00000008oK8-1GBL;
	Thu, 15 Aug 2024 02:08:32 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sePug-00000008oJl-152U
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 02:08:31 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-260f863109cso329353fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 19:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1723687709; x=1724292509; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVeoMNyPHlWmE0m0EI3mUy0d/dKSh/ETD20e4TLytgk=;
        b=MUBxD4QdsFDM77eUh60bMPlbZlRJk6a8bFSeDM8w1e2lhy6i5EDsZEo7WPPMAVzQcK
         KdPhm7CXPhJn/Us/UfDpgEmNctzgcRxpwCgfggmQG5TEOTL7kI8HF/Jo2OO/Pgyni0yl
         O+ZrB2NxpQUIN0MGDXvcB+DV43FHQpGLwKcBIZaTDTrLXkvjtKYnak0vDo/UJgbYm2J+
         POVIlZ2PrcM6GtxaeXRDReRCaNxWXI56FdC0F63avQKzaectqlUyxOPt+xCuM6cdcTAG
         5C3QVTBf6RIJYnz0i2TiilE9d1HKcwAa8Fb++mH/f8XB474GJGP93S8yYd5wpPVNE8J5
         Z89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723687709; x=1724292509;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVeoMNyPHlWmE0m0EI3mUy0d/dKSh/ETD20e4TLytgk=;
        b=U788GGjOxSvbKca9JYb5VdRN5MzUrQ/x+7w3xRbO/oHZvwC2FJPn+p7+E0hi7knEPN
         Ni/3D+CUFJAuj9Os4fMD5hz11eSMTjHyYIxdGedLnPRd1ixlUX3isCeqcutrK0HU0yo9
         3pp0pMoPuf1JqGH1PkpneN8j2B6Kp2/zX9O0ygF8sih7VASUYCEKG2/QiRHCPDl1mQDX
         d34A5IIqCjmw/DBywGDEcv5EQFydagHJAxykNlKm9CyMd2W/BqixYFUjfZUOj3pcBEam
         Ljdy3w+xzTxTugan7rV9CjAupssQKyUzrOd/fTNDbx2OpeeMMJ/2fY08SRQ6iSyh032/
         Q+zw==
X-Forwarded-Encrypted: i=1; AJvYcCUSgw0uHJbIMyiVfxNtIdrgsMjrw4iKm7b5IyB/F5pjjrF3FUUmDVaLIGdFQnpXOMo2F3x3eXCeuwtoST3m9u56eaOFJNKETxi7/4pUp3je
X-Gm-Message-State: AOJu0YzpRpKGjLrJuqA4LwtWqV4utnre9NhxP29hM/FXP7KeHCvwOIlQ
	gaV3OGjwPr35eft8Ac7KGaB6JXft4td0uRMKMwHwyl708KSky2o+8VJ3iyyIXWc82u8IMY9fAKV
	vl783PfhdS1Y7X4CG242+MELP6vmtKSkVEUcBzw==
X-Google-Smtp-Source: AGHT+IF3RLEksU6gvXHQ5kES+Sx5EEypfsUOJMnD2FR4VF5VbqO7yclIa2VnQpa36geQSC/Eo2E+AIotmAFdVhrbFnc=
X-Received: by 2002:a05:6870:b6a0:b0:25e:14f0:62b1 with SMTP id
 586e51a60fabf-26fe5a63926mr5872154fac.13.1723687709159; Wed, 14 Aug 2024
 19:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240625030502.68988-1-cuiyunhui@bytedance.com> <CAEEQ3wnrdRcBdevQDGQ-5dr3aO1ura13_VskMYm8ySTZJTiYhw@mail.gmail.com>
In-Reply-To: <CAEEQ3wnrdRcBdevQDGQ-5dr3aO1ura13_VskMYm8ySTZJTiYhw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 15 Aug 2024 10:08:18 +0800
Message-ID: <CAEEQ3wkFk1bxEPH38yBH8wzAGhMB296B8knjx8nFKQYgrACSDg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Randomize lower bits of stack address
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, andy.chiu@sifive.com, alexghiti@rivosinc.com, 
	conor.dooley@microchip.com, bjorn@rivosinc.com, sorear@fastmail.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, punit.agrawal@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_190830_317488_7BB6CD93 
X-CRM114-Status: GOOD (  19.59  )
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

QSBnZW50bGUgcGluZywgQW55IG1vcmUgY29tbWVudHMgb24gdGhpcyBwYXRjaD8KCk9uIFRodSwg
SnVsIDExLCAyMDI0IGF0IDI6MDnigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4gd3JvdGU6Cj4KPiBBZGQgcHVuaXQgaW4gdGhlIGxvb3AuCj4KPgo+IE9uIFR1ZSwgSnVu
IDI1LCAyMDI0IGF0IDExOjA14oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20+IHdyb3RlOgo+ID4KPiA+IEltcGxlbWVudCBhcmNoX2FsaWduX3N0YWNrKCkgdG8gcmFuZG9t
aXplIHRoZSBsb3dlciBiaXRzCj4gPiBvZiB0aGUgc3RhY2sgYWRkcmVzcy4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXhlYy5oIHwgOCArKysrKysrKwo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgIHwgOSArKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9leGVjLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9leGVjLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4ZWMuaAo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDdkOTk0MjY4MmUwCj4gPiAtLS0g
L2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4ZWMuaAo+ID4gQEAg
LTAsMCArMSw4IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX19BU01fRVhFQ19ICj4gPiArI2RlZmluZSBfX0FTTV9F
WEVDX0gKPiA+ICsKPiA+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBhcmNoX2FsaWduX3N0YWNrKHVu
c2lnbmVkIGxvbmcgc3ApOwo+ID4gKwo+ID4gKyNlbmRpZiAvKiBfX0FTTV9FWEVDX0ggKi8KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9jZXNzLmMKPiA+IGluZGV4IGU0YmM2MWM0ZTU4YS4uZTMxNDJkOGE2ZTI4IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmMKPiA+IEBAIC0xNSw2ICsxNSw3IEBACj4gPiAgI2luY2x1ZGUg
PGxpbnV4L3RpY2suaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+Cj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGVyc29uYWxpdHkuaD4K
PiA+Cj4gPiAgI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3Byb2Nl
c3Nvci5oPgo+ID4gQEAgLTI2LDYgKzI3LDcgQEAKPiA+ICAjaW5jbHVkZSA8YXNtL2NwdWlkbGUu
aD4KPiA+ICAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ID4gICNpbmNsdWRlIDxhc20vY3B1ZmVh
dHVyZS5oPgo+ID4gKyNpbmNsdWRlIDxhc20vZXhlYy5oPgo+ID4KPiA+ICAjaWYgZGVmaW5lZChD
T05GSUdfU1RBQ0tQUk9URUNUT1IpICYmICFkZWZpbmVkKENPTkZJR19TVEFDS1BST1RFQ1RPUl9Q
RVJfVEFTSykKPiA+ICAjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3IuaD4KPiA+IEBAIC05
OSw2ICsxMDEsMTMgQEAgdm9pZCBzaG93X3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAg
ICAgICAgICAgICAgICAgZHVtcF9iYWNrdHJhY2UocmVncywgTlVMTCwgS0VSTl9ERUZBVUxUKTsK
PiA+ICB9Cj4gPgo+ID4gK3Vuc2lnbmVkIGxvbmcgYXJjaF9hbGlnbl9zdGFjayh1bnNpZ25lZCBs
b25nIHNwKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKCEoY3VycmVudC0+cGVyc29uYWxpdHkgJiBB
RERSX05PX1JBTkRPTUlaRSkgJiYgcmFuZG9taXplX3ZhX3NwYWNlKQo+ID4gKyAgICAgICAgICAg
ICAgIHNwIC09IGdldF9yYW5kb21fdTMyX2JlbG93KFBBR0VfU0laRSk7Cj4gPiArICAgICAgIHJl
dHVybiBzcCAmIH4weGY7Cj4gPiArfQo+ID4gKwo+ID4gICNpZmRlZiBDT05GSUdfQ09NUEFUCj4g
PiAgc3RhdGljIGJvb2wgY29tcGF0X21vZGVfc3VwcG9ydGVkIF9fcmVhZF9tb3N0bHk7Cj4gPgo+
ID4gLS0KPiA+IDIuMjAuMQo+ID4KPgo+IFRoYW5rcywKPiBZdW5odWkKClRoYW5rcywKWXVuaHVp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
