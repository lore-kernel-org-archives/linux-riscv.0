Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7F606A322
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMpRs6dz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D8Yi7FUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AhYIlCyftiHQ6kywXR9elEi4/6zwFxLwSbUksDoMhNM=; b=tMpRs6dztv7r37WNWl7Wlu2+UM
	1Nk2MBiZ1+4YdiGUnzWnxm8BOGW5jK94DSjT8AgZ91f8csmh3/ejnFv3Eca8e8/3q0YTNLTrXyBoE
	jx3thcJXE+4jqzhBoEVrGR1DhWkg5DPe7dFCSnCR+JKbRYKjaPdKXy67rO3vq2p3ylExbhVltypSs
	liX8BoPx6nlGIuBYmhP8hFdMP5M2FNVKP5drhcMGfdpy4YjDbpVI42xbpc1KdrDA9JwD+JurKZLFK
	C1Ja/PGRdWW6jgBgUSGRmdW2anc/Px+OUN4wQc0I3TkZwyHiMCn0rN+d3XnU8ZFEk7c08dPcEmhqQ
	2AB3vluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILU-00000008MmB-0WWS;
	Thu, 29 Oct 2026 05:06:36 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILO-00000008Mj6-0L65
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:33 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2e609985789so4997825ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250389; x=1793855189; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=D8Yi7FUhS5jfhJAU57BLGLWIvmLz54QL0mtqUP8vimAE4VxsOwDOJRx9WA8E9+zLdE
         lo5oXmsFRVrRw2uLtjHT9UyE0V3ZqbtKy9JJ7QNCs7lTKX5850CRk2oPAD5EBiw0xj/o
         ksnqAneM/tUjq0BOLwtnS5T4FqzY8b3TtRyXPdcEsYXNQMTzF94TCavwupDSB38rxcqF
         LSkSPXD+7DXqaOb3N/Gov2JRry1a6h47EUDPD3J0E85ZcyuAFtzbNlBkxuqRkreySURM
         kTL8VUYzA+NLjYkzFDTvWfUaF6lkPpLmTbSnwVZeGp95mRMAkAGNs+gSRIWRl98hNyEs
         talA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250389; x=1793855189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CovTA5I7uRtS+rK/MoAKpr4q/R4ofKrh6kdcg3ZjsRk=;
        b=DdLt8J4VBwFQDuCOVd5gQ0g64KDyi6216P6BmIBW0DJEYB5d0yQVgmC6kF3bkI/M09
         t/SbTnppsBOzjhDXnMGpq93uYB+M4KlS+L9g0mdwxA39nuRFvsPVlJx2mUy8P9Ya9trn
         bOrAxeIq80oQd+8N5/Q/TUHQ/e9Ecj91D5H83iVkSYXpN4p2pKRtqD7wJw7UbzRFryyH
         YzmdC+go+JsG5hPSX4CXMgx2oaVudYkRNitKgxqFYvGasgtxl18CY8r+nXL610dMX59z
         e+Ovu/IFbFfrRv8Ukm48v4LrpRIWtYifUZLuT98kwCC/39z4L3k2I3nfYS9CSuSxs8O2
         yeGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvULbAG8v8hkBRvcUsk9UgAAUBgUlyjlQ4Sh+2UE7r+GTHfrN931I8/I7jaHMdl57zfffS0M9BsnhmJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKasyqgsA4eyAGgFG/ZZ2KB+PyaTh5QaIuD4fvcvAVPpwTvRkn1
	JOvWGaKBzza/BSXl5vrd540Ecie3gLB7cstmlv01w+jbzz5XvF/dSyjO
X-Gm-Gg: AYBFou01SzvkMiXEIVtjBbqsfv35D33Od7LaVpETuuieeYPP73NwpaQz/6/kD8tBOft
	PbKEcBtgqlVPV3UKQShDK4AM5yTWr7YxTStASk9MLlNbDxNV3L/eMz5EadAb+Kx8i4gK7wiJEbt
	uYrLvsWroSFzRRyzgKQIVbhOftSoBNIFfx3Wo7yhHGCU4AaS2CqiQBIE6mthfkph9l6qOR2++Bn
	HmDGgHJlhrAW4CWypzy9IrmbAQact3kChERHzKUf6v58lnhcQpk9cyhsEFPq4o6ZQM/NxzlG2/H
	ER7HcqCKsjyp0pLloQVIp4BruJq/kN9tZIGwhstG8URQUxT0egXJBwUzro+se5JHTIePvKBd/bj
	QZuTOzCULFTv6O4sqqPuCiuYoDZRLRDZK1VZ9kszYlgcDRWf009BB/Itd4iCwAsU01C9WVxLUei
	q93Z5GvBUyK6sRFJsqNMme5kQ5Ari7CU2Lnm/8gYL06fTRxMrB9wc+gEDyctdFhscmeuGkf5leZ
	Pze1OSCJjFNO17G6uCFBmqy3tR3DxqlaOiypHOTjo4GZrBsL9kEbaK4+5FUGYvTRjKyuySPQfcz
	ILEAFGXKwgCxaEQB/stsIKCoUuoO
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr39853755ad.10.1793250388648;
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:28 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:45 -0400
Subject: [PATCH RFC 04/12] dt-bindings: riscv: Add Bouffalo Lab BL808
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-4-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220630_274723_10F8D149 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the Sipeed M1s Dock carrier, M1s system-on-module and BL808 SoC
compatible chain. Initial Linux support targets the 64-bit D0 processor.

Use the bflb vendor prefix shared with Zephyr.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/riscv/bflb.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/bflb.yaml b/Documentation/devicetree/bindings/riscv/bflb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3c14fcc6c2e9fd6297cc2556c1525f4bf8e90c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/bflb.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/bflb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bouffalo Lab RISC-V boards
+
+maintainers:
+  - Kwanghoon Son <asdfkwang@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: sipeed,m1s-dock
+      - const: sipeed,m1s
+      - const: bflb,bl808
+
+additionalProperties: true

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
