Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C66CC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 22:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PW461y2ryavjHPYSkQJgsYWT6nBLCSOzWNMfFqgBejs=; b=iSKDCMz1+yQZtM
	m859PKhzuViDzbZ+Q3bN5u2kt0B5nTkisxZ4+6ZAMfZMAn+RJSP/8QOeWhVnH0QpBtLjfFWkV/5oz
	p971t5QmeoMMHROTVQrZnrcttemgrr1Ek5bi9qrauAnOYVAjWCPGYwNhoWDRjDcHus3VlmWideEyv
	n+oLJy5tyTpZMNcuHfcfrns1r7MtOQl7ZD4fKyOQUtTXs6tr9WOz5bfPSbdYGffKQpf2gAA7xRi1a
	QqKmfx9JnoMqqkZ3lwkE7XsH6WZPJp+z2u+wO9wA8c7Mwt+R7Pf9cwZPTADmToYqDcWG7X5M+DoR9
	4sFwKSoWOHiKaKX/y28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWCE-0000000549u-1WJY;
	Fri, 09 May 2025 22:27:58 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWC8-0000000548R-1oa2
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 22:27:57 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739525d4e12so2615106b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 15:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746829671; x=1747434471; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlfY6HFrt6KjD7LtGN0cH5vsLg4tj5XTdmzdfNRbZFQ=;
        b=y38Hd93GO2Y4tzTMjLY9Scq8GbuDTDK9pEaL1vNk3IKXeWk8EOjWA3eiXBHSESiWSs
         vIjRbKx4Rjtc1BI1l/OOWc5N0kWaZvPLjtyrt4FBik0JoB8rM75iAYcM4qNV+mnujTBU
         byzTEw2ky1d2oQCyxNzmmGOy6q7BAyLz2M046AEJ67s//chIWpNsrjpxPhFxXrKyaLTH
         9k6BVTdFpQeM5fdYVGeJAJb71Xb++J8vialvns/G8wXwHnG3XbALZ6BGu4lKk7cjnTq+
         UxFeAABOHHgt7dpkK16oGcrSVtLPfNHngJb/fH1NOT/vhydvC5jjYvaPX1kj9+dU41Jb
         TTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746829671; x=1747434471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlfY6HFrt6KjD7LtGN0cH5vsLg4tj5XTdmzdfNRbZFQ=;
        b=XGsdx/v9mdHn05us0rgoctPW90whYspa/oZcj2Tj2ogG6erJ94t8FdMVnU1KhNyGcI
         IQAK0kbhvpiPejPCsV5/UMXav/n7Igc0S3llarVUaujN94xNV67cgv1rDLaFcElOI8Ov
         4rLvZwy9foXHDuXhmE6e0MDcBkJkam1fW/lzQLLKcUHja9TV5vZ9AcTUNLy4ZFiqPxpP
         u7pXNIo51R+DhRjb0omc3RQSu11g6C8zPDMaDuZJOCH1Gd9/2gtQ/2mkkvD8EbtKgeVh
         0Zf0js1IRABDtCZU0cfcbsYPZM0Fa2ASs33iZSaYegQMJkHJm4C20YVC0YtmR+OlcWdY
         D1bg==
X-Forwarded-Encrypted: i=1; AJvYcCXFZgF1bvsZaNQsBn+vZtKIKrms1KzuiiI6PHQd+LZA4pw8Ra8O1qVuT2iJDxZEeE53Hd+I7YbP8aetpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYBmptQouS4ciH/5NSlZIYzxr0rbKzNHLujY7E2ckneijUqPk
	JUD33xiKsAEIEPFJ4DjcAcxR26tTmw0VwfGu+vyBn8Z47WUEMIkquhnnWy0qkHI=
X-Gm-Gg: ASbGncvq2U1vdYBFW5wYz/2K+0AmRJa9OmEbzSWn2O8lYmXMXrpmhWhRuFkWVtztfWJ
	4O2f5HS2KWtmLtCSwv8oxSpVy+ZXEoCHZkO2E5YbYKTIwBs8HZnWDfj59eIAIIlc3hPTWaibe5+
	0dMGlpaHeZ9xMAz5E74iNs1mC1V8CzObMJ+/qu1NfxRLV3zoEmhaT6E1TJR8Pa54sOlAypQX4Vd
	lN7lTeO50mxhGgBPSyfrJV6qD4btICFrb6SzNiFwaer/YGB6g0Svdd/wO+DXn0PXs92y/apdKJV
	iUYUiv00Q0TfXkqxUy2cqc570WCIqdB/cgat9/tqMz5e0+vO374qW/e1aQ==
X-Google-Smtp-Source: AGHT+IENf7Kcb8dJPQCDteAQPpxoaSfjEOkbSR/iBVh1JMloeodx77VyrnDGlCBUYNSjh2bS0sBuDQ==
X-Received: by 2002:a17:903:41c2:b0:22e:62da:2e66 with SMTP id d9443c01a7336-22fc8c78182mr82262675ad.24.1746829671116;
        Fri, 09 May 2025 15:27:51 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a0e52sm22426175ad.216.2025.05.09.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:27:50 -0700 (PDT)
Date: Fri, 9 May 2025 15:27:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: T-HEAD Devicetrees for v6.16
Message-ID: <aB6BZMWDXoRXrZVf@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_152752_736062_88F17BBB 
X-CRM114-Status: UNSURE (   6.81  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.16

for you to fetch changes up to a4c95b924d513728df8631471eb3b1c300909e21:

  riscv: dts: thead: Add device tree VO clock controller (2025-05-07 23:38:41 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.16

There are several additions for the T-Head TH1520 SoC:

 - AON (Always-On) node which serves as a power-domain controller
 - Reset controller node
 - VO (Video Output) clock controller node

These changes have all been tested in linux-next with the corresponding
driver patches.

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (3):
      riscv: dts: thead: Introduce power domain nodes with aon firmware
      riscv: dts: thead: Introduce reset controller node
      riscv: dts: thead: Add device tree VO clock controller

 arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
