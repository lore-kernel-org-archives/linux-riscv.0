Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E9AC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+21kZmuX+K3Y0xdPqjGULvgsDFGS2FMYclwuuDpgLd4=; b=znO7dQEG5+9RX5
	nJ1eiK5RbUNbl9z2K0hCdyheTnqgQlnYpqUlUUp4bGP1Er0eRwm1xgAAzcvY6DGFJtuoKhOXfsW6t
	lM9bP/64zpcXtbCPslrAw0AjdFT63ir9McOHcv9pWHH+OPVJkvEJ9hmVIok8yh1SRH/jJccvoopbC
	KnSlxXWx4BKb8qaMzhNAqF0J0I4egY4cxTNWKv4Mq/LY6Rv51HrwZAzIWvKjxENoLd/jBHOMoRrOf
	L2Am5kHR7t3JsmGjzE6JSf4qiiT0/KWmMM302UNsNDfRLCG5bzCy5dvWo/G94+2TkdlQZvWWcV1iK
	1NYPX6O4DiYKlpFSA+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjuE-0057iC-23;
	Wed, 09 Aug 2023 14:11:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjuB-0057hB-0c
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:11:21 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686f38692b3so6649423b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691590277; x=1692195077;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6l11VxyDZSaUALoCccZa3ct54qsws22cbS5n25+v6E=;
        b=cunsTonL+/rWgH+Lz4jAFC9Fo4cKyoBxC4j8WwFEL0jWFMA+joGcIwndpf6zjM5229
         dx6v9awRlPeyKhuvOZRcrwlygUYnDLfH+Qf932m5p+FEeyQ32VubnIHh37ergH2QyDIH
         ihBHO08YMM+DYT6tf5UHpbNyycbFk9p46sIjtWMyGoYhKL9ZNbZsX9PuWvdcUU9tn8f8
         1+718/OVevz8jTL02NAoVMe2BjJWYV6FQVrsntfs5HWe0o6+l3QEf0NiVLqboOXmhn3i
         M3AgIxnXhvi72UTRCLEep+//oU3BH6phQpMtFQeH7t4r8ty6APS9Hy8D9WqnWF8SDIqs
         WJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691590277; x=1692195077;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6l11VxyDZSaUALoCccZa3ct54qsws22cbS5n25+v6E=;
        b=Pq44olDsBEDejSEcQ8yASnYZoapaQAuXOFWmoThDm3s8f56wGK3WyW2o2ZKctNWg4h
         NAAzKglKv6Cfv2Pq69vYwWF13k5evBbMPrZVDztEuw2qGT6bYp9xnG3DkOep5Tm9pyKg
         rFg2IZcV4WlIOASivz0qJsX9DJ3YR+NumcCJppirpAWFbR68OVDbxF3zbLyW8sT0CL3q
         gJKUuaVdKcOCffv4jsm0S7OgXkrqCLsVjK4/b+40iItx6A95+tMAWkQ5XUImmU+zLsKR
         vEeMFUnoTBnYBxz+fCRmwYdo+ovAaC1fO1U5njzD3FZjFeu6u/fXlchY74Ge7eUjhxUo
         rlSg==
X-Gm-Message-State: AOJu0YzA19QeeEloKWFSpGd4o3zjzofndc05EbdOg9VkGfkMXCCfOKdV
	tvBpJzw1Um9yxFRiZUae8ZvDFBPdPkEmoPQTkjGMOA==
X-Google-Smtp-Source: AGHT+IGJs9oapfzMEWX52Fz5gVTa0qKJex1tBzNPZgE7G5boBtfBncAYJ0Pu4Kz3A4DTnKHPFOHGhA==
X-Received: by 2002:a05:6a21:7787:b0:126:92de:b893 with SMTP id bd7-20020a056a21778700b0012692deb893mr2471053pzc.31.1691590277193;
        Wed, 09 Aug 2023 07:11:17 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u6-20020a62ed06000000b006833bcc95b0sm10012207pfh.115.2023.08.09.07.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 07:11:16 -0700 (PDT)
In-Reply-To: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
References: <20230802-arch-riscv-kernel-v2-1-24266e85bc96@google.com>
Subject: Re: [PATCH v2] RISC-V: cpu: refactor deprecated strncpy
Message-Id: <169159026875.18421.15201020596285945791.b4-ty@rivosinc.com>
Date: Wed, 09 Aug 2023 07:11:08 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-hardening@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_071119_448269_249F9FBA 
X-CRM114-Status: UNSURE (   6.89  )
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


On Wed, 02 Aug 2023 00:21:58 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> Favor not copying strings onto stack and instead use strings directly.
> This avoids hard-coding sizes and buffer lengths all together.
> 
> 

Applied, thanks!

[1/1] RISC-V: cpu: refactor deprecated strncpy
      https://git.kernel.org/palmer/c/12d61a1bc28e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
