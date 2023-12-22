Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AE0C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qNl0q6gqJuaV/P9KhzcRxmhRN+FNmC4x47U/alZ005Y=; b=RaxYxy/p6i4O2I
	WCARDhhV9I8f8o+5WMLmlHuXiwYJAbTSE/sRA3UNkHxlJ1TLeJtTp2/7e4rwaBk9SPLi600F2ZMW9
	RLPl1RJhHlMn3P8UsWQYhtXlf0UZYdNwn69Yff6JAoK9fX52GGLZHlZPXIpV3MIHq3st2qtNbYpj+
	HH5+n5mvgtPI54YqH7pHkctoS7KHOldA1xv0kp//Xz85bA+vkxLmh391vmrnnhrlU2ZxRka97WbH8
	uqoTnOLmg8Bgetkw/ixHaTetYBm5UQ0O5DQUtm6Q+QO2NWC4hN3E35ToVvKg7m5jLKMjntWUVnNVD
	BvemO/5CJZ5JRjPH42Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaEu-005D9T-1R;
	Fri, 22 Dec 2023 07:46:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaEs-005D8t-0f
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703231192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8joa0SqsNw6lghVtjrUIlISHZyZgU8xVLriDEJzMbbU=;
	b=XZWPfnrcMy1DSruXj/P/vAQ37TnjGGTDxD9YdhXC40qNmO5IRNDiMXZjWDRhQW6uO/xBrM
	cRkZRoXuhfhfuLA59NoydOulVIrJhPuWBi5O3isrF9q7KZllU8uRF79SRWXVbTF8VRG6IU
	kjzRx1Gge8tOa3V2sNbEYma83LlDWt4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-x14SG66kOXmBGOmPzSq9eQ-1; Fri, 22 Dec 2023 02:46:31 -0500
X-MC-Unique: x14SG66kOXmBGOmPzSq9eQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6dbac6bb6b6so1783021a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703231190; x=1703835990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8joa0SqsNw6lghVtjrUIlISHZyZgU8xVLriDEJzMbbU=;
        b=QCeuH7byRTLUMsTmR++rrMptIYXxBsWdnBL/zQSn9Yfwqak2bs1I9pACwyrKRj5mLG
         xnP5f3tEc3Ni/oTrFlZXOAWhz09Wmtmre7bmjwl7r9CHigVqeg07xIOHhYtw5pxoyQut
         ahQaXrvg+rvym37FF7T1G2qnK47vSjXtBexs6aN0a0MCGe8Gl1pdbs8tbVZkX1O9CELg
         PW7KZb+sr8O8BY7caz4hoY9ttFt8kpwkEqoNmqLKuKYv/YmjLVgdbmXR0XpqQ8qIHfcd
         szZGnV/Up74qa8LGqqBrTipmf9Co0GumICJSG/3aQYSbpkfHCotUEOX0kjZRGFinnlPi
         VTCg==
X-Gm-Message-State: AOJu0Yyn+FGa15fPDNFtfK2kwlRQ0ZuIxqV32NxfmNsF0NGT8zX2wXrA
	IF6DsmCovEzAcO/JoEWK55+tOj9gzr/fN/LqNaAQZs4XQHB+t67mohlSP6rZ/l3RDGdtlgQg2Rs
	CmvzTq05UB4zv/iWNJr02aZtf0kHf3FkwrnZG
X-Received: by 2002:a05:6830:188:b0:6d8:7b83:b520 with SMTP id q8-20020a056830018800b006d87b83b520mr975570ota.22.1703231190618;
        Thu, 21 Dec 2023 23:46:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtPKXrNxbzqoFd8PBPnac2PBZhiVN9/33Wde7wZTDupuDnjdqviH8QQZhwIVNY+bNVq43CLg==
X-Received: by 2002:a05:6830:188:b0:6d8:7b83:b520 with SMTP id q8-20020a056830018800b006d87b83b520mr975547ota.22.1703231190419;
        Thu, 21 Dec 2023 23:46:30 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id m2-20020a62f202000000b006d97eaba6cesm1527015pfh.21.2023.12.21.23.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:46:29 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/4] Introduce & Optimize compat-mode helpers
Date: Fri, 22 Dec 2023 04:46:00 -0300
Message-ID: <20231222074605.452452-1-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_234634_311675_1428565D 
X-CRM114-Status: UNSURE (   9.14  )
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

I just saw the opportunity of optimizing the helper is_compat_task() by
introducing a compile-time test, and it made possible to remove some
#ifdef's without any loss of performance.

I also saw the possibility of removing the direct check of task flags from
general code, and concentrated it in asm/compat.h by creating a few more
helpers, which in the end helped optimize code.

Leonardo Bras (4):
  riscv: Replace direct thread flag check with is_compat_task()
  riscv: add compile-time test into is_compat_task()
  riscv: Introduce is_compat_thread() into compat.h
  riscv: Introduce set_compat_task() in asm/compat.h

 arch/riscv/include/asm/compat.h    | 19 +++++++++++++++++++
 arch/riscv/include/asm/elf.h       | 11 ++---------
 arch/riscv/include/asm/pgtable.h   |  8 +-------
 arch/riscv/include/asm/processor.h |  4 ++--
 arch/riscv/kernel/ptrace.c         |  6 +++---
 5 files changed, 27 insertions(+), 21 deletions(-)


base-commit: 24e0d2e527a39f64caeb2e6be39ad5396fb2da5e
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
