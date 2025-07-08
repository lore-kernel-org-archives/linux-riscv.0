Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB3CC83F0F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMxO1ljybq8mxqMzI74yUcgxvEXw7zrjNxXWX3UfXbI=; b=ZkcareoixpI9CE
	en0qmtmQ0HIbPotUx7SmPq5mILoznQf7+woNs3HYqsYy/c6Jj/vAgmWpBxL+JeXbwG6QPra/fxDS2
	Sl0pzIFbFP+luOJCWCCeiueL8ZXCykkEP5XA9drEOVU/WmG/3aywXpEE6cjpN65pKB2lxR8nQqW/I
	bnR62dqea7/WdsDSBu2LZIrpOaExE0SDWhxiRekc0LFyiiFp58i5MqVelVMwzKfkTLKQUFiiPJ9Q0
	NQ8nT7brBgmchN8V+6suKg1q0qkHY9VLigYvnDsvmKfqc7nZXiaJb+/9FadtFpPWMhzlC///Jd1BN
	DVPijUec4UDvkUrt7RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6Qz-00000005Baq-41vX;
	Tue, 08 Jul 2025 11:24:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6DM-000000059dQ-1059
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 11:10:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so617474f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 04:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751973019; x=1752577819; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6MXf+cnW7g75sWewP23Pqj+kzB/2yvPPFGN9ce4Tdo=;
        b=CGsJeHNAjEYLMHzYcw9zu+Y+QSbZFlNEJcfbuKGFA6EH2uYxf4JFJ0Vuo8FEdD014X
         nR7PrD6vXlp/7ZBe+fEBx+FMb3LVmR6OMmdgmRiQgy3D32bLuJOkTEsRKpIu9RFugZIH
         N6LjWKLZlsfKyBoevzmiRj9Jte63XLoEM2DofQvzapS97Svr3EjDM2JWiflGwkUGHDnP
         ol1gbIk3ZJUFYBIfZ8ewHZ4rLCKRh9D5bY/mcKQW0sxTM5azbD/gOAjjcfL9yMwj+Djr
         5xPKUXv+YP4cZnROgh+wCgZVMx7m6wwJgrGl1v5THlz+ExXPhlP03gzE7O9+lU49qrW6
         Ryvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751973019; x=1752577819;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6MXf+cnW7g75sWewP23Pqj+kzB/2yvPPFGN9ce4Tdo=;
        b=EnT/souVKQEfL69PBMP/vsJPSqLTQkresTfpZn2alOMX4zpobZ44c7+DUs39OVzh1n
         a2I07rTRI6fd/HV1kDnUyl4OdO02YKUY7IwddDl0MG+r0huRUGCGy0iIVVSbBwJ7h8cg
         ADNgXf8MVKCJfCpwZb3aDivYjxVrqpcirpRxTonDz3yXgisRLaqH3qVuX4PwH1lVp3YY
         F7kZbey0A8BxKilNEpAJhWmqC9mJBNITk7SLGVCE37i7gzkqniD3WhqAUBieFWSdA+R1
         sW681sAqDmN2fCmvUWPSqo25hG5jB9IiThKIswh2QIU6IIQ2Wax5iP1AB1zbicOpEwgT
         hZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+AUFlLhN/II7Dq0jXto77lbYVUXtJ0qUeiTlBhXAdqD8hyWlZFcKWyz7XNSEX7uTXqgrgG7+cozRrHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS7OIes4DBEfCoEtWigeWvGyjDb+n1z3TUSmehlAu+m6lNVlUb
	KggYp4r6+cilJLGXC6rsFikcc4p2QqavAa9mWz729t6F++K3COpRq5gB+nysEs3/HWs=
