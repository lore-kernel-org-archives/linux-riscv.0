Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD9BEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTcE547BNPmi3EQ1QHdaeQ4yd7knSorI6CbYjSA7olE=; b=i+0T+ApK5ZvPm6
	a41/T2l0+ioq24VdsRTknzGQURGOIVOk+YsOu3RMgHmG+yzk+O4yP3RjfTkyvNCmMWd7JFD/K1/+Q
	mRoigb/C1cC6fZLifxi7KHCfw2ETWPad/aRcDpVr2O1eEhfbo+VXWIpyIBqGou/oz5/alrrOHSYvY
	Z1VhNo5yf8F2ndaptQQ96hj2xaSvE6dJSFhPeYhGPbPMBg/L5uqZfNKGOn2n/tA5UK0MTwEDwYwM7
	fGTBpqlT9OBzkt28GTcSM1gVJRLL3SHySjOwHcxnVpAWkZofMDrRpY8FgG91MCyOEuStexnApor4X
	n5asseMzC2Ae6st0e8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBYqI-00B1aj-2I;
	Tue, 20 Jun 2023 10:44:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBYqF-00B1YF-1x
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 10:44:08 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b44eddb52dso64033871fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687257843; x=1689849843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faoJAf5HLjrBrs+IcgqfpLzetaGrKEXpSA60Yow7EsE=;
        b=OXFUWVLjaJd8V9KgupeF1CaurU0XOAFsMPzh9+id4S8/d8ji5GgCReuF9khP1ihvKd
         0KgLg1nz5tSh27tKR9fB1rjF/XSRcxxL1tmJs+CJo5nL8XUFi43p5PVOW9oXfzPy/9yC
         2hVdaH92UXlfjD8A/EVr0C7PMifQrez3wBrHbPfAHFg3wKuqcUngTOW++5kNPD2I0NqO
         r598tt/yFZhISYVLyyV39SZJzpz87uuYMxksCVkikmrBSfzjE8iN1FYpsNDQIapyxS2y
         vgEUu8QmDAKep7JUJK+MtpIShhSAlWybuPpJfJ5wW71E6sx6bKZoOir0VaHg9JjEIe44
         9GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687257843; x=1689849843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faoJAf5HLjrBrs+IcgqfpLzetaGrKEXpSA60Yow7EsE=;
        b=YAXGF+GQQ1Z2Dm1H4czNEBPM7R4QRlJ9YYFRxtiQck7T8ktGQbmBHBld2+GhV3lwRx
         XwHWk03M18Wq3Y+4gXY4NHDnuHGdyb/89x45GixtW+bfjFAtsDSzUQriXQIsfNC3BxRH
         5YFa8NCmLYRkXmdNZnlEQmp5HBk+Z8ssxRLcQNuPCUzM5OuTl2U48hZGh58e7iz0wep5
         cgw+UMzMR1CKM/n1YkwnfeoSuTw3RSaxq0NVMgn1SLoqGjZ/ezeiBDir/lyi9CJX75LM
         8iD4KK41YuC9627CyeUpsIUm+rZyu4Cn5l3Z73yycIT8WEmubumlCESDzXssultzx/Ed
         IFwQ==
X-Gm-Message-State: AC+VfDxtu8Q/pUuhz2zYWpqHy+0/KzaQAAeBv5iirIT9XTv02NwjPPsK
	PrVZsRCG4IzqFjR1aVFNivrxvg==
X-Google-Smtp-Source: ACHHUZ4P2ZMWloakXb40I06YdKtCNuGDp3Bvc4L3BXixlWUCHvujiSGB/uspgI/o6yV+CHWEQKCXyA==
X-Received: by 2002:a2e:9593:0:b0:2b1:be57:5c0c with SMTP id w19-20020a2e9593000000b002b1be575c0cmr7642708ljh.12.1687257842994;
        Tue, 20 Jun 2023 03:44:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p16-20020a170906141000b0096f937b0d3esm1158226ejc.3.2023.06.20.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 03:44:02 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:44:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Gardon <bgardon@google.com>, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 10/10] KVM: riscv: selftests: Add get-reg-list test
Message-ID: <20230620-95ce8ab70956a72b9da3a31a@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com>
 <8cd4ce50f5f4a639f4508085959aae222d4d4386.1686275310.git.haibo1.xu@intel.com>
 <20230609-fba04b424a4d46574e04e587@orel>
 <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8okjRZEt6_6SB9EWm+6c7utpExzenfWo2T1N-J6G9w9czQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_034407_642726_39AACDDD 
