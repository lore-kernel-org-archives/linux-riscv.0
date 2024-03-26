Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37147C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 20:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFFvoBvP1JvFFvitKz2bkGpnKL6aHRpt0qV5RoiaPLo=; b=jwZWwf1yasgnbS
	ihBeu6Q+h0QPoAh42iC8YMiRN2szKftFtxzdvFMbMgGRMJIhUUchkTGyBHpq5+W0CfP/4IqSKVBSc
	R9ubNr4bLzAGho3urnOBX2FRgue9GYTqSO+SocTTGyBzP4rUeZ7r2VE6f590AyfkGb5K5G+/T0K+h
	O+90vwlWrVmZjSRPajzNJA7znyuKRHV2AWJGzI90+tyEgr5ElaKE9WA0fycwmcsx/FjkSNFZ5Vn6G
	Xi31T0cMeEdg60dFY6u+NtC9v6UKIbCiVu/R/YaH0vQ/kPmOrvJbYzXEP6iApgd76zzD7OJJ9CBzt
	tyGtJkdZXSA17zeRomBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDYM-00000006Osu-0FZJ;
	Tue, 26 Mar 2024 20:37:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDYI-00000006Orm-4BBI
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 20:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CFB1611FD;
	Tue, 26 Mar 2024 20:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FEEC433C7;
	Tue, 26 Mar 2024 20:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711485466;
	bh=Q+0/ltytHVNVe17dw4a66rMcIkTyRhhWaQELFnVBTFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyE0IEcNh+PkrmksKPNXCL4zEUBaje+Mc9e8mt4+jSbTMuejZkiWj66j3zNt2kobC
	 E3cCcMm/QNxYAiwJ96ylGhIbqIKiqOpyqe7+RjfRHHCdDI3Eersk/0GMMzBKA4a15N
	 7b1+ZZ/xkGc0Ixof4ibRUzrDJxpPO9fKa6DsgQntRZzsWj/50BS+lrj6YVmTAcSDG3
	 b3BeAQCQYeKPvr923WN0rYDoe+nCeYpwFYtE5h3zf0oTTHZYQr/zC7DnKgyP7d6K0B
	 Ud3/ffrT9kkR8RS75EhgMz1HGzsMbgC8mdEGHf7s91wPH/X3z1bX9mcO/t6rqPjenf
	 14Eco3vyLQVYQ==
From: Conor Dooley <conor@kernel.org>
To: ganboing@gmail.com,
	kernel@esmil.dk,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shengyu Qu <wiagn233@outlook.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board
Date: Tue, 26 Mar 2024 20:37:10 +0000
Message-ID: <20240326-create-motivate-2792be1692c5@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
References: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=472; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=flQK06d61XVdV/qN2kQBXCsv/i+05oATJwu6J3J8ZbQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnMht8sb+xIW/FtLUdJRcUiFc0f05m+3Gx+w/aw7q7jx DgD16Y3HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIggZGhlPNnIZTlUtfSGmv OneJ52C0zdprSuJrdGt7s1Mn5xwOdWT4yXg2e9+nlZ7VXpOFXZcts+D98fPRZXaOSXZHpnis5Tt kwgcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_133747_100938_799CD35D 
X-CRM114-Status: UNSURE (   7.55  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 07 Mar 2024 20:21:12 +0800, Shengyu Qu wrote:
> Interrupt line number of the AXP15060 PMIC is not a necessary part of
> its device tree. And this would cause kernel to try to enable interrupt
> line 0, which is not expected. So delete this part from device tree.
> 
> 

Applied to riscv-dt-fixes, thanks! And I didn't forget, so I re-wrote
the commit message to add some more information as promised.

[1/1] riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board
      https://git.kernel.org/conor/c/0b163f43920d

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
