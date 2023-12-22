Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E8BC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpR0RGHPUab2CoaBSgfHSg7bBvt9o83j70r6Fdnwcfo=; b=mI2Rpmmazptm3Q
	HeVMg9Ub9wJQ30sFpZPZwvqNu+KT4qnxLxUbo3VrIS9xvNEa2TlEcqxXxD3c8rYgihG1ysto/79IJ
	yolQcqq762eWisdgSlukT484IqLROnd1+rg/EBd3nPcmY7BV9feYOxmG6rrk5FOEEmkpa85al5TL9
	y2fYcVVjDvEkH2pSzVSx87n8DtLWI0TYoKJ/tqTdiSEh+Se6Dp+dPmWbuQ4/iK9Xwn6vZPgAI1PgP
	+CGjcsJ4yyI8Y1NG/LDmUPDyfkIlgBC/Yk0Ju/iy8WhI4hgEgD3upjSFHQ+AirwxDLlwAxwrN2Jv3
	wzthYNXEzoVtR9CrA6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGj8A-006UJD-1q;
	Fri, 22 Dec 2023 17:16:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGj88-006UIl-08
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 17:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703265371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qufab8DMOBe7zRcqBWbIAI8IYAio0OXUluoCRgVTRkA=;
	b=Y55Ij6pGwHQU54+kI7oGA5OLTBV0OYVJOoTawPGy5FMxPSpQbKlm5Tqqur36NaKStmF7c3
	55C8YCG00j27Ie39yYCCpaCi8wXkJp+YdJWB75XeqbBfNAPW/TC/3r+yivCwMeQdOS6tSo
	weahaeV5tVu+aXkOK8VIxzeMKwfEJ/0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-E17u0_VXMIOG-zcv8GFUVw-1; Fri, 22 Dec 2023 12:16:09 -0500
X-MC-Unique: E17u0_VXMIOG-zcv8GFUVw-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6d7609cb718so2168948b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703265368; x=1703870168;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qufab8DMOBe7zRcqBWbIAI8IYAio0OXUluoCRgVTRkA=;
        b=ekppX+zdJVuFXfG7mMgpHIL1KXhSDAwah4C5x95gqJ5DaPBw3tSGkIFeATXTkvCL5I
         F6x1c8ZL2goSQ8Ra58wyRMFB8jfkgzQLdpeKd3ftrJf5s+DvxuwyMdxMOtXd/jswuHLw
         96SvyDw2RzFwZQP9t1BRM2WL5JW70hTvoPsSC+mNyykfpnnd7KtugfKIDZ902/3zc9w+
         RatljnE43E6nGIvM8nll6SUJrbF2oS1FymgIMuSaIuxXtkiHjp9sFFZ6q1DqqOCRkdFy
         1iAGNLPH3qQNGt4qL9Yy14CAvvywQgX+y//dB1n8RFvH2KuuNPycLBLx7lNE36bJjPPT
         f3aw==
X-Gm-Message-State: AOJu0YwVV4eFoCsGbxiU3Wegi/yUaudTDAnD8VqaHHzPdcFi2XqfCxYP
	cztZgoaWynmdBpa8o0jGHCx1MGDkpz0zWQoFSzrQKJyQrEuVNaPkTLiJZsF9ufWHxGETh1bcNNa
	E2GQ0wkFB1UOcM+n5OhL7Ql0ejrFyrhsAOpQS
X-Received: by 2002:a05:6a00:2342:b0:6d8:53f7:e2d9 with SMTP id j2-20020a056a00234200b006d853f7e2d9mr1615071pfj.12.1703265368508;
        Fri, 22 Dec 2023 09:16:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPljs2dAbEEi2xfH9vMHVrk7J7/8VKCXzbf8sh7H43Q+YpnZpvsQeTWEqw48VWhBeksqCekA==
X-Received: by 2002:a05:6a00:2342:b0:6d8:53f7:e2d9 with SMTP id j2-20020a056a00234200b006d853f7e2d9mr1615054pfj.12.1703265368215;
        Fri, 22 Dec 2023 09:16:08 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id e7-20020aa78c47000000b006ce64ebd2a0sm3764799pfd.99.2023.12.22.09.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 09:16:07 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] riscv: Improve arch_get_mmap_end() macro
