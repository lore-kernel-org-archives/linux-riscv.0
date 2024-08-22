Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E3C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MOmpmBEjT3COZ0UTJuha1JDpetF1WIdFP3KPQ1M0aos=; b=rOQV6qGqfBXcy1
	I5VOr2wy53rRDCKKFRpC9RtCMhMVbj48VDW/ELe5VliOngStUS82Z2GvUN6K2Uk0yeRfpFPtii37I
	ubp6/konwze5HovAUbZvJhzrUZtY+uWSHdoDca84XdK2362P4cIg7VC2VHll/sKY1t+5FaFcZHw0s
	uWNaZ0nIjSsOZM7cj19qIWAbFuIyrca8beN6mbjHLaGsUq2glAoT6dVzXgKqPL0nH+h502GkxKGRy
	xxB0eJxfOTOTCoMgr08bw7PbLIUPTMavUmUyxuqfAZ5b5lQn06ex7FAWhoMtP/nS9z+uSKYJgxvUB
	qJITSldUyeimAovn/G+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBru-0000000Dq0R-2ahh;
	Thu, 22 Aug 2024 17:45:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBqR-0000000Dpdt-2SoG;
	Thu, 22 Aug 2024 17:43:37 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-20230059241so9709445ad.3;
        Thu, 22 Aug 2024 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348614; x=1724953414; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4G0t5i5MjlKI07w+v9d5SvzMw5bgUZNebTVTOJ6/CU=;
        b=D2BO1CSos72ViyQ43MBmuV9VaDtT6V4Dq11C1+3qounJSAWjNBNZN1hmKvdoJeYjXW
         4YWcFCJxFQu6qkXQKHTPPh4ntJ4u9OjTGjkgjlMlhD5lTUMr8UgndyNZ6lUYX1wYoB2e
         cTJmBwot2aBQ1KWpEPcgDxvgylbhUrBNTcN/zUPTvgVtLNy9iAv/ix9Y/1IyRFk408L7
         r4xJZ5/L4lZzPAsHDB7F3NRJ98bgWUM+e6ZWHMJ+YA2WG5AlNrHuw9MqjpNowCoxH+QB
         tuQ98TWJrnfJMryuhJPKXAFbCASs/GX2MZy8BF4MT1D6DplrEN09IYF/I7zFCxZ//T9I
         DnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348614; x=1724953414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4G0t5i5MjlKI07w+v9d5SvzMw5bgUZNebTVTOJ6/CU=;
        b=v1M32IaPbtlwmVVWf6pBJi3bSu31RFy28txlBuJdEJHc6BaCrlZbtmgEHgV1F6FHg4
         HcXypsALXODQQbM7rfTP+It/IDHZfh7vcOs2cFIU/zELnaqnSMDTGyqNxecNUmzDznLx
         oZXcwt7M/VwBTxQMwYyd91KRKFRCk5a+S9hVQ2zMOr+rOYpzgxiVLZ7lF/7gfaNHhq/F
         xcX3DKRKFxcuYVmOYegIBEOthrO/fY8xn6laf/13C16MRfdiBMM7UBhEUnTw8M2UAe+t
         isaX2GGOs+zCUEnDmmYP06k2v9tgryoJCUnsH3XHQRN3sI+pXKbWx6yqtBS5VpyWs126
         XL9w==
X-Forwarded-Encrypted: i=1; AJvYcCU7uTbh6R0mKIbeXMCXFT30wR+h5cFCbZ+azbjIICWAJjOHT1qoEIlGJYl7329BGQcCDQ8xsrs1frSWiFk=@lists.infradead.org, AJvYcCUEwMtm5hC6Y5KUyaQ7GBbqMU+skk0quliY1oUodX2YPSSHFW/uclbFpziw8qpMXytrCnXSKWwbjGnipPkculaI@lists.infradead.org, AJvYcCUgYQh88fMm0Y3KbvuNFDwdaazvqpxyGHBljDuBHsvqrY/vf4xD/7qq18se/YLoPOUAfo8Sanwe+/b9/+DoH5Fynw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLX2er72OdW9oe07gQVELUx2fzp/FbmeV6wu3vueA/cNhy+Wsd
	cuiZBjmQSA6sZEVrTfvIqHkxJNskXCAOKngfmACg5/feynL0orY9
X-Google-Smtp-Source: AGHT+IFfPPdFj0NG4vrABOMrZhiOMEMUIocsG6aUP8ME2w6mPmC8V1x0YBQJmJXakBKYnVWudfb/Rg==
X-Received: by 2002:a17:902:e748:b0:202:371c:3312 with SMTP id d9443c01a7336-20388b37240mr34252965ad.40.1724348613908;
        Thu, 22 Aug 2024 10:43:33 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859f0121sm15191405ad.246.2024.08.22.10.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:33 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Subject: [PATCH v2 0/4] defconfig: drop RT_GROUP_SCHED=y
Date: Fri, 23 Aug 2024 01:43:25 +0800
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL14x2YC/0WMwQqDMBAFf0Vy7kqSxmp7KvTSfyhF0mQ1AWNko
 yKI/97QSy8PBt7MzhKSx8Ruxc4IV598HDPIU8GM02OP4G1mJrlU/CJr6PwG5JNZgea2p7hMbTI
 OLViJXKgPqsZqlvWJMH9/6dc7c0cxwOwI9T9YnbkQ4qrqslJ5FTTwiDhoo8fZLemJ270P2g+li
 YEdxxfPntJjrgAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Xi Ruoyao <xry111@xry111.site>, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=oxm9xkvZGzIuUm2ABeNCmYX0SzCj7LhC0xOfwefJdzk=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccr9jMo1nday5+o9yiKZj1x6s6KBcXT5ip+vbit+
 pK2/07GJOOOUhYGMS4GWTFFFrGdT18vK330YRmvyQyYOaxMYEO4OAVgIrzFDP/LFhfY+Txl79n8
 45WIn9G5C0q8/Gw3VpwyibbwDnDcsUyDkWF3X9DPiOvHLumY7P5ar2Xwb5OBhXfZNLfkW4c4E4z
 PnGAGAOh7Sxw=
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_104335_662970_24837444 
X-CRM114-Status: UNSURE (   9.57  )
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

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

---
Changes in v2:
* Remove MIPS and PowerPC patch because of merged.
* Link to v1: https://lore.kernel.org/lkml/20240530111947.549474-8-CoelacanthusHex@gmail.com/T

Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)

--
2.45.1

---
Celeste Liu (4):
      riscv: defconfig: drop RT_GROUP_SCHED=y
      loongarch: defconfig: drop RT_GROUP_SCHED=y
      sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
      arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 7 files changed, 7 deletions(-)
---
base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
change-id: 20240627-fix-riscv-rt_group_sched-d2e014be48da

Best regards,
-- 
Celeste Liu <CoelacanthusHex@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
