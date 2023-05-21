Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A5C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 04:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxZYSh78PgUN/OE+0TZZu5MvRMihrseMzoIIuaHzr4M=; b=gopVybtI0VPTGA
	Q6MjJIIOkOBR+fci76cB3V6q+fK+9qsKqEHUoPYmwVbh3tDDBvc+qbj6gE3Tv+Fc8XChNEApj6vVV
	LYrezf6vJo5Q2L9SaVMOukwUp8GHkvbARBW0L0RBAlzNwCsRxNU5jdUQtme9m5NIEuWlLuP6AdibA
	USylfcC141xBsRp9p1Wc2OUzb81InEpES8SaNzLCFKgcSlL2ckw+yHj7mkv5Ib5hvhh48WstDizX7
	+kEcZ5wgkhx+im/X0sQSVeSI2aB5zHqZoWoNdrkUywnEtZ7h7iGJOOhWDj4ehvAITuNr4nuL5TePu
	tGEpE8IUrb1m47BtMyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0aOZ-0031Z4-1i;
	Sun, 21 May 2023 04:10:11 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0aOW-0031XP-0v
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 04:10:10 +0000
X-QQ-mid: bizesmtp72t1684642191tffkof5w
Received: from ubuntu.. ( [111.196.129.125])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 21 May 2023 12:09:49 +0800 (CST)
X-QQ-SSF: 01200000000000D0G000000A0000000
X-QQ-FEAT: q+EIYT+FhZrBRBuFR8cz04s4upfL7lN0NTv08gQRJnATupec3Bxtrvuf/upn1
	SBqHqfOvbPgllBqeBGx51s47uW6aVDVH6HjJQ9mYyQ862m1Zm/0QvycgS2hjx7zp7FhqEgj
	8P2RdBskInggDKw9b8t2WQ2X8biakZDZ7xh0/vYyW7Rt3sTZ3VuK4BIvhG43rNWHlNsvFse
	7x7h/FLpdTAXSi9zDr2W4Sw56bPfhRlVBwn6md2FgQCwRTkEU2e7Dh5P8fbpiQ9ZiSIaMLk
	zxfGWUasSyIxWaK3oXZdoDFHcofcKvH8fhE/g6WidSGH2Orhbf+ZFX+s/HYRkHwJHxaVrws
	NI/SRDPwi+n1HUEiMwNQhct2v4qzw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16140868316162254802
From: Bin Meng <bmeng@tinylab.org>
To: falcon@tinylab.org
Cc: conor@kernel.org,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	npiggin@gmail.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	tim.bird@sony.com,
	vincent.chen@sifive.com
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Date: Sun, 21 May 2023 12:09:49 +0800
Message-Id: <20230521040949.1411220-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517082936.37563-1-falcon@tinylab.org>
References: <20230517082936.37563-1-falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz7a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_211008_645927_B3D8B3A9 
X-CRM114-Status: GOOD (  10.74  )
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

> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> the user to enable dead code elimination. In order for this to work,
> ensure that we keep the alternative table by annotating them with KEEP.
> 
> This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> it only shrinks their builds by ~1%, a smaller config is thereforce
> customized to test this feature:
> 
>           | rv32                   | rv64
>   --------|------------------------|---------------------
>    No DCE | 4460684                | 4893488
>       DCE | 3986716                | 4376400
>    Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
> 
> The config used above only reserves necessary options to boot on qemu
> with serial console, more like the size-critical embedded scenes:
> 
>   - rv64 config: https://pastebin.com/crz82T0s
>   - rv32 config: rv64 config + 32-bit.config
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  arch/riscv/Kconfig              | 1 +
>  arch/riscv/kernel/vmlinux.lds.S | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Tested-by: Bin Meng <bmeng@tinylab.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
