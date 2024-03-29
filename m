Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50001C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U4ZbAc3cR66hfzyRtKbydsiyAi1mdGxusF1J20lQK8=; b=vpx9WnNWIRzZ5E
	dx4zzoOJiQaaIoccgXt2o1+8mZHAiSzbZayfqqzex9W83DLb1V+jsVfMsWRvRSH4VcDKGVQ0IJpN6
	ObYYrZrAib1VA2nurFkdMB/BkDq07uBekQI5k38Rk7rDgGZAsO9WTfFCRGvOJsflHDUkNOOoXVHog
	WQkWClsbjxestMeMx5pXec6/vX9k/Xoty/nAtQfF56gcOuarwi9deNnHRH/rrSU7Pv7+QbcUfwF8q
	unPreVD8/1wUbHtx7QEwaGaSrPRzIDoNoJ4+QlqOhgBLpfJea/NfEpVsXmvfvAEhbQSIgESRefYd6
	DWrID+2JOfd9CdKAtiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBJ0-00000000JzF-2CR1;
	Fri, 29 Mar 2024 12:25:58 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBIw-00000000Jxb-3TB4
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 12:25:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90D8B240005;
	Fri, 29 Mar 2024 12:25:49 +0000 (UTC)
Message-ID: <38be1ab1-a080-4d89-a9c6-9837f7fad4ec@ghiti.fr>
Date: Fri, 29 Mar 2024 13:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] Update the size of auxv to respect the new
 constant added in e92f469b0771e6db9688a58c0e34a8342da6a6bc
Content-Language: en-US
To: victor@torrio.net, linux-riscv@lists.infradead.org
Cc: Victor Isaev <isv@google.com>, Ivan Komarov <ivan.komarov@dfyz.info>
References: <20240102133617.3649-1-victor@torrio.net>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240102133617.3649-1-victor@torrio.net>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_052555_461259_2642853C 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Victor,

On 02/01/2024 14:36, victor@torrio.net wrote:
> From: Victor Isaev <isv@google.com>
>
> Commit e92f469b0771 ("riscv: signal: Report signal frame size to
> userspace via auxv") has added a new constant AT_MINSIGSTKSZ but
> failed to increment the size of auxv, keeping AT_VECTOR_SIZE_ARCH
> at 9.
> This fix correctly increments AT_VECTOR_SIZE_ARCH to 10, following
> the approach in the commit 94b07c1f8c39 ("arm64: signal: Report
> signal frame size to userspace via auxv")
>
> Reported-by: Ivan Komarov <ivan.komarov@dfyz.info>
> Closes: https://lore.kernel.org/linux-riscv/CY3Z02NYV1C4.11BLB9PLVW9G1@fedora/
> Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to userspace via auxv")
> Signed-off-by: Victor Isaev <isv@google.com>
>
> ---
>   arch/riscv/include/uapi/asm/auxvec.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
> index 10aaa83db89e..95050ebe9ad0 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -34,7 +34,7 @@
>   #define AT_L3_CACHEGEOMETRY	47
>   
>   /* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH	9
> +#define AT_VECTOR_SIZE_ARCH	10
>   #define AT_MINSIGSTKSZ		51
>   
>   #endif /* _UAPI_ASM_RISCV_AUXVEC_H */


So we discussed this patch in the last Patchwork meeting, and it needs 
to be merged as it is a valid fix. But, the subject is wrong and then 
the patch can't be merged as-is, can you respin another version with the 
following subject please:

riscv: Fix the number of arch-specific auxiliary vectors

Or something that best suits you. No pressure, but if you don't, I'll 
respin myself a new version keeping your SoB of course.

Last thing, you can add the following:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
