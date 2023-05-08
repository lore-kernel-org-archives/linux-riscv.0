Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFB4C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0tJZKGOwAcLwtaNxLDyrtc4is4d9QIzFrwYHg0cjWc=; b=1f1SVVeV+SHoRC
	UiNcoQEdEQG9mGBNhn0/k8rC0dHk8wFsufmiMwn9KXa1W8//Wt/9LHeqi6fVFLQD2AjI3ofCd7Zq/
	kwPvWzv0mwA4iYQTG20CU/5/bckKKpEYa+DLI5fa3bK40gMhOf3aoAeafMkA8IokhInuy+SB+ZwDc
	E/vQafe2KBn0vky+vVv8aOamIOLQNVj2E58SZC7vtODt4FD2IBQzxbMHm4jlBIwsu6keUGOB+uPpk
	OMMwpRufgB5rOu/fth6PYM9YOEsQpimC/DCYlYb50CD04xFSXvFjDbhErVzYOfxhg8CnGrCndiCTR
	0jTJ+lTAI25m7juMGQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvujn-00HR3z-1o;
	Mon, 08 May 2023 06:52:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvujl-00HR3d-1A
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:52:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB22761F41
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B72CC4339C
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683528763;
	bh=ZE6Vr9Yajp3snKfRb/T4DJi7T/W3uvjeYiZ1cxbbIQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hs/uQexpO/8RkhQ8GVASe16K5oogngtqWb4hWHGsYN+phIhOYKsxuEyHuOVWH8dqq
	 s/ycLF9sGenZ526Kv7dFj2xUkEvU1/sAoaThocwUfx64gipZijsklWVrgLo72kfKBQ
	 h5V551044EuiZ2nA1xveZU1dtjwIBRiseKdLIOdeY04gb1ZkMcflkaTqCfU75TIQh6
	 jD3DqwZv4Zgg/tZssm8y7r8QYvu6pDhZEmy8lGmDpaSwZrN3X7/1DipxA004TyGs2C
	 VpH4n3+VYflmI7qStjblaHRawAOhN+lZ4EtvO14IDz7r+O5seIIGF3Bea1ze+HmySL
	 HfszT9KBNABBA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50b37f3e664so7547329a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 23:52:43 -0700 (PDT)
X-Gm-Message-State: AC+VfDxI6aICpYGHLFuadFI3mMTEzXmB7UZgY9i/s2s048HuxDFE3A6G
	DuvppjU+v7WRh6nFMA3nb/7USUVkI95c4TyqkZk=
X-Google-Smtp-Source: ACHHUZ6Y6grqgRLTUhlimPBKynh9DnHZoR/6MpPmj9ylOios2EVUGTDYz+S0kva/uFN5mGCt7yUrdJztk28ZabD8yiM=
X-Received: by 2002:a17:907:5c6:b0:94e:e293:cf34 with SMTP id
 wg6-20020a17090705c600b0094ee293cf34mr8100801ejb.6.1683528761470; Sun, 07 May
 2023 23:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org> <20230507182304.2934-2-jszhang@kernel.org>
