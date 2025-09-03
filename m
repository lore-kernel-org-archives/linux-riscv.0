Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E57CA1012
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 22:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EYLNw/z9lpyMaY5p6bkamA36GxiGJvD/TGpkUGuERns=; b=yzrtbV3lL5rL5F
	Ie5gWOWiaX3ybsZnYfnolQ0Jcx+y8o8KVUCPW+8UVN86neUS5VaWPjgF7AtyMuBTgsHJIJzum5YIV
	rjF5HpNX69ciZ6a7K4NBDO58xNSQovGQja2czwTC1NxZfxiEpsaTQK/7HY+KQ/yJfUU8t9GPVcdyU
	rUTErkrbbWVhU2RMNqCOFVsvgvtwnxCuUeV7fP5loH2DsrsR8iTKOYURf++BarHjDz7opgd74qGlr
	b3LD8vzCdljMgPNF/H+MbLGuTEJfYZI3VoTX265DYUVCVkMtlWMa8KUWuzzlIt91zGTColOWkzZUF
	GYwNvanrLYHkhFmlSIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwFr-00000007p2u-2dQF;
	Wed, 03 Sep 2025 22:47:03 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsc2-00000007McY-0SrS
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 18:53:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso165833f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756925620; x=1757530420; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dY74Q/u3Ru6+r/HyEqSFai1CTbjcPGijqxMV611+B5w=;
        b=eiHqPH7EywG3a6j3am5ZbLGYDYwcKNvrBlE4CayrSv37FfJwdqpIMXmkH1wXYkl5Fq
         DklMiusFhAnA+gtFHcvXmo+vPiriIzODrBpukjIvYb8TDyEyvhKDTGWZEL7n5WbEuPMl
         R+dY0tRbjFS6EQ/ai5zRwfKx3h2IQQaSBsC5hait0DQcLdF4smERMLB69z+TMdoMlRF/
         Uj/MqCAEZpDJhRCNi4P40LpmNuZjWfx0n9r9xDj1RSD0T9W6j7PlSL5qZKtmD8ymsX4x
         uZZAexGLw5coa35hse7QjUcMH67mVtqZ6w/Zle/oMbFaJF7Knj55FjxTWleaEKBipbzF
         S17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925620; x=1757530420;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY74Q/u3Ru6+r/HyEqSFai1CTbjcPGijqxMV611+B5w=;
        b=P0h/SkpqCBCwpVmIc2RqHyEClHbfGqf63bQbUCygiuPVfPYEzrZjnkuCHVERtUadBx
         PzLGaRqAZK2411fxDiQhGD/ZEsaGpkeiaMDe56v2MK/5vdaog+qqDPksD34X9Kkp2nA4
         3m8cGDpphig1nqUsPKqHhVmPcNW3xcclQ6Vl4AgMiwG+LVzBS1h9MHLgvQbNRCv3RtTG
         aIJO3ZxdfFz+9FhKDGuJiNLMyjQ+nvW2yO91K6W53cvFIThHcwg+5kydsUCvAJCwlPYe
         E46KAuEm42w+lMNExMzT/jaeeKsc4S48bPYvBoYl7CXD4/Mb6DKQR0MFo9Lkfs44n1ZX
         bQFg==
X-Gm-Message-State: AOJu0Yy9a+ETMM1w9fBBauFON/HMmcOxD9Fl2Q7/mX8I5koHlBO1bCbb
	zRvL0dVic+cWgv8GJp3SAtKnT9Kzdw6cYqxS303jPjYjtKL3sBTHMUrbzHDT7Y5cv0s=
X-Gm-Gg: ASbGncu0Eh+ZTIvCzAbqFy3zsa6H+YRhQpZIwpuCgK//ceEQkX7eebHpBl1/FpcEtuj
	mmvrl/V1LNz7CGO8oF00A3loiHz4fM3yGQfxFArYJaf/r7TRbac5IddcXJP8f/kuko3Rm3iy5MO
	9X0EfhPFDdPzdbyB7rZNghofZgjJVh8ACMSosRSZnPorTlWaqzaJ9+dr68yZ9GmnKBc0w1pmJVO
	GIP26PiztgmwrBKWpGgWTMO+5ZU2tlXaWPp/ap3IP+WbsVUYMUIb9aLIKLxiqBad47xtD3S4j26
	Sj+npv04qllI3w+usLrGJ1/Oc2NrWk5EEspJ6+qkN1wbzvtgMRZojg7imRK/UWd1uJIpLbnwu14
	P+tdA9mb6eh/Cmsm1uZXtpG0jggUrapuXaS1hDFvi/mvp5NhEewZF9OLy1s7qJZzvhVJRMdrpdw
	bFCjUB
X-Google-Smtp-Source: AGHT+IF8a0A0l2XFuegks2zhsw3pv5dzYkgXtxgGCif7IKK2HfLokVKOJojcWFNnAOtt5tRuZbv6XA==
X-Received: by 2002:a05:6000:2c0e:b0:3e0:3a67:b361 with SMTP id ffacd0b85a97d-3e03a67b52dmr664526f8f.42.1756925619939;
        Wed, 03 Sep 2025 11:53:39 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d690f2edf1sm13920647f8f.16.2025.09.03.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:53:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/2] Fix riscv sparse warnings
Date: Wed, 03 Sep 2025 18:53:07 +0000
Message-Id: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJOOuGgC/x3MQQqDQAwF0KtI1g2MTruoVylFUudrAzKVBKaCe
 HcHl2/zdnKYwqlvdjIUdf3livbW0PiVPIM1VVMXukd4hsgJhWXBxr6KOYa/WNY8+1Baxvi5S4x
 RppSoDqth0u3aX+/jOAHjxIWWbQAAAA==
X-Change-ID: 20250903-dev-alex-sparse_warnings_v1-ecb4a333afdd
To: kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>, 
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=554; i=alexghiti@rivosinc.com;
 h=from:subject:message-id; bh=pxMPTepE/BoV6j6uiZYi/9vKVoScEgdWT2VjiTnZE+k=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJ29K2SvbPoyTSBe8LrL58UOm4tx17NMX95TNS2E9Msn
 8btk7yr11HKwiDGwSArpsiiYJ7Q1WJ/tn72n0vvYeawMoEMYeDiFICJ7HzNyHDwbGbwq6C87MyT
 HNcbHkbm5Xg4lM/w2uwv9nbqyi6G50KMDNPXR897KrR9yalubrF5cmq3H3zmNVoSbLO26H/pI93
 NYkwA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115342_302894_D133CE9F 
X-CRM114-Status: UNSURE (   6.94  )
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

This series simply fixes 2 recently introduced sparse warnings.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
Alexandre Ghiti (2):
      riscv: Fix sparse warning in __get_user_error()
      riscv: Fix sparse warning about different address spaces

 arch/riscv/include/asm/uaccess.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: ae9a687664d965b13eeab276111b2f97dd02e090
change-id: 20250903-dev-alex-sparse_warnings_v1-ecb4a333afdd

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
