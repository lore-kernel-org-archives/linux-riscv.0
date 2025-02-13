Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B00C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9v0kmJhoNivuzy5oz0ZtAumI5B63Pk7daDudNiKfOIo=; b=y9Gocikqxed2m3
	H69DpkU4oyc8tqBg2YFDoyA35GpymWTfho2D7QPcQkn0ecrPu1oaMWmKZq51qKJ6WSQdUcFn1yrbz
	izITRwoaF7Gn4L2IQU2+vREWl09jbWvpz87MZszKrqeQ59bm7C/g+6NHn9mZFekp4mR/W46zl7nZe
	Kc08iDKZI+3rpAp1uAkF2o9JHU34+bOtJXLS8LH0FTBTE+x+2vUAHoWaA+mOVWounYFlZVSDjdrYF
	11W06goMcX1GXUQIOF40GAahxccn0YVetaCrh+geJFReaiEELLsUvNZswbAoGM/g5sh/3A5obc4gX
	DNUbiTmAFmfAO/i0W4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUsH-0000000AK72-1CxD;
	Thu, 13 Feb 2025 08:47:09 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUmj-0000000AJLu-1ity
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 08:41:26 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 013E6A3ACC; Thu, 13 Feb 2025 09:41:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1739436084; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=bmfZmM9Fi9SBx29H/s4MVt9nyY5X5Wp+TQalGSC+nJb00uzPlkZ4QS2j/kSmp24S+
	 ihTU2NbMJupqENXi1wWjm+HxTbE2vSQsILy2rmbBBqYGHrSH130LaibHmHUFWqRcKO
	 CvehmHJj8a/4Vdir3cD0jAs1FJELcYakZCec25ydbW2DZjzl/gVz24/UwgA4v0B9mp
	 7vptzBw96k+SdY6EYwRBKJReWA6lrGiQ+iQSIsIzU/tfQBXoMqtyTKZba5ahp7Lao8
	 Vn6jBo7iPm19XWQc8U4m0b/TndjHF9kaI0zAmZAi/Q4oOC38v1S3xNhvrVoLKoY5or
	 DIK2R/KM+SO5g==
Received: by mail.novaplan.pl for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 08:41:00 GMT
Message-ID: <20250213084500-0.1.ju.18nkv.0.o90i2f2ldi@novaplan.pl>
Date: Thu, 13 Feb 2025 08:41:00 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_004125_608894_9B93DF3C 
X-CRM114-Status: UNSURE (   0.57  )
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
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
