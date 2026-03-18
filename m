Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E9F103E160
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gs0AVzODxolkodD4wNrIM9jPKP6+P77goDFgxFHozqs=; b=zr31t9E/PMWu5m
	wxohoqvtbic+WS2LRJw85PduD7nwviz8nfvJWTlQ5a9ZJ4ouwlNAxW5ZiFXpVPPSMQgmuvczad+Q5
	7pdpvbZcmUBT2wfyNHoLiGYff2Hm35scCsbtq+g7DzAqvo/q1jx9WS2yWxQ/xq0kIhGGdSnSOdUJr
	Y2sDuL5/a1DoJcufs/k7SS5gQT5ExPjmsUPw8FbSt18wHXhdE+9zDCN+K+1fpweGqEmrHW2Yadg2v
	QdHYdAogqFP5VXNdOUJaLlpt/u8SiMdcL1XByDOj4p363Xjafl9fLS5r1lpoU3uOvD62/y6R7xslQ
	PP4rjDL0WUkgKiUCC1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pZa-00000008M0l-3GdN;
	Wed, 18 Mar 2026 12:00:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pZZ-00000008M0F-0Fs9
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 12:00:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so8461581e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Mar 2026 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773835223; x=1774440023; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kAtEj/VrFzgtiSRgZnVW0MoHyNXhThlwQpHuXXkfnpM=;
        b=mesDFoOAZgM5FFYY0LD+6EXL497wwDDOnmjSDcW9C2bT0U5mH3PoWzhW2+WsHgtXQ1
         RjZft0lzX13ES5wOrLZY6+A3W8WpUMEFTAk4rCvi9RGizJz3e4Qz756U2TcFYk4zt5Am
         BfmFF/QqHPRNSuu7gSkX/o6QutfFxF9ZGpiW1iIVGgM94s0bVZTJ3beFmD9TtVtOi+oj
         JD0UE0QLi/1xHikU62WLpFCwhXKNLKy3+bjVo/A41E06uxwoqtFjnVYe8Lu4CvqpoSYg
         qnT+GyOYYYl8/4+yheTw69mx2GJVRWR9kRE4Jpk9qhIwVRJxKSjHl5f/KHaad8fDCHjf
         g7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835223; x=1774440023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAtEj/VrFzgtiSRgZnVW0MoHyNXhThlwQpHuXXkfnpM=;
        b=amcddrpRqitDveso9K9m+2YjJyLO4UHybgHrIkjCtkzCkhE/78dmd1V/SlZO40eQ99
         2SNjkys0xbQ7gdSfdO6gfLeMZSGX6t7jGaZqEJAQFRC7LoY6JdLkewb20G0a7PFX4Nym
         aD10Gywk7JIcukraUNyqVZP1tIWY3k4M1I/C8f5zkcqaP9BS4BNEHeVK0OyLF8L5FBOp
         fS1oIU+YwU8HQ1vdds94zmdX2wa2sIEIyD4kIyPADZMfdnM2QwiRFm0nnySRdEbzzHsa
         r64wQsf1QQQrnJ+JFEeG44nb7Hc8YHiQl/dxln6QqdRNMqNaPcOfoVyMy7CJFI0q1WpQ
         Bc9w==
X-Gm-Message-State: AOJu0YzP5ly4HRAT7llv3gG/bfLM9RGzEFIzDRKqvwAAmRjn7D7ByE6S
	Wlt4lYnEnfygI3LDxdCC673cwCjihpj5ORbThxEoV2B99ykBY3sEK9nD
X-Gm-Gg: ATEYQzx2EfNNSuof8KqkB8FJ7BwEkoVqgzbxaYmMk4Im2PC+Eb8J9hlZJyeMPCH5hDU
	4+uR9Iv8QQwajKiMv/DsltlPA+Ar1NU5UPuzqBK+gA2bMcqy7SyOe3nllzaFa3F2nmVjRUF6BiG
	0JF//WWhKKPPj7Qe6H5tiFHmwbu9Lpli8E0XDcWXbDSRIk+2qjdkQKARlzlkoC7ljKL4ekA6J2M
	OnyM2Opnw04dJ4VoDjNf1tis4fI3sWSTfua4CcdyMTOtlo378s2WgHvA9DKaJAVlSOjh2LPfao6
	W0X34VSjBuCNcmbWiCQNyEVRM1X7SjebZPpJoS/YinWKkmmlP9bjBMLOXS90nOVclRMRx+IKeVU
	gMq7xinHP0A8fpt+rRkLyxEyTXsnk4Jn9oSTgsGWUiBimQseLF1OqRfv12E83vtmM6r2mbSOXAI
	OHH7Y2VGVaJMFzsF05JMgpFgH9XWe7
X-Received: by 2002:a05:6512:3258:b0:5a1:3207:6948 with SMTP id 2adb3069b0e04-5a2796b2dc8mr984104e87.34.1773835222134;
        Wed, 18 Mar 2026 05:00:22 -0700 (PDT)
Received: from imamay-pc ([46.73.133.192])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c27351sm508111e87.15.2026.03.18.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:00:21 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:00:19 +0300
From: Ilya Mamay <mmamayka01@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, shuah@kernel.org
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260318120019.z656r53gkv6kulq6@imamay-pc>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_050025_156220_D9DBF778 
X-CRM114-Status: GOOD (  11.41  )
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

Hi,

Thank you for this patch - it;s a valuable addition to the RISC-V HBP support.
I have one question regarding the locking:

On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrote:
> +int arch_install_hw_breakpoint(struct perf_event *event)
> +{
> +	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
> +	union sbi_dbtr_shmem_entry *shmem = this_cpu_ptr(sbi_dbtr_shmem);
> +	struct sbi_dbtr_data_msg *xmit;
> +	struct sbi_dbtr_id_msg *recv;
> +	struct perf_event **slot;
> +	unsigned long idx;
> +	struct sbiret ret;
> +	int err = 0;
> +
> +	raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
> +			      *this_cpu_ptr(&ecall_lock_flags));

Could you clarify the purpose of the ecall_lock in arch_install_hw_breakpoint and 
arch_update_hw_breakpoint? Why is it used only in two functions mentioned above,
but not in other PMU callbacks like arch_uninstall_hw_breakpoint?

Regards
Ilya

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
