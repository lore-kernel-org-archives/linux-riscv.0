Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0DDD637D6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vEIejRLuP51Zdzre2HUhFF9uVKgGR5WUsMwItb4X/A=; b=jp6GL8VM51etnB
	gAj+Uj6KSRm24EfLpYIqnEUUdhcNJEd9d3STRKjyYNwEd9n41J8F0Trrsn4evfWiXKPYy0gkgdX1A
	sdWF6cIbk0xUQvtRrcwEVtFWikB3z8cbZpMi4GTHVZiydTxafoMDcl1bLb6kkmvA5+crWlue90tP3
	PFwAfM/zx0TgSnYkydNbonUP2oGDZ5EzCAJJJpAE0GzBuufTtIbE77Fon1eFmm6cNZ4byc0SG6F3u
	UtskFESl3jnyXz+zEizVQprlenmaNiuNrj+6txo3xEb4DBRuoxWbA63sVyT6lpXUoYEFSDjlkKObI
	rZX+WytEk3yNyTbMptEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUT-00000008Wem-3N7g;
	Thu, 14 Nov 2024 02:21:49 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUM-00000008WY0-2rr5
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:21:45 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so52510b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550901; x=1732155701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQpI8oGqjRXIuyayOmjB5gj8CivKUFDc1b3b4GOPe04=;
        b=t4p7Uk5tv6K4scS1kOazhPHh3MX8m5Ot+lBs+kSBlO4kzpwJ0hXFPEY8dgdu8YxjJ0
         f8J821AfZqobUBIW+VaWGN4txxauzJwlhHsI59bfmVu+iCtXjkkMH0nGlvUMBlY0TCWq
         qdMcw83Fi/MUHFCDXWBJHTq/yfvb0AKPioE796+J66uObJG9GouuD1DdT8PsvMxmvPiz
         vG2SLGT4655EIn2Bo3wzfsn2pAUpC4N5knk1jF6e3bM8wFkPIy5Cnwk+E3rL1w8blQtW
         1jTCSNlHtlUPppkwzwtQ/K1oo7OCmEi5Bn5/8OksVS1yU3Q7aHm3vyCv7bk1AxBuPhTY
         fTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550901; x=1732155701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQpI8oGqjRXIuyayOmjB5gj8CivKUFDc1b3b4GOPe04=;
        b=E+H3ONt52QE4DBD0Xkj/u++/XT1ghSoQWaus/EJU3cPp0eHBlhReWurjskJ4z5GEml
         PuhjLU+Wlo/mrZ4DpZ6O50G3UGr2qqz0sS3/m4CSlzYI0wgUWeNDlz41WjpAmqJLnKUA
         T4mP4BSAfkOh5SUYdyMpwAPCNMbtUiR7IzlS9dovK830lg4gL2VDH6Kq98BZk6wFV0ug
         fBMVEDZ2qilh6m2ExN7qbYU5Bst0+W65eroeNe1wC0dDgxCO6zC1Xmf5SW4Qhbib45Im
         DkdwxNi948huv7FQL7Oo7kqdTT5R4NcDJD5+KdmDMf2gGOdi+0NSZy7smo9/L1cp8iaI
         zz6A==
X-Gm-Message-State: AOJu0YzUThI62C4OhUooCAxgif7iLUZjuDGDaOYiU4Wc1IA8lxgomFSZ
	kBvFPYi4oPzsR8Cn93WX4iNFS+cS1B+a4GeRMyOwV5/cVVg5/TbEEsMhKfzH3so=
X-Google-Smtp-Source: AGHT+IEM2CwPcQXZI9Svh2lf00ZEMQVXQk/g3+Zk7IWvLJ5CiFC3TFdqne+Wd+DhOUNFtdaQbE3POw==
X-Received: by 2002:a05:6a21:3295:b0:1db:e96f:4472 with SMTP id adf61e73a8af0-1dc834ee4dbmr976723637.31.1731550901476;
        Wed, 13 Nov 2024 18:21:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:12 -0800
Subject: [PATCH v11 06/14] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20241113-xtheadvector-v11-6-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=GYVIK5RN7sAF5cs9O4ZRqugq2IlOeAFQOiBXIJ04b3Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3AJzT7WHn63qdp6dndHrs0En8vb97OtuXCqsvdP6r
 0j+7vHoKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCINbQz/o2480XpS7OUifLCp
 VKZ23ebvYhodtS/i8rfx5NjZXwj9wfC/yEt7fm4vbxqzwDOdW5wqW05yuUfemLBRw2F22zvNB1s
 4AA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182143_054966_A0365785 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index fe5d4eb9adea..db1d26dfaef9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -314,6 +314,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
