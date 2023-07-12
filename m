Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62031EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UxFD7zey3qqrT3Ap2Rv/GrmuAAyan8dKZbKADQFuAA=; b=BvCj8P/YpScBSb
	rwDqZe7JbHOjeX63LseioxWonwS/uf4gKLpHVdDHOy1+H+2wgfZYcjfbITXAhOZQLorjVMh7saZre
	irpPds8/HRVxJDiLAoSpsuHb/zY6Mfh85N1hzCxFetmDMC0Dd0JR5t6WMRhfcNojCKrvsaePs5mA9
	oMnLxjXf6/p9x72G2u684dm9OI0TZOVdApHYsb+uTNMAbH5fWDSEHL9ugGPt7pSieqM6vGzz+6uD2
	7Cr2pw/8t4WLnnKA2N0cmwAoVaJFHyqcGONSgoLH3YVLcoixOHCW43Z0VIS469lh0B+cbm5cqgdyk
	nIkCashCHFZdAG73Zf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcAL-000QW6-2U;
	Wed, 12 Jul 2023 15:54:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcAI-000QUa-2z
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 15:54:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8a8154f9cso6465355ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689177246; x=1691769246;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuGfImREI3+vAOMG7Qz0iAJD7LdxEjUxKUaKqmBNQrI=;
        b=vrFoeYWDsg7YPhr4bqWyPs+29mbupjC5nNCh4GVYf8Vkh0zWSbRgBxhRUp+Ui01t2S
         A+Bj+AbZFLOizlV8tFhji8+D8hsioUYz8n6Ak7yGE+pEsX2ysSi7Fb7MqmJ9kHrINb1o
         0cv+ch7z4CNXTxUXLdw9MnQznvJXO45IN91j2NR5HNECOCgzVJrbMKbo8dXifrsmRbK/
         7MMdleXB7nsa4KJdjY1gLpRENrG6PHAUxp9886g9IOxNtWsNW962QxUBCgqOXRyU8c4t
         LPLjScfvOgfwmKrVqZwm0ksOhsJ5h2yr4mAtBtpO6mXfD6+BJjBN5peK2ir/cufvfLzi
         20lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689177246; x=1691769246;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuGfImREI3+vAOMG7Qz0iAJD7LdxEjUxKUaKqmBNQrI=;
        b=ezOEdOfNpZW7YUtMf4TH9EKR6pwgyA53XJWenU/OduD9rh+jN0wnPTOhsdOz4fj9xZ
         8RQjDkg9G8ppzrbP44O7GPVcKg7cCidWsDz4zYDa3eI/5Tz5gyI7HBTone5qmcMFUm73
         HmReF08YGu16ghHWw5prqda7tS9zS4odx89QCvGZixECmzUIOSr9v9le0a+2IwCDxSz+
         nlQ6LDVUl0uJCL+W9niMw8i8sEarxvEyu3f+sR0zkPN8fZqjhzd49+Wlh+YAIdQfs0bR
         i0vspCmei00hJfOJCYtXN81U4d2Vr9ScObAtrO8pbpH4vYSuYghFyS6Cvl4Ewdj98JQO
         O1kQ==
X-Gm-Message-State: ABy/qLZJgc4oTcyjR3BRYaMmnSvwlDovEFNekH6uANSsiJFJPM2aVgK6
	EoZSWhJYGIFQbVs7hL8OIl8p6PWRi3Zj0eDPScY=
X-Google-Smtp-Source: APBJJlHJejJb/aIFBNWoeTp9H1B/RU3lJPZiFXU2xM+nI3CFojsKJRB31oUA/72y1rfIIzU82Di2fg==
X-Received: by 2002:a17:902:6542:b0:1b9:e9ed:c721 with SMTP id d2-20020a170902654200b001b9e9edc721mr2441743pln.19.1689177245834;
        Wed, 12 Jul 2023 08:54:05 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709029b8200b001b891259eddsm4133317plp.197.2023.07.12.08.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:54:05 -0700 (PDT)
In-Reply-To: <20230709171036.1906-1-jszhang@kernel.org>
References: <20230709171036.1906-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: mm: fix truncates issue on RV32
Message-Id: <168917713755.21773.10817207313937867675.b4-ty@rivosinc.com>
Date: Wed, 12 Jul 2023 08:52:17 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_085407_179259_589B7770 
X-CRM114-Status: UNSURE (   7.73  )
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


On Mon, 10 Jul 2023 01:10:36 +0800, Jisheng Zhang wrote:
> lkp reports below sparse warning when building for RV32:
> arch/riscv/mm/init.c:1204:48: sparse: warning: cast truncates bits from
> constant value (100000000 becomes 0)
> 
> IMO, the reason we didn't see this truncates bug in real world is "0"
> means MEMBLOCK_ALLOC_ACCESSIBLE in memblock and there's no RV32 HW
> with more than 4GB memory.
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: fix truncates issue on RV32
      https://git.kernel.org/palmer/c/b690e266dae2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
