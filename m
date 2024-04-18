Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D933C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oJeb4P8sjWFhXvw7vK8LTjVuJ1l0E05neYb9Ye8ac8U=; b=zCofpPFq31V3zdI2baZmxnSIF/
	TgRDKGKWNlBmTcIvLBEMGo+AOcXmfwlZl9iqjtM/UDd+cAc3nDmaIPsSpskUVmWytjyTM6wOmsggY
	1Qb4HTjY7C7AOKJTYtO4Cn7SeoEUaDlWeU+SIQQ5e64dicr26MT8OiARgJvikNtneo231MKF0rXeA
	3YD1wxiKsOo2+DkFBDox1aVw+381nL+yYJd+d2z7akSvfwMMpEEhuV5EFbCdReGBRPjFQScm91WZE
	aQwcx5ijSWMbYWypNaUoesHO8C8KzIPxew33SeEG50GYD01oWMbt6iZknuZ0kXmlfvPrzUVYNVlJL
	U7Nv0V2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxZzC-00000003oa9-2jKw;
	Thu, 18 Apr 2024 22:12:06 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxZz6-00000003oYj-2ZCy
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 22:12:04 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5aa25e99414so977463eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 15:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1713478318; x=1714083118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJWNYLKtKkE3VgEEb7txo69kf/MROzgyItmd/8X/Bkw=;
        b=y0dZQXrEqzYZ/9x68QtVG0xiNX39/l2E6/pSgLTKqo+Lb2opJPfhDWhpGUh+1JouP1
         1VDGUQcLSOndPQcGoZSkwg6vGweHSs5MoEEV8SQg7hMH/Dzt6Px8Jq6OqmCb8/5er1rV
         6LsoVIH7f4S+A2vfWeNtWehQn40mRGs1MT5CSa3m2qVFZpzQLrGWwpEJJ0wFDZpYe5aS
         JJc1Kl+BLZm+qCFn4xfgCUpvpdwDG4P1AZwB70FRDd6RVUJM7ujTproT1+gMhU39wGaG
         wPvTWU15RJYvKuGU+1dLIq1x7JJFXq+Xer5F0UdNod8sre6vTijy3L8BEiht2mfg9arn
         iSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713478318; x=1714083118;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJWNYLKtKkE3VgEEb7txo69kf/MROzgyItmd/8X/Bkw=;
        b=JUvjO2YC33mUHy83yBdy1lQ4Sik6A49jn8LD9VCHRL7vI46fFbAFXVlw+q6dei5hoo
         Q51bbh7S+2p7ce/sfJOMfsuBDiN/Hz+yGdHFIq2ChYF7p3cyLZMVDpliAo46Bax7pxrH
         JUfBTBaoq5GSHKV/qAz+QO3oqNSbT126rtCv01gYmVF3P2Zr0Kkjd2czi+FrFErZ670Y
         2j+38vFBpHNCKWYVDymLFPBbjN6ZPR8bRmpA+byEpmgQ9tmj15+3b20L1sAae1HCwv/V
         K3KR1OvuF7AhEAm1zfbDLpnIZfY2fjxcP8kCfKIs73QalL8VSTW0z130lGn9NOobHaV7
         q3BA==
X-Forwarded-Encrypted: i=1; AJvYcCWHZLD/MfX6oogAjyuGQ9M7obtI2gpC8igE5Jsp5Y+O6C0Cxozn0DgNPpXszoZiCd48Ben0F0pRgYJapkpKmbIKbWNsBU/wF32XzjbI7NBg
X-Gm-Message-State: AOJu0YxomAlm38CJIbtUk1B5Im0DKNjvqiM5Tu/eAN1PIQL97GVWgyKG
	/KKxRbClqfhTw2/uQgDWL63eHCpG07yx0X9wPe3bjHzbt2gmcIIz+imdROT/S2g=
