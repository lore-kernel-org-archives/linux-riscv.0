Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E018ACD6E7E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16H0yYzDc4E+6SvPMPcZ2wmtpJzMthtbjESj8OfbM/Q=; b=eCvSlzBjG0RBws
	TUoIz2BsNfxy7T67E5MRVQKm2NBILMbqndkBhD7bSqss/1XfaknUPsSsHbhSyToCX54YAU8bvnnxa
	mWQPTBNj2oH2XCrS9i2yxNbIGad6SpjvFvnJ7y/TExMrkb/MmjnHkbQbxjGjpbvLMQHqIdn46dTcO
	j67ggVzo5jP52wZylYuprREh30aLJ8cBvST080/CzKoktTYoyiPCzpP9cqmCCyVkJxVetrd4MU0+Y
	MQKWYF5mLKSxlijoDsWDTZaekWrX/YcTuZGo5OATeHqGUGUqS1Vy5TXUGwYt6/3CHbQG5wBmkIvE+
	mQfwnD/32m5YmxCcz4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbI1-00GCD7-28;
	Wed, 11 Oct 2023 15:38:25 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbHy-00GCBW-1K
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 15:38:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27736c2a731so5423563a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 08:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697038701; x=1697643501; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bZpkRgovz51AKO2Ok87+Y9u7MeLQt0Mw3B5ANlnfec=;
        b=hN4sUJ5NnPo4b6l2e+ug5ct2ZTkdJaNnjpJNzRLzwrTuB0ClPLPKFCRSqKPumFLwbx
         R3tcaYivr1CfMGHoT6jbH9Bknzk28UhHBZbTbszJ0tPvgwv/OqlRJJNAXFT5zhEzvSSQ
         KoV7FoNUZUcQ3ybpwQh7+XnHMIN3RpvbLxsnbY+fi8ao35noKlP8yZb1056vrqeI4mRz
         GaFUTAmckp2Hp0ObyqTYAZR5SnWfIMJTxn6FdLYgaPV3Pdc8DLtNFGw9avskuRYbA+6/
         aOWUpEfJonEzDM21h+rPHuUxBB3ZTywxNdXAn/YEsXt4gDvG24K5G37tZajZxxC1PNx5
         C5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697038701; x=1697643501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bZpkRgovz51AKO2Ok87+Y9u7MeLQt0Mw3B5ANlnfec=;
        b=Ci8Opd4PL9k58MI9UggjjMQwwJK+ED+DBxnk2CGfbIFl5A2/1YWP/NL1bfCsbiFoA1
         23wZpVWd58+0YH5nMgUoBpce3kpsfjLWutUGjhpsCxOMtMv0opecY9RDTCqFXNAOJGCz
         5EwKpGCv5rEOcTFnaU5QsLJZNUn8muey46eMJOB1JoSfDhTPgJR1SCv7XgHaeyRmU0gw
         XStpqJ641KFJ7ocd0n3VZHIHcxnzKoQHPojjXKiXjTU888eCUwMEeBU+Okjdj9WjxG/v
         WAbNtDJCXR6JevNZiPrCozTjIVg/I5kNSIwJZ2ddoxMJsDU+7JaQTh/NdQhGHJ3HOvV+
         C7eQ==
X-Gm-Message-State: AOJu0Ywi67EjlCivI9dmLt5Fqr0qPSAE0nlVxsl/krg2X6+Tyr0rdiO/
	ojgf9i7ebOgF68sgYG1va24zp36TFDOOU3CahxLOvg==
X-Google-Smtp-Source: AGHT+IH+Duhf61q+4YQ+h+trrczoreLWiVAuNX7LPf/svKzSeewv2TIyrBxClNtHOHej4LGq2AeV1O2tRvRwJwp6muo=
X-Received: by 2002:a17:90a:5383:b0:27c:ea4c:d8c5 with SMTP id
 y3-20020a17090a538300b0027cea4cd8c5mr5192162pjh.19.1697038701054; Wed, 11 Oct
 2023 08:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
 <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
 <2023101107-endorse-large-ef50@gregkh> <CAK9=C2XYQ0U9CbuCg6cTf79sSsy+0BxF5mBE0R+E3s9iZFzEWw@mail.gmail.com>
 <2023101148-anatomy-mantis-a0f5@gregkh>
In-Reply-To: <2023101148-anatomy-mantis-a0f5@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 21:08:10 +0530
Message-ID: <CAK9=C2XpfQc2eoBmrd5ZicR+HO34-2BZdvrNu_CQ5qC47WKBVw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231011_083822_450244_CDED2A15 
X-CRM114-Status: GOOD (  31.54  )
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

