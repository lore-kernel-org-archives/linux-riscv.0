Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D282ECA0ECD
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 03:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffmlELHNL1sToLcr0jNFETTxlC67upjrBSpvON6sL3o=; b=f9v7orGfj97vy9
	3b0KK5Creh0+B88lTbn5AdDwl8GmeovHJcSaISN72dTnUs2NwklmO/dxJH9lT9/BSitSDxU3ssvW0
	MhKqdoQMj+6uXRuAKsgWde376nlPaNb/fKuMWg9I6nRuhTYuTRn4lkFbcoJ5rc4gzjEYUuU4BAMYa
	lc8tWbU+e6cIxKNwxqi9Ld5RI2O4w2nNgjSJ+Uf4qN/3si8t8cVK8XO83XwsQG7v5ho1wuM7xJyEA
	Dn3fiIeokNYkRPtMKuqtD9s4Arh+GIolnwBJjev6wbykngxuWDHt4tDPiISbm4flTXFyJaJfNDwqa
	1xjQkb0lK63fnk4KMsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdIs-007INd-2S;
	Thu, 14 Sep 2023 03:46:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgdIp-007INH-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 03:46:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8C2E8CE258A
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 03:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8B9C43397
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 03:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694663157;
	bh=MCfMmAki6C+9V+MZXu/IYFnhqZNAPw1ANqMYetafk4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xf9/vjXirctVcvzS+xIQiDf7U87Sf4g/ogUBX4e2N7uBUQJ1gdHqWVOlSGuKXrNq2
	 cVb3WyyKp2y0dCD3f696EM5P8pPMGz/+fzxtwAg/IuAsHTKv9MS3fOgZF9PURgzN5e
	 1xI2mQezFXSo0umQ4A1T9WuZGSD7fDNju4eF9OeS80+0BbL4kciOA0mbHLP19PjSG3
	 x7U1VI7p5vcGLg9KEVckMeVNQ+9dKfzdzmAoLyMKha1fJPdtCMprfjT3YtXwYL74b/
	 tqOm3do5wXusRDOZe50z1XYqCjBLHL3NE87EAs534dqdEP9XoAeRNMQvATwwSdM4Cp
	 cPpUn7xXDxCEA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52a1ce529fdso511232a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 20:45:57 -0700 (PDT)
X-Gm-Message-State: AOJu0YxFQoICuj13F5UAp6fbxsbN6XXdxb0bcpMLfDSPcbIpXl7V5Nwa
	S4UbgJGjkr1OHIHBoCn95KwopGh2LspznbKrXfg=
X-Google-Smtp-Source: AGHT+IGN/I5kRoKWpnBQrqKuqINc6SiZmkTI/B+YGMSeCGWGHdLbx8u+tTtskPB56qCPvFXRJAZz8pudxkeb3ifT82s=
X-Received: by 2002:a05:6402:1359:b0:522:2711:873 with SMTP id
 y25-20020a056402135900b0052227110873mr4279544edw.1.1694663155985; Wed, 13 Sep
 2023 20:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-5-guoren@kernel.org>
 <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com> <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
 <06714da1-d566-766f-7a13-a3c93b5953c4@redhat.com> <CAJF2gTQ3Q7f+FGorVTR66c6TGWsSeeKVvLF+LH1_m3kSHrm0yA@mail.gmail.com>
 <ZQF49GIZoFceUGYH@redhat.com> <CAJF2gTTHdCr-FQVSGUc+LapkJPmDiEYYa_1P6T86uCjRujgnTg@mail.gmail.com>
 <0ea8d0e7-6447-3a60-8cf4-d6a4e89fa8be@redhat.com>
In-Reply-To: <0ea8d0e7-6447-3a60-8cf4-d6a4e89fa8be@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Sep 2023 11:45:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTjQP+gCXk152rkhy7rhnn30-GAoJVuPt8bZJoi9yBhaw@mail.gmail.com>
Message-ID: <CAJF2gTTjQP+gCXk152rkhy7rhnn30-GAoJVuPt8bZJoi9yBhaw@mail.gmail.com>
Subject: Re: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for number
 of cpus >= 16k
