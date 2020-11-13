Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02F6C4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 14:32:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E89B2078B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 14:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4wmc35S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E89B2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QcFCO+lCS/vVMkb36WBFtqRkjXIvKpdC2MFVilhzqd8=; b=r4wmc35S9YgwsvOcWuNqdu/Yg
	NfX1qtRYJSnoCemmm158bOToWC+kjS9kPl+GfGwrlGeylWtjRo4hk5GuX80XD6tEhOUOtbYF1ZUzM
	a6JqLJsVekLKvuYFKxPz8hXq6nvosAfDlxu2dtpDSjcoDChW6ElUmig5Pt79YS5d/k0zEIp2OtOX2
	MgTkobRIV/RDSjRWgabAmU1Egt5eTlI/u11MQx5dXpOFlVwRYeoeIXaeC9PX6ZK5g+/GqJfC6hoP8
	cLi0KvH+bhv0WqXa5zueBmoxh92oRmJR8VZZuzKnuXeZMu/I+wWTLvFGKW8RK5UIk0hx9gsNDne8A
	gfQ1pZqTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kda87-0002Hf-Bw; Fri, 13 Nov 2020 14:32:47 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kda7t-00028v-Ag; Fri, 13 Nov 2020 14:32:44 +0000
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1kda7j-0002Xg-Ge; Fri, 13 Nov 2020 15:32:23 +0100
Received: from [85.7.101.30] (helo=pc-9.home)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1kda7j-0008Cr-9w; Fri, 13 Nov 2020 15:32:23 +0100
Subject: Re: csum_partial() on different archs (selftest/bpf)
To: Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn.topel@gmail.com>
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
 <20201113122440.GA2164@myrica>
 <CAJ+HfNiE5Oa25QgdAdKzfk-=X45hXLKk_t+ZCiSaeFVTzgzsrw@mail.gmail.com>
 <20201113141542.GJ3576660@ZenIV.linux.org.uk>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <f634b437-aa51-736b-e2f3-f6210fc6a711@iogearbox.net>
