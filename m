Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1618FCD343F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIAw+MKS3ATpToEtxobOVj+40qGUbskQMhM97B23m9k=; b=OtJDDuxCzzyHhY
	YTPWA7ivXU1kuUHStb6BG0mAYFv2c+pH6M2keWtiyZ9a4wQrbnFeG3WNMrVYnFCC6OQlyMSqCVPyA
	pUjOI9ijzkF++pql3mCANzYgn9MMLKhX4SESfMgNvz7KIf6lc+ErEUqIkME5X/OXLQZ9NrQws8YoY
	CC/gmrO1y4ZVOSKrfS942mhsK78LX/ZHvFlDI0F1OXORP2IyhJJA+1l9uJyP7IJWeLmqBB+JSrNFs
	PFYRGpiSM1I2CUsAThlwSRMz3FBavuyTHoUymA6sTIzPIi7vfGUucZCmoGGJ3ONePilXTtBIrCSjQ
	qmUZWIRWDoLQeoU3IQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4c0-0000000GtYA-2Ape;
	Mon, 18 May 2026 20:30:52 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP4by-0000000GtXR-13qO
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 20:30:51 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so21991401fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779136247; x=1779741047; darn=lists.infradead.org;
        h=in-reply-to:references:user-agent:to:from:subject:cc:message-id
         :date:content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3VrP2DxIv6LPTx8GCJD3YcqwFHoOIh8jqWRtmtbvYw=;
        b=hKMva8OleS42mkgbHhy2u/1eA+UzzFV1qlmWUX9+GXY32fHWMIui0HpDJmubQIvasH
         tl5rSU6PVKHaQ0goZ/FETBO+OASlURtcZdOvLHYbleH9rOxZpraK9pq6u9mbEXcZvE+t
         3/qkqw/ksDkRTfKndDlFkM63QyWB1zDG9jT29F78pfaSxLpjjZPZwjb9KdSKWPUvLQjl
         j0EpVmZ8KQqL0kzWNbKOj9TJwv9VY5155qeWDqFlTVUVPp+M9cQoBcNTD2Urj1g6fmhs
         4BUfIBQ3IUA3t7sbIhzW5ho4gtHnR/DE0PgCAg0KYVjgHZMfTLoj80ak6336yYdQf9cr
         aWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779136247; x=1779741047;
        h=in-reply-to:references:user-agent:to:from:subject:cc:message-id
         :date:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3VrP2DxIv6LPTx8GCJD3YcqwFHoOIh8jqWRtmtbvYw=;
        b=K3+zeLl7zBTkQgvEo8rysgxv7o2JWyeum7pd64lev2RijbNS9drIuHH2IgDES373eR
         u+ogvQOISMaf69LEY5jrlcEkV9dI/Bxvoz6XsjivoRDJDOuy0iL2heknXDDn4VhM0kDM
         QBaa3m26ZcBpVP3lzQnX0qFAsmfW4QuXZD8dHUTCy+mpXrdJwaHD5wcQJ1xLR6b+EK1H
         FS9iYrHNFr7ytqQJHLWA1wWgeMVCVDCuSpXRkQI8bSQSkbKXgU4EuZlWt3eeYSY4zHZt
         XmFVlJdwr00p7fka9IAbJ0CjU0F6+TxGoF3KczViDJyEjhsvFOyQNW/HYQRzZEegp+P1
         qKBw==
X-Forwarded-Encrypted: i=1; AFNElJ9EwSeonvvGdKYeIW1kfFHzJg4OTWTdl7nwsIW2icY3i+4pvUXsuxUVdcIhCnF+rh0BOCVh6yKhTxm18Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8OH+1euBbPGroMpZ2UmLI0ocYMd18XH8pMuL8NyWq0cpdUplj
	OcvthV/l4AxvfdpDvQ4npA87xCgPFEGX0Oh8XRvIj0iGl2AdvDtB9JhW
X-Gm-Gg: Acq92OE6KuGCbA1ZPrPNMggD3WPxQBPH+pvDsQ99UOkD50qudpJ7aM163GFz9jyatzd
	hC/BUode7A7Em/GaOiwK025eAWvCpWNzXgYlRPBbvGx5oSzDsl1Dy6MdKlxqaW6RVcdl2zikxVC
	8rXcsohAgEf2vs+E5eUtynV5YYtCllWcbVRPjwktI/GE9neRoC6ByHTT7Pm6g+O8UXQ5t5+1nCk
	bc6cLGtyrMSt0Dq51CagCgeCsu7Ocb+25KhudTGA8KZ7HZ2QSVCq2BvtzHSheH6pk41nYGwVY4V
	o6LZlXO5O+Wvh8It2yUAs4I37E2D/RwMtQNR8W2qXPADDAIsgGpt4jnFRg4QbNcGCG+xPHiITTY
	10mgzBLzlO5mC6cL4Yrtdgd/xaDB8cnEA+1pIculj7P4mIRiAPYRnpTT8VehOrcPZu5nkmNRovS
	ztuqvJjzosDW+vtj49qwCEMA==
X-Received: by 2002:a05:651c:198f:b0:395:940a:d84b with SMTP id 38308e7fff4ca-395940ae415mr19226801fa.3.1779136247215;
        Mon, 18 May 2026 13:30:47 -0700 (PDT)
Received: from localhost ([178.205.236.109])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887dfbbfsm14243301fa.40.2026.05.18.13.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 13:30:46 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 18 May 2026 23:37:39 +0300
Message-Id: <DIM3B5ZM2WCI.27FLMTRS5IYNN@gmail.com>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Chunyan Zhang" <zhangchunyan@iscas.ac.cn>, "Matthew Bystrin"
 <dev.mbstr@gmail.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Samuel Holland" <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe()
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
User-Agent: aerc/0.21.0-0-g5549850facc2
References: <20260517143704.659416-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260517143704.659416-1-xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_133050_301503_7C67A965 
X-CRM114-Status: GOOD (  10.40  )
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

Hi!

> @@ -68,19 +68,24 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  		pc = task->thread.ra;
>  	}
>  
> +	if (!task)
> +		task = current;
> +
> +	high = (unsigned long)task_pt_regs(task);

After noticing end_of_stack() function I'm not sure task_pt_regs() is the best
candidate for the boundary. Let's see what maintainers are going to say.

> +
>  	for (;;) {
>  		struct stackframe *frame;
>  
>  		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
>  			break;
>  
> -		if (unlikely(!fp_is_valid(fp, sp)))
> +		if (unlikely(!fp_is_valid(fp, sp, high)))
>  			break;
>  
>  		/* Unwind stack frame */
>  		frame = (struct stackframe *)fp - 1;
>  		sp = fp;
> -		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp)) {
> +		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp, high)) {
>  			/* We hit function where ra is not saved on the stack */
>  			fp = frame->ra;
>  			pc = regs->ra;
> -- 
> 2.34.1

All in all looks fine.

Reviewed-by: Matthew Bystrin <dev.mbstr@gmail.com>

-- 
Best regards
Matt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
