Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B0C5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+8wXOJhT9s3FdwqntDKqa+ZxGRz31HjenzZM/iWtBdQ=; b=AAX5AcmmLBUHh2
	52HmdMCD7lK7x9iFW/UqACe34LB0BcMiJAFRrlNA9BuRQ8Up2Msa2yWvN20TP0iFZhxcF/EDGZX91
	hpxR6Qb50nnePirRiasAt1NaR7KhvuK7uwMh3uIimKUHEWZHyAc4UTqbZsXO7AoQl5mpPBv0+FuJ8
	xh9VhlSyIUNc48Az5h4r9tfYPbSTEaF2MunbmvRJhUYVH6iR3x/tvGDQcVI6gdyeTbTCoNB8UbocZ
	W8IOv4Ekm7xGaFOds0BRAB63ZJF0zMHl8s1EPpmNgXp1xyWD83fXDT+G8YG3l7m8t0JcRpJ1yusrO
	xXwfDu0s+WZO7tpxG4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY8y-0000000FDbv-2IQD;
	Thu, 29 May 2025 07:57:40 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY8t-0000000FDbB-28sB
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 07:57:39 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id E1F5223402; Thu, 29 May 2025 09:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1748505381; bh=X+wkoA4YOELW9s6cx2H1FfY99BwZ9fmdzIT3K0wvljE=;
	h=Date:From:To:Subject:From;
	b=QLW7K/VljnuNvVWEnsEw+1riouuZ3scWjP/VLst1nrghA2/mNd1VUAcXqLOuQucWV
	 h+z2YDZCxLxnRbwM9itV258d2EO+wLKqEHWJwe+oBv1rDwdiRgav52vORw/sx14iJB
	 3tZToyOG4nkn/u1OvL4WR/tpls5JHoZ/VTpeiCBHSDuvgWpwHdQ7IArLrqfaZ4P6xK
	 sCsBGr3wbZOIeEoAhqPkflC8UD2NtN6di95d9MvY2wcZgq8MuRJkPF02mWRkgyBZDS
	 KbMZjSW9Zq7QimTHEP5Vb2iEwS+Lop4/ljOjnz4lJguQQzEolIf89bZ+cHIXAWePfk
	 4gKq4jIkvZnMg==
Received: by mail.scalenook.pl for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 07:56:11 GMT
Message-ID: <20250529084500-0.1.gx.222eh.0.pdz83rgqy0@scalenook.pl>
Date: Thu, 29 May 2025 07:56:11 GMT
From: "Renata Nowacka" <renata.nowacka@scalenook.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_005735_696225_C30DC326 
X-CRM114-Status: UNSURE (  -0.02  )
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

RHppZcWEIGRvYnJ5LCAKCmNoY2lhxYJhYnltIHdza2F6YcSHIFBhxYRzdHd1IG1vxbxsaXdvxZvE
hyB6YXJ6xIVkemFuaWEgYmVuZWZpdGFtaSB3IMWCYXR3eSBzcG9zw7NiLCBwb3ByemV6IG5hc3pl
IGludHVpY3lqbmUgbmFyesSZZHppZSwgamFraW0gamVzdCBrYXJ0YSBsdW5jaG93YS4gCgpOYXN6
ZSBrYXJ0eSBvZmVydWrEhSB3eWdvZMSZLCBvc3pjesSZZG5vxZtjaSBpIHpkcm93ZSB3eWJvcnkg
xbx5d2llbmlvd2UuIERvZmluYW5zb3dhbmllIHBvc2nFgmvDs3cgamVzdCBrb3J6eXN0bmUgZGxh
IG9idSBzdHJvbi4gS2FydHkgbHVuY2ggdG8gZGxhIHByYWNvZGF3Y3kgcmVhbG5lIG9zemN6xJlk
bm/Fm2NpIHcgcG9zdGFjaSB6d29sbmllbmlhIHogWlVTIGRvIDQ1MCB6xYIgbWllc2nEmWN6bmll
IG5hIHByYWNvd25pa2EuIAoKS2FydMSZIG1vxbxuYSBkb8WCYWRvd2HEhyBkb3dvbG7EhSBrd290
xIUsIGEgbmlld3lrb3J6eXN0YW5lIMWbcm9ka2kgbmllIHByemVwYWRhasSFLCBsZWN6IHByemVj
aG9kesSFIG5hIGtvbGVqbnkgbWllc2nEhWMuIAoKTW9nxJkgcHJ6ZWRzdGF3acSHIG9mZXJ0xJks
IGt0w7NyYSBwb3p3b2xpIHpvcHR5bWFsaXpvd2HEhyBrb3N6dHkgaSB6YXBld25pxIcgcHJhY293
bmlrb20gcG/FvMSFZGFueSBiZW5lZml0PwoKClBvemRyYXdpYW0KUmVuYXRhIE5vd2Fja2EKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
