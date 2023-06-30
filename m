Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB89EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gce19bUy4nfnomwYVgLskrftMP0LA7ZA96WMBnMyNxY=; b=dX783ntUcY0oV/
	iGq0r/QAiiOh7aT+mIyouKwY5g5rTVTfweY7IeyEt40BaFOWlXV/QVq2nCA0oD/2ujmD+VNufnjBB
	261C/22o48R3cnn79Rlx3zrmEDrwo9z1a+0FdC466w2p/XLHs1QqNw00O8eSXiorkwgOW8KYF4BLq
	ksieyBlTTyDVO9/FhEcfUZcB0snIXx41jwzuhiMLiN4lt87STJaZK2wnElalbBUP128Mv9MYUxq+B
	8wtk4v/Eo+eOKgRIDHSoi13j6Fad9S9T13zSwkc+Gltqjdjg/eZT7lDIK9i0UtGM1pE0qzpqyt4GV
	ymGk5BZF3mA65HQMKXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF99B-0039Qm-26;
	Fri, 30 Jun 2023 08:06:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF998-0039QJ-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:06:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc63c307fso4828945e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688112383; x=1690704383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viT9JECut913NkhaxC+A+Yftx9jXncyI0/V/v679J+8=;
        b=cy4mnPeSE1UpNyfh41OanWkBNRIkdUp5yq/VuZAnBDtvYyo/vkjSofzVbEJXU4dx8d
         Si8M7+ExVOTaRC8zWBWMTqMd5smlpxyMBI+OWPJa5PtdLleAmW4Rukw0fZ5/SfvuKjUF
         oTv8yZ1roSAZLy83U+CNttIIb4C6Xu3zCmO0OH6Oj7l36UEcwdH4Ys+NdylISJh29wG3
         rtfVTQVGTvyrSMv3j7pkBbzt+RA3TDOL1PXHE18B08siErwFIW5ciW11pzdR9/ETIL/A
         /pTe6WX2d2JFpoQczHldUUDMPnwrVXvdOqZ0aXIPypataPE+Cum1WZt0l/ixM3XiCrdM
         rsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112383; x=1690704383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viT9JECut913NkhaxC+A+Yftx9jXncyI0/V/v679J+8=;
        b=VIREMPeENM4eOUzY3agRl3sRnl9H9U5daADDQxVclygKjayiO+8cQJueJAoFar0dJc
         /B/4j/UGxv6PXdz3ucmRQDtqtk7t05U/0LF2xVd6vEVSXgaiad+KMzs5BOmnY14/flPJ
         S7hmOlJ3Kf2gZragTfXbuh8y9jQFr37GnUkVOjGSJkDLhSoga1tKLpFrj4KFGF+Oq6i6
         bCSS+zH6shhJ6vxk80ywuTYSAvPXYNZo3N8T7Fwah78LF4nmhbGVUDbfdcTQCyu6XdnY
         co1cRRvQGn1k0s+0W8usNqzeOHPtQae0AVdYJipxGz4UQME2+AYVqaaXfWB8Xetj9EAe
         swmA==
X-Gm-Message-State: AC+VfDyncJUCR3/DExYwRiqhnjDZEr6MYZEetjSo5aJ6ZVn/AhPqknm7
	Xrxv3nguCy+fk5FBIXD2hJYnNA==
X-Google-Smtp-Source: ACHHUZ7do/p9dpxtAgr0sts252wfnq1JonBGA+8Y8vxA+XqsPE0eySOMIJuppjoHgTpk5ZwN6sTJtw==
X-Received: by 2002:a7b:c445:0:b0:3f9:b7cc:731 with SMTP id l5-20020a7bc445000000b003f9b7cc0731mr1390446wmi.15.1688112383185;
        Fri, 30 Jun 2023 01:06:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a10-20020a1cf00a000000b003f8fb02c413sm18407890wmb.8.2023.06.30.01.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:06:22 -0700 (PDT)
Date: Fri, 30 Jun 2023 10:06:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Provide a more helpful error message on invalid
 ISA strings
Message-ID: <20230630-23916a0715029ac07d5de6fc@orel>
References: <20230629223502.1924-1-palmer@rivosinc.com>
 <20230630-valiant-chimp-ba079aedffe8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630-valiant-chimp-ba079aedffe8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_010626_828823_D9692A04 
X-CRM114-Status: GOOD (  10.22  )
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

On Fri, Jun 30, 2023 at 12:17:27AM +0100, Conor Dooley wrote:
...
>  old_interface:
> -	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline)
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline) {
> +		pr_warn("CPU with hartid=%lu is invalid, this kernel does not parse riscv,isa",

\"riscv,isa\" to match the way it's done below.

> +			*hart);
>  		return -ENODEV;
> +	}
>  
>  	if (of_property_read_string(node, "riscv,isa", &isa)) {
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
> 


Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
