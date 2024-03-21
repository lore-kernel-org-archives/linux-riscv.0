Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3F3C54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2/VojZalUkgpLoBzd/mZwAI89hhsq+8H+OZizB6Dy7o=; b=WDplhYJi6HuOM8
	Se2CLKaGcfERshhyv3sP3JhQX+jGo4/N1kS4XIhnGng555KLyeAjqjlf4hXBkcWxBZsY97Ioi8FS6
	U3jAYZ3FqBBupInz2o3604DjbVUgFExgw5gxiif83m7krWaC9Bqu1UfRcZQzwnC3fv9QzZBw/ZUvQ
	66Cd4+gvM3vIvFnsE+/mmjnTX0t+W7c1D589ZTQDmQ3r2Bd0ffrDvs3bnmFmyKZM2cqzERFm/Pmrs
	AvycAM0jrbtA4Wo38QkrSE9jUl0nSlnBn8Y80oQAfvQ9U98UiefAwweCMppVFf9Q4aPymUggDq9Bl
	kK/kIGw5n2whuGl3D1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE8b-00000002OIH-00KF;
	Thu, 21 Mar 2024 08:51:01 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE8Y-00000002OHE-0b4S
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 08:50:59 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3c36ecdb8cdso358701b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711011055; x=1711615855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPjyd+yjOktFr1xsuYU5FVU17C6f3y//ZruUY/LClBQ=;
        b=oD7qCMNjxx+HSsvNn/wexmoWJfjaeBBDZ9139SbLaYhupDXgZg2rLAyIZoLEI3lk7A
         SsjkK2KI55uBzpt9Aa62Gz8/65XDAq6EzTJL5vsjl9rBJd2g5Gg2uJ1oC9LWU7xybs3q
         uybzNrLJRDQ63nmrOdcWpOu8uX31QqY1TSRFivDK+W2uoKn8ALkTljzogIUC8PnJjRYh
         zEIALpsztp5eCY6L1uYJ3nGtjzOgI8PqXSr35EpZ/eYAmUCp3zirrB22PBouH8cztrkO
         kYlPX5TCNsYt5PnPcjg78UoiyAj6rGs1USAwQG8LzirdtE8ZXs2ZnRGyqSWPjmfdGXCH
         sBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711011055; x=1711615855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPjyd+yjOktFr1xsuYU5FVU17C6f3y//ZruUY/LClBQ=;
        b=fJh3ohPZwWm4WLsH/ICyZZ/oVecrSqL19nCw/rmMYVRoFturBMZGUjvooqVj6y96Nz
         1NHjbsyE7+ASS+4+ZwMenuBZfGZeGjves86ud6/hq2nvTdpgYitupAXojM+i+EVm0eks
         b9hqOkJjMFXKehKYcXP7IL8jbt6wrlcty433KhAnYu5xY8iKTbCVeHrIMQPYQqzmAnzn
         vyQisKZMH7db/VFoTaMQwX4kxWJfQl1rfbA0OZfYo69HBVeZaqVK6qh3uOz5m49D9Gv/
         xSnAoEXOpVy83z6wk0mPTEBWd+Fc31PkNlYiewzUr18x5jxptaZpQwINF3qFsFgo9j9A
         ijxA==
X-Forwarded-Encrypted: i=1; AJvYcCUVx7eqoYbZ8FqhMAZXVK45HnCjSaKQBY9YXUzvDB5gI79D7SAPPhRSgC1UK3iY+9Vdk6G1gugsWtb06NW+yLzT/X5lmWj/FLkZVWi4ddxX
X-Gm-Message-State: AOJu0Yys0SJE6dDD0YcQPmmAg7lxheg76u2Qj3ZhH1/qqqE1fj3ThzmV
	g//LiEEUzaJex55yThbF3mkLL5aqvIyayCoa/Guhk8p1+/gpehKVRGon38Aaeis=
X-Google-Smtp-Source: AGHT+IEvqwLm9D/zQrn6jO0supoJFFZJFv0l42kjY6Gp2Frdf15Yh9kjKVuHL7HqdWGlqp+r164FJg==
X-Received: by 2002:a05:6808:1a28:b0:3c3:896f:8817 with SMTP id bk40-20020a0568081a2800b003c3896f8817mr5503819oib.2.1711011055018;
        Thu, 21 Mar 2024 01:50:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x3-20020a544003000000b003c3753dd869sm2275409oie.58.2024.03.21.01.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 01:50:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] KVM RISC-V APLIC fixes
Date: Thu, 21 Mar 2024 14:20:39 +0530
Message-Id: <20240321085041.1955293-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_015058_209876_98D4C581 
X-CRM114-Status: UNSURE (   5.97  )
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

Few fixes for KVM RISC-V in-kernel APLIC emulation which were discovered
during Linux AIA driver patch reviews.

These patches can also be found in the riscv_kvm_aplic_fixes_v1
branch at: https://github.com/avpatel/linux.git

Anup Patel (2):
  RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
  RISC-V: KVM: Fix APLIC in_clrip[x] read emulation

 arch/riscv/kvm/aia_aplic.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
