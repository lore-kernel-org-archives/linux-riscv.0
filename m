Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92E7EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS4QqPLiG0zcEApGpZOZv0R5OT6Us6WzynnOGZyx/ww=; b=1y4EVZHTEKUICU
	/CKIUvdXdFU33NL456aA63l2Y9sqv0mkB3ChDkM3ebLxwaurANYw/TibWdKdM5l8isVCT+8dSHuhF
	wGqnUji2jutEP2YTqP4bCYgY1arZZEJTpkbPyxBryivFwsD9Wht5dkz0JkB1Iesnxwoa3UzOYGckS
	vInllqPxK94ToqLoseY0ZFCpWSzoKkCPEMun/NRW91JK+8KMkygI7MTug0lGpZ2cNQle0X+1cVid2
	rwW80f5gTDHNqMoLoh2+RPhvpXhDJV5IQHX9Y131ixTiWwuaqOjmjgSsPPEpoRb+vNV2V21qvmzdF
	Vr44UMRYvYe5p3pJ9Ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgT-009onb-3A;
	Tue, 20 Jun 2023 00:57:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgO-009ojC-0A
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-25e83254ff5so2638256a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222638; x=1689814638;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDwfEXS4UcUdADaX0jFk9MFHU4b/peplLYhaMJzY/3k=;
        b=roMX73tvFgCVlgpykNlqo/y0zB4mYwpeb6Vaov04zBRhEKiRbA6/FwYdCzk055waiz
         jXqy+uvxHUurHNX7wRZfYpxPgaqkoxvtM2gci1yPnsLSu+nBJkyh8LsG98Tfz9u8GpPW
         Ta4mE7ZVeuHK+iDGQvrrGjtEA9C7MOSU8xe19xbamfYj+nUYegkCEEyrbFAhHGJykJz4
         l6bsQw57L171vqYnIJ3R24++06JC8hmkyOPKa076mAjb2dHkZqc7BOALkcDYYGvZ+dre
         rRr0xf/9vmudE2r/6qKysWazoiQYOTsot81cF/S3h/sBhfFHvKFlbr8BXv0BlKajkJYm
         Hmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222638; x=1689814638;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDwfEXS4UcUdADaX0jFk9MFHU4b/peplLYhaMJzY/3k=;
        b=lVxcZtTO5Qbd/AFW9YgBf386jdRrYs+RRDJVXsUQCpLquL8MGXCYgYNxrnAORCXPW0
         4ZzEM5vwkdu5hX6LrUfEnhSs0s/C4zO4wl7iYW9gLh39e9o/Z4JR9Xoh6wp8m0Azx7EN
         8Zfqxrjq3APakAFSQB8TzAUMZOn4kgFlaQ0+TQ0H4lK0/P7kCQTcgaaNYE0FEbcC0t1H
         XnVEnN1+Qr678EbHOWL+gRIahO/anbqjyfOohYmEb5Zpo+07ZUB8y8EOprO9Ento40ld
         XAeV1/oXeBP/BCpX1nMJ5pcaU2Oiq/gE53oESon6CnvSoOq5mrQG/Gzf7PFyO5c+1kYE
         EbSQ==
X-Gm-Message-State: AC+VfDyytFgyZmKmTzHjshy6NQnIKOi9POvEh5Y9W3Ynpce2ACXOxFA3
	gAhTFMdUIO2GmanrhNIyam5l6GWOIuHC4i1HuCE=
X-Google-Smtp-Source: ACHHUZ7pft8MC7PJnrHEptg4LtQUB5qkzY1Vi6cRzbAcwsmpU4J/46TzpnS7b0dcw7vTjjnyI16M6A==
X-Received: by 2002:a17:90b:3686:b0:25e:8076:dd04 with SMTP id mj6-20020a17090b368600b0025e8076dd04mr21024368pjb.6.1687222638621;
        Mon, 19 Jun 2023 17:57:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id z20-20020a63e554000000b0053b92b26412sm264064pgj.14.2023.06.19.17.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:18 -0700 (PDT)
In-Reply-To: <20230607112417.782085-1-sunilvl@ventanamicro.com>
References: <20230607112417.782085-1-sunilvl@ventanamicro.com>
Subject: Re: [PATCH v2 -next 0/2] RISC-V ACPI: Assorted fixes
Message-Id: <168721242546.30028.5666286839056939512.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175720_092322_29A67094 
X-CRM114-Status: GOOD (  10.18  )
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


On Wed, 07 Jun 2023 16:54:15 +0530, Sunil V L wrote:
> This series fixes couple of issues required to complete the previously
> merged basic ACPI support series.
> 
> 1) Kernel test bot has found a new warning using the sparse tool. Though
> I believe this warning exists for other architectures also,
> I don't see an issue fixing this for RISC-V.
> 
> [...]

Applied, thanks!

[1/2] RISC-V: ACPI : Fix for usage of pointers in different address space
      https://git.kernel.org/palmer/c/3b426d4b5b14
[2/2] RISC-V/perf: Use standard interface to get INTC domain
      https://git.kernel.org/palmer/c/ca7473cb8312

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
