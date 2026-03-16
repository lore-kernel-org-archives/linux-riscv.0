Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC97F013E6
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 09:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3B2LeN/uRS1t6ujt5SiB0u50JRhXMNV5beM0IIO2pI=; b=dU3ozPkE4GfX91
	t49sJoJ/Q4WD+OFW9pSRWGXj/dM41cPpZwdPzDIOI8xDdNWPKz64ZjXeS5P1EVITNl+s+Ozcqi4c2
	jEyYLzYnvydVywm2rCRBN41xJoJ95BlHw2lUGEMDCHeXHuBKtv3haxk5goI6q9/YuPK0qyX7PgRe9
	DF0hsRh2rvx1RKPhSxPgXkVveq818QD22wd56ADjgTBgDD4kSWX1qKZpo+T9Wodv/3sFU3qx/kLQ0
	Jn7fyMZ78IEZ8YtlbWrNDnY8gLNU+yI+Mj7QnHXIx8LdGPHTZ+692F14dxpNh1hjkPfMfDPBMR68B
	zdpQPpJrNaF6kFQ22hTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24AG-00000003cpu-3BUI;
	Mon, 16 Mar 2026 09:23:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24AE-00000003cpZ-0s0s
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 09:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CE2844517
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6F6C2BCB1
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652985;
	bh=CXwq61eCW8OQANPCe0R/0xUepW7dY/FJ69RCGzSfjPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SleYnbi/ecxqTTgn5KrQayVfTbG8Dch/P6xF99MU2d27Wp+D8iKIpiGTswJwe3fjb
	 FcQceNY1Q0I8THExNLtRmrNED+pJcRguBh2HXzplUyWf10Ru+nS7fkOxfTB1qvhKFa
	 364DewCMLU3JpStfBRPz4L9Pi3Pxt0oB+fmvseuy+8bg7vVGlXupAY0WY9xcfFYgT4
	 Z4CEtpkikmgZSc9O7eVfqzfupgFldSaGRYVMbz8h+RJTfq32/xDUW3wVRADf/iflhg
	 8UcS5yv0Q+SKIWWb9ZG1yYnmwxl5/16eOviY1lbtOohzE0p3iDLFVFGmQOp1Xni8T+
	 x5VRApFFjdVjw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79881805788so43416407b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 02:23:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2pyuCnWA5UYACMT4cZa9h8+sxgs/m0r1r0ScFEnfGI4t0XrgXevsZMHC2SYppcnZFL+8iDDtj/kdY2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YydFVeYYOq5kV0D2XjAcKhRqvscWBbA+wVyWSouXOeIJb8OpjpX
	GsCCmm7VxRQIQjOp40iXt1AVEhe8+c0niLckABi9CVO7ASGHQqeqd0JQ6ONXlndrzVCpmtjaDos
	zma6VjRnyuK1Fi+dLOesw1VhC1nGl+P0=
X-Received: by 2002:a05:690c:60c7:b0:79a:56bc:2460 with SMTP id
 00721157ae682-79a56bc2946mr8149877b3.47.1773652984799; Mon, 16 Mar 2026
 02:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-mandolin-sprang-9b9bee9f5a04@spud>
In-Reply-To: <20260311-mandolin-sprang-9b9bee9f5a04@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:22:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAs_ecxHr-a7859_W7mf47RrQX_=rODc-AGE9y5o5irg@mail.gmail.com>
X-Gm-Features: AaiRm51N3JjKcics2-A_MeXZH9ngXp4_MtFwMOi7Ck6Nc1P9cY9ClvFsLjivCoY
Message-ID: <CAD++jLmAs_ecxHr-a7859_W7mf47RrQX_=rODc-AGE9y5o5irg@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] gpio: mpfs: Add interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_022306_289091_699B1315 
X-CRM114-Status: GOOD (  11.71  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNDoxN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBBZGQgc3VwcG9ydCBmb3IgaW50ZXJydXB0cyB0byB0aGUgUG9sYXJGaXJl
IFNvQyBHUElPIGRyaXZlci4gRWFjaCBHUElPCj4gaGFzIGFuIGluZGVwZW5kZW50IGludGVycnVw
dCB0aGF0IGlzIHdpcmVkIHRvIGFuIGludGVycnVwdCBtdXggdGhhdCBzaXRzCj4gYmV0d2VlbiB0
aGUgY29udHJvbGxlcnMgYW5kIHRoZSBQTElDLiBUaGUgU29DIGhhcyBtb3JlIEdQSU8gbGluZXMg
dGhhbgo+IGNvbm5lY3Rpb25zIGZyb20gdGhlIG11eCB0byB0aGUgUExJQywgc28gc29tZSBHUElP
cyBtdXN0IHNoYXJlIFBMSUMKPiBpbnRlcnJ1cHRzLiBUaGUgY29uZmlndXJhdGlvbiBpcyBub3Qg
c3RhdGljIGFuZCBpcyBzZXQgYXQgcnVudGltZSwKPiBjb252ZW50aW9uYWxseSBieSB0aGUgcGxh
dGZvcm0ncyBmaXJtd2FyZS4gQ29yZUdQSU8sIHRoZSB2ZXJzaW9uCj4gaW50ZW5kZWQgZm9yIHVz
ZSBpbiB0aGUgRlBHQSBmYWJyaWMgaGFzIHR3byBpbnRlcnJ1cHQgb3V0cHV0IHBvcnRzLCBvbmUK
PiBpcyBJT19OVU0gYml0cyB3aWRlLCBhcyBpcyB1c2VkIGluIHRoZSBoYXJkZW5lZCBjb3Jlcywg
YW5kIHRoZSBvdGhlciBpcwo+IGEgc2luZ2xlIGJpdCB3aXRoIGFsbCBsaW5lcyBPUmVkIHRvZ2V0
aGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4KCkl0J3MgYSBiZWF1dHkuClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
