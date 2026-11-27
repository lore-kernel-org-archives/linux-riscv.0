Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D1606A329
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g2G6x1Us;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfGsf4bL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2WIlq63ajE4W2+WX6WNc1P57G9ZabkS8W1ldg1ueujs=; b=g2G6x1Usmbb8m5knFi69N8Os/x
	J2+yLxe5MYnHilPnydleX1WHLRpdetyfRn0zoirhxrPnRUD0m6qcLFn5DbhU4LUVhArmrW39mjw1L
	Ova7xE4AsWYkECXEpCPnlPK0ub2B+pFTL5RWpc5kqSu2bx6uVAyXk5CsXb3GL5lVqumcpYqSsVoUC
	7DkSkywnV4eNahbW0SpoTZ0//sHNwo2+zAZX+xEU510SPSYewccY1DdzXUM9U5yCWuSyusaWoOtsO
	A77WFJylZWj2RqFpm6KGHmYRdHsERYzzCyk6RiTOaSFObtwGjrrDuTucIwCmB+pbUfX0yEfgjzIrL
	rxibFylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpGB-0000000F0yy-3Hgh;
	Fri, 27 Nov 2026 06:16:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpG9-0000000F0x1-2JnJ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:16:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f045b921caso44388275ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 22:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760196; x=1796364996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLHgRT1LlkWk+F2j4iJrU5ZKCvCqM5eYbMqHziS2VJ4=;
        b=tfGsf4bLYVjLKb8BZwpB/o5xbfww8jiabVlkuwirexILd0ZKyl5xMECI7TiMWamB2m
         UPqUorAYIUXc4zod9bVz+4P/SK2YBhTfbwfNk+KSXnkZ6GtxJ2fIAOnAi2M/CNPB/jXQ
         OJb0mjmlYfD+H2HzeT/17KXqSwdeVJ/eYyj0OVuBi9hHiBA6crb4XAGFW20zdH+xVgP6
         cq3oJ9ty/41i9ZDes797GdXT/77pRp6aQP+lUj/2KZK/++Y72jJ9AjVSTS8DN8WJ4Hnw
         Gj7jN8aNtr9TkkSH5IYnhFCnUFAOS2+FIUfX+BVSQU5GcaQ18yzlfo9USGT0sXNF3Tq/
         foiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760196; x=1796364996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLHgRT1LlkWk+F2j4iJrU5ZKCvCqM5eYbMqHziS2VJ4=;
        b=DnhLMsn0PkSz08Vy+Xk0SrnNMkPiBfgJTsuunR9XjUO6TFjBHl6ebveAwyYysqtm8J
         5UNqg8C8AJwkCv18jzbDGL6/tUTAiMGZOVB2j5cCeVZ2fPJe2e5gT6Eg1p/B5TiwQdmt
         2Jl8GevGceDuZYzN394poiJgze1iINlz1TQ2wn2fvv5L73baLSt5v0P8q7CaiiZNVlvI
         OzbgcTXBUP5Ds2+l+3RBN/AUMlI/1h5K2pmrzzXwEWbuy4m73j5k7sw62Z/vjKo0bUcu
         sx2jrPtNEdfk6KVVilF3GlPiaTiUCeMnGPGyYjLqrRfTqOe1rivljg3BX7QbW7iOnZ2u
         QrSQ==
X-Forwarded-Encrypted: i=1; AL+hErGNXEVPbfysmgDPeucP2elb1P3eV4Pot8ag3AUv13RQI7p09cC8ApbbhxFZtLRYJ7yVm+fMqBOkhgBBAA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8iVu+Dk4xkMOlu0w5dA/txatQbEz5PwxNtIuMIfpus+XVPbGln
	fYgCR3Sa3XVL/E3KkF6CafiX87NJTEvKoJBZ3RRm/ScQ7O4Jrkl0Yt96
X-Gm-Gg: AZFdTZfp5rdkl5BkHv2K4ZICFRzYaUXEAv9MhmphAspn1vm9TYNm/IsfbkBvVu5imZo
	jho9Dr4QPyyZbpbeiQjVP9B3wzDzS8djOrueM7cwNKw3ZqLo41qgjfaZ1XHw+6+Oi7gIyJjdBxQ
	ZWZAOTzsZXIHoDxL/K6oW+SHXKkPhc+0MjX61t/oBRXRRasd40rUfybq/MlkBIF5nXU7b9X9Mij
	gOf4yxfhg5UBQ6DfGVr3lMa2suymNw8YYzGU7oET0o8UuMHAQsAsU9DCwyxQe+3vwhNPZn4OhEG
	sgP3q1PPPp6SnaDdaYy297vuovoS6IilhA7UF1VfetkPmSNqqgfrSAc2Vacwpa1HRAn/Y4XqJsf
	Ae8Aj7UWKFpsxXAt6ipxBWKhbDFUasUjkPjsxTD7sgyDwWxEG3jaFqWbWhpimIDbjqRIqB507a7
	ystHMXW8w15hVyURSIzOd2QtorsG3nYRHjfcc2+iFbR2sb4Hu3sp/Qav+CoInKr8RPs+4Elid6P
	2K7tR56mmxw3zKapHuHlw6K+A+G13Ayx/TSZLWlgAR5550RXynhNLtkN6BLNqT740oz9n87Zi5i
	tQaIqWPjelbzjY7FIVhtGEas1PAqoZ1EdDcElM11P3VWmGIoJm2/rLfhRoR7qLKPH3/iUgJ21Or
	UOBPyUDHCx5CZqyxtqEtZERl22wSSaF5PXN0wixFa3ucC6rMeFbCi8tL8ni/tEZtxCz73WN53kJ
	KvU6aCmFlo
X-Received: by 2002:a17:902:d48a:b0:2f0:7e65:bf0b with SMTP id d9443c01a7336-2f07e65c19fmr186365185ad.24.1795760196532;
        Thu, 26 Nov 2026 22:16:36 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:36 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Drew Fustini <fustini@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 4/6] dt-bindings: riscv: add Smrnmi extension description
Date: Fri, 27 Nov 2026 16:44:24 +1030
Message-ID: <20261127061432.17306-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127061432.17306-1-joel@jms.id.au>
References: <20261127061432.17306-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221637_848015_373E8BC3 
X-CRM114-Status: UNSURE (   8.11  )
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

From: Drew Fustini <fustini@kernel.org>

Add description for the Smrnmi extension (Resumable Non-Maskable
Interrupts) as ratified in 35eb3948bf0b ("Merge pull request #1492 from
riscv/smrnmi-ratified") of the riscv-isa-manual.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v4: No changes
v3: No changes
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 79491ef8f86a..7f5d85c64f83 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: smrnmi
+          description: |
+            The standard Smrnmi extension for Resumable Non-Maskable Interrupts
+            as ratified in commit 35eb3948bf0b ("Merge pull request #1492 from
+            riscv/smrnmi-ratified") of the riscv-isa-manual.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
