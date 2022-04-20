Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A95C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0riZjetaatDcCIc+EPzwU0bBwhoROClPzuAgcLIMJX4=; b=EZTd+EUb24M0R1
	UQcPtCdJxEokWqIpHFdD0vUfIcbDk1TAHttW2nGJLrx0ebP7OyejCtXloj7oPC27KrWGEYWy30hvJ
	hUJSzNIfqTb0PWJJrl4ckETsXRrFUn8hmj7ju1LjJIc1k30qe4t1jcv9FW3odBNtZKRK1JpyfYwTT
	hQZHF8Q1sCzWOTy+hbYtsWem5gkHJAt4B5zl1kpk7J5uuuSoVNvK5I2DA1m4zCRrDVz4PILtBfdDP
	Gdtf0+xaOn4PdztlLrnW8FHDzshKbtPVVkK5f7cae6oVqmypOlIkeRyrxYJEqHWhWye9MGGAxI64F
	qPz0jWaKFaRW1MngHtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngzDZ-006rcn-6A; Wed, 20 Apr 2022 01:33:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngzDS-006rYH-Ey
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 01:33:13 +0000
Received: by mail-pg1-x530.google.com with SMTP id x191so159283pgd.4
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 18:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hGbEx1dzzctQaZO6zjtNFZl0KqYSt48iblytT444Gms=;
 b=SjCVVtY0aKCrFTPVmvuyyFfg8de9NyeYizpAZtyjK5jdPNqfzdywWT9CQmGplWOxUm
 0qdgei8vKZR+0kZkD4zLbEJQ7u0/Moqtt3Kk8ItD5V8Zmezp91kaqIhfzJdj0IdRhf6f
 M6QBKd6z5E9ltQeXCTtfIozmJ5xZpkl5ox83M3pHqCJ7SuSQ/2rHRlt5yYvwBPpvhq3p
 M3D8dK///smktVIuQth5Cnl0fBM7VAZGg/HocmuA0+u1LF1M9UeNdvqCgSYaomwubHxX
 hv1lIHU1fb/E59ykz3LqKs6JlOGKXw2WCQNwCnSebkVx0y/lQXxg9zTt3ULmLfRw8K/H
 lKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hGbEx1dzzctQaZO6zjtNFZl0KqYSt48iblytT444Gms=;
 b=sAnt4rn2VAMCuBPq6MS2aKFfgg+jBDl2wFSU67uBWwwknNNY7P6OppJpLs+Co3CHGC
 Nisg4K+JXVPg+paTqJmjrbxcuoRMjeqBau7XBMd3P4fLIVaTivKW2cBUxxHAT6hw9v6T
 /5/b+fdDtTJkOsdA2dM2+IehJhZW5KnkPm+oiwMEKfQn38d19FGQperqIzLg6odmc6w5
 AAYJGDJ54J+X5/G6uT4S0xc9k8YXLxWthBG5ICuMmqtykgXATBVedM1n6N441t5agRbq
 W52883kppDIF4ZZqsWWtF25cKsl5ZmXoRpIPhSLe8/jrM2u4OXeWaOU+po6h+U8QckLN
 Gr/g==
X-Gm-Message-State: AOAM533EVRKWt/Jb7bM6kkD5oiDi8DhuKGieYxvYt/aTMuSoTdRASMyx
 wRdWp0Hz3tU4CdNiWoqrM5XdBg==
X-Google-Smtp-Source: ABdhPJxBDNTKQrAD4xKiy6UUsQwEmiOFM9cxlkWFjMfR7qBNOIxAdUiGsdhQlvhD2GVnYSM1rWZrMQ==
X-Received: by 2002:a63:e70f:0:b0:380:d919:beb with SMTP id
 b15-20020a63e70f000000b00380d9190bebmr17057166pgi.58.1650418385970; 
 Tue, 19 Apr 2022 18:33:05 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a635d0d000000b003aa482388dbsm2484863pgb.9.2022.04.19.18.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:33:05 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: kvm@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 0/2] Miscellenous ISA string fixup
Date: Tue, 19 Apr 2022 18:32:56 -0700
Message-Id: <20220420013258.3639264-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_183310_561600_C1E1BA96 
X-CRM114-Status: UNSURE (   7.10  )
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

This series fixes few issues around ISA string generations for guests.
Earlier these patches were part of the sstc series[1] but I created
a separate series for these fixes as they can be applied separately
as a part of rc fixes.

[1] https://lore.kernel.org/lkml/20220304201020.810380-1-atishp@rivosinc.com/

Atish Patra (2):
RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
RISC-V: KVM: Restrict the extensions that can be disabled

arch/riscv/kvm/vcpu.c | 23 +++++++++++++----------
1 file changed, 13 insertions(+), 10 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
