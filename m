Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B42BEEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGymrJd0hxA6WNevLPQJ304Fm7iWF0CLwJmO38HwFiE=; b=j+Y2ZrPqvuChp6
	sZEsTnJaZ4YCTXI+bgp9espAep+Y8yfcxSDdlOcXGcFVr1/v/ivyGnJhshjjVX1eUcSWdbQmfEuE9
	xxKzMH1mdyvQ4KcXmOVtE2anRU4/OVjmKOKnAixAkft9gVO2WkUTh4ykr+4/DifD+ZeuadW4KfhTa
	CP35U2ggx9qzrtvX6dyEwNuJDt8OWwrKlle7K/zJ1XGaF8WYN2rlTh95hCpgENaODUYr+ZE2Caihr
	j8GweABj7b7l1kA06x4ERz4LSXZsvsHMMIzopz8NlgxRIGdP2YlWjRw8wJXrn14q6tNZMU8xGcGMR
	4PRsFZX7cd0dr/7aMVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgs4-00000002mGQ-0iwY;
	Fri, 13 Feb 2026 00:17:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgs1-00000002mG1-2WMO
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EECF41A73;
	Fri, 13 Feb 2026 00:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F294C4CEF7;
	Fri, 13 Feb 2026 00:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941836;
	bh=tKPZiQZtcH1wyxqDiOlONhRaVViNUnbTOpp3beoKyMw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pFEiFgNS1a3Jp8KAZZFB40cXhGpZr5OZmp0SHCi2QCsgwMnQrOKrmXuNMLChuJSIU
	 fOftFJc+dXGKumGXtckhsZ2RpmdzGMfeACnuJ1lVrC0tM6O1b3SJbLWb5HjvEJKkgb
	 4yLhURrUeXwyQK0/JSikVDpURtwwHKXBc4swwlafnJy6O/Cnt9rF3tWTkzqosKl055
	 mxiaQdwCqtRhzQBpp3tpRhhNr9CST57ZKmXjpzqKeVfa7dC3UdfYnK8GqdhrlKnIJU
	 73phhbPX1PuNeqVJ/YPJuALmRmn1pGAiXhpCRQ5NTHZgHCUhtsZXVXbkW2lLdYM4w6
	 cyTt4/kU1ggBA==
Date: Thu, 12 Feb 2026 17:17:15 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Frederik Haxel <haxel@fzi.de>, Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [PATCH] riscv: Remove support for XIP kernel
In-Reply-To: <20260202115403.2119218-1-namcao@linutronix.de>
Message-ID: <14f964c0-c4e1-c8c7-2a04-6cd5d0cee64e@kernel.org>
References: <20260202115403.2119218-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161717_660048_31C401FC 
X-CRM114-Status: GOOD (  10.31  )
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

On Mon, 2 Feb 2026, Nam Cao wrote:

> XIP has a history of being broken for long periods of time. In 2023, it was
> broken for 18 months before getting fixed [1]. In 2024 it was 4 months [2].
> 
> And now it is broken again since commit a44fb5722199 ("riscv: Add runtime
> constant support"), 10 months ago.
> 
> These are clear signs that XIP feature is not being used.
> 
> I occasionally looked after XIP, but mostly because I was bored and had
> nothing better to do.
> 
> Remove XIP support. Revert is possible if someone shows up complaining.
> 
> Link: https://lore.kernel.org/linux-riscv/20231212-customary-hardcover-e19462bf8e75@wendy/ [1]
> Link: https://lore.kernel.org/linux-riscv/20240526110104.470429-1-namcao@linutronix.de/ [2]
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Frederik Haxel <haxel@fzi.de>
> Cc: Vitaly Wool <vitaly.wool@konsulko.com>

Thanks, queued here - first for an experimental branch, and ultimately for 
v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
