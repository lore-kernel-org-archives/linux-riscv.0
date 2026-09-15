Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C5BC88E72
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 00:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duQIFLi8jnlu4CxZMYUdzgwEjGDovnIO0hA68pKBlNM=; b=EnSJB+FCNl4GwV
	dYUqRs4fJ3QnuC/to9iBY8imAjGYp1FHjwezDIQU2PFC9YyR9iGYXvr67ABfmcPUNty0zRrbgfiiT
	X5ds6TYtve7QhdENjiDDj6rfSK//QTRe/j2yFqh10bKEPuxmhkC/0t7HsO8YWaVk2TnCykYIlDe7s
	h+t/pWqAceSEu51QNOM+fZu2bRCQcxXz6RVtJvWHCzCxgVE5m6miaHRxdn6t+FA2edgE+FFbLtPJ6
	BejTxpUdvVl/030rzelDiHpL1y/l78AWbrLqSBwUc5CPTU803Xxa1lfDtNInIjVJ3Sq0jEwexZGSH
	NXP/7Me5XSdkg29TJ1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HUu-00000004voG-1iKa;
	Tue, 15 Sep 2026 00:58:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HUs-00000004vo1-1oGh
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 00:58:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0A484020B;
	Tue, 15 Sep 2026 00:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068CA1F000FF;
	Tue, 15 Sep 2026 00:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433885;
	bh=GbaWcVbQPLTkAyQjGB58ukYMT/b3NDN5HpI68gRI0Sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oY2nyQYaQNNVunkf6kYhibDQUJHf2epLugfl0kk5T5CG29CsC4eEnj592ZLpWoaWM
	 s+edCt8FCAKYqHZw/5g3CxF9WPmbx4ic85eHdUsIAWPUkMAqpm3ynA0zVVORFtVkzz
	 vmsa/hTou0iwPGF8eZ5AUL2B2AdCZ1p3t4mDfum1tEoxUxDE5WiQgO7Jt04syCyfAD
	 R/9iZJhVcdhIO+kL7cPhqxh2yU2rp3R9sSEXkKpZuK85VBWKisi3Ff6Hskhx7UVDlu
	 KbhTnvAT984dIYqdj/O0VQjIM6heI5fhhchyu2E1XJVka0bp9YwrKulwndcATqfzB0
	 xa5GCG1coJ9zQ==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
Date: Tue, 15 Sep 2026 00:58:00 +0000
Message-ID: <178943386049.3673953.206218142747797275.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901080010.95040-1-amadeus@jmu.edu.cn>
References: <20260901080010.95040-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
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


On Tue, 01 Sep 2026 16:00:10 +0800, Chukun Pan wrote:
> Enable the i2c2 bus and add the connected GT24C02B EEPROM.
> 
> [   6.766] TlvInfo Header:
> [   6.766]    Id String:    TlvInfo
> [   6.769]    Version:      1
> [   6.772]    Total Length: 38
> [   6.775] TLV Name             Code Len Value
> [   6.779] -------------------- ---- --- -----
> [   6.783] Base MAC Address     0x24   6 .....
> [   6.788] MAC Addresses        0x2A   2 2
> [   6.792] Product Name         0x21  15 x1_orangepi-r2s
> [   6.797] Unknown              0x41   1  0x01
> [   6.801] CRC-32               0xFE   4 0xE5A74B18
> [   6.806] Checksum is valid.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: enable onboard eeprom for OrangePi
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ac436e6879f5bf25e971d80f96f9392b61ff54c6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
