Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0491AC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HosGlVHw75ZrwXOq3lL/kAH1Pd1F6KkoPSKPZsC8JA4=; b=okxKOmwEEJKOBBlDLf8HM18ksd
	DPnD8WyOwxamGaGIa+DLlsV2VMQXFbLAwsccYjSfX2BRI4jM5kmwmdehcswX2z+ATCiYdU50WrcoI
	Sm97ajYPGzSWq3ORXobOu64pygC69U3sBUP9PGmnjlurYxvk9RxaM8qdHtylANPmeuwyXuxIsBof6
	PkqajqyabanNzYmBy960ZAAkEjA8S+LXsg8nO+KQyUYGolPwKRhDh22VAKRVi9S5MHBGhqOL9jCyK
	1oenD8sYD5Yq7O4qpZqx3m+72CV2uK5dLg1s0IuAu5tAPbvDKovnG00PtxC6jADhJulAb8AEDCeV9
	wUe4gAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dsz-00000003PR6-28Se;
	Fri, 10 May 2024 00:13:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dri-00000003OYL-1HBW
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pm4mQmUfjR+WgpaOe5aEacZBA1kgFDY/sgKTjpP98e4=; b=ATPdBqrvvUnDocVbdCZAuemKZ/
	MUkgvjZVZSmLjKpfRXZyJrHmTzcFUTSao7CCEl+oEITxQOMzsFU0GFAqnxMMLkJ+NCDqgjUU0k6U5
	hltThG/RwSKtBL+95rK8gm1qzU2Zi+CKsRGD/UORHDAk8CkaXhZUgXj680akci7kVv+PrHBXKg9up
	C5Nm1YXrCIxyUoZt++FV7+Br8tgU7zAvi10gphLu0mUYyuNhP/N4ZAHHxs/fhH3qW86oFyDo7j3/u
	rRj2Q8tO4gLCRINRCVv4BDqSxVZ+b7aMO0q8CVLDrTif/qy5Ra8mv1M26pw1SmQTUFw4KT/Y0IVPj
	aVp5/QzQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrZ-000000036NT-150e
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b413f9999eso1102935a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299906; x=1715904706; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm4mQmUfjR+WgpaOe5aEacZBA1kgFDY/sgKTjpP98e4=;
        b=0PEb8BTKou2G1GMkYotoVIMoAx27hYKxwzJrSkeRnluwGYxDljRRrcxrp8l2QGfq/X
         m1AXXAmuArjB3ht7iGYz/vMYY+UtYkWg63X2EfdtEolp9RmOxJzn4PQZ9FUjPyG7Gm2W
         dx1VUpHeF1zxBtoElYVvT6cPjOrLcSiKhDIoYdY112FuVK48WGgWCpFxGvipR/83Oh3s
         8uiIfdl8Tryu1f1YnKN929dc/jBwx8V2CWqHpMll0UmY9NQcG+G88DcU956+ZO+caTVN
         xsC12BG0RDOXOKN+Xz9xji8fCxiJ7r6fbQVET3KPCeElP0oQujSYwZzB2hThnvhaN9Uh
         VV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299906; x=1715904706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm4mQmUfjR+WgpaOe5aEacZBA1kgFDY/sgKTjpP98e4=;
        b=K/SoJLr5ASK4hsF6c141wXiVJ49k7ugd26xp120MNGgu16ykYEbE7b3MCVfV7WOEwy
         zWujdaNTj0VqPUXx2bZxUWNsZP0EwXGGuFOO07lrPoMgfp/9yWiSBGIGS8XfrfTVFp0L
         cL73RGqQtQQ8jFRgbUJnbT9mP8JHkrEZfueLJoUsMSPcs2Gz1msR9+RZlpCdQ+xQTc1D
         poXuOn3fD/arF+5MFm+X5JDNZqQnfVFz6zhwttioavU+AM6PaazUVB1JAaFqxuf1snfI
         G/oXlp6YQpjvUJ6sYTpOpnNYjBwRNLpJsyWG0CeJnJCjOSNbCIkXUQbVmC0Beng7vAXO
         akjg==
X-Forwarded-Encrypted: i=1; AJvYcCV07as/wmOLPu44ZoHuT3poCtw1zjbUk6Sip2uF52+8sSBJ3d9F9sPCh1aLpalkUvBX6F40cK48/00WE+WFofZWTShViEtaSDp5BfkbO93s
X-Gm-Message-State: AOJu0YzYNresiz9ULGWH7P7Lq7D0Jn0rprl4VWQIFWUV49NiREKVbWlG
	YKduAdbiKOUUIG9u3ze76xrRE7Fd0MLl32hrKYyFO9wZlfSlsRa3z9XZixg/2SIpn7SMge8WVaF
	n3w==
X-Google-Smtp-Source: AGHT+IGGq3KFPEwa7lhjHSB9rjlQ5hpVHZZ8faELDrI+h0bXPf/lmpDE5vCfaX29bPFEVhT8vg9UMGQRxfE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:1f8f:b0:2af:499a:fc9b with SMTP id
 98e67ed59e1d1-2b65fe1f31bmr26724a91.2.1715299905725; Thu, 09 May 2024
 17:11:45 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:13 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-57-edliaw@google.com>
Subject: [PATCH v4 56/66] selftests/sigaltstack: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011153_600551_B53E3425 
X-CRM114-Status: UNSURE (   8.82  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sigaltstack/sas.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/sigaltstack/sas.c b/tools/testing/selftests/sigaltstack/sas.c
index 07227fab1cc9..36b510de0195 100644
--- a/tools/testing/selftests/sigaltstack/sas.c
+++ b/tools/testing/selftests/sigaltstack/sas.c
@@ -6,8 +6,6 @@
  * If that succeeds, then swapcontext() can be used inside sighandler safely.
  *
  */
-
-#define _GNU_SOURCE
 #include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