T24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgODo1NuKAr1BNIEdyZWcgS3JvYWgtSGFydG1hbgo8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMTEsIDIwMjMg
YXQgMDQ6MzI6MjJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDEx
LCAyMDIzIGF0IDEyOjU34oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFuCj4gPiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIE9jdCAxMSwgMjAyMyBh
dCAxMTo0OToxNEFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgT2N0
IDEwLCAyMDIzIGF0IDEwOjQz4oCvUE0gR3JlZyBLcm9haC1IYXJ0bWFuCj4gPiA+ID4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUdWUs
IE9jdCAxMCwgMjAyMyBhdCAxMDozNDo1OVBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4g
PiA+ID4gPiBXZSB3aWxsIGJlIGltcGxlbWVudGluZyBTQkkgREJDTiBleHRlbnNpb24gZm9yIEtW
TSBSSVNDLVYgc28gbGV0Cj4gPiA+ID4gPiA+IHVzIGNoYW5nZSB0aGUgS1ZNIFJJU0MtViBTQkkg
c3BlY2lmaWNhdGlvbiB2ZXJzaW9uIHRvIHYyLjAuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiA+
ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2Jp
LmggfCAyICstCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV92Y3B1X3NiaS5oCj4gPiA+ID4gPiA+IGluZGV4IGNkY2YwZmYwN2JlNy4uOGQ2ZDRkY2U4YTVl
IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oCj4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmgKPiA+ID4gPiA+ID4gQEAgLTExLDcgKzExLDcgQEAKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gICNkZWZpbmUgS1ZNX1NCSV9JTVBJRCAzCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IC0jZGVm
aW5lIEtWTV9TQklfVkVSU0lPTl9NQUpPUiAxCj4gPiA+ID4gPiA+ICsjZGVmaW5lIEtWTV9TQklf
VkVSU0lPTl9NQUpPUiAyCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hhdCBkb2VzIHRoaXMgbnVtYmVy
IG1lYW4/ICBXaG8gY2hlY2tzIGl0PyAgV2h5IGRvIHlvdSBoYXZlIHRvIGtlZXAKPiA+ID4gPiA+
IGluY3JlbWVudGluZyBpdD8KPiA+ID4gPgo+ID4gPiA+IFRoaXMgbnVtYmVyIGlzIHRoZSBTQkkg
c3BlY2lmaWNhdGlvbiB2ZXJzaW9uIGltcGxlbWVudGVkIGJ5IEtWTSBSSVNDLVYKPiA+ID4gPiBm
b3IgdGhlIEd1ZXN0IGtlcm5lbC4KPiA+ID4gPgo+ID4gPiA+IFRoZSBvcmlnaW5hbCBzYmlfY29u
c29sZV9wdXRjaGFyKCkgYW5kIHNiaV9jb25zb2xlX2dldGNoYXIoKSBhcmUgbGVnYWN5Cj4gPiA+
ID4gZnVuY3Rpb25zIChha2EgU0JJIHYwLjEpIHdoaWNoIHdlcmUgaW50cm9kdWNlZCBhIGZldyB5
ZWFycyBiYWNrIGFsb25nCj4gPiA+ID4gd2l0aCB0aGUgTGludXggUklTQy1WIHBvcnQuCj4gPiA+
ID4KPiA+ID4gPiBUaGUgbGF0ZXN0IFNCSSB2Mi4wIHNwZWNpZmljYXRpb24gKHdoaWNoIGlzIG5v
dyBmcm96ZW4pIGludHJvZHVjZXMgYSBuZXcKPiA+ID4gPiBTQkkgZGVidWcgY29uc29sZSBleHRl
bnNpb24gd2hpY2ggcmVwbGFjZXMgbGVnYWN5IHNiaV9jb25zb2xlX3B1dGNoYXIoKQo+ID4gPiA+
IGFuZCBzYmlfY29uc29sZV9nZXRjaGFyKCkgZnVuY3Rpb25zIHdpdGggYmV0dGVyIGFsdGVybmF0
aXZlcy4KPiA+ID4gPiAoUmVmZXIsIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jp
c2N2LXNiaS1kb2MvcmVsZWFzZXMvZG93bmxvYWQvY29tbWl0LWZlNDU2MjUzMmE5Y2M1N2U1NzQz
YjY0NjY5NDZjNWU1Yzk4YzczY2EvcmlzY3Ytc2JpLnBkZikKPiA+ID4gPgo+ID4gPiA+IFRoaXMg
c2VyaWVzIGFkZHMgU0JJIGRlYnVnIGNvbnNvbGUgaW1wbGVtZW50YXRpb24gaW4gS1ZNIFJJU0Mt
Vgo+ID4gPiA+IHNvIHRoZSBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9uIGFkdmVydGlzZWQgYnkg
S1ZNIFJJU0MtViBtdXN0IGFsc28gYmUKPiA+ID4gPiB1cGdyYWRlZCB0byB2Mi4wLgo+ID4gPiA+
Cj4gPiA+ID4gUmVnYXJkaW5nIHdobyBjaGVja3MgaXRzLCB0aGUgU0JJIGNsaWVudCBkcml2ZXJz
IGluIHRoZSBMaW51eCBrZXJuZWwKPiA+ID4gPiB3aWxsIGNoZWNrIFNCSSBzcGVjaWZpY2F0aW9u
IHZlcnNpb24gaW1wbGVtZW50ZWQgYnkgaGlnaGVyIHByaXZpbGVnZQo+ID4gPiA+IG1vZGUgKE0t
bW9kZSBmaXJtd2FyZSBvciBIUy1tb2RlIGh5cGVydmlzb3IpIGJlZm9yZSBwcm9iaW5nCj4gPiA+
ID4gdGhlIFNCSSBleHRlbnNpb24uIEZvciBleGFtcGxlLCB0aGUgSFZDIFNCSSBkcml2ZXIgKFBB
VENINSkKPiA+ID4gPiB3aWxsIGVuc3VyZSBTQkkgc3BlYyB2ZXJzaW9uIHRvIGJlIGF0IGxlYXN0
IHYyLjAgYmVmb3JlIHByb2JpbmcKPiA+ID4gPiBTQkkgZGVidWcgY29uc29sZSBleHRlbnNpb24u
Cj4gPiA+Cj4gPiA+IElzIHRoaXMgYXBpIGJhY2t3YXJkcyBjb21wYXRpYmxlLCBvciBkaWQgeW91
IGp1c3QgYnJlYWsgZXhpc3RpbmcKPiA+ID4gdXNlcnNwYWNlIHRoYXQgb25seSBleHBlY3RzIHZl
cnNpb24gMS4wPwo+ID4KPiA+IFRoZSBsZWdhY3kgc2JpX2NvbnNvbGVfcHV0Y2hhcigpIGFuZCBz
YmlfY29uc29sZV9nZXRjaGFyKCkKPiA+IGZ1bmN0aW9ucyBoYXZlIG5vdCBjaGFuZ2VkIHNvIGl0
IGRvZXMgbm90IGJyZWFrIGV4aXN0aW5nCj4gPiB1c2VyLXNwYWNlLgo+ID4KPiA+IFRoZSBuZXcg
U0JJIERCQ04gZnVuY3Rpb25zIHRvIGJlIGltcGxlbWVudGVkIGJ5IEtWTQo+ID4gdXNlciBzcGFj
ZSBhcmU6Cj4gPiBzYmlfZGVidWdfY29uc29sZV93cml0ZSgpCj4gPiBzYmlfZGVidWdfY29uc29s
ZV9yZWFkKCkKPiA+IHNiaV9kZWJ1Z19jb25zb2xlX3dyaXRlX2J5dGUoKQo+Cj4gQW5kIHdoZXJl
IGV4YWN0bHkgaXMgdGhhdCBjb2RlIGZvciB1cyB0byByZXZpZXcgdGhhdCB0aGlzIGlzIHRlc3Rl
ZD8KClRoZSBLVk0gc2VsZnRlc3RzIGZvciBLVk0gUklTQy1WIGFyZSB1bmRlciBkZXZlbG9wbWVu
dC4gRXZlbnR1YWxseSwKd2Ugd2lsbCBoYXZlIGRlZGljYXRlZCBLVk0gc2VsZnRlc3RzIGZvciB0
aGUgU0JJIGV4dGVuc2lvbnMgaW1wbGVtZW50ZWQKYnkgS1ZNIFJJU0MtVi4KClVudGlsIHRoZW4g
d2UgaGF2ZSBLVk1UT09MIGltcGxlbWVudGF0aW9uIGZvciBTQkkgREJDTiwgd2hpY2ggaXMKYXZh
aWxhYmxlIGluIHJpc2N2X3NiaV9kYmNuX3YxIGJyYW5jaCBhdDoKaHR0cHM6Ly9naXRodWIuY29t
L2F2cGF0ZWwva3ZtdG9vbC5naXQKCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
