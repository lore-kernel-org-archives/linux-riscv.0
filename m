Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA119C47095
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 09:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7538061375
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 09:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7538061375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5HWHQa4LQb1HrRFL8g+YOwROz4yK+DgSrpNkvkmX/Y=; b=oNFb/97IrYgOBXpP5G4i8mlRml
	9NzJSsfb7zJ4pSsoa7mKiBInZhw/xTkF5208VJ1EbZFbhX65FW6T8Q5diXDKDg2K9ZiyWWFn4O+85
	IHUPy7vJjK/HNufxD92/cXdTdH8iD8lv+ZKp0gmUkZad6A6ZaznE9uCtn8ULcIKEPOZPvFzxir0r9
	+S5WMe91U7RrjqBuf7M+KgNfKjdQN5/wK/VJXn/I0SNCX0rhh+5Ui4UjcIoeWD9y9GFWOFtu7cBv6
	a75NV9w08354gc03lZQ0qeuc8Sd07jdbYyXWv/ITMGcCTsPLGG0AZLcJw2rXPhrzd6/X238dwF+b+
	XoXf/8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lquuU-00CodW-Ek; Wed, 09 Jun 2021 09:54:06 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqum1-00ClvK-Iw
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 09:45:25 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1599j9GP050390
 for <linux-riscv@lists.infradead.org>; Wed, 9 Jun 2021 12:45:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623231904; x=1625823904;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjGGcXj2vYqKeS5nQsMSbZLVyeA0Yb+og64ORh4pZoc=;
 b=ZHIEsIIyg1A+E4IlEj4+7B+gOESDbGe3/DVcdBzG2InLyO5KOso+4rJ+Amgkpe7r
 EfWQ81kDSjg5z5gHscQNF4ZcRI2EBPD3PkLetk2l4lV+vAbYol08wZgkhtMx9qae
 TCep7BFW773GcnRJf8LZE8yLJT+MM0wqoy5aIrJT1G+X/6gF1/pW42ROoFYWCDlY
 fQftNnsQvTTViH88ENDycxAAxCLJ33TlJzaxS9JdigaCffsZ2+Yy3LVBOBDxbVTM
 JS5Y7r/BALQ9oIFMVvGfusmyPOi0/yzyl0YLlLaKyVZKD43uEb+7x2iMC1alIm91
 4TTq1b0YLhXu5DwaJ23pUQ==;
X-AuditID: 8b5b014d-962f1700000067b6-3c-60c08d9f9466
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 C8.43.26550.F9D80C06; Wed,  9 Jun 2021 12:45:03 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 09 Jun 2021 12:45:01 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Guo Ren <guoren@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Christoph Hellwig <hch@lst.de>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 =?UTF-8?Q?Wei_Wu_?=
 =?UTF-8?Q?=28=E5=90=B4=E4=BC=9F=29?= <lazyparser@gmail.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Organization: FORTH
