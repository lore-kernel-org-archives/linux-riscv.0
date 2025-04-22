Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0BFC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80nzmzUNm8sDA6k5vYKN9e1g4M6gOstmbHxR/vFSzPU=; b=HUQlw5COWCYIQH
	c3ywhmTvskNMuOv9VMR740Hdha2FPob7FUO1tRrmNYDyeWrs1R9bpAvLTkGDDIJ8FGXTPQXYR0CFd
	81ei9GWjWE12T86pr03ISzk4z9YmU2dpWdXsXo3Pvx4cEW0tO6BqY7lJM3TYXoydVlUFVbquTYldJ
	e821gIZekyCwobkomdDSHrE1Wc9aFtLNQjSjsgOCJYtSqemaXV0pyNrqTnQ5fzdipg7A7GCp2JSR8
	sr41JZFX1pGUTc19f798HkUHsIDBzkVLIfMvnyxGVHEDJJPe70VE2ThXu9fF5oMO3uwVdtS0zWgxS
	W8T6RM4RvAxQvqYfIn7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FHp-00000007ecN-2ZF8;
	Tue, 22 Apr 2025 15:11:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E4h-00000007Ni1-06Ji;
	Tue, 22 Apr 2025 13:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46F165C4988;
	Tue, 22 Apr 2025 13:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112D6C4CEE9;
	Tue, 22 Apr 2025 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745330050;
	bh=6Wzq1iekPqXgmnP7Gba156hgO+tNrROaqfH6jIM9C+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHgFR2Z2QdQVkG89FDiYTSejqFFaZootQW1RLTlN4VTS9BT6mUz4xIEB+cE98i+oi
	 7Z1k1H85b+uCtX4fxh99lyZ6+OCosJHgM3Bu2VgoxxT6UwJJnVuve/a0LX4xG1OOe8
	 ApiHlU+IMBXLC+OA+WptKVc50ivzFAtMV/odKkrDVrrjnNflpzhnSE5UI5Obuz5rVt
	 tJyzYEisW+ZUB0GZpz3y5iuRUsQwOvlJn2yr7No/v2ymlz9pSstsc+mXQBWM+Gu74n
	 1kk6YPy+PNDA0e+R6DJOYvUWWv1XbjRynHTUvxi/NBh+8bZnV9dIC6CBNesZFRCHAz
	 SbtPPt7cEoKhQ==
Date: Tue, 22 Apr 2025 14:54:05 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Li Zhengyu <lizhengyu3@huawei.com>, kexec@lists.infradead.org,
	Dave Young <dyoung@redhat.com>, Yixun Lan <yixun.lan@gmail.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	linux-riscv@lists.infradead.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 1/4] RISC-V: Add support for riscv kexec/kdump on
 kexec-tools
Message-ID: <20250422135405.GA2948814@horms.kernel.org>
References: <20250409201428.648717-1-bjorn@kernel.org>
 <20250409201428.648717-2-bjorn@kernel.org>
 <20250422104825.GT2789685@horms.kernel.org>
 <87bjso5ri7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bjso5ri7.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065411_133709_621B1B1A 
X-CRM114-Status: GOOD (  14.45  )
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

T24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgMDI6MDc6MjhQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBTaW1vbiEKPiAKPiBTaW1vbiBIb3JtYW4gPGhvcm1zQGtlcm5lbC5vcmc+IHdyaXRl
czoKPiAKPiA+IFRoYW5rcyBCasO2cm4sCj4gPgo+ID4gT3ZlcmFsbCBJIGFtIGhhcHB5IHdpdGgg
dGhpcyBwYXRjaHNldC4gQnV0IHRoZXJlIGFyZSBhIGZldyBtaW5vciBwb2ludHMKPiA+IEknZCBs
aWtlIGFkZHJlc3NlZCwgd2hpY2ggcmVsYXRlIHN0cmljdGx5IHRvIGJ1aWxkIGNvdmVyYWdlIGFu
ZCB0aGUgQ0kuCj4gPiBJIGNhbiBoYW5kbGUgdGhlc2UgbXlzZWxmIGlmIHlvdSBwcmVmZXIuCj4g
Cj4gSXQncyByZWFsbHkgdXAgdG8geW91ISBXaGF0IGRvIHlvdSBwcmVmZXI/IEkgY2FuIHNwaW4g
YSB2MiBpZiB0aGF0J3MKPiBlYXNpZXIgZm9yIHlvdSAoYW5kIHRoZW4gSSdsbCB0cnkgdG8gYWRk
cmVzcyBhbGwgdGhlIHRoaW5ncyB5b3UgcG9pbnRlZAo+IG91dCBiZWxvdykhCgpIaSBCasO2cm4s
CgpBIHYyIHdvdWxkIGJlIHBlcmZlY3QgZm9yIG1lLgoKSWYgeW91IGFyZSBzbyBpbmNsaW5lZCBh
bmQgeW91IHB1c2ggdGhlIHBhdGNoZXMgdG8gYSBHaXRodWIgcmVwbwp0aGVuIHRoZSB3b3JrZmxv
dyBzaG91bGQgcnVuLiBJdCBpcyB3aGF0IHBpY2tlZCB1cCB0aGUgbWlub3IgcHJvYmxlbXMKSSd2
ZSBoaWdobGlnaHRlZC4KCkJ1dCBpbiBhbnkgY2FzZSwgbGV0J3Mgc3RpY2sgdG8gdGhlIGVtYWls
IGJhc2VkIHdvcmtmbG93CmZvciBwYXRjaCBzdWJtaXNzaW9ucyAoZm9yIG5vdykuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
