Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C945C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vC1wjvlC4rmI4VWmyQPmNAKuRg5upwJdzujLT6CjETo=; b=tQSBRzYZ/QImw4
	vL79JFqQyKkOp0k6a0v1hEuG8bquX94dz0dwMrv20yr+MscLSnCibXRxb8ly2OSdnwtLt+FE2Teww
	O02jUdJORXYoVBl5JC3EQVb+S37fKJ/KB1vkYMmV15rcZbjG7eRUzKmYVUHigQcEOiKuIu3eg88RL
	QEl2IpvOk9q06WC44GiOWLMlP/EZD+Q/JtuB7VSWNBGJJYwMgfL+VyLDuGSeTP8C6UhSoFuikuMyG
	VUQ2hFh5nLjHoRGP4Pu4pupDqK2ubuWzHG7XB0PVKiBihKoPOmJmbYk+G+ahD1gLXAdXhU542sDhY
	js46ov2YANh628XXlnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOe-009PJ3-2L;
	Thu, 02 Nov 2023 12:02:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOZ-009PGa-2O
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 12:01:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c0f14d6875so860262b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 05:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698926512; x=1699531312; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtFETPopYL9qQsqV12E64PSYpI6sEe2ykn1CxLszp0g=;
        b=QJfkJYizo+0uluHyJvn1qy9YF6nPjOQq1KDlODDKr8iEMPs2FlMHPIyC1/Cpup62KO
         H18RSfimmfBoAriWiC3j1TD9Dft54oGPH8ZLMZ3vZLmSXaSMopq6JCV0jidy/abFzlvT
         Liw/AZ0r2Za5hH9BIWyuQFN7IwbA/It5YOKghrB1+CbBFiOJFVeq5SXF75V0l9qnNuqu
         J3Cb8kPQxvJ0HRAzhhdTfmRRlTi5Q9wAsrke3iCgFA/MkXB2R+6TBcSvnhXTnq2ojVRG
         zfyf+chiwqHD7gj5Waco9LGzs+g8Rgl7V3tr/9wxoWCVw56k0p0RDNH5g0nU+ojcGnrs
         v3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698926512; x=1699531312;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtFETPopYL9qQsqV12E64PSYpI6sEe2ykn1CxLszp0g=;
        b=IXeBQhzUOJ8aLJNBwvChN7Bntl+w6f0zMjNjyEzjPX0/yLG8TnyzF2R+ws6VKSQLAs
         5MFLH9Jux7DkKMXl6liu/wAwzuww4GKq08J5/+dfFrhCoxMIXhKjxRAQhRPdJUtURAIF
         KEyZw5tl/CTuk+UWd0RnO6e//aeqIFFmOqsE3+UujF0k04qoAi/fLv2uHiTbYqd9r5aE
         oNgJ1xIWv+Os9Opm63c2HSqOBSzodW3iIkVoAqNb86H2JLRICe+5PMdlAwrE9YBowX+S
         X3ut4tBeIKsbOjbjGmgXDzzhg3XH1nCOENRXkaYjo7S/QiU8Kjd13jvcYGoVFnB0ynT2
         dXAw==
X-Gm-Message-State: AOJu0YyvPn5fbV0VfOSkcR7VR20eVN4h74CB54YbYxADqNdopJyZTAI5
	SZ7iGtXK0N3RUN4gNZM/AhJMUFCyhdJ6L+SsHpjQy+ncDABJ5PT61ZMDLZCAkY3sqq0stQ11Dix
	eg1gxOzq0XcMB7/4X6/KY35xpm0Nmo83QJuMw3dFVtWzpKkD5LK4w98FSW0RhNmR38JoJHcdF0r
	tFwiZKXr0GIV53wiruZQ==
X-Google-Smtp-Source: AGHT+IGLAFMFBtszNocU+qASkTznimPTF67YR80XaS1rd2vj4mW97ZI7ftQbfZbaIOnyHp9z4hHfiQ==
X-Received: by 2002:a17:902:e5cf:b0:1cc:3c6c:ce23 with SMTP id u15-20020a170902e5cf00b001cc3c6cce23mr13093008plf.42.1698926512333;
        Thu, 02 Nov 2023 05:01:52 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b001cc0f6028b8sm2969008plg.106.2023.11.02.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:01:51 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: riscv: Add Svadu Entry
Date: Thu,  2 Nov 2023 12:01:23 +0000
Message-Id: <20231102120129.11261-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_050155_781008_7A065C6E 
X-CRM114-Status: UNSURE (   8.75  )
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

Add an entry for the Svadu extension to the riscv,isa-extensions property.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..b5a0aed0165b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -147,6 +147,12 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as frozen at commit b65e07c ("move to Frozen
+            state") of riscv-svadu.
+
         - const: svinval
           description:
             The standard Svinval supervisor-level extension for fine-grained
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
