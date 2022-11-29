Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74464C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUPXjoqPpryVfRSvBnG+fyNLgTTpxIqrkDtxi/K6wvs=; b=cSgoMzXUu+7TCu
	VhrYFhr7TjClh3uaE6XRN7VtjQryBCsTaa0iApliizBGZ4CX9F+5dcskmV17AbSBoJhesiEdDdGpx
	NzRph6tsWZYRpjWaL9euDA4zHETCRmVPuRoV2aVfr94vfiOpwgLeZidYGerZcEXJvH9Znp+5/R7lz
	QH8SnbokCM9tOgUt5m5Aa+53hHfVymTiU71wlA0EUiBx8Stg3nFOc/46YbZ1vkVLl534vaxqStQc+
	O8sfrcnQr3hxlu7kKBy6du0nVH8JtButt30QK1XkCfPiU2Bz3mRvR/D/b+JJIJr1WV0A//lcobf2H
	AbJZFrxYh9MpeYfyzNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt3z-006Nv2-1w; Tue, 29 Nov 2022 05:21:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt3w-006Ns9-Ie
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:21:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id n3so20301665wrp.5
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 21:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYIgS9wavWTQxom2MJ9tshe8CLRx28IqX95DlGjmTVU=;
        b=ILN9ASxgD5Mclt1SjFrHgHV0dysZ0WP+PKmni3yTjqjyFxE0exN5YRpwgFxlZ1oTNG
         hVfSKHaheY5vLb6XcwCwK/H6E+uwyRbr8vyMHi+hvpv8kc15wr2px1OCot+8lI6Q4CuC
         6LbgxuVGKU7GDlGfhOflU32KTb148z6NX80x5fUZFR/m3lXUZ0mG3KEKF9VcnfVl9HW7
         aEK3IrDJao01snfQFniBjN9fLFKaTHdnkQhP75BYrWvmKNlwUEowGaC/+2Y0O9TPCMex
         FyAh6tt3mA1h06C3tVowOagZ6AZ69wqkCprBkG6WRp9DOxZZOMLD0MEVZZOcO4qeQlsp
         NP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYIgS9wavWTQxom2MJ9tshe8CLRx28IqX95DlGjmTVU=;
        b=TOGtzr/QLRs1K8/yTr9ovDcCeN6/hIeg9MEeNY/RizS9GbNlSML2dMDnlubvXx2XAD
         6y7u+/D+BPFjnxZGJlqxV2rPAWfgFwIQlAgHB/8hWHKQXP3m3ap4z3GrJAHbCarPbB/E
         tjfkWVUabgWvwFQjnT7JeRDOCSwjkk9mg4xNkeCMaLQvOc1ghCAMQa4fqoGhT6Es4d/V
         8gdVR8nkcmFz47evb+cLJKDQJthDJt0YKBYdvr96E+slCqGO8PDUMm67w1pRWSbAR0fH
         6hexQDhlMmaIAu8YGfqcHBU5MBzR+rQdu29ZYXahtCW1D7EDIssMruilKV/6vWdu37Ct
         51gw==
X-Gm-Message-State: ANoB5pnMZ7PDdHM3Z8O8VWQ7QmOJfWT7zznta7rTm7d6BSBQNe8M5Elb
	ygRAh6CUWtJmFFmNHL92DT3UVQ==
X-Google-Smtp-Source: AA0mqf5RAQI+qSWpaCf/qgkdVGaOnsgmv73eZHpMRbLqpYhxE+0JzBIjypWTrIlCw7OVJQtx5MZ9Yg==
X-Received: by 2002:a5d:4e4f:0:b0:242:1a8b:98b7 with SMTP id r15-20020a5d4e4f000000b002421a8b98b7mr4282228wrt.699.1669699301144;
        Mon, 28 Nov 2022 21:21:41 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y14-20020adff14e000000b00226dba960b4sm12733162wro.3.2022.11.28.21.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:21:40 -0800 (PST)
Date: Tue, 29 Nov 2022 06:21:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
Message-ID: <20221129052139.t7txrey3u45ssl2u@kamzik>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128161424.608889-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_212144_635439_C20313EA 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, Nov 28, 2022 at 09:44:21PM +0530, Anup Patel wrote:
> The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
> can be used by KVM module so let us export these functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/sbi.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
