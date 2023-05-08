Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEE1C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzQ3zC1gajDmuhjfMIaIb7vDB/m4gR5h+FxiA84Ele4=; b=OzGjTpMxRxOs8M
	xkaF6b2drsjyCuN028mgfLvgMfOhHNEUaIewdnzy10Lq0aYizwreUPQy8XmVCqKmTJ3/krAs0oRzP
	Vg34xt79e6EgprsQDXvHRe6USCKasjkeXAz80zdx0owjsydGo/c6NYOPPtCDld1NCQ1nPTSBqaCpq
	PIxxyxsSQprLMwpHzWO5zXEvfyY+Vs32LXEstDXCf3T/fkvgQbtRxL4iQaP4BhsubWUc4xvp8FSvZ
	z/TFJRVwS1fW9xtvtSzoEhy8yr76yoYnlR4gp9f/l2FR0MoVbYy6MQMSyxlrLEOlFU2R7yHC7Uogs
	2dpLD0UVg1uk7p1r/AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuZo-00HQE4-1B;
	Mon, 08 May 2023 06:42:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuZl-00HQDS-1d
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:42:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D39EF61F25
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD772C433A1
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683528143;
	bh=r4iJVdq+kSsrznQO5iASjJKSVcwHIpX8k/weFqPL9PI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q7kcmg1iT3UqoMWAplBRwyuluRJxI8j7Y+GLwaHViQ7KuLs7RGOUVeVyY7gwJyOyB
	 KG94ukA6ksrI4RkIM9j0YBB9EajPNCkD/mNhkfsuMonQFvf1XYcfXdK1VWoU+HjMSd
	 SheLyaDBcWQ5Ks8REeDwSqHWzBLYkuKcFnNoiCd/wqWN1O/fArsOYIzDBvVXYANcz3
	 EdCHu8W+TwziYxkltnqmQ3lGDMFvH9xbjK5MmUgGptXTEAjzPWjxniclbc5Bq1/Di/
	 0tMPHMPhP0XYEnjSWjpEpqOeJgFg//ImzuwDJS5L7QobAv5AzPaPYKJBUkorYBF02r
	 7CFgBQ9gQR7Vg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-965a68abfd4so779646466b.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 23:42:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDzkjsH8Qf81EUcCgLDgAx40b+dtNoHuvnOhup9YqHQh//aYRN3K
	rqW9Kqgaqu2Dqy5+X2Ot5wOs9hJBwcpend/T3tQ=
X-Google-Smtp-Source: ACHHUZ4mwkcqjrAbBZUuOGbMCbkwPBgYeaGSSqohUR7fCRsoF+JinJDShKS4My6aDu+hZJHKsZERSxfc7mVo1Rq0h1Q=
X-Received: by 2002:a17:907:7f87:b0:965:d7c7:24d4 with SMTP id
 qk7-20020a1709077f8700b00965d7c724d4mr10802839ejc.77.1683528141910; Sun, 07
 May 2023 23:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-3-jszhang@kernel.org>
 <20230507-sleeve-tacky-21e817e31fb2@spud>
In-Reply-To: <20230507-sleeve-tacky-21e817e31fb2@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:42:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTSRQUX8C3C-tgq4o5iGJqKTja7-1Dv8epG_qZizUvSow@mail.gmail.com>
Message-ID: <CAJF2gTTSRQUX8C3C-tgq4o5iGJqKTja7-1Dv8epG_qZizUvSow@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: Add the T-HEAD SoC family Kconfig option
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_234225_648233_06C9B4D0 
X-CRM114-Status: GOOD (  21.86  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCA1OjIy4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDA4LCAyMDIzIGF0IDAyOjIzOjAxQU0gKzA4
MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiBUaGUgZmlyc3QgU29DIGluIHRoZSBULUhFQUQg
c2VyaWVzIGlzIGxpZ2h0KGEuay5hIHRoMTUyMCksIGNvbnRhaW5pbmcKPiA+IHF1YWQgVC1IRUFE
IEM5MTAgY29yZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFu
Z0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgfCA2ICsr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+
ID4gaW5kZXggMWNmNjlmOTU4ZjEwLi5jZTEwYTM4ZGZmMzcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcuc29jcwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+
IEBAIC00MSw2ICs0MSwxMiBAQCBjb25maWcgQVJDSF9TVU5YSQo+ID4gICAgICAgICBUaGlzIGVu
YWJsZXMgc3VwcG9ydCBmb3IgQWxsd2lubmVyIHN1bjIwaSBwbGF0Zm9ybSBoYXJkd2FyZSwKPiA+
ICAgICAgICAgaW5jbHVkaW5nIGJvYXJkcyBiYXNlZCBvbiB0aGUgRDEgYW5kIEQxcyBTb0NzLgo+
ID4KPiA+ICtjb25maWcgQVJDSF9USEVBRAo+Cj4gQ291bGQgeW91IHBsZWFzZSBhZGQgYSBkZWZj
b25maWcgcGF0Y2gsIGFkZGluZyB0aGlzIG9wdGlvbiwgc28gdGhhdCB3ZQo+IGJ1aWxkIHN1cHBv
cnQgZm9yIHRoaXMgcGxhdGZvcm0gYnkgZGVmYXVsdD8KWWVzLCBidXQgaXQncyBhbm90aGVyIHBh
dGNoLCBzZWU6ICdjb21taXQgZWIyMGU3Y2I5MWJhICgicmlzY3Y6CmRlZmNvbmZpZzogRW5hYmxl
IHRoZSBBbGx3aW5uZXIgRDEgcGxhdGZvcm0gYW5kIGRyaXZlcnMiKScKCgo+Cj4gVGhhbmtzLAo+
IENvbm9yLgo+Cj4gPiArICAgICBib29sICJULUhFQUQgUklTQy1WIFNvQ3MiCj4gPiArICAgICBz
ZWxlY3QgRVJSQVRBX1RIRUFECj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIFRoaXMgZW5hYmxl
cyBzdXBwb3J0IGZvciB0aGUgUklTQy1WIGJhc2VkIFQtSEVBRCBTb0NzLgo+ID4gKwo+ID4gIGNv
bmZpZyBBUkNIX1ZJUlQKPiA+ICAgICAgIGRlZl9ib29sIFNPQ19WSVJUCj4gPgo+ID4gLS0KPiA+
IDIuNDAuMAo+ID4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
