Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D396C47DDF
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AQIdNCSr2OfXFP849pTDWp7b96QrfX0+jSCZKv6ZW6I=; b=qn0joKewB2A/2r
	YHJ+1IS1zNcd1zPSXEDCKJUfOjznrnZ+t6cC2OR5ntlL8fY3xrkhhUR1Kg6B/qPY2msxxhpOTvsV9
	JT1fOWX4q7wUbwBnjHEKO0j4JShYQ1xsQ5yV458cEaZMGQvdYm0TK8QMQvKFQTOqMwFmaxP4DT5Hx
	IAntPM/pwf3sKogK/i96Cpk3tjCA9mpAIXpQwcoaII1Bi1aORDJ9fRUFSjNV6EXA7SV96DeiA/NM1
	PdKoX4JXABbIsy+GjhKDn4B1Kcwx5Zk4tmzxZadQNgOi604Bk3wCqqFe+BPZ/VurbgCv1E1gBK3el
	p01KwknFmL1+eKhgMB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9LC-00000003GTS-0ZyH;
	Wed, 31 Jan 2024 12:05:18 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9L8-00000003GQK-49ms
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 12:05:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55f19a3ca7aso1519123a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706702713; x=1707307513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmkTm2FbEfD5yZbJGxXKjrObz6FuuCjjJX6k4r4S4b0=;
        b=nzdWwczDv1N7xrm10YTDGqDnEsAnIuxIOJ/T1rZX5TP+Ou/6GsxioECRsUWcqq4JFD
         wkLBNcv/WMvk4NGiY1hiTuSPeNn7mVTqVpS2W010LHVWvkjq+2FjeBNdyv6xK3v756ln
         kpmqTlpWCFwjR4NteQx4iDkyGXLJCkz2qmUEJNVXVdsg80ByFox/BflOjF39mDQ0p++I
         iAksSV0zOwUgq8eioaSK0kke5pHtuBIGI2yLyJngZCNQ1bT+jYaqPEFw6HKCdmrwwonR
         YgVq6dIKRW0tHmuHGajJ4lT8QYKW0ktTLNCFo9DWClXl2k3qbEeQp5k6Bamx8TN4UXj6
         mXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702713; x=1707307513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmkTm2FbEfD5yZbJGxXKjrObz6FuuCjjJX6k4r4S4b0=;
        b=VSVDlPD8Qaw4sYYys2NPC0e3sBf0slPJUsFkUj08fY6I8Zpn3Gxq/1lcSLArt5fNgv
         //d3kyz8VZgC6WLRIWPmLIZnbLCINV49YXJSp5radGJ2dTPcU96EezsCGpzoXT3591mP
         Imqg7gCC7EVeXvJUMMTCG/b+TWxx00fZCgTUzcVbfm4Ar7g2wbG3u1q4AVCn6+js/ldl
         2yum9BYzWSHj1fgVRQ+rNJOfYIWO9IdHfeodG5wte3Z4wgdCcjaoO+vSkH6YTxioGTtL
         5jVgELWCb1c6hYtFsshzOBq7OZsN1rwoPWh3WWkv+vyE/ikDFMpFvXMQB6ibnJbsv9uR
         pBeQ==
X-Gm-Message-State: AOJu0Yxio5iZyfKS1rQe0a1IjvMS3WvChPm7HOinwSdW+dtzEl62iavh
	UXTE8ez5/RUadT5dvKaNWf7rNgqKupPIlbxfY9+6JsGDgeW+NAhNvuVZTmQ/f+Q=
X-Google-Smtp-Source: AGHT+IFJpuHs3T8ddeemX+zf/r78u8et5XphhT5uSCync2yF1AtbPLrQuBMKo94aHFtq4tq3yLPZuw==
X-Received: by 2002:aa7:ca4c:0:b0:55f:63fd:2bb5 with SMTP id j12-20020aa7ca4c000000b0055f63fd2bb5mr1321064edt.1.1706702712544;
        Wed, 31 Jan 2024 04:05:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVoQ7ytnNzKKRPm/wr5ykGpRiK4ALOW8BL18wRRAdY7GoTuZezAoVWBqMJbGIkMApzTxboFxLnf+oEKxsWagXWdPucndyncahwpKYrWVeLQQWwuyzDyxUDZZfWMT8mCMbga2aFDzVQ3lj9T5aoHWilgjs4yuhJ9bSPTsogkvZ15QtdAwmBQC+r+hftsqFjv3NNHpj4igTvZ1H0oT2oVg1uyhGs/7DPMOYUC/G9IscnR17265JzjhS9dhpnnrQEZiwgllJOV
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402320600b0055eec69a5cbsm3649670eda.71.2024.01.31.04.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:05:12 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 0/3] RISC-V: Fix sparse warnings
Date: Wed, 31 Jan 2024 13:05:12 +0100
Message-ID: <20240131120511.200338-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_040515_055402_51B12EB5 
X-CRM114-Status: UNSURE (   5.44  )
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

After the steal-time series was merged, LKP sent me mail with sparse
warnings for the lack of using appropriate restricted types and a
local variable not being static. This series makes the fixups
necessary to appease sparse for 64-bit compiles. Changes to
__get_user_8() and __put_user_8() are needed to completely quiet
sparse for 32-bit compiles. I'll address those 32-bit sparse warnings
separately, since it's not 100% clear how best to approach a couple of
them.

Thanks,
drew


Andrew Jones (3):
  RISC-V: paravirt: steal_time should be static
  RISC-V: paravirt: Use correct restricted types
  RISC-V: KVM: Use correct restricted types

 arch/riscv/kernel/paravirt.c  |  6 +++---
 arch/riscv/kvm/vcpu_sbi_sta.c | 20 ++++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
