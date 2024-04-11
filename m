Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EBECD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+B/N1iqZjNVIdxehmrORz5m/cCoKViAJneNKFC41OE=; b=V10PqKKYbHdEp3
	psAz87CCEZpN8X75d1MMHJL6LWpmTBJRbYZNJg+dXEq6XUniRt4tw/NcqlssfnKCDmRpo629exHNo
	NxNvfHLN9j0x6sCRINqe+68ETNSGSZHkeWpMwOaG6VsSIAPhVkPdLrzxQ8Qkg2mPkxN/92gBy754i
	N3OKOJDBA3ph+sLJBQsWu9/8gKFJobvcI8TIx9MfkG4d+9iNSZA6rq8AKAzWZWAqeY9wkZHl2Pt5Z
	XrtdbKW7fEiH/44oUcPAmPYACKr0psUpLgWJ1801gD4HAy5YypHxJePmTH/eOpCJBOrllUzYG+T6R
	11CYfWZnKR0puUQhSfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoXB-0000000AkS4-3d2s;
	Thu, 11 Apr 2024 07:07:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoX9-0000000AkQ8-22vt
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B84C1CE2661;
	Thu, 11 Apr 2024 07:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14E4C433F1;
	Thu, 11 Apr 2024 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712819261;
	bh=QZARi3xW5yvZjqHIn7c/E8XOF4a47lACIjQDQkKBaq0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V6BWzOsOV1BOaERfwEQn8jrZa7NmzzKij7Ug/j8s2QhXuV5zmf0PWhmsdzZLKiBjC
	 yGzEUNkS2oB54TRljHEwq/IT2Js8sHe4E9FWiZSWzu1TRwyNoz1liMgq5/Yu0adY4z
	 5Wr32Kc2i+H/UoyKxxhd9TNCoqjOzhzjgmW5iSf8eXttufTMZlMhsVC7S0OdZ1lKu0
	 7q4NunQM0JvDDp9IrTc3Y6Yz/iePBfle6YmBO08voU+nsA5jutM+2xEzoJAC9qm1v1
	 0qEl6nbZTznqYSdESx1HWbGagqp7kfuDJ9KgyXT9SgnFHgchazmgJEGtGzPqez4XZe
	 jsxJF5K0PlMOQ==
Message-ID: <1d7aaa45113a23ecd6798e68e2742d2c.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495357FB5EEA1623DAB08C94BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com> <IA1PR20MB495357FB5EEA1623DAB08C94BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v9 3/6] clk: sophgo: Add clock support for CV1810 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 00:07:38 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_000743_728321_642866A9 
X-CRM114-Status: UNSURE (   4.83  )
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

Quoting Inochi Amaoto (2024-03-09 01:02:53)
> Add clock definition and init code for CV1810 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/6f4e9b8ecb459e017cca1a8df248a19ca70837a3/duo/datasheet/CV180X-Clock-v1.xlsx
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
