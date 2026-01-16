Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A37FD4A5E4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 02:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGwHPJGTpHO2aCGG6uSQkc51SiAqAHj9GBQuLVO4Q6I=; b=aU+NHIsb6PhSZ9
	dTE5zhq3Zrtf7JotjVntAEFYksssDmmaplKGFtYQhGZxvvaLOI3PUekwQ4Fp954QQ0ag67fioCUnR
	6c2f2oi5oex8yR/36WDUnvGMq5Yw8NXOqAWWv5YlTVx89tehr78ldRnEUrA7GBG3NjfWKQ0kXhrCO
	ERRxhP0tuoFSIfbZ3dYg/Q556ZmxpQQPoYwiwmyyOocuKWn8UeG846jyvAuWKSbr7OBXcPMZEuHi9
	MV7hIzSQ8nSEWRqlYNaM+qo2kgL7FEK74tN6iTXZGmKZcycLLUSZvz0xkeyOlJB4Zx2GSWoZoNttJ
	TCI9eReQpGFeCeIIdEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIt-0000000DRvb-3uOS;
	Fri, 16 Jan 2026 02:11:11 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIq-0000000DRuZ-3NjK
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 02:11:10 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-350fe1f8ea3so699657a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 18:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768529468; x=1769134268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwFSLskB5z1f9GmQNZjd3nH+m9L8SGHLoRABIaKF0a8=;
        b=UrrQ/NLsH/aqICicV+jWlJP8kzCzc3b/cNFy6pJD5TS5W4+rLuJLKyF/fGPhexicJ6
         8uP3fLAlKBCVo+X2ieoS8akY07BeyJhX5obcQc5ymODt+Y6cqYwIyO8TeB0h+On+oNhd
         vng9nnMlDmBzIYsIVxfLNi/h9EcGbvnyRF3hdjN7Ry5ZPHeKGUIhL67SCq5YvHz5CLDK
         f3NrVl7XKEJSpMYsRsinE0xU0zB4PJeHsyFcWs3UA6gkLt0zOK+VtX9uVAG0XX5NaJ7x
         +rI0ku1wrIvoyu1gK+g74hNltZeGCnF1R5H+Ta20B9ETzws6x9pp161Exn5AC7BIfwe/
         cQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768529468; x=1769134268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pwFSLskB5z1f9GmQNZjd3nH+m9L8SGHLoRABIaKF0a8=;
        b=c+cQEZMiRGqHjqbuJ+6kJGA+hm6LFFWnoGlMNM7fnhVwxu8v3DQTYIhwx+6oYpmNrT
         6M+W/jXzBWuL9N40X5DnPCJ4g2BIAjqW+/6tBggUESUCQo3VFzLQue3m9W7TR7CLAdjP
         DDxY3PISZAEpJyZyloyoMx2LTzte4IoRDqSSugQmlWw8rrWqyqjMdaudQwqOWB238waH
         XcRQyFlP5OsDGdgIkPviiWNiRM6KzvierT5UMuyqqJ3wQdXB17X3s7CFeEEYYR93vFbU
         mefwWQL2qqhcf7py7nnOJ4j819uprh+vOJXIOE9vTSuJ/W6a0uShT1oV5dSAqLKbmrPp
         G9EA==
X-Forwarded-Encrypted: i=1; AJvYcCUyCVCo2PrhDf+48VZWVXoJbJf3TVigFzx+dZc9u4VySgJopf8IPaLCjuLaVpKPlmLR+OI9sFC+ZCcS7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfjuW9SHTvzdD/svDf2R7TB+0rj0EDolVVBTrhaGsMDFdRHUh6
	w1UkSImAUSNBh/Df6bjdPkYGYk4LwaYO/Z6Sirb1Uvmji3rOWS/rfLU6ZMsFYVlfGeo=
X-Gm-Gg: AY/fxX63X+JWAMlzZNY1ZOjhcOiH9V7TxJAc3rl+qol8EkLKUzDPqjTgSc/P6Z1R76Q
	W5+dqldMGszDLmrCqHS7jldOrYMjbhd9QF0l+Z3+e5kokROsnEi4D1cfohdnejqw5HdWDDt0w8f
	ORumcagGpohHydnEGmSU+BzqNjSQsYQrqdjbAsb/Oo2XKYZ38Thfk2p6XaQ70XThrw9rEDoDPBC
	yus/qPpGP9J4AgqpGpbhrqoVtOeDyj3XNtc1q7bET/kjXfFKU51b2qJKq35fa9+vh+O5GHNQXYL
	CYXAilcx1nMdCocPdU2Ag8UxOorR7sPBFcE+U4Kk1GzwtRCIlEsHI9KRpHDS/KQ/YkJz4L7cMVU
	SpSGOt5Jfqp56tJOvuxzsMXniX1Jz2E8OqKesNHmC0njbAS+Lp6RtGZgtUlEsG1FSR/r74dbl8X
	iE3229W907NcpEHHBBdqYJS/M+xDvKSUgDbrTxP5FVwwU3klqCfj0ezg==
X-Received: by 2002:a17:90b:3d92:b0:34a:b4a2:f0bf with SMTP id 98e67ed59e1d1-35272f1a894mr1404668a91.16.1768529467866;
        Thu, 15 Jan 2026 18:11:07 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273298968sm364317a91.0.2026.01.15.18.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:11:07 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 16 Jan 2026 10:10:33 +0800
Subject: [PATCH 3/3] riscv: cpufeature: Clarify ISA spec version for
 canonical order
MIME-Version: 1.0
Message-Id: <20260116-supm-ext-id-v1-3-5fcf778ba4a6@riscstar.com>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
In-Reply-To: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_181108_857870_6AB998D6 
X-CRM114-Status: GOOD (  11.49  )
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

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Link: https://riscv.org/specifications/ratified/ [1]
Fixes: 8135ade32c0db ("RISC-V: shunt isa_ext_arr to cpufeature.c")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/kernel/cpufeature.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 39680280f858..629984df1e7b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -461,7 +461,8 @@ static const unsigned int riscv_supm_exts[] = {
 
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
- * chapter 27 of the unprivileged specification.
+ * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+ * (Document Version 20191213).
  *
  * Ordinarily, for in-kernel data structures, this order is unimportant but
  * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
