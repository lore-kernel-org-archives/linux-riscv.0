Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D06C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqcFakHwm4zD0hQcXi3ZArZReWqqFCjMzQx5LCGeu2g=; b=H0H1/JfxFmT89v
	hDV4/NckS0iMk2P8KMofH/58ZoORlAMVAjTYerjVkz3cIlKS16Fc9c11a6xJCqXjZmJY6RnScFEAx
	vcuS0+HA6SsuaAdpWWnqvlD4wc+GmI1EDevaVdDIKL8o5AYNV0xWVdx2/oLQLMiHbbl7p2c+kqiLk
	8EHRmGn7R4uUl23mTKVSVn+Ook+qmmUjB1XCWUxMdLN17TZiWBuKkIHH7pSZBQoKRK7bgsG5k4v7i
	55mfkYkjS6ebVCWDlAyQ2bNr1kVe5+YP8Av02pIPHUETW5nbzv4bRGGMUHaJz7/l8pBgC6curPlG6
	twECV0qa6v4MRJ625ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGW0-003c2k-M1; Thu, 09 Feb 2023 23:39:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGVq-003bx2-Mr
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:39:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id w5so4693324plg.8
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 15:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wT/0184QjMo+hmna041cEtaG6eN6ojeXECE1DHEFSQ=;
        b=Xi7uN1iNuU6j8CyhuB+Q8Ro1+tDhMRMhE/eXW2mnOjxw3fbzNdpTaoozEmDFmv3NKP
         TTwFmi/nHzkFHh3j2mH9k+rZz76OvBfY3MLcVZTjRO+NS225lIwC/UYKImZ6IHcza652
         mkqaXi96YHTKRA7sEq5c7juc4yJXOO734qBCIiRyfXF7sqOslnY4umQ0+HPkzyy6mTk/
         pyS9TDPisKRCyMVx9wnbMNNyh5r5mLZyhOrTkGw/+J5dvjrdk1r+Nq1WWSLbo3k7yNuF
         ZD5TL4s6km07a4CExde3fA0zx/BRmdu255qXu4O3e33Vjfsi5tYHywWJnyBPBJFMgXsE
         4ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wT/0184QjMo+hmna041cEtaG6eN6ojeXECE1DHEFSQ=;
        b=4kbZEF5FrnUQJ0TxLNeq1FeiQBPEcdmdiGf0Xt9mIzX9kds1S7ilbUYmBWsrzzEkra
         BV2uysP18FyAsGg4d64VeuFiE2KBXxmzHv7whQ/Wnp3N95McObqZL4X7Jt0KdKkdDIzw
         huQE/RmXU5hxiY1ZnPd5RfjSYhmf4XMtoRODOrlgL2gIreSlWlykpf+yxoEiZN71Ap6K
         9lZ4ijp69zlL4qD9AExuLUsJ3yzogaHPqpGrkj4H8u5vHIdtOV6mKFbADDdDfRigu84h
         Kqvi0ZHTG4TeWe142CH1up2ZepbAlfHxfXtp2/6Cz8YQHACNOZHUONhyVAqj5NY52KBG
         qJBg==
X-Gm-Message-State: AO0yUKVuzcjCgM73XdPf54Kus9nEXzQfxU8WSXpy5dhPCQDfe4PK02xU
	xZ+NwVjIKtY/jWL5UDumeYl5aw==
X-Google-Smtp-Source: AK7set8c2bbe8BRUkWxwcIOXpfZBXg+wJf1MhsMcEj0bP58SBsJBwEnMePwyfOKDTOgwEhAv8IJ7UA==
X-Received: by 2002:a05:6a20:42a1:b0:be:c5de:7157 with SMTP id o33-20020a056a2042a100b000bec5de7157mr15363619pzj.53.1675985971490;
        Thu, 09 Feb 2023 15:39:31 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b25-20020aa78119000000b00581ad007a9fsm1978680pfi.153.2023.02.09.15.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 15:39:30 -0800 (PST)
In-Reply-To: <20230127035306.1819561-1-guoren@kernel.org>
References: <20230127035306.1819561-1-guoren@kernel.org>
Subject: Re: [PATCH V2] riscv: Fixup race condition on PG_dcache_clean in
 flush_icache_pte
Message-Id: <167598585275.27143.16666537067061607902.b4-ty@rivosinc.com>
Date: Thu, 09 Feb 2023 15:37:32 -0800
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-ca426
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>,
  apatel@ventanamicro.com, atishp@atishpatra.org, Mark Rutland <mark.rutland@arm.com>, bjorn@kernel.org,
  tongtiangen@huawei.com, ajones@ventanamicro.com, Andrew Waterman <andrew@sifive.com>,
  guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153934_802805_113CFF39 
X-CRM114-Status: UNSURE (   7.63  )
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


On Thu, 26 Jan 2023 22:53:06 -0500, guoren@kernel.org wrote:
> In commit 588a513d3425 ("arm64: Fix race condition on PG_dcache_clean
> in __sync_icache_dcache()"), we found RISC-V has the same issue as the
> previous arm64. The previous implementation didn't guarantee the correct
> sequence of operations, which means flush_icache_all() hasn't been
> called when the PG_dcache_clean was set. That would cause a risk of page
> synchronization.
> 
> [...]

Applied, thanks!

[1/1] riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
      https://git.kernel.org/palmer/c/950b879b7f02

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
