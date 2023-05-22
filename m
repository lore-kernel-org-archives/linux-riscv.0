Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFDDC7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkE+CXhfa3CxJUv6xiZdPmn+ivnSEJAF+lP1jbpHtFI=; b=3tZgv5MZICL83S
	8G5oByEPqT7obWcPqsYF/CjTrkq78onTgNdUydpL75f2COheiH923w8jqyam6VpNi5d1fVkbdKxnz
	L+OOjiU3C444XzSTKJtDfJJsQl4EE2MSvwCTGPSVmi9I4c6f+l2iW/0IThZCFeKpWSiZkUBY/UrYA
	vmfq2xjYvq5fHkwEKpQH8cp/oGPJzR+DYcKahIoi9ZykhwTZzYDSEQgNDDSkrrK9eht1/5vXRzunC
	Dt9QSkCBRgRS8tdmVrZKpXlS8tHatEKJGCBGoNru0FAiEKRxaJcy2B2i0RG3xKuVqZaNgKS2KhslK
	WKScMUiOt1mAGNrMSsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10uO-005kUr-2z;
	Mon, 22 May 2023 08:28:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10uH-005kTZ-2X
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 08:28:47 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af28303127so32920191fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684744119; x=1687336119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKYPMbp630qRmaM4E26ANDSF3jxKcu+IzgA8/biQrNQ=;
        b=Pwnm0Tm/WkzNFp/fY6TUyeZT5Dh261RCGr0eDEZxuSAJMDpS/euyadlSYfcDip4Z8y
         bVSEcvBhEQsKivOG9F4pylBfrRMUq06HX/x7iaHCdKCdwzbaGUdpZ+yEo6hcEOFkREeH
         mEgN35bB2FAQ/dxUHils0fEjePajUBnJDYdXGvNVvDo9xamL+LPmigMiuKcsFPJrkfb5
         UhUzLXVYiJ44gg+SnRBfGIMTmtZgPjfKEq4WKb9veT1C6Hw2v8qzOIhKeJNz73xC8Ugh
         VAww1kS+SmB8deTBmzfaPkmDUp/DLUbas5FqUmOT63jHYtBKnMUaNvqx4hmx/p7Tb/Fm
         yJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684744119; x=1687336119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKYPMbp630qRmaM4E26ANDSF3jxKcu+IzgA8/biQrNQ=;
        b=cfAJ83v09cUarqqXy8Gc5U5b5h1uZc52NCQgQx2Cxp18PoMawPFRX2n2F64L4wx7sx
         6XAN2moDmukFUSWUMCvWDGIZFmEs0AQMltfnuZLoZZcqcHNNixyt7Em3rWnbF1pcW5LY
         nN99Od3plbce3wax4CWrweWVuQA74W138iwTn9j61szmd1WoxbRLGQMcMRzt6aLtEoAe
         kEoKn/1TGeb31bZ1apTPoRnqfepMsmTmGvqdnsATA3WcJq2C7vjpHZD/EPwVaCxROpQS
         j77tXIAPUCaANqWQmXFvN3mgMZwHmpvhFz0k17qvp3PC02jKFSZE9gg+fA3aOH1GYv28
         FF8A==
X-Gm-Message-State: AC+VfDztYLEvyxWnBx3WS4+K2OsiKlz2VCZlYH6nncIVtB0+Hc8B9Ivv
	BI0Y4FU0ZLmQ6z8L9FdkHyS2UmenhAVy51hunijJs7eZJLXgthAIh6Yy4w==
X-Google-Smtp-Source: ACHHUZ4H/n8LyJZKrrrTCdulrMsNzulqQBwkXUdqJqaOucvQyBqwQPSaZGg22TL+3dKhN/zIE0PFmrieJWgLDO5PIfA=
X-Received: by 2002:a2e:9609:0:b0:2af:2908:8ff3 with SMTP id
 v9-20020a2e9609000000b002af29088ff3mr2980646ljh.33.1684744119136; Mon, 22 May
 2023 01:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230518161949.11203-1-andy.chiu@sifive.com> <20230518161949.11203-21-andy.chiu@sifive.com>
 <5677700.DvuYhMxLoT@basile.remlab.net>
