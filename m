Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE64C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YZAxaEaSW6QpNKxrzrKdvlBjnULC6tZMFWALTvh1Co=; b=L8BF4iSosd9TZC
	OsbCKEXB/VNGM3wIQjdasK7iKxyVUwd9FNOZdwGla+cH4mKLbfsVabwxdDXYcbkL58UINSHtloFhB
	iYkxuTpid48slY1hwYFxIOt6Y4l7VovmFGpOXItSSrlymCc54Fd3dRPFDrMK9vCiEBxUXOMULtXkO
	HNUNcnWClIHENf4XNJUfy4k30YDusRsjz6vCkB5bADgo7pBOCl7+8FRSgjQkpDVUrKRIVjNcqZo5f
	g9WBHL+jKjPXRtGai82bfkTa1VhMTpjOruytZ6Fb3yNU6l2mQOk1GtNoiZ5JMLrODKGJ948H+MvKz
	0jIyfBrdewwqurzPCkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSCb-00000009fzE-0NBe;
	Mon, 15 Apr 2024 19:41:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwSCX-00000009fw2-2pGq
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 19:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 858AECE0EDC;
	Mon, 15 Apr 2024 19:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF39C113CC;
	Mon, 15 Apr 2024 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713210070;
	bh=c88aT9uSkW8Wa6uVyZD8LuIy0fX3f9Ky0S7uWq9mvQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X68uGwjXzKz0fwXuVWglnVmtjb8qUFt0+9nP0i3Fh6inoupbLbEmeOsUeFr3Vlyu2
	 /rIaj/7xrtoELSRzrikvjHJzvBXG6Y0HGwvmfuE8JXG3fGbyUYJTw1FDlbQqif2rxr
	 rdSfVD5LsKfQK86tKtHslMvJYmCdmnsksFWx63JIrpnCmpecx7GDTRe3gLBp2VKi48
	 9pLugPwYPPZ6eJW1sqZaeTR0lBloo9rgt4RPccFBTdgwa5NybNYw0HIr0aBbC1D15J
	 3dxw/0B9HIOAgdH6EbCtVKWNmmscw0jRSf+0Vu81xEUZgT9DHFqiVH8eyesDjtrHwa
	 ycgl8QvkK1BnA==
Date: Mon, 15 Apr 2024 14:41:05 -0500
From: Rob Herring <robh@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	lstoakes@gmail.com, shuah@kernel.org, brauner@kernel.org,
	andy.chiu@sifive.com, jerry.shih@sifive.com,
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, charlie@rivosinc.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <20240415194105.GA94432-robh@kernel.org>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
 <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_124114_236925_7396CFBC 
X-CRM114-Status: GOOD (  16.61  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMDI6Mzc6MjFQTSAtMDcwMCwgRGVlcGFrIEd1cHRhIHdy
b3RlOgo+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDQ6NTjigK9BTSBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEFwciAwMywgMjAyNCBhdCAwNDoz
NDo1MlBNIC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gPiA+IE1ha2UgYW4gZW50cnkgZm9y
IGNmaSBleHRlbnNpb25zIGluIGV4dGVuc2lvbnMueWFtbC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAgICAgICAgIHwg
MTAgKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiA+
ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiA+IGluZGV4IDYzZDgxZGM4OTVlNS4uNDViODdhZDZj
YzFjIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ID4gQEAgLTMxNyw2ICszMTcsMTYg
QEAgcHJvcGVydGllczoKPiA+ID4gICAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaaWNib3ogZXh0
ZW5zaW9uIGZvciBjYWNoZS1ibG9jayB6ZXJvaW5nIGFzIHJhdGlmaWVkCj4gPiA+ICAgICAgICAg
ICAgICBpbiBjb21taXQgM2RkNjA2ZiAoIkNyZWF0ZSBjbW9iYXNlLXYxLjAucGRmIikgb2Ygcmlz
Y3YtQ01Pcy4KPiA+ID4KPiA+ID4gKyAgICAgICAgLSBjb25zdDogemljZmlscAo+ID4gPiArICAg
ICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFppY2Zp
bHAgZXh0ZW5zaW9uIGZvciBlbmZvcmNpbmcgZm9yd2FyZCBlZGdlIGNvbnRyb2wtZmxvdwo+ID4g
PiArICAgICAgICAgICAgaW50ZWdyaXR5IGluIGNvbW1pdCAzYTIwZGM5IG9mIHJpc2N2LWNmaSBh
bmQgaXMgaW4gcHVibGljIHJldmlldy4KPiA+Cj4gPiBEb2VzIGluIHB1YmxpYyByZXZpZXcgbWVh
biB0aGUgY29tbWl0IHNoYSBpcyBnb2luZyB0byBjaGFuZ2U/Cj4gPgo+IAo+IExlc3MgbGlrZWx5
LiBOZXh0IHN0ZXAgYWZ0ZXIgcHVibGljIHJldmlldyBpcyB0byBnYXRoZXIgY29tbWVudHMgZnJv
bQo+IHB1YmxpYyByZXZpZXcuCj4gSWYgc29tZXRoaW5nIGlzIHJlYWxseSBwcmVzc2luZyBhbmQg
bmVlZHMgdG8gYmUgYWRkcmVzc2VkLCB0aGVuIHllcwo+IHRoaXMgd2lsbCBjaGFuZ2UuCj4gRWxz
ZSB0aGlzIGdldHMgcmF0aWZpZWQgYXMgaXQgaXMuCgpJZiB0aGUgY29tbWl0IHNoYSBjYW4gY2hh
bmdlLCB0aGVuIGl0IGlzIHVzZWxlc3MuIFdoYXQncyB0aGUgZ3VhcmFudGVlIApzb21lb25lIGlz
IGdvaW5nIHRvIHJlbWVtYmVyIHRvIHVwZGF0ZSBpdCBpZiBpdCBjaGFuZ2VzPwoKUm9iCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
