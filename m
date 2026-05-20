Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE39CD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdkOnYyoInrgLbpBuxaO1M9tO7zhj+faLZGaOj36Hb4=; b=4Vr49OXUX0qpdh
	nKrRNM5cABqZLuXsA/VNAKR+5c6sbAOzX9ZoUDwbWuqv+ECKBStzL8QIo+l6TJ75O8FgW9Lyx7PL1
	7SwBqbUwc94o7dejVwv1rzVf2NYMjLFZqhcDKB8aunjA+erMqpEXWQq2N8oQNkGG6K7ok7skl73QO
	FFDzuu6rjgFWWTFQBuwnFvnBg1/sq476hSHoptiuztZoGupTbBVWDSwExL9CfO7nMhTWOIReRdIji
	Fqn4T++sRvNX3xZ5GyeZVw4fS8MlQDNa/x27aqgjEIL5MsZWIEa/ZWOpZWiBwPjn4+CEq/Ds5/0OS
	7yQINogIRk4zkZZ4iHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPce2-000000041hA-1aT2;
	Wed, 20 May 2026 08:51:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcdz-000000041fQ-3Qiz
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 08:51:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45d96d21e82so2638991f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779267070; x=1779871870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbvXViJel1Le/J9X4fXxBeJeobwg96GmEPUlEiUp2HM=;
        b=U1Ty1DvvStyHLOCfTSpI6+a7vgFJIYfGZ082n6qWexw5mXyay0cmAWCiPVEE7CMby8
         8v3YdyOiGMZ7HWMCLRWV2FA9Z13sDa80TqyeM5SxrtJnbylhPpVMZhsjndMZ2WW3W78V
         KZsE2nfv6glR6xinxhdXB3rH1qzxrITkfcA6CfPGL7OjC+QwWuJPcWIlijBV4PB6RoHq
         1/OHyoo2tmpbreOUzVSOg7b0aTLjBMCLe660BZmQlQN1dYdsEUYNYhW9EQi0fhfUt1I+
         0QcpWeMQmWDwJDZKLhca32wW3kDnEWrEAVEepyXuzYtQF7fw0WCjAc01U5+k/xUW8reS
         lH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779267070; x=1779871870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KbvXViJel1Le/J9X4fXxBeJeobwg96GmEPUlEiUp2HM=;
        b=j1XPQDLBRV6tssPeEhFPA50QaC9+QwBgJ9y0G+uSFCGI8Fun1e7EfaZMBvPogyqmvP
         RsuQ6jvPJMPnwUAxej9qC+m1U7IslHG1mai7gb3tayj+pi7RjWSRJdm+hcuWZT0GbElu
         NSEOpZBe22YyGY8sSb15mpGVmh8oUak9xkSkEZoeGj8Jzk9U4uv7zkTQCbCggPuwaCcQ
         ICZF+sYefr1akTOnjYCL7glT3lzWQPbTLIbfNBIh+tr+vYPyflLvrXLnXZXqeqKCes66
         i+3g3kHiU/tos9KS9y03/8Oa+roUfgv4G5g1uofLKSU4Vvyz90//Rruxmch8eZKQvYrm
         Vo6w==
X-Forwarded-Encrypted: i=1; AFNElJ+sMfKUm9VMzGbZoDRgb2T5Kc7P4WoS7EtCycRiqFyeWuiNxNQZA5cup2QYxf0FbHSXoSUybeWqQtUQoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt7DRGL3rTN57P7QIO44xQPAT5WgcSazSrRCxl6D6KWLa7LXsT
	WPb4MXqFIqlMb1RK/Dq/uiEPwnWfppu0EI19zthrqwKE9/0GEq9Lc2ir
