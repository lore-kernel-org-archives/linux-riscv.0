Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96789C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=urhkCeTEoYl4f0WZScKf+1NfDxDV6VXfFQBAhprQIpE=; b=fHU5fSlRE8p18q
	p/iAPsoj4SmUNRvj0oZ6y5RL+3WZSb7OwTRFMqI/swju1Ja29yAOupGB+fhVYujxwMpNUa6cvQSQP
	Or+eKmtnxJN//h+mVgAo7HeBapmvi/FlHBMZy9MMw0fc+3E38o9EODGS5YdYxn28gZv0p7y40Dfy3
	aghzp+9J2PKL0z7KfIQ4+CF6rCAiaMTgGRjWbeUM2cVkQTpd6LYQZ8Q6LSa9U5DQLXi2lBfy0tqtG
	2B4CEZzKwFoI7eaxRh0PtaBnf6Fwg6ZtlYzPlbOObMqt6gSN7mDVvWSO4aAY7cQYdHm5Otfi4uapQ
	UDnOiWbUzMYRbXVWQp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN5J-00FFTn-KS; Fri, 14 Oct 2022 15:58:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN5H-00FFSe-8P
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 15:58:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bj12so11386799ejb.13
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5eO6i8yGqM/Qk/helghde+sK2B6uuy7iGWdi59LQv0=;
        b=m5i1o0Ap34XB2wlP21XgYIqsVDRRQOqNgXMX5tJzWsaI6hGrAZN9MXRzGc93zF2XPA
         8L/SLRgslFncCk0nXLKfro+LvVAuBiIJEkGi+kku5MAuwTr4Av+VkPDyus9j5yCxKY0e
         YOtAgl4m9DWHQK3UYRyVu1beWyQGVeOVcZD55vwQwp4fSb0QhgMCnZzRu0uhrRUo1Tvq
         XZgdlHZK3gCz7g4TIGW4i3ZvbPG7Gm3XysvcL00yJwc2GO4L3l9DhN608jkbddOb/W9j
         f6nCuDr1Hx3UpL7i6FB65/PdJkLsqhTn6pdhYB+vtA5dMZT/TwoMfVhWXkBkx0/mc7XG
         dKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5eO6i8yGqM/Qk/helghde+sK2B6uuy7iGWdi59LQv0=;
        b=6eckWkCiKY3likAp/U5MAOqKlGzHWITQUB5Vpg69y3yJOFUWiQlB+VgUhOWTs4Tld6
         zh/Bcn8gXCq/rSUHdyf70/2brZeNpXk0J5SnR17h5nyxAv4Qlp1eloQVgx1Wg/DMS+Tf
         40d2CTL3la9znuBHmNAESYMLSBedaZAZI5HjBY18lZ53SlLa++mr08RRadofTWxwGdPU
         cbv3S22YiLnqIiYPYRHlvL06vAOgOspx56uOSrtgtiOn/3wmTIaNFXcVaUYEWRgE5kVL
         W1tGMXB6eOhQdCXU+bL0m/NntOYbDZFogz+DbmX6P632ZY9jTPECNyDX0LN7cOPQWPWs
         q3yg==
X-Gm-Message-State: ACrzQf3EVJRY9EM5N5VqJmjVgNtr7LFGEorjqOQl612z+cleFTfwGc4P
	Lg1qHdQL70aGEVB4VjYDGrp2hQ==
X-Google-Smtp-Source: AMsMyM7W6+fPu+mWcsl2mA5mLUmVxJY6ZAokGeJNv3DvlB68CliPDKXds+EoUBatPkHWx2Y7U7pt8g==
X-Received: by 2002:a17:907:94c9:b0:78d:3544:ff0a with SMTP id dn9-20020a17090794c900b0078d3544ff0amr3984138ejc.386.1665763126950;
        Fri, 14 Oct 2022 08:58:46 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id z5-20020a170906944500b007262a5e2204sm1693950ejx.153.2022.10.14.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:58:46 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
Date: Fri, 14 Oct 2022 17:58:43 +0200
Message-Id: <20221014155845.1986223-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_085851_322540_7BF1165F 
X-CRM114-Status: GOOD (  14.89  )
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

Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
start and next seq operations implement a pattern like

  n = cpumask_next(n - 1, mask);
  show(n);
  while (1) {
      ++n;
      n = cpumask_next(n - 1, mask);
      if (n >= nr_cpu_ids)
          break;
      show(n);
  }
    
which will issue the warning when reading /proc/cpuinfo.

[*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.

This series address the issue for x86 and riscv, but from a quick
grep of cpuinfo seq operations, I think at least openrisc, powerpc,
and s390 also need an equivalent patch. While the test is simple (see
next paragraph) I'm not equipped to test on each architecture.

To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.

While the patches are being posted together in a series since they're
for two different architectures they don't necessarily need to go
through the same tree.

v3:
  - Change condition from >= to == in order to still get a warning
    for > as that's unexpected. [Yury]
  - Picked up tags on the riscv patch

v2:
  - Added all the information I should have in the first place
    to the commit message [Boris]
  - Changed style of fix [Boris]

Andrew Jones (2):
  RISC-V: Fix /proc/cpuinfo cpumask warning
  x86: Fix /proc/cpuinfo cpumask warning

 arch/riscv/kernel/cpu.c    | 3 +++
 arch/x86/kernel/cpu/proc.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
