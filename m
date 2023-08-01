Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8D4C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JNiydr9uMy31R1oMJh9yfb4mVlcP7dyhT2WyLta08k=; b=MTjUaJ/NZYv4cl
	yjss+hMlalaZ2JUU2OjZgPJQB/4oLxiBMg1fsahcqYeEGiYp/FrN5t19et/EaGflbqEjy4CX9TTbK
	KHrPtjOs+jDGgFAROlMcYX/9wrhZ8LDbfr1jkCZTKyNLtNLESA8Ljru4vKuOWDgqKXotJrRaSTy9F
	6ou0m70VaFG9N0QCbJuXKybBXu8KcUNNIvj/sWzdqyIBMehzy3fXVs1yMAgHFYnk7H+Ax/buqlUbo
	UnIWp5dwYcOBlBqBXkRAiqCQCobdeFkRl9TJLK20rmKX2D1T/cHthgMrggRaRboCWvGUqI7Cblxcq
	KmnNjwyJzhg1BjvplWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpa-003R8K-3A;
	Tue, 01 Aug 2023 22:27:06 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpW-003R3c-1g
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:27:05 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1bb954414e8so5024230fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928819; x=1691533619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g6ezAcbcDbpiKHj+AEdPKnGvpfWwAjfnv3+ZuFJ5r4=;
        b=eVli2vidJKe5G6yzfio4xe3N1CQY38+fWkC805I+iE0BKgN3cQPDSlj2Q2qTkkRTdT
         oXDB9NpCnawERW+EGwdjj4ycY87U0o279DCOI8ZZe+SOxekYCQK3bUe6pF4zymNyPs6U
         TcJeRYqB1jTkzCVLWcpfGVeZxnqrgjoE02gMT0kzkHAEJJNiOpJU+EDkySr1W3F1NFQG
         jspe+cRjZWUhgv5d5EGnA6O4cPaZKIZGrn1NqeHfgg5F8DYTPEHUcGveymItLkyneDyv
         JRXt491LPCI2QS+V+WWgmirg2jRCMPem+zldlb/UwrSHGw4wvRoQi55utBIaDK3kYk8I
         VCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928819; x=1691533619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g6ezAcbcDbpiKHj+AEdPKnGvpfWwAjfnv3+ZuFJ5r4=;
        b=WOQI20SYBC3y45bLYrnaq//TP3J5qwYGiz5FQURYBjcdi/5rlcXhs/s7JjT07J6fet
         CBoxhMFOIXCQlNjIZU/Lb66Kw08kFP+XGBaW6Yih+hMQaoaXaisT5qfatsCOFFkmwBcy
         5Vqdg8ulVh7UgQp30DYfKA9GwP/J2WWxseALe9pMb7ZI+Y5FWOxdUPAYRjYSSfUEyNhi
         3afILreiwj/Ak1WTT0mBx2JRAbA9P2qRmTT9FX+Uj/nBsAuqM3rq/eMV2xynxkiE/4Yg
         PGklHf7VlQ+vWYyFJGfjK/AsA6QY1870ueJYYoJb6geLhYWvpaSV0tt04qknMu38vM3L
         /LHg==
X-Gm-Message-State: ABy/qLZByhwWIoKAXcGch+RMN/79x8OCg/Tnjjl3nt7mLpDoR/3yPN7e
	K0l+DCC8+J90VpRGGV7Cji7/Uw==
X-Google-Smtp-Source: APBJJlGZLIQX6v2Gff80pri9PSoxKtsIvuNPKAsHRV2rZ64pUXfcAAVzSPiog1oHKzqGX/7wJwKNlw==
X-Received: by 2002:a05:6870:524e:b0:1bf:62d:6ea3 with SMTP id o14-20020a056870524e00b001bf062d6ea3mr4055037oai.20.1690928819651;
        Tue, 01 Aug 2023 15:26:59 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:59 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 9/9] docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
Date: Tue,  1 Aug 2023 19:26:29 -0300
Message-ID: <20230801222629.210929-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152703_760572_A0302E12 
X-CRM114-Status: UNSURE (   8.53  )
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

The EBUSY errno is being used for KVM_SET_ONE_REG as a way to tell
userspace that a given reg can't be written after the vcpu started.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..229e7cc091c8 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2259,6 +2259,8 @@ Errors:
   EINVAL   invalid register ID, or no such register or used with VMs in
            protected virtualization mode on s390
   EPERM    (arm64) register access not allowed before vcpu finalization
+  EBUSY    (riscv) register access not allowed after the vcpu has run
+           at least once
   ======   ============================================================
 
 (These error codes are indicative only: do not rely on a specific error
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
