Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCC5C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SbAYpndyCQLeMa3jMgNUaE8IuNNLNUmwzooqKs6A1Rs=; b=tudYFatsbDna4K
	dGaJzsryxbgwx/Upumaq+Qirg+Olq8iKuK2yJGusR58iQlnnxZ1IxxrAwllkDebLi6kpJ9csdlUAH
	GDAsYCTjlbSpODfDqbBbxAwncNxFEAkpNXiMM9zX2uyOFbpssSVnFyaguh3R9GgC6XON9dE2y50wj
	YuiJXM9FRsqvi6h8VbgAGoGk2SH7XXwa6qLiMC124o7GJTosqK6CsqgZvR0qxp/yBEz4udU2mr3Tp
	HxTaWssolRad0rPNuBS2rcFhk+LXMIvveWKEAGX0Edgv+OyzOuAfZlzicMDmcN7vvr+ic8lkwnA8P
	e+mYYGa0Dv02UtfTazQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1W-0040ZS-0k;
	Tue, 09 May 2023 18:25:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1T-0040W5-23
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:25:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64388cf3263so4449051b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 11:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683656710; x=1686248710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiMJc6QGOIbW1ytG7Lyazrjjzo/0vM14MGeeRHZgEW8=;
        b=fbQc0hUM5ybA69Dr2SckUQkDr77wpzfeOfb3TXFobM3XKEHfKC2upOsCQALRk3QaW/
         gvMQXJFKx5N+z7jc2Rj8+q/2swBgmO76zQD7v7/mJ2qtGeD7rJsbj0q4K56UWEpFC7G/
         PQUSWRqBLvUNVY0POYD3d2LFhJrHrSX5OiPEOZKoTXJnSsxuXlXPHMiuXXdlKHGsEXck
         tBPDk7AnFxLw3LzcX1y2eI5Wh9w38lToEOmFsPvvi9XVm0haXPWkEzwX4iWMd/jeVE9p
         rw5jtQ901W+HinyEYtJgaxNNoWE9VBc43hE6/FkOG3VSXaNbYt49NmPNqOA1E5aHkE+7
         BSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656710; x=1686248710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiMJc6QGOIbW1ytG7Lyazrjjzo/0vM14MGeeRHZgEW8=;
        b=gtuXgHQeQOKIIMfccDpSIb0QXqVAxOf0nZpeV6obafFHlUB9dHhbKyvU9cU2HKH3ov
         V1kVhK0Z9+KOG61j4fqbjAZ3znszpmVD3MsmBP/YQuMzOCGLCC0iayE5BICy46fBHqHd
         bh0wig1v42eA3hxMB6IuO2bKU9qiET6xnSUWo+VzmDY6nAGkVYzNmSo6txcHG0VUx2oz
         MKkH+9yfOnQMzSAlW8QG/AECGJK7ZnfaO3YMqp3ta7y6+P3pIGqaA3Tpg8stnJlOzGMX
         CWFB3AWR8d1NOy7nTRXmDjrL90baYE8/uTLKuLq0ZNey62BdF0JXUjtvfZg3LKr3WVZ6
         dmaw==
X-Gm-Message-State: AC+VfDwusEjmKVl7VwDFHsxOSbt2Z0gjepCM7Phixj5ybjVSldve0ChX
	Q3gnX8J4USCEfXwv2oAaWpSjqg==
X-Google-Smtp-Source: ACHHUZ4ODHbQUf1wCIXJxzh4KKsoJdZOKpptonZyV5itOo5QhlMO4+MHW+x44Bh7MrqfPYzqlby1yg==
X-Received: by 2002:a05:6a20:7f85:b0:100:4a2f:4777 with SMTP id d5-20020a056a207f8500b001004a2f4777mr9605643pzj.38.1683656710253;
        Tue, 09 May 2023 11:25:10 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id q12-20020a63cc4c000000b0051eff0a70d7sm1633559pgi.94.2023.05.09.11.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:25:09 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
Date: Tue,  9 May 2023 11:25:00 -0700
Message-Id: <20230509182504.2997252-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_112515_898574_6BE8F003 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Andrew Bresticker <abrestic@rivosinc.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


This change detects the presence of Zba, Zbb, and Zbs extensions and exports
them per-hart to userspace via the hwprobe mechanism. Glibc can then use
these in setting up hwcaps-based library search paths.

There's a little bit of extra housekeeping here: the first change adds
Zba and Zbs to the set of extensions the kernel recognizes, and the second
change starts tracking ISA features per-hart (in addition to the ANDed
mask of features across all harts which the kernel uses to make
decisions). Now that we track the ISA information per-hart, we could
even fix up /proc/cpuinfo to accurately report extension per-hart,
though I've left that out of this series for now.

Changes in v2:
 - Add Zbs as well
 - Add blank line before if in riscv_fill_hwcap() (Conor)
 - Fixed typo s/supporte/supported/ (Conor)
 - Fixed copypasta s/IMA_ZBB/EXT_ZBB/ (Conor)
 - Added Zbs

Evan Green (3):
  RISC-V: Add Zba, Zbs extension probing
  RISC-V: Track ISA extensions per hart
  RISC-V: hwprobe: Expose Zba, Zbb, and Zbs

 Documentation/riscv/hwprobe.rst       | 10 ++++++
 arch/riscv/include/asm/cpufeature.h   | 10 ++++++
 arch/riscv/include/asm/hwcap.h        |  2 ++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 ++
 arch/riscv/kernel/cpu.c               |  2 ++
 arch/riscv/kernel/cpufeature.c        | 20 +++++++----
 arch/riscv/kernel/sys_riscv.c         | 48 +++++++++++++++++++++++----
 7 files changed, 82 insertions(+), 13 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
