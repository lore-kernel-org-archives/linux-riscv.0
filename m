Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD0DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5DVeZ09xMoYwrezN0MBwckk93spnyq2kawm4wUmCsk=; b=WasLnMNZjkf6yb
	+awYGlTqzugTanY3TqXg8ObZraKnHSzefg1oFp/EJ+xb6YkVsyWNcMGruik4rVDymHmnje9qjNqzN
	fxXDrgU+unM6wZmo89K1E9FFCYtrJyFNhXzN42Kmxt0kAGiebgeyALIbpa4KecWhOad6u2SMUw+EW
	h3RAVUjuZPmGMSa/vxnMZEEFPwBfWXza8LWWkR7tffasjy1EZDGvCy3MgsZnRl8SOESyYqBQ0gf6L
	Kq6G0S79D54ij6V3FAg5bos+6CEc01Cq4nNmQNmeZhCrKLj2Kq9YItEltjqRgN4CbuIMKOs9+KpfZ
	r0hnSfRE2VuDTTSTLOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ycO-00BIaD-St; Tue, 13 Dec 2022 06:18:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ycM-00BIZN-Mw
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 06:18:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id 4so8617420plj.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 22:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTFwDLlgOeHNI6Dm6jsm1vXO5FMUxek2Gk3N4ANJmq0=;
        b=L7TybuH5LCvauKz7RjNOVfsdBWSD+n0aqdrISEaq2OHQfkDU9FKrTF8LZcCDdD21ff
         7gypu6ZBfxRWGxy93IrFWhnnkdFkMhtkhlP+ThDrDhUyvSmL4bJ72VoxqY/y4tFcZalz
         LH1eV5OaG0EzHxfHQIxEmkskjAQ0pv6eNmBlWfMfU9W1SArcQC3szuAi9JoND4OCOlWk
         gv8H6aumST9gVWpB6QlAIpQbr9JzqvKmwfT3TqFpAjj/JRZSCzhnHj+C6NObq4m+D3zM
         72r6PdB0AInVk0rsLcPhr9tthOCBGTUvXQRnIwhyk5CQn0Ez7a3r2e92ytRu1yzAKmOB
         AHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTFwDLlgOeHNI6Dm6jsm1vXO5FMUxek2Gk3N4ANJmq0=;
        b=oBr6pd+4+48WcYXCdymxi7sP2FxB/TzK8Vn1m124XMJ/A7MbpjnRfVFS4Pa23W8oO2
         yemhneSZ3CeLhbA2/HNkjfzLmLl1cODkJ+TqlwcNZMZOHncn8scCxIwfVQr3uaDZuRRW
         0ByP1J0U4br7V/iMlH3FzOQsk1LGmcyEU8X4RPaEkiFnYkJqp3lr4BXxRXRSiZjJYw7Z
         X/WEBmsEM9aPcD2y89Vzkop4HkPJUJSM7f9IVk6fRIz3XHX0M0kKi7IAzFwSQYZUKdFV
         6f00BGXnxUbWs/Jqi+yVTFd6X065b1z7g96ShqqXuF7j2ugc9aYCxbMJS6yvF9aUjdYC
         ePrQ==
X-Gm-Message-State: ANoB5pnUzvyGe/WJeMCvY49Jl6LKMgPLHnUhLx8TgmMXYNPwV9B1kv7M
	bPJUHbU2zycBmutUC2Auf2tKecuo92QFTAqb
X-Google-Smtp-Source: AA0mqf6QQtTaJV0DxtM+FDl7C4MFq1SNb6ynvXzoEP/xJIaw5VGSi0FaAUA8wDa6ThumgMSNngqUBA==
X-Received: by 2002:a17:902:d509:b0:189:b0fe:d70f with SMTP id b9-20020a170902d50900b00189b0fed70fmr24668449plg.60.1670912295171;
        Mon, 12 Dec 2022 22:18:15 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id jj12-20020a170903048c00b0018996404dd5sm7500941plb.109.2022.12.12.22.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 22:18:14 -0800 (PST)
In-Reply-To: <20221130023515.20217-1-palmer@rivosinc.com>
References: <20221130023515.20217-1-palmer@rivosinc.com>
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
Message-Id: <167091227726.18364.8127808951641932846.b4-ty@rivosinc.com>
Date: Mon, 12 Dec 2022 22:17:57 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, jszhang@kernel.org,
  linux-riscv@lists.infradead.org, guoren@kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_221818_766331_359DC366 
X-CRM114-Status: UNSURE (   6.15  )
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

On Tue, 29 Nov 2022 18:35:14 -0800, Palmer Dabbelt wrote:
> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
> only calling that one function on the shadow stack so I doubt it'd
> result in a real issue, but might as well keep this lined up.
> 
> 

Applied, thanks!

[1/2] RISC-V: Align the shadow stack
      https://git.kernel.org/palmer/c/c3ec1e8964fb
[2/2] RISC-V: Add some comments about the shadow and overflow stacks
      https://git.kernel.org/palmer/c/de57ecc47610

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
