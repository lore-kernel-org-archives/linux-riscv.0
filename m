Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A7D0D16D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0IL8Vh85yjCfWZhIWYTGAi8BIbErzV+24eAIeErrbs=; b=mTSIMwhDhMvMkZ
	PmDfOyFKKudzdICRN8mbOzhQl3kIqg9ikOF2CS6dJjlY6kYTcSIRWno/DeBAbkui014iUb74ZMYCE
	UJWul3WvdZbh9+XPFYrLkO9CMIu0HKCn16k0hnoDVsKaaYwu11G39Klb/h7N2YT30M2OVAYdnYrK+
	8WjyAwxzP6JBAJgd0Q2KDqp/41EZpRYavcHGcTiEoEe2XIO3WPEw0DmLwG8BaSSm0MtOpvwxg9CJT
	xF/Z6/r4iUbAVlRcNYL45Z3n8IzOfY+9TkNhkEbWopeLkHDndMnaztE82wlCDfuyGsTGBjfgYGqwU
	DwuvrivCnGIu+vLsYGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZdC-0000000FZkg-3mhR;
	Wed, 07 Jan 2026 19:55:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZd9-0000000FZkA-1m3b
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 19:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98F09434EE;
	Wed,  7 Jan 2026 19:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44A4C4CEF1;
	Wed,  7 Jan 2026 19:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767815742;
	bh=fe3cNW+BgOW0g/Yj4JbAc2KxF5WEMbD8WPo88Bf5sCw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d1ZQS4oC8x9+jsh0H9ADB1NoSNLDg8vTNJncoxJL7BYLjwD0ul4uInLq97s+AVmCc
	 WF6tl9wEiy1jKZ3nUOjnu1ZTiaVyCInx6eq/97aSnHEQPHBCZhqQJl0JMxN3/1hD7I
	 8JgHadKD74jst6z7vYGHU6mQ5o+wGFdhmfoZPkg2bDLV0aOgZdfuVU416FU3A7WA+O
	 B1VbIlSwRaM7pdUTiF0znllayxKF8snf9iAPrT36VD3Y8v9Qqy2NmRs341+sgUAL9c
	 GK8Dd5C7uwJrnou79MLIrxuqBfIZXh9MReIo4ldZzzFbOGT2PqcpCigF5dOXgbmS4c
	 MNt9bybzQVJpg==
Date: Wed, 7 Jan 2026 12:55:39 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] riscv: configs: Clean up references to non-existing
 configs
In-Reply-To: <20260107092425.24737-1-lukas.bulwahn@redhat.com>
Message-ID: <e28b10d9-7974-020c-b558-197bd129363b@kernel.org>
References: <20260107092425.24737-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_115543_486219_BA172B58 
X-CRM114-Status: UNSURE (   6.69  )
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

On Wed, 7 Jan 2026, Lukas Bulwahn wrote:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
>   - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
>     ("i2c: Remove I2C_COMPAT config symbol and related code"))
>   - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
>     ("sched/debug: Remove CONFIG_SCHED_DEBUG"))
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
