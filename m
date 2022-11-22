Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQjCagfKMtBU39sl4sCWPyUwrN/BUygK4mxPLnLQNOY=; b=OQwQDuqcQ3nI50
	dCpzzvmaqsAIZ1x+7WhcZJsC9R+kgZqbVYmEaDqIJIR4xjh987ue0ck19GBjOm9qRH9RKQyvGTrvZ
	IbvbWZw9gsKfpsNaq7ItK69QDowwp9+EsyhJz1wJ7Us0b+T1wXDgI5KAe4rJv9PbrFp+JEkF6oKdh
	m2qO9pdilMt3PfzUkU/DShAc3icp0vdDqOlquwvya1sJpgA+jet7IFtITm/qwWM2Dufk+euCS5kTB
	6IQy1CMDQuQ/ZqZzTXMEMzT9ieVqmeVjmIeLpX91iy1e+Bs2ETFJDVV2YfsW2CWq8iP0IjraMoBIi
	kp0EfZEcfue58D0WoMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPwA-007Mwh-KI; Tue, 22 Nov 2022 09:51:30 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPw5-007MrT-Ik
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 09:51:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id w3-20020a17090a460300b00218524e8877so924640pjg.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 01:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJPRFWUS+kHDlUMP7u9x/6fCJJ/tjVlV+kEOIve76tU=;
        b=gpr1s7j38CU30DZx7QJ6i6Zckn7o9X6P7nSjOVTuO7Cn4+ARAsx4uVCSiPN9mC8Rvn
         GFG7bKKGccODi9sVbEf+zvp7a0M+CI4GAxUAwGeH2Cm0X4YFUiWBSvNRv4RJ6yDBcuFE
         8advTVWWv5OEyK2WO49jYEM6NHwE235MBMBx1Y3IsOwIO1Vkk+4bf9HDJQ7QgTSB1M8G
         hxSePriwPMdMeVybnw06OfDp6Pq3tA6utRmDBsD9ViTc1saKDwLBOdS37WER8+bORgp8
         Bf0dXNGCaUuYmzXlLd/HG/szwbb5ikY4M641gylv5dO8wujIecIv/0LUB3ppw5pzGNyX
         IZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJPRFWUS+kHDlUMP7u9x/6fCJJ/tjVlV+kEOIve76tU=;
        b=KswgsPxbutnrEPvh9fJaxD5/NifMNJ/4q4Fb37nI+HFwpko/Y42ttbESFjURgko0cg
         RIZfPvzP2rmHJuW4Z+We/IStBvSRObnEwaCNX70WMl2oQ/3y7c4iYYzt9naUVdCHwchN
         ws8ugJqwOCfUT7lVI/QForBtRvHIIPb2gVt8FAUOzUHbmqZh30yQwSbJ0LbRFn0O2VEf
         11vPcEkfrBh8Y2qwF9KWdTd9J46MT4eASKB99X9/vFW/UNKWDeSLKU/TCvxL72TOGTwf
         rs+cawxyJ98wcJX4LojllyDunHZM8FXRVggp86GuPpRvYzZKP9zx8og5ruehohv9QNLW
         Y4eQ==
X-Gm-Message-State: ANoB5pl94X9yJpLqnYueyzvYPCSj1rUFEnoLnvZZyKkjhiy8yQc9lHEd
	UW2Gu90RBKSxRrfuSKlH0h7OtcCL0uQaB7h5C9M=
X-Google-Smtp-Source: AA0mqf54aYRkWpRvkuoQXCzil+q3LvsUhNdPKvB9vzawCX6CVfErmT6Mt+YkCcRXw4+YOMrssCEvNc/Lhu2hRRJ56g4=
X-Received: by 2002:a17:902:ca04:b0:17f:7f7e:70c7 with SMTP id
 w4-20020a170902ca0400b0017f7f7e70c7mr5083919pld.107.1669110684712; Tue, 22
 Nov 2022 01:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20221122075440.1165172-1-suagrfillet@gmail.com>
 <CAJF2gTQWuu2wUk-7WhFdov0PG5R1z_F_+OLqHM0nGnMiC1Yi_w@mail.gmail.com>
 <CAAYs2=iSTTuthLhwiyw08yG2q=yLrdKPmvbG2rS7uibzhe-wXQ@mail.gmail.com> <CAJF2gTT=r4VeWqpe+Tw2JDdTDU+r2mJiPmHq_i8eV5YRmrrLRA@mail.gmail.com>
