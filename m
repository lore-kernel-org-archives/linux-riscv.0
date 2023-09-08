Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC79EE57E6
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2awq0Sv7yolhR3WGBeZZudTr3lCN0rBt9BE80YsNy4=; b=SuxKcFoNEqsTpE
	8JHbPcoKKwsjqUt+SNXFsiTAaJwJPEvh8caxvRx0yg9YRHbu8j06wnK0/zIcDfp7pBWPgI1O4pWDv
	BSbFLAj3/KHrsnllwSWo97kuxYQW3FofkULszgiDQw3V6zF7a/NrtRrNyXJdgmHgijHUYy5d1k8CH
	JEUxAz9tdp34QgttWt7c9RQd0jSWRnEwoQXUmuIclDY2IgFWc3ALHvHludz/caekiFJiNZLAocBVZ
	MWzEfbT7dtsJUiAQ/2GVUVoepZUivpEb0IM0VBCQEmIINuYoAqzCbnkkanm0hmetFwmsw/6IxUESF
	P1Uq2oAYXBJ6mQ/Qo4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeXMs-00DMVf-27;
	Fri, 08 Sep 2023 09:01:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeXMp-00DMV3-2w
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 09:01:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 606066147E
	for <linux-riscv@lists.infradead.org>; Fri,  8 Sep 2023 09:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24A3C433CB
	for <linux-riscv@lists.infradead.org>; Fri,  8 Sep 2023 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694163689;
	bh=rE5zH+On8EOe/kA8HLgVDoL97kxJNQGwOXrvmH08brw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pQxmZecx4EHJcQtFvleL5MDu6PXX2COHzS+Q8CYasrXQvV1fsF/yBa0djKu/I2+dG
	 rrgWBsobUv+JSLwNrWMbkLytpoK/N9NPaF7D9LOZm/UTdoJ44EdQwh24kaKZkURer3
	 vxt75QJUlwUvtZdbzJBv3t8FQiYlnzpRvbVKpqKR0Qw01HLcK1GO8R46HRj1vdvUYZ
	 R2kZ4i+drfp52pTPkhtNhMDQq7OhWTvyObO62CA6Rl7LsF+MX2di48w6QGytcH2O8D
	 oF/FmjyQmUi58zVGARoitippqRr21Upuy88BDHyGHDR1PR2QEYNgy4sK85hWSQY03B
	 bSeHoe8u+8kBg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bf3f59905so223965166b.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 02:01:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxz4b7d9YE2VE4zQ8daJXB/HTDtk7BQdoMH2zElG32eRZ4pPA97
	+l4hb2YlQdH1b8XD7wrd61pUPzvP3GODb6xN4Wg=
X-Google-Smtp-Source: AGHT+IErbyVlIoQhbQ1VhQjIiVqC1OCG7Hd1zNV8Jx507J94fI35vzASUhnf3ixLKSDlNyb079zIDDuEOhnBDpeNt9E=
X-Received: by 2002:a17:906:20dc:b0:9a9:e41f:d214 with SMTP id
 c28-20020a17090620dc00b009a9e41fd214mr1338393ejc.74.1694163688219; Fri, 08
 Sep 2023 02:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230906123216.255932-1-wangjiexun@tinylab.org>
In-Reply-To: <20230906123216.255932-1-wangjiexun@tinylab.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 8 Sep 2023 17:01:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQUx35vOrG82WeS9pS8XRjVVLiLTMGt+TRmn2HsNahGXQ@mail.gmail.com>
Message-ID: <CAJF2gTQUx35vOrG82WeS9pS8XRjVVLiLTMGt+TRmn2HsNahGXQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Fix use of non existent CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
To: Jiexun Wang <wangjiexun@tinylab.org>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, falcon@tinylab.org, jszhang@kernel.org, 
	tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_020132_028771_2E924893 
X-CRM114-Status: GOOD (  20.49  )
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

VGh4IGZvciBmaXh1cC4KClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
Ck9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgODozNOKAr1BNIEppZXh1biBXYW5nIDx3YW5namlleHVu
QHRpbnlsYWIub3JnPiB3cm90ZToKPgo+IElmIGNvbmZpZ3VyYXRpb24gb3B0aW9ucyBTT0ZUSVJR
X09OX09XTl9TVEFDSyBhbmQgUFJFRU1QVF9SVAo+IGFyZSBlbmFibGVkIHNpbXVsdGFuZW91c2x5
IHVuZGVyIFJJU0MtViBhcmNoaXRlY3R1cmUsCj4gaXQgd2lsbCByZXN1bHQgaW4gYSBjb21waWxh
dGlvbiBmYWlsdXJlOgo+Cj4gYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmM6NjQ6NjogZXJyb3I6IHJl
ZGVmaW5pdGlvbiBvZiAnZG9fc29mdGlycV9vd25fc3RhY2snCj4gICAgNjQgfCB2b2lkIGRvX3Nv
ZnRpcnFfb3duX3N0YWNrKHZvaWQpCj4gICAgICAgfCAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+
Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vYXJjaC9yaXNjdi9pbmNsdWRlL2dlbmVyYXRlZC9h
c20vc29mdGlycV9zdGFjay5oOjEsCj4gICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvcmlzY3Yv
a2VybmVsL2lycS5jOjE1Ogo+IC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9zb2Z0aXJxX3N0YWNrLmg6
ODoyMDogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiAnZG9fc29mdGlycV9vd25fc3RhY2sn
IHdhcyBoZXJlCj4gICAgIDggfCBzdGF0aWMgaW5saW5lIHZvaWQgZG9fc29mdGlycV9vd25fc3Rh
Y2sodm9pZCkKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fgo+Cj4gQWZ0ZXIgY2hhbmdpbmcgQ09ORklHX0hBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sgdG8g
Q09ORklHX1NPRlRJUlFfT05fT1dOX1NUQUNLLAo+IGNvbXBpbGF0aW9uIGNhbiBiZSBzdWNjZXNz
ZnVsLgo+Cj4gRml4ZXM6IGRkNjlkMDdhNWE2YyAoInJpc2N2OiBzdGFjazogU3VwcG9ydCBIQVZF
X1NPRlRJUlFfT05fT1dOX1NUQUNLIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWV4dW4gV2FuZyA8d2Fu
Z2ppZXh1bkB0aW55bGFiLm9yZz4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gY2hhbmdlZCB0
byBhIG1vcmUgc3VpdGFibGUgc3ViamVjdCBsaW5lCj4gLSBhZGQgYSBGaXhlcyB0YWcKPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvaXJxLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYwo+IGluZGV4IGE4ZWZhMDUzYzRh
NS4uYTg2ZjI3MmFlMmMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMKPiBAQCAtNjAsNyArNjAsNyBAQCBzdGF0aWMg
dm9pZCBpbml0X2lycV9zdGFja3Modm9pZCkKPiAgfQo+ICAjZW5kaWYgLyogQ09ORklHX1ZNQVBf
U1RBQ0sgKi8KPgo+IC0jaWZkZWYgQ09ORklHX0hBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sKPiAr
I2lmZGVmIENPTkZJR19TT0ZUSVJRX09OX09XTl9TVEFDSwo+ICB2b2lkIGRvX3NvZnRpcnFfb3du
X3N0YWNrKHZvaWQpCj4gIHsKPiAgI2lmZGVmIENPTkZJR19JUlFfU1RBQ0tTCj4gLS0KPiAyLjM0
LjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
