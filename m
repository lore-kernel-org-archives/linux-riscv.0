Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD0606A325
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uF1sRZtD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtcwSkht
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QerJDhJxX0R70wzsbMX/mH+9bLx3hGT57NSKMSKOQFU=; b=uF1sRZtDwokvKto+8H4SfPF119
	8WRVmgWNQFWMBCQfeMOV8A1DhQzABuEDqFhGA3I3D6egRqrInUN+3pZKVzKH4SY5/fR33AboaiBKr
	FEFiLVTrFkWX7yV/BzU4bXzjtRB7rlPyM1YI+imw6biDMX3y2rKzKXO2FPVzIWRtLO7Oey0KJSEJA
	G7GPZXPNHOtUSMM6XBGANGTn1jBuSR3wjpFPgkE1eaYs6SBtMZ7mKQdjtScf11EzoJXohWOsjW5/D
	vnXcaCFvNSdreXXqh41V/71m7Djv4bYCCRePTjAynlaActNmSO73oqKJ5lMGlHmZcAjuaBqYKx7jW
	3Ww8qlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHez-0000000HNY7-0Rb1;
	Mon, 09 Nov 2026 05:11:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHex-0000000HNXN-1GaI
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so261704a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201070; x=1794805870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PViKVEDNl7eyaV98kB7k3kA6zBpmDGrpBaq9x9jFABc=;
        b=gtcwSkht4vZJtjw/JJlCpXCnXQuNqI9UWgPxAfDLoaufT3Js8fbKnsuRKEAw8UyvmN
         DadQcXMqw4zrw9ctYlSZamV/dhYK6MTxYjMhVH5clxxP6p+wYmtfYI45beCjJmWvuNQ2
         autn2+LVommgbg88sx2kMf3DzxyoPZGGGLgHNxQIub5dW0UZtuozWIuqnR99CFrIRXen
         8GmKpNeGJ+I7tGjmqXZhdVEN7IYXX/sEtGSPjBk4MWuqufhvdVepV8P3UhJllz82mmEA
         Dm3Yj5/dFHXUsCRcahMjGx7HV90xyg3czQ561mOcd+9lUQFI34o5WSSonKObWCFIOIyF
         SsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201070; x=1794805870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PViKVEDNl7eyaV98kB7k3kA6zBpmDGrpBaq9x9jFABc=;
        b=B3wQcw2E1htqabUHCrTibmfHhK5yIKwbJlwyrT2P/sV506EGlyHGAX+930FPg6KUVY
         KKnOPFXP3K0JxXH3EDgjpZ0e9RO/HRH+j4GvJT1XovaCll47XiDX8CO1IMpWH0ssw6YX
         yBFUIRG1bGa7Hqy+y65y5lunjkr+vvDRR8YCdiijx9eaoPuTrCy2a0My7ebhptfDprh3
         u6gm4qj5nbEyIhVHPUWdcUo4ORP/LhaMlLrL6+iX7ifqYvC9u/bVuY3VNFBJBfnoTnYS
         ALmTkawWTOnkN6ZAQVVTPzg7V6weP5UiM3+UamkyxFjJ5MjmXA0TsZUHExDAZ5q8/xtc
         XvPA==
X-Forwarded-Encrypted: i=1; AL+hErFSxnjVL1rh57aZM6VOS/CxMx45heQkwETh7c9aFt8Jx9DWwdEJUHOZu7JmZe4moGS13c/tzQVxVQ3F1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/97bg1UPywSjmLyolRfnyil1yfpmoOZDQwW+AMmReVZ+YTQ81i
	q0y9DZAwsBvqiIvOHXpgGIzn97G6LBXSpsGeUTFqJVUTKS8tLWLdq2NG
X-Gm-Gg: AYBFou32P+6t5/UAJBB1+tBC88HAaWTSKyV7KhLwoI9jK/Db+cFkoXmuaRqSiHJkIfs
	0yakn0T0fMf+AP6qgSWVliEfQBrWGuH3V+ZM1CumYQdWN9IjmzZGCwudxKZBCshgLvRC0ylzjaT
	j59b7+H9Rwh9ukacgixV38LfOR/dVxxP5Ka9hAOhvhc9Lx8mMRRdMpHQ67H3ZpRtQdIOkGa+voU
	1ZXtk1Qk01FtotSbau2W4sMK+dzBvMS7UUUnehEgLKkzx0ILsr1ZXf6eDzKKc8BuTy7NWcgeA/b
	eX2wuCodFZEFphNHqclLZezegane9ihD/F65zu0th2W99ay7paD3uf9/X6rAPzQMhxufVRXOQ3X
	3Eo5x2X3psgr/tz3I2zK6EUSrHZ4CZbkc3dGETtiQxwTvihZWWsLr1x0z5252HGsOMTOZ/4te8f
	nNYYOuGpn1SK0wIX6cPO/OhnSIE9p7DBWzbWgvIpvQKF7V6e30yUUv8+sSGucXUtKqLMPKhR7/L
	JCJ9hyRNy+lMq2KdbONA6kwKSMrMoDhhVkevv6uAyOWltf1O37Bm2pLFMbTI8nXisBJrfLkIBW+
	46ctCmOJ7v0N9K0AQZgq+/wkIJ6tl2fGULItXRcZKHUNrJPCs0MhnQ4zN7olcSuzMj5s7OZy4c4
	5QF7Df5JhJosBYsamr9YnW0tDFudMcJdJI8Vet5viw+Cl3OqHfU5ia2Tj2Q==
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr2878398a91.23.1794201070121;
        Sun, 08 Nov 2026 21:11:10 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:09 -0800 (PST)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Mon,  9 Nov 2026 15:40:41 +1030
Message-ID: <20261109051050.105623-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211111_360978_C0FE1501 
X-CRM114-Status: UNSURE (   8.01  )
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

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tag
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
