Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B73ACD98DA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVOC7NVu36rD/4nz5v5ZJI/vTfqqtz7hv573DMaNc0U=; b=pye1grrSb3DSq9
	VlO2aEFduGHVqy0Vncdvv4/LS/TKek94rweRBC1VKd2j/zVjZRWo94/GcRZ/4FgQ3Us4NzUekVsV/
	FiYx49OBM0skNEjblG5OSMVDRuF8Ix4J0kXCcAsQTWUCMZrcI1IXhpts3tXnv8cr1ppTB4LZ7NTPF
	qtmWjQXpidbCdLcghC155deGFCcqX2eQm6bhlTHdZ1FCjU9mkbNeLQEcxRodundXGtFnsIcEAjvsk
	r/YOkZyHAt3VRxLVbbu/Ib2MRwk5lEJTAiHOtBd8+okxp0pqvX2PUkBs7cUp0mnXELXPtc2ElGuWh
	pHdoWFkUQd6VOYGW0AuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRAB-0000000FcER-12ru;
	Tue, 16 Jun 2026 10:36:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRA8-0000000FcE6-31x1
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 10:36:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so43849305e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606214; x=1782211014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCN4z+iPY+eriaEkOl+rtItlbIIjfyx0HCk1gZxOhtg=;
        b=qpevGvTo9YExY+m/0541pMOi7+lwCzGEnGGsYyGSukVR1Olv/CZK4tdnPGpWKQtLZZ
         1PZXW6k+P+0lecB8bFiT3ZaQoS1CLMXbHAwTsJijtk3MYNRUxtjGfx8VYpdAHACmidDr
         i3Kxudgsb73a6f6epVT5ET1lYo2MeMKOE5EmwFs+UGq8wf8WSWSCnRZIIYdKzIoPSjya
         U4efU73VXCc+KVctI4UJIYVTw8PORNMatMzcugDCxFmh4dbkbnOBKmy7S+c+88ijpWsr
         LH9EBPI/h25Vq6bngfW1AYEnJyAHamWyp9U6XZFW8Qa+gEDGCGMSe/nqBdsEBNcB9ScR
         HuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606214; x=1782211014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCN4z+iPY+eriaEkOl+rtItlbIIjfyx0HCk1gZxOhtg=;
        b=GCzk7JX5AsKcolk6beW9NV4zy/zYdfV8Nta1JvfFIagyfPX8aoS1jFyFqa/LKp5FBv
         w/KBby6RQYBp/qBfc14zOwCzDaHdBsjPY9u57lT4M++TQWJDPcQm8SLWM0WGTSljsUBN
         8AXcWq1JMvUKdTEFx+FoDyz5DBHYRnYtCLKTtuWoUaowP7FpwM4ARdYqbvbO9Ut7WWqg
         XcfHdZBj71qnhW3RFSOYcHCsKVzl+XHJ7xAQf4JgbVJ3avwaxaYVb9H7ZCsio0HYudAW
         ktZnJFtAh7pOnRZED1MhzTz/e0CcSKO8QEmUlwgT88HXZzLoGUyaB26xB20WTNYaeZjv
         G/dg==
X-Forwarded-Encrypted: i=1; AFNElJ+ryvOvMxdsZEyU/L25jV8lwDkUlt6OErv+pDpLSaNjLgRG+i95FCwLP3YHW0hoAoL8xBNPI5Tfvagraw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC8eI7SGN1w0jgWgPOzYvnNgwI7TEsoEynq3EzbT1Q04DY02/k
	tkuMYY0IrDcZIOpqqNxmvgsxMe1ruT1vQMIGNAKXmI1DVe3ECCWB3/Rd
X-Gm-Gg: Acq92OGXzmIorQ/1qzKSGJYdb2PtHYxvlHAfcEdiJKiDGfybNjrSr9dD0xs2+vkY03T
	f5CPO4W9sPIUbIi43ZYc3ncoeMzCwYddxd6a0aXy/hySexBPJWysl4iK0lEcsNCtUiXxnVy9VZN
	bIboFIGQwSKkI7F9477gvtYklmLR3PcSeqVXQKRKLse21EtvrTte6lIKK5N+mXaHXh1gcNZzNWq
	MzPGJgExDLP0fZV7rLiQyU96pAhkfFjjafA7OAZTEXwcEkN/z3Gpqd8AVDWMBwVlOMazZzbjeOB
	bx1w42aiV1SDfj4SQmQddOzU4gy8H/3/MYqffWU7FtumZqkuQbgM2kLHN2WgDYCz8BbyoKD1+Yg
	wkxIiY7z6ev96TsUGnxVf1qlC1a5KFIpHKWQKig/cU0eMphuGIWaYPWyh5lYt8xKdOIhxvLpMDR
	cM0zUZXX3FPrrXHGqsP2Fr0vv/so788kmkWvX5srAP1tWbsxgM3qA90TEu1y8CFtOKIMcpYmk=
X-Received: by 2002:a05:600c:4743:b0:492:1e36:bafd with SMTP id 5b1f17b1804b1-4921e36bb83mr216605415e9.37.1781606213522;
        Tue, 16 Jun 2026 03:36:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26392esm42544726f8f.3.2026.06.16.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:36:53 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:36:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, cuiyunhui@bytedance.com, iommu@lists.linux.dev,
 joro@8bytes.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, luxu.kernel@bytedance.com,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 tjeznach@rivosinc.com, will@kernel.org, yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260616113651.1048a19a@pumpkin>
In-Reply-To: <20260615123821.373248-1-guoren@kernel.org>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	<20260615123821.373248-1-guoren@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_033656_774617_4CCBEE74 
X-CRM114-Status: UNSURE (   7.61  )
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

On Mon, 15 Jun 2026 12:38:17 +0000
Guo Ren <guoren@kernel.org> wrote:

> Hi Zhanpeng Zhang,
..
> 3. Only performance-monitoring counters require 64-bit IO access or the
> high-low-high do-while retry strategy. For ordinary status and control
> MMIO registers, a single read is sufficient.

Actually this sequence should be enough for a counter:
	hi = read_hi();
	lo = read_lo();
	if (hi != read_hi()) {
		// Pick a value that happened while doing the reads.
		hi++;
		lo = 0;
	}

-- David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
