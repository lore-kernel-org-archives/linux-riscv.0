Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CCECD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HY3PcZShTTyMoXQa2sAPF47KpQecYEiY7B2lMPPRvKY=; b=kHPCzbVBceoD3c
	Zy+Dk/4ZhVPZvaetj9MyI0uAQYjj25YTO2XG5xGIrQRe3cBTNND9+L86f/ysGZXSu/uPkPLlKEE9Z
	JRo9VyJtd8HFf3e9GrHOEKvLyz9D9WZc81pDPRSVxGjX1XDw24UyiUCBIET2egUfm4zqiEcGUvyPV
	mMMNBeUatcbXFpcyJN6vysEqCXxQryXgyHnhIepZ6U2bSOj5GKUeXMlDu7MVSOOOb5naorP5Pf6qq
	hqMIL1Ym8uXbB0gFW/08LxVpzwJJG5GnaFiXeOwL+vjKgYwai6vbgJToWyLLm2soSFqUkdM6FxFwI
	67ZUp27DL/jOCZfWcy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsN0R-00000002mye-0fAq;
	Thu, 04 Apr 2024 13:19:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsN0M-00000002mwr-13sT
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 13:19:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-56e0f359240so1230879a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712236782; x=1712841582; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0GjkWFp3ApOurs5n8Si7/xNCJaddk/YxQVfZe4wLlwY=;
        b=ZwX6J0yoX9ejAQ7xihvNGgwL1x6J5+ns1eiU7qj6p87vH+7OIZrcvmWTQmuEAdwHPS
         HKCkqWYvKdV050+p0SL9AofPkk0koMi9OY3xLK/6Q3gRX1BZrregIaTu4XeJBQ6gBtLc
         UKEZg98XzHajpuL/c0qBK1jL2oFEkkV66Cgwaa8GudeNa0U34h4XOQbnsRBqrjlNRL2l
         WBjpnpdewhLF0DVQmAFkn8d/2oOBxjjOXVm2Iu5f3FWKOoOKB1E7hV5l282+Yp48dhQM
         TICCcR+1u0jqEndv5Z85DzT2zD+b++nGw4BTcGiOqZeqGoJ0pFJk4TlfhqBU2+SrGab1
         w35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712236782; x=1712841582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GjkWFp3ApOurs5n8Si7/xNCJaddk/YxQVfZe4wLlwY=;
        b=Nlik3pCXbVBaVb1qiswSISib9D/5Ajf42lFORwiwDnt/or2aJ/FWuXZ6/Jsxpn5DZ+
         Vx2jCvIdugpBgjPpgAybOwMZRDYwGJH1jFF3tEPwGf/WrTrOn64K0eYRdvVe7cNhvQiV
         Rkjgr4CBZISi0d08FPo22wxjTrusMgw10byPpLxmePCCjrnXLASjy6QcLd24t7j6vlzN
         5r653y53qKgG+G4QAfrNavodIRhooj6XWhA1hooT1+ao5ULNhwNOqnRW2yxiYMvl4PMu
         tHYWq5v8zeIb8+KEOuHg5Ke1EKcG9YtEcFvtVO4A5k5/JHD2i7rV6CtO2g1mNfJxT6KE
         jBWA==
X-Forwarded-Encrypted: i=1; AJvYcCUuUFjpkb8OfAk1oh/daPxrpSfPBZX/JQFCliX2B4gkt2OEcK+ccodnB0DRql9pQWGZ6yzgjUcJ0otzU5dCTPTjGcHUD74rs+4Z2dLRkBTn
X-Gm-Message-State: AOJu0YymbH2G+BIXHZLE3PkuAdy9ffE9QWz9b9GWVxRezdMN55na4yR2
	4UI9fAbV24jSrzX4DXWBVUpSBGaUrZfQe56KXGHH48IFzWmf5vtllBJ7PM8TTto=
