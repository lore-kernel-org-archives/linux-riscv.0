Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F98C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cv7bVGl/KwJtK4KrMHqJ3RPxGaprRe0LIVOaMxXGhBk=; b=gQ9iMEtfMlBigE/I9wg/JhwP/o
	tlNSi7DZGut3oRZ+izANK1dXP9UilLvoOzOIVH+5ZFpuxFgsMYgqab2dNvbtcjG5j74WqDhLY115+
	U8YP14sY+ake+rHlql8kzOmAq4G/vBdMVXQnuADabns7dY3JPSjm7hOnntpnoFi45j53/EbYpeB5s
	/L7bHKwgBwpye4WbC+Ct4EFrjARTQdkBXgs2nuAye4M+7NEudNu7c9Mn+guId320kiOyYtoU6Sn7q
	OjNXQ7Kkk66Iy1FRHl4Y8j1cQH5hsXHX9y0K7O8B9sPCYtEllp5a/wivnzcNc983FFLtO+XVvNHqf
	Eqfbv3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dsg-00000003PB5-0TWq;
	Fri, 10 May 2024 00:12:58 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrG-00000003O8I-3Pmw
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:54 +0000
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6202fd268c1so24668057b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299886; x=1715904686; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3uGp0w2sme3T3nV0EQqTopwZWuCKWdcvzDVr+VeYxCU=;
        b=hJ42NqJ9PHGResSTamB7d5hir2UTzru6QymdrgqYKXMRLtjvdk7RD3Up4IIYcHzw0w
         po+KrBG5B/ZHQmlvKHsej1O8V7CyWAy7KgOROrASVrTerHRv2mX0ouAv8d8ghyLdeLCW
         OSvj/9PQrpuAjZz0K31tkzrEGTeWpLZRNEQLsRsBKT980HEM6sP+9P9+8F65rDc8QYfQ
         tVHa4FVLDmqkPp/+PwYchYxgyEcEmq7C8IixHfm/bd4EMTA6/698oB96f8S+I3MJc+rt
         TYCXpwik3Q20k2xvkC9rEXl5YrOTNwJPoU7Kbo9RFySlagoZ+oPCv+MGCfYPHEEWRX3n
         6N9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299886; x=1715904686;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uGp0w2sme3T3nV0EQqTopwZWuCKWdcvzDVr+VeYxCU=;
        b=PdjmODtuXaLXt3Bf0kSmwfmOuUIBha0FVIXRQIWppd0a0lPAzTnVbmsrDWn9L8Vuam
         NedzrL015XCdmwYaLIfjPerg4UWLmSL4YWdntftH3UmfD84J7dOBnVqldsqNmGyQ9sGr
         NX91UXfcbYIPrSHJCi0LuJAC7gUdu3kTXxHbVqtjtSWTYFy/HOQaB9AQVmJgIEWi7lQG
         8c2iiRlaG0Urt+c0z4cd7g6gTohENVc9/3ZP+tUAXcXAEGbgbKksQrqLOu7PWwx9A8Uw
         us//VuIQmX37rX11k3aU4sBWnRV0jpBUZtKYtfDxUxHTmkFL2nlRffbyeZcPignnBGJI
         5ZYg==
X-Forwarded-Encrypted: i=1; AJvYcCXEvkm0lQJvJlYM1HscRoQPuhkyEVtKnBU4ceRJpk07jeCnIf9sUOGdKY+b9Zq1GF3X9QFEjqsH+Q5kOTCH+L16DwZRg8+FYnX44qMLuvv+
X-Gm-Message-State: AOJu0YzlJR8u00knHz2rlOPRx3Vb0L6AZ6O5MjAirBvLdqtldKqT48mb
	gRG1A7PcfNXaBmOfumQC8TMU9u0fYYl6BhWeKBFB6t6XS6UAyZX0GfKrvGxveeM1A4aQZc0oF1l
	OCA==
X-Google-Smtp-Source: AGHT+IHM1dFUhZApSrq8Qk43aou/1xK0czl+ZTNebJ0VcRvNcsT7MvbAdQNPHgT1F2os/qMJBLL/r7SojXM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:d0b:b0:61b:eb95:7924 with SMTP id
 00721157ae682-622aff8202fmr3114617b3.3.1715299886235; Thu, 09 May 2024
 17:11:26 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:05 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-49-edliaw@google.com>
Subject: [PATCH v4 48/66] selftests/resctrl: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171131_104223_92A1C831 
X-CRM114-Status: UNSURE (   9.10  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Acked-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/resctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 021863f86053..f408bd6bfc3d 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
+CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := resctrl_tests
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
