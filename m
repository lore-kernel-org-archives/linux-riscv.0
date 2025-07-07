Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43A3C83F10
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8amrwZr45muYpg+qlPFtYpYPXDcJt2CIrRMLDrNvZKE=; b=WaAYtlGkgdfwqg
	tK0sksoZhTeUHadcryQS/YCo+3hy2zgtHhnAqE816xDqyADLaK4LtfNM5e3j4PnyPYb9AQotFeCJg
	UEWZkRkrp8gtxC8k8EalDqZ2KDlzPDPHCCKFyh78HG9x/1xVctJV5d+Jy3rxmiot2MaVUilx+9jPN
	9D1YHab1H+kH5Vz8hRAzonVeVgNvMUo6oiedvaU/JAiI/sLEtPRjuMAqClSds0/J+0oQG5nKcazTj
	q0hBDf+Ot97oERl/a5lh8cTvipmDf8WX2ZiLQr9b6HLJgFKkzTLAG9c5bI9Mv1e8xQ6HhqhGEO6c7
	Q3VAym3zQE+za0TPBf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRj-00000002TD1-3j6a;
	Mon, 07 Jul 2025 12:59:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjfU-00000002EYU-44eo;
	Mon, 07 Jul 2025 11:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fNH/Ud2f5PPEpOq+XQfdy8tzQFTqZ/0vJRrcuO4jMkM=; b=VypaRv1W1Mz9YCX4RXvSgeV65o
	ynrBVjxHmle+zxdSaQYt9VJ2YmrQOqEDNkAk8XcepRfsli+1UtZ3s6siDHb9u5lpG3nSlIH2Ivw12
	OsRQtpCMWlfi6Usl/kpNy2oQ5BFxdEkYWjYZepTmd5STpz8mZclQI39WnUArZQpwGv0Lb/zb/ws62
	NbAaUfg98F2lZ8yZyuyY+PptTt7cFNJG7ojWwGJHCa0IqPq4ndlJgpGM0KDe48321eTRGuYK8uDKG
	/Rn87xIjc9SoTb/6JYDWmF68ydb5IUj3GMZrRhmey/2HqJR/iwfkJWei6559MLZMe9Kxzcpi/yJkM
	QzVqTvug==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjfS-00000008TDN-0Jr2;
	Mon, 07 Jul 2025 11:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9771EA53EE5;
	Mon,  7 Jul 2025 11:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1431C4CEE3;
	Mon,  7 Jul 2025 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751886346;
	bh=KoMwxI+BjZlkT8Tms2SDNkjYSNzeRufAe/1amGoI+ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sDDxGoeyD7+j008f4C5gG8JDXIDhNP0oYiiRUsHQHw1XANM4XOzj4BtQ3WRR5Nn0K
	 WLQ2PaBnbxIIzlNv3K7Ile06rk1m+JjXzF5UOOIs8F8KxsKtXtAULq9PJzo5d1kaxo
	 caU444uhBlooXbSdeQvgvT8/tOrzFv03nVOss4vwcoBh01qYKDQ0/1z8HNvWeFWIXT
	 ihr6tAvSPIwYq+TN0y7vd0jE6GXiIDMGZTlGlX4HxAe7bi6VDUGc9t5elocqno+Onm
	 crt4dZtDXxsWvYAgX2SCmcV72FGyZzew9r+pB2iOAoJINY5GG/OgEc6ykmZmHl6wTS
	 gBqnE5NypwKLA==
Date: Mon, 7 Jul 2025 13:05:39 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
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
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <aGuqA92VDLK8eRY1@ryzen>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_120550_355817_540F45B7 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> 
> > I think pci_host_handle_link_down() should take a Root Port, not a
> > host bridge, and the controller driver should figure out which port
> > needs to be recovered, or the controller driver can have its own loop
> > to recover all of them if it can't figure out which one needs it.
> > 
> 
> This should also work. Feel free to drop the relevant commits for v6.16, I can
> resubmit them (including dw-rockchip after -rc1).

What is the current status of this?

I assume that there is not much time left before 6.17 cut-off.


Kind regards,
Niklas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
