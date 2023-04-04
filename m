Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E02DC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rus7UjVZNXFKjoSLaQyZu5b11g5Qy0bylt1nrMNZds=; b=JoObcC6MUQMumg
	4FkzD23OfsKRbWCCe1Lvv6CmcTVuYce/2K9tekoKg+7+6uF+3JEfdllQLlYIQ7LNy6uQh4VzMkaBf
	HacL2TlsB8Fj1vF8XOTu/KgLKMSlISy/+4583YwSIuSxT3RFhW3SE54w+L7yfsJrPXmLvIMhgH0LK
	nrCQNDqv49legweFcPPkQOGdjheRfK7rzUrHowo5trJigCwljhC4y19huz12ZM23W1fQyJN0jhmW3
	7W8/HdjjnHlOXv4nHXU6GurcOyZ+tMZG0XLiawXhUjcPJcigG0fHNMZoAyO0Z/Dyk4CfNMvzQ4u/P
	5zJNiaQ4sJIn1bYRrRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjZN-002DQh-01;
	Tue, 04 Apr 2023 16:31:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjZL-002DPG-0V
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:31:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so2546868wmb.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680625896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OR8OPThlLXGOEBzYBzmSAN3iW0DfsF9WhugEl5eryYw=;
        b=LHZgxx0Uvqxgjrf9lhng7dAr6TPPHiTRSKrHXCTOtfOb8CYs4/EMFMoV1OzLZWpwGR
         uq1Jc8hrSzDxUZmY9iskBKhG6Gb/jRP4Ul9SoRgv/mTWBAwTA0kpBlcUwHyVMHh2XU8d
         j1BIZOEYD1hNgZfX3t+E5OEiaQjqGk76+ox4DnS/k/gsu1Jjtqpq1jCK/0uJB/7QtjTe
         ksE9+t0invgTY2bO5mrO31j0VH4o2dsGeuHSX/6YMIXa4rR5w8HXnQDkUILE/0p/jgw+
         u21UHAMDVVtuVrK75caes0MEJPONWdF3MpjpTGvyOeveu1FEpoWTk1XWupW9P4+970+h
         ByQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR8OPThlLXGOEBzYBzmSAN3iW0DfsF9WhugEl5eryYw=;
        b=S2TC1MutKa295rTPYfbVJ6XJ5+qB9lBUAVBOOCh5j9G99JnCoVEbTF8/sse6P40Pxf
         A4/ASrcqZrXPwQg5rFuYPZf7WZ5pq2IaoSXl2m76Z/2B3l80V/IRcJ6S5XV/sDChm323
         BE3LxQ3HmGFxL7S9LUTe2rkWT+siLj7euxketT5Snn72LZyK4Czmfgztz2QOR/wi0BFm
         1xsI1zc3OYaWZkbei7UKfZ/3OvIGk1erx0t276SyISWhHyFLJv0HGVZRRCUYrrKGXH1E
         VBAEFmflgf2EjZP4vxx+C8xihmzRdOstWXkomoWJaNia5x1jMsEfAs3Y/rn7U1vOh42O
         Q3cw==
X-Gm-Message-State: AAQBX9ekfQdJNfdXKzZHGs+KQ2l30J0ETQ6OkpM1W8obOumos9nBBwiB
	qrjOHajbVWiVnLLE/Dh4bxtoeQ==
X-Google-Smtp-Source: AKy350ZseW52UBeAArx0IxGVHoPjXIdN6gGZt5kcC1a0WaT1cApA3EPSQjy49IG1EcXf52uT+yvriA==
X-Received: by 2002:a7b:c416:0:b0:3ee:6d55:8b73 with SMTP id k22-20020a7bc416000000b003ee6d558b73mr2636111wmi.29.1680625896621;
        Tue, 04 Apr 2023 09:31:36 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p1-20020a7bcc81000000b003ef5b011b30sm15638088wma.8.2023.04.04.09.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:31:36 -0700 (PDT)
Date: Tue, 4 Apr 2023 18:31:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/9] RISC-V: KVM: Virtualize per-HART AIA CSRs
Message-ID: <nlvhpt27vgfb5huoexrv2xs7yeq4hdd3fna4yozfb4nvi6s3ky@5srurtxs3cjy>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404153452.2405681-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093139_192258_AD76284A 
X-CRM114-Status: GOOD (  11.88  )
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

On Tue, Apr 04, 2023 at 09:04:51PM +0530, Anup Patel wrote:
> The AIA specification introduce per-HART AIA CSRs which primarily
> support:
> * 64 local interrupts on both RV64 and RV32
> * priority for each of the 64 local interrupts
> * interrupt filtering for local interrupts
> 
> This patch virtualize above mentioned AIA CSRs and also extend
> ONE_REG interface to allow user-space save/restore Guest/VM
> view of these CSRs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_aia.h  |  88 ++++----
>  arch/riscv/include/uapi/asm/kvm.h |   7 +
>  arch/riscv/kvm/aia.c              | 322 ++++++++++++++++++++++++++++++
>  3 files changed, 382 insertions(+), 35 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