Date: Fri, 22 Dec 2023 14:15:53 -0300
Message-ID: <ZYXESbdaiW_G-eby@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTShV+xBjHwQKGEQG-JgEUVa6S8egZNcN7xt_2rPucph9Q@mail.gmail.com>
References: <20231222082711.454374-1-leobras@redhat.com> <CAJF2gTShV+xBjHwQKGEQG-JgEUVa6S8egZNcN7xt_2rPucph9Q@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_091612_149734_256F6C6D 
X-CRM114-Status: GOOD (  24.70  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDc6NDg6MzZQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCA0OjI34oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIG1hY3JvIGNhdXNlZCBtZSBzb21lIGNv
bmZ1c2lvbiwgd2hpY2ggdG9vayBzb21lIHJldmlld2VyJ3MgdGltZSB0bwo+ID4gbWFrZSBpdCBj
bGVhciwgc28gSSBwcm9wb3NlIGFkZGluZyBhIHNob3J0IGNvbW1lbnQgaW4gY29kZSB0byBhdm9p
ZAo+ID4gY29uZnVzaW9uIGluIHRoZSBmdXR1cmUuCj4gPgo+ID4gQWxzbywgYWRkZWQgc29tZSBp
bXByb3ZlbWVudHMgdG8gdGhlIG1hY3JvLCBzdWNoIGFzIHJlbW92aW5nIHRoZQo+ID4gYXNzdW1w
dGlvbiBvZiBWQV9VU0VSX1NWNTcgYmVpbmcgdGhlIGxhcmdlc3QgYWRkcmVzcyBzcGFjZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+Cj4g
PiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgMTIgKysrKysr
KysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IGluZGV4IGYxOWY4NjFj
ZGE1NDkuLjIyNzhlMmE4MzYyYWYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nv
ci5oCj4gPiBAQCAtMTgsMTUgKzE4LDIxIEBACj4gPiAgI2RlZmluZSBERUZBVUxUX01BUF9XSU5E
T1cgICAgIChVTCgxKSA8PCAoTU1BUF9WQV9CSVRTIC0gMSkpCj4gPiAgI2RlZmluZSBTVEFDS19U
T1BfTUFYICAgICAgICAgIFRBU0tfU0laRV82NAo+ID4KPiA+ICsvKgo+ID4gKyAqIGFkZHIgaXMg
YSBoaW50IHRvIHRoZSBtYXhpbXVtIHVzZXJzcGFjZSBhZGRyZXNzIHRoYXQgbW1hcCBzaG91bGQg
cHJvdmlkZSwgc28KPiA+ICsgKiB0aGlzIG1hY3JvIG5lZWRzIHRvIHJldHVybiB0aGUgbGFyZ2Vz
dCBhZGRyZXNzIHNwYWNlIGF2YWlsYWJsZSBzbyB0aGF0Cj4gPiArICogbW1hcF9lbmQgPCBhZGRy
LCBiZWluZyBtbWFwX2VuZCB0aGUgdG9wIG9mIHRoYXQgYWRkcmVzcyBzcGFjZS4KPiA+ICsgKiBT
ZWUgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3ZtLWxheW91dC5yc3QgZm9yIG1vcmUgZGV0YWls
cy4KPiA+ICsgKi8KPiA+ICAjZGVmaW5lIGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxh
Z3MpICAgICAgICAgICAgICAgICAgICBcCj4gPiAgKHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICB1bnNpZ25l
ZCBsb25nIG1tYXBfZW5kOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAg
ICAgICAgdHlwZW9mKGFkZHIpIF9hZGRyID0gKGFkZHIpOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiAgICAgICAgIGlmICgoX2FkZHIpID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklH
X0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkpIFwKPiA+ICAgICAgICAgICAgICAgICBtbWFw
X2VuZCA9IFNUQUNLX1RPUF9NQVg7ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICAg
IGVsc2UgaWYgKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gLSAgICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+IC0gICAgICAgZWxzZSBpZiAoKCgoX2FkZHIpID49IFZBX1VTRVJf
U1Y0OCkpICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y0OCkpIFwKPiA+ICsgICAgICAgZWxzZSBp
ZiAoKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAmJiAoVkFfQklUUyA+PSBWQV9CSVRTX1NWNTcp
KSBcCj4gPiArICAgICAgICAgICAgICAgbW1hcF9lbmQgPSBWQV9VU0VSX1NWNTc7ICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+IEl0J3MgY2xlYXJlci4KPiAKPiBMR1RNLgo+IFJldmlld2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KClRoYW5rcyEKTGVvCgo+IAo+ID4gKyAgICAg
ICBlbHNlIGlmICgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNDgpICYmIChWQV9CSVRTID49IFZBX0JJ
VFNfU1Y0OCkpIFwKPiA+ICAgICAgICAgICAgICAgICBtbWFwX2VuZCA9IFZBX1VTRVJfU1Y0ODsg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgIGVsc2UgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICAg
IG1tYXBfZW5kID0gVkFfVVNFUl9TVjM5OyAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0t
Cj4gPiAyLjQzLjAKPiA+Cj4gCj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
