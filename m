Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136F8CEBF8C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnMrxXzT6AWtfQraqK+MqwuogJp50qYJZuE4tLa8DZU=; b=bPL00LgRldwpCz
	bp8mExdRupZlEndIVqOpHLJicmr/Zg00fLnxe8gnPAU5ZDdIBFDvZc+z0ilNcRkhG1mb6+2wbE0eN
	Ou/NbkTAYPX+IOi7+YhXHxUkKpjqBQrP2jyhVtBUwO3a33rBSCzmazt1YLmLGy7Yw1fVMwTnzHivP
	yLuUWb9Sa+EFkya/ioVDk0F8PHYk4PXXksOg7lwCcLhIYQ1f2Q+6H6A3WrnY7NmRhtKH1i+mmHJni
	2mScEXV7BtQV2vmQ9ISg+2jOmZIWffKVTjk7zrVrBWZfYTyYYV0RpjTkdw273OSp24BzI/J68RyLm
	3rsF09whdlYxM6EEm6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7DN-0000000Adpe-1CN8;
	Fri, 27 Sep 2024 09:24:41 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7C0-0000000AdZT-2ZuS
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 09:23:18 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c40942358eso3318627a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 02:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727428994; x=1728033794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nqf7J6uVRTMjV8Mkr5LkK+rt2+orKvSYQp47d/slH6I=;
        b=ZArS7zO6pkyNDl1toLa9Jh64RfYmVr460MaGD8+all/JKOvHqXNMgnNtD1kkZ0F0pG
         YQavf5uZoJpkO2mS0GiXjKvDFsLWVzEcmE6twAbVCDlVqkgV+BCXCm5m1ZhcY6aoJqTg
         ucqgif74Hqn5zljqr0itq18sUIOziRoEoankCByTY3xnpMmpObnDFceRozgbmJ5OOmQy
         mUNhopLLCRtpZW3JUDp4U/N0xre4udaD/psGAQJRsZCoVtIVWBC9cX/H9RQy4Jd7O2KJ
         9Nq3xCGyKyyxvsy9b78Q/OvQ4XSjtIH9/ZCrIKZaceowZmSUtdC6V89B+83M7sILY3Or
         aLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428994; x=1728033794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nqf7J6uVRTMjV8Mkr5LkK+rt2+orKvSYQp47d/slH6I=;
        b=tO93H+ZudI3ID4Wx9FjK2ptkC1UhnYUqdxrNh64UbrwueiqxlDyAZoTNq21jpMPmKE
         Jkcaairf+KmUYiu6c68y3y6DH4G5Cm28El+6MDvfwISHNnYRiJexLH3KgCC2hYEU9UXJ
         u7kTEqmTUtxIcULM1jkPOueXCEpufQ8+bhe9IOF02BBRokfgnXrMZlisqRBZ4zYlqZRg
         nHjSIfjpKDOYnZPnHYnRdA5XKTYGq+HSG4YgMO9oIXXqVt+ZhEn2lulbYLLB4Y6I+GQV
         gRvNBZZ7zRVD7D4WfnZZ9XiSyppVp0LmDQbEv9kIffhCNgn9fBX3QSsWr2K5XlGgg+Do
         AFMg==
X-Forwarded-Encrypted: i=1; AJvYcCUFXypYjir0lOSjhfCUAfdmZcXCH+E4XjWtEjC6c0WhFx5s9ZDOByllzsRIeqvdI5n5dvDz+FfjFPe7QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcYUW3Cl5SMhGJuxfEoYze3eQKDHNwqJopsgqKDI/HsMYTMhwl
	hmX++9cLL0po9Z6gExQExEEyjRrEX25QvtU5Q+/hn9h/TZ4V2G9PpbMUY4pAX8uCDU9+yBw1Ob1
	L+jA6nbbKAyJiH5PT0WGMKbhg7eQxbJFYIfpJVGFUu0fGlT/1MjA=
X-Google-Smtp-Source: AGHT+IFGU7PYEBeWJ9XyJiJyw2tA09AFezreXCXdZppeh4nf2YQMIVbOaLNTp72I5G5qbddr12Ia8AF3t2lz4EjKMB4=
X-Received: by 2002:a05:6402:230e:b0:5c3:cc1c:4d9c with SMTP id
 4fb4d7f45d1cf-5c8777eae4amr5673166a12.18.1727428993884; Fri, 27 Sep 2024
 02:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com> <20240921-shock-purge-d91482d191a1@spud>
