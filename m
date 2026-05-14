Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0281CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sk/bbf3nS3u4DJYNA2gojmn7A0lfEXTjIo2v4+qx3BU=; b=Ohx3VJVOEXXfGA
	0oBcm/d29Ry4YOV5DPwHUJXY7Wx9wvF9uckx2hGFsMG2fjqY9UFQecR5pYbugyv4Bu66keuzw4zYB
	3nugZW1YFauDVhZiA5btTYNXHi7jZz0enRxa3ow353/B/rPE1Cr0xh/G8rSKdBEfLKlfIrg4HpQVr
	o195U4VhPCQGjmBjhNJy1baJSjnetrC+R5FcKCndQrG4YZBxWHsDrhecbch9hSOJ9skVTAjJw4ILW
	f4i5GqhYzz5gqiC5+NLIDAjNO7jo+IYWvFk+dgHiza70RsswmB6x3W3PoSezQX60xTRaR2NcQe2D/
	G+MH9xtOlPYeXWfUh7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzX-00000006DTh-096h;
	Thu, 14 May 2026 17:36:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzV-00000006DRp-1E8N
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:36:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so4419225f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780215; x=1779385015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzOXpklejgsU43guiJHt9ocv4/DBH4gkj5ecH1UKTFA=;
        b=VA8Lk4f8rPHk9W2wJuAtBYU3D5496cID4HoB07b+Wrqba9sUjJefBYwhAX65NPHrxl
         3C9nKS3tbgZXZ/iPkxidXSkQT3fdXooQhnHUvahGRFUaRzmJ3EvzAua8w79o59PupDUw
         p4tH80trC5XaGxFkDelgz1J4oTa5SX5Kk5uAKHTwkqum9LXyKynWLwm/EiiPVvzGJ0YE
         UFMxqe/YepKB9PUd/l3dlLogwJoaZLQkg5ZRK/F703qof9I1zWfCEIAaBJWTFsBMxzyo
         +dBXspv0Dc96eB1BmTj2WbUrAyfgbeCB74VZJNaeATV7Lx572YLbTVPZu6aQ9XWmwxrO
         twpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780215; x=1779385015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzOXpklejgsU43guiJHt9ocv4/DBH4gkj5ecH1UKTFA=;
        b=A7WGzIV0cZM+/TQqcj0gCS7UwigQTf1sI33OGTIlOBrx6fNJzyPmbY4c1l6zRF8D5A
         vstjCsGYhTz2OZvpB/WOxI8DInQ8d+j2n8kM8lKZYjqmH2ULTRadgDTC6wSJufwvbAPc
         A42BB0aQxexI9XEw4fniyih3DCBFA1QgsJRUZO3Xsni5j08q1WL4gy5sKPfTwIW4RqBr
         5sS9i1m2OxjwQJrKh7c12y5sFXRJD4wvfTUJw9tLl6vVfks3cfqDCHFTMtYEbTdQSw6Z
         NIKpb7T3Quxqmu0IhTqmRfB3H9zI4hju/yFKH5n3vFgmwu1OE7zWaymhhOOysiZlogqj
         J2ow==
X-Forwarded-Encrypted: i=1; AFNElJ88bbZWC1ISx2NHnzec3s6n5r/O6EJDSMr+cyEy9TuN/h/V9/zIazdbJnxWyV/TZeo3Tfrqxq6/7XCKiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwHWqMM+hJqz1mc6RUekfSy/bJukAHV1uBSV5LD/qPSByPqIhR
	ddNn+PkAevrUUwki4o1teb4hJ6Lew/Oq9D+Iei/tN3X88PcsUR3/Xv2D
X-Gm-Gg: Acq92OFrUfAorWKl7e41MQ9euyDSlhsEV9TvXz2Usv5VCtOLSLOXqV6YaK0BBKRjHlp
	Q/HUpOYmv7CTuwZ8WufRWT5E+PfOrXDIAka23VDi7UgIODuACQdJxdaq9dXHBMhL8Oouc5AV7fm
	FduQtXO8/K4TWabcLc6TSMk6khWI9dDYrq+okexdi+wzMaXiY1Pb1ovi3AHbNbL6zO7jKzTOj0S
	XV49fjOmLlkW3wMORHN7IFxwiVombkbotyD7ltTwo/Hm0MbbKQ/uPAIaj0CWEH9DI9ppZJQg9os
	5yrZMjvkWVsRRmPgYBgzOQXjkN9YkGedksXeQCNRx7dp0uPn7i7w62d8MRIGstnADKG9Fcdk/m8
	WBtaQ9hIgFyZ+TNuYh/xt7H4lyaLyekRSgqdiGRqv2KBXJFpd+MBXV1zBWRbW4+jSaV9OyLqaQV
	CZgzwuUwpFAUmiJvO5mrOKG0L+0QZAzBkUPazIHePhF+Urr/JbehXNE9BHQaRT
X-Received: by 2002:a05:6000:2f83:b0:43d:7883:87ce with SMTP id ffacd0b85a97d-45e5c595a6fmr80251f8f.34.1778780215294;
        Thu, 14 May 2026 10:36:55 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:4f8c:d716:5699:930b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe222bsm6575063f8f.27.2026.05.14.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:36:54 -0700 (PDT)
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
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info OOM
Date: Thu, 14 May 2026 19:36:41 +0200
Message-ID: <20260514173642.41448-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514173642.41448-1-osama.abdelkader@gmail.com>
References: <20260514173642.41448-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103657_339262_378132D5 
X-CRM114-Status: UNSURE (   9.94  )
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

kvm_riscv_vcpu_pmu_event_info() returned -ENOMEM from the
SBI extension handler, which caused kvm_riscv_vcpu_sbi_ecall()
to abort KVM_RUN and surface the error to userspace instead of
completing the ECALL with a negative SBI error in a0.
Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
handlers and kvm_sbi_ext_pmu_handler comment.

Fixes: e309fd113b9f ("RISC-V: KVM: Implement get event info function")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 91aa0155a420..bb46dcbfb24d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -501,8 +501,10 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 	}
 
 	einfo = kzalloc(shmem_size, GFP_KERNEL);
-	if (!einfo)
-		return -ENOMEM;
+	if (!einfo) {
+		ret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
 	if (ret) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
