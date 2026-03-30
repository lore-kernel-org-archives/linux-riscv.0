Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC729FB3CEB
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4lKynB5g5KARgND9UwDOrZfnOAB/LDtfjTJ8BJm4JA=; b=iEoCSOqPE1JTb5
	NYT7VgSg+lqdkBoiPRPQcvyI78xKv/IJNDX4dsFfqDUU0IKQlbil9xhLQXz5uXGF62dsO913NC7R6
	TICCNR1pAzEEivDz4g10PnDj9vhVIg2LOfBxKTTZkYLzBgAMyGXxaK2j/mGsqa0PSO3Hpc7JpxsCB
	GHzK45pVpXTkH55v6sDGqjG13Z5mrFT3Yt4vOPLqLkse1Nq/iStxA9R/S/dCoJVRIyJw6ADK2Z3fX
	sMNURI+FZFiu3ba/I9Ed7mWMnYOV8jW5CFY0RJcdrrO3iKwC3n5XRZ09TB2z17Js3XiTO2TQBLEmP
	BypFyUq9tJQzv4rxGX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79H3-0000000Azkz-2luz;
	Mon, 30 Mar 2026 09:51:09 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Gz-0000000Azjx-3XKb
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 09:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774864214;
	bh=0cWBBv5rxgLi6P63en6zZ1oN58vmhNFhNRu5bv//9ds=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=TzbBmVOOd4OuhaSB6XZ/gsmFBEsbqbKokUrK0cpecxDyqshd07r6xAg8Ut2FzfHlV
	 CF7dUcPzLJVB9C1cbOBtTG1DCxJfbLu317xyb6/WmwHAxS8uSpQEBJC/2pbNN0z9oZ
	 SGu/yIW8cxlN2SIJV/r0KkraatYEUWcjCd0QT8Kg=
X-QQ-mid: esmtpgz15t1774864212tc3579899
X-QQ-Originating-IP: kgQlQ1AFTdcKJCPfibdkLFsW4QhvOKwrkiwIr5b07Bk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 17:50:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10393731450073565107
EX-QQ-RecipientCnt: 13
Date: Mon, 30 Mar 2026 17:50:09 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>
References: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MMnP0fEUKo/hF0lVVy9iS97pzi7fdTkLkAf6dhL/5n7kRRKzpqzq2PuI
	qq0qtz4sGdd2TtO0Z/Ew4tEa6bjzDkGJ4OBu/dxtxzEmezjjPxURzzWuqcTi1lgOnFhIgwx
	7KobPcviFQUGRcrPTrB+jKE1dkgSpQYuY1BnnNaeyQ+ksjl4C9p/uiWrXl2ue2mu6yixaDt
	UCRXdDA2OFbNnlIu+9pdkrHUc2KGrHFzz9wUw6BjaOwCn9786KhpcIXCUZuv/5uE383m/YS
	ZER44tgHE+dCRC6ki+fIYC6w/MAMDKgfHwDHWPgz6CuNwIHE+RsNCcpM2qFbp1FIuc1zZAE
	EN7nrftOwDYnT8Y9RPjMEv47IRgUG1IHP38eugplDqsXJRc+KYJUmqbFsekMtgZIh4pXfez
	4OiTmJh0BG2EZq+ZZfKc//pDKxcehKOkrUghQZ1vEYjtEfbCpQMYAphI8v6thDIx90VG5A9
	GXH083NGDL26pewg2V+ujhPhjCMkSaCtz/1HTpdL3Tn4bYsgSvof5N3GhRxSdhyCAjvW3gC
	ya8bjdnFqjSq9CE4n9XK+axbEUrLcon+stlFGDXYqOY1pMobCVWHJ+HNgFL15/WeFGn3Qr3
	oEsGUUmcQ00urNj/xVMyXFiPtBVw7420BpJcctF11FCNKKZRIFWTOIGJ9UWCR2RtrGyEagT
	hACsrDEyTLlxqqiJSwDFVj1v3sT5mruLk1IJP0QjzKPdV6rZ6DohPOM6mgsxzDCzyYNKszO
	/qLMA3MImi7eUJBuj6UwpTotmiWYG3yxGp5TRqgK1AeHY9T4vyU9/A/uUq1c1DimzkO8WrB
	sprWhLaHhCHzRePrUoi9UyEmS590sLdKQ4/TVlq/8l9SjkWJ1XdwjKluIiKLd9v/kVnQKaw
	ggbANaVqHlFYHrqFWMBIvmfbtSXn8EGYUdk3hoN6pmLHWAkkzAEuvWcwTnZbD/6F8RONJii
	UxlfFNR4s3+3sS823DKPmnfxKKphU5c8qUezOjcxo9bBeLK6+Bp19LNCJ7d1ySDI0yIRmjx
	mDU3F/uNiM5WOyXvM2lByvNz0BFku/FUmi6YFXREIhsiC8VDCdh2NfQeA9X5U=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_025106_408139_367EC0F1 
X-CRM114-Status: UNSURE (   8.03  )
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

Hi Yixun,

On Fri, Mar 27, 2026 at 19:40:40 CST, Yixun Lan wrote:
> Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
> i2c3 is reserved for secure domain, and not available from Linux. The
> controller of i2c7 simply doesn't exist from hardware perspective, as
> vendor directly name the i2c controller used for PMIC as i2c8.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
It looks like my Reviewed-by tag got dropped.
The changes look good to me anyway.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
