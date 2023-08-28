Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE241C71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcsMO4Ro8/yI5yQ2OKkXyJ5qH/I81MZ1R5pkHQH6QAA=; b=f8dZBKsCB74fGM
	iffLcq/ecwqxXuAdpK8TOm/61yjG4rN/AahW9BX0o8SiUOm49zXamB+lCYZJqGTzMUSr4gEZgdJK8
	pRhGIfyyY1LC+lZmwgYgKx4Wj9H7rMvgW/72NKNa9Rlkf+AHXnzbLQlm0XJAkm1zYpBpqkTo+fMzX
	7orWZS9nA/Wu+IUoUuYr5REHmSsWP94hqskz4LRP+fDT4Sfb8u/Cgfx0Dv5PgE8EM/K0BcoXPa3yk
	LLC0shtLkTZo+N49YB0gguzYoUpA9fTg3MLXFZ47ZVRfnToZzEU8tnNMxlqHZl2EdeCKKgRGnrY32
	FeE3lfn2Zz3dZhBoryWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaf2m-009t06-1l;
	Mon, 28 Aug 2023 16:24:48 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaf2i-009syY-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 16:24:46 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b974031aeaso52084161fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693239879; x=1693844679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlldpTbanhBesa2HwgrYZTO2yCgVrupDnCjl8t+UIT0=;
        b=fH3o2T8lRmzNqGEwHcJkF/eF6u8dFUHalpROE5gu+kpqL6koiK2lkRbB1Yv9Su3iWt
         +BS6BT69PdKIkqrNExqwQ8927+OCo87CUjD/dOaBKHSkFTXpLDI2YF+5ujRo5Xz+3J3z
         2EwNYeIGcP5qkjb63oxGwWwQzO27GQJnGO5tbkO94F1Zbi/nKLM0pJpCL84VKD4Vo4Pj
         8e4msuNHzLYKvHj4YUD2eoojDwJN8nWX6V946jcSVbNNzHHRQ1oZMeJRGfcHjs+MwkRE
         NTFTkW2zwLC+7LP2k2awqsWJr8WO2l4sdsgrXBt99cGSorsWlmlsXLjikPzSshcLJkTh
         CBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693239879; x=1693844679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlldpTbanhBesa2HwgrYZTO2yCgVrupDnCjl8t+UIT0=;
        b=OK97idNgONLrL77wWkoY3Qxbz8jy9alfNZ/OgLbn7Ew13gGmlMzz48p5MkaKlPCrL9
         3QwG2f9t1zKI7Jlsrxaa5Hj7m9D5i57Xa/1EmR6+3wiw4svNnXXCmzudWRBJHwxPvA4A
         68U1XRohLFtcp5jIO9nhvjrR4vKjyJOfeI5jhEz+JwKdVu9NaiRntNmPwauLr0DlX8DN
         MW7h0RLBipnWMgAllFHLZfr1LYXafcavCaOwbwoODxMmBUDFAQZElKqeOedtPDJaUcLb
         n2MEDv3QEPVl16WF7q7W7KJ+V0RGVn+MuXsu+4YJEz7FEfJrgpO2caw1UBfSbB0/4VQ9
         QOXA==
X-Gm-Message-State: AOJu0YwR7RQXRY6FOSbTSKkfBUmURFiOzp2IUopeoE2F9zomy16f228u
	ieXKh+zdaTAAafUdfR+kwFfAtqtOJ/JxM8v8G5Yktg==
X-Google-Smtp-Source: AGHT+IGGDgol2nCV6HyRK80uVA5Lh6F2anWFcW9s8qh1HVDrHNl4x4LUfgUDyYqi39lcdoexD9CiBFHy6Uf6Yjf8Mdw=
X-Received: by 2002:a05:651c:cf:b0:2bc:bdbd:1542 with SMTP id
 15-20020a05651c00cf00b002bcbdbd1542mr16880301ljr.11.1693239879310; Mon, 28
 Aug 2023 09:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230825231139.1145522-1-evan@rivosinc.com> <20230826-anguished-tutu-81d63b3081a7@spud>
 <20230826-copper-suffocate-5f4f0e67f9a7@spud>
In-Reply-To: <20230826-copper-suffocate-5f4f0e67f9a7@spud>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 28 Aug 2023 09:24:03 -0700
Message-ID: <CALs-HsvwLpcUMPeKEs3ZW3tOwLGeGRQSe=grxE5L14Tj8b+XHw@mail.gmail.com>
Subject: Re: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_092444_981934_6977AFCC 
X-CRM114-Status: GOOD (  34.03  )
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

