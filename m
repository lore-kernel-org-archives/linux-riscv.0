Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2044AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q67/dmEcUYpPxMUn6gstPWbIcaDk6/B5JLB200Ux9c=; b=Bw+sA+PtlT59k+
	B0H0aJr401cmKmwxr0E0Orpy4tPnSXzgJ5dNHm7bNi2ZvCnIQiV1uvZX3UqnbCy8Kkvqa3y1JttB5
	57HI+zkheh3+t3OXYwywU6NB+TH19wJanYdlSMwLk93IPelzFkCvgO0xWkpfL52KiH3dLzqVT3UaN
	8hlaB/1p3SmPnVT/d2CuZHcwkYXhcjnC2+l9MetMGMbZTTyVytuYPBQu1OhVibxU5Bz/l9kTpQG02
	hIrHopFIAAq4DuFmTVntwcFc53LJrBmCyDw0Cc7uT6+cMoNfu8Bgk5dcMoRWM+j/8GPN8JlU4YDau
	Q5lkyqZKUgqV6bZiSLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26DW-005tTz-8I; Fri, 17 Jun 2022 07:16:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26Au-005sNS-Qs
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 07:13:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A119261F15
	for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 07:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E17DC341CA
	for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655450026;
	bh=JGsCs4tK5qbRzU6e76TvouliJTtVdOcvkKSP1d4FvN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rFSMzLL28gebcqUNwv6dNIfwXx6mjXTybMchpSUqCq+amHVxcnDV/9Ev3x3a/fjh2
	 CLLHCLurghcHoKaBADI1u41OUendrbrjOOVRoctr302G6vZBVJ1ocNHSiSB4ieCB/X
	 f3CQmLxZvKTPEPVXfYjjD34KcKDJm620KQs69qKUv0GImOqs5ab/k+NripFU+VnYpF
	 nv1+AGOPgCvN+xHppS1XmTH1fMTY17cCAjdXM0lec7/vMt8PSOVyDhqW7Q6sw5GnRP
	 UxJFoqJtHIWR79uCKrxo9fmEMO67miz7I0pdt58OlkfatsgmkP8bouNeD2PryfQvbC
	 MTS5BestcToGw==
Received: by mail-vk1-f169.google.com with SMTP id p83so1623838vkf.6
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 00:13:46 -0700 (PDT)
X-Gm-Message-State: AJIora+iF9YaY5oblgg59PzlpTjqHM/BaHIp16QXUS4Y55aVaLzTrZw3
	NwcpqlXvQ6vXaunVi3632U3GxCm5XF4M5eYGPCA=
X-Google-Smtp-Source: AGRyM1uDRVDa8eQB+G81iuPumuflNDu9ljX1ubP/DF7PcHOXMpglAYADvAhiMjjJUZwLamPMD/eQI6zK1yl6bM7Fx04=
X-Received: by 2002:ac5:c1c9:0:b0:35c:bd7c:2deb with SMTP id
 g9-20020ac5c1c9000000b0035cbd7c2debmr4079969vkk.2.1655450025379; Fri, 17 Jun
 2022 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220606123750.2884245-1-xianting.tian@linux.alibaba.com>
 <b2a45f97-0f97-6621-bb7e-11f51282c468@huawei.com> <b1098514-d185-e649-6dea-3c2f01e97ea8@linux.alibaba.com>
 <9fa53c5b-361a-a044-a08b-57458d7fcab8@linux.alibaba.com>
In-Reply-To: <9fa53c5b-361a-a044-a08b-57458d7fcab8@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 17 Jun 2022 15:13:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSjfmYS+5Q2TVb2p+5afkvv4yU12W+eiiMhgo2d8Z+2fA@mail.gmail.com>
Message-ID: <CAJF2gTSjfmYS+5Q2TVb2p+5afkvv4yU12W+eiiMhgo2d8Z+2fA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Add fixup to support fast call of crash_kexec()
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Vitaly Wool <vitaly.wool@konsulko.com>, tongtiangen@huawei.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_001348_986474_480A2099 
X-CRM114-Status: GOOD (  24.28  )
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

