Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B5C27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RrvXf9GSVQNRHpV19CuYHx5rvvMukAlTszyJ2BjJJs=; b=DBEDPiDUTFMR13
	v+tZ85ghPRYyi6iG7ObifenUY5iAnRkMdxYWmAGEteqXZ3GSL/vc4B09SwdtB4S6F2nMhOMbFQChr
	C5YVwxzNdGE6nQpQhe/yaaZrYln07z8SvXXlrnRSKgbVCbo9bDpuQCQzt+mADVtvl3N8QELbbJHGA
	qVFdraGIT6MT0OHuKrUNPDvQ8Nknbxbz8s2hwYt8w3g0vE1jd/6iIf1CIa/32B2h+g97GKJHOP4ND
	wGCblIfXVVWBz1q9buA+l0G5bl5Ip6Nnr0b0kMUyhRM2+nAqmoyKj9wnKs+9IhtKomMSjNtnXnWjk
	jUouWlX6fOwr4dUSPXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsPn-001IZS-3C;
	Wed, 23 Aug 2023 18:17:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsPl-001IXl-0K
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:17:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 946AD63DD8;
	Wed, 23 Aug 2023 18:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A21C4167D;
	Wed, 23 Aug 2023 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692814628;
	bh=oVc34mgV3FCHCFRuWZIFh7s3iqRrh+uYOxu0gKgphbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gbl8Ho+OIJFBCVGkffy0ZCht+2m9HlRKIBb+duA+VU3Ht+iJBwRrlDv1vyAcArPps
	 Zt+17ndNPH54GvaNh/oBz8tlBp/nZAKHignXtbUKnNPqEXWmn3dDwp8IdgFhJ8dzMa
	 HwHKIDXMJ/uqCIpdB9JTLjEwfbPOPgvWn/4EcmIItoiStt0TL5MgXoTiF6XzgsTZc5
	 bigYmUMs41UnYcr88jWVP9DxRfX06OOqGxR7uKaYnhAJ8+iFtBDDtMzniXIGA81gaS
	 OOFuFsMwDe2Y85oXpD1Z0ZR1GWeBrnQWqGy7cpsInsjF3Jm7lgOBAmuPeCPpGKTTQI
	 BQMCMes+TQKog==
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
Subject: Re: [PATCH bpf-next 2/7] riscv, bpf: Support sign-extension load insns
In-Reply-To: <20230823231059.3363698-3-pulehui@huaweicloud.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-3-pulehui@huaweicloud.com>
Date: Wed, 23 Aug 2023 20:17:05 +0200
Message-ID: <87h6oplj32.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_111709_205670_78A879E9 
X-CRM114-Status: UNSURE (   4.29  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgU3VwcG9ydCBzaWduLWV4dGVuc2lvbiBs
b2FkIGluc3RydWN0aW9ucyBmb3IgUlY2NC4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxw
dWxlaHVpQGh1YXdlaS5jb20+CgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
