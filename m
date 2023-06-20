Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86257EB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2JqrW10gFVMJs1lKXlJWkrZiY2edCslChqtehPviaM=; b=P+stSgMiD0DK8j
	GPmofUCzYSr7o1rLtVV6bUaJm2NUqptBmyUF67IDj7+IF15Wrc/I1XT/nYFNGCeR2k29mLrLJkBII
	xJP++LAVQOJV4VM3wSS1SB/Fyi851pzCDdc94OJmAyiOBsGuxrfN0/B0Kq+e0IZZ3bG6mXADpofw7
	8urK3EL1FihXQEWnxnjkldW6wEhn1DNz7Kv+f7Cd+PJ2rF2qd7/oVZvySysRTDZVQ4AOplGJXP/Zr
	ewYjp6MCEjQUpnQiGvmINB+xtNDXtUAjQdHxRQ6Kc8lePHuJGTux3w+8axBvx7gY1UegL7a9dxDwo
	lw4B8WD+jICnGyJuU2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVzL-00AQbj-03;
	Tue, 20 Jun 2023 07:41:19 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBVzI-00AQb7-0R
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 07:41:17 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-54f71fa7e41so2297634a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 00:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687246874; x=1689838874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VNlkE9w8+4f9Owz1VR7DDy4a4R4dy/xTsJ/TjLKMtek=;
        b=bIFBmbK7FiaHLaGDgWmmB8jUjaecxgDpHm0ygwpqqg5bHBVtNXttGwGxPwQo1YYQ7Y
         ZYlopM4IUXYJTd9dQvjq7ZsHlFV6SDvOM0ePY0PyCktChM1feYusty5BHSInAs1Td43g
         nc11Q98qxk0UJzEZ1zwFu8gtOAL3ZLkQtCnkMneDVIEJTVe9ttfRLgQdm7xE0tduQIBB
         uaxQ/DaCgChdzcJ3h0cvQslVCVDWrj5T8TpJj8LUBZycoBSfkmEKVsXzpfW/m+IXAetN
         DcEWlT04weeu/jZAvmCiw5LBjQmAlVpkN6e67RhWhdS/40ees722j8iArp1zPRh96yj1
         h2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687246874; x=1689838874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNlkE9w8+4f9Owz1VR7DDy4a4R4dy/xTsJ/TjLKMtek=;
        b=B149ZPDu3YGwq92J+twUft+dLw/4WqKPtpJOaqRegi8XKOasvkv6iYm9JTDpL2mMNU
         4F7H5P/hqwsXp5SMVLRMidoMzr5RkeWoD4gK4FItZBfyUtvhH1+WVfLWtf46+PU3ttH+
         eth75E0KD0CYz8v/Qu+DCMPzpg7fsf/E1Dd8jMpZQ8CMOXRm3vQQJXRDRrTd5mFo4mig
         Km1N6LZ0KCBWIGgdambx65Guxpzr2zt/nutqekULB9JyVLt38+oTzKYxvfca6AVzkKY4
         8goy0TbgFSW2bwxYRjlD39SCuM2yhieTUab76rD/JsHlYyTBCSQMHia5XICgyOa5xP5c
         r2HQ==
X-Gm-Message-State: AC+VfDxb8yR9y07FPHyHccmXUiRSF0hKCcR5wVRzs7Y0GzgulYSp9Uxt
	geanRGjPpLvO8ExOxCvtdgb/FA==
X-Google-Smtp-Source: ACHHUZ5/e/h5oqwfG3pVdVPiHyiKMor0pHhGX3SJ5BK89WAqKnQnNXoBBy0OZtgzAZuM8gP+Tw3exQ==
X-Received: by 2002:a05:6a21:339a:b0:115:dfb:da59 with SMTP id yy26-20020a056a21339a00b001150dfbda59mr10678421pzb.3.1687246874592;
        Tue, 20 Jun 2023 00:41:14 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709028bc100b001a1b66af22fsm975645plo.62.2023.06.20.00.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:41:14 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:11:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
