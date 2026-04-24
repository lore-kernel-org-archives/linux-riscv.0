Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF89FDEE5F
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 02:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ec+ipS6pDtIqBuEKCLp0keQpjqLsG5Hi/+UmDtA+oKw=; b=uywH2u1FVXaqRP
	Qd36v65OjjCIZ7wspOSJzRkeLJRqbwMiUwe0roTlUOxA2CTylLtKhX8rJvGi3qYeALjYavAwwDWPm
	tAlI2NbwP91dqqY1CHCsFcpiBpSYbM3X2VAtp292O664nGlukrvkF3k/yQr5BlpxY6RS8fCYJEFmT
	Yyqp7wvKkGIOLxM6L911qszjxJLlhkShxTjrSgWl65e3a5PVaXz+iHNHnATpbZ2GoI34BEvRLI1Ql
	tPxdOLPa4BfUsFTCJH8q8wPwrRiHwDtuzYJ/p2yt7cDBi6AnMssxuR8OK9vK5cyP9BYtyDNs1BeZ3
	cYmNgR9nCEG5DCG173dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6QS-0000000CVaC-0zR1;
	Fri, 24 Apr 2026 02:37:52 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6QO-0000000CVZo-1778
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 02:37:50 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 63O2axDs060195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2026 10:36:59 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 24 Apr 2026 10:36:59
 +0800
Date: Fri, 24 Apr 2026 10:36:58 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        Conor
 Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/4] i2c: add support for Andes platform
Message-ID: <aerXSoA5JZKr7d6n@swlinux02>
References: <20260330-atciic100-v4-0-d40822f63e4e@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330-atciic100-v4-0-d40822f63e4e@andestech.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 63O2axDs060195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_193748_677679_4D649D69 
X-CRM114-Status: UNSURE (   6.96  )
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

SGkgYWxsLAoKR2VudGxlIHBpbmcgb24gdGhpcyBzZXJpZXMg4oCUIGl0J3MgYmVlbiB+NCB3ZWVr
cyB3aXRoIG5vIHJldmlldyBvbiB0aGUKSTJDIHNpZGUuIFBhdGNoIDEgKGJpbmRpbmcpIGhhcyBD
b25vcidzIGFjazsgcGF0Y2ggMiAoZHJpdmVyKSBoYXMgbm90CnJlY2VpdmVkIGFueSBmZWVkYmFj
ayB5ZXQuCgpJZiB0aGVyZSdzIHNvbWV0aGluZyBzcGVjaWZpYyBpbiB0aGUgZHJpdmVyIEkgc2hv
dWxkIGFkZHJlc3MsIEknbSBoYXBweQp0byBzcGluIGEgdjUuIE90aGVyd2lzZSwgd291bGQgYXBw
cmVjaWF0ZSBhIGxvb2sgd2hlbiB5b3UgaGF2ZSBhIG1vbWVudC4KClRoYW5rcywKQmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
