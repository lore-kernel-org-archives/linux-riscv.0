Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A51C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihXO45tS8D/wPgQzXHixcyDepbfIxHx9R3fcdgWKmyE=; b=RxF8eIGDTn3qVa
	mwZwLIGvVaw+6cD2N2CKUJRKH2khMks1wx2NFlwCZqVPiH3ihfW1VYaBDBRpkVvytPfOokaLKXyvC
	1alV/PcZJEBfq7kNQnMXCnYwVLtpvQNLMD9rV6XmTKkhCM6Cef8GLdIl0X1EIz20V9cd6m5XduyHI
	B+mlD+ZjD7f6HYYWerfSZM0jaDWPzcAIXTISwqKL/o0XGR3ecVbN5my8KHqkgWi5mFZ+aBVy9VU2I
	gy0bupmZCcSfAhYpUwBdNBC+XBaEcBQIXITjmvhRv73GjmcBFx1JXiTTYm8OCcoHTN6dtmD7Jd8sB
	oWZX4HDnaNzmPyYH1o/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7pD-000000030Bq-1q2L;
	Fri, 14 Jun 2024 14:22:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7p5-0000000306J-3yh9
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f70c457823so18653455ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374955; x=1718979755; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wDCzcwoY+7Urqf0z9zEneV8CU/qabdLYOlq0L2NAoPg=;
        b=mZQug5wzRxudF0cYbKD6+1X66ngcMgbopruvnNGC9zGfLibo+a+EPS9D3oXDWIs7F5
         ZlCg8EnBUGt+DYus9YokzCzfQs64DH61oUl58VMOT2duKpaxZXVKabL1hbc/MuaWJXCI
         daoJCIILTP7SGsLLx1QSFcqlrivt3ZmVQXQJPXn3iHg6OBgt4sjxKfJeF+/aBJluKqut
         1vcy9C43U3ST5GtS50LXzxnxZM2srsc8IFxsKQD+46yAIwOCDurwdIFC/4IWB1s4BJ1h
         E9GbrShWgt+kmqLpUCrmjczW7hOkZVYhuULb07W3dKjw9T//VEpSVmVJtXxcQH+kuZJq
         tVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374955; x=1718979755;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDCzcwoY+7Urqf0z9zEneV8CU/qabdLYOlq0L2NAoPg=;
        b=l/xPJ0fyvudz/VkZMwrm0H4NMMV4lwgeZ7KhPwdJlhv4yDZ+pa7QND+TdMbGYDAA2E
         KhGA55sdLq1H1BYbCwse/PImorFjXN8cMbaGt3uhE+20xk3BytLNJ5S04ZIAjyTxF0oj
         DdPeAW1CWvcAlVYR+iJiBPcuMnbXsqGk22oqCCFKbXCU2WJbifvWzZ4NHCZqJWJ3QrAg
         E+Qitv3QxtzQRJcQuUBbqxbnMpNwyoebt0EWeIftwBiBV0geJOTzNDSdZwP7v9bxQq/Z
         nzQS2AnNbRxb7qYudL65LHPxeLAXFsXoGgLdavrDtLmXuyhXL8dTjHG2KuVuZasAcXik
         tE6w==
X-Forwarded-Encrypted: i=1; AJvYcCXGmi6gu/GD/JrhUvf8pV0Pbpt1hX7ajnGLatvzJdLizlZr6KiOKFdxburG9xfAB3QdpIRm+lo/vBafjKgiQJgGp5I4Ts1Qbc/CyS3/gFbn
X-Gm-Message-State: AOJu0YzagUfgH6d6wWOQslqgymv5JU/jxpnAJEjsfC9PzN9OoBFcN7gN
	u1yB8fm2smZOS2dh/H1sHBkNkOi5LV6XRdCxxaGxQKJYVUzVstMStXBAaEFCP3I=
X-Google-Smtp-Source: AGHT+IFNWiib9Mbp3WUeDaTWc2pLd5fn9/fMVeRdDHjkyMdQAAUYNKmmTVlC+NReoIyOXuSV1VHXpQ==
X-Received: by 2002:a17:902:f68e:b0:1f7:2849:183f with SMTP id d9443c01a7336-1f8625c243amr33675115ad.1.1718374955357;
        Fri, 14 Jun 2024 07:22:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:35 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH v2 10/10] iommu:riscv: support nested iommu for get_msi_mapping_domain operation
Date: Fri, 14 Jun 2024 22:21:56 +0800
Message-Id: <20240614142156.29420-11-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072236_114779_4F2DD1FF 
X-CRM114-Status: UNSURE (   8.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Return the iommu_domain that should hold the MSI cookie.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d08eb0a2939e..969a0ba32c9e 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1689,10 +1689,22 @@ static int riscv_iommu_cache_invalidate_user(struct iommu_domain *domain,
 	return ret;
 }
 
+static struct iommu_domain *
+riscv_iommu_get_msi_mapping_domain(struct iommu_domain *domain)
+{
+	struct riscv_iommu_domain *riscv_domain = iommu_domain_to_riscv(domain);
+
+	if (riscv_domain->s2)
+		return &riscv_domain->s2->domain;
+
+	return domain;
+}
+
 static const struct iommu_domain_ops riscv_iommu_nested_domain_ops = {
 	.attach_dev	= riscv_iommu_attach_dev_nested,
 	.free		= riscv_iommu_domain_free_nested,
 	.cache_invalidate_user = riscv_iommu_cache_invalidate_user,
+	.get_msi_mapping_domain = riscv_iommu_get_msi_mapping_domain,
 };
 
 static int
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
