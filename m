Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099ECC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiRylnIa/VJdlY0Dz1t+n18wjFRyw4bEMys+1nTX2II=; b=NavWtgDXA5/0aR
	LNTI8KSgjq8eCxVdIqrgnWtMQMSBaUVfidVWehVSzaiPim7OxEXOyj4WVsg4DcrSk+AYbOOcS43IH
	gf9rx7JAc1EXs4dUxBYRvV5Wk29V7lgqjsq6TqSgKaYbCEQZ4Vr6UAVkr3xkk68HHIHnC5d/iCclK
	qZjV6GiA2K/0hSc0wHO4GGxvkCaQ6h3DVHCUiRPvGYP2PzcI0nOVrMQafvjMIsUrxh0LnaWeSoMiE
	H4/44avhzQnILXv+dU6xw9SaDuxlr/5CVoyj7z8kjXvTIJeLmbqAkMJG8WWEgb17tFF2GRGvKPUMy
	a+HsQv8ivS6z4TASQnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngZPe-000g2o-Qi; Mon, 18 Apr 2022 22:00:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngZPU-000fzr-IH
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 21:59:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id b7so3772005plh.2
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cLLWAAHArn9WgPwOUwNflPPJDgjsRY1O3bHGAhIDsQw=;
 b=LTURonE53ti9q/GT1aK7iRoPMpGAeCy1e4EeYMoQ5ND31pPzYRrBIuxOtS32aAiFM+
 1XHlY0ymuxtf7KP5zzxh8j9ip4/ZkYqKkInt8TY5JnA0taa6ag1p6HhrtkPYOmL/X1BS
 68H/ZEsyd88OXRqhJx4ed+KaxwMRzhvwF+Q30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cLLWAAHArn9WgPwOUwNflPPJDgjsRY1O3bHGAhIDsQw=;
 b=iT9xEfbbvKr2tSFcitX+sU+SzXdU1OJMfe8GlxJlwDrO0lLkzeUl1q+EJBQyxaaL+Z
 SwQDxWz1AOyvKyMJ8gA0BmFOIOGBFFcginMNfMPYcIJBj2mZGhht0Sth/V/J3nkUgkCk
 ApUc8WgQvEOn5R05sojVuPSVNAM1bNUADewgxsunyxDugnDJw176VMD9VyAUUpaEttin
 03X2lMtLzQr9n4jGvi6mfyn7P9WBVdRwE/kaTtM/4/gaGWq/bvM8WtTVlcumV1l5Rp7B
 brO85PK5O14/tG1AdtSjbVTzE9M1AO/xmLKi505iOeHR2hCzpEtaeb7r5Ok1Fw1JH7lH
 US/w==
X-Gm-Message-State: AOAM531nItlAHkP5FGdYA0xI7s9Nq/Iov7q7qq1kqG9wZCunUMJfPzrT
 6OgvvyXGkTQK8i6dFdqnlWYN4Q==
X-Google-Smtp-Source: ABdhPJysM2kkydsu6S512r9sNHn81bBvZQZwemOKp8WmD7sADc0kfHvR6/TUHLqhcn1MQ99fL/O1Og==
X-Received: by 2002:a17:902:6bc2:b0:158:a26b:5884 with SMTP id
 m2-20020a1709026bc200b00158a26b5884mr12917161plt.38.1650319190427; 
 Mon, 18 Apr 2022 14:59:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056a001d8f00b004fda37855ddsm12953099pfw.168.2022.04.18.14.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:59:50 -0700 (PDT)
Date: Mon, 18 Apr 2022 14:59:49 -0700
From: Kees Cook <keescook@chromium.org>
To: He Zhe <zhe.he@windriver.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, benh@kernel.crashing.org, paulus@samba.org,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/8] arm64: stacktrace: Add arch_within_stack_frames
Message-ID: <202204181457.9DE190CE@keescook>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-3-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418132217.1573072-3-zhe.he@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_145952_629058_CBE08455 
X-CRM114-Status: GOOD (  11.58  )
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

On Mon, Apr 18, 2022 at 09:22:11PM +0800, He Zhe wrote:
> This function checks if the given address range crosses frame boundary.
> It is based on the existing x86 algorithm, but implemented via stacktrace.
> This can be tested by USERCOPY_STACK_FRAME_FROM and
> USERCOPY_STACK_FRAME_TO in lkdtm.

Hi,

Thanks for doing this implementation! One reason usercopy hardening
didn't persue doing a "full" stacktrace was because it seemed relatively
expensive. Did you do any usercopy-heavily workload testing to see if
there was a noticeable performance impact?

It would be nice to block the exposure of canaries and PAC bits, though,
so I'm not opposed, but I'd like to get a better sense of how "heavy"
this might be.

Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
