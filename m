Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65639C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhwbH8FpRqDi16D1BzcbOrN0tzB2gjo2xEi4K7T1/fI=; b=yLnwtRjEBKjP3l
	IQeYswCbxjLmi3+RoQcQBfVd3FDRy9PS+Lc4cWrxXerYH9cRCOM0wvrDEdlqPzfDyEBz/6ZrUr1PE
	mznyjG6vEvqgOc01UvnWVEe+F/7TUCzZOAyXdsM3Z2X9SQ7RQ5hTI7R0euPpRI6MfZYDUKsKWkIBE
	mEC1OwckCU7etvqBLkBIrKk6hV51EwyunWfb1iqH0hV2k6B5/zUm0kv1D579qnVup/MJO+bQW3pj5
	0Y6MlOTLLhQaGtysGBaLBhdDZ3uJD6zVbuJ5fZMLqug8KDiJPIaz7YjoXc4/u150BJjPZYZKOPZJi
	HnuOegEWlUw2kxqSJeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYOl-0051oT-06;
	Fri, 22 Dec 2023 05:48:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYOh-0051o6-1j
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:48:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ED9D1B82173;
	Fri, 22 Dec 2023 05:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD6BC433C8;
	Fri, 22 Dec 2023 05:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703224113;
	bh=5Y0DkMdMumywUcDrPAqkW5IyBCX2AqiGZ5VecIS3Beo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uDMMA9YUfTswZNTzD1y3pwcXI1Jqh0Psn4800fqjbV2otzVXou1AUYv40GhGHQknD
	 nzNtoeT6pmZgolccK07hSD81nApbA4Leq6CWfKgmjrGswbdENzl+7k3ovqreozY83L
	 qoib/VAhaQXrUIUXznI6yGCNqijcu7lsKwgsME9R0MM9o4z6jfI3eVdr08ePlLOBqs
	 IAAvavc3sS9UenRohfjxyb5YB4nQXGgzSK0hSv6GDaN/zF+PTfiJQyZ3GqFMTYA16y
	 rJdKou9vLPZdOkQWLT4A50dwBxEM88/CHP3vbpShhThhYrTfwaAjkNRFj/ILeeuu6W
	 nk945ioKtE2CA==
Date: Thu, 21 Dec 2023 23:48:27 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, conor@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
Message-ID: <20231222054827.GE52600@quark.localdomain>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205092801.1335-1-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_214835_724138_FE965326 
X-CRM114-Status: UNSURE (   8.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jerry,

On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
> Changelog v2:
>  - Turn to use simd skcipher interface for AES-CBC/CTR/ECB/XTS and
>    Chacha20.

If I understand correctly, the RISC-V kernel-mode vector support now seems to be
heading down the path of supporting softirq context, as I had suggested
originally.  With patches 1-2 of Andy Chiu's latest patchset
"[v7, 00/10] riscv: support kernel-mode Vector"
(https://lore.kernel.org/linux-riscv/20231221134318.28105-1-andy.chiu@sifive.com).
applied, the kernel has basic support for kernel-mode vector, including in
softirq context.

With that being the case, "skcipher" algorithms can just use the RISC-V vector
unit unconditionally, given that skcipher only supports task and softirq
context.  Therefore, can you consider undoing your change that added fallbacks
using the simd helper (crypto/simd.c)?  Thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
