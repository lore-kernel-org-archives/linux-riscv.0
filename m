Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048ACD98F3
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 05:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCsbIfAYTjyrIYbMQPvpsRWT8iE3q0FQpoWzlsU/lCI=; b=j8k8KVG+P4JU2G
	NvTk+y4GGWukYsGNeirlATxF/skHT3dTKV0/iKKE+K4Mex1WCJTbsxrzTFcdoJ/7t4UUCGcV0iA1o
	+jG0d0IiHgU92ioHA1kVr9VqMpZsooz9zY2YcnX2qwpiU2Qs2Pjo/W4ICidICrTxWcZd3UTYn0hta
	Fce2K1PePh/2nmbWWLG/TI8K9iqTpFrrDmu8HHzNiXWDIzhPOtMRwv/lKfEeSOs2oPQOdKniE292Q
	TPZfswJS2rzkPnXwiISCWJHl6CaOlHBCRMqEfDm7RwDCa1/+/binqfsOETWKhFbFJTMS4qk/l6TW1
	fAzmkl2KCap7kZQheFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqS85-00Es3V-2h;
	Wed, 11 Oct 2023 05:51:33 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqS83-00Es2c-0P
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 05:51:32 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5892832f8daso501894a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 22:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697003488; x=1697608288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgOOUrxhrQpKc0UcO6mj9tBnrpY40gn5l4EwRcu1NOI=;
        b=DDqokHiMbsGTUy0QKDCBxNRGpEF/fMKsbOm/DQ2CpCgRCNwFnU1+XsfQFbluiRdu5D
         WLvsYRxvSm78oPJ4Cj2gSEIzf2FJj6Oqxg99YdC/eia6I+CNcf3PdxYw1UdbdgwvDrmi
         HcYTHHawCTP3lV087BRh1JqbcPJtLb3VCpbtsBaCWhEkZTHRbobbWcTQhErN1e5yQSHg
         ys3ELNTbahMKjwMTNSRyRP9lhrJ7KX2kAQe5rNyrXa7us3tHF7C3NTrTkgnQRzBQWAFe
         DEk004grqNEk635st238i9yAeqfgunYcEuoBBHNfVxw2m9eobbb5pPQ6DM6+bOw7Gg7M
         fVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697003488; x=1697608288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgOOUrxhrQpKc0UcO6mj9tBnrpY40gn5l4EwRcu1NOI=;
        b=Bj5siWrUJcD8ck6UvoQYCotQyfiHpb7jepgm1LC+Nm3JqAA8wXRWaNvlnKHPC9Ptof
         DncojX75RkSoshS1BAI4X8lpCkDnSR0nhIf3R/PWxj/JDXRStrVvdsjDXg7P5dXvlfI7
         DwP+1M8f6UI5w2T7ECuHsxkPNuHR87Qu2Q1c1BqDfsWEc8Qn8g7uHRH1GlVv7i/H+jHx
         AEHXUfTH+WsXOdPw2XU/jyMw+B7J+A2gh4KFrjQdXz1gu8cfxbTWmm8WCVIhh3ZOsz8h
         79qM3YIj2x8AelM90gw3ObEchqQNen5OqmAdc2w5aWEQmW8o9JxvwI7u6ZxUMiP3ry7A
         hR9A==
X-Gm-Message-State: AOJu0Yz7MWEWKzdSPcpDWvixcsWGYOIywuz20LBqIPKuAsCniGWuLPWn
	s9tYBcqXe1gP1W2J99Sme/XTS9vhC4eYcjxldnkexw==
X-Google-Smtp-Source: AGHT+IEAxE7QdFbbOPuVcJD52vAqLrqPEDqxTXMyXoDEBFNSRVwd6lB/XppSiIl4XgAPPxR1exDjPPNx2wJzk6+Jr1M=
X-Received: by 2002:a17:90a:af86:b0:277:4be4:7a84 with SMTP id
 w6-20020a17090aaf8600b002774be47a84mr25295223pjq.19.1697003487902; Tue, 10
 Oct 2023 22:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-6-apatel@ventanamicro.com> <2023101045-hazard-popcorn-7d19@gregkh>
