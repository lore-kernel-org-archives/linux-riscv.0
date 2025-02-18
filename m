Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8828AC021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3Dwe/O3bPvU/DSEAbZ2rIlWgSWaLbmLM4FxTK2NVM4=; b=tTo3SptPl3ry7L
	Ru1pYwunW+CwB/6Tv7FWAeAjYSPn1YueCOrF4BbbwMy+B57PhkYbwJWf+VyQg/g2QOg62zeWJGviY
	I9D0JeFL74Gv++fbO2eMhy+6+b5ul6By3AKCu5c0EIp4zzLyW/b6hO4ZBbbeixR1+cWFonNqgMiED
	hzHcGF8sHTVCK8paqSqQz5DGcKcEz/qgL5X7JhJ+LAGR2XvmSn+cjU3pXPvPjpEXisyVXtJzvShpj
	/NOVaDPqU8GQd0DR+HSh4Z6prwz/WCKx52yOLD0+PI6UmR0Y9q+BVKtRO26MeGKlYo7zpA+5B31f9
	lgNgfgOp5eZ7aaqc0xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRjB-00000009EYg-2qVv;
	Tue, 18 Feb 2025 17:49:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRi8-00000009EQj-2gWt
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 17:48:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f3486062eso2689433f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 09:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739900922; x=1740505722; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/9F2KANNnqRPhOVip+6sGGo7ED+K7ta4GpssYl+9ok=;
        b=UocG4U1CQmWurAwyeIM9BVb4K4m3a8R/a6GoUJZuKxwOQq/o/wNO6r8RRLfFgVo2po
         eXtdfwyOTP0ClxG5XxCAUw/W8rZoUtBDlTDZ4uHKMzJhqH2Lg5Psg54EFLMo5fGet/I6
         eFc/lXLCyGKnKjsGWgdjEaFMOn9ptzf8T1bUZWTs3uHh7a9hKvJgFHVlXkYgbcAR9FLn
         rOExh4UFk/KNqSonGTExNSkEzQuQ4hhAosGh/M2z0U0FhNjUfsxhlE5DZEnSyTCXvGJS
         LyF5kWQ/1jUec+O3ZVEgsOxs8pmdlnWh9abzP4ObJ1Av/pLANY+nmbbFYF5MGwW2otay
         skbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739900922; x=1740505722;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/9F2KANNnqRPhOVip+6sGGo7ED+K7ta4GpssYl+9ok=;
        b=WEijBrUCxlBov11Xk5KdbVB9mLN1EaPYNAZUkX8szS9NrewvnWvwuAesdcMjXPuFWa
         f0KJ5PTdMixek2QOct5kgCDHe1o82o9mv4b6IWPZ1fxJMFO5tqOjIGAqzxdIe2ix3KOR
         iXK5KbA3msbTiGI8+JZVK7fWE42WBUpVc1v5cPwl5OA3gUXE2AVceck4bmNd8y4W8zFc
         O47U/0DwA6QmeB0FpUuzfJfvR8EfBqnp4pWuHavQ2/FOWWL2iTchdX+gJXukwB0p01mH
         zKUCW3R4l4yc9jdAyVAJry0/FqMiltTp2xg2O2ofWMNmV4J4qGnxPhRUn/SMkIvG4RUf
         ZifQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS4xa2EjLWmsYBaUGVccAMXx396LPZ08SbVhDS+Sd+dmudutRjGi7Igaks5DC/I2mI1OKifaz2+nuSBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHUJTlId98a7R6hXO/0PrIitweUHfcqYVl9pMk80YtrKeOWWVm
	R516LGH04u6CzoglmzTFgkwShrS1vBzrGS/zQ5NyRnPPKnyBdJHUrSoEHlwrzrc=
X-Gm-Gg: ASbGncve+GdNghEsj4fiR/9Mv5d/dP13SLOjsscnwKNcy8RiFhlm8Ej/dBpY4M9ea9G
	dvtlMUH0z1ms06O6HE5qS+EtppsIz0c81fmNuscfJCQeBwu+3pG9tCKLPNzaqPW8l+y/akZm1pa
	fCd5zTEVX5XCI5aStn2rNFyu3C8dlqUebHXc3+GwiRASBwkZlJ6egOAxuDMC/r+YcjiIs9FUmnJ
	6I3evOFrRt7a8F9p/tXAXRW8FEEROEcLY9DMEhma+injy+cjOfPSW+GeQIr/pU9GgWc7o1Wj+Pd
	ID0=
X-Google-Smtp-Source: AGHT+IGDVdEGfqSSRSuokSOsRD/Nb4bUupeEDDpkXhWkKSM85eFfn/T5hKxjkCf6oi4D/15usSNtVA==
X-Received: by 2002:a5d:6c68:0:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-38f58795a45mr438523f8f.27.1739900922377;
        Tue, 18 Feb 2025 09:48:42 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcc45sm15720336f8f.33.2025.02.18.09.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:48:41 -0800 (PST)
Date: Tue, 18 Feb 2025 18:48:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?6aG55paH5oiQ?= <xiangwencheng@lanxincomputing.com>
Cc: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org" <atishp@atishpatra.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250218-57a3a16e477f83a8c267d120@orel>
References: <38cc241c40a8ef2775e304d366bcd07df733ecf0.1d66512d.85e4.41a5.8cf7.4c1fdb05d775@feishu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38cc241c40a8ef2775e304d366bcd07df733ecf0.1d66512d.85e4.41a5.8cf7.4c1fdb05d775@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_094844_675235_F56AE4DF 
X-CRM114-Status: GOOD (  25.20  )
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

