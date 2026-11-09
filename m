Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F6606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mth8lL3y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmpce19D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=za214Eq9CVZ0pANGZ1oTW8XKkcVw2xssJHen/TLHOjs=; b=mth8lL3yH1yS00gMddH1i5WYIi
	6l6l0B4cRV+4hh5XEtgK7XQg6rFGau97Z81osnZJj8EQt/oY0LID9mRKZTTu8y8xWvqOx0ZJ7ejss
	+YQxTs82U3ph/jZW1Rp0Pmmll0zqV9601aXzk5kDKVfcwjRzkUqvRAIhX0HfpKHoZWstuIHIVtBrm
	W9QLTThY4Y16YsQ6gDJgK6SbFIsX8E73NXJdSBnPdQz8zEoK6WUcZObAirC/EEYRC3K2rEiSuFKJO
	LYSpYjcLlXZdLJGAG1IQu/u/3CcGNRgy6sFLZHCY2unbUS31DuO/vu2LC35KyM201ZLfv7cMpcVtP
	m9gtPF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHf5-0000000HNZD-0uof;
	Mon, 09 Nov 2026 05:11:19 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHf2-0000000HNYU-2UpC
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:17 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc147d86bebso210968a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201075; x=1794805875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+rCZlZvpLUe3/sSBMNpNP5w4u7bZtndPiMGg+R0D5I=;
        b=gmpce19DEjjo5NdEhSNIs20bbS+RZhzZ0tN9HCbD3uXFVkTZ8D4Ajrco2sm7sEWeSC
         UHdSATjghRq+IIP2PMLy1pLP81fwZl26FvK161W9MzIbDCS6PF87wbieIppFODK2icyS
         CLNV8RI1tZMvwuuNvJZ7YxX64Mu+8y+OlwQzHP2paDzLDbj1YSYJ6VheO6IMbxiNlSis
         RYJpbrmH6JnT2+md/vm47bMkV0dpwM23JOtIjy9Sn3w17Y8RWjjQqEaPpPyYnaCG8jVO
         7WPuWBNhfHwBSXTfxJNzxd9UKzeSRk5OOpZdSahj7oxw3c7CbAyP+QfzUaiMxBCa2fZq
         dmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201075; x=1794805875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+rCZlZvpLUe3/sSBMNpNP5w4u7bZtndPiMGg+R0D5I=;
        b=VfnUYu3GskCByN3IqDUfWAHeN6Bn1R9W0VNwT+S50c1+MvFTsTnRho8MrhN0PMAUeL
         iQTQWtZx7LM9Y9ooicBs5krSCK4PHpqVTOyiMgLeLLcW7bU8oc8JArre41ouHLvcmgZd
         PWzGho6ud21KJ7c/89tSQWJxsSQymivNfPc6MXQavO94K+KpUDnZW1hLbTRV5AEgzC94
         Pd4Q7Goy45NHmpc+yDkmpm38Bwez7FP+nbzepcYWhR3aaF52kQgIscygrafVtN9PiIjX
         fPpb53C9TlVX4/Y9QYOPd0OAOz6mTqyq/8Bhrq8fCRwbAsicYH3W+bNb3SwJMQyrKYYJ
         azTQ==
X-Forwarded-Encrypted: i=1; AL+hErEJ3EAC/xXSaHW4SkUxjlPcf1vYrP7XQMP4HNmuWl8G9NaMAGmyWcRuc7DEhgl/KkbfQg8sSS5zwNl0cA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9i37bAuntyy2SE1Q5mFW8Ut7ihAGWYF1OXzq4CCei2QeSUX70Y
	mStcD03Kh5AD6OZJ5SFu4rVY+qDHCe5OxgK822nXEyrpFxqJdcMuKj1Z
X-Gm-Gg: AYBFou0zeqJ3DFUrGa5lpZfmrhbeRK4xb68PVLy8mjvX9i2b38kxJqfL4bYNDQJQ+iU
	XLGTF8y0GycVMQzcPvAGXUVP04P0/E6Gucmx01YTh74U2C0A4E4n7OVMN6OSDh5rZAM5YZR0HE6
	+hSx2Tq4NQdGgJ56IBwvGrc3UBcLn/N12BaiAXvyYGjrUdnmfszcYH8ZIVicuqtRIzEzCCD2cFt
	CdL311oxc59lIKGEP77QptiNSDo1j+5YV+WS5wzAN+n8Ar527iFIjgkY+f1IWfGPoaTJwWyyO6X
	Hn5cCfjCVcdV7YvPRR+rIgHG02ulrH88g7VwlOmN7k6ogqqGCWVV2JhNuOSfNKLht9bYSylvuwm
	OwpBNrlWMm1ovIzkaeg4eZaufdr4RzQNv+m7gcwHhbFz1PcPBbTnFzNZZQWga/KNcz97v3US/R/
	ym8/Np5jpc7U+zPdgtt6QbQ/Y0E65yANHXYTO0QtWx6+ueZBG4PzBqAafT+bJpoQ+L5Y1XE2nmb
	cxaG9L94nMmoio+ygYOtsxvU0CLytgbChG+GuRN6vFw/rl+nHTo3GMeZeClgLyolcDCwGYIZdOn
	8jbVedImRB83laOHdU1BYGSHd5Re7blDjTAn8I+8UfzHBth1QnIhiR9bclu0NGYRywqvwv9JtJg
	u5cR30zpmkuMGS5HYyNhkLwNgJmm+HKERNBFrZnwfZ3Ap3yoKyExjyX1m/meBK7HUud4yFEBB0a
	MMvgi9
X-Received: by 2002:a17:90b:4b8f:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b12d3fdbf6mr1750088a91.7.1794201075584;
        Sun, 08 Nov 2026 21:11:15 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:15 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Mon,  9 Nov 2026 15:40:42 +1030
Message-ID: <20261109051050.105623-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211116_637253_2AB3116F 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tags
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
