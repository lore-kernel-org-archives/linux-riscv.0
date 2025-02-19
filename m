Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E22C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qIaS714IL7YkXsy49vvaBAdmM/LwqL+FF231cZzgMEA=; b=HKuf9k2gNvzGJ1
	AAvmp/k+EGsrKK7xvvel+LiHcyFz76XL5Mum5MbJ5Al6N7DG3Gc9PZ0AYcx/eBxa6ka2IdMveklSW
	TKRRpKOXutfOUZ24/UGIEhQ6PRUwHERhbiaq2PD61BsCAQ0d0SAqUDXN4VRtwP4bC0UxmRI8VK8E3
	x2v40VhoUAorQ6u3Z+2BR6ZvglYRAOXuOMrS54NVVulhBvrkO9g2vAQztCPmjALzdCgGt7q0booFv
	qGsJBt40V1kzzL6DTO0bu6h9zF7iVrQbthX/irXhYg73XCtKKxAFXnZLVjKHDxDEJMyG8dRkMVCoY
	8icl1oWvZW8F9ThegSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiSg-0000000CTGR-3kqH;
	Wed, 19 Feb 2025 11:41:54 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiSf-0000000CTFd-0b9z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 11:41:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220c92c857aso12704565ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 03:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739965312; x=1740570112; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRm6voYTGYFewx3T9t31l/9Qdr/QisWdwhNYdIw7048=;
        b=NhuQycMjH45FWCyieyrNLN91khJwL39SJh80hsXnAk2aki8YkD8SM+MowjBIjcO0hB
         AiTwAMMYdZj+DNLNKlktlrOi9dwlzPn0CwNq9Jip7pLbhYD1wvHH0P3nnVl6Z1tw5xU5
         4qnaDklM5wFrL4qICsFc4mua0GiH2oAgQPf891LG0teyVTUmYWMHG2ItETgXxyen3oxb
         kd1zRVaqNBGnyrYF4vaoDF50nbRVcWEfJQPjoTXqi0oS6lBV8uWKEHn1s6MYq2/QSz9R
         najw77PtbhtpSb+2YFnvP8mb8dNewFaoWaye3ZkUTVg18HhJp2BQxPgezDzDIB7u/BFK
         fgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965312; x=1740570112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRm6voYTGYFewx3T9t31l/9Qdr/QisWdwhNYdIw7048=;
        b=C22DS6zxayNG9ubEL5x8G13j9/mbVMjO8TKnER3qc60SJ1rSc0SuMcXDcRF6PUWjS+
         hwKz33yH0WoDVvFKpfZld4LAwDod/0eJGweIiERFMiUIGdbhl1csqP+SI5U9Df1zyx9W
         vgtCqHAnTbURetvy6ZatH1rJTOBqQGuhm5Z0mQktio2Tdb8tNu9PxNEVJrOiw3J/CDkp
         B7G31LiMfhKMHMokCf2y/p473xuAMTQml3xr+XWSka+fCkM33MPE2n7wKjMUW4s4zYv1
         uT0ROS+Ij4YyFb6bSZkKBO6VOZG91olm7sL6lLT4EmDv6cSt9U1S6mI7PguiF+xsJx9B
         6QDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuBuCbwhHTnu72/s8LjuxN0VV56vYEH85al26uyiutiEBA1mhRcBxq9CZuaYvD9prIs0zkVAnK8Hn7mg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yykw6h4S/uL/r8KQjb56HJmpbrFKitw2EBD0cRJc232Ist1qmVD
	eEfehAdJlzsbcP4cSAzzUnUNKoQy80LeRt9xBrMbHNnVzT9yUrA+RD4HuJiXOf4=
X-Gm-Gg: ASbGncuMyInd3sobEatf38xJLnj4QhmBzP5LQ5WE6JbxcORKMsJuBQEPZVF5s083rG7
	Y05n4WJr31w1Y3RoPF2xE404GSwxyPBuwGNe1wCDAPhpdsRC6LLOghQXMZH2Xz5FJHobZr1JfdK
	75e+/3LlJsG6gKyI8hcK5FpLZvxQFTl1qiiyyEezKmtfSK5hLZgoY8Uro2zHxzeLeB7eQdslOpf
	hOHpXkDTerLny8UdpFfwFbe6cJQXO1zJmzJruno/wwwtmk/SGhY3SA/s6nPdv9Wvk0tJA7mGHok
	uD9GkyxqoHG0ssJZqsLz6uI1UuU54DHieCKFhw==
X-Google-Smtp-Source: AGHT+IG/uOJXFlM2AG33Nm8i0vuXd4s+c9mL4fSQ4TOHKZ0hCJISTJCzLvlspxWWIFiJ0ZrbwRrcmA==
X-Received: by 2002:a17:902:eb83:b0:221:2d4b:b4c6 with SMTP id d9443c01a7336-2216ef0dff9mr61043045ad.17.1739965310359;
        Wed, 19 Feb 2025 03:41:50 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d507sm103218545ad.145.2025.02.19.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:41:50 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Nick Hu <nick.hu@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/2] Support SSTC while PM operations
Date: Wed, 19 Feb 2025 19:41:33 +0800
Message-Id: <20250219114135.27764-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_034153_194150_691C5837 
X-CRM114-Status: UNSURE (   8.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the cpu is going to be hotplug, stop the stimecmp to prevent pending
interrupt.
When the cpu is going to be suspended, save the stimecmp before entering
the suspend state and restore it in the resume path.

changes in v4:
1. Apply the suggestion from Daniel to stop the clock before disabling
the irq.
Link: https://lore.kernel.org/lkml/5f7179ec-e4ce-4644-8a60-ce407a4d2f11@linaro.org/

changes in v3:
1. Update the commit description
2. Remove csr_read/write_hi_lo from the previous patch
Link: https://lore.kernel.org/lkml/20240926065422.226518-1-nick.hu@sifive.com/T/

changes in v2:
1. Add csr_read/write_hi_lo operations
2. Apply the suggestion from Anup.
Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u

Nick Hu (2):
  riscv: Add stimecmp save and restore
  clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug

 arch/riscv/include/asm/suspend.h  |  4 ++++
 arch/riscv/kernel/suspend.c       | 14 ++++++++++++++
 drivers/clocksource/timer-riscv.c |  6 ++++++
 3 files changed, 24 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
