Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F89C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbkgIuWhswlYOCTc7+U2rw68uDgu6vG1cDAlftRqI8Y=; b=psdmv+lTlUvSGh
	HOKfPkVU3iMxGR5WtWg7gWGgCLxDwGHcwqGgK8ZRbcWPUA3lnXwqqwgMxAuHxWi1z4B5SDfxgahep
	/yqPNJUFtF8iukigNxdPaEDiFhhkKalF5L0pMjtF5aDSC2EM8Z84K4dvmC27m+veTty1ina0pS23K
	NtBQo1NzKB9ldJP7429oipGi1T9RMCrZBsxPvKv8mkfJhdP9lNNbcGSFYjQIXAGZpHkHITNXQhRhA
	jdGYSPfUn+rvl/OIHa4CTiS7jjoHf6PRDkP1TfXc1x6aLGafnsCVz7YJIsaUeeFIBIX8YYilMNbB2
	9y0jaofGQZhCoQxcCPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZFwS-00EPsq-NI; Mon, 06 Mar 2023 18:52:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZFwP-00EPs2-FH
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 18:52:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id e13so9853029wro.10
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 10:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678128725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6Kcl5snT4dOT1Wk63DsCfYmCJln0IX3AMZ3xLgwxEE=;
        b=tmdUDj4teYRPGPVmMc0RPsl1zl5vsv3S8+GCXAW0/s1S267aiJlsDabus51wc2BaFf
         RQNpEKYrxga62mE8kwkh2pdz/ZqmbeLZIxQ4igs9EmQVEwMIMf5MI7QAsE6LzXfNK2+/
         1Tm87rGjzxKEctE1klwstJe+gysP9trhlFv3M0VrHQczZFLI/2jkB6860mPzHgkJ/cEC
         tONrDQC7H1ppljQ799985LTKaViqcIUzQlYWSOVcCC1IiEzbVnstvAF3EoMKxQfwD5dL
         1CnQe6Eclrp5BkhYMqh7YIGq9iqXmEVPkxMzWA/rXop/9gdoqAwcAjlMzRww4PqhttMF
         lwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6Kcl5snT4dOT1Wk63DsCfYmCJln0IX3AMZ3xLgwxEE=;
        b=DTLM6YwCdS5bXvoueGwENsvHGyMn12DIWc32+JhiKwa/E1D40J19/jMupYvY8pNh8r
         eNd4MVYIKYnUGXxGlHkkWQr+dEBPrraHg+b5hcAwosjYYFk1aap/xt2ANlzq4GITk/DY
         uvY3JGVYmDArwoYjg3EMOUg3xnpD6L9+i/WzxP/8952FLlBKYC2iWRKb+gY1nDRlxCfg
         sa7NHxziLRoIyBOioGRLchyQufH7seltFXpwf6FV05vYa/EYDQFP6U+T0M0inT/Rqokd
         F9Y9iT5m3EBJrTSJZu9CkP+soOYZwZhGLEfJFqMsMLnUHGNDwYhrgUdvjIQ92Et+YSQ2
         x5lw==
X-Gm-Message-State: AO0yUKXb+RdUebV/zc6AroUtU765NAdQRZ4a9qbcw0IFUVS3OXY8l9Lm
	WBSyw+ulzYUgVLbHqjYQ6HMG0adluMrPrUzT0lxovQ==
X-Google-Smtp-Source: AK7set8I+3jxDfAUEo7frBA3dq8huNi9KnbKovbnIOQ0/OQKEcAAicBWKJUD2c5b7PTUdIxHwYxf1SZVe1fSQaWvLtY=
X-Received: by 2002:a5d:5951:0:b0:2ce:7219:4d64 with SMTP id
 e17-20020a5d5951000000b002ce72194d64mr373680wri.11.1678128725393; Mon, 06 Mar
 2023 10:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20230301082552.274331-1-alexghiti@rivosinc.com> <CAK9=C2XAOKbyrbOnDP1GzW1VyO-f-V-oEVcp+PhGHeHKFh4C6A@mail.gmail.com>
In-Reply-To: <CAK9=C2XAOKbyrbOnDP1GzW1VyO-f-V-oEVcp+PhGHeHKFh4C6A@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 6 Mar 2023 19:51:54 +0100
Message-ID: <CAHVXubj9sCEuANsVe0N7YRMg8OPx_eALZfy0vERKU9P6QUDM0Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_105209_751859_DF589A42 
X-CRM114-Status: GOOD (  20.29  )
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