To: Waiman Long <longman@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, paul.walmsley@sifive.com, anup@brainfault.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_204603_862699_E5DCC3EF 
X-CRM114-Status: GOOD (  28.91  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgOTowNuKAr1BNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gOS8xMy8yMyAwODo1MiwgR3VvIFJlbiB3cm90ZToKPiA+
IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDQ6NTXigK9QTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+IE9uIFR1ZSwgU2VwIDEyLCAyMDIzIGF0IDA5OjEwOjA4
QU0gKzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPj4+IE9uIE1vbiwgU2VwIDExLCAyMDIzIGF0IDk6
MDPigK9QTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToKPiA+Pj4+IE9u
IDkvMTAvMjMgMjM6MDksIEd1byBSZW4gd3JvdGU6Cj4gPj4+Pj4gT24gTW9uLCBTZXAgMTEsIDIw
MjMgYXQgMTA6MzXigK9BTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToK
PiA+Pj4+Pj4gT24gOS8xMC8yMyAwNDoyOCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4+
Pj4+PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4+Pj4+Pgo+
ID4+Pj4+Pj4gVGhlIHRhcmdldCBvZiB4Y2hnX3RhaWwgaXMgdG8gd3JpdGUgdGhlIHRhaWwgdG8g
dGhlIGxvY2sgdmFsdWUsIHNvCj4gPj4+Pj4+PiBhZGRpbmcgcHJlZmV0Y2h3IGNvdWxkIGhlbHAg
dGhlIG5leHQgY21weGNoZyBzdGVwLCB3aGljaCBtYXkKPiA+Pj4+Pj4+IGRlY3JlYXNlIHRoZSBj
bXB4Y2hnIHJldHJ5IGxvb3BzIG9mIHhjaGdfdGFpbC4gU29tZSBwcm9jZXNzb3JzIG1heQo+ID4+
Pj4+Pj4gdXRpbGl6ZSB0aGlzIGZlYXR1cmUgdG8gZ2l2ZSBhIGZvcndhcmQgZ3VhcmFudGVlLCBl
LmcuLCBSSVNDLVYKPiA+Pj4+Pj4+IFh1YW5UaWUgcHJvY2Vzc29ycyB3b3VsZCBibG9jayB0aGUg
c25vb3AgY2hhbm5lbCAmIGlycSBmb3Igc2V2ZXJhbAo+ID4+Pj4+Pj4gY3ljbGVzIHdoZW4gcHJl
ZmV0Y2gudyBpbnN0cnVjdGlvbiAoZnJvbSBaaWNib3AgZXh0ZW5zaW9uKSByZXRpcmVkLAo+ID4+
Pj4+Pj4gd2hpY2ggZ3VhcmFudGVlcyB0aGUgbmV4dCBjbXB4Y2hnIHN1Y2NlZWRzLgo+ID4+Pj4+
Pj4KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJh
LmNvbT4KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
Pgo+ID4+Pj4+Pj4gLS0tCj4gPj4+Pj4+PiAgICAga2VybmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMg
fCA1ICsrKystCj4gPj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvbG9j
a2luZy9xc3BpbmxvY2suYyBiL2tlcm5lbC9sb2NraW5nL3FzcGlubG9jay5jCj4gPj4+Pj4+PiBp
bmRleCBkM2Y5OTA2MGI2MGYuLjk2YjU0ZTJhZGU4NiAxMDA2NDQKPiA+Pj4+Pj4+IC0tLSBhL2tl
cm5lbC9sb2NraW5nL3FzcGlubG9jay5jCj4gPj4+Pj4+PiArKysgYi9rZXJuZWwvbG9ja2luZy9x
c3BpbmxvY2suYwo+ID4+Pj4+Pj4gQEAgLTIyMyw3ICsyMjMsMTAgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSB2b2lkIGNsZWFyX3BlbmRpbmdfc2V0X2xvY2tlZChzdHJ1Y3QgcXNwaW5sb2NrICps
b2NrKQo+ID4+Pj4+Pj4gICAgICAqLwo+ID4+Pj4+Pj4gICAgIHN0YXRpYyBfX2Fsd2F5c19pbmxp
bmUgdTMyIHhjaGdfdGFpbChzdHJ1Y3QgcXNwaW5sb2NrICpsb2NrLCB1MzIgdGFpbCkKPiA+Pj4+
Pj4+ICAgICB7Cj4gPj4+Pj4+PiAtICAgICB1MzIgb2xkLCBuZXcsIHZhbCA9IGF0b21pY19yZWFk
KCZsb2NrLT52YWwpOwo+ID4+Pj4+Pj4gKyAgICAgdTMyIG9sZCwgbmV3LCB2YWw7Cj4gPj4+Pj4+
PiArCj4gPj4+Pj4+PiArICAgICBwcmVmZXRjaHcoJmxvY2stPnZhbCk7Cj4gPj4+Pj4+PiArICAg
ICB2YWwgPSBhdG9taWNfcmVhZCgmbG9jay0+dmFsKTsKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiAgICAg
ICAgIGZvciAoOzspIHsKPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgICBuZXcgPSAodmFsICYgX1Ff
TE9DS0VEX1BFTkRJTkdfTUFTSykgfCB0YWlsOwo+ID4+Pj4+PiBUaGF0IGxvb2tzIGEgYml0IHdl
aXJkLiBZb3UgcHJlLWZldGNoIGFuZCB0aGVuIGltbWVkaWF0ZWx5IHJlYWQgaXQuIEhvdwo+ID4+
Pj4+PiBtdWNoIHBlcmZvcm1hbmNlIGdhaW4geW91IGdldCBieSB0aGlzIGNoYW5nZSBhbG9uZT8K
PiA+Pj4+Pj4KPiA+Pj4+Pj4gTWF5YmUgeW91IGNhbiBkZWZpbmUgYW4gYXJjaCBzcGVjaWZpYyBw
cmltaXRpdmUgdGhhdCBkZWZhdWx0IGJhY2sgdG8KPiA+Pj4+Pj4gYXRvbWljX3JlYWQoKSBpZiBu
b3QgZGVmaW5lZC4KPiA+Pj4+PiBUaHggZm9yIHRoZSByZXBseS4gVGhpcyBpcyBhIGdlbmVyaWMg
b3B0aW1pemF0aW9uIHBvaW50IEkgd291bGQgbGlrZQo+ID4+Pj4+IHRvIHRhbGsgYWJvdXQgd2l0
aCB5b3UuCj4gPj4+Pj4KPiA+Pj4+PiBGaXJzdCwgcHJlZmV0Y2h3KCkgbWFrZXMgY2FjaGVsaW5l
IGFuIGV4Y2x1c2l2ZSBzdGF0ZSBhbmQgc2VydmVzIGZvcgo+ID4+Pj4+IHRoZSBuZXh0IGNtcHhj
aGcgbG9vcCBzZW1hbnRpYywgd2hpY2ggd3JpdGVzIHRoZSBpZHhfdGFpbCBwYXJ0IG9mCj4gPj4+
Pj4gYXJjaF9zcGluX2xvY2suIFRoZSBhdG9taWNfcmVhZCBvbmx5IG1ha2VzIGNhY2hlbGluZSBp
biB0aGUgc2hhcmVkCj4gPj4+Pj4gc3RhdGUsIHdoaWNoIGNvdWxkbid0IGdpdmUgYW55IGd1YXJh
bnRlZSBmb3IgdGhlIG5leHQgY21weGNoZyBsb29wCj4gPj4+Pj4gc2VtYW50aWMuIE1pY3JvLWFy
Y2hpdGVjdHVyZSBjb3VsZCB1dGlsaXplIHByZWZldGNodygpIHRvIHByb3ZpZGUgYQo+ID4+Pj4+
IHN0cm9uZyBmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZSBmb3IgdGhlIHhjaGdfdGFpbCwgZS5n
LiwgdGhlIFQtSEVBRAo+ID4+Pj4+IFh1YW5UaWUgcHJvY2Vzc29yIHdvdWxkIGhvbGQgdGhlIGV4
Y2x1c2l2ZSBjYWNoZWxpbmUgc3RhdGUgdW50aWwgdGhlCj4gPj4+Pj4gbmV4dCBjbXB4Y2hnIHdy
aXRlIHN1Y2Nlc3MuCj4gPj4+Pj4KPiA+Pj4+PiBJbiB0aGUgZW5kLCBMZXQncyBnbyBiYWNrIHRv
IHRoZSBwcmluY2lwbGU6IHRoZSB4Y2hnX3RhaWwgaXMgYW4gYXRvbWljCj4gPj4+Pj4gc3dhcCBv
cGVyYXRpb24gdGhhdCBjb250YWlucyB3cml0ZSBldmVudHVhbGx5LCBzbyBnaXZpbmcgYSBwcmVm
ZXRjaHcoKQo+ID4+Pj4+IGF0IHRoZSBiZWdpbm5pbmcgaXMgYWNjZXB0YWJsZSBmb3IgYWxsIGFy
Y2hpdGVjdHVyZXMuLgo+ID4+Pj4+IOKAouKAouKAouKAouKAouKAouKAouKAouKAouKAouKAouKA
ogo+ID4+Pj4gSSBkaWQgcmVhbGl6ZSBhZnRlcndhcmQgdGhhdCBwcmVmZXRjaHcgZ2V0cyB0aGUg
Y2FjaGVsaW5lIGluIGV4Y2x1c2l2ZQo+ID4+Pj4gc3RhdGUuIEkgd2lsbCBzdWdnZXN0IHlvdSBt
ZW50aW9uIHRoYXQgaW4geW91ciBjb21taXQgbG9nIGFzIHdlbGwgYXMKPiA+Pj4+IGFkZGluZyBh
IGNvbW1lbnQgYWJvdXQgaXRzIHB1cnBvc2UgaW4gdGhlIGNvZGUuCj4gPj4+IE9rYXksIEkgd291
bGQgZG8gdGhhdCBpbiB2MTIsIHRoeC4KPiA+PiBJIHdvdWxkIHN1Z2dlc3QgYWRkaW5nIGEgc25p
cHBldCBmcm9tIHRoZSBJU0EgRXh0ZW5zdGlvbiBkb2M6Cj4gPj4KPiA+PiAiQSBwcmVmZXRjaC53
IGluc3RydWN0aW9uIGluZGljYXRlcyB0byBoYXJkd2FyZSB0aGF0IHRoZSBjYWNoZSBibG9jayB3
aG9zZQo+ID4+IGVmZmVjdGl2ZSBhZGRyZXNzIGlzIHRoZSBzdW0gb2YgdGhlIGJhc2UgYWRkcmVz
cyBzcGVjaWZpZWQgaW4gcnMxIGFuZCB0aGUKPiA+PiBzaWduLWV4dGVuZGVkIG9mZnNldCBlbmNv
ZGVkIGluIGltbVsxMTowXSwgd2hlcmUgaW1tWzQ6MF0gZXF1YWxzIDBiMDAwMDAsCj4gPj4gaXMg
bGlrZWx5IHRvIGJlIGFjY2Vzc2VkIGJ5IGEgZGF0YSB3cml0ZSAoaS5lLiBzdG9yZSkgaW4gdGhl
IG5lYXIgZnV0dXJlLiIKPiA+IEdvb2QgcG9pbnQsIHRoeC4KPgo+IHFzcGlubG9jayBpcyBnZW5l
cmljIGNvZGUuIEkgc3VwcG9zZSB0aGlzIGlzIGZvciB0aGUgUklTQ1YgYXJjaGl0ZWN0dXJlLgo+
IFlvdSBjYW4gbWVudGlvbiB0aGF0IGluIHRoZSBjb21taXQgbG9nIGFzIGFuIGV4YW1wbGUsIGJ1
dCBJIHByZWZlciBtb3JlCj4gZ2VuZXJpYyBjb21tZW50IGVzcGVjaWFsbHkgaW4gdGhlIGNvZGUu
Ck9rYXksIEkgd291bGQgb25seSBsZWF2ZSBhIGdlbmVyaWMgY29tbWVudCBvbiBpdCBhbmQgbW92
ZSBMZW9uYXJkbydzCmFkdmljZSBpbnRvIHRoaXMgcGF0Y2g6Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2L1pRRjNxUzFLUllBdDNjb0NAcmVkaGF0LmNvbS8KCgo+Cj4gQ2hlZXJz
LAo+IExvbmdtYW4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
