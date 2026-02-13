Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA12EEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBeAg3SXfU5VSn+A4i7bcPQJrV6O7X83I1d8r75smc8=; b=Dtys+gBDwVAiOS
	0mgCbPwFZ0J9/l6JMzmtJRuqrmO7pFDq68ujuyBuhzriPKWvzrjKfTm3LyiHyRHJdHaXDwlXuEBSh
	/NcpRXUSpKCMJixhfMSiBGXdEw6vW/HijtZbuDGj2Ain7aYYC1VsZcBb13IUHYCl7rarHYlW1vskh
	0/84aBj1pTk4q9Dlx61hxS1wyBDidJmgpLxlKiF/jyhTSnyr2goVOWc86bAyKa2tpsvfi1Pj/FCff
	BKF5mmoFPqXbF4b1MjrCfp0BJdJuc2OgOd80x8Z2Ag5TETT70PjmvGGJFS80o4gmw1j2D3wCl+mcE
	YZITQwuBX1Ww/Q7pyF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgyd-00000002moK-1agS;
	Fri, 13 Feb 2026 00:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgyb-00000002moA-22tX
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2BBA6132E;
	Fri, 13 Feb 2026 00:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD433C19424;
	Fri, 13 Feb 2026 00:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770942244;
	bh=dXDBg/0MLt2BijGQxWr2aM8eXuJTKU8SHX8vaCyyz5U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TuJH/sCqWFm5W7iyXjKoiwc96gv7ALLeSiKgyZtQt5KashqDNrgnNaCLOASayBRnd
	 TUv35HpdHAbh03VbQQOjmzyEiub6645TJW67q9yjLfSvMIJPTAcifMy7dkhU8dOvtX
	 gX2oFJyYxx6ttPEWr8h41+V/LBANDNVxkXUhuZGkKStuWFQP2YJ3y3O8HK8KxKgV1l
	 tAzUImJZIdwrkdG08TGG+ByANlVeJCzu123vufW7gMGwB1deaJbZA5dbyAukYc28AW
	 3ftj6WCoEvnYXlWB8NAGaAh+/XSzFo4kfxKT79fZWYig/xvevYznVCSePeaDYKseLe
	 ltiWVrd2/uYqw==
Date: Thu, 12 Feb 2026 17:24:02 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Ingo Molnar <mingo@kernel.org>, Valentin Schneider <vschneid@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 0/2] riscv: smp: Two minor comment updates
In-Reply-To: <20260204-riscv-smp-comment-update-2026-01-v1-0-8b77aa181530@iscas.ac.cn>
Message-ID: <d4bc9d48-3300-e6af-cf59-fa6cb2949529@kernel.org>
References: <20260204-riscv-smp-comment-update-2026-01-v1-0-8b77aa181530@iscas.ac.cn>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 4 Feb 2026, Vivian Wang wrote:

> I happened to be digging around these bits and saw these comments that 
> confused me for a sec. So, might as well update them for the sake of 
> future readers.

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
