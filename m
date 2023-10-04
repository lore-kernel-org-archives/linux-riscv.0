Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37D7E7C4E6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPwN+fuZuuwKaBgzkBQFJ73K2+qsFhJGQ22pa6QY4Pc=; b=elK7zGfwEaPt6I
	n+ylgdn9tsPprhynqbUNNbClT5Hbnyd4x+I7zVdY+7HA3vUPFacpRA65Mcy03lQkhd4LhdxiNM/fr
	julSCSCxUxYukvUqAq858u8W+M1n1A0qRa5NHjQTVe3CyycC4Wxt7Mqmrq38PchtnjGzqRZsNvl18
	BiIz9s3owifqF0Kxm3I5UTDozvHHWw0MxWlQmKN9rCzSntGc+ljI6MHOSMUbs1RH0KvRhRLCku973
	MEoFf5R5KbhmnCXo22faURThAJmVFROVo4AP1jerKnz7UY5Mqr1wP49jC4KU7uMDDShTg4TTzfpDQ
	thkrtX1T35VHTa2R9b6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5Wi-000a7c-1S;
	Wed, 04 Oct 2023 17:19:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5Wd-000a6b-05
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 17:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AE73615FF;
	Wed,  4 Oct 2023 17:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FDCC43397;
	Wed,  4 Oct 2023 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696439945;
	bh=hktkQ8e02XAmCHESfpaCyX2Rd3CJA7zbCGndca64RZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gjqL3T2xDqdV4NtxF0Ius5ZzqObjYEqWFrBD1tm+E83UkL9Y3tyiZybLdYlaa+oTT
	 Z2ZPYoQRaV3LAD7RfO77yArupx8PgjJZau0sRzPrBz/sFHs0dlEFONqpiDaxnVHYRB
	 gdzgwBQN0rciUnaidlAXj6pllXqrjAbsppJbmojVOsQqOM1gPiIYsg/MPT52qV7R+o
	 SqpHeB8iUdFbLGa/KReWMX2Di/3b9evEtyvy+HTPF3G+Ebs6OiAYhH/Y7Zlq1lYhQG
	 4JReTy2RoMkOGDWMvJOMrV8l+R5CykMdXPaQJ/4zD6LVuoGPV00qI8/2DQdTkK5/hz
	 sbqZQid26XmGQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Atish Patra
 <atishp@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 =?utf-8?Q?Bj=C3=B6rn?= Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ron Minnich <rminnich@gmail.com>, Daniel
 Maslowski <cyrevolt@googlemail.com>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 8/8] riscv: add support for PR_SET_UNALIGN and
 PR_GET_UNALIGN
In-Reply-To: <20231004151405.521596-9-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
 <20231004151405.521596-9-cleger@rivosinc.com>
Date: Wed, 04 Oct 2023 19:19:03 +0200
Message-ID: <871qeauwzc.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_101907_107667_2743B95E 
X-CRM114-Status: UNSURE (   6.96  )
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

Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IE5vdyB0aGF0
IHRyYXAgc3VwcG9ydCBpcyByZWFkeSB0byBoYW5kbGUgbWlzYWxpZ25tZW50IGVycm9ycyBpbiBT
LW1vZGUsCj4gYWxsb3cgdGhlIHVzZXIgdG8gY29udHJvbCB0aGUgYmVoYXZpb3Igb2YgbWlzYWxp
Z25lZCBhY2Nlc3NlcyB1c2luZwo+IHByY3RsKFBSX1NFVF9VTkFMSUdOKS4gQWRkIGFuIGFsaWdu
X2N0bCBmbGFnIGluIHRocmVhZF9zdHJ1Y3Qgd2hpY2gKPiB3aWxsIGJlIHVzZWQgdG8gZGV0ZXJt
aW5lIGlmIHdlIHNob3VsZCBTSUdCVVMgdGhlIHByb2Nlc3Mgb3Igbm90IG9uCj4gc3VjaCBmYXVs
dC4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
