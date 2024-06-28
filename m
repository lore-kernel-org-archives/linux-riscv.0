Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F067C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydK+aAK/vSRbieVRlMyj0wyjsSotykh+BcHLzMo8Ma8=; b=pldtFMVLrbEDtU
	XeoBH0rCIc3wpP+vOqitpfTkFjd5hdo60N9yx9JKFBAtOvNv46kHoAQcT/wBq2FA2t7RnKVyuZ8at
	SnrGUr91USw5z8HxgoSfR+vNalId+C0cN4y++QytSXtFAY15gcI0Sr67/3YupIy2GuUZMMffM5EkC
	FU0zMybX48RiVW9yYZhMwhG7vvblRJYJlTX32yJi1QnWq4i4OvaqTTx0ifE/aUsoaBvJr6ibs8tMa
	4y5WpTOTCxgR79/2nroiLMUVk4EORqwPmw2vUeDQxBdcyraGxO3SU1LF5/7XLRjJLkZtPOzab7P8y
	hJ/aXJNF3sHo0q6SoLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83p-0000000DHhM-116L;
	Fri, 28 Jun 2024 09:38:29 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83U-0000000DHU3-0Sg6
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:38:10 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7163489149eso275110a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719567487; x=1720172287; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YA0dWEkzXvI8/KpPhKTDAN4RTMFwdU95qGVE5ffUQFc=;
        b=CEBrhzmchGogQSicM+Cst/0YsC5g7/0w1IbxK7+F3mxfhbYIU9Qv14r2xLOb0OcUNN
         2wTc9JP9VsSCW8kb/kawNspB9lLhAIT5SK7gpLtAFDVluzXENy6sL/dG/kfnbVoUpOz+
         SOsTYXu5x5qPu81nCzLLp7MmmOKKe6cE47/HcRBCFlrHfFBMvPz2eGpOJrS/28C+Yt9C
         Bm1GZSDci5+wTw5VUQLjAr8OyQSvVu8k5JDVrg9aJJixghuPx9rW6u/bMg+RZw9C2sSc
         yE5wuuLroHO2UQI+e8Hxl36NL+lnOTu9BA69eEkeshkEj0u9L8cwxEaQA871v86E7h9t
         KN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567487; x=1720172287;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA0dWEkzXvI8/KpPhKTDAN4RTMFwdU95qGVE5ffUQFc=;
        b=GvYyv13MCm5qC8R7zBpTGJZuM9pU9o6aW3FloSC4i72kvBOADNo04Qveyitrqp0vwR
         1p8pxBIJ3KBRSqrb8+WjMNGbdZHvJ/ENSogJ0EXYMsa4tAS+OZdzIxVQNDQYQwI72qJM
         AYMciiyjipfNvRpPnlv/A3P0mQiei8QroilDM2TCtKWQCxxRBbs5gWzODiJ7vC/FMTi3
         nWXwt3MohiEP+PvOCZR4orbD0Dy8cYw0KGGPzeOUjOOe9ln1z7yD1UxCrF5CsDycC864
         BE/m5jiDqK7BWO2Z9+Kr9hDpHYOxWb8R7nvkiDUGRSPCuPdod4GD9HRyMQ5RPPSuK2Se
         PB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRKh3IcYMeC4we3XJK7xnV9OlRooJyY4SArUGAs4qQIm/JqoxreB68sCHuRgOYyTcYtzY88LmoOXOehDVkvmxUqIdmfCiH53J2/H/fCAns
X-Gm-Message-State: AOJu0YwVXr5ohLu9njfJ4aio6cXFx643bklrht7CMq3F1owMmDn7K2PM
	DK3LC/Zeb9hLEKTLOWidzRIAvvnPfS95Gy7O34qspdfkhq2lr+euK1/LaLzqFSs=
X-Google-Smtp-Source: AGHT+IEr7EQCj6dcAAmXxE9nTudy+Q1tr3NBQMPkn5K3OhDpK9au3cIf3F6kgtczs2qpjnr6GuG+cA==
X-Received: by 2002:a05:6a20:6a90:b0:1bd:91aa:79a0 with SMTP id adf61e73a8af0-1bd91aa7a7dmr7189755637.12.1719567486974;
        Fri, 28 Jun 2024 02:38:06 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c6c8dsm11087155ad.26.2024.06.28.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:38:06 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org
Subject: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Date: Fri, 28 Jun 2024 17:37:06 +0800
Message-Id: <20240628093711.11716-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628093711.11716-1-yongxuan.wang@sifive.com>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023808_319322_D6A3791A 
X-CRM114-Status: GOOD (  11.81  )
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

Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
property.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..c3d053ce7783 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -153,6 +153,34 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svade
+          description: |
+            The standard Svade supervisor-level extension for SW-managed PTE A/D
+            bit updates as ratified in the 20240213 version of the privileged
+            ISA specification.
+
+            Both Svade and Svadu extensions control the hardware behavior when
+            the PTE A/D bits need to be set. The default behavior for the four
+            possible combinations of these extensions in the device tree are:
+            1) Neither Svade nor Svadu present in DT => It is technically
+               unknown whether the platform uses Svade or Svadu. Supervisor may
+               assume Svade to be present and enabled or it can discover based
+               on mvendorid, marchid, and mimpid.
+            2) Only Svade present in DT => Supervisor must assume Svade to be
+               always enabled. (Obvious)
+            3) Only Svadu present in DT => Supervisor must assume Svadu to be
+               always enabled. (Obvious)
+            4) Both Svade and Svadu present in DT => Supervisor must assume
+               Svadu turned-off at boot time. To use Svadu, supervisor must
+               explicitly enable it using the SBI FWFT extension.
+
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
+            #25 from ved-rivos/ratified") of riscv-svadu. Please refer to Svade
+            dt-binding description for more details.
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
