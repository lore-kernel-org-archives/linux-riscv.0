Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C9ECD6E5A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLVSJzpOl40nUkZBAfZUwOlb/uL3BglK9ne1GbbxfO8=; b=NHuE/h5F1QEVH5
	txOzYn2q3Rps4ZnFdV6vP76+wjPqtdle7ldmGFjzqCSKPJEOW7v6MlVq+31eiApZKyhvgIBXceZm6
	izAuKQLFWGdzkPZfFrFlxPdvbMNl9SJ1rieXkZqOYs0Lb23Tl00YRTuNva3Hq9isIiSN3xIuaLVsp
	gcpM8/CFWJHkkrSTULUmtamehyu2lWMyNW4d2qmDnCN5PVgxpahDlypqigwP52aI76FqyPmeZh7xO
	QUVZBvHprE/RdN11kDSn+qeAak+CdDTm5s3q1g+yEU8Cbkk1G9l61I2vBR4GQA9JcRhzYqHNShavQ
	gbNXUUbYvkYerm/kMSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWz9-00Ffog-2w;
	Wed, 11 Oct 2023 11:02:39 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWz6-00FfnW-1t
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:02:38 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4526c6579afso550167137.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697022154; x=1697626954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm0CdxGnQbe0GlEx3+GHVomKZQHiVEeERNIEs1qllzo=;
        b=oh/J9l6dicXqr4o1JrAAbPnE98njDjIJNhW6rUnd9sZtpVML2uaoL7Y5D8KPhLC/eX
         QJfwdccPuZPCfHYNafHTeQSIKc+4o4Ek/fuGONTsWPlGDEEyLHQKCoRtklDtM2MXepQJ
         OukrfYTjfXtybT92fIRh8kcNMcMRN2wLWpMoW+MR53U6iPNzhICooakjhLULLwqNbIH3
         9/MhjykRJjgUCLQTkiaW6/pFq8uK5c+xBZgooLuZ6A8SIP+stBvY27KZ+1QzHUsgQYUI
         y2hgNXQhH5kDxSZ/AkYmP1u7OEMivNuimWpJO9xliGl+O1jItAhpsZBa4fXIxVRhYxMi
         GCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022154; x=1697626954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm0CdxGnQbe0GlEx3+GHVomKZQHiVEeERNIEs1qllzo=;
        b=vQuUHheaPmvmjHX7onz8R4TMTGVXaDw4i+/4jDCs7wqMS7JvaqNTtnZ2vu8lX44YE5
         fWdQxpRLBWIQ5XG1DKfJsWijWosk3pPY9O1vCETvyn3kX3auNVv2YF4+70c1/YiGj0/V
         1dgtda64Pj3EhQlR4KpXdtiWTcR/GiVtX2hd1lfMWWMkK7pL37rJGlg4NZYgUU4xru8f
         kPxbxlukvvUo9yWc90WtMBElrigOqnI9k8H9FEENzhZsf0p+F7WQrHZMCIolYW4YCS8G
         rKgUsr8GkQGy38s+7uzElWBfdTGYKzkoAJpIyRzptmj5VuJvXkWI+n2Ss9szijaCWmIX
         9G1Q==
X-Gm-Message-State: AOJu0Yze7mTydHRD9fgdB7j94hNo8orlZ11pDygZF7fnoolhfYDQvS55
	XxD3PluCi2CRCC5kD0u0p3GOx/BnQnvo2Mw00MJpHw==
X-Google-Smtp-Source: AGHT+IFIHtzjwJekUc0/aKAwYGhSo8Q1f+C4Kna6UDSuc6EpwK7D5p52+dKgEnHoF5qIkm5zUTFf99ptwfMujMMVIFQ=
X-Received: by 2002:a05:6102:27c8:b0:452:79da:94a with SMTP id
 t8-20020a05610227c800b0045279da094amr8993764vsu.4.1697022154194; Wed, 11 Oct
 2023 04:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com> <2023101107-endorse-large-ef50@gregkh>
