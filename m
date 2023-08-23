Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FBDC3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIr6z0JWjgdYLbEVo5VDhGH8pV0q8jdtOJ5Cg9Nlkwk=; b=qiIVUa0JHoJITk
	2BaSNr6A5wSrzX+bxRRLJOogGfsoeXEWj0mC3zL1BTnV8ODoSWuVSKHZH+RAAzky0AHAmAufAZqrj
	nOJFrArjfoENuUKXHntq4gaUbkrqWDE9UbnPElvPWeKLgKUNjO4RkxZ398meEMI9HDr6t5xPeth/S
	IkQ+XB4TMmAWbwgCFL9DOOzCexkFiKJzYdF9Ybbjv830PZf/EQLaq78nbUEXmfajdzIL4kGVZQzsk
	vj1Oy8+kCIPD/fbOMvoaz3J02PQ+yDZyzlhdLNX32dz5NuwfsEQb66USBSOVWFkvbok1axbx0aXx8
	SyFaeYXJqX3A3M7P8ArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtsS-001S7a-2x;
	Wed, 23 Aug 2023 19:50:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtsP-001S79-2i
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 19:50:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9ED7E6137A;
	Wed, 23 Aug 2023 19:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2F4C433C7;
	Wed, 23 Aug 2023 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692820248;
	bh=xUP8Aao2vUba1hN7Bnt0t6crXDnohGolTg985mKMKdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZuhIPkP4CUsDGiKsOw1+HxLQGXZ3YTAWFNprtH9vVrl5/Qw4zQzzpc7LN2Uhe5P38
	 n4sJnMcOKXZ4Dibb3GYiZ3x4yZQ+CeXJAGdmE0Mfn6c4zlb0rDzr776/rHhnqXomT8
	 PGx1H4DfgF/ul1OhKJMwWUU5Jbpleqxx5Gaf+hz1aK5uBsEgOtC8jXcv0wB+ML4SyI
	 qXmVdf9SyuWd/eEn4r3IRVOdEKtPAFjtomQu/7QpHHxi2trZDJ5eBjXndUBPWy/YBD
	 GD1MeLqAXSE5rpWrQuf6M2UjBwScWXM6ITjebQ9eG1Bjdwex2rcUUa2NgU8UNnuDeH
	 bTE7/+NhO2eUA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, bpf <bpf@vger.kernel.org>, Network
 Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri
 Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai
 <xukuohai@huawei.com>, Puranjay Mohan <puranjay12@gmail.com>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 7/7] selftests/bpf: Enable cpu v4 tests for RV64
In-Reply-To: <CAADnVQLu5twbe_UpiJrD0wKq1YyHzZbfzYhsW-mte7vDmyna5g@mail.gmail.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-8-pulehui@huaweicloud.com>
 <87zg2hk44i.fsf@all.your.base.are.belong.to.us>
 <CAADnVQLu5twbe_UpiJrD0wKq1YyHzZbfzYhsW-mte7vDmyna5g@mail.gmail.com>
Date: Wed, 23 Aug 2023 21:50:44 +0200
Message-ID: <875y55tu5n.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_125049_924454_BFD151CA 
X-CRM114-Status: GOOD (  10.40  )
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

QWxleGVpIFN0YXJvdm9pdG92IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29tPiB3cml0ZXM6
Cgo+IE9uIFdlZCwgQXVnIDIzLCAyMDIzIGF0IDExOjI14oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympv
cm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3Vk
LmNvbT4gd3JpdGVzOgo+Pgo+PiA+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+
Cj4+ID4KPj4gPiBFbmFibGUgY3B1IHY0IHRlc3RzIGZvciBSVjY0LCBhbmQgdGhlIHJlbGV2YW50
IHRlc3RzIGhhdmUgcGFzc2VkLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpLmNvbT4KPj4KPj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+Cj4KPiBCam9ybiwKPgo+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIHF1aWNrIHJldmll
dyEKPiBDb3VsZCB5b3UgZ2l2ZSBpdCBhIHNwaW4gYXMgd2VsbCBhbmQgaG9wZWZ1bGx5IGFkZCBU
ZXN0ZWQtYnkgPwo+Cj4gV2Ugc3RpbGwgaGF2ZSB0aW1lIHRvIGdldCBpdCBpbnRvIGJwZi1uZXh0
IGZvciB0aGUgdXBjb21pbmcgbWVyZ2Ugd2luZG93LgoKSSdsbCBraWNrIGEgcnVuISBCdXQgSSdk
IGxpa2UgYSBjaGFuZ2UgdG8gbW92IDgvMTZiIHBhdGNoICgjMykgcHJpb3IKcHVsbGluZy4KCj4g
V2Ugc3RpbGwgaGF2ZSB0aW1lIHRvIGdldCBpdCBpbnRvIGJwZi1uZXh0IGZvciB0aGUgdXBjb21p
bmcgbWVyZ2Ugd2luZG93LgoKQExlaHVpIERvIHlvdSBoYXZlIHRpbWUgdG8gY29vayBhIHYyPwoK
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
