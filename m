Return-Path: <SRS0=puBH=OF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF57C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 14:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4440160EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 14:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4440160EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERpR4EY7j9jbbtHJmeXxp4wiC+5+8jI6X4GtRiH9MBc=; b=LuBzXMO7eFgaRd
	bfQxuK50d6Bszr+bbKIyYyoR2ZW1v5c7iXOyJUHf7/SzoPm+zXWDjLiauns4Nmc3FJyC5QC59x1Cd
	U5rL2/eLmP8mFfVIhMDk9ZECjOQzT+eQ7gNJ62sOh/1QQYxSkNnBhhmbLwFZAcLsMSR12miurDYL7
	csHjiqzH5Aht84lgVtKQylPojTMewAaUa+HdORQj8R+tl1EoH3Ezmuo2EQOUtRfypYrjSGnG07BXe
	bcuqAy0RsMQIjj+qAxrn/hZ9IxEHnNhLCtZ7Jt3O3x/3uR+i2hrw23kz7igeHRlh2Z8IrGChVZoK8
	0FXgH0P34S08msGDM7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQW19-009KGK-UR; Wed, 15 Sep 2021 14:36:07 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQW17-009KFw-7A
 for linux-riscv@lists.infradead.org; Wed, 15 Sep 2021 14:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=H2SjBs0kBa3Umj4ph9RU8nWpMuNZomN4Wg
 +b/+m9/Js=; b=xP6BnDCDyXcNheP7K988Vr+umNnd2OPw7/0/blm/2nrzS2qd2E
 fdmDh2plhhUHFuGSHY9grC5bBSNRf9VmXNn/JxuTmifmcO+33z768DV3q6hHsEJB
 RqNeWe+0+WBoOiuCONLotc5RbUrplt1cNYS9Jx4eZawUm1zaBFrS9EkhU=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDnIqrTBEJhLtIBAA--.1028S2; 
 Wed, 15 Sep 2021 22:36:03 +0800 (CST)
Date: Wed, 15 Sep 2021 22:29:37 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: Re: [RFC PATCH v8 20/21] riscv: Optimize task switch codes of vector
Message-ID: <20210915222937.49066323@xhacker>
In-Reply-To: <3b2d4ff556d310ed73a6910b89566a195fc28861.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <3b2d4ff556d310ed73a6910b89566a195fc28861.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDnIqrTBEJhLtIBAA--.1028S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1UGw13tFyUXw1xWw4rKrg_yoW8Ww1rpr
 Z0kF98tFW8WrZ3WaySvF15Zry5G3yDWw47KF1qkw1UWr42grn5C3ZYvryDuFs0qryFkayr
 Xa4v9r1vga1DAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
 W3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
 JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85GYPUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_073605_741059_FBDA89F5 
X-CRM114-Status: GOOD (  11.80  )
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

On Thu,  9 Sep 2021 01:45:32 +0800
Greentime Hu <greentime.hu@sifive.com> wrote:

> This patch replacees 2 instructions with 1 instruction to do the same thing
> . rs1=x0 with rd != x0 is a special form of the instruction that sets vl to
> MAXVL.

Similarly, the vector.S is newly introduced in this patch set, so could
this optimization be folded into the __vstate_save and __vstate_restore
introduction patch? Or it's better to keep this optimizaion in commit log?

> 
> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/kernel/vector.S | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vector.S b/arch/riscv/kernel/vector.S
> index 4f0c5a166e4e..f7223c81b11a 100644
> --- a/arch/riscv/kernel/vector.S
> +++ b/arch/riscv/kernel/vector.S
> @@ -27,8 +27,7 @@
>  #define x_vl     t2
>  #define x_vcsr   t3
>  #define incr     t4
> -#define m_one    t5
> -#define status   t6
> +#define status   t5
>  
>  ENTRY(__vstate_save)
>  	li      status, SR_VS
> @@ -38,8 +37,7 @@ ENTRY(__vstate_save)
>  	csrr    x_vtype, CSR_VTYPE
>  	csrr    x_vl, CSR_VL
>  	csrr    x_vcsr, CSR_VCSR
> -	li      m_one, -1
> -	vsetvli incr, m_one, e8, m8
> +	vsetvli incr, x0, e8, m8
>  	vse8.v   v0, (datap)
>  	add     datap, datap, incr
>  	vse8.v   v8, (datap)
> @@ -61,8 +59,7 @@ ENTRY(__vstate_restore)
>  	li      status, SR_VS
>  	csrs    CSR_STATUS, status
>  
> -	li      m_one, -1
> -	vsetvli incr, m_one, e8, m8
> +	vsetvli incr, x0, e8, m8
>  	vle8.v   v0, (datap)
>  	add     datap, datap, incr
>  	vle8.v   v8, (datap)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
