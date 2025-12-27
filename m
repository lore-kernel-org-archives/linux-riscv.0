Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FC7E8FDB0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 02:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUB/teHqkOOIiWRRNwEhYP25FyXqFH2y5mHzEa5f0MQ=; b=0T10ou8LDlZJnx
	VF9KXVwbHMFB/iAzY5vYG1IAIaDj3tjpSpQ9yrk6bOaiT77gdioZYNNdvfUx4UgBCB/vwN28A4VWc
	JR2MRvUHvlIPQBpnzkP8lmSSCSw4eNomcuLQYk58H6oT0IAVFjy3RGlbdfrsWWBpsqM5FMij475ps
	OGlFg5vL9T2hgYCowaGIgePYdkUZUzuz9I15sNjrnSCGlvsKVshefcZTVSbuRcMFgPkRsuJEXy+q8
	DeobDf+Bca8/arwtIHhaQCOIfPQrmLzxGc2RncXf3PrnPKEXEOy7b9jsxDdmH/bKrLWcn0KhGAnR6
	7UHFxhghtpT/djVSGQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZJdx-00000001dk9-0EhA;
	Sat, 27 Dec 2025 02:02:57 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZJdr-00000001dj7-0K5x;
	Sat, 27 Dec 2025 02:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766800912;
	bh=p41JuVTqBNxRCHQKjtwk9ihG/E0dETrJ8qiujU9CX/Q=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=pF42UkQ7UIaMmac2wQ4OC5IlW210rQM8nscuXdslVME1hNkX9OP5yZDlZwu3CCeKb
	 wEe8liH40que5BfnHpKAb4/gUkmGyYD01XaOr8BHy/c5ImK4oc3ocmEqYOFGd+JUmF
	 bgv8/ZFI1nWuVlgx85uAz7wLoUw9HjSkHzsM6+8A=
X-QQ-mid: esmtpsz10t1766800904t01fdd883
X-QQ-Originating-IP: XEmEg72aS76MD4WYEtk9iltG/a16lqIcS6dJYB0LFMQ=
Received: from [10.0.90.81] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 27 Dec 2025 10:01:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 992677309466334211
Message-ID: <F78A665DD30EECAD+3a96ec99-07a5-4077-946a-85cf2241cf9d@linux.spacemit.com>
Date: Sat, 27 Dec 2025 10:01:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: huang.ze@linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
 huangze@whut.edu.cn, kishon@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, robh@kernel.org, spacemit@lists.linux.dev,
 vkoul@kernel.org
References: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Subject: Re: [PATCH v6 0/2] Add USB2.0 PHY support for SpacemiT K1
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NAtipnnbTPeag2ufG0IrQBlJF3XY/Xj2fFKDUM0ICmCBHifY8wHxcGxO
	/VadelyRLAGDIStX0WtaMOeoTrc2rqZO46GFzZtWTC/RzgbkRCV6VxVKc0FkALjPV33ZftR
	wi8hH6BPCZ6LhAGGqIzsu9455mWNsxL1FCqCVxO3t8KPgxm5zt2KfO3Fo4ftEb7an2csJFr
	RkYosnK1DZj9c0xJwDsh/W46fPoCnybgJEbLfc2uiju3+kyt0C0lKWSUJ8nc58bqdRkZKri
	bAePDnO3J4u6Vas/kjSUlzqfXwawT+RgiCdHpnL/l1uNjUeZi8I3bsh1cmn2bv5kRxr3Wms
	ftvInoA4eYQGgTDC5RwasS271ggxbd3LOWtUa77qlYtqiCcl4ceyImYa2N3ZulgLHUkOk/M
	deTbGNJDX1bwQGp1diLLMuTgp/0a2KOhWo7d+Mga4ZEuKq9aUCyZ5hT1Oni6bCmnzHbJIl/
	rdQmjTznlBRPjWjyPu2QQANpgyKDVvgQgje0sPQ3KixbIgAet+ELcREZ2Tl+OsWH7fKHsEe
	VMzaoCRrUr9XhwCjWaSQ4nKIFYFTAA0wXtzARsrcxJyH8ROmf2U27WkL3YOOC21ZFvsqfGF
	25l+j07I12p7rjIMnKxYMMkuYV60A+a8wIN6vGGfo/pvxbpgKMkE07oZPknPxjKiDPNEHVD
	4DaBEs6svAdFdRCugIK2SyyfUon7xw69hcnDWu1NuDbUnA66aQ02+JoWL3p4P2Wmyg4h8q3
	NJkW0opolWcr7kN/Oey70nr7BVvgRyN7n2bk96s2ujpEyogf6Ycp7YRjhFve8glH/n2CcKn
	CDSIDX729v/MlzsF+tGrlubgo7cFdhn3v8NpQ8+fcF4+n6moRhqv4iXympDhVoau/UGAixY
	aUCDDVRp7KsQdet4ykytYQ1Qb2jmYRvN3dQaPPxwVnYq9AazDKbnq+1OWmHiH5qSWW96G4T
	zNRKX9wyefG6lsAoWk3nlOeQr/ge4FUcemoU2btQhwv5cZ6OyMYZNOMjWLO2Z+IOcV2Pdkd
	eUvjzZ5U31OX8CPTl5dPXCvc94E9E=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_180252_007128_4659B16D 
X-CRM114-Status: UNSURE (   8.05  )
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

On Fri, 17 Oct 2025 22:49:51 +0800, Ze Huang wrote:
> This patch series introduces support for the USB2.0 PHY on the SpacemiT
> K1 SoC. The implementation has been tested on the Milk-V Jupiter and
> BananaPi-f3.
> 
> K1 includes three USB ports as follows[1]:
> - A USB2.0 OTG Port
> - A USB2.0 Host Only Port
> - A USB3.0 Port with a USB2.0 DRD interface
> 
> Each of these ports is connected to a USB2.0 PHY responsible for USB2
> transmission.
> 
> This series is based on 6.18-rc1.
> 
> Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
