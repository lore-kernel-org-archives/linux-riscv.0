Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504D8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 00:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B69960E05
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 00:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B69960E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeKgOe06VKK9uTXPMOtIp8Q6zJmjRZszCZ3p/ipcuu8=; b=uhlN9Mm5h31ovwA9xfDl9zKiyB
	UcqFQ0R8mRCFsZr6vESH6oFBdBJj87b9KdfDkMGsbn2uWJehubxdxDyHoke3AYyi9AFKkmuLmLSs0
	TganOFyEIIkkxAzUUTpLfGeeqinV1CIjqp2R5lm+IIWG2IKfNcnVyHLXBGwQVXzPcWAAYbg3nygFw
	kU84GOGIZPpunPzkw2RbOE/pb4OjFE5CV907hFnwTYEMQQN0HnBb/eIN/uKa/I54sNeZPx61TeksB
	gK5tquOJO5t5JsGaQxsuzn4phHRB24cnk9vwwIwXhXbLFf7jqbTpk0whCCz0PFWUa31Pi6ETZrglx
	5x3cGqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV0up-0050Tk-1a; Tue, 28 Sep 2021 00:24:11 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV0ul-0050RJ-Pv
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 00:24:09 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18S0NkSg077349
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 03:23:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632788621; x=1635380621;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H4H4eHZ/VB5yQHB7IzcqAr0zdp0RwBZizZ+dsLp428E=;
 b=sNfQG71BU+m15ZBqpIM20Jl0Adajon9dQxJtOmnZNBc/pj49T1vSXigQGzlxXnK+
 6dhAR78y55ml3vSJA9jXWRRlkn5ihVg+cWnaleeLXETlDLh89P4wJAnAROQN2feL
 BNwxcZ7rjSNV8Lls2mmLxXk0h7fCOOh3nKJVSquCuGhJwRNXcbKk+6HrUNYxiw71
 lbAUj5UzMvMhkugELcfTVRPBBuUCCR1AOHlzuFEzJdw2l7nptigs2esUy22FKwIV
 +zVs+/TxmAbx0+NU6CuQm6Ti9AfSXtBLkkVLCJz+XPa3jBkRg+32N5VpZZfAP9lL
 nsleE/GIT3o24n+554MhOQ==;
X-AuditID: 8b5b014d-b84f570000005d46-96-6152608d7b89
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 92.5D.23878.D8062516; Tue, 28 Sep 2021 03:23:41 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 03:23:37 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Greg Favor <gfavor@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Guo Ren <guoren@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, Atish Patra
 <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, Christoph
 Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>, wefu@redhat.com,
 =?UTF-8?Q?Wei_Wu_=28=E5=90=B4=E4=BC=9F=29?= <lazyparser@gmail.com>, Drew
 Fustini <drew@beagleboard.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, Jonathan
 Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman
 <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, Allen Baum
 <allen.baum@esperantotech.com>, Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
Organization: FORTH
In-Reply-To: <CA+Qh7T=kud8AM-6JjuWNwJY0r_gkmnP6SmzVXqeE2VYxViLUoQ@mail.gmail.com>
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <CA+Qh7T=kud8AM-6JjuWNwJY0r_gkmnP6SmzVXqeE2VYxViLUoQ@mail.gmail.com>
Message-ID: <ce3bb9f5c72f0feb1cf9a0d67edaedf6@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsXSHT1dWbc3ISjRYF6DvsWTQ+1sFtMOHGK3
 aJ2wm8XiyYeJbBZ/Jx1jt1i04juLRcc5N4slO6Ut9rzaw25xobmH0eLeimXsFrv757BYbD//
 nc3ixd5GFovjj3axWKxcfZTJ4kLjTXaLy6vnM1k8P3WMzeLSl2ssFpd3zWGz2Pa5hc1i5bpj
 zBYzfvxjtGh+d47d4uXlHmaLrRvXMVp0r6y2OLnhAKPFmqVTGS1a9k9hsfh56DyTxcLX89gd
 FD1etT1j8vj9axKjx7WOjSwe734vY/RY0/mayWNWQy+bx51z59k8Njxazerx5uVLFo//h1ay
 eOycdZfdY8GmUo+WI29ZPR5uusTksWlVJ5vHzoeWAZJRXDYpqTmZZalF+nYJXBkz33QwF1zl
 qGjeNo2lgfEbWxcjJ4eEgInE0u7HrF2MXBxCAkcZJebv/8AEkTCVmL23kxHE5hUQlDg58wkL
 iM0sYCEx9cp+RghbXqJ562xmEJtFQFVi5a4dYDabgKbE/EsHwepFBDQkTn7bxw6ygFlgF6fE
 lcONYI6EwEQmiV9XpoJNEhawk1g+byvYZn4BYYlPdy8CncTBwSkQKHFtcxrEdb1MEr9bn7BB
 XOQisendZFaIS1UkPvx+wA5SLwpkb56rNIFRaBaSu2chuXsWkrsXMDKvYhRILDPWy0wu1kvL
 LyrJ0Esv2sQITjuMvjsYb29+q3eIkYmD8RCjBAezkghvMIt/ohBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXFeXr0J8UIC6YklqdmpqQWpRTBZJg5OqQamJWsNI8MrhTznWWta7u5dcyNoY7Rdxcpn
 Jk5VN39zWctHPm/MNTvw/5zDrcurjhhHKZh/vSl45NiD+2c6ZFP4V8Uf2+9vm/2Z1UjawmRP
 9M9bf9w1tMMiVxWpr7/0pfqjAovWtYXPVCJXzto4N2th9BWBlTnX455n3M07kn6+abuCe1nV
 PldWrrMzmNbcbRGI/rRfMHT3fb6aFS7iHCelOrfdP9/F7cjO/dapeOWB2b7p03nYLJ52C70p
 1Egx/3ckZlG1GmO293Nh8dPp92e3Hj8m/OqTWd6EC3LSNhc04758rfxX+mv6xJf3g+ZqHNgo
 97e5fH9A9PVX1pECQuH/z1/ftrejJGl65u7Vrzt5lFiKMxINtZiLihMBau+qEaoDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_172408_250547_3398CD71 
