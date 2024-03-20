Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC89EC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC2BbaxC5oQ1en3nhAh5+f7bjKxtKvWUtluIGtu61M=; b=Xmb18wW3NIMM4D
	kDFotzExIumpl7zQa0pmu8GhrfZrwXhKXFjO42Ek+JY1cAoQSiOCL6eYtHlIUrTz2lkmsylq4CH+O
	jtZ/JLb2De//jwRp63esOgbU0Lu62Gl/y0PySoQUoBslOH2lfP3qTHvTJcNlNhlc5yNtG6cnUa1xo
	6IFG3p+Dl9b0o2gpZkzJnRjmvD7B7Vaar7Z5GwQdm7TjUDLzL778l5JJqaofUEXmh5z0VrJ1sj+2B
	FvKSmpZDP+fV7CAqDMk/vCZCoL5XKL7qSZVwBxJO2KK0nkMSNqECN6PhL4EcdYgqc7Zdu0WLxJSLL
	E8aLx4GJC3Z7I4yBRnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrbR-0000000GGda-1U6r;
	Wed, 20 Mar 2024 08:47:17 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrbN-0000000GGaU-0xKF
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 08:47:15 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id 2D8DE83689; Wed, 20 Mar 2024 09:46:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1710924427; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=Aovnf9J7BTSqECzGTJF0oGl6Qe/13gs6EL61SMIHcCcbjRiLjM8NuzTVBzZEWjIm4
	 oMD5tforF2JJmcNtmmmBrzXHq0Kwm6dWmZKogJKwUNYOYAOG6f+8lDBkggqi0CzB0Y
	 b+qgdikSWUmjVnRn9Y8Gz1oc+NsKOVSnPRZ4q6QcwJ6HGWMgd2EnMKtuS9Uhn9+4nq
	 s7gfRFjQtY6kp58GYd1OV0xkmiaMuLqfAzsx932SJVFK5qE25jcVx/XrgDpwPcjlRb
	 AIXqnwbU7Lqy0Bd9AV6MBu0iPLSSBRKVBtl2cZrJnpv+p0P7B87xVLKWLQsLch0r3M
	 MgZHzxWHCHDtw==
Received: by mail.haughton.pl for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 08:45:28 GMT
Message-ID: <20240320084500-0.1.15.b8qx.0.xbkkjhbjd5@haughton.pl>
Date: Wed, 20 Mar 2024 08:45:28 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_014713_972620_69CCC3CF 
X-CRM114-Status: UNSURE (   1.53  )
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
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
