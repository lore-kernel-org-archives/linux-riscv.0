Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9118D59D78
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID4bmPV7iOyVjDKQxGTAA02jH5RRaSk51qOlN6qWWeE=; b=RJav/TINbJRMt+
	Rl0v2mUF7dezZ0CDthH9GEdvLPU/S6yGhJgpCQ7Lf3KFL+bk2KJfbQklOjbihtvJXQUoamETRYPtw
	jelf+yKcXchbxNJYvhhaTW1B0MGCDAdQGGXU8k9XJr3GBd0BWwDGC/0MiglXvfc7qIrsqJ4S2wVpt
	pyQkYmbCj0l9mRttHcbzU80nL8jxwnJTSVrIKG3kTCy52ex4yflckzqpEkOgEBrKOO8EGRIxts/el
	Xdh2JsNxdJlEjKx7tNNUga3vMTgEYgpNdG2bQSMx2FvpOzzCJEV+hbGC2Vpn6mMe5tWVsekR6X5MD
	aQcaol+c3DY2TPMVkrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU68q-00000000qYk-3YtB;
	Fri, 12 Dec 2025 16:37:16 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU68p-00000000qXz-0TyO
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 16:37:16 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso1118778137.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Dec 2025 08:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765557433; x=1766162233; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTTjk1mKJjy51wjm1/rWKMhV1evykFk3Rc07/pQQpkU=;
        b=PMAA2iAa/DLYXUQ6P9om1czGQZ3RPoLpu6jBqP8TjHd6HTrDGUK58bUJFg2VnuKcWw
         yMakDfGaqrrUhT/dZSFryj+AtMfe79Z7NDuvYgBS+mOuRdkcC8eCmwB8PyIeHAvfYyt+
         LJdcW5IhAoPdqWSlbq/onuEZkkvPrzvEBk662camP+RbIxmQfwtAVrXhgP1hwXt5+IlI
         IpolfKqKcT9nQtRpiWfcwJ9UFPTC5h62o3qdnhuXeb/10SoIYMfuWtoZKfQ4uBnqebMF
         gV/5uQ14l7OJMHjqLgtPmW9SbwoMnDTY9JbmBRZIG+zm8Xw9P9+IQ/OoD9aGov8W0ghd
         nFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765557433; x=1766162233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTTjk1mKJjy51wjm1/rWKMhV1evykFk3Rc07/pQQpkU=;
        b=M0qayKpBWiKv94CDNiRv39NKIXsNz88XU2wmwHukXfVIMP5M8zvNqV5xrRzOgMayKy
         h9VPm0kmc3uK1JbIRMrDjbrdjUtaFveOcKwA2F7qgvW36+PkEckr+uyIWJa7hPXGUlgH
         A/sqIaGSW6yWjJed8lwg47ra/wV8+nGRr8T1C7u3dL0YXA3P3ZaLWCHc5bsr6jujM+At
         Wq5/UPQCfCIuFOa260dwbMUABUICgkH+sJ+hjQFELog5s1WN0SmdkR6Iw7d4hwTmwXcL
         91De/LmP0sbaI/+wAxnO8I5KRVCmrf6Sde8EEmGelHvmljlXRUzFachRxnm7U5/yrKVj
         kDPA==
X-Forwarded-Encrypted: i=1; AJvYcCUO9CwNt8pMoCwvKMtDi2KKgAHOOBPB7E+5FojA3ZyZP8ryBMuUpt1nX373l4J7dXpEAZ8YYjQe6ssBXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQaucBYsQmU5WpTzsU7XWEKqojCYYz/auvEIUgjTDl9XZ8y8dL
	lT8wqV7slQCPHbOcl6YkHBEozNxfqStXMX37Di2kU20Y8eLcc0oeC7S7KH4LCchjTEN6uF9VfpV
	yyGsVquXAjEwrYSrR9T5+SgWMjatPZcg=
X-Gm-Gg: AY/fxX7o5KCLq01gcSt/Av7blbsdDftZSnvpeIp0DvOAEhbToM8ZUG94RVjzJuW5sW3
	akZYAtfbXJvYEvMQo+TnmT3Gg83lKe6e/fllyt8p1PKj3nOJjYOrmTYeMgXbNBr8GsjR4op+/Z9
	l7j2zlFBtm0CxAfTgKSg6Weq5a7RrpoQATFiWh7nrSv/770JZEUkWLNZbuf18Itk+yc0l0C1P5I
	BPFWtq4G4XU2HwcpcQRwaNvP5qogEcJqOOaoY7WAsagEuLCzIfvG1ljWJ8k7ftdKTwZ3iDNqUrg
	EnBjknXZjISFPcGuPan7NcjebY0=
