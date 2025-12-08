Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40285D3ABEF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dmb3ouP4mUbdFu5eyEkLKlog03lJtBaWM+n40NQHOH0=; b=qEkq1rcZwxCJyC
	y8SnIjlH6ZY+GcYYVuGCIdCE85cqyqQwyIvOw9UmA4jpdERyA0xNyS34d9xUZ+CRC+fNIqfqQXLwH
	Sn99MyonCOMbZGSHez5bx5SNjIuKJap7C4+zChSwmqLcUwh/uH4p4xkYpaeWXX1KtR62+kc1E/Y8Z
	N1dc97Anzae843AP8S9nwCI7DBmnlkGLjdwbWcTzoNsM5ryus/PwvHd5U5emcnM3NVN5u9j68G1pf
	s67aRUwHW0baOcArLykHmgep6DN3akxZBkj318Odm7CocEuXPzVPz82DhAW78A/2jdhKWb6hE9TBj
	jt5JCKaKwj0TE4rGFNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSGO-0000000CXmW-32Lm;
	Mon, 08 Dec 2025 03:50:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSSGK-0000000CXlz-47o5
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 03:50:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2981f9ce15cso55042685ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Dec 2025 19:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765165807; x=1765770607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mty2zn4dwIlfoS/rTSTz6mOhmsuS4SWDSU08vOSH3ts=;
        b=TqGrJC2VDGn8gPCmW9Dic/1aP4Jo72Um6zy4f2v7g3tM7hJWDXoOlUk46pw3VGQ4oq
         OmPaMs95ns3PhlUaPoRLhWGPBayw4T5lBZ34vbOZrjSw/lTGLJdrgEnjwPUOdGEZasj3
         M8SyFoCRdxy+kz+J2MEKWV8DhgAPUt/WT4pTOJeMAAYpt4WGJXd9KXqUQXShgCNOuSQT
         zknmWDJffhBasAT2riptnOu4+DC8D5TvGCiWiQK+J7IEJigZbctSnOAzcMGB7ZEFNwDi
         e3jilxl4dZiTCYJI3431OlkIV0tdkPOwJpOnei3C+/owoUhYPDqJzg3189UxLE8w6wI9
         T0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765165807; x=1765770607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mty2zn4dwIlfoS/rTSTz6mOhmsuS4SWDSU08vOSH3ts=;
        b=UqUJ8MImrbDCbNTtuwtQX3hgIKkYO9h+YvHmzQg8jpcwZhgDMFuYFWfvmVcQyD63Ji
         di52uMKg5umFfsQ9ESLKQDQec5aqCvnN2z5CkhXcO7B58NjLJqOgMiq3/CcwXdS/stez
         DlNyODLv49HO51VKU8lK45FlraK3NxKohFrj08ATOO2B/8aIrI2nJ99xCU1gDNiv2vox
         LwTNqEYHG4oNyPJ6ksDHUA4AF49cHeNW4w4inQxbsTM9IZlIOwiwnHQLRX6RGfXWfe2N
         eTDVAKqTalg24krehJPUgb3+Az6Wdur5KqUxnG1gNi/jwnfbS9zoNM0SRAaKDd0R70/Y
         2giQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeqAJIkFcHzToYXydLtjp3ZELjwo7GhlubChxx48EqeV4sN4/HayOz7XVyXsBtDp1hyOcfQ7HR11Tyzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Fq/NRw8xaCjxh/fv3gxxcFmpPsLVr24xHgrOxbwHiEhck4cq
	5c/FfuEUd94im1mNWNRqTL+MQgkBfrcuoICzWmqWqvwrTGtYNgdgCrYYR7mv2BHiZCY=
X-Gm-Gg: ASbGncvgoDVdwczamGtBjgboG3F9XKw+gDfvXmP3lAlcykhwtyegGcKqp4AARCf3qZx
	IBVniLjfkymZggr+9gnCYQs2Y3h/ypny3KWzCApaVSw938yk40YXO5JahauxTG5VRWyTQUXQzUk
	t04vNDxcWJ3X8vRGXWCDuC2uZgR9bAGi67xidT7tDhjCiBC1wrDVfPy6RJEvvB/xu/zUSd1dFnD
	2s0Osb7lpdVy1GqBA44/7Jv3qY49UeADMYFxLOwkpifj2C5RiJrdi/5lldLcrh4bxWWnyJVzec/
	m6kvSSPd0YB8trj+PkOR7OzxJPnheUP88Uur7NLv4wdBriSMvzad4HoZYsKVE4rjtmuVuxzZM81
	gX1rVYV8Do5JNcaDnQVRWYIz6u5d3cJPtsnC3YtStkn64HcFpdydvMtHUphDl8yMhTrhOiLorCy
	2JCEAwPDCJy2IhZR7y9ddst4AD5ouWpexT0J6J+oIiZhmd
X-Google-Smtp-Source: AGHT+IFUgzn7oN/GX+yC51QRUlb1+YHbrj6+uDfWoUdYP/BClYG3/VlS/j6Bvy5yLNw6/cq82JDAwg==
X-Received: by 2002:a17:903:1a30:b0:295:20b8:e104 with SMTP id d9443c01a7336-29df5ddd373mr63685045ad.58.1765165807515;
        Sun, 07 Dec 2025 19:50:07 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6d96sm108871275ad.102.2025.12.07.19.49.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Dec 2025 19:50:07 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andii@kernel.org,
	andybnac@gmail.com,
	apatel@ventanamicro.com,
	ast@kernel.org,
	ben.dooks@codethink.co.uk,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	charlie@rivosinc.com,
	cl@gentwo.org,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	cyrilbur@tenstorrent.com,
	daniel@iogearbox.net,
	debug@rivosinc.com,
	dennis@kernel.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	martin.lau@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	puranjay@kernel.org,
	pulehui@huawei.com,
	ruanjinjie@huawei.com,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	sdf@fomichev.me,
	song@kernel.org,
	tglx@linutronix.de,
	tj@kernel.org,
	thuth@redhat.com,
	yonghong.song@linux.dev,
	yury.norov@gmail.com,
	zong.li@sifive.com
Subject: [PATCH v2 0/3] RISC-V: add percpu.h to include/asm
Date: Mon,  8 Dec 2025 11:49:41 +0800
Message-Id: <20251208034944.73113-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_195013_300936_62495BD6 
X-CRM114-Status: UNSURE (   5.80  )
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

v1->v2:
1. Support percpu add/and/or operations for non-ZABHA
2. Implement optimization: store percpu offset in thread_info

Yunhui Cui (3):
  riscv: remove irqflags.h inclusion in asm/bitops.h
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/bitops.h      |   1 -
 arch/riscv/include/asm/percpu.h      | 242 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   5 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   7 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 263 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
