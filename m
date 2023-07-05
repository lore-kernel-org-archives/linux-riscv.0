Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414A6EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPIzQZHiD8+conNgBCISj6hhsRZESSC8FOI8Nw3Lboo=; b=tynkqBU6pc65oR
	7NHkuOvr2lcF650Yh3MMwzPQMHfh+hOq6PKBuBrM8ya2eX+sDaW4NxP8P4C6XrYneDHFMlqEAv0NT
	E/5q8bQuZ94xYipkTGtj1KRHBkJVp1TpoYCL2MUOyY8SqK8QVTS28qUG2Ojgnb/VREBGQqXlLmKaB
	JmX9o2SKOIlcW0AG3Ut0y7h6vhOe2EpWDpeNSCJ10lYCx4uwF9cAbFaFVZuJgiP4ajXqlmefzxBWc
	zp6rZnvKFzF+wO6DcTgVgJ8eKZdDI3csLsJ0oLzKZvM96q+mWbyrpbRj2I4v4wHUQxXFoMpacXy93
	Dymw+kiYPfdlnRUWzoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC77-00HN8B-1q;
	Wed, 05 Jul 2023 23:40:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC72-00HN5P-0r
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:40:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b8b4749013so6720215ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 16:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600443; x=1691192443;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I+KC5szuYeC056URDwDfaLH071wQ+5HX+v21iNWI4M=;
        b=zFu9wtKbHoud76MC9bRZr7ra5IVMIW9jjDhAD83FYmcIWC6lsHh7Gen6BRDlcxUBJB
         9sD19tENt5jIbW+a676ca7f8Z0W8rZAjh4Mv9Xgc+PuP0d3o/yfC9eHW5NQAOIml2MaF
         h8W/ZXnZrffB8JuoXBEZPtBA7JqQXOu/oz32Y7PxW34BZC6048Lw/tx8c5aztm56uYaF
         YXHg/xOxdiUYxhyd92SW9jNcI6zm3wUdjWlDZIXtPCUQBVkGTX6m17NSlpqu2wmYDNcX
         /++6fT0hpE49gUZtCdKTSVlN17QGbmhodzHgxpzN6pFqhyYTHsEkgAXerBD68BjVhfNI
         DIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688600443; x=1691192443;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9I+KC5szuYeC056URDwDfaLH071wQ+5HX+v21iNWI4M=;
        b=RNH/XokCRug36a0eRIM5x+NABeME7rDaqaYe+9fbyeRHcVKFNjYpy0//KhYDb8mZBY
         5z2BMx6TIeIO16itj5f+uv4hGYQeLbFlf2CkXUPftYRKbxFSw6CiLolB1jN5Cp0Pyhad
         NTXRaYhIgL9n2otjmr0VHuR04nzF3Kvm8p7ANiJDvXL4qNx+oaEAAVSGr0vFEpuqQ33S
         8FzF0pkzhTXS9x3oQ4WhSCzAGSMpUo0Wqeh37c9q9vjoelOabdhJvSOn+YDMwvYWgKPV
         3CuMiomS6Ia3zDIo11rtysgTW7+I1ZckBkP8oLe1F3FWNKMeUkcjgS5kg1MoGI9HvVyj
         IoEQ==
X-Gm-Message-State: ABy/qLacRAphQbpgk/Ej4QkrMiHXc6NZppgVXN07XNxee9h27eZfuizr
	01ah2KL/JtD0Cv0kZ3GhTharUQ==
X-Google-Smtp-Source: APBJJlHVE19iBGX8/fFvr5f3Nu4D58kyjMN9K9CLX3AQ3+HPnO8GRJ+I8MPT7LzVS/eKq/uKqveEYA==
X-Received: by 2002:a17:902:b942:b0:1b3:f8db:6f0c with SMTP id h2-20020a170902b94200b001b3f8db6f0cmr354847pls.58.1688600442742;
        Wed, 05 Jul 2023 16:40:42 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090264d600b001ab18eaf90esm31967pli.158.2023.07.05.16.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 16:40:42 -0700 (PDT)
In-Reply-To: <20230703190044.311730-1-jhubbard@nvidia.com>
References: <20230703190044.311730-1-jhubbard@nvidia.com>
Subject: Re: [PATCH] mm: riscv: fix an unsafe pte read in huge_pte_alloc()
Message-Id: <168860030766.22647.15542339368600249770.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
  Andrew Jones <ajones@ventanamicro.com>, Hugh Dickins <hughd@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org,
  linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>, James Houghton <jthoughton@google.com>,
  Ryan Roberts <ryan.roberts@arm.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Andrew Morton <akpm@linux-foundation.org>, John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_164044_301531_C1048A59 
X-CRM114-Status: UNSURE (   8.82  )
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


On Mon, 03 Jul 2023 12:00:44 -0700, John Hubbard wrote:
> The WARN_ON_ONCE() statement in riscv's huge_pte_alloc() is susceptible
> to false positives, because the pte is read twice at the C language
> level, locklessly, within the same conditional statement. Depending on
> compiler behavior, this can lead to generated machine code that actually
> reads the pte just once, or twice. Reading twice will expose the code to
> changing pte values and cause incorrect behavior.
> 
> [...]

Applied, thanks!

[1/1] mm: riscv: fix an unsafe pte read in huge_pte_alloc()
      https://git.kernel.org/palmer/c/62ba41d27612

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
