Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEF0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 01:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A19F60F11
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 01:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A19F60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hle3xfenNpWghjfhcBDJhftHoPsrjX+16PtoJ5qMXk8=; b=1MRWQfvhB2BGOU6vCRIxVmOazp
	eTsw+uX3Hn0f8loknlkt06uvrmXS/vtd4ar5vhqgee3cXyviSiwdCWQBPjlpENzzBFk08r8g8hasj
	VzxxVtbrV2XoE5Sgrr02Gj0IRx4BtNOITgQtEP0AhmE8BsWpj/mzAtjzj2ZjcCg5aaSXpYGy39wjE
	y25DvYsFKufWbjezcjhX9MReaDncnR66QW9eJW5a5W8AISxzhjfV2xmXMGMYD/I1fbFpCjuRrX/Qi
	lr2TwH9ISAta+s6K8194WaZ8Zc7MJpIQO1IOpDaZCMNYrZW5kJ4G+yoXNjz4Ax+7c6YNC5dL8xki2
	/oLGvJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV1Vk-0053uI-66; Tue, 28 Sep 2021 01:02:20 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV1Vh-0053ti-F2
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 01:02:19 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18S12EoD078409
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 04:02:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632790929; x=1635382929;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aKI1g1YuFemJMSGp7WOPcbguj+DMCSUHf8jtNniFvYo=;
 b=bYOLrvo7NDJSeYEzeFjiqW45kRxxpYicGEeEyMfIx3Z5pLn1w4A57slB8nBCOU2I
 i6Ax5sztnM3PDQrg5Ildu3LumNOlz/drBXX7uvk0+l8M3FX7vw2YHvzyXtakaoHk
 o6B9ip/JFXF984RXGjHCU9mNuyt9ibwlO1LqGVzGFEcLcqxoP390ZoZFkUrNTa51
 Ov3qfzVCvkPL6aCEnw0rlTcEdQDiDnCKfe+q2RbNgqlBtzJkA5xmWp6GhedMGJqR
 SzgfaJvB/rpVfgW8io9cqILdRX6Fh0V7dBn8dcoPp6Ezi+wpjt8GLqgeqfFJVyN8
 TOQYCDnavU0nPk0SrJ/4EQ==;
X-AuditID: 8b5b014d-b84f570000005d46-95-61526991456f
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 CB.8D.23878.19962516; Tue, 28 Sep 2021 04:02:09 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 04:02:06 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <atishp@atishpatra.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Anup
 Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, Palmer
 Dabbelt <palmerdabbelt@google.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@vrull.eu>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?Q?Wei_Wu_=28=E5=90=B4=E4=BC=9F=29?=
 <lazyparser@gmail.com>, Drew Fustini <drew@beagleboard.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>,
 Greg Favor <gfavor@ventanamicro.com>, Andrea Mondelli
 <andrea.mondelli@huawei.com>, Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu
 <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, Nick Kossifidis
 <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>, Josh Scheid
 <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
