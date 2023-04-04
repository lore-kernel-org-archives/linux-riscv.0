Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F17C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4Ekr8bWoMCd4ofpdpybGGhy95BsMWGqeISfZwo74YM=; b=TSyPy+txaH3oOD
	5EMzMcsLQATVzGcLOlFr+ir3O6yh6I4tX3c0xikLkLPgVQ4ft+hPZepoioqKC7SN6eV85shbj4SN4
	cSdLRgLnX0xOqZ7u0yizxkbAzik+wlTdoBBTnlFjWujs6sZuCbkIjPBHVP4BO/wNxDENptH2djzwr
	xPC1cPH5X2xm+Z+GHFpcIcaKya9g4dORfCTOcsMZYP11JkczQSpQW78wt0tRQD9Lky83Wbf0m1S6v
	P5f8b1iw+m72pVAXUF09kLvKs728Fmka9HB0fSRcJFhuO5591+c7Mc43yZv0zHXBRyD3Uz5JKa1ej
	N9yUTjjkojxXqVqKvB4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfV-002Emn-0k;
	Tue, 04 Apr 2023 16:38:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfQ-002Ekz-2p
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2KPh+RVaFN9Pal7vJ7riMct+RuvU+jJfCqJ/90zseQE=;
	b=KYNZbwvgG+pnISVTwpYR++saLC0BcsJbGURj7A+15iQp0rUY/fHWeZFtNsppYcY6y0/OYZ
	ZcD+8ZKpGLqU2+GHF634qhW5LjRZvol7jZ6Ni2OcYX4tO34Miy8nMo7dO84d7T2uXRkhD9
	GIjq0Ywk+5VR8c/uIOlB9jWor6y8EfU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-fWys6liqPqK1POlrqCCfjg-1; Tue, 04 Apr 2023 12:37:51 -0400
X-MC-Unique: fWys6liqPqK1POlrqCCfjg-1
Received: by mail-ot1-f71.google.com with SMTP id g7-20020a9d5f87000000b006a12c805a17so8520008oti.11
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KPh+RVaFN9Pal7vJ7riMct+RuvU+jJfCqJ/90zseQE=;
        b=enzeEJuIJ3415nl+rdr0Xtc1NojVH2oykLQc2UqWoWilRiM4aUI4LxCzDIqXy/81Xi
         udvSEisyYGsp+zozkieLeGoCLEhGv1y1rAeAPH8CM63sWaK2mo9WWzgEDsnegMPGwT3H
         mGzcW1H4j8hrJ3F+Z9Gd7Xro2GZa0p/djpN5mrYd6ogWNZdDFHkqrOm7pr9Fp9CiDPih
         7jYz1S3K0Yi2XTclKJjTfKDL9pz2IoeaaO26WiSxqS6AJkBaXwPR1K+SAiLj8cZyiL1g
         JzbFsm23kxzbcsubMLCa2huDGIPY6J1xnhoF/eQxv/DP/+l9/r2cAIrbXGg8sCqQBDsT
         nosg==
X-Gm-Message-State: AAQBX9ecIVkwEgp8A8xgKrJEof1Im7JaXY6e802vdxsefqt+qjAYG2gV
	FTXKSCxzc62zHb9gyW21pvjJoCadBSCkuzkjZkHgwC2nk3xWOV9xysQvyVDfkJr+eono0lf65nY
	7dxaeRi6+96xAPiEKLfrYRWfndnde
X-Received: by 2002:a05:6808:16a1:b0:384:de2c:663c with SMTP id bb33-20020a05680816a100b00384de2c663cmr1594916oib.24.1680626268796;
        Tue, 04 Apr 2023 09:37:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZxrDkNGc4YICHDa15B9UbAObvQGb7R71nZVrkIvteUaedtQmAUizLPUyUi0/+37tZ0POLYuQ==
X-Received: by 2002:a05:6808:16a1:b0:384:de2c:663c with SMTP id bb33-20020a05680816a100b00384de2c663cmr1594892oib.24.1680626267577;
        Tue, 04 Apr 2023 09:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:2599:c6a8:e6db:a08:61b6])
        by smtp.gmail.com with ESMTPSA id bd1-20020a056808220100b0038755008179sm5264623oib.26.2023.04.04.09.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:37:47 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/6] Deduplicating RISCV cmpxchg.h macros
Date: Tue,  4 Apr 2023 13:37:35 -0300
Message-Id: <20230404163741.2762165-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093757_011644_0F59A19A 
X-CRM114-Status: UNSURE (   9.97  )
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

While studying riscv's cmpxchg.h file, I got really interested in 
understanding how RISCV asm implemented the different versions of 
{cmp,}xchg.

When I understood the pattern, it made sense for me to remove the 
duplications and create macros to make it easier to understand what exactly 
changes between the versions: Instruction sufixes & barriers.

I split those changes in 3 levels for each cmpxchg and xchg, resulting a 
total of 6 patches. I did this so it becomes easier to review and remove 
the last levels if desired, but I have no issue squashing them if it's 
better.

Please provide comments.

Thanks!
Leo

Changes since v2:
- Fixed  macros that depend on having a local variable with a magic name
- Previous cast to (long) is now only applied on 4-bytes cmpxchg

Changes since v1:
- Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error


Leonardo Bras (6):
  riscv/cmpxchg: Deduplicate cmpxchg() asm functions
  riscv/cmpxchg: Deduplicate cmpxchg() macros
  riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
  riscv/cmpxchg: Deduplicate xchg() asm functions
  riscv/cmpxchg: Deduplicate xchg() macros
  riscv/cmpxchg: Deduplicate arch_xchg() macros

 arch/riscv/include/asm/cmpxchg.h | 319 +++++++------------------------
 1 file changed, 67 insertions(+), 252 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
