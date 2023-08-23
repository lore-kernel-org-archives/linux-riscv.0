Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377BCC3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhS0fyy5IlAA/Pw3OsiOiEQN2L7Bk9fIpOIFqQAOsko=; b=rf+wqF9A/50/vw
	QcGnc8VDkYzrUo+OWblAO+Ihd32eXyy7dRynndjKU9zUZDYRBqzaJVivaJf2fGMtT58dCIGlAVz0G
	5Rv/5dR+Q8Tg4zRPY6Q8z8c2OsUX4Fjh9gAvVnCPc3SNWC0jbfeb2nKLv94Ks0alQtZe7Tf8RaSlI
	cH9dh45QPxToJdWqNH8laN6nd+aCQyUihUreYE+AvKpVmZl5PDlvs3K329f7GgHK1HsSXOz2f3/5h
	toalI8c4S5FPDAcDyoKC59N6c/jqhl9gk9ZOrl+zlOGjFqoVJSVc2WOYpgF7NqAF9QQGYMVauIGwf
	3RkXBXCe8sgNmRSemVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsXH-001Je6-29;
	Wed, 23 Aug 2023 18:24:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsXE-001JdG-1k
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:24:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB27665001;
	Wed, 23 Aug 2023 18:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D36C433C8;
	Wed, 23 Aug 2023 18:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692815091;
	bh=Wz+ssdWTwoTiSo2ITnOaFFeZ1XRrz+F/5qzgicEYcis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=htwvCHPej4Jwnp2UFIBuXIpTeJKk276AumCa8WcFRh4NFFKbauNDVSOpWZC3VBxIl
	 v3n6If3I9FIk/nGZKOfO4IdtpKZ6BxYyUxzAF/vY6w/LExx9uNt30ncKwFMyvMVsmu
	 paeH2C9AMXeRpPfE5YAEjrANcq/0BvLv1rPocJVDJEqny38oz/Z+x6WJVRQh3mHOlh
	 au0NcRUkck+nJnf00QqNJKrZLNs4tZpuFc/161Dsdb1ulHCnW9BLKcnhDfGQnXJzc2
	 oE7d4ZhIL+DoKQsVmoMnjAtvZS/mxW/7IWMim91jFwShUAM2LRNpw7vvpPU2943QWS
	 18mMp4Yydhbpw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri
 Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai
 <xukuohai@huawei.com>, Puranjay Mohan <puranjay12@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 6/7] riscv, bpf: Support unconditional bswap insn
In-Reply-To: <20230823231059.3363698-7-pulehui@huaweicloud.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-7-pulehui@huaweicloud.com>
Date: Wed, 23 Aug 2023 20:24:47 +0200
Message-ID: <875y55liq8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_112452_625322_F9B7C729 
X-CRM114-Status: UNSURE (   5.67  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgc3VwcG9ydCB1bmNvbmRpdGlvbmFsIGJz
d2FwIGluc3RydWN0aW9uLiBTaW5jZSByaXNjdiBpcyBhbHdheXMKPiBsaXR0bGUtZW5kaWFuLCBq
dXN0IHRyZWF0IHRoZSB1bmNvbmRpdGlvbmFsIHNjZW5hcmlvIHRoZSBzYW1lIGFzCj4gYmlnLWVu
ZGlhbiBjb252ZXJzaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVh
d2VpLmNvbT4KCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
