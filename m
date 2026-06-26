Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3833BCD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+29NpTs4gvPjA56bM2tiXbVa0yf0LCKNvVFdKfFcgaM=; b=2FUMEN6mgFbLKj
	W0xXGsEDheNHvlaC4yhvJg0oL7VJGA5Ct8Z3a6rxmGr0S6PpcIjrDjEJkid73MqpRvHsiRVEisC5d
	PFK/AU/sroTWV+ip9af7LILpg+JXVpwrqUNi+ov5i/dldZBS5/p5mfuNk2TsIpPAL5LNSSL96jBPb
	eRl4zmypMLrt9qWCK6+GrlTYOmMWLR/wBP+2G4H30wnrpLdspU6D6waQtZaSg1+3pn3i6OInbiwbI
	XCCKp++xTecjqz04Ney2Fjq+uT+JEoS/nsymzr2vNBQkKFs/Dgy7yf5FG9KElw8MXo8O0M3hkGBAy
	NYvjIHE1lOSjUd2uUiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2hj-0000000AxTj-1NR2;
	Fri, 26 Jun 2026 09:18:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2hg-0000000AxSr-26vo
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 09:18:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso651344e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 02:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465503; cv=none;
        d=google.com; s=arc-20260327;
        b=PMs6BhFrNKnY7SLTlWJcMe+ND3jsRl0kycrO3i5ysfbxEC7dyFkTgCMbgM9V2bsqDK
         GdXYWQPko4kJGg32dIHCPcr6FNNDXAFivqU0sF6Jq/oYMBWcluG3dxMUPfc36oHjhPDe
         cfvugs/19rwWcnsm/K7e0zYMUgX8l26Dr1kedQeFCzOY8Ypx814mDaZuO8ndlM5bX2eF
         H3mddpudL7qNlA8JHvmhZizc/mVh1BxaRre/pSsHy+wvmIXlBlbExEkhK3PNQF27wfWq
         tXhhJ9TdBN+YwmdVRTtvVJaz0Rx87h6U906fxKbbGywMVllBhNOVY5c20CWAkXg4tlvm
         Z0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=5A7QLJVnnRF1grw7Qadi+Xe6423KOgf4RzCtaRBLKPI=;
        fh=x6CBvYA6QvVFHvtvaJVo3OrH9oNaVWbRa9orFMSibcc=;
        b=UFnCFr0V3fwGeRq7+1AJbkEAMGlH/WMMNMC/GNyjppZxaa1OmkXbtoPMDtAJT9eFE1
         l6mF9wR6B5gUDktjD71ccxZ6iXDXytzE5/iMf2yO98NWKy9kwrqIAxqm+tE5I9el6HpL
         lBeCL1wKRW1QxnUGRYFSavEkoBel7Amh/6mV/4EISE+kvyMwGj2yiu0pxGGK/suNVNmJ
         7koOYClJp1vg/0STgj6R3jA0UJfA89vYriQwOCPQLcOjWIX9CX9KbasTIWbyC3HC1+H/
         v1wtD0dAj04dN/LPu9NdZWAqNt3hPOxXpOq5cUOznx3NFXgyDIjOJeTGiGN1ArjQFCIt
         1EJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782465503; x=1783070303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A7QLJVnnRF1grw7Qadi+Xe6423KOgf4RzCtaRBLKPI=;
        b=kGU8e9M0X5IbPf0f2i/34ANhcCh2OffRkl1AsdI6Om6L/MUn8/pxP83ZcAYluG48lj
         9Mqs615NWSre7A867Af++NiILtoPN9o8yzZ2YJT2ziSUGg7Y3Lti2CVJdInOZ4VBNAfr
         IUS6kPj0uhqjVgtw8+0FvBPE3Jh5EKlBBJ/yAJ815fDc+7H3h530ATGdt18BUQfMy54p
         xRfW5PpQ7ddacEY0OV5nVg4laaivnv/nJybVUnhmiWUDiOcnw6vkYIWQW9WymsUEV8xe
         9SQydtwhoCd/EH3R0GAl+Au3PMznEe+x4QkChLC7ZYmrafKN6LpODcacU8P5E5iK8gqd
         1LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465503; x=1783070303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5A7QLJVnnRF1grw7Qadi+Xe6423KOgf4RzCtaRBLKPI=;
        b=KaE3DXjfaM7TIjdBIb+p8mz2BxIIk7ekMNqC7mX/1KKlQOBdUMrrBP/60MN/9Z6hxG
         9BB8RiMeYCFYkaa3c8gkhdHnO8gM2yyb2/vdU4Kqy7nEDFZIxlw0uT9bs33m+Lh6l2Xa
         3rfRyWlUat6v6Vlm0JHUEX8UbgOhzyluHwXIbutTNlmuh5uZqyUkt/J59YuM14gOGFfy
         tV0vvYdwy74pL1pIlbsRHsieH84K9t9hEKR2ZUli+aE3FehTIusMPJFuLSl2zcCGZVUI
         hOEAPW3STGQK388EOiYGMPw4QNxZpBW3vYCHVq2bfTAp3kfL58wsuCb8GHz8BTHZAUUY
         RhCQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0YArqD1heXRDk7DG+U30KzzkYgqg4FTcyjGuSXdB2EPSfXT2dvilkgGodmY9xQW8Auq78T+RuB2gE4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD+yo7moMHI23brSnG3bGnuyReil9v2TOwngZ892vTTJYhWOwf
	qjIBHveMmdWXxIODY/guiPFnEGGCddFW0vHbkj/ku7jX683UsV86Mg0EXFc8VF4K5BBrmf22QOh
	Al9Ch23+yauoOBjfnMSSGM7ohSQIYWdM3E9QskrNe/w==
