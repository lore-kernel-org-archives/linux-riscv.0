Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AEFCD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 19:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qs2c+fMq7YL/9QH6E7ubYmuoeKiMl1F9V9vRDM8zF8=; b=l3P8p7a1jlZ0VK
	G8x+cLAfU4pWem+pyPeDwQ2omw8oLj8f50qL0NMIVDfkdsK8RSfxFtsK5FK1FeivkZDe2JNvlI+Mc
	E34HSQZjqWl8n39BvTbSJ6jgdOe+PrViuFjGEx85GiIHU9DO65afM8mdpLvbsftGJBx+VDBSMs/Ho
	p5ukcMn8Mf8KV/lnC45Kf9vFBFkMCuqhoUizs/o6T1Uuevkw4D89e9cjNmG+cbpJdds1LF8KXYc5d
	uVH53o+hC1WD3AlAXhZyZarpNuF/4o0uxqGkVFFbK1XefpAVEWR4wkF3xdn7o68XdjcGoJrttMwE2
	aK60/1Ei8mKOUI5J8PBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFDg-00000003Zp5-1roy;
	Wed, 13 May 2026 19:26:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFDf-00000003Zou-1LTh
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 19:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADE2F60129
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 19:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6587FC2BCC7
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778700370;
	bh=jkUkWktFpdEdF2Lcj4EAj+e+wcRxBaXPi67I/QnY5NQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cYGlfSj2/CHzKzyv9me2Zk/HspGP9sjtk4Engs8yoqb2zW9iTZpuRoru+aQDg8KcV
	 CEivNN1d8In9wMQitua9OBf7lWz7JGVU2BXwSMqwhsjDrgaw9VroxtmQhiVPWihWfx
	 IozQQUTd3LoCBCP9tlsnzBJWhc5SrgtBEEXIps7vxbey6TVUvgg6W3P+IunX3Lt6kL
	 5lsFlql/jIyJ5Mi8TcUHdEoBcdsJliEGZoacbbNpWwvqBquVFzVBija05KoWnslRv4
	 O3QXNx5fZDPvRLLqI9Tk+1kTQPbvK1d4jjK7Kkbz9sEpPCHoijuPNVMzLhU0VhCnqs
	 sPx4/a+0DCMDA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393ba0616aaso78851781fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 12:26:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YyP6lD2ol2EFPI6FbnpdSYz6anNDDwitA1CoAt2T3AHHgYW2WuR
	d8gqumH4A4sdwA/LLx1rlwvrp7iaTipXODzQJmb37tBPvPXFZN9PsU+yaFFCp+dWHczjwg+mVq9
	8UwograuNlwxDDjBqYfVF6/JcdoBaCnQ=
X-Received: by 2002:a05:6512:684:b0:5a3:cc81:eff3 with SMTP id
 2adb3069b0e04-5a8ef97ca57mr1632659e87.26.1778700368753; Wed, 13 May 2026
 12:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com> <20260513084325.2176952-4-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260513084325.2176952-4-himanshu.chauhan@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 13 May 2026 21:25:56 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g2kjfAvcTzp8898A8HdMymU1SQ-rHW_DFhZP49c9=s5Q@mail.gmail.com>