Organization: FORTH
In-Reply-To: <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
Message-ID: <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42Lpjp6urDsxMyjRYPJUVYsnh9rZLKYdOMRu
 0TphN4vFkw8T2Sz+TjrGbrFoxXcWi45zbhZLdkpb7Hm1h93iQnMPo8W9FcvYLXb3z2Gx2H7+
 O5vFi72NLBbHH+1isVi5+iiTxYXGm+wWl1fPZ7J4fuoYm8WlL9dYLC7vmsNmse1zC5vFynXH
 mC1m/PjHaNH87hy7xcvLPcwWWzeuY7ToXlltcXLDAUaLNUunMlq07J/CYvHz0Hkmi4Wv57E7
 KHq8anvG5PH71yRGj2sdG1k83v1exuixpvM1k8eshl42jzvnzrN5bHi0mtXjzcuXLB7/D61k
 8dg56y67x4JNpR4tR96yejzcdInJY9OqTjaPnQ8tAySjuGxSUnMyy1KL9O0SuDJ2vnrEXNDP
 X9Fwpp2lgbGZp4uRk0NCwETiU/MGpi5GLg4hgaOMEovmzWaHSJhKzN7byQhi8woISpyc+YQF
 xGYWsJCYemU/I4QtL9G8dTYziM0ioCoxZd4NsBo2AU2J+ZcOgtkiAuoS17f8BFvALHCGW6Ln
 xQQ2kISwgJ3E8nlbmUBsfgFhiU93L7J2MXJwcAoEShycxgoSFhI4xijx5FUVxA0uEqd/noS6
 TUXiw+8H7CDlokD25rlKExgFZyG5dBaSS2chuXQBI/MqRoHEMmO9zORivbT8opIMvfSiTYzg
 1MLou4Px9ua3eocYmTgYDzFKcDArifAGs/gnCvGmJFZWpRblxxeV5qQWH2KU5mBREufl1ZsQ
 LySQnliSmp2aWpBaBJNl4uCUamCquGY/Q2M15+31WXHb/5q92/7nsdCaPcZn+d/YhvqcCv4Q
 kMwgaZUtZGj1Wb096myz3fwUxsYXAjKvZerVXokoN8+/tGn+hO1vf99RW2e396DaF5YsfoGI
 5xs4Ml57flWadXL1+qqT1z9Y7ms+90BBbUOuzNnEtLhlx4OXfn3LbRzwSb3T27P48uoz7rsE
 Qxt36lzwUvmxO2Ynw903lY+nmdrvulZ4wzqmcJ69ye3Ib1X8zFYbwrNNHG4cPsXIfVm5Ysmv
 7++fLws92CUh3cYodX+B9iKhDE7+OXWsrm9ZGNj+vBfKXx1nKpnmP2/OFx83FcaOs4fyDwu9
 +MfOlbddwsjZgatbUN6o8POXRDslluKMREMt5qLiRACfBDtpnAMAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_180217_900468_E493947F 
X-CRM114-Status: GOOD (  13.78  )
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