X-Gm-Gg: Acq92OG9XHN47PIj0vQwqKEuFNkHZzyiYOkkP2Tr/+yzt3zs6kLVBhjzvDi3+lcShkG
	4jpDUr6tm2P96JhHHNQjV7CUeUdr8/KlhJMO3CIHeoWIsmjWEVY0GvNfzSypf3wHr/ovo4zGT3P
	RcbxyI8/0sP2r5LMViA2Wt++mEGT4l1tspzanV3KWqUfKxVQNctT8nl/ogqaQZUXeZBbSm3oXuY
	AN4TJg5+eB+UsLrWaqJVqWnDuWYRULcWjdmGO3P5FPK00B8zZ49v0p6tK1Y9Riw+SiP1OM9NvjF
	iV6nSLylaqk2VqbDJzW/WoUH2eaL7PJXrbNCt+xXc8lTx5LT7Pkp61yjpHf2fsnEtA53kNw/cfF
	e7jaSbhcZwf88su/R8NHj+RgQ5tHx1O6RAPlLCqYXUVZ5Pk1P74cT2KRyfuBII7XKGqsQa9NjIy
	LB/gFnLKcJ03BI6TtHQMhf06sVIwgXyHsqiJ1OCRNvqFctdayaP04rYSg22T0vIcLMBaCtBwYFb
	i8=
X-Received: by 2002:a05:600c:848c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fe60e5241mr368780515e9.3.1779267069635;
        Wed, 20 May 2026 01:51:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm205712165e9.11.2026.05.20.01.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:51:09 -0700 (PDT)
Date: Wed, 20 May 2026 09:51:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: Ron Economos <re@w6rz.net>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] riscv: cif: reduce shadow stack size limit from 4GB
 to 512MB
Message-ID: <20260520095107.1bf48926@pumpkin>
In-Reply-To: <CANXhq0r2ieA-53d=GTvLU4o2qzVTPc7pcxC_Y_pX=a=CiAB=wA@mail.gmail.com>
References: <20260519071809.3823470-1-zong.li@sifive.com>
	<ccfe25b8-df25-49b6-a40e-d86630cbc407@w6rz.net>
	<CANXhq0rH+_FN+HcqK1_PwkgYfhN5KmcTRnk7pt8GzEhfiT4fpQ@mail.gmail.com>
	<CANXhq0r2ieA-53d=GTvLU4o2qzVTPc7pcxC_Y_pX=a=CiAB=wA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_015111_916529_28E9668B 
X-CRM114-Status: GOOD (  41.10  )
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

