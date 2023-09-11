Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA36EE49A4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 03:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPq06BQ3kCLJyZnVJVuuYi0AYiCR7vkpShT5t6ovjIs=; b=xl+45gDel8aurF
	wVFGQLcSdQbY0Da2ikkpgxH5embTDvPfzVHSLLPny/DwjTxXo7xe8v1gnxfgwh4RR0m5k7V4sHPkv
	mNmZL4BEdEUVR4dLjqMMNNDFPv0+ZE/qcubR+we3nalHjO+nHOEFV809XpOsv+RxF28Cyv/BZitD9
	vwBJ1bxacyVaURoJhycfSRdHaaNi2Pik+EHW8G3zYXteIL77VFsuZVC4nhmDU9uBJPoa7oM4L2wj+
	LylXM9nyzJoojeg261ibm8tAlN0lReOCgLFCvOj7eZmG3IczTml4FiSSqRU+ck30ZWdcjW2mlhhnt
	39yUk+asFgXt69xXPUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXjF-00HB6r-0i;
	Mon, 11 Sep 2023 03:36:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXjC-00HB6V-1H
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 03:36:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C62D9B80DCF
	for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 03:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3D6C433BC
	for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 03:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694403402;
	bh=weTZp8zL3bWb5z0GQP+eoq1kF+g4ZFnVOzhk58dn504=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XcQPuw6rt2SnGfuvugsIuIKJy5rB+AhY7hasYT4M+p4qvciFwGF2qmFcj64JP/Y1Z
	 ydtRL4BCbu9ArpmsxMtgxDONtG41ULcTgFkPE/p+P+7tpxv7pkOFUCKELlTGBlserA
	 Z7gcUJ3l8ZBC5ASAafNu1nAKgF06erI+8kwxtIWQ1kdATR+JJHks4UB0mKL5SxJLoR
	 Wove4bdXZN3UcLUO/rD6dHpUhX/CuyZK1bFQvhFNPhhXC/xJRLbeNrvZc+8jBo62Z6
	 sA6CP3USYT3s3lSAdIwx/LbK1WdzikTHcEE+3gp1Zxve3orNLFaakCohDCvqhwevac
	 QU9TzwqT0JZhw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52f33659d09so1589468a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 20:36:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YyA0t6MkF0nyI7b/G8S4S8lKbmexoLvk/diB9EcAInYwqcwXnHn
	WczclaopXtPC8JIfYPfL9uVSpZmhTLWhUebODEA=
X-Google-Smtp-Source: AGHT+IFhNn3iSN5211iDeQune5ZsTnjOXUdLsXbdqVCgdz89o+T7M0sY5KDD0X1TlWnwIpUOOvy5g06IJUHz0bughjs=
X-Received: by 2002:a17:906:30da:b0:99d:fc31:242f with SMTP id
 b26-20020a17090630da00b0099dfc31242fmr6921871ejb.66.1694403400391; Sun, 10
 Sep 2023 20:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
 <20230910-baggage-accent-ec5331b58c8e@spud> <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
 <20230910-facsimile-answering-60d1452b8c10@spud>
