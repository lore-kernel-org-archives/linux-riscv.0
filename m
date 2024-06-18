Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF7EC2BB85
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 03:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnktQbNBHisbc1WiJ9gaLtYCNAqL+U9Ljaqec6Wr3XE=; b=x4lKzFk84nkjgZ
	xETAXj1tz2TfrlXMXReD1So8oiwtSayN7EM7126wi1oGITiM/IrcwNolQMyT2xm2WGt/iy0Li4SPI
	9vzpTNU3bftQImdSWp2Kdt1v3/9DHE/uL/2pmbH62BUyeuRpmMHnR69Nt4CqmA+DETmSPhISZG6eD
	UA7LpERnEbIyLA9D4hCRW7tKyufV8l6ApsFeY6iIJaknkT6Y6BqTFTCsDCo7pH9NWoArVG5TQ+zzw
	MylNOTNP0lMY3PATB9vNFKwMmP8BBxP13WonrexQU4SJlV5DoNPGDFHaskraWloS3VRCwU0HrP8Wa
	ZFvKQn/Z8bk0DeROR3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJP6n-0000000DNE6-2Ddn;
	Tue, 18 Jun 2024 03:02:09 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJP6h-0000000DN81-0kAH
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 03:02:05 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7eb895539e3so210363039f.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718679720; x=1719284520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voa0fe3SjpggwiHBh/MwhciBY6+FADQBkwBOF/PUA44=;
        b=Ue1PxY3UijZPj4Y7igmNDf3j9aejel838USl5+oXYupR7382vI9P77pyv6B0Y4mUB8
         9ilxp1+8d+vlAWq4teRkRoPvuJeaRJ2jcmeA6HEyN3pdEMH10Jt9yCR+SwgdSjKgFkTU
         b6Vk/Qix68yNf32vkSb+9ArlzAFOhBCQ+NUy1ERiSWzH0J+Bd9ocYLfGeQbCA06KNTJR
         BlmmDwVt0DaRK53htdGuAiodLA2hJtOUDdioccbvm0z0QsREgSZ5doWOXhT15rdZK/mp
         uv044uimdiCIHl8BV7S5SN17ej4rA24YcRK6aDIax5ni87OKnmyp6/vuBILiMRD1QHco
         zxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718679720; x=1719284520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voa0fe3SjpggwiHBh/MwhciBY6+FADQBkwBOF/PUA44=;
        b=oCyOYKpwMsVMCFY6yZCT6okYYCEWl+dZGwKtJ4jJZVBkgHWFDbT7l0tGKe6Vus51t9
         3+OQsaRcUrZuIgPF3PVPkUL7fq+Y5Wsu+zEv5UKYkl1x8uukH+A3gCXmcgwUE996hzF4
         dCHy6rFMPKeFck6nRFNRjRm6kgDEWRtcDfs2tbLTb+3irVSjslQaH/ePYBixOkd40z5t
         Zm2Og/pwghfHpBEyJDUAReTmd5ZOnM1EhHUzUft7yOwHyY69qkXO8atKjCEt1HiXTa3U
         ShV+JUFeOSfWWY/F/nmnYXigWbiK9IvhUS+H4GMSeEqa+oBrrOx4IOlk6/EYR/CF+aBX
         4CkA==
X-Forwarded-Encrypted: i=1; AJvYcCVCBITF6BAv0IECsXEpLf3rKr0DD77/FDWGwXW2hel5JJZxEgW4D6uUrxST4A/85TRxoaoy/kM5L1Y4mRJuXwe8btaUPwK8RpI8hb0ql6RY
X-Gm-Message-State: AOJu0Yxb714g/uuMFIqyNKuDGCG+kwSUh6Y/1k+JJb84deen00xEjs20
	S/mbGUGAWFEy3ieyzefmyqv51vrP43L6PrXGVUWKRm2FWVCTPCkXqy0Hsir3pnAW37xFhMCQRCU
	LVoqoR97SMEnsJ4Be6Nq4jKp/FeAFgIN1glYBvg==