X-Google-Smtp-Source: AGHT+IGJsfjeRV8JN7BFQhANoFqMbTK9dha2lq1Z2/LpaV5C6zDTl7nzvlfIm+foWwn07Yd8JQ0d1g==
X-Received: by 2002:a17:906:e0da:b0:a4e:9b06:db52 with SMTP id gl26-20020a170906e0da00b00a4e9b06db52mr1574450ejb.45.1712236782551;
        Thu, 04 Apr 2024 06:19:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id eb16-20020a170907281000b00a4e0df9e793sm9062928ejc.136.2024.04.04.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 06:19:42 -0700 (PDT)
Date: Thu, 4 Apr 2024 15:19:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 08/15] RISC-V: KVM: Implement SBI PMU Snapshot feature
Message-ID: <20240404-0eb0261d56c48ac9472dfe5a@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-9-atishp@rivosinc.com>
 <20240302-6ae8fe37b90f127bc9be737f@orel>
 <CAOnJCUKjZWnS_SaR78Fy5AUOxrd+4gBx=_YrA=FQCa20iwifNQ@mail.gmail.com>
 <a75fa96e-2f26-49a7-a7f7-4a397c4a4513@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a75fa96e-2f26-49a7-a7f7-4a397c4a4513@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_061946_328576_7DEAE1C3 