X-Gm-Gg: AfdE7clKvqLGhwPfouqETzfxW399vP9jnLcyXYdOnwZ+VAmWyovIZJOfSgL2T8JNHlr
	V3otcVqlHvYZZgMY/YMSwz+QpfkutvlkV28/OZ68qwGaIcSZQCDDSI+PDHRy0+0T3rlcn0f8Vol
	OqDKyNrT1smqRIozgAaBbin8LL8cHtLmXIHxBp28df3lYt9vcGBg4EomQ6BLNNUoQA/qKixEMr5
	BNM/XkU889suviPgbhgXerA6Amke+n3f1A1AYTgM36awJRG23B3PSH1jROaYukk+QIJFFUm
X-Received: by 2002:a05:6512:3087:b0:5ae:a02a:2e7c with SMTP id
 2adb3069b0e04-5aea1f58483mr2337167e87.51.1782465503485; Fri, 26 Jun 2026
 02:18:23 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 26 Jun 2026 05:18:22 -0400
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 26 Jun 2026 05:18:22 -0400
Mime-Version: 1.0
In-Reply-To: <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin> <CAJF2gTQqnpHPrE-df_kDZ-Y9g7sSfTQco3jKKnDzkuJfOEKmxQ@mail.gmail.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Fri, 26 Jun 2026 05:18:22 -0400
X-Gm-Features: AVVi8CdEwhBwvyo-EDiIrtVs5AHpI7dVH_0a4n6l1MHi5R4KwVIrOkOgVmrGOrc
Message-ID: <CACnXVneh5r=BUH2RHqpvLN+D3i+1R1P8VuGiZJwPLFuQ3zKPzA@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: Guo Ren <guoren@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>
Cc: David Laight <david.laight.linux@gmail.com>, alex <alex@ghiti.fr>, 
	aou <aou@eecs.berkeley.edu>, cuiyunhui@bytedance.com, 
	iommu <iommu@lists.linux.dev>, joro <joro@8bytes.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, luxu.kernel@bytedance.com, 
	palmer <palmer@dabbelt.com>, pjw <pjw@kernel.org>, 
	"robin.murphy" <robin.murphy@arm.com>, tjeznach <tjeznach@rivosinc.com>, will <will@kernel.org>, 
	yuanzhu@bytedance.com, "zong.li@sifive.com" <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_021828_600361_CDFF94F3 