X-CRM114-Status: GOOD (  25.26  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMDY6MDU6NTlQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBKdW4gOSwgMjAyMyBhdCA5OjM14oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdW4gMDksIDIwMjMgYXQg
MTA6MTI6MThBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+ICtzdGF0aWMgc3RydWN0IHZj
cHVfcmVnX2xpc3QgYWlhX2NvbmZpZyA9IHsKPiA+ID4gKyAgICAgLnN1Ymxpc3RzID0gewo+ID4g
PiArICAgICBCQVNFX1NVQkxJU1QsCj4gPiA+ICsgICAgIEFJQV9SRUdTX1NVQkxJU1QsCj4gPiA+
ICsgICAgIHswfSwKPiA+ID4gKyAgICAgfSwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0YXRp
YyBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCBmcF9mX2RfY29uZmlnID0gewo+ID4gPiArICAgICAuc3Vi
bGlzdHMgPSB7Cj4gPiA+ICsgICAgIEJBU0VfU1VCTElTVCwKPiA+ID4gKyAgICAgRlBfRl9SRUdT
X1NVQkxJU1QsCj4gPiA+ICsgICAgIEZQX0RfUkVHU19TVUJMSVNULAo+ID4gPiArICAgICB7MH0s
Cj4gPiA+ICsgICAgIH0sCj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdHJ1Y3QgdmNwdV9yZWdf
bGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gPiA+ICsgICAgICZ6aWNib19jb25maWcsCj4gPiA+
ICsgICAgICZhaWFfY29uZmlnLAo+ID4gPiArICAgICAmZnBfZl9kX2NvbmZpZywKPiA+ID4gK307
Cj4gPiA+ICtpbnQgdmNwdV9jb25maWdzX24gPSBBUlJBWV9TSVpFKHZjcHVfY29uZmlncyk7Cj4g
PiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgo+ID4KPiA+IEkgc2VlIHdlIGhhdmUgYSBiaXQgb2Yg
YSBwcm9ibGVtIHdpdGggdGhlIGNvbmZpZ3MgZm9yIHJpc2N2LiBTaW5jZSB3ZQo+ID4gZG9uJ3Qg
ZGlzYWJsZSBhbnl0aGluZyB3ZSdyZSBub3QgdGVzdGluZywgdGhlbiBmb3IgYW55IHRlc3QgdGhh
dCBpcwo+ID4gbWlzc2luZywgZm9yIGV4YW1wbGUsIHRoZSBmIGFuZCBkIHJlZ2lzdGVycywgd2Un
bGwgZ2V0IG91dHB1dCBsaWtlCj4gPiAiVGhlcmUgYXJlIDY2IG5ldyByZWdpc3RlcnMuIENvbnNp
ZGVyIGFkZGluZyB0aGVtIHRvIHRoZSBibGVzc2VkIHJlZwo+ID4gbGlzdCB3aXRoIHRoZSBmb2xs
b3dpbmcgbGluZXM6IiBhbmQgdGhlbiBhIGR1bXAgb2YgYWxsIHRoZSBmIGFuZCBkCj4gPiByZWdp
c3RlcnMuIFRoZSB0ZXN0IGRvZXNuJ3QgZmFpbCwgYnV0IGl0J3MgbWVzc3kgYW5kIGNvbmZ1c2lu
Zy4gSWRlYWxseQo+ID4gd2UnZCBkaXNhYmxlIGFsbCByZWdpc3RlcnMgb2YgYWxsIHN1Ymxpc3Rz
IG5vdCBpbiB0aGUgY29uZmlnLCBwcm9iYWJseQo+ID4gYnkgc3RhcnRpbmcgYnkgZGlzYWJsaW5n
IGV2ZXJ5dGhpbmcgYW5kIHRoZW4gb25seSByZWVuYWJsaW5nIHRoZSBvbmVzCj4gPiBpbiB0aGUg
Y29uZmlnLgo+ID4KPiA+IEFueXRoaW5nIHRoYXQgY2FuJ3QgYmUgZGlzYWJsZWQgaXMgZWl0aGVy
IGEgS1ZNIGJ1ZywgaS5lLiB3ZSBzaG91bGQKPiA+IGJlIGFibGUgdG8gZGlzYWJsZSBpdCwgYmVj
YXVzZSB3ZSBjYW4ndCBleHBlY3QgZXZlcnkgaG9zdCB0byBoYXZlIGl0LAo+ID4gb3IgaXQgbmVl
ZHMgdG8gYmUgaW4gdGhlIGJhc2UgcmVnaXN0ZXIgc3VibGlzdCAobWVhbmluZyBldmVyeSBob3N0
Cj4gPiB3aWxsIGFsd2F5cyBoYXZlIGl0KS4KPiA+Cj4gCj4gSEkgQW5kcmV3LAo+IAo+IEkgZm91
bmQgc2V2ZXJhbCBtdWx0aS1sZXR0ZXJzIElTQSBFWFQoQUlBL1NTVEMgZXRjKSB3ZXJlIG5vdCBh
bGxvd2VkCj4gdG8gYmUgZGlzYWJsZWQuCj4gSXMgaXQgYSBidWc/IHNoYWxsIHdlIGZpeCBpdO+8
nwoKRXh0ZW5zaW9ucyB0aGF0IGEgZ3Vlc3QgY291bGQgdXNlIChyZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgb3Igbm90IHRoZSBob3N0CmRlc2NyaWJlZCBpdCBpbiB0aGUgZ3Vlc3QncyBpc2Egc3RyaW5n
KSwgYmVjYXVzZSB0aGUgaW5zdHJ1Y3Rpb25zIG9yIENTUgphY2Nlc3NlcyBkb24ndCB0cmFwLCBj
YW4ndCB0cnVseSBiZSBkaXNhYmxlZC4gU28sIGl0J3Mgbm90IGEgYnVnIHRvCnByb2hpYml0IGRp
c2FibGluZyB0aGVtIGFuZCBpbmRlZWQgdGhlIHRlc3QgY2FzZXMgc2hvdWxkIGFjdHVhbGx5IGVu
c3VyZQpkaXNhYmxpbmcgdGhlbSBmYWlscy4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
