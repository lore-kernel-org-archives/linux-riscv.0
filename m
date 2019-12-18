Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF89C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 08:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F878227BF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 08:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YAb5GBl9";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLksOQyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F878227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yaG+oMd4gi7zP4mz5z7EHKsmoy3fZzIJMA/I7rfBMDo=; b=YAb5GBl94x1IG3
	iILZE1QIDO5VSDvcWWJuSNX8AuJDaq+D2VWoF12BACAPysaBgFL+SWNVuOKZBae9L4d/9oEp+oH4H
	idGshCWKWzzaAJb1ASOXLNk/EVvZvMHHDZzZpM3jJJoq0zpq8cNry8oreATriqYExqp+GS04ORJTD
	uhor0GYHH7AJvDac6j355Dh3R4J+8KJ6CNQeQalfShQ5HTaF99dTSFxeXz8fl+IbtY2EOuGVUOUTu
	NgolBoVesgx6bWzJx1tq5xaFa/CrmAgMx69NSF4ppboUND8TkABdjHNJLMnkmZt4xrJxMCyZwWM+D
	MpEkxe2oTzg2/R4N04yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihV05-0001my-LD; Wed, 18 Dec 2019 08:48:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihV03-0001mP-4D
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 08:48:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id z3so1330121wru.3
 for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2019 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaG+oMd4gi7zP4mz5z7EHKsmoy3fZzIJMA/I7rfBMDo=;
 b=XLksOQyij2bqKFaP3kJv3LCTxtA0gwK4VkT/nP1+JoLVzqS3ZrcHhUHe3SyROsL8yl
 Z7mZ5s4l54fd5fOYNaVm9qWA1Afh6gnJ9YpiJfS14FlGrKHnWmK1asfSZsv6hQ5ulYtG
 rRYO43iOhTfwA5Lzf15/OtV85ksLsJhXhOprZ8seP7yOj59yKNDmxIL1swQj+ilQdHVw
 HAYZ3DzGLgwf08Z9scf2gtHRQbxZMDTfKElk9Yd6iFsPEDKAA1AZRjbQdQ3hXhwLcrGy
 xUbEJjZvjPHz0+rzgDXWTkanIsXQc7RyyIpSa2REGBCGkoJQrvwryrlqzZncPGzPANFJ
 BzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaG+oMd4gi7zP4mz5z7EHKsmoy3fZzIJMA/I7rfBMDo=;
 b=XgPDUVNpI+/5CkkQlA3IABSVX0kW/B8Nfrh0eYiwLGBGUysywEXYxM1/D6oAZ8g+5M
 BU8WU0WoC1BFRkJq13ewZzRKW3B7USPA8A3TLMsgokLA88eLJIhaU5ujVzbGqgKJfhbp
 g2m7pEmDbI6lMl4uO//UMLfxxK3wbIMFwV5ysY4Z7SwssqkoqP0KtDBMY6F4fE2tsFOP
 MRYPqMd5GTs/4uU/065KsUk46pyjdUm0ZBJUEpiPJlhtojH8V3PJFOv0J5/epJfpzFZ6
 dIkHJpJ/B2WZgLGPouINmlABHdQ+/Bg1eU+4ZYmvryGkovJAcvyEf9jFSKMDZoDZ25N/
 mc7Q==
X-Gm-Message-State: APjAAAUP3FAnPljNebrJA0wO+Rg373UuuTRJqk+Cwu6c5ShuUmncPyT0
 HDzSJz7h02hhR2ohv09upss=
X-Google-Smtp-Source: APXvYqwzQr73+H1pnvdEfcVdXui7/DNx4znwqvuycyoJkS7uGWF785qxUNpJgwQ0jTQq41H6f4fD1A==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr1342304wrv.368.1576658885608; 
 Wed, 18 Dec 2019 00:48:05 -0800 (PST)
Received: from localhost.localdomain (78-63-27-146.static.zebra.lt.
 [78.63.27.146])
 by smtp.gmail.com with ESMTPSA id f207sm1885138wme.9.2019.12.18.00.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 00:48:05 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-Google-Original-From: David Abdurachmanov <david.abdurachmanov@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Kees Cook <keescook@chromium.org>, Anup Patel <Anup.Patel@wdc.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Bin Meng <bmeng.cn@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: reject invalid syscalls below -1
Date: Wed, 18 Dec 2019 10:47:56 +0200
Message-Id: <20191218084757.904971-1-david.abdurachmanov@sifive.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_004807_165702_4FF6CC7C 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Cc: david.abdurachmanov@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Running "stress-ng --enosys 4 -t 20 -v" showed a large number of kernel oops
with "Unable to handle kernel paging request at virtual address" message. This
happens when enosys stressor starts testing random non-valid syscalls.

I forgot to redirect any syscall below -1 to sys_ni_syscall.

With the patch kernel oops messages are gone while running stress-ng enosys
stressor.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
Fixes: 5340627e3fe0 ("riscv: add support for SECCOMP and SECCOMP_FILTER")
---
 arch/riscv/kernel/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index a1349ca64669..e163b7b64c86 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -246,6 +246,7 @@ check_syscall_nr:
 	 */
 	li t1, -1
 	beq a7, t1, ret_from_syscall_rejected
+	blt a7, t1, 1f
 	/* Call syscall */
 	la s0, sys_call_table
 	slli t0, a7, RISCV_LGPTR
-- 
2.24.1


