Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26943C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 13:19:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9902C61369
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 13:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9902C61369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l1O7c4LleqdACUAgoqbzwXEL8ZBc8/cEOx4iYlvWTEY=; b=U9YApCAe654W09pFaRCU9Fn2n
	sGwq6vbWNKUMk/r3f+6JWNpEbo2KWTW3tNmqAyYwin8Vbs3sGQAC3qXWphXL4mFBaHd1zxTLwppA8
	3F8T4q7we8598PebFFUu3rxeimxGjBQWOTG9nliC9W9NcT3MJL+d1p5ajTndCnTJAO3+nPIhtPdly
	oQpvBSpkX3kDhh9fwbivNFZDvpc6Tg3Fh8Ob4ETC2v57avWneViOMhlLfZerqVq8T5OhDijB18Jo2
	Ar76USpqkkb70Gd4hiAji9bKTbl/nrrbqoPGOp2KjUDUibZ0KnjGGkMhbqNS3Tj4q4aXf5dF7uzOV
	Vyh2stVFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWIxB-009M6e-Sq; Tue, 13 Apr 2021 13:19:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIx9-009M5w-1m
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 13:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Wh3/vjlctnDgJMQx22mnsGkxzJ7trw40qdASux2qRfA=; b=ue6QcVL37Z4+TSBP4S/2g/z8QQ
 prLm3yDq00auRSi8PvuLTXx14MNc4a1XG5E+hUb/XMZkJZsQx0tpNGxd11E5Z8fRW1GatrfoaALGK
 AWM607OHl2HmrMP4FOlVNgOWpEWyMy6QwTUVDIgSMwqp9I/s/aykyiz1F2ufU0e3KKbRly3eJcozJ
 ivWHBTVbHVIZhwF/YSJ9MeOngnlCqsUP4N2zEm0jArfmKMo26b2kvPWLz5S3iV/LHM7HSpczTT99s
 Yn6VIzlvYKJ+uZO3oNSg7f8WFroTRXA3TTq4uBMTs/g3o9f5ouwvl8FuDLxgUfM9+4W+7ZFTu1ZWW
 3vVExfiA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWIx5-0073Tv-6p
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 13:19:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6BBF613AE
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618319974;
 bh=dHb+9RWOXpHcRhO99G9+Gl2DwBKyALpUq4BvTIUtTVQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F1s0RmSryWKmiV6Lz8MnxRHRlaUoqYwFV9jfjle/K/zXtw/sD0kwDmgM1QrVBfT48
 dP/+r05w75ZF5uUEEj9sYIoiHoM0KbG4INmtF7yfDQRTYjf6B4hLqIJWj22sK4kGLh
 eN74KrkQJig7XYmZfcFtH0rYQq5sSm8bBdAjQ9krnIQeMHU9JeEu48r02NU0D39Jcw
 b8M8I693gSMNQVlT2LFeo8BKnw+NoHvjfpRAJmX14C35Jyi4CMNIBoHF7IBmAFX3X4
 xa3+67B7gQnFve2cmaFA8gyKcP71EsIr6fyp8w7R6JY+dmncsWEwL32yUnSeWY8nUl
 EhUUzg8JXXVEQ==
Received: by mail-lf1-f48.google.com with SMTP id b4so27279629lfi.6
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 06:19:34 -0700 (PDT)
X-Gm-Message-State: AOAM532ynAKvfccJ4nlrI6P9c1KFsSvL6KwlATJvZIcR0YEboGJFofUA
 FGEiPgyIThOuZ2n8XVMtpPe5tG48m8fVd7No/xE=
X-Google-Smtp-Source: ABdhPJxlbGxYM2u/njG9JbO35qDmCzUuVASYD4H4zpPv1qlhX0HZvmEoF8zeFppb2o8CJ6YoDuI+ISrUsjlA0TvaHR4=
X-Received: by 2002:a19:e34c:: with SMTP id c12mr22945713lfk.555.1618319973121; 
 Tue, 13 Apr 2021 06:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
 <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
