Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E7EC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 18:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzgbTJA1/vqzy78HdsvQtjP2cS5W1lQfDUoIUcpeIrQ=; b=XllKyD2RYubwAR
	kHaQi8e2Ynj88IEc9egV02TifI03MxgV1GaQDaOd0lYVruDdugmZN2lQQeNF3MWDCcEPz+LKcgK3/
	4dV6dXGM4NiwGcIvpCYgCs4RI5Jndz8O0SOB/YdXZgUEt9agnSL/HFccYhY7fPwd+h22iPLvbyAn+
	5dp7rjx2fWO2cEW9FkrCfZb9BLAKqTqt15cjgFh3zreS2PhufAV1JA0VBurfDHIGJOshs1w3DQj6o
	NIQZh3I6HVHfu4O4kQm8H0y4bowjr44OBjHXCga/LDIogt2hkDwFW3qkpzZbYb6+wI3dbtss8x0ig
	2GhnQepd0LXCs/yMSXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtZeF-000ecm-KG; Sat, 04 Dec 2021 18:20:35 +0000
Received: from smtprelay0124.hostedemail.com ([216.40.44.124]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtZeC-000ecQ-LC
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 18:20:34 +0000
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 2F8DC837F24C;
 Sat,  4 Dec 2021 18:20:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf12.hostedemail.com (Postfix) with ESMTPA id 8CB391C; 
 Sat,  4 Dec 2021 18:20:25 +0000 (UTC)
Message-ID: <429227f33cf14aee6f0668a3d98aa220b54383d6.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Sort entries using parse-maintainers.pl
From: Joe Perches <joe@perches.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, 
 linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Date: Sat, 04 Dec 2021 10:20:24 -0800
In-Reply-To: <20211204175255.1361385-1-j.neuschaefer@gmx.net>
References: <20211204175255.1361385-1-j.neuschaefer@gmx.net>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: foo3f1u3hgn5jmzzcthbws61qao1rhua
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8CB391C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/cyDD7NO8kshW4/mXLo5/vMS1r9aOWN88=
X-HE-Tag: 1638642025-813990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_102032_800277_75C13A6A 
X-CRM114-Status: UNSURE (   7.24  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2021-12-04 at 18:52 +0100, Jonathan Neusch=E4fer wrote:
> The MAINTAINERS file got slightly out of order again, making it
> difficult to put new entries at the right (alphabetical) position.
> =

> Run parse-maintainers.pl to restore the alphabetical order.
[]
> Checkpatch warns about a few unordered "F:" lines within sections, but I
> left those alone because I wanted this patch to be as automated as possib=
le.

The --order option does that.

$ ./scripts/parse-maintainers.pl --order --output MAINTAINERS



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