In-Reply-To: <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
Message-ID: <78f544f739120f5b541238a1d5f6e23b@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsXSHT1dWXd+74EEg9cXrC2efJjIZnFvxTJ2
 ixd7G1ksjj/axWKxcvVRJotLX66xWHTs+spicXnXHDaLbZ9b2Cym7NvFZnHx13xGi+Z359gt
 tm5cx2jRNovfYtbi2+wW99edY7No2T+FxUHQ493vZYwe994+YfLYOesuu8eCTaUeDzddYvLY
 tKqTzWPnQ0uPX9uPMnlsXlLv8WLzTEaP3Tcb2Dze77vK5nGp+Tq7x+dNch7tB7qZAvijuGxS
 UnMyy1KL9O0SuDK+P53EXrBdumLzz07GBsYPol2MnBwSAiYSR/5MYO5i5OIQEjjGKLHt8CNG
 iISpxOy9nWA2r4CgxMmZT1hAbGYBC4mpV/YzQtjyEs1bZzOD2CwCqhL9S2ayg9hsApoS8y8d
 BKsXAar5fbSTFaL+M6tE/wNeEFtYwEbi0JX1YHF+AWGJT3cvgtmcAoESjzZ9YgKxhQQ2M0ss
 +sYHcYOLxJ3FS1khblOR+PD7AdAuDg5RIHvzXKUJjIKzkFw6C8mls5BcuoCReRWjQGKZsV5m
 crFeWn5RSYZeetEmRnDEMvruYLy9+a3eIUYmDsZDjBIczEoivGWG+xKEeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ8/LqTYgXEkhPLEnNTk0tSC2CyTJxcEo1MLUyLPXyVnqg5HHmyoRTkdfnnP3z
 +ek5odpJUz/zvl9Qb3jVQHnudEmmO4/VHurXzD+6ausRf5vmeFl9rUKOZVHbZvQcj5lycOX3
 2FOt7oZOS7wUHL/rfF/KIXO0fUPV5y83J372Oe0gW6XCniLQEqZu2vfU0vDbE8ZNB/7cDM+7
 93D3w02HzJpF0n87v2d/cb91+VYNqSOqUje+e1lkRxnIzwjuvu7QdfWChZ+Uvexh4Tid5aJ5
 /s4aL/pVNVLK1x4JDAlPP/rpnPfnqSl/GF+t36qfVOBccss6YEo1z+wdm/fZySzo4jedfOHF
 laUvvl01vTJbTcay1tou98o/rUgG1svXRH2unrA7UfyM470SS3FGoqEWc1FxIgDm0E7aRwMA
 AA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_024522_133597_B4661054 
X-CRM114-Status: GOOD (  28.43  )
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

