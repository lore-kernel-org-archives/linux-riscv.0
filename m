Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9810606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H1XAU99n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5OTkDkW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wIGCNZynFQFZ8c1jP+pzfgrwPUoTFpS0CIoIFzb/J0Y=; b=H1XAU99nclvCFixgSBGpl/JgKL
	LKIInad5BMu+D6tCvkJT0o1Tzod65mTUqmI+n7xnJ+ZRrrWXnDMwhcCNS0uTu2H637oE8pkNZ05zq
	n5rIx/cXd3CrwLLN3gP+JFUUusVojSdyOO5/ijPJ6ARZOSn6FRM1BIEK0YTohMooxPASzA4/e/Jg6
	5q6AgZHPLxzP3M9XmlZjkhUJdICeKjGWZdH4Fjy0vwLro9iIJfB4GEXSg3ZUQ4zlyebKRFErQMKw/
	Kc1ja9kJsP/14m1AC3VpoyuChZL6tK0zhfy7yFIY3SiubH/iCWxzjzfsZeubdH7+CgRfZYb9zoKHc
	R9nUJQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILJ-00000008MhP-3mY0;
	Thu, 29 Oct 2026 05:06:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILF-00000008MfS-3zhf
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e831e86ebfso10166495ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250380; x=1793855180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
        b=i5OTkDkWxFF9nUfcWeByRpiX+Ow6IbrQ4qK21wrW3LKw8AWp30dIokX5XfCs9pQ0UQ
         rvT5iuIfRJJSmBJmmf8sSbwiuc04L37Ft8ocbM48IwT3efnluhlftHpnLIFVARVGKHvh
         6D3vH4QoGBkMuA5aFk1eP/x1iM/ie1SAFmx3jjQvGXZNUXb4+ol8PcA2aQOCDWPmT9Rk
         Va5ythU42zuOABk/vGxycwDuP0w7moYqJG2+C5phRFCqY+vv2wD2ogUITeP31shK+F5r
         p5MLhibQ1kkvwggm2ffzgJ1X3q2OT8fiDufT6ykEb2/AaUBx5M5NiAeanw3zjMiMR0T2
         xbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250380; x=1793855180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pcGqj7EcqEBhg8rTi3U2rPWxfkoRdeov/It4k+I+Yk=;
        b=GHTjc6Uk7OdnaEFNjw24yZatDx8BTHG6D7a1LEKL2NafnM7LZ9DAYtSX7WKuujAvwQ
         GrxRoitBNU5Afn9Ou1BqDuGYYZzvok9dLLjImxvd35/x9QlSywu3irwwFQggYG7Ityyu
         BDW17B1h2UwRO/NwNm8FJpGOjgWN6tYbqQBZhXlfZ3URb3WhQKSLLepZQk3tYKYV+vtt
         iwscGpfMT/dgn1buTSc2xBOHsPGR4IfINZlAp/FqvkJzEvlxnuR1uwtQCfu0i/Zv4cQs
         6JVQM9bQR8po9JJ+2jgP9a708XfY32jpFSzMJ9s6zs4d1bnB0a2SmykzKn/21tz36Yd/
         zFKA==
X-Forwarded-Encrypted: i=1; AKwUvBxSISqDM/OXYryct/uB4u+M2S0abYE1XLfB9TnhTsl+1WblDG/lxAzg03IzN1OAngRIbCO9yswGFKTBaw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIPPZrE92ceq7kGzyx2o2kNGHD66CYSo3qA89jFmQ82MqjPJCkR
	6Xwzj+WMawgcTiVoERwrgox1e8q36Ph74+mQ73z2Rj8VJlR2XHzesKgs
X-Gm-Gg: AYBFou177XFUL44op4C4EFUaZHro0sBr3DrBHfXxNlhbUWqY3dYChqtnI7TceUVW0uX
	oIB88lhVNGEMdu/RD9WiLoKVXdh1DStlw/JwxS8h79hgKWgpJyoKegCClXru1ZlN/w/hqywTI3n
	IDpHVrUJKchhOBQeaPg+r8sv985oouFC99MOyGXTIEVXmVSM3+0TE6UOWl2YKCgTCf/8vXz1l07
	3KXHcSONnH5jrlivkIkn21eFJNhZ1RuwJDbiPgx4xH1RL4klkHgCgno0VWHmiiuSuTEFLuQXjx1
	GtauQtUFBmGzIfchk/L7xjLWFsbBrEFIPfQAny0Cs6hv+FafjEqsUBwa0+AcBlYxk8e9NSNn57O
	Hn5mah1YwXWFzB8D+TZDg4IOPFs+fzP+kn1q8NXR9ZDXOru81wlRtZiO89uNDsU9+ejJvK58JQk
	lNOAJN8xRRn2wCzN1XgQj5OP1RpKFRSopG60k1Dze97b0pl2pTJisUwtQ1R3oIyC6TvMK4WWcE5
	+B7IvWx1ZHQOo8FYWPb7/916ajldlHdOEF2/Xin8Vwq/vUwBjtxkCLGQRm7ZfH1cJ2VD6ldzszq
	+TwhlD8QOJgpd+rjUD8IyeSGrLGu
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr39673785ad.45.1793250380523;
        Wed, 28 Oct 2026 22:06:20 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:19 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:44 -0400
Subject: [PATCH RFC 03/12] dt-bindings: timer: Add BL808 CLINT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-3-b736ee920078@gmail.com>
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
X-CRM114-CacheID: sfid-20261028_220622_416154_CBB605B6 
X-CRM114-Status: UNSURE (   8.21  )
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

The BL808 D0 processor uses the T-HEAD C900 local interruptor. Add its
SoC-specific compatible with the existing thead,c900-clint fallback,
which accounts for the lack of a memory-mapped MTIME register.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d887b40c0d20049d86867c8a5b6fae2..3934c0842751e02174c1be6074548e3e1e8f11fd 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - bflb,bl808-clint
               - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
