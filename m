Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fo+g2e+oiO/lyEqgK78YBY9PATwA9hbKxc/Y7ERTx64=; b=GJMNDO4j5uMFRR
	6KiSr5cwnRwxZX70VMYil9wocrOsMM/7CIC2Rshnjet9xD7bYqS+UDTo1AjatakUBzWrszus2HhVH
	s0mJTE0lXkqV6VvgsfVT3Vq9n/62+aZOKpRS9zJyIso9OQKNNisRSxZCCs+Rfvc3tt+TawgypqOBl
	fq3l+BAzTx5jYJ2PUe47wSzlhta4STkXj46iZD00J7+OkYy0dD/LAq+VsDY2G015IeAzOtK7SNJDR
	YKbWHA8c6e++EoUWbD8j9E1/3TcxTwfIBK8USrSpRM0VXXCQu4TJYxbUMVE6psl+1Oei1RSSIAZu6
	liQeJ/v+W++wMmX4oj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1pE-0000000FZfh-28wq;
	Thu, 11 Jul 2024 21:59:40 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1pB-0000000FZe8-1EDm
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 21:59:38 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-25e0c0df558so667577fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735175; x=1721339975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCuLk9WlsPMixoO1aEt9S0RZ/RHTTquN74ekSzN2Uos=;
        b=UnCid1EsohZotIUzkhSxhJMGMONOgpAqEQK8WvLcamAqc1NMq9IcRfLiMTZj+gX3DB
         qw1lU3lJC1OwPwXnJTbsF6Kip8tp7cAeYt3PqOoZHWt3SA6dykodVYoZk9vSsxTl03Z9
         jJb+3c9ULcHbbcxN4+7Q9MXRNoRR/Fvb3d0+8pNfsMObqwrBR+e3xHNGHJcmWCvdzcXT
         itbDe/sGJj+rxQNVVfNyYRf+VS7ZoodAf9EZmIj7K760+kR02stuRWwSrAUnvuAECzNv
         k8sIoVhRG5IhTuxG5RSDxSiIhVVa/X+Yh/lF2xW5REtmqUs+/be64lpIPfP67T0TMSzi
         xZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735175; x=1721339975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCuLk9WlsPMixoO1aEt9S0RZ/RHTTquN74ekSzN2Uos=;
        b=lumnx2wupmYxnxTr+9GKcWmPIzKaeVlclVMGdESxdscDSQ0cVip1K7qdCIjxkqTnF8
         IWayDdCsQAfL2SOnuctBuKf0WqKjMPeO0GW5zoRHA9ykHoG7gdQvJV5LISfQsfUqcNhB
         XoFJ6MdggO4MtQTlk80VCryMzfh7ZiT+q9Wb8aTvI26dsYG4ChsaDH/7swKFBNdcjmZk
         l95PQHTDa5K7NAaJh+ppB2u5dyER+aaZqpzBW/VcZDh4eX6WldD26+0m1HIJEE5nm+Yl
         rqLMwvZnigGxZrLpya0qLtRr08VfWpcbjDZZtgKPblqHBe7kjQCq1rjbfyQHXyygs1bM
         d0lA==
X-Gm-Message-State: AOJu0YyDfCEqd5E4OmfumjN77qcDIraRvNfgon46R2jgm9LCLFH22Vfh
	AdMf6HGe0tgGr0Mvf4lqNJVp69/WPq1IPodaCfGdSnR60Ac0wbaGU3nH8Q7W8MyvgVhArLpOfjn
	9
X-Google-Smtp-Source: AGHT+IGQzKvzyOpT3WBbfYdePwka94nZlful/AlQ4IvVGo33wfS/hf3/5q08XSlYkvfuRY3zO/SpoA==
X-Received: by 2002:a05:6870:d8ce:b0:254:6e4e:23d7 with SMTP id 586e51a60fabf-25eaec3cf82mr8869452fac.50.1720735175401;
        Thu, 11 Jul 2024 14:59:35 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.14.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:59:35 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/7] dt-bindings: riscv: Add Zicclsm ISA extension description.
Date: Thu, 11 Jul 2024 17:58:41 -0400
Message-ID: <20240711215846.834365-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_145937_352152_06E23606 
X-CRM114-Status: GOOD (  10.07  )
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

Add description for Zicclsm ISA extension.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - No changes
V3 -> V4:
 - No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..9f6aae1f5b65 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -317,6 +317,13 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for misaligned support for all regular
+            load and store instructions (including scalar and vector) but not AMOs
+            or other specialized forms of memory access. Defined in the
+            RISC-V RVA Profiles Specification.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
