Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B7AC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZPsTp2BzmUZVF4NWbTF+/+vGMt3IVW7P1lYGQc/Sbo=; b=1XNtmQAfuiLVch
	m8juWl7n++8p70g4JEjAaLByQSeA5JWtNhntP9vWUdaT8/tz08I9hrZJejHBTUzuiowMemAEAIClU
	mHU57fHLbth+SJHHCy2sqRionGPWndak2+xQRHYsuDr9SEQnkkgzLvDUQE5EJGqQo2YgTC/4WmhI2
	emPRHSTEwTF4J66tHAUDIpbYkaaiOVTHsz0iePMKMsm97LC/UKexDVJ58+EIa8bTuh/kjGVECQVHP
	nRFupr3xPTpIe7cjsFMRniLcoyqN8AUK+mH59mctH0Ew0PAGETvNzep7HXXmWHRSEZf6W4HDJdWrX
	r+0j+aeQqI+kzoEkEGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGn-00AdBB-RU; Thu, 13 Oct 2022 04:56:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGe-00Ad5T-6d
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id l4so805749plb.8
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rk8RAstGXC8ZbSam0s9PejkQaDuIrmjFAwUR4XuoAmw=;
        b=JT122q9TUGKEWKDZ5Zdx05Xgtl02rc41DhwMWlav7WHLb/zu27l6GM6k4Dhgnsq1VH
         R6fEBYtZ1jqfQhlQlSfggLeIseqknXAhyF887fjd3gIwU0pia2gNmfjQPEVR0OJC7tey
         izv9ZLNJKlBuWF6z5AZJmPoxSTugTBjb6m4ko9LEOeZGdEQF5pNOxv5ftisFfUuJYCwu
         6CJ2rvtEI0Zj/bDGdoDvAlfa7BQJ2Oyjs1TC2x+jOpGdICGgICOQlFaFVnwxOU08Z7jT
         nnH23RliWHwX3gADGztgAW8EOQuhPMlti3KfWk+dBQL7xnwdvjAjIK87RXWMME5RFQI6
         NSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rk8RAstGXC8ZbSam0s9PejkQaDuIrmjFAwUR4XuoAmw=;
        b=AyUt7eSXxDQmFF+Yq5mNTjqxsxBLPW97xf5zhYVIzQAuGltuoYBzTG6CN5/2D5UMip
         OPI7YvkG23MWuuxDgdsJ/sBCING+M8EEakP9/u3Y2kPnaVpADrSPCJPPjDzBgIowovjd
         ZJePLWh2XYnGpz2DUs4HD9rJARANxuKK4IqOgED5H3ZiC3OdfbppLwyTbf4uzIH5gYZF
         7jBQZTWAoUefBu+iissCntux/3ozGFyCw+RDCz0eHm1kkLg7zDIVkWzKgF4FZq7+42jm
         e9N/toBvhOOaN4b90x6Nj6MtRXV866uf82dRuCk4cAz1KCnzD0F7m18MCR+4fuLW1Vzc
         OGTw==
X-Gm-Message-State: ACrzQf1eyHZLaiayLFyO+CH5sJ0/ZB0PUUtk/cLZ4Nq/7C4o37jQDB2S
	hkjRB8xPj5F2lMpqW05NNLFxaQ==
X-Google-Smtp-Source: AMsMyM5F0h9eYw/8XNXdOTmUVffdoMjJ26ztkg8Ox/kwhAVa7RpNQK84+OVyEjtjoFX/fsFfPmxbkA==
X-Received: by 2002:a17:902:cf11:b0:178:29d7:4fbd with SMTP id i17-20020a170902cf1100b0017829d74fbdmr33482977plg.174.1665636982799;
        Wed, 12 Oct 2022 21:56:22 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a104800b001f319e9b9e5sm2241272pjd.16.2022.10.12.21.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:22 -0700 (PDT)
Subject: [PATCH 2/4] Documentation: RISC-V: Allow patches for non-standard behavior
Date: Wed, 12 Oct 2022 21:56:17 -0700
Message-Id: <20221013045619.18906-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013045619.18906-1-palmer@rivosinc.com>
References: <20221013045619.18906-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
  Atish Patra <atishp@rivosinc.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215624_304658_40E65823 
X-CRM114-Status: GOOD (  13.31  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The patch acceptance policy forbids accepting support for non-standard
behavior.  This policy was written in order to both steer implementers
towards the standards and to avoid coupling the upstream kernel too
tightly to vendor-specific features.  Those were good goals, but in
practice the policy just isn't working: every RISC-V system we have
needs vendor-specific behavior in the kernel and we end up taking that
support which violates the policy.  That's confusing for contributors,
which is the main reason we have a written policy in the first place.

So let's just start taking code for vendor-defined behavior.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 5da6f9b273d6..0a6199233ede 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -29,7 +29,12 @@ their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
 performance impact of adding kernel code for implementor-specific
-RISC-V extensions, we'll only accept patches for extensions that
-have been officially frozen or ratified by the RISC-V Foundation.
-(Implementors, may, of course, maintain their own Linux kernel trees
-containing code for any custom extensions that they wish.)
+RISC-V extensions, we'll only accept patches for extensions that either:
+
+- Have been officially frozen or ratified by the RISC-V Foundation, or
+- Have been implemented in hardware that is either widely available or
+  for which a timeline for availability has been made public.
+
+Hardware that does not meet its published timelines may have support
+removed.  (Implementors, may, of course, maintain their own Linux kernel
+trees containing code for any custom extensions that they wish.)
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
