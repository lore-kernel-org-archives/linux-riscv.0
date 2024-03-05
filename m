Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8482DC54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aurEI//LyDz5J0exm0n0n2+nxT1MF+6WJN5203KTios=; b=zvhFJ8UGC4jbLD
	v1igVmgv3Qm5RUgl3umVY4Li6G/vjb8OBfAexe7gJJDYY0abOCHjVw4LgImC6Y+Oxa1bKgam/pgaS
	ZKLl8SsCWhEUbGideCWl3b3vlSiaCjMUU3LS6euj7Yw/In/gf646A3IOiE+Jw8Urawd/pHKPs/N5i
	soPazv2dmbp1NxCYkRBoxP/uAqeDpLo7nTVonzE9tHWZ54CWZbPz7/9djPJjsFNiCIktXaXsam1OO
	uI3//qJdNMN4QIw/PU2e5xnniH90Wr9n6TOmFPGHQsfV5A8ATrIFmiYmAsCD/nn66ZrwFgbVoj3sD
	SyNK/7dD+kL2qiv9DbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheNl-0000000Fec8-0gcy;
	Tue, 05 Mar 2024 23:39:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheNh-0000000Feb5-3Fxd
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E08E061575
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C20FC433F1
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709681972;
	bh=0WKq2SVEvxpP+1ncC/HkwCmFo+bMUGrCOaZgdBI8xhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DrXHOuG4+0G2fQIj9hLT1rgzGoIDuTcUheEnY8vADe8Q7/qPJlCOOg+eIlNgk+dVO
	 IcYLGu9lkBNOsxSjz03v/ERiwbeClJvEcGcShZP4zkqk3BwJy3zXqir285xBkPSSw5
	 Rtz81FWyoiZIDjmcRW0kl2ctWXYy0mXkg4bV4zmfESxT+wsqDcPa31tNWCdfC0dn9W
	 JXqfyjub+rbixVuyuCtxqE3G9Qg6jDTN4P0/ci13wOMSb0bvAp1Yi28Pwk7u/xYTRZ
	 Tl6En0FBylAFBfmI3VF1RAbTTMbiGwgelgBsojTTFbguAKWvKL0/ReG5hjMzjxql/I
	 ARJjLtR+u+gxg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso8421374a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:39:32 -0800 (PST)
X-Gm-Message-State: AOJu0Yz9Q0CG6u0fF/lzxMBi0AdJEaF9z9nAUi0e3vhLCCAZ3jlFvMs4
	ikt5+ZazuUhTzOqAIzp4XjBWCL7YOI+sJBq9+CC7awrjgcpb1GpISpPaslZuuYwGL11Ugtn+EOI
	ai89AhjHHd6XknqA/l7ptq/8tiKY=
X-Google-Smtp-Source: AGHT+IEB6V0Shy2ZvcaxQBZLlfsMO3KwwVzXupQ9uDjw1BFd30mhk74+4sUNNN+jon5kpSkKL5kyYuj5HLQYuJjmpDI=
X-Received: by 2002:aa7:c594:0:b0:567:2cf:1ecc with SMTP id
 g20-20020aa7c594000000b0056702cf1eccmr8400959edq.30.1709681971001; Tue, 05
 Mar 2024 15:39:31 -0800 (PST)
MIME-Version: 1.0
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com> <tencent_93C7B4F91D79712162D243201AF9F8520409@qq.com>
In-Reply-To: <tencent_93C7B4F91D79712162D243201AF9F8520409@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Mar 2024 07:39:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT1YM-N-W-GsuhhXpBh7Hjip9GofJCSxzbGpxyncn+TTQ@mail.gmail.com>
Message-ID: <CAJF2gTT1YM-N-W-GsuhhXpBh7Hjip9GofJCSxzbGpxyncn+TTQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_153934_064826_E50A1892 
X-CRM114-Status: GOOD (  11.19  )
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

T24gV2VkLCBNYXIgNiwgMjAyNCBhdCA0OjAz4oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+Cj4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBDYW5hYW4gSzIzMCBQ
TElDLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4g
QWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAgICAgICAg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Np
Zml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IGluZGV4IDcwOWIy
MjExMjc2Yi4uMTIyZjliN2IzZjUyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiBAQCAtNjUsNiArNjUsNyBAQCBwcm9wZXJ0
aWVzOgo+ICAgICAgICAtIGl0ZW1zOgo+ICAgICAgICAgICAgLSBlbnVtOgo+ICAgICAgICAgICAg
ICAgIC0gYWxsd2lubmVyLHN1bjIwaS1kMS1wbGljCj4gKyAgICAgICAgICAgICAgLSBjYW5hYW4s
azIzMC1wbGljCj4gICAgICAgICAgICAgICAgLSBzb3BoZ28sY3YxODAwYi1wbGljCj4gICAgICAg
ICAgICAgICAgLSBzb3BoZ28sY3YxODEyaC1wbGljCj4gICAgICAgICAgICAgICAgLSBzb3BoZ28s
c2cyMDQyLXBsaWMKPiAtLQo+IDIuNDMuMAo+ClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
