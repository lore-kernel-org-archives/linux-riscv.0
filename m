Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AECD0C601
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aqpTtAVcTAtQCoXhmwq0tbwTIYG3cQH8f1J/Vgc4cA=; b=yB2ilfMvnBm6d3
	kWuiBXdpBJ41GxWB7EF4belqN49KcMJs8YWXpluzS9zyYNE6LoLEjdV7hXEtvlfhvFqW2RJBNYaMr
	3ZcdSDBS61+5yUBFF5w42zLLhZDyl+yxVdw6k56V0bR7eLff5dSCp9a7xH5OE498kJpzfbbpPgP1a
	tdarRmQwjTDdeX0SFYFvnlz/OhnOw6/nVVEJ/Lt0s2ZM15fsqlEIosUCvd/WtmdPcBGl2chyAUpeD
	Oy4qW2u6tWb5V2taFlOr3QVqL6ddpkbAFJoOod+aXFeGrTgBeTggsNLzVggt570XgpADcOxP/ycIU
	p06aAT3uCMMmaErthg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JCW-00000003cHc-3sz5;
	Fri, 25 Oct 2024 12:13:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JBV-00000003cDX-3if6
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 12:12:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E744B5C5E7C;
	Fri, 25 Oct 2024 12:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9DAC4CEC3;
	Fri, 25 Oct 2024 12:12:52 +0000 (UTC)
Date: Fri, 25 Oct 2024 14:12:49 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
Message-ID: <ju2a2iddftauzvei5arnsswnrpknduyqxmrpvljvnx5zbk6drm@dwpdheyq7vkm>
References: <cover.1729843087.git.unicorn_wang@outlook.com>
 <9f9a31a2a19c2743aea36c479b0dc32da0fec629.1729843087.git.unicorn_wang@outlook.com>
 <MA0P287MB2822127FBFCCE72631154EE6FE4F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822127FBFCCE72631154EE6FE4F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_051253_987656_4A89EB7B 
X-CRM114-Status: UNSURE (   7.68  )
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

On Fri, Oct 25, 2024 at 04:11:20PM +0800, Chen Wang wrote:
> Hi, Krzysztof,
> 
> Since the changes are minor compared to v4, I have kept your signature. If
> you find any problem, please let me know.
>

It's fine, thanks.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
