Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E7CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ew3Vgv3so+3/8xhxxBysrEmykHjnEKl1iWLuMHobMr4=; b=ycVfbCnYwcEsQr
	A66UlG6unRtsJh/dtNpaI2Vr6/T71nf5zxxK10Fi92ivYb5uk8NTVgCmqPcCsrUpjvfgX8Cnk8FBo
	dyuFAd8yumea4uTGQqAjTuLj22m9BIjst/GnDa/CoC94CyRlV4pnqCixUPtSQsOFH+Z83yN29NItw
	JXIX7ny0ZrAb1AD2VP0pmiDQJ/cppCyy/SYnPWUjVJt1Pz9CjlovgUR7zu2gbqTkmPkjQcTar770v
	kdcToJpv3SahOgGqE8nk0PS2wgP/uLIrS6yT5fDO7J85zjx4wDg4t5CA/1pZvBHvqHwzMzMzQV/zn
	aEClLJ5FGBHva28jS7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDd0j-0000000FK3l-2otc;
	Tue, 28 Oct 2025 06:16:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDd0h-0000000FK3R-0fG6
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 06:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFF2548A84;
	Tue, 28 Oct 2025 06:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281F5C16AAE;
	Tue, 28 Oct 2025 06:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761632205;
	bh=JMt0g+3elYjxcxaxmCLJQE7WMr+hUSi/SmXMrtaOYZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eYCz8aU2Nf0loa5H4K1+9cuAcCCfgs8XCvRzD7Mp3pJLBHa/y+BP2DANMctu5sHIF
	 1mnpK3uIE98D8X8j3F6mgNBgcw+j00EL0cK4dNdZodPMgoxBDsTrgy4Gclzf2ETasI
	 D8y78vdSd79i94ZJtbBY9mBac1XHLEdRTBOyxfOLPT9Co/Iwt6On/1TkrEI+HLVU7S
	 /bZHLKWeSPmJwvfL78TaIitOuaFv1znoBgASA4SA80yWMI4vFPnQHc9HDzXTYqPmbk
	 lq1dLoRDbrrsIhR4G5xOLjEEK9HMV+LPP5zjQrW1XXwsQRBegKUNBfLugJO0dGwpgg
	 KPNU07tEbwITQ==
Date: Tue, 28 Oct 2025 00:16:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] cpuidle: riscv-sbi: Replace deprecated strcpy in
 sbi_cpuidle_init_cpu
In-Reply-To: <20251021135155.1409-2-thorsten.blum@linux.dev>
Message-ID: <c0619d96-9880-8289-6544-97b0d9c3e663@kernel.org>
References: <20251021135155.1409-1-thorsten.blum@linux.dev> <20251021135155.1409-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_231647_219264_BAA714D3 
X-CRM114-Status: UNSURE (   6.01  )
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

On Tue, 21 Oct 2025, Thorsten Blum wrote:

> strcpy() is deprecated; use strscpy() instead.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, I'll plan to queue this one through arch/riscv fixes - unless 
you'd prefer to take it, Daniel?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
