Return-Path: <SRS0=mShH=OF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0F2C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Nov 2018 06:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B75E20672
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Nov 2018 06:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIeMk4qW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="gR1x7zwO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B75E20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=30Og2+wW0oYQpN92QR+wdTJ72LYOei+LQC45QVoKY0I=; b=RIe
	Mk4qWHa5uPTY3F6v7RZ6G6gsXcYr3Adl5CSIbeLdenEoKaWYQy+dM607AkdEE1foPtN/ObRcIhoaU
	FH3TweaAPhbymQ3XJlNcDJYB/R2YfO/jGfflCXRSvrUom5C5SKnZM7iaa3bvjQGaZt/teLEJyD8/U
	oXIU6lX1rkFC6NiVCFNSK/QfJFy8MzI4geSTl8EU8BwYX2SXexNAU78FtlUJSw2XY48CCNqqgVEuS
	/GWnKCPpbVf7DAHDFILIAKzdAsY8C+LhXA6xoEYc/8lxxyH412XrXmer21sSDi+plWdjQGGD8m1dP
	gzF0AipSuz9grSWf7QWEwlxVWHn30tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRA8M-00035p-Kg; Mon, 26 Nov 2018 06:12:38 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRA8J-000355-DK
 for linux-riscv@lists.infradead.org; Mon, 26 Nov 2018 06:12:37 +0000
Received: by mail-pl1-x642.google.com with SMTP id a14so13329061plm.12
 for <linux-riscv@lists.infradead.org>; Sun, 25 Nov 2018 22:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=ycwWr1lGERMQyqh6jY/uTIb5bXXqYhTnWn45u5xzpto=;
 b=gR1x7zwOUka48kMUoO0lfnRmyUbvphK9tetPQ+uxr7ajAcn46xrYZoHIR4gP7mau3x
 Aux78GvhwmG30DMxiRiRvvuk+HZVOKv+wv5Srw5YRtUawFBv1HhuQrrGHTynaw2Zy2rU
 x+oNnn3rZaOJwoG/EF3ZuF0ehUH7m3f4cwscrcMP8QU9MDOaoM4Qt5czmsNiqewLd2+k
 7Gmm9COTzsMkgO4BMcuJsTDR6GtdnMixIsUSZTmLQRUKPqlnvzAgh39Zzt9lIqlfVo3l
 7vAT/yQGk8F0ZOrDz2QYH2VdMt13VqjzZnXa/ySwYxxgGzQsiRvdc57H3USsmnL3Z4BE
 1coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ycwWr1lGERMQyqh6jY/uTIb5bXXqYhTnWn45u5xzpto=;
 b=ECf3lO81aiB2LbyogQvz/KGTN9M06l8D7VpxQChA+XNx8TDAnDC2dqu+cUgXnGz9f2
 Czy2oELG+2UYVqSkZ2Q9ypXc1PMZAmKf7M0YjcZI0nATNv6XE4csk9Vv5R9B3KyRo15f
 +95CxLfm05BFTnFC8+Xr+GYMvEfYhGEbNNAQJVmvN3xdqrBWskgOkYK+CrKTlYVWaKkl
 f+VD6bIk9NlBT3FdcPsM1UlLaxWJ9yN6TFLRrUqnUSvhb++PpEA8bh+GA8wD1iOcSEGy
 L8BUjtqyzRS/vJA044KtIUJ0587QQGpfbUbd8jMVXVALer/6G4UCd9EkXysPgtuRkI66
 l3+A==
X-Gm-Message-State: AA+aEWYWz0GBb7AQ8Smifbao2/fqtwamIJV99EgkDjsRWPtJdPI1prrV
 eugiS9Q6LZuI9DttFumFYZD8dQ==
X-Google-Smtp-Source: AFSGD/UVVBaYMKKGo9A0o/8nMAV0AgvBTa0FHw8QvJ0KRI6uOLgmmdwg6Gd6exJfFoV2unR+fcX3rw==
X-Received: by 2002:a17:902:b60a:: with SMTP id
 b10mr24826817pls.303.1543212743665; 
 Sun, 25 Nov 2018 22:12:23 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([106.51.18.229])
 by smtp.googlemail.com with ESMTPSA id y6sm5966790pfd.104.2018.11.25.22.12.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Nov 2018 22:12:22 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] RISC-V: Make BSS section as the last section in vmlinux.lds.S
Date: Mon, 26 Nov 2018 11:38:02 +0530
Message-Id: <20181126060802.19314-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181125_221235_451595_03B93957 
X-CRM114-Status: GOOD (  10.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181126060802.Kg105WZWyZw4x0_VpLf5rgX15D-KEKBbS3-UzbFEuk8@z>

The objcopy only emits loadable sections when creating flat kernel
Image. To have minimal possible size of flat kernel Image, we should
have all non-loadable sections after loadable sections.

Currently, execption table section (loadable section) is after BSS
section (non-loadable section) in the RISC-V vmlinux.lds.S. This
is not optimal for having minimal flat kernel Image size hence this
patch makes BSS section as the last section in RISC-V vmlinux.lds.S.

In addition, we make BSS section aligned to 16byte instead of PAGE
aligned which further reduces flat kernel Image size by few KBs.

The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
7991740 bytes with this patch applied using GCC 8.2.0. In summary,
this patch reduces Linux-4.20-rc4 flat kernel Image size by 809 KB.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 65df1dfdc303..cc99eed44931 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -74,8 +74,6 @@ SECTIONS
 		*(.sbss*)
 	}
 
-	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
-
 	EXCEPTION_TABLE(0x10)
 	NOTES
 
@@ -83,6 +81,8 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
+	BSS_SECTION(0x10, 0x10, 0x10)
+
 	_end = .;
 
 	STABS_DEBUG
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
