Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F5C55182
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 00:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9COPfybCF2F1o+Mph1ylDI9q1IPwHQz5LmGK8M53t7Y=; b=M66uDQtcLw8lPD
	2Dbg5Sbf8UT7pnRf81Cdi7V4uMwyr1PZD2uXK5U6O7S8S4KbPjFTR2gALXUgb5RfD9Vx1GzoZnref
	eZy+fl1vN17TxYXvqZ7sDliky5DS5xGdsvEZWHtv+yNSmv5iJpPPdP9heO7tHlEgAmMi+ms8ZBdv3
	XUZFM7yoCfRLDNLA4qfTksWQmSeY0b7DYT70Rdo1sZYeEKU6VYFpvmgLdQT1WrC8gkxuQYXGKB3kA
	mtcNMInabPvjJkkCf+afwBsC3Lni5x3JnzVGIH2yNSa/YOXvQKF9hjz5pBBdfZA39UT9rnZutQFRk
	Y1mtIQiEBjxc5el16KrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2eg-00000000jeX-3PX7;
	Tue, 04 Aug 2026 00:05:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr2ef-00000000jeP-1K74
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 00:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5514760A60;
	Tue,  4 Aug 2026 00:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733ED1F000E9;
	Tue,  4 Aug 2026 00:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785801912;
	bh=T46GW9wW/vpA8d0EMKbiSvT2/GE8QY3Yob/ltR+47d8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EKiPopQaQmzCGtRU8wQpi856XX39qyFXxcwBO1DZKi0TVdQ1LODXsMQ2gSE4r/kTB
	 bbOLzlIyUQy0CdOPvf9QDVdQibfoCJgrgZ4+N7CoGEa1m3QO4uVoUQ7G0RQHsqEO6b
	 x5+oXjEc0UNOawRKqirAX892m+VUmjLLqQ8d21VD+L91VnunGjAA3iN5gUcUgowl3l
	 0LgDOG1sgKZcrfCPGNKldMsKxon0JNpjvAoGYFnKuDsoWsawqxEXbriDR/J8AbUx8U
	 JsqVKDmOta1QIN0ZJcQxQbTpcfJCNhas5TUThlfW5R4dUmp5upmojMclJstn3cSOZc
	 Puv7yGwXbcE2g==
Date: Mon, 3 Aug 2026 18:05:08 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jesse Taube <jtaubepe@redhat.com>, 
    Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: unaligned: Fix check_vector_unaligned_access()
 stub name
In-Reply-To: <20260730131931.2066821-1-namcao@linutronix.de>
Message-ID: <8d641414-87eb-af9c-5341-07d25efa6cb4@kernel.org>
References: <20260730131931.2066821-1-namcao@linutronix.de>
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

On Thu, 30 Jul 2026, Nam Cao wrote:

> When CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS=n, the no-op stub for
> check_vector_unaligned_access() has the wrong name and causes compile
> failure.
> 
> Correct the name.

Thanks, looks like I broke this during conflict resolution.  Sorry about 
that.  I squashed the fix into the original as you suggested.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
