Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751D7C46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oagstvSM6NvZGArst0vznvXOHrcvmWV7sMLMaJL/cFA=; b=PoEmy+J+0fzZMU
	YcC5/NMITPyeqkDD8qYAoHtD6vNSJLjJAlxLFIoDJ2x2fIEL9Gi2i86L9DwVhMFBevxHAVYyX6EMN
	w9S80gN+xBJ0Mu857yaKcEWVcBExm0Xhi00Tq16zYfvV8CWgBhh2fzSsLDgXozWPTHeGtwv8w8p0z
	dVT4R1POrbikq2avGiFWOQ+PQGPicQtWAO585Y/slS7LFy2xM1BaP1+vKr9109/TpTK5ZyPipeDgI
	qgDyPraOVHI/6c2Uknzt3LHXxAfxuwYGytGTsoblOlnk1ixf5rG+Tnsm+tHDNujXs36HRz0WD+NMV
	4TRhFW28qlmzVYi4jEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI46C-00C2NX-00;
	Tue, 26 Dec 2023 09:51:44 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rI468-00C2Ms-2M
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 09:51:42 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50e7be1c65dso785962e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703584297; x=1704189097; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+h2U4wW3RrLEikZxWc4FHbb+bxIWrFaFb/ucQWewiI=;
        b=f2YtmFwtj1J9ti57iz14ZqpfM0iySe6JHWoWUK6x/Tb/04UtY6Kv7w7zGtss7WF3lC
         APCxzWsOCA1rNeC40sofs/pOPYqt0gWwiE7iIUIWbCY6Gn0JOPccGQjxhxky34Wke8VN
         Rt44Xxykk3KPD1mHdFRa1AjYbrMpHeEVnxff6KtWfY8FnIKh65lB3OV1muE2xTOBP1vu
         a3HTJlEqk7ZX8FskBky7gSgKK3UXu7gerOYReIXWtnPVKevZ3ayoA3R0hjCaFvpM6N4w
         bNQ2zGW+ohUEL1uzYvho9W7NDMcz60dBmIY6YrT8QNEfp4V4K4wVY7DlEtMuFF3lDfkt
         4QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703584297; x=1704189097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+h2U4wW3RrLEikZxWc4FHbb+bxIWrFaFb/ucQWewiI=;
        b=RkBaqKloJsdKR4A2T+VpPlPjEorMd2bb0bM4abt60Fs4aeUyjNd0yNO0sdcZRamhZ6
         NMypQ94WGQyQakkFjTZDtqmvbVVfVustUcPY/89FVuhK+CBCcSzHEQmioEcfxg5C5mXC
         xXWFW23xirgjgF8VKdOIhE2kkTtXWKj6jp4q9g3x9gk6ZWsRpMKnYIxHygsPqmPg5ONG
         VF2IqtvCByjfEpLPGs4JR1Fj9MB0GoWslewcWi3c0RrQYm5Tf3aoZEO8mOKW2MTP4kuk
         +ABB6RScrtDHA3Dt4T7n5OkdRKsSucPy073tJR1rSTmwJ5os52hWB7k2+hUQSbx2c5be
         GrCg==
X-Gm-Message-State: AOJu0YxCXAu6U4TTzes9tsiOcBifgFjgplmoSq2C98/kyfSOf33aw298
	MbrfQIjPd9sjIZ6kaRQSl9oRUhY8ji8+iEmQS3lnoEXJLKBTYQ==
X-Google-Smtp-Source: AGHT+IH+yZDDotl2Jle0/7cRok7uUIQheYoOC6PKnibIZ26crRUglDi+s7OMvQg8kbUt0M1KewlUuaZmhrIN4K7PnZ0=
X-Received: by 2002:ac2:4281:0:b0:50e:7d77:4f0b with SMTP id
 m1-20020ac24281000000b0050e7d774f0bmr500390lfh.61.1703584297348; Tue, 26 Dec
 2023 01:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20231221134318.28105-1-andy.chiu@sifive.com> <20231221134318.28105-2-andy.chiu@sifive.com>
 <20231222053014.GC52600@quark.localdomain> <CABgGipWFR5KytGgShx9ei6R00rfeTx7Caxm=hei88uzWk5j-Rw@mail.gmail.com>
 <20231223152707.GA901@quark.localdomain>
In-Reply-To: <20231223152707.GA901@quark.localdomain>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 26 Dec 2023 17:51:26 +0800
Message-ID: <CABgGipV8nDik-6rROPDwe0q33xXiaB-9nK5C90uUjwZb45Wojg@mail.gmail.com>
Subject: Re: [v7, 01/10] riscv: Add support for kernel mode vector
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	bjorn@kernel.org, charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, 
	peterz@infradead.org, tglx@linutronix.de, 
	Vincent Chen <vincent.chen@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_015140_842965_7CFAFDEB 
