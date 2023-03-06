Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8E6C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8edA2LEr5RVA2vW55lcLVYleXpCOBL4nz8Xh6mddX1M=; b=ucHatnedfVNhtb
	2vZPRF2kaV4M8nVpa/AIYe3Piq9u71br1HdaIKDtOrjjP77lWsiKpoOZ7zo1mpRnFUnDuVfAW/zG6
	uBaF7nbs2e1kNoHls0ELfzDIPT1ln8K/7nwir16gUZIUx72Qer7O5CxSRupGmUp7ZECiO5KfpadOn
	ULEruDUkA7gzAxwpuTVBbIPqgBY2N9UkISVsQ2iMIB8PgqYqzLcYwAz28SB1YZUWgDyP8K6ZUPhXp
	Kgj5JZh2B1k+ZpbvnVHSkamW1zclvLQ0kO9wzwF1ptMbo1jEcNu9II5FFamkcmSyba/PpamE2lqj1
	//C2Sos2Frgya8AsFU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDmJ-00DvCR-2p; Mon, 06 Mar 2023 16:33:35 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDmG-00Dv9x-CQ
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 16:33:33 +0000
Received: by mail-ua1-x935.google.com with SMTP id l24so6851259uac.12
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 08:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678120410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvApvSQPHB3PWpjKondY69ytQhcKZi3i19/amC3x9Y0=;
        b=fZTqtDBGbeUdr9LhD6WLJ9SKEFZV9zc2fFUQaaCMkaWpH8XBQzcQ7hPVnwcaq0SIWB
         mw90vDe23Rbf1BmQ0Ccl7vlKyP9/BJ1yDq2B2UuhOIz7PB/ESoDdltw0UuVCqAeIwpwy
         XS/gsuzhpN0Utc6Lne2Qy2c2hbNxXjcOQGIHkbYHn99VN1AY9moNrsWivJhDpzHC72Pv
         WuHyVU/lgG9ipSnrVv/pxZBpuhQRFgIhGIMc6wbXCC1LJSTeZwLBG8vBuvgE9Rcr8tIA
         6ewFro2Ytvjzw1srqIcspp/h6Z6t9dxi4VewrzkdlwQASivLlNXs6J1DHz2xNO4FOgaG
         LAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678120410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvApvSQPHB3PWpjKondY69ytQhcKZi3i19/amC3x9Y0=;
        b=Ot1sZqsWo9IbpuiO6hNMyOOmAmNPXw1+IbqMndYREZb+6eoTubsESltXBFp4dT5bOB
         3lTPSUkUf7dBeNEKu+cNRWLrD5aihR9sa5KCpTBphLnl0EKFDpD9AUXdWHDjJGuvFtwJ
         fdeRAgW5UpkI5ll9fXJONft7PbtiNqCn++3MIRMRqCz8iqqXYuRWscbg2vV7M5rZuSpi
         Lx0iDqefV3WJLGf0w5vAXwUl6WC7/UHe/WLJvwhXla3ETqxlhop/jBVazmjNWcWLQxgi
         QzJB2VwLwcvlj/h+3d4i6+IfTU8kWiqcb0ocWrkhK0rA9xvsPnBQL71f1ltslJ4DjL8t
         NcZw==
X-Gm-Message-State: AO0yUKVMKonZGTznIO8Ep/+kHK0w67DvA8dad2oR2PaGTiaGqeEXuRoG
	96Il+1mWdRdhCfZVRAHGCST3q0jAZnPV3sQTUFgnEw==
X-Google-Smtp-Source: AK7set8lpZupzBC2wZxG8SF0D7v87NfGH9XR/gLCdfzuYWDFiF+Q9dg678R/UHm6bKolSv8rgGNbS0W1W68qRNi9xOo=
X-Received: by 2002:a1f:4a81:0:b0:410:4a2c:1e9a with SMTP id
 x123-20020a1f4a81000000b004104a2c1e9amr6555050vka.1.1678120410113; Mon, 06
 Mar 2023 08:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20230301082552.274331-1-alexghiti@rivosinc.com>
