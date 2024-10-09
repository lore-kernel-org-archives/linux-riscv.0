Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5ADCF0436
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1yrB+fQyOLQKwedV/yomagUSHOa4w//YpzsF4FFPe0=; b=kLUYiyOpdeDSiO
	8xwhf1OOOuncwX+fcJYG/N0gAvex7ArZ72+s6fKK6f0IX6qg1DD0YQiRELFrLw9b1gS9V2D852UM/
	GrYuTfBo3iteeuXwjyNC8Z1gw6Tlz0VuQnFCWuct3nP329V5dO+ibRHmU3i2II50qTlFzGavOpRBB
	8gOxf1g+c0NrlpQGTiF9ClUuYf/YpLgVXOl5t4C4zFQL/UA/qMBQjr07MXKgipToVShEP9ZjxzwCp
	sJdsKKqe1SB+hKCWCdV1/dyQsm4nI8UXRFTLktxwptxde6s1fJLWqK9xlXDjUwZUGovwqMqcCsTMq
	ftTUlKmoq+RlQPY0A8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTGN-00000008jq9-1iVl;
	Wed, 09 Oct 2024 09:45:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syS8g-00000008TjN-0rMQ
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 08:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A2FCA43B9A;
	Wed,  9 Oct 2024 08:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA5EC4CEC5;
	Wed,  9 Oct 2024 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728462824;
	bh=9Q/0qMMDwH3DhWlkAuznWJ4wMHL7IcScpi38s4BmJEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QQGMd+rREhqfT7e8a/8uYchi7BjyVc1W8ajDw9epzh+YilnnPbdIUHi3WW+A9XxF8
	 BrUPt/mHdYxVZZcFUq+bEA9fnhrytUZY+bDhUEvAC+3/ikq2a5Di0WodbRTKsBnj24
	 WdNlj3D/63NY0NuWhDEzhJT0Qly0bryiCzQ41DPIRgAJ1ObDFUBzk2dGZfqqVzCR+l
	 cXPdRSSR3r4GkV2Z1Nm0Faj7/282YByA53AAWGKJoZ1rfpQvIl8wip9PjS7r5UmrHJ
	 HbA2T7LMaKE9oqah79wDL1QXrAQSgqYj80YriTGgWjPy6vk6Dcne4NfZGJH24v1nMm
	 CwxP345lB7+nQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Subject: Re: [PATCH bpf] riscv, bpf: Fix possible infinite tailcall when
 CONFIG_CFI_CLANG is enabled
In-Reply-To: <20241008124544.171161-1-pulehui@huaweicloud.com>
References: <20241008124544.171161-1-pulehui@huaweicloud.com>
Date: Wed, 09 Oct 2024 10:33:40 +0200
Message-ID: <87jzeh4qvv.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_013346_346851_E00DE885 
X-CRM114-Status: UNSURE (   5.51  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBXaGVuIENPTkZJR19DRklfQ0xBTkcgaXMgZW5h
YmxlZCwgdGhlIG51bWJlciBvZiBwcm9sb2d1ZSBpbnN0cnVjdGlvbnMKPiBza2lwcGVkIGJ5IHRh
aWxjYWxsIG5lZWRzIHRvIGluY2x1ZGUgdGhlIGtjZmkgaW5zdHJ1Y3Rpb24sIG90aGVyd2lzZSB0
aGUKPiBUQ0Mgd2lsbCBiZSBpbml0aWFsaXplZCBldmVyeSB0YWlsY2FsbCBpcyBjYWxsZWQsIHdo
aWNoIG1heSByZXN1bHQgaW4KPiBpbmZpbml0ZSB0YWlsY2FsbHMuCj4KPiBGaXhlczogZTYzOTg1
ZWNkMjI2ICgiYnBmLCByaXNjdjY0L2NmaTogU3VwcG9ydCBrQ0ZJICsgQlBGIG9uIHJpc2N2NjQi
KQo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CgpUaGFua3Mh
IERpZCB5b3UgdGVzdCB0aGlzIHdpdGggdGhlIHNlbGZ0ZXN0IHN1aXRlPyBEaWQgdGhlIHRhaWxj
YWxsCnRlc3RzIGNhdGNoIGl0PwoKTm90ZSB0byBzZWxmIGlzIHRoYXQgSSBzaG91bGQgcnVuIGtD
RkkgZW5hYmxlZCB0ZXN0cyBmb3IgUklTQy1WLgoKCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
