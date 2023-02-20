Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C8DC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1zaWeYBsQu0qY+RBhZkJ74Iuq4g/lThC487zGJVLkQ=; b=doiZZzVptL2lrs
	6kx/MsCMfQS6nrbA6OFfuCUTM506rhmSbdPB46Rdx5l/Dbr85ubjiDA5f0vQ5C+al03mT2oyCGD26
	/kfh0zz5UlctDfbeaPm7FtzvmO0XgY8mTyWDo/1Xnv60H8mt0AOF9sZK8/4qObIBJdb2YPA0UBgIp
	fnaKwXfEx6ejQwLdKzvxFkq7heQ+xG9LS+8RnRgMgEH3esrlq1LNL4yEg5F/MadLTvgkU52q9shzG
	vu97eYzLIjxSwBiC3pIklCNS4vyU5Uqt+42oDyJpZSwnkzvNAClYRChBAm2TPLf0rVN7IcXH9T9j3
	0cswADA6VXBA5yaFpo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7Ff-004KXd-2X; Mon, 20 Feb 2023 14:34:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7Fb-004KXG-H9
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 14:34:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9419F60EBC;
	Mon, 20 Feb 2023 14:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F6DC433EF;
	Mon, 20 Feb 2023 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676903682;
	bh=Q7xwmxAFcgiZe5wxX+YHvnpG14ZgiYhdN894N7fOwzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uVVEmlRRh5fcR0sE9YzM1KrFuZ6AaIZSSfoxCIWkgcWQzAmX4FhRVODb8lDI59v46
	 dUQKhXFssYXhNzGkyXQFVNk2bQgO2hnvKrGlwcU1rIY2wAVLQHMCF8cc/gm+KNUpii
	 7n+qghnJKHpwPPjGxNJ5VNZGdFdp5g55FcDSoxbvLm0IUsRThQQpRDR8c0qoWivCu/
	 mdh6gf8w2dACAnIRHpGqZvJSIe++bZ4aTWsmXOgkub4XbowfwSfwc3gkmtqQQ5mjSL
	 XyeUSgs+2k025BHAPcGnLW8ifsNrGKyDzdp+CWnzlRp5bJuQaKjk9PWJxmA/6Aal3n
	 MF8YZyaErpTcg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2] riscv, bpf: Add kfunc support for RV64
In-Reply-To: <20230220083203.2988238-1-pulehui@huaweicloud.com>
References: <20230220083203.2988238-1-pulehui@huaweicloud.com>
Date: Mon, 20 Feb 2023 15:34:39 +0100
Message-ID: <874jrg76dc.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_063443_629508_6456B901 
X-CRM114-Status: UNSURE (   8.45  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBcyBhbm90aGVyIGltcG9ydGFudCBtaXNzaW5n
IHBpZWNlIG9mIFJWNjQgSklULCBrZnVuYyBhbGxvdyBicGYgcHJvZ3JhbXMKPiBjYWxsIGtlcm5l
bCBmdW5jdGlvbnMuIEZvciBub3csIFJWNjQgaXMgc3VmZmljaWVudCB0byBlbmFibGUgaXQuCgpU
aGFua3MgTGVodWkhCgpNYXliZSB3ZSBjYW4gcmV3b3JkL21hc3NhZ2UgdGhlIGNvbW1pdCBtZXNz
YWdlIGEgYml0PyBXaGF0IGRvIHlvdSB0aGluawphYm91dCBzb21ldGhpbmcgbGlrZToKCiJOb3cg
dGhhdCB0aGUgQlBGIHRyYW1wb2xpbmUgaXMgc3VwcG9ydGVkIGJ5IFJJU0MtViwgaXQgaXMgcG9z
c2libGUgdG8KdXNlIEJQRiBwcm9ncmFtcyB3aXRoIGtmdW5jIGNhbGxzLgoKTm90ZSB0aGF0IHRo
ZSB0cmFtcG9saW5lIGZ1bmN0aW9uYWxpdHkgaXMgb25seSBzdXBwb3J0ZWQgYnkgUlY2NC4KCkFk
ZCBicGZfaml0X3N1cHBvcnRzX2tmdW5jX2NhbGwoKSB0byB0aGUgNjQtYml0IEpJVC4iCgoKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