Message-ID: <ZJFYE+Ss/OgMIjda@sunil-laptop>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <20230619-kerchief-unmixed-cfdbeb1cf242@wendy>
 <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_004116_175681_53437C95 
X-CRM114-Status: GOOD (  46.53  )
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

T24gTW9uLCBKdW4gMTksIDIwMjMgYXQgMDQ6MDQ6NTJQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDI6MjbigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+Cj4gPiBIZXkgQWxleCwKPiA+
Cj4gPiBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcyA6KSBJJ3ZlIGdvdCBhIG1peCBvZiBzdWdn
ZXN0aW9ucyBhbmQKPiA+IHF1ZXN0aW9ucyBiZWxvdy4gSG9wZWZ1bGx5IGl0IGlzIG5vdCB0b28g
ZGlzam9pbnQsIHNpbmNlIEkgZGlkbid0IHdyaXRlCj4gPiB0aGVtIGluIG9yZGVyLgo+ID4KPiA+
IE9uIE1vbiwgSnVuIDE5LCAyMDIzIGF0IDExOjQ3OjA0QU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0
aSB3cm90ZToKPiA+ID4gVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIGNvbnN0cmFpbnRzIGFu
ZCByZXF1aXJlbWVudHMgb2YgdGhlIGVhcmx5Cj4gPiA+IGJvb3QgcHJvY2VzcyBpbiBhIFJJU0Mt
ViBrZXJuZWwuCj4gPiA+Cj4gPiA+IFN6aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9yaXNj
di9ib290LWltYWdlLWhlYWRlci5yc3QgfCAgIDMgLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9yaXNj
di9ib290LnJzdCAgICAgICAgICAgICAgfCAxODEgKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
PiAgRG9jdW1lbnRhdGlvbi9yaXNjdi9pbmRleC5yc3QgICAgICAgICAgICAgfCAgIDEgKwo+ID4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxODIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QucnN0Cj4gPiA+
Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVy
LnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0Cj4gPiA+IGlu
ZGV4IGQ3NzUyNTMzODY1Zi4uYTRhNDUzMTBjNGM0IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdAo+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdAo+ID4gPiBAQCAtNyw5ICs3LDYgQEAgQm9v
dCBpbWFnZSBoZWFkZXIgaW4gUklTQy1WIExpbnV4Cj4gPiA+Cj4gPiA+ICBUaGlzIGRvY3VtZW50
IG9ubHkgZGVzY3JpYmVzIHRoZSBib290IGltYWdlIGhlYWRlciBkZXRhaWxzIGZvciBSSVNDLVYg
TGludXguCj4gPiA+Cj4gPiA+IC1UT0RPOgo+ID4gPiAtICBXcml0ZSBhIGNvbXBsZXRlIGJvb3Rp
bmcgZ3VpZGUuCj4gPiA+IC0KPiA+ID4gIFRoZSBmb2xsb3dpbmcgNjQtYnl0ZSBoZWFkZXIgaXMg
cHJlc2VudCBpbiBkZWNvbXByZXNzZWQgTGludXgga2VybmVsIGltYWdlOjoKPiA+ID4KPiA+ID4g
ICAgICAgdTMyIGNvZGUwOyAgICAgICAgICAgICAgICAvKiBFeGVjdXRhYmxlIGNvZGUgKi8KPiA+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvYm9vdC5yc3QgYi9Eb2N1bWVudGF0
aW9uL3Jpc2N2L2Jvb3QucnN0Cj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uYjAyMjMwODE4Yjc5Cj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9ib290LnJzdAo+ID4gPiBAQCAtMCwwICsxLDE4MSBAQAo+
ID4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gKwo+ID4gPiAr
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+ICtFYXJs
eSBib290IHJlcXVpcmVtZW50cy9jb25zdHJhaW50cyBvbiBSSVNDLVYKPiA+ID4gKz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4KPiA+IFBsZWFzZSB1c2Ug
InRpdGxlIGNhc2UiLCBoZXJlIGFuZCBlbHNld2hlcmUgaW4gdGhlIGRvYy4KPiAKPiBZb3UgbWVh
biB1c2luZyAidGl0bGU6ICIgaW5zdGVhZCBvZiAiPT09PSI/IE9yIHVzaW5nIHVwcGVyY2FzZSBm
b3IgdGhlCj4gZmlyc3QgbGV0dGVyIG9mIGVhY2ggd29yZD8gRllJIEkgZm9sbG93ZWQKPiBodHRw
czovL2RvY3Mua2VybmVsLm9yZy9kb2MtZ3VpZGUvc3BoaW54Lmh0bWw/aGlnaGxpZ2h0PXRpdGxl
I3NwZWNpZmljLWd1aWRlbGluZXMtZm9yLXRoZS1rZXJuZWwtZG9jdW1lbnRhdGlvbgo+IAo+ID4g
SSdkIGFsc28gYmUgaW5jbGluZWQgdG8gZHJvcCB0aGUgIkVhcmx5IiBmcm9tIGhlcmUsIGFzIGl0
IHBlcm1pdHMgbW9yZQo+ID4gbmF0dXJhbCBzZWN0aW9uIGhlYWRpbmdzLiBQZXJoYXBzICJSSVND
LVYgS2VybmVsIEJvb3QgUmVxdWlyZW1lbnRzIGFuZAo+ID4gQ29uc3RyYWludHMiPwo+IAo+IEdv
b2Qgc3VnZ2VzdGlvbiwgSSdsbCBnbyB3aXRoIHRoYXQsIHRoYW5rcwo+IAo+ID4KPiA+ID4gKwo+
ID4gPiArOkF1dGhvcjogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+
ID4gPiArOkRhdGU6IDIzIE1heSAyMDIzCj4gPiA+ICsKPiA+ID4gK1RoaXMgZG9jdW1lbnQgZGVz
Y3JpYmVzIHdoYXQgdGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0cyBmcm9tIHRoZSBwcmV2aW91cyBz
dGFnZXMKPiA+Cj4gPiAidGhlIHByZXZpb3VzIHN0YWdlcyIgaXMgYSBiaXQgdmFndWUgSU1PLiBZ
b3UgbWVhbiBib290bG9hZGVyIHN0YWdlcyBJCj4gPiBhc3N1bWUsIGJ1dCBJIHRoaW5rIGl0IHNo
b3VsZCBiZSBleHBsaWNpdC4gUGVyaGFwczoKPiA+ICIuLi53aGF0IGEgUklTQy1WIGtlcm5lbCBl
eHBlY3RzIGZyb20gYm9vdGxvYWRlcnMgYW5kIGZpcm13YXJlLCBhbmQgdGhlCj4gPiBjb25zdHJh
aW50cy4uLiIKPiA+Cj4gPiA+ICthbmQgdGhlIGZpcm13YXJlLCBidXQgYWxzbyB0aGUgY29uc3Ry
YWludHMgdGhhdCBhbnkgZGV2ZWxvcGVyIG11c3QgaGF2ZSBpbiBtaW5kCj4gPiA+ICt3aGVuIHRv
dWNoaW5nIHRoZSBlYXJseSBib290IHByb2Nlc3MsIGUuZy4gYmVmb3JlIHRoZSBmaW5hbCB2aXJ0
dWFsIG1hcHBpbmcgaXMKPiA+ID4gK3NldHVwLgo+ID4KPiA+IHMvc2V0dXAuL3NldCB1cC4vCj4g
Pgo+ID4gRG8geW91IG1lYW4gdG8gaGF2ZSAiRm9yIGV4YW1wbGUiIGhlcmU/IE9yIGlzICJiZWZv
cmUgdGhlIGZpbmFsIHZpcnR1YWwKPiA+IG1hcHBpbmcgaXMgc2V0IHVwIiB0aGUgZGVmaW5pdGlv
biBvciAiZWFybHkgYm9vdCI/IElmIHRoZSBsYXR0ZXIsIEkKPiA+IHdvdWxkIHJld29yZCB0aGlz
IGFzIHNvbWV0aGluZyBsaWtlOgo+ID4gIi4uLndoZW4gbW9kaWZ5aW5nIHRoZSBlYXJseSBib290
IHByb2Nlc3MuIEZvciB0aGUgcHVycG9zZXMgb2YgdGhpcwo+ID4gZG9jdW1lbnQsIHRoZSAnZWFy
bHkgYm9vdCBwcm9jZXNzJyByZWZlcnMgdG8gYW55IGNvZGUgdGhhdCBydW5zIGJlZm9yZQo+ID4g
dGhlIGZpbmFsIHZpcnR1YWwgbWFwcGluZyBpcyBzZXQgdXAuIgo+IAo+IFRoYW5rcywgdGhhdCdz
IHdoYXQgSSBtZWFudC4KPiAKPiA+Cj4gPiA+ICtQcmUta2VybmVsIGJvb3QgKEV4cGVjdGF0aW9u
cyBmcm9tIGZpcm13YXJlKQo+ID4KPiA+IEZpcm13YXJlIG9yIGJvb3Rsb2FkZXJzPyBUQkgsIEkg
d291bGQganVzdCBkcm9wIHRoZSBzZWN0aW9uIGluICgpIGFuZAo+ID4gZG8gc29tZXRoaW5nIGxp
a2U6Cj4gPiAgICAgICAgIFByZS1rZXJuZWwgUmVxdWlyZW1lbnRzIGFuZCBDb25zdHJhaW50cwo+
ID4gICAgICAgICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+Cj4g
PiAgICAgICAgIFRoZSBSSVNDLVYga2VybmVsIGV4cGVjdHMgdGhlIGZvbGxvd2luZyBvZiBib290
bG9hZGVycyBhbmQgcGxhdGZvcm0KPiA+ICAgICAgICAgZmlybXdhcmU6Cj4gPgo+IAo+IE9rCj4g
Cj4gPiA+ICsKPiA+ID4gK1JlZ2lzdGVycyBzdGF0ZQo+ID4KPiA+IHMvUmVnaXN0ZXJzIHN0YXRl
L1JlZ2lzdGVyIFN0YXRlLwo+IAo+IE9rCj4gCj4gPgo+ID4gPiArLS0tLS0tLS0tLS0tLS0tCj4g
PiA+ICsKPiA+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHM6Cj4gPiA+ICsKPiA+ID4gKyAg
KiBgJGEwYCB0byBjb250YWluIHRoZSBoYXJ0aWQgb2YgdGhlIGN1cnJlbnQgY29yZS4KPiA+ID4g
KyAgKiBgJGExYCB0byBjb250YWluIHRoZSBhZGRyZXNzIG9mIHRoZSBkZXZpY2UgdHJlZSBpbiBt
ZW1vcnkuCj4gPiA+ICsKPiA+ID4gK0NTUiBzdGF0ZQo+ID4gPiArLS0tLS0tLS0tCj4gPiA+ICsK
PiA+ID4gK1RoZSBSSVNDLVYga2VybmVsIGV4cGVjdHM6Cj4gPiA+ICsKPiA+ID4gKyAgKiBgJHNh
dHAgPSAwYDogdGhlIE1NVSBtdXN0IGJlIGRpc2FibGVkLgo+ID4KPiA+ICJ0aGUgTU1VLCBpZiBw
cmVzZW50LCBtdXN0IGJlIGRpc2FibGVkLiIgOykKPiAKPiBBaGFoIGZvcmdvdCB0aGUgIW1tdSBj
YXNlLCB0aGFua3MgOikKPiAKPiA+Cj4gPiA+ICsKPiA+ID4gK1Jlc2VydmVkIG1lbW9yeSBmb3Ig
cmVzaWRlbnQgZmlybXdhcmUKPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiA+ID4gKwo+ID4gPiArVGhlIFJJU0MtViBrZXJuZWwgZXhwZWN0cyB0aGUgZmlybXdh
cmUgdG8gbWFyayBhbnkgcmVzaWRlbnQgbWVtb3J5IHdpdGggdGhlCj4gPgo+ID4gU2hvdWxkIHRo
aXMgYmUKPiA+ICIuLi5yZXNpZGVudCBtZW1vcnksIG9yIG1lbW9yeSBpdCBoYXMgcHJvdGVjdGVk
IHdpdGggUE1Qcywgd2l0aC4uLiIKPiA+ID8KPiAKPiBJIHVzZWQgInJlc2lkZW50IiBtZW1vcnkg
aW5zdGVhZCBvZiAiUE1QIiBtZW1vcnkgYmVjYXVzZSBpdCB3YXMgbW9yZQo+IGdlbmVyYWwuIEkg
bWVhbiB5b3UgY2FuIGhhdmUgYSByZWdpb24gdGhhdCBpcyByZXNpZGVudCBidXQgbm90Cj4gcHJv
dGVjdGVkIGJ5IFBNUCwgYW5kIEkgZG9uJ3QgdGhpbmsgdGhlIGtlcm5lbCBzaG91bGQgYXNrIGZv
ciB0aGlzCj4gcmVzaWRlbnQgbWVtb3J5IHRvIGJlIHByb3RlY3RlZCB3aXRoIFBNUCByaWdodD8K
PiAKPiA+Cj4gPiA+ICtgbm8tbWFwYCBmbGFnLCB0aHVzIHRoZSBrZXJuZWwgd29uJ3QgbWFwIHRo
b3NlIHJlZ2lvbnMgaW4gdGhlIGRpcmVjdCBtYXBwaW5nCj4gPgo+ID4gIm5vLW1hcCIgaXMgYSBE
VCBzcGVjaWZpYyB0ZXJtLCBzaG91bGQgdGhpcyBzZWN0aW9uIGJlIG1vdmVkIGRvd24gdW5kZXIK
PiA+IERULCBhcyBhIHN1Yi1zZWN0aW9uIG9mIHRoYXQ/Cj4gCj4gTWF5YmUgSSBjYW4gcmVwaHJh
c2Ugd2l0aCBzb21ldGhpbmcgbGlrZSB0aGF0Ogo+IAo+ICJUaGUgUklTQy1WIGtlcm5lbCBtdXN0
IG5vdCBtYXAgYW55IHJlc2lkZW50IG1lbW9yeSBpbiB0aGUgZGlyZWN0Cj4gbWFwcGluZywgc28g
dGhlIGZpcm13YXJlIG11c3QgY29ycmVjdGx5IG1hcmsgdGhvc2UgcmVnaW9ucyBhcyBmb2xsb3dz
Ogo+IC0gd2hlbiB1c2luZyBhIGRldmljZXRyZWUsIHVzaW5nIHRoZSBgbm8tbWFwYCBmbGFnLAo+
IC0gd2hlbiBib290aW5nIHdpdGggVUVGSSB3aXRob3V0IGRldmljZXRyZWUsIGVpdGhlciBhcwo+
IGBFZmlSdW50aW1lU2VydmljZXNEYXRhL0NvZGVgIG9yIGBFZmlSZXNlcnZlZGAuIgo+IApIaSBB
bGV4LAoKSSBhbSBub3Qgc3VyZSBhYm91dCB0aGUgaWRlYSBiZWhpbmQgbWVudGlvbmluZyBvbmx5
IFVFRkkgYm9vdCB3aXRob3V0CkRUIHNpbmNlIFVFRkkgYm9vdCBpcyBzdXBwb3J0ZWQgd2l0aCBE
VCBhbHNvLiBTaG91bGQgd2UganVzdCBtZW50aW9uCnRoYXQgIndoZW4gYm9vdGluZyB3aXRoIFVF
RkksIHJlc2lkZW50IGZpcm13YXJlIHJhbmdlcyBtdXN0IGJlIG1hcmtlZCBhcwpwZXIgVUVGSSBz
cGVjaWZpY2F0aW9uIiA/IENvbnZlcnRpbmcgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgaW4gRFQgdG8g
VUVGSQptZW1vcnkgbWFwIGlzIGFueXdheSBtZW50aW9uZWQgc2VwYXJhdGVseSB1bmRlciBVRUZJ
IG1lbW9yeSBtYXAgc2VjdGlvbgpyaWdodD8KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
