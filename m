Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16F9CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=he2j7H2BKEZDzLuisWBO4H0jiREHS1nFEbqTqYFTOQY=; b=kriFRjH6kAbcGP
	+AFaL0h8sD6j/XrD4ew8KkPyd0nsrxUVN9cixUZlOQjBLrQC/FW3j7m6rvpYTo3RP7YPNKi0YmA4X
	bheYPZIb628U39Ya6gOhvQ2XRRJ+zKBRfAkq0RgJZGG4spBLyQx+fZFd7KMDsfa0ra3NNxja6aMxE
	svuTOOR1xw/kRpbB+bwN7kFFXQBF9Tth5UVPePXaCfAgyijIWDKw6lIrYme/dg68gf0lzeN4+GRjd
	i6/jKMKUs/Bg0r7dWBaWl4jg60BWcD6SGMTA1DeWMgWP0f4NnfC4pW3RGJWACMNbSrIUzQcqqSCGB
	1bsBchGWx6+lE+3Dm5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLnD-00000002VBo-3689;
	Thu, 04 Apr 2024 12:02:07 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLnA-00000002V8q-0gC9
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 12:02:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so3570952a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712232120; x=1712836920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6sgTwxk9jhbJgHBwC7uiEgEw3bNU/OxwYHoyLaglJk=;
        b=gFi/XiCFsfTX3ouH2OJVyWErVcYkaty9F5OBWZwf2bfZ3dqRWsY+xV8WTPFXV/Ilzj
         Bh/FW5ewElE9nGZR2zz34jfVg02eNNnHH80kbiNqU6pkOrfFK5pxoXed/UXmz61XA2Qx
         0QT8YzNDp8XAo6WtSXQlnk9PObkHPKblAzPJvx4jHU2C0nxDrmXwJOv/tGAuoh3EVfkK
         UzzUDWZlHDEXFSZ621p9Mu1UlPYrwIiCafafLY9aoQpEF9E9sB83eIOBfOpwFCFYd8Ap
         g7GmP+G0HSe2skmB+VeO5LyZwdkuZ9USuuIKFzg1cM7ewLYO74cNwxkb24w9ck3c6mtT
         3N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232120; x=1712836920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6sgTwxk9jhbJgHBwC7uiEgEw3bNU/OxwYHoyLaglJk=;
        b=HT7p72KkltyaUvdGkXYii4zX9uWqsXaO0/itmYcwIxU306oyjSFOds2EouSSMjZqPp
         gCg1WYw/19JHv6axVPFphpLykE0bztR/xWgKWb3OORcsJ7/EH3dpwp/3MNiC3gHqUNyV
         kPPyFhh9Qb+8AeCdAJfesSok0KvHq7YCknq5FT2MIt5kINZUgNyA4cOYLEs6Zm7isuxm
         RAYnMRhXnQkoF68mTn1wwqUg/c/U/xweyPPRIgErDzySemZxc1YqUE7FhQxhw0oWJMDW
         U2DevrIslMw2L+iuoBLj76A6PDGOpxmN2zbFnofp2zg+ThJT4pfa2a0thIViWNh4JHEa
         86YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjM5cp0nXnLnR5aO24c78QVI5EF20vj0Rg6CAQd5tffO5iQJ7zbTguMWcIsWIBbkCvddrSvPVKXBqDK3J76hoRLAs2XjQUQgNqTast31jY
X-Gm-Message-State: AOJu0YxNrFhJW3rjQDdX1pPTmKIye8C2Y0FgubYh4zcnQL7hraEFSINq
	ryH2ZdQiHk13ak5vdZrUWOkMEPVrT1OuH/m5g5MogjY8H3ANF6ZDVSkgipEKWKk=
X-Google-Smtp-Source: AGHT+IFp9TuLXZRqsWbkDSS4HE72CGMNStdZzxnFkRk5hlzliQxjfRqdZTW+nZQ93k29lkL/Bq+HhA==
X-Received: by 2002:a17:906:f912:b0:a4e:13ee:5dec with SMTP id lc18-20020a170906f91200b00a4e13ee5decmr4834184ejb.17.1712232119747;
        Thu, 04 Apr 2024 05:01:59 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id la6-20020a170907780600b00a4e2db8ffdcsm8202481ejc.111.2024.04.04.05.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:01:59 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:01:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 06/22] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Message-ID: <20240404-bbfb02e3aec944f9e11745ae@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-7-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-7-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_050204_255490_91ACDE7A 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 03, 2024 at 01:04:35AM -0700, Atish Patra wrote:
...
> +static int pmu_sbi_snapshot_disable(void)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
> +			-1, 0, 0, 0, 0);

The "Rename the SBI_STA_SHMEM_DISABLE" patch should come before this
patch so SBI_SHMEM_DISABLE can be used instead of the -1's here.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