zqPPhM65z4IgMjAyMS0wNi0wOSAwNjoyOCwgR3VvIFJlbiDOrc6zz4HOsc+IzrU6Cj4gT24gTW9u
LCBKdW4gNywgMjAyMSBhdCAyOjE0IEFNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGgu
Z3I+IAo+IHdyb3RlOgo+PiAKPj4gzqPPhM65z4IgMjAyMS0wNS0yMCAwNDo0NSwgR3VvIFJlbiDO
rc6zz4HOsc+IzrU6Cj4+ID4gT24gV2VkLCBNYXkgMTksIDIwMjEgYXQgMjo1MyBQTSBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4+ID4+Cj4+ID4+IE9uIFR1ZSwgTWF5IDE4
LCAyMDIxIGF0IDExOjQ0OjM1UE0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPj4gPj4gPiBU
aGlzIHBhdGNoIHNlcmllcyBsb29rcyBsaWtlIGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3IgdGhlIFN0
YXJGaXZlIEpINzEwMAo+PiA+PiA+IFsxXSBbMl0gdG9vIGFzIGl0IGhhcyBwZXJpcGhlcmFscyBv
biBhIG5vbi1jb2hlcmVudCBpbnRlcmNvbm5lY3QuIEdNQUMsCj4+ID4+ID4gVVNCIGFuZCBTRElP
IHJlcXVpcmUgdGhhdCB0aGUgTDIgY2FjaGUgbXVzdCBiZSBtYW51YWxseSBmbHVzaGVkIGFmdGVy
Cj4+ID4+ID4gRE1BIG9wZXJhdGlvbnMgaWYgdGhlIGRhdGEgaXMgaW50ZW5kZWQgdG8gYmUgc2hh
cmVkIHdpdGggVTc0IGNvcmVzIFsyXS4KPj4gPj4KPj4gPj4gTm90IHRvbyBtdWNoLCBnaXZlbiB0
aGF0IHRoZSBTaUZpdmUgbGluZWFnZSBDUFVzIGhhdmUgYW4gdW5jYWNoZWQKPj4gPj4gd2luZG93
LCB0aGF0IGlzIGEgdG90YWxseSBkaWZmZXJlbnQgd2F5IHRvIGFsbG9jYXRlIHVuY2FjaGVkIG1l
bW9yeS4KPj4gPiBJdCdzIGEgdmVyeSBiaWcgTUlQUyBzbWVsbC4gV2hhdCdzIHRoZSBhdHRyaWJ1
dGUgb2YgdGhlIHVuY2FjaGVkCj4+ID4gd2luZG93PyAodW5jYWNoZWQgKyBzdHJvbmctb3JkZXIv
IHVuY2FjaGVkICsgd2VhaywgbW9zdCB2ZW5kb3JzIHN0aWxsCj4+ID4gdXNlIEFYSSBpbnRlcmNv
bm5lY3QsIGhvdyB0byBkZWFsIHdpdGggYSBidWZmZXJhYmxlIGF0dHJpYnV0ZT8pIEluCj4+ID4g
ZmFjdCwgY3VzdG9tZXJzJyBkcml2ZXJzIHVzZSBkaWZmZXJlbnQgd2F5cyB0byBkZWFsIHdpdGgg
RE1BIG1lbW9yeSBpbgo+PiA+IG5vbi1jb2hlcmVudCBTT0MuIE1vc3QgcmlzY3YgU09DIHZlbmRv
cnMgYXJlIGZyb20gQVJNLCBzbyBnaXZpbmcgdGhlbQo+PiA+IHRoZSBzYW1lIHdheSBpbiBETUEg
bWVtb3J5IGlzIGEgc21hcnQgY2hvaWNlLiBTbyB1c2luZyBQVEUgYXR0cmlidXRlcwo+PiA+IGlz
IG1vcmUgc3VpdGFibGUuCj4+ID4KPj4gPiBTZWU6Cj4+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3ZpcnR1YWwtbWVtb3J5L2Jsb2IvbWFpbi9zcGVjcy82MTEtdmlydHVhbC1tZW1vcnktZGlm
Zi5wZGYKPj4gPiA0LjQuMQo+PiA+IFRoZSBkcmFmdCBzdXBwb3J0cyBjdXN0b20gYXR0cmlidXRl
IGJpdHMgaW4gUFRFLgo+PiA+Cj4+IAo+PiBOb3Qgb25seSBpdCBkb2Vzbid0IHN1cHBvcnQgY3Vz
dG9tIGF0dHJpYnV0ZXMgb24gUFRFczoKPj4gCj4+ICJCaXRzNjPigJM1NCBhcmUgcmVzZXJ2ZWQg
Zm9yIGZ1dHVyZSBzdGFuZGFyZCB1c2UgYW5kIG11c3QgYmUgemVyb2VkIGJ5Cj4+IHNvZnR3YXJl
IGZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHkuIgo+PiAKPj4gSXQgYWxzbyBnb2VzIGZ1cnRoZXIg
dG8gc2F5IHRoYXQ6Cj4+IAo+PiAiaWYgYW55IG9mIHRoZXNlIGJpdHMgYXJlIHNldCwgYSBwYWdl
LWZhdWx0IGV4Y2VwdGlvbiBpcyByYWlzZWQiCj4gQWdyZWUsIHdoZW4gb3VyIHByb2Nlc3Nvcidz
IG1tdSB3b3JrcyBpbiBjb21wYXRpYmxlIG1tdSwgd2UgbXVzdCBrZWVwCj4gIkJpdHM2M+KAkzU0
IGJpdCIgemVybyBpbiBMaW51eC4KPiBTbywgSSB0aGluayB0aGlzIGlzIHRoZSBmaXJzdCB2ZXJz
aW9uIG9mIHRoZSBQVEUgZm9ybWF0Lgo+IAo+IElmIHRoZSAiUEJNVCIgZXh0ZW5zaW9uIHByb3Bv
c2FsIGlzIGFwcHJvdmVkLCBpdCB3aWxsIGNhdXNlIHRoZSBzZWNvbmQKPiB2ZXJzaW9uIG9mIHRo
ZSBQVEUgZm9ybWF0Lgo+IAo+IE1heWJlIGluIHRoZSBmdXR1cmUsIHdlJ2xsIGdldCBtb3JlIHZl
cnNpb25zIG9mIHRoZSBQVEUgZm9ybWF0cy4KPiAKPiBTbywgc2VlbXMgTGludXggbXVzdCBzdXBw
b3J0IG11bHRpIHZlcnNpb25zIG9mIFBURSBmb3JtYXRzIHdpdGggb25lCj4gSW1hZ2UsIHJpZ2h0
Pwo+IAo+IE9rYXksIHdlIGNvdWxkIHN0b3AgYXJndWluZyB3aXRoIHRoZSBEMSBQVEUgZm9ybWF0
LiBBbmQgdGFsayBhYm91dCBob3cKPiB0byBsZXQgTGludXggc3VwcG9ydCBtdWx0aSB2ZXJzaW9u
cyBvZiBQVEUgZm9ybWF0cyB0aGF0IGNvbWUgZnJvbSB0aGUKPiBmdXR1cmUgUklTQy1WIHByaXZp
bGVnZSBzcGVjLgoKVGhlIFJJU0MtViBJU0Egc3BlY3MgYXJlIG1lYW50IHRvIGJlIGJhY2t3YXJk
cyBjb21wYXRpYmxlLCBzbyBuZXdlciBQVEUgCnZlcnNpb25zIHNob3VsZCB3b3JrIG9uIG9sZGVy
IGRldmljZXMgKG5vdGUgdGhhdCB0aGUgc3BlYyBzYXlzIHRoYXQgCnNvZnR3YXJlIG11c3Qgc2V0
IHRob3NlIGJpdHMgdG8gemVybyBmb3IgImZvcndhcmQgY29tcGF0aWJpbGl0eSIgYW5kIGFyZSAK
InJlc2VydmVkIGZvciBmdXR1cmUgdXNlIiBzbyBjdXJyZW50IGltcGxlbWVudGF0aW9ucyBtdXN0
IGlnbm9yZSB0aGVtKS4gCk9idmlvdXNseSB0aGUgcHJvcG9zZWQgImlmIGFueSBvZiB0aGVzZSBi
aXRzIGFyZSBzZXQsIGEgcGFnZS1mYXVsdCAKZXhjZXB0aW9uIGlzIHJhaXNlZCIgd2lsbCBicmVh
ayBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aGljaCBpcyB3aHkgd2UgCm5lZWQgdG8gYXNrIGZv
ciBpdCB0byBiZSByZW1vdmVkIGZyb20gdGhlIGRyYWZ0LgoKQXMgYW4gZXhhbXBsZSB0aGUgUEJN
VCBwcm9wb3NhbCB1c2VzIGJpdHMgNjI6NjEgdGhhdCBvbiBvbGRlciBodyBzaG91bGQgCmJlIGln
bm9yZWQgKCJyZXNlcnZlZCBmb3IgZnV0dXJlIHVzZSIpLCBpZiBMaW51eCB1c2VzIHRob3NlIGJp
dHMgd2UgCndvbid0IG5lZWQgYSBkaWZmZXJlbnQgY29kZSBwYXRoIGZvciBzdXBwb3J0aW5nIG9s
ZGVyIGh3L29sZGVyIFBURSAKdmVyc2lvbnMsIHdlJ2xsIGp1c3Qgc2V0IHRoZW0gYW5kIG9sZGVy
IGh3IHdpbGwgaWdub3JlIHRoZW0uIEJlY2F1c2Ugb2YgCnRoZSBndWFyYW50ZWUgdGhhdCBJU0Eg
c3BlY3MgbWFpbnRhaW4gYmFja3dhcmRzIGNvbXBhdGliaWxpdHksIHRoZSAKZnVuY3Rpb25hbGl0
eSBvZiBiaXRzIDYyOjYxIGlzIGd1YXJhbnRlZWQgdG8gcmVtYWluIGJhY2t3YXJkcyAKY29tcGF0
aWJsZS4KCkluIG90aGVyIHdvcmRzIHdlIGRvbid0IG5lZWQgYW55IHNwZWNpYWwgaGFuZGxpbmcg
b2YgbXVsdGlwbGUgUFRFIApmb3JtYXRzLCB3ZSBqdXN0IG5lZWQgdG8gc3VwcG9ydCB0aGUgbGF0
ZXN0IFByaXYuIFNwZWMgYW5kIHRoZSBTcGVjIAppdHNlbGYgd2lsbCBndWFyYW50ZWUgYmFja3dh
cmRzIGNvbXBhdGliaWxpdHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
