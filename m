Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56979E64002
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXgVLhA0oMROmT+pa/KMp8Sn2mzXEZ2qXrwSgtRAWmw=; b=UkNhvM60AeF0J5
	1VYc/7kxAHCIGBJUdBqhFk172B6hFl973qoOT46tfTJpkhLRwH9gRcdla4Q0zRK7F7T++ak5TgEkL
	LfQJF7mgg5AO/yLgsBVTwmuVvREwqdpLvXxKJy5FoCjaF4IMRXngxyzWssHw9Wh2BUerMhRQDaX1D
	S8nWOuxIildoP+GlsxPQO0/978CklPgWAspyzilnqoqPXmSv8MHgfTnvYmMzC2Can6ukNFhNQxuIS
	lV2R113mLM1NFHzTNEi3UUPelGgxMu683INcE0tpnvUb6P5tZFXvNk3O5XN6p/LJliBue0LOUJg5y
	wjoTduEOgAGL30zYpjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9JXp-0000000464S-2Z0I;
	Sun, 05 Apr 2026 09:13:25 +0000
Received: from forward501b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d501])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9JXl-00000004647-3BWQ
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 09:13:24 +0000
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:1509:0:640:cfe8:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 49A0381342;
	Sun, 05 Apr 2026 12:13:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 9DbfAIXRNCg0-LaSCHR7t;
	Sun, 05 Apr 2026 12:13:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775380392; bh=w2X//IoEOR6e0ZYZu4GYJU+ETQCoH2FKZdJDFmmCuJo=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=tHi3N49wzJMOr4DL/AIDwTQYL03eqNuGNSG9IoxPmF6HmQMGSTJjfNlPFaAnD1tfk
	 bEunuyktWCNeDjaI31ME+eYkqFDbJx5vk2zA1ptvd9MTOOHVQwKN2g62uDfTQerNxF
	 Eic+5vaQkjaU3x+sIjIILGuJt+0eleK6CWm21w9w=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <8d04423ede3a284fb3122812810f2775345b9b38.camel@yandex.ru>
Subject: Re: [PATCH v9 0/6] lib and lib/cmdline enhancements
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, David Laight	
 <david.laight.linux@gmail.com>, Kees Cook <kees@kernel.org>, "Darrick J .
 Wong"	 <djwong@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor	
 <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-riscv@lists.infradead.org
Date: Sun, 05 Apr 2026 12:13:04 +0300
In-Reply-To: <20260403122549.f05ed0edb667899d25de1e31@linux-foundation.org>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
	 <20260403122549.f05ed0edb667899d25de1e31@linux-foundation.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_021322_323006_DAB720B6 
X-CRM114-Status: UNSURE (   6.43  )
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

On Fri, 2026-04-03 at 12:25 -0700, Andrew Morton wrote:

> AI review asked a few questions:
> https://sashiko.dev/#/patchset/20260403103338.1122415-1-dmantipov@yandex.ru

Hmm....is AI the only "person" interesting in what's going on here?

Is https://lists.infradead.org/pipermail/linux-riscv/2021-June/007376.html still true?

Are there any chances to see how it works under QEMU? AFAICS riscv64
defconfig boots just out-of-the-box with qemu-system-riscv64 -M virt,
but riscv32 shows nothing beyond SBI messages.

Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
