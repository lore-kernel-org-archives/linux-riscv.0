Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EE6C021A1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0/mXpwCDGA9yAkTNpkPt/4sL9Yixc8Ppes5bQdHG7k=; b=rsJeCrpi6VYbx3
	zJCyFI1S+kwaOXFWB7EtO0mUBISML2VPKXayKp9DcH1wZKGeiCTDPVaktugnD8JBuXayUY1vylCXn
	Mnlmd9aDJIRGsIEECXDkfB5Y61Eo37kLWTj4A92on5R1tcfud7/vtTUemeSvlvJT8h7NTE/JO2Q87
	yvvbXUv4wxjlWXGng5Ckxzw9rnhF6t8EDDsIfG65QrcX7iba43L7h8oxqcZAFh/d5myFEn0SbFcwN
	3QzCkXb4iiR+yRA3axfvInMmKkg7Wpx9puKHumHM0lmdk+ytpyKlwVvSRa2SjtSh3Alkywi+ywyPS
	5Vxf3AOxp1sY2ITLq6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrLK-000000048Ow-0Sdx;
	Tue, 11 Feb 2025 14:34:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrK8-0000000486q-310H
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 14:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7377D5C2726;
	Tue, 11 Feb 2025 14:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC95C4CEDD;
	Tue, 11 Feb 2025 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739284395;
	bh=nB42p0uhAIHOz78jGbHqRdJ6skXms/+R6HmUoLjFG1g=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YoJ2VEcn7Svz3ID+6ugmHwQfqUGQUmtqOM4U/8SWAUr9JY0TQO1qBrGCytlT4KKxI
	 bfQ1WWeEOfUyC62Ohc6nXRPyL4mHpkZa2Tw7+gNhEQ/OUmvxh5FmKtIv3tzyLMj7u4
	 CA3kbu+0Ult1IHnUNgfJkULfJBmvHAZmH4AWArTMrH+yMBOJyYdM4HPKzCM3A7IR7E
	 6AgcnHNcw3QaTCeVuXJL/yJRCLgZn2jRxJ5EkQ/EEooyghl4w5xUwcGS9UDMJ/8Gub
	 bIFDPwuSBeJrywLKA0+w9jJN69cAlk0XpWPiwb8iDEHxNUpW4iIRVWs/Hwm4dw8593
	 zKxSIEWepOMqQ==
From: Lee Jones <lee@kernel.org>
To: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, 
 arnd@arndb.de, bhelgaas@google.com, unicorn_wang@outlook.com, 
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com, 
 krzk+dt@kernel.org, lee@kernel.org, lpieralisi@kernel.org, 
 manivannan.sadhasivam@linaro.org, palmer@dabbelt.com, 
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, 
 helgaas@kernel.org, Chen Wang <unicornxw@gmail.com>
In-Reply-To: <a9b213536c5bbc20de649afae69d2898a75924e4.1736923025.git.unicorn_wang@outlook.com>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <a9b213536c5bbc20de649afae69d2898a75924e4.1736923025.git.unicorn_wang@outlook.com>
Subject: Re: (subset) [PATCH v3 3/5] dt-bindings: mfd: syscon: Add sg2042
 pcie ctrl compatible
Message-Id: <173928439078.2206727.3592689089610946034.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 14:33:10 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063316_802671_F0BC4875 
X-CRM114-Status: UNSURE (   3.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNSBKYW4gMjAyNSAxNTowNzoxNCArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+IERv
Y3VtZW50IFNPUEhHTyBTRzIwNDIgY29tcGF0aWJsZSBmb3IgUENJZSBjb250cm9sIHJlZ2lzdGVy
cy4KPiBUaGVzZSByZWdpc3RlcnMgYXJlIHNoYXJlZCBieSBQQ0llIGNvbnRyb2xsZXIgbm9kZXMu
Cj4gCj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMy81XSBkdC1iaW5kaW5nczogbWZkOiBzeXNjb246
IEFkZCBzZzIwNDIgcGNpZSBjdHJsIGNvbXBhdGlibGUKICAgICAgY29tbWl0OiAyOGRmM2IxYTZh
ZWNlZDRjNzdhNzBhZGMxMmI0ZDdiMGI2OWUyZWE2CgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
