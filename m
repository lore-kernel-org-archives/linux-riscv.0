Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E800C8303C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 00:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z3t3yKPGbU+TRtdAGtc/yWjlhYwM8qxXdq/YQ1lt+WQ=; b=j8ZTqUzb3+pvE5
	klWvHvNUV0gRpoFB3REeC7RTGhmnCOYbIJZs/sC66rrrYg0KEQpJfsm5QfZxw9kwEZSl8MqosBr2K
	izTEycjEKMczUC9hs9Nc3YPD8i2FB2nLRATMLImznYJzMIdBPM9NI1ivEscvlKWKHXg+Ia6xWVtmb
	SC/NdAQUE8LyfML46R3HS+P73zzIKLwvnULKdkpXoTeKW+prcfFO3Ziun9lN14vtmlsFI74JWOoNq
	N3ckwfVeo61iKK0eDUoFxe848E7ZcxYIKfV4XXeVPUwlmBo77TSO43wfgkeyPxXE0lKAqJPTKNcyS
	seZwg7iDpbIdEiQE7XqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX88u-00000009ta7-3wzn;
	Thu, 03 Jul 2025 00:49:36 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX7yo-00000009slb-276C
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 00:39:12 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-879d2e419b9so5502372a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 17:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503149; x=1752107949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp6SVLQWv+yq/FCUnVZXe5xSnWGW/xX2hl0tN5GjdNg=;
        b=mhv5PrVkCyTmU7aqqgbqc14A5IaL2D19MPdsodSvEoJ1PfVdFpQlRAVttJj+3KeAmY
         8hYp/1F/KlCPo6a0dmfDisgu6aWJ/SPG4u6UUdqhK/qMUMd/DiR2jTcB1qg1KTlV8pqC
         /V+7GRm9QTH8XJs01u3T7v8j+zp0oLSlMxrGu45spLEjsOIwTEeDZttNEfgykiGrqPcT
         xydcj0JI4K/bFHXt8gQtT9fPNXNjIUn069cghMuamccmaz3q02OfdGHxm1I06OzksZ6I
         tiRnp5Mo2OiicMzlmUZUBVa0NJmxEJLtPZaq/mR98c1aGSO2LvdT7HQvfSFM8571LZsC
         KiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503149; x=1752107949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp6SVLQWv+yq/FCUnVZXe5xSnWGW/xX2hl0tN5GjdNg=;
        b=KdqB14Y+alwMfclZeotQNTH5XwYj+HQpLoXTC/qw3sKaVxMkpvlFQqTiQSUT69kF29
         C7wr6epKUL/wjyBT/lqwHMJX5dk9JkygW7a5isyX8I9YowVd0i9IWQtuMS1ixtQ3ZFCT
         81BfWGRJIwbcDbrzeNjBfZKaUQlf8VTurEJ5H6RyTVrUNr9igoEiZ2Rer8Vx/wROw3Fq
         Hqum6Gdcii+Lx6ntLJUhPWvBWAA6+11E+WomPKLWq3GJN5AE8qvthFALJ23REdoAbafD
         BSToxyff2gm4O/bbSrk7IIoWRz17DuDj3qVB4b+vs4WB/qT9vymExOFcsThSgkLyRW6U
         eBxA==
X-Forwarded-Encrypted: i=1; AJvYcCWruh0LV4iiXGGQ30ZBM4OmOGk9wl+CV014C26ycufjVuVIJUOnAuksLM7tDlL2gJi7O56J8bcixuI0Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaLkTCKGjfI+zSsvwbZuo7hOwRDbkTC4v1FdaffTyqK/HrvXBu
	U8efauNQnBuJXeGqtO7mfmxIr4hEK/pt+JORK6oLZgKemczO9hAkqFF6
X-Gm-Gg: ASbGncsKVocHHrGJ1g4+WU/sgkxOtkOkmV9hnbYkj1OWaLIbhZYTqkOuc4hgM+j4kli
	7m65sudq/HX+lCmr3HMblegJ7plWtx3wZ0CLM/hCxMIivnDbSnO7uTuvFgJTAW6rlfbJ9iMteFQ
	ChznGXptni7F0tyUL7eKLVG3fX1F3HOwC+UwNNgTAKDT83GU63xhKTQ+jEzpB71fbbZw1GDh7yh
	DQXr7CD6FTYUBjtxTsKJ5X2dkn2hm9qt3kh88Dif4ccEVUTP5Gn786pW0YtPTGWNliPg7nrqH3p
	BpMSrY00PO7BjkUiWOhwzpcXOyeu/CSbrj9LMi1dXa1dJ9PQ7fMo6q7R2Yx0xiKVMJMS2RYK
