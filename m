Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB74C27C52
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=64IiJizimqtMJPcFw9PI6uc4XgzhdRa0T7kWHcpSaRI=; b=VguoA635Cj9LES
	vysbVcsymm5dRT6xOI5/yRToeYTK8gn8kc6w4ZvEfkwcY+j82MZu1efB2FSbsRBobpvXufMZYdxdI
	2wg8jXbDkJcJAA8S5WgdWEyP5aPXXHaXTF2rr4DAcCA3aKnyuExZL4VFknPAU3MRgFW4gFueWaCM7
	sKUP3AQKTIAEL05meJ5LDEpa9RcmjLDSuQYE2yZ8LJEtuI4rHuLXQKoT40XF7AgY8+oiyw1y7KSVI
	Ba2Vko/2RT0nagVtupn87wzTJhxqbKWGI2D9+4ctb3vupGGzQDUL2XAe0W5O8sqINGP8wb0psMjgD
	XpFOEZbU9lqYNF+4hFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExgy-00000007Wjs-45Rt;
	Wed, 05 Jun 2024 20:57:08 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExgu-00000007WgU-3AMh
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 20:57:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f44b42e9a6so2916935ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 13:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717621021; x=1718225821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSwHeh/cECdPEg7QzwSf8DHXKuWQgQmqUDB+TvkoQ5g=;
        b=QQZEFn0cDVAZPOHiUpQUueC6slmYfFBDqp40hvmdknWqD8gmWTFXzixapECQeIpS0l
         3DBTONl2ev5Gtspn8BTvxO4i05geTrBeh53amDKwlyJdwPOVUWoHRMYwtDeMO4CFVFDW
         FSFrdeScGIVcEzxG8L/wd11/gXvnUHvS3q0IM+xeggl2cO0kb1avKqwPQ92ncHfFPe8I
         Lb6Y5WKy/d7iNXqZwDEIRSk/4pjaRepFa9QPbCpJBBLM7r3kfHkJs5o1SAw+xr3vKWIw
         asAqmDuYq6mymwU8cMSYPg41IMCGlrogzSl22czun3dlMZGfA0DzKMhPFTXl3Ka5BNV/
         X3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717621021; x=1718225821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSwHeh/cECdPEg7QzwSf8DHXKuWQgQmqUDB+TvkoQ5g=;
        b=TRO7NrKVN55NsnIeOGhtFUBBRLrESyTMB1GHhBXOQrzGH+Yuv7Kq5EZvpZEl5AYFWb
         0WZvRcRJXplHyvqVoEBaF8vqtSrdGbAxFummyu2aL29abAv6KtBb9c4F/jni6hj3rPB/
         nfAUTt11jsDQrAnQCfTBY4CDKIrmc2kM5c7fRCPoQecbNgwoYVaGtVC0jFi0w0lwJvWW
         P3tldYNyMlk7q+EKMVZkeR4wvO8VfwpWFFDdnYwC6jmeQX36OHwyBMWHmxEu8JSESRpd
         ChFg5nKoA9VV+5DZp+oxitHick0ifoFsJZNvtSOxCnbE3UzcOun6De5BdjAYSNBZwYqa
         V48Q==
X-Gm-Message-State: AOJu0YxXjj8Zoj3zE/KyN+pDXf0Yk4ukkKUaPswileqMjxVeXDT0+RoW
	lpho3SIfOnYuA528BVKKo6r1HDpY20qf/HIEv0l4fkbGTycAVa6bsGeF0INppJK4IAllvxVLH9+
	6PnuS2esesit4xf5vs/rxE9HC2HVTVoLkU0FSatVyU8nun2qB1paVAXeRVnzkCY9w5LY9VQAAt+
	P3Yw8DNIoGr3sb8R/ims5+v0nkG+ReJL/9Ck4qo/fsnku3TLfEAeSq2sKi
X-Google-Smtp-Source: AGHT+IGePo3BDC0qz3V3MiLBGg319aXXwMiH9g1VClqu15DTduRfVwhFhsVi7a+ByKzjEQ4pwP0uKA==
X-Received: by 2002:a17:902:e811:b0:1f6:6900:5946 with SMTP id d9443c01a7336-1f6a5a7b559mr39401645ad.66.1717621020437;
        Wed, 05 Jun 2024 13:57:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd86esm107332135ad.121.2024.06.05.13.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:56:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/3] riscv: Per-thread envcfg CSR support
Date: Wed,  5 Jun 2024 13:56:44 -0700
Message-ID: <20240605205658.184399-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_135705_055928_BE4B9CBA 
X-CRM114-Status: UNSURE (   8.72  )
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

This series (or equivalent) is a prerequisite for both user-mode pointer
masking and CFI support, as those are per-thread features are controlled
by fields in the envcfg CSR. These patches are based on v1 of the
pointer masking series[1], with significant input from both Deepak and
Andrew. By sending this as a separate series, hopefully we can converge
on a single implementation of this functionality.

[1]: https://lore.kernel.org/linux-riscv/20240319215915.832127-6-samuel.holland@sifive.com/


Samuel Holland (3):
  riscv: Enable cbo.zero only when all harts support Zicboz
  riscv: Add support for per-thread envcfg CSR values
  riscv: Call riscv_user_isa_enable() only on the boot hart

 arch/riscv/include/asm/cpufeature.h |  2 +-
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/include/asm/switch_to.h  |  8 ++++++++
 arch/riscv/kernel/cpufeature.c      | 13 +++++++++----
 arch/riscv/kernel/smpboot.c         |  2 --
 arch/riscv/kernel/suspend.c         |  4 ++--
 6 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
