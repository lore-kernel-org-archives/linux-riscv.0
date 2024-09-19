Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC29CE8D58
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7m/iMXIDD6o/1cDsrt+Y2gCBnSL4so5ZfOsE0J2Yl4=; b=iNggOc1gegNFcp
	9+oeYdxBa2Brt4UKVihkzov7GrzeLo/NuZnhug8yBbcl/5vpMxmEy2WgwQgXVZF4NV/TJsRehx49m
	2mCLRcNwngBn9tEBH7GT6dlaIbCFTUsJhHzSyxaMKhrXQzZVq+jOkBSKQcCGXSgNC0OfuwZcSIPe+
	3xEaZlGJVdNRL8R/A3zVG4cqkRA6dKCCj25rUn+DEufEwoTVp9i4m/D4iu/fK8wtZ4QwpjBSmC/dD
	c+p15KrclrDc1eFmjoTti58vMMFCUMwJh4QTpnxhQ0QyWD6ri7WMAlMp5OshPOfm5TZuT/26bUWYO
	ooIAa2tNhdJzqtyO3FBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBiP-00000009fLw-1lZv;
	Thu, 19 Sep 2024 07:36:37 +0000
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBiM-00000009fLE-1KWV
	for linux-riscv@lists.infradead.org;
	Thu, 19 Sep 2024 07:36:35 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id 086EF8406E; Thu, 19 Sep 2024 09:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1726731364;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=yrfhRGIYfqcpU65Jejfs3sDG3mR8Jj7vjWg+Bb5mea5JnQHdc7arjPUKPCMX+2/bC
	 qgydY0wYlCOaY97uUKxdnrcmmDjd13zGkuQq8v8baq/LJ6U3JQahyHfzUuvF1hRRV6
	 Blz401YLwGHTEW4OCtnHVTklw83gc6VHPy4WOxwiqOKW5Pil43T6riHQPneoO6ovbX
	 LxENRDMNw8viy2b5PHEgQsXOCHzt/z1v5IjPeq/cM5M4+mvLIr1GBvWaKqTs5qOA6B
	 u6YHTLGAMPS0wUdqnjt9WT25tqLHhjVpiY+Z3Wv1q5CjD6wFzy0WaqTXb+SHxd4/5B
	 j6z4/2AYTVhww==
Received: by mail.geniusthrive.pl for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2024 07:36:00 GMT
Message-ID: <20240919084500-0.1.9r.16c4g.0.80yokszip0@geniusthrive.pl>
Date: Thu, 19 Sep 2024 07:36:00 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_003634_493805_A2C041E0 
X-CRM114-Status: UNSURE (   0.90  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtClBhdHJ5
ayBXeXNvY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
