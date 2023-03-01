Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85894C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 02:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/Vca+0uMe3Ms9ficeEAeHrxFxpiSflsJeBCazPdJIc=; b=4EEzbwFWZHEnfh
	LybeQx8FDOaajWUDs9SVsuUNaRFRxRo5S6RM9pU8IcOO6hB8u5zxdBwwKZkFFwO+N4dmXq1boxLk3
	OYCMyl0sv9oGA3ejNvejpV/P+5nCZcPPL/0TlXpIvEs0WjKwqmSJlZJ44lfP9pVmymDnmh2GG9b3a
	JQQXbigTCZLpSxQJSLFRIJmm4Cif17YQKEw+CbPymkkD+pZqfG5WFI1JGef5RrxJs8xDG4JktZFnf
	VY66YSvgHJZUEjU7icrlEIUKr7iOYl2FVvTgbmLnvXxv4UoTaJ60Hvdw/ZQH4GVL6TS3XNiEeKXLw
	UYgTNXy8YSNBNv0SItZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXC6r-00EsH9-0l; Wed, 01 Mar 2023 02:22:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXC6n-00EsGZ-U0
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 02:22:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3725D6122E
	for <linux-riscv@lists.infradead.org>; Wed,  1 Mar 2023 02:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79ABC433AE
	for <linux-riscv@lists.infradead.org>; Wed,  1 Mar 2023 02:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677637340;
	bh=U33P0NyrqWLHKl8GZ4YuPEs18eKHtUPecDCiQFZw5yo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fDVDgZ/vwaUIdgMHa//um6SNWnks3Bi8gYwRRPL32QTYJ8F2ODysA8RcYJzlsfaHH
	 VXJzzyJ9MsBw0uEjeed4hiRpJsTknxgZQ/4cQK/+bhfQkVprvlNEFF1I3o4pVBx8/4
	 jLl2842aAEgUn2nJyCmjuTf+JZ95SSdMPQXe33EnLRYceDv1kN4QPG2OOe8yNKK6Cy
	 rsj5dPNjBmtlK88vHSVxjVt/ZxRZcwQMGxj32UzD1R2UJcHVXM8Kfio+bE07QWXpO4
	 og0IpT8mGQIqHj0iGYIonCiaDIO/SIsCwUJO3QuDRMNfZoxuucWHpIN1FcvmNoCZji
	 +fdimsgww8jkw==
Received: by mail-ed1-f43.google.com with SMTP id f13so48096382edz.6
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 18:22:20 -0800 (PST)
X-Gm-Message-State: AO0yUKXDibhNH3eAS/9v+KbZ80+bYrqLy15jf4mJJD1ngVfZoTnQUq7t
	AcCwgxY9XD2Ae1LFeHS7aBl6vxyjxSMziMCIY44=
X-Google-Smtp-Source: AK7set8CC2LfBvQLsabLWQBvlwpphENbr9MVwvCMYqTjstMKH69q4QthOs9G4L7V4Vq2KUIHfX1hvVsfJmMLxKAIzSM=
X-Received: by 2002:a17:907:2ce6:b0:8df:dc64:30d2 with SMTP id
 hz6-20020a1709072ce600b008dfdc6430d2mr10384264ejc.1.1677637339026; Tue, 28
 Feb 2023 18:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20230228215435.3366914-1-heiko@sntech.de> <20230228215435.3366914-2-heiko@sntech.de>
In-Reply-To: <20230228215435.3366914-2-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 1 Mar 2023 10:22:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTJRy1ABdNTHJY+4SZpyAFnRgr6POT37JjS6bV_r+d7bQ@mail.gmail.com>
Message-ID: <CAJF2gTTJRy1ABdNTHJY+4SZpyAFnRgr6POT37JjS6bV_r+d7bQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] RISC-V: define the elements of the VCSR vector CSR
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, samuel@sholland.org, 
	christoph.muellner@vrull.eu, conor.dooley@microchip.com, 
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_182222_026292_022295D6 
X-CRM114-Status: GOOD (  14.29  )
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

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBNYXIgMSwgMjAy
MyBhdCA1OjU04oCvQU0gSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4K
PiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Cj4KPiBUaGUg
VkNTUiBDU1IgY29udGFpbnMgdHdvIGVsZW1lbnRzIFZYUk1bMjoxXSBhbmQgVlhTQVRbMF0uCj4K
PiBEZWZpbmUgY29uc3RhbnRzIGZvciB0aG9zZSB0byBhY2Nlc3MgdGhlIGVsZW1lbnRzIGluIGEg
cmVhZGFibGUgd2F5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0
dWVibmVyQHZydWxsLmV1Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwg
NSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPiBpbmRleCBhZGQ1MTY2MmI3YzMuLjhiMDZmMjQ3MjkxNSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jc3IuaAo+IEBAIC0xNzYsNiArMTc2LDExIEBACj4gICNkZWZpbmUgRU5WQ0ZHX0NCSUVfSU5W
ICAgICAgICAgICAgICAgICAgICAgICAgX0FDKDB4MywgVUwpCj4gICNkZWZpbmUgRU5WQ0ZHX0ZJ
T00gICAgICAgICAgICAgICAgICAgIF9BQygweDEsIFVMKQo+Cj4gKy8qIFZDU1IgZmxhZ3MgKi8K
PiArI2RlZmluZSBWQ1NSX1ZYUk1fTUFTSyAgICAgICAgICAgICAgICAgMwo+ICsjZGVmaW5lIFZD
U1JfVlhSTV9TSElGVCAgICAgICAgICAgICAgICAgICAgICAgIDEKPiArI2RlZmluZSBWQ1NSX1ZY
U0FUX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAxCj4gKwo+ICAvKiBzeW1ib2xpYyBDU1Ig
bmFtZXM6ICovCj4gICNkZWZpbmUgQ1NSX0NZQ0xFICAgICAgICAgICAgICAweGMwMAo+ICAjZGVm
aW5lIENTUl9USU1FICAgICAgICAgICAgICAgMHhjMDEKPiAtLQo+IDIuMzkuMAo+CgoKLS0gCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
