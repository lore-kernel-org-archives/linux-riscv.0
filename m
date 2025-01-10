Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9919E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC2BbaxC5oQ1en3nhAh5+f7bjKxtKvWUtluIGtu61M=; b=bUSiioq59kSeGa
	A6VSQWgsJHzlRUdoDuDLFSbofcleq8AP8s/2Y+FU3OVKVJGtWpp7+vPdfUumHHhEdDqQP4DfnN9hx
	S7v1uKDeG2ilf5sl5QoUAbhgAoNAQNVQXcsrCkGgJtX1MrjJkG0DdaFEhgfRBforWYgd7S/SnIM7n
	GuKm9c5YJa1fNtWfPsGrDmSB5InfIaNx8HykkwPmY/IyvVsk0eebnjC1A76HwFrMfdOMNJd9SqdXF
	IGh+3MrZbzZbw9D7jpyF915VmUMXuXXrZ2TtTXN1cSWmLsqd+UQ45nDDU6z7ykkDV6E3e3HNKz2LY
	bL9AEVlEFKgnSslR4TjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB0V-0000000Ed9e-41XO;
	Fri, 10 Jan 2025 09:08:43 +0000
Received: from [217.61.0.75] (helo=mail.taskinium.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWB0T-0000000Ed8G-0KU7
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 09:08:42 +0000
Received: by mail.taskinium.pl (Postfix, from userid 1002)
	id 0AA48847E9; Fri, 10 Jan 2025 10:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskinium.pl; s=mail;
	t=1736499668; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=IV0ly4+3LKTv5SI9IOldNce5vc/HfAaNTk3tqy9xnYJEdrfvIhUdL0WP9M3RWfG0+
	 JGxHCyC63LncKkUb8R+Os/qHnbRNfCesO6wQyAZKw8bEfRv5gvaSDiSL1Wb1uQG4z6
	 geF3BJQwx1WR2vrR96yX6v5k+WJt6YvpwABeKCo25bnrJLN5mv9jzj78qq13AbjfQq
	 8D0t2OF9CWlX899YE0mGUB6EYD+dBUiRtk7paxRzS3Vfan4qzBGFWeZ6Q6yX61JRBS
	 Ls+36vC9jX+kcHuR8UYPuPAVxDzREZxCg5dwYPJuclwwCAobpxOhkiHeK4Tuhc2aLE
	 6frGJ8lGck0Pg==
Received: by mail.taskinium.pl for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 09:00:38 GMT
Message-ID: <20250110084501-0.1.d.1qq7.0.kp916cjg85@taskinium.pl>
Date: Fri, 10 Jan 2025 09:00:38 GMT
From: "Patryk Wysocki" <patryk.wysocki@taskinium.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.taskinium.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_010841_244844_21B4D512 
X-CRM114-Status: UNSURE (   2.21  )
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