X-CRM114-Status: GOOD (  34.35  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMTE6MjfigK9QTSBFcmljIEJpZ2dlcnMgPGViaWdnZXJz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDQ6MjY6MDNQ
TSArMDgwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMToz
MOKAr1BNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDAxOjQzOjA4UE0gKzAwMDAsIEFuZHkgQ2hpdSB3
cm90ZToKPiA+ID4gPiArLyoKPiA+ID4gPiArICogV2UgdXNlIGEgZmxhZyB0byB0cmFjayBpbi1r
ZXJuZWwgVmVjdG9yIGNvbnRleHQuIEN1cnJlbnRseSB0aGUgZmxhZyBoYXMgdGhlCj4gPiA+ID4g
KyAqIGZvbGxvd2luZyBtZWFuaW5nOgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiAgLSBiaXQgMC03
IGluZGljYXRlcyB3aGV0aGVyIHRoZSBpbi1rZXJuZWwgVmVjdG9yIGNvbnRleHQgaXMgYWN0aXZl
LiBUaGUKPiA+ID4gPiArICogICAgYWN0aXZhdGlvbiBvZiB0aGlzIHN0YXRlIGRpc2FibGVzIHRo
ZSBwcmVlbXB0aW9uLiBPbiBhIG5vbi1SVCBrZXJuZWwsIGl0Cj4gPiA+ID4gKyAqICAgIGFsc28g
ZGlzYWJsZSBiaC4gQ3VycmVudGx5IG9ubHkgMCBhbmQgMSBhcmUgdmFsaWQgdmFsdWUgZm9yIHRo
aXMgZmllbGQuCj4gPiA+ID4gKyAqICAgIE90aGVyIHZhbHVlcyBhcmUgcmVzZXJ2ZWQgZm9yIGZ1
dHVyZSB1c2VzLgo+ID4gPiA+ICsgKi8KPiA+ID4gPiArCj4gPiA+ID4gKyNkZWZpbmUgUklTQ1Zf
S0VSTkVMX01PREVfVl9NQVNLICAgICAweGZmCj4gPiA+ID4gKwo+ID4gPiA+ICsjZGVmaW5lIFJJ
U0NWX0tFUk5FTF9NT0RFX1YgIDB4MQo+ID4gPgo+ID4gPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlz
IGlzbid0IGp1c3QgYSBzaW5nbGUgYml0IGZsYWc/Cj4gPgo+ID4gSSBoYXZlIG5vdCB5ZXQgZHJh
d24gYSBjb25jbHVzaW9uIG9uIHRoaXMuIEJ1dCBJIGFtIHRoaW5raW5nIGlmIGl0Cj4gPiB3b3Vs
ZCBiZSB1c2VmdWwgdG8gYWxsb3cgY2FsbGluZyBrZXJuZWxfdmVjdG9yX2JlZ2luIG11bHRpcGxl
IHRpbWVzIG9uCj4gPiBhIGNhbGwgY2hhaW4uIFRoZW4gdGhlc2UgZXh0cmEgYml0cyB3b3VsZCBi
ZSB1c2VmdWwgaWYgd2Ugd2VyZSB0bwo+ID4gYWxsb3cgYW5kIGltcGxlbWVudCBpdC4gRm9yIGV4
YW1wbGUsIHRoZSB1c2UgY2FzZSB3b3VsZCBiZSBsaWtlCj4gPgo+ID4ga2VybmVsX3ZlY3Rvcl9i
ZWdpbigpOwo+ID4gbWVtc2V0KCk7IC8vY2hhaW5lZCB0byBhbm90aGVyIGtlcm5lbF92ZWN0b3Jf
YmVnaW4gYW5kIHZlY3Rvcml6ZWQgbWVtc2V0Cj4gPiBkb190aGluZ3Nfd2l0aF92ZWN0b3IoKTsK
PiA+IGtlcm5lbF92ZWN0b3JfZW5kKCk7Cj4KPiBNYXliZSBpdCBzaG91bGQganVzdCBiZSBhIHNp
bmdsZSBiaXQgZm9yIG5vdywgYW5kIGl0IGNhbiBiZSBjaGFuZ2VkIGxhdGVyIGlmIHRoZQo+IG1v
cmUgY29tcGxleCB2ZXJzaW9uIGFjdHVhbGx5IHR1cm5zIG91dCB0byBiZSBuZWVkZWQ/CgpIYXZp
bmcgbW9yZSBiaXRzIGFsbG93cyB1cyB0byBjaGVjayBhZ2FpbnN0IG92ZXJmbG93IFsxXS4gRm9y
IGV4YW1wbGUsCndlIGNhbiBkZXRlY3QgaWYgcGVvcGxlIGFjY2lkZW50YWxseSBjYWxsIHJpc2N2
X3ZfY3R4X2NudF9hZGQoKSBldmVuCm51bWJlciBvZiB0aW1lcyB3aXRoIGEgZmV3IG1vcmUgYml0
cy4gQW5vdGhlciB3YXkgdG8gZG8gdGhpcyBpcyB0byB1c2UKdGVzdF9hbmRfKiBvcGVyYXRpb24g
b24gcmlzY3Zfdl9mbGFncywgYnV0IHRoZW4gd2Ugd2lsbCBoYXZlIHRvCm1haW50YWluIHR3byBr
aW5kcyBvZiBhY2Nlc3NvcnMgdG8gdGhlIGZsYWcuIEUuZy4gdGhlIHByZWVtcHRfdiBvbmUKd2ls
bCBzdGlsbCBoYXZlIHRvIGRvIGNvdW50ZXIgYWRkL3N1YiBvcGVyYXRpb25zIG9uIHRoZSBmbGFn
LgoKPgo+IEZXSVcsIHRoZSBleGlzdGluZyBhcmNoaXRlY3R1cmVzIGRvbid0IGFsbG93IHJlZW50
cmFudCBlbmFibGluZyBvZiBTSU1ELgo+Cj4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCByaXNj
dl92X2N0eF9jbnRfYWRkKHUzMiBvZmZzZXQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBjdXJy
ZW50LT50aHJlYWQucmlzY3Zfdl9mbGFncyArPSBvZmZzZXQ7Cj4gPiA+ID4gKyAgICAgYmFycmll
cigpOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlz
Y3Zfdl9jdHhfY250X3N1Yih1MzIgb2Zmc2V0KQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgYmFy
cmllcigpOwo+ID4gPiA+ICsgICAgIGN1cnJlbnQtPnRocmVhZC5yaXNjdl92X2ZsYWdzIC09IG9m
ZnNldDsKPiA+ID4gPiArfQo+ID4gPgo+ID4gPiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoZSBi
YXJyaWVycyBhYm92ZT8KPiA+ID4KPiA+ID4gPiArc3RhdGljIGlubGluZSB1MzIgcmlzY3Zfdl9j
dHhfY250KHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICByZXR1cm4gUkVBRF9PTkNFKGN1
cnJlbnQtPnRocmVhZC5yaXNjdl92X2ZsYWdzKTsKPiA+ID4gPiArfQo+ID4gPgo+ID4gPiBXaGF0
IGlzIHRoZSBwdXJwb3NlIG9mIHVzaW5nIFJFQURfT05DRSgpIGhlcmU/Cj4gPgo+ID4gVGhlc2Ug
Y29kZXMgcHJvdmlkZSBjb21waWxlciBiYXJyaWVycywgZS5nLiB0byBwcmV2ZW50IHJpc2N2X3Zf
ZmxhZwo+ID4gY291bnRpbmcgc2xpcHMgaW50byBWZWN0b3Igb3BlcmF0aW9ucy4gQ3VycmVudGx5
LiBpdCBzaG91bGQgYmUgZmluZQo+ID4gZm9yIG5vbi1wcmVlbXB0aWJsZSBWZWN0b3IgYXMgcmlz
Y3Zfdl9jdHhfY250X2FkZCgpL3N1YigpIGFyZSBndWFyZGVkCj4gPiB3aXRoIHByZWVtcHRfZGlz
YWJsZSgpL2xvY2FsX2JoX2Rpc2FibGUoKS4gSG93ZXZlciwgaWYgcHJlZW1wdF92IG9yCj4gPiB0
aGUgYWJvdmUgdXNlLWNhc2UgaXMgY29uY2VybmVkLCB0aGVuIHRoZXNlIGNvbXBpbGVyIGJhcnJp
ZXJzIGFyZQo+ID4gbmVlZGVkIGFuZCBzaG91bGQgbm90IGJlIG1peGVkIHdpdGggVmVjdG9yIG9w
ZXJhdGlvbnMgYWZ0ZXJ3YXJkLiBPciwKPiA+IGl0IHdvdWxkIGNvbmZ1c2UgdGhlIGNvbnRleHQg
dHJhY2tpbmcgd2hlbiB0cmFwcyB0YWtlIHBsYWNlLgo+ID4KPiA+IHJpc2N2X3ZfY3R4X2NudF9h
ZGQoKQo+ID4gZG8gdGhpbmdzIHdpdGggVmVjdG9yLCBtYXliZSBpbmxpbmVkICh2c3RhdGVfc2F2
ZSkKPiA+IHJpc2N2X3ZfY3R4X2NudF9zdWIoKQo+Cj4gQ2FuIHlvdSBsZWF2ZSBjb21tZW50cyBp
biB0aGUgY29kZSBleHBsYWluaW5nIHRoaXM/Cj4KPiBBbHNvLCBpZiB0aGVzZSBiYXJyaWVycyBh
cmVuJ3QgbmVlZGVkIHVudGlsIHByZWVtcHRpYmxlIHZlY3RvciBzdXBwb3J0LCB0aGV5Cj4gcHJv
YmFibHkgc2hvdWxkIGJlIHBhcnQgb2YgdGhhdCBwYXRjaCwgbm90IHRoaXMgb25lLgoKWWVzLCBJ
IHRoaW5rIHRoZXNlIGJhcnJpZXJzIGFyZSBub3QgbmVlZGVkIHVudGlsIHRoZW4uIEkgd2lsbCBt
b3ZlCnRoZW0gdG8gcGF0Y2ggMTAKCj4KPiAtIEVyaWMKCi0gWzFdOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvWlh2eEl1WndDUTh6ZVhockBnaG9zdC8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
