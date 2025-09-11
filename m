Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EECCAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fYCHwaD4lWw7B6WtNQLY9ckvZnyvO7Sz2eF2P/U+yc=; b=p8QC8ptyk2QbMi
	Xkf5H0M4Wxea3ci0+SRvsZTbHnm+WRl9Y+vv7ZT3kfZzqPD72EqNTIpszPuypwBGNEvq3VxdPfm2f
	ce0E0XKvvhTQkCmSbzr16ZGxZyX/uX+F7bwyMHJVsNwZxcTx0v4HTzS1t/IdyYT4EtDZo5VxImBlp
	sKj2wPu1Y6sPUOm6o5h+7YbQWxbpTTfsZBw/M3Jzjqgd9Voa0YgzoB2eFQ59/o0gng4Nc/ANSpLfn
	fkeCBiCqJwZw+CCFTJacChLkJyeP2f8SMIZk+Lrn7NwmqCEuwkLDlLrun26E8kcvImxwZCe0jqxvb
	zOfRLU4gpZsMS0qXvtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmJ2-00000004obo-1Gnb;
	Thu, 11 Sep 2025 18:46:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmIz-00000004oaU-45Ot
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 18:46:03 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7742adc1f25so743542b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616361; x=1758221161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11u3ge/kZdqOdUCXMGxE61YAG8eluHRkzjjiYZfqJsk=;
        b=OAI9NzkEvYX5ggDls80HqlPbzVVOqrNHQGIBNFlVukbCf6c8LEPuNHvf3eQu9V2VsX
         alkoCF2EoPxR6tDnrMOBMxcQc/z0zbx2BMY+Nz5KAfkmVrkApvhQWfSqr1fsY7UNwLBt
         inKL5sFgwC0FVi3ebcG71Yt5CRVY1lC/I+Wx+COSfuyV3V79+mcCoPxNKuPzjejOnr6g
         fChk/ZgUO5om0bHGolnWpDTFd2UVRzv1Pjg0DxHhQLC8OIhssfxc48I8neHS7zKuh/W6
         4Z9G+cmCG4SFItyYCQHRcOcQliWqH3EY1KT88Wv/YyU7Ndr5LVKKbOLEcXV17mmWwvlq
         C3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616361; x=1758221161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11u3ge/kZdqOdUCXMGxE61YAG8eluHRkzjjiYZfqJsk=;
        b=tFpqk3esHvTUlmi+4mF26td64OOIQxDIF+sbkLU3J5ywSMW4QSPBZHoNkC9xQ6uKHg
         PE94Xcp/89cgIEpN0NErGewBCumnG2Ere/GzUR3yG+0/tj9hvLTMzbWFx9AZgbqvsdOm
         CiXGnwfALElvgmQXoEaG7IH8yczi0pJw2qw+pLvztxvTMOwKJgzeox3uofCfQ0ctJuGj
         c91dR2Pny8Untz72qwv9aB9CitEAvEm4K44bhrxFhJcyQ5nybvuLDgxif3QUlTt458d6
         qq53qDF7V+48corkNUIMRYDvM1vtEjoHOKUCaZZWf0ss3gRYX606hffD9c8rNWff7GM+
         r9WA==
X-Gm-Message-State: AOJu0Yzn4DnwcJgXQ3MhqsHioIzqJr9FxB/euOIV4UYVm0zaoZ2I5ARS
	5DC5Dy+PukxDE/mZkIVUMzoLaIW7GTqRxIalYlT3UXLcuEtpBsaHSRLb
X-Gm-Gg: ASbGncuugNa4blEc+aJwHAzukP+46zh7ek4nimwpmWKeNROKKs5r0jDahOG7CiCC12v
	8fjNH64HioUmf8Fg/DoI8SfRjBNls1Zsirv7HJl6Zk2OFgWGcd8GjpSaPpsBgzqHjQSTJDtjOy5
	H55dKtRkkvA71cGvaLnSWBQn/PRGzIcFwRet8KrFAGsRSQhzPDFKq4TwkMw/e27A6+cp/pJ9YX6
	dgfnzUhJDeRG/qgp8OAt+bzeN3WLifah76tIqrYXA1uwfMieBGmn2PdbtyrI79vaw+lVZXA80f8
	kVcgj3fWhixgKWGiMD7aNjCJB0PhHpc64so+251ZSRDArgG2PVwV6qKK/XSYECypaucYh37ADtK
	yAhKJ3zLD90mvcOCrF1Iilpznmwz33HHNFbmrQCMwfMo40e6C7C310m7Fq7fcFS8nSufOJ3y5I6
	cfEDmVWGPTMrgwk6pda9kdtQ==
X-Google-Smtp-Source: AGHT+IHd/qXnQXTsb5UgYgP0uV+8e03FjtD7UCE3WoNBYNYrck3TNfpFhSjkvJMDSsyUWGXnMfLorg==
X-Received: by 2002:a05:6a20:6a06:b0:243:966e:21a with SMTP id adf61e73a8af0-2602bb59c2cmr401286637.36.1757616360643;
        Thu, 11 Sep 2025 11:46:00 -0700 (PDT)
Received: from localhost.localdomain (static.148.173.216.95.clients.your-server.de. [95.216.173.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b34790sm2762616b3a.81.2025.09.11.11.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:46:00 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 1/3] riscv: dts: thead: add xtheadvector to the th1520 devicetree
Date: Fri, 12 Sep 2025 02:45:26 +0800
Message-ID: <20250911184528.1512543-2-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911184528.1512543-1-rabenda.cn@gmail.com>
References: <20250911184528.1512543-1-rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114602_014182_F0AB8A0C 
X-CRM114-Status: GOOD (  10.67  )
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

The th1520 support xtheadvector [1] so it can be included in the
devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].

This can be tested by passing the "mitigations=off" kernel parameter.

Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42724bf7e90e..59d1927764a6 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -25,7 +25,8 @@ c910_0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -49,7 +50,8 @@ c910_1: cpu@1 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -73,7 +75,8 @@ c910_2: cpu@2 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -97,7 +100,8 @@ c910_3: cpu@3 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
