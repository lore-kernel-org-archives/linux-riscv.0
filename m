Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072C1C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 04:46:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABCE460E77
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 04:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABCE460E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTYdwCyUVn3VODADRE6r/iPTP4CsiIl+rKQ4viV928s=; b=eW8Mx1XwofotgF
	w/892poin6q+nTnKjpiaf59vUoUS9tBOBy9d6oRCDPDdqwLS8lnYcOF7Ub7soLLiZd8tcJmbH//aC
	gl14tNODJ9BWqSxSYlnCqGcED5IJ5ImIdVvH2uqwPZSNKvZ9Lz+p8l2otnQJsrMpkyQV3I8HjV9ig
	PdnDDSVgibgmXk4QqcrrWdQeOUVm7cSkzSMilGYFi1FEBYLhm3kL6wx94JRt84wy0xwln0jUHdYk8
	Pq61gyIvwNkdRNfeTIoMRK4MGRJ9w6Z6fzT9D1D0PXOE1nViOfIoxyKyduh3L+0BUt0ZPmDZHkdUJ
	bx1KieWzCA9jz01MOT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6n50-003P5h-E1; Fri, 23 Jul 2021 04:46:34 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6n4x-003P5I-3I
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 04:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=RmTFR5sHYq+p4KauoZP/+FHafSyPUXZ/4/
 /YrkOuHv4=; b=AuaH15T+Drpa92yftNj9Ipz3eeGHqMV0QiPOFACxcspsLszpUF
 2ULlnO22Qm3w+a758nws38HBc22FbjlIYt3xhoZzSdRUxhDaKn3jAqrEuwb5SAzu
 +r7Wqs8XLQKzS++dO9OSK4a9o1Qbx44q6lMHnb8dRuV+ozzygU6cUB7Qw=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygA3Pv6bSfpgdPkxAA--.1487S2; 
 Fri, 23 Jul 2021 12:46:19 +0800 (CST)
Date: Fri, 23 Jul 2021 12:40:25 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: tongtiangen <tongtiangen@huawei.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Atish Patra
 <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
Message-ID: <20210723124025.669cb4ec@xhacker>
In-Reply-To: <20210723122925.67a14562@xhacker>
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
 <20210722213724.1f12a0e7@xhacker> <87zguexslf.fsf@igel.home>
 <20210723075432.098634a2@xhacker>
 <52e3626a-2b40-bda6-de0e-68ea12a86dd9@huawei.com>
 <20210723122925.67a14562@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygA3Pv6bSfpgdPkxAA--.1487S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4DXw4rWF47JFykArWfAFb_yoW8ZrW5pF
 WUAa1akF4DJF1Ik3Z7Kw18Wa409Fs7A345Z3s5XF13AF9Yqa1rXr42gF45Ka47Gr13C3WY
 vr48KF97Ww45Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
 6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7y89DUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_214631_621923_70515BFA 
X-CRM114-Status: GOOD (  19.55  )
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

