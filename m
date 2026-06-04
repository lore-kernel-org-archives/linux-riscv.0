Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C73CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JUth6Y2KX/IaJwxiFquS0ROspvr615WNmPsMtbjgp4=; b=sEKC2A5Y+VbuNC
	9cL4PYUN+Z84FVqsR/QnzBb7V8broC7/Edon/PHcJti9fVYOV4PV7Rf0OxlrGKm3D42kgg8tuAXtY
	i+pWuk92gXh1ojZW0C6R/MjnEZYUYg9Mm5ZSWFcd4bkWwhQCDBG86a3uQX8G+st2OLP/GpJ/UCw+9
	ODJxtUjhG7xNSnItKA53WQgvbelZSAK8U7GCVcY35KxKpkaG8+MAv3axxFW1X5FfKVhkXrFfw5K6o
	cVYSMU82j5p2UZ6c69w17fYVw0COHxMZXs2hnPVuie+3Mm2YUFUl5rZAV61CPIeUqZSQJHlkug/cn
	2H8L/DeQqhs2DdjyTNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fo-0000000Gv2v-3plF;
	Thu, 04 Jun 2026 14:41:04 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fm-0000000Gv1q-2SBw
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:41:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so581970b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584062; x=1781188862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+magj2UORCz/X4UOoPUbqQLTIbOP3hI3F42RQJtIeyE=;
        b=X3+rPlz555pPMPeb4yCkGI6u/5bqE45+l72v1uKjzsGa/SXPOTF5BB3cm9+7BVxBq/
         1fEvAFY1/EddwdfRNJ8xf5RH7vPwaFgf/+vBEcQGuHxopDpoBfXJLb60Kq1iynqiQUIL
         nEOFALtYFl3w5E69pB36agr2Q/8bq6LuhIjkVwvGMxVP3gfcHUi6ErrzfQTOQuefF0px
         sh8q0p2YHBw0IRF8h9W7G8U6SLHvw06EauDnW6cqiH2guXwjURjuuT8IXGk3eOcMPxoI
         Uqoo2997SAkSzWhXrzfZbO0FH4EbpBq6aruU/wk+knj2TtewH9Dq/cplI1ic9Jr8Prat
         EmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584062; x=1781188862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+magj2UORCz/X4UOoPUbqQLTIbOP3hI3F42RQJtIeyE=;
        b=WdWpC34HmEDNNtiScHNwImRTQvPtysfqX4ocp0TMTLlkVQiruRxoUj6yhIgyIsSjUU
         0/qWAMX7i+bq0M2U+kMyn+cqLHcJ5F4xGg2iIzt14KynrNkpholDU44AA2f0PvEsFxJU
         jHJZQL4hZqPiEdsjUJtozqVQ0FC+MuIUJFU9tS6vuDBKxOqQkWKb6jyzSIet5Lwu0yBA
         p9Nx3u1mc0v5pxdiC+h5dFyfFwscZIdFf7diroqNkzzXEeAtjK4sHH+v0lW/GkKL1p9l
         IsZTv6Bda865gH7Gs6eGVFrPcKgzo3wxRI9JFIqgOqCAepVRUe0IY0AK6mjAl7Dzy3sb
         3MWw==
X-Forwarded-Encrypted: i=1; AFNElJ/MXyyOAuzoF936mpRigHI8QFAEVrirhfVL6UKOOi4WneScm1BZVjgzfe75qiqtWJvLNYi8dW13cN61Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsf2n3sol8afOMu9WjxQ4/ByMkyZxf7FeUstSmFiAGvPhav/WM
	N9IfW4fgChD1hiwzYVh4oSjbnqdqEzAWbCXbvXk39oTaEM6jNUnHWhTH
X-Gm-Gg: Acq92OFilwGVMdkctEsFXjOWJBAuXXVxFQgEwHfyeUGEpPcZ8htlgZf1E5T/W0r17Ep
	sgopYAUtH6SmRLIhRiDDGPxVhzItCCQQE4TwtaWM8JSI2wubYak38ZPEoT/goONq/nNaGIheaCC
	/BtcrSTAOkNWd04gYhLeC97z0/ZpbwGejAg6Vu0EEOAyXZYIQ5LKNClVLMMQDto5N5yIrsMEOhJ
	7YOWotEvcfyrV4pZAFMA0r/UDnSU5jyk55vHPsVfrKAExEP+jL/BwF9LeMUJ3OFkSRlOqLl4dX4
	DSrOvhfqjq38IOpvOF+pDHr07FcvyAzqCbEYOeN2PdA06CanU7GN+RQmTU/DhymImCDqAwniYKX
	tj1aOCpNyA8LSU3ruyMkrBBSPevYAa6YEOEWmfMeqTstldy7z8L+W1JLeVlwdQrsUQ0KQ2pTtUY
	mTJTyQV2K1oQL0ytILojLK5NHZauT13vXgQQ7MGwxcUhkv4Sj4CxIP9fh5fF+nxME3o9bRu4GMo
	zQUNEkUeCKbJmLb2uF2oLXAA8uGpt1wbzQZvSKOrYY6v4VYN2QR25V2rAsowH6q
X-Received: by 2002:a05:6a00:ab8f:b0:83f:a040:a3d3 with SMTP id d2e1a72fcca58-84284efdd84mr8087893b3a.43.1780584061653;
        Thu, 04 Jun 2026 07:41:01 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:01 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Fri,  5 Jun 2026 00:09:48 +0930
Message-ID: <20260604143957.668047-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074102_627715_98D1398B 
X-CRM114-Status: UNSURE (   7.60  )
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

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
