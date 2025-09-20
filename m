Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC35CAC592
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF6zN26nMyUAOqA8UHi3NKpy1XKvsfTWBbocorzQjSs=; b=O3S1wh85XT+BbM
	vRUCewF1w0SLypZ/xvfLzXAR2MwFppS4V8wl9r0Ig3MjW5bPT99I9a5yINpRyOO4jKcJh9RMFgl2N
	6QeWGZXKDGNkNBonhTFkrAdZLC5yzlKP8faSruhIVH75GHNI1VHi/X/rP1+j330PYJ7OdQGYL7GHT
	Ci3CoZ6fvj2IwN+OEikuifwdEOkmjscqF/lwrrsXlua9ElnYgNQtV3s5Lly4UOF8aw0k82//Brxeu
	o6CpmGhlQCPhwxYW0F/Zey6T8NdpKwTWygkwWeX/635JU/UGS4jik4hSjzov9hY2d7XFS+toHNe1+
	SFoBdBQF8GVf7fjVwmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlt6-00000004RLO-13vD;
	Sat, 20 Sep 2025 00:55:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlt4-00000004RL2-0o5R
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 00:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9621F43FE2;
	Sat, 20 Sep 2025 00:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2FAC4CEF0;
	Sat, 20 Sep 2025 00:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758329736;
	bh=xHhgtD9N0YYd+VEikxxpv6izJ9J1H9+FhgVzBmIlsCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OwyrkjP5Egxyz8TzAQyFy+05DLVpjvhb6wqgoc6Vj1KkCNBEi/uM6v75Bh09rPZ9P
	 PBTZm8hUe6EblRW1NsxY8T0YevPZdtA4Se31+jk9khlV2ITF+t1eoYK8dMTfMUYTpz
	 JQZ6AJgpO/Gh7JAH2A/ceIGg4IqvQzRiZebaPnaqefp4SSDEqvQe/Y4CGVM7sG3GeN
	 XZ8EdXYPZWQt9JrdyK+11ntDEudHuUlKn5vTcXj0cQ5Y6bd0pL6r8pFEeO+sYhX8vL
	 W0l2AN1ZInpeo+U3n6vAYlnQsLX6rQcmKh+BZac17eCtLVdb1b6quyOuM3pAfCX13s
	 PiK/HM4jCiSHA==
Date: Fri, 19 Sep 2025 18:55:28 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>, 
    Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Fix sparse warning in __get_user_error()
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
Message-ID: <c7f5a944-0abf-8696-217b-4fee650ca96a@kernel.org>
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com> <20250903-dev-alex-sparse_warnings_v1-v1-1-7e6350beb700@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_175538_251954_222B9B02 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, 3 Sep 2025, Alexandre Ghiti wrote:

> We used to assign 0 to x without an appropriate cast which results in
> sparse complaining when x is a pointer:
> 
> >> block/ioctl.c:72:39: sparse: sparse: Using plain integer as NULL pointer
> 
> So fix this by casting 0 to the correct type of x.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508062321.gHv4kvuY-lkp@intel.com/
> Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, this one was sent upstream as part of the last fixes PR.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
