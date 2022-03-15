Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F5EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 22:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGbx6Q3HibxlsU8YingEKJyHpAGww9zDdc/7X1fvPDo=; b=YmGOzYjf0T/cVh
	mY4Wr7TGxwI2LrQf6eTNva3V8aS4Jhymt6PvUzU55FP+hvJlAOmlNzczpBKefuNt5SFJGMhPldEhN
	tk6uI9sGUWh7SZ3Z83C8XYo7huHHPHLKMbOsHiJJ/pBfi/M9ELsz9GeMyuIInXjZLwkEpUuaPnCpr
	nbLbmD8KeMLYbKf4Pg4Lqcw+YQ5c+kOgvcV8VNkshVhMSqIFAgRJbxs1Pr5HaOU9rbodVDm/Wz0J5
	Ncy0dScWrN3mTGMtCSs5VYAtRWy6QDHP1UKHZJFW+/rEfWO3VSILpWEZB894PRg2JSob9u/mNsRy2
	2mxewdc25INWozQj3jMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUG4H-00AnId-Oh; Tue, 15 Mar 2022 22:55:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUG4F-00AnI4-VI
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 22:55:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C5E261493;
 Tue, 15 Mar 2022 22:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F2DC340E8;
 Tue, 15 Mar 2022 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647384899;
 bh=hP0hQ+FSDuIJsjGAAZ54SAGZsV5IZs9klzsGioeb6+E=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Tb7BXTjUZuwjCHV6reInbp6pttDwUfN3gAhDQ7JVgIabvAuHuHvawepnBmHwpLvqK
 Jco14rXeADtC67CrvRmcPLto68sagjjcnzkg/u6WKUw8uKkxZy+Xmr7FLtzPBS4Mb2
 Z6lIsS3s7VzfMGeiswenjU4TgUjQVnY3LiUnVMsEBocSghpiDuTaoBTNLMH/pLo5Pg
 WZx6j/2BMPXXZYpZdjDnZcjPnXFmOgHVvnYfkwobjPOV58DEvVUJDhR5Wh5mpUSOJb
 la5OpD2YnbYBwp5od936BdfephsaJjhEyu/wLNdV++heqdkUcmWJKPXGskpLf/Gr15
 Ti2XX6ntGBEAQ==
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
Date: Tue, 15 Mar 2022 15:54:57 -0700
User-Agent: alot/0.10
Message-Id: <20220315225459.73F2DC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_155504_091885_50D32E3D 
X-CRM114-Status: UNSURE (   9.98  )
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

Cool. So it looks like I can take the clk patches and not this one and
it should be OK?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
