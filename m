Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D92D3E18D
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYHxDK4HApimqOkJMbTCJDGOUYQVCtoQQIh3JLHEnSo=; b=OpiMPVIVC5PAv6
	Ste15DAfBXhaNPnl9sB37NkqgBP8AEb1lSTtSduFwJFDUDiBnZsVJVeKHf1y/vSY1WJ4tqdFSc3xp
	ydxdz/bB3soxHvtHtN6FWb8vU7wj4n5SqGEG6iuoIk9pjOlOX/WnrlNEI9AD/XQ1hLRGAaNSUT7fh
	6ff25Aq/yXrnXxuQW/Cu7HJpFmCfcV3C/RyPEjWj8yRaqHgNuyjA6URiaHgMGDvvwd0up9mMHbqwS
	VznItIYzfACLcNqhOfMS70QlCKALjtsdtWllr4HrAAluWjlmEfnNbH/HEyM9U3MaxSvJV+Q1EDtmk
	+B5iRhSOdlvKIkCZwHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mGh-00000006H1k-1DJK;
	Mon, 21 Oct 2024 06:51:55 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mAb-00000006FJG-2Jzp
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 06:45:39 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5ebc0e13d25so227034eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1729493132; x=1730097932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFfz4pBXhPmkPLZ+Y2pEcUJL3NkrX4tf7jn81UWQ+lk=;
        b=G8gyKKt1fldd5rftDEnb1YPvos9CURCGOMKoq2Uc5kcDhRVuN0dDycUpZdSs4Y9rko
         /0blG9XPJuFYQpc0Mo8hpASFyxJeRlusp1ZXdEG76iOWePDN2pqHNEoZiDWPCzjPIJxK
         /N409zvD36Zv0mRxKR6GKANJEcHo6rT7mkV7mA22MsQa2uUNDifUlUbZvA7IwHI45f4h
         0x6DwIvUfa9+kfLcQO2T5r7q0SH61xUQgM3bGlXsUzqKFxRtNnWwqaDlTd+O1a1i9YPa
         YVu9cOpm+quWKCRQh6pUB9mIH5Xuj1EI9fk9PSdw41gz0zFSMOTAA6kTYeCDogI8nxXw
         FUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729493132; x=1730097932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFfz4pBXhPmkPLZ+Y2pEcUJL3NkrX4tf7jn81UWQ+lk=;
        b=j7eZyvSCj7HMwVkTKzNXz77DmgluDKZhA1HjP1R7huIYCYVkOeI283UALu728Z9dao
         3ee33H/n+2WO+UAGBoSD4GY8dsEeEGp9fB6VloYMQySXAECyPT+3D7XDXcGZRkgs9Qlt
         Tc9PBmDqD0xqGe4vuGN+Nfvmjc7fcVxBQIO43/PvkgZkZOmMZeCEPun4kgPQkUtFiAnD
         cu0+oUyiEDCAYASJW4fBCw08ZgWXKrgHO1DUS7TEIoc8LOptC9A32HyS5d32gGjy5Y3x
         eejPymMqWojiKRxQ9j0/bvWETEwy0lhlzjoF2FNWkmwRnYNkT98DS0YuSmowOFROfc8Q
         DEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcafx/+/9DAc5ZoqeRsV2o4kBPciDeFULrIrn7pPNc/2dJDC5VaA8I/YOk93vuTzd1YKKWkN16NEGJcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Fyl3RbTUAojVMz5mVdrxlHj/PCkPB3nP+3vBbUG98pMqhiaG
	hKMZQDpWEMBVBlSo7IvE3D7Q4VJxjPbNI1Hwv8d9dyZhaj8KEb19JD4PrnkQG8hOrQ5+wL57vHa
	oCcelwInNKNscNeWJzwMa8L/6DjgdwBrymE6G7A==
X-Google-Smtp-Source: AGHT+IHkWkcHdT5DdeVMSrPXb/6gesNmbseDkgI2CbS77LtrEjkte5ZlyuuYYfHzjmSdDiMbJA9/m0Uxn3N1YAlwi8A=
X-Received: by 2002:a05:6820:1ad1:b0:5eb:758c:fa64 with SMTP id
 006d021491bc7-5eb8b5514b5mr7734392eaf.4.1729493132141; Sun, 20 Oct 2024
 23:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
 <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr> <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
 <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr>