X-Gm-Gg: ASbGncsl8gb3KrNhIOe8jVL/WB9XopzXD7TOd9j0H4Z4QMe+miggWn5HbWc9rSNDYck
	Zda/A4YZdjZja+i6oOfK18Ob3IA2hIYv+SajA1X2KoWIW/fC1PhldS3azq+Lc5m33DOkayTtlFF
	tDqXxdbbMZMpA+US5aHx4x8sVnY164pgOq920cr8/h/5AtMsxlZj0TkEwg6ANHWpj4StqNV3ExM
	RaP5IEv3jbAZ7ocH5RiPRRGZclU9ye+udT+Z1dVLvtcRAG6r3aabCn8LgUQpCewQu3RbwO9Kcc/
	uqdfhU7hMSsOZBkUts/MEr8FT+AIeJWGCP8ZK6y4xqG1TMzxmmZay0ykMdVdrZeMLkGB/A==
X-Google-Smtp-Source: AGHT+IHb7haycFhehS+DKxl9ZCTVbzrVRxhiVWGlwDogb2eAqYTCyJ2HxoLQdVlyupJK2TxFwCvY8A==
X-Received: by 2002:a05:6000:1789:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3b4966019c8mr4853212f8f.11.1751973018480;
        Tue, 08 Jul 2025 04:10:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f873:aafc:f154:af28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0beesm12854474f8f.36.2025.07.08.04.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 04:10:18 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 08 Jul 2025 13:10:17 +0200
Message-Id: <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: <masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas.schier@linux.dev>,
 <dennis@kernel.org>, <tj@kernel.org>, <cl@gentwo.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <andybnac@gmail.com>, <bjorn@rivosinc.com>,
 <cyrilbur@tenstorrent.com>, <rostedt@goodmis.org>, <puranjay@kernel.org>,
 <ben.dooks@codethink.co.uk>, <zhangchunyan@iscas.ac.cn>,
 <ruanjinjie@huawei.com>, <jszhang@kernel.org>, <charlie@rivosinc.com>,
 <cleger@rivosinc.com>, <antonb@tenstorrent.com>, <ajones@ventanamicro.com>,
 <debug@rivosinc.com>, <haibo1.xu@intel.com>, <samuel.holland@sifive.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, <wangziang.ok@bytedance.com>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
 <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
In-Reply-To: <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_041020_281970_6C2C3BC9 
X-CRM114-Status: GOOD (  11.91  )
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

2025-07-08T18:07:27+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> This patch cleverly differentiates whether an exception originates
> from user mode or kernel mode. However, there's still an issue with
> using CSR_SCRATCH: each time handle_exception() is called, the
> following instructions must be executed:
>
> REG_L s0, TASK_TI_CPU(tp)
> slli s0, s0, 3
> la s1, __per_cpu_offset
> add s1, s1, s0
> REG_L s1, 0(s1)
> csrw CSR_SCRATCH, s1

We can minimize the cost at exception entry by storing the precomputed
offset in thread_info, which bloats the struct, and also incurs update
cost on cpu migration, but should still be a net performance gain.

The minimal code at exception entry would be:

  REG_L s0, TASK_TI_PERCPU_OFFSET(tp)
  csrw CSR_SCRATCH, s0

> Should we consider adding a dedicated CSR (e.g., CSR_SCRATCH2) to
> store the percpu offset instead?
> See: https://lists.riscv.org/g/tech-privileged/topic/113437553#msg2506

It would be nice to gather more data on the CSR_SCRATCH approach.
Basically, the overhead of "REG_L s0, TASK_TI_PERCPU_OFFSET(tp)".
(Or the longer sequence if we think it is worth it.)

Can you benchmark the patch after reverting percpu.h, so we include the
overhead of switching CSR_SCRATCH, but without any benefits provided by
the per-cpu offset?
The baseline would be the patch with reverted percpu.h, and reverted the
sequence that sets the CSR_SCRATCH in handle_exception, so we roughly
estimate the benefit of adding CSR_SCRATCH2.

The CSR_SCRATCH2 does add overhead to hardware, and to domain context
switches, and we also have to do something else for a few years anyway,
because it's not even ratified...  It's possible we might not benefit
enough from CSR_SCRATCH2 to make a good case for it.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
