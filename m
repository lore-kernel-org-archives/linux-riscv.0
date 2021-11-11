Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76517C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 04:06:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3085761381
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 04:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3085761381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sHMkGCPCGl4RjtXrXUglmIGjVZRLVQxaw4pEsjLp2qA=; b=mfcwv/siNH9mPNYrQBXNGDsh57
	XKu+xzSmRbvIPfXxC/YdKIpxAlhyymw3F+g9jLSF0VUTaFakGzdvf9fDEYd+hTQ+ONgrZyV7Q7gFw
	doO97OlfBP02acOaiYRMNpblQ9rRAt3+jP6zQmYIoHKHdgKi0yc9meWUJHbWs+WL62xZxuabsqSS6
	IXtzwrNZnv/fs9DJ4JpuBNs5bnWR8KQo9JqXqN3i0TVeUf3gp+pIbtb/GamiY+yNS8SvUzE6i7++f
	ah/tgQ+CBwvrFpK/e6XZ84g6gU+9VU66/3uuAD8kWMGC8v00d85CAxrCX9JBEW3QU3E8Vv5d/enMm
	dTle0fWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml1M3-006yiw-CL; Thu, 11 Nov 2021 04:06:27 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml1M0-006yiL-Jy; Thu, 11 Nov 2021 04:06:26 +0000
Received: by mail-qk1-x72b.google.com with SMTP id 132so4620587qkj.11;
 Wed, 10 Nov 2021 20:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLcFQVtD+zrg7PXIBfRA8cAQH7T7V2/4cfVGtfrxAq8=;
 b=lS36aFbkIRhJuC6Cd/AAaIIRXR6DpEI+MiQBTh+HAqDGQ7SJt2kOk9H7OefPb7ebNK
 3aaMIjZ2VlWMsGo6UecehmNcDjgJPL0cuqd0Umndtlo7lzpVLJosTFKfQ5jLQmWN+gWR
 Jr5xvZvaie2aDWnjNWXbAbJGgix5rr9ARnzYKIC+eLHLu1eICDbrqm5BMAU1FSKAGoDN
 49GzgVLS1AtMP3yl2OZ0HlByk+DJfaIP8+CSdmBdJiTSYsNiET6sL5V9FzCrGaRLtDUg
 DNpaMHeGFR8f41ArSJvrUf5szRHojZN4RxBZV/DP/lerAQFp9+r2/Xy1TUACK3rmOSMW
 l+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLcFQVtD+zrg7PXIBfRA8cAQH7T7V2/4cfVGtfrxAq8=;
 b=6EEfObMC10xrwlAdKIqkAiIRCJ6QC/vEclE0ozVeR9DzGohLz3MnoZS0Yg+vAoxByj
 Cb4/6EeLILERKJGXRXh0WjKrCWyuZMX3NB7CHrUKM0JqS9PTZ0osVHMYqsdI6xBuBLow
 ux8F7FUWZ1eImMvIre7LEoxHSuwISV6hIgZBNBvxIaJC0tnvOnnxdVu9ICCcVf38sWpo
 JJ0E5RfvWmH5qP3nDeamfO/9B2QNJAsvrj5DORmBm32Gl5aIqMJ2vrSNBFBgXI8MAL+z
 7EMKkvJrvSNGa4mxJHfmyxBUTd93IMfPLb1Nmceh23hhU+9VA9N/71+ZnYwYEtsPDLAU
 hykg==
X-Gm-Message-State: AOAM5327hDaWNRJCtSC+hT8ahu6E+noOrn6DGcgM7fWKhrVwP2UUk7j5
 DqBtESG/cQ5SUFDdfIr8ZkE=
X-Google-Smtp-Source: ABdhPJwy1jkciX4+znRvqnHrGi5juDKLXSdn6bNl6om1ZBoExEpt68bOz9etkvnkVJVIPj1CjWlbwA==
X-Received: by 2002:a37:5804:: with SMTP id m4mr3775483qkb.137.1636603582779; 
 Wed, 10 Nov 2021 20:06:22 -0800 (PST)
Received: from [192.168.43.249] (mobile-166-172-188-236.mycingular.net.
 [166.172.188.236])
 by smtp.gmail.com with ESMTPSA id p5sm1084681qtw.69.2021.11.10.20.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 20:06:22 -0800 (PST)
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <9e20f1b0-3fc4-920a-dff4-1227f72207cf@gmail.com>
Date: Wed, 10 Nov 2021 23:06:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_200624_709829_FB52D1A0 
X-CRM114-Status: GOOD (  32.27  )
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

Hi Geert,

On 11/10/21 11:23 AM, Geert Uytterhoeven wrote:
> Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> large.  It contains fixed-size strings for a name, a type, and a
> compatible value, but the first two are barely used.
> OF device ID tables contain multiple entries, plus an empty sentinel
> entry.
> 
> Statistics for my current kernel source tree:
>   - 4487 tables with 16836 entries (3367200 bytes)
>   - 176 names (average 6.7 max 23 chars)
>   - 66 types (average 5.1 max 21 chars)
>   - 12192 compatible values (average 18.0 max 45 chars)
> Taking into account the minimum needed size to store the strings, only
> 6.9% of the allocated space is used...

I like the idea of using less memory (and thank you for the above data!),
but I do not like the implementation, which reduces the size (of name at
least - I didn't check each field) to less than what the standard allows.

I have an idea of another way to accomplish the same goal, but I need to
dig a bit to make sure I'm not shooting myself in the foot.

-Frank

> 
> Reduce kernel size by reducing the sizes of the fixed strings by one
> half.
> 
> This reduces the size of an ARM multi_v7_defconfig kernel by ca. 400
> KiB.  For a typical kernel supporting a single board, you can expect to
> save 50-100 KiB.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Notes:
>   - While gcc complains if the non-NUL characters in a string do not fit
>     in the available space, it does not complain if there is no space to
>     store the string's NUL-terminator.  However, that should be caught
>     during testing, as the affected entry won't ever match.  The kernel
>     won't crash, as such strings will still be terminated by the
>     sentinel in the table.
> 
>   - We could save even more by converting the strings from fixed-size
>     arrays to pointers, at the expense of making it harder to mark
>     entries __init.  Given most drivers support binding and unbinding
>     and thus cannot use __init for of_device_id tables, perhaps that's
>     the way to go?
> 
> Thanks for your comments!
> ---
>  include/linux/mod_devicetable.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b219920..2bb2558d52d30d2b 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -266,9 +266,9 @@ struct sdw_device_id {
>   * Struct used for matching a device
>   */
>  struct of_device_id {
> -	char	name[32];
> -	char	type[32];
> -	char	compatible[128];
> +	char	name[24];
> +	char	type[24];
> +	char	compatible[48];
>  	const void *data;
>  };
>  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
