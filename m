Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0F9EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e98Z3hRcwhsHzns6ZudIJ+IH2dzQBD624WT12PTTGZ0=; b=Spj35lYkNZwpfO
	aez2sHUSv0rSjAA+vFGlvorGxGw3ih1hxkA+LRG3ckeWvXeAaLcuIGstuZIh3Kg/6yuXQk3naiEX+
	ZKAUqjv89sTgIUXPzQ36b9Nx7/F6ay+L5J7Su4FIPIAuBcdNuzzQWzd4ePtnXkF1t8NU9ZAb+bhAY
	spTLferSuxuIxvSuCfk8eBOaq1UQ6b2A/6k+ENp2vsMXbfnH1ETYx1spVDf6XtR55FRyvugLp/wR4
	IS/DWBK8dlJ7o6MVmuMsu3Zerll6EHtitYGWasfnF7mWCENpVeTu9C637ouwLwLMOkjEJ9hMEW4DY
	3p0U003Qt2PIAIdvEk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYtC-009Mlr-16;
	Thu, 03 Aug 2023 14:01:18 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsy-009MNs-2r
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:01:08 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6bc9efb5091so697808a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071259; x=1691676059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAcynScOpmJJpAgbkOZYKn6ILQea1aDVBL6bd0lWO7g=;
        b=h5wyGZdJugOapVTfRnHPWCqmuQ9bCO45+4hqZwI2EqNaFNIjubOL6dva8fyv4jLr5O
         xbfQyVMF2ZQyB6k19gH7XQKMviR4uuhjAVI9H8vb/0MJeGnslZORMBmqzgkWmgybTPrG
         LS2c2KCjkSZOJcmfHUstcgf0CUWTdUkmPpSA2BelrXV8adTExbXSf2DHSKJGiJS7O3i9
         Ep1av+4DO+qPtMhsWUDPJaTfHdBBnHSDiA9owbLM+SBg3ku+1wxKHwVwyNWynVEomwDA
         +jRKqr4/rlD819kJ9oXsOdMCejAAz7nCE+hMYZNI9RgbVWMWk3Xj2FPw0HXmnnvJQgNz
         tZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071259; x=1691676059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAcynScOpmJJpAgbkOZYKn6ILQea1aDVBL6bd0lWO7g=;
        b=Y/gSY0AT7C6IXQaFyvgAAgX3NYoV+lNQ2xyERgXK8gMfKJOsmx6iVlnWoTIBRBHRca
         YEbP1eG/GmOzUAnrHjLgyWLFbACfMV5M3FarVu+RR2Zc9BIlxjxpWEuRwHn8tXcKe1wa
         5gjoSgRRj/ZoTM8NUev0cHLw+MRQh0l2OMhxIqIW32K1Ky+jum5Znf11Or9bm15IMgOm
         N+w54lUgMRRQ2eYDZbcnHt2mRzhedpmKKoBOOHgu1QLV/u64m3l5FNuXY7jJv06WoIu6
         u1Xt/uFeOZ3NMUogYzrg0VAfYoi5AqWcypMID9z4ZHUmayLrNW6jX0HXjrGMbD+9U5oh
         A5Hg==
X-Gm-Message-State: ABy/qLaWKTzev5186EnSGkkYy7fwn2XBWES67C7G6ybWEyGHaislclVt
	4v0a0LI/4rHzGHW5yZIpU6GvFw==
X-Google-Smtp-Source: APBJJlHllE/EaunMqwLTs5cwVf8bqP6wD0HL99VVwT6cKqI+jaDH/VDH2t/f1OSr6sXmNFPwBWf53Q==
X-Received: by 2002:a05:6830:4621:b0:6bc:a626:701b with SMTP id ba33-20020a056830462100b006bca626701bmr7019403otb.17.1691071259085;
        Thu, 03 Aug 2023 07:00:59 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:58 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 10/10] docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
Date: Thu,  3 Aug 2023 11:00:22 -0300
Message-ID: <20230803140022.399333-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070105_267808_03A2CC3F 
X-CRM114-Status: UNSURE (   8.63  )
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
