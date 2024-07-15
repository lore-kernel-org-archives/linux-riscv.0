Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7445BC3DA45
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 05:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sl6x7TDzDx6SMlbJnZaSE4AUOdAjZSW8IznXxRFiej4=; b=xutqM2ppo5P8qK
	4Ul1hyo/3D/aFjCMKTExvfKbeVoGOyGrBLoj12C82RJ9VcnHcv3QLjbCCkogLV2oVi6QOHUv8faU9
	b20wiS5KuVqFMn9DIqnLNj3zhsPgoGie5+9/Ruoy4pkHKulqBMw3X8kQ9AbwYgZjsjjZKCd1zNIbq
	JtSYhBr7ubbPGLenThTi1AmGVnNHDzJSAQW+X4TpMN1GZMLEpX1nDdE8f+aRTjVj7aU5kC3U7ZoOQ
	vZyIBN4aXlGEqQKEce2Q7SUpCJPiz7cPlX3m/hUTy/6CpodkSROW2U9kT7rkm77IA+J4sSG0EVS7n
	0h58m6BZgQF0FemG9Kew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTEUu-00000005wgq-15qH;
	Mon, 15 Jul 2024 05:43:40 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTEUr-00000005wfi-0Qvy
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 05:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=uJSzFegmGeysIOt5nBiYlkAzmXFoo/+umpO1rSDbX4k=; b=T
	hr0n7VFCQWwsHuUnYx8zGRDpW+A+XR0SFazUjfP5g5RIOhwj5OYXoo/aoEevwCV6
	Yu3t+KzbSuU6pQKR8axnXnLof5ikyteaZJ/n+K6cGc73eAZDULrgRJWPEOxzCadP
	hCRTDlZzxRKhusKMXq06Q2W6jiPkE3ClEj14SYELlA=
Received: from gaoshanliukou$163.com ( [123.150.8.43] ) by
 ajax-webmail-wmsvr-40-131 (Coremail) ; Mon, 15 Jul 2024 13:42:16 +0800
 (CST)
X-Originating-IP: [123.150.8.43]
Date: Mon, 15 Jul 2024 13:42:16 +0800 (CST)
From: "yang.zhang" <gaoshanliukou@163.com>
To: patchwork-bot+linux-riscv@kernel.org
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-kernel@vger.kernel.org, yang.zhang@hexintek.com
Subject: Re:Re: [PATCH V3] riscv: set trap vector earlier
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <172098903367.7439.15717595350937923936.git-patchwork-notify@kernel.org>
References: <20240508022445.6131-1-gaoshanliukou@163.com>
 <172098903367.7439.15717595350937923936.git-patchwork-notify@kernel.org>
X-NTES-SC: AL_Qu2ZA/yZvUko4CWdYekfmk0bhe05W8a2svgk3YJSP514jA/owAw4dnlnBWvE3/uyMS6cnDyzbRF3ztVBRahlWK4LNXZFKo6r5xdVvznU89w9tA==
MIME-Version: 1.0
Message-ID: <4d0ea144.51f5.190b4e9c0f6.Coremail.gaoshanliukou@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wD33wW4tpRmgJ8uAA--.12011W
X-CM-SenderInfo: pjdr2x5dqox3xnrxqiywtou0bp/1tbiJxEc8mXAmwBdTwABs1
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_224337_575003_972833E1 
X-CRM114-Status: UNSURE (   5.57  )
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



hi:
Yeah, thanks.













At 2024-07-15 04:30:33, patchwork-bot+linux-riscv@kernel.org wrote:
>Hello:
>
>This patch was applied to riscv/linux.git (for-next)
>by Palmer Dabbelt <palmer@rivosinc.com>:
>
>On Wed,  8 May 2024 10:24:45 +0800 you wrote:
>> From: "yang.zhang" <yang.zhang@hexintek.com>
>> 
>> The exception vector of the booting hart is not set before enabling
>> the mmu and then still points to the value of the previous firmware,
>> typically _start. That makes it hard to debug setup_vm() when bad
>> things happen. So fix that by setting the exception vector earlier.
>> 
>> [...]
>
>Here is the summary with links:
>  - [V3] riscv: set trap vector earlier
>    https://git.kernel.org/riscv/c/6ad8735994b8
>
>You are awesome, thank you!
>-- 
>Deet-doot-dot, I am a bot.
>https://korg.docs.kernel.org/patchwork/pwbot.html
>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
