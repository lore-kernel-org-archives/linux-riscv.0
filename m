Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F46C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EidoQBCK/diF6Y9kNBSvQ8Cmu0XGw7hGJ0FTTPn4bbg=; b=phe4wlKOPu2jWi
	L/N6AjcECKw68mMlsjwDjTyW7qaSX8iiFnsNvvYz6Bet5cWwoK7ehpbz/vJEil2UvQLUHzFiSpj1L
	rXX3GHHkKVnvbx2Rl1DjhIAuNZgP4aiyNKoHTMXrAQ0iCgBxzMYLvtlwqdEebMcPl0YwAaF80mh9n
	OOXbeyrEgZ77DqT4leZnAas3iV/9YytXIgMzZAd6OzNKg2iWdoxgNlB7/uNNiIpKK7uo5suM7zAi6
	vtUNW8xox4KhVGf0bEhDuh+772Xiv6GT/XfgpPuiETLfDW7yPu/Wd0N/6QRpn3JK6bfpDMK1Uvhcr
	sfbAMicieK3IBF1ZiBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvE9p-009MuJ-0m;
	Tue, 24 Oct 2023 09:57:05 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvE9m-009Msi-0N
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 09:57:03 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-457c2e44f20so1695278137.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698141419; x=1698746219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZmQw87wWu1ilebiZdLFiZTY4pr7HbiJ8vUC+a+GPRs=;
        b=K2AOwOashoTR9Clh5FLtZAIX1e4l7UdZbFbVXe2RgsFeapDg6jh77HRxj75k08PAdU
         pgGcGQX5rWyb8GpuP4OVuvKRU3I8RZjpJQlqNtVlJZu781lsnOTzYaYQ1QlmzUkEQVxB
         aSAo9uPEfdsUBfCRRvA3GInF2w+lQJZimF40el58zl06iOn2Se7UPr1dIm7gUQV+cduB
         IA6uhFW+r61RTq2IDrsHxd8W4798+u9rdKhhu2PbX3fU4EHh/yBSP5MX2JAeh9v4B7+K
         bf48l8zGYQenTawf804YBDrHEutmh6mBNDUsVxoaXgYt2pXPbTggFznkR9kw1YbwtobW
         MyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698141419; x=1698746219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZmQw87wWu1ilebiZdLFiZTY4pr7HbiJ8vUC+a+GPRs=;
        b=FvvxgzkQ5TLl7wL95PuZxbo6WLiPUEHek9olF2MUtWrXLG/8n610z00eaNkvK3aA4+
         n9RSW+W8U5SkXYokhEo43Lv4JLkrbQcBO3OXZrEbsMQRtpQ0uKsjcMER/iJAmjiVpWLF
         Wstt8zdmBc3iQ3Nf5r3t8M41CuCsealhBkvb57dJGjukVgOkY1xi+JrqeDeGLtdZruoL
         RWcayfYfDmAgAYpYjU7bQoR+Ne2v4Siu74K8AUbled8XypNf9hyffTGdg7NxxMjPaM3f
         tM/9P/ZUGFTP4KIU02Hk4OFKU75vEYz7fg9GS3RuftPm2pinfYbYlcv5PTlSnejef9t8
         n3rw==
X-Gm-Message-State: AOJu0Yz/IxYBOHIac/iN15bwZXucLNEFq8g6fzcscGMElOtBLFDBTZQ3
	RW/sSaiKuTVK4pYZxo18Z2SrxulSxmxWv3NYl/MS+w==
X-Google-Smtp-Source: AGHT+IF/FMkfyP/7/zLROy5Ws/WEeWc1OLNc41dw+XpTZWtkqgbB228Ev9XsffAxvviNM6m98X3y97EFL0UsiFArJ7o=
X-Received: by 2002:a67:ac48:0:b0:45a:67da:658 with SMTP id
 n8-20020a67ac48000000b0045a67da0658mr5359507vsh.33.1698141418696; Tue, 24 Oct
 2023 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-6-vincent.guittot@linaro.org> <CAJZ5v0hS7bdUv=-k4ut2Fw0LYfB7Hb1_rro7UOVTRq4=JLNchg@mail.gmail.com>
 <60497d6d-dfe3-4edc-9553-311fdd9c63d0@arm.com>
