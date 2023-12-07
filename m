Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD99C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gf5lBkjv8u1zpqIMHj1ln1Pd0oMp2XtYWrjYJdemmhk=; b=NyKg7WIfE5t29s
	B8JcCaZfQjXqASKQoaGczUwN8ZaAM3WfX53fbUQYG75CHvenTucsFUvy/TkZV69tYjUb1F26epuUC
	VOL3Wy5bYEfbwtBqa5pN2fhwrB+HkiH3zb38mFvsDpNVtPkDln0Hja4UonOErXt8TfApJpCC4OkV1
	srhph9GQbj0TlQAVRj/MVfQx8zOJth7ujOSmy2l8P3doyzPWpPPNeuGpwvDjri8wQ62VZbCP3bh0M
	02CvXku3eyEllypXS4vlIhDjU1QtsCKCgKL9j/jxzyQVETYDsSPy7KLYHdiMXn0O4FmVWZscU+h9W
	I0EQ2sjiihfyK9nqhH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFcG-00D3Wq-1k;
	Thu, 07 Dec 2023 14:44:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFcE-00D3Vc-2f
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 14:44:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40bda47c489so10546215e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701960275; x=1702565075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2X1VjbagCGmP0A1RPcv7u0Lj03h4h1kkYCRRs2Iz0c=;
        b=Tq9aAyKUpoLxO5DDjNRfCAzHcnlV+N4ax1rkgFRSRLsOcPyv1kmkWqMmm/q3/J+FZ6
         4TwqpY0l9HbvFCMUZ5MsPDjKblga7bO7sGV4X8Gg7acEgikj5k+mO7npAkXKXWo13h/C
         AQafgbvEiIzb/Ed8wSY+1Q9mB+0gF44BSHyVn65p0o3WjUoFJScs1XoEuvrS+IUsIjnE
         DAqnXbninnzm8RiqGQ3+Zn+jgiLg/yyJY9K8zZeexoWHtrr7BwbJzmSuWnQZKcHcAzSG
         fITq3CPrh9SMkqzb/gQgnfQeqif+RLYR7opMzjrvUUyAfF+ahgjC9ygnSfTQRNyUEx3W
         FdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701960275; x=1702565075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2X1VjbagCGmP0A1RPcv7u0Lj03h4h1kkYCRRs2Iz0c=;
        b=uUsb+u1FS60UaqpGMPKn2tckem+rG9lqr1JxR6/CrQO6DVEl8LrEVLH5+fl7pB6kd7
         kYQAlrkE/xAB/yVq8OAo8fATaIveYxP5Udw37PgGJjJrjZaepWvEnExrBSlaXemCtXKf
         9EpI/WJnvLDeDFtYmdpx6Vsikb/3+J0c+7eDUf0aQrqyKN7N7vgNQ40BhWt+QeLYBRlY
         qulU0g8SdpVCH/SUSNKNNetAGNGGITVErz/ix8V/FkYgUEgCHEkbEhrtRYbU8rxVBSw4
         p2oVDg66vx0e3kmBBJ9kaWTfmue0vZm7Sn5IkUcMYzqwLdzWqkCv4P/VAJj8ufWXEcbF
         o3BA==
X-Gm-Message-State: AOJu0Yw+jFKZwoLVq2k93ElAlu8UMdUp/XlFeNJlo/i0BrqJBs3eXGkg
	qsuo4qha7mE7O0kWtpe/wxqfaA==
X-Google-Smtp-Source: AGHT+IGEefXECWySBl1DPw63VSb3ikjm82ZQvh2LqQu8KuTy/Eok7OvFLg1vm/cjL9Q+g3zwWxniqQ==
X-Received: by 2002:a05:600c:3149:b0:40b:5e21:d362 with SMTP id h9-20020a05600c314900b0040b5e21d362mr1858824wmo.107.1701960275098;
        Thu, 07 Dec 2023 06:44:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600c46c900b0040b347d90d0sm2180722wmo.12.2023.12.07.06.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:44:34 -0800 (PST)
Date: Thu, 7 Dec 2023 15:44:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, atishp@atishpatra.org, pbonzini@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	srivatsa@csail.mit.edu, guoren@kernel.org
Subject: Re: [PATCH v1 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <20231207-42f318822ee01650e550c663@orel>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
 <20231205181119.207204-19-ajones@ventanamicro.com>
 <20231207-kindling-upgrade-22d29116ccf3@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231207-kindling-upgrade-22d29116ccf3@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_064438_862680_DC9E788A 
X-CRM114-Status: GOOD (  15.87  )
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

On Thu, Dec 07, 2023 at 02:06:37PM +0000, Conor Dooley wrote:
> On Tue, Dec 05, 2023 at 07:11:23PM +0100, Andrew Jones wrote:
> 
> > +static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
> > +					unsigned long flags)
> >  {
> > +	struct sbiret ret;
> > +
> > +	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
> > +			lo, hi, flags, 0, 0, 0);
> > +	if (ret.error) {
> > +		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
> > +			pr_warn("Failed to disable steal-time shmem");
> > +		else
> > +			pr_warn("Failed to set steal-time shmem");
> > +		return -ENOMEM;
> 
> btw, how come this is an ENOMEM and not a propagation of the error from
> the ecall?

Hmm, I can't recall why I did that. I think I should have used
sbi_err_map_linux_errno() to convert the possible SBI_ERR_INVALID_PARAM
and SBI_ERR_INVALID_ADDRESS errors appropriately instead. I don't much
like how SBI_ERR_FAILURE gets converted to ENOTSUPP, but I don't suppose
it matters much in practice anyway, and at least, in this case, it has a
1-to-1 mapping which is good for debug.

I'll change this for v2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
