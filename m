Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD40C3ABB0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 15:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSuXcoIW7rxqZJVBgd2RzBejzRZOrb8MTmNJAjLjtOI=; b=EHHMrAhZzhERxl
	r2fVntcW+cbF/Gd0QdqTxJ67yBE5zE0jur9v3g5kLIkQG2Ec/n5O2guF24wK1/mS3Stf2ZuzkHJK0
	WiVIQCtILZvazcwYMcx6rXjQJGVE6c8qZpYomIvOCeb/QXsEq+aWtiN2xxI3PMkqsL3OUlQXs1PPm
	NViIGL42nztnPyrNvPAObJfj4+aYYAdGs21Mmxjz/HXX4evY6qKqmJqUqcaylqFWRFo4VcNMTrz7j
	dkFYuyfUbwzB2NLykkbeHnhLQeA+O9sfjfQj6jt5xjQZLpDtt6sGI33zN3Ny9hRxQgZpNYo6vhep8
	5paKNpQzNJHPJW9fopVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxYd-00000007mc6-0G9r;
	Mon, 05 May 2025 15:16:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxNe-00000007kXx-20U3;
	Mon, 05 May 2025 15:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 693C94A738;
	Mon,  5 May 2025 15:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F76CC4CEE4;
	Mon,  5 May 2025 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746457518;
	bh=tVwY1GhHmqP4tNt6PF7NZ89nMFSpxg7uRS+j8Qo6g3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBSqCk/xbHGCM6+NNMlpLQtOhHa+ERjy2QkOGRQzAhDpyDdOUa/ne7UZQ4uiH2bGy
	 utwN7dvaElYocZWWZ8zV+ilIOEUxgzRxIYWDmAyZwGFBzppVTztXR2ITc7/LUHeVaD
	 l8t58dkIeX9CikCl4ZG3QKczALeaRoEermE6CuDbOzrQ4HKmDj1iZ0sm/egm+N6XFR
	 2ZagUpMpX52vB/uJ/qVM5cSMENXexwQ60phGkPFo5OGKJ3RyTCmFWi3RjWqZ94j+u1
	 8s48ANOuF7cnPTaPjlyFVTKMGhFYvV9JmRJLZ482FwgaxRJO6Qa/cJWEc4cH3jxkQq
	 TN1/EnXSDIdkg==
Date: Mon, 5 May 2025 17:05:10 +0200
From: Niklas Cassel <cassel@kernel.org>
To: manivannan.sadhasivam@linaro.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <aBjTpglI5_P2Q3Aa@ryzen>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_080518_541135_CC9FAB34 
X-CRM114-Status: GOOD (  14.71  )
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

Hello Mani,

On Thu, Apr 17, 2025 at 10:46:31PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> @@ -1571,6 +1652,9 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>  		pci_unlock_rescan_remove();
>  
>  		qcom_pcie_icc_opp_update(pcie);
> +	} else if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> +		dev_dbg(dev, "Received Link down event\n");
> +		pci_host_handle_link_down(pp->bridge);
>  	} else {
>  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
>  			      status);

From debugging an unrelated problem, I noticed that dw-rockchip can
sometimes have both "link up" bit and "hot reset or link down" bit set
at the same time, when reading the status register.

Perhaps the link went down very quickly and then was established again
by the time the threaded IRQ handler gets to run.

Your code seems to do an if + else if.

Without knowing how the events work for your platforms, I would guess
that it should also be possible to have multiple events set.


In you code, if both LINK UP and hot reset/link down are set,
I would assume that you driver will not do the right thing.

Perhaps you want to swap the order? So that link down is handled first,
and then link up is handled. (If you convert to "if + if "instead of
"if + else if" that is.)


Kind regards,
Niklas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
