Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F14CA5FE3
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EfeZNqG84Vm+GSpoXCqXQyrVfHvzK1XbN73+tPK/an4=; b=cF+2AyDfYIQ9w1
	+aFLsRKsUT+fw99EDzPD/bP2Rjqwan9HJWzXuWUbDqhMUQoVsxUaPzuptudT4996J1JoPU5OI66UX
	qASfSnvqzOQ44VKTKc5cEiJ7NCDhAZiEgEAQ7T4dss3AJx1bMI+i7cgkHk998KGZ4/q9KsvMmEZTT
	KQypDVq5muS9i7mxORqcL/OhjQQV7Zq8WaLcT30RxKjjWlCkigdCosFSkJhgD2pEH91urL7YY3TQ6
	3Xks15Cf42K+yXWHK4Sy63RZe8eM67R/7ub8W/V9BpDNT1wv0zdGAKPur6/SDY2hkvMV7+M1M44Kf
	ZN4hlO4PHsYZUXcakplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvOF-0000000DD44-24Tc;
	Sat, 03 Oct 2026 08:46:43 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvOC-0000000DD3c-3LIZ
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 08:46:42 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a794cce022so5721a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017199; x=1791621999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/wrLOCtE1sCCWrIKRX05ezT6tc6dZyG9f7Xo2wQXRw=;
        b=k/0gzmGsaWOfu1v8adgC87BnrzR1Z8FFrAQt/IWof9wE+xJUyrtE6cJCPg9xVzDjYo
         zsqALuS2PwyG2/b2guZeQrVzMalpU376GERfGB3U09G7ZTZuRlGl9awL36ozWW7Bm5CO
         8zdJn0Ahep1HVq1KXXR1bRIHP4/Y+eLzOX/UtwiqfDI1DQ7OApBDqQsdnNCwG0ImgCFT
         exdXFVt1S9ivFemr+KTLGqrgXcV9n0VPV7H1P27UZ0gPsHelHxTbLQ1RwFk6phnfJyWH
         1xpWYhAczcYyEsxGZ2sN+I+m4zMl7xpGkF4MZ23fwoyA2iJYzv6jWayeSL8WyQKDy/CW
         Y8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017199; x=1791621999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/wrLOCtE1sCCWrIKRX05ezT6tc6dZyG9f7Xo2wQXRw=;
        b=P9mrMlj077OcmCHbRYNfXd4kQVoFHhSL3EgOA7ZSWTe2uzmCIN7CeDx/orlA4Nz90D
         CS5uZKnHetJBaMsDa1UXRC6c/Cwa+o+2KhkCCq7eSLNLVtxXjdEQP/nk3N8TapFqZw2t
         o1wjdS5tNuAV52KoA11llYXdKOLj/zRItf/+6uGDz2ls7vT3CLYCsiBk/wWMWBNV3+Rf
         dNQceZ4fGSA9F6+AiEBwCwJEKkVofZhTPcE1b8cgyfom+oITKEtIKeI/0td0bQDC3TXE
         gHs3iFNVjvw4odpLT/n2cvwymm5gdvtzN6bXEUS1F+f6PcMhftXMRiKkIwozd6RgfE0G
         Xu8g==
X-Forwarded-Encrypted: i=1; AKwUvByWpBuBOt14Q5htXg3YqwaLbg9gik7nkB4/AY3JLWtbNHvi1BovgJNuOe9xGFkLBnq5bMFWDOuMy2FzJg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvAkrkmxvFKSJBkImrym+awbVJ86CuguqqlIHY/h1hfaUboVWR
	DndRUZh/OEDsQzJkfkEP5t/4zB+MgI/lV1oInpzLW5VhTaCFcaUeLNt1
X-Gm-Gg: AYBFou1jmi0dw51VSiIt7AqBRdfY9JnGGKjCV9LMX8STmOWAQEAayKqzptuvpn1gdJM
	mJLGJd4FNPesb9VcUM20Kv+HHw22MW/G22koJKad5YOwXs8/lSMf7ckX+CbHgZyg8kbwMaYxnI/
	8/pAIMHYZvyw0IiT4epTHkxPThE4VrQKgIj7hgZqFuDpklkKPcs7Y2PicbHtqjXLK5MDCNRQEvH
	Gg4uHLZpj+ERPm7VBx9qc2cM86QEpX1moGBzmG59qmk3aLas32+9Vi04344vjA2ytGdfAguYAi8
	CCvYAMQImrs1h200GMPBLaU4RYiBud2GSHGZ9sT1Ow/BwRcseqYEA/ikM9EidBwErDqpsawoXkZ
	kVOlgGvGq2iPwwNzFGe/rL50R7c/nxC1Y+yyhU963BYILS/gRvEmczyXq4yFk7ntdLhYwAR1f41
	xZbyur2LgA9d1TxSR8ALOcbwSU8HQ8vdED6LGKRTmsihpTDVQ7OZYMCLdB6afGL2R/1rqsdsXkV
	KM1wXcYVtraKzsMlqeuCKpkMwQg1F9BUHLflPwmCe7O6u5Tc8BNrZjbaHMsKLYw+IFbPrA=
X-Received: by 2002:a17:90b:4ac3:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3a6ce5eb2b0mr7077989a91.1.1791017199330;
        Sat, 03 Oct 2026 01:46:39 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:38 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Sat,  3 Oct 2026 16:46:24 +0800
Message-ID: <20261003084627.353899-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_014640_842539_3D0904D8 
X-CRM114-Status: GOOD (  12.76  )
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

The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
internal PHY is only usable through the optional USB & Ethernet IO
board. This series adds an overlay for that board and fixes the name of
the internal PHY node it exposes.

Changes in v2:
 - Enable Ethernet through an overlay instead of in the board
   devicetree, since without the IO board the pins may be used as GPIO
   (Inochi)
 - Send both patches in one thread (Inochi)
 - Test link-up and traffic on the IO board, which v1 could not
 - Collect Inochi's Reviewed-by on the PHY node name fix

The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
so covers that board as well.

Testing, with a kernel built from this branch:

 - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
   address via DHCP and passes traffic
 - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
   reads back as disabled
   
Kernel log with sg2002-milkv-duo256m-eth.dtb:

  [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
  [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
  [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
  [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

  # ip addr show eth0
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
      inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0

With the base sg2002-milkv-duo256m.dtb:

  # ip addr show eth0
  ip: can't find device 'eth0'
  # cat /proc/device-tree/soc/ethernet@4070000/status
  disabled

iperf3 against a desktop on the same switch gives 94 Mbit/s with the
board sending and 70-74 Mbit/s with it receiving, with no
retransmissions either way. The receive side being slower is not a CPU
limit on the board; I have not looked into it further yet.

v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
    https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

[1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/

Chen-Yu Yeh (2):
  riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
  riscv: dts: sophgo: cv180x: Fix internal ephy node name

 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
