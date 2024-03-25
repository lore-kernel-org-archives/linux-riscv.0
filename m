Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069D3C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 03:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeIa890Q37xE+4yCvIoVvBkSCr0+LEURfn+/mOLDHxg=; b=iJcLUpRO3UMh6p
	T6riDTwMNyQ9m8EWFvICeQ0iO7VOL8w/noBDvkGjjrr52+9huq5J+mIDnTQYWQY4vGRuwjm95ffkE
	MUFk+J9w/8Ut6MjoTPcl0Y8H5Y8BqDDbSFaTlwNBwYdfXJfPRefqaYmtbdRRgtHRmk0UZsi7cjpQz
	bqGYUZUV96x2GYonTMPkgOKYY4fma9Xm84BO4Hgre7nCX1KSPROZjCm5RPDPTYGE0zufVs7GaRyq3
	8lNVjjF5K0fT5fIySIc/VIuAhmm2ZnrRr1MQxLLHUuTJirAERWpt2hcbL02+eNj37W4XNfskGSZsU
	BOF5wMgBjg1Or4tBRZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roakQ-0000000EqsR-45Fo;
	Mon, 25 Mar 2024 03:11:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roakF-0000000Eqqi-0FPZ
	for linux-riscv@bombadil.infradead.org;
	Mon, 25 Mar 2024 03:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cUaB1Qlwp+5KOdt5XNJfaAEphVdI1Mx9/MaeC4ADKag=; b=eGVC99dBm8Y4JsAdNlEl+gehXr
	97PvVlSi81zzAXeIhWvyKXyg26/P7Myst8Jq6sJ+S3QoxldNe6T4cbjdWiPZnFKu+7kRZ7/uUR1F0
	kEzUyDVeFX6gZA04vh5GcR0RsHyGHMsbpcXdApSbs1TqDdudDc/HjlEEADd993YfmOZ6/0qY0iaXW
	qVZ2wsrgXTczmyDZsp0y6y2Fj/9/Lntx7m6VG8RTi0wWpLJ+KIu6zcgzoK5ZSNWJKEhoUM+YXXXlU
	+PxxhYJgMOf9+r2/LcU/98UvNX2rZVboyQ0sUvNOaVx7a4pvjQyYn/CNEJtY9Yj/J9I1tvn3Z2BlF
	uNtHkpzA==;
Received: from out203-205-251-72.mail.qq.com ([203.205.251.72])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roak9-0000000GNe4-0Odo
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 03:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711336274; bh=cUaB1Qlwp+5KOdt5XNJfaAEphVdI1Mx9/MaeC4ADKag=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=nRxMsIP1fu/l6yuxeMnlfhuYqBxOe0DctuLm3k+cuoxplmOSgmhXbRuCTpH7dk1y/
	 twvah3e6H1+kfj+qvQIL5rXERC1BsmdUlQzo/BINm7yPim7oGFosVX5+D0HlKtnXZW
	 Elh0Zfti90fs5x8+MHBDUxbQp7+4uffBCeuXTXvM=
Received: from smtpclient.apple ([2409:8934:1ed6:2f4f:d8d3:a43a:ef25:fb4f])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id E73A14B8; Mon, 25 Mar 2024 10:57:51 +0800
X-QQ-mid: xmsmtpt1711335471td1lycwv1
Message-ID: <tencent_3A313D213A8D897C9D8224DA538EAFB8B608@qq.com>
X-QQ-XMAILINFO: MPaKaX623R7Y3L+KntZXBnA7NdwH6aw/GzZNsK/ATSLO+OirAumPXo7IHX44rn
	 GlUXhRU+dDH0hFDeFjSi3zExYsNQYPEXIt3h0AF/6BhT8G3LJe+/aDv/iQYrLFNcouwOA4GDti1k
	 UdzvNNI/tLPLMeSMm+uanZG1bbJ/6b0mnM2qU0PsDg9HMNTZFncfBVc08RD1KFFwfPgmyDV3Oyk6
	 DTm6R1G2abAsPoKxxC6zq1/nKoVL7jeouOgbTZhTzp8GXa18R4V0K0e2ysXfQC05s116LyxZaNJ3
	 whkyJb/t4U/FzCy+Z6wEYcIHslCq0+z9QrH2A3zzpkYAFo/BpGHMZDBz4C6+NJ5qqTyGB3ANrGI8
	 eUisisKnAFldkFUDkJ2v+MIlnd01tGWRnHhPTFkle102pL+TG9axkqPYsF8oQ6ILmkU4790MYqsw
	 9js3tZtkao92myJvumpfht8GhvBdeSLN12iK1rWdkS0wyQVNWXewjJY3DyDIJ/jNFByDFZ69UDfK
	 fDLEcqb/FWUAVjv+DaCpbjq//miDlHRHGe8AvyELIZH3WJN8SZartS0pgofFSm3O8kXJ4Zx1SSrC
	 urDurZLQaTGLfRHqIXDn6/6No9ZOnX7RElYKFqApALD4oIe9mxBtJGe72j7yvq2zXh2Mhaj4PQkH
	 lPQOjFENbVkZYQpDyMOindBn8L3n4e6HqeG7HkGQqZd9X9XkIUn1vUOY7KiyjaLAGBYNB5lL4xep
	 X76coa3VLbA/Vz8Dcpc3h+tbkrDBNH7FHXND1QuCNeVLmAlHo4p8WuVI+NnqTQ/9+gu3Rbs2NfCO
	 3vdaDQpD8AEl7zHBDcJaPcOsYnGSd4IUQw9noVCRojyeqT0faerlyyW+iH++YNx06HGDXhQaTqjj
	 wofz0R6fnvD7D9jFHDo8ZGyZpLX1hlPofnRE1jNMEfeS3DJ1taZ0V6aaANPUNQ8APY/9On6n+0K/
	 BlChnb3z5IOR3kC5wrr62ihCzdnljsagZB4bjkiRZDlcwfGsWZrQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb
 dts
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240325020334.4033-1-dqfext@gmail.com>
Date: Mon, 25 Mar 2024 10:57:40 +0800
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linus.walleij@linaro.org,
 linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 mturquette@baylibre.com,
 p.zabel@pengutronix.de,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 sboyd@kernel.org
X-OQ-MSGID: <ED3A5AAA-6A9F-4DA3-99E8-5F94C542F097@cyyself.name>
References: <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
 <20240325020334.4033-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_031127_242250_D746FAB9 
X-CRM114-Status: UNSURE (   8.83  )
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

Thanks. I will add them at next revision.

> On Mar 25, 2024, at 10:03, Qingfang Deng <dqfext@gmail.com> wrote:
> 
> Hi Yangyu,
> 
>> - Support for "zicbom" is tested by hand
> 
> C908 also supports zicbop and zicboz. You may add them as well.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
