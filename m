Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338EFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pn928N+coE+ogBqDMvmxqx87qGSFiL1LtWF1gHK7hcc=; b=LugIXdVGe6ojYV
	1sXKtKPNvQ3JH7XEQRxGhHpzebQ5mx+kVe6CPL4/VT1hAU0uK84k4+PwU2dCPeY8qVIsXKz6v1iib
	X7PCaNPvPGOAIwShNVhT1SaSV8DxJWqgu3ykwk6KDetMgvCSE/t0/jw8nbtV/SBAri/9kINW9b/98
	wRR9ZSksIz6SgjA1WDhltk9TavDGqW0+0m81drwx81vugaOMIb/9mGDI09kWGjDrR34DLP+1rAGZR
	6t4bAvzHkTT37VXExkoPncSC+P6qoMtwq4J7AkMTRSXlaVtEJgx+E3XFRJ0rk9YVF2uo6y6C8hVvx
	qgzdctMmfMrTulCe+v7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8f79-00AYUg-00;
	Thu, 30 Nov 2023 11:21:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8f75-00AYSI-26
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 11:21:49 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so722483b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701343305; x=1701948105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltGzMuZdljyy4p9L7jjaFw9tXSIPc3yGXDmblWBRMWY=;
        b=Js6qcriPPaN7WzMFvBV/z2IqF/cosnzaFbGiJFr9mtqe+tPZWupI3O6BxgVdaNtPID
         +DDvAjn4Of1vSYwqV0vg1i4cO4l6gkk+clXMtfGjoijiTTBJn8NFqjWl7LJ0k/+zuDQ6
         RCUa4WW4RKHfwVoLC/Ynts7kH2LBYtJZtGntPgExSv51g5EzD0iBf8aBajmivsDM+riV
         00fZiEwVT3bjwQ2AUBWinW6s00uspqgnJUxNMflJo6+JjiglsUNjQY7L5009t9/uZ8/v
         Vv1QCUsN7jfCkjk/N9TREGZmfQ9okFcDFJcBGNwIobJWrMrBRxoJqBodpxl9GBWrh/i0
         Tpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701343305; x=1701948105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltGzMuZdljyy4p9L7jjaFw9tXSIPc3yGXDmblWBRMWY=;
        b=TgRPWw3RXa0HpEpczRcuchy4SSAjcRrXr8w4NB0wtx8N3ILcPFcZ/nr/u3KrCHvalX
         IM3zMdJRYPfPzUs5E//hwJO5IDB2GHb2GzzPNGNZXMd8LPsTJHz5iWJcfNza2sinmU2G
         CdGnWtHcBgcY0rYYSx5SpvggKmu7MUeXLAP4ExeBY3w00WcqBbPRfttPVnyNBEmj5xSE
         4vhV6uHfgXn60GTdZBRGXqKGpBs5NtHdwboRzEd5v5p1B0P1QAUvonf9ZeZ149KJEL2h
         fpGqsPBNbUqUPybeZYlFbGSUSDSjwC+c6F9ZY3GZO0cppsZ4hsXPXfbIZuScnstxzrOX
         zspQ==
X-Gm-Message-State: AOJu0Yw3WtISmE9o/7uK3H1INKs31Du+9UVmoYG4RaCtiMJg6rj4KqFx
	SO8vt5uxTflxxOT2yOVIjtOKULlnVBLJEmP9o645pA==
X-Google-Smtp-Source: AGHT+IF1S/IheRCM150IkNersDCOV2nBhyW4KGeG1e3KISfGM2lz6pCiY+RuMxoMWvr3xnAIuZKsEHeGFOSAh6Y227M=
X-Received: by 2002:a05:6a20:1594:b0:18d:b43:78f9 with SMTP id
 h20-20020a056a20159400b0018d0b4378f9mr4632472pzj.39.1701343305387; Thu, 30
 Nov 2023 03:21:45 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAK9=C2WAv5jJBt56xBea268DeyUA+YvbU7i+ahVjueafCi-r6A@mail.gmail.com> <20231130-decibel-passenger-6e932b1ce554@spud>