T24gVHVlLCBGZWIgMTgsIDIwMjUgYXQgMDQ6MDA6MjRQTSArMDgwMCwg6aG55paH5oiQIHdyb3Rl
Ogo+IEZyb20gMzBkZDAwZjY4ODYxMTllY2M1YzM5YjZiODhmODYxN2E1N2U1OThmYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBCaWxsWGlhbmcgPHhpYW5nd2VuY2hlbmdAbGFueGlu
Y29tcHV0aW5nLmNvbT4KPiBEYXRlOiBUdWUsIDE4IEZlYiAyMDI1IDE1OjQ1OjUyICswODAwCj4g
U3ViamVjdDogW1BBVENIXSByaXNjdjogS1ZNOiBSZW1vdmUgdW5uZWNlc3NhcnkgdmNwdSBraWNr
Cj4gCj4gSGVsbG8gZXZlcnlvbmUsCj4gSSdtIHdvbmRlcmluZyB3aGV0aGVyIGl0J3MgbmVjZXNz
YXJ5IHRvIGtpY2sgdGhlIHZpcnR1YWwgaGFydAo+IGFmdGVyIHdyaXRpbmcgdG8gdGhlIHZzZmls
ZSBvZiBJTVNJQy4KPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIHdyaXRpbmcgdG8gdGhlIHZzZmls
ZSBzaG91bGQgZGlyZWN0bHkKPiBmb3J3YXJkIHRoZSBpbnRlcnJ1cHQgYXMgTVNJIHRvIHRoZSB2
aXJ0dWFsIGhhcnQuIFRoaXMgbWVhbnMgdGhhdAo+IGFuIGFkZGl0aW9uYWwga2ljayBzaG91bGQg
bm90IGJlIG5lY2Vzc2FyeSwgYXMgaXQgd291bGQgY2F1c2UgdGhlCj4gdkNQVSB0byBleGl0IHVu
bmVjZXNzYXJpbHkgYW5kIHBvdGVudGlhbGx5IGRlZ3JhZGUgcGVyZm9ybWFuY2UuCj4gSSd2ZSB0
ZXN0ZWQgdGhpcyBiZWhhdmlvciBpbiBRRU1VLCBhbmQgaXQgc2VlbXMgdG8gd29yayBwZXJmZWN0
bHkKPiBmaW5lIHdpdGhvdXQgdGhlIGV4dHJhIGtpY2suCj4gV291bGQgYXBwcmVjaWF0ZSBhbnkg
aW5zaWdodHMgb3IgY29uZmlybWF0aW9uIG9uIHRoaXMhCj4gQmVzdCByZWdhcmRzLgoKVGhlIGFi
b3ZlIHNob3VsZCBiZSBpbiBhIGNvdmVyIGxldHRlciBzbyB0aGUgY29tbWl0IG1lc3NhZ2UgY2Fu
CmJlIHdyaXR0ZW4gZm9sbG93aW5nIHRoZSBndWlkZWxpbmVzIG9mIFsxXQoKWzFdIERvY3VtZW50
YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0Cgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEJpbGxYaWFuZyA8eGlhbmd3ZW5jaGVuZ0BsYW54aW5jb21wdXRpbmcuY29tPgo+IC0tLQo+IMKg
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCAxIC0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIv
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBpbmRleCBhODA4NWNkODIxNWUuLjI5ZWY5YzIx
MzNhOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk3NCw3ICs5NzQsNiBAQCBpbnQga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gCj4gwqDC
oCDCoCDCoMKgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7Cj4gwqDCoCDCoCDCoCDCoCDC
oCDCoCDCoMKgIHdyaXRlbChpaWQsIGltc2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlPX1NFVElQ
TlVNX0xFKTsKPiAtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGt2bV92Y3B1X2tpY2sodmNwdSk7CgpX
ZSBjYW4ndCBjb21wbGV0ZWx5IHJlbW92ZSB0aGUga2ljaywgYnV0IHdlIGNvdWxkIHJlcGxhY2Ug
aXQgd2l0aCBhCmt2bV92Y3B1X3dha2VfdXAoKS4KClRoZXJlJ3MgYWxzbyBhIGtpY2sgaW4ga3Zt
X3Jpc2N2X3ZjcHVfdnN0aW1lcl9leHBpcmVkKCkgd2hpY2ggY291bGQgYmUgYQprdm1fdmNwdV93
YWtlX3VwKCkgd2hlbiBoaWRlbGVnIGhhcyBJUlFfVlNfVElNRVIgc2V0ICh3aGljaCBpdCBjdXJy
ZW50bHkKYWx3YXlzIGRvZXMpLgoKVGhhbmtzLApkcmV3Cgo+IMKgwqAgwqAgwqDCoCB9IGVsc2Ug
ewo+IMKgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBlaXggPSAmaW1zaWMtPnN3ZmlsZS0+ZWl4W2lp
ZCAvIEJJVFNfUEVSX1RZUEUodTY0KV07Cj4gwqDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgIHNldF9i
aXQoaWlkICYgKEJJVFNfUEVSX1RZUEUodTY0KSAtIDEpLCBlaXgtPmVpcCk7Cj4gLS0KPiAyLjQ2
LjIKPiAKPiAtLSAKPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4ga3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
