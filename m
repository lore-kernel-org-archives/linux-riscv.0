Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AFECCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWlj/oUu81QDaQKkUigDOghCt8uOrALFBWZXk+O8HNM=; b=SdSIM6Lt0JeT0C
	M3ykNzvT0EyIMTNBusrj3V8rbGoW9tiqc9oG3Ub6lnTFeypw+0+ZsMMF5YlyYqAhMvhhehVnwEv+f
	ZUebin7J0HobZJyavd2QS3i6Qa4LJt9YZ625EHL04HJW/rzm28gdAadSxCOHe342xh1ywE9Xcd1Bv
	Q3UmsqheRPW1dBIq7ytJBj+oWwA+krMvEd6BuqqRREUs0AYZu4Nn1IHok1/Ogfpob6VSo5a/a+vV0
	SparCpYEvEk9wsmx8PJLYaZdbN3U+e1bWkgk6nLpMkDXylas6sgLWjccab3ZRLb7YpjwMpqMBfGlr
	h6VyFDv6l0qrFVf94mNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIriN-00000007VRX-3Kfs;
	Tue, 11 Nov 2025 16:59:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIriM-00000007VRD-1P87
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 16:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C221E43937;
	Tue, 11 Nov 2025 16:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA35C113D0;
	Tue, 11 Nov 2025 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762880369;
	bh=8oMiOHa+hu2a7ioUCvWOutt6HMizxpVyGXj4Xwd+sC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MNeLnjmOiQ9qJ4do4Xaho63cbf5NpteEOrDMlIaLLu5gGMvOAcOXh3BxOIm4zxTg4
	 tiihPjQzp+6k94GQcw/f8qgoMrD9dZQPwM3QU5pAEhAVYQgu9ls8uDrGfl4LZrpxyF
	 qjTemCrtU8L6khGHdtdJpRZ/vyeYVDCHNXfD4K8dSxLCL7Nr97cTxM/f3mB740MdlE
	 eaMGiL0fcwRaiGGMUvcL459tWTiD3JFe5Nuw4Jw3gLxVmn1yswPoractjvwrs9SB5T
	 JB3Z5Ye7l8V1SxnVW7NyXqH+fW5DEvprq04whOaLZ6MQwWHHiOI/jVH6j8BgFGQA9f
	 PRUcQiZK5sR5Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [[PATCH RESEND] v1] riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
Date: Tue, 11 Nov 2025 16:59:20 +0000
Message-ID: <20251111-platinum-legume-01c749eee143@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105-unrobed-agility-c9c242a5b344@wendy>
References: <20251105-unrobed-agility-c9c242a5b344@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=341; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=S1Tu2ruJlrzPvAMOa7vu7v2UFNoLx6oPas1oSZPbmp4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnC2ZkshQnxPYz/f+SaLn0124mzNbh0e+3pv9JzGbcdN F10wLyoo5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZWcHI8J739dVzS5JWX/5s rvvb6MDuK/ZnnjJ3Fk9/tq99wj5H+zmMDBNu5/9ec+m53YKEVQvDzp3oZVbVyfUJF44oPVceMWG 3ER8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_085930_412972_8D28E31D 
X-CRM114-Status: UNSURE (   4.94  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 05 Nov 2025 10:24:24 +0000, Conor Dooley wrote:
> The BeagleV Fire has an SD card slot and an ADC connected to the QSPI
> controller.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
      https://git.kernel.org/conor/c/1088d49b6264

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
