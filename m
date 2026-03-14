Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE17010854AA
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 22:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4GHwjWDP17e1bmIaxdORrTWToWiuRi78azGVjF8ItOE=; b=EZACx0nWjaMoU7
	UBlv52JDfSLDkgNkQ93+FvqSXK2L9GAlXah4haFLEovMSvcMRsbPiEPgvsyg/3pqHQnfFBIu/7z7M
	fOXZx0VRcoIlwqqGB6vP4lnSSz17WemcodMXUZnmLj4tQT2JOSGJrWQMA9if2kh/Q3JBe/W5Rf15K
	j8+iq5HZ/19HxrqT8WzgaZkVmlZ1LPgfK8iQIeCkzkQ5qyu5EY6+MlX7vScTPzzEuyS2tmccIA/mX
	hZzt03xhYK6kfjVcodfrFijcxAs9MBzOzMP4whoST3fzOJgUmvksc46E/a7jXAWGWF4jKEHgd8Bg0
	QnduhBVxJx/WpWg/A4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XWU-00000002DCx-0hyj;
	Sat, 14 Mar 2026 22:31:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XWR-00000002DBV-0Pmz
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 22:31:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-483487335c2so32149045e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Mar 2026 15:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773527509; x=1774132309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ7hVQIRD6vEHOsR3AJFX+E3NnIhhIwHbuPfNg+Gnww=;
        b=HDYRXVuzVSqWAllakJ5MNNmn+GN93Ug34p6qJiPF0NafABVJo3w8T1WSKHwrFi7Euw
         AlFBVhV1g2P9wGXtvN80DF+SY6OpFf+GJ3bH8tT8WJFwJXY/0ll1I5LF/5YMco7kDllf
         CSWANvZejrT9h3hF182QvO/vXPZzxkg3d9FIbQQlFxMVcAePF/hBnHrAhOdZVhZB3ADV
         f4LqX9ur7iB2BxOnWoRrQijLXitqE1NeVfQGdsxq/yUmL5RsIs46I/zTJpz0hrXl9Rxl
         28PblawtqygTHxON6vROrx6DPoVQS2lgcHFxNpcMB1ntFbBaFyT5jMkZ+lDIYenHFEhJ
         qcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773527509; x=1774132309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ7hVQIRD6vEHOsR3AJFX+E3NnIhhIwHbuPfNg+Gnww=;
        b=YT/IyVgRrEjU4g7v2foaZGI5MKT3KSVLtfRBSwRqIEjFPsK8GGyAjc4Nne3tl4Wz1O
         w1Rqn+8NwY4NqCHS6I5f6S04c1ocO7OiINH0aAaHuMRLC9MU4DOZXfqiHZM2YH1AEM7p
         UaGl2WneNHzgseDUjF4n3WUyq59xJXnLljdal3Z6dUf4YklmIHMuR00Avo6YDE7NiMzO
         PnovvSIKpgHKqSc89eSjOc79PBAUNl596Dd+FoJXKD0Z/pZmF1cLzSEMicS0OczqKXlc
         M1eNOR9Mty1TAZhqkyUMBoFv5OywL6jaxhTRW/eUxvcOElNWkBx5XYkkqs6GN/wzekPv
         62pA==
X-Forwarded-Encrypted: i=1; AJvYcCWGN5wzEwsW8zh/7H+P9QMzvF8+Ho0rUmmOtPetsBrxebDWZ8N8THMsZmWh6JdL2RbsUMLabS3PpnipGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3QlF3m/LrNW1IPrxWNbjMdlGf/3AHb2sn9Pl+2Gmu/LcZ6kQR
	5NBHtSIB4qXSYzvcf+9NPoPOFnTpW3e6gb8OxQ3iBPKWyuLYndrvuIv+
X-Gm-Gg: ATEYQzx4V2vTdlCHfzFEobq7d+W4evsyct+6alnqYGkFrkw/w/Gp8pkMg9eLVCUrkWl
	Y+eQTMmaawt91bXpKNFFNYfXVO7OrLjASRixqvDfZETH1KWLv5ZE/SK4LzsiaXq5Dsz9GDJbGPI
	UvAh65danpi/2dTrfRNLk61avHRld2Etpy9nD7LjnEngfC33JB5xdN2R9JviL4LjNE41x0nR5OU
	XsItklHKBES3t/KHQkJnw3fMnELxU6UvvlTKIBlR4+KQp54v9SMMLHdc8vAXVzpTr9tQpCwW6dN
	UwojC3rd/JID/OdITS8XVqbhXsDDdw1NhQaXjDpazUXlSbyMUV0MZeZU235egKTgGsnb8QvurR+
	LkR3CwjuKJEOqwSicfiiOZRZNFlnofogJlsDi52H217jVhu+DNTtwF8jlCwQIYuhpESmI4aD1Te
	qHwLXUpexxoEJO0c6LIfs59yR1euTtwDhcQjA5xn8zikypkN4XP7OHVaYWVSf+z93O9P4NZw==
X-Received: by 2002:a05:600c:6287:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-485566d2ff2mr132595095e9.11.1773527508820;
        Sat, 14 Mar 2026 15:31:48 -0700 (PDT)
Received: from osama.. ([41.238.114.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm149314455e9.7.2026.03.14.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:31:48 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] riscv: kvm: fix vector context allocation leak
Date: Sat, 14 Mar 2026 23:31:43 +0100
Message-ID: <20260314223144.154349-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_153151_140664_0DEB7DB3 
X-CRM114-Status: GOOD (  10.12  )
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

When the second kzalloc (host_context.vector.datap) fails in
kvm_riscv_vcpu_alloc_vector_context, the first allocation
(guest_context.vector.datap) is leaked. Free it before returning.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_vector.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..5b6ad82d47be 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -80,8 +80,11 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
-	if (!vcpu->arch.host_context.vector.datap)
+	if (!vcpu->arch.host_context.vector.datap) {
+		kfree(vcpu->arch.guest_context.vector.datap);
+		vcpu->arch.guest_context.vector.datap = NULL;
 		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
