Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B13C46CD2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jan 2024 02:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hGQFBFpgnhzz7H99Ozo6XHGtInERKW0pdS93tuGDvY=; b=wmse+s8LHT2/G2
	tEffr2rw3dWi3w23Ze8fYgwCSa3cgYeZehJMmMVDeco03jbENyWJTiztW015C9xVxr+/iSPuKLyLo
	X2leAsGv8jBMJvWbDw0nA2Z2x5RUll9Jvw3AA2QLTEaNu4ky+Jx/0qvmI4DU3dacl8od9GcUBkdEO
	TVtM/egP4Ug/kA6ZdWQ0dBhNXbg5Y9thY2f/tIL0C6KSmX3UAkwYpHMk2MHwjFyS5nqIpk2+SmYq5
	g/ATU43vINPtZXj3xRSdihn+yireHU83TMIBvF8ZBHMI673v+oTIDF21jR9hkJ/W28r6dv65jSBni
	+C9y8JvRcHAFgdvJMCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMJ4N-002EM9-0j;
	Sun, 07 Jan 2024 02:39:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMJ4J-002ELb-1T;
	Sun, 07 Jan 2024 02:39:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 30B01B80185;
	Sun,  7 Jan 2024 02:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886F3C433C9;
	Sun,  7 Jan 2024 02:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704595156;
	bh=jJbJktSdzhdzV2bS3gu5EK0DeDy7WfVB0EYasXcaPjw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G/2dWfbsLN9WwONooqF8NP5eFXFFOXQ5R6pDJXrL/Xza8jKUMjyzLISO/JNRMvYNn
	 ebjH0gTMb0U4Prs0XDY60enG/LtvrGLzWjVf7Zzw8H2mYYP9S0qsp8K7Ce6UKsNFDs
	 luwaMAnTvjVJM9HUnldij5bMjLFAarf4NscxczzeoYtSCV5eoStKqOMNDLTmu19xze
	 aMrbfKIfNiIj8X1DZgs468Zb9C+7WcgK9ZNAOjucthSo1/0cLBg7F7C6N6JPLcTfxU
	 QUG04tPdXEPjgcJtJhrAkM9utpizPYOwvU0ipsvKaL5YnYtdbnpOYvyKg5CDhYcl0N
	 TIVY824fazJig==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50ea8fbf261so806879e87.2;
        Sat, 06 Jan 2024 18:39:16 -0800 (PST)
X-Gm-Message-State: AOJu0YzW23QwIZDloM7i0xgtYA+EEjSPjomzrk7GX6EtucMK42TMJOlk
	qHO/rXl6/rC9FbATLxxnNZHjogVA4uv3eAcsAJQ=
X-Google-Smtp-Source: AGHT+IE666iz2mwVRCBnzGP5r7CatHWfsTic6W1ztccc+lpU8OH145j+/Z8tY3bo1scDBlBwbi74pfIJZJaXjjloGT8=
X-Received: by 2002:a05:6512:3a82:b0:50e:8ead:3889 with SMTP id
 q2-20020a0565123a8200b0050e8ead3889mr731610lfu.75.1704595154779; Sat, 06 Jan
 2024 18:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-8-samuel.holland@sifive.com> <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
 <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