In-Reply-To: <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 21 Oct 2024 14:45:20 +0800
Message-ID: <CAEEQ3wmw8B_cOs54H4Z8e2QTGyeE2cAYQwDRyk7KgUUKTFhZ-g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_234537_929478_7159E9D2 
X-CRM114-Status: GOOD (  30.86  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, haibo1.xu@intel.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxleCwKCk9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDk6MDHigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Cj4gT24gMTQvMTAvMjAyNCAxNDozMCwgeXVuaHVp
IGN1aSB3cm90ZToKPiA+IEhpIEFsZXgsCj4gPgo+ID4gT24gTW9uLCBPY3QgMTQsIDIwMjQgYXQg
ODoxMuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPj4gSGkg
WXVuaHVpLAo+ID4+Cj4gPj4gT24gMTQvMTAvMjAyNCAxMTo0NywgWXVuaHVpIEN1aSB3cm90ZToK
PiA+Pj4gV2hlbiBTVlBCTVQgaXMgZW5hYmxlZCwgX19hY3BpX21hcF90YWJsZSgpIHdpbGwgZGly
ZWN0bHkgYWNjZXNzIHRoZQo+ID4+PiBkYXRhIGluIEREUiB0aHJvdWdoIHRoZSBJTyBhdHRyaWJ1
dGUsIHJhdGhlciB0aGFuIHRocm91Z2ggaGFyZHdhcmUKPiA+Pj4gY2FjaGUgY29uc2lzdGVuY3ks
IHJlc3VsdGluZyBpbiBpbmNvcnJlY3QgZGF0YSBpbiB0aGUgb2J0YWluZWQgQUNQSQo+ID4+PiB0
YWJsZS4KPiA+Pj4KPiA+Pj4gVGhlIGxvZzogQUNQSTogW0FDUEk6MHgxOF0gSW52YWxpZCB6ZXJv
IGxlbmd0aC4KPiA+Pj4KPiA+Pj4gV2UgZG8gbm90IGFzc3VtZSB3aGV0aGVyIHRoZSBib290bG9h
ZGVyIGZsdXNoZXMgb3Igbm90LiBXZSBzaG91bGQKPiA+Pj4gYWNjZXNzIGluIGEgY2FjaGVhYmxl
IHdheSBpbnN0ZWFkIG9mIG1haW50YWluaW5nIGNhY2hlIGNvbnNpc3RlbmN5Cj4gPj4+IGJ5IHNv
ZnR3YXJlLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGFyY2gvcmlzY3Yva2VybmVsL2FjcGku
YyB8IDIgKy0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMKPiA+Pj4gaW5kZXggNmUwZDMzM2Y1N2U1Li4zMTc3
YzlhZjg3NjQgMTAwNjQ0Cj4gPj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4+
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMKPiA+Pj4gQEAgLTIxMCw3ICsyMTAsNyBA
QCB2b2lkIF9faW5pdCBfX2lvbWVtICpfX2FjcGlfbWFwX3RhYmxlKHVuc2lnbmVkIGxvbmcgcGh5
cywgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4+PiAgICAgICAgaWYgKCFzaXplKQo+ID4+PiAgICAg
ICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+Pj4KPiA+Pj4gLSAgICAgcmV0dXJuIGVhcmx5X2lv
cmVtYXAocGh5cywgc2l6ZSk7Cj4gPj4+ICsgICAgIHJldHVybiBlYXJseV9tZW1yZW1hcChwaHlz
LCBzaXplKTsKPiA+Pj4gICAgfQo+ID4+Pgo+ID4+PiAgICB2b2lkIF9faW5pdCBfX2FjcGlfdW5t
YXBfdGFibGUodm9pZCBfX2lvbWVtICptYXAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+Pgo+ID4+
IEl0IG1ha2VzIHNlbnNlIHRvIG1lIHNpbmNlIHdpdGggdGhpcywgd2UgZG9uJ3QgaGF2ZSB0byBj
YXJlIGFib3V0IGhvdwo+ID4+IHRoZSBmaXJtd2FyZSBtYXBwZWQgdGhlIHRhYmxlLiBBbmQgaXQg
bWltaWNzIGFsbCBvdGhlciBhcmNoaXRlY3R1cmVzCj4gPj4gKGFybTY0LCBsb29uZ2FyY2ggYW5k
IHg4NikuCj4gPj4KPiA+PiBIZXJlIGlzIHRoZSBjb3JyZXNwb25kaW5nIGZpeGVzIHRhZzoKPiA+
Pgo+ID4+IEZpeGVzOiAzYjQyNmQ0YjViMTQgKCJSSVNDLVY6IEFDUEkgOiBGaXggZm9yIHVzYWdl
IG9mIHBvaW50ZXJzIGluCj4gPj4gZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2UiKQo+ID4+Cj4gPj4g
V2l0aCB0aGUgY29ycmVzcG9uZGluZyBmaXggaW4gX19hY3BpX3VubWFwX3RhYmxlKCkgYXMgcG9p
bnRlZCBieSBTdW5pbCwKPiA+PiB5b3UgY2FuIGFkZDoKPiA+Pgo+ID4+IFJldmlld2VkLWJ5OiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPj4KPiA+PiBBbmQgcmVn
YXJkaW5nIHRoZSBzcGFyc2UgZXJyb3IsIEkgZG9uJ3Qgc2VlIGFueSBvdGhlciBhcmNoaXRlY3R1
cmUKPiA+PiBjYXN0aW5nIHRvIF9faW9tZW0sIHNvIG1heWJlIHRoYXQncyBub3QgbmVjZXNzYXJ5
IGFueW1vcmU/Cj4gPiBPSy4gSSB3aWxsIG1ha2UgdGhlIGNoYW5nZXMgaW4gdjIuIFJlZ2FyZGlu
ZyB0aGUgc3BhcnNlIGVycm9yLCBJIHdpbGwKPiA+IHVzZSBhbm90aGVyIHBhdGNoIHNwZWNpZmlj
YWxseSB0byBzb2x2ZSBpdC4gSXMgdGhhdCBva2F5Pwo+Cj4KPiBJZiB0aGUgc2Vjb25kIHBhdGNo
IG9ubHkgY29uc2lzdHMgaW4gY2FzdGluZywgSSB3b3VsZCBub3QgdXNlIGFub3RoZXIKPiBwYXRj
aCBzaW5jZSB0aGUgcGF0Y2ggMiB3b3VsZCBmaXggc29tZXRoaW5nIGludHJvZHVjZWQgaW4gcGF0
Y2ggMS4KPgo+IEJ1dCBpZiBwYXRjaCAyIGlzIG1vcmUgY29tcGxpY2F0ZWQsICBpdCBtYXkgbWFr
ZSBzZW5zZSB0byBkbyBhcyB5b3UKPiBzdWdnZXN0LCB0aGUgZ29hbCBpcyB0byBtZXJnZSBwYXRj
aCAxIGFzYXAuCgpSZWdhcmRpbmcgcGF0Y2ggMiwgSSBleGVjdXRlZCAibWFrZSAmIG1ha2UgaW5z
dGFsbCIgZm9yIHNwYXJzZSBvZiB0aGUKcmlzY3YgYXJjaC4gSSAiZ2l0IGNsb25lZCIgZnJvbQpo
dHRwczovL2dpdGh1Yi5jb20vQ29uY2h1T0Qvc3BhcnNlLmdpdC4KVGhlbiB3aGVuIGNvbXBpbGlu
ZyB0aGUga2VybmVsLCB0aGUgZm9sbG93aW5nIGVycm9yIHdhcyByZXBvcnRlZDoKCmNkIC9kYXRh
MDAvY3loL2xpbnV4LW5leHQvCm1ha2UgZGVmY29uZmlnCmNwIC5jb25maWcgYnVpbGQtcmlzY3Y2
NC8KCm1ha2UgTz1idWlsZC1yaXNjdjY0LyBDPTEgVz0xIGFyY2gvcmlzY3Yva2VybmVsLyBkcml2
ZXJzL2FjcGkvCmRyaXZlcnMvbWFpbGJveC8gLWoKbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5
ICcvZGF0YTAwL2N5aC9saW51eC1uZXh0L2J1aWxkLXJpc2N2NjQnCiAgR0VOICAgICBNYWtlZmls
ZQogIENDICAgICAgc2NyaXB0cy9tb2QvZW1wdHkubwogIENDICAgICAgc2NyaXB0cy9tb2QvZGV2
aWNldGFibGUtb2Zmc2V0cy5zCiAgQ0hFQ0sgICAuLi9zY3JpcHRzL21vZC9lbXB0eS5jCmludmFs
aWQgYXJndW1lbnQgdG8gJy1tYXJjaCc6ICdfemljc3JfemlmZW5jZWknCgptYWtlWzNdOiAqKiog
Wy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjI5OiBzY3JpcHRzL21vZC9lbXB0eS5vXSBFcnJv
ciAxCm1ha2VbM106ICoqKiBEZWxldGluZyBmaWxlICdzY3JpcHRzL21vZC9lbXB0eS5vJwptYWtl
WzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlWzJdOiAqKiogWy9k
YXRhMDAvY3loL2xpbnV4LW5leHQvTWFrZWZpbGU6MTIxNTogcHJlcGFyZTBdIEVycm9yIDIKbWFr
ZVsxXTogKioqIFsvZGF0YTAwL2N5aC9saW51eC1uZXh0L01ha2VmaWxlOjIyNDogX19zdWItbWFr
ZV0gRXJyb3IgMgoKRG8geW91IGtub3cgdGhlIHNvbHV0aW9uPwoKPgo+IFRoYW5rcyEKPgo+IEFs
ZXgKPgo+Cj4gPgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+IEFsZXgKPiA+Pgo+ID4+Cj4gPiBUaGFu
a3MsCj4gPiBZdW5odWkKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
