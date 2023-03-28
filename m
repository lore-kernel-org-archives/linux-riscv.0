Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB28C761AF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 14:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuhH45oXP9k4EDCFyEla2bdcKqkGkq+vG4AQiIFxO0g=; b=xZ6Yw6FcJ/ZFyI
	ew7/v6YYsNEM+YQeDFIx0CL3++jbM8I45RK997E0F2aTS7DH1DeC2ia6bX0uHzBx/Tne5oJ8kHj7u
	t44xnGaaKMsxuU8TvLGbcPHx7GTG3BwcyfT3n65WXNyEKtwuHB5QKxFRCvQXniNB8vRm3Lkad1L2K
	+mhZzAHtxeWDgt7B/SBqEmxiD1qwTI7L8OGhXqL4wZ1OVpjdVsHwhLjY9JfEe+FPRF90O3FjpwyDI
	uOfmpIj4zJ+nceOGq30ftIeRTL33Qsla4ILBT/ipFqGr2oFEJFoAwUHE00WQmbFsXMje792dgqYAB
	tyANvgq9J081D78Zxn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phA8t-00El9o-2z;
	Tue, 28 Mar 2023 14:17:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phA8r-00El9F-2j
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 14:17:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B4CD6172B
	for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 14:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD52CC433D2
	for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680013060;
	bh=CeTJeyHjFur2f8WQY7ADogd1pxku0UIl/9w1d1coW7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fHXjS8SG3+3woOSAsFZdKMiLfHOR8D8y4ypuURIO9m+IDdndbuq9tPM/esayv+V1f
	 ZJ3/M/o/DBlJq0UvTMV8GZlYG9qvJS7Qah2rXNf5BPaXQLtAP1fo/WxvNFqzLPCA8p
	 62NWv6TP+8OgLFioR1AbfMCEvvjdocPm7oYfxQmmwkY1BGaYt8ZW+xB/zRGryvHjJM
	 RZ0d4I9ditQjW8Y3Ju7NluGRCu3lyzz81HVFHKN74eT954FNjbuvJtAYLL9jB3sdhB
	 C80k1uFjRGovCo5TCMimpPNua/7+NY3ZQZuhfwNTUejLIZvFMlPc78tikqP3aHk1fa
	 zpSEdkmO7XDGQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-545e907790fso116578847b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 07:17:40 -0700 (PDT)
X-Gm-Message-State: AAQBX9cTeq5H4Bzeo9rydmNQbqHMWdEAA9j2LinsEKrFD4g1rOW8Xpnu
	vbkb6XPdE38BTMrqiV2DYIDqKmDoIPGasldoeA==
X-Google-Smtp-Source: AKy350bpnUIh0Y3dOsByH0JInTgzU6Fdniof4Id3yRA3M5UehlXCBkq6XqT1KY0HTUQS4VYyL/VzpN9pZZ3dOqvJVvM=
X-Received: by 2002:a81:b149:0:b0:543:9065:b225 with SMTP id
 p70-20020a81b149000000b005439065b225mr7296521ywh.5.1680013059755; Tue, 28 Mar
 2023 07:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com> <20230321110813.26808-5-jiaxun.yang@flygoat.com>
In-Reply-To: <20230321110813.26808-5-jiaxun.yang@flygoat.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Mar 2023 09:17:28 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+jFqKPVwheobNYNHVk5=u41CXbyyiEdfhEUSAGZmgCoA@mail.gmail.com>
Message-ID: <CAL_Jsq+jFqKPVwheobNYNHVk5=u41CXbyyiEdfhEUSAGZmgCoA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] of: address: Always use dma_default_coherent for
 default coherency
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, tsbogend@alpha.franken.de, mpe@ellerman.id.au, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, hch@lst.de, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_071741_919925_667E5913 
X-CRM114-Status: GOOD (  12.56  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgNjowOOKAr0FNIEppYXh1biBZYW5nIDxqaWF4dW4ueWFu
Z0BmbHlnb2F0LmNvbT4gd3JvdGU6Cj4KPiBBcyBmb3Igbm93IGFsbCBhcmNoZXMgaGF2ZSBkbWFf
ZGVmYXVsdF9jb2hlcmVudCByZWZsZWN0aW5nIGRlZmF1bHQKPiBETUEgY29oZXJlbmN5IGZvciBv
ZiBkZXZpY2VzLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgYSBzdGFuZGFsb25lCj4gY29u
ZmlnIG9wdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0Bm
bHlnb2F0LmNvbT4KPiAtLS0KPiB2MzogU3F1YXNoIHNldHRpbmcgQVJDSF9ETUFfREVGQVVMVF9D
T0hFUkVOVCBpbnRvIHRoaXMgcGF0Y2guCj4gLS0tCj4gIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwg
IDIgKy0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgfCAgMiArLQo+ICBkcml2ZXJzL29mL0tjb25m
aWcgICB8ICA0IC0tLS0KPiAgZHJpdmVycy9vZi9hZGRyZXNzLmMgfCAxMCArLS0tLS0tLS0tCj4g
IDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKClJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
