Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF66C27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/rLiZnbbC59hi9EPY0d4CNLNKSQVxc5HC/OmWPf30g=; b=kVdl2MYfjz/Guq
	AaZPndOnqhM/cg2vTsg8ynFiOzQ/ECV0/sbxEjlKENTJCl7SbN01507gqcnlsah0d8Nkx8/yBBDBy
	LtX2xIHNy9vk17fh+jgezC63TyUQT5RJbexuTEg8VWDeZHz5V0qhqyVZOlnIh9VDq4mUS8ZntywaS
	SKrvWxsYrefwK6Mf6siiZrC/3Q0Eazfn1Ljv1UBXys1y4tLqf3m9fRf6UDecjlD5Nf4ad9iuNNEQ+
	hCNQBIiyZ6Nbvbaz1twGIHoGMG6EAouMi7DVFf0BCkIVb8NAi4qllpRV0AWZk5/CVZlDKqX6Y1TCa
	nCFZebQmb04aI1AlL/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsV2-001JGQ-32;
	Wed, 23 Aug 2023 18:22:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsV0-001JFx-0S
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:22:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AC7662C13;
	Wed, 23 Aug 2023 18:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3CFC433C7;
	Wed, 23 Aug 2023 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692814952;
	bh=XhVMfYe6nZ70KASS+6EJs35VBb/ki/oYhS3+q7aUePk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NcY+bvqoB9qC4bweo8x0eJ0J8rf67mYWnwOTgH119X4FJSTkmGmW6NNlZIdAc5CBI
	 jEbzWOskfSFAzVHOkAa8WIaZJjaKkjgI+KskIt4QJOQMP4pcprGCO8W98ILkUZWk57
	 B6cpUER6Hj6Po6AkeHaZ2mh78oEPcL54YCvoMQQwB5YRInWMOjnreX5ApzUsMLmylH
	 doGEgmbO3f7CtJXnzFiHsuS0LMKeSyPK2jQhTbhzIQI1zLOZH3nG0hjhhjjwj3kDSX
	 pBhjAYzwBAvw1P0ulpouX0/J5wJloO+tcfcCCOaeX1s2qSLyZHtccGNIYNbqyielGo
	 /ZjZGW4pv/nDw==
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
Subject: Re: [PATCH bpf-next 4/7] riscv, bpf: Support 32-bit offset jmp insn
In-Reply-To: <20230823231059.3363698-5-pulehui@huaweicloud.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-5-pulehui@huaweicloud.com>
Date: Wed, 23 Aug 2023 20:22:29 +0200
Message-ID: <87cyzdliu2.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_112234_240986_3F60AEFA 
X-CRM114-Status: UNSURE (   4.61  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgc3VwcG9ydCAzMi1iaXQgb2Zmc2V0IGpt
cCBpbnN0cnVjdGlvbiBmb3IgUlY2NC4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+CgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