X-CRM114-Status: GOOD (  30.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMDMsIDIwMjQgYXQgMTI6MzY6NDFBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gNC8xLzI0IDE1OjM2LCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IE9uIFNhdCwgTWFy
IDIsIDIwMjQgYXQgMTo0OeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5j
b20+IHdyb3RlOgo+ID4gPiAKPiA+ID4gT24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMDU6MDE6MjNQ
TSAtMDgwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Ci4uLgo+ID4gPiA+ICsKPiA+ID4gPiAgICAgICAg
ICAgICAgICBpZiAoZmxhZ3MgJiBTQklfUE1VX1NUT1BfRkxBR19SRVNFVCkgewo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgcG1jLT5ldmVudF9pZHggPSBTQklfUE1VX0VWRU5UX0lEWF9J
TlZBTElEOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfYml0KHBtY19pbmRl
eCwga3ZwbXUtPnBtY19pbl91c2UpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAo
c25hcF9mbGFnX3NldCkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8q
IENsZWFyIHRoZSBzbmFwc2hvdCBhcmVhIGZvciB0aGUgdXBjb21pbmcgZGVsZXRpb24gZXZlbnQg
Ki8KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdnBtdS0+c2RhdGEtPmN0
cl92YWx1ZXNbaV0gPSAwOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt2
bV92Y3B1X3dyaXRlX2d1ZXN0KHZjcHUsIGt2cG11LT5zbmFwc2hvdF9hZGRyLCBrdnBtdS0+c2Rh
dGEsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2l6ZW9mKHN0cnVjdCByaXNjdl9wbXVfc25hcHNob3RfZGF0YSkpOwo+ID4gPiAKPiA+
ID4gVGhlIHNwZWMgaXNuJ3QgY2xlYXIgb24gdGhpcyAoc28gd2Ugc2hvdWxkIGNsYXJpZnkgaXQp
LCBidXQgSSdkIGV4cGVjdAo+ID4gPiB0aGF0IGEgY2FsbGVyIHdobyBzZXQgYm90aCB0aGUgcmVz
ZXQgYW5kIHRoZSBzbmFwc2hvdCBmbGFnIHdvdWxkIHdhbnQKPiA+ID4gdGhlIHNuYXBzaG90IGZy
b20gYmVmb3JlIHRoZSByZXNldCB3aGVuIHRoaXMgY2FsbCBjb21wbGV0ZXMgYW5kIHRoZW4KPiA+
ID4gYXNzdW1lIHRoYXQgd2hlbiB0aGV5IHN0YXJ0IGNvdW50aW5nIGFnYWluLCBhbmQgbG9vayBh
dCB0aGUgc25hcHNob3QKPiA+ID4gYWdhaW4sIHRoYXQgdGhvc2UgbmV3IGNvdW50cyB3b3VsZCBi
ZSBmcm9tIHRoZSByZXNldCB2YWx1ZXMuIE9yIG1heWJlCj4gPiA+IG5vdCA6LSkgTWF5YmUgdGhl
eSB3YW50IHRvIGRvIGEgcmVzZXQgYW5kIHRha2UgYSBzbmFwc2hvdCBpbiBvcmRlciB0bwo+ID4g
PiBsb29rIGF0IHRoZSBzbmFwc2hvdCBhbmQgY29uZmlybSB0aGUgcmVzZXQgaGFwcGVuZWQ/IEVp
dGhlciB3YXksIGl0Cj4gPiA+IHNlZW1zIHdlIHNob3VsZCBvbmx5IGRvIG9uZSBvZiB0aGUgdHdv
IGhlcmUuIEVpdGhlciB1cGRhdGUgdGhlIHNuYXBzaG90Cj4gPiA+IGJlZm9yZSByZXNldHRpbmcs
IGFuZCBub3QgYWdhaW4gYWZ0ZXIgcmVzZXQsIG9yIHJlc2V0IGFuZCB0aGVuIHVwZGF0ZQo+ID4g
PiB0aGUgc25hcHNob3QgKHdpdGggbm8gbmVlZCB0byB1cGRhdGUgYmVmb3JlKS4KPiA+ID4gCj4g
PiAKPiA+IFRoZSByZXNldCBjYWxsIHNob3VsZCBoYXBwZW4gd2hlbiB0aGUgZXZlbnQgaXMgZGVs
ZXRlZCBieSB0aGUgcGVyZgo+ID4gZnJhbWV3b3JrIGluIHN1cGVydmlzb3IuCj4gPiBJZiB3ZSBk
b24ndCBjbGVhciB0aGUgdmFsdWVzLCB0aGUgc2hhcmVkIG1lbW9yeSBtYXkgaGF2ZSBzdGFsZSBk
YXRhIG9mCj4gPiBsYXN0IHJlYWQgY291bnRlcnMKPiA+IHdoaWNoIGlzIG5vdCBpZGVhbC4gVGhh
dCdzIHdoeSwgSSBhbSBjbGVhcmluZyBpdCB1cG9uIHJlc2V0dGluZy4KPiAKPiBUaGlua2luZyBh
Ym91dCBpdCBtb3JlLCBJIHRoaW5rIGhhdmluZyBzdGFsZSB2YWx1ZXMgaW4gdGhlIHNoYXJlZCBt
ZW1vcnkKPiB3b3VsZCBiZSBzaW1pbGFyIGV4cGVjdGVkIGJlaGF2aW9yIHRvIGhhcmR3YXJlIGNv
dW50ZXJzIGFmdGVyIHJlc2V0LiBXZQo+IGRvbid0IG5lZWQgdG8gY2xlYXIgdGhlIHNoYXJlZCBt
ZW1vcnkgZHVyaW5nIHRoZSByZXNldC4KPiAKPiBJZiBib3RoIFNCSV9QTVVfU1RPUF9GTEFHX1RB
S0VfU05BUFNIT1QgYW5kIFNCSV9QTVVfU1RPUF9GTEFHX1JFU0VUIGFyZSBzZXQsCj4gbWF5IGJl
IHdlIHNob3VsZCBqdXN0IHdyaXRlIGl0IHRvIHRoZSBzaGFyZWQgbWVtb3J5IGFnYWluIHdpdGhv
dXQgYXNzdW1pbmcKPiB0aGUgaW50ZW50aW9uIG9mIHRoZSBjYWxsZXIgPwo+CgpFaXRoZXIgd2F5
LCB3ZSBqdXN0IG5lZWQgdG8gZW5zdXJlIGl0J3MgY2xlYXIgaW4gdGhlIHNwZWMuCgpUaGFua3Ms
CmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
