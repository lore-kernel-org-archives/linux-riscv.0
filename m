Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE5C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 18:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGiovc/nwY5zJgXSTAY7otMb9lhBBvq05qXHb4DBPgo=; b=WM6A4QgJCyAInE
	BIOpxfDfoEyD41UcvWctrlDgeYtaOSXj6aiBHhmXZaQk5Q9TAVJgXZQk96YpAL9eKryeWED+ghl+U
	k96dEnbI53/wdC+YUl0nnU+Me0nVTZ6RjuNxUJLz1lP02lJDQGI9rRNgXSx4VX/0Su5zLC1O4LKXt
	3sFpf9bqYkYfD/XfS0BQ8/un4Uo9TP2fZUxfR+7y/qs/sTvoCDOMicgOQVirPiYbbrKtynemmDQ4d
	O47e5fV/jHm4WziWdcz9+VOXsv10YUPkZuXXqqQltBRZpjvJm74d/8TS1Krgw6mLsrqWYNWVA6N/m
	qQdL0yHCAdvUDywbldcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6Yb-00000008MOr-1Rbm;
	Wed, 16 Jul 2025 18:08:41 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6YY-00000008MOB-29nE;
	Wed, 16 Jul 2025 18:08:39 +0000
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 56GI4wZF1640497
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 16 Jul 2025 11:05:02 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 56GI4wZF1640497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025062101; t=1752689107;
	bh=AxYk3hb0otPOpe8iCoKRDXyzipO8+IEj3pxhrwFiias=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PdYs1CW7P6NGZ7nqrSTKiw9kGz8+zKtbJLnnYWGn7EmE85IhMRHjUsfqejqSu3NpC
	 F8mkqPxV94oRfsry8xLqbBh6TIeqEphXrM8IQVQXG98VV0VtmaqRkm8gcHZ1DS8I+Y
	 9Ud40lsWpWvI8f/Mw4fJttPFSqVPnBxm60MpDadKClPpxIliIxgGgmXKbtvKQmNI4w
	 9zRbpJ/rGGTy9XhzMH+JGYmHR8cviSmLp4ZAluTl43LX0HJw1hILVpbbrTd8F7h/pQ
	 VEaChnOfID89c6bfwtXUBb4UKngfABWVJFjrAYzLGKal7C5mVferZwFoGX1uSfry52
	 xqWYa7EnyTKlQ==
Date: Wed, 16 Jul 2025 11:04:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/1=5D_uapi/termios=3A_remov?=
 =?US-ASCII?Q?e_struct_ktermios_from_uapi_headers?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aHfn9z9_oIVgNGgx@shell.armlinux.org.uk>
References: <20250716164735.170713-1-hpa@zytor.com> <aHfn9z9_oIVgNGgx@shell.armlinux.org.uk>
Message-ID: <9AEAF0BE-39D7-4617-9CB5-D0703B3E6DF8@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_110838_552638_008E7522 
X-CRM114-Status: GOOD (  10.18  )
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

T24gSnVseSAxNiwgMjAyNSAxMDo1NzoxMSBBTSBQRFQsICJSdXNzZWxsIEtpbmcgKE9yYWNsZSki
IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQg
MDk6NDc6MzJBTSAtMDcwMCwgSC4gUGV0ZXIgQW52aW4gd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9pbmNsdWRlL2FzbS9rdGVybWlvcy5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20va3Rl
cm1pb3MuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjQz
MjA5MjFhODJhOQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2t0ZXJtaW9zLmgKPj4gQEAgLTAsMCArMSBAQAo+PiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL2t0
ZXJtaW9zLmg+Cj4KPklzbid0IHRoaXMgd2hhdCBhcmNoL2FybS9pbmNsdWRlL2FzbS9LYnVpbGQn
cyBnZW5lcmljLXkgaXMgZm9yPwo+Cj5EaXR0byBmb3Igb3RoZXIgYXJjaGVzLgo+CgpBaCwgeWVz
LCB5b3UncmUgcmlnaHQgKGV4Y2VwdCBmb3IgdGhvc2Ugd2l0aCBub250cml2aWFsIHN0dWJzLikK
CkkgYWxzbyBmb3VuZCB0aGF0IGEgaGFuZGZ1bCBvZiBkcml2ZXJzIGFuZCBhcmNoL3NwYXJjIG5l
ZWRzIDxhc20vdGVybWlvcy5oPiDihpIgPGxpbnV4L3Rlcm1pb3MuaD4gaW4gPGxpbnV4L3Rlcm1p
b3NfaW50ZXJuYWwuaD4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
