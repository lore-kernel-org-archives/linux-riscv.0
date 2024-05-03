Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF6AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDzex8MTeNej+Xf932wHKboV2iqZ77NKVondmPbaR3M=; b=KIgl/pn8beIk7T
	D/rCtfDNyqhrU6/QVewaaf/ZcckG9UOifr6CSCfwQ7+UI8Fs1FF+svDNbpQqixQUtgAfAQzp5mt2m
	z/CiAl/c2tlmCu692rbtiB1rdFsxBtIdbTNuKdYiv+ZoM2SJlXfPGl3OPWyYHjRbpK2TJRXs4WoXZ
	nbiqgty8Hh/WYYSOE0yk4xgNfUbZLggYZNggPh4utDV8yDH91YOajIANcnHZiraPLMqxu7aakBsu5
	LxhU07C001sZ4aFIa0SFcE/N2lY1yyPUjiZDtAnwtYx1MLjcjsLwWAJY4/+PhvxfXT+M2GycPAnDq
	BVIyp9osUr6an4IFSjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kqF-0000000F2cd-1TYC;
	Fri, 03 May 2024 04:48:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpE-0000000F1gd-0NNw
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 04:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=; b=bZVDorqXfMX5z7oYuI/2/vUQ0u
	WwVhJYIxpRHd9M35wg9LzD/yhsDnl9sYfeDKDjW6aADrfjnnOXehIONcXfmLWu2xIGg2KcUjeyzkM
	Jba/VKxpQhFvDBhtXXZI6S2WeEs+xDYYego6yViaLRmiQwGR3p0wE10YXj8QCAg2b2lLBaRc6t49y
	O2WIGCpYsxXtaulB21v9L7mbG4op98joRIPXCh/UmRfbsK/kNUQI7HaKzQVAvfk7+x9/uQmRrnirg
	lMMjPUt9OeI74g1ufZTcrozGxJKY0k0w/ySxohuwAiogr/uF/BOwsIwqkSbQeb0tNDhJ6EtVuIkkR
	BqO6YRiw==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpA-00000000Q1h-3vpu
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ec4b2400b6so33826825ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711627; x=1715316427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=Qm0nIErUHcfAh9LsWhke22X4XnshhFaCFtNVNDrbhejZPB2Uzni0uv5u9tk7rZRJs7
         kUxv/goo/ah+ezNHfZRCj+ruRpyB86gLPHptVakHXfEJbrJKszSHszWNUA6QkZ396cPH
         IiNRPprapS3saqpLf0F6tf22Nmow2iYS6xKut6/yXg78eVvTLZDEZvmoSechA1yEEnCd
         KusFecxz2U2y1KerX3lYFqeuE7WEsdzLuYQYUQ1Sty4yNku+13CWZ+OHtR/VS01jFYX/
         xFRFB5wOLEadvRFgPcjjJdBvrYO7gkyxWNQ2dYYVvrdn+jErvnVyUe0HblrYLb6vFmKt
         teWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711627; x=1715316427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=EbO4COw7rCBCiFpvqISAqtbACHgUIXVzWwJEY+rKxIpxSMQu7TRMn7gPMlmPIu+td/
         bCk8YZ58A5Vo2ebzm6c2k3qfRsxOvu4nFw/NHJHLB3dbBikPq1kIgADaR080oewuddtJ
         sRfv6cFjWRNgD4l+9zYXU/DPEfeP9qobKlXinCAqrULJ8xMg/IZJD71nuoKTZe7GWIAQ
         GUGYlKw9YQgmFR9o//Ks7Sfb+jpNwzrQWBhCK2WrdZMJYn2gmvA+U3gUlwEFnOJSYRm4
         LANpoLQjdIdQlLdQPtzGdpSIENcnOjC8aSS+cfd2KVdG4nzQLW3/XjIVT5Qerb523UVw
         GDnQ==
X-Gm-Message-State: AOJu0YyR/7PminSt3Pkp8dijSeHGvzsLiwyO7TTR09462Isi1l9cyp+e
	4NvQe0dWGNQRhC992Ni68i5YJ7W0WPH8WlX4qtaEwckdvw13QH5EyEaz4/54nF8=
X-Google-Smtp-Source: AGHT+IGLvfuIAlBMYBUVi+TLiO4QdvrYlPkTzw3LbvYys310NrxKX5klWbfcjGlfYftnOqjktyh3bg==
X-Received: by 2002:a17:903:191:b0:1eb:73c2:6b4a with SMTP id z17-20020a170903019100b001eb73c26b4amr1926925plg.8.1714711627297;
        Thu, 02 May 2024 21:47:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:46 -0700
Subject: [PATCH v5 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-11-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=UFZlFM3RPKRvEq4iil4sCALt5muWs8uugdi45/DJmZsHXC3Ny7LZMEMUZMpO4ymqs1OLTreJo
 XGaQ1FIh62qCFEPNP6HOy8o4Nghcqt7bK10HySuu2pzzpqXLVPmjp7o
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_054709_137921_9353A73C 
X-CRM114-Status: UNSURE (   8.58  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
