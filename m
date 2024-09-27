Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B3CDD1AE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iau4Wpior9lw8T0Ea5j6uokWT2Ua9CLGQg06GvFJx4w=; b=haW94+19AZcNsR
	L7GC313pUDC0e/4pk53Yb2o4nosIwzYoLVgKqe6z9YhIiTHAy+l0fJMotp2W/OHuB7Gt3eEfrDFb3
	zUA+Xo6bHdtkHKgX15XaZg1ufxnXmFYbLLzA8g1MzWSHCD5FNZmjpCN6X/MwNELl0PoOF+tu5CiDy
	MLP3rOB32bNVhNeln0B0zSGCwMZn8Ykww81JBNYU3HvCxkGL0rbo0fpEGVwK+NFXiM9BHZu51wmBI
	R40DfOnCjtxC1LhcNGF4IdCDZJyzUOMz2uhs0hqVZ8U6Mxx8q+H8hlPBfOVk8E4zOBuVgCFOylJ8G
	49/sACBSUlKinzVgrsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suBEP-0000000BKS2-045Y;
	Fri, 27 Sep 2024 13:42:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suBEL-0000000BKOr-1QKi
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 13:41:59 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e0be1afa85so785410a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727444516; x=1728049316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heOXl/D9uF0Q8kfk6I+YarHudo0igxLTfM4r2xKA5dg=;
        b=kr6zuLhD0eHGwD5oX76MwNZo89wcLST5GHjhYRC+NRDWWFNZJn0WoS/zPDLOMzsTF/
         Du91DfhaN8AWVTCqmd6htm4eOISMj8c63iZDtzlacRS0iTKFKzkLGWUJUfw2TxIO6JyL
         hJgksUHwuwDnTxE8l5sfINdS8j+BjZiSzjbQK1hiNAyQ9MOSUNOzTx7K6eiRMHGakzha
         WB5BLYbHlnyVhd49GmjS4PmPWf+5Oqq7KQLYbKKNSTBV3hdo5QNlhvXWhP0OmPT3u+kO
         pi+hZvwB84RmoV2Cz4+/5JOwYEfYyZQlLugMyByk01z8z8hcxfAJ4jlo9mNUKYuE4Kup
         AxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444516; x=1728049316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heOXl/D9uF0Q8kfk6I+YarHudo0igxLTfM4r2xKA5dg=;
        b=abqkFGFXiABk8ugoaPdgzyL8Nx95+FrdlYb2ohUJopjls+inojyZjAAaDNK+l4d3on
         TdLZtj6yQj8JtAZ007LEMmZLN8eSybYaou8TUtOd/jhIZRlsjNGZ0fG2CpwVN14xnj2x
         sByNHzn3QyswuI+jlBTOeesM6AmhpC5FWIOfRenHdLkBBox4e4f1SeTpwCM2qZg/7qqP
         zUf7aJ4BhYcwsTKh74fGMshu0gBU1OuiHjNQFeYeaZfrsKhFd9o1HadZ6mXESu4KptgN
         n3aescpuCSn6mS8Ha0VheDtBn9ShL0v98zqwZhPOV71jXn3eWp5dodK4zK3wZ55zKTnp
         T3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUiwdKSnC9hMop68ywIzy87guNNyB0aYl4SlU7mGwWoHALui9Z8i6fj35+1rTH4X7UfTkNYg1GZHLzXwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg+q2VfgpiO8ZU11uJxLJ5pWxgTByqjLueox0fWduRKzGcA0Oy
	lxMENQEV09qfvbOVvsNo1dIhQL3XgGrBepr3z2+neqruFZ2GO0u6LM/E7SN3DcE=
X-Google-Smtp-Source: AGHT+IH7hYJaqweQXd0Ik6SDG6dxB17+zbF2KpMlKshHRViQMcn4oky0zSOjACzpna2iO4tB6tRi5A==
X-Received: by 2002:a17:90b:1118:b0:2e0:875a:f72d with SMTP id 98e67ed59e1d1-2e0b7985217mr4296228a91.0.1727444516205;
        Fri, 27 Sep 2024 06:41:56 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e16d6d2sm5671744a91.2.2024.09.27.06.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:41:55 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 27 Sep 2024 21:41:43 +0800
Subject: [PATCH RFC v2 1/3] dt-bindings: riscv: Add Svukte entry
MIME-Version: 1.0
Message-Id: <20240927-dev-maxh-svukte-rebase-2-v2-1-9afe57c33aee@sifive.com>
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Max Hsu <max.hsu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=XsOuWsWpqVzpxzz/w3pcnSsgncUk3xwQYitc8ZK3GFY=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBm9rYeTLWAR9pZKiWLummELHNbZhIZQkILgESlN
 iRqIuM7IhiJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZva2HgAKCRDSA/2dB3lA
 vR+HC/9KGdQ6PKTGsSX3TfsLbKKWZ1lFeeifrd/sMimbs4PIFd5M9UlxuNQsYVaLgEWlglc7nuN
 h8MH24n7taE21jwP6HP077oUVr7GxdZlrcUO3LEYz6wgtb1FwNQJxL3YuQVz1dwLGuyjyzCtzcx
 WTR9sIt/zvLe5biK81Gp+Fm1s16mvQ8+XSICFqNVzdmw36GMnBWiyqjYeFlDxYqAw3aloe/Fgpm
 3lQDhfOEqhLC8IO7yvzvmnlVqQMLZMIaEgbtEKoYID9SrbKL0XtpFOHEcszDpota5jhKa3kACZq
 SnQfLEbRqDqhF7GL1WJqAYDUAhP6sVtH0XSh1ybvPdBtB/bU7An1vNxUSFCN7YgI7keeLDxQ/Gg
 /POODPG+Td6PjxCCrw/yLzMGSk3wcKQqspqSSBjsCmXITT1G+VGp8HeZbM0YKzFRPb+WGo1KmvR
 7GyKrrCfNj3x4lJUNwCfR5pVaPot5O2a/RtfucPg/03tRk8HLU0ZXc03zdqHDxv0Q1pdw=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_064157_660790_F76D3746 
X-CRM114-Status: UNSURE (   8.32  )
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

Add an entry for the Svukte extension to the riscv,isa-extensions
property.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff574d39793157418a4d4211df87315f..9f730e3aaae949debc18396183b989b504dcb899 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,6 +171,15 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svukte
+          description:
+            The standard Svukte supervisor-level extensions for making user-mode
+            accesses to supervisor memory raise page faults in constant time,
+            mitigating attacks that attempt to discover the supervisor
+            software's address-space layout. Currently under review as Pull
+            Request number 1564 at commit 81dc9277 ("Svukte v0.3") of
+            riscv-isa-manual.
+
         - const: svvptc
           description:
             The standard Svvptc supervisor-level extension for

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
