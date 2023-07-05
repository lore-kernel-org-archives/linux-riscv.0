Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D79FC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7G9duUzZFZ9l+Cmig/03IDH+w+R477WLbVydfxqx6Qw=; b=JUrCybK+RqQel3
	JeQXClBLaiMQSVHQ7sPCWLxjrqoUFYCGUJQopSYIBZYsLu4y/mjySeZIY+CnUB6/KiIlj9I0ytpd+
	C0aIklThLGh2THDu5v7TKza0FNkvjAnT1XHbHtkI6R/XaBxqdy5xgFDxA7eFWN5Xu4WppTCCgAOuY
	tJTqkGJlRAEXvXCAZGm6zNK36lASL0SqySVA5K/89N0cmGIHlvAknCNJPwJBtb+nSBDv63vQ89+e/
	4TiXf0ORXeKf0NwEY9eCUi7LRYhXnvmHBZv/X3HicPDdGxHjFJh3zYXjnj9kBV03CRI0Pb+TOtSTZ
	hiH6rnxXElePh+VYb+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC70-00HN54-1m;
	Wed, 05 Jul 2023 23:40:42 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHC6y-00HN3i-11
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:40:41 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1b0606bee45so187741fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 16:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688600438; x=1691192438;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjJ1etH05I9YHXWQWBpJ6VH31mJ0fNultV7DPdyve3A=;
        b=ZPXNMMOCkXFYWq0NCdEakfNA1pdk3CcYZ+6f0WHempotJZB83+E/pwCM+2q8IKUq2H
         xdRZIDd51TiDL0p0XvTa0tt0N5VLJedaG+bnWx8ReTf79ecuS467LwMpxMqEOAgA/m/F
         eE0s1hX4puKbZ5vi5TGeKG1II3apVtjHvOv8rdxCf0tyhg6Y4Uf/o8gYUp3Hqm8+oH4R
         KBo0VOySqTceqIazooKeeN/zdE0sz0EHxIxewCJ6HiDK6g3JEpVJLYCkcuZNjcJvwnFQ
         wIV1svBag9hTIYBoNrpo5Tz19PCkfIE7rLC3pf4/Pxw3K6exVKCrJfzuXCwoocgMW8Q4
         r5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688600438; x=1691192438;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjJ1etH05I9YHXWQWBpJ6VH31mJ0fNultV7DPdyve3A=;
        b=lrG8x/497zFdyyjfQnSB48CUCSognxthu03fU8Fb10EpR1YPedabCukd80rwDS7ind
         ZY5OvqoGI6Ihx9LfKMfj3yIqRqGLzOKRfKDU/OlpVp3Wdc4KHw6Lk1/Ld4Sw4PU7x7ad
         eeKWvZgrK/fsxPsS6cKWC9nG/23uenPx8MIVptOi4qCyAREanI9iWCwZXS8K93MiRMQH
         miIfO88oKvaH8/lrpSTdW0e8Xb2n95T4DNszYLGqCYL2ao7L+eFPjoiOR3QbaQPu/ufV
         2r71DR1yHR2PHwab3nedNx5n3MSX4qKYDFvePCub0DMGRUmA1Ni+a/ceagYJ3afongnB
         GBhw==
X-Gm-Message-State: ABy/qLZjJJeXRacaqIKQHcFthy/DAFeqclaP/ZCpWgb4IuUAZIKv4rWf
	3v4wGsJ3mWUtw6f+keTslMkBVvyYDmkN71NOD/k=
X-Google-Smtp-Source: APBJJlFSrRdK40t5yNfAd2Kq7jIZOavCQCb89hoatgZHX68xsPhoKBzQ0NfIO/eMq0SLzY8xZh16Yw==
X-Received: by 2002:a05:6870:9a1f:b0:1b0:15ca:479 with SMTP id fo31-20020a0568709a1f00b001b015ca0479mr733323oab.55.1688600438413;
        Wed, 05 Jul 2023 16:40:38 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l12-20020a17090a49cc00b00262e0c91d27sm103433pjm.48.2023.07.05.16.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 16:40:37 -0700 (PDT)
In-Reply-To: <tencent_FBB94CE615C5CCE7701CD39C15CCE0EE9706@qq.com>
References: <tencent_FBB94CE615C5CCE7701CD39C15CCE0EE9706@qq.com>
Subject: Re: [PATCH v3] riscv: move memblock_allow_resize() after linear
 mapping is ready
Message-Id: <168860030756.22647.2239697649687317403.b4-ty@rivosinc.com>
Date: Wed, 05 Jul 2023 16:38:27 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>, Woody Zhang <woodylab@foxmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_164040_354329_A503485B 
X-CRM114-Status: UNSURE (   9.47  )
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


On Wed, 14 Jun 2023 21:19:07 +0800, Woody Zhang wrote:
> The initial memblock metadata is accessed from kernel image mapping. The
> regions arrays need to "reallocated" from memblock and accessed through
> linear mapping to cover more memblock regions. So the resizing should
> not be allowed until linear mapping is ready. Note that there are
> memblock allocations when building linear mapping.
> 
> This patch is similar to 24cc61d8cb5a ("arm64: memblock: don't permit
> memblock resizing until linear mapping is up").
> 
> [...]

Applied, thanks!

[1/1] riscv: move memblock_allow_resize() after linear mapping is ready
      https://git.kernel.org/palmer/c/85fadc0d0411

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
