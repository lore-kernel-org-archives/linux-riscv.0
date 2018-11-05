Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CD2ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 09:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622F420854
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 09:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdYRYi4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622F420854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkNmCECM6QiTRSqLIkv4SQNlvajsGDaVb0L8Rts33Ro=; b=jdYRYi4O4miLXX
	dp+DqMYNEzrAWq35+pW8hjo+aqbioGfCkObpbMCtnqmnvIuC5tzwcXK/ErZ/uX9eNbodzbcUeR+7+
	rw6aSK1hxLDLah9moG6HMs4H3uIW9lvYO88xZ+kIdr0t73qYu5fGHEkC+lqfLeivCLgWpkpHzOfzM
	23M7eAfDAyc1QQO1QLxYBbKGDv4ikXzDKLpCO0sbmGLiroFlwggpzOF7FOY1ZeO7ot0Az/8hs7VA1
	UZSVMC4ebZLWXeSnhZiE6cN2HbJ9Ot26PeKMZqN5tI+mSAXiZberYd2/w3J3uFq83ndeaFnD8fG6N
	SIGCPZpVQiUTHCzdZZFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJasQ-0004D1-JO; Mon, 05 Nov 2018 09:08:54 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gJasO-0004CY-CL; Mon, 05 Nov 2018 09:08:52 +0000
Date: Mon, 5 Nov 2018 01:08:52 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181105090852.GA14924@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Vincent Chen <vincentc@andestech.com>, aou@eecs.berkeley.edu,
 alankao@andestech.com, greentime@andestech.com, zong@andestech.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, kito@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105090852.LoXeXNvbShr2p5gHIYWw-yAx9OkCw50UFRrAFRDhzeA@z>

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDk6NTI6NTJBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiA+IEkgZnVuZGFtZW50YWxseSBkaXNhZ3JlZSB3aXRoIHRoaXPigKYgYW5kIHRoaW5r
IGl0IHNob3VsZCBiZSB0aGUgY29udHJhcnkuCj4gPgo+ID4gMS4gVGhlIGtlcm5lbCBzaGFsbCBz
dXBwb3J0IG5vIHZlbmRvciBzcGVjaWZpYyBpbnN0cnVjdGlvbnMgd2hhdHNvZXZlciwKPiA+IHBl
cmlvZC4KPiAKPiBJIHRoaW5rIHdoYXQgd2FzIG1lYW50IGFib3ZlIGlzCj4gCj4gMS4gSWYgYSB2
ZW5kb3IgZXh0ZW5zaW9uIHJlcXVpcmVzIGtlcm5lbCBzdXBwb3J0LCB0aGF0IHN1cHBvcnQKPiBt
dXN0IGJlIGFibGUgdG8gYmUgYnVpbHQgaW50byBhIGtlcm5lbCBpbWFnZSB3aXRob3V0IGJyZWFr
aW5nIHN1cHBvcnQKPiBmb3IgQ1BVcyB0aGF0IGRvIG5vdCBoYXZlIHRoYXQgZXh0ZW5zaW9uLCB0
byBhbGxvdyBidWlsZGluZyBhIHNpbmdsZQo+IGtlcm5lbCBpbWFnZSB0aGF0IHdvcmtzIG9uIGFs
bCBDUFVzLgoKTm8uICBUaGlzIGxpdGVyYWxseSBtZWFucyBubyB2ZW5kb3IgZXh0ZW5zaW9ucyBp
bnZvbHZpbmcgaW5zdHJ1Y3Rpb25zCm9yIENTUnMgaW4gdGhlIGtlcm5lbC4gIFRoZXkgYXJlIGZp
bmUgZm9yIHVzZXJzcGFjZSwgb3IgZm9yIHRoZSBNLW1vZGUKY29kZSBpbmNsdWRpbmcgaW1wZW1l
bnRhdGlvbiBvZiB0aGUgU0JJLCBidXQgbm90IGZvciB0aGUga2VybmVsLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
