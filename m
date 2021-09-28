Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D580C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:19:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EB761159
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05EB761159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OXUALnHTtPUyePzLgP9v04u22QVKBdeE2izToQcIubE=; b=qktMfeggef4X57ZzhC6n23a/jI
	72h8OszmeNBQEQJQHWG4oNWP6A+l5n5Zo7CUCCk7u+pkrm6bATYntGwUk6BZj1eA9/LeUj4oYYKiB
	l4cFnGq+pdS9GXtOdFJprE/IzWFCmiFxH2NOnBT9HxR9lzuIMXIvDqHszL0W8TfeE4XNEya9DbMLa
	ypDBnpCtlqhjPp/4X7Y8eBt7pmJFMdw/bhrXPzjFPVITxmP9DASTS5CxRvIbd2Wy291ptPbHRbRXK
	Wl/P7Vp+3TuZNc+Uwn17hOWiCnyC9e/1OR2XjV9eMjsm5asTwUyXV9kAapkwau9KyrjgXNTWg+gGf
	WWqN89gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVD12-007JXK-MW; Tue, 28 Sep 2021 13:19:24 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVD0z-007JWK-LU
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 13:19:23 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18SDJFt3099518
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 16:19:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632835150; x=1635427150;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vgtOTbyRSvtHqgOJzpEHttghZ3hnA3y56xOmeIfocLA=;
 b=nVEsxJW9sXEw2+R4lQgiO6A6JscUaFCChyx8zTgXqjTTW1EQ7+ryCBm+VCeApJoG
 8rExfD+WJ+jwA4ZfEbophui0v8nmlXHlAWv8MYv81LYevdIGvzB2U1g8M0MlCqQT
 cW74vywpFvibLDPnkpmfuReQv+L4uUskiybS3FjPyShDax3QQKIszmGoulMubr9V
 j6KDWmOlXtIo4kAj+5La8iD6x0ROQOG1eHyPSvUo20Y81cBJ2b4pA4ysuoOA9Ujb
 gGhQ3RRTNtACj066TG+gIvaloCkHJmuXreNHmICAft/i0RHFMkOPE3qfXpcHNL9W
 w6hmRCTehbY42K8iGigkLA==;
X-AuditID: 8b5b014d-ba8f670000005d46-cb-6153164eb68b
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 AC.84.23878.E4613516; Tue, 28 Sep 2021 16:19:10 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Gordan Markus <gordan.markus@canonical.com>,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>,
 Bill Huffman <huffman@cadence.com>, Allen Baum
 <allen.baum@esperantotech.com>, Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
 <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
 <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
From: Nick Kossifidis <mick@ics.forth.gr>
Message-ID: <ad40c335-ee8f-9ff3-4c34-f8fa5ef49e8b@ics.forth.gr>
Date: Tue, 28 Sep 2021 16:19:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
Content-Language: el-GR
X-Brightmail-Tracker: H4sIAAAAAAAAA03Sf1DTdRzH8ft8v59994XY9YVQPolFoP0gbZZ51xvlrLsKPmVoZkcxucPv
 5WAUiX0HRrMSdRkCKpIMGRwaJ+CADOHmHG5kC6akOIIL8RRTJBWI5QJu2mZ2g7rjv+fd6/34
 782zYQWyeXzmphy1tEnMiuGCcdH68gXPrZ67TnzeVrUEhh1fc2A47ZDDVyWnMAzf2c+B/o5b
 BvdLnXKoOerFUHAhAY5YI8E2apNDz85iBFeP1snh1L4qDBaXl4Pb9u0Yzgy1YTA1djLQs/2S
 HPoaDzFw62cnB72T/Rj62qo4ODGh58B0zMnCwbv/IBjpK2bBfPwYgiLTVuhqPo2gqbYMgf6H
 AxjuOVwMfDtWLX8lmo7uuslQ39+liPYXHMfU7atDtMx3HtOm3WMMNebv4eiVCy6ONg81yugf
 IyOYPnCYMLUaB+X0cEsu1XeMy2hLw26OWq/Hvf2oKjh+ozorc4taWrJyQ7DG6f9489gzed9c
 KUP5yPdEIQriibCM3LT9hgpRMB8mdCIyNTqEZoY40vrXCA70I8JKUl9tZgoRz4cLb5ADrvTA
 PSs0PUQMVydlM3gfSyyD9mnACbHkUO+POAAUwsukqPylQGLhSVI9kRq4mCOkkB1nzVygFUIo
 6aoYnpZBwlrS294w3azwNPFX97IzHUE6XL7/OorsNFeyJUgwzuLGWcQ4ixhnkcMINyBB3PKi
 MvMDrTI9W8rRKDOkFjT9LCjpJLrcOq50IIZHDkR4NiZcEX3vHTFMsVH8TKeWstOk3Cy11oEi
 eRwToVAoS9LChAwxR/2RWr1ZLf2/MnzQvHxmkadn6ZQqh7d1TtrOlvcnRywq97yWseBTYsNL
 Q9/b2xVfT+nQwhs9NbH3/U5d8VvWN7806iy6gbRUvHzrq9dCxkKSE07y55LH83bN3+Y94olm
 K+zEsGOvrJ79HGW/n/TY+bhPuv2FcHF+22WPY3G3Vm/yX5rrKf4zXKlKda5I132vEu7WJNU+
 FWpY/mHKbfSue/3jeaFR8RPuDqXGnV4p3bKs6161J/d1+0G3qs5VscysqcQPa7xR4sJfV8UP
 29tXtP8khU9qHlSs+aU5rvv3a9qLiQMi94Wh3ptYutZXO0Bat8UmWK7LpmoTUwZbFfLv9t84
 l3gmNpLLZqxBIYoYrNWILzzLSlrxX6AOS/ubAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_061922_128503_6443F41C 
