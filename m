Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45E6C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2LYNDmXKlorjVLzEgifEKYFLXF+zChxbc2KDzwiqZ0=; b=WNFEcuNjocJc3a
	UXvHikZuXww5kMEnKQFoNoe2MXq5D1tvnVuN0EQDp9NIdIRw4PlX7Yngc3ZjWChDMxVZmtzfq8NCF
	MUpDYikVaY8pR9WSL8zsWo+hI+MQgwWSlOGBRofpf4lQz3wVWH9qs8Rf4Smu9y9SjtIKj2sQGYess
	95HWwdC/47FFLM0ZDY5/BMwB7k16itDQek1/3XOWhDM+xOg6IK4FYwcdGg+msSQtuADEYIBnki5rF
	CCk+jykfSGzn1NotT68An71PwDXapSc2Hhpt5Lt2XO4lJNuZhM6EFsMwb6xs97l8ijoFA2wcyd/v7
	uXGUzB50ZOcJoFXBwcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJYvs-0000000F96L-2axZ;
	Tue, 18 Jun 2024 13:31:32 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJYvq-0000000F955-0jrS
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 13:31:31 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-795ca45c54cso298557285a.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718717489; x=1719322289; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zxeD/weYzFfAE7AIrut1f14B+OgFZqypLF8nlCdzLh0=;
        b=mO7m+FG9VSbiuTbxAmERHBvGWH0rsXd9ocIDK135iC+BLDLrbwjPJADBy9qKOX9J62
         376xA3oi2d9vbxFNrzeuSpQ2f3EAPQ4X06CAPgzES6+NddGgbPduAfbrO5EFi+cXF4Cx
         yH9M5X22uKFtMQpPQPUT0UmNOthY1dN5ifNR7jM7yd67XCoOJvPzTEAXWohllCl+NLWG
         iZCDFkptcnydEHspVRvvvwkEW/iYAD440TY+WDEQP4e67XY6BfxhJoGzd6ySPPcLvX87
         z3P3XtoFfbbuBUl5a1Hci2d0Kl91QV0wgPq4eOSaukRrP2jHNB1vht5aSfIBPAh//6MO
         ThMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717489; x=1719322289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxeD/weYzFfAE7AIrut1f14B+OgFZqypLF8nlCdzLh0=;
        b=U7yUuh2a2RHnDG/UOUrtePAzuBXHWOngyw+ZJuWG6bedqtFtr53jaVVYo9ZRqu8Khn
         TO8GGJoir5ROFrGUhv3ojFsgaAmoejCxh4zYF68NKpKsMAEHuOzWm7y1OM3nF60SEvpN
         sIW9bBu9y75OnwZXeKHCxgr28561RwfM+F5Mt/MKkuR4HY9WsA0hQFWd8tqxOlIJpeGs
         SvBGt3jiaNEgyWScakBjLDqdUj85dWuWTnl/dLsFFq/gn5zAkoOPoHKWAdAKKe+cfNxe
         RTx4JRkotbNDoPN5jUfPxJG3zSktrMsUjTQ3zYd0q4aE/dif11qnxSbIlpZzpTkYoGfQ
         VRkw==
X-Forwarded-Encrypted: i=1; AJvYcCVvfRPIKA72N6ktte9YvdBanjpRbMf/Q8S7UBfntAPqo/Ypwnm3lfhgcielCzKjpg98m+Kdx0FdNih7jyPFUTHcWKPAvUSiQHaUhflSADu6
X-Gm-Message-State: AOJu0Yxgv2zgd2GUyHYuOWA0d02r1C66Rpv80fyhZ3yHQF2ceMx9e+0g
	Rvpn8RiDYdqVtuhBM8hsFxkeUXY0o6cIRO6ZbFu3KGBIXo1P+jAN+o31p2KsBoo=
X-Google-Smtp-Source: AGHT+IEs9n+MhMG27TFEqE4fA0oA04u7oEqN1xSdYw62o33s+eARYgUVYcJ5Gs18tHiwwZoqi9PyIg==
X-Received: by 2002:a05:620a:29d4:b0:795:6092:154c with SMTP id af79cd13be357-798d2588fe4mr1433106985a.62.1718717488760;
        Tue, 18 Jun 2024 06:31:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798ab4c16acsm516821385a.59.2024.06.18.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:31:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJYvn-00FB4h-Kt;
	Tue, 18 Jun 2024 10:31:27 -0300
Date: Tue, 18 Jun 2024 10:31:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, tjeznach@rivosinc.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	kevin.tian@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 04/10] iommu/riscv: add iotlb_sync_map operation
 support
