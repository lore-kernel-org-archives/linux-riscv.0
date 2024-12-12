Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF6AE77180
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yh3V+glR/P9tfBd1F7uZJWvHODLGUSRAzEhUddluARA=; b=aCV8e1pACIaqsv
	JnkSrw4dNjQxCDbRAK0JQvZ53AHAJPPi/M091FXoDIc4Nn75rLSBqWpdkfi0aTMb1vV/DjPA4TSKa
	Q8UkOkCHhrZG6dKaaWHvt2A2Gjj9LVBEazWYWuSX8ikmVj/z3ml9YejV/2Fc+ZcRrdr4goXgPRMOH
	E4X0MObIpT4hpv7uPVX6nvsFvjslNOZaTrqZeNYFJLQY3CIZMRFFt96dM9R9Sri/L6aw4vI/jGqC/
	6ThmT1iH3dRM8R77QCIcFX8K2GQ+N33zC5DhaPc7W9z3dfsmVLLyCei/1JZvIzJAEAzllxc4gANPB
	yfrHG6TkYI7uhECpbjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF4-00000001rvC-2VjL;
	Thu, 12 Dec 2024 20:57:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF1-00000001rsV-2CCz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 20:57:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21649a7bcdcso10750605ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 12:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734037018; x=1734641818; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tN0Np0I/Y4AvFV8aJjEc8kjQ4MihsgPm5ajnYSHONIQ=;
        b=xegm/ijziVxoSrfhjaF/bg1+cQehTmP8Y4eUPM4hLYYfRlOv/pQFCtTALweis19dOx
         Zy7q+TmHVVGchB61IN9PAb47W5FQ184tr2bD186HKInOyABoL0kiAP1txRCI9MUmHHVN
         5NzbiN3WCVJtJiTKWX9RZP3o5VBbTkrNEt3kBvj0zNK53HGuMGKuVsu8WJLWDSBT2U2D
         b7g98diXDwjHwxJYZ4zp43aGERgEIHOmmIYLKLpNaKS9MvGTs99rNUyq+P+dgIyGOyUl
         M4U4e/BYlPh90MbGaUQi3RsawODvjosmQjG4VnWfiO8pVWECBm/1pzNKhB5b4CmKU+/d
         ydZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037018; x=1734641818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN0Np0I/Y4AvFV8aJjEc8kjQ4MihsgPm5ajnYSHONIQ=;
        b=cypVPBTB0BWGoAoHtqs7i6q779RdFsm18ZpTvAcZ2k7YM8LW2vAZmx3CGLr3wov/1z
         HsHfmgctqyZ8HarRPb8BYBz6ZSbUciRRQfrU3QcWvuVpDk1ld0EKQcGUR4W0Nl4SMdrZ
         xLLeyNk4ARiyppGdZnCpcj2cKfneC+fjrgJtfhi4CgvjigeNPmDJaBDGIn+NVWQ0WsxF
         LlhOx0MeJgK+H5i9nE/9lVCX6MkDG27gYZYqL6s+rd+lNBfTQkPw2RoRjBnU9yjbVeDR
         bICtnU0cBi4wnwGUiDl0Bytx2ZXMOHbn7x09ntP3cOHVk0eIrL/Uq1KFMfAAozKbU81J
         1W5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKGS5X92jITSSmryRezYX96OJxi4+zwfhHlPLi4ROAOHLjOtqg3sqr8AEVBmAIZn9XbdmNr7HAKNruQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFQKUOxhpKvRbHQHVj9oGzYljqgsX8wiGGg6e6mW/X2seU/wp
	FBJ7lOCg0JzIUVqQJRsslmhgx4OJNO/a5XiiXk+uMxJDj14M9N1nYMuG+zYL4bc=
X-Gm-Gg: ASbGncttgYiItPs3e9BC+NrPIQt+YhsllyyT6P3hAec6vDjsiUaURYJUgDrv+n7Ojc5
	scnVwo0zP8JpKX/AWr0emCj4Cy8L2rfEYiQWe5ggBwOFQn50OA4/p6K/hCjpLIrcj3pzkpYi1s0
	ryLnfTitBKtsZJRlUUNIq9hV9Xq297aVX/hKV9toliyoDNws44noZK8B7ZiRN/ovrEZHrWgdWid
	+jTz9FyesbFr3ktsNHbbazmBpO5gdw+qvaaCnwAhiPTmeEgHuweCsuHdjicTQmAwonjQA==
X-Google-Smtp-Source: AGHT+IEXAiBGQzLsJG95dn4oVog9wDVG/U9w68CWre1GKqNIKH0u3bVdjPlSX71Hw1mqCrUyOUt07Q==
X-Received: by 2002:a17:903:22c7:b0:212:67a5:ab2d with SMTP id d9443c01a7336-21892a3fdf8mr2207705ad.44.1734037018404;
        Thu, 12 Dec 2024 12:56:58 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162e53798asm94019785ad.60.2024.12.12.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 12:56:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/3] Collect guest/host statistics during the redirected
 traps
Date: Thu, 12 Dec 2024 12:56:53 -0800
Message-Id: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABVOW2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Mj3eyy3Pj00tTikvjiksQS3aRkEzNLMzPTJBNDAyWgpoKi1LTMCrC
 B0bG1tQDWHDJDYAAAAA==
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_125659_566903_EA5FC8C0 
X-CRM114-Status: UNSURE (   7.14  )
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

As discussed in the patch[1], this series adds the host statistics for
traps that are redirected to the guest. Since there are 1-1 mapping for
firmware counters as well, this series enables those so that the guest
can collect information about these exits via perf if required.

I have included the patch[1] as well in this series as it has not been
applied and there will be likely conflicts while merging both.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (2):
      RISC-V: KVM: Update firmware counters for various events
      RISC-V: KVM: Add new exit statstics for redirected traps

Quan Zhou (1):
      RISC-V: KVM: Redirect instruction access fault trap to guest

 arch/riscv/include/asm/kvm_host.h |  5 +++++
 arch/riscv/kvm/vcpu.c             |  7 ++++++-
 arch/riscv/kvm/vcpu_exit.c        | 37 +++++++++++++++++++++++++++++++++----
 3 files changed, 44 insertions(+), 5 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241212-kvm_guest_stat-bc469665b410
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