SGkgWGlhbnRpbmcsCgpPbiBGcmksIEp1biAxNywgMjAyMiBhdCAyOjQwIFBNIFhpYW50aW5nIFRp
YW4KPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gSGkgUGFsbWVy
Cj4KPiBXaWxsIHlvdSBhcHBseSB0aGlzIHBhdGNoIGZvciA1LjE5PwpNYXliZSB3ZSBjb3VsZCB1
cGRhdGUgdGlsZSB3aXRoIFtQQVRDSCB2M10gUklTQy1WOiBGaXh1cCBmYXN0IGNhbGwgb2YKY3Jh
c2hfa2V4ZWMoKSBmb3IgYSBWNC4KCkl0J3MgYSBmaXh1cCBub3QgZmVhdHVyZSwgdGhhdCB3b3Vs
ZCBtaXNsZWFkIG1haW50YWluZXIuIEFuZCBhZGQKIlJldmlld2VkLWJ5OiBLZWZlbmcgV2FuZyIu
Cgo+Cj4gdGhhbmtzCj4KPiDlnKggMjAyMi82Lzcg5LiK5Y2IOTo0NiwgWGlhbnRpbmcgVGlhbiDl
hpnpgZM6Cj4gPgo+ID4g5ZyoIDIwMjIvNi83IOS4iuWNiDk6MjEsIEtlZmVuZyBXYW5nIOWGmemB
kzoKPiA+Pgo+ID4+IE9uIDIwMjIvNi82IDIwOjM3LCBYaWFudGluZyBUaWFuIHdyb3RlOgo+ID4+
PiBDdXJyZW50bHksIGFsbW9zdCBhbGwgYXJjaHMgKHg4NiwgYXJtNjQsIG1pcHMuLi4pIHN1cHBv
cnQgZmFzdCBjYWxsCj4gPj4+IG9mIGNyYXNoX2tleGVjKCkgd2hlbiAicmVncyAmJiBrZXhlY19z
aG91bGRfY3Jhc2goKSIgaXMgdHJ1ZS4gQnV0Cj4gPj4+IFJJU0MtViBub3QsIGl0IGNhbiBvbmx5
IGVudGVyIGNyYXNoIHN5c3RlbSB2aWEgcGFuaWMoKS4gSG93ZXZlciBwYW5pYygpCj4gPj4+IGRv
ZXNuJ3QgcGFzcyB0aGUgcmVncyBvZiB0aGUgcmVhbCBhY2NpZGVudCBzY2VuZSB0byBjcmFzaF9r
ZXhlYygpLAo+ID4+PiBpdCBjYXVzZWQgd2UgY2FuJ3QgZ2V0IGFjY3VyYXRlIGJhY2t0cmFjZSB2
aWEgZ2RiLAo+ID4+PiAgICAgJCByaXNjdjY0LWxpbnV4LWdudS1nZGIgdm1saW51eCB2bWNvcmUK
PiA+Pj4gICAgIFJlYWRpbmcgc3ltYm9scyBmcm9tIHZtbGludXguLi4KPiA+Pj4gICAgIFtOZXcg
TFdQIDk1XQo+ID4+PiAgICAgIzAgIGNvbnNvbGVfdW5sb2NrICgpIGF0IGtlcm5lbC9wcmludGsv
cHJpbnRrLmM6MjU1Nwo+ID4+PiAgICAgMjU1NyAgICAgICAgICAgICAgICAgICAgaWYgKGRvX2Nv
bmRfcmVzY2hlZCkKPiA+Pj4gICAgIChnZGIpIGJ0Cj4gPj4+ICAgICAjMCAgY29uc29sZV91bmxv
Y2sgKCkgYXQga2VybmVsL3ByaW50ay9wcmludGsuYzoyNTU3Cj4gPj4+ICAgICAjMSAgMHgwMDAw
MDAwMDAwMDAwMDAwIGluID8/ICgpCj4gPj4+Cj4gPj4+IFdpdGggdGhlIHBhdGNoIHdlIGNhbiBn
ZXQgdGhlIGFjY3VyYXRlIGJhY2t0cmFjZSwKPiA+Pj4gICAgICQgcmlzY3Y2NC1saW51eC1nbnUt
Z2RiIHZtbGludXggdm1jb3JlCj4gPj4+ICAgICBSZWFkaW5nIHN5bWJvbHMgZnJvbSB2bWxpbnV4
Li4uCj4gPj4+ICAgICBbTmV3IExXUCA5NV0KPiA+Pj4gICAgICMwICAweGZmZmZmZmUwMDA2M2E0
ZTAgaW4gdGVzdF90aHJlYWQgKGRhdGE9PG9wdGltaXplZCBvdXQ+KSBhdAo+ID4+PiBkcml2ZXJz
L3Rlc3RfY3Jhc2guYzo4MQo+ID4+PiAgICAgODEgICAgICAgICAgICAgKihpbnQgKilwID0gMHhk
ZWFkOwo+ID4+PiAgICAgKGdkYikKPiA+Pj4gICAgIChnZGIpIGJ0Cj4gPj4+ICAgICAjMCAgMHhm
ZmZmZmZlMDAwNjRkNWMwIGluIHRlc3RfdGhyZWFkIChkYXRhPTxvcHRpbWl6ZWQgb3V0PikgYXQK
PiA+Pj4gZHJpdmVycy90ZXN0X2NyYXNoLmM6ODEKPiA+Pj4gICAgICMxICAweDAwMDAwMDAwMDAw
MDAwMDAgaW4gPz8gKCkKPiA+Pj4KPiA+Pj4gVGVzdCBjb2RlIHRvIHByb2R1Y2UgTlVMTCBhZGRy
ZXNzIGRlcmVmZXJlbmNlIGluIHRlc3RfY3Jhc2guYywKPiA+Pj4gICAgIHZvaWQgKnAgPSBOVUxM
Owo+ID4+PiAgICAgKihpbnQgKilwID0gMHhkZWFkOwo+ID4+Pgo+ID4+PiBGaXhlczogNzZkMmEw
NDkzYTE3ICgiUklTQy1WOiBJbml0IGFuZCBIYWx0IENvZGUiKQo+ID4+PiBSZXZpZXdlZC1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW50aW5n
IFRpYW4gPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4+IC0tLQo+ID4+PiBD
aGFuZ2VzIGZyb20gdjE6Cj4gPj4+IC0gc2ltcGxpZnkgdGhlIGNvbW1pdCBtZXNzYWdlCj4gPj4+
IENoYW5nZXMgZnJvbSB2MjoKPiA+Pj4gLSBhZGQgZml4dXAgaW4gdGl0bGUKPiA+Pj4gLS0tCj4g
Pj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQgKysrKwo+ID4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPj4+IGluZGV4
IGI0MDQyNjUwOTI0NC4uMzlkMGY4YmJhNGI0IDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+
Pj4gQEAgLTE2LDYgKzE2LDcgQEAKPiA+Pj4gICAjaW5jbHVkZSA8bGludXgvbW0uaD4KPiA+Pj4g
ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gPj4+ICAgI2luY2x1ZGUgPGxpbnV4L2lycS5o
Pgo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L2tleGVjLmg+Cj4gPj4+ICAgICAjaW5jbHVkZSA8YXNt
L2FzbS1wcm90b3R5cGVzLmg+Cj4gPj4+ICAgI2luY2x1ZGUgPGFzbS9idWcuaD4KPiA+Pj4gQEAg
LTQ0LDYgKzQ1LDkgQEAgdm9pZCBkaWUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGNvbnN0IGNoYXIg
KnN0cikKPiA+Pj4gICAgICAgICByZXQgPSBub3RpZnlfZGllKERJRV9PT1BTLCBzdHIsIHJlZ3Ms
IDAsIHJlZ3MtPmNhdXNlLCBTSUdTRUdWKTsKPiA+Pj4gICArICAgIGlmIChyZWdzICYmIGtleGVj
X3Nob3VsZF9jcmFzaChjdXJyZW50KSkKPiA+Pj4gKyAgICAgICAgY3Jhc2hfa2V4ZWMocmVncyk7
Cj4gPj4+ICsKPiA+Pgo+ID4+IEl0IHNlZW1zIHRoYXQgdGhlIHJlZ3Mgd29uJ3QgYmUgbnVsbCwg
cmlnaHQ/IGV4Y2VwdCB0aGF0LAo+ID4KPiA+IEF1dHVhbGx5IGJvdGggcmVncyB3b24ndCBiZSBu
dWxsLCBCdXQgaWYgaXQgaXMgdHJpZ2dlcmVkIGJ5IHBhbmljKCkgLAo+ID4gdGhlIHJlZ3MgYXJl
IGdvdCB2aWEgcmlzY3ZfY3Jhc2hfc2F2ZV9yZWdzKCksIHdoaWNoIGFyZSB0aGUgcmVncyBvZgo+
ID4gdGhhdCBtb21lbnQsIGJ1dCBub3QgdGhlIHJlYWwgYWNjaWRlbnQgc2NlbmUuCj4gPgo+ID4+
Cj4gPj4gUmV2aWV3ZWQtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNv
bT4KPiA+Pgo+ID4+PiAgICAgICBidXN0X3NwaW5sb2NrcygwKTsKPiA+Pj4gICAgICAgYWRkX3Rh
aW50KFRBSU5UX0RJRSwgTE9DS0RFUF9OT1dfVU5SRUxJQUJMRSk7Cj4gPj4+ICAgICAgIHNwaW5f
dW5sb2NrX2lycSgmZGllX2xvY2spOwoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