In-Reply-To: <60497d6d-dfe3-4edc-9553-311fdd9c63d0@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 24 Oct 2023 11:56:46 +0200
Message-ID: <CAKfTPtCogPYyfe2aoNQE4BLRM+++3ezdx-3NsVFFMBKnZNWfiw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] cpufreq/cppc: set the frequency used for computing
 the capacity
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_025702_151217_ED795800 
X-CRM114-Status: GOOD (  33.30  )
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

T24gRnJpLCAyMCBPY3QgMjAyMyBhdCAxODowNSwgUGllcnJlIEdvbmRvaXMgPHBpZXJyZS5nb25k
b2lzQGFybS5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gVmluY2VudCwKPgo+IE9uIDEwLzE4LzIzIDE5
OjI2LCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE4LCAyMDIzIGF0
IDY6MjXigK9QTSBWaW5jZW50IEd1aXR0b3QKPiA+IDx2aW5jZW50Lmd1aXR0b3RAbGluYXJvLm9y
Zz4gd3JvdGU6Cj4gPj4KPiA+PiBTYXZlIHRoZSBmcmVxdWVuY3kgYXNzb2NpYXRlZCB0byB0aGUg
cGVyZm9ybWFuY2UgdGhhdCBoYXMgYmVlbiB1c2VkIHdoZW4KPiA+PiBpbml0aWFsaXppbmcgdGhl
IGNhcGFjaXR5IG9mIENQVXMuCj4gPj4gQWxzbywgY3BwYyBjcHVmcmVxIGRyaXZlciBjYW4gcmVn
aXN0ZXIgYW4gYXJ0aWZpY2lhbCBlbmVyZ3kgbW9kZWwuIEluIHN1Y2gKPiA+PiBjYXNlLCBpdCBu
ZWVkcyB0aGUgZnJlcXVlbmN5IGZvciB0aGlzIGNvbXB1dGUgY2FwYWNpdHkuCj4gPj4gV2UgbW92
ZWQgYW5kIHJlbmFtZWQgY3BwY19wZXJmX3RvX2toeiBhbmQgY3BwY19wZXJmX3RvX2toeiB0byB1
c2UgdGhlbQo+ID4+IG91dHNpZGUgY3BwY19jcHVmcmVxIGluIHRvcG9sb2d5X2luaXRfY3B1X2Nh
cGFjaXR5X2NwcGMoKS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgR3VpdHRvdCA8
dmluY2VudC5ndWl0dG90QGxpbmFyby5vcmc+Cj4gPgo+ID4gRm9yIHRoZSBjaGFuZ2VzIGluIGRy
aXZlcnMvYWNwaS9jcHBjX2FjcGkuYyA6Cj4gPgo+ID4gQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNv
Y2tpIDxyYWZhZWxAa2VybmVsLm9yZz4KPiA+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2FjcGkv
Y3BwY19hY3BpLmMgICAgICAgfCAgOTMgKysrKysrKysrKysrKysrKysrKysrKwo+ID4+ICAgZHJp
dmVycy9iYXNlL2FyY2hfdG9wb2xvZ3kuYyAgIHwgIDE1ICsrKy0KPiA+PiAgIGRyaXZlcnMvY3B1
ZnJlcS9jcHBjX2NwdWZyZXEuYyB8IDE0MSArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+PiAgIGluY2x1ZGUvYWNwaS9jcHBjX2FjcGkuaCAgICAgICB8ICAgMiArCj4gPj4gICA0
IGZpbGVzIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspLCAxMTggZGVsZXRpb25zKC0pCj4gPj4K
Pgo+IFtzbmlwXQo+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5
LmMgYi9kcml2ZXJzL2Jhc2UvYXJjaF90b3BvbG9neS5jCj4gPj4gaW5kZXggOWEwNzNjMmQyMDg2
Li4yMzcyY2U3OTFiYjQgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9iYXNlL2FyY2hfdG9wb2xv
Z3kuYwo+ID4+ICsrKyBiL2RyaXZlcnMvYmFzZS9hcmNoX3RvcG9sb2d5LmMKPiA+PiBAQCAtMzUw
LDYgKzM1MCw3IEBAIGJvb2wgX19pbml0IHRvcG9sb2d5X3BhcnNlX2NwdV9jYXBhY2l0eShzdHJ1
Y3QgZGV2aWNlX25vZGUgKmNwdV9ub2RlLCBpbnQgY3B1KQo+ID4+ICAgdm9pZCB0b3BvbG9neV9p
bml0X2NwdV9jYXBhY2l0eV9jcHBjKHZvaWQpCj4gPj4gICB7Cj4gPj4gICAgICAgICAgc3RydWN0
IGNwcGNfcGVyZl9jYXBzIHBlcmZfY2FwczsKPiA+PiArICAgICAgIHU2NCBjYXBhY2l0eSwgY2Fw
YWNpdHlfc2NhbGU7Cj4KPiBJIHRoaW5rIGNhcGFjaXR5X3NjYWxlIHNob3VsZCBiZSBpbml0aWFs
aXplZCB0byAwIGhlcmUsCj4gc2luY2UgaXQgaXMgdXNlZCB0byBmaW5kIHRoZSBtYXggdmFsdWUg
b2YgcmF3X2NhcGFjaXR5W2NwdV0uCgp5ZXMKCj4KPiA+PiAgICAgICAgICBpbnQgY3B1Owo+ID4+
Cj4gPj4gICAgICAgICAgaWYgKGxpa2VseSghYWNwaV9jcGNfdmFsaWQoKSkpCj4gPj4gQEAgLTM2
NSw2ICszNjYsMTAgQEAgdm9pZCB0b3BvbG9neV9pbml0X2NwdV9jYXBhY2l0eV9jcHBjKHZvaWQp
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgKHBlcmZfY2Fwcy5oaWdoZXN0X3BlcmYgPj0gcGVy
Zl9jYXBzLm5vbWluYWxfcGVyZikgJiYKPiA+PiAgICAgICAgICAgICAgICAgICAgICAocGVyZl9j
YXBzLmhpZ2hlc3RfcGVyZiA+PSBwZXJmX2NhcHMubG93ZXN0X3BlcmYpKSB7Cj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHJhd19jYXBhY2l0eVtjcHVdID0gcGVyZl9jYXBzLmhpZ2hlc3Rf
cGVyZjsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBjYXBhY2l0eV9zY2FsZSA9IG1heF90
KHU2NCwgY2FwYWNpdHlfc2NhbGUsIHJhd19jYXBhY2l0eVtjcHVdKTsKPiA+PiArCj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGVyX2NwdShjYXBhY2l0eV9yZWZfZnJlcSwgY3B1KSA9IGNw
cGNfcGVyZl90b19raHooJnBlcmZfY2FwcywgcmF3X2NhcGFjaXR5W2NwdV0pOwo+Cj4gSSB0aGlu
ayBjYXBhY2l0eV9yZWZfZnJlcSBpbiBpbiBIeiwgc28gdGhlIGZyZXEgc2hvdWxkIGJlIG11bHRp
cGxpZWQgYnkgMTAwMCAuCgp5ZXMsIEkgZm9yZ290IHRoZSAqMTAwMC4gSSdtIGdvaW5nIHRvIGFk
ZCAqIEhaX1BFUl9LSFoKCj4KPiBXaXRoIHRoZXNlIHR3byBtb2RpZmljYXRpb25zLCB0aGUgcGF0
Y2hlcyB3b3JrZWQgd2VsbCBvbiBhIGNwcGMtYmFzZWQgcGxhdGZvcm0uCj4KPiBTb3JyeSBJIGZv
cmdvdCB0byBkZXRhaWwgd2hhdCBpdCB3YXMuIEl0J3MgYSBtb2RpZmllZCBKdW5vIHdpdGggQ1BQ
QyBlbmFibGVkLiBBTVVzIGFyZSBub3QKPiBlbmFibGVkLCBzbyB0aGUgQ1BQQyBwZXJmb3JtYW5j
ZSBjb3VudGVycyBhcmUgbm90IGhhbmRsZWQgY29ycmVjdGx5IGFuZCBGSUUgY2Fubm90IGJlIGVu
YWJsZWQsCj4gYnV0IGl0IGlzIHBvc3NpYmxlIHRvIGNoYW5nZSBmcmVxdWVuY2llcy4KPgo+IFRo
ZSBfQ1BDIG9iamVjdHMgYXJlIHNldHVwIGFzOgo+IGxpdHRsZSBDUFVzOgo+IC0gbG93ZXN0X2Zy
ZXEgPSA0NTAgKE1IeikKPiAtIG5vbWluYWxfZnJlcSA9IDgwMCAoTUh6KQo+IC0gaGlnaGVzdF9w
ZXJmID0gMzgzICogMTAwMAo+IC0gbm9taW5hbF9wZXJmID0gMzIyICogMTAwMAo+IC0gbG93ZXN0
X3BlcmYgPSAxODEgKiAxMDAwCj4gLSBsb3dlc3Rfbm9ubGluZWFyX3BlcmYgPSAxODEgKiAxMDAw
Cj4KPiBiaWcgQ1BVczoKPiAtIGxvd2VzdF9mcmVxID0gNjAwIChNSHopCj4gLSBub21pbmFsX2Zy
ZXEgPSAxMjAwIChNSHopCj4gLSBoaWdoZXN0X3BlcmYgPSAxMDI0ICogMTAwMAo+IC0gbm9taW5h
bF9wZXJmID0gODMzICogMTAwMAo+IC0gbG93ZXN0X3BlcmYgPSA1MTIgKiAxMDAwCj4gLSBsb3dl
c3Rfbm9ubGluZWFyX3BlcmYgPSA1MTIgKiAxMDAwCj4KPiBBcyBhIHJlbWFpbmRlciwgYXZhaWxh
YmxlIGZyZXF1ZW5jaWVzIGFyZToKPiAtIGxpdHRsZSBDUFVzOiA0NTAsIDgwMCwgOTUwIE1Iego+
IC0gYmlnIENQVXM6IDYwMCwgMTAwMCwgMTIwMCBNaHoKPiBTbyB0aGUgcGxhdGZvcm0gaXMgc2V0
dXAgdG8gaGF2ZSB0aGUgbGFzdCBmcmVxdWVuY3kgYXMgYSBib29zdCBmcmVxdWVuY3kgKGZvciB0
ZXN0aW5nKS4KPgo+IC0tLS0KPgo+IEp1c3QgdG8gbWFrZSBhIG5vdGUgb2YgMiBwb3RlbnRpYWwg
c2lkZS1pc3N1ZXMgZm9yIGxhdGVyIChpbmRlcGVuZGVudCBmcm9tIHRoZXNlIHBhdGNoZXMpOgo+
Cj4gLSBXaGVuIHRlc3Rpbmcgd2l0aCBib29zdGVkL25vbi1ib3NzdGVkIGZyZXF1ZW5jaWVzLCBp
dCBkaWRuJ3Qgc2VlbSB0aGF0IGNwdV9vdmVydXRpbGl6ZWQoKQo+ICAgIHdhcyB0YWtpbmcgdGhl
IG1heGltdW0gZnJlcXVlbmN5IGludG8gY29uc2lkZXJhdGlvbi4gVGhpcyBtaWdodCBtZWFuIHRo
YXQgd2hlbiBsb3dlcmluZyB0aGUKPiAgICBtYXhpbXVtIGZyZXF1ZW5jeSBvZiBhIHBvbGljeSwg
dGhlIG1heGltdW0gY2FwYWNpdHkgb2YgdGhlIENQVXMgb2YgdGhpcyBwb2xpY3kgaXMgdXNlZAo+
ICAgIHRvIGRldGVjdCBvdmVyLXV0aWxpemF0aW9uLgo+ICAgIEkgd291bGQgaGF2ZSB0aG91Z2h0
IHRoYXQgdGhlIG92ZXItdXRpbGl6YXRpb24gdGhyZXNob2xkIHdvdWxkIGJlIGxvd2VyZWQgYXQg
dGhlIHNhbWUgdGltZS4KCk5vIGl0J3Mgbm90LCBJdCB3aWxsIGJlIHBhcnQgb2YgYSBuZXh0IHN0
ZXAgcGF0Y2hzZXQuIFRoaXMgcGF0Y2hzZXQKYWltcyB0byBjb25zb2xpZGF0ZSBhbmQgdXNlIHRo
ZSBzYW1lIHJlZmVyZW5jZSBzbyB3ZSBjYW4gdGhlbiBlYXNpbHkKcHJvcGFnYXRlIGNoYW5nZXMg
aWYgbmVlZGVkCgo+Cj4gLSBTaW1pbGFybHkgZm9yIEVBUywgdGhlIGVuZXJneSBjb21wdXRhdGlv
biBkb2Vzbid0IHRha2UgaW50byBhY2NvdW50IHRoZSBtYXhpbXVtIGZyZXF1ZW5jeQo+ICAgIG9m
IHRoZSBwb2xpY3kuIFRoaXMgc2hvdWxkIG1lYW4gdGhhdCBFQVMgaXMgdGFraW5nIGludG8gY29u
c2lkZXJhdGlvbiBmcmVxdWVuY2llcyB0aGF0Cj4gICAgYXJlIG5vdCBhY3R1YWxseSBhdmFpbGFi
bGUuCj4KPgo+IFJlZ2FyZHMsCj4gUGllcnJlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
