Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1857BCD4F37
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUM0Xk7rY7/8/D+6YTzJ5Rr3jvZ/0z8z+jg9QezWDZ4=; b=IWOOqIfKqoumg/
	yg74DpXuaKnonwRFd/Vf9ExvIClXS+7cBs8oexcIcpXnHjO3n0YOGxWgqQaX4kHqEuPdCDULIlXNB
	V4knJtEeNAYvsRTJyqy4IcwvCQ2tFUx/L5DL9m0VtGazfLrP1qqG3ZeJt0E2iOkc2rh8g3SLg8IPq
	U1dqObTFXvXQJdWO6iUtwnGFityC7EZ3u3jkXg/wNlWcF9DDMh7kGkdTPG9XHwrV3e5bwjcvqPswU
	S9TFCk6rRNtqc9QvPeW66OV0EdB3NaOuMoCEPzuKnjqr62d+OsTVuOjZgEp3gxel0F7lkWyMRqseS
	JoNi/YxKIwdtQYtHubHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQz-00000009k7g-0rzS;
	Thu, 13 Nov 2025 01:47:37 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQv-00000009k26-0k8K
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:34 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297ef378069so2425745ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998452; x=1763603252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmm07HI+8fQZ9dsXPTz2+pE8ZdXEYclRtD5hDrzxz+A=;
        b=JOyC2nBepZTp4XIAaOog5mm08Eji08UrZYh8G2d1b8n1WAMHE94hgT47GFH963Si06
         wlhgXianMTMlGmLkigMEqqjyJ2ux12Wff++ICtKg/REXFIAoJzIkxz8jVxuhERbyz/hq
         HJTgTIG33ataNLZFuI0iVrLtT2bMvDOaVG68Dv4mCGLwxgr3pBd9vY9UNmypay/01CFs
         I1BxH5I88pqV/NF+Ok+sPcxwcX3Vlsypu22noxwLHcK64GrTDMJMz6F6lHnT01A9xnNA
         +noQ0CbQT8OweMi1/hJ7K98onpWcu1K1RDspZyhRyGjMEp7Qkr/INaKwhRGYngaNdMxU
         JrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998452; x=1763603252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmm07HI+8fQZ9dsXPTz2+pE8ZdXEYclRtD5hDrzxz+A=;
        b=aUv/PFbo9Ng0UMTT5zKZLD9/XvIhT+RLyJ/8ep6XCV9xI7uPbg1TRi2i15eqIE5yP+
         gOsTRpJ49vxGs4ygGe/krbxzM+l+Ek8nnA2/rfbzi8ZuEUnvYA9BTIJxAs8GiENciOe3
         sHoWJBhHe5evb2Yz/kpjKEeC4Ovf4bcQv9HKkNf6Il57AWaXYvkq830a7j9/E6oJyKRC
         DGazGVBSFpHAqsIYR6r0b7SImf1p4BHGng8Tf7GXbU8SbHOsnYG7p73285+JUtskm2jK
         SnnnEO5uiv7Bsg1sEQSYwBe4A/Ek+jMRtAx6uYIOJTB6FPpqJh40B8yQka2tegkfcnug
         6ffQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxqe547LZ2wbfclS8CbagCRZKpppnpPE46U8MXOqk3C9vPFGNYLQlOdLasu3A21ppa3tHUdGIK3TPDeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YweVxXBnVRVlDhBDnVKkmm2DmPLt3BA6hKGG3pnrr/kGLNXA3B/
	H1CdWWNhS+1lZeCzr/xpEAFCcsuXVAO6J2CdyeP8Bv7UZOrA7gdKJMPNoDjPcKzCLTw=
X-Gm-Gg: ASbGncufVSJQ2rJNnfPUwgJvsdVsrINhlXrEp2vcwSEa2ZM+QUT9HrseMeUHozJGRV8
	4aQQwds0N78wBNZMrvq2Q8+5WgJr5l3BBr+N7vN96hzpSj7CQXfCog5il2H3klh4YA5ZC+4eSs8
	8LaEELRiG+B+hI5hNH8ymYFKW69+oZb6gd3qvMQuWG4Egj7LdsQBEzayA9OMSIw8Z5yvVCXfRuU
	PAxsSLseWkZ5VUEWyF4k8VzrcscyS9wsiJPRQ2s+LcXmELPHip7ZgyuFjFGJaN3c0WIWkOQACyy
	0L1y3WZg9F9NVIZ0CUKTZ2KKFnt6Uh+lHuYS+34Fa4ruwvX5LXJ3OfZRB0nEV/OTKBclgI9zmNg
	MvnBLCTUi5i20YQPhtJGHJEd5tw/2MVykxwW8UIfrqYGD9WIRngL9v70wBnp1L2WspT2CNjRQ2P
	qZiyW2vImcNiZvbcLb7wSK8w==
X-Google-Smtp-Source: AGHT+IHJJ32S+3DmD1CuHHRA6pREy7usForarOqF2N3irQZblubt51Eou/L7IV170eSGC/5u/UdVRQ==
X-Received: by 2002:a17:902:e841:b0:295:86a1:5008 with SMTP id d9443c01a7336-2984edec288mr76669175ad.38.1762998452211;
        Wed, 12 Nov 2025 17:47:32 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:31 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 22/22] riscv: dts: eswin: eic7700: Use physical memory ranges for DMA
Date: Wed, 12 Nov 2025 17:45:35 -0800
Message-ID: <20251113014656.2605447-23-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174733_308667_C67B0724 
X-CRM114-Status: GOOD (  10.68  )
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

EIC7700 provides a physical memory region which is a noncached alias of
normal cacheable DRAM. Declare this alias in the devicetree so Linux can
allocate noncached pages for noncoherent DMA, and M-mode firmware can
protect the noncached alias with PMPs.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Fix the entry number of the paired region in the DT

Changes in v2:
 - New patch for v2

 arch/riscv/Kconfig.socs                | 2 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index a8950206fb75..df3ed1d322fe 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -9,6 +9,8 @@ config ARCH_ANDES
 
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
+	select RISCV_DMA_NONCOHERENT
+	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  This enables support for ESWIN SoC platform hardware,
 	  including the ESWIN EIC7700 SoC.
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca..d566bca4e09e 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -5,9 +5,14 @@
 
 /dts-v1/;
 
+#include <dt-bindings/riscv/physical-memory.h>
+
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
+	riscv,physical-memory-regions =
+		<0x000 0x80000000 0x00f 0x80000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
+		<0x0c0 0x00000000 0x010 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(0)) 0x0>;
 
 	cpus {
 		#address-cells = <1>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
