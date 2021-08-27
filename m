Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6CEC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 17:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BFC060FC4
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 17:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BFC060FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0mOHd7q0SRqWI6loNMy2+oj3k/LGyIlz8j9LldnlfA4=; b=ihIyMihw0A7thW
	xSYACmum3aL4JqU+Tjejw6UABzuuK+9ZdLvJ3IgPO11La+xdAmglj1EyRFvZzA9d/2WvhM00R4vgk
	Lb8X5SyhEI20hEHTNL7CJUyBID+Yz1EG+awy5QMIx9265EfCPg7GfOyCeacNZkEVJHW1OeGVWnqAs
	WKaZjD5lAnpL0uUx+XLZ+jQ31aicavbHJ4lhSwfXBdafFd9G8cERHCAllYNo4psa78Tvv+uCbDCkQ
	TSFb83st0x/tyhdpIAwSOQT/Nl/DJLth/cyB8R1xU5MSfDcB9cReATOHVhMXR+WpjmewM5H/gXBB5
	XmizNaXAlweWVnXfa6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJfvR-00Cu1n-FC; Fri, 27 Aug 2021 17:45:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJfvN-00Cu0r-OZ
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 17:45:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id h1so5044017pjs.2
 for <linux-riscv@lists.infradead.org>; Fri, 27 Aug 2021 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=0WKKYjvy1TgBuyRVyCby36vMfEwiFoM9lW+Cn+bAZYk=;
 b=P1jpkTPIwm0g455oQ17Wg9OyulzuKKRqHezM24WtFrqoP3YZvPX7++97c+d3WibR43
 5fIM0M0s6my48zFK8bkZvqkDa3MbFil0S1mglvJK9Hvm1rfcCzodrJTv4g6lBzzHOyap
 C2VV8IiD5uEDA4txqR/BlvyOfCZMDL118mJbEz/5ZK9u4Q8YW4r6Q9RRb035k+lyq374
 1z14rWSljKX2XBwywH6bgP+gYmEOE+3wSdCi94l/yNqkyXzaB0xwW3kjDti3AgR1R1gW
 e+SvcdXF3A5DAKdscdwcRbtv209Rnq548LnaeAFK6UwA8xCU/1FLlbnLEL3QAdnzZ44X
 FfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=0WKKYjvy1TgBuyRVyCby36vMfEwiFoM9lW+Cn+bAZYk=;
 b=UGr5XDkRnFUn7kjl22OnbwOBxZxQL6fHzp1FqRYgCfSVQ8n5cMR/34KzebW6t+P3GN
 pv5a3F4U/UlxbvIKtlmHiU+7+EqpWiDNlTPG2pQQ3cclzo0oSpt1IZUbuTfS3m1QZPIo
 XyyPa1y+5ieeiAYuZZfkcwq7QyExYxxKRIigpCnJGXR8baZ8H5IVjIaFP+D8JOac36HW
 x/Ofhqcg8YfreyPrQmenyeUAl03B67Ib1Kx8KpJvxV2brV0EMA1RgNxbXSO0rQ9ScDLn
 8TkNdAIN4Ck9yBeTCkxnbD1RCYGwxoeK7KS45VQfvEuatesnIsbZEyK+cf7RFU8yLgSQ
 Ys7w==
X-Gm-Message-State: AOAM5306BQP+WFSJXWaPGnHQEdgovP2wT57HyP1lnq5l5LC0uDM56rU/
 8Zv75QMF4DNggO+rO1TT+Qgr+G0UAGTSb+Gk
X-Google-Smtp-Source: ABdhPJxVQjdKqS3vmruotXg3ZfPgtLskUbrPmpDCVWc6LiJn6CWPZ7Gqp5pi21hbbEv1Hp9pxYsTBA==
X-Received: by 2002:a17:902:7484:b0:135:8c25:d33a with SMTP id
 h4-20020a170902748400b001358c25d33amr9836241pll.83.1630086351869; 
 Fri, 27 Aug 2021 10:45:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s29sm7751274pgl.38.2021.08.27.10.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:45:51 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:45:51 -0700 (PDT)
X-Google-Original-Date: Fri, 27 Aug 2021 10:45:47 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.14-rc8 (or 5.14)
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f06b0a4c-f321-4c14-9378-da36fbf6212f@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_104553_882008_88A9A74C 
X-CRM114-Status: GOOD (  10.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit aa3e1ba32e553e611a58145c2eb349802feaa6eb:

  riscv: Fix a number of free'd resources in init_resources() (2021-08-20 10:15:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc8

for you to fetch changes up to 417166ddec020c4e969aea064e23822591ad54df:

  riscv: dts: microchip: Add ethernet0 to the aliases node (2021-08-24 20:57:32 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.14-rc8 (or 5.14)

* A pair of device tree updates for the Microsemi Polarfire development
  kit that fix some mismatches between the u-boot and Linux enternet
  entries.
* A fix to ensure that the F register state is correctly reflected in
  core dumps.

----------------------------------------------------------------
Bin Meng (2):
      riscv: dts: microchip: Use 'local-mac-address' for emac1
      riscv: dts: microchip: Add ethernet0 to the aliases node

Vincent Chen (1):
      riscv: Ensure the value of FP registers in the core dump file is up to date

 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 4 ++++
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 2 +-
 arch/riscv/kernel/ptrace.c                                  | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
