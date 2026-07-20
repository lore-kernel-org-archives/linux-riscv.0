Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611BC44529
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 18:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VX4UKRO4Yu2RzPscjuTXhsM/NKebPCWa0PqgbcO93Kk=; b=yMjBXOC3+Vw4Ai
	uEbitovton52Ofpc2sh/YsJyrHbS01cHqleErdXDtYlMsJz1wZTCP4UKbpYYUitC5JJpDYA4/ImSj
	85MDswL0pHxqT4imqhxSUTpQ95mwxa7peNdK610rLCjWZw9Mw6qtg+LSCeC8sVJnL30sl/uOEHYr4
	UZk1kkn2CGV59C/v7plcMaB6jnqevGUaUeL+WG8Zv7nrjP5zDC/kaJ7vMPKrZNqK00IdIRnBfXPE3
	iNJ1WoSgACKEVe1afJHt73gDolfhVkzgIndIgVBsq8DQH9DsjmiJv6eVzteIu0uIHZwI9P/wTGXMj
	neBPrVYwGP+5UcB30ftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsin-00000007eSQ-2C5S;
	Mon, 20 Jul 2026 18:28:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsim-00000007eRz-1rOM
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 18:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBB6160051;
	Mon, 20 Jul 2026 18:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B461F000E9;
	Mon, 20 Jul 2026 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572087;
	bh=E1Bw+f7P8Wqe2Bs7RjLjX0TAj6q3KMw+2P3PCqWNcGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2PUpeg+NHxzQGX57N1OKRqJ4aRNPrmN0R0qHmApv9KmNXNL9Z422klZfMmwoHcjc
	 GlpBvomk3C9WFI4ywZun/exCl6NYqpZzuqKjnjgyuUkwQBg0NKitt0LN6K3H/Ib+QY
	 QKuFUuRrEV6rer1nsduCVT96u5tckI+kyAKN8PpbW4FUskhiR9hOc1z46A4gKdxgOx
	 e6uk4WmeSPJOXlqZ6AQaTyKOId+ThB+uNXSbQTReHaSJeemhN/HZ2GOco6zHYaAcOc
	 iBsXHT0Fn3THpK6Nd8pl+gG97jfDDM8vAJNrHYgKhXogH8DIH2rMY60d+hXngLdEBo
	 dNXd7HyNr1QVQ==
Date: Mon, 20 Jul 2026 11:28:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v2 5/5] riscv: dts: thead: Add remaining Lichee Pi 4A IO
 expansions
Message-ID: <al5otZoK9h1OQt--@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-6-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-6-zhengxingda@iscas.ac.cn>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, MoeLeak <i@leak.moe>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 03:45:15PM +0800, Icenowy Zheng wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Lichee Pi 4A has 3 I2C IO expansion chips onboard, connected to the
> I2C0/1/3 busses. The I2C1 one is already added to the device tree, but
> the I2C0/3 ones are not yet added.
> 
> Add device tree nodes for them.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [Icenowy: added commit description, enable SoC pull-up, remove I2C1 and
>  aliases]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>    

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
