Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE0FB5178
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 23:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o+Qlhjhs0WHpSZ7BEZ6bfzYs6Jyz8a/o1ACB3RVORFU=; b=Jz8OyRTim7BSAH
	6MfrBzxgcazk5UcsPzsSLWRf/gG4CAaf0WIWSNeJHiwYKJ5vaMZQlNag3/tcP+68EBYaHwEvUvyrj
	ty80TgsVEzc2MG0W26S8nS665kMnn9KiaD3mjXw9CoT5owiOjuxPI2M6a3OpNb7ilh/7LI8c5OWW/
	T6NYxjfEbPqvBfqfdZeKzdlb6QwbA4B+vCCo9NbX3qTtrT0AIsCDfW0tmq+XnEA2kE2D57YgRvDIl
	aIb98kDnHEfQVO/RdGXLVofparR5L7fIxOrlZCspXDV7LsOw1MFh7vzXDxQ9LUNY+pEz7xw/6wTnl
	aX446c6LFzsNDmEnMslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tLw-00000005csB-0SW4;
	Mon, 06 Apr 2026 23:27:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tLu-00000005crn-1HU1
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 23:27:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a871daa98fso34561695ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775518049; x=1776122849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50N06dk5rv5+IwRtcE9Xz5zFkvyVJbkQQF12RzsxXe4=;
        b=BzZqeC3lmdalzgOEEKBqvlJdfBUETXd+9ihnI5G1KL3+WQS7Ty1ksDRmqeL0Dc6zXD
         V8ig504y3BQkvNBxc5pjngeUUyKIpm8xeKG7Yo/W/alAQ8X1wLbNDhtvr+tO+qDIEKAj
         ziof0OKNzZS8pzPzQMbidr+73YtJ/+JiXidlZAjUIk1K3HRFIRWQg82RcTF1q+NO6TyC
         EKuLB1cI6Mf26/Rts4L6NhlKs3q+fgP1wOjusPO9QgCszb6FPLIZBbCpuSEru4jLkLF9
         Ck63nsEcdlqDS+y6PJNGJTWuP5N8ou2I6Riy6xu93XPNydvTcJmbsZLTGeyyqWG/Ko+G
         ZzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775518049; x=1776122849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50N06dk5rv5+IwRtcE9Xz5zFkvyVJbkQQF12RzsxXe4=;
        b=WhTwOwxbZq/oqA81y2wIPvdBBxyrcdezaovWVb9GsqnCWHoAT17LgWPVciKYK4cCvQ
         3jzw8TRXWb6sbdqVXdYBNzkNtTVPQxY7e2Urs8VnZHcTMb+DoLrPjuMM5Nu6gXXksxJq
         QcleNP2ClxapIDO7TXftHZJLntzIt3n9IXBvGQAWxP4V8lXSkXmM2M+OKx/LYfTdTKbT
         xSEjx2aYYTIw7UE8Y3AJ52VMtr/dbsKiXBqWl4z2xY5fRk6ey9w87Yat3v8TCz+bYSKW
         bKatMNUx/IuQu/MZ4DU5iGNtMsbR92UZOYW2VxrZfyEAILQdxxKVPRN5BETzsq6m8rrp
         KFIg==
X-Forwarded-Encrypted: i=1; AJvYcCXUV9FBMnSeBUkA2tI9q4Ucgq7DAVsy/O/UwDzQ+awBcc5V4WFdT3WsoOdEYHwtEO0dd/7HZX7vAIjvCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlm6+aqZ8//K/m5K/jGhGmLCj++XD4zhtHRXczbw8DDJVXzRVo
	DxeM+1GLbRvsvPHDPAdnIaw+V0EWJqqG9rg7Ltjo9P7HMLCQ9baRlT1j
X-Gm-Gg: AeBDieuEtz5EJEbAGuDAPOxvGOni5qqDEu69Cq3Er7T340xqKX0izPrBJB6ZN8ytb/z
	FfUzoOq5QJ2OAjq0sJR13Ww2rsouwUAOO1R8H+JUFZA7WA2BvKhDG4ZAb9xCLfdLXM7A99gzA32
	bBJ3xl939ieBrZTDAJGV/+BvBKssdAzP4NVDst3BwF1+610RnfppNftpJF7+ZiakIo6CBCMu+Vx
	3gBokMYi5C69xaBvjAqiyHHPjkcvWbB0kzM7B8cYpBo0Z01XUmKrayYkGQIIHtoyQ2DO/WDUjCR
	yc4Pi9h3aLvWqDCbCDTU3Z6r4wbyQ/V1dj+iGRv8RnJa9J7i4EO3tFSXlbUDqPtpOSez9XFNAN0
	VXMZ7hevUZT9oLgjbBqDN76IlhOAlTh5tEvjt78/o0/jSPWCg0x8A38Cuaa13S86TzCcSPRb5jr
	wdnUqmG++X7q5lWLWoolaIkq0=
X-Received: by 2002:a17:903:1b4b:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b28175bf51mr156601865ad.19.1775518049008;
        Mon, 06 Apr 2026 16:27:29 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a4791sm149536625ad.66.2026.04.06.16.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:27:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>,
	Guo Ren <guoren@kernel.org>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: sophgo: Fix CPU unit address for SG2042/SG2044
Date: Tue,  7 Apr 2026 07:26:53 +0800
Message-ID: <20260406232655.144043-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_162730_350554_555B1319 
X-CRM114-Status: UNSURE (   6.50  )
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

The CPU unit addres for SG2042/SG2044 misused the decimal number for the
unit address, Refer to this discussion in the Link, it should be in the
hex format.

Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/

Inochi Amaoto (2):
  riscv: dts: sophgo: sg2044: use hex for CPU unit address
  riscv: dts: sophgo: sg2042: use hex for CPU unit address

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
 2 files changed, 236 insertions(+), 236 deletions(-)

--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
