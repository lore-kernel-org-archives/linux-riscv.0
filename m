Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684B9C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PyYde7NGB+rZKJRzXfLl9SCP5FdehaCffwILhQltOAE=; b=xj4wHRKZbcVKiTzxrYLR+Y75qo
	B0J1FlF69MauhzYim5V/g9K/m9o+YfzXitXxj7+K82ARId+orWMt12+glPclPACF2VUcaB1Njxi8H
	e5xa1N/B8AbfERnvDuzjP8y2l6LdCt8IViAonKC0RN02eJ6RmM1Ws5OUc/OqWAuPRzAHdae+EEEvH
	3657Iy96BxLUaEDY6jBEWA7nS2Vyt7GewnoSh1mJX3Tg8QGSCaotCmQnILAUwM4XKmHtgYZYA+Ls4
	3sgAKDecexnHSc8OBoI0mQTGJpG97YuAc6nW0+ju+B2gByIncSpDu3e+cT4BI0OBQENkZJsUpRBv3
	yLlul/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOvI-0002C1-PT; Thu, 21 Jul 2022 05:40:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOvF-0001ad-Mg
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 05:40:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so493253pjf.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 22:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=AXiILc/Yjh7zVg/j1KQ6k4x0s0Lbfe3RtnKXCgBCrpk=;
        b=eu/BXvmb1PxFPZgP6Z8ehV3zmJL4vxb8MmIVKh5EJDnlJ3839ylRTp5LqVp0n0FmK0
         OqqyGSPgGzwQSS7TUZFh499OsW+54DAkYegG0clLoCkGck72w0STg3gVrHLkulQz70G0
         NsUGHv+uyxyNLS+5Og9ugAtGZQfSRuGPV6N8xMNvtrr3AzXQrVJ14cvEbI2WPmx2BXQ5
         M3ysx3Bx2+0qALZS6esEcLrQ2E7TFHxWJ6aj8ff1jrpkSB76LIChYIW322ICKAVs5jrf
         vNvU92k8yyKDrEHHOXgtaQG021t9r7SrGoSyzT4Q7RTKerBF2O9C8bf1vFUE2hc7lA+1
         suow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=AXiILc/Yjh7zVg/j1KQ6k4x0s0Lbfe3RtnKXCgBCrpk=;
        b=uCVKuehhILkyPchhGY83Uk24j1ZZEWLrtNygDp3gL5S2UXuVIgzEprSQM5tlMk6JHb
         T9yZ4oyhUXN/MKGqp5/jLkNLvrQJq2+7aLbxzzkJhNwLQOycN2Kh9N66xs5NEJelY66i
         iwO1Fez+BkwYYqbMYk9f8rVXN5wNHNaJpinVq3YJhKu215VJS0V6WODa3eboYE9v54uC
         IF8gRNb0seINWhM3Zv/cyXpn/+SNS6fEC/qwXu4WXnRz5rEz3qQcbrwAt7jpE9wlpv1s
         Z5cYsjLOiN4xdMvfCOH3YrN4mSAS8MVE+0XteLsOCJJfXoplfaNfSby1HDdPj1v/5Ois
         IYpQ==
X-Gm-Message-State: AJIora8/j9Gfu1iFujOvd3/OIBVyn68RSAQs/qyNJnlC2OSS/oakDEtH
	3/i5ru/xLpr35mvKNxGYlLOGtMv4Yw05Cw==
X-Google-Smtp-Source: AGRyM1vPQ8MROWvLS3PmLV+KqWfcRXKS8+oKYwzssgQZrjztWUEnpRayRCTzXkrJuEYB+Xg3uIHiMg==
X-Received: by 2002:a17:902:bb90:b0:16d:2d15:3a91 with SMTP id m16-20020a170902bb9000b0016d2d153a91mr3681876pls.4.1658382020096;
        Wed, 20 Jul 2022 22:40:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id l2-20020a622502000000b005254535a2cfsm640841pfl.136.2022.07.20.22.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 22:40:19 -0700 (PDT)
Date: Wed, 20 Jul 2022 22:40:19 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Jul 2022 22:40:07 PDT (-0700)
Subject: Re: [RFC PATCH riscv/for-next 4/4] riscv: ftrace: do not use stop_machine to update code
In-Reply-To: <20220529143315.3678563-5-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, mingo@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, rostedt@goodmis.org, guoren@linux.alibaba.com,
  andy.chiu@sifive.com, greentime.hu@sifive.com, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-b2db7b1a-3055-471f-9186-0869bbb407ae@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_224029_770400_50D3DFB1 
X-CRM114-Status: GOOD (  15.98  )
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

On Sun, 29 May 2022 07:33:15 PDT (-0700), andy.chiu@sifive.com wrote:
> Now it is safe to remove dependency from stop_machine() to patch code in
> ftrace.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/ftrace.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index d4bf0e5255f6..e7b8bf0a699b 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -12,6 +12,11 @@
>  #include <asm/patch.h>
>
>  #ifdef CONFIG_DYNAMIC_FTRACE
> +void arch_ftrace_update_code(int command)
> +{
> +	ftrace_modify_all_code(command);
> +}
> +
>  int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
>  {
>  	mutex_lock(&text_mutex);

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Assuming we sort out the issues in #3.  IIUC we don't need to ensure the 
command is fully visible before returning, as the concurrent 
modification scheme doesn't flush the remote icaches and thus may skip 
instrumentation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
