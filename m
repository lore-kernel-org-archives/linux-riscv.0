Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F419CC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 10:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C261B20989
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 10:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m8xOqCj5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxNMS0N3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C261B20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9fve20FvWlFOFNAws1kE1MTANhFjxYXPqjzW6lpLUC4=; b=m8xOqCj5yvcaDb
	lH9RumYgvB/339jRy+E7JwUTATZqwsZwJPlzCYXD6yeIGPvYpQseFw0L+1Qb/n88i0a16ac7HNDFr
	55fZB9B+OjxzrQbMWDKlvTLkcLV9tINYzOz72LJ+tD+xba1KYR5vb0U15krRdGDbJU11KgW1Wqvu/
	/jQWc4ba9takx7/U9tBGXOFoWbUd03YppG5YmlvZOfffROckHEXV68NlI2r9cYbN78xjStgZ0ovUx
	lPst4YDCtuIeIt4sE/y2a7jQQ/i1Ma0hBkg2iLlb6RSmR0BTvyRMiWbdkIrgeq2P7Er3BJPoQgZGH
	AhufoYQapMmTJ8fCkgkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUqrr-0002OZ-3S; Thu, 06 Dec 2018 10:26:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUqro-0002NF-CE
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 10:26:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id c14so22694965wrr.0
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JIo8gyovFcHHP3y/e5BB5AOjOQoS1zn42GCJihBO9/4=;
 b=SxNMS0N3R2K/psBC8KX6M+4h/Jk02fnlru1t5rd/nTFTy4RXW3F0Qt0KHr7Vj4+R2d
 dBBZSYMGLHtwpY4zkmt+rI4izAEdka5gOtgjE54kQP0YQqPtwaJ/DqVpSSWIhGOOAQZR
 xbnYzwKHSiDMfh6PR6Jx88gb03KcB+uZGSbxy1hKSIUflOhmXG7FoX1jV7FQk1Z8N/J5
 JfCXYR7xJb6w2/JO+AqUunApTjqWFpbbewuW1WF+rSwagXjVStYDHhXE/+/LdPHs0myH
 8gOCCH9nm8mnAMun/uJNHE27kML/5iFFaqU6OnaXKBAobZi+nH/mhs4EJexz0ivMTo1C
 GiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JIo8gyovFcHHP3y/e5BB5AOjOQoS1zn42GCJihBO9/4=;
 b=JWuNowYaUr/on9wIlvnTr8P7UOzN08n1n7eHrFoe98RnOrfauCbuDb7bO7nmPK5jvZ
 IRFLeKlX8AWsP//Wlbua3XIm/Dev3Rsmj+potKrf670G2vfweBl5WV39V4iCP3TnYbnc
 V06PkS4/MYtHJ4mffS3W2YlmyVxKbNjL27KjMmL88RW3f8W+gmGuvGWHifeya9UQwzNk
 E5mPzJ2TJzbaYeVIL8tWFfR0Ros9csAhL4MkoPv59oY2dFVvyIBpVjnHD7hS7ooKXLCF
 D5VwTHSGKRuyXkMh8Srt4mZKNzqJ+C96N6J8mhn+ptuZBb6PCgkvtKHxBp42VlHXBr0F
 iYBg==
X-Gm-Message-State: AA+aEWZPRjGF6erv4xj7dXQ0Y/MqskU7KW13Fvk8INX6/xYhTnLj+CfM
 YUs6s4ECHfF8/V1+G/uP2PY=
X-Google-Smtp-Source: AFSGD/UUSGuJ8qCxB5+P9wUNNlK41wW6I1rFngcEZC0vI2YeNVjiVxbw9dT91H2NXvKvUOcD9XPvjg==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr494844wrw.129.1544091996274;
 Thu, 06 Dec 2018 02:26:36 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id z8sm20453938wrr.52.2018.12.06.02.26.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 02:26:35 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: remove unused variable in ftrace
Date: Thu,  6 Dec 2018 11:26:26 +0100
Message-Id: <20181206102626.2557-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_022648_416649_090874FE 
X-CRM114-Status: UNSURE (   8.30  )
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

Noticed while building kernel-4.20.0-0.rc5.git2.1.fc30 for
Fedora 30/RISCV.

[..]
BUILDSTDERR: arch/riscv/kernel/ftrace.c: In function 'prepare_ftrace_return':
BUILDSTDERR: arch/riscv/kernel/ftrace.c:135:6: warning: unused variable 'err' [-Wunused-variable]
BUILDSTDERR:   int err;
BUILDSTDERR:       ^~~
[..]

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/ftrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index c433f6d3dd64..a840b7d074f7 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -132,7 +132,6 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 {
 	unsigned long return_hooker = (unsigned long)&return_to_handler;
 	unsigned long old;
-	int err;
 
 	if (unlikely(atomic_read(&current->tracing_graph_pause)))
 		return;
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
