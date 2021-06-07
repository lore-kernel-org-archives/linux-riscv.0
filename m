Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B5CC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 08:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7CC6115B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 08:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7CC6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+93Iij7ByY3t9C6ThZ/oo6f7hNFWJpZgbJWRPRwm6g=; b=UzvzfR+04rAd3/xS2rqVz3jC7K
	MqC+d42bIkSyTVUe1953mUNTyWSOHNaw1OToRBjrmLogP2goivevuOTW69SWYpTBhmnyUWKMmjyW4
	U4E4wdWe1mENZRy53h1ioz+7/bhuOo3Xoacn6VBVNMkMdnbiV1NejLL6d40a/Sw9EKXlF2RU8XwAt
	nnCTQEYDbFBYJPcfeWel3DOHkSFKRWUM15TbwtXCiFYg5XGQ8KPfEMMZo4gdG3QjqeJ+r/XmFOLGK
	23cAVOm0Kbw8XkPvf3+jnssWw8ap7d0xUwvz+sdMPJKT+u/7Gt8/AhTk2DLxvoFVXM+cfCg5vNgKZ
	7GDn2LFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqAnu-002Mc9-RL; Mon, 07 Jun 2021 08:40:14 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqAjs-002LHM-Vf
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 08:36:09 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 1578a1M6075208
 for <linux-riscv@lists.infradead.org>; Mon, 7 Jun 2021 11:36:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623054956; x=1625646956;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U2J+Ype/9wfTlT1A3imO+PgEUuLf+/IqrknC2YO9Ouw=;
 b=bG9eFawA/MiBh1Ajgsjq8Jb319A0IeZOVL7YWEF+8upJj7Op3XKkQiR6LUOOYFeV
 pzz2evNRRJ4oXxegB4le1VP+rDitLomkFYl8tZ3m4WOd5+9DUBfR5Kd2Ez4A9wax
 DyPndqwcmtdP/b3WUT055Z2UscW58fs7smtY+GwGsnsIrYNKGcJMCLxKMzBCUU7k
 rHestxfq3/fEtn+o3KpY1gQ97Igkvt8gq5pvQttpLsB5f3cgrB0h9J9RdPOeMRmr
 O9FZSATzQzZF4Aepjn0sW7FM0tsqHW//ykdK4b4gI27+/WnJi0q22JTq2lpSB6Y8
 hOCec2Kz+PIKGrxqoPr4bg==;
X-AuditID: 8b5b014d-962f1700000067b6-37-60bdda6c6f6f
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 52.7F.26550.C6ADDB06; Mon,  7 Jun 2021 11:35:56 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 11:35:55 +0300
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
In-Reply-To: <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
Message-ID: <7347df23102503c77c5da10b48afcf9a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsXSHT1dWTfn1t4Eg2k3ZCyefJjIZnFvxTJ2
 ixd7G1ksjj/axWKxcvVRJotLX66xWHTs+spicXnXHDaLbZ9b2Cym7NvFZnHx13xGi+Z359gt
 tm5cx2jRNovfYtbi2+wW99edY7No2T+FxUHQ493vZYwe994+YfLYOesuu8eCTaUeDzddYvLY
 tKqTzWPnQ0uPX9uPMnlsXlLv8WLzTEaP3Tcb2Dze77vK5nGp+Tq7x+dNch7tB7qZAvijuGxS
 UnMyy1KL9O0SuDIevN7MXLCCr2LDk7usDYzruLsYOTkkBEwken4fYOxi5OIQEjjGKPF26kEW
 iISpxOy9nYwgNq+AoMTJmU/A4swCFhJTr+xnhLDlJZq3zmYGsVkEVCW27twOVsMmoCkx/xLE
 HBGgmt9HO1kh6j+zSvQ/4AWxhQVsJA5dWQ8W5xcQlvh09yKYzSkQKDFlyh92iIO2skg0HnrL
 BHGEi8S9Y5tYIY5Tkfjw+wFQEQeHKJC9ea7SBEbBWUhOnYXk1FlITl3AyLyKUSCxzFgvM7lY
 Ly2/qCRDL71oEyM4Zhl9dzDe3vxW7xAjEwfjIUYJDmYlEV4vmT0JQrwpiZVVqUX58UWlOanF
 hxilOViUxHl59SbECwmkJ5akZqemFqQWwWSZODilGpgM/5z/5q9dvOFa98sH4Voitq6Rgt8c
 v+z+EP/fZIswT8CPr6cL9zy+ItomO2HHdAt/1gKzIHOWb1ZR5glfUxNl/rXeChYS8ufz9TTb
 t/DJ7/VTw9oE3vWcsH7PaP3lyy6ru/xX3Lh5LHeZrSx2UVv+bN2iunVJfV8fdlvP2LtF7yBX
 2zP1xJj3wt0WU5inf11g6KNs+4Tb+epUx6qLW3/LHRU/+n3uHqHct7LX/oqv7rn2q7isZqIG
 c17cGbmPBU+nv5TYm/btnU/u/jOHezfGakt8DDlYufaK8+4Hf89Nmf38xol3/pM31UQlP/Y7
 Pyco/oZ4tZLPsYP/3PY90yheOH+l8fTs09PLz/Hd+FFyUImlOCPRUIu5qDgRABsgYjJIAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_013605_425559_0CF5AB36 
X-CRM114-Status: GOOD (  14.47  )
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

