Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5285EC73C66
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMwJXZfcxkAkCz+h7tHMl5JUBjgo2kGItPU8pKN/IeA=; b=KaWxSJ1s1qghTE
	6uIvbBMW7GyBMLGw7su67CJyihhQypoj1sEXEhpDBG5taR+S45ugIDCBjuufk19LosW80+G86n+3b
	TuhRH/QxKq0VU7TturmNL1Ri3/xdRYFQVbqHV8UpI9ikxnjaFLe6eISSh5Odrhl+KRbQZ5IDteubI
	k9m7eduq8DA1U+NlQO2h+fzZ5cRV/rXYiKe8i8LGLocJsBHNXijGc22wUdBZxxNpOQFCmtOMZIgMV
	TcwHx4ihrGLGUtNjWeuKFlj0Lnxku6mmsIiiUZ5MveHillA9RRWRc8fw4kjUVDMo++4T9p2ltvkkx
	10ar6ejKVhMeTnhPxavw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjW19-00000000O7q-3aMF;
	Thu, 29 Aug 2024 03:40:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjW0P-00000000Nui-1wUu
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 03:39:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2021c08b95cso10163485ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 20:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724902768; x=1725507568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAQT0Tw9Rk30mAgD9ZQwkMJ4XScbb1aQuooCJT7sX3w=;
        b=P+kpJ7Y0QucBDBz8Gks/M4baO00sb0nRmexh5HTiQ/iWpl8is/FdnKv0aKIOHeab7G
         LFokv6keaIfNONVXy0Wv2Nx19aJ9pfP8+rSqj12Hg7Gm3/iGdeu2KsjMNRJiYjH8LmTr
         mefrNVmhMdOpNQU+V2yC732j/uVll006xmHLeSZ5JgxSjFIDndUVCU94VH0RsjELXMH6
         X7CwI4RFsZckOoFwyNy1VHo3o9DBVUuf4TJB+Y7vUbyhfMc76EX76fIORVqbFN0Sd4KE
         qsxvk6zHU8iXYkgkGx5B4o08Hh+dZDHwlQfv65tBR5S8QPsVdLu82rDjdJSyVxawjmqH
         Yh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902768; x=1725507568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAQT0Tw9Rk30mAgD9ZQwkMJ4XScbb1aQuooCJT7sX3w=;
        b=VEp3aDHysIbZO7LXfKDRDNvnaQzsl0XnADHmENCNjVU4sEDED064UNzqJScX/ixRtO
         LJcaoAs5B6k7VtZEB5iGeMZzBZuoJLoViZ4yKwkAD18IZteaOVxfsrKEknJhx52WCqT2
         D/gM+XURdf0SQZw3/zuejuesh/1CM0cjpIy7ZRos6ejdqLsRYZ0h8m77YJDqzYiK5s/F
         NAHiVwY98YYq7qArFsMCYfFCcRUeLJigZk0+DB1c8Si4QLAhYA6Mio5pOiUqwc8xbTeB
         pLE04wiqDoXNa3wqKkknMUiQsXBaOnKJZTo1rbftuxynXWUHx79sbMdfCJ3DYdExjt2b
         HSxw==
X-Forwarded-Encrypted: i=1; AJvYcCVOZNkkR5YRT55Kbc13L04VFctUpdhOPUfTS1kOuNa0HZF6I+yOd7wRgKIwD4aeE+iLqeRRGFx5PIVLDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+OGw+OUdnsfoT5toE5qZPBb6RuhEMB/7RBHidtN3XmnmCTm0b
	Dwfl8oTjBRmuHLb3FX07zRUNbQ+QobDhak7EyNwHa8hdCqrNc6HJELbOXsVKxNw=
X-Google-Smtp-Source: AGHT+IFzR3mo/xxAAKksCuseQ/Fe4/G2ieJWnxXB9IsXXS2RcfaqgejY2ZMhA5ktYXe+Hc36rdRCSQ==
X-Received: by 2002:a17:903:1c9:b0:1fd:8b77:998e with SMTP id d9443c01a7336-205168cec40mr3886715ad.29.1724902767587;
        Wed, 28 Aug 2024 20:39:27 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542498sm2056065ad.188.2024.08.28.20.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:39:27 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Hu <nick.hu@sifive.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Support SSTC while PM operations
Date: Thu, 29 Aug 2024 11:38:58 +0800
Message-Id: <20240829033904.477200-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_203929_544627_6B289D36 
X-CRM114-Status: UNSURE (   7.57  )
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

When the cpu is going to be hotplug, stop the stimecmp to prevent pending
interrupt.
When the cpu is going to be suspended, save the stimecmp before entering
the suspend state and restore it in the resume path.

Nick Hu (2):
  riscv: Add stimecmp save and restore
  time-riscv: Stop stimecmp when cpu hotplug

 arch/riscv/include/asm/suspend.h  |  4 ++++
 arch/riscv/kernel/suspend.c       | 13 +++++++++++++
 drivers/clocksource/timer-riscv.c | 22 +++++++++++++++-------
 3 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