In-Reply-To: <20240921-shock-purge-d91482d191a1@spud>
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 27 Sep 2024 17:23:02 +0800
Message-ID: <CAHibDyxcxe87mTLMkWZ9Ko3v7uyEbJd_BP7GSTpZFFO1nfmn0A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_022316_695111_0333DA3B 
X-CRM114-Status: GOOD (  19.57  )
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

VGhhbmtzLCBDb25vciwKSSB3aWxsIG1vZGlmeSB0aGUgZm9ybWF0IGFuZCBzZW5kIGl0IGFzIFJG
QyB2Mi4KClNpbmNlIHRoZSBTdnVrdGUgZXh0ZW5zaW9uIGlzIHN0aWxsIGluIHRoZSByZXZpZXcg
c3RhZ2UsIEkgd2lsbCBwdXQKdGhlIGxhdGVzdCBjb21taXQgb2YgdGhlIFBSIGluIHRoZSByaXNj
di1pc2EtbWFudWFsIGFzIGFuIGluZGljYXRpb24sCk9uY2UgdGhlIFN2dWt0ZSBleHRlbnNpb24g
aXMgcmF0aWZpZWQsIEkgd2lsbCBtb2RpZnkgaXQgYW5kIHNlbmQgaXQgYXMKYSBmb3JtYWwgcGF0
Y2guCgpCZXN0LApNYXggSHN1CgoKCk9uIFN1biwgU2VwIDIyLCAyMDI0IGF0IDY6MDXigK9BTSBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjAs
IDIwMjQgYXQgMDM6Mzk6MDNQTSArMDgwMCwgTWF4IEhzdSB3cm90ZToKPiA+IEFkZCBhbiBlbnRy
eSBmb3IgdGhlIFN2dWt0ZSBleHRlbnNpb24gdG8gdGhlIHJpc2N2LGlzYS1leHRlbnNpb25zCj4g
PiBwcm9wZXJ0eS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXggSHN1IDxtYXguaHN1QHNp
Zml2ZS5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgNyArKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5kZXggYTA2ZGJjNmI0OTI4
OTU4NzA0ODU1Yzg5OTMyOTFiMDM2ZTNkMWE2My4uZGY5NmFlYTVlNTNhNzBiMGNiODkwNTMzMjQ2
NGE0MmEyNjRlNTZlNiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IEBAIC0xNzEsNiArMTcx
LDEzIEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgbWVtb3J5IHR5cGVzIGFzIHJhdGlm
aWVkIGluIHRoZSAyMDE5MTIxMyB2ZXJzaW9uIG9mIHRoZSBwcml2aWxlZ2VkCj4gPiAgICAgICAg
ICAgICAgSVNBIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gKyAgICAgICAgLSBjb25zdDogc3Z1a3Rl
Cj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFy
ZCBTdnVrdGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb25zIGZvciBtYWtpbmcgdXNlci1tb2Rl
Cj4gPiArICAgICAgICAgICAgYWNjZXNzZXMgdG8gc3VwZXJ2aXNvciBtZW1vcnkgcmFpc2UgcGFn
ZSBmYXVsdHMgaW4gY29uc3RhbnQgdGltZSwKPiA+ICsgICAgICAgICAgICBtaXRpZ2F0aW5nIGF0
dGFja3MgdGhhdCBhdHRlbXB0IHRvIGRpc2NvdmVyIHRoZSBzdXBlcnZpc29yCj4gPiArICAgICAg
ICAgICAgc29mdHdhcmUncyBhZGRyZXNzLXNwYWNlIGxheW91dCwgYXMgUFIjMTU2NCBvZiByaXNj
di1pc2EtbWFudWFsLgo+Cj4gSSdtIHN1cnByaXNlZCB0aGlzIGRvZXNuJ3QgZmFpbCBkdF9iaW5k
aW5nX2NoZWNrLCB3aXRoIHRoZSAjIGluIGl0LiBJJ2QKPiBsaWtlIHRvIHNlZSBhIGNvbW1pdCBo
YXNoIGhlcmUgdGhvdWdoLCBpbiB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlIG90aGVyCj4gZXh0ZW5z
aW9ucyB1c2luZyB0aGVtLgo+Cj4gPiArCj4gPiAgICAgICAgICAtIGNvbnN0OiB6YWNhcwo+ID4g
ICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gICAgICAgICAgICAgIFRoZSBaYWNhcyBleHRl
bnNpb24gZm9yIEF0b21pYyBDb21wYXJlLWFuZC1Td2FwIChDQVMpIGluc3RydWN0aW9ucwo+ID4K
PiA+IC0tCj4gPiAyLjQzLjIKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
