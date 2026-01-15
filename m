Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB74D4661E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gnff8f8PUM83V6cjVofZ78rKFDGdpP5RRn6wXHiWypM=; b=Ristd9Magy2s4P
	fp5+6NQptUzQPZ9DIfw29dUeysFWVajjqggU/WLd76ir9y2xikgo7SquAREek8yHPjpfLv/LN6oqB
	znCgAt4rkeB6khb/roS5z3/QHWdfnYuE8eGQJkgzGroSNxVSjKfiD3Quaww8XUBY6IemKBJqPHHXb
	QV5nysz1FbvVTDPdWjdcYBWeQWCvcCo0AUqFRGHToybQz+PZ6W7Oq4o2CgmWUHOekVVbnPa6Pcqw6
	Df/sf3dwGRyfFj2Rj99wvW5tTt0LkRp9GJSwQdqQiRp/BCdUAoKORyQJtrSjyOCt04sKvurJ3rPeo
	Up/y06tjisj0T5KoCujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTZG-0000000D758-1UW6;
	Thu, 15 Jan 2026 20:03:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTZE-0000000D74q-2fCs;
	Thu, 15 Jan 2026 20:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AA8760130;
	Thu, 15 Jan 2026 20:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172D2C116D0;
	Thu, 15 Jan 2026 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768507419;
	bh=j0KMSJRPUjr0OGr37u5/m98sK59dQ45lZHv+bXjm7mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrTC0jBHSmn8QGKzqMX8HTO4kXIUNriQQwBPluePdsYnmgqz2sotFCffJGTzS+xcZ
	 mrj1zD7uV9XIDRVGtq1CXXlTtKz0zu4H+YDfiDCxp8AQWbS6fQY3B+MKnQvv+lS1hi
	 4HRBMAt3fPwlMOSxY4J8dqXTgNyX8cQCPFUAdiZS/jPdle+sx9Sp3GUnZCFi9UsWV5
	 rEKhpfwuNywvLmfEEXl4kb1d9XRhfCXlNujxVJ7kbLu1IL1J/uGjpUW9C0XtNMPaD2
	 vRIU2977NPMb48Ct3kGIyHEVwlq17Wy9Ipg4ZqpEuk/qnNIrz3KzpVQC84+ABHY86a
	 G9B6KF4lKkOog==
Date: Thu, 15 Jan 2026 14:03:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, TroyMitchell988@gmail.com,
	linux-usb@vger.kernel.org, conor@kernel.org, kingxukai@zohomail.com,
	linux-riscv@lists.infradead.org, alex@ghiti.fr, pjw@kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	gaohan@iscas.ac.cn, cyy@cyyself.name, gregkh@linuxfoundation.org,
	linux-phy@lists.infradead.org, aou@eecs.berkeley.edu,
	neil.armstrong@linaro.org, conor+dt@kernel.org, palmer@dabbelt.com,
	18771902331@163.com
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: Add Canaan K230 USB PHY
Message-ID: <176850741658.1095207.11658679131593700073.robh@kernel.org>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115064223.21926-2-jiayu.riscv@isrc.iscas.ac.cn>
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


On Thu, 15 Jan 2026 14:42:19 +0800, Jiayu Du wrote:
> K230 SoC USB PHY requires configuring registers for control and
> configuration. Add USB phy bindings for K230 SoC.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../bindings/phy/canaan,k230-usb-phy.yaml     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
