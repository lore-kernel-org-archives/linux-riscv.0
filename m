Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E06C27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTc9vCoK1F55jLaJopX82e7V+/llf0QpabOlnRiQ94Q=; b=w/wJOLyKrt2sFz
	2WAxDlhqb+79Ctk09SzpPnT63j4AuxcO7JLvlD9WG5zytmj+9Zwj5Sxcv4viEYDJdbVOdDGPxOCS6
	IFpjRxUxjFIfgbGY5Fi6Lf0uNIZhaQlu/7QwyceKYDGxduiSVycp9t2cXRX6wtoGQJ+6EPhcL473R
	HO7h/wCkADNK0+AtM+ZMeljkNHcR67j+j1uuuSa+V3x+n+0RyWLU+/BLAcWAPewg7e4KNeKfIl2Bw
	Hnsq73JA6iG9LtMyDWcT7GpsR3KI16wYaUjOOktCSBwaGUpC7tJ/TqKaUb6Pf1KikaDy7Ssqxjnjn
	yvXV+dvXQOWggZTSZ78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5zK-002cFi-0z;
	Thu, 24 Aug 2023 08:46:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5zG-002cEr-32
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 08:46:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 65C9864384;
	Thu, 24 Aug 2023 08:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D557C433C8;
	Thu, 24 Aug 2023 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692866801;
	bh=XDddRmzIKkYqEuz8kl983GzVIYWy/vD+zwVKZEhKP2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DQ7dli6mYgIhSksQ3KibQRXYJ9ICqwsGFeJe2NhE9giEOlOOs8nk+Rjqwpab0o724
	 0givHuxrlp7/G1s60bvbTttOd7Ln9/sO3WMZD3nbplYfTtzlm+zMZOWinbDJCagSfU
	 tSEydsO9k/rNJo4xj5s+pgV2tLJjRTSFoVrY6/IUCx411VreqwPJva/pe536Dm+nzb
	 v1eVRespUfgvAxddCmTda7TWCjXOesS+/cZzR+OTBGrGWcDRrfm7fGUB4laGwYX9qD
	 VQDoLRr7fmVARSWOWXS7t6g7j7k0WGMGLjRppI26LGuH5rfLDzGq48CcBrkI1wykzi
	 7yAMsI5mtgV8Q==
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
Subject: Re: [PATCH bpf-next v2 0/7] Add support cpu v4 insns for RV64
In-Reply-To: <20230824095001.3408573-1-pulehui@huaweicloud.com>
References: <20230824095001.3408573-1-pulehui@huaweicloud.com>
Date: Thu, 24 Aug 2023 10:46:38 +0200
Message-ID: <87r0nshlox.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_014643_022041_02526D06 
X-CRM114-Status: UNSURE (   6.66  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEFkZCBzdXBwb3J0
IGNwdSB2NCBpbnN0cnVjdGlvbnMgZm9yIFJWNjQuIFRoZSByZWxldmFudCB0ZXN0cyBoYXZlIHBh
c3NlZCBhcyBzaG93IGJlbGxvdzoKPgo+ICMgLi90ZXN0X3Byb2dzLWNwdXY0IC1hIGxkc3hfaW5z
bix2ZXJpZmllcl9zZGl2LHZlcmlmaWVyX21vdnN4LHZlcmlmaWVyX2xkc3gsdmVyaWZpZXJfZ290
b2wsdmVyaWZpZXJfYnN3YXAKClsuLi5dCgo+IFN1bW1hcnk6IDYvMTY2IFBBU1NFRCwgMCBTS0lQ
UEVELCAwIEZBSUxFRAo+Cj4gTk9URTogbGRzeF9pbnNuIHRlc3RjYXNlIHVzZXMgZmVudHJ5IGFu
ZCBuZWVkcyB0byByZWx5IG9uIGZ0cmFjZSBkaXJlY3QgY2FsbCBbMF0uCj4gWzBdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDYyNzExMTYxMi43NjExNjQtMS1zdWFncmZpbGxldEBn
bWFpbC5jb20vCj4KPiB2MjoKPiAtIFVzZSB0ZW1wb3JhcnkgcmVnIHRvIGF2b2lkIGNsb2JiZXJp
bmcgdGhlIHNvdXJjZSByZWcgaW4gbW92c184LzE2IGluc25zLiAoQmrDtnJuKQo+IC0gQWRkIEFj
a2VkLWJ5CgpUaGFua3MgZm9yIGdldHRpbmcgdGhlIGNwdXY0IFJJU0MtViBzdXBwb3J0IG91dCBz
byBxdWlja2x5IQoKRm9yIHRoZSBzZXJpZXM6ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
