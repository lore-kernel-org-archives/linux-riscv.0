Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D715AC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 03:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P1CYhecJnni64NRxvBW4P9ywncU9Lvw2+uO6WUanjco=; b=bxda0RyQ44/AFA
	u0aoMi2XS1yDUe44W4CMFAEJbmawVOH6xC1nIDkVDH5VVQqLfYSlSCVfYwV1YUOprMkEo81MKfqUv
	ARAwk4y+ytaxaVV+4vKlbLD7/K7vBhOOvZxOXiBRzqyI5DS77Z2iueJ1+X0sANbExXymK0iUdJHaX
	QkMKnfLZvJM72eV/coGKsEeH7ZwNvxvv+BY2LeL6rb4Cjcn300/cL5Gv8nkbkBcC3pQOiUCLhdSZ5
	ZNVeniELav1h/lY1eX9FEn8mcqk5j9Dh3VoIUR670e/XYE6hRTXt6Vx8hrMkGtZq1YPeYpjYs4VwQ
	MAXT/pdGZV5Eo4lFkYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOULC-00000005Qt0-1dos;
	Tue, 02 Jul 2024 03:38:02 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOUL8-00000005QsG-1FHp
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 03:38:00 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7066c799382so3110841b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 20:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719891473; x=1720496273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBV6I+MqJPgMEAtSd8jBWBXMlcHc0d1F6+6qwZyHh5A=;
        b=lVxo9Xy1kAYeJ3cRosgYwBDHGw7efUhkukg3VgD0/8Qd1p9KlL0I9DtQ/Wcm9usA5W
         KErMpkFToOccB7VvOK7UeIymzA8Odo9W2gchwzdqQ/hblsTcKx+l6bhEp/FJiCSkk4vZ
         73XwgbN89EHYgE+aht96oHV6E8wxJCG/qvaG/tdZlW94yhjDAotFVZkNgeT0UfZb9mN4
         Yxji1N8dobMkEjIYR9xJy1zWjajS7jCj5WXJLTgKRCo9PwCKc8GbCweKoKC3r8795Gyy
         eHxn1/+mZzyBib6/GohnrNIronweYUL6cAuuWqwC5EOv5XT5ETxYbTNMzJZYU7pWay18
         YyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719891473; x=1720496273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBV6I+MqJPgMEAtSd8jBWBXMlcHc0d1F6+6qwZyHh5A=;
        b=i8BqyZXyN21rwRjbcc7lGf41VAuGDbBsX87Q8AxFuWTDdxwwSKJa8ctw3er9tNK6X7
         4Sd4xZ9lmWDHh4xlUQBKb50+6Oj6SQPj1B5T3mf/ymKqA1EKbWLoI12vaXQ0xK4I0z5s
         IaMca8rDFxgx7SMNY7PKU6LrcosOemZ+qT14Z3Zjk6XcSzlFnC7Bj8/wj2Ie9KWQ3QF4
         GAOqEILWSNC5fIFNk1Wj19SwoKx6yNoIVVI88vF3fGzGNvjKn4lREbADgOQmJji0hMDw
         QtUZI8zIqoCfVEZUjjvrWjh0amuWehcniSrXUi8JnRDRnYUFIUrZ3sKFfVAFndvo/1QF
         +E9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8OQs7gjj20yxctifoErp96+0nmss1M6QtkXp3gNW3QqG/IWksW4dFOlPuKhxBnIRMv2xjC8DoVtXuwcQs3DCiIGvDRXExxXnsHr71JG3m
X-Gm-Message-State: AOJu0YxlQo/lL9ud+VY6D+wkG1AemFn8jeu6DlT7dqiIHFAoJgeB4bQY
	tll6Jujasu3MsXhYIJn27XGX4GmftkJryuXNbuIXoF8SSXSmujWHLxGWDEcIajw=
X-Google-Smtp-Source: AGHT+IFk5RP5dXJvyMBaQp4ZKscBjgf9M2xCAF4MEw8fIURDOrxvHlRLQdBn0ujX5vkXejd2l0qxRQ==
X-Received: by 2002:a05:6a00:218e:b0:705:9fc7:9133 with SMTP id d2e1a72fcca58-70aaaf08df3mr8800144b3a.23.1719891473506;
        Mon, 01 Jul 2024 20:37:53 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708045aac85sm7537263b3a.174.2024.07.01.20.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jul 2024 20:37:53 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	sunilvl@ventanamicro.com,
	jesse@rivosinc.com,
	jrtc27@jrtc27.com,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] Provide the frequency of time CSR via hwprobe
Date: Tue,  2 Jul 2024 11:37:30 +0800
Message-Id: <20240702033731.71955-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_203758_694668_FFA8F2C3 
X-CRM114-Status: UNSURE (   7.53  )
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

Some applications (e.g., DPDK) use the time counter for basic performance
analysis as well as fine grained time-keeping. So we need export the time CSR
frequency to userspace by hwporbe syscall.

Changes:
v1->v2:
Modify "mtime" to "time CSR".

v2->v3:
Rebase "RISCV_HWPROBE_MAX_KEY 7" to "RISCV_HWPROBE_MAX_KEY 8" from
Jesse.

v3->v4:
1. Update the commit log from Punit.

2. Because RISCV_HWPROBE_MAX_KEY in
https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/tree/arch/riscv/include/asm/hwprobe.h?h=for-next is 6,
so keep RISCV_HWPROBE_MAX_KEY to 7

Palmer Dabbelt (1):
  RISC-V: Provide the frequency of time CSR via hwprobe

 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
