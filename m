Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB2C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYC8I729oWjOI+40ZsuIL1TNhVPGllVPvTtAgwlSSw8=; b=edjjpXIsVG29JF
	zxEzNudjSjucnCMSADQqZGVNLyKl6sQui3EiU/fw53K8hz1BP5hxSjZeiUmQZEbOQafi5QBU/0Opk
	NHwIQRahnj8tM0orqK/TJl8pwIr6qimOxFCdeT8k6x+3ts6S1r5LITUWo0SfcUQnGXsYTi48SzFC3
	dScGeZbJZRMIySEggEh1sLtG+F2fjW78SC1tRAlaBnbq2ErYcdQN+7qPcsiiLhykopXBQc7005FDf
	hoJ370NWH8UTuq1m/i0JyS514BKOjjG1vi4byza6E3zOrguGxmF3qms+DsewnIuYqBTNpT50+GB7u
	AOI8WJzY+mGdC8243R4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooXr-00000001Bgw-1G1F;
	Mon, 25 Mar 2024 17:55:40 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVY-000000019tN-1W9Z;
	Mon, 25 Mar 2024 17:53:18 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5a4a2d99598so2065082eaf.2;
        Mon, 25 Mar 2024 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389193; x=1711993993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
        b=RjIXWkh9YHAukmLtp0EYOuRYn/fjQ+xAOvmfSDnIsKnN5v7kUm57vuP5LlGyxTXFUx
         KN+T3sDbTz5xr0jtaGdqQjwC5vDPbMlCfpBS0lTiHWG6Weu7odRmjKziWyY8aqwQkAHe
         L4fpam498K6/hlbwyBXfLLtwkwYMeiawUE558zUo/l+k0RkXvRdf+d62hFbKulmGPCWT
         zBn1jZ4fSzrYF2F6wYCRzBh+Juh9UXNrVDrfTUf5Gzew5vZdMqdREM4BoP0CLxhHNiU6
         WnTAEzLlO7sdcp6eucHLzOy2X/kvFrhqBm6ddWKMfGQYDxQ79q6AKLTwiTD38o6DWg9n
         mANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389193; x=1711993993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ND8lqpveiFX6xmjgwVdwzXmzEkzcSSVNG8THPWMqf7Y=;
        b=X7mbjo958qWoEQHWCpuDr2MVpjNwcBGgbF0XzIwiwMrDHv+t9VFw9uHJgduX2vmWwe
         dFWUi9g1COfRAhdRdroz9vn0t80rXkY2/bpAHJIVHwHFx8MMNQ/DDw1sl4VMPCWKzyd2
         PefrnruP1HDXXukcpRi/cUz0PgDa3DxpYzf9S+H3C77VHlmeR7sosSQj0lvEfxgyLYOd
         r8uoC21qQHh5Du6+C+zfTbM25jxi+lJCY4w4UYcJWFtQm33vlYAibMb6A85Kffyfya9H
         8tGVVEmsLKmFiDXII22VDZy3NfgdBheTsdnGutz8JHezgMDCtwRyjYWQ6o4zqhfoB7bD
         M2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWoN/8gLCilF7fiCCixUk/Yhf7hFGzVAohAh2ZgOjuArNyBnS6k+gAJKWJIku2ijJEM676Q8xodf+ZlgEuOHWoCcCSEkzAeVZFrajmsaGIuS0G7lI064THlacpgScvn3p6A0oAGqzaZhChQU3zuzlsRb/qF0hI=
X-Gm-Message-State: AOJu0Yyr4AAh6DbA2FUABDArJ8LRHsjSAw9ky7mmbbF6reXqA4qaQ9G7
	1REgKp3p7a4iMf3zcoBJl2u3zrwwM13KbtTmEaLEkzoIbjHZ9tBE
X-Google-Smtp-Source: AGHT+IGv1aIgA06o9Fu8TIRgx/HOB3QdMC5g6WhXly0xhlmCYycmN3i4bcD6kTp8Utc1wDwGC1lc7A==
X-Received: by 2002:a05:6358:fac6:b0:17f:729a:8562 with SMTP id ts6-20020a056358fac600b0017f729a8562mr2827009rwb.3.1711389192937;
        Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w189-20020a6362c6000000b005e438ea2a5asm6051492pgb.53.2024.03.25.10.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:12 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 11/14] s390: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:45 -0700
Message-Id: <20240325175248.1499046-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105316_707592_EC4D3CE8 
X-CRM114-Status: GOOD (  12.39  )
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/s390/include/asm/bug.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index c500d45fb465..44d4e9f24ae0 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,6 +8,15 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
@@ -17,10 +26,12 @@
 		".section __bug_table,\"aw\"\n"			\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
