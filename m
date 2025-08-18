Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6B1CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n69VTAG8/2RRXvA4PITUbXfhqYlwpsuG7kfFdfNtuTM=; b=eltkD8ITrdyf6p
	quaNDUD26uly85uyUHsrkBRwhP+otc6mlRvCgolTqHhKECdh2DEICtflDEsbCN+L/4QMZiqwuCZWb
	uo4JvzEGPRadU4NsdghK8tRbP04qO9ZonPGQxvoftfoSWtaaE27w/sOkSFjqBmz5gIvF8yqcFrqCA
	T4JJ50nly6gInB1XqNN9cuj4IBqAMl15oHQ58CB5IOD8c2HL9hgQDYVdOBnhxeax6HgW9nca5MSBD
	kxlgdeB06noLKvioJnR4DouvZNUt+qAZHJ2n9lbMJkFJrhsuhh1Opax4K7RBcdhU/mzgrnBnu+fL+
	XJYkBlgohz33Rlfmo3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuek-00000006q4d-3T8l;
	Mon, 18 Aug 2025 07:51:51 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuIB-00000006mnF-1Iv2
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 07:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755502088;
	bh=z3qb5MwrWKicSaliZRieeJW1O3PX8tC82J3tbg6iX8g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=s58Fwiy+AWs8KqAzInu/iV6TdS5dDbLXeJl4bgBHr8fIgDGIIe+QcAx8YMmXTcdtY
	 GdsJAqvvW3k+1yJpUPTzZ9Mr3kKaHZ83ChWfa2UF0m1P1czd4BNE5vOiPnWVK5dU+n
	 Z8NWWqCTBUOOHb4RkA3GCP3eMLHHS3bTNIjMFhlY=
X-QQ-mid: zesmtpsz9t1755502081t9c957051
X-QQ-Originating-IP: adgdB0r2YHeKNJFiNxSXKvVHIVI9sT9H4/Lqu6fnvoU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 15:27:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6329483696988879861
EX-QQ-RecipientCnt: 3
Date: Mon, 18 Aug 2025 15:27:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Jimmy Ho <jimmy.ho@sifive.com>, linux-riscv@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] sifive: fix using wrong load type
Message-ID: <DCACD670EB6DF876+aKLV_63OSOvH-VR3@LT-Guozexi>
References: <20250818061336.30173-1-jimmy.ho@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818061336.30173-1-jimmy.ho@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: ObRDf3flJ9WfJSa2XsjcXAnNhjNwajQ+/qBFmAthKMGfvAnWV9klgKbl
	mAVV0IA8Ufmrwx+ES2OwydazZsLeElJbRYLmxL5xzNxWUgn57BvMTN9G/iC8gLNBDSJ76Y7
	o1u75FTIK9QvPmXP+uF46boCjW5a+NDm2m/PoyqVD/1Cd24q8ehlGPFf8XPshvjaBg8z5/x
	I6iUUwVLfYzv5gdL2LSYw8pcCZE0tDvL709pLG3mYqKwqcjbV5M6jRCjFuAXHt05E7DtJro
	F06Vl7JFP24j1o0soAZG2F2sH/alutLETd22FtpOL/kobxp4A6c80yXruIa1jLu1rQuHMYc
	WDXyhewb+kIc6EMgvDlQGq8jFdQRO/9BmenEyBRPeSuH1WxvwzTE6zSpbhOJDOd73hSR+uJ
	rhnGIQD0H+aAXBXjybVr3Y4scQc1MMXFEt/OJqRjK2Jnp5JXoazxrXJW3/ZgulhSPdJXAyZ
	jlWXzrI3fuW0hEArgOK5wN0dKlCImywr2MxyKB3qV1qlCM/g1bW8D1KpgaQ8Z2Lmw2R6hLu
	/lT0GVhOdYmCUZQW8Lz/2WI3yyjyipEWbWv7zQNsvnK7PS0izY5ShQOoULxx7M+b6ltPs4T
	B8OIGr067OIb2S3Crb51AA+mi8cLthKKepNdSy5aHCQvO5+cjE0/ExvNC4SUIUG3v+WpuhX
	NQLLwc6D1p9ceQJGHVOBbxKQtzvhRWs83RXQvFIP0PXfT5yRvxy6zyNDA9x+anhOjBkKXrV
	wo+ADoFJQsZS3WV0nl9FxjE3Vkv2Pggko2vFDJHHomhi20YoUzjpdA0GxcT8dUqXHutoPBx
	pjMLhXCArsZZ9aYkZMHiAuS4f8Z8c4o0ntE3IGoGoawpTcIkWwIlLIUEebCVEF7aqm1EP7L
	VseB6Wp9QcOmuczTcFKKpbugxtJt541UC57zd3nEcQ/0VI5jHC37zmiRTaCnjSZtCQW8SPR
	eta9U9yTSe0FbmBOT10qoxm4TKOG9JYCETjj+8kDzIFzYHueuNDLFaEZGIEnVwI295Q66AG
	scUvD9VJeyTZcurev7i82PztKbA03Xcphe2kU+jQlpBJ2E1KCcC6RDGPXCGaIQPH8c/LHa5
	iHXPcZrjMp0
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_002832_067945_95CB8420 
X-CRM114-Status: GOOD (  15.35  )
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

On Mon, Aug 18, 2025 at 02:13:36PM +0800, Jimmy Ho wrote:
> thread_info.cpu field is 32 bits wide,
> but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> 
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> ---
>  arch/riscv/kernel/entry.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3a0ec6fd5956..ed493cd3dc35 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -46,7 +46,7 @@
>  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
>  	 * a1 = BIT_MASK(cpu)
>  	 */
> -	REG_L 	a2, TASK_TI_CPU(tp)
> +	lw a2, TASK_TI_CPU(tp)
We better add a comment to explain why use lw instead of REG_L.

                - Troy
>  	/*
>  	 * Compute the new_vmalloc element position:
>  	 * (cpu / 64) * 8 = (cpu >> 6) << 3
> -- 
> 2.39.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