In-Reply-To: <20230507182304.2934-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:52:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTni=G5FP80rSArErXGWQatR1P8rCy9nNOggeA4vtXftQ@mail.gmail.com>
Message-ID: <CAJF2gTTni=G5FP80rSArErXGWQatR1P8rCy9nNOggeA4vtXftQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_235245_488488_25412478 
X-CRM114-Status: GOOD (  20.45  )
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAyOjM04oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBULUhFQUQncyBDOTEwIFBMSUMgc3RpbGwgbmVlZHMg
dGhlIGRlbGVnYXRpb24gYml0IHNldHRpbmd0byBhbGxvdwo+IGFjY2VzcyBmcm9tIFMtbW9kZSwg
YnV0IGl0IGRvZXNuJ3QgbmVlZCB0aGUgZWRnZSBxdWlyay4KPgo+IFNpZ25lZC1vZmYtYnk6IEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgICAgICB8IDQgKysrKwo+
ICBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IGlu
ZGV4IGY3NTczNmEwNjFhZi4uNjRiNDNhM2MzNzQ4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0x
LjAuMC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiBAQCAtNjIsNiArNjIsMTAg
QEAgcHJvcGVydGllczoKPiAgICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1wbGljCj4g
ICAgICAgICAgICAgICAgLSBjYW5hYW4sazIxMC1wbGljCj4gICAgICAgICAgICAtIGNvbnN0OiBz
aWZpdmUscGxpYy0xLjAuMAo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVtOgo+
ICsgICAgICAgICAgICAgIC0gdGhlYWQsbGlnaHQtcGxpYwo+ICsgICAgICAgICAgLSBjb25zdDog
dGhlYWQsYzkxMC1wbGljCj4gICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAgICAtIGVudW06Cj4g
ICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLXBsaWMKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1z
aWZpdmUtcGxpYy5jCj4gaW5kZXggZTE0ODQ5MDViN2JkLi43MWFmYTJhNTg0ZDkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gQEAgLTU2OSw2ICs1NjksNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBwbGljX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICB9Cj4KPiAgSVJR
Q0hJUF9ERUNMQVJFKHNpZml2ZV9wbGljLCAic2lmaXZlLHBsaWMtMS4wLjAiLCBwbGljX2luaXQp
Owo+ICtJUlFDSElQX0RFQ0xBUkUodGhlYWRfYzkxMF9wbGljLCAidGhlYWQsYzkxMC1wbGljIiwg
cGxpY19pbml0KTsKPiAgSVJRQ0hJUF9ERUNMQVJFKHJpc2N2X3BsaWMwLCAicmlzY3YscGxpYzAi
LCBwbGljX2luaXQpOyAvKiBmb3IgbGVnYWN5IHN5c3RlbXMgKi8KPgo+ICBzdGF0aWMgaW50IF9f
aW5pdCBwbGljX2VkZ2VfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCj4gLS0KPiAyLjQw
LjAKPgpvcGVuc2JpIG5lZWRzIHRoZWFkLGM5MDAtcGxpYywgYW5kIHdlIGNvdWxkIHB1dCBtdWx0
aSBjb21wYXRpYmxlIG5hbWUKaW4gdGhlIGR0cy4gU28sIGl0J3Mgbm8gbmVlZCBoZXJlLgoKQW5v
dGhlciBxdWVzdGlvbiwgQ291bGQgd2UgY2hhbmdlIHRoZSBuYW1lIG9mIFNpZml2ZSB0byBSSVND
LVYgd2hlbgoiY2F0IC9wcm9jL2ludGVycnVwdHMiID8KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLXNpZml2ZS1wbGljLmMKYi9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGlj
LmMKaW5kZXggZmY0N2JkMGRlYzQ1Li5iNTg0NGQ3ODRiZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2
ZS1wbGljLmMKQEAgLTE3Nyw3ICsxNzcsNyBAQCBzdGF0aWMgaW50IHBsaWNfc2V0X2FmZmluaXR5
KHN0cnVjdCBpcnFfZGF0YSAqZCwKICNlbmRpZgoKIHN0YXRpYyBzdHJ1Y3QgaXJxX2NoaXAgcGxp
Y19lZGdlX2NoaXAgPSB7Ci0gICAgICAgLm5hbWUgICAgICAgICAgID0gIlNpRml2ZSBQTElDIiwK
KyAgICAgICAubmFtZSAgICAgICAgICAgPSAiUklTQy1WIFBMSUMiLAogICAgICAgIC5pcnFfZW5h
YmxlICAgICA9IHBsaWNfaXJxX2VuYWJsZSwKICAgICAgICAuaXJxX2Rpc2FibGUgICAgPSBwbGlj
X2lycV9kaXNhYmxlLAogICAgICAgIC5pcnFfYWNrICAgICAgICA9IHBsaWNfaXJxX2VvaSwKQEAg
LTE5Miw3ICsxOTIsNyBAQCBzdGF0aWMgc3RydWN0IGlycV9jaGlwIHBsaWNfZWRnZV9jaGlwID0g
ewogfTsKCiBzdGF0aWMgc3RydWN0IGlycV9jaGlwIHBsaWNfY2hpcCA9IHsKLSAgICAgICAubmFt
ZSAgICAgICAgICAgPSAiU2lGaXZlIFBMSUMiLAorICAgICAgIC5uYW1lICAgICAgICAgICA9ICJS
SVNDLVYgUExJQyIsCiAgICAgICAgLmlycV9lbmFibGUgICAgID0gcGxpY19pcnFfZW5hYmxlLAog
ICAgICAgIC5pcnFfZGlzYWJsZSAgICA9IHBsaWNfaXJxX2Rpc2FibGUsCiAgICAgICAgLmlycV9t
YXNrICAgICAgID0gcGxpY19pcnFfbWFzaywKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
