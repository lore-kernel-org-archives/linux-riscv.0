Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BCBC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aX+zf4l2+WUIPkPK0KjEz7E9qcMtIUD5SEzr1XeGmkQ=; b=i+U8bwNtkiTb9/
	ieVZAZXAy/Tv24fAvAR5OAq2UMbGgc8ZwXAEaWWby4rbqgNKIBrVhs54mtRUHD0S1cYQXAJNb6Ge9
	VxOEdA0eJO1d2M9bNtPhImwSddBoTOHPdVuwvtHSpNILwyN/U8r9YJp5IK4z7QNo2nT3CNyi901g5
	dpxcCP1/zjhJ13JIICxkzRy0hRM3mbv6LPHkmvFJOxvCS1cN1R9CTMcVPB2UU1rXF+HwogMTpI/E5
	FsXWT//8arukxg3SqtpkONGB3SeQtJGEPSCDBHLriFNGMfQlxMJR2rjcjn03GGjvVzu8PoBjQR1f9
	fpZdL2izghgP/QCBYEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmEA-00000007t4M-3659;
	Sat, 27 Jan 2024 17:12:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmE7-00000007t3S-3eui
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 17:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A980CE1C72;
	Sat, 27 Jan 2024 17:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174FFC433C7;
	Sat, 27 Jan 2024 17:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706375533;
	bh=b44pzMRT2lqcU3tZ0JVh8LrSvIRpLEfGlaoKxD6+4Uw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sBhp9zL4D3H+pEMUmv5c8q2Tea4f7NY/KQT0zsLS3Z+tppphAmoFuJVQHp7K4MK6m
	 kHSo9gvUmvUPkDrMjf9rTc6gXzxVmHQgc4D+OOxyaBvBA7dyGLEMNeYVZH2scjoGfs
	 2UO5qvLuKUWc57zGMuVvyuF1+KxmGuc1gCjiik+DSizNOlyWekDFXnaLSl/JMzse8P
	 zmDraQzTgRShqSuJs2B/Oi0su+X5VI3Gos+72JhAB7fvKt2p7xjxmdqBBY31w6JkR4
	 jTaiiwxtS1HN+qrVewohUIHR6CV+LIYX2QeMM5IK0s7SIxv2Wvciajw4psMblXnW5z
	 bR2B7f16AoDSw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
In-Reply-To: <20240115131235.2914289-1-pulehui@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
Date: Sat, 27 Jan 2024 18:12:10 +0100
Message-ID: <877cjuzonp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_091220_097835_230C9FDC 
X-CRM114-Status: UNSURE (   5.24  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEFkZCBaYmIgc3Vw
cG9ydCBbMF0gdG8gb3B0aW1pemUgY29kZSBzaXplIGFuZCBwZXJmb3JtYW5jZSBvZiBSVjY0IEpJ
VC4KPiBNZWFud2hpbGUsIGFkanVzdCB0aGUgY29kZSBmb3IgdW5pZmljYXRpb24gYW5kIHNpbXBs
aWZpY2F0aW9uLiBUZXN0cwo+IHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFz
c2VkLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGl2ZQo+IHRlc3RjYXNlcyBvZiB0ZXN0X3Byb2dzKi4K
CkxlaHVpLCBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4gTmljZSB3b3JrISBJIGhhdmUgYSBtaW5v
ciBjb21tZW50IGluCnBhdGNoIDQsIGJ1dCBub3QgYSBibG9ja2VyLi4uCgpGb3IgdGhlIHNlcmll
cywKClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpBY2tlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
