Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24AAC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 20:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHK7F04V6T+hK11rYK+XHCrMhsqg4W40EWOpy/sbx4o=; b=yZqKjVfpdxFuwF
	LShWm1uSdNov94+kZFF6khTdz5V8W9dELD9/5eiuKZ3oAGHSd74RiTNNS6Z4E5iMrFZVqqlRvp2J1
	O08DJ44Ec+hOKGF/NweYHFNolvRW66LQVJLbDqQ4K7H3FbOLKLIxDK73RO+xeKhfEwnfkSb2Q8K4z
	5OJ5aykupEyjPPCQranTS0l/Qj8n56knO5ebUx4Ctd8HBOSRBjz3C8UkFFcxUEEtcwEWNP+dWOGIz
	1hXwsVuhwZBgJYJywjt2iOPjmg+VLKkpuUhlWbC2fRZQsNPbdutBmeQbVtRT45Imufz3o06gRSY0A
	oDAUam0FF4vaP6y2I0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1kJ-0000000BHil-2h9L;
	Mon, 04 Aug 2025 20:25:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj1kI-0000000BHif-3Hah
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 20:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5261601E4;
	Mon,  4 Aug 2025 20:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1119C4CEE7;
	Mon,  4 Aug 2025 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754339121;
	bh=wXQvDqeRFPqa4qyoolm+7SHsR2N2boCqypUXM9XJOAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RF5yiqCdbFesMwe5gXm5kizfwYWRGWmm5JsxDeI29YAQOdEt+CPCBwwZVtPxzWmkp
	 DvgAyrNEnuJCQRZ0agZtmpTpWxfiDFITUmqTV+If4RoZJ00/DaVZzeRZyU9UvAwQJY
	 0fk8dnVimcA1qa7jFQv0/VPCM/fy1+jkkeRoODmksPHXmaig7+EwF6xqAn5e7BN9EY
	 eNDciDsiaWYaQlvW7n+tZXOsofJdeHSQTSjDao2bBSc6YhtEjUeeoYxt/8rhTr7RZS
	 GPG0E/93q29/p/TE8fOgkSoQPLwJ0aYkJqqo0sk9/ThZQGPBF3nXXbUzAAV+5QWjCa
	 xMvIuwHt9LkxQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 01/10] riscv, bpf: Extract emit_stx() helper
In-Reply-To: <20250719091730.2660197-2-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-2-pulehui@huaweicloud.com>
Date: Mon, 04 Aug 2025 22:25:18 +0200
Message-ID: <874ium4yxd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBUaGVyZSdzIGEgbG90IG9mIHJlZHVuZGFudCBj
b2RlIHJlbGF0ZWQgdG8gc3RvcmUgZnJvbSByZWdpc3Rlcgo+IG9wZXJhdGlvbnMsIGxldCdzIGV4
dHJhY3QgZW1pdF9zdHgoKSB0byBtYWtlIGNvZGUgbW9yZSBjb21wYWN0Lgo+Cj4gU2lnbmVkLW9m
Zi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KClJldmlld2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
