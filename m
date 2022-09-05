Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110ABECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5XvaqPVwieZ0RjpX+GLB0woG0a+1ASYhgIE+M1i8uA=; b=OClXbqq9fYi3Ov
	PjAuAblgxW+TX1BpcHPT7TrbibBqbIMQhvNFyIhLtSNmdY8woxEpuF+cenvLSYbudxcOUL3xNI9pr
	qrP7tNdlpDDYslaS4jDWZrSq328a1Qb3jBf1nkRR4/iDSU+Vwu5jXscTtKaxa/4wYxR/M2ib0K5Cg
	QY+lL3aMngmZdgZyg7rYi7xh8VDfESR1zz8KZ2wgH6tanFkFegt6KPNsHnYleB7rIGvpf7k2btkRa
	Yt+z7h6u1qnsCkwuiFQOecM27EsFjJ7mAAmJsE/VpnUlM5EGfm8YiQO+jYtcQoyT1g/IJXEjRFRnp
	yatnrv4vjRu8tmHQH+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGgZ-008Hp3-4P; Mon, 05 Sep 2022 18:19:03 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCo3-004BG2-Sk; Mon, 05 Sep 2022 14:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/Fb6qAPo+ABGbsqwCTtye8XpWD9y/L3upb+3j6p6Opk=; b=mPzDFjsA5USnBMHB0/w9dpRuKg
	fCYhUsZO9GJ5QnEm4pZIwyLAQjCbDA4momS+ZmiK0tJVnEpu2dsI6BqgelSzEQkO1lQVmQyrHlaVY
	nZm+6x41H9GNLyenoXg+IHGs0HbKDIQvO7qg1WnM7wNMUDsHvPqE9gV/tT8q2kb49x8n0eGu7d1hD
	iZf0x7TClJmZWDkaofKKEexNztPLhnpO7IjhZFCyB4hRD3JDNucADOOt6lnrRC1F+8w1bqSYGNxqu
	KL0JZvr8SmfFJQVybE6dRIhzUCP2TlPBHkcHNzZj/h2dmQBOYxVSoQt/JkmP1gQCC3VJWIXokk/Tb
	duVV6CJg==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVBp4-009drZ-6P; Mon, 05 Sep 2022 13:07:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3B0B4B81151;
	Mon,  5 Sep 2022 13:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6BBC433D6;
	Mon,  5 Sep 2022 13:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662383244;
	bh=7g8Fl87EiIp0MAGm2fwDOr/M7eySmwTBGpTA8Hg0++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaU9odUXlZlOd8u9PAlqDRvhOHq3qcUmnL8iqNaA4dtLhcqMyMyve+QOtg94AVHmI
	 bvshf8Ju+nL5NnLa4jx8j99rwxheJ3d2Rg45gZyeSZ/pxLYJ/Q6yVWnJgC3fGBaMiY
	 SnOGn1OFB5TD6B4UR9L6qFjK5GFSQLkt/vUIxMKoovZ+VrS8Dh9IMMTA3F2ZJzkBqe
	 6ACcQz9MMpK9iQEidp7N5y0Ow+WI9wPO4Eiw8Dr+frDwnLm6Jk27PpOtpSvItbJwtB
	 NlkwBcQfz16+Gd9c7MFj+rcz3SjdVV7KR791+zKZeHubDrwSBBCCOvrODXToO6yP70
	 /Zn3E9RPQ94sA==
Date: Mon, 5 Sep 2022 20:58:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] riscv: add lazy preempt support
Message-ID: <YxXyW18HtN6alf1E@xhacker>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <20220831175920.2806-5-jszhang@kernel.org>
 <CAJF2gTQMM50TZZ95XOY+Rgvm2hZ3nLxkYfaSW_2MvPiJeqTtJw@mail.gmail.com>
 <YxWYh5C5swlyobi2@linutronix.de>
 <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR=Cmcox5JrX2bB12MdmurY3vexSA6vw1cdXXbCNB8tXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_140730_372051_477584CE 
X-CRM114-Status: GOOD (  22.77  )
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

