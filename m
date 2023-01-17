Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABBC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcLVXH3XOOGbbVot3VEtA4LbTQuRuoDIfZxbG09V0F8=; b=K70pH++wUYvneH
	rfIoUAZi5zpHy5V9XDndMKEP9bZXryXePOF2AInyROO5+bCDOVNTrIBZBymDbZcT96k3MfjRSj+O7
	Q1qhnNl7bG5TWq7HSyVajiYGbzwWQyxLC4b3o9Ge7B0/WnclwwYvnC9gBfZd323uZCZstiPm+FljT
	I7QXM0LV8NmDVqlJj7xS2gEIGaHYUNH/LFr5jcp2Gx03DpWLosCu3ImQYIFork5LbBLeMbCoqQKqD
	8rsNkDvxAH0ZxcY/NSB0obBj+YqIkY1mmygNLhPJtFp/2Yu+J746k0Pj4fDrbDydRZK5BJh2z7q/I
	rKWr90on3sqtj0pxSrQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfTB-00D3rb-8z; Tue, 17 Jan 2023 06:29:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfT7-00D3r9-QS
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 06:29:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D35C60FCA;
	Tue, 17 Jan 2023 06:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A921EC433D2;
	Tue, 17 Jan 2023 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673936952;
	bh=6SD6xx6Ce3uU6UrZd5VeimNx9g3yWB16aIsFtg1yRQI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=cHmsJHh+7Id6jvWSM4EDB6M0/LTSuU6wdoTrXwH+WJS+cYsAJU4dfA+UW6g+/8QqU
	 mFUS7GwSty00JecHClVNxmOoWk1qhSs1WcNx/cxc6u2dbapnZ5Ja1mpBZS0O5lbVD4
	 bgLV4+IBQtpEgnD9DFVnsD+uJm2kDgBycpYHzCCH6fJtFz6TsVTx4lAnXAnvUe8M86
	 dJ2LkdQjrE/IIV54lSdT9znTlj4gv78+01LOpqjfYvgH1XNRQnO4T8UlitBBpinq47
	 vci5zSrmsw1LEF05dunUe5wJEnaaze1qkaK+VNJLhvqcC0WC7KwFMlS0bc/PG/LFbC
	 XkKgnNDIuEDEQ==
Date: Tue, 17 Jan 2023 06:29:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
CC: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/5=5D_Basic_pinctrl_su?= =?US-ASCII?Q?pport_for_StarFive_JH7110_RISC-V_SoC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <7e641f5e-2d06-43c4-7c9b-9449ef567612@starfivetech.com>
References: <20221220005529.34744-1-hal.feng@starfivetech.com> <Y8BfvQCFNz9KNrDY@spud> <7e641f5e-2d06-43c4-7c9b-9449ef567612@starfivetech.com>
Message-ID: <0305F1B0-4726-4529-9A6F-517D299851DF@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_222913_933932_6C8A6E79 
X-CRM114-Status: GOOD (  13.48  )
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



On 17 January 2023 02:38:11 GMT, Hal Feng <hal.feng@starfivetech.com> wrote:
>On Thu, 12 Jan 2023 19:30:05 +0000, Conor Dooley wrote:
>> Hey Hal Feng,
>> 
>> On Tue, Dec 20, 2022 at 08:55:24AM +0800, Hal Feng wrote:
>> > This patch series adds basic pinctrl support for StarFive JH7110 SoC.
>> > You can simply get or review the patches at the link [1].
>> 
>> > [1]: https://github.com/hal-feng/linux/commits/visionfive2-minimal
>> 
>> Do you intend submitting a new version of the patchset to address the
>> comments about the bindings, or are you waiting for comments on the
>> code?
>
>Sorry for the late reply. If no other comments, I will fix the current
>known issues and submit a new version. Actually, I am busy with some
>other things recently, and I will reply the comments as soon as possible.

no worries.
Just FYI, it'd be good to choose something like v6.2-rc1 as a base.
Looks like some header changes have landed
that make the current version not compile 

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
