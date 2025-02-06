Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D9DC02199
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rljnntRXxcBRnkMAcidVUa6i3diqLCt9osZ7eruRdpI=; b=BcOsowd9rkAACq
	PI2AzCWwxFO2ag8aYC9HSeOkmmsT3e3U9FS8SzyaADgRv1r/LkJoBPVI/8y2UgINTm2e7AHEK3V9d
	NGrhwAs2Avn/TZHTRkfzIBn3r/m5mAgwRpTpR0AM12wyrUTwrr2tVNXYyq6+Py4H1Kzq4MenIoLMZ
	GvPulPRJz5MkoXIaYLqHOL2vei9FFPWv+xa3Dfa5RHB5JCcF7UBLMGE9rIlo1zor7yO3N/fwHnBQQ
	cEx5oSb7+LWeoKTgzjZBe+FQLdO/o//L4LrHa/MHYdSC7c3t5neiewfsQiGZvLNTo5bfHb6PgSu39
	ed/B8HmQAdlXJG3yEd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1rc-00000006Pg7-2qJD;
	Thu, 06 Feb 2025 13:24:16 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nj-00000006Oa7-35Fr
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2166f1e589cso21450715ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848015; x=1739452815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqkbJ8TV5TbCZyR0Ouzf3HmJ2PyLDsRK/LA88RD7yqE=;
        b=UwFRTswEU1N5a0OL8eyLIRgHkLetD0rLTvcrGBsG2Q3/paWiwacMMwxA9mFcdeeHXX
         0wP/qZ6FzXvLYlybHIocCpD0ZB+j/UqL0NCOGaPCrOwnJC+UxBWFhAuwQd/cn1S+FqbF
         xHer69QMCnOiQWRU6T3GBIbnSxEl2sJYQ8gSD5GDSEqOYFryv0megYRlGjuoQ93YKZ+Q
         eSSn88+kL+XIPb2t/TNXOg5HX9jBiPKk5aD4CRLCiOq9/FKSpcBdjhAB5nCpHTbUJgvH
         UEqaBI+kY927AcZMyld9N5Vzw4+R88LLumd+Cyu1bCsAuUYsog+61xvJfOtlyVFUQoJh
         OtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848015; x=1739452815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqkbJ8TV5TbCZyR0Ouzf3HmJ2PyLDsRK/LA88RD7yqE=;
        b=UEwbVRbyEPD7zFbV664O2k32ic3M7pWmLq93OoDGj69rRafS621E9WaEvuA8eou6nq
         DmjSlOWruLXhmqVWvKwphYDfCVQFEWcQctt4IC6+3JGARsnBkIk+MB1AikR+7KBABimR
         HpPkRY2mNAnsL0A/zVK22OJysaGFtQ8KQyn4jDd1+yM/SvMH2ZBbNylN7/qCMmjSUy2B
         T+ZzSgUJ1l7xTkLp3mAbnFloMztqHYJx5akoI8n7w1YixU9AC+s8h9o5XxQK9R0ZY4c1
         L3W/B4cCVIhtZMCAhdrZhYPQLV8RMoIfJ/K/+rUYi8jWxzUxhg5q2ZM5WdBbyyXG3mt/
         vtWw==
X-Gm-Message-State: AOJu0YyuxDtZoILmbImk8WAQ8GFeM5EolmaxZJW4Z8K2vh94Bl7F47z5
	Ii8q0ykfx0DwpzocjFeNQFF4NvWU6HbaxbsZqUAZcsSytAMRHKgE0TiEs2EpEdU=
X-Gm-Gg: ASbGncsuOB0uKftHUTamYv3oLYEcsOZ5/vFXmzbeQzEQssgoGit3p1ofrlyLAcROSef
	ZZBGpli3NXWGq7llrfOqudh9hcEHzt4jMHG7iDQ6epqI2Ts6C7gI0+SDndJc+z7FhfObPwWKtYh
	BreM0+vLTCXS2/0qkC9kUIf9O5hHx6NmbOWUyXddVsQGKWbmFrSZyi9JBga7Iab+4PgGfU1MHoz
	2xO9UGUYJbou4HioNjQMJSaAOcGbCQ4vo5bvmmn73T5OPnBFooxql+uUF/7ynuvT2zhmbQN5Akv
	+M64mm0YexYbVneLhw==
X-Google-Smtp-Source: AGHT+IG5GFPXn73eqa/ah28qsPEtdkabbkJ77MRXgD8idntcYPl7k6bk4bqy9R9tarIhqzZRJyuChA==
X-Received: by 2002:a17:902:db08:b0:21a:87d1:168a with SMTP id d9443c01a7336-21f17efedc1mr127014865ad.41.1738848014663;
        Thu, 06 Feb 2025 05:20:14 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:14 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 3/5] riscv: add fix map index for GHES IRQ
Date: Thu,  6 Feb 2025 21:19:24 +0800
Message-Id: <20250206131926.91289-4-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052015_776859_F64546E6 
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

From: Rui Qi <qirui.001@bytedance.com>

GHES error handling requires fixmap entries for IRQ notifications.
Add fixmap index for it.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/fixmap.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..bca75c0e66a1 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -36,6 +36,9 @@ enum fixed_addresses {
 	FIX_P4D,
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
+#ifdef CONFIG_ACPI_APEI_GHES
+	FIX_APEI_GHES_IRQ,
+#endif
 	FIX_EARLYCON_MEM_BASE,
 
 	__end_of_permanent_fixed_addresses,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