In-Reply-To: <2023101045-hazard-popcorn-7d19@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:21:17 +0530
Message-ID: <CAK9=C2WvfPg1tCpNLgDteaQGBVAsPL3S+vdvgEsBb8PCx2W8xw@mail.gmail.com>
Subject: Re: [PATCH 5/6] tty: Add SBI debug console support to HVC SBI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_225131_175867_37228BDD 
X-CRM114-Status: GOOD (  15.79  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMTA6NDLigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDEwLCAyMDIz
IGF0IDEwOjM1OjAyUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiAtLS0gYS9kcml2ZXJz
L3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gPiArKysgYi9kcml2ZXJzL3R0eS9odmMvaHZjX3Jp
c2N2X3NiaS5jCj4gPiBAQCAtMTUsNiArMTUsNyBAQAo+ID4KPiA+ICAjaW5jbHVkZSAiaHZjX2Nv
bnNvbGUuaCIKPiA+Cj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9TQklfVjAxCj4KPiBQbGVhc2Ug
bm8gI2lmZGVmIGluIGEgLmMgZmlsZSwgdGhhdCdzIG5vdCBhIGdvb2Qgc3R5bGUgZm9yIExpbnV4
IGNvZGUgYXQKPiBhbGwuCj4KPiBBbmQgd2hhdCBpZiB5b3Ugd2FudCB0byBidWlsZCB0aGUgZHJp
dmVyIGZvciBib3RoIG9wdGlvbnMgaGVyZT8gIFdoYXQKPiB3aWxsIGhhcHBlbj8KCk9rYXksIEkg
d2lsbCByZW1vdmUgYWxsICNpZmRlZiBmcm9tIC5jIGZpbGUKCj4KPiA+ICtzdGF0aWMgaW50IGh2
Y19zYmlfZGJjbl90dHlfcHV0KHVpbnQzMl90IHZ0ZXJtbm8sIGNvbnN0IGNoYXIgKmJ1ZiwgaW50
IGNvdW50KQo+ID4gIHsKPiA+IC0gICAgIHJldHVybiBQVFJfRVJSX09SX1pFUk8oaHZjX2FsbG9j
KDAsIDAsICZodmNfc2JpX29wcywgMTYpKTsKPiA+ICsgICAgIHBoeXNfYWRkcl90IHBhOwo+ID4g
KyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiArCj4gPiArICAgICBpZiAoaXNfdm1hbGxvY19h
ZGRyKGJ1ZikpCj4gPiArICAgICAgICAgICAgIHBhID0gcGFnZV90b19waHlzKHZtYWxsb2NfdG9f
cGFnZShidWYpKSArIG9mZnNldF9pbl9wYWdlKGJ1Zik7Cj4gPiArICAgICBlbHNlCj4gPiArICAg
ICAgICAgICAgIHBhID0gX19wYShidWYpOwo+ID4gKwo+ID4gKyAgICAgcmV0ID0gc2JpX2VjYWxs
KFNCSV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfV1JJVEUsCj4gPiArI2lmZGVmIENP
TkZJR18zMkJJVAo+ID4gKyAgICAgICAgICAgICAgIGNvdW50LCBwYSwgKHU2NClwYSA+PiAzMiwK
PiA+ICsjZWxzZQo+ID4gKyAgICAgICAgICAgICAgIGNvdW50LCBwYSwgMCwKPiA+ICsjZW5kaWYK
Pgo+IFRoaXMgaXMgbm90IGhvdyB0byBkbyBhbiBhcGksIHNvcnJ5LCBhZ2FpbiwgcGxlYXNlIG5v
ICNpZmRlZiBpZiB5b3Ugd2FudAo+IHRvIHN1cHBvcnQgdGhpcyBjb2RlIGZvciB0aGUgbmV4dCAy
MCsgeWVhcnMuCgpTdXJlLCBJIHdpbGwgdXBkYXRlIGxpa2UgeW91IHN1Z2dlc3RlZC4KCj4KPiB0
aGFua3MsCj4KPiBncmUgZ2staAoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
