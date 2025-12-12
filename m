Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F44D43366
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 02:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wc/863Axtyt069QAvfLCI/y4C9SSJk6/kAlY2OWWyk=; b=TuO4/WiBPdv565
	OoHmkSSMWjyYdR6IyDX+bpMLxFi8yNRCnHo1FIvygXDuvxUCtHuARio3I2JLBVK7WKjA+5KixqFkQ
	U1XudG3sIkJzC85rMODOAyanHeMyWR6qbr+CHVR52mZ9w2zZkFWT6ZMCnCIf8GqNyCpbK0rU87lvo
	d/zDG4KMBFAxxnlbupYbNeFDa2wn4oMOfwWE393Mfelt0CLfanF7WMhhi2iJO6g1WW3hE38c5rjHE
	Tg1Ox8aOaUzfCFiHTQmsXJdxQ2rPnTqJAggz/+agjnM0nXEJQ5gjlYpRNmKm6lCmpjG2x8Gx6GT5E
	iszdQ/w55cBUSA01ukew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXv-0000000HWOT-0fqC;
	Fri, 12 Dec 2025 02:06:15 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsXo-0000000HWNP-3ySG
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 02:06:11 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso865483b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 18:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505168; x=1766109968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcCzUiXMsxI84pITFnN6DrkZDZAsaj1mZ+yE52KyDfA=;
        b=eTBiOEhxUxS48xeDEwI843XWbaRSVzdYiwfe3qfIbjY6kfKzT+RLAcH5+cOn+4bAOq
         64c22q3OQcdMYgklH5QuwQDGuKufVLcQXNt/smoAfog00DtF0r0n4/MkKX41fV4n9TyK
         JTNmp6sean+OLyFfBJLRySLdloQoXu0FfX6BbFdCQA6Uxrk4YPQH23/H/WleN0+K6NDt
         4wm0bhzbN1uF6W+UeeqQL3ydnAJ9jRKXdK0/donP4JORMEAc+KVipY3yan6Z8YtSrlaO
         si2CWlfy+lOssy+CdglvqYtg6Nv2pYuSeb02mppNW6T4+hxsCSL4MfY2rFTT6C+81fnr
         fARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505168; x=1766109968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcCzUiXMsxI84pITFnN6DrkZDZAsaj1mZ+yE52KyDfA=;
        b=dJOTnt+HvMLbH+XWed+XgxmmelxQGyRBc8HKu8Frj3SAuGxoAy5yKlWJwY45VSOVE2
         /N3LhkiByEmYL2XpFvCHYMrOg3kgIfW5DA6f2BlmEZR26E/oIyXj3X9NiDGhIEsztKlI
         Pw8i+DO7rw1I/h3R2mgU8DMpuGa8OdXDVSJugXyNyRzDXIMobpFQ6hYmH9+sTBeH+dru
         gQjH1I8TGEDzRja0xRBOKLoBCcnTZ0EVdfOQUiPJNCgezExYnEdgPcf9B1cq7QxgUL8k
         L1jXxVfmEBbDFPE50IWGE41W+MsMuRY3tcMiIwGMyptB6Bq9JGIsXkJqk+NS+D4Mt2Up
         CGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXAzRAr1TXx/asmUW2seZv8yDg+UoZLpKTlrJIDjAWgv0zdL6MFnHU1niWCWYKIV5dX9uuh9wM+8BQFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB7DglmYXSvmH7NhFOlPA/VXVEoQGqbg4eOwHVUmpB1yIS5eRQ
	B1VHOn1D7gRARbMpIe2kjz4vXZWeLyFJhCYHKQOLHQqXe5hUHu14L1iJ
X-Gm-Gg: AY/fxX7GICHheOo0+/kInPBFR4fgOzRJg7WGuUNrM6JYn67o5FyCuM/T2t+6VCN8ycL
	IyjrXOEoLrhVOEG8I68xDMFny+WD6eefNI0gdMBIf8JTsOoavYCrc0VT0HI4Ji6YRa/z5/uZDg1
	oUTgSsJ2XpdGJEYhmD6dg/0b8A44OdjbzBSuU0IJmgEJTiNzDn7XVk0TvC3A1MTf1/KJGhdttyO
	m0WSlqhJJI8HtTSVbQw9/DVSdMnWmrd4Z7NxcC6Qg9X5/yvaEbOIfHiL0dJxSnPOyLBjrN63fMl
	YwWh4O3j6ALq7JVV+ns7RqkmP0DPlTj9Ghe8UUDe62vsSAiO23bSlgQGQw0Rplqts7twcgFSaXC
	q3+t40oXSAay8zJdMhKp1LilWABVoCnOA968UNQuZuROZFYodx+WR6qTwiYfwEacY57U+ZO9jpT
	1HyvJG3wrxjA==
X-Google-Smtp-Source: AGHT+IG4OglOWBlD1VKepmk+tiFRagNZMAVHPJzfqBDDWkRcGZOlcpelbUg9zYKtD/uPOdqR748juQ==
X-Received: by 2002:a05:7022:e997:b0:11a:3a1c:6c5c with SMTP id a92af1059eb24-11f349a48c3mr530798c88.3.1765505167760;
        Thu, 11 Dec 2025 18:06:07 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffae2sm10501159c88.9.2025.12.11.18.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:06:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Fri, 12 Dec 2025 10:05:01 +0800
Message-ID: <20251212020504.915616-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212020504.915616-1-inochiama@gmail.com>
References: <20251212020504.915616-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_180610_300952_76F0F9CC 
X-CRM114-Status: UNSURE (   8.79  )
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

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index a393a33c8908..0b5c8314e25e 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - sophgo,cv1800b-axi-dma
       - starfive,jh7110-axi-dma
       - starfive,jh8100-axi-dma

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
