Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF2C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k7m+HtQ+uxl1FFvlDecXA6Ry4nETOVXy3fPazowGxUE=; b=Amqc3FtLqSuVu2
	vblxMs59hEcdIvVNmrdtJW5694bynNoMEqB5s2jAn5Pcrh9ZlV6p7Op9bNujTXa938SCxsZxe7RvE
	XldpOeQBndYu8pFEwl6LltuEQdoz9QIvQlRDH73k9AnFutlZQe1z5/+RW6Y2gDn5pH5VLUdqecO2L
	KdI6Qb9s9ZrBAWdrcTbnVKi1omVQciMQLrnaHjCuRmwKnvdi9Ux59KkWTBJIyXSQFbOuGO7QCAMXi
	t5O92H7fw67LklgaMbB/iujiCdwcCiRq5z3aLh1AN/OdO5iyLGXnim9scEJFk+CLBVeej9/oOsKBA
	wqnWdI0l4C6+Do3SCrQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVwh-000000052TJ-3WG3;
	Fri, 09 May 2025 22:11:55 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVwf-000000052Sp-13jJ
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 22:11:54 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b239763eeddso1172076a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746828712; x=1747433512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FNKweaenlKFl0158o8g+44XHhRIJdVv3x1kdDwr1zNs=;
        b=WCaq9f470M3m7tYRutLeOymfa/J5Up7P0Ju9w7IytHGmFO3nz3hx2WboBqVhaRfI3H
         8XrFUEnSN+fSwniHRPVREj+7rkOfIuM2wXDZGbCIYom29PSxNr0FhS/7qkyx1nN2XFm+
         qv8/s4IJwGQGBQkkX/FrwLuRu/Pr5ugYlGutwNlAoJjgrcJZg4+W+kp4cpDRRS6NG5DH
         FYXFsn2b9bYxGdnlslKzuEm1bHAxKOVhhYlTTiII7VDP0NPOfJnI62RiF/x3xsQvQF+e
         W6Hcy6CbiJY5EYZfLBOOhg45A4Y6Igmo2pJYGYxRX8NDgC5+Qg/NBLTiRDtcbr9W30AA
         LcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746828712; x=1747433512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNKweaenlKFl0158o8g+44XHhRIJdVv3x1kdDwr1zNs=;
        b=Ancf/WbBNfxBB2qfWzNKz/k4V6qJ/FL2QYkHmS+L9LLUu1+EkRWilbvvoydLsEEPnN
         yKTERAXqjCQ0pwoUUH1DIBMiMx1lYinhIRMum2gnNkk+NYyj+xVUWilpuUi7eFqAuzyb
         e+HsU229qoN8GJj3Ti9go+j3eEFIDjohFGwIxgOjDAwwm0N0zQhqDGouCGgTFzY0VX+I
         0J1aGMzI88uzP5O79X/gRUaOhT6hx1DyShRzIErCL0L0kT3YRe3jLxX8d7VxnXlUltPN
         M9u9OZHqSpFiyfAKScJlml+H6dJm1AKVUW8liqHCfQP3aWADtxaFneqxxFcBfgpVlNCm
         p6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXFFb569tS6xKLHHnjBKuUy/x6E1nKHNj5EPEDkr9rwjjS1R+kTo9NX7q8soz8xpeVZ+po8NCBtR9pUnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU//1JAhZ2m8usraEbQPpTUW2ZlmlX6+df/p1wcnqpW6S9RsBX
	staGPc7zwCWUoy0sPHDOkZ5ZhiBaK+LZZ09e5sMRi5hE6zXIsD/K
X-Gm-Gg: ASbGncsAV4eQ+gKnBtKsIDSg1YbRnkIxOE7iNbJZMUBCd/2rWwdihPNHO3ChrlMsYdX
	j1J+T6bMERpermdnrm7WLAhdNokAoBkavoCnmi6n4NUd76PmPJ6OBMEKI5xk0R3dLyjs8Qy3l4s
	hF0EnUr8fokmKwZG6Opn/jqz1SIgWRoJy9uMgfGLyhoFNnDORI5gLu7rH2KSRHZh+KoC2BmpywP
	BJ2Wh5qoVEPu67AqVY67WJ4fv8lCED83ernPQbC8J+4bmHO2lgnmlexjBr4NkJ4Zn78f1fglwao
	bwPFachLIoy0JY6ttyksu/WkbPNvUe5Bw2BHfhYX9GOEpJGoJWEHeZLijJtFFA==
X-Google-Smtp-Source: AGHT+IEaF56IevDwH1PlJFzgIzn4Rz1u6SE6rS1RLdeE8PwEKVL790XcKH2PSR3s+mYVPQUNRYS3gQ==
X-Received: by 2002:a17:903:3baf:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22fc8b0faeamr60003715ad.6.1746828711068;
        Fri, 09 May 2025 15:11:51 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7b2a004sm22510225ad.106.2025.05.09.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:11:50 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Sat, 10 May 2025 06:11:21 +0800
Message-ID: <cover.1746828006.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_151153_288813_431C3C0C 
X-CRM114-Status: UNSURE (   6.53  )
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

Add xtheadvector & ziccrse for sg2042

Thanks,
Han

Han Gao (2):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 320 ++++++++++++--------
 1 file changed, 192 insertions(+), 128 deletions(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
