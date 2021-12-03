Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB79C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wKw+PJeopp/NTneUky8XzuBzDgXb8DscRdsDXVE85U=; b=QOmqadUQtU0UXM
	bl3WBoL9S5obZC2HatbaRNLp5jStQ7Kmrycxrw7eNl3CNT9PwLK2TWXZraY1zNt+QROYMssPOjD0P
	jtM25aYnp6x3I88/LG5U2xe313gDKqBrsFvTMDCLKacZ4RKnLK9bkcgzyjdxQCSeOp7EJ6MWcvz1V
	boD/ZgLRPgdWSY9vNaZF4CwdcT0IZiOZeUZyXIDvDHOBChws80q/qCuNISkTwEkPVBHlDQQMBhAJ+
	N2MVNGEdo16wQv96Z1YLKuZK5ndif54Bm5VdoMu2a8mCtCJRttqqzHrfhmR3ge2XHwHbXGRkNDGoP
	GhmzICHfEWGaQOXsMGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtE58-00Gqy5-Og; Fri, 03 Dec 2021 19:18:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtE4v-00GquV-G9; Fri, 03 Dec 2021 19:18:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B83462C89;
 Fri,  3 Dec 2021 19:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47693C53FCD;
 Fri,  3 Dec 2021 19:18:35 +0000 (UTC)
Date: Fri, 3 Dec 2021 19:18:32 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 Alexandre Ghiti <alex@ghiti.fr>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [RFC PATCH 4/5] arm64: mm: use IS_ENABLED(CONFIG_KEXEC_CORE)
 instead of #ifdef
Message-ID: <YaptiDlpAGwmvtdH@arm.com>
References: <20211203051157.2160-1-jszhang@kernel.org>
 <20211203051157.2160-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203051157.2160-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_111841_583579_D599653B 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, Dec 03, 2021 at 01:11:56PM +0800, Jisheng Zhang wrote:
> Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the
> code and increase compile coverage.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

As long as it still compiles:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
