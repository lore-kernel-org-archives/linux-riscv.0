Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD93C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9otrKa/m7dFJKL18Nkg1d8vQM2VvRBBgL2bhWPTls0=; b=nSe6Qp2CvpbbjP
	8Cb4+kYf8Uoj8Rg6eyvAtOk3FWDJqfmyjq7G1JdhWPu3oVy6tX/PLFK9u8O9kLcnNlut+e+1J5Pl8
	ScEN0w7EkKPJfovi7xj8BBQMUnndQJdlhj7b3eEcMSWRqL5Uq45GH6/IHbGE7pnX65wtvOW5KLdjM
	juCPTjFwmuHjC3Gf9CwE1nI5ru/JN9+0Gs0SKAWAk0ADMK8LEazLzR5rZCIGxu1HFozOx1RQC+KHU
	mpsYqT88+n+hUaZr+FBvnJ6MXzcgpwuEB54BDWGtRw+41u7QKfsjxML6uP/QMF7CdZ5bBOBQVpP1u
	q+Ad6dps27Dm9RrR8biA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8c1g-002vG3-1m;
	Mon, 12 Jun 2023 07:31:44 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8c1c-002vFF-3B
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 07:31:42 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b2d9ea4901so1357625a34.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686555099; x=1689147099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nx5q9fhjV96LWcx6Jfdpvto0r7F5SkawxjUbzYMVbU0=;
        b=eT5XQlBp3JB6as/gjlQ5au2yEWvcA0ehIUsxCZGBzEmeNx0MNIfmOvcf+RPT1vP0oX
         Y+7HgcnqJkC+pNuTXX4hhomMxdSASeICstbLqYzLp0mmBpkgq8WVscHD3xK7t7tfmKd5
         ipC9jAjS5UQ7feubrMoKrlov1vAdeaZTrPqvGbz5h0Vpl/J9d91/thC7dsh/qqJCpfPY
         efJMSfeFWvXGO59M6wfZSh89HFvv+HARTtzqPcju5XlEte9qAy885bv49Ce45Iu6dAWS
         gyEqquZrBpmhFdSFMEqQAdZ90e+MCXf6QBnlUixZTF9kx+rtFHZ0mQThRoUE5Obbh1Mf
         miBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555099; x=1689147099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx5q9fhjV96LWcx6Jfdpvto0r7F5SkawxjUbzYMVbU0=;
        b=SkigmToURhjlBPH+Pjxp+4I2JydzpGYy1xDVi+B7dTjtYliNx7mqVLl5c3pU/Bvg9U
         8Svo1kWjYOws5Klg4/iz55xBOIrLug9FTJxsHdhD+JN6/ngBk0usZcRVCcwNrNVjut2b
         7jQ/AaKaf40cyzibmgYpHB3Nx4s43pr7lEkVL8nNxzJJ8Duiv5MFFmKa08t4Wx5FDH1+
         yzJOUXe7opWY1xM6unHRww3149+9r2Ajc7JzuOitTu0+e3sFC2LTe7KMrFhcul84efEF
         VnIIeuQbGquPwK7Oky46D272Y8gFtmArmSClGE9HfVqTsaxD+bDsGFVyb8lhLQoWmvzs
         V8iw==
X-Gm-Message-State: AC+VfDxzMdJXbBGRtw7loEH8lJj70uS8woT0n/hRMhy6IF70xxRbf/AC
	DzKfpGFkNLJniW7J/gHKJOSgVw==
X-Google-Smtp-Source: ACHHUZ5Ap9pNRWhgpC8RvE81RET8/5ETAo0vrRv256Y4Zcz9SkmYPZaSO3HQiai2JyOZSVOBWpGZPw==
X-Received: by 2002:a05:6830:110f:b0:6b2:9c7f:bcc5 with SMTP id w15-20020a056830110f00b006b29c7fbcc5mr5691081otq.22.1686555099149;
        Mon, 12 Jun 2023 00:31:39 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id p16-20020a0568301d5000b006a64043ed69sm3674667oth.56.2023.06.12.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:31:38 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:01:31 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Yangyu Chen <cyy@cyyself.name>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/7] RISC-V: split early & late of_node to hartid
 mapping
Message-ID: <ZIbJ02v1c/dG3ywb@sunil-laptop>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
 <20230607-glade-pastel-d8cbd9d9f3c6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-glade-pastel-d8cbd9d9f3c6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_003141_019648_F6D05110 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Jun 07, 2023 at 09:28:26PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Some back and forth with Drew [1] about riscv_fill_hwcap() resulted in
> the realisation that it is not very useful to parse the DT & perform
> validation of riscv,isa every time we would like to get the id for a
> hart.
> 
> Although it is no longer called in riscv_fill_hwcap(),
> riscv_of_processor_hartid() is called in several other places.
> Notably in setup_smp() it forms part of the logic for filling the mask
> of possible CPUs. Since a possible CPU must have passed this basic
> validation of riscv,isa, a repeat validation is not required.
> 
> Rename riscv_of_processor_id() to riscv_early_of_processor_id(),
> which will be called from setup_smp() & introduce a new
> riscv_of_processor_id() which makes use of the pre-populated mask of
> possible cpus.
> 
> Link: https://lore.kernel.org/linux-riscv/xvdswl3iyikwvamny7ikrxo2ncuixshtg3f6uucjahpe3xpc5c@ud4cz4fkg5dj/ [1]
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
