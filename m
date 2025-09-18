Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D7ACAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yLeDgWB8PAjg1AESWXsEweHBGDK5eo/WSwkHoIGatBo=; b=DJBVHwymdv8EXT
	ade3BQ4vA5Nfxi7w0ZJ+92SEx1mAsiQml4+J5L9/neWVSk54TLdCD/KoGJq5zfMBqUuMr3I7QGTMj
	qmgyMrJXle2kHSdnlwzayKHx5sn2EVCBqzAB9dtQ0t1JwF9hrH0vaM4ZSwjFqKwYgtqlBJFpEjfpT
	eMEJp+Bul8AP1tOwe0aYwP90FbhpbU1XE0lLz2FSVTXUsFLHkjFkA2egPDhkbyhNSVilmaMl9UptS
	v2mL0NsXdNUdzqwk/F813QIYrSkY8LxFQfZnWFQXbj7JHugdSW/so81QkY6RZRwtmBGfHYcsQP6HS
	uR5ivOT9HEDcpxNceZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVF-000000018GT-2KWC;
	Thu, 18 Sep 2025 20:45:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVC-000000018G5-2uvV
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 20:45:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7761a8a1dbcso1390635b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758228313; x=1758833113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OndiLXsBaZlIfnc6wgFkQBsEvn2pe7regfwA2hv/6vI=;
        b=OQ+i4HumWSav1Z2lkcL8nBdeG4x+l9dNhPb3s+siYTYsk0jSDoCNwZDzV5k53CVDF6
         l3+12ut21q0TgS5SeIpG/nTHjmS/SpjK1gQg3dUlK6YTYxKFSO/gygy12zDcrbobvvdf
         wuEyuv8KaCeAwmkNQEzG8ObmPHuKsuei3jY1kbl235THG9KHCnfxwK2Fdh1nZ3TKonK+
         szYcRl7VZeTfHG1hF4jEl9+IrFrZCrHm68Sq7Gdi9XrHgP+trFza4cc6+4A0c/9vi9Hy
         fE8M9fFi6kH2pYOk3GcM99YQUrPoRa0YGqD9jIP7ugyvBBf9vFjfejREw/HCIlgGaZAC
         JyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758228313; x=1758833113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OndiLXsBaZlIfnc6wgFkQBsEvn2pe7regfwA2hv/6vI=;
        b=DsvNwlATkgDY3kKNPm5PivKDaqDxNBF3YmhrcGFfq3FYRIh5BEFvmDCtyOe9Ql2IuW
         UNi6sUzSB81ZiWkevLBF2OQUUGWSXj/ykIcqb1/+EPZ2mBfKSH/QvUdiSP+fAuL5vpde
         5dZi4NeosUH9/qpAMaWTF9WFfrzG37QFvCO9VU9yBGPftHK8DBgDBk59JsY++AYRA9+B
         ChgZhh7DaCWS3EQj9V/iMsfsgBl1iuBCkYkq9ktVPwhdlE4uPdCED33ucSUdehS0GTPS
         HjenY6Fv1JZpe0c5hndLLyxJXqBkpnEJY1hAvidnedExnqBqiJYOTIMVYyq/JaUgrAij
         NJrg==
X-Gm-Message-State: AOJu0YxS0LaYe8f7sZj9ki0KEQkCSp7j1LH4NTXeHABNHOZdKzn4rjsr
	nYr4JU3KUrC1/0TEjBZrPqqeiOPJxMrGTuhE/azpcEMwQZ5Ee72HTE+b
X-Gm-Gg: ASbGncu5v0m59KNqt9Omf5SuCvR6QBWk0sIuvwEQKJ/nZvkrVjU/ZTtzw9GR1ZBXAaH
	XGqX+H5xemSmacEOU4vvLFdiJ6YpYtKM2eAZ9eQ0HK2+4i5UZ5bjgDmA3oXnULhudyYpoq7zBlq
	pusUNOEB1hLElAyYGrLaWuFhjc57FMWBI+4VW9qIAfEZvxxHaOWqS8Ep5qiF2cSy7cEgBwU3pol
	vvkaQpDWZhRd5Yc4Pg2M+hMTmiaagPZ6pO+FCcFLoBLM9VwJSVQVspIsiHZ3enANd6zsp7v41mj
	ZZ0mPqNomGEm+K0lkXI3hAZSIWMgw+lW6CH9WGsRk5UIMPZkAmLVfOcoLiQAVb5egoYgU3t81S3
	H+hBY5kss6a881tNP3ywYwlxwIIR/OpyQhD9wDQouEgRXLDvOpVE=
X-Google-Smtp-Source: AGHT+IH6nT7K0iPQvyubO2xs7c/GfuU5J21G9ftRRvl+G+ljHMvaAOMJ9VufECcV+u3dMud2d7dvVw==
X-Received: by 2002:a05:6a20:7f9e:b0:245:fdeb:d26b with SMTP id adf61e73a8af0-2925e23aaa3mr1419052637.15.1758228313064;
        Thu, 18 Sep 2025 13:45:13 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aff2sm3178181a12.1.2025.09.18.13.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 13:45:12 -0700 (PDT)
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
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] riscv: dts: thead: add more th1520 isa extension support
Date: Fri, 19 Sep 2025 04:44:46 +0800
Message-ID: <cover.1758228055.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_134514_738421_E05C9451 
X-CRM114-Status: UNSURE (   8.03  )
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

Add xtheadvector & ziccrse & zfh for th1520

Updated the commit message for the patchset

Thanks,
Han

---
v1: https://lore.kernel.org/all/20250911184528.1512543-1-rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: thead: add xtheadvector to the th1520 devicetree
  riscv: dts: thead: add ziccrse for th1520
  riscv: dts: thead: add zfh for th1520

 arch/riscv/boot/dts/thead/th1520.dtsi | 28 +++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