T24gRnJpLCAyMyBKdWwgMjAyMSAxMjoyOToyNSArMDgwMApKaXNoZW5nIFpoYW5nIDxqc3poYW5n
M0BtYWlsLnVzdGMuZWR1LmNuPiB3cm90ZToKCj4gT24gRnJpLCAyMyBKdWwgMjAyMSAwOTozNjo0
NyArMDgwMAo+IHRvbmd0aWFuZ2VuIDx0b25ndGlhbmdlbkBodWF3ZWkuY29tPiB3cm90ZToKPiAK
PiA+IE9uIDIwMjEvNy8yMyA3OjU0LCBKaXNoZW5nIFpoYW5nIHdyb3RlOiAgCj4gPiA+IE9uIFRo
dSwgMjIgSnVsIDIwMjEgMTc6NDI6NTIgKzAyMDAKPiA+ID4gQW5kcmVhcyBTY2h3YWIgPHNjaHdh
YkBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ICAgIAo+ID4gPj4gT24gSnVsIDIyIDIwMjEs
IEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+PiAgICAKPiA+ID4+PiBJIHRoaW5rIHdlIG5lZWQg
dG8gcGluIHRoZSBzdGFjayBiZWZvcmUgY2FsbGluZyBnZXRfd2NoYW4oKSwgY291bGQgeW91IHBs
ZWFzZQo+ID4gPj4+IHRyeSBiZWxvdyBwYXRjaD8gICAgCj4gPiA+Pgo+ID4gPj4gVGhhbmtzLCB0
aGlzIGZpeGVzIHRoZSBjcmFzaCBmb3IgbWUuCj4gPiA+Pgo+ID4gPj4gQW5kcmVhcy4KPiA+ID4+
ICAgIAo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHRlc3RpbmcuIEkgd2lsbCBzZW5kIG91dCBmb3Jt
YWwgcGF0Y2ggbGF0ZXIKPiA+ID4KPiA+ID4gVGhhbmtzCj4gPiA+Cj4gPiA+IC4KPiA+ID4gICAg
Cj4gPiAKPiA+IEhpIGFsbDoKPiA+IEkgdHJpZWQgdG8gcmVwcm9kdWNlZCB0aGlzIGNyYXNoIGlu
IG9wZW5TVVNFIGNvZGUgcmVwb++8iCAKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3VzZS9r
ZXJuZWwg77yJLCBidXQgbm90IHJlcHJvZHVjZWQgc3VjY2Vzc2Z1bGx5Lgo+ID4gCj4gPiAgRnJv
bSB0aGUgcGF0Y2ggb2YgcHJvYmxlbSByZXBhaXIsIHRoZSBjcmFzaCBpcyBkdWUgdG8gdGFzay0+
c3RhY2sgaXMgCj4gPiByZWxlYXNlZCBiZWZvcmUgY2FsbGluZyBnZXRfd2NoYW4sIHRoZSB0YXNr
IHN0YXRlIG9mIG1heWJlIFRBU0tfREVBRC4KPiA+IAo+ID4gVk1BUF9TVEFDSyBpcyB1c2VkIHRv
IGRldGVjdCBrZXJuZWwgc3RhY2sgb3ZlcmZsb3csIHRoZXJlIGlzIG5vIAo+ID4gY29ubmVjdGlv
biBiZXR3ZWVuIHRoZSB0d28sIGl0IG1ha2VzIG1lIGEgbGl0dGxlIGNvbmZ1c2VkLiAgCj4gCj4g
SSBiZWxpZXZlIHRoZSBidWcgZXhpc3RzIGZyb20gdGhlIGZpcnN0IGRheSBvZiByaXNjdiBtYWlu
bGluZWQuCj4gCj4gU2luY2UgVEhSRUFEX0lORk9fSU5fVEFTSz15IGluIHJpc2N2LCBzbyB3aGVu
IHRhc2sgc3RhY2sgY2FuIGJlIGZyZWVkCj4gYmVmb3JlIGJlaW5nIGRlc3Ryb3llZC4KCnR5cG86
IHRhc2sgc3RhY2sgY2FuIGJlIGZyZWVkIGJlZm9yZSB0YXNrIGlzIGRlc3Ryb3llZAoKPiAKPiBX
aGVuIFZNQVBfU1RBQ0s9biwgdGFzaydzIHN0YWNrIGlzIGFsbG9jYXRlZCBmcm9tIGxpbmVhciBt
YXBwaW5nLiBXaGVuCj4gdGFzayBzdGFjayBpcyBmcmVlZCwgdGhlIGNvcnJlc3BvbmRpbmcgbWFw
cGluZyBzdGlsbCBleGlzdHMsIGFuZCBzaW5jZQo+IGdldF93Y2hhbigpIG9ubHkgcmVhZCwgbm8g
aGFybSBpcyBvYnNlcnZlZCBzbyBmYXIuCj4gCj4gV2hlbiBWTUFQX1NUQUNLPXksIHRhc2sncyBz
dGFjayBpcyBhbGxvY2F0ZWQgZnJvbSB2bWFsbG9jIGFyZWEuIFdoZW4KPiB0YXNrIHN0YWNrIGlz
IGZyZWVkLCB0aGUgY29ycmVzcG9uZGluZyBtYXBwaW5nIG1heSBub3QgZXhpc3QsIHNvIEkgZXhw
ZWN0Cj4gTU1VIGZhdWx0IGhlcmUsIHRodXMgdGhlIGtlcm5lbCBwYW5pYy4KPiAKPiBJbiBzdW1t
YXJ5LCB0aGUgYnVnIGlzbid0IHJlbGF0ZWQgd2l0aCBWTUFQX1NUQUNLLCBidXQgVk1BUF9TVEFD
SyBtYWtlcwo+IHRoZSBidWcgb2JzZXJ2YWJsZS4KPiAKPiBUaGFua3MKPiAKPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
