Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB5BC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHW3kxt3BO7YNdOgm96Df4qtafHOdR7e+SXpf4hXR4Y=; b=iuiV3CPa13QTzB
	0CpXO3pBXvulnaOLoJ9cMts1eZQ5jWmo7RT0HOJmcayAdy4QgC6RaCAilXdhhupd1ZI7oswZjUaIc
	8/3dqC4jyR40lmss/bklE912KT1MLMZ8GLvDB0yuRVVvrYjEyER0w/Njp3pkeY9BW0E/mPR3RUGDQ
	PcnJo8h2E1qxv4iPJc+YB+4qjxULeWc5/Y7llEilQKUKMiOE/3cZMZpb4O2iBzcqPoQRV8V6O+Xpj
	f13XQ8SPPWvysVR5NmxndDyPFkoEbp7ztU2BMUOB9a/X/fCXCphw0qkE6wdweZQZjP3l+ySVbInN8
	gjxlfbMp9bkkgPvWTKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFSH-00952i-2M;
	Wed, 19 Jul 2023 22:15:33 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFSE-00951j-20
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 22:15:32 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-40540a8a3bbso56791cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 15:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689804928; x=1690409728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI4h//jtHulH4e1vD3lH5/PhOzYIPiS3BViR1dZJxNY=;
        b=gYT68r9HXYzI4rTptv1st6gRoYl7R798bb78w4Sz8KEx9R+xqwnmO0G6+XfdMvo8/K
         BBWJh6L+/q0Tu44Lse2slk06fPHzFBYEbqQvji3TxSyATaLaYnXbWOMfzOpt/7093AUP
         xYKA8J6zHD3WSyRAaav6Vyoh/Syldv4mCakm881HD8ue2Kbe4JJaxyFP8sehJvrLI03r
         0Sfd8qEKF14E9/1NCabDI7aLY2ft3vRKJPfxrL0qz+RRZ+mL7+CeV8W5/Pf/hhh7mKJ4
         qSHZnlunfsBb4Bdi9gCtTD0sjJOdTmQTDdcC/qOaQuoE+bT9/NQcPS+ZozBeUs7VzLYY
         FYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689804928; x=1690409728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI4h//jtHulH4e1vD3lH5/PhOzYIPiS3BViR1dZJxNY=;
        b=Mco3MH8qGlD7bifzEyM7QNzuvXTr0Sk3DWdwtmwsLGivUVobD2buSp2in/apXXGAul
         YbRKZLxxznghY1+ifb+DCmwYwsf3EDlDZT+NAF6QLF4Fy6TcazJKGC0I0D+dsNguKCmK
         oPzi85JLC4Ptet+nSI8aWGbxoJ4LAxcTK3TBtIvxuBeTh+g+zUhu64yOk0c+ZLctVLAD
         ZwtmXAjGEycXVcber031Ms/OCWRgcToloTkwp15MDoEKvKyWAHP4UWlj3ClCB0hCNB6V
         8D8/eoNoNmLf+EUflzDZUqzS4nfICzsVXy0lYYiIn9yBpVhBpPFzpiTkZ9Aq0YCZRcRl
         AT7g==
X-Gm-Message-State: ABy/qLZbnEB9ePKG7RAe1Nh1NI6UrVAF5Z/Jlu3myAptGzl2JlvCyL9T
	V9qQ3k1FZVtC8p2IByJ0osxwOk1/tWinVAL1DXrYGQ==
X-Google-Smtp-Source: APBJJlE9o37ZaHd/XcocCfK+Zf8TveQJE0XYZg4TdckQGOg3QWt9pydQkQ5o8hgi65StLMnWGe8GuZ4vXeadT+Nfxps=
X-Received: by 2002:ac8:5755:0:b0:403:f3f5:1a8 with SMTP id
 21-20020ac85755000000b00403f3f501a8mr89408qtx.12.1689804927647; Wed, 19 Jul
 2023 15:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230719113542.2293295-1-apatel@ventanamicro.com> <20230719113542.2293295-4-apatel@ventanamicro.com>
