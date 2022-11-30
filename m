Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEA2C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fq0jHtYKlsdbiYYNMp4u5TyGNP+OemkO8iRqE6H97kY=; b=qwAfruj2fuaSCG
	YlBsePtlXjy3ymcx5qEmzOUeN88SJdnMl4gEs6OiKIG6r1Fw9QexsdPtrEiJBik6OBAHfqL9rYutr
	WPafSOx0iLwPVTJY/u0tS452O2AtjFfBqe3hkjYjIBSda+wkP4uRhOfM1mc1Tts3ANAvyE9ocWWPk
	rNXDjV0E2ygHKLdm8YW1246wO22QlK0bACvz+BpXJqIrAsvFqKxPJi+S61FIGekk7vkoqi2zBd+Vc
	8HT/bnzQ8NKaVJDAkSzbNiwsI3pEFTABMoVy+WhWb/pwy8VW68hclsdea02IfQ9XazIMWQzAWUxvI
	Sew9Mz9t9INCW28IzQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PZD-000H1m-6v; Wed, 30 Nov 2022 16:04:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PZA-000H05-8v
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 16:04:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1ACE6112E;
	Wed, 30 Nov 2022 16:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EDDC433C1;
	Wed, 30 Nov 2022 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669824247;
	bh=F3sWtcU7a7aYF64WpYOXHrijQk18lttkWuDDJI5zwjE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qljpPVH1X/YzQkI471Z5zFai4D6J7ig8vaK36cf/yQl9LtdX6cnagLUpDf592B5G2
	 tRBwIZAFi0V7VHmC0A/+jpl/AiUrq77XV2/9KS8MNBRXFQgTRnsyU6SGiUEHKWgumQ
	 7qItlXEulP8r7LSDjQRBwxJmnIY/THzjqngUTjfve/2wtFb6vZ1YFhUcqfwSYFJ/Mn
	 F+ZggTdDzWlNDO5DWbsmKyWFUrU9DL1cWG6FpkkdJQl+dMgzPs5bXUALUTxdagTdV+
	 uFzrUdBMz2yEBZw7bpkfsDzTrojbx2J+o6IPhWKe/c2d3pobnAgArC0WDsUjzj2l14
	 b3f3O0x8pi7Cg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf] riscv, bpf: Emit fixed-length imm64 for
 BPF_PSEUDO_FUNC
In-Reply-To: <87h6yg1xlo.fsf@all.your.base.are.belong.to.us>
References: <20221130033806.2967822-1-pulehui@huaweicloud.com>
 <87h6yg1xlo.fsf@all.your.base.are.belong.to.us>
Date: Wed, 30 Nov 2022 17:04:04 +0100
Message-ID: <87a648ig3v.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_080408_367278_C32BFACC 
X-CRM114-Status: UNSURE (   7.93  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBUaGUgcmFuZ2Ugb2Yg
dmFsaWQgYWRkcmVzcyBmb3IgUlY2NCAoc3YzOSB0byBzdjU3KSBhcmUKPiAweGZmZmZmZmZmMDAw
MDAwMDAgdG8gMHhmZmZmZmZmZmZmZmZmZmZmLCBzbyBJIHRoaW5rIHdlIGNhbiBkbyBiZXR0ZXIK
PiB0aGFuIDYgaW5zbiwgbm8/IE15IGd1dCBmZWVsaW5nIChJIG5lZWQgdG8gdGlua2VyIGEgYml0
KSBpcyB0aGF0IDQKPiBzaG91bGQgYmUgc3VmZmljaWVudC4KCk9rLCB0aGlua2luZyBhIGJpdCBt
b3JlIGFib3V0IGl0OyBBIHByb3BlciBhZGRyZXNzIHdpbGwgYXQgaGF2ZSBhdCBsZWFzdAoyQiBh
bGlnbm1lbnQsIHNvIHRoYXQgbWVhbnMgdGhhdCB3ZSBjYW4gY29uc3RydWN0IGFuIGFkZHJlc3Mg
d2l0aCBsdWksCmFkZGksIGFuZCBzbGxpICgzMSBiaXRzKS4KCnU2NCBhZGRyID0gMHhmZmZmZmZm
ZjEyMzQ1Njc4OwoKdTMyIChpbW0gfD0gMHhmZmZmZmZmZlVMKSA+PiAxOwp1MzIgdXBwZXIgPSAo
aW1tICsgKDEgPDwgMTEpKSA+PiAxMjsKdTMyIGxvd2VyID0gaW1tICYgMHhmZmY7CnUzMiBydXBw
ZXIgPSB1cHBlciB8IDB4ODAwMDA7IC8vIGZvciBzaWduIGV4dGVuZAoKTkIhIE1ha2Ugc3VyZSBp
dCdzICFDIGluc24sIGFuZCBlbWl0OgoKbHVpIHh4LCBydXBwZXIKYWRkaSB4eCwgeHgsIGxvd2Vy
CnNsbGkgeHgsIHh4LCAxCgpOb3cgd2UnbGwgaGF2ZSBmaXhlZCB0aHJlZSBpbnNucy4gV0RZVD8K
CgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
