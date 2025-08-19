Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562E2CA0EF5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 02:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wb72iFa0mqN+6+QTsuHGyGWjDb4l7zUEQcPUjDFtpE=; b=u5oohKRFDQK5Wp
	naEQVORZ5mJNlxa/CkJY2y4VorCx6/TenrtKTTOuZfsS7Glr1osOkhuFpSlLG20K7LAdIWb8O1WLV
	iPVaw6bd4FkkUAjFpTpZ/VSRHCCZ3+NJLdHw7FULTEoek9WYYDp9widMAe5XnwyQGXzPKokhxaEwK
	+NqRiJNIoa7zdWdZMfTrAQVwX7SYRz2oQIV2GY9KI8Gen/nlRnNLnsKr0AlhNYN9XvGCKGGpYR1HW
	0bsjaztreix5oUW2PVixOm7bWd/rdP7L0RdpOsoRCm6Agbv4WrVNr+4BW3Cj4jj5L4aGF+GCQtfyN
	rd4B8qxVAdziG2mPgHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoC4d-00000009CTq-3qc5;
	Tue, 19 Aug 2025 02:27:43 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoC4a-00000009CSO-0rHs
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 02:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755570438;
	bh=dks+CMmYVtapyb9MeMeQJDrb41DKjzDiQ+nRTvDWNr8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=NctxkUP8w0uuCzd07n1sL7CskdHk9Ohbgfsx3SWyrew6HTWkh81b5xd8x6c7hOVyx
	 MJfAjIT9ZIsS6j+V12rqeG/TouCV8tFbNB/Gliyk2jXUlMgzwOgCr/MgB1wtVrosSs
	 ZMxxbToUIxiE/tD/XYvrAYV49+McKNFhJquEP38c=
X-QQ-mid: esmtpgz15t1755570433t5bae6159
X-QQ-Originating-IP: DuEr08kmrqmluKmx3DvQ4TyekXMJJhFTMiL03tBEGDI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 10:27:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1763745132820180299
EX-QQ-RecipientCnt: 3
Date: Tue, 19 Aug 2025 10:27:12 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jimmy Ho <jimmy.ho@sifive.com>, linux-riscv@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com
Subject: Re: [PATCH v2] riscv: fix using wrong load type
Message-ID: <757D0C00B4904597+aKPhAOEu22fsD2ta@LT-Guozexi>
References: <20250819021931.31935-1-jimmy.ho@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819021931.31935-1-jimmy.ho@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OQyZCLmtEz7nPAYI5eysVOiSVJXY/HTULWQ2et4uMA6XChFqOsDpYdg3
	IkvzWoo9kAD8BVk0Rx/0C60NvGYt9yL6a+nZmsxiH97MXEg9R8Qjl+NvkqngU/WkGWcdlH0
	tBIum5XzLGzAx0hHk9Y7zV9WeJXj8W6KUMU8cgtLPmnqGcWWE4uFeAJXkq1yeD/2zA9puUx
	BT147Dsl12dg4nUg7tpOhK0DdmSRCeT/m/6s7eZwX+khPfcngP+LtI8GLbdHW3njKbVMZRh
	c1aZnudKTvWyt6+OEaB070VBU2ujh3CRlcqI7t++EnUPoPwFQ7Ti7Ol02bHGtYY8q4qMELJ
	fnKXBzcy6ofZESL58QgZOJCDc0sDc55JZnkGF+nIsFbXSo+VVguu/WOVhotPbjcccFs9oB1
	P10Fki1oN+iyS+S6wDbs5TiiGFE7OSNKGDg6zm2GvTeL3auZXgwBQnkDRIz0/17UzV69EHq
	91whClt22ENvTaZSxWJNw4QDt5V5RE7wz1GP4P1L1JqCnBzylfYKq8wNraI2zCYkD/4SkUv
	tP7868IyBWcNoDnBdFlG86RU+6rij4+a03KLm0D7XW0nnIA+B1Jt0FiOHvh0dgBzsFLnKa5
	0XcfptGwH3Alv3gP+0fozXIWMD8BD3PPMwS7Tf04OMdRlvVuGytwOjJKFJcj151hOn7w9jQ
	PknyG1P8/RqME9WzzqaJkwI6bto8QEno5pgfLkjak3FASUOsmSE4OfzHAt8IS2L5O/LI7r+
	NgmrtJzkKekcnhr2Z0bVdxNWxnGH/9GtnU0Ub7nrETHN9mwhcM1h0D4VTqfysBO4Go/rQVR
	Ew/4LY3vL4A7mzFTbTwgH+bfNPZKYzJqSJxQnFSpzwbvelfkQx+qpZkdsdbUrhBsBsypnIl
	M2mVOhf3LDim88mRHHaq9fWSqsOzei2+kYpZ8lgtF2SZRaLBIA+aT6pcb/RcCnMJQtg5onI
	sDBw/GKCVRP4pVoHqPQwNaUMx+tAEcrTMbKQpFCvY9EEqR6fnRDH6KRPAodcapOLAntXx8L
	3vyQmokYP+HFDet2XUP/apY2X3kLB7WM6zM7eaw/cGVvexGJLEI3zNBCXnrBWJWl40NkqEJ
	7uh0bV4AEqefFX0F/tv+vD6GcAHlq7wqg==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_192740_936579_1EBB4316 
X-CRM114-Status: GOOD (  15.52  )
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

On Tue, Aug 19, 2025 at 10:19:31AM +0800, Jimmy Ho wrote:
> thread_info.cpu field is 32 bits wide,
> but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> 
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
Hi Jimmy,

Some email addresses seem to be missing?

Best regards,
Troy
> 
> Changes in v2:
> - add a comment to explain why use lw instead of REG_L.
> - correct commit message
> ---
>  arch/riscv/kernel/entry.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3a0ec6fd5956..82306cecfdcb 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -45,8 +45,10 @@
>  	 * Computes:
>  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
>  	 * a1 = BIT_MASK(cpu)
> +	 * 
> +	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
>  	 */
> -	REG_L 	a2, TASK_TI_CPU(tp)
> +	lw a2, TASK_TI_CPU(tp)
>  	/*
>  	 * Compute the new_vmalloc element position:
>  	 * (cpu / 64) * 8 = (cpu >> 6) << 3
> -- 
> 2.39.3
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
