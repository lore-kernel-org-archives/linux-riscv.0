Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C3E8FDDB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHGhbZQ93mlfCrtDTHF5z0gdIaXgpbtVAvxQxIPa0Rg=; b=b90Jityh7vNIGh
	Hxp/z8FPxBzailROFJRRHaayrgRJVDeN2pm7vvePc4F4lUhmQJACtaI7669BwEu6XW+FyGVu3Ofpk
	jcTezJt0qVV6KzqKKpzjY+YLvqtPGgFC6Rcrq5VBPiB+5zLIy8rwtiMsi1Y2viQAydYQ7Rrkhts+j
	TMCN1m8oMF6i8lx97iQRFEzkXaJ9FiF4JsrfqzwLsB+e0RjJO/naGyZE0neKv/I1x4NwqcbN46heI
	GEZf3xIJNTKp8p9hF+Rkdr6/VYjwU6fAumIx61+WGj1WEoM/u3KmNp5tsEm+t+BwJk+8vJm3yYBTz
	1S0wxMh4+1BqOJa3ZuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxkD-00GxQh-14;
	Wed, 04 Oct 2023 09:00:37 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwf4-00Ggjv-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 07:51:15 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id 62CAC1F730; Wed,  4 Oct 2023 09:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1696405872; bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=;
	h=Date:From:To:Subject:From;
	b=Z6x4APgOjg2rm0tLtRIRdjRRMydJhlZMQfx7KL+NxszdgVayF10lynytJY7zLQYUp
	 k+1gM8XZ2kAhnwcgqcnA7NxRKI8DGnkzNnbRyTnC0Kh1+iOJ/o5Fd+exIlMbUXNYU6
	 LU4JrggmXvwZcD8b/X+Ufd9Old2OJ3tUn5zu+qCA4qIfejqTHHTSlmKcIJbKEvY6zk
	 twylVew5UWOCjPwdH2Dh6s2Ag3NJ08Ng92ZigLMOJZuYamu6d18TSXQabaBRX1JlkP
	 9O3fOQ90t4CStCnpkuE8bjkTvZw6BQ/AwyplEaUDF1qKqRFQsyrefMCEXnVvLjNTlF
	 MYODyTo2ZIGcQ==
Received: by mail.citycodes.pl for <linux-riscv@lists.infradead.org>; Wed,  4 Oct 2023 07:50:33 GMT
Message-ID: <20231004084500-0.1.7v.j1wg.0.10jugpgflr@citycodes.pl>
Date: Wed,  4 Oct 2023 07:50:33 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Rozszerzenie_Programu_M=C3=B3j_Pr=C4=85d_5.0?=
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_005114_304893_96C6299A 
X-CRM114-Status: UNSURE (   0.86  )
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

U3phbm93bmkgUGHFhHN0d28hCgpXIHJhbWFjaCBub3dlaiBlZHljamkgcHJvZ3JhbXUgTcOzaiBQ
csSFZCBtb2fEhSBvdHJ6eW1hxIcgUGHFhHN0d28gZG9maW5hbnNvd2FuaWUgbmEgemFrdXAgaSBt
b250YcW8IGZvdG93b2x0YWlraSBpL2x1YiBtYWdhenludSBlbmVyZ2lpLiBNYWtzeW1hbG5hIGt3
b3RhIGRvZmluYW5zb3dhbmlhIHd5bm9zaSA1OCB0eXMuIHrFgi4gCgpKYWtvIGZpcm1hIHd5c3Bl
Y2phbGl6b3dhbmEgdyB0eW0gemFrcmVzaWUgemFqbWllbXkgc2nEmSBQYcWEc3R3YSB3bmlvc2tp
ZW0gbyBkb2ZpbmFuc293YW5pZSBvcmF6IGluc3RhbGFjasSFIGkgc2Vyd2lzZW0gZG9wYXNvd2Fu
eWNoIGRvIFBhxYRzdHdhIGJ1ZHlua3UgcGFuZWxpIHPFgm9uZWN6bnljaC4KCkLEmWTEmSB3ZHpp
xJljem55IHphIGluZm9ybWFjasSZIGN6eSBzxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmkuCgoK
UG96ZHJhd2lhbSwKS2FtaWwgTGFzZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
