Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F337BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUAXxqHcuDUL9Yma5WbzErWfW6zcO4ImCg7kq8yetpQ=; b=On4KziaV1YREXs
	0OBK1VMA7oYq6s0PSAJ4AvEeIxRfBu3aAg4iHgW8V8RHtGX3hssH08imQiEsggPvYxfyO/HMBdQla
	1EnjH+tqXISZkvAJONRRfhGYDKL8oVnW1MHnFUAg0HX90cRoMbwj2/hRIzZ/PGaBed82MwfiW5X9T
	/HPz9xVAqCSCe4/G6s9Dp1Upq7JkC8TnWAinU0yBhbnNy1XgiSLiIcjHDuR1DfeERV3sycQS4dgjb
	+VAA9z/Ffnhc6+GpqkFfJqFSNEsaqZARF67Ors49SE5FqmPChT8Y1nnL20BsmxtOuYM0cPRVPkyIu
	xl2lzUEPXCuG8hfvM5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSCD-00DnH0-Nk; Thu, 05 May 2022 03:30:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSCA-00DnGL-EN
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:30:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E065B82B1F
 for <linux-riscv@lists.infradead.org>; Thu,  5 May 2022 03:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC318C385AC
 for <linux-riscv@lists.infradead.org>; Thu,  5 May 2022 03:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651721423;
 bh=vOH0kAdmR1eNZn7dq7qeSAVj/s+a8/0GdFuCXLUW/CU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g+9CtdtO3/zzV1+bZ2QmOejc7pc6dzZz5V0iTRIcx1bdlYXlMHrs9nQqg10r/BeYs
 +PmvWnmGptI78zUdjkwjx425vxkvJixLXLplrhuBg86OnLbNCrvh/M64SOvKglEE7s
 0EjNWcc7pr28auxz3kD64IaTwkSpy2qGJiCIvsSSsgdLp6NiCzjf1gNecbuBIFY5tR
 OM5TFGUGGcWe4m9ktlTyOKeRL1GmMjEVGuX31mfWrJbyYnZVyp1slkTqDDEDsRonTS
 p54NUkVH61i1VhOaYPi3pWgpqZoPBA/yCGJdCl1YnaYAHSCWgzgfOKzyePzU9CTlQA
 ur4WWGWOtmk9w==
Received: by mail-ua1-f51.google.com with SMTP id x21so1214004uan.13
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 20:30:22 -0700 (PDT)
X-Gm-Message-State: AOAM5305gqzhMeNSzLg4WuEOEzrUQstt9gTmXEMjLEyMOmQPG6p7vLnp
 IiPJ4cL7yEDbX7Cj0rl6FzrnwwsUPsMjFK/jlSs=
X-Google-Smtp-Source: ABdhPJzbU/iPzb/jLBOfTd8HLatPunLFi+iu4xyj0d3kkgDuJ1vstUU5IUyh/crnvfi60C0KDYx5aW4fbp9tD6SDpKg=
X-Received: by 2002:ab0:2a87:0:b0:362:9cdb:8b64 with SMTP id
 h7-20020ab02a87000000b003629cdb8b64mr7496584uar.83.1651721421926; Wed, 04 May
 2022 20:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-2-palmer@rivosinc.com>
 <2180881.iZASKD2KPV@diego>
In-Reply-To: <2180881.iZASKD2KPV@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 May 2022 11:30:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSjwu3-SLfXAh=UrqSq28mq_7nxbFNQ9j9kqY32EiXcJw@mail.gmail.com>
Message-ID: <CAJF2gTSjwu3-SLfXAh=UrqSq28mq_7nxbFNQ9j9kqY32EiXcJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, macro@orcam.me.uk, jszhang@kernel.org, 
 linux-csky@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 linux-arch <linux-arch@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_203026_788905_2370B732 
X-CRM114-Status: GOOD (  15.71  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBNYXkgNCwg
MjAyMiBhdCA3OjU3IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+
Cj4gQW0gU2Ftc3RhZywgMzAuIEFwcmlsIDIwMjIsIDE3OjM2OjIwIENFU1Qgc2NocmllYiBQYWxt
ZXIgRGFiYmVsdDoKPiA+IEZyb206IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9y
Zz4KPiA+Cj4gPiBUaGlzIGlzIGEgc2ltcGxlLCBmYWlyIHNwaW5sb2NrLiAgU3BlY2lmaWNhbGx5
IGl0IGRvZXNuJ3QgaGF2ZSBhbGwgdGhlCj4gPiBzdWJ0bGUgbWVtb3J5IG1vZGVsIGRlcGVuZGVu
Y2llcyB0aGF0IHFzcGlubG9jayBoYXMsIHdoaWNoIG1ha2VzIGl0IG1vcmUKPiA+IHN1aXRhYmxl
IGZvciBzaW1wbGUgc3lzdGVtcyBhcyBpdCBpcyBtb3JlIGxpa2VseSB0byBiZSBjb3JyZWN0LiAg
SXQgaXMKPiA+IGltcGxlbWVudGVkIGVudGlyZWx5IGluIHRlcm1zIG9mIHN0YW5kYXJkIGF0b21p
Y3MgYW5kIHRodXMgd29ya3MgZmluZQo+ID4gd2l0aG91dCBhbnkgYXJjaC1zcGVjaWZpYyBjb2Rl
Lgo+ID4KPiA+IFRoaXMgcmVwbGFjZXMgdGhlIGV4aXN0aW5nIGFzbS1nZW5lcmljL3NwaW5sb2Nr
LmgsIHdoaWNoIGp1c3QgZXJyb3JlZAo+ID4gb3V0IG9uIFNNUCBzeXN0ZW1zLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQub3Jn
Pgo+ID4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+
Cj4KPiBvbiByaXNjdjY0K3Jpc2N2MzIgcWVtdSwgYmVhZ2xldiBhbmQgZDEtbmV6aGEKPgo+IFRl
c3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+CgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
