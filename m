Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E97C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+F6kKy1vD0SlKVhIuJb9Tq8RE4cszVT171TOkJDZrpI=; b=qFt0YgI1WEaKi0
	eVuSUaDgD8QPEqP+nKklxwHsXs47xEQqOhXmUNcPWT/aR9gqr82KCcqKEhVqnKbbPRi/AlrTuwkTl
	0Ig65vn57OXwqR8LWdK2db7yainKEBsWVdB4ZQu+umdaFYw81jc8BzvzC07RZXXsD/elN/VzK2xKP
	Kgu5pu1yG2qF7nNIFv2ntg2Rckgzz/+4Q7VNEP4yu/nwdbmjUUJYAdGwdyjdK1nxg5tQIIvOY7Mo+
	tjmKIapIRYStcYvjS/BabHnRSQJjjMPzl/ijWl9Ci4uMziCashEAUVU7VcRAyGwha6OyhemySJnSa
	4/jbFccrQDrzpdzLhqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSOg-0000000BtxX-2V6w;
	Fri, 09 Aug 2024 16:23:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSO8-0000000Btfi-1Xg0
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 16:22:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fdd6d81812so23122045ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723220567; x=1723825367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fM2VDWjrqv9lrjNKWDnw+ItVMCPfvg36IuOKi51U2nU=;
        b=LQxZ9T4StYsMxmkS3d3OFDKSOz1SLRBzJAPDAXX5GFPj9ekSBhd+U4BxTRqWI8iBA3
         L7pJtl5n4HNMEYpF8ydrSlB9Lg7FlNxyEwlZPPEMo5KocTMeoOiJ9Gong/yHCcVjrs2e
         4cbcokVzRbalpwKhls9LYhy+ulO0kIG0H453iacg4l4XD+vcPSmsnrHezb2gvIZWZEL+
         S612aLp4krbIeFsKVdoFbSKj2WwrxgQO7XWNt+kcMOnOfjwVF8rNr/bo2VGiWv3ocNbi
         D1K0ELaOP2LGXIZgcASRdzSgCyGsj3h7xAmBl2HZIP98uKQvTePW2UJHaAFU+kXEBibm
         I56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220567; x=1723825367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fM2VDWjrqv9lrjNKWDnw+ItVMCPfvg36IuOKi51U2nU=;
        b=T8g5qrsT0Z+m2JfvmA7eNz5oJF1IVlJsvDr6Vcxv/uOeLrZxopPvnA1BYQT4yQTRLn
         37gsuWuTex5pXrwsD8MMnr6thoUBFPaSmjruIgTVPed7O+gUZBhPBwtwJH5XPkImfYx/
         KTLgaYMC82Q0VzHxYLXxDoMz7eXnSqWtPop1N8BweRZjtc6dWFmFN3XHIMdhc7Ab50ao
         vZXV/mLx8gayH9rcgtbFE1/1kf8xlwKDCHrVy0Jjwx1hIyHy5yr+OcFGgWmOycMEWUQz
         P/s6nhgCG6eDxYADR8V0yFJGru1UuXaopntz6uinJY2AqUgAaZvD1Ychcc60GS9sEPcH
         dILA==
X-Gm-Message-State: AOJu0YyQatd5qQNAl2Yyg17SXsXlnLB/dbEFo0pJUuot4DAjZqNoX1bM
	BTpmurvRMVSYoNmQ82i5OJkr3MlrsO56khNZAKc+LS435Ds8MqYO8jlUPpUtK2ngCUvPoTyf9XH
	x
X-Google-Smtp-Source: AGHT+IGqUO+CKpGZVaOzZdHApACfqVhHv0z7O+fN2b3OLvcB9p/WYhCAE/fx1r58g+9+NN9ktAIaPg==
X-Received: by 2002:a17:902:ecc2:b0:1fd:d73a:7cd1 with SMTP id d9443c01a7336-200ae5da91bmr26359905ad.56.1723220566767;
        Fri, 09 Aug 2024 09:22:46 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm100414505ad.207.2024.08.09.09.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:22:46 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] RISC-V: Add Zicclsm extension support
Date: Fri,  9 Aug 2024 12:22:38 -0400
Message-ID: <20240809162240.1842373-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_092248_478287_C9881D5A 
X-CRM114-Status: UNSURE (   8.45  )
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

This set is the first two commits of
RISC-V: Detect and report speed of unaligned vector accesses [1]
rebased onto palmer/for-next.

The rational for adding Zicclsm was related to detecting unaligned
vector accesses though this reasoning is gone.

I don't see why Zicclsm shouldn't be added which is why
I'm sending this set.

[1] https://lore.kernel.org/all/20240726163719.1667923-1-jesse@rivosinc.com/

Jesse Taube (2):
  RISC-V: Add Zicclsm to cpufeature and hwprobe
  dt-bindings: riscv: Add Zicclsm ISA extension description.

 Documentation/arch/riscv/hwprobe.rst                    | 5 +++++
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h                   | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 arch/riscv/kernel/sys_hwprobe.c                         | 1 +
 6 files changed, 16 insertions(+)
---
base-commit: 2d1f51d8a4b0c3fc0b2b79d4e5b95a6813500092

-- 
2.45.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