X-Google-Smtp-Source: AGHT+IH5Rrf98QC4gFatEepR9aZzJYc9ESCNODVH0HHIz4PIvza73yv3y89sBwp3q1CAuQ8k41fxxw==
X-Received: by 2002:a05:6870:d187:b0:232:ff53:44fe with SMTP id a7-20020a056870d18700b00232ff5344femr362648oac.38.1713478317422;
        Thu, 18 Apr 2024 15:11:57 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id q9-20020a63d609000000b005dc9439c56bsm1877624pgg.13.2024.04.18.15.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 15:11:56 -0700 (PDT)
Date: Thu, 18 Apr 2024 15:11:56 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Apr 2024 15:11:55 PDT (-0700)
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
In-Reply-To: <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
CC: ryan.roberts@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-911ba065-e6c8-4d42-978c-e47897bcb493@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151200_869584_B52C226D 
X-CRM114-Status: GOOD (  33.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwMSBNYXIgMjAyNCAwMzoyOToxOCBQU1QgKC0wODAwKSwgYWxleGdoaXRpQHJpdm9z
aW5jLmNvbSB3cm90ZToKPiBIaSBSeWFuLAo+Cj4gT24gRnJpLCBNYXIgMSwgMjAyNCBhdCAxMTo0
NeKAr0FNIFJ5YW4gUm9iZXJ0cyA8cnlhbi5yb2JlcnRzQGFybS5jb20+IHdyb3RlOgo+Pgo+PiBI
aSBBbGV4YW5kcmUsCj4+Cj4+IEkgY29uZmVzcyBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBwYXRj
aGVzIHlldCwgYnV0IHRoaXMgY292ZXIgbGV0dGVyIHJhaXNlcyBhCj4+IGZldyBxdWVzaW9ucyBm
b3IgbWUuIEknbGwgYWltIHRvIGxvb2sgYXQgdGhlIGFjdHVhbCBwYXRjaGVzIGluIGR1ZSBjb3Vy
c2UuCgpBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgppbiBj
YXNlIHNvbWVvbmUgd2FudHMgdG8gcGljayB0aGVtIHVwIHZpYSBhIGdlbmVyaWMgdHJlZS4gIEkn
bSBoYXBweSB0byAKdGFrZSB0aGVtIHZpYSB0aGUgUklTQy1WIHRyZWUgaWYgZm9sayB3YW50LCBu
byBydXNoIG9uIG15IGVuZCBJJ20ganVzdCAKc2NydWJiaW5nIHRocm91Z2ggb2xkIHN0dWZmLgoK
Pj4gT24gMDEvMDMvMjAyNCAwOToxNCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiA+IFRoaXMg
cGF0Y2hzZXQgaW50ZW5kcyB0byBtZXJnZSB0aGUgY29udGlndW91cyBwdGVzIGh1Z2V0bGJmcyBp
bXBsZW1lbnRhdGlvbgo+PiA+IG9mIGFybTY0IGFuZCByaXNjdi4KPj4gPgo+PiA+IEJvdGggYXJt
NjQgYW5kIHJpc2N2IHN1cHBvcnQgdGhlIHVzZSBvZiBjb250aWd1b3VzIHB0ZXMgdG8gbWFwIHBh
Z2VzIHRoYXQKPj4gPiBhcmUgbGFyZ2VyIHRoYW4gdGhlIGRlZmF1bHQgcGFnZSB0YWJsZSBzaXpl
LCByZXNwZWN0aXZlbHkgY2FsbGVkIGNvbnRwdGUKPj4gPiBhbmQgc3ZuYXBvdC4KPj4gPgo+PiA+
IFRoZSByaXNjdiBpbXBsZW1lbnRhdGlvbiBkaWZmZXJzIGZyb20gdGhlIGFybTY0J3MgaW4gdGhh
dCB0aGUgTFNCcyBvZiB0aGUKPj4gPiBwZm4gb2YgYSBzdm5hcG90IHB0ZSBhcmUgdXNlZCB0byBz
dG9yZSB0aGUgc2l6ZSBvZiB0aGUgbWFwcGluZywgYWxsb3dpbmcKPj4gPiBmb3IgZnV0dXJlIHNp
emVzIHRvIGJlIGFkZGVkIChmb3Igbm93IG9ubHkgNjRLQiBpcyBzdXBwb3J0ZWQpLiBUaGF0J3Mg
YW4KPj4gPiBpc3N1ZSBmb3IgdGhlIGNvcmUgbW0gY29kZSB3aGljaCBleHBlY3RzIHRvIGZpbmQg
dGhlICpyZWFsKiBwZm4gYSBwdGUgcG9pbnRzCj4+ID4gdG8uIFBhdGNoIDEgZml4ZXMgdGhhdCBi
eSBhbHdheXMgcmV0dXJuaW5nIHN2bmFwb3QgcHRlcyB3aXRoIHRoZSByZWFsIHBmbgo+PiA+IGFu
ZCByZXN0b3JlcyB0aGUgc2l6ZSBvZiB0aGUgbWFwcGluZyB3aGVuIGl0IGlzIHdyaXR0ZW4gdG8g
YSBwYWdlIHRhYmxlLgo+Pgo+PiBZZXMgdGhhdCBtYWtlcyBzZW5zZSB0byBtZS4gVGhlIGludGVu
dGlvbiBmb3IgbVRIUCAoIWh1Z2V0bGIpIGlzIHRvIGZ1bGx5Cj4+IGVuY2Fwc3VsYXRlIFBURXMg
YmVpbmQgc2V0X3B0ZXMoKSwgcHRlcF9nZXQoKSBhbmQgZnJpZW5kcywgc28gd2hhdCdzIGFjdHVh
bGx5Cj4+IHdyaXR0ZW4gdG8gdGhlIHBndGFibGUgaXMgYXJjaC1zcGVjaWZpYyBhbmQgd2VsbCBh
YnN0cmFjdGVkLgo+Pgo+PiA+Cj4+ID4gVGhlIGZvbGxvd2luZyBwYXRjaGVzIGFyZSBqdXN0IG1l
cmdlcyBvZiB0aGUgMiBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zCj4+ID4gdGhhdCBjdXJyZW50
bHkgZXhpc3QgaW4gYXJtNjQgYW5kIHJpc2N2IHdoaWNoIGFyZSB2ZXJ5IHNpbWlsYXIuIEl0IHBh
dmVzCj4+ID4gdGhlIHdheSB0byB0aGUgcmV1c2Ugb2YgdGhlIHJlY2VudCBjb250cHRlIFRIUCB3
b3JrIGJ5IFJ5YW4gWzFdIHRvIGF2b2lkCj4+ID4gcmVpbXBsZW1lbnRpbmcgdGhlIHNhbWUgaW4g
cmlzY3YuCj4+Cj4+IFlvdSBzZWVtIHRvIGJlIHRhbGtpbmcgYWJvdXQgYm90aCBodWdldGxiICh3
aGljaCB1c2VzIHRoZSAiaHVnZSIgcHRlIGhlbHBlcnMpCj4+IGFuZCBjb250cHRlIGZvciBUSFAg
KGkuZS4gbVRIUCwgd2hpY2ggdXNlcyB0aGUgcmVndWxhciBwdGUgaGVscGVycykuIFRoZXkgYXJl
Cj4+IHByZXR0eSBzZXBhcmF0ZSBpbiBteSBtaW5kLCBzbyBub3Qgc3VyZSB3aHkgeW91IHdvdWxk
IGJlIG1vZGlmeWluZyB0aGVtIGJvdGggaW4KPj4gdGhlIHNhbWUgc2VyaWVzPwo+Cj4gSSBkb24n
dCwgdGhpcyBwYXRjaHNldCBvbmx5IGRlYWxzIHdpdGggaHVnZXRsYiwgSSBqdXN0IG1lYW50IHRo
YXQgdGhpcwo+IHNlcmllcyB3YXMganVzdCB0aGUgYmVnaW5uaW5nIGFzIEknbSB3b3JraW5nIG9u
IG1vdmluZyB0aGUgY29udHB0ZSBmb3IKPiBUSFAgc3VwcG9ydCBpbiB0aGUgZ2VuZXJpYyBjb2Rl
IGZvciByaXNjdiB0byB1c2UuCj4KPiBTb3JyeSBteSB3b3JkaW5nIHdhcyBhbWJpZ3VvdXMgOikK
Pgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+Pgo+PiBUaGFua3MsCj4+IFJ5YW4KPj4KPj4gPgo+PiA+
IFRoaXMgcGF0Y2hzZXQgd2FzIHRlc3RlZCBieSBydW5uaW5nIHRoZSBsaWJodWdldGxiZnMgdGVz
dHN1aXRlIHdpdGggNjRLQgo+PiA+IGFuZCAyTUIgcGFnZXMgb24gYm90aCBhcmNoaXRlY3R1cmVz
IChvbiBhIDRLQiBiYXNlIHBhZ2Ugc2l6ZSBhcm02NCBrZXJuZWwpLgo+PiA+Cj4+ID4gWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyNDAyMTUxMDMyMDUuMjYw
NzAxNi0xLXJ5YW4ucm9iZXJ0c0Bhcm0uY29tLwo+PiA+Cj4+ID4gQWxleGFuZHJlIEdoaXRpICg5
KToKPj4gPiAgIHJpc2N2OiBSZXN0b3JlIHRoZSBwZm4gaW4gYSBOQVBPVCBwdGUgd2hlbiBtYW5p
cHVsYXRlZCBieSBjb3JlIG1tIGNvZGUKPj4gPiAgIHJpc2N2OiBTYWZlbHkgcmVtb3ZlIGh1Z2Vf
cHRlX29mZnNldCgpIHdoZW4gbWFuaXB1bGF0aW5nIE5BUE9UIHB0ZXMKPj4gPiAgIG1tOiBVc2Ug
Y29tbW9uIGh1Z2VfcHRlcF9nZXQoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPj4gPiAgIG1t
OiBVc2UgY29tbW9uIHNldF9odWdlX3B0ZV9hdCgpIGZ1bmN0aW9uIGZvciByaXNjdi9hcm02NAo+
PiA+ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVfY2xlYXIoKSBmdW5jdGlvbiBmb3IgcmlzY3Yv
YXJtNjQKPj4gPiAgIG1tOiBVc2UgY29tbW9uIGh1Z2VfcHRlcF9nZXRfYW5kX2NsZWFyKCkgZnVu
Y3Rpb24gZm9yIHJpc2N2L2FybTY0Cj4+ID4gICBtbTogVXNlIGNvbW1vbiBodWdlX3B0ZXBfc2V0
X2FjY2Vzc19mbGFncygpIGZ1bmN0aW9uIGZvciByaXNjdi9hcm02NAo+PiA+ICAgbW06IFVzZSBj
b21tb24gaHVnZV9wdGVwX3NldF93cnByb3RlY3QoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQK
Pj4gPiAgIG1tOiBVc2UgY29tbW9uIGh1Z2VfcHRlcF9jbGVhcl9mbHVzaCgpIGZ1bmN0aW9uIGZv
ciByaXNjdi9hcm02NAo+PiA+Cj4+ID4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgIHwgICAxICsKPj4gPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgfCAg
NTkgKysrKystCj4+ID4gIGFyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgIHwgMjkx
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwo+PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h1Z2V0
bGIuaCAgICB8ICAgMiArLQo+PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQu
aCB8ICAxMSArKwo+PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICB8IDEy
MCArKysrKysrKysrKy0KPj4gPiAgYXJjaC9yaXNjdi9tbS9odWdldGxicGFnZS5jICAgICAgICAg
fCAyMjcgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiA+ICBtbS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMyArCj4+ID4gIG1tL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKPj4gPiAgbW0vY29udHB0ZS5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAyNjggKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiA+ICAxMSBmaWxlcyBjaGFuZ2VkLCA0
NTYgaW5zZXJ0aW9ucygrKSwgNTI4IGRlbGV0aW9ucygtKQo+PiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbW0vY29udHB0ZS5jCj4+ID4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
