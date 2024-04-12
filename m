Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BD5C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M27zrXSjVdG2Ecn9QERBg/EnQxGvY/eqH1MUXD2s8hY=; b=vCKMUEPekmMLj8
	BlM+XQFNZiqIY3bsSVc+qioXJjhiyRsf8Dfn5aoTMe3LiwuXaNZqlfaqU2rdSbZByxJ6l1XrYmn+J
	EgIGik5pLkjWDGslbGsONwHEW833W3wa3fN7mvNKWQ2yU3TK15PqFNdXk4cJwEwapY7dC2rM44J7p
	7uBSH9SGXeOYmbd1XW63Wpko/l6+fMAWIMnS+rukjGUDLhjbDuegPht1OZK16ryQZxJ6VkMHZy6kU
	UWJNcsppdAqiDljUnBCOpRoorqRponxVj8qY9jqIILG9xUYJCakp7qg/YoZ1e3YwYCFRLqPohXZUi
	ErwWsE4m+C0+3cah5ubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBst-0000000FyMu-0dqC;
	Fri, 12 Apr 2024 08:03:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAj9-0000000FdXn-1yLP
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e4f341330fso6018625ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904572; x=1713509372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0+TwQ5GqFH8aHlUKPdqP3mrZz0YybL9qzmJdYvs5ws=;
        b=cUUDqURwbgdlrrSIZa8blhsvwTWyZgrserAZe/xYF8kwBYo6k14Tt5k7LLShBRG2wd
         rKt2C1wngucHXRHJeCYBZxBCHi/l3KbMxxA+YQy1C5XmjTsJL3VYx35C2DAXu+NiOMMh
         l9L3n4Ko3j/m1skV5Tmc3xBaxdKePWa5JvfO1WwY4sR0NPweWo8rhKOeUINCuUTPJ8+S
         Go/rbBaVsm5zjXX3V2rA2HJyST4hryF/grVQ3l0m7SoFn8pXtKyZD4O7HrrwT6HPaaFz
         VdirPfA0D6XErsWK2D9sUGJ0ONngUaWNsxHDdPp4KOODSYLHmG3/iPKrcsqVwVQL8D55
         rhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904572; x=1713509372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0+TwQ5GqFH8aHlUKPdqP3mrZz0YybL9qzmJdYvs5ws=;
        b=oMtPpODyLT5KJ2GEXPsKeNmreEkHbNgrYi8Tz1VdEL2a8BT7rxiolFs2tYay0Dh1Am
         TmtCDJ4GP7dcFo7vETOYTnR9l8nyT5LZ1HmDVNi3nSu8UMSSLqO6gacK9Mx+L/OJ39wD
         q+uTYiQ8WpPiFmYY7WuuKKjgrfwk/1RzvP6zjDgSJJUe+RdqJSdlLfY1bT7xWF1TMzWc
         /kZkCsRRWGY8/WjJiR0QDoxiUJlu9qbEwempnv6p4e+6MeWkFRcznExsD+ZDUPQ+tuv8
         pGnOw85ULjfV4brywHhx0zVtVcok68qmGfoTdCtt+QnKnPcJLWIuoQl9chT4elNe31N9
         3Adw==
X-Gm-Message-State: AOJu0YyNh09D3SwW/TxmAGF8rvWvYgqbbVpSdTRpUFwvLcgpAaYQVEnv
	BCUrozMOrcSDrlGWfB2JXTqfnsLn8IvQS8JzBTAt8OqxWOHnMntBkKfaafgYFvQ=
X-Google-Smtp-Source: AGHT+IEyMJ5oVk6CfLCQcJcfX/ZIjOVHG1NEnrkJlbePak6mm9DdqGhN0zRdg6Q82lhK4umpLFADiw==
X-Received: by 2002:a17:902:ce92:b0:1e2:4c85:82ea with SMTP id f18-20020a170902ce9200b001e24c8582eamr2036574plg.24.1712904571996;
        Thu, 11 Apr 2024 23:49:31 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:31 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:49:04 +0800
Subject: [PATCH v4 8/9] hwprobe: fix integer promotion in RISCV_HWPROBE_EXT
 macro
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-8-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234935_707026_1DE5F561 
X-CRM114-Status: GOOD (  10.97  )
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

(1 << 31) is a signed negative integer, and it was sign-extended when
being or'ed into the "missing" variable. This casues hwprobe not
reflecing extensions named after RISCV_HWPROBE_EXT_ZVFHMIN. Fix it by
defining it as a unsigend long long.

Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v4:
 - new patch since v4
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b9a0876e969f..dfa7bdbcce92 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -54,7 +54,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
 #define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
 #define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
-#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 31)
+#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
 #define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
