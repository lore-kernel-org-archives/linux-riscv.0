Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C2FCD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5E5qClT96EYUKF16PNP4myA/qlgift/xnbAp8Rm8MGk=; b=D2jxb8ANl3wjXC
	t7KTi5/E/qeMMm74Uz3E5EMM+aFif7HUIvzAkx57Y1XAlsxFud3bG0IezTQnGoF+CTetX/ci6+a6S
	TcT/0atxSsmFaNMFqFZ9kXdJTaPtLSF5LCHhxpQqUY9za3n1t18PTmEfjhOr4NQKoTb7r9JZ8fexj
	doWUtCzy0Lhg2q8sRkyFCsnQkglAlt4OQ5CKAEImhcMdllh8KCxIj+hUo5vG1oauv8inNyQspAGYa
	v38C2MPsK+WsN/2m3iy0TwNTfDKnilVsXdozT3kwc6UXG3Dp4Z6jpo3nt1MyPaFRjU8y58CbOh3xs
	8/MNiuFffwEF0XETA+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vo-00000002Cgn-1diR;
	Wed, 13 May 2026 10:35:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vn-00000002CgX-0vfO
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 10:35:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B7E860121;
	Wed, 13 May 2026 10:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE963C2BCB7;
	Wed, 13 May 2026 10:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668510;
	bh=sF+Pm4mfrfXND7lL5Z6QpI4cx9tugUfK4jX6T+Nq230=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqlU/05d+cufJULX5BEPfPMM2CUDbVBGecI6BkX5uxwnB/5dFoLkL8RB9bL2pwg8L
	 Iv4jruKLTFHbBo14xJEhqiJYfaTkKbr9plMyXCXXSHWwhAVc8Wbn1VKTB0DUJdzYTn
	 Bhetk4n7LD7/RuV5UNqZdwlGVA7xHyIska8Ov8AA=
Date: Wed, 13 May 2026 10:59:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: liu.qingtao2@zte.com.cn
Cc: krzk@kernel.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, marex@nabladev.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, rdunlap@infradead.org, geert+renesas@glider.be,
	quic_zongjian@quicinc.com, arturs.artamonovs@analog.com,
	robert.marko@sartura.hr, hvilleneuve@dimonoff.com,
	thierry.bultel.yh@bp.renesas.com, julianbraha@gmail.com,
	flavra@baylibre.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.wenhong35@zte.com.cn, liu.fei16@zte.com.cn,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	jia.yunxiang@zte.com.cn, he.yilin@zte.com.cn, bai.lu5@zte.com.cn,
	yang.susheng@zte.com.cn, shen.lin1@zte.com.cn, zuo.jiang@zte.com.cn,
	hu.shengming@zte.com.cn, gao.rui@zte.com.cn, tan.hu@zte.com.cn
Subject: Re: [PATCH v2 1/2] Add ZTE LRX UART driver
Message-ID: <2026051332-footsie-ogle-4eba@gregkh>
References: <202605130851.64D8prqc083672@mse-fl1.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202605130851.64D8prqc083672@mse-fl1.zte.com.cn>
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

On Wed, May 13, 2026 at 04:46:51PM +0800, liu.qingtao2@zte.com.cn wrote:
> >From 08610be731b6fc3919d5eebfd2ff9d67f38a094c Mon Sep 17 00:00:00 2001
> From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> Date: Tue, 28 Apr 2026 22:30:31 +0800
> Subject: [PATCH v2 1/2] dt-bindings: serial: Add zte,lrx-uart

Um, something went wrong with your email client, this should not be in
the body of the email :(

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
