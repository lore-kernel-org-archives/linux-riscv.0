Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62679C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFeGAo3uFJgRCAYhwZIC5lhJ3AuQxflEQDjEueqkrfk=; b=25L+yOBkwuVdXz
	ZflPeHQgMAKWOVxOstXJjTsX3NdliBBOgbUC49zRtacJCglm7bOthjiD7WgTuZGXXgU82OSffBaA4
	HyH+kCi/176SrnJSR2H8wn++1kMw3EmG8CHLXS9YEXhd/ldCG6DqgujhQrxJHE02Qb3FGsFaC7bjs
	C9JF74Xlq0HVzLwkzC+91FN9yunIQuiXaR9Y9jjohB6koPQo1H85hvchQYjngnMAdV5gKE1seLNDy
	3R8SuqtJpajxrNN3EmZCIr0CA7RaKkuq365Nuu+YW5DRqHT+59GGu2+pbrAcjouyxOOnVGmsKNZZT
	gWG5pJ75ObGSHHSGn1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhn4x-0000000H16I-2n1f;
	Wed, 06 Mar 2024 08:56:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhn4t-0000000H13m-33pH
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 08:56:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e6082eab17so3118349b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 00:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709715403; x=1710320203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRr7LxSbEFR3x5uzGtBz3X+EqjDvEmVPS57p5cg+Ap0=;
        b=FdsdE2V93mwENFmfuV08gQWnGff5Q6QnIYSlnCFJDVPXSgDyV9701oAIuwtot1ysu+
         SHQGoKczPzM5C2UATmyskjzu2yYYPBzL1jvQQdhHgF53TlZo4rdh13jOMq+qdIVkuaMC
         Zyh45rSYBDhs78kyiMUefuTBwg07yYAly34Qk7FTdy0dadx5m+dPpYx4COuTCF+9xQAg
         u3VO9tsWN5SgYILEIRFgtOQ5fz0GvI9D3AUGkm+/wFIVrCetjNNtFFEXenipex/Vt7Fl
         a88dq1WXPult/bDp14ib5FyoL9SLZJpXKyBtyX5qCLoCSys070VOKb/Eficx197Lh0CL
         SBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709715403; x=1710320203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRr7LxSbEFR3x5uzGtBz3X+EqjDvEmVPS57p5cg+Ap0=;
        b=LNtSDWfcS2vP6/A/wbY0ksRjv/g8+c/TR7S9MRCK4kzRtpd4szvJdp2xGEiiZLxJSd
         lG0BseLsKMTUCxchQZe6ajL+XeKj2hDdBaNb08/StjjFUXsCh+SzY4AyXU3dgNLucQC5
         lfU4DPa9n59t8GUeK3jYBtnvTOOehnWB5YvhbUrU/leER9Q3P5nicEm8nolYGbnhwbA3
         M2r1nE2+aHPSM9C9/hxMAOYXwhzE93imfsQnQ6mFOx1UcJu0wBRL9SY2XiUFcB/RbE+U
         fRXlWeewmHp3CnT2aS2FVdvlS1Gc2xgzlfecAyLdK3Y+Gzs/Nwy31644W+9EiF4FZFKl
         uHog==
X-Forwarded-Encrypted: i=1; AJvYcCX/1qRoMBBrwACq4uG0IV7DlKlMd9FzOd0mjL99GmDRQOtThcXiX3VLuw5oj49lgdhUHRzwq8b4dJpASSwzWhT8exsDDgFymezdVvPeKkVn
X-Gm-Message-State: AOJu0Yz51WMLaVYlhd76mQeAPVIX3ZlnQaXZO37NkuZzZlne6qfu0VTR
	thm2QlHVifdBMETRhEfkI3Gua1fdYWSD2QzNnLxIA3TCh3W5a3zFxZv49vfzT2E=
X-Google-Smtp-Source: AGHT+IEzhVmTzXyIgnGWoxvhwL9j1MSvK9SInEe+8cuDZjgq6TdrkmluNqbtPfM9F2D3l0tBwG18Eg==
X-Received: by 2002:a05:6a00:2354:b0:6e5:80a4:2ff2 with SMTP id j20-20020a056a00235400b006e580a42ff2mr15831466pfj.30.1709715402744;
        Wed, 06 Mar 2024 00:56:42 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id o74-20020a62cd4d000000b006e58663dd0asm10740071pfg.110.2024.03.06.00.56.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 Mar 2024 00:56:42 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	cuiyunhui@bytedance.com,
	xuzhipeng.1973@bytedance.com,
	alexghiti@rivosinc.com,
	samitolvanen@google.com,
	bp@alien8.de,
	xiao.w.wang@intel.com,
	jan.kiszka@siemens.com,
	kirill.shutemov@linux.intel.com,
	nathan@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH 2/3] Revert "riscv/efistub: Tighten ELF relocation check"
Date: Wed,  6 Mar 2024 16:56:21 +0800
Message-Id: <20240306085622.87248-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240306085622.87248-1-cuiyunhui@bytedance.com>
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_005643_787456_77CF5D76 
X-CRM114-Status: UNSURE (   7.55  )
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

This reverts commit d2baf8cc82c17459fca019a12348efcf86bfec29.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/firmware/efi/libstub/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 475f37796779..a223bd10564b 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -143,7 +143,7 @@ STUBCOPY_RELOC-$(CONFIG_ARM64)	:= R_AARCH64_ABS
 # exist.
 STUBCOPY_FLAGS-$(CONFIG_RISCV)	+= --prefix-alloc-sections=.init \
 				   --prefix-symbols=__efistub_
-STUBCOPY_RELOC-$(CONFIG_RISCV)	:= -E R_RISCV_HI20\|R_RISCV_$(BITS)\|R_RISCV_RELAX
+STUBCOPY_RELOC-$(CONFIG_RISCV)	:= R_RISCV_HI20
 
 # For LoongArch, keep all the symbols in .init section and make sure that no
 # absolute symbols references exist.
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
