Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB38E7C4E6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo9oDIg60751wQXaOGQZRo5UA+NYQJPqXlKLB+trQZ8=; b=vf3erPnQKCLMaE
	zkjTZiqSTtW2wboCkRwcscxSwjJLXUz10p3btFKkB2Po69ZXXamslPTwE+tu/fNXyeSy5TeaVXkni
	BDJ1LQaYNShKcT2cTx9fxB8fe6JlRsEPyQYUcSlBKx47d+jcoPZyBr5bEFquXV5lOrrlCyT2Qg+de
	SflGKUx8P+PwqzpdM8pp/rsvaQQXKvBkoT80zjKVg/CnKurqa3V+4zGgaZrld0Ug8lFXcJvgYJGlg
	sfBTJfUM2u/7cws5s/xbSfqc3PHj+98oPzxyphc8I1HZVWO1wH5yGAhRtRmB6WUzCEY+8okgUyvv6
	RIQknwRjavb4fE7h8sUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5S6-000ZOY-0P;
	Wed, 04 Oct 2023 17:14:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5S2-000ZNe-1J
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 17:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B609CE1DD2;
	Wed,  4 Oct 2023 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC2DC433C9;
	Wed,  4 Oct 2023 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696439659;
	bh=sOAP03+W9UkNwBC7b0j1L28Qg4M4aoxG9yOktt/PwQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ccINkiZMcqiWavgi4MniY2e+pEf54wywxE/s4NCG1h8rQ9Sh769kzWyTytmAk4o+9
	 kpE0Gff2UAZ1NWYswQK9MOic4u1WHjafJeRpG4EmUpNwqNytD8Am7x/AUel9Vobie9
	 b6IcQ2tIJdwItLmnc7iy28Z2jN+WBAD+VPCVFwCLdnScHaOefcbEyUg44AGxcKHcIc
	 wjVAHKXx+kBksaQfTCZ8CvYFEai7rLdJKlG85TsN1HiV+Pve4C6u0RGsCDiEM/KhaT
	 XfZrYv6mySQ8cwhNGmezvvuWTEGwcm2tn6yLUlhS+IKjuXNqJOOKsehQE+TbjYWf8S
	 3Zu2rX6xAm8vg==
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
Subject: Re: [PATCH v2 5/8] riscv: add support for sysctl unaligned_enabled
 control
In-Reply-To: <20231004151405.521596-6-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
 <20231004151405.521596-6-cleger@rivosinc.com>
Date: Wed, 04 Oct 2023 19:14:16 +0200
Message-ID: <877co2ux7b.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_101422_617310_78AD66E2 
X-CRM114-Status: UNSURE (   4.40  )
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

Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoaXMgc3lz
Y3RsIHR1bmluZyBvcHRpb24gYWxsb3dzIHRoZSB1c2VyIHRvIGRpc2FibGUgbWlzYWxpZ25lZCBh
Y2Nlc3MKPiBoYW5kbGluZyBnbG9iYWxseSBvbiB0aGUgc3lzdGVtLiBUaGlzIHdpbGwgYWxzbyBi
ZSB1c2VkIGJ5IG1pc2FsaWduZWQKPiBkZXRlY3Rpb24gY29kZSB0byB0ZW1wb3JhcmlseSBkaXNh
YmxlIG1pc2FsaWduZWQgYWNjZXNzIGhhbmRsaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
