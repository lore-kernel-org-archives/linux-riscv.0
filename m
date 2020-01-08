Return-Path: <SRS0=NAtM=25=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB97CC00523
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2020 03:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803732075A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2020 03:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQ49z1il";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="coiwODIR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 803732075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ySbkX+4r5a6zzWgSuzqB+vjv/GamaAVWkn0vznIPTa4=; b=nQ49z1il/wc12dscadXSDRAI2
	2gzeD3fqUxzYaD05EQ7+ZefOGGFoYc4Jpd17vHNh4vCdkaja2a+8Yg3X4vwIon/2MgxQHwneev2Ia
	WBxHFyn/rD6T51njZBFAFAlPc7/xGT858FB0P5xPKiMuQ/hJoF9pScvUm/AoNt55BPAPo6pJhqxH9
	Gu6DON8jfUAFF5vk1Ihsdha/qmKtVE3W79UjUu5jGZHOZuhFrcDuD1Rb2561FXxV8Z63Ui7rW1Fay
	yhdG6KKy7UYMv/NaTdDNAZkMfEqXC1Wg7d+zFjnM+owOnQDplkezg+mCym2VFaIjBDqh6n+2LkkAa
	K1E4Iwn1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip29Q-0001ZO-JX; Wed, 08 Jan 2020 03:36:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip29M-0001Yt-V3
 for linux-riscv@lists.infradead.org; Wed, 08 Jan 2020 03:36:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id g17so1846498wro.2
 for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2020 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySbkX+4r5a6zzWgSuzqB+vjv/GamaAVWkn0vznIPTa4=;
 b=coiwODIRqSIDkJCbI5ezwrW7yd5BZTJJju0W/SVfgKIapZG5FEoUrpHuV89f9c8UVL
 vzjVJCnAa4hhXxBnHmvVUsgyk9NxiTdBpuJykKNSNawkAa1WbF9a7XlUSziREksjZnDv
 PHcnwBktmROK/gtIkV8Rw9FgkNXn6GnwwJ3b3M+4HHlOS/5ZZI0tZK1eCXLD0TSWt2vX
 7xSnBO1VuPi+pQz9peXHYrkcndjxykktnFdkFecKIY9DUjSj6mn7GIbYY7uCnG0yz+xW
 E3q8chVkBY1R5CXRreYWmMMkJKhx+xPtmHOxvarMxHaSus/OS8uqgct3RFkGgrFkp+ox
 n0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySbkX+4r5a6zzWgSuzqB+vjv/GamaAVWkn0vznIPTa4=;
 b=A3EH0ffjZqj8c0Tg06wjs+RfiRZei8iEm7v1yezw5QcW74RlHxnpwWhBlIeYv2plpZ
 N4Xca2fKIA0qM42bc9J4ZAmcAW3MTtulifva36411MSBltPuq8T7lGcnvn+WVa7iLprL
 x9oVNTz3nPl43DGa0vOvamC2vAzJrJ8wQvBOWYW4yIRvYW9ySGC8n4LMspS6EUYnNNlc
 6b7GHNqzm6qHEy+hx8Mt69p4hEo0PlK7TyeI76kfdFSJcuktapmPGjC8krBA/HIBrOmh
 Rb6KqPFifzT5mJX/DiutmNMjlfEJ55nleOqQUSfmD7jguCDxHvs8Ic+qQp1y4pLk728I
 ckhA==
X-Gm-Message-State: APjAAAUnWovGR42yYmV3qGnHMBOTYzcSuir3q0nsb5iIDaqAAbbfoxUS
 RAeqMFqv4779pFLIuPwovnrE5spzXTLQ5XCy1krftA==
X-Google-Smtp-Source: APXvYqyMYPh12V0kzjDt4WN4m4Lgpd4h24RikS83ZEMRJAjaizKqsZyTpaR8f8EHKyh5AmcWRtjPh47xhNpKbRhBxy8=
X-Received: by 2002:adf:d850:: with SMTP id k16mr1938797wrl.96.1578454610421; 
 Tue, 07 Jan 2020 19:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20200108024035.17524-1-greentime.hu@sifive.com>
In-Reply-To: <20200108024035.17524-1-greentime.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Jan 2020 09:06:38 +0530
Message-ID: <CAAhSdy1LBo4QOCGBbCG8HxaK9Q8MWtx-istBn_5btkhaQPi3FA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: to make sure the cores in .Lsecondary_park
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_193653_061029_C68200D3 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime@kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2020 at 8:10 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> The code in secondary_park is currently placed in the .init section.  The
> kernel reclaims and clears this code when it finishes booting.  That
> causes the cores parked in it to go to somewhere unpredictable, so we
> move this function out of init to make sure the cores stay looping there.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/kernel/head.S | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index f8f996916c5b..276b98f9d0bd 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -217,11 +217,6 @@ relocate:
>         tail smp_callin
>  #endif
>
> -.align 2
> -.Lsecondary_park:
> -       /* We lack SMP support or have too many harts, so park this hart */
> -       wfi
> -       j .Lsecondary_park
>  END(_start)
>
>  #ifdef CONFIG_RISCV_M_MODE
> @@ -303,6 +298,13 @@ ENTRY(reset_regs)
>  END(reset_regs)
>  #endif /* CONFIG_RISCV_M_MODE */
>
> +.section ".text", "ax",@progbits
> +.align 2
> +.Lsecondary_park:
> +       /* We lack SMP support or have too many harts, so park this hart */
> +       wfi
> +       j .Lsecondary_park
> +
>  __PAGE_ALIGNED_BSS
>         /* Empty zero page */
>         .balign PAGE_SIZE
> --
> 2.17.1
>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

