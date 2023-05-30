Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF1C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUh2OvRy7dC0xJvNx6SSa4XuLhiS0Vhllk4mZ26eqqE=; b=wZ04Ig+2qjDNI+
	VXzhtD9pDOa0blTEuP2QfUhRCUm5kn+ujWjUB4izaVAEjUfLHLsg1TNbyyYjgQh4Z8RhoK4cUHE56
	GCILua/fD7M5DrlLi5hFBtr/iKh5IaQhDv+zZLdgdgd3kB0GAa37h9gYsur5YjdbmpUmnRTrFPkoA
	qZ7YUPXgbDcJvfTUGAB/lTI+weZMF0tupbudDEPqzkWifox9o8+trETCkBjn5Qyux1IfYVIfZIFAF
	ffDMEKa81sGMGfbwwkF9FUxVG8pJApzTzj0G/3vICvhiNCz4wjctl+/K7j4Ub0b8nI388sJvq95fh
	d4qXkUvuQwOlaNcgcVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q41Q4-00EQjw-2d;
	Tue, 30 May 2023 15:37:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q41Q2-00EQjX-1A
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 15:37:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6904D61A59
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 15:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C842FC433EF
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685461071;
	bh=I+bDplFB4ybfoxeuTjDQOJi8CNtCKz/6pE+frellwdw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CL+UBr8+xQiuU2Uzm5rgc/6Ijr+ybjXyWsdX/hFcmslL0w6tfI+kNHoOk1qiEhons
	 sa3TUeA6xcnI/vDGf+/toNsoLVo6tecz2wx1bi2Q53md3LAPhOZwKnqpfXsVZG2ere
	 aDxYQ0m0SMBupi6W9ERgv+RtUVTIkuFwUFZ6zB/7/5trk8Ji/LC7ZY8ygsQdMXZxKM
	 8kAwimKnI7tCnDj2mGaGSNukohfq1dVn+qhBhnKAHNWLWtW5cC0P0LUdmjZvuwVTBo
	 lrfFKnJMrUiDffkHg4togiBuNHbAMD50FK2TdotvqJZfI+DBq7Wl+4fkGlF122EOwx
	 zCDKEWRNleOPA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso5152772e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 08:37:51 -0700 (PDT)
X-Gm-Message-State: AC+VfDwgcuEoy+0cWnETYYpt2iIhmcoVKRtyka5jw0oEIMNYJnOGVtBF
	cEYBkTI1jIktSc3KBT5xfNlqxlGlWLWXoxMcBXo=
X-Google-Smtp-Source: ACHHUZ4eIE/heo/0Kn6F9UfSo+8dlTQAjTrg/t6eQUk7SkKkLaE4qya56Lz8F7g5SRJ48fAbdBGvPQp6DD16rlkOl+U=
X-Received: by 2002:ac2:44cf:0:b0:4f3:7a59:d19 with SMTP id
 d15-20020ac244cf000000b004f37a590d19mr1075745lfm.59.1685461069828; Tue, 30
 May 2023 08:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230529073845.2859178-1-guoren@kernel.org> <20230529-jasmine-amigo-6d01f6852b35@wendy>
 <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
 <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com> <CABgGipXu7iq-J5v6GVMPrnHiGVLuMxabB0_hPb+o+04T2MAwpw@mail.gmail.com>
