Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A22C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZp7sqfoFEwgUUzb3uYh/tAFadcFekpGYveXW/zQ1YA=; b=mjrb1/nj7MELUM
	salvXo8sPUfsrDr+hUQ8Ap/i817qrKg8HdkrEBItIRbWWL2t4DwNagHN67Iytip5/5OorAF1xSElO
	lebsD5oWdqp25aR2dx40d7xow9XPN9AVyrTkiPr4OyJq/pZuu/+ORVto3V5+fZaMquDPXQauT5ybu
	FqIHhIPKu+WXdzq+OaHqbjlXdh+CHhGY/OGh34et0PawjC2ngLDTw7i47DTT33nkT5Oag+1kLUFH8
	7/mwxrenmQVBg4ivcFiy68olBxWUPYCtqvpInvtaeBm3UuBIqtvyhol4sVOG688q3u1QKU/Zd9cqz
	+PGpjkjxSc6i7/J+0EPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryWhJ-0000000AVH0-17pI;
	Sun, 21 Apr 2024 12:53:33 +0000
Received: from out203-205-251-82.mail.qq.com ([203.205.251.82])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryWhF-0000000AVD6-3Q6N
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 12:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1713703976; bh=9yDBgQO4TbmtaqpS9si5I27IyPRDwpcQsvToSrByr5g=;
	h=From:To:Cc:Subject:Date;
	b=kWCAaW3pM4ygcmKzLmjcnih/bJ8Pga+3h5+ZMSa25VMTI9HYElD0K38x7T87jwWo8
	 N/JBTRRK3PTdDLY9yGFcxSdnbsVBeWpurn8ZZtaCI0tnfXeIPH6DCTvL+HOr3b19Ix
	 UlRqfqx0nnaUyximKh4giGC71gmFxxFY3vTQOwis=
Received: from cyy-pc.lan ([240e:379:2264:6200:aa04:7d36:395a:da35])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id D33992DC; Sun, 21 Apr 2024 20:52:51 +0800
X-QQ-mid: xmsmtpt1713703971tqsj69njy
Message-ID: <tencent_E9B853316D217B8D1E7CDF8288DA5E8ED908@qq.com>
X-QQ-XMAILINFO: OLnGMPzD2sDVlqXcDkXPfyYiQdQtEoO2sX2M6LXOzSLZIlX3ONwmstyW8GsBgS
	 +V2/eif459i1yOXB7vnvDk6GENdyWDY8H8fy6iDpDM87c6N/fgLSbCmtVKx5MagWd0vvp7A3Fn2+
	 xjltDdBwixT5zlRzoH5+k0wkd1h7uFaWJCvSRC3I1NnquSDMm0ElzWwt3XpuvUzDnWYMwBYnVBaU
	 lJAUSk6fhqEb2/DOe0UXaHcF2zW06FB/9iRjnGUrvpbmuUahFyl9MaC7fKhRSV1IuyxnOJDgiHLq
	 u29VPXB2lAazJndDuLYSj7no/o1WLYSmqMTEJ5P2aHRCJOT7Fnx343RNSMoxA6X7/Ew7eukN9u/m
	 9LJIB4IJm3n2qJl2pFBXrRHZ7BC08UCktR4qwWTwa6a0Qu/z7z6YAuh1aarOnm6dfQkiOZoqO/i6
	 BQ7rrB1es1TY19SqhWmvPEtWMpjwJbYIjkm+XFyr4UthmkQWgZjFrPXf8wMt4pgc0v/R9YO5YIXX
	 +nkUJDw2ohQTVPN92QuLmpO2BpfHhx+morTqIeYWP/JbQXLK33c/gLwyl1YL6N/fDLFtFIMlse5g
	 irnETmYUensSOs0rlHV1mnJSACC7jfQomSuWx7nVtvfbiLK03bJKN5V4DJ76hf2gPWS67k01jmxS
	 I8oqxwCPIY8yPbqsjcw33B6J24PeuPF5CrbjSbgQVhTKdoo59pBVKO6HmWf7fRxUSGsd3kwS1poK
	 +yrHXhgjgKaXGqSIi8I2NR7hUj5DWTLkSrr7fTsQMf0vH8Mv/Snt8tgt+nAW/BevWwbXl3FcD1/U
	 k1kGBBvu74h+JphDA6E3arB/qWSzMSCBR4ZnQpIfm7omtiNIjN2fBWD7Bu04sm5Hy+HcT5ffM+wz
	 x7R1lv9DixA8CbRi+Y/DpBXxIsIZ26KqLqz8MfOvJC29p48CjOp8iviiqccVARIYcpseaMH3tVNR
	 x+RuXjBzpNrKlRep8XMPF2Bfl1lQiWOC88xjmSmkXcG9gA9pRt/zCsQ6GhI4Aakjk1fZXiraVHdV
	 kNB/EOuw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 0/2] riscv: dts: add USB nodes for Canaan Kendryte K230 SoCs
