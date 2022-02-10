Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA90C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DUsc03ulQjdtIUmvoq8ZuOtl2hdDtofoRV/3QGIfpz8=; b=j8ywo1P5AXv6B7
	x6OCzieXkqBjTHLJfQNX+SDHpTrrL0sJe1XFyrz1pm9n7/BTchBVmzajrTaMg+VjTKnf7kb79EHww
	VW9d0bcdgJcwRVi0tIv7Lgx2Qy0NAvej/2tFznVvwTVETF2/45BJ9PdzRJV/CR0sxCUIhafb2uxA+
	l9JqMm/0pPTmRutkUbMw2djnCA/Yc5JCbiXybKzcN8mVwW1qNuwXMMTyMZ19oTcH6z95uz4KBjRXL
	7ZA+LiCIe4gqQBM5TeK1TJo7UahcO43CjW4OnHG+AXJ3MtBnoy/FiIp46tpV8LQbdM6j1HH3QpwlF
	3870IfRjqTM8ae5YxLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI4wB-0035Aw-WD; Thu, 10 Feb 2022 08:36:24 +0000
Received: from mail.trixen.pl ([192.71.213.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI4w2-00355z-Ae
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 08:36:16 +0000
Received: by mail.trixen.pl (Postfix, from userid 1001)
 id CEA084083E; Thu, 10 Feb 2022 09:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trixen.pl; s=mail;
 t=1644482146; bh=J50dbWEn9x62xyxY1PWPtYxMwNMcDFoILqXfzM3his0=;
 h=Date:From:To:Subject:From;
 b=FSFibUejtshJOLs3U3BwTR63YiP790IvYAisMAiNdBrfR0mNFIBsCXjJe5dj7eUz1
 lFilkFWkCzM3H9JWz5yz/LGZM3HmNkY/SvND9465sbyyXLLq7DGBDQjjXP9EliWpwt
 6LgGvl58DDRR7PYcvfm4L3AznQtmsPuKrYmTx2Oar1Fkso2Ao1vdgAxe8ORywaao2s
 7rGkQOQeWEsDFQi64BbABfLpr8IeIX81V2omAZvIiWkvV2lsozlWgW8885e6jUKNs6
 kEsxoHxhmRvUD+maxIaBbMA+IA5+v3CkSd7mth3STMPfv2DF482SBVV83dqcM6qiNA
 w/D82M/Ty3a+Q==
Received: by mail.trixen.pl for <linux-riscv@lists.infradead.org>;
 Thu, 10 Feb 2022 08:35:44 GMT
Message-ID: <20220210084500-0.1.t.1t4d.0.vjgc488k25@trixen.pl>
Date: Thu, 10 Feb 2022 08:35:44 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@trixen.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Monitorowanie samochodu
X-Mailer: mail.trixen.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_003614_579312_243C829C 
X-CRM114-Status: UNSURE (   1.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ2hjaWHFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBrdMOz
cmUgcG9wcnpleiB3eWtvcnp5c3RhbmllIEdQUyBtb25pdG9ydWplIHNhbW9jaG9keSB3IGN6YXNp
ZSByemVjenl3aXN0eW0uIAoKRHppxJlraSB0ZW11IG1vZ8SFIFBhxYRzdHdvIG9kY3p5dHl3YcSH
IHdzemVsa2llIHdhcnRvxZtjaSBkb3R5Y3rEhWNlIG5wLiB6dcW8eWNpYSBwYWxpd2EgY3p5IG9i
cm90w7N3IHNpbG5pa2EuCgpTeXN0ZW0gYXV0b21hdHljem5pZSBnZW5lcnVqZSByb3pidWRvd2Fu
ZSByYXBvcnR5IGkgcG96d2FsYSBkb2tvbnl3YcSHIGlzdG90bnljaCBhbmFsaXouCgpKZcW8ZWxp
IGludGVyZXN1amUgUGHFhHN0d2EgendpxJlrc3plbmllIHd5ZGFqbm/Fm2NpIHByYWN5IGkga29u
dHJvbGEgd3N6ZWxraWNoIHBhcmFtZXRyw7N3IGZsb3R5IC0gcHJvc3rEmSBvIGtvbnRha3QuCgoK
UG96ZHJhd2lhbSwKUmFkb3PFgmF3IEdyYWJvd3NraQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
