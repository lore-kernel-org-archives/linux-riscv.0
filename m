Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747B1C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 03:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ZMcpkClKEGbQpjEgF4I4Moyi7CFw0FDwMZwd0eyhYY=; b=V3P+tww+WcvVK1
	dLbbWy4xC0/FQ6A46uVCUpnCLl+yd3wWYlonZLKIEeVwUjARWhZwwsfBlIrrqlS4jnxbnXAP3DT/e
	L28+Q4BPLvewesp1QwQeM91a0gUrsvfzODc08mZoRYTaPBJQ9gFSMkL2HZSvoLscLL0c8yXfEdvhK
	oRc86AwE6eibtLZqBLrqFnwpEQ/tWjQAbUjiAt8fZf0ShkWVJcqZUn99wcZkiEJqdtFK6yPFUqcAV
	iHTZwnU8S518k4MLxWXTtVtaoCKhk6V2bX5DB0wwQ57Ky95To5iC6357/etmG2uCoj47NCMQ75oIC
	Wvw9mFIsUSWTBFZQ8+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcE-00000007rLB-1bZl;
	Tue, 13 Feb 2024 03:37:50 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcB-00000007rJd-0G1O
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 03:37:48 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3bbbc6bcc78so3096648b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 19:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707795466; x=1708400266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wd/JYFJKep1rAhC5j9BPNCBpr8gOscu2DNvYuPwSHJE=;
        b=Z80VFsvrF6fFpH65MYGe0GiOC11+Yn6kWPFktORQemNd/8tjdXxy4klUd4rW2JIB0t
         jPZGZS3aHum8VtrpEFZLsyLwqQcCiziWJaloPnYipcOmVC/GNim2P8WYOWln8B5Svsy0
         o/ibNsEAFACoghyDbqgtNrzvBMTdNee0z7/sW3QHTJgQjFfX8gXK41UcnEUnA4Lgiw/i
         7Mbzdj0nDwGTLijZ+ykq0Qz5w/vbBIgdmJmF+bymoCIonPMI/4vKX+hdAb3xBLKzz7gV
         Wux3pYpxgOewYdMn4afoGRKXyMUtFO0VCoefglhWhkB4iaa3NAZqgXwKVtLp0+cBMdgs
         RP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707795466; x=1708400266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wd/JYFJKep1rAhC5j9BPNCBpr8gOscu2DNvYuPwSHJE=;
        b=skPFJbImKSu4UPI53CAW1yhdcwWt+Ulp7bQBLhC+4O1MicKV47vdqRQjKps6U2rM/5
         ZtabYO/gOWjC9uQDmHicRvitN28wX2xOO2t20vkWG+O7TPapezVUfH6IjCYcZeKsZVzs
         dNqpFAfxYbiFMqJd5xjFHZqEnbfiPNPSMw+ybzfwckmMMqiNjW0hTzjbgBeD8bO9nvR4
         sb3ngSIiIEjw96IwALVhrhPmFJtVaxMWf71OT1vAGyi/ulpv0YzNMxUCsHIxO1vHhAGj
         ct+xxwBWb27kIZkj+J1BLtpfWIK3CB3xdyZQFfyQkUy5tX2vbsAjnN80VfM9yO5BS7H3
         odaw==
X-Forwarded-Encrypted: i=1; AJvYcCWBFufOPVWCMEywxSojw/0VUc7y9a/DP17gQ3gpr9yd1IYHU9mqYEMqut1tn3dwvT6DpdQRaaBYVp+N9FuXBB1rAT8XJLWmT/dhJpDmIw59
X-Gm-Message-State: AOJu0Yy5TxpnLJGpoSZkK1UlmmMX1rQxvWXHJ3XNq0HZ2imQTVBfu+8A
	nrl6THTTU/g7nonxMYaHJ0eZAesXeUay7J4wkCUUu0uxlxGwSnBiBqimWX+6CDUMEu6E4Ftn+oL
	a
X-Google-Smtp-Source: AGHT+IHU7T2Qcc7HVPlGS9K0ldctu9qV5MAsYITwNI996JmEkdMvEWmLy+Qiine2m4onhtLdTjFiug==
X-Received: by 2002:a05:6808:10d6:b0:3c0:3db0:55eb with SMTP id s22-20020a05680810d600b003c03db055ebmr3340578ois.49.1707795465913;
        Mon, 12 Feb 2024 19:37:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUy63kmiG126yff7qiLVwjqWHChxUM8jYm1eXwZgTtPIMijD8vVPWhxjemkWU2LKCT1hs9yCHNLAXefuYHAJ09+r/AYYl8O7SVrYV0zhVAKjdgb751QugTrjduf+N67rsT9zTuLnPz86NQyZtTj/Sg/OiRfB6kX1SnXoU3ejhcdyoO8Mat+GwwcC0gAKewup/ur2kHuCSZPa8TeSfrI
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm6188633pfu.76.2024.02.12.19.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:37:45 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH -fixes v2 0/4] riscv: cbo.zero fixes
Date: Mon, 12 Feb 2024 19:37:31 -0800
Message-ID: <20240213033744.4069020-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_193747_127792_817C769B 
X-CRM114-Status: GOOD (  11.10  )
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

This series fixes a couple issues related to using the cbo.zero
instruction in userspace. The first patches fixes a bug where the wrong
enable bit gets set if the kernel is running in M-mode. The remaining
patches fix a bug where the enable bit gets reset to its default value
after a nonretentive idle state. I have hardware which reproduces this:

Before this series (or without ss1p12 in the devicetree):
  $ tools/testing/selftests/riscv/hwprobe/cbo
  TAP version 13
  1..3
  ok 1 Zicboz block size
  # Zicboz block size: 64
  Illegal instruction

After applying this series:
  $ tools/testing/selftests/riscv/hwprobe/cbo
  TAP version 13
  1..3
  ok 1 Zicboz block size
  # Zicboz block size: 64
  ok 2 cbo.zero
  ok 3 cbo.zero check
  # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0

Changes in v2:
 - Add patches to allow parsing the privileged ISA version from the DT
 - Check for privileged ISA v1.12 instead of the specific CSR
 - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s

Samuel Holland (4):
  riscv: Fix enabling cbo.zero when running in M-mode
  dt-bindings: riscv: Add ratified privileged ISA versions
  riscv: Add ISA extension parsing for Sm and Ss
  riscv: Save/restore envcfg CSR during CPU suspend

 .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++
 arch/riscv/include/asm/cpufeature.h           |  1 +
 arch/riscv/include/asm/csr.h                  |  2 +
 arch/riscv/include/asm/hwcap.h                |  8 ++++
 arch/riscv/include/asm/suspend.h              |  1 +
 arch/riscv/kernel/cpu.c                       |  5 +++
 arch/riscv/kernel/cpufeature.c                | 44 ++++++++++++++++---
 arch/riscv/kernel/suspend.c                   |  4 ++
 8 files changed, 79 insertions(+), 6 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