Date: Fri, 13 Nov 2020 15:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20201113141542.GJ3576660@ZenIV.linux.org.uk>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.102.4/25987/Fri Nov 13 14:19:33 2020)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_093233_490134_285AD87E 
X-CRM114-Status: GOOD (  21.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tom Herbert <tom@herbertland.com>, Anders Roxell <anders.roxell@gmail.com>,
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMTMvMjAgMzoxNSBQTSwgQWwgVmlybyB3cm90ZToKPiBPbiBGcmksIE5vdiAxMywgMjAy
MCBhdCAwMjoyMjoxNlBNICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IAo+PiBGb2xkaW5n
IEFsJ3MgaW5wdXQgdG8gdGhpcyByZXBseS4KPj4KPj4gSSB0aGluayB0aGUgYnBmX2NzdW1fZGlm
ZigpIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgaW4gY29tYmluYXRpb24gd2l0aAo+PiBhbm90aGVy
IGhlbHBlcihzKSAoZS5nLiBicGZfbDRfY3N1bV9yZXBsYWNlKSBzbyBJJ2QgZ3Vlc3MgdGhlIHJl
dHVybmVkCj4+IF9fd3N1bSBzaG91bGQgYmUgc2VlbiBhcyBhbiBvcGFxdWUgdmFsdWUsIG5vdCBz
b21ldGhpbmcgQlBGIHVzZXJsYW5kCj4+IGNhbiByZWx5IG9uLgo+IAo+IFdoeSBub3QgcmVkdWNl
IHRoZSBzdWNrZXIgbW9kdWxvIDB4ZmZmZiBiZWZvcmUgcmV0dXJuaW5nIGl0PyAgSW5jaWRlbnRh
bGx5LAo+IGltcGxlbWVudGF0aW9uIGlzIGJsb29keSBhd2Z1bDoKPiAKPiAgICAgICAgICAvKiBU
aGlzIGlzIHF1aXRlIGZsZXhpYmxlLCBzb21lIGV4YW1wbGVzOgo+ICAgICAgICAgICAqCj4gICAg
ICAgICAgICogZnJvbV9zaXplID09IDAsIHRvX3NpemUgPiAwLCAgc2VlZCA6PSBjc3VtIC0tPiBw
dXNoaW5nIGRhdGEKPiAgICAgICAgICAgKiBmcm9tX3NpemUgPiAwLCAgdG9fc2l6ZSA9PSAwLCBz
ZWVkIDo9IGNzdW0gLS0+IHB1bGxpbmcgZGF0YQo+ICAgICAgICAgICAqIGZyb21fc2l6ZSA+IDAs
ICB0b19zaXplID4gMCwgIHNlZWQgOj0gMCAgICAtLT4gZGlmZmluZyBkYXRhCj4gICAgICAgICAg
ICoKPiAgICAgICAgICAgKiBFdmVuIGZvciBkaWZmaW5nLCBmcm9tX3NpemUgYW5kIHRvX3NpemUg
ZG9uJ3QgbmVlZCB0byBiZSBlcXVhbC4KPiAgICAgICAgICAgKi8KPiAgICAgICAgICBpZiAodW5s
aWtlbHkoKChmcm9tX3NpemUgfCB0b19zaXplKSAmIChzaXplb2YoX19iZTMyKSAtIDEpKSB8fAo+
ICAgICAgICAgICAgICAgICAgICAgICBkaWZmX3NpemUgPiBzaXplb2Yoc3AtPmRpZmYpKSkKPiAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IAo+ICAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBmcm9tX3NpemUgLyBzaXplb2YoX19iZTMyKTsgaSsrLCBqKyspCj4gICAgICAgICAgICAg
ICAgICBzcC0+ZGlmZltqXSA9IH5mcm9tW2ldOwo+ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCAg
IHRvX3NpemUgLyBzaXplb2YoX19iZTMyKTsgaSsrLCBqKyspCj4gICAgICAgICAgICAgICAgICBz
cC0+ZGlmZltqXSA9IHRvW2ldOwo+IAo+ICAgICAgICAgIHJldHVybiBjc3VtX3BhcnRpYWwoc3At
PmRpZmYsIGRpZmZfc2l6ZSwgc2VlZCk7Cj4gCj4gV2hhdCB0aGUgaGVsbCBpcyB0aGlzIChjb3B5
aW5nLCBzY3JhdGNocGFkLCBldGMuKSBmb3I/ICBGaXJzdCBvZiBhbGwsCj4gX2lmXyB5b3Ugd2Fu
dCB0byB1c2UgY3N1bV9wYXJ0aWFsKCkgYXQgYWxsIChhbmQgSSdtIG5vdCBhdCBhbGwgc3VyZQo+
IHRoYXQgaXQgd29uJ3QgYmUgY2hlYXBlciB0byBqdXN0IGdvIG92ZXIgdHdvIGFycmF5cywgZG9p
bmcgY3N1bV9hZGQoKQo+IGFuZCBjc3VtX3N1YigpIHJlc3AuIC0gZGVwZW5kcyB1cG9uIHRoZSBy
ZWFsaXN0aWMgc2l6ZXMpLCB5b3UgZG9uJ3QKPiBuZWVkIHRvIGNvcHkgYW55dGhpbmcuICBGaW5k
IHRoZSBzdW0gb2YgZnJvbSwgZmluZCB0aGUgc3VtIG9mIHRvIGFuZAo+IHRoZW4gc3VidHJhY3Qg
KGNzdW1fc3ViKCkpIHRoZSBvbGQgc3VtIGZyb20gdGhlIHNlZWQgYW5kIGFuZCBhZGQgdGhlCj4g
bmV3IG9uZS4uLgo+IAo+IEFuZCBJIHdvdWxkIHN0cm9uZ2x5IHJlY29tbWVuZCB0byBjaGFuZ2Ug
dGhlIGNhbGxpbmcgY29udmVudGlvbnMgb2YgdGhhdAo+IHRoaW5nIC0gbWFrZSBpdCByZXR1cm4g
X19zdW0xNi4gIEFuZCB0YWtlIF9fc3VtMTYgYXMgd2VsbC4uLgo+IAo+IEFnYWluLCBleHBvc2lu
ZyBfX3dzdW0gdG8gYW55dGhpbmcgdGhhdCBsb29rcyBsaWtlIGEgc3RhYmxlIEFCSSBpcwo+IGEg
bWlzdGFrZSAtIGl0J3MgYW4gaW50ZXJuYWwgZGV0YWlsIHRoYXQgY2FuIGJlIGVhc2lseSBhYnVz
ZWQsCj4gY2F1c2luZyB1bnBsZWFzYW50IGNvbXBhdCBwcm9ibGVtcy4KCkknbGwgdGFrZSBhIGxv
b2sgYXQgYm90aCwgcmVtb3ZpbmcgdGhlIGNvcHlpbmcgYW5kIGFsc28gd3J0IG5vdCBicmVha2lu
ZwpleGlzdGluZyB1c2VycyBmb3IgY2FzY2FkaW5nIHRoZSBoZWxwZXIgd2hlbiBmaXhpbmcuCgpU
aGFua3MsCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
