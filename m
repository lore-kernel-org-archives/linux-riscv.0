Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAFECD5BD1
	for <linux-riscv@archiver.kernel.org>; Sun, 31 May 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3BAR6+NHoYBVKTKoGihCKE2v/pkR3F9weIIBQKDXzU=; b=s1z0SLvjnCxcQx
	TP1JBqy2rQ3LdcEq+d35xSs5GaVOvsECTd7r0W2D/LCHwep5h1DaK416zSN+hFlamVgX3fPQYnTG3
	SzPCA7XOIrDJL4l6WppOslvyFGfiFSO/kMQeEBUa8vVdUZbwVddmlasurMKTpHzvSzeOblDEc0Pa3
	nQuXCn4juoxVudYsVFB93jThrzGUNc9aLEkDamyvhSvBhsmM/MKejWQiMgCbfd9qg6X098o+dYSW/
	2dtf5XBIVBeZP1bH9fv8T4C8ibt6EaGjPBHFknwViEJGUB0bwqVvGAgq+RFYDUVz/SDNWCejHWetG
	gossQzWMFHLjJqWkNMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfJf-00000009abr-0Q06;
	Sun, 31 May 2026 12:30:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfJc-00000009abK-1MDs
	for linux-riscv@lists.infradead.org;
	Sun, 31 May 2026 12:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F061B41952;
	Sun, 31 May 2026 12:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719511F00893;
	Sun, 31 May 2026 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780230651;
	bh=d1uPcikU+0mzVs3WcJOLd986su5Z+aCvm53jpWQgBL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SjOUfy3oyAA5iarNpcErwA6I7fQ9bLtYsQUXtvx6be0GcfGUUbF26dxN4q4r9XZA8
	 E+HIcyVInLZZ+0vJh6Ghgsgl+8MQtbHOXB5kjR96FTP9OHK22tnSDExNZDc9Z1mPT8
	 V2zUiTXugUUL/P+p5w4pDC42mJDOfeQy0KmHFABTY5eT1hHZX1rYZkOdEedPiz+5TE
	 xKQkNNvPS46eDDVy5xoQ9cSg9LwfdRcvWutflnzz/DhXqL2DPYtYRUjklEn6fmOccb
	 FzDKN2Zmchd9BSgHniCXVMe2Q9JYtNP6gYX8iecYLKkHJC6nriHuSgbaUgI4k1CpYV
	 OnTyn28NntMqQ==
Date: Sun, 31 May 2026 14:30:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 3/5] dt-bindings: soc: sophgo: add sg2000 plic
 and clint documentation
Message-ID: <20260531-fair-coati-of-attack-ac59b7@quoll>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-4-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-4-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_053052_377450_0F15206D 
X-CRM114-Status: UNSURE (   8.15  )
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

On Sat, May 30, 2026 at 01:33:45PM -0400, Joshua Milas wrote:
> Document the compatible strings for the sg2000 interrupt
> controller and timer.
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