zqPPhM65z4IgMjAyMS0wOS0yNyAyMzoxMywgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+PiBX
ZSBuZWVkIHRvIGRlY2lkZSB3aGV0aGVyIHdlIHNob3VsZCBzdXBwb3J0IHRoZSB1cHN0cmVhbSBr
ZXJuZWwgZm9yIAo+PiBEMS4gRmV3IHRoaW5ncyB0byBjb25zaWRlci4KPj4g4oCTIENhbiBpdCBi
ZSBjb25zaWRlcmVkIGFzIGFuIGVycmF0YSA/CgpJdCdzIG9uZSB0aGluZyB0byBmb2xsb3cgdGhl
IHNwZWMgYW5kIGhhdmUgYW4gZXJyb3IgaW4gdGhlIAppbXBsZW1lbnRhdGlvbiwgYW5kIGFub3Ro
ZXIgdG8gbm90IGZvbGxvdyB0aGUgc3BlYy4KCj4+IOKAkyBEb2VzIGl0IHNldCBhIGJhZCBwcmVj
ZWRlbnQgYW5kIG9wZW4gY2FuIG9mIHdvcm1zIGluIGZ1dHVyZSA/CgpJTUhPIHllcywgSSdtIHRo
aW5raW5nIG9mIEtlbmRyeXRlIDIxMCBkZXZzIGZvciBleGFtcGxlIGNvbWluZyB1cCBhbmQgCmFz
a2luZyBmb3IgTU1VIHN1cHBvcnQsIHRoZXkgJ3ZlIGFsc28gc2hpcHBlZCBtYW55IGNoaXBzIGFs
cmVhZHkuIEkgY2FuIAphbHNvIGltYWdpbmUgb3RoZXIgdmVuZG9ycyBpbiB0aGUgZnV0dXJlIGNv
bWluZyB1cCB3aXRoIGltcGxlbWVudGF0aW9ucyAKdGhhdCB2aW9sYXRlIHRoZSBzcGVjIGluIHdo
aWNoIGNhc2UgaGFuZGxpbmcgdGhlIHN0YW5kYXJkIHN0dWZmIHdpbGwgCmJlY29tZSBtZXNzeSBh
bmQgY29tcGxleCwgYW5kIGh1cnQgcGVyZm9ybWFuY2Uvc2VjdXJpdHkuIFdlJ2xsIGVuZCB1cCAK
ZmlsbGluZyB0aGUgY29kZSB3aXRoIGV4Y2VwdGlvbnMgYW5kIHR3ZWFrcyBhbGwgb3ZlciB0aGUg
cGxhY2UuIFdlIG5lZWQgCnRvIGJlIHN0cmljdCBhYm91dCB3aGF0IGlzICJyaXNjdiIgYW5kIHdo
YXQncyAiZHJhZnQgcmlzY3YiIG9yICJyaXNjdiAKaW5zcGlyZWQiLCBhbmQgd2hhdCB3ZSBhcmUg
d2lsbGluZyB0byBzdXBwb3J0IHVwc3RyZWFtLiBJIGNhbiB1bmRlcnN0YW5kIApzdXBwb3J0aW5n
IHZlbmRvciBleHRlbnNpb25zIHVwc3RyZWFtIGJ1dCB0aGV5IG5lZWQgdG8gZml0IHdpdGhpbiB0
aGUgCnN0YW5kYXJkIHNwZWMsIHdlIGNhbid0IGhhdmUgZm9yIGV4YW1wbGUgZXh0ZW5zaW9ucyB0
aGF0IHVzZSBlbmNvZGluZyAKc3BhY2UvY3Nycy9maWVsZHMgZXRjIHJlc2VydmVkIGZvciBzdGFu
ZGFyZCB1c2UsIHRoZXkgbWF5IG9ubHkgdXNlIAp3aGF0J3MgcmVzZXJ2ZWQgZm9yIGN1c3RvbS92
ZW5kb3IgdXNlLiBBdCBsZWFzdCBsZXQncyBhZ3JlZSBvbiB0aGF0LgoKPj4g4oCTIENhbiB3ZSBq
dXN0IGlnbm9yZSBEMSBnaXZlbiB0aGUgbWFzcyB2b2x1bWUgPwo+PiAKCklNSE8gbm8sIHdlIG5l
ZWQgdG8gZmluZCBhIHdheSB0byBzdXBwb3J0IGl0IHVwc3RyZWFtIGJ1dCBJIGJlbGlldmUgCnRo
ZXJlIGlzIGFub3RoZXIgcXVlc3Rpb24gdG8gYW5zd2VyOgoKRG8gd2UgYWxzbyBndWFyYW50ZWUg
Im9uZSBpbWFnZSB0byBydWxlIHRoZW0gYWxsIiBhcHByb2FjaCwgcmVxdWlyZWQgYnkgCmJpbmFy
eSBkaXN0cm9zLCBmb3IgaW1wbGVtZW50YXRpb25zIHRoYXQgdmlvbGF0ZSB0aGUgc3BlYyA/IEFy
ZSB3ZSBvayAKZm9yIGV4YW1wbGUgdG8gc3VwcG9ydCBBbGx3aW5uZXIgRDEgdXBzdHJlYW0gYnV0
IHJlcXVpcmUgYSBjdXN0b20gCmNvbmZpZ3VyYXRpb24vYnVpbGQgaW5zdGVhZCBvZiBzdXBwb3J0
aW5nIGl0IHdpdGggdGhlICJnZW5lcmljIiBpbWFnZSA/IApJbiBvbmUgY2FzZSB3ZSBuZWVkIHRv
IGhhbmRsZSB0aGUgdmlvbGF0aW9uIGF0IHJ1bnRpbWUgYW5kIGludHJvZHVjZSAKb3ZlcmhlYWQg
Zm9yIGV2ZXJ5b25lIChsaWtlIGxvb2tpbmcgdXAgX19yaXNjdl9zdnBibXQgZXZlcnkgdGltZSB3
ZSBzZXQgCmEgUFRFIGluIHRoaXMgY2FzZSksIGluIHRoZSBvdGhlciBpdCdzIGFuICNpZmRlZi4K
ClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
