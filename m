Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03846E674AB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F72HYYJZF5vjtm6cJGLYV3uMb3c6JSbwbbnF1S5rMCk=; b=Gtka/jJS81dtZ/
	mr+J/7DADAtW/Uf1mwrvv9QXKnBcPqHrS9sKA3PkblbuhLblDsQcTBzjswSgLG4iPzc1ZoSX4BhR/
	TsJLmogcildeYhw5cFHNWFH7DRUokJA1T3vOQUXVMbmn8FxmcxLjOl1o2lVOkoy19tT43BaaLWDNw
	JiYofDcwDxGhB8DNPx++T9cf49W0/9d+8R5mhAB75pCn9iUjbyumMxstJL2ht2ELK0fNU1Ud71Tfl
	sUxIbnTvN3F3fuVFYGwLB4PPr04zWk91AVPhvqrmv7oPYMx7TIqIYvxwj1QqIxJ6eqxwfR963cgEO
	uYknmGiLunh+ITjWauKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcy-0000000DmDt-2Dlx;
	Mon, 22 Dec 2025 13:07:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcw-0000000DmDH-2DMZ
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:07:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so4191571b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408825; x=1767013625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjWQje/nveRZYVRefE1HPRIex4imNRc+7jk18aMfa5I=;
        b=J0kaKsINVLvxI+jUpvIfHUK5q9qCO011qryblNcn6G5zn9eldtMpwJk0vM6f6h9uMG
         s+fLRdfm/QU1kZXnqfqxasqtz74N96k2qxr/Y7Q/LorN+Z3ZYWHBICmyj/i1FzQvRGKt
         q5squFdhReRjDjriSecY+NvyCWYo9jwPp5t51wtstAFgslA57WARkhmqypx6Hdpt/MNE
         NfG0/TI4ajVwpqH6oJ1LfLnE6C1LFWqDA5B9x3QPl6pobNyvGy6rCQg5KBS3NyZicT2r
         7zx/BbZwvDLO2qBaiKr++od1S9KImXiP20NaRHPnlSzFLnYz8K6kVMmXilkcKjjhAmiI
         miwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408825; x=1767013625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WjWQje/nveRZYVRefE1HPRIex4imNRc+7jk18aMfa5I=;
        b=DUl2Q4qy0Uv1SHTJUxFDM5AQbYE61G1J6b5rAUGITmutRgpO3eI32xSjEe8PwkAo5Y
         eWlpRo5wUQZfWpcViiH0O8/9iKMuYbGyD7PDNZsj7sMecfXGQ2yqpECxc+7Twwjcq+uS
         rbV6r8ZGfRk+SXfwP4FwJJa5VDDQxDpL0QV2gl5UoWzG9xX7en9hnRDFrtlB2VW4BbzR
         nc4E8LX3/poqbG+190e3epUVfpyrrDR0BTruLkVoR0j5ovn/jbIVAyQDlY/5jbYfeyPE
         dntyUM+w9wXz/jvxKKx4/ORtNe5opkVH0+HNN1qs1Hu4VV0N44vaw/5Hd+ESvZOj+wiM
         pwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3eUUYlSNksXwtBrBsaMEmsMTvpeXhohm6tGuxTxrLpNVWkPG9Y/+GUZrjnVUhJ2ElKiOn7Cx7G3XwAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP/W4Y5gtagREFMHqDyOLhiEkNNLlVf5ZWcVVBu7vafg4Itwys
	f9FasXpyJ5W+fGOdBVUgKP/DKzz4hYSEnQtx3KsDvRvVe5AFbLjgDUkKt6DUSSs6SwQ=
X-Gm-Gg: AY/fxX6EKoyBoSan1ps8Yw7CtyZosut+MGeTZ7Vg40epDXmH/zfCLhS53GWg49TGgZ+
	qdfpZF/0ApBtz+GIWbab4U4e+pZNj+Rv73BE1UuU2o9xAJeWLDxxl0Mie/wJRgABoLqr2vdVBSA
	OE1bKQ+DmtJNRd3+mZqFK+pFHImj3djZSAADqoDK/OqmyyZ+0dY5zBT+EwzJfJRBFHS1fIMAKW5
	bNFRuMvbzwirdAw8FF7gZ47fpcAPA1uSqGhoQUnx1JIn1LrLrq4+XD97KkevvJoeClgoxk86X4t
	vjAUWUu4YMZsI0uzEGmA6TQoC5Se1E1SiO5wi0/ZGod4xZAQprOtvuQABaAtPy/XSMnZLzAH99B
	qZlyUHCrbSbMpOaO1V2krQdmO9kOvGVboQxkKYWbnxeJaVtoUq/Q8eS8Jj8xGz2RbqqnR/rKcGu
	VtYbMfKC+oDQS26vIL5XU1FyRiLo9NBlY=
X-Google-Smtp-Source: AGHT+IEj6B/u6xigsQCz/iBhHquF+WSZt9ninqdaMIjKJZ5tbUeL4Vlu+cYsAEqQxRTbHzVXks71pA==
X-Received: by 2002:a05:6a20:918c:b0:334:a681:389c with SMTP id adf61e73a8af0-376a81e2a6dmr9033482637.15.1766408825385;
        Mon, 22 Dec 2025 05:07:05 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:05 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:14 +0800
Subject: [PATCH v2 04/13] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-4-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050706_616305_4B44E55B 
X-CRM114-Status: UNSURE (   8.52  )
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

Add compatible string for SpacemiT K3 IMSIC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb90baccece03708f4a381084b22049..feec122bddde1f82cbd29b8f3597d6af1a16cb23 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -48,6 +48,7 @@ properties:
     items:
       - enum:
           - qemu,imsics
+          - spacemit,k3-imsics
       - const: riscv,imsics
 
   reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
