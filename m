Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F4CCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 03:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roXshTPj4fDbsE6MNToshOx0JWOwQ88Vv7znghK5wV8=; b=ywHKlafvagAWS6
	3Q/lkXImdAN+jCqd2Voy8njloz0GSIw3DHIm8GzXR6V8hYPgIUnWZGjSt/s4Z7kBqzy8bKvBSA4wS
	Ro6hcztzwltACJjAbuO4Puk6v1GqUg7pCfueG12npMgbNbIFP0EH7LvCdq5jlNZ06K8xLC99cri+o
	bNuOl8Q2sKwJZS9wDZF8G7jmadYDRGE6Z3v8hDsQ0rNeYrv92TZPdN617sHS6GLVnQRJs4ZYydhn9
	cXlDF6O8NOu22/p24vsLtjtiC2q6glJCoQN8yeLvSFWjiQiLNLk0YaMD6eOJSGj5mKhUKz5ogHJX+
	BZF8PapfZ8+tuAWxHLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73e8-00000007YBO-2uYO;
	Fri, 10 Oct 2025 03:18:20 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v73e6-00000007YAq-232G
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 03:18:19 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-780fe73e337so13736367b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 20:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760066297; x=1760671097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
        b=Spr5/3J3VbF8CacjJAo/CAgkR43pCUXEWCCMzsbqrXJL+oekLCyIETpLuPxGhf2L5F
         j/vV/5yzwQSLfevSsD2YujPt1Vf6j1sZ6iidxx0aNYetML7HeYGwD2US0ZhFxmjgzQtJ
         ZqsuTjt7l0GBRY6SuxH6TZ/h+bMjX8Y5z/qavypqSNQ/FKz2KzAsujiLKiFq8ULAAiR3
         n2Y38WUQ8KI+FL7n0SsYg5UiSMX3rVSM1XvBVvd8Luz0ceCwlYisk/EY6omGGJ/LGKwY
         /5LAPuDw7LaK9d9oXFlvuVrwvcjuZ5MM83oWqX4bpW4xVtaiP6FzNq5xWyPxsrOmTFyY
         3mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760066297; x=1760671097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
        b=MyBVNC7qBHXoRaAXyXmHVpVNAuO4KdgTsBHspnDZikQ8dTxxIyvvRv+Z7c6OXIbg+u
         XA2F1cFbUKIF/Ob54dU6Fm75EJpWtnGB9wqNvn2U9tSu+D1XbT1KdEvyVxGW/FWqG5Vn
         aRBOK+oSbgrj5ARNwTQcp1AMogi1Pp667DLeYOEyiXO/f7PtlmV4gdcpjIJqMs+mE+xw
         BsWcyaC1iYhAxjM+IJeCmJ1P1yKWmsvqhvXRImPMIZH3FTVghc39vFQB5HAKk580IL/E
         oMvUiO3D3L9ufW3ggvg5/DsoZlvoySFGuqkst3jDUaAYSt5DS7QhgTTV8b/6iw6WKfoa
         48FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHK8ikmX58cPgd68JTf1qm6oCT7aGiqrBpn/G2C/gSdReZtdI/Gd5BcNWKcV05W9Za/afLqyV7ILe3Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/6DPLwcMfbgLJo2xcY5KtvUkB+eT3Jeaz6JwCk92JKPD+jPX3
	ztAfSyt1YYqPI17AcDi4fl+Du4nuV8rAl16sWuAmANqZGwpQA78IKlFb0Wsw/176//BAExmYoYF
	o2pKGjWuCYg7lT6NDJKGSdaQX15VQpy4=
X-Gm-Gg: ASbGncsYEfXW2/9EIAtSrp57ifoyNVWWNoQE6OnkdhyXoFqrowuBm0F3ZoUERg/Oeji
	37LUoAwRWF3nFXG4DfrCPJIS5i/C8R0qyADmzoPrlRZv+XOeaa1+N5uHNnCEChVGHxHdc/zl1It
	hqPqVNkfXN6U2ArN40ET4egJIaD/OcGJZNgRaC6Cmo0DDDPWr4I+WfenSsPI4EVo8ajRUegEN4d
	nTDDxcllXKLadLaJMzWXyoi7g==
X-Google-Smtp-Source: AGHT+IFTQdXvlZxDoBIwCyChBgf2ijvKjPOXu3xyloDy3VewP6H31eXx2tdJ5Y2sZs04pWqa6kN09Zh4TAMeP3pYKTk=
X-Received: by 2002:a05:690e:1587:10b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63ce90cac96mr2654086d50.44.1760066297220; Thu, 09 Oct 2025
 20:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-3-safinaskar@gmail.com>
 <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
In-Reply-To: <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 06:17:41 +0300
X-Gm-Features: AS18NWCm5nh3vfq5EIpD-J_OKHQvi_8uVbgLjcXTz6TnQl9pdn9vqNDRLNkppRk
Message-ID: <CAPnZJGC9avy1s=xFS5Tg6obS+RB3zw4yWsUBw9g=Vt09S6j88w@mail.gmail.com>
Subject: Re: [PATCH RESEND 02/62] init: remove deprecated "prompt_ramdisk"
 command line parameter, which does nothing
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_201818_532103_34416BE9 
X-CRM114-Status: UNSURE (   9.39  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMjoxNuKAr1BNIENocmlzdG9waGUgTGVyb3kKPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4gU3F1YXNoIHBhdGNoIDEgYW5kIHBhdGNo
IDIgdG9nZXRoZXIgYW5kIHNheSB0aGlzIGlzIGNsZWFudXAgb2YgdHdvCj4gb3B0aW9ucyBkZXBy
ZWNhdGVkIGJ5IGNvbW1pdCBjODM3Njk5NGM4NmMgKCJpbml0cmQ6IHJlbW92ZSBzdXBwb3J0IGZv
cgo+IG11bHRpcGxlIGZsb3BwaWVzIikgd2l0aCB0aGUgZG9jdW1lbnRhdGlvbiBieSBjb21taXQg
NmI5OWU2ZTZhYTYyCj4gKCJEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlOiBibG9ja2Rldi9yYW1k
aXNrOiByZW1vdmUgdXNlIG9mICJyZGV2IiIpCgpXaWxsIGRvIGluIHYyLgoKLS0gCkFza2FyIFNh
ZmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
