Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1269EC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 09:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6DB20673
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 09:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejzaZm8S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="O+sP4P2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6DB20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5agwxMx4FsL2fBJ+RZhBM1MigtUq75KCDjvdDRMmNg=; b=ejzaZm8SLcAYJ4
	/5Ny7hsW+DW1RVZA/xUaApgTwU20l3uAC5zx6rngH5d8f02u7VRgam2bv0e+uvUvHatsfESGrKRi7
	pCdBt7X5zsVJ0+m3GxaOIMpBR6yxhJ6Gzz9KUW81WYrUgee4y450f9gVgXUgwa3p0mdmSUFAyrQoD
	x9+fL2qCNpsWiDyOXv1C7rsnCvgjBKGWF+C+zZc5Ed01PygzZJbQMrobgPC9WtGewxv6aAxIUNpMo
	Y9x6q6mHVEIEidMICh83/e9jxjaO6SrHV+qUFK29wa6XqoFb8SR5bY03TRG8aGnt4njfvkhOFMmwQ
	MwhBnC3SnaXieHShlVPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heFQR-0002sw-6C; Fri, 21 Jun 2019 09:01:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heFQO-0002sP-EQ
 for linux-riscv@lists.infradead.org; Fri, 21 Jun 2019 09:01:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id m3so5800635wrv.2
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 02:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PhJ5lM9SlnKYa02k5MazR2be+0vjCQ5zI7j0EPBUS+8=;
 b=O+sP4P2dWSo99F+WM+aneeiKuNCkGrHe0jBV/hU1Wk+iZFjbunHTPxPqH5idH8e8EJ
 HDbIrEdt+maab64kQ+MXFytkNwk0t7QJxiXrpMXe4YyDS5+FOUeiH2NFPqHKTd4ZI/X+
 KhkJHMUD4JBbhLUNqpjzSOR+6iEjHZAbgkOg/NxfBaBC6GbGYVcFTz2FFHlEXeqkZtKh
 WGCwa30qut6W2U0M5dhJzttoIJQcKNRwHn5UMpGxA/fQ1Kp2Eqiuz8HyKnj08ZIUM+HF
 dJKz/LliHBOw4iz8Y13dCH1V2yMgHecTVxviU0bPYTLgKb/T5AuXb9ZGQ6jYQN5n/DRs
 4phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PhJ5lM9SlnKYa02k5MazR2be+0vjCQ5zI7j0EPBUS+8=;
 b=k3QITj90kD8R81TdTRfpsybQeu21CY7jalc/07Y9H5wXX00IAl+M+7twlpSOM3DgMC
 l87GRe8bzyJydQsnyJNPJvtbLkHaOa0lo9upKMIw1Dfqlc0ZTcdvaZsWCp3PCjiVBQot
 wu8V5M1PvdHMSr0OfhnEZ0mUNFvL9cFxz8dbs4hW6PAkczpwAGaWKxxTx0S/3OVz30J9
 ea+CBGYLP4Lj8d4HvwNGHHe2RxSdVaccXF8Ie4pk73Pi6OEJGK00+PE1+czMWCD5BIxE
 /GVtUyTWwYkb7UqVzQD/Bg7FgSgNnWygZpuMhTDHQ5XFuGXbqvduK1sl3gcizYTngJT9
 APew==
X-Gm-Message-State: APjAAAVMZmOBJ1wA3ByECC+xcN+sZA0Lwe/QNo3Imj69atU/j1cfr2hE
 CUDaq37Fm1GnJ6s+sXVp4J8gxkkti741z4Z+VbJTYA==
X-Google-Smtp-Source: APXvYqxOi1lX0UaV5+3I6iUfGLV2BrlPD7WGGLosyqcwBAr5aiHi9gL+td/S/5IwQmge5WwTR7sXISD2kIFnl5hxOX0=
X-Received: by 2002:a5d:5448:: with SMTP id w8mr62546020wrv.180.1561107693128; 
 Fri, 21 Jun 2019 02:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <1561097422-25130-1-git-send-email-yash.shah@sifive.com>
 <1561097422-25130-2-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1561097422-25130-2-git-send-email-yash.shah@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Jun 2019 14:31:22 +0530
Message-ID: <CAAhSdy2zHozRnwAU6-+U+BE-5h5uNE67D_0TXHJnrHMi53gMog@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_020136_518076_B8345F52 
X-CRM114-Status: GOOD (  12.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 sachin.ghadi@sifive.com, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 21, 2019 at 11:40 AM Yash Shah <yash.shah@sifive.com> wrote:
>
> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 4e8fbde..584e737 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -225,5 +225,25 @@
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                 };
> +               eth0: ethernet@10090000 {
> +                       compatible = "sifive,fu540-macb";
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <53>;
> +                       reg = <0x0 0x10090000 0x0 0x2000
> +                              0x0 0x100a0000 0x0 0x1000>;
> +                       reg-names = "control";
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       phy-mode = "gmii";
> +                       phy-handle = <&phy1>;
> +                       clock-names = "pclk", "hclk";
> +                       clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> +                                <&prci PRCI_CLK_GEMGXLPLL>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

Have status = "disabled"; here and have
status = "okay" in board DTS file.

General convention for any SOC device with external
connection (e.g. ethernet, SPI, SDHC, SATA, PCI, etc)
is:

1. Define only device DT node in SOC DTSi file with
status = "disabled"
2. Enable device in Board DTS file with
status = "okay"
3. Define PHY or external PIN connection details
in Board DTS file

> +                       phy1: ethernet-phy@0 {
> +                               reg = <0>;
> +                       };

The PHY DT node should be in Board DTS file.

Of course, same comments apply to SPI DT nodes as well
but I missed reviewing those DT nodes. You can send separate
DT patch to re-organize SPI DT nodes.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
