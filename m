Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4757EC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXWm1YjBknoZRYSAcmeTx7doIuhpQVQS58/deX3cRBE=; b=pTVwVae5IYKVUa
	EfZz7ozd6TSQTus9qe85yJRXcPdlMF80xgl8wC8nkGnmrIDgdkne7QnxIjV0X8yAQEVAcpYUFwyxv
	gLpUUanulAnKse/+Ktl7/nfL96ufGouBNSiHddVpVfkUxcS4mv6O0e/WI2Fg243zr0pvSw1xiHnIq
	jZhV7RTGJqmr3yntCAxy1OaOa2ivaGwjEqjSGQD+WF71rjfyMjmNLoisGepmcqtQBEKbwACBbFYa9
	NGNrmjdEcFP1y1gQwPxyZVknLGvJw2FwqzXEqYV+0CMo6rqN2o+V66nZ3ZnlVabZzZ4wFpRq5UDlO
	Cj/0wXTodRSwGapz27Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHAC-009tk4-1D;
	Tue, 24 Oct 2023 13:09:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHA9-009tjE-2m
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 13:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 623CD62B11;
	Tue, 24 Oct 2023 13:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D214C433C7;
	Tue, 24 Oct 2023 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698152975;
	bh=dwCTjMWxulfmok8hvVUhl0To2h8rmkpi55JvtMmovYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SUcqiR/MI1naRN0Gf16J8VSkRwGc1fRy1LwHqQzo0IIgu3y0WmI7KmjkfOAo67NzT
	 LwrQB8py9L3UQLA//IghgTRsMT+id4QvBwMox4NZgylu6BD1q/qIdEoKMefvTR/xbc
	 IuPzmcEGzvRBGJUNDzwTVoy14dHfTyoSwRjHK/f+hrJl3zmo9kkCr/rIRPtCLJE6eS
	 76LIuehEj36TIfTp9XMnxBGJEGT5E3ka6j6oeWXataIOPl8YjUX6t4r+bwhAGXjkD6
	 WpzuhZCQf0O6wDwsm49vru4nTubMY41AZLQzQps5bhsRIljmCc8LrrxuFbVgNFarN4
	 RNInazFe2N9gA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI
 irqdomain
In-Reply-To: <20231023172800.315343-10-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-10-apatel@ventanamicro.com>
Date: Tue, 24 Oct 2023 15:09:31 +0200
Message-ID: <8734y0rwtw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_060937_939855_8821A1CA 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIExpbnV4
IFBDSSBmcmFtZXdvcmsgcmVxdWlyZXMgaXQncyBvd24gZGVkaWNhdGVkIE1TSSBpcnFkb21haW4g
c28KPiBsZXQgdXMgY3JlYXRlIFBDSSBNU0kgaXJxZG9tYWluIGFzIGNoaWxkIG9mIHRoZSBJTVNJ
QyBiYXNlIGlycWRvbWFpbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2
ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgfCAgNyArKysKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1w
bGF0Zm9ybS5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWltc2ljLXN0YXRlLmggICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTkg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnIGIv
ZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPiBpbmRleCBiZGQ4MDcxNjExNGQuLmMxZDY5YjQxOGRm
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMv
aXJxY2hpcC9LY29uZmlnCj4gQEAgLTU1Miw2ICs1NTIsMTMgQEAgY29uZmlnIFJJU0NWX0lNU0lD
Cj4gIAlzZWxlY3QgSVJRX0RPTUFJTl9ISUVSQVJDSFkKPiAgCXNlbGVjdCBHRU5FUklDX01TSV9J
UlEKPiAgCj4gK2NvbmZpZyBSSVNDVl9JTVNJQ19QQ0kKPiArCWJvb2wKPiArCWRlcGVuZHMgb24g
UklTQ1ZfSU1TSUMKPiArCWRlcGVuZHMgb24gUENJCj4gKwlkZXBlbmRzIG9uIFBDSV9NU0kKPiAr
CWRlZmF1bHQgUklTQ1ZfSU1TSUMKPiArCj4gIGNvbmZpZyBFWFlOT1NfSVJRX0NPTUJJTkVSCj4g
IAlib29sICJTYW1zdW5nIEV4eW5vcyBJUlEgY29tYmluZXIgc3VwcG9ydCIgaWYgQ09NUElMRV9U
RVNUCj4gIAlkZXBlbmRzIG9uIChBUkNIX0VYWU5PUyAmJiBBUk0pIHx8IENPTVBJTEVfVEVTVAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiBpbmRleCAyM2Qy
ODZjYjAxN2UuLmNkYjY1OTQwMTE5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLXBsYXRmb3JtLmMKPiBAQCAtMTMsNiArMTMsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgv
aXJxZG9tYWluLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L21zaS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9zbXAuaD4KPiBAQCAtMjE1LDYgKzIxNiw0MiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGlycV9kb21haW5fb3BzIGltc2ljX2Jhc2VfZG9tYWluX29wcyA9IHsKPiAgI2VuZGlmCj4g
IH07Cj4gIAo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lNU0lDX1BDSQo+ICsKPiArc3RhdGljIHZv
aWQgaW1zaWNfcGNpX21hc2tfaXJxKHN0cnVjdCBpcnFfZGF0YSAqZCkKPiArewo+ICsJcGNpX21z
aV9tYXNrX2lycShkKTsKPiArCWlycV9jaGlwX21hc2tfcGFyZW50KGQpOwoKSSd2ZSBhc2tlZCB0
aGlzIGJlZm9yZSwgYnV0IEkgc3RpbGwgZG9uJ3QgZ2V0IHdoeSB5b3UgbmVlZCB0byBwcm9wYWdh
dGUKdG8gdGhlIHBhcmVudD8gV2h5IGlzbid0IG1hc2tpbmcgb24gUENJIGVub3VnaD8KCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
