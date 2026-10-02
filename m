Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20E4CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUCvoMyGXz80F6SuKP5ETiaY5GeEH6UV+eLG/VRVFY8=; b=0QuM6Vx2W78u1D
	XQcYtY8ivRzIVAiHz3T5bhPeHxE8jLJzQM2RcZlL4fPGq5/KKlIKNd6hOzRpU77L15T2yA8ks7Js9
	9GNLiLwUAzkjYXHUIUYLbkSVUMHjaqfbJ27HGjT5FJWYFqVRZ+WHNp8xeN3s4qS+TFXGgaKIsD8Bk
	Xa8U8IHJYsmgcuJ9/nId/8I6SEekjB1f/UlApX6f05u86yJRSw8WoyTMeImZldtC5fSI6vD8n+ROj
	GYnpQi3ZD5G15tq265iyTEtzeiaL2mm7zIFHkaVvOPoHYdScOs7fLDgucq1qvnjiAKR5aQyW5k9My
	g66IbZAyiiuH+sahNTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbFX-0000000BSSi-3k5D;
	Fri, 02 Oct 2026 11:16:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbFV-0000000BSS5-3DkA
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 11:16:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C4DF403C6;
	Fri,  2 Oct 2026 11:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEB01F000FF;
	Fri,  2 Oct 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939781;
	bh=o+qDQz6MDbJgHtGmVbS+vsSr5mB3oq9KHjE3DmnGWHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXlrr7QqrjDb82E1XQgj0WUDa/HVphwP+xT92QAHp9/1u9QZ8wQzyR2mLXWjE9J2A
	 P7zKmcx360P4zlk1oFXcJDp+7BgHhcRXUseeXsgP7lODfzvF0PXR0OFXKQKjiIwWYw
	 I2Bf5PwpHQdKEOapCdY2ImNSLKbvik3zDtCmU9RfxGnc5Yg7wrNO7xUWu7Ty4sY9Ye
	 b5QqQVrCmnLnSTUCSxaBaIw6DwneUyaabU7XP8HcuUdzBJR4N9L0ruQ2a48nRYu2an
	 oud9KEeUrI/WV4GSZr4sBVKrYlNA9egeesAiKQIMI6mXVuKm8LjW3UWAjJ0Y8pQgCc
	 eflkUPJGiVnAw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Jennifer Berringer <jberring@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Fri,  2 Oct 2026 11:16:14 +0000
Message-ID: <179093968156.1235108.5825486456769564907.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
References: <20260929120227.1791356-1-jberring@redhat.com>
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


On Tue, 29 Sep 2026 08:02:27 -0400, Jennifer Berringer wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.

Applied, thanks!

[1/1] riscv: dts: spacemit: set console baud rate on OrangePi RV2
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=789eed2d8bfa83d79e24d185f736b038a121b3ce

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