In-Reply-To: <CAJF2gTT=r4VeWqpe+Tw2JDdTDU+r2mJiPmHq_i8eV5YRmrrLRA@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 22 Nov 2022 09:51:11 +0000
Message-ID: <CAAYs2=gBfKPBMBVpkOYfixavkANhBnArSdCdHDgv8219sR4BzA@mail.gmail.com>
Subject: Re: [PATCH] riscv/ftrace: fix ftrace_modify_call bug
To: Guo Ren <guoren@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_015125_677201_C2C7792D 
X-CRM114-Status: GOOD (  22.13  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDIy5pel5ZGo5LqMIDA5
OjI55YaZ6YGT77yaCj4KPgo+Cj4gT24gVHVlLCBOb3YgMjIsIDIwMjIgYXQgNToxMSBQTSBTb25n
IFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4g5LqOMjAyMuW5tDEx5pyIMjLml6XlkajkuowgMDg6NTflhpnpgZPvvJoK
Pj4gPgo+PiA+IE9uIFR1ZSwgTm92IDIyLCAyMDIyIGF0IDM6NTQgUE0gU29uZyBTaHVhaSA8c3Vh
Z3JmaWxsZXRAZ21haWwuY29tPiB3cm90ZToKPj4gPiA+Cj4+ID4gPiBXaXRoIHRoaXMgY29tbWl0
IChyaXNjdjogZnRyYWNlOiBSZWR1Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZikKPj4g
PiA+IHBhdGNoZWQsIGZ0cmFjZSBidWcgb2NjdXJyZWQgV2hlbiBob3N0aW5nIGtwcm9iZSBhbmQg
ZnVuY3Rpb24gdHJhY2VyCj4+ID4gPiBhdCB0aGUgc2FtZSBmdW5jdGlvbi4KPj4gPiA+Cj4+ID4g
PiBPYnZpb3VzbHksIHRoZSB2YXJpYWJsZSBjYWxsZXIgaW4gZnRyYWNlX21vZGlmeV9jYWxsIHdh
cyBhc3NpZ25lZCBieQo+PiA+ID4gcmVjLT5pcCB3aXRoIDQgb2Zmc2V0IGZhaWxpbmcgdGhlIGNv
ZGUgcmVwbGFjaW5nIGF0IGZ1bmN0aW9uIGVudHJ5Lgo+PiA+ID4gQW5kIHRoZSBjYWxsZXIgc2hv
dWxkIGJlIGFzc2lnbmVkIGJ5IHJlYy0+aXAgZGlyZWN0bHkgdG8gaW5kaWNhdGUKPj4gPiA+IHRo
ZSBmdW5jdGlvbiBlbnRyeS4KPj4gPiBUaGFuayB5b3UsIGl0J3MgbXkgZmF1bHQsIGJ1dCBJIHRo
aW5rIHRoZSBwcm9ibGVtIGlzOgo+PiA+Cj4+ID4gQmVmb3JlIChyaXNjdjogZnRyYWNlOiBSZWR1
Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZikKPj4gPiAgICAgIDA6IFJFR19TICByYSwg
LVNaUkVHKHNwKQo+PiA+ICAgICAgNDogYXVpcGMgIHJhLCA/ICAgICAgICAgIDwtIFdlIG5lZWQg
InJlYy0+aXAgKyA0IiBoZXJlCj4+ID4gICAgICA4OiBqYWxyICAgPyhyYSkKPj4gPiAgICAgMTI6
IFJFR19MICByYSwgLVNaUkVHKHNwKQo+PiA+Cj4+ID4gQWZ0ZXIgKHJpc2N2OiBmdHJhY2U6IFJl
ZHVjZSB0aGUgZGV0b3VyIGNvZGUgc2l6ZSB0byBoYWxmKQo+PiA+ICAgICAgMDogYXVpcGMgIHQw
LCA/ICA8LSBXZSBuZWVkbid0ICJyZWMtPmlwICsgNCIgYW55bW9yZQo+PiA+ICAgICAgNDogamFs
ciAgIHQwLCA/KHQwKQo+PiA+Cj4+ID4gSSBjb3BpZWQgcmVjLT5pcCArIDQgYmxpbmRseSwgdGhl
biBjYXVzZWQgdGhlIGJ1Zy4gUmlnaHQ/Cj4+ID4KPj4gWWVzLCB5b3UncmUgcmlnaHQuCj4+Cj4+
IEhlcmUncyBteSBzaW1wbGUgdGVzdCBjYXNlIGZvciB5b3VyIGNvbnZlbmllbmNlLgo+PiBgYGAK
Pj4gZWNobyBrZXJuZWxfcmVhZCA+IHNldF9mdHJhY2VfZmlsdGVyCj4+IGVjaG8gZnVuY3Rpb24g
PiBjdXJyZW50X3RyYWNlcgo+PiBlY2hvICdwOm15cCBrZXJuZWxfcmVhZCcgPiBrcHJvYmVfZXZl
bnRzCj4+IGVjaG8gMSA+IGV2ZW50cy9rcHJvYmVzL215cC9lbmFibGUgIyBmdHJhY2UgYnVnCj4K
Pgo+IFRoeCwgSSB3b3VsZCBmb2xkIHRoZSBwYXRjaCBpbnRvIChyaXNjdjogZnRyYWNlOiBSZWR1
Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZikuIEFuZCBhZGQgQ28tZGV2ZWxvcGVkLWJ5
OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHRhZyBvbiB0aGF0Lgo+Cj4gSSB3
b3VsZCBzZW5kIHRoZSB2MyBzZXJpZXMgaW52b2x2aW5nIHlvdXIgcGF0Y2hlcy4KPgpUaGF0J3Mg
YW4gaG9ub3IgZm9yIG1lLgoKVGhhbmtzLApTb25nCj4+Cj4+IGBgYAo+PiA+ID4KPj4gPiA+IFRo
ZSBmb2xsb3dpbmcgaXMgdGhlIGZ0cmFjZSBidWcgbG9nLgo+PiA+ID4KPj4gPiA+IGBgYAo+PiA+
ID4gWyAgNDE5LjYzMjg1NV0gMDAwMDAwMDBmODc3NjgwMzogZXhwZWN0ZWQgKGZmZTAwMjk3IDFh
NDI4MmU3KSBidXQgZ290ICgxYTgyODJlNyBmMDIyNzE3OSkKPj4gPiA+IFsgIDQxOS42MzMzOTBd
IC0tLS0tLS0tLS0tLVsgZnRyYWNlIGJ1ZyBdLS0tLS0tLS0tLS0tCj4+ID4gPiBbICA0MTkuNjMz
NTUzXSBmdHJhY2UgZmFpbGVkIHRvIG1vZGlmeQo+PiA+ID4gWyAgNDE5LjYzMzU2OV0gWzxmZmZm
ZmZmZjgwMjA5MWNjPl0ga2VybmVsX3JlYWQrMHgwLzB4NTIKPj4gPiA+IFsgIDQxOS42MzM4NjNd
ICBhY3R1YWw6ICAgOTc6MDI6ZTA6ZmY6ZTc6ODI6ODI6MWEKPj4gPiA+IFsgIDQxOS42MzQwODdd
IFVwZGF0aW5nIGZ0cmFjZSBjYWxsIHNpdGUgdG8gY2FsbCBhIGRpZmZlcmVudCBmdHJhY2UgZnVu
Y3Rpb24KPj4gPiA+IFsgIDQxOS42MzQyNzldIGZ0cmFjZSByZWNvcmQgZmxhZ3M6IGUwMDAwMDAy
Cj4+ID4gPiBbICA0MTkuNjM0NDg3XSAgKDIpIFIKPj4gPiA+IFsgIDQxOS42MzQ0ODddICBleHBl
Y3RlZCB0cmFtcDogZmZmZmZmZmY4MDAwOTNjYwo+PiA+ID4gWyAgNDE5LjYzNDkzNV0gLS0tLS0t
LS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+ID4gPiBgYGAKPj4gPiA+Cj4+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4+ID4gPiAt
LS0KPj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyB8IDIgKy0KPj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gPiA+Cj4+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9mdHJhY2UuYwo+PiA+ID4gaW5kZXggOGM3N2YyMzZmYzcxLi42MWIyNGQ3NjdlMmUgMTAwNjQ0
Cj4+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+PiA+ID4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKPj4gPiA+IEBAIC0xMzIsNyArMTMyLDcgQEAgaW50IGZ0
cmFjZV9tb2RpZnlfY2FsbChzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLCB1bnNpZ25lZCBsb25nIG9s
ZF9hZGRyLAo+PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIp
Cj4+ID4gPiAgewo+PiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgY2FsbFsyXTsKPj4gPiA+IC0g
ICAgICAgdW5zaWduZWQgbG9uZyBjYWxsZXIgPSByZWMtPmlwICsgNDsKPj4gPiA+ICsgICAgICAg
dW5zaWduZWQgbG9uZyBjYWxsZXIgPSByZWMtPmlwOwo+PiA+ID4gICAgICAgICBpbnQgcmV0Owo+
PiA+ID4KPj4gPiA+ICAgICAgICAgbWFrZV9jYWxsX3QwKGNhbGxlciwgb2xkX2FkZHIsIGNhbGwp
Owo+PiA+ID4gLS0KPj4gPiA+IDIuMjAuMQo+PiA+ID4KPj4gPgo+PiA+Cj4+ID4gLS0KPj4gPiBC
ZXN0IFJlZ2FyZHMKPj4gPiAgR3VvIFJlbgo+PiBUaGFua3MsCj4+IFNvbmcKPgo+Cj4KPiAtLQo+
IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
