Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D178C3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2024 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSffd1zt2Urr7QHPmmUX+HH9P6Af5U8dqHYs0yvWLG4=; b=Bar5vQcMoffCE+
	YQtgalND/rYzMXFx0T1l9mbS8+tdTyFbDtIXQmePl4e/wyck57wITVj45pCRMaoYAL6JRngBulsbC
	xller3ddnnTnDkqYiKBSxPJxTs00+WXJhmi/H8jPmX3S17/SWlMR/QzghiPtovYy8DYYbge036Wwo
	CyCm5t7GKWKGQxe3W8CyfWcllC7PlD9Fxym+EGaPhkwZXGWDdjb8rgzGf8T/kCCp9xsBKQJ1Ly68j
	rZ7hDJM1QcaDFTQyEgvWZNMheAepr0Cmql3eG6f1k5yFe+QEPSo6yLQpCAKFUJaWuQDkGRWfli26t
	t38xGoNbje+TJTr3B6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scrII-0000000EU22-196o;
	Sat, 10 Aug 2024 18:58:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scrIF-0000000EU1c-444E
	for linux-riscv@lists.infradead.org;
	Sat, 10 Aug 2024 18:58:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52efd855adbso3925751e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 10 Aug 2024 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723316301; x=1723921101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgel1p5b0fQnJI2oKTfUGRdVERbWCgRG72UuoYjPH3Y=;
        b=jLunqOgNMbJDMDPGAqOx29j1clEpta3pfs/xReH0hGc7IHD4S74c75i3OfQgLCZpci
         B2YczPn09u4a6/Z+cLHFUNN4Ic35bSt2yiLdNikHaqLKmVMYSl6l2JLhB/hPFw89yl3P
         a2RoYv6CgY7+liIAEaiF+kQTdLutTfusxNh+oV6A6BURG88RyHJ536LSAAqONfosmy6D
         SUa9cGQFhtldj+qKmpTHPs2gOoC6oyeIzGoljpeg4PBisWMglSjd+SRlpqECM4CZCgny
         keUm6euhrEo1o1eh1/dJO1y5eHZGhvNk6MV6K+jbDhbnwDuBnRhHR2/0te0qwjB7xwB9
         vkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723316301; x=1723921101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgel1p5b0fQnJI2oKTfUGRdVERbWCgRG72UuoYjPH3Y=;
        b=k6et1V4eDGi8zw9+6/wJeTNBeV+I2sIym1dky4e/omH+QRyifw11Y2b2fPBqe98/AA
         hiu23McRL2hpTaRO8InOCXpUNOCscqJFUHXEjGsBXjpTi7DQO9QI5w+B4QaLrOkLjqw9
         hSUmFthgXYu9RUbFbd1GLUxM//8qd+ClCsQB9oskcXwkUV+vFTonIQJnLVlAtG3fZwOI
         jXjqKi22XpA5oAKUIv86M7gPqL6+DpM7JPL99LfzfsBLClm5VcgqaC5QtzJ0U2iIUp25
         tC8xc337RA9uJE3/z25rssPSUZdE23lvYvtVXgUE9rQNBwECcKGAoiosbuJjExVjNGVL
         ExOA==
X-Forwarded-Encrypted: i=1; AJvYcCXz9ABIYvLqwZDxzlbbCuL0qqGGWHbTxg5qDKeEqs0amjf/Op91kfZ8iITblf4fXht+SK56Q6tuX+hRJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzesefK8OBPAZ/UO3wUlQwPln6OSfNh1A1CKG1Ix/3XAWdO6HSM
	1COc4O6jsqwS4MKMGoo7Gh2Fh9W0ImhlxQPAoCvWQsUc4ii9QiqX7hyI05PrFiE=
X-Google-Smtp-Source: AGHT+IGXirhFznnrEnfxoWtCM6VxRKxqexJv4+pAv+6uyLT2QYoPcuoNrDGPI5sHIdVSJwsbGA6CCA==
X-Received: by 2002:a05:6512:280c:b0:52c:dfa2:5ac1 with SMTP id 2adb3069b0e04-530ee98263bmr3593166e87.24.1723316301110;
        Sat, 10 Aug 2024 11:58:21 -0700 (PDT)
Received: from localhost.localdomain (85.253.234.89.cable.starman.ee. [85.253.234.89])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-53200f12441sm274232e87.138.2024.08.10.11.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 11:58:20 -0700 (PDT)
From: indrek.kruusa@gmail.com
To: charlie@rivosinc.com
Cc: apatel@ventanamicro.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	samuel@sholland.org
Subject: [PATCH v9 00/13] riscv: Add support for xtheadvector
Date: Sat, 10 Aug 2024 21:58:15 +0300
Message-Id: <20240810185815.116-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_115824_031471_3991C002 
X-CRM114-Status: GOOD (  10.92  )
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

> I have tested this with an Allwinner Nezha board. I ran into issues
> booting the board after 6.9-rc1 so I applied these patches to 6.8. There
> are a couple of minor merge conflicts that do arrise when doing that, so
> please let me know if you have been able to boot this board with a 6.9
> kernel.

Hi!
Regarding issues with Allwinner D1 CPU I tried to track down the problematic commit.
I tested with MangoPi MQ board (Allwinner D1s) and starting from this merge I can't
get beyond "Starting kernel...", ie. no output at all (and u-boot keeps restarting):

author	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 14:03:03 -0700
committer	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 14:03:03 -0700
commit	4527e837801e76bbb196bb3b19375d8e43d636be (patch)
tree	9c5b6c1a9f7d42530ff6140bceed737428ebac2a
parent	02d4df78c5ae70d283ebb4f78b9dcfdd4dfb71c2 (diff)
parent	678c607ecf8a9b1b2ea09c367877164ba66cb11f (diff)
download	linux-4527e837801e76bbb196bb3b19375d8e43d636be.tar.gz
Merge tag 'irq-msi-2024-03-10' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip


Previous merge boots fine:

author	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 13:50:30 -0700
committer	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 13:50:30 -0700
commit	02d4df78c5ae70d283ebb4f78b9dcfdd4dfb71c2 (patch)
tree	cb8d854f7987a864e3699a616e028953844181db
parent	045395d86acd02062b067bd325d4880391f2ce02 (diff)
parent	f7f56d59a3923e95bad2c49615a4d7313ed78314 (diff)
download	linux-02d4df78c5ae70d283ebb4f78b9dcfdd4dfb71c2.tar.gz
Merge tag 'irq-core-2024-03-10' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip


I hope that someone can take a look at it.

Thanks,
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
