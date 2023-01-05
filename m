Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522DFC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 19:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvlRTdtbv89SDkU2wfDaLMuiPA1SyYpToumxlcvctgs=; b=XNT+ZVNoExHT6y
	Cjwr8jG1WImw/Aa8BDYVL04sp/KaLoSRWCmsAi391LI8p22CZYE5jzV0gALq5xnWpEdLl0GUSTV6m
	mjqEuZSWNMmz3SS9jLP0qyY4kjvBnztORBMfkJA4ZQ027nsEU1jnYRFee/CAVogIPl6tkIVd9QTch
	0e/TwDYMKy6p0XwH8xeZMsK19YD8ta1A/8KthB+gAWE9TZ6rGMD7O5uJkBrJHEY3iUC9P9Xm7Goox
	avy0mFzyvA11Aqu/L4siqZHmTTEtIeyFDZSbtCDIe32fyb1FdS/GFKzgb3uc14vw2j1ie6hZKi8Pp
	Wqf0Z+0AbuMNmqaWo7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWOz-00EJw6-G9; Thu, 05 Jan 2023 19:59:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDMg1-009jz2-Lf
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 09:36:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1C5CB8198D;
	Thu,  5 Jan 2023 09:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0252BC433EF;
	Thu,  5 Jan 2023 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672911401;
	bh=m5deoU/iNE9s4Vf89FWDMooWeaxz9CcPD3sBSp186Jc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XAIF+O/OJ8hBrx0XzmPtDLuBUKq1L7we5ffh4nU0DiEwdYjDuZac51Wso30jJIXI7
	 7UdB+1Up/st73efB6kDy9jSKt8fsIjDDVW1luXjxGQ3tXjnpAZYc4ZwwQqwIW05Q4M
	 HhyiOXwyM4MouTVuSouy27QZk/drd+8Mt+sLauqQJLv5veN4qc2oGN/T/hG/UPoesC
	 qc4lK6AhHapx5A6VflLx01e6ATIAF1fvVZDoRGsHyPZv4lse8uVPpDZsPQPzfIgfaQ
	 qkr/QlxpgTMERkK/4vkOLDFNz0Gs03AYb1ySIb5XUJFd0DpUe7gUpK6NFfw+JSZaoB
	 idO9R04j1Pugw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: tong@infragraf.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.or, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Cc: Tonghao Zhang <tong@infragraf.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Hou Tao <houtao1@huawei.com>
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
In-Reply-To: <20230105030614.26842-1-tong@infragraf.org>
References: <20230105030614.26842-1-tong@infragraf.org>
Date: Thu, 05 Jan 2023 10:36:38 +0100
Message-ID: <87zgaxqq55.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_013645_911414_A6338836 
X-CRM114-Status: UNSURE (   8.22  )
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

dG9uZ0BpbmZyYWdyYWYub3JnIHdyaXRlczoKCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29yZS5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKPiBpbmRleCA3
MzdiYWY4NzE1ZGEuLmZmMTY4YzUwZDQ2YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvcmUuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCj4gQEAg
LTE1MSw5ICsxNTEsNiBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRfaml0X2NvbXBpbGUoc3Ry
dWN0IGJwZl9wcm9nICpwcm9nKQo+ICAJfQo+ICAJYnBmX2ppdF9idWlsZF9lcGlsb2d1ZShjdHgp
Owo+ICAKPiAtCWlmIChicGZfaml0X2VuYWJsZSA+IDEpCj4gLQkJYnBmX2ppdF9kdW1wKHByb2ct
PmxlbiwgcHJvZ19zaXplLCBwYXNzLCBjdHgtPmluc25zKTsKPiAtCj4gIAlwcm9nLT5icGZfZnVu
YyA9ICh2b2lkICopY3R4LT5pbnNuczsKPiAgCXByb2ctPmppdGVkID0gMTsKPiAgCXByb2ctPmpp
dGVkX2xlbiA9IHByb2dfc2l6ZTsKCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiAjIFJJU0MtVgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
