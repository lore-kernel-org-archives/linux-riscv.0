Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B7C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ck/L0Kn9QSBwR4yqVBx9ONEUvo2ok32iNTVu9PKzP5g=; b=yrqeEUXf/z9pb+
	kw2EOhO5/LEqeWEMDfgDrsx5/GVGhPs9J+BgCjP++5aDQk3fhbbyB8kX6Sp3PgvSQoiIyDaMOtUQ0
	y3NOnYiXQFBSvOkZnldFuTg/9+9OAA68iMVvGD+utjE2bTcRrqg6XEipww5MYKcWALQaOE0zILYpN
	YxPUMJE41nR7S5YsN/aXv6xuqiwM39TvJ5l/kZ5EiehQTfJ8IeU5VuATWNzwC0pMZ7czNijItuc3y
	Zh0LR5n+zrnqpdwe+ufhsRrKzHlwS/Su2kAPDzDKSRInP1MUZw9cWgn/MVyJCloQOs+tkIVt3OukY
	NMzpP34j0OfcgFW0iNPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUH54-00Awrg-2T; Tue, 15 Mar 2022 23:59:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUH51-00Awr8-VN
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 23:59:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F9F361387;
 Tue, 15 Mar 2022 23:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDEDC340E8;
 Tue, 15 Mar 2022 23:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647388794;
 bh=VIGn1ncc/0gbk0CSV7hTIb7IyEeDRexfDbUxge/z2yo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Xs8Bw6DTVN1p+y1/8dm4UTd0+HPW41Aj8RH7gToMBUnVtWS4MK2n7FTAHN8ie1GlM
 RtYPLDvVm9NZTCfjakfa5FvgLtjlGpfV7Db6A5JUJifrzHjHu0fC9K8B1CW0/19POc
 QTm9u5I3cUecjDAoEurX7mfjqOVLcCnP6KoKG5qBlcWb/t2To7oBg8SnRviVTgyrWT
 omshvAgSWlPAO1T4x+jmtuRMwyx9xd8xwmQzvCYTOA0kuGg8JG2OXYh7k0WowP+bVP
 w1P9lpryqnz+O15F9F0FScPN9Dy3EHyyEOvlj/yKcFZrbazkFEAye/ApZadXRI442X
 tk9jWtZ7zwk1g==
MIME-Version: 1.0
In-Reply-To: <f9284873c2993a9952d9fe4f8dd5e89f20daab75.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
 <f9284873c2993a9952d9fe4f8dd5e89f20daab75.1646388139.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: change the macro name of prci in
 header files and example
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Date: Tue, 15 Mar 2022 16:59:53 -0700
User-Agent: alot/0.10
Message-Id: <20220315235954.DBDEDC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_165956_072964_1E5BC785 
X-CRM114-Status: UNSURE (   7.85  )
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

Quoting Zong Li (2022-03-04 02:03:18)
> We currently change the macro name for fu540 and fu740 by adding the
> prefix respectively, the dt-bindings should be modified as well.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
