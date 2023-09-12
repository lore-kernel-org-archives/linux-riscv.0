Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC82CA0EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyqNaAV8oYLn1Qum3OJsbxnjIogLm9r1pSPbjZ+kB4k=; b=TkC3gGx/88MFAb
	6KXUX5GXJwLNDIvLthwjJJhGfpleoIX7UyvZlRcLTtkXuAX/8FNqFkHdwtgniTlxStkuczE1t1GUB
	ftxhI2/m+C0al1TrEU1tZHNXRJnLvf+LA6Or0riBtSYTW/KDAgKADbwRoWTdHQFonnQIqcAqQOGrq
	hqd/chGnq3bNd4StQ73ns3plLO77jP6VDFFmXrh5lDJWXrvKLlvc4XpVTqBEM+jpLnQUJaSvc/qN0
	4ZZqkZaJUgjmqNU+sL145k3fb2KgtJCEJb58VkpwZs7L47DFdOatDcQxz4DsBoruXb6DnxfGMZPJ2
	UGwM7eesIX6KdmJbZ/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsID-001jsb-13;
	Tue, 12 Sep 2023 01:34:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfsIA-001jrs-1T
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 01:34:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B37B3614C8
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB772C4AF5D
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694482451;
	bh=hny5DKN7nnmKvKb+KypTMSMKYkZuAQjCXV58rWadSh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EnwrZ0pORbyPZa7JmqTgAS0cKxJLWQTUgkwwewaqdq6cj8vZjSFjcBQu/SUyCohiJ
	 JeaI2N8X/TzAYu2qBzfzJKkD48dWBa1Ql9XnNMy4PagVQtswUDUli69UfDY+RD58Te
	 m3MjiDynHMMoJ2oGsklnJgRfnsiNlM7CA66evTxxxBJlE9QwJLvzOmp1FqGeYp56s1
	 L8mPgmGzsgk4NIaRXiRCo0lokkHJEtXRZnZitlusbk0h4Ix/DUc+DOZq47Gf727VHE
	 0fZ6VYAndfIUq8cFuE0YghCE00JHvLqvDD6kwgljJxyaur4xPUKeTRAxAeYUuz0Kx9
	 afOp3YCyAWNgg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50098cc8967so8168564e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 18:34:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YyQiQ/0NtzlmpkGDbXOuCwsCeIGGHWEY1p/7BkPu3YUdQcCq2G8
	Xi6/ebyZYXRxEsPy3SAETny46+Uw8Vtx6bUPnyM=
X-Google-Smtp-Source: AGHT+IEmU61GOGMCu0W//Xu8QTjfIgZ9mUeXY9BPbpPxM4T4RRtRdPOH27C8ssirhpnfS38Xp4cxFKSk0f4MPp6i4kw=
X-Received: by 2002:a05:6512:252c:b0:4ff:9efd:8a9e with SMTP id
 be44-20020a056512252c00b004ff9efd8a9emr10514533lfb.7.1694482449831; Mon, 11
 Sep 2023 18:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
 <20230910-baggage-accent-ec5331b58c8e@spud> <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
 <20230910-facsimile-answering-60d1452b8c10@spud> <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
 <20230911-nimbly-outcome-496efae7adc6@wendy>