SGkgQW51cCwKCk9uIE1vbiwgTWFyIDYsIDIwMjMgYXQgNTozM+KAr1BNIEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWFyIDEsIDIwMjMgYXQg
MTo1NuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gVGhpcyBwYXRjaHNldCBpbnRlbmRzIHRvIGltcHJvdmUgdGxiIHV0aWxpemF0aW9u
IGJ5IHVzaW5nIGh1Z2VwYWdlcyBmb3IKPiA+IHRoZSBsaW5lYXIgbWFwcGluZy4KPiA+Cj4gPiBi
YXNlLWNvbW1pdC10YWc6IHY2LjItcmM3Cj4gPgo+ID4gdjY6Cj4gPiAtIHF1aWV0IExMVk0gd2Fy
bmluZyBieSBjYXN0aW5nIHBoeXNfcmFtX2Jhc2UgaW50byBhbiB1bnNpZ25lZCBsb25nCj4gPgo+
ID4gdjU6Cj4gPiAtIEZpeCBub21tdSBidWlsZHMgYnkgZ2V0dGluZyByaWQgb2YgcmlzY3ZfcGZu
X2Jhc2UgaW4gcGF0Y2ggMSwgdGhhbmtzCj4gPiAgIENvbm9yCj4gPiAtIEFkZCBSQiBmcm9tIEFu
ZHJldwo+ID4KPiA+IHY0Ogo+ID4gLSBSZWJhc2Ugb24gdG9wIG9mIHY2LjItcmMzLCBhcyBub3Rl
ZCBieSBDb25vcgo+ID4gLSBBZGQgQWNrZWQtYnkgUm9iCj4gPgo+ID4gdjM6Cj4gPiAtIENoYW5n
ZSB0aGUgY29tbWVudCBhYm91dCBpbml0cmRfc3RhcnQgVkEgY29udmVyc2lvbiBzbyB0aGF0IGl0
IGZpdHMKPiA+ICAgQVJNNjQgYW5kIFJJU0NWNjQgKGFuZCBvdGhlcnMgaW4gdGhlIGZ1dHVyZSBp
ZiBuZWVkZWQpLCBhcyBzdWdnZXN0ZWQKPiA+ICAgYnkgUm9iCj4gPgo+ID4gdjI6Cj4gPiAtIEFk
ZCBhIGNvbW1lbnQgb24gd2h5IFJJU0NWNjQgZG9lcyBub3QgbmVlZCB0byBzZXQgaW5pdHJkX3N0
YXJ0L2VuZCB0aGF0Cj4gPiAgIGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MsIGFzIGFza2VkIGJ5
IFJvYgo+ID4KPiA+IEFsZXhhbmRyZSBHaGl0aSAoMik6Cj4gPiAgIHJpc2N2OiBHZXQgcmlkIG9m
IHJpc2N2X3Bmbl9iYXNlIHZhcmlhYmxlCj4gPiAgIHJpc2N2OiBVc2UgUFVEL1A0RC9QR0QgcGFn
ZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZwo+Cj4gSSB0cmllZCB0aGlzIHNlcmllcyBidXQgaXQg
aXMgZ2V0dGluZyBzdHVjayBhZnRlciByZWFjaGluZyB1c2VyIHNwYWNlLgo+Cj4gRG9lcyB0aGlz
IHNlcmllcyByZXF1aXJlIHNvbWUgb3RoZXIgZGVwZW5kZW50IHBhdGNoZXMgPwoKTm8gaXQgc2hv
dWxkIG5vdC4gTGV0IG1lIHRha2UgYSBsb29rOiB3aGF0J3MgeW91ciBjb25maWcgYW5kIHRoZSBi
YXNlIGNvbW1pdD8KCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+ID4KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BhZ2UuaCB8IDE5ICsrKysrKysrKysrKysrKysrLS0KPiA+ICBhcmNoL3Jpc2N2
L21tL2luaXQuYyAgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiA+
ICBhcmNoL3Jpc2N2L21tL3BoeXNhZGRyLmMgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPiA+
ICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAgICAgICB8IDExICsrKysrKy0tLS0tCj4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiAt
LQo+ID4gMi4zNy4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
