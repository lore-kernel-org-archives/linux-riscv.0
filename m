Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14ABC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/JtrbL4av146Ucrcgw53JiXHcnv5tSDXKjUyg+U+qY=; b=3HSaADi+zxC6Xr
	qDWfZIsZHN+wRHIFFx48pDzo2pu3qTtZwh/ayzu8xrRvQBWhhPItXZ+UCLFmqyBpmDcXqnFlpiJ44
	qwjWyEC3OdDDIek1o/aoXupW8Ja/pX46ovKNpuds0ydEPJrC07bFs1i0/MeGF5gTLXtTx1VFIah3l
	MTg2imgV1kU+zJeWrOQUyr11UFmUMAtLG49BSdPvbgkXqUL2k1w/YjtfUfI9zohVrKr+bStTU5oLq
	Iw5V002mvTby3hFI3KbIIGsl3wX68CgnLWVkQNG0OJa9umfSRLpqq8WUrWfqfmP/ijKFKO5C+VD28
	U/k4rXGjOxq1+dwJrHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sATNx-00000008nwQ-0eoo;
	Fri, 24 May 2024 11:46:57 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASEr-00000008g3l-0nWs
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 10:33:31 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-681a4422f49so514193a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716546808; x=1717151608; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3SGsbWgTHauNPsqsrqXr871vIXrZYnzi0FhV+x1ZyM=;
        b=TJHqiJLfo8vAeyzpg8dN836Ko2op0gMKJRidq1Ow92fPV/zxnkJIMh5HCCE2vQGn7q
         lNDTqahPXVTt/KeU1MWc++ShfGdXLuDZoNDNzvL0Rbn9LJjN3VjXOoIx8oikHr7h8tUa
         5+ZrAynFB8HLrB6a+rmZEQg2dGGowNntZOZbVZj/rGyQmN9EfyVY5fuhrynnoTsBUvVL
         1ZzOidWF0D11qW++gRKTN+B7rudK0cRuEYFGw51kvesFgjG5kYaAir83og1owyyTicCS
         1ymEXvsgcgKTWKfzx11g/DxxBmBJlAXWFQqd7SHf4cC/aJDcQYZ0Lfzga+O2u49FdIor
         aiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546808; x=1717151608;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3SGsbWgTHauNPsqsrqXr871vIXrZYnzi0FhV+x1ZyM=;
        b=nMAFw/l6a44e6o4K6udLS59dcRTo//1KJG7LJc1sPOhqQLtKRder2TI8B+2u3EmJFT
         5YfCCUwkXlGa7iyrmbv2RapOsVnnWy2gd+wXUpHi+KhMNU7T/d8WUj6jRyhoAcHeVRzU
         GVz/dN/bfq2dEGA7UuHUjDIlnvI3z8r4PbL+rMnIkZ8koi/OPXGpeZA4B6+CHOFD7cex
         XBzp7KNI65YAmy6zz5MpWdObgxv34+sRl9gL+yJNXzxOohwUJ+fywn7afcbZXtNElXL2
         MGJ1K1i8+52ta4WJ7wRPqmBqq3sMfV9WESkAk7Tc0vnBA3JKEJAQD1YPpn4gzVD89Dft
         jYuA==
X-Gm-Message-State: AOJu0Yw2Tg+yQNrAfvWMpm6NqAOumbO0vvweiPAGhC2M8MgW7OBuXwe6
	dEQqySz3P3vaPXKsjKRzKflyK2Qup6agrz7n+11KNT8iR0FMVHKks+ry9+v6tQI224tzZqo59Y2
	ARtLpUOv4rwwq0ITGwYFaivZj9nyLOuEUA4vQzF3KZGWZDLVpSeKIR8C+fNG1ZhjDaPg/0BfaKq
	s8yiVy5Bjhdv4KItHo2jHaEiwGudJBdLLALZOVBRj+gSFg/eqqKJE3GOs=
X-Google-Smtp-Source: AGHT+IFEjxRzuXtqnwpdjXGqqrpyzXepAeYnCHRfGHkAZfMRQCAGjZk7T+Jgmy6wAMTVGHMbBmV98A==
X-Received: by 2002:a05:6a21:2786:b0:1ae:3f36:28cf with SMTP id adf61e73a8af0-1b212f64d53mr1876119637.56.1716546807028;
        Fri, 24 May 2024 03:33:27 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c756996sm10936625ad.8.2024.05.24.03.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:33:26 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 2/5] dt-bindings: riscv: Add Svadu Entry
Date: Fri, 24 May 2024 18:33:02 +0800
Message-Id: <20240524103307.2684-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524103307.2684-1-yongxuan.wang@sifive.com>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_033329_285943_3C1A4996 
X-CRM114-Status: UNSURE (   7.75  )
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
index 468c646247aa..598a5841920f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -153,6 +153,12 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: svadu
+          description: |
+            The standard Svadu supervisor-level extension for hardware updating
+            of PTE A/D bits as ratified at commit c1abccf ("Merge pull request
+            #25 from ved-rivos/ratified") of riscv-svadu.
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