T24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgMjo1NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEF1ZyAyNiwgMjAyMyBhdCAxMjoyNjoyNUFNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBhdCAwNDox
MTozOFBNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gPiBJbiAvcHJvYy9jcHVpbmZvLCBt
b3N0IG9mIHRoZSBpbmZvcm1hdGlvbiB3ZSBzaG93IGZvciBlYWNoIHByb2Nlc3NvciBpcwo+ID4g
PiBzcGVjaWZpYyB0byB0aGF0IGhhcnQ6IG1hcmNoaWQsIG12ZW5kb3JpZCwgbWltcGlkLCBwcm9j
ZXNzb3IsIGhhcnQsCj4gPiA+IGNvbXBhdGlibGUsIGFuZCB0aGUgbW11IHNpemUuIEJ1dCB0aGUg
SVNBIHN0cmluZyBnZXRzIGZpbHRlcmVkIHRocm91Z2ggYQo+ID4gPiBsb3dlc3QgY29tbW9uIGRl
bm9taW5hdG9yIG1hc2ssIHNvIHRoYXQgaWYgb25lIENQVSBpcyBtaXNzaW5nIGFuIElTQQo+ID4g
PiBleHRlbnNpb24sIG5vIENQVXMgd2lsbCBzaG93IGl0Lgo+ID4gPgo+ID4gPiBOb3cgdGhhdCB3
ZSB0cmFjayB0aGUgSVNBIGV4dGVuc2lvbnMgZm9yIGVhY2ggaGFydCwgbGV0J3MgcmVwb3J0IElT
QQo+ID4gPiBleHRlbnNpb24gaW5mbyBhY2N1cmF0ZWx5IHBlci1oYXJ0IGluIC9wcm9jL2NwdWlu
Zm8uIFdlIGNhbm5vdCBjaGFuZ2UKPiA+ID4gdGhlICJpc2E6IiBsaW5lLCBhcyB1c2VybW9kZSBt
YXkgYmUgcmVseWluZyBvbiB0aGF0IGxpbmUgdG8gc2hvdyBvbmx5Cj4gPiA+IHRoZSBjb21tb24g
c2V0IG9mIGV4dGVuc2lvbnMgc3VwcG9ydGVkIGFjcm9zcyBhbGwgaGFydHMuIEFkZCBhIG5ldyAi
aGFydAo+ID4gPiBpc2EiIGxpbmUgaW5zdGVhZCwgd2hpY2ggcmVwb3J0cyB0aGUgdHJ1ZSBzZXQg
b2YgZXh0ZW5zaW9ucyBmb3IgdGhhdAo+ID4gPiBoYXJ0Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFu
ZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gPiBSZXZpZXdlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+Cj4gPiBDYW4g
eW91IGRyb3AgdGhpcyBpZiB5b3UgcmVwb3N0PwoKV2lsbCBkby4KCj4gPgo+ID4gPiArImlzYSIg
dnMgImhhcnQgaXNhIiBsaW5lcyBpbiAvcHJvYy9jcHVpbmZvCj4gPiA+ICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gKwo+ID4gPiArVGhlICJpc2EiIGxp
bmUgaW4gL3Byb2MvY3B1aW5mbyBkZXNjcmliZXMgdGhlIGxvd2VzdCBjb21tb24gZGVub21pbmF0
b3Igb2YKPiA+ID4gK1JJU0MtViBJU0EgZXh0ZW5zaW9ucyByZWNvZ25pemVkIGJ5IHRoZSBrZXJu
ZWwgYW5kIGltcGxlbWVudGVkIG9uIGFsbCBoYXJ0cy4gVGhlCj4gPiA+ICsiaGFydCBpc2EiIGxp
bmUsIGluIGNvbnRyYXN0LCBkZXNjcmliZXMgdGhlIHNldCBvZiBleHRlbnNpb25zIHJlY29nbml6
ZWQgYnkgdGhlCj4gPiA+ICtrZXJuZWwgb24gdGhlIHBhcnRpY3VsYXIgaGFydCBiZWluZyBkZXNj
cmliZWQsIGV2ZW4gaWYgdGhvc2UgZXh0ZW5zaW9ucyBtYXkgbm90Cj4gPiA+ICtiZSBwcmVzZW50
IG9uIGFsbCBoYXJ0cyBpbiB0aGUgc3lzdGVtLgo+ID4KPiA+ID4gSW4gYm90aCBjYXNlcywgdGhl
IHByZXNlbmNlIG9mIGEgZmVhdHVyZQo+ID4gPiAraW4gdGhlc2UgbGluZXMgZ3VhcmFudGVlcyBv
bmx5IHRoYXQgdGhlIGhhcmR3YXJlIGhhcyB0aGUgZGVzY3JpYmVkIGNhcGFiaWxpdHkuCj4gPiA+
ICtBZGRpdGlvbmFsIGtlcm5lbCBzdXBwb3J0IG9yIHBvbGljeSBjb250cm9sIGNoYW5nZXMgbWF5
IGJlIHJlcXVpcmVkIGJlZm9yZSBhCj4gPiA+ICtmZWF0dXJlIGlzIGZ1bGx5IHVzYWJsZSBieSB1
c2Vyc3BhY2UgcHJvZ3JhbXMuCj4gPgo+ID4gSSBkbyBub3QgdGhpbmsgdGhhdCAiaW4gYm90aCBj
YXNlcyIgbWF0Y2hlcyB0aGUgZXhwZWN0YXRpb25zIG9mCj4gPiB1c2Vyc3BhY2UgZm9yIHRoZSBl
eGlzdGluZyBsaW5lLiBJdCdzIHRvbyBsYXRlIGF0IG5pZ2h0IGZvciBtZSB0byB0aGluawo+ID4g
cHJvcGVybHksIGJ1dCBJIHRoaW5rIG91ciBleGlzdGluZyBpbXBsZW1lbnRhdGlvbiBkb2VzIHdv
cmsgbGlrZSB5b3UKPiA+IGhhdmUgZG9jdW1lbnRlZCBmb3IgRkQvVi4gSSB0aGluayBJIHByZXZp
b3VzbHkgbWVudGlvbmVkIHRoYXQgaXQgY291bGQKPiA+IG1pc3JlcG9ydCB0aGluZ3MgZm9yIHZl
Y3RvciBkdXJpbmcgdGhlIHJldmlldyBvZiB0aGUgdmVjdG9yIHNlcmllcyBidXQKPiA+IGZvcmdv
dCBhYm91dCBpdCB1bnRpbCBub3cuCj4KPiBJIHdlbnQgYW5kIGNoZWNrZWQsIGFuZCB5ZXMgaXQg
ZG9lcyBjdXJyZW50bHkgZG8gdGhhdCBmb3IgdmVjdG9yLiBJCj4gZG9uJ3QgdGhpbmsgdGhhdCB0
aGF0IGlzIHdoYXQgdXNlcnNwYWNlIHdvdWxkIGV4cGVjdCwgdGhhdCBHb29nbGUKPiBjcHVfZmVh
dHVyZXMgcHJvamVjdCBmb3IgZXhhbXBsZSB3b3VsZCBkcmF3IGluY29ycmVjdCBjb25jbHVzaW9u
cy4KCkknbSBsb3N0LCBjb3VsZCB5b3UgZXhwbGFpbiBhIGxpdHRsZSBtb3JlPyBNeSBnb2FsIHdh
cyB0byBzYXkgdGhhdAp0aGVyZSdzIG5vIGJsYW5rZXQgZ3VhcmFudGVlIHRoYXQgdGhlIGZlYXR1
cmUgaXMgMTAwJSByZWFkeSB0byBnbyBmb3IKdXNlcnNwYWNlIGp1c3QgYmVjYXVzZSBpdCdzIHNl
ZW4gaGVyZS4gRm9yIHNvbWUgZXh0ZW5zaW9ucywgaXQgbWF5IGluCmZhY3QgZW5kIHVwIG1lYW5p
bmcganVzdCB0aGF0IChoZW5jZSB0aGUgImFkZGl0aW9uYWwgLi4uIG1heSBiZQpyZXF1aXJlZCIg
cmF0aGVyIHRoYW4gImlzIHJlcXVpcmVkIikuIFRoaXMgaXMgdHJ1ZSBmb3IgRkQgKG1heWJlLApk
ZXBlbmRpbmcgb24gaGlzdG9yeT8pLCBvciBleHRlbnNpb25zIHdob3NlIG1pbmltYWwvemVybyBr
ZXJuZWwKc3VwcG9ydCB3YXMgdW5jb25kaXRpb25hbGx5IGFkZGVkIGF0IHRoZSBzYW1lIHRpbWUg
YXMgaXRzIHBhcnNpbmcgZm9yCml0LiBCdXQgaXQncyBub3QgdHJ1ZSBzb2xlbHkgYnkgdmlydHVl
IG9mIGJlaW5nIGluIC9wcm9jL2NwdWluZm8uIEluCm90aGVyIHdvcmRzLCBJJ20gdHJ5aW5nIHRv
IGVzdGFibGlzaCB0aGUgZmxvb3Igb2Ygd2hhdCAvcHJvYy9jcHVpbmZvCmd1YXJhbnRlZXMsIHdp
dGhvdXQgZnVsbHkgc3BlY2lmeWluZyB0aGUgY2VpbGluZy4gQXJlIHlvdSBzYXlpbmcgdGhhdAp3
ZSBuZWVkIHRvIHNwZWxsIG91dCB0aGUgZ3VhcmFudGVlcyBmb3IgZWFjaCBleHRlbnNpb24/IE9y
IGFyZSB5b3UKc2F5aW5nIHRoZSBmbG9vciBJJ3ZlIGRlZmluZWQgaW4gZ2VuZXJhbCBpcyBpbmNv
cnJlY3Qgb3IgaW5zdWZmaWNpZW50PwpJJ20gYWxzbyBvcGVuIHRvIGRpcmVjdCBzdWdnZXN0aW9u
cyBvZiB3b3JkaW5nIGlmIHlvdSd2ZSBnb3Qgc29tZXRoaW5nCmluIG1pbmQgOikKLUV2YW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