In-Reply-To: <20231130-decibel-passenger-6e932b1ce554@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 Nov 2023 16:51:32 +0530
Message-ID: <CAK9=C2Vsx8ddpYiqUhvqnJpdb-FKeNhLz3PsVpSeEz4TeQHiEg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Anup Patel <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_032147_693984_E77EB8F5 
X-CRM114-Status: GOOD (  37.70  )
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

T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgMzoyN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwMzowMToyNFBNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gU2F0LCBOb3YgMTgsIDIwMjMgYXQgMTI6Mzni
gK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBUaGUgdGltZXIgcmVnaXN0ZXJzIG9mIGFjbGludCBkb24ndCBmb2xsb3cgdGhlIGNsaW50
IGxheW91dCBhbmQgY2FuCj4gPiA+IGJlIG1hcHBlZCBvbiBhbnkgZGlmZmVyZW50IG9mZnNldC4g
QXMgc2cyMDQyIHVzZXMgc2VwYXJhdGVkIHRpbWVyCj4gPiA+IGFuZCBtc3dpIGZvciBpdHMgY2xp
bnQsIGl0IHNob3VsZCBmb2xsb3cgdGhlIGFjbGludCBzcGVjIGFuZCBoYXZlCj4gPiA+IHNlcGFy
YXRlZCByZWdpc3RlcnMuCj4gPiA+Cj4gPiA+IFRoZSBwcmV2aW91cyBwYXRjaCBpbnRyb2R1Y2Vk
IGEgbmV3IHR5cGUgb2YgVC1IRUFEIGFjbGludCB0aW1lciB3aGljaAo+ID4gPiBoYXMgY2xpbnQg
dGltZXIgbGF5b3V0LiBBbHRob3VnaCBpdCBoYXMgdGhlIGNsaW50IHRpbWVyIGxheW91dCwgaXQK
PiA+ID4gc2hvdWxkIGZvbGxvdyB0aGUgYWNsaW50IHNwZWMgYW5kIHVzZXMgdGhlIHNlcGFyYXRl
ZCBtdGltZSBhbmQgbXRpbWVjbXAKPiA+ID4gcmVncy4gU28gYSBBQkkgY2hhbmdlIGlzIG5lZWRl
ZCB0byBtYWtlIHRoZSB0aW1lciBmaXQgdGhlIGFjbGludCBzcGVjLgo+ID4gPgo+ID4gPiBUbyBt
YWtlIFQtSEVBRCBhY2xpbnQgdGltZXIgbW9yZSBjbG9zZXIgdG8gdGhlIGFjbGludCBzcGVjLCB1
c2UKPiA+ID4gcmVncy1uYW1lcyB0byByZXByZXNlbnQgdGhlIG10aW1lY21wIHJlZ2lzdGVyLCB3
aGljaCBjYW4gYXZvaWQgaGFjawo+ID4gPiBmb3IgdW5zdXBwb3J0IG10aW1lIHJlZ2lzdGVyIG9m
IFQtSEVBRCBhY2xpbnQgdGltZXIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBB
bWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4KPiA+ID4gRml4ZXM6IDQ3MzQ0NDlmNzMxMSAo
ImR0LWJpbmRpbmdzOiB0aW1lcjogQWRkIFNvcGhnbyBzZzIwNDIgQ0xJTlQgdGltZXIiKQo+ID4g
PiBMaW5rOiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL29wZW5zYmkvMjAy
My1PY3RvYmVyLzAwNTY5My5odG1sCj4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9yaXNjdi1hY2xpbnQvYmxvYi9tYWluL3Jpc2N2LWFjbGludC5hZG9jCj4gPgo+ID4gVGhlIHJh
dGlmaWVkIFByaXYgdjEuMTIgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIHBsYXRmb3JtIHNwZWNpZmlj
IE0tbW9kZSB0aW1lcgo+ID4gcmVnaXN0ZXJzIHdpdGhvdXQgZGVmaW5pbmcgYW55IGxheW91dCBv
ZiBtdGltZSBhbmQgbXRpbWVjbXAgcmVnaXN0ZXJzLgo+ID4gKFJlZmVyLCAiMy4yLjEgTWFjaGlu
ZSBUaW1lciBSZWdpc3RlcnMgKG10aW1lIGFuZCBtdGltZWNtcCkiKQo+ID4KPiA+IFRoZSAidGhl
YWQsYzkwMC1hY2xpbnQtbXRpbWVyIiBjYW4gYmUgdGhvdWdodCBvZiBhcyBpcyBvbmUgcG9zc2li
bGUKPiA+IGltcGxlbWVudGF0aW9uIG9mICJyaXNjdixtdGltZXIiIGRlZmluZWQgYnkgdGhlIFBy
aXYgdjEuMTIgc3BlY2lmaWNhaXRvbi4KPiA+Cj4gPiBJZiBpdCBpcyBub3QgdG9vIGxhdGUgdGhl
biBJIHN1Z2dlc3QgbWFraW5nIHRoaXMgYmluZGluZyBpbnRvIGdlbmVyaWMKPiA+ICJyaXNjdixt
dGltZXIiIGJpbmRpbmcuCj4KPiBXZSBjb3VsZCBkZWZpbml0ZWx5IHJlb3JnYW5pc2UgdGhpbmdz
LCBpdCdzIG5vdCB0b28gbGF0ZSBmb3IgdGhhdCBhcwo+IGltcGxlbWVudGF0aW9uIHNwZWNpZmlj
IGNvbXBhdGlibGVzIHdvdWxkIGJlIG5lZWRlZCByZWdhcmRsZXNzLCBzbwo+IHNvZnR3YXJlIHRo
YXQgd291bGQndmUgbWF0Y2hlZCBvbiB0aG9zZSB3aWxsIGNvbnRpbnVlIHRvIGRvIHNvLgo+Cj4g
VGhhdCBzYWlkLCBkb2VzIHRoaXMgcGxhdGZvcm0gYWN0dWFsbHkgaW1wbGVtZW50IHRoZSAxLjEy
IHByaXYgc3BlYyBpZgo+IHRoZXJlIGlzIG5vIG10aW1lIHJlZ2lzdGVyPyBUaGUgc2VjdGlvbiB5
b3UgcmVmZXJlbmNlIHNheXM6Cj4gIlBsYXRmb3JtcyBwcm92aWRlIGEgcmVhbC10aW1lIGNvdW50
ZXIsIGV4cG9zZWQgYXMgYSBtZW1vcnktbWFwcGVkCj4gbWFjaGluZS1tb2RlIHJlYWQtd3JpdGUg
cmVnaXN0ZXIsIG10aW1lLiIgSXQgc2VlbXMgdG8gbWUgbGlrZSB0aGlzCj4gaGFyZHdhcmUgaXMg
bm90IHN1aXRhYmxlIGZvciBhIGdlbmVyaWMgInJpc2N2LG10aW1lciIgZmFsbGJhY2suCgpZZXMs
IHRoZSBULUhlYWQgbXRpbWVyIGRvZXMgbm90IGltcGxlbWVudCBib3RoIG10aW1lIGFuZCBtdGlt
ZWNtcApzbyB0ZWNobmljYWxseSBpdCBvbmx5IGltcGxlbWVudHMgYSBwb3J0aW9uIG9mIHRoZSBy
YXRpZmllZCBSSVNDLVYgbXRpbWVyCmNoYXB0ZXIuCgo+Cj4gQW0gSSBtaXNzaW5nIHNvbWV0aGlu
ZyB0aGVyZSBBbnVwPwo+Cj4gSXQgZG9lc24ndCBldmVuIGltcGxlbWVudCB0aGUgZHJhZnQgYWNs
aW50IHNwZWMsIGdpdmVuIHRoYXQgdGhhdCBzYXlzOgo+ICJUaGUgTVRJTUVSIGRldmljZSBwcm92
aWRlcyBtYWNoaW5lLWxldmVsIHRpbWVyIGZ1bmN0aW9uYWxpdHkgZm9yIGEgc2V0Cj4gb2YgSEFS
VHMgb24gYSBSSVNDLVYgcGxhdGZvcm0uIEl0IGhhcyBhIHNpbmdsZSBmaXhlZC1mcmVxdWVuY3kg
bW9ub3RvbmljCj4gdGltZSBjb3VudGVyIChNVElNRSkgcmVnaXN0ZXIgYW5kIGEgdGltZSBjb21w
YXJlIHJlZ2lzdGVyIChNVElNRUNNUCkgZm9yCj4gZWFjaCBIQVJUIGNvbm5lY3RlZCB0byB0aGUg
TVRJTUVSIGRldmljZS4iCj4KPiBCdXQgSSBhbHJlYWR5IHNhaWQgbm8gdG8gaGF2aW5nIGEgZ2Vu
ZXJpYywgInJpc2N2IiBwcmVmaXhlZCwgY29tcGF0aWJsZQo+IGZvciB0aGF0LCBnaXZlbiBpdCBp
cyBpbiBkcmFmdCBmb3JtLgoKSSBhbSBub3Qgc3VnZ2VzdGluZyBULUhlYWQgdGltZXIgaW1wbGVt
ZW50cyBhY2xpbnQgc3BlYy4gQWxzbywKc2luY2UgYWNsaW50IHNwZWMgaXMgaW4gZHJhZnQgc3Rh
dGUgaXQgaXMgb3V0IG9mIHRoZSBxdWVzdGlvbi4KCk15IHN1Z2dlc3Rpb24gaXMgdG8gdHJlYXQg
IjMuMi4xIE1hY2hpbmUgVGltZXIgUmVnaXN0ZXJzIChtdGltZQphbmQgbXRpbWVjbXApIiBhcyBS
SVNDLVYgbXRpbWVyIGRlZmluZWQgYnkgdGhlIFJJU0MtViBwcml2aWxlZ2VkCnNwZWNpZmljYXRp
b24gYW5kIGRlZmluZSAicmlzY3YiIHByZWZpeGVkIERUIGJpbmRpbmcgZm9yIHRoaXMuCgpUaGlz
IGJpbmRpbmcgZGVmaW5lcyB0d28gcG9zc2libGUgdmFsdWVzIGZvciAicmVnIiBwcm9wZXJ0eToK
MSkgY29udGFpbnMgdHdvIGl0ZW1zOiBhKSBtdGltZSByZWdpc3RlciBhZGRyZXNzIGFuZCwKICAg
ICBiKSBiYXNlIGFkZHJlc3Mgb2YgbXRpbWVjbXAgcmVnaXN0ZXJzCjIpIGNvbnRhaW4gb25lIGl0
ZW06IGEpIGJhc2UgYWRkcmVzcyBvZiBtdGltZWNtcCByZWdpc3RlcnMKClRoZSB0LWhlYWQgbXRp
bWVyIHNlZW1zIHRvIGltcGxlbWVudCAjMiB3aGVyZWFzIHRoZSBSSVNDLVYKbXRpbWVyIChQcml2
IHNwZWMpIGFsaWducyB3aXRoICMxLgoKSWYgd2Ugd2FudCB0byBrZWVwIHRoaXMgRFQgYmluZGlu
ZyB0LWhlYWQgc3BlY2lmaWMgdGhlbgp3ZSBzaG91bGQgcmVtb3ZlIG9wdGlvbiAjMSAoYWJvdmUp
IGZyb20gdGhpcyBEVCBiaW5kaW5nCmFuZCBhZGQgc2VwYXJhdGUgInJpc2N2IiBwcmVmaXhlZCBE
VCBiaW5kaW5nIGZvciBSSVNDLVYgbXRpbWVyLgoKUmVnYXJkcywKQW51cAoKPgo+IENoZWVycywK
PiBDb25vci4KPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi90aW1lci90aGVhZCxjOTAwLWFjbGludC1t
dGltZXIueWFtbCAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKy0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvdGhlYWQsYzkw
MC1hY2xpbnQtbXRpbWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGltZXIvdGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVyLnlhbWwKPiA+ID4gaW5kZXggZmJkMjM1NjUw
ZTUyLi4wNTM0ODhmYjEyODYgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aW1lci90aGVhZCxjOTAwLWFjbGludC1tdGltZXIueWFtbAo+ID4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvdGhlYWQsYzkwMC1h
Y2xpbnQtbXRpbWVyLnlhbWwKPiA+ID4gQEAgLTE3LDcgKzE3LDIwIEBAIHByb3BlcnRpZXM6Cj4g
PiA+ICAgICAgICAtIGNvbnN0OiB0aGVhZCxjOTAwLWFjbGludC1tdGltZXIKPiA+ID4KPiA+ID4g
ICAgcmVnOgo+ID4gPiAtICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsgICAgb25lT2Y6Cj4gPiA+ICsg
ICAgICAtIGl0ZW1zOgo+ID4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1USU1FIFJlZ2lz
dGVycwo+ID4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1USU1FQ01QIFJlZ2lzdGVycwo+
ID4gPiArICAgICAgLSBpdGVtczoKPiA+ID4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBNVElN
RUNNUCBSZWdpc3RlcnMKPiA+ID4gKwo+ID4gPiArICByZWctbmFtZXM6Cj4gPiA+ICsgICAgb25l
T2Y6Cj4gPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gPiArICAgICAgICAgIC0gY29uc3Q6IG10aW1l
Cj4gPiA+ICsgICAgICAgICAgLSBjb25zdDogbXRpbWVjbXAKPiA+ID4gKyAgICAgIC0gaXRlbXM6
Cj4gPiA+ICsgICAgICAgICAgLSBjb25zdDogbXRpbWVjbXAKPiA+ID4KPiA+ID4gICAgaW50ZXJy
dXB0cy1leHRlbmRlZDoKPiA+ID4gICAgICBtaW5JdGVtczogMQo+ID4gPiBAQCAtMjgsOCArNDEs
MzQgQEAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiA+ICByZXF1aXJlZDoKPiA+ID4g
ICAgLSBjb21wYXRpYmxlCj4gPiA+ICAgIC0gcmVnCj4gPiA+ICsgIC0gcmVnLW5hbWVzCj4gPiA+
ICAgIC0gaW50ZXJydXB0cy1leHRlbmRlZAo+ID4gPgo+ID4gPiArYWxsT2Y6Cj4gPiA+ICsgIC0g
aWY6Cj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4gPiArICAgICAgICBjb21wYXRpYmxlOgo+
ID4gPiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4gPiArICAgICAgICAgICAgY29uc3Q6IHRoZWFk
LGM5MDAtYWNsaW50LW10aW1lcgo+ID4gPiArICAgIHRoZW46Cj4gPiA+ICsgICAgICBwcm9wZXJ0
aWVzOgo+ID4gPiArICAgICAgICByZWc6Cj4gPiA+ICsgICAgICAgICAgaXRlbXM6Cj4gPiA+ICsg
ICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBNVElNRUNNUCBSZWdpc3RlcnMKPiA+ID4gKyAgICAg
ICAgcmVnLW5hbWVzOgo+ID4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4gPiArICAgICAgICAgICAg
LSBjb25zdDogbXRpbWVjbXAKPiA+ID4gKyAgICBlbHNlOgo+ID4gPiArICAgICAgcHJvcGVydGll
czoKPiA+ID4gKyAgICAgICAgcmVnOgo+ID4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4gPiArICAg
ICAgICAgICAgLSBkZXNjcmlwdGlvbjogTVRJTUUgUmVnaXN0ZXJzCj4gPiA+ICsgICAgICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBNVElNRUNNUCBSZWdpc3RlcnMKPiA+ID4gKyAgICAgICAgcmVnLW5h
bWVzOgo+ID4gPiArICAgICAgICAgIGl0ZW1zOgo+ID4gPiArICAgICAgICAgICAgLSBjb25zdDog
bXRpbWUKPiA+ID4gKyAgICAgICAgICAgIC0gY29uc3Q6IG10aW1lY21wCj4gPiA+ICsKPiA+ID4g
IGV4YW1wbGVzOgo+ID4gPiAgICAtIHwKPiA+ID4gICAgICB0aW1lckBhYzAwMDAwMCB7Cj4gPiA+
IEBAIC0zOSw1ICs3OCw2IEBAIGV4YW1wbGVzOgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDwmY3B1M2ludGMgNz4sCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PCZjcHU0aW50YyA3PjsKPiA+ID4gICAgICAgIHJlZyA9IDwweGFjMDAwMDAwIDB4MDAwMTAwMDA+
Owo+ID4gPiArICAgICAgcmVnLW5hbWVzID0gIm10aW1lY21wIjsKPiA+ID4gICAgICB9Owo+ID4g
PiAgLi4uCj4gPiA+IC0tCj4gPiA+IDIuNDIuMQo+ID4gPgo+ID4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
