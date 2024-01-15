Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B7DC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQjYpNvP1jDi0TBcsV6cUKVz9af9pIafV6E4CLyGhN4=; b=1pmfIWk/iMC5+P
	xKrRoQnYaeqShqxFuanAQECJJoUuYU7DfbBsSM5wo+F3X74KMz8MtV2MU+8hRtoVfe2ubjrBg0PDs
	vrVQ1qTusckaY1X+bUtxfLVCFuYVRYCcFVZlWZJgIu1A844OhCoxeqnet+2jbEeucBEwcmQ0WqTKO
	+1lf/rv4FX+T9vaVljGU/vjADbKvJ7ITbPNEvwhzsZTMCpT5fqAIT97MIvvDPk506dn57u5RDN8a4
	RDQu7AlPQJ4ufMGmyGXg8TwBGhe3j1INXHfXqnNNa+POO67aFYwY8KBzavA+UlEPQsT8tv1SworDF
	QV0o45y3r0A3JYdqiwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJX-009Uq7-1y;
	Mon, 15 Jan 2024 15:55:51 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJU-009Up1-2j
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:55:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a29058bb2ceso950694566b.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334143; x=1705938943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMrg2ftiySODP1utRQcg6FAO055EYrzqcviBe8d027c=;
        b=abPnFj6AyIrSYmtnpAcx5IJtSEZIsnA4MpMlp3ipc0fjTVQfVxSzHqd6f5R7W0+PCR
         BYRoHgLQS8RJwaW4xFQTFbnjP8PQVGZxr51OZGZU8qTZChcjXW3LEtEb6ae8YxF6Mjpv
         RWNfckzjQK17G28n5YHIvGBBjJvs4jnI4GOctyyyRxNc4DaHcmOcfAAciPei+w7iTxLN
         o5yPNJsaLlPjzt/2FUqF0CVlyjAcA5lOYG/wYslEz8ErjgIFK5wabElzsUMSI3DCX+PK
         o14VS2/hpDg+UOkSR/QS7mJgVmkKJ46x4ZkHP4LrKub3oauORusHBmZNTFRUujaLIZ42
         MUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334143; x=1705938943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMrg2ftiySODP1utRQcg6FAO055EYrzqcviBe8d027c=;
        b=FqKjzzpPB1yptiL/IfeGsPqjrTreSYjV3UOlFUotPwwg+tQct9/iDuDmGr0/9r9mi2
         FYvvWyEWma45eg/rScDsw/M0jGA42hkbYDz827P+XXiNN/VL6+b36l8Sy6dhQb/Yd14F
         jKUTVKJyMKXGm64CRUcChQw78BzOvwsLLBSDfBQcJEge35GOVsZ/l9B2QrkMediiydCj
         YFBcMLc9PXW+QrutkdHXyKHLE4XE+Y0enoMbp5dNz/wrecEYJVI9qYlmcKtLzWa3Z6d3
         IXWcxP5Uz6+DnD9P41mBcaP1WAvkU+vvWoufYtbqreXu5nWumLCAa+t5asGSIQ4WgjqM
         Y/Ag==
X-Gm-Message-State: AOJu0Yyb8lnNNAwJUO5UMbtxLezWe/g0w8+jZDQzoM1QKy0QNx9RZ8eP
	Nwy3eqfzw52V0rR7VGSzhjqY96NU/PWSfw==
X-Google-Smtp-Source: AGHT+IGPRILw6QZUdJm8bg28ZEaLAG0BKzFK5hzPlkBnp7yvq4KUBRiZDFadwrpsjQbzjOOl7WxqQw==
X-Received: by 2002:a17:906:fc10:b0:a2c:43d:3fa with SMTP id ov16-20020a170906fc1000b00a2c043d03famr1870560ejb.122.1705334143308;
        Mon, 15 Jan 2024 07:55:43 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v1-20020a17090606c100b00a2a04754eb1sm5430467ejb.8.2024.01.15.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:55:42 -0800 (PST)
Date: Mon, 15 Jan 2024 16:55:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 08/15] RISC-V: KVM: Allow Zfh[min] extensions for Guest/VM
Message-ID: <20240115-a20755a0a5fe14b342814b16@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075548_891229_7577A2DF 
X-CRM114-Status: GOOD (  10.26  )
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

On Tue, Nov 28, 2023 at 08:23:50PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zfh[min] extensions for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
>  2 files changed, 6 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
