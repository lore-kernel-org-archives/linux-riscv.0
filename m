Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A775CEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e98Z3hRcwhsHzns6ZudIJ+IH2dzQBD624WT12PTTGZ0=; b=PbIFEecfe/F2Wa
	28aYQhRHY+rTUA4+gvMeV+DwTH2gxyjIDjU9yHk1yNYL9PLOyqFk8i82dVpKA0qZRfEA9/J64GnMI
	rGBO7dg3mQyFx18OSsSmM7mRA2h50U3d+RRYFfS7fOLHNvilHlYidv7/ZlPfkFi20j+MvIPex/vJ8
	VsJZgJLDoI0mUHPfta77Wwyb0fEjCtFeulnxDUQciPetcJavcW/upPqYRb+/4B63lCbp2kq135z1P
	O242wMuDbgYndXvxkRqAflDXi2ODd6q2w+sD8MIVEMbVqiEPge3cqQRXQ2mbRmDeY7WPBruvchYH3
	0lbQjPayo6N8Y2Inmp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGd-00AKrs-0g;
	Thu, 03 Aug 2023 16:33:39 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGa-00AKmq-30
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:38 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-55e1ae72dceso762213eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080415; x=1691685215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAcynScOpmJJpAgbkOZYKn6ILQea1aDVBL6bd0lWO7g=;
        b=haTj4cAaQ8nuB3BJwgKbtJ0OIMlsmmaqEEgNYuTKVDphVbgFKb31Tab8roRlGPx8yS
         2+i3SxJmvxI18SSZFmw8saZXidRJaMXNk3MxrdIdrW80ipC7CMKWW8PrGgFNULu+T/G0
         FGVNORNa6WQ57Jo4xMIqxYSkNRoZl8PNtog1Sz+kWiI1ySJZ921HTMFPZdpX2nqFwqBe
         frOfwlP5XxNtAeIc2v97jbah4yiS5op25qjzwojLXkohpBpoAHiyZTotkANqvsCFYC0S
         qpUKNWj2iB52yBoSlrkE7kHWeQgp8Y0oS97eTb/qWKkfpErro9kJAII6ZsCuzOWn7h0q
         e7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080415; x=1691685215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAcynScOpmJJpAgbkOZYKn6ILQea1aDVBL6bd0lWO7g=;
        b=kzkho5A/T+YPjEWNwhC+X5E7ZRt6MZ95yS7tW5bZ/viIM67MZKGwpN/wjsa4kBy9pv
         OD0jSg+LS/j/h8+iQqcXcaqCQ7eVMRmtPyW79wt1v8fptj/7wQxB+JZcXpxV7LEpgCY7
         eGeq8iv02Xh3Kao6VmOiM7EgV3sRTbJ+3Xs/BhykbG5lMGbpB0xPXqLORffAszFSlNkS
         Ups2tslNdt6ad0wGOWJcWuNFRQ4vEy/UhuuZKZkxeOgmBTxmYwDNMA9owl6iVBwCPp3q
         fJniqnUrrRnCSycp5s+TJZDJ1iwtHM1cQyUCpez6Bcex76wnK/AgVCoYxxvbmPE39jyU
         Sugw==
X-Gm-Message-State: ABy/qLayasFzTt+qauGzs+cLczyjz7xqM3hcLLatkyKgnlKefLJpD4Vz
	vk2tOQM/u4tYkBmVNQjaxTSMNw==
X-Google-Smtp-Source: APBJJlHc0cp5LnSyKvcl8/Xw+xNk5PdlUVq5hrHnfnlDK7OkPy8wfOEtmrs1AxZnyGAB9fvEQliycA==
X-Received: by 2002:a05:6808:e87:b0:3a3:ed69:331 with SMTP id k7-20020a0568080e8700b003a3ed690331mr23614574oil.6.1691080414812;
        Thu, 03 Aug 2023 09:33:34 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 10/10] docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
Date: Thu,  3 Aug 2023 13:33:02 -0300
Message-ID: <20230803163302.445167-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093336_972584_46FB08AA 
X-CRM114-Status: UNSURE (   8.89  )
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
userspace that a given reg can't be changed after the vcpu started.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..3249fb56cc69 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2259,6 +2259,8 @@ Errors:
   EINVAL   invalid register ID, or no such register or used with VMs in
            protected virtualization mode on s390
   EPERM    (arm64) register access not allowed before vcpu finalization
+  EBUSY    (riscv) changing register value not allowed after the vcpu
+           has run at least once
   ======   ============================================================
 
 (These error codes are indicative only: do not rely on a specific error
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
