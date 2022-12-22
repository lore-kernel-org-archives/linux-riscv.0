Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EC3C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yy4O4B2aZ+mxPpJbjQEDA4GOW2hRCuaXXggcuxfUG7U=; b=lpwtNtkIIRhs60
	xF7B/fb0tqYSGTeHYVbvwsvvYgP70k1jWI9ZWt+F8DfI/xqiICvvI/bGnIeLvRV8N8pTz7wxuxwtz
	zvnXgzX5k6EUYpmdvQrO+PXvaYTUb+obIBTWFxCYsLXzWxWoFBQYBIoSPnMHpnqjmgQwFLhWlsh95
	t1HeVgsHC4KxDMlSTIGw/6E3Eat4i+ntGd1u1F1j0xgEC276NCpiPjk/D4O+X2hzrtg22BC5eXEkj
	fP3z9Tb+riFGCTCZhaasKQANypKGjSFqQr4bnYXOurEg+sahlF95cgqQWGooYQ4EemXYkPan/IYUv
	uIPdJ8nx0vEvzLN4QoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Lzf-00Ccjd-Ot; Thu, 22 Dec 2022 13:52:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LBh-00C9VM-DO
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 13:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74BDEB81D2C;
	Thu, 22 Dec 2022 13:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D61C433D2;
	Thu, 22 Dec 2022 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671714036;
	bh=9W5wvIsudxlyGWjHXQF4tUGsiSCy97rCYsCSM77Fg00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dcnzhC9r1DlFOf5fxMK6qAK/mWD0n9P52cyC6lX/n411r5np52AZp3mrqa6wAnRNR
	 plT+6Mo/k5/VMd7IsD+D0UrZeTmKXhiqypuVaWuj9Uj/EHedpLogBWQ85eUhscJYVb
	 4/6UL3dLJB2O4Y8Jg2/UKJ+2snswaQhAVvVbYJUVsyOLpoA+2cNXsbUAn/3BSg20dP
	 HBiipcUVhQtcXkIyHkwDJiMdG5OoOjsFvKQ43S2L0gctF2n7XUkf5qRlPA+Hwy7Wd7
	 qB31vpwGubOk0lfVBs7e8IJTtxUczi4wA6YvYyuKEsi6xvzS3Caez5j5NShZGQC3Iu
	 +k02QLKYRa/Qg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [RFC PATCH RESEND bpf-next 0/4] Support bpf trampoline for RV64
In-Reply-To: <20221220021319.1655871-1-pulehui@huaweicloud.com>
References: <20221220021319.1655871-1-pulehui@huaweicloud.com>
Date: Thu, 22 Dec 2022 14:00:33 +0100
Message-ID: <87ili3a8zy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_050041_938277_C6C96FED 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEJQRiB0cmFtcG9s
aW5lIGlzIHRoZSBjcml0aWNhbCBpbmZyYXN0cnVjdHVyZSBvZiB0aGUgYnBmCj4gc3Vic3lzdGVt
LCBhY3RpbmcgYXMgYSBtZWRpYXRvciBiZXR3ZWVuIGtlcm5lbCBmdW5jdGlvbnMKPiBhbmQgQlBG
IHByb2dyYW1zLiBOdW1lcm91cyBpbXBvcnRhbnQgZmVhdHVyZXMsIHN1Y2ggYXMKPiB1c2luZyBl
YnBmIHByb2dyYW0gZm9yIHplcm8gb3ZlcmhlYWQga2VybmVsIGludHJvc3BlY3Rpb24sCj4gcmVs
eSBvbiB0aGlzIGtleSBjb21wb25lbnQuIFdlIGNhbid0IHdhaXQgdG8gc3VwcG9ydCBicGYKPiB0
cmFtcG9saW5lIG9uIFJWNjQuIFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBicGYgdHJhbXBvbGluZQo+
IHdhcyBjbG9zZWx5IHRvIHg4NiBhbmQgYXJtNjQgZm9yIGZ1dHVyZSBkZXZlbG9wbWVudC4KClRo
YW5rIHlvdSBmb3Igd29ya2luZyBvbiB0aGlzISBCUEYgdHJhbXBvbGluZSBpcyB0aGUgIm1pc3Np
bmcgcGllY2UiCmZyb20gZ2V0dGluZyBwcm9wZXIga2Z1bmMgc3VwcG9ydC4KClVuZm9ydHVuYXRl
bHksIEkgd29udCBiZSBhYmxlIHRvIGRvIGEgcHJvcGVyIHJldmlldyB1bnRpbCBuZXh0IHdlZWsu
CgoKSGFwcHkgaG9saWRheXMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
