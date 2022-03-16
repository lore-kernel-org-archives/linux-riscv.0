Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FE5C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 00:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQ/QDf/+MHket/yWrrWWK7uwTJAa6rwC0ZKgn2tBcAA=; b=yqO2hSmVsInlJA
	bBQ9FiZwucZQQcse6rxwAWHXuw32JObfnmwFJD2X2Pr/EnoyhStliDgpv1Ef2uyCh4VrwugJ5MUxx
	M/yyt5K3WXO5npysKd7w9SSemdIwpIUx0PfZfJS5xyeR7FgS7S56HUZo49kW/GnALM1swfyUvsejB
	nGh6TM7smPW41J9UlaJuH4RFMQbsu77x0j71YcLhfnERQN1SPRex/RXoegObSsle/MEt+mentZp9e
	+ASsKobPEjvueZSzam1DxDEZxiY2mR/vK/vZzNPAL+30rTj2iS/GFg6aLIzLAV2uA4NIN1so12q9W
	E3b8nn/Nq32//0817HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUH7T-00AxEw-Ba; Wed, 16 Mar 2022 00:02:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUH7R-00AxEd-Fb
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 00:02:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B23361530;
 Wed, 16 Mar 2022 00:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E4C340E8;
 Wed, 16 Mar 2022 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647388944;
 bh=I61OZqk48su5EH1saKmAclknLhdAGM+Cya+FRrmVXgM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cn6HY79g23x0VTVBI2oMsEwHmjlI+m949to2FSM2BdFnTPcZEGmPJ3r9RRorBbfvT
 5qnDDl1tZdc39+TsYYrGlCwIc3yFzLUmeEhRKYxu8mLaDuMy6+njUU/mBqZbYwCyo+
 3x5x82b4pS2+wVYVDA//ZdXq3qp4VVbqmWum7HLQaCtt87V84mqegvgFl2dhmHv+f7
 1bJSBBCpwaOpBL76srX3hb5/H57tvVlrRwbL2tSFydXf54L3lNaCAdNO9pABRxWE4h
 h/Gy6fntBV8i2m8gWanYQ1WKAhJb0mE3h3AI0lFSiKfUPaGFpLLcGUSWqW7i/VwZbl
 7BeaTi2JdJJww==
MIME-Version: 1.0
In-Reply-To: <db92d209fa700f7da8bc8028083476fcc138d80e.1646388139.git.zong.li@sifive.com>
References: <cover.1646388139.git.zong.li@sifive.com>
 <db92d209fa700f7da8bc8028083476fcc138d80e.1646388139.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: Change the macro name of prci in each
 device node
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Date: Tue, 15 Mar 2022 17:02:22 -0700
User-Agent: alot/0.10
Message-Id: <20220316000224.533E4C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_170225_579381_B8EC8B74 
X-CRM114-Status: UNSURE (   8.06  )
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

Quoting Zong Li (2022-03-04 02:03:19)
> We currently change the macro name for fu540 and fu740 by adding the
> prefix respectively, these marcos are referenced by some device nodes,
> they should be modified as well.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
