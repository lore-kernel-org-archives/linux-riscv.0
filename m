Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B5BCC6B27
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11tEVu5YD9H9kJut9PWA6cUYntHIyhtfBzDmBzugYfM=; b=x/k9/wgMww1deT
	p1PKeQav914nE6OQ6Gp/f11VD24zmTTjHoLn4Z5ZiydAzkqO8SetFPSbZwjecGU++EfdB13C3XMgu
	jlWTeL+mxPh6WhDxjnJvF12+GE96eT/jgynA7gB3KIebs5n7M0+CNqTJu0+m247/qR48pX3Ppoka2
	DUSuViBCKfbaM5OvSmYgZBIOWXSurMW5NTsJb5qaqSNjx70hGE2PdvikTxr2dCDrAAUYwULoeSjoz
	0VP76NIS2PJTGNPqsZVJy7GKu7gA1n0HUA5VqkmnQ+yaPCWxhwtSsKZ2dV9YG2LirK/PQwpfCsjwT
	J3CMNBsp/jWdpom2sSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGup1-0000000ExTp-3Te0;
	Wed, 14 Oct 2026 08:58:52 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuoy-0000000ExTG-0KEz
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 08:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=gAke8ZID5060Jrf2PqUPtfFmCYS+RDy1jo+4Ajzd0Fw=;
	b=qLiZDaH4b3DljtVoezz01wbjxsIMKi8AyrqLdYz0ViCZfmGNeBBxatYIQqhEc+
	utfTokdmTy7ZH9d6Flje4NJSVLpVYz5YHvNxc6YsDOa5jdEM5x/hUdCbpl6ivd7I
	SIBzRuGX9fPgiQ17keomgJwYKD7GTMq5pUf8fie6XTxnk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3v908RM9qt594Eg--.56508S2;
	Wed, 14 Oct 2026 16:58:38 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: radu@rendec.net,
	tglx@kernel.org
Cc: cmirabil@redhat.com,
	lzampier@redhat.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
Date: Wed, 14 Oct 2026 16:58:35 +0800
Message-ID: <caplitmus-rv.reply.20261014.plic-status.320704e202ed4139aee623b340f3d65a@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
References: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3v908RM9qt594Eg--.56508S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRMPfHUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R6ud2rPRD4OwwAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_015848_518628_69F0DD2B 
X-CRM114-Status: UNSURE (   4.51  )
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

Hi Radu, Thomas,

A brief follow-up on this v2. It corrects the Fixes tag as requested,
with the code change unchanged.

Please let me know whether it is queued or if any further changes are
needed.

Thanks,
Pengpeng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
