Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B915C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjYsjkcb6MLqFEMCnaAmXYvzYj9EXyzPC6i9gqxEsA4=; b=OLzH8QunJU/qqC
	9lk1RQkGD4OG+87GJlRsP8mM+GfJsaTCdtgGQwKZHIKkSXD6HpZRMMuWL1KIXN0H4Kb6//kuecD5K
	YWq5cbFs2iQQ5T0K5ywa8ieFNA9tiWzWPBl68HwU8Br/qqsZxqO1aAgkdqiopPDRUNkyeGQGLCDBE
	Hzi2pUR50HU1sHuVb/UNX4qXc0/aEhU442aGw1obL1l2Ypa9GePU9N4D+tNNPNAzkACtXq9MxBh3W
	ZRoYQLmruqemMf0y7ngoXxQiq4PXZOMwjQpXUx+TsS8drGEgPfBlTVrfDyKWQ4VZVfkQphseI6d8P
	2BJKKVPSk9VcdgM5XMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvg4K-00CeHt-2h;
	Wed, 25 Oct 2023 15:45:16 +0000
Received: from mail-4317.proton.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvg4I-00CeHG-1n
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 15:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1698248711; x=1698507911;
	bh=DI90V1bXwX/Uwv3dOT9N//AgAR2Tj2M9NCy1KVRlAJ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f5ZliKWD4GWYi5CTZC9fw481wKGRwUoXBR7j8DqVOl0Vb3hdYy3HwZAB9EtCRdHJT
	 h0paaejp+AsubIIG5Y59KzNtTpylq1huiC/d/9+SeUj5iIlAa9e1j/AiZc0LFN/n72
	 jsQbgP5j/B1GWxOgk+FeC4nKgudfFHdFFv0Vz5gEXr7fxrvy13bMBo67MvgKI8YsbZ
	 2mScJyrytlw7J3o2H7kbdSl12Vl62qMQC/9dDmwYHH9QKDhjb6+tA9gxCIjS6pt7e3
	 RWg5x0nDKr5E9+VkBuzMx20Mqxhf8P3BS3sTt+YD32UsMKdmDYKyo5saSkZO/pXtMy
	 1ibsvoyTUMvAg==
Date: Wed, 25 Oct 2023 15:44:58 +0000
To: Keith Zhao <keith.zhao@starfivetech.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Shengyang Chen <shengyang.chen@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Andersson <andersson@kernel.org>, Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Message-ID: <2wq8ssA4KblYH5JfC8KxeWWoYPleN_BcH6wSZ92tkOixbiU5k2ZU_lS4lO0awCCeomkdjsEoVlUmAH7aaaR2n-bdLKu1AaSar_JW78Kw4Ik=@emersion.fr>
In-Reply-To: <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com> <20231025103957.3776-4-keith.zhao@starfivetech.com> <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_084514_749358_E1B3693A 
X-CRM114-Status: UNSURE (   3.88  )
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

Thinking about this again, it seems like you could start with just simple
enumerated modifiers like Intel does, and then only switch to more
complicated logic with macros and fields if there is an actual need in
the future.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