Message-ID: <20240618133127.GF791043@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-5-zong.li@sifive.com>
 <a1a99374-dc40-4d57-9773-e660dc33beb2@linux.intel.com>
 <CANXhq0pQuoriKfHF51fXUtrZLkJBNOCe6M8Z6JbDjoRvbe1nWg@mail.gmail.com>
 <20240617143920.GD791043@ziepe.ca>
 <CANXhq0pXYoeiVMFSGAijo-QHTVoZyM8M_uU4HWsbCwDg2oFPYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0pXYoeiVMFSGAijo-QHTVoZyM8M_uU4HWsbCwDg2oFPYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_063130_357287_D812C8D8 
X-CRM114-Status: GOOD (  25.07  )
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

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgMTE6MDE6NDhBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
PiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAxMDozOeKAr1BNIEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAwOTo0Mzoz
NVBNICswODAwLCBab25nIExpIHdyb3RlOgo+ID4KPiA+ID4gSSBhZGRlZCBpdCBmb3IgdXBkYXRp
bmcgdGhlIE1TSSBtYXBwaW5nIHdoZW4gd2UgY2hhbmdlIHRoZSBpcnEKPiA+ID4gYWZmaW5pdHkg
b2YgYSBwYXNzLXRocm91Z2ggZGV2aWNlIHRvIGFub3RoZXIgdkNQVS4gVGhlIFJJU0MtViBJT01N
VQo+ID4gPiBzcGVjIGFsbG93cyBNU0kgdHJhbnNsYXRpb24gdG8gZ28gdGhyb3VnaCB0aGUgTVNJ
IGZsYXQgdGFibGUsIE1SSUYsIG9yCj4gPiA+IHRoZSBub3JtYWwgcGFnZSB0YWJsZS4gSW4gdGhl
IGNhc2Ugb2YgdGhlIG5vcm1hbCBwYWdlIHRhYmxlLCB0aGUgTVNJCj4gPiA+IG1hcHBpbmcgaXMg
Y3JlYXRlZCBpbiB0aGUgc2Vjb25kLXN0YWdlIHBhZ2UgdGFibGUsIG1hcHBpbmcgdGhlIEdQQSBv
Zgo+ID4gPiB0aGUgZ3Vlc3QncyBzdXBlcnZpc29yIGludGVycnVwdCBmaWxlIHRvIHRoZSBIUEEg
b2YgaG9zdCdzIGd1ZXN0Cj4gPiA+IGludGVycnVwdCBmaWxlLiBUaGlzIE1TSSBtYXBwaW5nIG5l
ZWRzIHRvIGJlIHVwZGF0ZWQgd2hlbiB0aGUgSFBBIG9mCj4gPiA+IGhvc3QncyBndWVzdCBpbnRl
cnJ1cHQgZmlsZSBpcyBjaGFuZ2VkLgo+ID4KPiA+IEl0IHNvdW5kcyBsaWtlIG1vcmUgdGhvdWdo
dCBpcyBuZWVkZWQgZm9yIHRoZSBNU0kgYXJjaGl0ZWN0dXJlLCBoYXZpbmcKPiA+IHRoZSBob3N0
IHJlYWQgdGhlIGd1ZXN0IHBhZ2UgdGFibGUgdG8gbWlycm9yIHdlaXJkIE1TSSBzdHVmZiBzZWVt
cwo+ID4ga2luZCBvZiB3cm9uZy4uCj4gCj4gUGVyaGFwcyBJIHNob3VsZCByZXBocmFzZSBpdC4g
SG9zdCBkb2Vzbid0IHJlYWQgdGhlIGd1ZXN0IHBhZ2UgdGFibGUuCj4gSW4gYSBSSVNDLVYgc3lz
dGVtLCBNU0lzIGFyZSBkaXJlY3RlZCB0byBhIHNwZWNpZmljIHByaXZpbGVnZSBsZXZlbCBvZgo+
IGEgc3BlY2lmaWMgaGFydCwgaW5jbHVkaW5nIGEgc3BlY2lmaWMgdmlydHVhbCBoYXJ0LiBJbiBh
IGhhcnQncyBJTVNJQwo+IChJbmNvbWluZyBNU0kgQ29udHJvbGxlciksIGl0IGNvbnRhaW5zIHNv
bWUgJ2ludGVycnVwdCBmaWxlcycgZm9yCj4gdGhlc2Ugc3BlY2lmaWMgcHJpdmlsZWdlIGxldmVs
IGhhcnRzLiBGb3IgaW5zdGFuY2UsIGlmIHRoZSB0YXJnZXQKPiBhZGRyZXNzIG9mIE1TSSBpcyB0
aGUgYWRkcmVzcyBvZiB0aGUgaW50ZXJydXB0IGZpbGUgd2hpY2ggaXMgZm9yIGEKPiBzcGVjaWZp
YyBzdXBlcnZpc29yIGxldmVsIGhhcnQsIHRoZW4gdGhhdCBoYXJ0J3Mgc3VwZXJ2aXNvciBtb2Rl
IHdpbGwKPiByZWNlaXZlIHRoaXMgTVNJLiBGdXJ0aGVybW9yZSwgd2hlbiBhIGhhcnQgaW1wbGVt
ZW50cyB0aGUgaHlwZXJ2aXNvcgo+IGV4dGVuc2lvbiwgaXRzIElNU0lDIHdpbGwgaGF2ZSBpbnRl
cnJ1cHQgZmlsZXMgZm9yIHZpcnR1YWwgaGFydHMsCj4gY2FsbGVkICdndWVzdCBpbnRlcnJ1cHQg
ZmlsZXMnLgo+IFdlIHdpbGwgY3JlYXRlIHRoZSBNU0kgbWFwcGluZyBpbiBTMiBwYWdlIHRhYmxl
IGF0IGJvb3QgdGltZSBmaXJzdGx5LAo+IHRoZSBtYXBwaW5nIHdvdWxkIGJlIEdQQSBvZiB0aGUg
aW50ZXJydXB0IGZpbGUgZm9yIHN1cGVydmlzb3IgbGV2ZWwKPiAoaW4gZ3Vlc3QgdmlldywgaXQg
dGhpbmtzIGl0IHVzZSBhIHN1cGVydmlzb3IgbGV2ZWwgaW50ZXJydXB0IGZpbGUpIHRvCj4gSFBB
IG9mIHRoZSAnZ3Vlc3QgaW50ZXJydXB0IGZpbGUnIChpbiBob3N0IHZpZXcsIHRoZSBkZXZpY2Ug
c2hvdWxkCj4gYWN0dWFsbHkgdXNlIGEgZ3Vlc3QgaW50ZXJydXB0IGZpbGUpLiBXaGVuIHRoZSB2
Q1BVIGlzIG1pZ3JhdGVkIHRvCj4gYW5vdGhlciBwaHlzaWNhbCBoYXJ0LCB0aGUgJ2d1ZXN0IGlu
dGVycnVwdCBmaWxlcycgc2hvdWxkIGJlIHN3aXRjaGVkCj4gdG8gYW5vdGhlciBwaHlzaWNhbCBo
YXJ0J3MgSU1TSUMncyAnZ3Vlc3QgaW50ZXJydXB0IGZpbGUnLCBpdCBtZWFucwo+IHRoYXQgdGhl
IEhQQSBvZiB0aGlzIE1TSSBtYXBwaW5nIGluIFMyIHBhZ2UgdGFibGUgbmVlZHMgdG8gYmUgdXBk
YXRlZC4KCkkgYW0gdmF1Z2VseSBhd2FyZSBvZiB0aGVzZSBkZXRhaWxzLCBidXQgaXQgaXMgZ29v
ZCB0byBoZWFyIHRoZW0gYWdhaW4uCgpIb3dldmVyLCBub25lIG9mIHRoYXQgcmVhbGx5IGV4cGxh
aW5zIHdoeSB0aGlzIGlzIG1lc3Npbmcgd2l0aAppbnZhbGlkYXRpb24gbG9naWMuLgoKSWYgeW91
IG5lZWQgdG8gcmVwbGFjZSBNU0kgcGFnZXMgaW4gdGhlIFMyIGF0b21pY2FseSBhcyB5b3UgbWln
cmF0ZQp2Q1BVcyB0aGVuIHlvdSBuZWVkIGEgcHJvcGVyIHJlcGxhY2Ugb3BlcmF0aW9uIGZvciB0
aGUgaW8gcGFnZSB0YWJsZS4KCm1hcCBpcyBzdXBwb3NlZCB0byBmYWlsIGlmIHRoZXJlIGFyZSBh
bHJlYWR5IG1hcHBpbmdzIGF0IHRoYXQgYWRkcmVzcywKeW91IGNhbid0IHVzZSBpdCB0byByZXBs
YWNlIGV4aXN0aW5nIG1hcHBpbmdzIHdpdGggc29tZXRoaW5nIGVsc2UuCgpKYXNvbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