In-Reply-To: <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 13 Apr 2021 21:19:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSGwt-hHbYiBUdiUbo+BTkyQtv_XNkLYws-EJcwURQbLQ@mail.gmail.com>
Message-ID: <CAJF2gTSGwt-hHbYiBUdiUbo+BTkyQtv_XNkLYws-EJcwURQbLQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_061935_309247_CABDFF78 
X-CRM114-Status: GOOD (  29.43  )
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgNjoyNSBQTSBDaHJpc3RvcGggTcO8bGxuZXIKPGNocmlz
dG9waG0zMEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTE6
MzcgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4g
PiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAxMToyMjo0MEFNICswMjAwLCBDaHJpc3RvcGggTcO8
bGxuZXIgd3JvdGU6Cj4gPgo+ID4gPiA+IEZvciB0aWNrZXQgbG9ja3MgeW91IHJlYWxseSBvbmx5
IG5lZWRzIGF0b21pY19mZXRjaF9hZGQoKSBhbmQKPiA+ID4gPiBzbXBfc3RvcmVfcmVsZWFzZSgp
IGFuZCBhbiBhcmNoaXRlY3R1cmFsIGd1YXJhbnRlZXMgdGhhdCB0aGUKPiA+ID4gPiBhdG9taWNf
ZmV0Y2hfYWRkKCkgaGFzIGZ3ZCBwcm9ncmVzcyB1bmRlciBjb250ZW50aW9uIGFuZCB0aGF0IGEg
c3ViLXdvcmQKPiA+ID4gPiBzdG9yZSAodGhyb3VnaCBzbXBfc3RvcmVfcmVsZWFzZSgpKSB3aWxs
IGZhaWwgdGhlIFNDLgo+ID4gPiA+Cj4gPiA+ID4gVGhlbiB5b3UgY2FuIGRvIHNvbWV0aGluZyBs
aWtlOgo+ID4gPiA+Cj4gPiA+ID4gdm9pZCBsb2NrKGF0b21pY190ICpsb2NrKQo+ID4gPiA+IHsK
PiA+ID4gPiAgICAgICAgIHUzMiB2YWwgPSBhdG9taWNfZmV0Y2hfYWRkKDE8PDE2LCBsb2NrKTsg
LyogU0MsIGdpdmVzIHVzIFJDc2MgKi8KPiA+ID4gPiAgICAgICAgIHUxNiB0aWNrZXQgPSB2YWwg
Pj4gMTY7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGZvciAoOzspIHsKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgaWYgKHRpY2tldCA9PSAodTE2KXZhbCkKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gPiAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4gPiA+
ID4gICAgICAgICAgICAgICAgIHZhbCA9IGF0b21pY19yZWFkX2FjcXVpcmUobG9jayk7Cj4gPiA+
ID4gICAgICAgICB9Cj4gPiA+ID4gfQo+ID4gPiA+Cj4gPiA+ID4gdm9pZCB1bmxvY2soYXRvbWlj
X3QgKmxvY2spCj4gPiA+ID4gewo+ID4gPiA+ICAgICAgICAgdTE2ICpwdHIgPSAodTE2ICopbG9j
ayArICghIV9fQklHX0VORElBTl9fKTsKPiA+ID4gPiAgICAgICAgIHUzMiB2YWwgPSBhdG9taWNf
cmVhZChsb2NrKTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgc21wX3N0b3JlX3JlbGVhc2UocHRy
LCAodTE2KXZhbCArIDEpOwo+ID4gPiA+IH0KPiA+ID4gPgo+ID4gPiA+IFRoYXQncyBfYWxtb3N0
XyBhcyBzaW1wbGUgYXMgYSB0ZXN0LWFuZC1zZXQgOi0pIEl0IGlzbid0IHF1aXRlIG9wdGltYWwK
PiA+ID4gPiBvbiB4ODYgZm9yIG5vdCBiZWluZyBhbGxvd2VkIHRvIHVzZSBhIG1lbW9wIG9uIHVu
bG9jaywgc2luY2UgaXRzIGJlaW5nCj4gPiA+ID4gZm9yY2VkIGludG8gYSBsb2FkLXN0b3JlIGJl
Y2F1c2Ugb2YgYWxsIHRoZSB2b2xhdGlsZSwgYnV0IHdoYXRldmVyLgo+ID4gPgo+ID4gPiBXaGF0
IGFib3V0IHRyeWxvY2soKT8KPiA+ID4gSS5lLiBvbmUgY291bGQgaW1wbGVtZW50IHRyeWxvY2so
KSB3aXRob3V0IGEgbG9vcCwgYnkgbGV0dGluZwo+ID4gPiB0cnlsb2NrKCkgZmFpbCBpZiB0aGUg
U0MgZmFpbHMuCj4gPiA+IFRoYXQgbG9va3Mgc2FmZSBvbiBmaXJzdCB2aWV3LCBidXQgbm9ib2R5
IGRvZXMgdGhpcyByaWdodCBub3cuCj4gPgo+ID4gR2VuZXJpYyBjb2RlIGhhcyB0byB1c2UgY21w
eGNoZygpLCBhbmQgdGhlbiB5b3UgZ2V0IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPgo+ID4gYm9v
bCB0cnlsb2NrKGF0b21pY190ICpsb2NrKQo+ID4gewo+ID4gICAgICAgICB1MzIgb2xkID0gYXRv
bWljX3JlYWQobG9jayk7Cj4gPgo+ID4gICAgICAgICBpZiAoKG9sZCA+PiAxNikgIT0gKG9sZCAm
IDB4ZmZmZikpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4KPiA+ICAgICAg
ICAgcmV0dXJuIGF0b21pY190cnlfY21weGNoZyhsb2NrLCAmb2xkLCBvbGQgKyAoMTw8MTYpKTsg
LyogU0MsIGZvciBSQ3NjICovCj4gPiB9Cj4KPiBUaGlzIGFwcHJvYWNoIHJlcXVpcmVzIHR3byBs
b2FkcyAoYXRvbWljX3JlYWQoKSBhbmQgY21weGNoZygpKSwgd2hpY2gKPiBpcyBub3QgcmVxdWly
ZWQuCj4gRGV0ZWN0aW5nIHRoaXMgcGF0dGVybiBhbmQgb3B0aW1pemluZyBpdCBpbiBhIGNvbXBp
bGVyIGlzIHF1aXRlIHVubGlrZWx5Lgo+Cj4gQSBiaXQgbGVzcyBnZW5lcmljIHNvbHV0aW9uIHdv
dWxkIGJlIHRvIHdyYXAgdGhlIExML1NDICh3b3VsZCBiZQo+IG1hbmRhdG9yeSBpbiB0aGlzIGNh
c2UpCj4gaW5zdHJ1Y3Rpb25zIGFuZCBkbyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Cj4gdWludDMy
X3QgX19zbXBfbG9hZF9hY3F1aXJlX3Jlc2VydmVkKHZvaWQqKTsKPiBpbnQgX19zbXBfc3RvcmVf
cmVsZWFzZV9jb25kaXRpb25hbCh2b2lkKiwgdWludDMyX3QpOwo+Cj4gdHlwZWRlZiB1bmlvbiB7
Cj4gICAgIHVpbnQzMl90IHYzMjsKPiAgICAgc3RydWN0IHsKPiAgICAgICAgIHVpbnQxNl90IG93
bmVyOwo+ICAgICAgICAgdWludDE2X3QgbmV4dDsKPiAgICAgfTsKPiB9IGFyY2hfc3BpbmxvY2tf
dDsKPgo+IGludCB0cnlsb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiB7Cj4gICAgIGFyY2hf
c3BpbmxvY2tfdCBsOwo+ICAgICBpbnQgc3VjY2VzczsKPiAgICAgZG8gewo+ICAgICAgICAgbC52
MzIgPSBfX3NtcF9sb2FkX2FjcXVpcmVfcmVzZXJ2ZWQobG9jayk7Cj4gICAgICAgICBpZiAobC5v
d25lciAhPSBsLm5leHQpCj4gICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICBsLm5leHQr
KzsKPiAgICAgICAgIHN1Y2Nlc3MgPSBfX3NtcF9zdG9yZV9yZWxlYXNlX2NvbmRpdGlvbmFsKGxv
Y2ssIGwudjMyKTsKSXQncyBhIG5ldyBzZW1hbnRpY3Mgdi5zIGNtcHhjaGcsIGFuZCBjbXB4Y2hn
IGlzIGNvbWUgZnJvbSBDQVMKaW5zdHJ1Y3Rpb24gdG8gc29sdmUgc29tZSBjb21wbGV4IHNjZW5h
cmlvLgoKVGhlIHByaW1pdGl2ZSBvZiBjbXB4Y2hnIGhhcyBiZWVuIHdpZGVseSB1c2VkIGluIExp
bnV4LCBzbyBJIGRvbid0CnRoaW5rIGludHJvZHVjaW5nIGEgbmV3IHNlbWFudGljcyAocmVzZXJ2
ZWRfY29uZGl0aW9uYWwpIGlzIGEgZ29vZAppZGVhLgoKQWxzbywgZnJvbSB0aGlzIHBvaW50OiBJ
dCBzZWVtcyBDQVMgaW5zdHJ1Y3Rpb24gaXMgbW9yZSBzdWl0YWJsZSBmb3IKc29mdHdhcmUgY29t
cGF0aWJpbGl0eS4gQWx0aG91Z2ggcmlzY3YgcHJpdmlsZWdlIHNwZWMgY2hvc2UgdGhlIExSL1ND
CmFuZCBsaXN0IHNvbWUgYmFkIHNpZGVzIG9mIENBUy4KCj4gICAgIH0gd2hpbGUgKCFzdWNjZXNz
KTsKPiAgICAgcmV0dXJuIHN1Y2Nlc3M7Cj4gfQo+Cj4gQnV0IGhlcmUgd2UgY2FuJ3QgdGVsbCB0
aGUgY29tcGlsZXIgdG8gb3B0aW1pemUgdGhlIGNvZGUgYmV0d2VlbiBMTCBhbmQgU0MuLi4KPgo+
ID4KPiA+IFRoYXQgd2lsbCB0cnkgYW5kIGRvIHRoZSBmdWxsIExML1NDIGxvb3AsIGJlY2F1c2Ug
aXQgd2FudHMgdG8gY29tcGxldGUKPiA+IHRoZSBjbXB4Y2hnLCBidXQgaW4gZ2VuZXJpYyBjb2Rl
IHdlIGhhdmUgbm8gb3RoZXIgb3B0aW9uLgo+ID4KPiA+IChJcyB0aGlzIHdoYXQgQzExJ3Mgd2Vh
ayBjbXB4Y2hnIGlzIGZvcj8pCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