zqPPhM65z4IgMjAyMS0wNi0wNyAwNjoxOSwgR3VvIFJlbiDOrc6zz4HOsc+IzrU6Cj4+IFRoZSBD
LWJpdCB3YXMgcmVjZW50bHkgZHJvcHBlZCwgdGhlcmUgaXMgYSBuZXcgcHJvcG9zYWwgZm9yIFBh
Z2UgQmFzZWQKPj4gTWVtb3J5IEF0dHJpYnV0ZXMgKFBCTVQpIHRoYXQgd2UgY2FuIHdvcmsgb24g
LyBwdXNoIGZvci4KPiBDLWJpdCBzdGlsbCBuZWVkcyBkaXNjdXNzaW9uLCB3ZSBzaG91bGRuJ3Qg
ZHJvcCBpdCBkaXJlY3RseS4KPiAKCllvdSBjYW4gYWx3YXlzIHBhcnRpY2lwYXRlIG9uIHRoZSBk
aXNjdXNzaW9uIG9uIHZpcnRtZW0gbWFpbGluZyBsaXN0LgoKPiBSYWlzZSBhIHBhZ2UgZmF1bHQg
d29uJ3Qgc29sdmUgYW55dGhpbmcuIFdlIHN0aWxsIG5lZWQgYWNjZXNzIHRvIHRoZQo+IHBhZ2Ug
d2l0aCBwcm9wZXIgcGVyZm9ybWFuY2UuCj4gCgpUaGUgcG9pbnQgaXMgdGhhdCBmdXR1cmUgaHcg
aW1wbGVtZW50YXRpb25zIHdpbGwgYmUgcmVxdWlyZWQgdG8gcmV0dXJuIGEgCnBhZ2UgZmF1bHQg
aW4gY2FzZSB3ZSB0YW1wZXIgd2l0aCB0aG9zZSByZXNlcnZlZCBiaXRzLCB0aGV5IHdvbid0IGp1
c3QgCmlnbm9yZSB0aGVtLiBTdXBwb3J0aW5nIGN1c3RvbSB2YWx1ZXMgdGhlcmUgbWVhbnMgc3Vw
cG9ydGluZyAKbm9uLWNvbXBsaWFudCBpbXBsZW1lbnRhdGlvbnMuCgo+IAo+IFdlIG5lZWQgUFRF
cyB0byBwcm92aWRlIGEgbm9uLWNvaGVyZW5jeSBzb2x1dGlvbiwgYW5kIG9ubHkgQ01PCj4gaW5z
dHJ1Y3Rpb25zIGFyZSBub3QgZW5vdWdoLiBXZSBjYW4ndCBtb2RpZnkgc28gbWFueSBMaW51eCBk
cml2ZXJzIHRvCj4gZml0IGl0Lgo+IEZyb20gTGludXggbm9uLWNvaGVyZW5jeSB2aWV3LCB3ZSBu
ZWVkOgo+ICAtIE5vbi1jYWNoZSArIFN0cm9uZyBPcmRlciBQVEUgYXR0cmlidXRlcyB0byBkZWFs
IHdpdGggZHJpdmVycycgRE1BIAo+IGRlc2NyaXB0b3JzCj4gIC0gTm9uLWNhY2hlICsgd2VhayBv
cmRlciB0byBkZWFsIHdpdGggZnJhbWVidWZmZXIgZHJpdmVycwo+ICAtIENNTyBkbWFfc3luYyB0
byBzeW5jIGNhY2hlIHdpdGggRE1BIGRldmljZXMKPiAgLSBVc2Vyc3BhY2UgaWNhY2hlX3N5bmMg
c29sdXRpb24sIHdoaWNoIHByZXZlbnRzIGNhbGxzIHRvIFMtbW9kZSB3aXRoCj4gSVBJIGZlbmNl
LmkuIChOZWNlc3NhcnkgdG8gSklUIGphdmEgc2NlbmFyaW9zLikKPiAKPiBBbGwgYWJvdmUgYXJl
IG5vdCBpbiBzcGVjLCBidXQgdGhlIHJlYWwgY2hpcHMgYXJlIGRvbmUuCj4gKEFjdHVhbGx5LCB0
aGVzZSBoYXZlIGJlZW4gdGFsa2VkIGFib3V0IGZvciBtb3JlIHRoYW4gZml2ZSB5ZWFycywgd2UK
PiBzdGlsbCBoYXZlbid0IHRoZSB1bmlmb3JtIGlkZWEuKQo+IAo+IFRoZSBpZGVhIG9mIEMtYml0
IGlzIHJlYWxseSBpbXBvcnRhbnQgZm9yIHVzIHdoaWNoIHByZXZlbnRzIG91ciBjaGlwcwo+IHZp
b2xhdGVzIHRoZSBzcGVjLgoKSGF2ZSB5b3UgY2hlY2tlZCB0aGUgUEJNVCBwcm9wb3NhbCA/IEl0
IGRlZmluZXMgKHNvIGZhcikgdGhlIGZvbGxvd2luZyAKYXR0cmlidXRlcyB0aGF0IGNhbiBiZSBz
ZXQgb24gUFRFcyB0byBvdmVycmlkZSB0aGUgUE1BcyBvZiB0aGUgCnVuZGVybHlpbmcgcGh5c2lj
YWwgbWVtb3J5OgoKQml0cyBbNjI6NjFdCjAwIChXQikgLT4gQ2FjaGVhYmxlLCBkZWZhdWx0IG9y
ZGVyaW5nCjAxIChOQykgLT4gTm9uY2FjaGVhYmxlLCBkZWZhdWx0IG9yZGVyaW5nCjEwIChJTykg
LT4gTm9uY2FjaGVhYmxlLCBzdHJvbmcgb3JkZXJpbmcKClNvIGl0J2xsIGNvdmVyIHRoZSB1c2Ug
Y2FzZXMgeW91IG1lbnRpb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