X-CRM114-Status: GOOD (  10.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gR3JlZywKCs6jz4TOuc+CIDIwMjEtMDktMjcgMjM6NTMsIEdyZWcgRmF2b3Igzq3Os8+B
zrHPiM61Ogo+IFdpdGggdGhlIGJpZyBjYXZlYXQgdGhhdCBJIGhhdmVuJ3QgYmVlbiBpbiB0aGUg
bWlkZGxlIG9mIHRoaXMgCj4gZGlzY3Vzc2lvbiwgaXQgc2VlbXMgbGlrZSBBbGx3aW5uZXIgRDEn
cyBjaGFuZ2VzIHJlcHJlc2VudCBhIGN1c3RvbSAKPiAoYW5kIG5vbmNvbmZvcm1pbmcpIGV4dGVu
c2lvbi4gIElzbid0IHRoaXMganVzdCBhIG1hdHRlciBvZiB0aGUgcGF0Y2ggCj4gbmVlZGluZyB0
byBiZSB0cmVhdGVkIGFzIGZvciBhIFJJU0MtViBjdXN0b20gZXh0ZW5zaW9uIHBlciB0aGUgcmVj
ZW50bHkgCj4gY2xhcmlmaWVkIHBvbGljeSBmb3IgaGFuZGxpbmcgdXBzdHJlYW1pbmcvZXRjLiBv
ZiBjdXN0b20gZXh0ZW5zaW9ucz8gIAo+IChQaGlsaXBwIGNhbiBzcGVhayB0byB0aGlzIGNsYXJp
ZmllZCBwb2xpY3kuKSAgT3Igd2hhdCBhbSBJIG1pc3Npbmc/Cj4gCgpUaGUgUHJpdi4gU3BlYy4g
ZGVmaW5lcyBzdjM5LzQ4IHdpdGhvdXQgYWxsb3dpbmcgY3VzdG9tIHVzZSBvZiByZXNlcnZlZCAK
cHRlIGJpdHMgYnkgaW1wbGVtZW50YXRpb25zLCBBbGx3aW5uZXIgRDEgY2xhaW1zIHRvIGJlIHN2
MzkgYnV0IGl0IGRvZXMgCnVzZSByZXNlcnZlZCBQVEUgYml0cy4gV2hlbiB2ZW5kb3JzIHdhbnQg
dG8gZG8gY3VzdG9tIHN0dWZmIG9uIFBURXMsIHRoZSAKc3RhbmRhcmQgc2F5cyB0aGV5IG1heSB1
c2UgdmFsdWVzIDE0LTE1IG9uIHNhdHAubW9kZSBmb3IgdGhhdCBhbmQgZGVmaW5lIAp0aGVpciBv
d24gTU1VIGJhc2ljYWxseS4gTWVzc2luZyB1cCB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBz
djM5IGlzIApub3QgYW4gZXh0ZW5zaW9uLCBpcyB2aW9sYXRpb24gb2Ygc3YzOS4gRXZlbiB3b3Jz
ZSB0aGlzIGltcGxlbWVudGF0aW9uIApjYW4ndCB3b3JrIGlmIHdlIGlnbm9yZSB0aGUgY3VzdG9t
aXphdGlvbiBzaW5jZSB3aXRob3V0IHNldHRpbmcgdGhlIApyZXF1aXJlZCBiaXRzIG9uIFBURXMg
ZG1hIChhbmQgSSBiZWxpZXZlIFNNUCBhcyB3ZWxsKSBkb2Vzbid0IHdvcmsuCgpSZWdhcmRzLApO
aWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
