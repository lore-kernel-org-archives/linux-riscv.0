Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB6C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C09K8jE5RiROGkd1+shkwtupTZCRxHgB0MgWB8+9VCg=; b=zx8rGsq1dlT+R9
	VJH/s0zHNbfgAKYpUeT9LtZpalgpQx8uoN56tQYhWBLxZjqXgj9MK5jW0Z2U0VhXEF1bWLqmcGelU
	wSdp1tQ5g5Bp1PFKwYJb3puGqVxPWRvbwuKwIOn7speNQKXq/LYjcsyZ7J0YoK1r+aAM+Gf+WiNdp
	32+ezmnUXP08fDle2Y+voRWm9CCv9FEQZRLzY0eV1HHRVrd48BYHNb6JImPlceSblcGY37iMoXVX5
	KaxFIqEJQ8MYTFQVe04L3mrtd9HSG1imJ44qwwx8U8+sU+vfI6bJg0bMymJ73I2osBxuhFxKtayno
	6ONcAtjGMhGe+1HSV8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hq-005dwT-23;
	Wed, 19 Apr 2023 14:22:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hm-005dtU-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:43 +0000
Received: by mail-pl1-x634.google.com with SMTP id lh8so19057plb.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681914159; x=1684506159;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Waf+QACGwPaX1ZCD7e4w4TBQTFocG4VaRO3bMuKWQeY=;
        b=l6v7+ZM9QWue1cFyKkTewWsi9T3Z7Jx3gSzVSOBLDFH7L4SiXnvU7N+svVhQ48RDF3
         KmVwYId81LSUiIhUMIqTQ/54QklERHf+CNKdlYQMEGoMgGbFNXvYbFe+MOlqCG8C6HrS
         n0s/5RcK378D2IyRgvlLOgnX8KrTffkRrXMsICFF4YKNSarGEJkTLV0tYEfNkSfimdnF
         ZGifCAmLa7zB3qzElf7Stg+u7TqUKiQpP4/kM8EbD8NvS1VN4QUm8DLJnuBljnFyOngm
         qMojS00yepGhR+ndQauGQQeWO9ouylc+YUD8KxaUznghP9lrKzYxVyBWa0Jw82o/ZtZy
         Phew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914159; x=1684506159;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Waf+QACGwPaX1ZCD7e4w4TBQTFocG4VaRO3bMuKWQeY=;
        b=hYu0EeHRaOPRwI5fVugvcpZhnJT6S4uCWCmzyOHyzOeY62VP72eKz5ZWbvSwLp8SaO
         c1WvyrfF3KYNn6stqy6BDtkgoX3hRPBV84/QYYb7O5nMXmSDbI3+ArxqCRxj9hNAEiKi
         sA4VH+3DprbB9cwV3CIjw3f5CjWcctUJBc9XLCqMfqeiG9QJaYdgdER4EuGTLjy7xWcW
         a6KwDlqSy/LgC/u71pAPUqhvIo/LYksfXsH1u+Mm88ZKkKomCEr7VTq1j8evU1TSn/Fr
         VUbkXusjSV+V4iKrnw3o+p/k6aBSUOv8zTDcpVlxugzzQQpqJLKRK+ZWxEssA/jutd2M
         fBxQ==
X-Gm-Message-State: AAQBX9dhO0IJCtfkbs1++FKeEe6uVQlDE0eA6hQ33wGFTj96M5CIE4/7
	CzRXwSVGqySD6D848QRHQopGoykw4X5/HyIE7sc=
X-Google-Smtp-Source: AKy350aPnlfvP4qUDvfv5/vOO3cn2Bw34qPnDNeOqdEF3EgYhvkEXRXInv8IlMOb7I6WoLdjYIoKBg==
X-Received: by 2002:a05:6a21:6d87:b0:f0:2c96:1c6c with SMTP id wl7-20020a056a216d8700b000f02c961c6cmr2519297pzb.25.1681914158966;
        Wed, 19 Apr 2023 07:22:38 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u35-20020a632363000000b0051b36aee4f6sm10483297pgm.83.2023.04.19.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:38 -0700 (PDT)
In-Reply-To: <20230323123924.3032174-1-suagrfillet@gmail.com>
References: <20230323123924.3032174-1-suagrfillet@gmail.com>
Subject: Re: [PATCH V2] riscv: export cpu/freq invariant to scheduler
Message-Id: <168191414576.1929.17819502904863461212.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:22:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, Song Shuai <suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072242_519672_9A41499C 
X-CRM114-Status: UNSURE (   7.32  )
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


On Thu, 23 Mar 2023 20:39:24 +0800, Song Shuai wrote:
> RISC-V now manages CPU topology using arch_topology which provides
> CPU capacity and frequency related interfaces to access the cpu/freq
> invariant in possible heterogeneous or DVFS-enabled platforms.
> 
> Here adds topology.h file to export the arch_topology interfaces for
> replacing the scheduler's constant-based cpu/freq invariant accounting.
> 
> [...]

Applied, thanks!

[1/1] riscv: export cpu/freq invariant to scheduler
      https://git.kernel.org/palmer/c/c4b52d8b6c1d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