X-Google-Smtp-Source: AGHT+IHWhSE+k8nI3ATV790kVcdaJx+X2XhzCDCnnNK4GDf4nHYtKrtEPv0N7J1xr51nXArplHNL9b+pWM9XSl88A3Y=
X-Received: by 2002:a05:6602:3f8a:b0:7eb:b93d:4101 with SMTP id
 ca18e2360f4ac-7ebeb4c0558mr1289632439f.9.1718679719882; Mon, 17 Jun 2024
 20:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-5-zong.li@sifive.com>
 <a1a99374-dc40-4d57-9773-e660dc33beb2@linux.intel.com> <CANXhq0pQuoriKfHF51fXUtrZLkJBNOCe6M8Z6JbDjoRvbe1nWg@mail.gmail.com>
 <20240617143920.GD791043@ziepe.ca>
In-Reply-To: <20240617143920.GD791043@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 18 Jun 2024 11:01:48 +0800
Message-ID: <CANXhq0pXYoeiVMFSGAijo-QHTVoZyM8M_uU4HWsbCwDg2oFPYg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/10] iommu/riscv: add iotlb_sync_map operation support
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_200203_381137_E9189489 
X-CRM114-Status: GOOD (  18.54  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMTA6MznigK9QTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAwOTo0MzozNVBNICsw
ODAwLCBab25nIExpIHdyb3RlOgo+Cj4gPiBJIGFkZGVkIGl0IGZvciB1cGRhdGluZyB0aGUgTVNJ
IG1hcHBpbmcgd2hlbiB3ZSBjaGFuZ2UgdGhlIGlycQo+ID4gYWZmaW5pdHkgb2YgYSBwYXNzLXRo
cm91Z2ggZGV2aWNlIHRvIGFub3RoZXIgdkNQVS4gVGhlIFJJU0MtViBJT01NVQo+ID4gc3BlYyBh
bGxvd3MgTVNJIHRyYW5zbGF0aW9uIHRvIGdvIHRocm91Z2ggdGhlIE1TSSBmbGF0IHRhYmxlLCBN
UklGLCBvcgo+ID4gdGhlIG5vcm1hbCBwYWdlIHRhYmxlLiBJbiB0aGUgY2FzZSBvZiB0aGUgbm9y
bWFsIHBhZ2UgdGFibGUsIHRoZSBNU0kKPiA+IG1hcHBpbmcgaXMgY3JlYXRlZCBpbiB0aGUgc2Vj
b25kLXN0YWdlIHBhZ2UgdGFibGUsIG1hcHBpbmcgdGhlIEdQQSBvZgo+ID4gdGhlIGd1ZXN0J3Mg
c3VwZXJ2aXNvciBpbnRlcnJ1cHQgZmlsZSB0byB0aGUgSFBBIG9mIGhvc3QncyBndWVzdAo+ID4g
aW50ZXJydXB0IGZpbGUuIFRoaXMgTVNJIG1hcHBpbmcgbmVlZHMgdG8gYmUgdXBkYXRlZCB3aGVu
IHRoZSBIUEEgb2YKPiA+IGhvc3QncyBndWVzdCBpbnRlcnJ1cHQgZmlsZSBpcyBjaGFuZ2VkLgo+
Cj4gSXQgc291bmRzIGxpa2UgbW9yZSB0aG91Z2h0IGlzIG5lZWRlZCBmb3IgdGhlIE1TSSBhcmNo
aXRlY3R1cmUsIGhhdmluZwo+IHRoZSBob3N0IHJlYWQgdGhlIGd1ZXN0IHBhZ2UgdGFibGUgdG8g
bWlycm9yIHdlaXJkIE1TSSBzdHVmZiBzZWVtcwo+IGtpbmQgb2Ygd3JvbmcuLgo+CgpQZXJoYXBz
IEkgc2hvdWxkIHJlcGhyYXNlIGl0LiBIb3N0IGRvZXNuJ3QgcmVhZCB0aGUgZ3Vlc3QgcGFnZSB0
YWJsZS4KSW4gYSBSSVNDLVYgc3lzdGVtLCBNU0lzIGFyZSBkaXJlY3RlZCB0byBhIHNwZWNpZmlj
IHByaXZpbGVnZSBsZXZlbCBvZgphIHNwZWNpZmljIGhhcnQsIGluY2x1ZGluZyBhIHNwZWNpZmlj
IHZpcnR1YWwgaGFydC4gSW4gYSBoYXJ0J3MgSU1TSUMKKEluY29taW5nIE1TSSBDb250cm9sbGVy
KSwgaXQgY29udGFpbnMgc29tZSAnaW50ZXJydXB0IGZpbGVzJyBmb3IKdGhlc2Ugc3BlY2lmaWMg
cHJpdmlsZWdlIGxldmVsIGhhcnRzLiBGb3IgaW5zdGFuY2UsIGlmIHRoZSB0YXJnZXQKYWRkcmVz
cyBvZiBNU0kgaXMgdGhlIGFkZHJlc3Mgb2YgdGhlIGludGVycnVwdCBmaWxlIHdoaWNoIGlzIGZv
ciBhCnNwZWNpZmljIHN1cGVydmlzb3IgbGV2ZWwgaGFydCwgdGhlbiB0aGF0IGhhcnQncyBzdXBl
cnZpc29yIG1vZGUgd2lsbApyZWNlaXZlIHRoaXMgTVNJLiBGdXJ0aGVybW9yZSwgd2hlbiBhIGhh
cnQgaW1wbGVtZW50cyB0aGUgaHlwZXJ2aXNvcgpleHRlbnNpb24sIGl0cyBJTVNJQyB3aWxsIGhh
dmUgaW50ZXJydXB0IGZpbGVzIGZvciB2aXJ0dWFsIGhhcnRzLApjYWxsZWQgJ2d1ZXN0IGludGVy
cnVwdCBmaWxlcycuCldlIHdpbGwgY3JlYXRlIHRoZSBNU0kgbWFwcGluZyBpbiBTMiBwYWdlIHRh
YmxlIGF0IGJvb3QgdGltZSBmaXJzdGx5LAp0aGUgbWFwcGluZyB3b3VsZCBiZSBHUEEgb2YgdGhl
IGludGVycnVwdCBmaWxlIGZvciBzdXBlcnZpc29yIGxldmVsCihpbiBndWVzdCB2aWV3LCBpdCB0
aGlua3MgaXQgdXNlIGEgc3VwZXJ2aXNvciBsZXZlbCBpbnRlcnJ1cHQgZmlsZSkgdG8KSFBBIG9m
IHRoZSAnZ3Vlc3QgaW50ZXJydXB0IGZpbGUnIChpbiBob3N0IHZpZXcsIHRoZSBkZXZpY2Ugc2hv
dWxkCmFjdHVhbGx5IHVzZSBhIGd1ZXN0IGludGVycnVwdCBmaWxlKS4gV2hlbiB0aGUgdkNQVSBp
cyBtaWdyYXRlZCB0bwphbm90aGVyIHBoeXNpY2FsIGhhcnQsIHRoZSAnZ3Vlc3QgaW50ZXJydXB0
IGZpbGVzJyBzaG91bGQgYmUgc3dpdGNoZWQKdG8gYW5vdGhlciBwaHlzaWNhbCBoYXJ0J3MgSU1T
SUMncyAnZ3Vlc3QgaW50ZXJydXB0IGZpbGUnLCBpdCBtZWFucwp0aGF0IHRoZSBIUEEgb2YgdGhp
cyBNU0kgbWFwcGluZyBpbiBTMiBwYWdlIHRhYmxlIG5lZWRzIHRvIGJlIHVwZGF0ZWQuCgo+IFRo
ZSBTMiByZWFsbHkgbmVlZHMgdG8gaGF2ZSB0aGUgY29ycmVjdCBwaHlzaWNhbCBNU0kgcGFnZXMg
c3RhdGljYWxseQo+IGF0IGJvb3QgdGltZS4KPgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
