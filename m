Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB97CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so9Uvd06s0ZkV1CPUvz/0GMAJOl4KWZnCSdQl5XjJvY=; b=mgB1DNkcdJlIZO
	xlTs+oRMAOiblU07J7kz9wVd51wuld6FcA/ZguRvHfxOLQsXLO+PzPEeTqkhrgvYgciB2yj9AJ7Fp
	A/jxuTTP7NEeQB+EqxK4CylhYGduPPwnnIlbykQKBC0LRu2XTOmtv73FpeLUkyix5ZBxVgOx/2eIJ
	Oy6zOJVyy9qhGNAY/lnBngl8w3fqTPZKzGbJ9DZWa08/h0XWC/eFuBn2CxvFlxoOfmJRsUt+fr6/5
	b1mU76Gwd0SFr0oseKS/w+IqemcYmrEhhwOcl+hNi2Q7mG44tOjcrYIm6RQmCfy5H3xxYR0+YWrmT
	3syATuBte/ssT04idA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fu-0000000Gv5y-00lN;
	Thu, 04 Jun 2026 14:41:10 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9Fr-0000000Gv4I-3d1c
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 14:41:08 +0000
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8419ab3a297so359138b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584067; x=1781188867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDorL60asuHDMnzOwb71UWK65drm8fFQ5Mbke9tzKcU=;
        b=PG6s2TpdvxRIOwxgvzsXH6Nx4S0aqMHpCAJawakmFPX5T1wJuXtMlpz2voqZOvzqts
         Kpn9K9W6KIxqF6dshAxALDssSauNJD5j+zVEIPJ0+eFsCPAO89OnSsugE8ztU9kA8Wvt
         XXNo/v/0P0V5j2u+GNkcFVt02oA52iCXwe0PuhvKjuK5M3liNKX3SNy8T4kDtOFum2bN
         hHcQbmASMWGf00djpRO53EEQhHVf/9jORlfaLBAoJJggwO1f11POSCTQKW5xk9n+2bqe
         jsRjHIFq2NxqvvF+9vXjljBfhYO4CIxE2UbN8fUTgagZhqf9jAtA0AlBwZjIz7S6tXDI
         Q+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584067; x=1781188867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDorL60asuHDMnzOwb71UWK65drm8fFQ5Mbke9tzKcU=;
        b=ZmmupdIixI+xuarJfdgpo7JoKEcIebgr7rlfzFGLNv93rTXXnlGEKVPR5L5dHosx2t
         3O05a/JdQxkY4lgEcPIP1xMmvWotpzQ9/E9ups1li5TKYBphPuS9sOdTMaXoeHf1PwM8
         8le40yO5y7geGcjp2mylxzaLNNmtaXPhqVeI8t6kaTIQhKSx/YVmGUUVOqzwluz8Z8EF
         KEuKGk/UW+KwDHiIrHsHHeSevoa1h0fw0wZNfneuOJeLC5G96vdvJIDomCPmAcs8dbN+
         NzqH+1TCLxjPixHK1+ACwqHC3DcgfyI5yKVVztWuVedbzu2nln1bY5OpBlmSoWTgFnU8
         OeLw==
X-Forwarded-Encrypted: i=1; AFNElJ8SYbRTQ5osNI2B3JjWh4wE1hC3DawYhNOm3ftTWslD2aw27A7nBcBp5Kzj5qFhNHotIjETjU19em6AAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxARUCFbT5v/lD8M7OhE69SScv9HffI/RT3uet4L4CGlPB0sIzy
	sGsT/F8zzjfHsj0VgaGXMII6UYinM6RRsciHMkssZFY7UF43OP6YXO49
X-Gm-Gg: Acq92OEM2gxkpSjHkZWrz3tvMGFW4wb5o6RzxdZvM75JY+fiaFZEmPRtg8MFz/9C/br
	UlkLL9Xtv4B3WvrExEoYoSh7Q64uDESTqpBdJ/FzR+GUmzOIGqZOWF8a+j5UMk6yS8dLFZP2wv5
	PtiTTWM1FUVJc/Bf8trE0ztTSoNvip4/klIZrHVUU8IYpBl3LJ8U7yL6yB+XkUWT/Tc/s7PVesK
	xMMQl6tA1qS7hXxCIqP03Ha+8cxPFkrYUkp3CQukrzbavJctqZca8azQl85XxNFIdtO4wtPxj07
	+9jAh0HgtmvYminPyNaZjOWiv1ZsY8FiU/7CM4onPMScLDpPiXoVPzk3hNTZWF/cSr0ekddnarz
	Y/Cq3CcECsJ/8Y9dAkGhfXdU9OHqD82L/4UJbFYyWRdOF7TtLKuG2AI/SAuDaokThKhv1HPcYRK
	PFDDfDDUwR7zIHuAjWgOI1LNN7HbaIlb3gXr0WhLfQbmh2tcW3VXemOY06WVL6vXSPSqFZ+g+N5
	r2uEmSH3LQ4+Xvxk60xLbUeQfAgzIVNul43t8ehmaKysExWRNYK7bHVwIT95oOv
X-Received: by 2002:a05:6a00:bb01:b0:842:6004:3fd9 with SMTP id d2e1a72fcca58-84284e95621mr8345153b3a.29.1780584066763;
        Thu, 04 Jun 2026 07:41:06 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:06 -0700 (PDT)
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
Subject: [PATCH v2 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Date: Fri,  5 Jun 2026 00:09:49 +0930
Message-ID: <20260604143957.668047-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074107_901515_260F483C 
X-CRM114-Status: UNSURE (   7.72  )
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

Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
core.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..2a57bd14569e 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -75,6 +75,11 @@ properties:
               - sifive,x280
           - const: sifive,rocket0
           - const: riscv
+      - items:
+          - enum:
+              - tenstorrent,ascalon-xg
+          - const: tenstorrent,ascalon
+          - const: riscv
       - const: riscv    # Simulator only
     description:
       Identifies that the hart uses the RISC-V instruction set
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
