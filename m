Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E032DE95A6B
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUUw4WZRfCLE9eKgXIVUtqKqTnBJe7dbZkaWtEcv+Tw=; b=BMJYN/dW3urFVr
	uLqJ46xB6SXL+rLnZFlG3jNlpzHp7LOI/2dJm/ElPlH2VqyxN6NLWZR3txOpMoNU6PC+L6fK0nwlq
	QWhOFYJ8t4NEHtivJemGrXn/myrsHu+5Cw0+6bTYkw2UEgDcC3w7nBoIEu+L/IE+JvVVQdH6O3Qy+
	1C94DQsCr44qZohNNX6dt0jmKBJHgre/vySBqG0twrGCkGQQAy4nUip3a2E3k934536QjrBIDzQbr
	llUIpBvX9FoF3QCZEX6oQEB3rCCQbEJ+8376QiR4m5opgNP5eS/cPXOfZxQ2sitdKYdsYG6jqSz5u
	HE2vYivtm+4Kz/AFDAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpEsi-007xBY-2F;
	Sat, 07 Oct 2023 21:30:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpEsg-007xAh-2g
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 21:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 959F3B80B0F;
	Sat,  7 Oct 2023 21:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8909BC433C7;
	Sat,  7 Oct 2023 21:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696714226;
	bh=Asz0kAidCXdNyyjv78EuXEU55dPMW7DudgwPSZhas6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwD0qETWEV32uLd4myrJ5IuHQOxSxdlVbVAZFGkf/rc4k32PZ+RIsXJvFVsj36EDd
	 vjtq9t4jCqIDAKZdQbSCkQJze33sKcrTtUBqTcLJV4oivoEJFtZnHQ+o5P8vsbLzbW
	 bHjwP7XGKXEk8CzQIJYtpPnNAxfFDNbVqwwh7/AlbhhTvlOMyhleZHeQ+9mB/SXedl
	 KXGNBdAkdp80l9X7BDsdyszpoYALJerhjrZHNRFhGXEKmYHLC+vH27r5Mk9/VTCFoi
	 PcRPf1Iy/Cd+zp77R+W7UiHm9zArFB1JoAddHzobd7LhhXeRGZspOO3ibPs66h8aKX
	 pMl3gz0i6ILEg==
Date: Sat, 7 Oct 2023 14:30:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: He-Jie Shih <bignose1007@gmail.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20231007213023.GB174883@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain>
 <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
 <7BC51820-61BC-422C-A2F7-B68CE679972C@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7BC51820-61BC-422C-A2F7-B68CE679972C@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_143039_050454_7395603F 
X-CRM114-Status: UNSURE (   5.33  )
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

On Sat, Oct 07, 2023 at 05:01:45AM +0800, He-Jie Shih wrote:
> Reply-To: 20231006194741.GA68531@google.com
> X-Mailer: Apple Mail (2.3445.9.7)

Can you please fix your email client configuration?  Your emails have a bogus
Reply-To header, which makes replies not be sent to you by default.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
