Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEA4C2D0D1
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3n1/jSFkV4/0Pd7R6NDutVIBiUiHJohfxTymzMi4moI=; b=dc5CVHzWVkZnWc
	1HMLKxecdOok1AQ7XFuFR0Q6qI68xwEMbTTzT5/wPpJGX2MeclOD/mCAogq8h1ez3q+ReIipAQChM
	QYuKzQ1gOuW7mbK9jKfGczPpZPHOIntNoXWLnGC8LIOU8KAKPMHiHArhsrh2Oyd/oy/5MSfeCPU5j
	Qi9sQUym6Gs6tButpQaHfyeEgaAHNQEswRNMTILKlDQd035dUt0C/tkTKRiZlJG8aMg1AJpE2Q8r7
	dOiHHN5CCt/Xs33GhC6MVuiqpvo1ljPI3t6QofD77PElYVTk+fpZlW7hY0/5Zs14LhwsQT+ZHXXkV
	ETDEjvT6chbUM5chKfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqFN-00000000ZG1-3fEf;
	Mon, 24 Jun 2024 20:25:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqFK-00000000ZDb-3dNs
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 20:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D602610A5;
	Mon, 24 Jun 2024 20:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F59C32781;
	Mon, 24 Jun 2024 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719260700;
	bh=1LlVpG91dCauwKR+1U2omHxHfo85V5EN8OuH9YnYOUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAwocCHDYAJ4QE5ItFkJ0saC3DnMWCURC3KjDEwDoOi7noHtcUOU9KpikCNa5R/9G
	 2/eIaULQzI+skNPUBpsgxeegX0/kVJLYkW/FjembKY0eu3eaDqkJ/8O7mTsIMar1UD
	 4HbJyeyTcFtpb3iqGqlpGc+f9WdAmd0f+DUDu0MDdIUpcP04yeg3FvGuPBg52gK7x3
	 6zOiTKT7SABgUO/EQkmI9uKj9kK2CR/y5r1Gor8yegifYKc4bReTOuOf7yhi7SrgKV
	 F5e4wTvoMKsy6AZka1GVLb1foOjyn8m5OypAgbdFZGtTAeOuI2Q2zTnlREesErJC38
	 mOWzu1QrOo1tg==
Date: Mon, 24 Jun 2024 14:24:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org, kanakshilledar111@protonmail.com,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RESEND v4 2/2] dt-bindings: riscv: cpus: add ref to
 interrupt-controller
Message-ID: <171926069663.349368.14347809571943198470.robh@kernel.org>
References: <20240615021507.122035-1-kanakshilledar@gmail.com>
 <20240615021507.122035-3-kanakshilledar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615021507.122035-3-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_132503_204973_DB3C26FB 
X-CRM114-Status: UNSURE (   9.81  )
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


On Sat, 15 Jun 2024 07:45:04 +0530, Kanak Shilledar wrote:
> removed the redundant properties for interrupt-controller
> and provide reference to the riscv,cpu-intc.yaml which defines
> the interrupt-controller. making the properties for riscv
> interrupt-controller at a central place.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
> Changes in v4:
> - Change DCO email to @gmail.com
> Changes in v3:
> - No change.
> - Rolling out as RESEND.
> Changes in v2:
> - Fix warning of `type` is a required property during `make
> dt_bindings_check`.
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 21 +------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 

Applied, thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