X-Google-Smtp-Source: AGHT+IE6EjPWTP12xSibuAaTHAAp7XhOTvQoc548Zur0R4Hz0WB245X9+rq3l6A2vL6aDv6YxuH4PQ==
X-Received: by 2002:a05:6a21:9988:b0:21a:de8e:5cc3 with SMTP id adf61e73a8af0-222d7dcf2e0mr8369054637.4.1751503149400;
        Wed, 02 Jul 2025 17:39:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541e8fasm15585369b3a.67.2025.07.02.17.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:39:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
Date: Thu,  3 Jul 2025 08:38:43 +0800
Message-ID: <20250703003844.84617-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_173910_542274_093EF068 
X-CRM114-Status: UNSURE (   7.66  )
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

Add PMU configuration for the cpu of sg2044, which is the V2
version of C920.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 91 +++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 6a35ed8f253c..2d21b2881ab8 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -2778,6 +2778,97 @@ l3_cache: cache-controller-16 {
 		};
 	};
 
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmevent =
+			<0x00003 0x00000000 0x00000010>,
+			<0x00004 0x00000000 0x00000011>,
+			<0x00005 0x00000000 0x00000007>,
+			<0x00006 0x00000000 0x00000006>,
+			<0x00008 0x00000000 0x00000027>,
+			<0x00009 0x00000000 0x00000028>,
+			<0x10000 0x00000000 0x0000000c>,
+			<0x10001 0x00000000 0x0000000d>,
+			<0x10002 0x00000000 0x0000000e>,
+			<0x10003 0x00000000 0x0000000f>,
+			<0x10008 0x00000000 0x00000001>,
+			<0x10009 0x00000000 0x00000002>,
+			<0x10010 0x00000000 0x00000010>,
+			<0x10011 0x00000000 0x00000011>,
+			<0x10012 0x00000000 0x00000012>,
+			<0x10013 0x00000000 0x00000013>,
+			<0x10019 0x00000000 0x00000004>,
+			<0x10021 0x00000000 0x00000003>,
+			<0x10030 0x00000000 0x0000001c>,
+			<0x10031 0x00000000 0x0000001b>;
+		riscv,event-to-mhpmcounters =
+			<0x00003 0x00003 0xfffffff8>,
+			<0x00004 0x00004 0xfffffff8>,
+			<0x00005 0x00005 0xfffffff8>,
+			<0x00006 0x00006 0xfffffff8>,
+			<0x00007 0x00007 0xfffffff8>,
+			<0x00008 0x00008 0xfffffff8>,
+			<0x00009 0x00009 0xfffffff8>,
+			<0x0000a 0x0000a 0xfffffff8>,
+			<0x10000 0x10000 0xfffffff8>,
+			<0x10001 0x10001 0xfffffff8>,
+			<0x10002 0x10002 0xfffffff8>,
+			<0x10003 0x10003 0xfffffff8>,
+			<0x10008 0x10008 0xfffffff8>,
+			<0x10009 0x10009 0xfffffff8>,
+			<0x10010 0x10010 0xfffffff8>,
+			<0x10011 0x10011 0xfffffff8>,
+			<0x10012 0x10012 0xfffffff8>,
+			<0x10013 0x10013 0xfffffff8>,
+			<0x10019 0x10019 0xfffffff8>,
+			<0x10021 0x10021 0xfffffff8>,
+			<0x10030 0x10030 0xfffffff8>,
+			<0x10031 0x10031 0xfffffff8>;
+		riscv,raw-event-to-mhpmcounters =
+			<0x00000000 0x00000001 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000002 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000003 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000004 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000005 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000006 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000007 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000008 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000009 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000010 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000011 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000012 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000013 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000014 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000015 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000016 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000017 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000018 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000019 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000020 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000021 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000022 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000023 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000024 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000025 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000026 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000027 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000028 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000029 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0xfffffff8>;
+	};
+
 	soc {
 		intc: interrupt-controller@6d40000000 {
 			compatible = "sophgo,sg2044-plic", "thead,c900-plic";
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
