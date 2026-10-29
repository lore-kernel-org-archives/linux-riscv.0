Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195F606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5GMDOID3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cmj9zokF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X1WnWFDdGl1gZpKcuwC3pUCl3pz3L4JkuiSsZFfEdiA=; b=5GMDOID3jvxe1yiSME8GVYXAXS
	HT0wDpd6Fy37jeYenJZkXq9XmtYp2VdE9ype7LtAJID05LxQZ+y1bxBhQJ7wXUC84P4qyIOZijZDx
	nhJ/Iab2R83N8OfW5Q0Eb6YV/q8GChY4BFweWS7Oc9b3RYUshKRNPfMjtn0ZPNl4ZLExnrwmwH6Aj
	sYZTX5DLWd7fiyjVKAH/vsgIKPgxozDIjaGCGY22uTzWTR3fPlCyl0Xkf3RgdtTVvcPO8q5V6/1ub
	WFgZLAZ2XR3qCWTgGOBVF8X2GbxdZ6bR9P+bSpxdr/fc5s0ZiECL07urfb6LXYUmmlYrDXP5UekYJ
	uaBS6J4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILA-00000008Me8-3NQh;
	Thu, 29 Oct 2026 05:06:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIL6-00000008MdM-4C0V
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e8b20a899fso11833435ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250371; x=1793855171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=Cmj9zokFu+UcpNjKy9AIgQRmzyRd6oGYJ0Q/W9+eFc3qWYRwzmwPwNEEbrVjVUndzs
         ucTZacFpnJQj0Y/Ss9av0/D14vqSKzDsKZPTfdrf8cZDLEu478Y5TFB9x3SWoENXd7yq
         BeK01PJkPGo/GAyWP9+a1N4WgMZpIphUH8TZEhjEG+nJPpzq8SYpX9ioXHbaUp6REC3+
         LRlgmewRjGiHNoPMWDbxNDTotG7NXvQh4QDELHuTPmbLgI+OB1ma6tbxnz/ozuhR7Kag
         kwQ/jvqS0/Vc9Ka28GliZKahvD/Ac80CHjgEdtiMTxlO31GIR0M/EfyqUdhXKY+eH0lb
         pEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250371; x=1793855171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRnZbRztbK3uQmcjPiHrls6jXuhvcHYv7zJm0Q9BEjQ=;
        b=KESF0n0L719SFb5tGi2cgTvwqLn3tbhuT+a+rm55Ygn91Z1AUQEEVK/k6LIiMWxSl5
         PjC2I+BlW06iN0i4uWM94izQD/7odTYdI4MSG6mTwGHCScy+KS2YD+9MA4s3LDOKVikw
         ZJhEwUZ0w+Sw78kgaiboosdf1zBVXaMXz9h/g03qbBu0Wn6k1dEgGD27OvqbRQLHnJ1l
         GkoWo92KinO4iw+0NJEMH9E6BWtyC2tmaEKdRyMCvI6Er7aLtctmRPlba4Jxv/gq9bMX
         Xwhwxrw6M8EAlewQOtT3MQtKuYlpPGyj8+d/gpIlddVa6FVmjFMqlkjNmUD88LnS081D
         9Z/w==
X-Forwarded-Encrypted: i=1; AKwUvBylOXsdIPJ8nY/7UF4BXPcyZppimCccdsxsxEp6sj2Dh87IF6+vnnDXCZhOENIKPAunauMYmk+FlvdOXg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLP+h4ZoLd894o1LtRFpoIQ8WITl0yx4G0eQW1z85ePQriVGtFn
	PWGjWJpVSAkauL21/arptGH8YOLbgssuV8xeuOuN68T1HBfhnsPbfKLv
X-Gm-Gg: AYBFou3/iHdcUICLrU754GN4Xdy9Bj/j0x4hL5OzadXy86UlsOhuKPBiM0FzvaAl83T
	VjZHEthNmk4J6nb3uznJv+7Kar64v/jz3ekD+/h0r0Rgih6bXN3XN8OFEGoAr4OJECKZq30MROT
	BInIDJdWX+3CYSQFoCqUypuX0O2uVGF1fu6k2LJ+gDqIFIDVJ9/RkYbIdbMHLvRkFzS5yr9B88U
	38XvFeSCcKDql33ZjWVGLp8zY2QAmVkdj2vEAVJz2aZswgxmFwT/wWthNIwvy01q3cfWkZGhFJB
	kROjFck8H3btTMQrCeCUKdssanDB2ImVzJgAiIy7Qc8k7kdFul0BtLH1oNtliBf/LfHtoLQ8qrF
	NTkwjsO8cK5yq9q1B32kLqyNQtbJDOnNMO4PCNCwdD+4NCBTKJZL/atLRxP+8k5JGOB58FerMTU
	lftlFMsRev9+6iFJIK9LvAhvSRt2i2h3Tz95yfbeih6nEHFs/fRJWAJK5UXgUy0/mw7Njp/Obn8
	48Avv4f17ybAYK6zAqKE4vG+yS7sTD3yPREtOjQBw7Pl1tQg7c6wfPXv8ZK6N/RsRDiUhP0bA8U
	1BviWWQl58rZNZzh50fMPZXUmDUvDg==
X-Received: by 2002:a17:902:c950:b0:2e9:61bf:6591 with SMTP id d9443c01a7336-2eb0058dfa6mr43576915ad.45.1793250371450;
        Wed, 28 Oct 2026 22:06:11 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:10 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:43 -0400
Subject: [PATCH RFC 02/12] dt-bindings: interrupt-controller: Add BL808
 PLIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-2-b736ee920078@gmail.com>
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
X-CRM114-CacheID: sfid-20261028_220613_046086_9FBDC6FC 
X-CRM114-Status: UNSURE (   7.89  )
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

Describe the BL808 D0 PLIC as a T-HEAD C900 implementation. Its
interrupt specifier includes the source number and trigger type.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918978b40037774269cee85212d39d4aa..9c625dff1968ae6267b0ab65ed8d4e771c70c3ec 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -72,6 +72,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - bflb,bl808-plic
               - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
