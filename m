Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5453F10F3DED
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/HnWJYSOKO7MnABME+1/ziyVc2n8dSlCAkPB4LD8YI=; b=U+xYgDBYa2J+QY
	IaqhjoMkwvBDxI5JtJ+EO7LpyWW8mBK37r68eZOP7p4ZK/wlMtEw3zOvdoVSgNCEHdOEVuPsU3ntd
	V2U5/zddKd4Sb63Xq0QcTcYJCpPKeYk7SPn0XD5nYzoANEeDlo3lHD2wCrwI0OtCQBm7gInjDRU/N
	vOJa91QNpvDPKw6jMbDl1uzsQgy3ytVqXzTLi6UDUWb0VfIe0LqnYVzNVikPxlorVEvjFaVdfvW1E
	dDn4FJtRobkdNsF0BOn4Zif4GVp10fUFgybAOJPv8EVaTPTLODvHbD5zxvsugtdOf/WNlg6xOzeZb
	CsiB7f24+/MBr+CANqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbf-000000099ne-1tPq;
	Sat, 28 Mar 2026 17:37:55 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbd-000000099lt-0Nq5
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 17:37:54 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50912a097b0so18740481cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719472; x=1775324272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=AFume9M+5CFVMrRk92qG5D8nm45rALdSKVPFDqEI3zvGHAANZICO8bCKTcyMhbH5kX
         VvkVXZHhlk+azqeTktdQ3b0JasmSwdLOpsfmK5xyZW+eKXBsmDgL8IkyacSbanXPUfPw
         xwme950DkGFcxMalUjiH/Epw6GYOojAQ/t5LrDTSVXKqUPctU8auoTEuTTSAXAF/C+0n
         z1JNBvelSuHBMbmdyf57vSwcmWEGS8sVR13Im2Mu0eymLXmndQYJNjW//faTfEzzmYx4
         +90di75KqIA6jcFRT2rqBWk/C8ovT43DpF1UPuO/zWYxKAvIolvAHR25UzMUJhab7kSI
         /cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719472; x=1775324272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=NSgbtaR89WL4wZpTJMvADUiEG2kjWX6tjkh1I4gjQq+dciLSigiqlIxGLsTNUm5mTx
         +v9sn1wSyHA6NE7dkleiopckOrsSarRKZ9i9rdq/vCPHNDhz9HzxlfFJiq7n8mK4lxag
         8BDCfoqip9CbDLeUuUYbe6YSjey62DPS0ILKmWemNqRlvkA+AZZEUhHjTX+PG/o6KKcL
         S+l4au058YSz+ex5suaE1QF8aK24LNekFhPekXXRyrbmzYUrTaevJCZY5GX6cUlMjFAY
         PRuG8QM2XRePoeEMQnvU2zVo4OK4hJTueB7k3t+g+qIwoTTaNQlRVtuPPin8Qs/aPA0F
         FoAw==
X-Forwarded-Encrypted: i=1; AJvYcCVcTqFX0hhtQuc/+5AGXW4r9uX7z21vXNzCJhuZwktwdtxqHfZbxlJGmB7DBtxSYVm3JmOBESHPRu4P9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUvGRJk4bCL/5/GuMdmFYcWdhD5YkvHDlPEm/BQSF5ASZwv43I
	Ma7rfGBOk/UutqjesKqHl+3Qa2TVrb/d+rCyJtn9cYbvOYWWU8FEYHr2
X-Gm-Gg: ATEYQzxKN/fCvyCggZgG6upciffLiY5EysQnVmi2CJRD4NSC7gmb6TP7E21JfJ8A7Jd
	q37b3U2AO784eXliijPFV8NHPDIRGXWx8QcpFIpMOg3zM0+dnJq7/ATzkbUgYIVe1uJTYHasQts
	APEy+XYrJFITyM/ZTjz9bN3+AutsWoGgN1rRbUCwnGTMdhCXMMZFdPodBwkLpcTJ5fO3VrdsYiJ
	yRhlgYWtRZ06klXZrNygNPVOTtcLtatM9JQcnfEefUuaZT89Iw6qcjgKcyYcuhqTHJRn04X+hi8
	j3nwNtnLHFQ9uhVMXZvIPU0kYxsUKwOpNeGhTUXgvmPKDXAFEEZ5KXT5vqLIU37stKX3pRjkJyw
	Q2JG0/cS1UJm1JEnbyb0fHntXjD9nTxaIyLwTT5LxeqdUJQg7MyYaHGqyz3NH79SO2WcHRtzxk+
	Ee2DukUKHRDUl934Yy4/j0VtCRFDm9mMJ6Gg435N+ezjUeRONLjmumTdCt
X-Received: by 2002:a05:622a:514:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50ba369ec17mr96131411cf.0.1774719471720;
        Sat, 28 Mar 2026 10:37:51 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:51 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v4 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Sat, 28 Mar 2026 13:34:48 -0400
Message-ID: <20260328173450.219664-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_103753_141795_0E578416 
X-CRM114-Status: UNSURE (   8.13  )
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

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
