Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A39ED11180
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWd90XGJsGEO9mK85jtbCpkDzrOqqghl3dQ3aRyFXts=; b=NU/tkXKgzeNvaL
	L7E9Y23VDrJKy778AgwuSFdQyWNKZQ7iAl2Fh2C1fPCHukT9RXzKenxg4mJlST+QRv8GZVJmM6DN7
	oY22PvTEAMinQBYBhHib1yDFNPWYTT26PeiiPFmPuIIoH5zsY43e1TxbQgb+IOzhfpu4LyrnMjWUo
	zJhlwonVq0A9f5ZMI0J3SDwkGVpjo+RjI45E9C5fr/OB/8FrW1BjKt+ceVeTvpMK0TaNqWp4fGVLv
	1FNWPjiXcJQ3uammL/snKXQS2IT5/3KkuB0ulVPDR2p8ZRkE3dsa52V2JGBroiB9IkX3I52fL8vsJ
	ur6PKkh1+guM/kJiF1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHjW-0000000FCaP-3epU;
	Wed, 26 Nov 2025 15:47:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHjU-0000000FCZu-0cB3
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 15:47:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C321E4175D;
	Wed, 26 Nov 2025 15:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B84C113D0;
	Wed, 26 Nov 2025 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764172023;
	bh=l+5MsesiWzmet9GRAET1gD8eIgf+wj+88gEkEndlf5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cvhk6bj+MDcR6W/eD8WfO2WDZ8NYTQz5dCm0AFofoQa+fCNbpdiR9JdS+hOTbclCS
	 4oKv5Bvgk763y90ExsiNqDprFCYXJAeZL2B/69gixaYKptMXgKxd2MI5MxTFcoxmvL
	 E+v/UsFEDtxl5eRYWVQqUyie8k0DmOWFwpA3BdKVrXxgE3ss7K5x2iX+2NLjZWaPdv
	 fSvu1nToYH7GDsZ4FaSQShw5CSDgdSC1cIDTlzLPORzI189J7BvXhKqUUCYIpSNH8P
	 AfDSMUHCMW2b9qZb+wOtpeSj5h3pkhvugqnKv5cbGlEpV43G+MNGMHW1mAEfMD8gH3
	 4ttT7ju9BE2JQ==
Date: Wed, 26 Nov 2025 09:46:58 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 4/7] clk: thead: th1520-ap: Support setting PLL rates
Message-ID: <aScg8oH3I8wJvFHs@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-5-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-5-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_074704_206436_DF8FD9E3 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 20, 2025 at 01:14:13PM +0000, Yao Zi wrote:
> TH1520 ships several PLLs that could operate in either integer or
> fractional mode. However, the TRM only lists a few configuration whose
> stability is considered guaranteed.
> 
> Add a table-lookup rate determination logic to support PLL rate setting,
> and fill up frequency-configuration tables for AP-subsystem PLLs.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 142 ++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
