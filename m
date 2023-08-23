Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F37C3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6suMooxXOFIRDKyk/ffn0z/tW+1t9tFvYNS5378ENM=; b=CQR/JrPQBppARx
	Hq0ie9l2fPe4XyCLURDGT+JDHKplMLn2WZy0CzMSa0x4lTCH3k8lCW3HjWQ0gDmQnE6II1XVAcF1W
	T1YAgW88Yl0cgJB+aHCwNibaCI2RygJO5rk3PdVE3cYdDEvUxvJD+o0JI+1faE8nmyjHs6KanFAen
	h3nMoqWuTh6g9g1j4FHA0muqcfDQgvpFfdhM4XU3zI7FD8UpJ/Qeb0BbGrso5LVJiK4dg7y8hmeQh
	qevGZP13/H2OACMLx/IUP5yFKdQZRl7NFmhBayvqH3HOcwU8m2B82Y0ieDin994oyn7tn4Q2G2RsP
	u3TZdyuHzMA2w5kYeyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsVq-001JPH-2Y;
	Wed, 23 Aug 2023 18:23:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsVn-001JOL-2w
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:23:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 310F664C84;
	Wed, 23 Aug 2023 18:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7909C433C7;
	Wed, 23 Aug 2023 18:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692815002;
	bh=WzID2EzMEfCohyHPts0WT9PJhyOAL8gtNo0yNFo222k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nHi74GSArPCX6tsrvWUvjB6bIqFXo56oNWG46oEQIguTa42473eow8AYx7hdnLvvz
	 6wkMif+2Xs1k9wtF3muFezXeM1aXN/klDkoYhtoFQQrP5Xbs/zzZfNWwZ/0euLBPIP
	 xcYLtreVYPmiG9wOnISvAybxdBXVVv+V+U7t9d3iLJq7fwD7TMr3tNDJH1SUEb8sfR
	 JzJQR6Gp1gOefz5soSbZF+oawVPwPrYVLU7KS7QM9w/kwXeeUDppyXN1N8+W0v6NaQ
	 vt7kh3IuFW5sFg0IfXGj9QBTQ/4oI3EBEl4nTKUlJwGUfLeFAEzUFJ9h5VB/wUN3uo
	 Z20EFbMgkiW2g==
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
Subject: Re: [PATCH bpf-next 5/7] riscv, bpf: Support signed div/mod insns
In-Reply-To: <20230823231059.3363698-6-pulehui@huaweicloud.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-6-pulehui@huaweicloud.com>
Date: Wed, 23 Aug 2023 20:23:19 +0200
Message-ID: <878ra1liso.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_112323_990999_D94082DD 
X-CRM114-Status: UNSURE (   4.41  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgc3VwcG9ydCBzaWduZWQgZGl2L21vZCBp
bnN0cnVjdGlvbnMgZm9yIFJWNjQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1
aUBodWF3ZWkuY29tPgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
