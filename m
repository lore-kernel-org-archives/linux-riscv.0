Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB136C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 07:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973F82081C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 07:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LwiUPw86";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCBtiLz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973F82081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sx4hriJmN/fbzTyqx2Mcu4p74W8GM4sGInHhdWsS23Y=; b=LwiUPw86q+Rva9
	RevDWoCo8MF67v+ddXCwUZ4YiU2Rj/hjcgzmxs5ZO688MYmnbniYR8mMPTzG4NGDnTHYXrxsGLsJY
	/kClkhloSAmZXchVRsKe6/xkqoVLuKNcB1aTOW90inkSaa8mSGM2Ah+C5jqTYkuVOSRSthWMldMRD
	vO8XLyFfsT96kyZO6UL5ygCQsKVkURJaVJhs5Sq/LoaNjrIXM0eYaWLG1Qm9+4jbu1JZdjG0HmlZn
	wkCKlPOnj5Bdi7AuTnlXlt0a7VLJhJGYSms/PYT3KB6WC6a74D+LllCLjoUI3iovnWN8K+HY1Hpbl
	5ZRH/cNmMg0vIb+jqvFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSGsm-000533-Uq; Thu, 29 Nov 2018 07:37:08 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSGsj-000526-Tl
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 07:37:07 +0000
Received: by mail-ed1-x544.google.com with SMTP id z28so1035114edi.8
 for <linux-riscv@lists.infradead.org>; Wed, 28 Nov 2018 23:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YoVQTqH3vy5mPd37GsUvR97cQgim6z/Pdh8hSKwkaw=;
 b=HCBtiLz7Z8e2fAHeBaeyI6yMUWugVwbf3Vzx7hDnSoALdYCEkW9rLI/gi9RxJ3VwdE
 /yKevyOCIlw/NxgwyPGKHvNdd1ielrwejYJxoAILXV8axKeJVoBtHm/CmYnOT/SVB/rd
 3tLq99Bt4Pb721AKciyi8DzhEXCk2IGyG0PT+ABj0wblejrKEclOzRh9q3XIhK1v8pkc
 knv8V6fe2t/PYZknH3kvzKMNG+43Gzmct+dryTMZyM7YCdlMWpsgd5puW+fdbQUWDzZ5
 CEigu7F4IIC7CPrdoGNrx4g/OywAj51TMe9ALCXXVgymRRnqopJf2SthVV7+bbFeD5DJ
 jeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YoVQTqH3vy5mPd37GsUvR97cQgim6z/Pdh8hSKwkaw=;
 b=eWsJ8YmX9dkqwsDwIOo18waxDUNdFUvI9jDy9i8CFMYIMXgCDElli+LafojLaE5gGw
 EU4OAEYqBFWq7C1kZstCCrSuG62Mr2rz1QpO1QbGTrxptDg0sZniyVNRPflFvQKosRVm
 RMuaZzEJYop4YVPhVWx6grB3EkqTfZGdLHvQ3S2LL31xEeqrTmzbzthQSZOFXRBvvoMN
 1qD+rIkoCZgh77xgy55kh0SCri/QszYQu1YYz8+kczojiE8lRtIBRynsNlW5Iiyz9F+8
 uKiJTA0JqX4fYRy+Il5JKr6L2rNrPqqFdo1ElY3YgKShANrLLSM/W3d9z2zNdvUHpj/A
 Se1Q==
X-Gm-Message-State: AA+aEWb7YvdHS74+0l9R0nfvjHYuqXGuo6MOQsqFcg/fH5EmgNnsNo2t
 4lHRYrvocY6EJveYoTqg7qjHbFfiC9dDwlmIfu8=
X-Google-Smtp-Source: AFSGD/XaC2/HYejm4OWtUq1E5HNkUx2dKSETgXLDJkJK44hDJjfusvM7w891+z1Fr4f6fEWAebd5X+xjMX6rbk4jGD4=
X-Received: by 2002:a17:906:7c52:: with SMTP id
 g18-v6mr696479ejp.77.1543477012342; 
 Wed, 28 Nov 2018 23:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20181126060802.19314-1-anup@brainfault.org>
In-Reply-To: <20181126060802.19314-1-anup@brainfault.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 29 Nov 2018 15:36:41 +0800
Message-ID:
 <CAEUhbmXMZj68FyANeqP4jo2Pvk4ihEqPG2+g1gQAFMSqppNq-Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_233705_959036_F7765A62 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel <linux-kernel@vger.kernel.org>, hch@infradead.org,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181129073641.APrX1f8QCvPCqx4LCJWY0JFIXNgaHlZ3tFOV16dOK5Q@z>

On Mon, Nov 26, 2018 at 2:12 PM Anup Patel <anup@brainfault.org> wrote:
>
> The objcopy only emits loadable sections when creating flat kernel
> Image. To have minimal possible size of flat kernel Image, we should
> have all non-loadable sections after loadable sections.
>
> Currently, execption table section (loadable section) is after BSS
> section (non-loadable section) in the RISC-V vmlinux.lds.S. This
> is not optimal for having minimal flat kernel Image size hence this
> patch makes BSS section as the last section in RISC-V vmlinux.lds.S.
>
> In addition, we make BSS section aligned to 16byte instead of PAGE
> aligned which further reduces flat kernel Image size by few KBs.
>
> The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
> 8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
> 7991740 bytes with this patch applied using GCC 8.2.0. In summary,
> this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