In-Reply-To: <CABgGipXu7iq-J5v6GVMPrnHiGVLuMxabB0_hPb+o+04T2MAwpw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 May 2023 23:37:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2fAkk1532VWmsWP5DSYN17ib80wa5QwwT=DC0LY9gGw@mail.gmail.com>
Message-ID: <CAJF2gTR2fAkk1532VWmsWP5DSYN17ib80wa5QwwT=DC0LY9gGw@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, paul.walmsley@sifive.com, palmer@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_083754_495368_2E09C9DE 
X-CRM114-Status: GOOD (  36.01  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgNTo0OeKAr1BNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMjo1MuKAr1BNIEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE1heSAzMCwg
MjAyMyBhdCAxMDo1OeKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gTW9uLCBNYXkgMjksIDIwMjMgYXQgOTo0M+KAr1BNIENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9u
LCBNYXkgMjksIDIwMjMgYXQgMDM6Mzg6NDVBTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3Jv
dGU6Cj4gPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gU29tZSAua28gYWxzbyBuZWVkIHRoZSByaXNjdl92X3VzZXJfYWxs
b3dlZCBzeW1ib2wuCj4gPiA+ID4gPgo+ID4gPiA+ID4gRVJST1I6IG1vZHBvc3Q6ICJyaXNjdl92
X3VzZXJfYWxsb3dlZCIgW2FyY2gvcmlzY3Yva3ZtL2t2bS5rb10KPiA+ID4gPiA+IHVuZGVmaW5l
ZCEKPiA+ID4gPiA+IG1ha2VbM106ICoqKgo+ID4gPiA+ID4gWy9ob21lL2d1b3Jlbi9zb3VyY2Uv
a2VybmVsL2xpbnV4L3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxMzY6Cj4gPiA+ID4gPiBNb2R1
bGUuc3ltdmVyc10gRXJyb3IgMQo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgfCAxICsKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gPiA+ID4g
aW5kZXggMWM0YWM4MjFlMDA4Li4zYWUwODgxNmQ2MDggMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdmVjdG9yLmMKPiA+ID4gPiA+IEBAIC0xMjksNiArMTI5LDcgQEAgYm9vbCByaXNjdl92X3Vz
ZXJfYWxsb3dlZCh2b2lkKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAgICAgIHJldHVybiByaXNj
dl92X2dldF9jdXJfY3RybChjdXJyZW50KSA9PSBQUl9SSVNDVl9WX1ZTVEFURV9DVFJMX09OOwo+
ID4gPiA+ID4gIH0KPiA+ID4gPiA+ICtFWFBPUlRfU1lNQk9MKHJpc2N2X3ZfdXNlcl9hbGxvd2Vk
KTsKPiA+ID4gPgo+ID4gPiA+IElzIHRoZXJlIGEgcmVhc29uIHRoYXQgdGhpcyBzaG91bGQgbm90
IGJlIEVYUE9SVF9TWU1CT0xfR1BMKCk/Cj4gPiA+IEdvb2QgcXVlc3Rpb24sIGJ1dCBJIGp1c3Qg
Zm9sbG93IG91ciBhcmNoL3Jpc2N2IGhhYmJpdCwgbWF5YmUgd2UKPiA+ID4gc2hvdWxkIGNoYW5n
ZSBhbGwgb2YgdGhhdCBpbiBhbm90aGVyIHBhdGNoLgo+ID4gPgo+ID4gPiDinpwgIGxpbnV4LXM2
NGlscDMyIGdpdDooczY0aWxwMzIpIOKclyBncmVwIEVYUE9SVF9TWU1CT0wgIGFyY2gvcmlzY3Yg
LXIgfCB3YyAtbAo+ID4gPiA2Ngo+ID4gPiDinpwgIGxpbnV4LXM2NGlscDMyIGdpdDooczY0aWxw
MzIpIOKclyBncmVwIEVYUE9SVF9TWU1CT0xfR1BMICBhcmNoL3Jpc2N2IC1yIHwgd2MgLWwKPiA+
ID4gMTUKPiA+Cj4gPiBXaHkgIU1PRFVMRV9MSUNFTlNFKEdQTCkgbW9kdWxlcyBjb3VsZG4ndCB1
c2UgcmlzY3Zfdl91c2VyX2FsbG93ZWQ/Cj4gPiBTZWVtcyBFWFBPUlRfU1lNQk9MX0dQTCBoYXMg
bW9yZSBsaW1pdGF0aW9ucy4KPiA+Cj4gPiA6YzpmdW5jOmBFWFBPUlRfU1lNQk9MX0dQTCgpYAo+
ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+Cj4gPiBEZWZpbmVkIGluIGBgaW5j
bHVkZS9saW51eC9leHBvcnQuaGBgCj4gPgo+ID4gU2ltaWxhciB0byA6YzpmdW5jOmBFWFBPUlRf
U1lNQk9MKClgIGV4Y2VwdCB0aGF0IHRoZSBzeW1ib2xzCj4gPiBleHBvcnRlZCBieSA6YzpmdW5j
OmBFWFBPUlRfU1lNQk9MX0dQTCgpYCBjYW4gb25seSBiZSBzZWVuIGJ5Cj4gPiBtb2R1bGVzIHdp
dGggYSA6YzpmdW5jOmBNT0RVTEVfTElDRU5TRSgpYCB0aGF0IHNwZWNpZmllcyBhIEdQTAo+ID4g
Y29tcGF0aWJsZSBsaWNlbnNlLiBJdCBpbXBsaWVzIHRoYXQgdGhlIGZ1bmN0aW9uIGlzIGNvbnNp
ZGVyZWQgYW4KPiA+IGludGVybmFsIGltcGxlbWVudGF0aW9uIGlzc3VlLCBhbmQgbm90IHJlYWxs
eSBhbiBpbnRlcmZhY2UuIFNvbWUKPiA+IG1haW50YWluZXJzIGFuZCBkZXZlbG9wZXJzIG1heSBo
b3dldmVyIHJlcXVpcmUgRVhQT1JUX1NZTUJPTF9HUEwoKQo+ID4gd2hlbiBhZGRpbmcgYW55IG5l
dyBBUElzIG9yIGZ1bmN0aW9uYWxpdHkuCj4gPgo+ID4gRm9yIGt2bSBpcyBva2F5Ogo+ID4KPiA+
IE1PRFVMRV9BVVRIT1IoIlF1bXJhbmV0Iik7Cj4gPiBNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4g
Pgo+ID4gU28sIEkgd291bGQgbGVhdmUgdGhlIGRlY2l0aW9uIHRvIEFuZHkuIElmIGhlIGRpZG4n
dCB3YW50IGl0IHVzZWQgd2l0aAo+ID4gb3RoZXIgbm9uLWdwbCBtb2R1bGVzLCBjaG9vc2UgdGhl
IEVYUE9SVF9TWU1CT0xfR1BMLgo+Cj4gRG8geW91IGhhdmUgYW55IHVzZSBjYXNlIGZvciBleHBv
cnRpbmcgdGhpcyBmdW5jdGlvbiB0byBub24tR1BMCj4gbGljZW5zZWQgbW9kdWxlcz8gSSBleHBv
cnRlZCB0aGUgZnVuY3Rpb24gd2l0aCBFWFBPUlRfU1lNQk9MX0dQTCgpIGluCj4gdjIwWzFdIGJl
Y2F1c2UgSSB0aG91Z2h0IG1vc3QgbWFpbnRhaW5lcnMgd291bGQgYWNjZXB0IEdQTCByYXRoZXIg
dGhhbgo+IG5vbi1HUEwgb25lLiBBbmQgaXQgc2VlbXMgbW9zdCBkcml2ZXJzIHdvdWxkIG5ldmVy
IGNhbGwgdGhpcyBmdW5jdGlvbgo+IGFueXdheS4KSSBqdXN0IGZvdW5kIExpbnV4LW5leHQgYnVp
bGQgaXMgYnJva2VuLCBzbyBJIHNlbnQgdGhlIHBhdGNoLiBJdCBzZWVtcwp5b3UndmUgc29sdmVk
IHRoYXQuIFRoYXQncyBva2F5LgoKPgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgZmlndXJl
IEFuZHkgd2lsbCByb2xsIHRoaXMgaW50byB0aGlzIG5leHQgcmV2aXNpb24uCj4KPiBUaGUgZml4
IGZvciB0aGlzIGhhcyBiZWVuIGluY2x1ZGVkIGluIHYyMFsxXS4gSG93ZXZlciwgSSBhbHNvIGNo
YW5nZWQKPiB0aGUgZnVuY3Rpb24gbmFtZQo+IHMvcmlzY3Zfdl91c2VyX2FsbG93ZWQvcmlzY3Zf
dl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQvLgo+Cj4gPiA+ID4KPiA+ID4gPiBDaGVlcnMsCj4g
PiA+ID4gQ29ub3IuCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IEJlc3QgUmVnYXJk
cwo+ID4gPiAgR3VvIFJlbgo+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+IEJlc3QgUmVnYXJkcwo+ID4g
IEd1byBSZW4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNTE4MTYx
OTQ5LjExMjAzLTIxLWFuZHkuY2hpdUBzaWZpdmUuY29tLwo+Cj4gQ2hlZXJzLAo+IEFuZHkKCgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
