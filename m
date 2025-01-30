Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E583EC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RpTtpLUx7kpVFk46OHbpIPznqbY2elOMsADYDO+dXVM=; b=FV5wIhXDJ4rJX9
	t2CmgYCCqFp0eOwMSC0i7n0PsMymUtaXhJat6MYncgAhAoqseOTBf69eY6QfY4uQtMRfvhREb8yZ8
	TFfhdNT3vIw0bNUqwMhxlcRWciDDRymGzIVBZimNsgIoiaXOkIsh71XGHoc6ovE2fmFPQLxeQAaSS
	XnHRDCjZJ8ZFCivgMCYCxznNZyW+bH6j/uX7WCsvHang2TROyGh/pQQqe7TjHMCxzxGcTit099kBX
	MnNnTYKLCnogbE0xnWQPLEff5yg33l2OxzSEJ7IV+XjN3pA46THKFpwqvYIZCqiq5/9FEubcsiHnt
	viu+8BbHe+zthx2EtvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQFd-00000008S2m-43AA;
	Thu, 30 Jan 2025 08:50:17 +0000
Received: from mail.cybercitadel.pl ([57.128.173.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQFb-00000008S1m-1zLV
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 08:50:16 +0000
Received: by mail.CyberCitadel.pl (Postfix, from userid 1002)
	id 11F114AB53; Thu, 30 Jan 2025 09:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=CyberCitadel.pl;
	s=mail; t=1738226547;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=;
	h=Date:From:To:Subject:From;
	b=agC/tS/bOnWyV7TTyuCZWhTdPFjrz8P0ANDhF2f4VpgtsOVymNJhsl6Zbv1+mIPP/
	 U/CwVBWmNcipRT9W4+z6Fm8h+FcOGnVlNE3jI6q5gilFM4ldrJU3RgEVYb+Is6Om05
	 fV6LC/SFkU2ntx9IYe+ylNzbcwgCtVSyQF4NKm5XiwYl8nwL4HLUDcOV7GCOf8XO5w
	 yKrdPUDUz9lxzqYU7mZGM0TeJJmew6oYJOUmvhgsECMeptW9rX52ONfDPc3YFFHMpv
	 vwOr9rnPdaON0ed50y3MVY3kBfKrKIiLYUhNjEdveYLhyNaF+3Cw6La+oZm+/Lu4Nm
	 C+2sZia4PBGLQ==
Received: by mail.CyberCitadel.pl for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 08:40:22 GMT
Message-ID: <20250130084500-0.1.d8.2db2r.0.n9l634lem2@CyberCitadel.pl>
Date: Thu, 30 Jan 2025 08:40:22 GMT
From: "Marek Kucharski" <marek.kucharski@cybercitadel.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_005015_653406_592F6715 
X-CRM114-Status: UNSURE (   1.24  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYXJlayBLdWNoYXJza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
