Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35A5C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:27:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC5020868
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fjso/Em+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNrNrhHx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC5020868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqNSnVWhuGTdIAi1gzLkfV86PRd4drZtvh7CAy6T1wE=; b=Fjso/Em+/Rqfa3
	ejg7/AbdWV9p4pGVWDcyUICR/BgV4yyEMFY1++MPUo3LOLBC9iNnQcUcXvTKqeNhF0JCuFJN+Hsz0
	tIlcO0J1s+9cdoH6O+D834shi85ZJ76YreQE/3UkGXSYf2nupZQ40aEh/2mgepWDvpvXlF29MXa1O
	K1EPDYv1YXcRKJDwUQp/almD3yp9+vlA6NTbeVVT01b5PhAHJ4xyDgy/TlIKeXU73/0lSzJU+n74F
	s9JarLTzDkjFdHR+ae838sQq/vUsMYUwdjwI6SmfYwv/U2Dyn1kMnt1JIyRZYrC7LWo9KQr32TMEo
	tPxXYNgWzGTbL1xT9n4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvYi-00048v-2k; Thu, 06 Dec 2018 15:27:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvYL-0003Qy-Ef
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 15:27:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id l9so840212wrt.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 07:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtX6dNPPTmO8fgeltf7XOI+iRx6USDoJtU287CCOJhI=;
 b=oNrNrhHxGhfH9PPwGeGPFhvnXEPcGTvsNLabCdnZMQY7RIez+Fux02hwuIKFAHu/8F
 grEj9k2U45sU78PPWbEgXkYh5Fn4/2oVnZJ6WAA4lStjJenzIdXb1IxdgwUMYEOI2G4S
 tU8xMR1NP6oV3uHANQUNN47qhzY5MXHdcJx4L8NOhRsp35NJaVGHAaXv2/Yd7KHE/2WM
 mSwPNyHw9ZHUbpCyDDCH+30Ihr8wfUL0JQbd2L+xFWTd8JpoNpthkp6sEXLnqFPQPBT1
 n9P/qVnO776PGUeiBjnM+avH2OuhAS+74LxgIyI8T2FEWHZxrM0xBg0WTNmGhcBfjvf0
 tejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtX6dNPPTmO8fgeltf7XOI+iRx6USDoJtU287CCOJhI=;
 b=rXuJVIGvGFUAw3WsXAU1/xkWZp+dxJ1AGgUaf+yw4iadhZ+fUPMoew5Ms3ndpoNFBi
 ydlkumgoHpzp7veLhOAyyjPYtniG3IfCW0Z5ShkWP91cVb9koigmDBdeMvHoWk2Ii+9c
 TY3XLA3dEtEZ8wT1LE6jFPgLpjizNDv7CNS1uZwi/4s3O/5YY/Rl331BVVo2xLwDzOzq
 geSwkf3Mu1eYzza5/RJx/31FOteDDnI9lGkeq6U9ylV6sZ/EPkcZC035bUYOpP1HfHbg
 K11xr/1GJq/RbvCBUspKjtsOFkzypdvMF81KN9raUaIonn7lqPd45LYhT9L2VrVSxqv1
 wL/A==
X-Gm-Message-State: AA+aEWZeMSqdokogVFzBsot1Pp1ecP0AZrsTydeTaTk0EQ2Sz8q8OCaT
 J7AtS6bYDCPH3A6n7Dcjdy4=
X-Google-Smtp-Source: AFSGD/VGIjpNPa1GOgXmds0Fyod3SWV+qytPU4wWzW2BLRRbEbsBLdCeZNNHq4k6/XrgeVAOSlKhYw==
X-Received: by 2002:adf:c505:: with SMTP id q5mr25237434wrf.84.1544110009804; 
 Thu, 06 Dec 2018 07:26:49 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id w6sm529728wme.46.2018.12.06.07.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:26:49 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig
Date: Thu,  6 Dec 2018 16:26:35 +0100
Message-Id: <20181206152635.1869-3-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
References: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_072703_360401_42874A8A 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I looked into Documentation/trace/ftrace-design.rst and, I think,
we check all the boxes needed for HAVE_SYSCALL_TRACEPOINTS.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4f48f757204..6749c22ee656 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_GENERIC_DMA_COHERENT
 	select HAVE_PERF_EVENTS
+	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
 	select RISCV_ISA_A if SMP
 	select SPARSE_IRQ
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