In-Reply-To: <5677700.DvuYhMxLoT@basile.remlab.net>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 22 May 2023 16:28:28 +0800
Message-ID: <CABgGipW9xtZp-c2xWakz+EzrMbviN_9iAEtmfx73L4TJAn3K8Q@mail.gmail.com>
Subject: Re: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace
 vector management
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_012841_850649_A6BB7E8A 
X-CRM114-Status: GOOD (  26.71  )
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

T24gU3VuLCBNYXkgMjEsIDIwMjMgYXQgMTo0MeKAr1BNIFLDqW1pIERlbmlzLUNvdXJtb250IDxy
ZW1pQHJlbWxhYi5uZXQ+IHdyb3RlOgo+Cj4gICAgICAgICBIaSBhbGwsCj4KPiBMZSB0b3JzdGFp
bmEgMTguIHRvdWtva3V1dGEgMjAyMyAxOS4xOS40MyBFRVNULCB2b3VzIGF2ZXogw6ljcml0IDoK
PiA+IFRoaXMgcGF0Y2ggYWRkIHR3byByaXNjdi1zcGVjaWZpYyBwcmN0bHMsIHRvIGFsbG93IHVz
ZXNwYWNlIGNvbnRyb2wgdGhlCj4gPiB1c2Ugb2YgdmVjdG9yIHVuaXQ6Cj4gPgo+ID4gICogUFJf
UklTQ1ZfVl9TRVRfQ09OVFJPTDogY29udHJvbCB0aGUgcGVybWlzc2lvbiB0byB1c2UgVmVjdG9y
IGF0IG5leHQsCj4gPiAgICBvciBhbGwgZm9sbG93aW5nIGV4ZWN2ZSBmb3IgYSB0aHJlYWQuIFR1
cm5pbmcgb2ZmIGEgdGhyZWFkJ3MgVmVjdG9yCj4gPiAgICBsaXZlIGlzIG5vdCBwb3NzaWJsZSBz
aW5jZSBsaWJyYXJpZXMgbWF5IGhhdmUgcmVnaXN0ZXJlZCBpZnVuYyB0aGF0Cj4gPiAgICBtYXkg
ZXhlY3V0ZSBWZWN0b3IgaW5zdHJ1Y3Rpb25zLgo+ID4gICogUFJfUklTQ1ZfVl9HRVRfQ09OVFJP
TDogZ2V0IHRoZSBzYW1lIHBlcm1pc3Npb24gc2V0dGluZyBmb3IgdGhlCj4gPiAgICBjdXJyZW50
IHRocmVhZCwgYW5kIHRoZSBzZXR0aW5nIGZvciBmb2xsb3dpbmcgZXhlY3ZlKHMpLgo+Cj4gU28g
ZmFyIHRoZSBzdG9yeSB3YXMgdGhhdCBpZiB0aGUgbnRoIGJpdCBpbiB0aGUgRUxGIEhXQ0FQIGF1
eGlsbGFyeSB2ZWN0b3Igd2FzCj4gc2V0LCB0aGVuIHRoZSBudGggc2luZ2xlIGxldHRlcmVkIGV4
dGVuc2lvbiB3YXMgc3VwcG9ydGVkLiBUaGVyZSBpcyBhbHJlYWR5Cj4gdXNlcnNwYWNlIGNvZGUg
b3V0IHRoZXJlIHRoYXQgZXhwZWN0cyB0aGlzIG9mIHRoZSBWIGJpdC4gKEkga25vdyBJIGhhdmUK
PiB3cml0dGVuIHN1Y2ggY29kZSwgYW5kIEkgYWxzbyBrbm93IG90aGVycyBkaWQgbGlrZXdpc2Uu
KSBUaGlzIGlzIGhvdyBpdAo+IGFscmVhZHkgd29ya3MgZm9yIHRoZSBEIGFuZCBGIGJpdHMuCgpZ
ZXMsIHRoZSBWIGJpdCBpbiBFTEZfSFdDQVAgYmVjb21lcyB2YWd1ZSBpbiB0aGlzIHNlcmllcy4K
Cj4KPiBBZG1pdHRlZGx5LCB1cHN0cmVhbSBMaW51eCBoYXMgbmV2ZXIgZXZlciBzZXQgdGhhdCBi
aXQgdG8gdGhpcyBkYXkuIEJ1dCBzdGlsbCwKPiBpZiB3ZSBlbmQgdXAgd2l0aCB0aGUgYml0IHNl
dCBpbiBhIHByb2Nlc3MgdGhhdCBoYXMgaGFkIFYgc3VwcG9ydCBkaXNhYmxlZCBieQo+IHRoZSBw
YXJlbnQgKG9yIHRoZSBzeXNjdGwpLCBleGlzdGluZyB1c2Vyc3BhY2Ugd2lsbCBlbmNvdW50ZXIg
U0lHSUxMIGFuZAo+IGJyZWFrLgo+Cj4gSU1PLCB0aGUgYml0IG11c3QgYmUgbWFza2VkIG5vdCBv
bmx5IHdoZW5jZSB0aGUga2VybmVsIGxhY2tzIFYgc3VwcG9ydCAoYXMKPiBQQVRDSCAwMiBkb2Vz
KSwgYnV0IGFsc28gaWYgdGhlIHByb2Nlc3Mgc3RhcnRzIHdpdGggViBkaXNhYmxlZC4KClRoaXMg
aXMgZ29pbmcgdG8gY2hhbmdlIEVMRl9IV0NBUCBmcm9tIGEgbWFjcm8gdG8gYSBmdW5jdGlvbi4g
VGhlCmZ1bmN0aW9uIHdpbGwgdHVybiBvbiBDT01QQVRfSFdDQVBfSVNBX1YgaWZmIFYgaXMgc3Vw
cG9ydGVkIGFuZAphbGxvd2VkLiBJIGFtIGdvaW5nIHRvIGRvIHRoaXMgaW4gdjIxIElmIHRoaXMg
bG9va3Mgc2FuZS4gaS5lLgpDdXJyZW50bHkgSSBkb24ndCBzZWUgb3RoZXIgYXJjaGl0ZWN0dXJl
cyB3aGljaCBnaXZlIGRpZmZlcmVudApFTEZfSFdDQVAgdmFsdWVzIG9uIGVhY2ggZXhlY3ZlLiBJ
ZiBFTEZfSFdDQVAgaXMgbm90IGEgcmlnaHQgcGxhY2UgdG8KZW5jb2RlIHRoZSBpbmZvcm1hdGlv
biB0aGVuIHVzZXJzcGFjZSBoYXMgdG8gbWFrZSB0aGUgcHJjdGwoKSBjYWxsIHRvCmJlIGNlcnRh
aW4gb24gd2hldGhlciBWIGlzIHVzYWJsZS4KCj4KPiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gYWNo
aWV2ZSB0aGlzOgo+IDEpIFYgaXMgbmV2ZXIgZXZlciBzZXQsIGFuZCB1c2Vyc3BhY2UgaXMgZm9y
Y2VkIHRvIHVzZSBod3Byb2JlKCkgaW5zdGVhZC4KPiAyKSBWIGlzIHNldCBvbmx5IGluIHByb2Nl
c3NlcyBzdGFydGluZyB3aXRoIFYgZW5hYmxlZCAoYW5kIGl0J3MgdGhlaXIgb3duCj4gZmF1bHQg
aWYgdGhleSBkaXNhYmxlZCBpdCBpbiBmdXR1cmUgY2hpbGQgdGhyZWFkcykuCgpUaGUgcHJjdGwo
KSBpbnRlcmZhY2UgZG9lcyBub3QgYWxsb3cgcHJvY2Vzc2VzIHRvIHR1cm4gb2ZmIFYgb25jZSBp
dAppcyBlbmFibGVkIGluIGl0cyBjdXJyZW50IChleGVjdmUpIGNvbnRleHQuIFRoZSBwcm9jZXNz
IGNhbiBvbmx5CmRpc2FibGUgViB3aGVuIHRoZSBuZXh0IGV4ZWN2ZSgpIGhhcHBlbnMuIFRoZW4s
IGlmIHdlIGltcGxlbWVudApFTEZfSFdDQVAgYXMgbWVudGlvbmVkIGFib3ZlLCB0aGUga2VybmVs
IHdpbGwgcmVsb2FkIGEgbmV3IEhXQ0FQIGZvcgp0aGUgcHJvY2Vzcy4gQnkgdGhlbiwgdGhlIG5l
dyBIV0NBUCB3aWxsIGhhdmUgViBtYXNrZWQgc2luY2UgaXQgaXMgbm90CmFsbG93ZWQuCgo+Cj4g
QnIsCj4KPiAtLQo+IOODrOODn+ODu+ODh+ODiy3jgq/jg7zjg6vjg6Ljg7MKPiBodHRwOi8vd3d3
LnJlbWxhYi5uZXQvCj4KPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