X-Google-Smtp-Source: AGHT+IEmURzg5cRq1ejWt1HCatJ1KEfkg4a12ShNMdgctc9w6nx0/ltVEw0JGksnR5pgpKaKzfUIItEkHloL5deSrfk=
X-Received: by 2002:a05:6102:dcc:b0:5db:ecac:5800 with SMTP id
 ada2fe7eead31-5e825a8bdf7mr1123946137.19.1765557432606; Fri, 12 Dec 2025
 08:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20250713155321.2064856-1-guoren@kernel.org> <20250713155321.2064856-3-guoren@kernel.org>
 <1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr> <CAAT7Ki9_Vm0+v9RHpa2w-Bg3agJy2Tp4d6+tcPJ=M7XX3GV-7Q@mail.gmail.com>
 <CAHVXubgrbjHXAPSLjk6uZmUoa52fTYBvutk4q0GFYJPQ0swrGA@mail.gmail.com> <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
In-Reply-To: <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 13 Dec 2025 01:37:01 +0900
X-Gm-Features: AQt7F2r-3QFr48pOGBl4xqpK7Gz1QdwYZszwdhqIL8yLl_GmOH3BGsoqvE1TSA8
Message-ID: <CAAT7Ki8iXJSz9H0-WmtT3HRa5nHHn12jnDN1qgADdXwVCbuhtQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
To: Paul Walmsley <pjw@kernel.org>
Cc: guoren@kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com, conor@kernel.org, 
	paul.walmsley@sifive.com, bjorn@rivosinc.com, eobras@redhat.com, 
	corbet@lwn.net, peterlin@andestech.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_083715_155824_EB9E5886 
X-CRM114-Status: GOOD (  15.10  )
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

SGksIFBhdWwKClRoaXMgcGF0Y2ggaXMgc3RpbGwgbm90IGJlaW5nIGNvbnNpZGVyZWQgZm9yIG1l
cmdpbmcgaW4gNi4xOS4gSXMgdGhlcmUKc29tZSBuZXcgaXNzdWU/CgpPbiBXZWQsIE9jdCAxNSwg
MjAyNSBhdCAxMjozN+KAr1BNIFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiB3cm90ZToK
Pgo+IEhlbGxvIEhhbiBHYW8sIEd1byBSZW4sCj4KPiBTb3JyeSBmb3IgdGhlIGRlbGF5IGluIHJl
c3BvbmRpbmcgLQo+Cj4gT24gVHVlLCBPY3QgNywgMjAyNSBhdCAxMTozNuKAr1BNIEhhbiBHYW8g
PHJhYmVuZGEuY25AZ21haWwuY29tPiB3cm90ZToKPgo+ID4gICAgICBUaGlzIHBhdGNoIGlzIGlu
Y2x1ZGVkIGluIHRoZSA2LjE3IG1lcmdlIHdpbmRvdyBidXQgbm90IGluIHRoZQo+ID4gNi4xOCBt
ZXJnZSB3aW5kb3cuCj4gPiAgICAgIElzIGl0IHBvc3NpYmxlIHRoYXQgdGhlIHBhdGNoIHdhcyBt
aXNzZWQ/Cj4KPiBUaGlzIHdhcyBhbG1vc3Qgc2VudCB1cHN0cmVhbSBhcyBwYXJ0IG9mIHRoZSB2
Ni4xOCBtZXJnZSB3aW5kb3csIGJ1dCBnaXZlbgo+IHRoYXQgaXQgYWRkcyB0aGUgYWJpbGl0eSBm
b3IgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlkZSBXUklURV9PTkNFLCBJIHRoaW5rCj4gaXQgbmVl
ZHMgb25lIG1vcmUgYXR0ZW1wdCBhdCBnYXRoZXJpbmcgZmVlZGJhY2sgYmVmb3JlIHdlIGRvLiAg
SSdsbCBzZW5kCj4gdGhhdCBvdXQgdGhpcyB3ZWVrLgo+Cj4gdGhhbmtzIGZvciB5b3VyIHBhdGll
bmNlLAo+Cj4gLSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
