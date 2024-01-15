Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F71AC47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zre2msqZI68T6udhC/AVbEwBbHdC/c7B7wbOzYaKUPc=; b=yy+6lRnv1GGETt
	4EoIsnfY84UFlTghW/rZkayX92a6jK00GEFBWc/Drtkbu5qWQLA1EruzKVlioCbayLf/vh/TpF6zB
	mfbsTjWqSKl+A2s/uf4myqP2JtI2saDllhH7IduqPS/HvrAfBzyu671+9hP6lf+bEwlA3irUqr5I9
	DqSDZoxdcY+piVgBySe8ufyyaXe+e+FY9lI/gw3usUfkxJ0N2DKAaIp6tUoYAw2pyMwQKbOXKtfoE
	MJi4SXep/7oZiPPiPJzoInL10G+9hxUSVCja3R/E56BmdGIZy3pl0SFwg5VY6CfrM7dJQsCUVDNuZ
	bZWD4/siRzf7UEYkCSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJg-009UtR-2G;
	Mon, 15 Jan 2024 15:56:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJe-009UrV-0w
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:55:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso9956096a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334156; x=1705938956; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+xTwuofjQl5aKgUIjY8NZTzaNnDkG+zx3D4vMfYK3I=;
        b=EkDxsldacLnGhJur9kd4EytVxC1XfrVnpjGbwahDuwaN4UBsAG+iRJdk/N6omhxB5j
         kZTYnYOGBbbaNc1OenPfNYzMoC3I1sYkC+2ncFE9BLPWIkHntk6XkNQWWQrekwoyUr2t
         2o+8hNa3H91LJBlix2WVHwjtvMdVkmFwlTfdMJFTCXPT+IzuYBHZg0EkbIevFXCkCKy3
         f02C4R0lmHwOh8S0GcQpGT71usPoH88/xFbzJCIypdPbWEYPtAK9JmzDVytoXhMgx9ND
         ybcZfKD68KyCGvHqc2goMecP/q5osofABg9XAaGH6af/9bfaxAbkUetLSu+KZ7fi9HzD
         BLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334156; x=1705938956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+xTwuofjQl5aKgUIjY8NZTzaNnDkG+zx3D4vMfYK3I=;
        b=TGhwP+CHE7eY7jNcg30Lm9hB+mHoO2rww+VDnce7FbsZlbs5bcsXoJiLp+lcOuzdlz
         5RDsZmuGD2EH5fwDFmahfg6TVLadjCIhVySR4zNlVYu+isZBjroUT13p4BWC/Dz9AvWV
         rK3TscAxRO5uhEBiyUo3Jfhs3TWmxfNZ1xrmEZi+C2shvxNiQbjMmQvOcB+RmEJnj/nB
         JNZ1JSR0+R1zEBK4Mgk5S/zwSddbp9xzKjln02WoFfI2yBJ/DPjOhpiTnvQwiNwjMeS0
         snZI+vgnOgRRcg9n18v7zR7zkr39opcjyN+K25lcr+dHDuvbleZboyGt/rSFrrcKiEbD
         tT9g==
X-Gm-Message-State: AOJu0Yy8OZR1ys22RmkhQHKtdfUJfC3VTIwx+LsrJwvuX1naHJ/v7dxy
	czsyvoDKj7hrOJlmM5Wh9pLao4ZNuInZvA==
X-Google-Smtp-Source: AGHT+IFoM24h3CeGlI4z1Wf7BKBwwl23upM286tKeBN01c44mvVDI4K8ywmNnWZGwLdbFaiQlu6pcA==
X-Received: by 2002:a05:6402:b52:b0:559:79a4:f104 with SMTP id bx18-20020a0564020b5200b0055979a4f104mr47138edb.74.1705334156089;
        Mon, 15 Jan 2024 07:55:56 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bo13-20020a0564020b2d00b0055627eeb8b9sm5581547edb.32.2024.01.15.07.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:55:55 -0800 (PST)
Date: Mon, 15 Jan 2024 16:55:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 09/15] KVM: riscv: selftests: Add Zfh[min] extensions to
 get-reg-list test
Message-ID: <20240115-8c3ba83f0b3036bfef72b786@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-10-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-10-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075558_328404_9F6F8D06 
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

On Tue, Nov 28, 2023 at 08:23:51PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zfh[min] extensions for Guest/VM so let us
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
