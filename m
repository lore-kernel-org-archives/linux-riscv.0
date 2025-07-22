Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A8C83F34
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5CthKvsBjqKvhlR/Nyw9uxJXOYYuvOST1wAY9blMHQ=; b=l+7wb4m59V25lN
	bNWzHc9SgL0cLh4xrciKx0Xmqxa4A43/Iw94UnrxWWmNrZtd5e+wKnmaZeLFlcatS/45Nx3gvIrqT
	VnGBmAZ9o8oeWfysH3+Scmn3Dh/c9fp1EWOsNGiGmgc714KBOTjs+q56LW71eLMuvpvDlxIRV6iW5
	AKaQItwVDzmXishYQaIXON3txHnvKyy+EA1vU7u+FyPjTIg4+v5Wcson6j34WQMnOJspSCicWn0b0
	aHAjqyYEdgYZ22YWYJNDzxXpAhlHwbKu+6PR/yMwB9T7/RvmrqSPujH83Ucha1BGedkeZNinqIyWO
	Rp0AinOO8s0jzm7DXnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Vn-00000001fzq-3OQI;
	Tue, 22 Jul 2025 07:34:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Su-00000001eyW-36ob
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 07:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 407E45C063B;
	Tue, 22 Jul 2025 07:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50561C4CEEB;
	Tue, 22 Jul 2025 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169467;
	bh=FnmXk3RGYRkdTKxHf3IUZF8SVbHutxuKbL79UvPE+0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbAkzTvgU9Y38FaD7bQ9BoIoTqBhDgU0/qAy1iwUpPxXqSPkEDDoPZtzuuMTFSMfR
	 X4TUvrqpKx6TxEBZX1xm7Q4nGbIBMy6atkG5zgFu7PTVCtO+zL4V0moIa8SskDrNkf
	 R+CJ45DZAi9ninTDRR1Y+4OG08Pvdglr6OTOGW6ZrWiXAi8siZZ4KM5U4KCgkqPYm4
	 XmJO2dK9t6q0x8IK5WY9htMXKfpUaITOEkkstDzVjkLrGYXQtmn/xyv9H3W3cwpqrO
	 6Xraa/U/es4jsHY6/zsmhEGvaZWL7QxTdnulKeHGQ5i05W9gcEZ3MYmRY4gf0jRLL3
	 mjjg6XUqu/zEg==
Date: Tue, 22 Jul 2025 09:31:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 09/10] riscv: dts: anlogic: Add Milianke MLKPAI FS01
 board
Message-ID: <20250722-proud-polar-mink-12caa8@kuoka>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-9-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-dr1v90-basic-dt-v1-9-5740c5199c47@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_003108_821313_3053B23C 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, Jul 21, 2025 at 11:46:15PM +0800, Junhui Liu wrote:
> Add support for the Milianke MLKPAI FS01 board based on the Anlogic
> DR1V90 SoC. The board features 512MB of onboard memory, with the region
> after 0x1fe00000 reserved for OpenSBI.
> 
> Currently, the board can boot to a console via UART1, which is connected
> to the onboard serial chip and routed to the Type-C interface.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/Makefile                       |  1 +
>  arch/riscv/boot/dts/anlogic/Makefile               |  2 ++
>  arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts | 28 ++++++++++++++++++++++
>  3 files changed, 31 insertions(+)

You need maintainers entry for your entire sub-arch. Otherwise why would
we want unmaintained code?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
