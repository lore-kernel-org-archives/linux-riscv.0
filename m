Return-Path: <SRS0=U2Mo=NA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E78ECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 10:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481DE2150F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 10:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUelGcB/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ChUUulNA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481DE2150F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKAZPTNDDBdUpj36z2LDvbO44hvOg0sI48jNT+x7QVo=; b=hUelGcB/JrgMv1
	VqnE8CKGX9JILqPTclof5jHzdsHvKc5IV+F3ULXFK/ekx0SeUU3qPC/LX//1NrtTcs4DDgSogHQFk
	6PLGA3yPUX2dGkza5gFKUScrL0XZH0jboC0cnOopKgeHOH8WRBoVRXQQ5KpaOEWrzUbSW+/Mutf7O
	9UxfsckF36PHlh2j08uJRGKK3D1HSIp4kEM+oMDE+Fslq+QTO7efcv6FkibbrBtshyh7k5hvcfx8C
	6g1mdXH4imfecpWzTocFq8gsrm66z2KlQDzn0e5oA5/oOjH4BLULcfnDh/fSnEzXx1Zbg7T1wz8Jh
	Iv+1rpse6kaTp3pJfjSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDoF2-0008BC-MH; Sat, 20 Oct 2018 10:12:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDoEy-0008AH-Ud
 for linux-riscv@lists.infradead.org; Sat, 20 Oct 2018 10:12:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id f17-v6so8106751wrs.12
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 03:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WeinUrQ7ysF/m1cR0ZveHabHJtWalvfdrlRj+hVPwbo=;
 b=ChUUulNA3u9H3v37Z4/3MyliL/YP7RfUWNE+gEQoaB8dklJ/5KeOcYzaiFhxi24mmc
 sNven5kjfrrzyZq9Eug+G8IbjjGN40dFpjTYcjlK5zqe1KK7mATJDwJ/BZZPNdzPigNs
 +apQimZZ/3foYoLMejGhzIYJIDDu4SuozjvWZdFHbi9J53aBCobB8FLr8SzWvkG+Vvdx
 4oJZskMcddBnY21RCi1HVqOyoC2PxWebWN9RKNvZFUdNcvn/pcleo+aJ3i9v12ieGgHo
 A3VIg7M9NeAflW2sQPoSkfAbAXu2kfBqcSx99sLZLhOJPx1xfewdkiTFghiLyffXYQrq
 h/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WeinUrQ7ysF/m1cR0ZveHabHJtWalvfdrlRj+hVPwbo=;
 b=kAPTtMwcGtyTLz7WNXAS3RN2MuNcoUJyLd7BLwALvmHFZ7rvP7TG4syz5s8Tpy0B00
 HxTfTWy4LOKkOs6+1T+GJK3r6yBtkgE4winUqYKBsGTlfmHtwR41T5JRg6GTzTq8CuX7
 V2dLiGgLg55dcmdMcosujcqW2AtTk6cScTL/CgWyEDtM+CMN8HRSwVvL1D/8awntt2C0
 2aNx0lwS236oEQ+EI5cCleuJRVTrr4rn1Ul9TTnMUgO6azWu2YVPZoB0CSfxZLBtX5CP
 7JhQTnHXxa4quBNBm4M0D9N7+fM6VPmECVx2cPcOaT+YhPnama9UDFX/N1PfFW94MvR0
 rm+g==
X-Gm-Message-State: ABuFfohomkTuDrbHiJUbym1O7uF6QmRj7WO50Vm2h9oQSrICZzzUPZ1o
 b2hGKy4oa960Ficuqih5DAS11g==
X-Google-Smtp-Source: ACcGV60KOuq/Qj141/dOvDHTj+LCEpiuxs4vuPEOXktbHfZ3Au80Z3W9XvLMd14seGyfYDmMdl/1CQ==
X-Received: by 2002:adf:91e4:: with SMTP id
 91-v6mr38551871wri.97.1540030324620; 
 Sat, 20 Oct 2018 03:12:04 -0700 (PDT)
Received: from viisi.sifive.com ([37.152.39.96])
 by smtp.gmail.com with ESMTPSA id 2-v6sm23773438wro.96.2018.10.20.03.12.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Oct 2018 03:12:03 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-serial@vger.kernel.org
Subject: [PATCH v3 0/2] tty: serial: add DT bindings and serial driver for the
 SiFive FU540 UART
Date: Sat, 20 Oct 2018 03:10:44 -0700
Message-Id: <20181020101045.15991-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181020_031216_989555_61A7E816 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Wesley Terpstra <wesley@sifive.com>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181020101044.Xeu9erd35KOFAMibWuwI-XClyYTECxz5uo-CTrrT4ME@z>

This series adds a serial driver, with console support, for the
UART IP block present on the SiFive FU540 SoC.  The programming
model is straightforward, but unique.

Boot-tested on a SiFive FU540 HiFive-U board (with appropriate patches
to the DT data).

The patches in this series can also be found at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v4.19-rc7

This third version updates the DT binding documentation per discussion
with Rob Herring and fixes one additional issue identified by the 0-day
build system related to MODULE_DEVICE_TABLE.

Paul Walmsley (2):
  dt-bindings: serial: add documentation for the SiFive UART driver
  tty: serial: add driver for the SiFive UART

 .../bindings/serial/sifive-serial.txt         |   33 +
 drivers/tty/serial/Kconfig                    |   24 +
 drivers/tty/serial/Makefile                   |    1 +
 drivers/tty/serial/sifive.c                   | 1067 +++++++++++++++++
 include/uapi/linux/serial_core.h              |    3 +
 5 files changed, 1128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
 create mode 100644 drivers/tty/serial/sifive.c


Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
