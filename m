Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46923CD4851
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 02:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhhGgJf4akFJ/0eV08rdSlliKDJx+NrXKQOQJNa017A=; b=QLd6LzomycVJUk
	fw1pWbN1/+VuqizZEcwdEGgSjTsK4Oz4VQTBul5VU1fbaNskQeO0bw8vjfVA/Jy6uajUvT7OEqG2G
	uk5wSCNuyQcjdhcZtX5H4FZs2qKjpij6fuLh/qfZ/y1KAS4X3gtFkrevh0ek2tIZDStK5/z9O/AsR
	plTYkAPZjIEmWK0QSw9cdrlQNq8akTN1dEqaWpGY4z3D6JEcWMuTe3zg6d5HG14hHAz4CEY8CAaip
	aE3/KjuSVCpup1QYJm86onHISlawtKO6BJjwK39hFNA+gyhpaQcizJBzc3xnELXiyrerah9xiZts6
	qSA7NWyCGyrmS3P72ZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO4Qz-00000009vhh-10DV;
	Sat, 16 May 2026 02:07:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO4Qw-00000009vh4-04ko
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 02:07:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 499E540864;
	Sat, 16 May 2026 02:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B8FC2BCB0;
	Sat, 16 May 2026 02:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778897235;
	bh=iqCIplJrqfaiHknlrsPCYdWY6TiMpIdZBid5zJCNkGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFuKdFAACaO2gG2mF0pAsPqW+U5ygN31EDpTvZADccBwfqZ5b1uYXD+79dj3KBecc
	 2x5+81wsmC1ULUYJz5AlMv0NIvq9rph5/yuzVUR+T6KePKGnRZYI+R1cxe3br2nT32
	 n/Yf+45tJcxol25prBdxczVb0J2L852cu+KS+rNElUk0YSDc4aJL1KLoIzTODETI35
	 OSCcEncLwgm38tB/no0wCVLd6ib7Lj8ARq/JXNhluhMyLR/btdczu61RW3jWQoOPuM
	 cizul79Ox73ddRKnMZjzYfROLAmNAmYgfRtfN8aUHKc5F2Dl5OHRuHZfMos8ClZKZb
	 QjNUkgUxlU9Aw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: Add USB2.0 support
Date: Sat, 16 May 2026 02:07:08 +0000
Message-ID: <177889719089.2290560.15121464517928343972.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
References: <20260330-02-k3-usb20-dts-v2-1-46af262fb4a9@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_190718_078557_36FB4ADC 
X-CRM114-Status: UNSURE (   6.85  )
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


On Mon, 30 Mar 2026 22:15:21 +0000, Yixun Lan wrote:
> There is one USB2.0 host in K3 SoC which use DWC3 IP but only provide
> USB2.0 functionality, and with only one USB2 PHY connected.
> 
> The USB2.0 controller on Pico-ITX board connects to a Terminus FE1.1 Hub
> which fully USB2.0 protocol compliant and provides 4 ports.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: k3: Add USB2.0 support
      https://github.com/spacemit-com/linux/commit/d3bd58f3060f28ecd30df51925a9b1f62e5e8c9b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