In-Reply-To: <20230719113542.2293295-4-apatel@ventanamicro.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 19 Jul 2023 15:14:51 -0700
Message-ID: <CAGETcx9zAF2ipO0s-6-zjyvn1JWt7OUS9G=cQ6OwyOPuqh-pBA@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] drivers: irqchip/riscv-intc: Mark all INTC nodes
 as initialized
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_151530_684982_88809180 
X-CRM114-Status: GOOD (  24.88  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNDozNuKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBSSVNDLVYgSU5UQyBsb2NhbCBpbnRlcnJ1cHRz
IGFyZSBwZXItSEFSVCAob3IgcGVyLUNQVSkgc28KPiB3ZSBjcmVhdGUgSU5UQyBJUlEgZG9tYWlu
IG9ubHkgZm9yIHRoZSBJTlRDIG5vZGUgYmVsb25naW5nIHRvCj4gdGhlIGJvb3QgSEFSVC4gVGhp
cyBtZWFucyBvbmx5IHRoZSBib290IEhBUlQgSU5UQyBub2RlIHdpbGwgYmUKPiBtYXJrZWQgYXMg
aW5pdGlhbGl6ZWQgYW5kIG90aGVyIElOVEMgbm9kZXMgd29uJ3QgYmUgbWFya2VkIHdoaWNoCj4g
cmVzdWx0cyBkb3duc3RyZWFtIGludGVycnVwdCBjb250cm9sbGVycyAoc3VjaCBhcyBJTVNJQyBh
bmQgQVBMSUMKPiBkaXJlY3QtbW9kZSkgbm90IGJlaW5nIHByb2JlZCBkdWUgdG8gbWlzc2luZyBk
ZXZpY2Ugc3VwcGxpZXJzLgo+Cj4gVG8gYWRkcmVzcyB0aGlzIGlzc3VlLCB3ZSBtYXJrIGFsbCBJ
TlRDIG5vZGUgZm9yIHdoaWNoIHdlIGRvbid0Cj4gY3JlYXRlIElSUSBkb21haW4gYXMgaW5pdGlh
bGl6ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCAxMCArKysr
KysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gaW5kZXggNjVmNGEyYWZiMzgxLi40ZTI3MDRi
YzI1ZmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiAr
KysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IEBAIC0xNTUsOCArMTU1LDE2
IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUsCj4gICAgICAgICAgKiBmb3IgZWFjaCBJTlRDIERUIG5vZGUuIFdlIG9ubHkgbmVlZCB0
byBkbyBJTlRDIGluaXRpYWxpemF0aW9uCj4gICAgICAgICAgKiBmb3IgdGhlIElOVEMgRFQgbm9k
ZSBiZWxvbmdpbmcgdG8gYm9vdCBDUFUgKG9yIGJvb3QgSEFSVCkuCj4gICAgICAgICAgKi8KPiAt
ICAgICAgIGlmIChyaXNjdl9oYXJ0aWRfdG9fY3B1aWQoaGFydGlkKSAhPSBzbXBfcHJvY2Vzc29y
X2lkKCkpCj4gKyAgICAgICBpZiAocmlzY3ZfaGFydGlkX3RvX2NwdWlkKGhhcnRpZCkgIT0gc21w
X3Byb2Nlc3Nvcl9pZCgpKSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAg
ICAqIFRoZSBJTlRDIG5vZGVzIG9mIGVhY2ggQ1BVIGFyZSBzdXBwbGllcnMgZm9yIGRvd25zdHJl
YW0KPiArICAgICAgICAgICAgICAgICogaW50ZXJydXB0IGNvbnRyb2xsZXJzIChzdWNoIGFzIElN
U0lDIGFuZCBBUExJQyBkaXJlY3QtbW9kZSkKPiArICAgICAgICAgICAgICAgICogc28gd2Ugc2hv
dWxkIG1hcmsgYW4gSU5UQyBub2RlIGFzIGluaXRpYWxpemVkIGlmIHdlIGFyZQo+ICsgICAgICAg
ICAgICAgICAgKiBub3QgY3JlYXRpbmcgSVJRIGRvbWFpbiBmb3IgaXQuCj4gKyAgICAgICAgICAg
ICAgICAqLwoKSSdtIGEgYml0IGNvbmZ1c2VkIGJ5IHRoaXMuIElmIHRob3NlIG5vbi1ib290IENQ
VXMgSU5UQyBkb2Vzbid0IGhhdmUKYW4gSVJRIGRvbWFpbiwgd2h5IGFyZSB0aGUgZG93bnN0cmVh
bSBpbnRlcnJ1cHQgY29udHJvbGxlcnMgbGlzdGluZwp0aGVzZSBub24tYm9vdCBDUFUgSU5UQ3Mg
YXMgYW4gdXBzdHJlYW0gaW50ZXJydXB0IGNvbnRyb2xsZXI/CgpUaGlzIGlzIG1vcmUgb2YgYSBx
dWVzdGlvbiBvZiB0aGUgZXhpc3RpbmcgYmVoYXZpb3IgdGhhdCB0aGlzIHBhdGNoLApidXQgdGhp
cyBwYXRjaCBoaWdobGlnaHRzIHRoZSBleGlzdGluZyBvZGRpdHkuCgotU2FyYXZhbmEKCj4gKyAg
ICAgICAgICAgICAgIGZ3bm9kZV9kZXZfaW5pdGlhbGl6ZWQob2ZfZndub2RlX2hhbmRsZShub2Rl
KSwgdHJ1ZSk7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgfQo+Cj4gICAg
ICAgICByZXR1cm4gcmlzY3ZfaW50Y19pbml0X2NvbW1vbihvZl9ub2RlX3RvX2Z3bm9kZShub2Rl
KSk7Cj4gIH0KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
