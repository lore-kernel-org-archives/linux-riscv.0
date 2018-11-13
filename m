Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE287C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 01:23:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC852245E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 01:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HaiU6qjL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VTlRQnBE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="Roe6Vvbg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC852245E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-id:Date:
	In-reply-to:From:Subject:MIME-version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQvjCYvtHJPdwaVRyrsn3f32LVCHKbAMj9r/TP7L4kw=; b=HaiU6qjLwK/BbW
	2/Qn0oPqcWZ7aLBAjUAp0tPj2E9dyDtxbk/FL7BO79T2FV5MmrZhSpj1+z5/qr8zAnp/QHgelSTRQ
	eHUwa6t8lcrsMs9gANyDrLKZ1938vxuhktAD2u8a10weA88+pbUQQyDvc+WtikG351M1t9JPr5X7+
	hiwMV9wRo05FIEXcC+kfDln/ClwOIquQEgAWT6QhdiBSn251Ubee5fDnFhHXvJ5FuTAz9IJR6UWpR
	wE/fGiITTYhH/rnRJ15qIVxoqz33lw/Ltbz8HXxHT9x/5aLO6XOi7Peg2YM4NJql2CRb8a5bOGwKG
	9R8XI4IPU3IKcLf+7NWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMNQA-0000Cf-Qa; Tue, 13 Nov 2018 01:23:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMNQ4-0000BK-U3
 for linux-riscv@bombadil.infradead.org; Tue, 13 Nov 2018 01:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:References:Message-id:
 Content-transfer-encoding:Cc:Date:In-reply-to:From:Subject:MIME-version:
 Content-type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zg7Yj/h/pkupKwFF5oGH9XVJgOIIwbP44xmqDwV6Ki0=; b=VTlRQnBES7gm/8YqktdHD1kKl
 ifkQndbD71TLIdx0PYiCs/25MnJHAVk38HPZCWvzSA0NYBxsWG2YYvsjL8rzW3lHZ3AulKKanglWB
 /BJoTHQ+fYjvB8Bhq5PBbucpaff/lMcotnH4K8GpKuqi115XyOJQuPuALNGVnBt1a5igPbfujApiq
 gBdFrO4PxbxPJStEdXuChNEKaHQsQ/YcKE+6dpT760dpK6bQoFzWg5Hq+A3ECxktaBnAjpxPc5tmy
 tRBSmCf4QESoA4ZnhASrCxjr7fhwJjwrdiXpjU2Pn1voYIo/4KxUQ5N8WxKGS7ay842bWalq9ah8o
 Zksjy8WRg==;
Received: from st13p15im-asmtp003.me.com ([17.164.72.57])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMNQ0-0001RL-Lr
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 01:23:06 +0000
Received: from process-dkim-sign-daemon.st13p15im-asmtp003.me.com by
 st13p15im-asmtp003.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) id <0PI301C00YE1MM00@st13p15im-asmtp003.me.com> for
 linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 01:22:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1542072169; bh=zg7Yj/h/pkupKwFF5oGH9XVJgOIIwbP44xmqDwV6Ki0=;
 h=Content-type:MIME-version:Subject:From:Date:Message-id:To;
 b=Roe6VvbgK0mQYs1dP2571qVKmqJEGkZFYXXTe+df/G7kewp9lXzHxZIL0JfxVkXCi
 lSL/XMMC0+hwb2bl/cTZNhCG6pEjUySJ6dlbOcbCNbRUIogQfOo9s+3MnfJ8pLw+6p
 Sa0y6t0J8lYSdAHFUi4j9A0fgsobwXEkxAVKRl2jWDl4967Ef58p5LcSMpUJG5QCUW
 W/utaSGTxQmiG/feqHTyKoSxdH2v5qxKgZT3OQ+jxbBGfnVCqC8Wao7SoBpu2F5GTA
 Mq8UOwaO5ype35kZ9/stkRvEwKQzd61R/hA/kYV4i3C0mOymKoh44yeYt0dSCiACkm
 Grp9ecp97FoQg==
