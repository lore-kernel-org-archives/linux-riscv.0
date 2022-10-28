Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A995C38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poeIZy8uX+XfZf302yX8K24GWhCvRgakNj0kcsAe9hE=; b=L7WWzVIDq7yics
	FTUwWijrztKuSQi55kxTIg8lDyLG3QlD2fO5d0tHyqHY5Z8R3K7CHFRpYKJzCi3CElFIgIMYB/qiI
	1X8v+qAa110mkxNLDlMRXxBiJA3yPoAjE/f9j6V5ziY+sxdWm0G/HPggX0is/mSwHcNvGk10RbwEQ
	ybKtoO4iUjqapbolkgLXQEamxK4a2m8+m+drb7mcTEI9n4cSMW2MVXHkVCh1Rw2X+ewWS7/T0+05c
	cWoW0jsUXqU9aiuSoO38II0yWKC1dOAi2KaAIOfqMvJUUg2lgsyWSMCoN68fB2pTz0osBv9X6ieH4
	NpEkW8I9XBpEiLXmZpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooXlE-0038mF-HT; Fri, 28 Oct 2022 22:23:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooXl8-0038jf-Mh
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:23:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p3so6004925pld.10
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 15:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96klAYK4L8VEW80FVp8o5wKDkKqz0+lk+6pkw6OjoQg=;
        b=ccsxS6QdpCQpwhqNvcwYJAR1mDDSkq70idXCUyZO2Wir6nUHAmexSdcHETJ3EB5nuE
         ODsLCIR02AIieFRK77tygtI0kSzdDCMT8cSoROH3eoUVB5zpOc/6mdz09qfktv/jjZOW
         FSdSDKxOsCPqHs8n7ruTtKsOfBo2qAs6y9cZ0ECUskSwV+LzJnjqx/898J8B+BKzpwis
         qWhuDvYiCRJNtfHLq5c3ZFHvBc6nUrDNsTfajC/i/xNaUNMKQgiC1rQNYXSjOqyBm6T/
         8RBytLABDk+8GhK0z7i8sYcgZbjaajGs2GUTltzl4dKlXHh+LL5StwnZlsMnerko7X/e
         SRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96klAYK4L8VEW80FVp8o5wKDkKqz0+lk+6pkw6OjoQg=;
        b=w8HRFuGm3YY6BG0xeTedB2qLr+xJEEbrrxNY5XLButE1owQT2i+P5JvY8bYf0Uic2K
         H2zvy86aQYzFhHHmKlgRYCm/IRTYipCCmTcjN1JI+kl8m+1Gu54r/R++mZD+qhZDilM/
         i1SPVoQa4FcYbCn4wlLKtnbA0xeafdtOTuuZcT4e2HNTnXamwg2llkkngUld04Av5cJT
         ZBlSNxP4gD+lDYnjx7jj5CgjO6J2VlD5bWqVGJQJjFqbXR66kOCnzoAfrdaE/GCCE6dz
         BCvExlhVdw6p74xwoRsF6hJ6064wUSDadBHQHKGMygfWZviV1WVeyzJ7YHExEXA1/+hV
         fK9Q==
X-Gm-Message-State: ACrzQf3huqqfCHM0R+15NkfJq8FpuyUYj8MYuWGHa/cRt8OR79n6o2Zk
	3NswIg01lSB0kUcy6a2lok+gWA==
X-Google-Smtp-Source: AMsMyM7NCYwLjSbnYw0R0TQbhwQQSDLXFmIgXkUJ8uvNv7e161hQ0A9j/RA9KUs1OZ5GdsA98OYv7A==
X-Received: by 2002:a17:902:e944:b0:179:dee4:f115 with SMTP id b4-20020a170902e94400b00179dee4f115mr1240644pll.141.1666995804162;
        Fri, 28 Oct 2022 15:23:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q10-20020a170903204a00b00176e6f553efsm3482022pla.84.2022.10.28.15.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:23:23 -0700 (PDT)
In-Reply-To: <20221009134503.18783-1-tjytimi@163.com>
References: <20221009134503.18783-1-tjytimi@163.com>
Subject: Re: [PATCH v3] riscv: support update_mmu_tlb()
Message-Id: <166699579458.30369.3811976740296212930.b4-ty@rivosinc.com>
Date: Fri, 28 Oct 2022 15:23:14 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: falcon@tinylab.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: guoren@kernel.org, akpm@linux-foundation.org, alexandre.ghiti@canonical.com,
  anup@brainfault.org, Jinyu Tang <tjytimi@163.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Conor Dooley <conor.dooley@microchip.com>, tongtiangen@huawei.com, ajones@ventanamicro.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, panqinglin2020@iscas.ac.cn, maobibo@loongson.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_152326_953853_93EBA9CD 
X-CRM114-Status: UNSURE (   7.90  )
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

On Sun, 9 Oct 2022 21:45:03 +0800, Jinyu Tang wrote:
> Add macro definition to support update_mmu_tlb() for riscv,
> this function is from commit:7df676974359 ("mm/memory.c:Update
> local TLB if PTE entry exists").
> 
> update_mmu_tlb() is used when a thread notice that other cpu thread
> has handled the fault and changed the PTE. For MIPS, it's worth to
> do that,this cpu thread will trap in tlb fault again otherwise.
> 
> [...]

Applied, thanks!

[1/1] riscv: support update_mmu_tlb()
      https://git.kernel.org/palmer/c/1b52861f0e04

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