In-Reply-To: <20230911-nimbly-outcome-496efae7adc6@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Sep 2023 09:33:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTSDtnc7WRAZ0eLjiwZHZFbOcPZaQ_c8LiLcctBNsKCaA@mail.gmail.com>
Message-ID: <CAJF2gTTSDtnc7WRAZ0eLjiwZHZFbOcPZaQ_c8LiLcctBNsKCaA@mail.gmail.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, paul.walmsley@sifive.com, anup@brainfault.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, 
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de, 
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_183414_672559_77497D90 
X-CRM114-Status: GOOD (  42.81  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgODo1M+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMTE6
MzY6MjdBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDExLCAyMDIzIGF0
IDM6NDXigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+
ID4gPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNTo0OToxM1BNICswODAwLCBHdW8gUmVuIHdy
b3RlOgo+ID4gPiA+IE9uIFN1biwgU2VwIDEwLCAyMDIzIGF0IDU6MzLigK9QTSBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFN1biwg
U2VwIDEwLCAyMDIzIGF0IDA1OjE2OjQ2UE0gKzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiA+ID4g
PiA+IE9uIFN1biwgU2VwIDEwLCAyMDIzIGF0IDQ6NTjigK9QTSBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT24gU3VuLCBT
ZXAgMTAsIDIwMjMgYXQgMDQ6Mjg6NTRBTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6
Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IENoYW5nbG9nOgo+ID4gPiA+ID4gPiA+ID4g
VjExOgo+ID4gPiA+ID4gPiA+ID4gIC0gQmFzZWQgb24gTGVvbmFyZG8gQnJhcydzIGNtcHhjaGdf
c21hbGwgcGF0Y2hlcyB2NS4KPiA+ID4gPiA+ID4gPiA+ICAtIEJhc2VkIG9uIEd1byBSZW4ncyBP
cHRpbWl6ZSBhcmNoX3NwaW5fdmFsdWVfdW5sb2NrZWQgcGF0Y2ggdjMuCj4gPiA+ID4gPiA+ID4g
PiAgLSBSZW1vdmUgYWJ1c2luZyBhbHRlcm5hdGl2ZSBmcmFtZXdvcmsgYW5kIHVzZSBqdW1wX2xh
YmVsIGluc3RlYWQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBidHcsIEkgZGlkbid0IHNh
eSB0aGF0IHVzaW5nIGFsdGVybmF0aXZlcyB3YXMgdGhlIHByb2JsZW0sIGl0IHdhcwo+ID4gPiA+
ID4gPiA+IGFidXNpbmcgdGhlIGVycmF0YSBmcmFtZXdvcmsgdG8gcGVyZm9ybSBmZWF0dXJlIGRl
dGVjdGlvbiB0aGF0IEkgaGFkCj4gPiA+ID4gPiA+ID4gYSBwcm9ibGVtIHdpdGguIFRoYXQncyBu
b3QgY2hhbmdlZCBpbiB2MTEuCj4gPiA+ID4gPiA+IEkndmUgcmVtb3ZlZCBlcnJhdGEgZmVhdHVy
ZSBkZXRlY3Rpb24uIFRoZSBvbmx5IHJlbGF0ZWQgcGF0Y2hlcyBhcmU6Cj4gPiA+ID4gPiA+ICAt
IHJpc2N2OiBxc3BpbmxvY2s6IGVycmF0YTogQWRkIEVSUkFUQV9USEVBRF9XUklURV9PTkNFIGZp
eHVwCj4gPiA+ID4gPiA+ICAtIHJpc2N2OiBxc3BpbmxvY2s6IGVycmF0YTogRW5hYmxlIHFzcGlu
bG9jayBmb3IgVC1IRUFEIHByb2Nlc3NvcnMKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2hpY2gg
b25lIGlzIHlvdXIgY29uY2Vybj8gQ291bGQgeW91IHJlcGx5IG9uIHRoZSBleGFjdCBwYXRjaCB0
aHJlYWQ/IFRoeC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiByaXNjdjogcXNwaW5sb2NrOiBlcnJhdGE6
IEVuYWJsZSBxc3BpbmxvY2sgZm9yIFQtSEVBRCBwcm9jZXNzb3JzCj4gPiA+ID4gPgo+ID4gPiA+
ID4gUGxlYXNlIGdvIGJhY2sgYW5kIHJlLXJlYWQgdGhlIGNvbW1lbnRzIEkgbGVmdCBvbiB2MTEg
YWJvdXQgdXNpbmcgdGhlCj4gPiA+ID4gPiBlcnJhdGEgY29kZSBmb3IgZmVhdHVyZSBkZXRlY3Rp
b24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEEgc3Ryb25nZXIgZm9yd2FyZCBwcm9ncmVzcyBn
dWFyYW50ZWUgaXMgbm90IGFuIGVycmF0dW0sIEFGQUlDVC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFNvcnJ5LCB0aGVyZSBpcyBubyBlcnJhdHVtIG9mICJzdHJvbmdlciBmb3J3YXJkIHByb2dyZXNz
IGd1YXJhbnRlZSIgaW4gdGhlIFYxMS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAicmlzY3Y6IHFzcGlu
bG9jazogZXJyYXRhOiBFbmFibGUgcXNwaW5sb2NrIGZvciBULUhFQUQgcHJvY2Vzc29ycyIgc3Rp
bGwKPiA+ID4gPiA+IHVzZXMgdGhlIGVycmF0YSBmcmFtZXdvcmsgdG8gZGV0ZWN0IHRoZSBwcmVz
ZW5jZSBvZiB0aGUgc3Ryb25nZXIgZm9yd2FyZAo+ID4gPiA+ID4gcHJvZ3Jlc3MgZ3VhcmFudGVl
IGluIHYxMS4KPiA+ID4gPiBPaCwgdGh4IGZvciBwb2ludGluZyBpdCBvdXQuIEkgY291bGQgcmVw
bGFjZSBpdCB3aXRoIHRoaXM6Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+ID4gPiBpbmRl
eCA4ODY5MDc1MWYyZWUuLjRiZTkyNzY2ZDNlMyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAu
Ywo+ID4gPiA+IEBAIC0zMTAsNyArMzEwLDggQEAgc3RhdGljIHZvaWQgX19pbml0IHJpc2N2X3Nw
aW5sb2NrX2luaXQodm9pZCkKPiA+ID4gPiAgewo+ID4gPiA+ICAjaWZkZWYgQ09ORklHX1JJU0NW
X0NPTUJPX1NQSU5MT0NLUwo+ID4gPiA+ICAgICAgICAgaWYgKCFlbmFibGVfcXNwaW5sb2NrX2tl
eSAmJgo+ID4gPiA+IC0gICAgICAgICAgIChzYmlfZ2V0X2Zpcm13YXJlX2lkKCkgIT0gU0JJX0VY
VF9CQVNFX0lNUExfSURfS1ZNKSkgewo+ID4gPiA+ICsgICAgICAgICAgIChzYmlfZ2V0X2Zpcm13
YXJlX2lkKCkgIT0gU0JJX0VYVF9CQVNFX0lNUExfSURfS1ZNKSAmJgo+ID4gPiA+ICsgICAgICAg
ICAgIChzYmlfZ2V0X212ZW5kb3JpZCgpICE9IFRIRUFEX1ZFTkRPUl9JRCkpIHsKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9kaXNhYmxlKCZjb21ib19xc3BpbmxvY2tfa2V5
KTsKPiA+ID4gPiAgICAgICAgICAgICAgICAgcHJfaW5mbygiVGlja2V0IHNwaW5sb2NrOiBlbmFi
bGVkXG4iKTsKPiA+ID4gPiAgICAgICAgIH0gZWxzZSB7Cj4gPiA+Cj4gPiA+IEFzIEkgc2FpZCBv
biB2MTEsIEkgYW0gb3Bwb3NlZCB0byBmZWF0dXJlIHByb2JpbmcgdXNpbmcgbXZlbmRvcmlkICYg
Q28sCj4gPiA+IHBhcnRpYWxseSBkdWUgdG8gdGhlIGV4YWN0IHNvcnQgb2YgY2hlY2sgaGVyZSB0
byBzZWUgaWYgdGhlIGtlcm5lbCBpcwo+ID4gPiBydW5uaW5nIGFzIGEgS1ZNIGd1ZXN0LiBJTU8s
IHdoZXRoZXIgYSBwbGF0Zm9ybSBoYXMgdGhpcyBzdHJvbmdlcgo+Cj4gPiBLVk0gY2FuJ3QgdXNl
IGFueSBmYWlybmVzcyBsb2NrLCBzbyBmb3JjaW5nIGl0IHVzaW5nIGEgVGVzdC1TZXQgbG9jawo+
ID4gb3IgcGFyYXZpcnQgcXNwaW5sb2NrIGlzIHRoZSByaWdodCB3YXkuIEtWTSBpcyBub3QgYSB2
ZW5kb3IgcGxhdGZvcm0uCj4KPiBNeSBwb2ludCBpcyB0aGF0IEtWTSBzaG91bGQgYmUgdGVsbGlu
ZyB0aGUgZ3Vlc3Qgd2hhdCBhZGRpdGlvbmFsIGZlYXR1cmVzCj4gaXQgaXMgY2FwYWJsZSBvZiB1
c2luZywgcmF0aGVyIHRoYW4gdGhlIGtlcm5lbCBtYWtpbmcgc29tZSBhc3N1bXB0aW9ucwo+IGJh
c2VkIG9uJHZlbmRvcmlkIGV0YyB0aGF0IGFyZSBpbnZhbGlkIHdoZW4gdGhlIGtlcm5lbCBpcyBy
dW5uaW5nIGFzIGEKPiBLVk0gZ3Vlc3QuCj4gSWYgdGhlIG12ZW5kb3JpZCBldGMgcmVsYXRlZCBh
c3N1bXB0aW9ucyB3ZXJlIGRyb3BwZWQsIHRoZSBrZXJuZWwgd291bGQKPiB0aGVuIGRlZmF1bHQg
YXdheSBmcm9tIHlvdXIgcXNwaW5sb2NrICYgdGhlcmUnZCBub3QgYmUgYSBuZWVkIHRvCj4gc3Bl
Y2lhbC1jYXNlIEtWTSBBRkFJQ1QuCj4KPiA+ID4gZ3VhcmFudGVlIG5lZWRzIHRvIGJlIGNvbW11
bmljYXRlZCBieSBmaXJtd2FyZSwgdXNpbmcgQUNQSSBvciBEVC4KPiA+ID4gSSBtYWRlIHNvbWUg
Y29tbWVudHMgb24gdjExLCByZWZlcnJpbmcgc2ltaWxhciBkaXNjdXNzaW9uIGFib3V0IHRoZQo+
ID4gPiB0aGVhZCB2ZWN0b3Igc3R1ZmYuIFBsZWFzZSBnbyB0YWtlIGEgbG9vayBhdCB0aGF0Lgo+
ID4gSSBwcmVmZXIgZm9yY2luZyBULUhFQUQgcHJvY2Vzc29ycyB1c2luZyBxc3BpbmxvY2ssIGJ1
dCBpZiBhbGwgcGVvcGxlCj4gPiB0aG91Z2h0IGl0IG11c3QgYmUgaW4gdGhlIEFDUEkgb3IgRFQs
IEkgd291bGQgY29tcHJvbWlzZS4gVGhlbiwgSQo+ID4gd291bGQgZGVsZXRlIHRoZSBxc3Bpbmxv
Y2sgY21kbGluZSBwYXJhbSBwYXRjaCBhbmQgbW92ZSBpdCBpbnRvIERULgo+ID4KPiA+IEJ5IHRo
ZSB3YXksIHdoYXQncyB0aGUga2luZCBvZiBEVCBmb3JtYXQ/IEhvdyBhYm91dDoKPgo+IEkgYWRk
ZWQgdGhlIG5ldyAicmlzY3YsaXNhLWV4dGVuc2lvbnMiIHByb3BlcnR5IGluIHBhcnQgdG8gbWFr
ZQo+IGNvbW11bmljYXRpbmcgdmVuZG9yIGV4dGVuc2lvbnMgbGlrZSB0aGlzIGVhc2llci4gUGxl
YXNlIHRyeSB0byB1c2UKPiB0aGF0LiAicXNwaW5sb2NrIiBpcyBzb2Z0d2FyZSBjb25maWd1cmF0
aW9uIHRob3VnaCwgdGhlIHZlbmRvciBleHRlbnNpb24KPiBzaG91bGQgZm9jdXMgb24gdGhlIGd1
YXJhbnRlZSBvZiBzdHJvbmcgZm9yd2FyZCBwcm9ncmVzcywgc2luY2UgdGhhdCBpcwo+IHRoZSBu
b24tc3RhbmRhcmQgYXNwZWN0IG9mIHlvdXIgSVAuClRoZSBxc3BpbmxvY2sgY29udGFpbnMgdGhy
ZWUgcGF0aHM6CiAtIE5hdGl2ZSBxc3BpbmxvY2ssIHRoaXMgaXMgeW91ciBzdHJvbmcgZm9yd2Fy
ZCBwcm9ncmVzcy4KIC0gdmlydF9zcGluX2xvY2ssIGZvciBLVk0gZ3Vlc3Qgd2hlbiBwYXJhdmly
dCBxc3BpbmxvY2sgZGlzYWJsZWQuCiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjMwOTEwMDgyOTExLjMzNzg3ODItOS1ndW9yZW5Aa2VybmVsLm9yZy8KIC0gcGFyYXZp
cnQgcXNwaW5sb2NrLCBmb3IgS1ZNIGd1ZXN0CgpTbywgd2UgbmVlZCBhIHNvZnR3YXJlIGNvbmZp
Z3VyYXRpb24gaGVyZSwgInJpc2N2LGlzYS1leHRlbnNpb25zIiBpcwphbGwgYWJvdXQgdmVuZG9y
IGV4dGVuc2lvbi4KCj4KPiBBIGNvbW1hbmRsaW5lIHByb3BlcnR5IG1heSBzdGlsbCBiZSBkZXNp
cmFibGUsIHRvIGNvbnRyb2wgdGhlIGxvY2tpbmcKPiBtZXRob2QgdXNlZCwgc2luY2UgdGhlIERU
IHNob3VsZCBiZSBhIGRlc2NyaXB0aW9uIG9mIHRoZSBoYXJkd2FyZSwgbm90Cj4gZm9yIGNvbmZp
Z3VyaW5nIHNvZnR3YXJlIHBvbGljeSBpbiB5b3VyIG9wZXJhdGluZyBzeXN0ZW0uCk9rYXksIEkg
d291bGQga2VlcCB0aGUgY21kbGluZSBwcm9wZXJ0eS4KCj4KPiBUaGFua3MsCj4gQ29ub3IuCj4K
PiA+ICAgICAgICAgY3B1cyB7Cj4gPiAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4gPiAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArICAgICAgICAg
ICAgICBxc3BpbmxvY2s7Cj4gPiAgICAgICAgICAgICAgICAgY3B1MDogY3B1QDAgewo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUsYnVsbGV0MCIsICJyaXNj
diI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJjcHUiOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgaS1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtc2V0cyA9IDwxMjg+Owo+ID4KPiA+IC0tCj4g
PiBCZXN0IFJlZ2FyZHMKPiA+ICBHdW8gUmVuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
