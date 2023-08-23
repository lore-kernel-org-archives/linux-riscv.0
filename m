Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E04C3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RrvXf9GSVQNRHpV19CuYHx5rvvMukAlTszyJ2BjJJs=; b=djaeVfOFSHu6mb
	xmhAJgCoYCw6lsUWopng9G0t7wxuPDcS/t3kvzsdgISAlvoFyVl9weKkNrEhQJOeO6Vdiraf4EOBL
	swPei18oBCI60MWafc5N+mTNRH9Idmaqvs85cnpduiShQVhp8aLWGUEO2Q81rmDkQNLxSt00rTIC3
	/ouprbiNR/4OjN32N2GXnRr2mAuGgiBipem70BbpLS/c/Gx6T1h7HA59cuQW1uyz1NgOjzcQJGxuo
	5DLL3Sn3QVa8LC+tYWe+6ID+8W4nExcv+kdYnj/pgLCBzUNw51O9IqxgpTS45RJlhwMl++vABM+ll
	t7GzUM5I9zyz/GPcAx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsOj-001IMB-2t;
	Wed, 23 Aug 2023 18:16:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsOh-001ILc-28
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 18:16:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0229761E98;
	Wed, 23 Aug 2023 18:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67A7C433C8;
	Wed, 23 Aug 2023 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692814562;
	bh=oVc34mgV3FCHCFRuWZIFh7s3iqRrh+uYOxu0gKgphbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r5Q9iOc7paWBMTd6d4sHPKiBmJKkQtfoh6WNHvNWSzcrVTLJC3Wln7HnApaVjAQk+
	 hPGJRg3a8cy0azKL+FneFOwDjEScBTtiDi2w8f3sdUX/z1H9bE0iqSAzXJhBo5Mi25
	 AOJVM7UtZ9JAHCOmgBBi/vQ09HtCfmL5QUCmRykvbjVYW/m2TVN7L2+63AaCwMPYwr
	 U89IPkmFAV9alCqPyUTH51k/+CmczIi3fDNfn64GEKuuZxN/DJE9WiSxbxFxt+wt36
	 FBPy6ccTyZUFqOaFVV8VG1r6Z7DX6K4ybwkgay6jMopX1KhB4woIAR8htOsz41sO5D
	 oAidvoV1GhD0Q==
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
Date: Wed, 23 Aug 2023 20:15:59 +0200
Message-ID: <87lee1lj4w.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_111603_742800_ACD25018 
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