In-Reply-To: <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 7 Jan 2024 10:39:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4JxP-j5A7KuNSBncZkHF9i3O1njCtMjVkd3=RNbE5Q7w@mail.gmail.com>
Message-ID: <CAAhV-H4JxP-j5A7KuNSBncZkHF9i3O1njCtMjVkd3=RNbE5Q7w@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_183919_822511_531DD378 
X-CRM114-Status: GOOD (  22.00  )
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

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCAxMTo1OOKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEh1YWNhaSwKPgo+IE9uIDIwMjQtMDEt
MDQgMzo1NSBBTSwgSHVhY2FpIENoZW4gd3JvdGU6Cj4gPiBIaSwgU2FtdWVsLAo+ID4KPiA+IE9u
IFRodSwgRGVjIDI4LCAyMDIzIGF0IDk6NDLigK9BTSBTYW11ZWwgSG9sbGFuZAo+ID4gPHNhbXVl
bC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gTG9vbmdBcmNoIGFscmVhZHkg
cHJvdmlkZXMga2VybmVsX2ZwdV9iZWdpbigpIGFuZCBrZXJuZWxfZnB1X2VuZCgpIGluCj4gPj4g
YXNtL2ZwdS5oLCBzbyBpdCBvbmx5IG5lZWRzIHRvIGFkZCBrZXJuZWxfZnB1X2F2YWlsYWJsZSgp
IGFuZCBleHBvcnQKPiA+PiB0aGUgQ0ZMQUdTIGFkanVzdG1lbnRzLgo+ID4+Cj4gPj4gQWNrZWQt
Ynk6IFdBTkcgWHVlcnVpIDxnaXRAeGVuMG4ubmFtZT4KPiA+PiBSZXZpZXdlZC1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gPj4gLS0tCj4gPj4KPiA+PiAobm8gY2hh
bmdlcyBzaW5jZSB2MSkKPiA+Pgo+ID4+ICBhcmNoL2xvb25nYXJjaC9LY29uZmlnICAgICAgICAg
ICB8IDEgKwo+ID4+ICBhcmNoL2xvb25nYXJjaC9NYWtlZmlsZSAgICAgICAgICB8IDUgKysrKy0K
PiA+PiAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vZnB1LmggfCAxICsKPiA+PiAgMyBmaWxl
cyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9hcmNoL2xvb25nYXJjaC9LY29uZmlnIGIvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+
ID4+IGluZGV4IGVlMTIzODIwYTQ3Ni4uNjVkNDQ3NTU2NWI4IDEwMDY0NAo+ID4+IC0tLSBhL2Fy
Y2gvbG9vbmdhcmNoL0tjb25maWcKPiA+PiArKysgYi9hcmNoL2xvb25nYXJjaC9LY29uZmlnCj4g
Pj4gQEAgLTE1LDYgKzE1LDcgQEAgY29uZmlnIExPT05HQVJDSAo+ID4+ICAgICAgICAgc2VsZWN0
IEFSQ0hfSEFTX0NQVV9GSU5BTElaRV9JTklUCj4gPj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNf
Rk9SVElGWV9TT1VSQ0UKPiA+PiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19LQ09WCj4gPj4gKyAg
ICAgICBzZWxlY3QgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JUIGlmIENQVV9IQVNfRlBVCj4g
Pj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfTk1JX1NBRkVfVEhJU19DUFVfT1BTCj4gPj4gICAg
ICAgICBzZWxlY3QgQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UKPiA+PiAg
ICAgICAgIHNlbGVjdCBBUkNIX0hBU19QVEVfU1BFQ0lBTAo+ID4+IGRpZmYgLS1naXQgYS9hcmNo
L2xvb25nYXJjaC9NYWtlZmlsZSBiL2FyY2gvbG9vbmdhcmNoL01ha2VmaWxlCj4gPj4gaW5kZXgg
NGJhOGQ2N2RkYjA5Li4xYWZlMjhmZWFiYTUgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9sb29uZ2Fy
Y2gvTWFrZWZpbGUKPiA+PiArKysgYi9hcmNoL2xvb25nYXJjaC9NYWtlZmlsZQo+ID4+IEBAIC0y
NSw2ICsyNSw5IEBAIGVuZGlmCj4gPj4gIDMyYml0LWVtdWwgICAgICAgICAgICAgPSBlbGYzMmxv
b25nYXJjaAo+ID4+ICA2NGJpdC1lbXVsICAgICAgICAgICAgID0gZWxmNjRsb29uZ2FyY2gKPiA+
Pgo+ID4+ICtDQ19GTEFHU19GUFUgICAgICAgICAgIDo9IC1tZnB1PTY0Cj4gPj4gK0NDX0ZMQUdT
X05PX0ZQVSAgICAgICAgICAgICAgICA6PSAtbXNvZnQtZmxvYXQKPiA+IFdlIHdpbGwgYWRkIExv
b25nQXJjaDMyIHN1cHBvcnQgbGF0ZXIsIG1heWJlIGl0IHNob3VsZCBiZSAtbWZwdT0zMiBpbgo+
ID4gdGhhdCBjYXNlLCBhbmQgZG8gb3RoZXIgYXJjaHMgaGF2ZSB0aGUgY2FzZSB0aGF0IG9ubHkg
c3VwcG9ydCBGUDMyPwo+Cj4gRG8geW91IG1lYW4gdGhhdCBMb29uZ0FyY2gzMiBkb2VzIG5vdCBz
dXBwb3J0IGRvdWJsZS1wcmVjaXNpb24gRlAgaW4gaGFyZHdhcmU/Cj4gQXQgbGVhc3QgYm90aCBv
ZiB0aGUgY29uc3VtZXJzIGluIHRoaXMgc2VyaWVzIHVzZSBkb3VibGUtcHJlY2lzaW9uLCBzbyBt
eSBmaXJzdAo+IHRob3VnaHQgaXMgdGhhdCBMb29uZ0FyY2gzMiBjb3VsZCBub3Qgc2VsZWN0IEFS
Q0hfSEFTX0tFUk5FTF9GUFVfU1VQUE9SVC4KVGhlbiBpcyBpdCBwb3NzaWJsZSB0byBpbnRyb2R1
Y2UgQ0NfRkxBR1NfU1BfRlBVIGFuZCBDQ19GTEFHU19EUF9GUFU/CkkgdGhpbmsgdGhlcmUgbWF5
IGJlIHNvbWUgcGxhY2Ugd2hlcmUgU1AgRlAgaXMgZW5vdWdoLgoKSHVhY2FpCgo+Cj4gUmVnYXJk
cywKPiBTYW11ZWwKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
