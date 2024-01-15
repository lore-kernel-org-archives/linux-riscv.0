Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8594AC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2Yr7iGqHDz3KJh/GTHmKvPEKUpf9x0U2vcbnpidx0M=; b=Unyrqw72oYhZdl
	6abhrVE7zMbnfwoCTDU4ck18J7L8VV+f2tBdxgjTWhWVnpQgb53IUihV2xm7pyM0p6teGBkKvdaar
	jTFsK2tNTcqeIYcLVkC6DLweMvybdIrVQPZDamRleYXsPwbwjExyJf6dIP/J3sHjFDOIxPoiofKuS
	4KBzUpZod4yNvNbFjXt11RTAkpucguZ+ZDhVJHUha+j04/EdYSraRQ11CT4TNk1nxsYZdFSb6jL+1
	t7Y7x31ZXCufYjO2JjlVLLnEz5v7H+OxrbAkaQYnrl0bxCpaQsJ1Rius+yZ/wYxCJtHfNjZ9sLDPU
	dbfPYhd0Y7joYDV9pP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKM-009VOL-2c;
	Mon, 15 Jan 2024 15:56:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPKK-009VKu-1U
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:56:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a293f2280c7so1045358866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334197; x=1705938997; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=id6GIS0plSeSDJxIJu2fNwUkpjmVOZ3sW40Ob6YefTU=;
        b=iuB7eIAmKPmoJhWQ5Fkmhb0CJ3G3BoOFm1sQicK6+voEMQZSq6PEj3f9h4CDfPrmLz
         in1gjEtZ143l+Vma4oglcbvGpAQKy8Lb5QG3le+cE/tAaiJsRxIrYqXd1b6weZnMMSDV
         FtQMilIH7724yfc41cEHMkMm/DAQMX2A/qOzgw/9gqa8JzswtI2+IuJk9UUFqJ4uetFn
         5sbklrdrQ+OFh1nE1KWpR9POEGcy9pYWsDumEp43l67b5C3kLq83vKE1xkqVkX6OlXLD
         pC1ErMkAV/XMyRRaojNXM2G1o6Tu13BAKXO/kLTFI2xdHWgxvphEJQ82gdk5/mWiBi/U
         i45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334197; x=1705938997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id6GIS0plSeSDJxIJu2fNwUkpjmVOZ3sW40Ob6YefTU=;
        b=DDk29hKy1Uw2XrkG8/xfsJ8z+7oDJYsljg9Z7Xh3aWwxu78Sege7Ex5Tq2S8SXz+/X
         WKmJTxQMJrRV4j7Xdg/dSz30Nowly9HYaulX/PmakpFyisvusAGMk8B9jSSp1h/7k2Ja
         bAZfdjOyTLHYtT1yqA+X8b5xvwId2ovCKXZ0pEwCZA59Vh/KkM5o5YW9Yum+Ali1PslQ
         49ps5CSWKuR4dWTk3sKNTV3sKUXCvYyOuetkQhlelxPIpd7myjXuTOG+ppztNvmjePmt
         hbd2lhQVRduHDaLjAeYamxuvJKPcq3el7LZex0RQQod0++GanFRHDbecwQNfMQSOuUjU
         Gnvw==
X-Gm-Message-State: AOJu0YznOxd4OAfQ5BRWaZehTtGgVTkfqquFNiDcu1MEPI8jzB6ggTX9
	mBi3OW7fo696+xZFGfFyqASArsfwRvz6jQ==
X-Google-Smtp-Source: AGHT+IHTR63/66h2n1q0UBJQFj1+Ohm1ECgpSZkt/CgPr0dV4y0NxCNBHuj7u2K/R2R9jSItC3Mu9Q==
X-Received: by 2002:a17:907:d382:b0:a2d:99fa:94fe with SMTP id vh2-20020a170907d38200b00a2d99fa94femr582298ejc.58.1705334197430;
        Mon, 15 Jan 2024 07:56:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906528b00b00a28fa7838a1sm5474592ejm.172.2024.01.15.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:56:37 -0800 (PST)
Date: Mon, 15 Jan 2024 16:56:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 13/15] KVM: riscv: selftests: Add Zvfh[min] extensions to
 get-reg-list test
Message-ID: <20240115-317ad6428b5add2b27617f35@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-14-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-14-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075640_502766_7BE93AD0 
X-CRM114-Status: UNSURE (   9.80  )
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

On Tue, Nov 28, 2023 at 08:23:55PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zvfh[min] extensions for Guest/VM so let us
> add these extensions to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
