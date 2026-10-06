Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BB9CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgNNpIJlp2Jbp5QupvksLYU9DPT/vzLBujjNok06goI=; b=nTcr856ZEe2WiL
	z4k/7PS0W01HXA2QNSrYwSMZzwAFsMQ0uhHp+AEwERXIKsEF5SjCZIbAD8vq23FUl68QHS+ApYwXu
	K/7PL6zmg9GvKKtOSgTyW99VMEdRGHe0W/HlV1eZId302zrFvGaYhgco8vTXp67bOyGZ4cgwZKTQA
	9EJuSTTl10pM5OkO5UOQ7ujlBqfnSV82fF6kdJrfG0HlXu05ZjOI7AdJ3staPCbvVrqRHEPEsr5fZ
	p4bm/XheC0HjZdQkENpyDD4r+Hcwvke7eeBOtou7lShproG8PNhwl1ZreK9SpwsasP/KN8SRu25kh
	FwOi+1maIcd6GMe5+Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1zh-00000000RT4-2axz;
	Tue, 06 Oct 2026 10:01:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1zg-00000000RSZ-0fxk
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 10:01:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B59A4436FB;
	Tue,  6 Oct 2026 10:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9831F000FF;
	Tue,  6 Oct 2026 10:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280915;
	bh=HDImYCwRl8Ez0sZ1pVFhMIDQCYQ5T3B3YR69NLKy7bo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Nnlq4bu3vLydEFiFKldarI1TSg/Q08EtbYZERRbnYipwq3tEieSLwpMa/oLuh96CO
	 QjqNnynyJdBg6gqDWiX86yh3VZTIey6hBxiK4BdFyKm8PbNNy8zhvSvuDBHkbCi9Jq
	 C2s5QtRXGG5WKDJxN/wbi5XhZOuxbvmGUJFmdYQ9U6xnVKQ/m/qQr9KileRRd1SHgX
	 eDR2N4BH1W0exUuxC3yN1T+TEK1sNzYZrh4nKb/9RtDcELi8TFFaNbmMuV7V1pzWQ4
	 Ydb+MK7/EPZfeaJLMtjnQsP8wCPd5VFtYtSzzD9XztKAES7b1xk1y4k36/vwaesXSr
	 sEbF8UWZ5NcoQ==
Date: Tue, 6 Oct 2026 04:01:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    daichengrong <daichengrong@iscas.ac.cn>, 
    Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v6 1/8] riscv: do not read csr in vector context switch
In-Reply-To: <20260918215154.2481482-2-tchiu@tenstorrent.com>
Message-ID: <af9c0f66-d742-0b02-91db-8e542fb3a468@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <20260918215154.2481482-2-tchiu@tenstorrent.com>
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

On Fri, 18 Sep 2026, Andy Chiu wrote:

> CSR operation can be costly as it may introduces serialization. Instead
> of reading from sstatus.vs to the detect voluntary context switch in
> kernel-mode vector, we can read the context depth from riscv_v_flags, as
> it is always non-zero on a trap-introduced context switch.
> 
> Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

Thanks, queued for v7.4.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
