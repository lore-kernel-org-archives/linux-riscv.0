Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4FB606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GlSdNjO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JATFnfLY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6+fYbS0jxTvbP26md14G1c1hG5JrqcLHm8lp+dFF3/8=; b=0GlSdNjOeH6jP4Sb5C8pF/P6Qt
	/83P5m64HYgzaQtcTI6D+ewU72ROzsIqIFrXsAkSvmp28P1JghqUJ3e71h6SzMoCIb215lJiJml4K
	R5cZgQMjXAfMrHaRYFngB1OTI8xUP4ubTfOvTLvyNk1+CwgbqiogGyQVkYjc6nLnVm2nO699iT0J3
	uxbv4NQjixaMMqIpmJwnfMWX+bSuto6AOqpoGnzMeC8TVEmxP5M3LP/iyW3tlDwTW0owLTxs7Q8/Q
	vkCtQhA7VHBJB5YJ5LQ9cv7gPxZX9f/WaxbacoW/dwQblTXvQYbtchd+21ZIn1ahWCKnFg8cydjDu
	1u4MNeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpG2-0000000F0tk-2WNd;
	Fri, 27 Nov 2026 06:16:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpG0-0000000F0sv-0LSn
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:16:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2f0621eec70so54175935ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760187; x=1796364987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fy0JbcPZWMZkbJbcUFDlJ6+t0N22Ex22PbKa8LtdUc=;
        b=JATFnfLYZg4HGJE/+d19Vf2gIq6d3mD9Py4a5IjxCWusdLIGAQJLSE1afMg71Ypt1w
         hjlVOneE0pZGF6ZIN2JQU9+Gp6OfZimMXVv392DBpwOUl1tjkxW50oK7RjSIQIUQV5hZ
         L3Y1o/B5rHiHa3GL27x6GxVBT72cdKTo7z44dyRplFgyIjNh1HuM66MPvCEGf8QKygmY
         CyVqaz7JfVoDysiFip6DiwLSxqXO9pbPkWFhcUDoz45uY2/VbQ4Jqiek1HS7O3grhaN5
         LAi6ySGRsnVYmi7yBY1ztEooYHILOJJS0IVxKZm0I+lRFIdJSzuyuQi9bkVWV0KQcbFy
         lxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760187; x=1796364987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fy0JbcPZWMZkbJbcUFDlJ6+t0N22Ex22PbKa8LtdUc=;
        b=TVBO9GJuCKYVjLcYDt8gT8vNypahRWcJAms6YF3twLu824DyfdXMDGK3I2n2rTp5US
         eRXPfqI92cGGN1dz5NQkcWMoE2Q9Ly3wx+HgisVVLLwh5JbEtZHf+KEqsHqypruppbsg
         96fXK9f7yNNy+E4ORYFJjHMC42qR4C9XCKCkT9q9OAk4hOiTgHGTyNMY0JsRaawr4JaH
         BmfeRdsv+hLs1ab3dKfnLH4Sv5JfSPoOEINbj+Na+vOVcH6QpyOqkRHhCev4YHhXrFm5
         Pyho2JmFqnzNpcxmNJZKpVFjXaZekqTOBejCxEAn2UjdQqrn+RdsciTayu0ecWGICyfR
         ogkg==
X-Forwarded-Encrypted: i=1; AL+hErHIsUZculAYIbgAuJWUo+BXP88MhO0M99t0fmuH971ugGKKiLvme19OZODaz5Z+DpgLsVBzPw3jYerPcQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+fK3febkSMXX0RbDxTEYMrEP3LIq6pJC+0F0y7KMcrFctrCLnl
	0GrbxmC29bpmA6W6fOMwMx6zuTXnq0hte9zFMBPWLgkKOh7gU8EF9ahK
X-Gm-Gg: AZFdTZdyB9E9OWeZXBdg2SLs3v9LFBOC4dEvnK8f7rSkTmYI7993SpmIq8iq5nP1GlD
	v6U1oFMfqXmCKoPJ3QevJ34yDYfnNgt26XS2CSGQB/R/tAnEdX1uiOXLjzNdmk1EwYxOumnG0uT
	Snwb1bCpORcoJs4o4xM02wPMUQ1M/U5I2Qgvoj339iVA3Cli0ZKUOw628RF6p53/JJ+G9dY8SdY
	54c+y+FtfBdYuFfq9nKm99/ESCMy54fFn+K1VYZj5d6qAad5OB5yalFoX/iWQNebvG6LTqyRFHy
	Tt0cfTB8w1xyG0QpgyE4qRojDKsytWbat2kYRj0ylsGoEfZStJT0skNcFvbdc8sqvvzwG63wnvj
	h+XFN4EYh6CbXgeofVsLQuN5oDDBJ8lzOIu+wTGuMjdlDLm9OkxpXBcZ5WDSqpJ4HrdYK1luglU
	AUm3g/InGzsd71TcYjIRGPTIsZCEBLBanVKZkto6EtRlxodsbJoW8mxmYOFKOG8o9SMnOpAF7l2
	nxlloJr5AzH0CDMb/WMAHstzzRnoONdjmk1BojSEdrGtr7U3OvHqE8WGlBin24vd6yKXvM31GJX
	9SNYXZrMV/3P6T8Y+wMvIj6vQo/we3mXrQ8IEqesEEv0Qm73j7Wb33gWgptZubMOuDcnHOf9HbN
	DEpcA7OFvqHHGZJdY4DSpJH/JQxGP/CVaS53qVFEvcZ5uCwW1LYZodux3aG07SfhG
X-Received: by 2002:a17:902:ec8b:b0:2ef:f4c2:d65f with SMTP id d9443c01a7336-2f03f248b82mr216106755ad.33.1795760187062;
        Thu, 26 Nov 2026 22:16:27 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:26 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/6] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Fri, 27 Nov 2026 16:44:22 +1030
Message-ID: <20261127061432.17306-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221628_147740_C8D98E32 
X-CRM114-Status: UNSURE (   7.32  )
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
v4: No changes
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