In-Reply-To: <2023101107-endorse-large-ef50@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 16:32:22 +0530
Message-ID: <CAK9=C2XYQ0U9CbuCg6cTf79sSsy+0BxF5mBE0R+E3s9iZFzEWw@mail.gmail.com>
Subject: Re: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to v2.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_040236_626153_E2239BCD 
X-CRM114-Status: GOOD (  27.76  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTI6NTfigK9QTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDExLCAyMDIz
IGF0IDExOjQ5OjE0QU0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAx
MCwgMjAyMyBhdCAxMDo0M+KAr1BNIEdyZWcgS3JvYWgtSGFydG1hbgo+ID4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBPY3QgMTAsIDIwMjMg
YXQgMTA6MzQ6NTlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gPiBXZSB3aWxsIGJl
IGltcGxlbWVudGluZyBTQkkgREJDTiBleHRlbnNpb24gZm9yIEtWTSBSSVNDLVYgc28gbGV0Cj4g
PiA+ID4gdXMgY2hhbmdlIHRoZSBLVk0gUklTQy1WIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24g
dG8gdjIuMC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgMiArLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmkuaAo+ID4gPiA+IGluZGV4IGNkY2YwZmYwN2JlNy4uOGQ2ZDRkY2U4
YTVlIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmgKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
Cj4gPiA+ID4gQEAgLTExLDcgKzExLDcgQEAKPiA+ID4gPgo+ID4gPiA+ICAjZGVmaW5lIEtWTV9T
QklfSU1QSUQgMwo+ID4gPiA+Cj4gPiA+ID4gLSNkZWZpbmUgS1ZNX1NCSV9WRVJTSU9OX01BSk9S
IDEKPiA+ID4gPiArI2RlZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMgo+ID4gPgo+ID4gPiBX
aGF0IGRvZXMgdGhpcyBudW1iZXIgbWVhbj8gIFdobyBjaGVja3MgaXQ/ICBXaHkgZG8geW91IGhh
dmUgdG8ga2VlcAo+ID4gPiBpbmNyZW1lbnRpbmcgaXQ/Cj4gPgo+ID4gVGhpcyBudW1iZXIgaXMg
dGhlIFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gaW1wbGVtZW50ZWQgYnkgS1ZNIFJJU0MtVgo+
ID4gZm9yIHRoZSBHdWVzdCBrZXJuZWwuCj4gPgo+ID4gVGhlIG9yaWdpbmFsIHNiaV9jb25zb2xl
X3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpIGFyZSBsZWdhY3kKPiA+IGZ1bmN0
aW9ucyAoYWthIFNCSSB2MC4xKSB3aGljaCB3ZXJlIGludHJvZHVjZWQgYSBmZXcgeWVhcnMgYmFj
ayBhbG9uZwo+ID4gd2l0aCB0aGUgTGludXggUklTQy1WIHBvcnQuCj4gPgo+ID4gVGhlIGxhdGVz
dCBTQkkgdjIuMCBzcGVjaWZpY2F0aW9uICh3aGljaCBpcyBub3cgZnJvemVuKSBpbnRyb2R1Y2Vz
IGEgbmV3Cj4gPiBTQkkgZGVidWcgY29uc29sZSBleHRlbnNpb24gd2hpY2ggcmVwbGFjZXMgbGVn
YWN5IHNiaV9jb25zb2xlX3B1dGNoYXIoKQo+ID4gYW5kIHNiaV9jb25zb2xlX2dldGNoYXIoKSBm
dW5jdGlvbnMgd2l0aCBiZXR0ZXIgYWx0ZXJuYXRpdmVzLgo+ID4gKFJlZmVyLCBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL2Nv
bW1pdC1mZTQ1NjI1MzJhOWNjNTdlNTc0M2I2NDY2OTQ2YzVlNWM5OGM3M2NhL3Jpc2N2LXNiaS5w
ZGYpCj4gPgo+ID4gVGhpcyBzZXJpZXMgYWRkcyBTQkkgZGVidWcgY29uc29sZSBpbXBsZW1lbnRh
dGlvbiBpbiBLVk0gUklTQy1WCj4gPiBzbyB0aGUgU0JJIHNwZWNpZmljYXRpb24gdmVyc2lvbiBh
ZHZlcnRpc2VkIGJ5IEtWTSBSSVNDLVYgbXVzdCBhbHNvIGJlCj4gPiB1cGdyYWRlZCB0byB2Mi4w
Lgo+ID4KPiA+IFJlZ2FyZGluZyB3aG8gY2hlY2tzIGl0cywgdGhlIFNCSSBjbGllbnQgZHJpdmVy
cyBpbiB0aGUgTGludXgga2VybmVsCj4gPiB3aWxsIGNoZWNrIFNCSSBzcGVjaWZpY2F0aW9uIHZl
cnNpb24gaW1wbGVtZW50ZWQgYnkgaGlnaGVyIHByaXZpbGVnZQo+ID4gbW9kZSAoTS1tb2RlIGZp
cm13YXJlIG9yIEhTLW1vZGUgaHlwZXJ2aXNvcikgYmVmb3JlIHByb2JpbmcKPiA+IHRoZSBTQkkg
ZXh0ZW5zaW9uLiBGb3IgZXhhbXBsZSwgdGhlIEhWQyBTQkkgZHJpdmVyIChQQVRDSDUpCj4gPiB3
aWxsIGVuc3VyZSBTQkkgc3BlYyB2ZXJzaW9uIHRvIGJlIGF0IGxlYXN0IHYyLjAgYmVmb3JlIHBy
b2JpbmcKPiA+IFNCSSBkZWJ1ZyBjb25zb2xlIGV4dGVuc2lvbi4KPgo+IElzIHRoaXMgYXBpIGJh
Y2t3YXJkcyBjb21wYXRpYmxlLCBvciBkaWQgeW91IGp1c3QgYnJlYWsgZXhpc3RpbmcKPiB1c2Vy
c3BhY2UgdGhhdCBvbmx5IGV4cGVjdHMgdmVyc2lvbiAxLjA/CgpUaGUgbGVnYWN5IHNiaV9jb25z
b2xlX3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVfZ2V0Y2hhcigpCmZ1bmN0aW9ucyBoYXZlIG5v
dCBjaGFuZ2VkIHNvIGl0IGRvZXMgbm90IGJyZWFrIGV4aXN0aW5nCnVzZXItc3BhY2UuCgpUaGUg
bmV3IFNCSSBEQkNOIGZ1bmN0aW9ucyB0byBiZSBpbXBsZW1lbnRlZCBieSBLVk0KdXNlciBzcGFj
ZSBhcmU6CnNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlKCkKc2JpX2RlYnVnX2NvbnNvbGVfcmVhZCgp
CnNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlX2J5dGUoKQoKPgo+IHRoYW5rcywKPgo+IGdyZWcgay1o
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
