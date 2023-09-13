Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB049EE3F39
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uw35ONvrdTvZYNgd13E+qtiNPngsGSBth7H1JqLTL2Y=; b=I5VKnTYov1UPis
	FwtNJfxEmnzmmVyNVvQWwKfBleXL86sodUlBdNFONrkQrL8761WgxIFcNwFeiYXeTliiaoZjFcYaE
	CipYB4GfwjLaIPAf+hdERGTIoAeUxuNFmCGvmSDVjl2KLEh9xwr7AvZUk7ymqL6JgPEQ27BT0S9Dm
	JyYeo0zNoaoY+pOt2fb88iFphpIKDdSLwqDwZrDzpf4uXQbOwVj/XT0BqlKoupxg+sOUs3cdh3dlE
	3qTnHho3o0KHkTVZ/NnZ0XvRLh7TBjbVmsQcuNzOla1eIh/WcJyb/1/iSiglF3OU7YSVV7Gk6FQ3y
	NqAgJWwfE3yRBG6eV2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDsU-004Lsp-16;
	Wed, 13 Sep 2023 00:37:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDsO-004Lqf-0B
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 00:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B584B821B7;
	Wed, 13 Sep 2023 00:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CD9BC433C9;
	Wed, 13 Sep 2023 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694565420;
	bh=HgcPYkQCEMqwS01o+/ylolT9Zi+5eZaHSwKnIn092ag=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nDGWSfho1BlquLhL+yWTOKYwVYqxwdyDAURH+0HnGN7Ql2S7nnNpmPRho9YUqSxDl
	 wFxO5Dhk2Buhn4HkSmEQe3hm4ufeKjPA5ONZrOnejFJ9vz4goh4dAbejMxEP0jggrl
	 aCkrNDsoZ+jQbmLKnKLmnb8W3cBEtzMJYME22/vpClhN8rEuprCFxWSqKD21u0XjjU
	 AIEjEIuW/qQzpVlcWv8HtlVVVuQl5dbkt5ay5vH66PrDQyR/BX/KGcKz2b6xkwhY+8
	 ZqYVfKJAUDYGMc8hygXAH1BGnWjjV6j+SHikSfR06+x1vmiErnqcy9m/jPI454/cpE
	 8Gtrpq3GAhW8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2168BE1C282;
	Wed, 13 Sep 2023 00:37:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: kexec: Align the kexeced kernel entry
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169456542013.30716.9158601549505953112.git-patchwork-notify@kernel.org>
Date: Wed, 13 Sep 2023 00:37:00 +0000
References: <20230906095817.364390-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230906095817.364390-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, lihuafei1@huawei.com,
 conor.dooley@microchip.com, liaochang1@huawei.com, lizhengyu3@huawei.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_173704_245089_23747BD3 
X-CRM114-Status: UNSURE (   8.94  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  6 Sep 2023 17:58:17 +0800 you wrote:
> The current riscv boot protocol requires 2MB alignment for RV64
> and 4MB alignment for RV32.
> 
> In KEXEC_FILE path, the elf_find_pbase() function should align
> the kexeced kernel entry according to the requirement, otherwise
> the kexeced kernel would silently BUG at the setup_vm().
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: kexec: Align the kexeced kernel entry
    https://git.kernel.org/riscv/c/1bfb2b618d52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