In-Reply-To: <20230910-facsimile-answering-60d1452b8c10@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 11 Sep 2023 11:36:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
Message-ID: <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_203646_728484_647DB8B7 
X-CRM114-Status: GOOD (  31.03  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMzo0NeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNTo0OToxM1BNICsw
ODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNTozMuKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1
biwgU2VwIDEwLCAyMDIzIGF0IDA1OjE2OjQ2UE0gKzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiA+
ID4gT24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNDo1OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gU3VuLCBTZXAgMTAsIDIw
MjMgYXQgMDQ6Mjg6NTRBTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBDaGFuZ2xvZzoKPiA+ID4gPiA+ID4gVjExOgo+ID4gPiA+ID4gPiAgLSBC
YXNlZCBvbiBMZW9uYXJkbyBCcmFzJ3MgY21weGNoZ19zbWFsbCBwYXRjaGVzIHY1Lgo+ID4gPiA+
ID4gPiAgLSBCYXNlZCBvbiBHdW8gUmVuJ3MgT3B0aW1pemUgYXJjaF9zcGluX3ZhbHVlX3VubG9j
a2VkIHBhdGNoIHYzLgo+ID4gPiA+ID4gPiAgLSBSZW1vdmUgYWJ1c2luZyBhbHRlcm5hdGl2ZSBm
cmFtZXdvcmsgYW5kIHVzZSBqdW1wX2xhYmVsIGluc3RlYWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
YnR3LCBJIGRpZG4ndCBzYXkgdGhhdCB1c2luZyBhbHRlcm5hdGl2ZXMgd2FzIHRoZSBwcm9ibGVt
LCBpdCB3YXMKPiA+ID4gPiA+IGFidXNpbmcgdGhlIGVycmF0YSBmcmFtZXdvcmsgdG8gcGVyZm9y
bSBmZWF0dXJlIGRldGVjdGlvbiB0aGF0IEkgaGFkCj4gPiA+ID4gPiBhIHByb2JsZW0gd2l0aC4g
VGhhdCdzIG5vdCBjaGFuZ2VkIGluIHYxMS4KPiA+ID4gPiBJJ3ZlIHJlbW92ZWQgZXJyYXRhIGZl
YXR1cmUgZGV0ZWN0aW9uLiBUaGUgb25seSByZWxhdGVkIHBhdGNoZXMgYXJlOgo+ID4gPiA+ICAt
IHJpc2N2OiBxc3BpbmxvY2s6IGVycmF0YTogQWRkIEVSUkFUQV9USEVBRF9XUklURV9PTkNFIGZp
eHVwCj4gPiA+ID4gIC0gcmlzY3Y6IHFzcGlubG9jazogZXJyYXRhOiBFbmFibGUgcXNwaW5sb2Nr
IGZvciBULUhFQUQgcHJvY2Vzc29ycwo+ID4gPiA+Cj4gPiA+ID4gV2hpY2ggb25lIGlzIHlvdXIg
Y29uY2Vybj8gQ291bGQgeW91IHJlcGx5IG9uIHRoZSBleGFjdCBwYXRjaCB0aHJlYWQ/IFRoeC4K
PiA+ID4KPiA+ID4gcmlzY3Y6IHFzcGlubG9jazogZXJyYXRhOiBFbmFibGUgcXNwaW5sb2NrIGZv
ciBULUhFQUQgcHJvY2Vzc29ycwo+ID4gPgo+ID4gPiBQbGVhc2UgZ28gYmFjayBhbmQgcmUtcmVh
ZCB0aGUgY29tbWVudHMgSSBsZWZ0IG9uIHYxMSBhYm91dCB1c2luZyB0aGUKPiA+ID4gZXJyYXRh
IGNvZGUgZm9yIGZlYXR1cmUgZGV0ZWN0aW9uLgo+ID4gPgo+ID4gPiA+ID4gQSBzdHJvbmdlciBm
b3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZSBpcyBub3QgYW4gZXJyYXR1bSwgQUZBSUNULgo+ID4g
Pgo+ID4gPiA+IFNvcnJ5LCB0aGVyZSBpcyBubyBlcnJhdHVtIG9mICJzdHJvbmdlciBmb3J3YXJk
IHByb2dyZXNzIGd1YXJhbnRlZSIgaW4gdGhlIFYxMS4KPiA+ID4KPiA+ID4gInJpc2N2OiBxc3Bp
bmxvY2s6IGVycmF0YTogRW5hYmxlIHFzcGlubG9jayBmb3IgVC1IRUFEIHByb2Nlc3NvcnMiIHN0
aWxsCj4gPiA+IHVzZXMgdGhlIGVycmF0YSBmcmFtZXdvcmsgdG8gZGV0ZWN0IHRoZSBwcmVzZW5j
ZSBvZiB0aGUgc3Ryb25nZXIgZm9yd2FyZAo+ID4gPiBwcm9ncmVzcyBndWFyYW50ZWUgaW4gdjEx
Lgo+ID4gT2gsIHRoeCBmb3IgcG9pbnRpbmcgaXQgb3V0LiBJIGNvdWxkIHJlcGxhY2UgaXQgd2l0
aCB0aGlzOgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+ID4gaW5kZXggODg2OTA3NTFmMmVlLi40YmU5Mjc2
NmQzZTMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPiBAQCAtMzEwLDcgKzMxMCw4IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCByaXNjdl9zcGlubG9ja19pbml0KHZvaWQpCj4gPiAgewo+ID4gICNpZmRl
ZiBDT05GSUdfUklTQ1ZfQ09NQk9fU1BJTkxPQ0tTCj4gPiAgICAgICAgIGlmICghZW5hYmxlX3Fz
cGlubG9ja19rZXkgJiYKPiA+IC0gICAgICAgICAgIChzYmlfZ2V0X2Zpcm13YXJlX2lkKCkgIT0g
U0JJX0VYVF9CQVNFX0lNUExfSURfS1ZNKSkgewo+ID4gKyAgICAgICAgICAgKHNiaV9nZXRfZmly
bXdhcmVfaWQoKSAhPSBTQklfRVhUX0JBU0VfSU1QTF9JRF9LVk0pICYmCj4gPiArICAgICAgICAg
ICAoc2JpX2dldF9tdmVuZG9yaWQoKSAhPSBUSEVBRF9WRU5ET1JfSUQpKSB7Cj4gPiAgICAgICAg
ICAgICAgICAgc3RhdGljX2JyYW5jaF9kaXNhYmxlKCZjb21ib19xc3BpbmxvY2tfa2V5KTsKPiA+
ICAgICAgICAgICAgICAgICBwcl9pbmZvKCJUaWNrZXQgc3BpbmxvY2s6IGVuYWJsZWRcbiIpOwo+
ID4gICAgICAgICB9IGVsc2Ugewo+Cj4gQXMgSSBzYWlkIG9uIHYxMSwgSSBhbSBvcHBvc2VkIHRv
IGZlYXR1cmUgcHJvYmluZyB1c2luZyBtdmVuZG9yaWQgJiBDbywKPiBwYXJ0aWFsbHkgZHVlIHRv
IHRoZSBleGFjdCBzb3J0IG9mIGNoZWNrIGhlcmUgdG8gc2VlIGlmIHRoZSBrZXJuZWwgaXMKPiBy
dW5uaW5nIGFzIGEgS1ZNIGd1ZXN0LiBJTU8sIHdoZXRoZXIgYSBwbGF0Zm9ybSBoYXMgdGhpcyBz
dHJvbmdlcgpLVk0gY2FuJ3QgdXNlIGFueSBmYWlybmVzcyBsb2NrLCBzbyBmb3JjaW5nIGl0IHVz
aW5nIGEgVGVzdC1TZXQgbG9jawpvciBwYXJhdmlydCBxc3BpbmxvY2sgaXMgdGhlIHJpZ2h0IHdh
eS4gS1ZNIGlzIG5vdCBhIHZlbmRvciBwbGF0Zm9ybS4KCj4gZ3VhcmFudGVlIG5lZWRzIHRvIGJl
IGNvbW11bmljYXRlZCBieSBmaXJtd2FyZSwgdXNpbmcgQUNQSSBvciBEVC4KPiBJIG1hZGUgc29t
ZSBjb21tZW50cyBvbiB2MTEsIHJlZmVycmluZyBzaW1pbGFyIGRpc2N1c3Npb24gYWJvdXQgdGhl
Cj4gdGhlYWQgdmVjdG9yIHN0dWZmLiBQbGVhc2UgZ28gdGFrZSBhIGxvb2sgYXQgdGhhdC4KSSBw
cmVmZXIgZm9yY2luZyBULUhFQUQgcHJvY2Vzc29ycyB1c2luZyBxc3BpbmxvY2ssIGJ1dCBpZiBh
bGwgcGVvcGxlCnRob3VnaHQgaXQgbXVzdCBiZSBpbiB0aGUgQUNQSSBvciBEVCwgSSB3b3VsZCBj
b21wcm9taXNlLiBUaGVuLCBJCndvdWxkIGRlbGV0ZSB0aGUgcXNwaW5sb2NrIGNtZGxpbmUgcGFy
YW0gcGF0Y2ggYW5kIG1vdmUgaXQgaW50byBEVC4KCkJ5IHRoZSB3YXksIHdoYXQncyB0aGUga2lu
ZCBvZiBEVCBmb3JtYXQ/IEhvdyBhYm91dDoKICAgICAgICBjcHVzIHsKICAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+OwogICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
CisgICAgICAgICAgICAgIHFzcGlubG9jazsKICAgICAgICAgICAgICAgIGNwdTA6IGNwdUAwIHsK
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUsYnVsbGV0MCIsICJy
aXNjdiI7CiAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7CiAgICAg
ICAgICAgICAgICAgICAgICAgIGktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47CiAgICAgICAgICAg
ICAgICAgICAgICAgIGktY2FjaGUtc2V0cyA9IDwxMjg+OwoKLS0KQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