X-CRM114-Status: GOOD (  30.10  )
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

SGkgVml2aWFuLCBHdW8gUmVuLAoKVGhhbmtzIGZvciB0aGUgZGlzY3Vzc2lvbi4gSSBqdXN0IGNh
dWdodCB1cCB3aXRoIHRoZSB0aHJlYWQgYW5kIHRoZQpHaXRIdWIgaXNzdWUgWzFdLgoKSSB0aGlu
ayB3ZSBwcm9iYWJseSBkbyBub3QgbmVlZCB0byBzcGVuZCB0b28gbXVjaCB0aW1lIGRpc2N1c3Np
bmcgdGhlIGV4YWN0Cm1lYW5pbmcgb2YgUlNDVjAwMDQgYXJvdW5kIDMyLWJpdCB2cyA2NC1iaXQg
TU1JTyBhY2Nlc3MuIEF0IGxlYXN0IGZyb20gbXkKc2lkZSwgSSBkbyBub3Qgc2VlIG11Y2ggcHJh
Y3RpY2FsIGJlbmVmaXQgaW4gc3BsaXR0aW5nIHRoZSBzdGFuZGFyZCBISUQgZm9yCnRoaXMgZGlz
dGluY3Rpb24uCgpUaGUgb3JpZ2luYWwgcHJvYmxlbSBJIHdhbnQgdG8gc29sdmUgaXMgc2ltcGxl
OiBMaW51eCBzaG91bGQgaGF2ZSBhIGNvbXBhdGlibGUKYW5kIG1haW50YWluYWJsZSB3YXkgdG8g
c3VwcG9ydCBJT01NVXMgdGhhdCBuZWVkIDMyLWJpdCBNTUlPIGFjY2Vzc2VzIGZvcgo2NC1iaXQg
cmVnaXN0ZXJzLCBpbnN0ZWFkIG9mIHRha2luZyBhbiBhY2Nlc3MgZmF1bHQgdGhhdCBsZWFkcyB0
byBwYW5pYy4KSWRlYWxseSwgb25lIGdlbmVyaWMga2VybmVsIHNob3VsZCBzdXBwb3J0IGJvdGgg
YWNjZXNzIHNlcXVlbmNlcyB3aXRob3V0IGEKYnVpbGQtdGltZSBvcHRpb24uCgpXb3VsZCBpdCBi
ZSByZWFzb25hYmxlIHRvIGtlZXAgUlNDVjAwMDQgLyByaXNjdixpb21tdSBhcyB0aGUgY29tbW9u
IGRldmljZQppZGVudGlmaWVyLCBhbmQgZGVzY3JpYmUgdGhlIHJlcXVpcmVkIHJlZ2lzdGVyIGFj
Y2VzcyB3aWR0aCBhcyBhIHJ1bnRpbWUKZmlybXdhcmUgcHJvcGVydHkgaW5zdGVhZD8gRm9yIEFD
UEksIHRoaXMgbWlnaHQgYmUgYW4gX0RTRCBwcm9wZXJ0eSBvbiB0aGUKSU9NTVUgZGV2aWNlOyBm
b3IgZGV2aWNldHJlZSwgaXQgY291bGQgYmUgYSBtYXRjaGluZyBEVCBwcm9wZXJ0eS4gVGhlIGRy
aXZlcgpjb3VsZCB0aGVuIGNoZWNrIGl0IGR1cmluZyBlbnVtZXJhdGlvbiBhbmQgc2VsZWN0IHRo
ZSBhcHByb3ByaWF0ZSByZWdpc3RlcgphY2Nlc3NvcnMuCgpUaGlzIGF2b2lkcyByZWRlZmluaW5n
IHRoZSBBQ1BJIEhJRCBvciBjb21wYXRpYmxlIHN0cmluZywga2VlcHMgb25lIGdlbmVyaWMKa2Vy
bmVsIGltYWdlLCBhbmQgbWFrZXMgdGhlIDMyLWJpdCBNTUlPIGZhbGxiYWNrIGV4cGxpY2l0IGlu
IGZpcm13YXJlLiBNeSBnb2FsCmlzIGp1c3QgdG8gaW1wbGVtZW50IHRoZSBzcGVjIHdvcmRpbmcg
dGhhdCAiUmVnaXN0ZXJzIHRoYXQgYXJlIDY0LWJpdCB3aWRlIG1heQpiZSBhY2Nlc3NlZCB1c2lu
ZyBlaXRoZXIgYSAzMi1iaXQgb3IgYSA2NC1iaXQgYWNjZXNzLiIgaW4gYSBsaWdodHdlaWdodCB3
YXkKdGhhdCBpcyBhY2NlcHRhYmxlIGZvciB0aGUgTGludXggZHJpdmVyLgoKWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWlvbW11L2lzc3Vlcy83NjUjaXNzdWVjb21t
ZW50LTQ3NDI5NDE4OTQKCkJlc3QgcmVnYXJkcywKWmhhbnBlbmcKCj4gRnJvbTogIkd1byBSZW4i
PGd1b3JlbkBrZXJuZWwub3JnPgo+IERhdGU6wqAgRnJpLCBKdW4gMTksIDIwMjYsIDAwOjQxCj4g
U3ViamVjdDrCoCBbRXh0ZXJuYWxdIFJlOiBbUEFUQ0ggdjFdIGlvbW11L3Jpc2N2OiBTdXBwb3J0
IDMyLWJpdCByZWdpc3RlciBhY2Nlc3Nlcwo+IFRvOiAiRGF2aWQgTGFpZ2h0IjxkYXZpZC5sYWln
aHQubGludXhAZ21haWwuY29tPgo+IENjOiAiVml2aWFuIFdhbmciPHdhbmdydWlrYW5nQGlzY2Fz
LmFjLmNuPiwgPHpoYW5nemhhbnBlbmcuamFzcGVyQGJ5dGVkYW5jZS5jb20+LCA8YWxleEBnaGl0
aS5mcj4sIDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+LCA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
LCA8aW9tbXVAbGlzdHMubGludXguZGV2PiwgPGpvcm9AOGJ5dGVzLm9yZz4sIDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPiwgPGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+LCA8
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4sIDxwYWxtZXJAZGFiYmVsdC5jb20+LCA8cGp3QGtl
cm5lbC5vcmc+LCA8cm9iaW4ubXVycGh5QGFybS5jb20+LCA8dGplem5hY2hAcml2b3NpbmMuY29t
PiwgPHdpbGxAa2VybmVsLm9yZz4sIDx5dWFuemh1QGJ5dGVkYW5jZS5jb20+Cj4gT24gVGh1LCBK
dW4gMTgsIDIwMjYgYXQgOTozNuKAr1BNIERhdmlkIExhaWdodAo+IDxkYXZpZC5sYWlnaHQubGlu
dXhAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDE4IEp1biAyMDI2IDE3OjUxOjM0
ICswODAwCj4gPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiBI
aSBWaXZpYW4sCj4gPiA+Cj4gPiA+IEFzIG5vdGVkIGluIHRoZSBSSVNDLVYgSU9NTVUgU3BlY2lm
aWNhdGlvbiwgQ2hhcHRlciA2Ogo+ID4gPiA+IFdoZXRoZXIgYW4gOC1ieXRlIGFjY2VzcyB0byBh
biBJT01NVSByZWdpc3RlciBpcyBzaW5nbGUtY29weSBhdG9taWMgaXMgVU5TUEVDSUZJRUQsIGFu
ZCBzdWNoIGFuIGFjY2VzcyBtYXkgYXBwZWFyLCBpbnRlcm5hbGx5IHRvIHRoZSBJT01NVSwgYXMg
aWYgdHdvIHNlcGFyYXRlIDQtYnl0ZSBhY2Nlc3NlcyDigJQgZmlyc3QgdG8gdGhlIGhpZ2ggaGFs
ZiBhbmQgc2Vjb25kIHRvIHRoZSBsb3cgaGFsZiDigJQgd2VyZSBwZXJmb3JtZWQuCj4gPiA+Cj4g
PiA+IFRoZXJlZm9yZSwgdGhlIGF0b21pY2l0eSBvZiA2NC1iaXQgTU1JTyBhY2Nlc3NlcyBpcyBV
TlNQRUNJRklFRCBhbmQKPiA+ID4gbm90IGNsZWFybHkgZGVmaW5lZCBpbiB0aGUgY3VycmVudCBy
YXRpZmllZCBSSVNDLVYgSU9NTVUKPiA+ID4gc3BlY2lmaWNhdGlvbi4gVG8gaGFuZGxlIHRoaXMg
Y29ycmVjdGx5LCB0aGUgTGludXggUklTQy1WIElPTU1VIGRyaXZlcgo+ID4gPiBzaG91bGQgZmFs
bCBiYWNrIHRvIDMyLWJpdCBNTUlPIGFjY2Vzc2VzIHdoZW4gcmVhZGluZyA2NC1iaXQgcmVnaXN0
ZXJzCj4gPiA+IChlLmcuLCBwZXJmb3JtYW5jZSBjb3VudGVycykuIFRoZSBiZWhhdmlvciBvZiAz
Mi1iaXQgTU1JTyBhY2Nlc3NlcyBpcwo+ID4gPiBtb3JlIHByZWNpc2VseSBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgSU9NTVUgc3BlY2lmaWNhdGlvbi4KPiA+ID4KPiA+ID4gVGh1cywgbWFueSBoYXJk
d2FyZSB2ZW5kb3JzIGltcGxlbWVudCAzMi1iaXQgTU1JTyAocmF0aGVyIHRoYW4gNjQtYml0Cj4g
PiA+IE1NSU8pIGJhc2VkIG9uIHRoZSBjdXJyZW50IHJhdGlmaWVkIFJJU0MtViBJT01NVSBzcGVj
aWZpY2F0aW9uLCBhbmQKPiA+ID4gdGhpcyBkcml2ZXIgZG9lcyBub3QgYXBwZWFyIHRvIGJlbmVm
aXQgZnJvbSA2NC1iaXQgTU1JTyBhY2Nlc3MgZWl0aGVyLgo+ID4gPiBQZXJmb3JtYW5jZSBpcyBm
dW5kYW1lbnRhbGx5IGNvbnN0cmFpbmVkIGJ5IGJ1cyBsYXRlbmN5OyBhc3N1bWluZyB0aGF0Cj4g
PiA+IHNpbXBseSByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGFjY2Vzc2VzIHdpbGwgaW1wcm92ZSBw
ZXJmb3JtYW5jZSBpcyBhbgo+ID4gPiBvdmVyc2ltcGxpZmljYXRpb24gdGhhdCBpZ25vcmVzIHRo
ZSB1bmRlcmx5aW5nIGhhcmR3YXJlCj4gPiA+IGNoYXJhY3RlcmlzdGljcy4KPiA+Cj4gPiBJZiB0
aGUgYnVzIGxhdGVuY3kgaXMgc2lnbmlmaWNhbnQgaXQgaXMgYWxtb3N0IGNlcnRhaW5seSB3b3J0
aCB1c2luZwo+ID4gbWVtb3J5IGFjY2Vzc2VzIHRvIGF2b2lkIHJlLXJlYWRpbmcgdGhlIGhpIHJl
Z2lzdGVyLgo+ID4KPiA+IFNvbWV0aGluZyBsaWtlIHRoaXMgbWlnaHQgd29yazoKPiA+Cj4gPiBz
dGF0aWMgdm9sYXRpbGUgdTMyIGhpX3ByZXYsIGxvX3ByZXY7Cj4gPgo+ID4gwqAgwqAgwqAgwqAg
dTMyIGhpID0gcmVhZF9yZWdfaGkoKTsKPiA+IMKgIMKgIMKgIMKgIHUzMiBsbyA9IHJlYWRfcmVn
X2xvKCk7Cj4gPgo+ID4gwqAgwqAgwqAgwqAgaWYgKGxvIDw9IGxvX3ByZXYgfHwgaGkgIT0gaGlf
cHJldikgewo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdTMyIGhpX3RtcCA9IHJlYWRfcmVn
X2hpOwo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGhpX3RtcCAhPSBoaSkgewo+ID4g
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaGkgPSBoaV90bXA7Cj4gPiDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsbyA9IDA7Cj4gPiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9Cj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsb19wcmV2ID0gfjB1Owo+
ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaGlfcHJldiA9IGhpOwo+ID4gwqAgwqAgwqAgwqAg
fQo+ID4gwqAgwqAgwqAgwqAgbG9fcHJldiA9IGxvOwo+ID4gwqAgwqAgwqAgwqAgcmV0dXJuICh1
NjQpaGkgPDwgMzIgfCBsbzsKPiA+Cj4gPiBJdCBzaG91bGRuJ3QgbmVlZCBhbnkgbG9ja2luZyBi
dXQgdGhlIGFjY2Vzc2VzIGRvIG5lZWQgdG8gYmUgb3JkZXJlZC4KPiBUaGFuayB5b3UgZm9yIHRo
ZSBzdWdnZXN0aW9uLiBIb3dldmVyLCBJIGJlbGlldmUgdGhpcyBmZWVkYmFjayBpcyBtb3JlCj4g
cmVsZXZhbnQgdG8gdGhlIFJJU0MtViBJT01NVSBIUE0gcGF0Y2hzZXQgWzFdLCBhcyBubyBjb3Vu
dGVyIHJlZ2lzdGVycwo+IGFyZSBpbnZvbHZlZCBpbiB0aGUgY3VycmVudCBwYXRjaHNldC4gVGhh
dCBzYWlkLCB0aGUgaWRlYSBvZiBpbXByb3ZpbmcKPiB0aGUgaGktbG8taGkgc2xvdy1wYXRoIG1l
Y2hhbmlzbSB0byBiZXR0ZXIgaGFuZGxlIGhpZ2gtbGF0ZW5jeQo+IGhhcmR3YXJlIHNjZW5hcmlv
cyBpcyB3ZWxsIHRha2VuIGFuZCB3b3J0aCBkaXNjdXNzaW5nIGluIHRoZQo+IGFwcHJvcHJpYXRl
IHRocmVhZC4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYw
MjA4MDYzODQ4LjM1NDc4MTctMi16b25nLmxpQHNpZml2ZS5jb20vCj4KPiBQLlMuIFRoZSBoYXJk
d2FyZSBJIGhhdmUgYXQgaGFuZCBleGhpYml0cyB2ZXJ5IGxvdyBpbnRlcmNvbm5lY3QKPiBsYXRl
bmN5LiBBbmQgSSBoYXZlIG5ldmVyIG9ic2VydmVkIHRoZSBzbG93IHBhdGggd2hlcmUgaGlfdG1w
ICE9IGhpCj4gYmVpbmcgdHJpZ2dlcmVkIOKAlCBteSBhcHByb2FjaCB3YXMgdG8gcmVtb3ZlIHRo
ZSByZXRyeSBtZWNoYW5pc20KPiBkaXJlY3RseSBpbiAzMi1iaXQgbW1pbyBtb2RlIGFuZCBydW4g
c3RyZXNzIHRlc3RzIHRvIGNoZWNrIHdoZXRoZXIKPiBwZXJmIHN0YXQgcHJvZHVjZWQgaW5jb3Jy
ZWN0IHJlc3VsdHMuIFRoYXQgc2FpZCwgSSBtYXkgaGF2ZSBzaW1wbHkKPiBiZWVuIGx1Y2t5IGlu
c3RlYWQgb2YgaHcgZ3VhcmFudGVlLgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiDCoEd1byBSZW4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