Received: from icloud.com ([127.0.0.1]) by st13p15im-asmtp003.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) with ESMTPSA id <0PI300U6XYHVRN40@st13p15im-asmtp003.me.com>; Tue,
 13 Nov 2018 01:22:47 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1811130011
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2018-11-12_16:,, signatures=0
MIME-version: 1.0 (1.0)
Subject: Re: [sw-dev] SBI extension proposal v2
From: Michael Clark <michaeljclark@mac.com>
X-Mailer: iPhone Mail (16B93)
In-reply-to: <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
Date: Tue, 13 Nov 2018 14:22:42 +1300
Message-id: <36B37F85-C952-4D2E-912C-B2BDA34430DA@mac.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_012304_803511_620F52FC 
X-CRM114-Status: GOOD (  29.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, mick@ics.forth.gr,
 sw-dev@groups.riscv.org, paul.walmsley@sifive.com,
 Olof Johansson <olof@lixom.net>, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113012242.QrsA4D_wTpm53hkzReNpAqCwVVG_FVftYMmPZdxkNaA@z>

Cgo+PiBPbiAxMS8xMS8yMDE4LCBhdCA2OjQ3IEFNLCBMdWtlIEtlbm5ldGggQ2Fzc29uIExlaWdo
dG9uIDxsa2NsQGxrY2wubmV0PiB3cm90ZToKPj4gCj4+IE9uIFNhdCwgTm92IDEwLCAyMDE4IGF0
IDU6NDIgUE0gT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4b20ubmV0PiB3cm90ZToKPj4gCj4+IFRo
ZSBjYXNlIG9mIGNvbnNvbGUgaXMgaW4gdGhpcyBjYXNlIHByZXR0eSBzaW1wbGU6IEl0J3MgaW50
ZW5kZWQgZm9yCj4+IGVhcmx5IGJvb3QgZm9yIHZlcnkgc2ltcGxpc3RpYyBlbnZpcm9ubWVudHMg
KGJlZm9yZSB0aGUgcmVzdCBvZiB0aGUKPj4ga2VybmVsIGlzIHVwLCBldGMpLiBLZWVwaW5nIHRo
ZSBTQkkgY29uc29sZSBhcm91bmQgYmV5b25kIGVhcmx5IGJvb3QsCj4+IGFuZCBzb21laG93IHRy
eWluZyB0byBvcHRpbWl6ZSBmb3IgaXQgZm9yIHRob3NlIHVzZSBjYXNlcyBpcyBhCj4+IG1pc2Rp
cmVjdGVkIGVmZm9ydDsgdGhhdCdzIHdoYXQgbmF0aXZlIGRyaXZlcnMgYXJlIGZvci4KPiAKPiBz
cGlrZSAod2hpY2ggaXMgb25seSBhcm91bmQgNywwMDAgbGluZXMgb2YgY29kZSkgZG9lc24ndCBo
YXZlIG5hdGl2ZQo+IGRyaXZlcnMsIGFuZCBxZW11IGlzIHRvbyBoZWF2eS1kdXR5IHRvIGNvbnNp
ZGVyIGFkZGluZyBjdXN0b20KPiBleHRlbnNpb25zIGFuZCBleHBlcmltZW50YWwgcmVzZWFyY2gg
b250by4KCk5laXRoZXIgb2YgdGhvc2Ugc3RhdGVtZW50cyBhcmUgY29tcGxldGVseSB0cnVlLiBT
cGlrZSBjYW4gaGF2ZSBpdHMgaGFyZHdhcmUgZW11bGF0aW9uIGNhcGFiaWxpdGllcyBleHBhbmRl
ZCBhbmQgUUVNVSBpcyBub3QgdW5zdWl0YWJsZSBmb3IgZXhwZXJpbWVudGFsIHJlc2VhcmNoLiBG
b3IgZXhhbXBsZSwgd2UgaGF2ZSBiZWVuIGRldmVsb3BpbmcgdGhlIENMSUMgaW50ZXJydXB0IGNv
bnRyb2xsZXIgbW9kZWwgaW4gUUVNVS4KCldlIGFsc28gY291bGQgcG9ydCBWaXJ0SU8gZnJvbSBS
SVNDVkVNVSB0byBzcGlrZS4gSXQgd291bGQgYmUgbmljZSB0byBhZGQgdGhlIFBMSUMsIENMSUMg
YW5kIGFuIE5TMTY1NTBBIFVBUlQgdG8gc3Bpa2Ugc28gd2UgY2FuIG1vZGVsIHRoZSBSSVNDLVYg
4oCcdmlydOKAnSBtYWNoaW5lIHRoYXQgaXMgY3VycmVudGx5IGluIFFFTVUuCgpUaGF0IHNhaWQs
IHlvdSBhcmUgcHJvYmFibHkgY29ycmVjdC4gQSBzaW11bGF0b3IgbGlrZSBzcGlrZSBtYWtlcyBh
IGxpdHRsZSBtb3JlIHNlbnNlIGZvciBldm9sdmluZyB0aGUgaGFyZHdhcmUgbW9kZWxzIHZlcnN1
cyBhIGhlYXZ5LXdlaWdodCBmYXN0LW1vZGVsIGVtdWxhdG9yIGxpa2UgUUVNVS4KCj4gd2l0aCBu
b3RoaW5nIGluIHNwaWtlICpvdGhlciogdGhhbiB0aGUgc2VyaWFsIGNvbnNvbGUsIGl0J3MgdGhl
IG9ubHkKPiB3YXkgaW4gYW5kIG91dC4KClRoYXTigJlzIGxpa2VseSB0byBjaGFuZ2UuCgpUaGVy
ZSBpcyBiYXJlIG1ldGFsIGNvZGUgaW4gQkJMIHRvIHN1cHBvcnQgc2V2ZXJhbCBjb25zb2xlIHR5
cGVzIChIVElGLCBTaUZpdmUgVUFSVCwgTlMxNjU1MEEpLiBBbGwgb2YgdGhlc2UgZXhjZXB0IGZv
ciBIVElGIGhhdmUga2VybmVsIGRldmljZSBkcml2ZXJzLiBUaGUgbWFpbiByZWFzb24gZm9yIHRo
ZSBTQkkgY29uc29sZSBpcyB0byBiZSB1c2VkIGFzIGEgYnJpbmctdXAgY29uc29sZSBiZWZvcmUg
ZnVsbCBkZXZpY2UgZHJpdmVycyBoYXZlIGJlZW4gZGV2ZWxvcGVkIGFuZCBmb3Igc2ltdWxhdGlv
biB1c2UtY2FzZXMgKHJ1bm5pbmcgTGludXggaW4gc3Bpa2UgYW5kIEhETCBzaW11bGF0b3JzKS4K
ClNwaWtlIGN1cnJlbnRseSByZWxpZXMgb24gSFRJRiBmb3IgY29uc29sZSBhbmQgSFRJRiBpcyBu
b3QgYXBwcm9wcmlhdGUgYXMgYSBrZXJuZWwgZGV2aWNlIGludGVyZmFjZS4gSFRJRiBpcyBkZXNp
Z25lZCBmb3IgdGV0aGVyZWQgc2ltdWxhdGlvbiBhcyBpdCByZWxpZXMgb24gYSBmcm9udC1lbmQg
ZmluZGluZyBzcGVjaWFsIEVMRiBzeW1ib2xzIHVzZWQgZm9yIGhvc3QgPC0+IHRhcmdldCBjb21t
dW5pY2F0aW9ucy4KCkEgcG9sbGVkLW1vZGUgY29uc29sZSBpbnRlcmZhY2UgaXMgZmluZSBmb3Ig
ZGVidWcgYnV0IG5vdCBhcHByb3ByaWF0ZSBmb3IgcnVubmluZyBzb21ldGhpbmcgbGlrZSBwcHBk
LiBBZGRpbmcgYSB0dHkgbGF5ZXIgKHNiaV9pb2N0bCkgdG8gU0JJIGlzIG5vdCBhIGdvb2QgaWRl
YS4gTm90ZTogYW4gYWN0dWFsIHNlcmlhbCBpbnRlcmZhY2UgaGFzIHNldmVyYWwgb3V0LW9mLWJh
bmQgaW50ZXJmYWNlIHRvIGNoZWNrIGxpbmsgc3RhdHVzIGFuZCBzZXQgYmF1ZCByYXRlcywgZXRj
IChhcyBkbyB0aGUgc2ltcGxlIFNCSSBkcml2ZXJzIHdoaWNoIGhhdmUgdGhlc2UgZGV0YWlscyBo
YXJkY29kZWQpLiBJdOKAmXMgYSBzaW1wbGUgYm9vdCBjb25zb2xlLgoKQXBvbG9naWVzIEx1a2Us
IHRoaXMgaXMgbm90IGRpcmVjdGVkIGF0IHlvdSwgcmF0aGVyIGl0IGlzIGRpcmVjdGVkIGF0IFNC
SS4KCkkgdGhpbmsgd2Ugc2hvdWxkIHNlcmlvdXNseSBxdWVzdGlvbiBhbnkgaW50ZXJmYWNlIHdl
IGFkZCB0byBTQkkuCgotIE1ha2luZyBTQkkgYSBsaWJyYXJ5IEFQSSBpcyBhbiBpbnZpdGF0aW9u
IGZvciBiaW5hcnkgYmxvYnMuIEl0IHNob3VsZCByZW1haW4gYW4gRUNBTEwgaW50ZXJmYWNlIHRv
IGZpbGwgaW4gcHJpdmlsZWdlIGJvdW5kYXJ5IHZpcnR1YWxpemF0aW9uIGdhcHMgaS5lLiBmdW5j
dGlvbnMgdGhhdCByZXF1aXJlIE0tbW9kZSBwcml2aWxlZ2VzLiBJdCBjYW7igJl0IG9yIHNob3Vs
ZG7igJl0IGRvIHRoaXMgaWYgaXQgaXMgbGlua2VkIHRvIHRoZSBrZXJuZWwgYXMgYSBsaWJyYXJ5
LiBJbiB0aGUgY2FzZSBpdCB3ZXJlIGEgbGlicmFyeSB0aGUgcXVlc3Rpb24gaXMgd2h5IG5vdCBq
dXN0IGRvY3VtZW50IHRoZSBoYXJkd2FyZSBpbnRlcmZhY2UgYW5kIGFkZCBhIGRyaXZlciB0byB0
aGUga2VybmVsLiBGb3IgYW55dGhpbmcgZWxzZSwgc3VjaCBhcyBmb3IgdmlydHVhbGl6YXRpb247
IHdlIHNob3VsZCBtaW5pbWl6ZSBhZGRyZXNzIHNwYWNlIGZvb3RwcmludCBmb3IgYW55dGhpbmcg
dGhhdCBpcyBub3QgYSBkZXZpY2UuIE90aGVyd2lzZSB3ZSBzaG91bGQgc3BlbmQgZWZmb3J0IG9u
IGRlZmluaW5nIHN0YW5kYXJkIGhhcmR3YXJlIGludGVyZmFjZXMgc3VjaCBhcyB2aXJ0dWFsaXph
YmxlIGludGVycnVwdCBjb250cm9sbGVycyBvciBQTVVzLgoKLSBTQkkgc2hvdWxkbuKAmXQgYmUg
dXNlZCBhcyBhIHdyYXBwZXIgdG8gaGlkZSAoYXMgeWV0IHVuc3BlY2lmaWVkKSBoYXJkd2FyZSBp
bnRlcmZhY2VzIGZyb20gdGhlIGtlcm5lbC4gaS5lLiBmb3IgZXhhbXBsZSB0byBoaWRlIGEgZGV2
aWNlIGFwZXJ0dXJlIHRoYXQgY29udGFpbnMgY29uZmlndXJhdGlvbiBmb3IgYm90aCBNLW1vZGUg
YW5kIFMtbW9kZSBpbnRlcnJ1cHRzIG9yIGFuIGludGVyZmFjZSBmb3IgYSBmdW5jdGlvbiB0aGF0
IHdlIGRvbuKAmXQgeWV0IGhhdmUgaGFyZHdhcmUgZm9yLiBJdOKAmXMgZXF1YWxseSBwb3NzaWJs
ZSB0aGF0IHdlIGNhbiBtYWtlIGJhZCBzb2Z0d2FyZSBpbnRlcmZhY2VzLgoKVGhlcmUgYXJlIHNv
bWUgcG9pbnRzIHVwIGZvciBkaXNjdXNzaW9uIHJlZ2FyZHMgSEFMcy4KClRoZXJlIGlzIGEgcHJp
bmNpcGxlIHRoYXQgZnVuY3Rpb25zIHRoYXQgaGF2ZSB0eXBpY2FsbHkgYmVlbiBkb25lIGluIGhh
cmR3YXJlIGNhbiBiZSBzaW1wbGlmaWVkIGlmIGNlcnRhaW4gYXNwZWN0cyBhcmUgZGV2b2x2ZWQg
dG8gc29mdHdhcmUuIFRoaXMgaXMgdmFsaWQuCgpXZSBoYXZlIHRoaXMgd2l0aCBTLW1vZGUgdGlt
ZXIgYW5kIHNvZnR3YXJlIGludGVycnVwdHMgd2hpY2ggcHJlc2VudGx5IGFyZSBkZWxlZ2F0ZWQg
YnkgdGhlIG1vbml0b3Igd2hvIGltcGxlbWVudHMgdGhlIFNCSSBpbnRlcmZhY2UgdG8gY29uZmln
dXJlIG9yIGluaXRpYXRlIHRoZW0uIFRoaXMgaXMgbm90IHN0cmljdGx5IGJlY2F1c2Ugd2UgZG9u
4oCZdCB3YW50IHRvIGV4cG9zZSB0aGUgaGFyZHdhcmUgdG8gTGludXggaS5lLiB3aHkgbm90IGp1
c3Qgd3JpdGUgYSBkcml2ZXIgaW4gTGludXg/IFNCSSBpcyByZXF1aXJlZCBoZXJlIGJlY2F1c2Ug
dGhlc2UgZnVuY3Rpb25zIHdlcmUgaW5pdGlhbGx5IG9ubHkgYWJsZSB0byBiZSBleGVjdXRlZCBp
biBNLW1vZGUgYW5kIGl0IHdvdWxkIHZpb2xhdGUgYSBwcml2aWxlZ2UgYm91bmRhcnkgZm9yIExp
bnV4IHRvIHJ1biB0aGVpciBjb2RlIGFzIExpbnV4IGlzIGEgU3VwZXJ2aXNvci4gaS5lLiB0aGVy
ZSB3YXMgbm8gZGlyZWN0IGludGVyZmFjZSBmb3IgUy1tb2RlIHRvIGNvbmZpZ3VyZSBvciBpbml0
aWF0ZSBzb2Z0d2FyZSBvciB0aW1lciBpbnRlcnJ1cHRzLgoKSSB0aGluayB0aGUgYmVzdCBhcHBy
b2FjaCBpcyBmb3IgZm9sayB0byBzaGFyZSB0aGVpciBoYXJkd2FyZSBpbnRlcmZhY2VzIGFuZCBl
eHBsb3JlIGFwcHJvYWNoZXMgdGhhdCBhbGxvdyBTLW1vZGUgdG8gb3BlcmF0ZSBhdXRvbm9tb3Vz
bHkgd2hldGhlciBNLW1vZGUgZXhpc3RzIG9yIG5vdC4gSS5lLiBzb21lIG1vZGVscyBtYXkgcmVx
dWlyZSBNLW1vZGUsIGFuZCBzb21lIG1vZGVscyBtYXkgc3VwcG9ydCBmdWxseSBhdXRvbm9tb3Vz
IFMtbW9kZSAodGhlIG9ubHkgTS1tb2RlIGZ1bmN0aW9uIHRoYXQgZXhpc3RzIGlzIHJ1bm5pbmcg
b24gYW5vdGhlciBjb3JlKS4gZS5nLiBSZWFsLXRpbWUuCgpPZiBjb3Vyc2UgdmlydHVhbGl6YXRp
b24gYW5kIHJlYWwtdGltZSBjYW4gYmUgY29tYmluZWQgaWYgdGhlIE0tbW9kZSBjb3JlIGNhbiBj
b250cm9sIGludGVycnVwdCByb3V0aW5nIHRhYmxlcyBvbiBiZWhhbGYgb2YgdGhlIHJ1bm5pbmcg
U3VwZXJ2aXNvcnMuIFdlIGNvdWxkIGhhdmUgbXVsdGlwbGUgUlRPUyBydW5uaW5nIHdpdGggU3Vw
ZXJ2aXNvcnMgdGhhdCBoYXZlIHByZS1lbXB0YWJsZSBVc2VyIHRhc2tzIGFuZCB0aGUgdmlydHVh
bCBkb21haW5zIG5ldmVyIG5lZWQgdG8gZW50ZXIgTS1tb2RlLCBleGNlcHQgcGVyaGFwcyBmb3Ig
cG93ZXIgb24gYW5kIHBvd2VyIG9mZi4gTWF5YmUgcG93ZXIgbWFuYWdlbWVudCBpcyBpbiBzY29w
ZS4gT25lIHNob3VsZCBwcm9iYWJseSBjaGF0IHRvIExpbnVzIGFib3V0IHdoYXQgaGXigJlkIGxp
a2UgdG8gc2VlLi4uIHBvc3NpYmx5IG5vdCBhbiBpbi1rZXJuZWwgYnl0ZS1jb2RlIGludGVycHJl
dGVyLi4uCgoKQlRXIFBsZWFzZSBkbyBub3Qgc3dlYXIgb24gdGhlIGxpc3QuIEFsZXgsIEJydWNl
LCBteXNlbGYgYW5kIHRoZSBvdGhlciBwb3N0ZXJzIGhhdmUgbm90IHdyaXR0ZW4gYW55dGhpbmcg
dGhhdCB3YXJyYW50cyBzd2VhcmluZyBhdCB1cy4gTWFueSBmb2xrIGhhdmUgYmVlbiB3b3JraW5n
IGF3YXkgcXVpZXRseSBpbiB0aGUgb3BlbiBhbmQgdGhlIG1lc3NhZ2VzIHRvIHRoZSBjb250cmFy
eSBhcmUgY29tcGxldGVseSB1bmZvdW5kZWQuIEFueXdheSB0aGlzIGdvZXMgd2l0aG91dCBzYXlp
bmcuIFRoZXJlIGlzIG9ubHkgb25lIHBlcnNvbiBzd2VhcmluZyBhbmQgc2hvdXRpbmcgb24gdGhp
cyBsaXN0LgoKTHVrZSwgeW91IGFyZSBpbmNvcnJpZ2libGUuIFdoZXRoZXIgeW91IGFyZSBhIGJ1
bGx5IG9yIG5vdCBpcyBuZWl0aGVyIGhlcmUgbm9yIHRoZXJlLiBZb3VyIGJlaGF2aW91ciBvbiB0
aGlzIG1haWxpbmcgbGlzdCBpcyBub3QgYWNjZXB0YWJsZS4gVHJ5IG5vIHNob3V0aW5nIG9yIHN3
ZWFyaW5nLiBNYW55IGhhdmUgYWR2aXNlZCB0aGlzIGJlZm9yZSBidXQgdGhlcmUgaGFzIGJlZW4g
bm8gY2hhbmdlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