T24gV2VkLCAyMCBNYXkgMjAyNiAxMzo1OTo0NCArMDgwMApab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIE1heSAxOSwgMjAyNiBhdCA1OjIw4oCvUE0gWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE1heSAxOSwgMjAy
NiBhdCA0OjI44oCvUE0gUm9uIEVjb25vbW9zIDxyZUB3NnJ6Lm5ldD4gd3JvdGU6ICAKPiA+ID4K
PiA+ID4gT24gNS8xOS8yNiAwMDoxOCwgWm9uZyBMaSB3cm90ZTogIAo+ID4gPiA+IFJhdGlvbmFs
ZToKPiA+ID4gPgo+ID4gPiA+IDEuIFNoYWRvdyBzdGFja3Mgb25seSBzdG9yZSByZXR1cm4gYWRk
cmVzc2VzICg4IGJ5dGVzIHBlciBlbnRyeSksIG5vdAo+ID4gPiA+ICAgICBsb2NhbCB2YXJpYWJs
ZXMsIGZ1bmN0aW9uIHBhcmFtZXRlcnMsIG9yIHNhdmVkIHJlZ2lzdGVycy4gQSA1MTJNQgo+ID4g
PiA+ICAgICBzaGFkb3cgc3RhY2sgaXMgZmFyIG1vcmUgdGhhbiBzdWZmaWNpZW50IGZvciBhbnkg
cHJhY3RpY2FsCj4gPiA+ID4gICAgIGFwcGxpY2F0aW9uLCBldmVuIHdpdGggZXh0cmVtZWx5IGRl
ZXAgcmVjdXJzaW9uLiBUaGlzIHNpemUKPiA+ID4gPiAgICAgbWFpbnRhaW5zIGFkZXF1YXRlIHdo
aWxlIGJlaW5nIG1vcmUgcmVzb3VyY2UtZWZmaWNpZW50IG1hcmdpbgo+ID4gPiA+Cj4gPiA+ID4g
Mi4gT24gbWVtb3J5LWNvbnN0cmFpbmVkIHN5c3RlbXMgKGUuZy4sIHBsYXRmb3JtcyB3aXRoIG9u
bHkgNEdCIG9mCj4gPiA+ID4gICAgIHBoeXNpY2FsIG1lbW9yeSwgd2hpY2ggaXMgYSBjb21tb24g
Y29uZmlndXJhdGlvbiksIGFsbG9jYXRpbmcgNEdCCj4gPiA+ID4gICAgIG9mIHZpcnR1YWwgYWRk
cmVzcyBzcGFjZSBmb3Igc2hhZG93IHN0YWNrIHBlciBwcm9jZXNzL3RocmVhZCBjYW4KPiA+ID4g
PiAgICAgbGVhZCB0byB2aXJ0dWFsIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVzIHdoZW4gdGhl
IG92ZXJjb21taXQgbW9kZQo+ID4gPiA+ICAgICBpcyBzZXQgdG8gT1ZFUkNPTU1JVF9HVUVTUyBv
ciBPVkVSQ09NTUlUX05FVkVSOgo+ID4gPiA+ICAgICBFcnJvcjogIl9fdm1fZW5vdWdoX21lbW9y
eTogbm90IGVub3VnaCBtZW1vcnkgZm9yIHRoZSBhbGxvY2F0aW9uIgo+ID4gPiA+Cj4gPiA+ID4g
U3VnZ2VzdGVkLWJ5OiBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4g
PiA+IC0tLQo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlZCBpbiB2NDoKPiA+ID4gPiAtIEZpeCB3cm9u
ZyBzdWJqZWN0LiBJdCBpcyA1MTJNQiBpbnN0ZWFkIG9mIDJHQgo+ID4gPiA+Cj4gPiA+ID4gQ2hh
bmdlZCBpbiB2MzoKPiA+ID4gPiAtIFJlbW92ZSBtYXgoKS4gUEFHRV9BTElHTigpIGFscmVhZHkg
cm91bmRzIHVwCj4gPiA+ID4gLSBDaGFuZ2Ugc3RhY2sgc2l6ZSB0byBSTElNSVRfU1RBQ0svOCB3
aXRoIFNaXzUxMk0gY2FwLiBTdWdnZXN0ZWQgYnkgRGF2aWQgTGFpZ2h0Cj4gPiA+ID4KPiA+ID4g
PiBDaGFuZ2VkIGluIHYyOgo+ID4gPiA+IC0gQWRkIG1heCgpIGluIGNhc2UgUkxJTUlUX1NUQUNL
IGlzIHNtYWxsZXIgdGhhbiBQQUdFX1NJWkUuIFN1Z2dlc3RlZCBieQo+ID4gPiA+ICAgIFBhdWwg
V2FsbXNsZXkgYW5kIFNhc2hpa28KPiA+ID4gPgo+ID4gPiA+IENoYW5nZWQgaW4gdjE6Cj4gPiA+
ID4gLSBVc2UgbWluKCkgaW5zdGVhZCBvZiBtaW5fdCgpLiBTdWdnZXN0ZWQgYnkgRGF2aWQgTGFp
Z2h0Cj4gPiA+ID4KPiA+ID4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYyB8IDYgKysr
LS0tCj4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJj
ZmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+ID4gPiA+IGluZGV4IDZlYWEwZDk0
ZmRmZS4uMjAzNjkxOGE3N2RiIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3VzZXJjZmkuYwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VzZXJjZmkuYwo+ID4g
PiA+IEBAIC0xMDksMTUgKzEwOSwxNSBAQCB2b2lkIHNldF9pbmRpcl9scF9sb2NrKHN0cnVjdCB0
YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBsb2NrKQo+ID4gPiA+ICAgICAgIHRhc2stPnRocmVhZF9p
bmZvLnVzZXJfY2ZpX3N0YXRlLnVmY2ZpX2xvY2tlZCA9IGxvY2s7Cj4gPiA+ID4gICB9Cj4gPiA+
ID4gICAvKgo+ID4gPiA+IC0gKiBJZiBzaXplIGlzIDAsIHRoZW4gdG8gYmUgY29tcGF0aWJsZSB3
aXRoIHJlZ3VsYXIgc3RhY2sgd2Ugd2FudCBpdCB0byBiZSBhcyBiaWcgYXMKPiA+ID4gPiAtICog
cmVndWxhciBzdGFjay4gRWxzZSBQQUdFX0FMSUdOIGl0IGFuZCByZXR1cm4gYmFjawo+ID4gPiA+
ICsgKiBUaGUgc2hhZG93IHN0YWNrIG9ubHkgc3RvcmVzIHRoZSByZXR1cm4gYWRkcmVzcyBhbmQg
bm90IGFueSB2YXJpYWJsZXMKPiA+ID4gPiArICogNTEyTSBzaG91bGQgYmUgbW9yZSB0aGFuIHN1
ZmZpY2llbnQgZm9yIG1vc3QgYXBwbGljYXRpb25zLgo+ID4gPiA+ICAgICovCj4gPiA+ID4gICBz
dGF0aWMgdW5zaWduZWQgbG9uZyBjYWxjX3Noc3RrX3NpemUodW5zaWduZWQgbG9uZyBzaXplKQo+
ID4gPiA+ICAgewo+ID4gPiA+ICAgICAgIGlmIChzaXplKQo+ID4gPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIFBBR0VfQUxJR04oc2l6ZSk7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICByZXR1cm4gUEFH
RV9BTElHTihtaW5fdCh1bnNpZ25lZCBsb25nIGxvbmcsIHJsaW1pdChSTElNSVRfU1RBQ0spLCBT
Wl80RykpOwo+ID4gPiA+ICsgICAgIHJldHVybiBQQUdFX0FMSUdOKG1pbihybGltaXQoUkxJTUlU
X1NUQUNLKSAvIDgsIFNaXzUxMk0pKTsKPiA+ID4gPiAgIH0KPiA+ID4gPgo+ID4gPiA+ICAgLyog
IAo+ID4gPgo+ID4gPiBKdXN0IEZZSSwgeW91ciBWMiB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggd2Fz
IG1lcmdlZCBpbiBMaW51eCA3LjEtcmM0IChjb21taXQgNmM3Njc0YjViN2FlNTEzY2VjYWUyMmFh
OWRjZGNmNTMzODYyY2Y1YykuIFlvdSBuZWVkIHRvCj4gPiA+IHJlYmFzZSwgb3RoZXJ3aXNlIHRo
aXMgcGF0Y2ggd29uJ3QgYXBwbHkuICAKPiA+ICAKPiAKPiBIaSBEYXZpZCwKPiBTaW5jZSB0aGUg
b3JpZ2luYWwgcGF0Y2ggaGFzIGJlZW4gbWVyZ2VkLCB3b3VsZCB5b3UgbGlrZSB0byBzZW5kIGEg
bmV3Cj4gcGF0Y2ggZnJvbSB5b3VyIHNpZGUgdG8gYWRqdXN0IHRoZSBzaXplPyBPciBkbyB5b3Ug
cHJlZmVyIHRoYXQgSSBkbwo+IHRoYXQgZm9yIHlvdT8gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIg
dGhvdWdodHMuIFRoYW5rcwoKSXQncyBpcyBwcm9iYWJseSBlYXNpZXIgZm9yIHlvdSB0byBkbyBp
dC4KSSdkIG5lZWQgdG8gZmluZCBhIGNsZWFuIGVub3VnaCBzb3VyY2UgdHJlZS4KKEkndmUgZ290
IGEgcGFydC1jb21taXR0ZWQgc2V0IG9mIGNoYW5nZXMgdG8gcmVtb3ZlIHN0cmNweSgpIGZyb20K
MTUwIGZpbGVzICdpbiBwcm9ncmVzcycuKQoKLS0gRGF2aWQKCgo+IAo+ID4gVGhhbmsgeW91IGZv
ciBwb2ludGluZyB0aGlzIG91dC4gUGVyaGFwcyBsZXQncyBkcm9wIHRoaXMgc2VyaWVzIGFuZAo+
ID4gc2VuZCBhIG5ldyBvbmUgdG8gZXhwbGFpbiB3aHkgd2Ugd2FudCB0byByZWR1Y2UgdGhlIHNp
emUgdG8gNTEyTUIKPiA+ICAKPiA+ID4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