T24gTW9uLCBTZXAgMDUsIDIwMjIgYXQgMDQ6MzM6NTRQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIFNlcCA1LCAyMDIyIGF0IDI6MzQgUE0gU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lv
cgo+IDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjItMDktMDQg
MjM6MTY6MTIgWyswODAwXSwgR3VvIFJlbiB3cm90ZToKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiA+ID4g
PiBpbmRleCBiOWVkYTNmY2JkNmQuLjU5NTEwMGE0YzJjNyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUwo+ID4gPiA+IEBAIC0zNjEsOSArMzYxLDE0IEBAIHJlc3RvcmVfYWxsOgo+ID4gPiA+
ICByZXN1bWVfa2VybmVsOgo+ID4gPiA+ICAgICAgICAgUkVHX0wgczAsIFRBU0tfVElfUFJFRU1Q
VF9DT1VOVCh0cCkKPiA+ID4gPiAgICAgICAgIGJuZXogczAsIHJlc3RvcmVfYWxsCj4gPiA+ID4g
LSAgICAgICBSRUdfTCBzMCwgVEFTS19USV9GTEFHUyh0cCkKPiA+ID4gPiAtICAgICAgIGFuZGkg
czAsIHMwLCBfVElGX05FRURfUkVTQ0hFRAo+ID4gPiA+ICsgICAgICAgUkVHX0wgczEsIFRBU0tf
VElfRkxBR1ModHApCj4gPiA+ID4gKyAgICAgICBhbmRpIHMwLCBzMSwgX1RJRl9ORUVEX1JFU0NI
RUQKPiA+ID4gPiArICAgICAgIGJuZXogczAsIDFmCj4gPiA+ID4gKyAgICAgICBSRUdfTCBzMCwg
VEFTS19USV9QUkVFTVBUX0xBWllfQ09VTlQodHApCj4gPiA+ID4gKyAgICAgICBibmV6IHMwLCBy
ZXN0b3JlX2FsbAo+ID4gPiA+ICsgICAgICAgYW5kaSBzMCwgczEsIF9USUZfTkVFRF9SRVNDSEVE
X0xBWlkKPiA+ID4gQ2FuIHlvdSB0ZWxsIG1lLCB3aG8gaW5jcmVhc2VkL2RlY3JlYXNlZCB0aGUg
UFJFRU1QVF9MQVpZX0NPVU5UPyBBbmQKPiA+ID4gd2hvIHNldCBORUVEX1JFU0NIRURfTEFaWT8K
PiA+Cj4gPiBUaGVyZSBpcyAiZ2VuZXJpYyIgY29kZSBpbiB0aGUgUFJFRU1QVF9SVCBwYXRjaCBk
b2luZyB0aGF0LiBUaGUgY291bnRlcgo+ID4gaXMgaW5jcmVtZW50ZWQvIGRlY3JlbWVudGVkIHZp
YSBwcmVlbXB0X2xhenlfZW5hYmxlKCkvZGlzYWJsZSgpIGFuZCBvbmUKPiA+IG9mIHRoZSB1c2Vy
IGlzIG1pZ3JhdGVfZGlzYWJsZSgpL2VuYWJsZSgpLgo+ID4gQmFzaWNhbGx5IGlmIGEgdGFzayBp
cyB0YXNrX2lzX3JlYWx0aW1lKCkgdGhlbiBORUVEX1JFU0NIRUQgaXMgc2V0IGZvcgo+ID4gdGhl
IHdha2V1cC4gRm9yIHRoZSByZW1haW5pbmcgc3RhdGVzIChTQ0hFRF9PVEhFUiwg4oCmKSBORUVE
X1JFU0NIRURfTEFaWQo+ID4gaXMgc2V0IGZvciB0aGUgd2FrZXVwLiBUaGlzIGNhbiBiZSBkZWxh
eWVkIGlmIHRoZSB0YXNrIGlzIGluIGEgInByZWVtcHQKPiA+IGRpc2FibGUgbGF6eSIgc2VjdGlv
biAoc2ltaWxhciB0byBhIHByZWVtcHRfZGlzYWJsZSgpIHNlY3Rpb24pIGJ1dCBhCj4gPiB0YXNr
X2lzX3JlYWx0aW1lKCkgY2FuIHN0aWxsIGJlIHNjaGVkdWxlZCBpZiBuZWVkZWQuCj4gT2theSwg
SXQgc2hvdWxkIGJlIFtQQVRDSCBSVF0uIFJJU0MtViB3b3VsZCBhbHNvIG1vdmUgdG8gR0VORVJJ
Q19FTlRSWQoKQXMgc2FpZCBpbiB0aGUgY292ZXIgbGV0dGVyLCB0aGlzIHBhdGNoIGlzIGV4cGVj
dGVkIHRvIHJldmlld2VkIGFuZAptYWludGFpbmVkIGluIFJUIHRyZWUuIElmIHlvdXIgR0VORVJJ
Q19FTlRSWSBwYXRjaGVzIGFyZSBtZXJnZWQsIEkgd2lsbApzZW5kIGFuIHVwZGF0ZWQgcGF0Y2gu
Cgo+IFsxXSwgc28gYWJvdmUgYXNzZW1ibHkgY29kZSB3b3VsZCBiZSByZXBsYWNlZCBieSBnZW5l
cmljIG9uZSwgcmlnaHQ/Cj4gCj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDIyMDkwNDA3MjYzNy44NjE5LTMtZ3VvcmVuQGtlcm5lbC5vcmcvVC8jdQo+IAo+IAo+
ID4gU2VlIGRldGFpbHMgYXQKPiA+ICAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcnQvbGludXgtcnQtZGV2ZWwuZ2l0L3BsYWluL3BhdGNoZXMv
c2NoZWRfX0FkZF9zdXBwb3J0X2Zvcl9sYXp5X3ByZWVtcHRpb24ucGF0Y2g/aD1saW51eC02LjAu
eS1ydC1wYXRjaGVzCj4gCj4gCj4gPgo+ID4gU2ViYXN0aWFuCj4gCj4gCj4gCj4gLS0gCj4gQmVz
dCBSZWdhcmRzCj4gIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