X-CRM114-Status: GOOD (  38.34  )
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

T24gOS8yOC8yMSA3OjI2IEFNLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiBNb24sIFNlcCAyNywg
MjAyMSBhdCA4OjUwIFBNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+
Pgo+PiBPbiBUdWUsIFNlcCAyOCwgMjAyMSBhdCA2OjMyIEFNIE5pY2sgS29zc2lmaWRpcyA8bWlj
a0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+Pj4KPj4+IM6jz4TOuc+CIDIwMjEtMDktMjcgMjM6MTMs
IEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4+Pj4gV2UgbmVlZCB0byBkZWNpZGUgd2hldGhl
ciB3ZSBzaG91bGQgc3VwcG9ydCB0aGUgdXBzdHJlYW0ga2VybmVsIGZvcgo+Pj4+PiBEMS4gRmV3
IHRoaW5ncyB0byBjb25zaWRlci4KPj4+Pj4g4oCTIENhbiBpdCBiZSBjb25zaWRlcmVkIGFzIGFu
IGVycmF0YSA/Cj4+Pgo+Pj4gSXQncyBvbmUgdGhpbmcgdG8gZm9sbG93IHRoZSBzcGVjIGFuZCBo
YXZlIGFuIGVycm9yIGluIHRoZQo+Pj4gaW1wbGVtZW50YXRpb24sIGFuZCBhbm90aGVyIHRvIG5v
dCBmb2xsb3cgdGhlIHNwZWMuCj4+Pgo+Pj4+PiDigJMgRG9lcyBpdCBzZXQgYSBiYWQgcHJlY2Vk
ZW50IGFuZCBvcGVuIGNhbiBvZiB3b3JtcyBpbiBmdXR1cmUgPwo+Pj4KPj4+IElNSE8geWVzLCBJ
J20gdGhpbmtpbmcgb2YgS2VuZHJ5dGUgMjEwIGRldnMgZm9yIGV4YW1wbGUgY29taW5nIHVwIGFu
ZAo+Pj4gYXNraW5nIGZvciBNTVUgc3VwcG9ydCwgdGhleSAndmUgYWxzbyBzaGlwcGVkIG1hbnkg
Y2hpcHMgYWxyZWFkeS4gSSBjYW4KPj4+IGFsc28gaW1hZ2luZSBvdGhlciB2ZW5kb3JzIGluIHRo
ZSBmdXR1cmUgY29taW5nIHVwIHdpdGggaW1wbGVtZW50YXRpb25zCj4+PiB0aGF0IHZpb2xhdGUg
dGhlIHNwZWMgaW4gd2hpY2ggY2FzZSBoYW5kbGluZyB0aGUgc3RhbmRhcmQgc3R1ZmYgd2lsbAo+
Pj4gYmVjb21lIG1lc3N5IGFuZCBjb21wbGV4LCBhbmQgaHVydCBwZXJmb3JtYW5jZS9zZWN1cml0
eS4gV2UnbGwgZW5kIHVwCj4+PiBmaWxsaW5nIHRoZSBjb2RlIHdpdGggZXhjZXB0aW9ucyBhbmQg
dHdlYWtzIGFsbCBvdmVyIHRoZSBwbGFjZS4gV2UgbmVlZAo+Pj4gdG8gYmUgc3RyaWN0IGFib3V0
IHdoYXQgaXMgInJpc2N2IiBhbmQgd2hhdCdzICJkcmFmdCByaXNjdiIgb3IgInJpc2N2Cj4+PiBp
bnNwaXJlZCIsIGFuZCB3aGF0IHdlIGFyZSB3aWxsaW5nIHRvIHN1cHBvcnQgdXBzdHJlYW0uIEkg
Y2FuIHVuZGVyc3RhbmQKPj4+IHN1cHBvcnRpbmcgdmVuZG9yIGV4dGVuc2lvbnMgdXBzdHJlYW0g
YnV0IHRoZXkgbmVlZCB0byBmaXQgd2l0aGluIHRoZQo+Pj4gc3RhbmRhcmQgc3BlYywgd2UgY2Fu
J3QgaGF2ZSBmb3IgZXhhbXBsZSBleHRlbnNpb25zIHRoYXQgdXNlIGVuY29kaW5nCj4+PiBzcGFj
ZS9jc3JzL2ZpZWxkcyBldGMgcmVzZXJ2ZWQgZm9yIHN0YW5kYXJkIHVzZSwgdGhleSBtYXkgb25s
eSB1c2UKPj4+IHdoYXQncyByZXNlcnZlZCBmb3IgY3VzdG9tL3ZlbmRvciB1c2UuIEF0IGxlYXN0
IGxldCdzIGFncmVlIG9uIHRoYXQuCj4+Cj4+IFRvdGFsbHkgYWdyZWUgd2l0aCBOaWNrIGhlcmUu
IEl0J3MgYSBzbGlwcGVyeSBzbG9wZS4KPj4KPj4gSW5jbHVkaW5nIEQxIFBURSBiaXRzIChvciBL
ZW5kcnl0ZSBLMjEwIE1NVSkgcGFydCBvZiB0aGUgTGludXggUklTQy1WCj4+IG1lYW5zIGZ1dHVy
ZSBoYXJkd2FyZSB3aGljaCBpbnRlbnRpb25hbGx5IHZpb2xhdGVzIHNwZWNzIHdpbGwgYWxzbyBo
YXZlIHRvCj4+IGJlIG1lcmdlZCBhbmQgdGhlIFJJU0MtViBwYXRjaCBhY2NlcHRhbmNlIHBvbGlj
eSB3aWxsIGhhdmUgbm8gc2lnbmlmaWNhbmNlLgo+Pgo+Pj4KPj4+Pj4g4oCTIENhbiB3ZSBqdXN0
IGlnbm9yZSBEMSBnaXZlbiB0aGUgbWFzcyB2b2x1bWUgPwo+Pj4+Pgo+Pj4KPj4+IElNSE8gbm8s
IHdlIG5lZWQgdG8gZmluZCBhIHdheSB0byBzdXBwb3J0IGl0IHVwc3RyZWFtIGJ1dCBJIGJlbGll
dmUKPj4+IHRoZXJlIGlzIGFub3RoZXIgcXVlc3Rpb24gdG8gYW5zd2VyOgo+Pj4KPj4+IERvIHdl
IGFsc28gZ3VhcmFudGVlICJvbmUgaW1hZ2UgdG8gcnVsZSB0aGVtIGFsbCIgYXBwcm9hY2gsIHJl
cXVpcmVkIGJ5Cj4+PiBiaW5hcnkgZGlzdHJvcywgZm9yIGltcGxlbWVudGF0aW9ucyB0aGF0IHZp
b2xhdGUgdGhlIHNwZWMgPyBBcmUgd2Ugb2sKPj4+IGZvciBleGFtcGxlIHRvIHN1cHBvcnQgQWxs
d2lubmVyIEQxIHVwc3RyZWFtIGJ1dCByZXF1aXJlIGEgY3VzdG9tCj4+PiBjb25maWd1cmF0aW9u
L2J1aWxkIGluc3RlYWQgb2Ygc3VwcG9ydGluZyBpdCB3aXRoIHRoZSAiZ2VuZXJpYyIgaW1hZ2Ug
Pwo+Pj4gSW4gb25lIGNhc2Ugd2UgbmVlZCB0byBoYW5kbGUgdGhlIHZpb2xhdGlvbiBhdCBydW50
aW1lIGFuZCBpbnRyb2R1Y2UKPj4+IG92ZXJoZWFkIGZvciBldmVyeW9uZSAobGlrZSBsb29raW5n
IHVwIF9fcmlzY3Zfc3ZwYm10IGV2ZXJ5IHRpbWUgd2Ugc2V0Cj4+PiBhIFBURSBpbiB0aGlzIGNh
c2UpLCBpbiB0aGUgb3RoZXIgaXQncyBhbiAjaWZkZWYuCj4+Cj4+IEF0IGxlYXN0LCB3ZSBzaG91
bGQgbm90IGhhdmUgaGFyZHdhcmUgdmlvbGF0aW5nIHNwZWNzIGFzIHBhcnQgb2YgdGhlCj4+IHVu
aWZpZWQga2VybmVsIGltYWdlIGluc3RlYWQgaGF2ZSB0aGVzZSBpbnRlbnRpb25hbCBkZXZpYXRp
b25zL3Zpb2xhdGlvbnMKPj4gdW5kZXIgc2VwYXJhdGUga2NvbmZpZyB3aGljaCB3aWxsIG5vdCBi
ZSBlbmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMgbWVhbnMKPj4gdmVuZG9ycyAob2Ygc3VjaCBoYXJk
d2FyZSkgYW5kIGRpc3Ryb3Mgd2lsbCBoYXZlIHRvIGV4cGxpY2l0bHkgZW5hYmxlCj4+IHN1cHBv
cnQgZm9yIHN1Y2ggdmlvbGF0aW9ucy9kZXZpYXRpb25zLgo+Pgo+IAo+IElmIHdlIG1lcmdlIHRo
ZSBjb2RlIGFuZCBhcmUgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCwgaXQgd291bGQgYmUgYQo+IG1h
aW50ZW5hbmNlIG5pZ2h0bWFyZSBpbiBmdXR1cmUuCj4gVGhlc2UgcGFydCBvZiB0aGUga2VybmVs
IHdpbGwgbm90IGJlIHJlZ3VsYXJseSB0ZXN0ZWQgYnV0IHdlIGhhdmUgdG8KPiBjYXJyeSB0aGUg
Y2hhbmdlcyBmb3IgYSBsb25nIHRpbWUuCgpJIGRvbid0IHNlZSBhIGRpZmZlcmVuY2UgYmV0d2Vl
biBoYXZpbmcgdGhlc2UgZmVhdHVyZXMgYXMgcGFydCBvZiB0aGUKZ2VuZXJpYyBpbWFnZSB2cyBo
YXZpbmcgdGhlbSBhcyBjdXN0b20gY29uZmlncy9idWlsZHMuIFRoZSBjb2RlIHdpbGwgZ2V0CmV4
ZWN1dGVkIG9ubHkgb24gYm9hcmRzIHRoYXQgc3VwcG9ydCB0aGUgY3VzdG9tL25vbi1jb21wbGlh
bnQKaW1wbGVtZW50YXRpb24gYW55d2F5LiBUbyB0aGUgY29udHJhcnkgd2UnbGwgaGF2ZSBtb3Jl
IGNvZGUgdG8gdGVzdCBpZgp3ZSBhcmUgZG9pbmcgdGhpbmdzIGF0IHJ1bnRpbWUgdnMgYXQgY29t
cGlsZSB0aW1lLgoKPiBTaW1pbGFyIGNoYW5nZXMgd2lsbCBvbmx5IGdyb3cgb3ZlciB0aW1lIGNh
dXNpbmcgYSBsb3Qgb2YgY3VzdG9tCj4gY29uZmlncyB0aGF0IGFyZSBub3QgZW5hYmxlZCBieSBk
ZWZhdWx0Lgo+IAoKV2UnbGwgaGF2ZSBhIGxvdCBvZiBjdXN0b20gY29uZmlncyB0aGF0IHdpbGwg
b25seSBnZXQgdXNlZCBvbiBib2FyZHMKdGhhdCB1c2UgdGhlbSwgdnMgcnVudGltZSBjb2RlIHRo
YXQgd2lsbCBydW4gZm9yIG5vIHJlYXNvbiBvbiBldmVyeQpib2FyZCBhbmQgY2hvb3NlIHRoZSBk
ZWZhdWx0L3N0YW5kYXJkLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbiBtb3N0IG9mCnRoZSB0aW1l
LiBJbiB0aGUgZW5kIHRoZSBjb2RlIHdpbGwgb25seSBnZXQgdGVzdGVkIG9uIHNwZWNpZmljIGhh
cmR3YXJlCmFueXdheS4KCj4gSU1ITywgaWYgd2Ugd2FudCB0byBzdXBwb3J0IHRoaXMgYm9hcmQg
aW4gdXBzdHJlYW0sIHdlIHNob3VsZCBqdXN0Cj4gY2xlYXJseSBzdGF0ZSB0aGF0IGl0IGlzIG9u
ZSB0aW1lIHNwZWNpYWwgZXhjZXB0aW9uCj4gZm9yIHRoaXMgYm9hcmQgb25seSBiZWNhdXNlIG9m
IHRoZSBmb2xsb3dpbmcgcmVhc29ucwo+IAo+IDEuIFRoZSBib2FyZCBkZXNpZ24gcHJlZGF0ZXMg
dGhlIHBhdGNoIGFjY2VwdGFuY2UgcG9saWN5Lgo+IDIuIFdlIGRvbid0IGhhdmUgZW5vdWdoIGFm
Zm9yZGFibGUgTGludXggY29tcGF0aWJsZSBwbGF0Zm9ybXMgdG9kYXkuCj4gMy4gQWxsb3dpbmcg
cnVubmluZyBhbiB1cHN0cmVhbSBrZXJuZWwgb24gRDEgaGVscHMgdGhlIFJJU0MtViBzb2Z0d2Fy
ZQo+IGVjb3N5c3RlbSB0byBncm93Lgo+IAoKVGhlIHNhbWUgY2FuIGJlIHNhaWQgZm9yIEtlbmRy
eXRlIGFzIHdlbGwsIGFyZSB3ZSB3aWxsaW5nIHRvIGFsc28Kc3VwcG9ydCB0aGVpciBNTVUgaW1w
bGVtZW50YXRpb24gb24gdGhlIGdlbmVyaWMgaW1hZ2UgaWYgYSBwYXRjaCBjb21lcwppbiA/IFRv
IGJlIGNsZWFyIEknbSBub3Qgc2F5aW5nIHdlIHNob3VsZG4ndCBzdXBwb3J0IEQxIG9yIEtlbmRy
eXRlCnVwc3RyZWFtLCBJJ20ganVzdCBzYXlpbmcgdGhhdCB3ZSBzaG91bGRuJ3Qgc2FjcmlmaWNl
IHRoZSBjb21wbGVpdHkgYW5kCnBlcmZvcm1hbmNlIG9mIHRoZSBjb2RlIHBhdGggZm9yIHN0YW5k
YXJkLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbnMsIHRvCnN1cHBvcnQgbm9uLWNvbXBsaWFudCBp
bXBsZW1lbnRhdGlvbnMsIGFuZCBpbnN0ZWFkIHN1cHBvcnQgbm9uLWNvbXBsaWFudAppbXBsZW1l
bnRhdGlvbnMgd2l0aCBjdXN0b20ga2VybmVsIGJ1aWxkcyB1c2luZyBjb21waWxlIHRpbWUgb3B0
aW9ucy4gSXQKc3RpbGwgY291bnRzIGFzIHVwc3RyZWFtIHN1cHBvcnQsIHRoZXkgd29uJ3QgaGF2
ZSB0byBtYWludGFpbiB0aGVpciBvd24KZm9ya3MuIEl0J2xsIGFsc28gYWxsb3cgY3VzdG9tIGlt
cGxlbWVudGF0aW9ucyB0byBoYXZlIG1vcmUgZmxleGliaWxpdHkKb24gd2hhdCB0aGV5IGNhbiBk
byBzaW5jZSB0aGV5IHdpbGwgYmUgYWJsZSB0byB1c2UgY29tcGxldGVseQpkaWZmZXJlbnQvY3Vz
dG9tIGNvZGUgcGF0aHMsIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGZpdCBpbiB0aGUgc3RhbmRhcmQK
Y29kZSBwYXRoICh3aGljaCB3aWxsIGJlY29tZSBhIG1lc3Mgb3ZlciB0aW1lKS4gSSB0aGluayB0
aGlzIGFwcHJvYWNoIGlzCm11Y2ggbW9yZSBmbGV4aWJsZSBhbmQgd2lsbCBhbGxvdyBtb3JlIGN1
c3RvbWl6YXRpb25zIHRvIGJlIHN1cHBvcnRlZAp1cHN0cmVhbSBpbiB0aGUgZnV0dXJlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
