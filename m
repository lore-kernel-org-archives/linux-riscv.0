Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B2E9A03B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fCxASfOlpdCHJy9RfCKKOF+1iF9TJrefpEEVScZFVE=; b=mh7+NrvpE+EWvL
	eMSivpaVpk+Is+xEHN3hLRQ3kGeREqwEUZ+jQV8kFXXw1/dVUz8sUxyYa8Tra5Q6B2AnjDK+b8d5w
	P3HMhL2pAGb3ZUCP8W1z1m17/h7LfeAIsZPSbC3T5IUcv2uhcT1T3ft0cumDilef9uSbyHysNcJ0v
	u0NE2y9bfI3BN3MrA9PsLAT1J8y7rmBIOnA9P5tJ1uisxWyP06Ifq7OWba1FA/bBASsN4sGToqXfK
	appsmRSQpOprLT0MlQtUT0pDlIZ+5rNX+4KxfsvFoMZgxy/QWpbsNqM7V6zpQRMaz7VVQ79Yo/Ruf
	tcxfhprjCSMDiaxlVdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSNA-00000008t4d-42uf;
	Tue, 17 Feb 2026 21:12:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSN7-00000008t41-2Pb3
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 21:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23D1442A32;
	Tue, 17 Feb 2026 21:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A6AC19421;
	Tue, 17 Feb 2026 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771362760;
	bh=p9Cuh7jV01riqByEHWOnkwIMeAOedx6kRn+SkqSMcMY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hs9/BSWAHzwxVmMyCDjF6xO5O9TsZxZ5Ib++0vwwExcm0EbE8HnAXmvd8sECLjsbq
	 IJM9iB8DBybkybl4zh8jC6sKL6BZn8uB+32YmqxcBlpPWoNplgRLZUSluMONtcJIpJ
	 OZshfquItwitekWM7L4zWbnhzoVLf0guaWbTn16cqQPGBvLB1/SZMd4RO/EMxZQRWR
	 jesFUGjV8qlJJqws1JICzMfWDw+oFCgbZTpc2A6J+uVDaO7PLZ2A1w2Zi5A4q8o1WL
	 u9gllsJ7QLy9fUMJ1jGOC4TaqfH2mUGpPB4/olGc4FrRYYSm/z44jQcmvtpgo4IjY5
	 XXNOoULni+zRA==
Date: Tue, 17 Feb 2026 14:12:36 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>, igor.b@beldev.am
cc: namcao@linutronix.de, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
    Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
    Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
    Zhouyi Zhou <zhouzhouyi@gmail.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] riscv: fix minor typos and style issues in
 XIP code
In-Reply-To: <20260214023804.677127-1-kunwu.chan@linux.dev>
Message-ID: <609b889a-8bb1-d2b5-8de6-ddeec27cac04@kernel.org>
References: <20260214023804.677127-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_131241_634719_B1793321 
X-CRM114-Status: UNSURE (   7.55  )
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

On Sat, 14 Feb 2026, Kunwu Chan wrote:

> Fix a few minor issues found in riscv XIP-related code:
> 
> - xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
> - head.S: spelling typo and wrong #endif comment

Thanks for fixing the threading, but, Conor's message:

  https://lore.kernel.org/linux-riscv/20260213-canteen-diffuser-5ecc80f264b4@spud/   

was exactly right.  Folks who care about XIP support for RISC-V first need 
to send patches to fix it in mainline.  These typo fixes should be rolled 
in to that series.  Until that happens, I plan to keep the XIP removal 
patches queued.

I also want to see the XIP folks participating in testing and reviewing 
upstream patches going forward to confirm that they don't break XIP 
support.  Otherwise, the burden is just getting pushed to patch submitters 
and maintainers, most of whom probably don't care much about XIP.  And 
there's a good chance that we'll just go through this cycle again in 
another few months.


- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
