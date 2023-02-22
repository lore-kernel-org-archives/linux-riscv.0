Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE29C6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 10:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E+iJAhu4ns0ZdmtNlGZeSUYGnbnkh/rqNl2tIKaN9ew=; b=niMsqGec6GSU2U
	TOqsDc1jMeeX4+5/PAq1RxBO0fLqyZDoPTLfYMEgGVZaA7ra8z/0ECI2HjqKwwEWEh61cFr5+Tquw
	Vgeik86n5KOUPdLx8gdHEniKRCllsMVTXO+9mCgNoplLrIk5yS5STRva8RQlhB0BHD4NYsDiQnVk7
	4eSBFPwgwJDWY8nid6Hcp7i5OGCUMGF/+FB0v3v8SRbpTTvFHa/nocR2zUFhAgSpwUjI0V48K81Rr
	04mowhuvOHiUPODy88zPLPT5FxDcMQlZaR3hXHB93sVqYXTw7LER96ZOi4/M0Ky8Em+pX5G/aLr/L
	pxS/HQzadxY2SP+L+z2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmE5-00BrFC-At; Wed, 22 Feb 2023 10:19:53 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlZG-00BVht-Eb
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:37:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id nt5-20020a17090b248500b00237161e33f4so5772720pjb.4
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 01:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTFoYDHyDNw2PubV9IEzg7rOSljDE2ce7yhJPe+zOrE=;
        b=i+tTMlzh1EU79Pqqv2bPjoY1DWvpU3lBwHjaX+1HgszI7jIpoZnz+as19+HqI6Ssd/
         00MJ9FL2+u3dNkbe2baGzgMfTvpVqSKf/zYSdJzf8j/8voNpzJhM7GJEOevub/dqPxCS
         OS2cr1b51EMu5vf48JwuobZ9+99kl/DpgvTWytEuYDBvLjItW88YgtroWDAsNmYeBRPf
         j4ON1KBdAP1eN+J5I4ha5Szl8yoSVNufa5DLIQHLsdNb4Q3BMZK216AZJ3WLk/sF47zl
         xeKPyHL8zOYjmRFLif58eIh/ctkmIMkFP7W/SOq+WexKkBlxeXrk1p4Nwcp/jKuzv1Gu
         WSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTFoYDHyDNw2PubV9IEzg7rOSljDE2ce7yhJPe+zOrE=;
        b=Vs1Ns6MZdnulJfbBZVevdqdMxlPCIZteITdBcP2V8CHpyPCwfdecFH5sGFuJWzft13
         /MyCndVYZWosS4XJtSoX8T+b036Lj5rrB7boah1LjoDtyvlRlQfPNMIGseCEwJ1L8Mqb
         cJpRplXBIZgTuc2+iXN7jebntSDP0Gt4/oUMcJHlRsE7S3vAVwkAhY1zWkFan3zhHPAc
         lICfzuUbrRMruIWDi9AMGJ8uYCjanPqV18XMdwaZpgyv49oTPx2iSEBINl9/1xBm82Je
         kRdhsEK2++8mORfUbU1bGrcmwtsT4acSQ9PPhqvtK3zBz1dx/QvH1nMbNJPYKEmINywV
         ey2g==
X-Gm-Message-State: AO0yUKXSGyiHA//dA0Kuk65nnvjlpEQEqcG0rDMaVQiejvPmoLm+na3l
	/wnMi8uXIXlLoC9nAZnSXgYOWLY3/MA=
X-Google-Smtp-Source: AK7set/zea5eRmdKsCVVfCdtE5UNQ45wvZCr5NCgSAoah754/nDo4qVpKKDH2zCTrjRQ8peV8gD0oQ==
X-Received: by 2002:a17:902:e883:b0:19a:a810:542 with SMTP id w3-20020a170902e88300b0019aa8100542mr8932659plg.61.1677058657889;
        Wed, 22 Feb 2023 01:37:37 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902eec600b0017a032d7ae4sm2392324plb.104.2023.02.22.01.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 01:37:37 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: jan.kiszka@siemens.com,
	kbingham@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH RESEND] scripts/gdb: add lx_current support for riscv
Date: Wed, 22 Feb 2023 17:37:30 +0800
Message-Id: <20230222093730.1826523-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_013742_523136_439554A4 
X-CRM114-Status: UNSURE (   9.48  )
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

RISC-V uses the tp register to save the current task_struct address
as its current() defines. So lx_current() of riscv just returns the
dereference of the address cast via task_ptr_type.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 scripts/gdb/linux/cpus.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 15fc4626d236..6825a9834394 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -173,6 +173,9 @@ def get_current_task(cpu):
          else:
              raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
                                 "while running in userspace(EL0)")
+    elif utils.is_target_arch("riscv"):
+         current_task_addr = gdb.parse_and_eval("$tp")
+         return current_task_addr.cast(task_ptr_type).dereference()
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
