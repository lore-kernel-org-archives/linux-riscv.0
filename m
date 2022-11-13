Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E70C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvJLa325d0kwhLVxMU7c4VaESxI/7vATTN6pOIp5qYM=; b=m2A8ct7rap2U00
	O73LO649Dj4oIy7Av0geA7MlQBnRsy8tyGHbPn4dtPrIXe+T5c9dI+x7pN8kuxy7EmHAhCJMYDHo+
	6jss14u4y0bCL54mmjV73O8stCflOfDy/3Ikxj/2GVYIwqZiyNO/fjDY7QfSak84puuLBeLbFKBB6
	dK3e6NgwHv0+Tyv0fYG0gFGxVNGsr5T/rHH8WVghI3KqiHRRREbeZp/ooxxy6fuR51AC+7yRI4k/r
	4/2d/nazCaqJlycbmYESwt2+DT6iadB+NbKtmjwZeuwvTmEfVoKGi3NFo8UmCI0YiUkGF/rWzw7SB
	8c8m3m9MWM5dYfBnhUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouAox-00B3nm-ES; Sun, 13 Nov 2022 11:06:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouAou-00B3ls-LS
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 11:06:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id t25so21979827ejb.8
        for <linux-riscv@lists.infradead.org>; Sun, 13 Nov 2022 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lNkqm5mDHS7GJ3dOEBMgWRtlQ/aBzzuCqiGbGOTN6Q=;
        b=WPijW6+w6bFv/6BfRE0a83Vyo18qlPKeHQ+gPFQw7RGsmomc5387pgA6QvZkfWLC+V
         HTFYCNOtld/x2icd7maxkdWbIwkObecoC4Eznr/FpZszHyiGoFxEP6czsMQmg1FLl8C4
         2b0u8ADg+nGk9jJoWDpC+vmr/EggRCAFUWpOXkpjJErM3tlaySKmMge30ldVKPMDF9oh
         A9DxwMi7aGWKVHMFXfLSmND7Y+OL8KDYxB5ITinq16qXgnrei4vFmuIfAksSAfMM3exp
         cOmDbh3zKAR9rLgUKg7S9/lTQL5hRiA+Amiy2vCohxLgQLJ7x3KP3VZ2xcB2kYwzs7oT
         TS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lNkqm5mDHS7GJ3dOEBMgWRtlQ/aBzzuCqiGbGOTN6Q=;
        b=0E640XtKrNJJGRh5Hm+C8zEXkTm6C5DOlKnz+SJs0P0Iv3ZNdbpdT5OcD4UJPJV3ey
         w14oEw/rZIL8AVgZwjNXlW1lyzZMx9511/L+0qhsFqU10CNxIjzGkh6F0tTp5VI7wfr0
         WcvdaehYMCT2v2ZQLCkrOr2hRq5Ryaud21Ke6a0qujrc9AKGudS8IjwzHZifflLlRGM+
         +ErC0c/VxGG9RcLolWZd5h/ZY/JkfVBcqfw2H1SdBeLO9rI3mXGHEF0BEvU2tqezNZiG
         v07XXt5OZKKA3pjTaM/b8EJ51d92ptqZDhDngt4lAW9gAAb0fFsKwOTRa8iebFhGtAvh
         bgMg==
X-Gm-Message-State: ANoB5pnDDzBH8fzr7XFODa3NJ12mhjkhiXeRXKMUPkVeEUgiw3saZ+7T
	KiKoHeqQA7ea31Vy8b0cM+y7Nw==
X-Google-Smtp-Source: AA0mqf5b67Xt/CHKfoOz8K1J9qJUTnyhFYZXylUlULKqCHA7cRhnTu/gTTCpIBU5VS4CUoIFPoFYMA==
X-Received: by 2002:a17:906:b6d3:b0:7ae:4236:bfb5 with SMTP id ec19-20020a170906b6d300b007ae4236bfb5mr6931827ejb.428.1668337592188;
        Sun, 13 Nov 2022 03:06:32 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ky14-20020a170907778e00b00782539a02absm2840462ejc.194.2022.11.13.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 03:06:31 -0800 (PST)
Date: Sun, 13 Nov 2022 12:06:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: debug@rivosinc.com
Cc: palmer@dabbelt.com, jan.kiszka@siemens.com, kbingham@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux@rivosinc.com
Subject: Re: [PATCH] gdb-script: updated lx_current for riscv
Message-ID: <20221113110630.y4uppv7d4ocm3lej@kamzik>
References: <20221111195938.1499148-1-debug@rivosinc.com>
 <20221111195938.1499148-2-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111195938.1499148-2-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_030636_720737_1B006009 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, Nov 11, 2022 at 11:59:38AM -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> lx_current python gdb command defined in scripts/gdb/cpus.py updated
> to support riscv architecture.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  scripts/gdb/linux/cpus.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..ce6703f1e35a 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -173,6 +173,14 @@ def get_current_task(cpu):
>           else:
>               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                  "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +         current_task_addr = gdb.parse_and_eval("$tp")
> +         if((current_task_addr.cast(utils.get_long_type()) >> 63) != 0):

Shouldn't there be a get_long_type().sizeof == 8 check somewhere before
shifting by 63? Or are 32-bit targets not supported at all for some
reason?

Thanks,
drew

> +             current_task = current_task_addr.cast(task_ptr_type)
> +             return current_task.dereference()
> +         else:
> +             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
> +                                "while running in userspace")
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                             "supported with this arch")
> -- 
> 2.25.1
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
