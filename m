Return-Path: <SRS0=BeQS=5Q=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CF1C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2020 15:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF4220781
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2020 15:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="er5B7X3m";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gV/o0CDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF4220781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=er5B7X3mpKwivD
	vW8Xk80jVi7iDfUzsJ66Iri2fR9u5RqLO6Bm1tAC6B1cWYWXjmFd8FYSsMkTo+zOEUtKvtUgDI8y4
	qJpDG0T8/tfAHxrX2rIhg+sCXGzes1/GBSjUPGhwoqWU2IAaS9vToXqkCXklXkMehG6zfnMWLpOs7
	9wha+qHAr+ECuaQU99AiOFWJvkPPFBHzGXKibD3tOeHcyOL7u4mi0iBGl5Qt1nQtZ/Qzp+Uwo2IdY
	qOKGUhnV1me6xrg8A+OEHsxB3KC3KM1JYn+SNSQklOAmnMpr67P4ffT3Na0+KXxADy87e/V+wCjiv
	c05nXLGpxmvVNH/ahKDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJ8B-0006oC-OF; Tue, 31 Mar 2020 15:48:47 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJ89-0006n0-Bo
 for linux-riscv@lists.infradead.org; Tue, 31 Mar 2020 15:48:46 +0000
Received: by mail-oi1-x244.google.com with SMTP id m14so19368420oic.0
 for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2020 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=gV/o0CDRlWRC5hqOTTAwBJXyxpg7vFKl7HdX4ht9K/R9ZfhMV2uVKzoEFX1Jyg1TEf
 9Ymob3UBmIDpJRcb9CtZ+zdHejt0KkANEtXEZGsacx+gRoJNqHoA8JoqvC4MHX3/o21O
 v/fWRwFFgBgkyp0Mm/LnWY1h/U1u0ojXzXbK2SChw0azbD2iPlHkCYeE0hrsfriU8q//
 +WxMY1/wMpHcinT2sDGerb6xNT8VYt50EXB+vCbl2hUSWLp8rhN14V2HR0NDzuJ5CdAk
 IhYXrBcqVrIyUkXFw7MXieNikdWfeQkBIkZ+hmu6LlzeqNLp4E2+4OJaLJnT81DJ4X+k
 0V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=O1NbtKrWQ64gQThdUh1+mSXqkXCK2T/TmRPSpHL6WVN7kgBBapODjhJ/RkjI2jJkwF
 ZVaZH90o9x1ibHQR5JHO5GrXADCHtNJWkVVbkkRHrpKN8oWlvaWuh37yqnkxxn7rPTIo
 yMUUYFjkAZlWj9AeqJ7EptBKvrSuEawE58b9ftuIyltOKWR4+Uo2H2IWniFq+z/qkYgW
 /bCmf2DV8gEC9+uPV8NK/TB+fdOwp17Ylg/vf6XlwvZqbysu2ziZgHu5LINERRSK8Bgq
 tRi6uIAJ/ZK9tw6xTVL5Th9diEbJ0zgnjVSfeaW9of+W0kcj1wBWzuOeEdNK4nliXYma
 G5Dg==
X-Gm-Message-State: ANhLgQ0Nxr1aJR/DC5qnLL1vk/5C/D15g5Z9+Hlim9PRUmTLbtK8HBVp
 M2hneVJvQkWBsmm9xvwHYwxAOyIzhEQ=
X-Google-Smtp-Source: APiQypIQPs0Ep2t3Ki3oPn5ufXwqeZTGDd3c8oxshzo+/6JD4Dhrvcf3WmDV+p6XbwFCCZmYIx0EVg==
X-Received: by 2002:a17:90b:110f:: with SMTP id
 gi15mr4581906pjb.184.1585668211402; 
 Tue, 31 Mar 2020 08:23:31 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:30 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Subject: [PATCH v2 1/5] kgdb: Add kgdb_has_hit_break function
Date: Tue, 31 Mar 2020 23:23:07 +0800
Message-Id: <1585668191-16287-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_084845_401974_31AD0036 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The break instruction in RISC-V does not have an immediate value field, so
the kernel cannot identify the purpose of each trap exception through the
opcode. This makes the existing identification schemes in other
architecture unsuitable for the RISC-V kernel. To solve this problem, this
patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
the KGDB trap exception.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..01bc3eea3d4d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
 	return 0;
 }
 
+int kgdb_has_hit_break(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state == BP_ACTIVE &&
+		    kgdb_break[i].bpt_addr == addr)
+			return 1;
+	}
+	return 0;
+}
+
 int dbg_remove_all_break(void)
 {
 	int error;
-- 
2.7.4