In-Reply-To: <20230301082552.274331-1-alexghiti@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 6 Mar 2023 22:03:19 +0530
Message-ID: <CAK9=C2XAOKbyrbOnDP1GzW1VyO-f-V-oEVcp+PhGHeHKFh4C6A@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_083332_448860_F13EF55E 
X-CRM114-Status: GOOD (  15.97  )
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCAxOjU24oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBpbXBy
b3ZlIHRsYiB1dGlsaXphdGlvbiBieSB1c2luZyBodWdlcGFnZXMgZm9yCj4gdGhlIGxpbmVhciBt
YXBwaW5nLgo+Cj4gYmFzZS1jb21taXQtdGFnOiB2Ni4yLXJjNwo+Cj4gdjY6Cj4gLSBxdWlldCBM
TFZNIHdhcm5pbmcgYnkgY2FzdGluZyBwaHlzX3JhbV9iYXNlIGludG8gYW4gdW5zaWduZWQgbG9u
Zwo+Cj4gdjU6Cj4gLSBGaXggbm9tbXUgYnVpbGRzIGJ5IGdldHRpbmcgcmlkIG9mIHJpc2N2X3Bm
bl9iYXNlIGluIHBhdGNoIDEsIHRoYW5rcwo+ICAgQ29ub3IKPiAtIEFkZCBSQiBmcm9tIEFuZHJl
dwo+Cj4gdjQ6Cj4gLSBSZWJhc2Ugb24gdG9wIG9mIHY2LjItcmMzLCBhcyBub3RlZCBieSBDb25v
cgo+IC0gQWRkIEFja2VkLWJ5IFJvYgo+Cj4gdjM6Cj4gLSBDaGFuZ2UgdGhlIGNvbW1lbnQgYWJv
dXQgaW5pdHJkX3N0YXJ0IFZBIGNvbnZlcnNpb24gc28gdGhhdCBpdCBmaXRzCj4gICBBUk02NCBh
bmQgUklTQ1Y2NCAoYW5kIG90aGVycyBpbiB0aGUgZnV0dXJlIGlmIG5lZWRlZCksIGFzIHN1Z2dl
c3RlZAo+ICAgYnkgUm9iCj4KPiB2MjoKPiAtIEFkZCBhIGNvbW1lbnQgb24gd2h5IFJJU0NWNjQg
ZG9lcyBub3QgbmVlZCB0byBzZXQgaW5pdHJkX3N0YXJ0L2VuZCB0aGF0Cj4gICBlYXJseSBpbiB0
aGUgYm9vdCBwcm9jZXNzLCBhcyBhc2tlZCBieSBSb2IKPgo+IEFsZXhhbmRyZSBHaGl0aSAoMik6
Cj4gICByaXNjdjogR2V0IHJpZCBvZiByaXNjdl9wZm5fYmFzZSB2YXJpYWJsZQo+ICAgcmlzY3Y6
IFVzZSBQVUQvUDREL1BHRCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nCgpJIHRyaWVkIHRo
aXMgc2VyaWVzIGJ1dCBpdCBpcyBnZXR0aW5nIHN0dWNrIGFmdGVyIHJlYWNoaW5nIHVzZXIgc3Bh
Y2UuCgpEb2VzIHRoaXMgc2VyaWVzIHJlcXVpcmUgc29tZSBvdGhlciBkZXBlbmRlbnQgcGF0Y2hl
cyA/CgpSZWdhcmRzLApBbnVwCgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIHwg
MTkgKysrKysrKysrKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICB8
IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9tbS9waHlzYWRk
ci5jICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvb2YvZmR0LmMgICAgICAg
ICAgICAgIHwgMTEgKysrKysrLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25z
KCspLCAxNyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4zNy4yCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