X-Gm-Features: AVHnY4I62r5FzdLCp8o0gBy8GA7EdJU8GhHm1Xiv_xt-CcqS2_Q5U7R1FjYttsM
Message-ID: <CAJZ5v0g2kjfAvcTzp8898A8HdMymU1SQ-rHW_DFhZP49c9=s5Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] acpi: Introduce SSE in HEST notification types
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	lenb@kernel.org, james.morse@arm.com, tony.luck@intel.com, ardb@kernel.org, 
	conor@kernel.org, cleger@rivosinc.com, robert.moore@intel.com, 
	sunilvl@oss.qualcomm.com, anup.patel@oss.qualcomm.com
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTA6NDTigK9BTSBIaW1hbnNodSBDaGF1aGFuCjxoaW1h
bnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSW50cm9kdWNlIGEgbmV3
IEhFU1Qgbm90aWZpY2F0aW9uIHR5cGUgZm9yIFJJU0MtViBTU0UgZXZlbnRzLgo+IFRoZSBHSEVT
IGVudHJ5J3Mgbm90aWZpY2F0aW9uIHN0cnVjdHVyZSBjb250YWlucyB0aGUgbm90aWZpY2F0aW9u
Cj4gdG8gYmUgdXNlZCBmb3IgYSBnaXZlbiBlcnJvciBzb3VyY2UuIEZvciBlcnJvciBzb3VyY2Vz
IGRlbGl2ZXJpbmcKPiBldmVudHMgb3ZlciBTU0UsIGl0IHNob3VsZCBjb250YWluIHRoZSBuZXcg
U1NFIG5vdGlmaWNhdGlvbiB0eXBlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hhdWhh
biA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0uY29tPgo+IFJldmlld2VkLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvYWNwaS9h
Y3RibDEuaCB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FjcGkvYWN0YmwxLmggYi9pbmNsdWRl
L2FjcGkvYWN0YmwxLmgKPiBpbmRleCBmNzJlMDA1MTdlYjMuLjJhODE2Nzk3OTQ1OCAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2FjcGkvYWN0YmwxLmgKPiArKysgYi9pbmNsdWRlL2FjcGkvYWN0Ymwx
LmgKClRoaXMgaXMgYW4gQUNQSUNBIGNoYW5nZSwgc28gaXQgc2hvdWxkIGdvIHRocm91Z2ggdGhl
IHVwc3RyZWFtIEFDUElDQQpwcm9qZWN0IG9uIEdpdEh1Yi4gIFNlZQoKRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL2FjcGkvbGludXhpemVkLWFjcGljYS5yc3QKCmZvciBtb3JlIGluZm9ybWF0aW9u
LgoKSWYgdGhlcmUgaXMgYWxyZWFkeSBhbiB1cHN0cmVhbSBBQ1BJQ0EgY29tbWl0IG1ha2luZyB0
aGlzIGNoYW5nZSwKcGxlYXNlIGFkZCBhIExpbms6IHRhZyBwb2ludGluZyB0byB0aGF0IGNvbW1p
dCB0byB0aGUgJHN1YmplY3QgcGF0Y2guCgo+IEBAIC0xNzk4LDcgKzE3OTgsOCBAQCBlbnVtIGFj
cGlfaGVzdF9ub3RpZnlfdHlwZXMgewo+ICAgICAgICAgQUNQSV9IRVNUX05PVElGWV9TRUkgPSA5
LCAgICAgICAvKiBBQ1BJIDYuMSAqLwo+ICAgICAgICAgQUNQSV9IRVNUX05PVElGWV9HU0lWID0g
MTAsICAgICAvKiBBQ1BJIDYuMSAqLwo+ICAgICAgICAgQUNQSV9IRVNUX05PVElGWV9TT0ZUV0FS
RV9ERUxFR0FURUQgPSAxMSwgICAgICAgLyogQUNQSSA2LjIgKi8KPiAtICAgICAgIEFDUElfSEVT
VF9OT1RJRllfUkVTRVJWRUQgPSAxMiAgLyogMTIgYW5kIGdyZWF0ZXIgYXJlIHJlc2VydmVkICov
Cj4gKyAgICAgICBBQ1BJX0hFU1RfTk9USUZZX1NTRSA9IDEyLCAvKiBSSVNDViBTU0UgKi8KPiAr
ICAgICAgIEFDUElfSEVTVF9OT1RJRllfUkVTRVJWRUQgPSAxMyAgLyogMTMgYW5kIGdyZWF0ZXIg
YXJlIHJlc2VydmVkICovCj4gIH07Cj4KPiAgLyogVmFsdWVzIGZvciBjb25maWdfd3JpdGVfZW5h
YmxlIGJpdGZpZWxkIGFib3ZlICovCj4gLS0KPiAyLjQzLjAKPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
