Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725B8C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=fHlfp+agNneXX93GX85ZfSMJJtpgYC8eqGCxGS2Kx1w=; b=eZy
	qG1XY3uKuHphr7Aa7JQbTrIEhjOPmO1NPzz2ob5PbZF24GVcm4MO5FBzrFhLFYxkXpes9ZQaNHXfK
	khvfYvXkKtD8YH/4hKOBnPZCQYwc228Smj3+tLvtf21F3XWwNO24hrgfT4Ws7dQFyPNfWNTqPba5t
	106Y0EF+IVvgmbR5buzSguaNK0vxb+izzQcDiRcO8W0NrNlkhQOOCSDYJbEm8A1zvlATpgPfqSPB3
	Bw6zdJsb3eb7FE49+PhIs2S9xdMQWif6PshNjBI6M7R/OcWk05UB4LdoJQtHleKV91VTuuQGQg9n9
	P/9fx15afyEFm7OObIv3CA+82DBw6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5xV-002bvb-21;
	Thu, 24 Aug 2023 08:44:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5xS-002bu6-33
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 08:44:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BBAA667D0;
	Thu, 24 Aug 2023 08:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3449C433C7;
	Thu, 24 Aug 2023 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692866689;
	bh=WjEYwIQ+ih0hWZawOakYEwJaByLhV4TUxI5aS7GWA/0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=Kuw5XgYtBdePEfpDXm+rMna34IdIqO6nIntgkMaZ0tQ68B8B1hPt7xm9wEhMFaERm
	 N2pnkKF6MkAGGbESHjBvdcAJPWyQfe5ibVSsBZ4buLdtsb9+mBIn5sa6v6PCyBp8Ac
	 OwMzgjzf3jf61kmzLquG0YRKp+AsLpUyYjGDKLNvksPIH+BVdGtjgOzawgpfjzPYR3
	 wy89wH1bj77qt+GyXtZ8hocYhI5hYqFXfkdIL6GPqKQ2xRdrUw4LmhmOeaEQzWP9im
	 CxYeg+OPCQfIxeYIEyO4kqPTFUAcl+MKEv1/iLrXtaCma6hgCbYQdAKfsdr2dGN7Ci
	 KCnZ3rJYuVpAw==
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
Subject: Re: [PATCH bpf-next v2 3/7] riscv, bpf: Support sign-extension mov
 insns
In-Reply-To: <20230824095001.3408573-4-pulehui@huaweicloud.com>
Date: Thu, 24 Aug 2023 10:44:46 +0200
Message-ID: <87zg2ghls1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_014451_044576_C718753A 
X-CRM114-Status: UNSURE (   4.70  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgc3VwcG9ydCBzaWduLWV4dGVuc2lvbiBt
b3YgaW5zdHJ1Y3Rpb25zIGZvciBSVjY0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpLmNvbT4KCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
