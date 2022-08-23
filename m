Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881B3C32774
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRfoZn3h3NaPfx4G9J0wO1NrBQkEJemwi+BFSqsCLd0=; b=cKLs0oqzf7Y/Ui
	mWaQL7qAo582MW6Q/tTs3qd+KIDjAnPua56ff4RR8F4K+zOEvxT0x53nsYnHT0x4VvGX2VgKmLVy7
	F8DK2dR1TaZrk3Yfd10/BzXCoOHIuPhgZLQ5tPeqgdf28B19XJdmzE+Y1wYn4qtRK7ss2DX+R9xmG
	US3O9qpgeGpzD4yvF6jdq5Wa3yMwF8Smb1A//xVu8F3wxLbH8/bRgsI5w0Ge2AIKZ02h9Y3RJJ475
	dnvee1Zv8b8N/1DqoiI8Vkdb9lkdzoXqXiTi4cuqbMMQ0KEiq+K4q31MF/79KiF98bo69X1Pw2DT4
	wMHT/sbdGfu20KcRiyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYj0-0084vX-Dz; Tue, 23 Aug 2022 18:34:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYiu-0084sD-PW
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 18:34:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so1019773wmk.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zfZqIEnKLgqKdt6yEdOe5gINIOFbq6xfPYo5xvbrixM=;
        b=f5pjcIK+H2mtPPE5b3VybQ5o01iECTvnw1E+28BxIUWO/6RjUzl2PBeS9opQx/sJtx
         yG2ysXoQtSd7WBzuZMOdXnT8YJjxr3vYR5+T/JX7WViSSLLzyWulBQl9Ko9BJ17LqXeZ
         ETGaCTo5yarZMm+oslfXmcNAi4epItnAZqaBYIMkIQm0At1DRkfT+iDb+SfVqSxBugml
         /5ZzzSEfTKoyNJSdvCwfE6CeTnMSICRVyM7qDc7zTPhZyBfqGkmjUnvVx/itr2tPYaA8
         ONtGo4StZVjqqloFXAtoKHXtIcn38GlQfWO7p9BYujiPWphKMNU0v9xU6g0zgzl9njmI
         LYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zfZqIEnKLgqKdt6yEdOe5gINIOFbq6xfPYo5xvbrixM=;
        b=H6IUyZwjOKgzqfD9ehSq8JPRHte3OtGuXw2pz4TRs7cZbFPBVO/Upz8XJoKHu3ZXeE
         eA9coaT2LwX3uxoAMguY87xHrhmfqx9X2sNUHOUc8TahRJUijHnP2hy6d5eW+ObIZbe7
         pUEDmkoX7EhcLmsSlJ6yk+Iyk9qdBrP2Bw+W4GxwgYf1f0Ft1ifVU7AfPhs2XetU/aQ0
         7801gt8BmZ1/cdHEpygP+v/yW2JMRvnBMDzg6TCeEG6ydXxcZnWhBv1hgNJWOQ47m+No
         /Fb8iGQY6c5XXlSYUWcUFtB+5Vs8sptynTZLSistGFjMwpqrlw6/95WwANd7mvr3OPU3
         IW+A==
X-Gm-Message-State: ACgBeo3AJNQ5l+Mn04dASSMqn8JQJlXsOdvkqZn0+u4wLhBc8QJVCfXN
	2IPgM33/r75XalZQNVFxaWW+pQ==
X-Google-Smtp-Source: AA6agR5eS5/PKXnK5uN2L+sdbkehjdJJ73byQpKpkqsyKD/rDgN0AG98DD6sac0atiQVprDQeVTQwA==
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id f26-20020a1cc91a000000b003a638bf2c36mr3062339wmb.38.1661279637684;
        Tue, 23 Aug 2022 11:33:57 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:33:57 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/4] dt-bindings: riscv: add new riscv,isa strings for emulators
Date: Tue, 23 Aug 2022 19:33:19 +0100
Message-Id: <20220823183319.3314940-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_113400_853930_6829F8FA 
X-CRM114-Status: GOOD (  17.92  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The QEMU virt and spike machines currently export a riscv,isa string of
"rv64imafdcsuh",

While the RISC-V foundation has been ratifying a bunch of extenstions
etc, the kernel has remained relatively static with what hardware is
supported - but the same is not true of QEMU. Using the virt machine
and running dt-validate on the dumped dtb fails, partly due to the
unexpected isa string.

Rather than enumerate the many many possbilities, change the pattern
to a regex, with the following assumptions:
- ima are required
- the single letter order is fixed & we don't care about things that
  can't even do "ima"
- the standard multi letter extensions are all in a "_z<foo>" format
  where the first letter of <foo> is a valid single letter extension
- _s & _h are used for supervisor and hyper visor extensions
- convention says that after the first two chars, a standard multi
  letter extension name could be an english word (ifencei anyone?) so
  it's not worth restricting the charset
- as the above is just convention, don't apply any charset restrictions
  to reduce future churn
- vendor ISA extensions begind with _x and have no charset restrictions
- we don't care about an e extension from an OS pov
- that attempting to validate the contents of the multiletter extensions
  with dt-validate beyond the formatting is a futile, massively verbose
  or unwieldy exercise at best

The following limitations also apply:
- multi letter extension ordering is not enforced. dt-schema does not
  appear to allow for named match groups, so the resulting regex would
  be even more of a headache
- ditto for the numbered extensions

Finally, add me as a maintainer of the binding so that when it breaks
in the future, I can be held responsible!

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Palmer, feel free to drop the maintainer addition. I just mostly want
to clean up my own mess on this when they decide to ratify more
extensions & this comes back up again.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 873dd12f6e89..90a7cabf58fe 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
 maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@sifive.com>
+  - Conor Dooley <conor@kernel.org>
 
 description: |
   This document uses some terminology common to the RISC-V community
@@ -79,9 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    enum:
-      - rv64imac
-      - rv64imafdc
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