Date: Sun, 21 Apr 2024 20:52:50 +0800
X-OQ-MSGID: <20240421125250.1039510-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_055330_325712_234DF716 
X-CRM114-Status: GOOD (  19.07  )
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

As K230 SoCs have two USB controllers, add USB nodes for it. I have tested
the new dts file on both CanMV-K230 and K230 EVB. 

I confirm it can work well in USB Host Mode with high speed. I use
CanMV-K230 to connect an RTL8152 USB Ethernet adaptor to an OTG Port
(USB0), which works well with this log [1]. The on-board ethernet is
connected to the USB1 port, which works. On K230 EVB, the RTL8152 USB
Ethernet adaptor works well on a USB0 port with high speed [2]. I have no
health device to test the USB1 port on K230 EVB. My K230 EVB USB1 port has
no +5V power output even on factory-patched u-boot + opensbi+ kernel. 

I also confirmed the dt-binding can work well with NFS as rootfs over USB
Ethernet. It's good news for those who want to use K230 SoCs to boot a
mainline kernel with distro rootfs for daily RVV1.0 software performance
evaluation since we haven't submitted MMC drivers to the mainline for
SD Card support.

There is a thing to do: add the USB PHY drivers. Although I can let
High-Speed USB work on both of my boards, the pulling on D+ and D- pins are
not right in gadget mode for another host to detect the speed. We can see
from the factory-patched USB driver, which adds an item pointer to the USB
PHY controller [3] and sets the pulling mode for D+ and D- pins for
different modes [4]. However, the factory-patched USB driver is not the
right way for the mainline kernel to go. We should add the USB PHY drivers
to do the right thing. We can infer these things from the factory code:

- USB PHY Control MMIOs are at base 0x91585000 with size 0x1000. [3]
- usb_ctl3 register controls the ID_PULLUP, DMPULLDOWN(D-), DPPULLDOWN(D+).
- ID_PULLUP is at bit 4, DMPULLDOWN is at bit 8, DPPULLDOWN is at bit 9.
- The usb_ctl3 register is 4Bytes wide.
- For USB0 port, usb_ctl3 is at offset 0x7c.
- For USB1 port, usb_ctl3 is at offset 0x9c. [4]

But I'm too busy these days to add a PHY driver. I would be happy to help
if someone volunteered to do that.

base-branch: [5]

This patch is available to test on that tree [6].

[1] https://gist.github.com/cyyself/f7f2849e6a262b6281687b906e1512cc
[2] https://gist.github.com/cyyself/ea8895012d1035ca5bd3375b798f5786
[3] https://github.com/kendryte/k230_sdk/blob/v1.5/src/little/linux/drivers/usb/dwc2/platform.c#L526
[4] https://github.com/kendryte/k230_sdk/blob/v1.5/src/little/linux/drivers/usb/dwc2/params.c#L195
[5] https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next
[6] https://github.com/cyyself/linux/tree/k230-usb-v1

Yangyu Chen (2):
  dt-bindings: dwc2: Add bindings for new Canaan Kendryte K230 SoC
  riscv: dts: add usb nodes for Canaan Kendryte K230 SoCs

 .../devicetree/bindings/usb/dwc2.yaml         |  3 ++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 29 +++++++++++++++++++
 2 files changed, 32 insertions(+)

base-commit: 5db2c4dc413e27720b8f567522cd5ebb0bb7ef70
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
