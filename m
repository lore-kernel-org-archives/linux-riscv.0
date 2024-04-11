Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF13FCD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lE3ar/Zr3M2uO5WQx+1scnrP5ElWxXb/uLsZoYzKnp4=; b=V9eU6nZz+vjqss
	D1XLiSZh7o7QhQyQdXbLpflt5XzdRmxIUpUaSRRRsNyn1SV3/iaR+r+PeDXHd//EYrzIo0nr1tlSp
	94SJYBp6ogzwdzcsncVE8F0FUBxpTH8T26L9WtiykN6PPgjSf9+XpTkELJN6ECD48RDyEydni8rx6
	8kv2rjUf+11DEcLKnKXMzp2nEWCNUKqDEuRBPLtwU6hEW8/vE+6ak5/QwmIgtboz1ZpOxUeEcKkzT
	JgYQnhL2J0vbtHu02Q0I0THy1xSCZ1m1XlmoHV6ay+hSQvfefhfIS6gW77GdHjV+bh5ugsEdDnxy7
	RzXztBAErQKGWApYEg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoX0-0000000AkMx-47rN;
	Thu, 11 Apr 2024 07:07:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoWx-0000000AkLG-2xTx
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EA3ABCE2F28;
	Thu, 11 Apr 2024 07:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E23C433C7;
	Thu, 11 Apr 2024 07:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712819249;
	bh=g9w7QPP23scPB5Y2VIp+lDrwFcVCGp13oTZr88kKO30=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NXPcKkIOtfXWcJ2IdcaLFnmjz5+C7cwo0GBSrQqToUPoBU+SCyXSyYPu5oI5VAVpP
	 OfGkOS9bJ03eW80WtH8vazmoJ7DPEXgMidYXJd4PXUunyE/FEoHWjeuRzO7tJsPTsa
	 rtVe2rRJ4SxJl9nA6CqvRl0rLENEfo/cZv0L6S0ZXE8PCYcol8GpcCCtVB+zocROyV
	 EFAx03FK6qPPBaG/ioMn+odph9nD0ZL2MpFzLTGZ8oTq6yl8yElqZ2vNLCyvtXJcpO
	 mjs9FrFJQ7l3V/oGZpFv+5fl2PdXB1bz2z4Wf0mwlrHEk8K93E/jVQ8z/euh9ECkyF
	 HMEPmQwJE70zA==
Message-ID: <8861e9e249e5568116094112c567b141.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49534F37F802CAF117364D66BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com> <IA1PR20MB49534F37F802CAF117364D66BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
Subject: Re: [PATCH v9 2/6] clk: sophgo: Add clock support for CV1800 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2024 00:07:26 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_000731_960290_21D81BC5 
X-CRM114-Status: UNSURE (   5.01  )
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

Quoting Inochi Amaoto (2024-03-09 01:02:52)
> Add clock definition and driver code for CV1800 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://github.com/milkv-duo/duo-files/blob/6f4e9b8ecb459e017cca1a8df248a19ca70837a3/duo/datasheet/CV180X-Clock-v1.xlsx
> Link: https://github.com/milkv-duo/duo-files/blob/6f4e9b8ecb459e017cca1a8df248a19ca70837a3/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
