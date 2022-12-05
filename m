Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6608BC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvllMBr92HP0fgsQoKH5s7Uh0oH/ZvAMe/XGWhRwFNo=; b=ajuyvxxY9iAs9/
	uDx1iG3GIhJ35WYBsaCB3yTQ4OpN5ypc/kaZhFf2X8l9K5dz9hX0wp1VKHk9gL60uM8c0RD/jCmlL
	5NlzoSnXc6uA5KxLYbTGK0zyk5AXQ8TU7hg5DQspqF6haFNo/lUjD7SsqnBT8ib4UrUQpVMPMPxBr
	152GMNgjWBwKyM9zFW1Apn+wP32UkAPDHfmKC0+nobL0s2xTXnWTmXfrE9jCe1h+LB/o4sOShsJAR
	TXjS1C48YfHS63lj08evrFVDkmYxsxsLW/xVup0ByPyX+uROZX6QWT0XSnyhNGnrvuAspobLZwmjm
	qS8Pw0T5OZhtXBX9JXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Afb-002gdS-7z; Mon, 05 Dec 2022 12:34:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AfV-002ga3-SC
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 12:34:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id b21so10643279plc.9
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 04:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q40E+8775Ytgz5QSPBn2r/4sQuSdgbu05Kbc0jHoATk=;
        b=MZhsePv3EtViNeCdHKcApYH2WEX0tXDjbOxdICRoiz3JB8UoTMHkYtRUGjPzfw8G7M
         R2a5hEOvxUL8qP4UucwnFEu88M6QMTifKtxN3vWOSJMc02ZNQNmxBrWwJzSpezF8xLg4
         rZWU0zGYT/s6ZmQXOjANZ3PsSciGIJlb15YwVuKAnNR6tFLOugy192txBkWTjsJiEONK
         QgJP9iYG048n92r9BbBQYBCOCdtiO/eqfCLkfJMAHr/9p0jZa3udTOqh8Up/5MC53gYn
         aUI95Mo74WP3W06g+hK35/c/yvbhV8bUJRZPfklJHkuS6a5n/TRRmbr6OQ4ORYTp0iG5
         caaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q40E+8775Ytgz5QSPBn2r/4sQuSdgbu05Kbc0jHoATk=;
        b=WRSJEIi8Ae+DYEC6/KNDPrT/SDI1hw0QAOzW3LqK+bqXrnXlovHhA7mXafBUqk5vEv
         v90kS3+IEchA9lKbyQwshBnUEcwya2rJ/CcAAeY8yEgoCC9ZjMt3oy/RoUMou7iy9nW1
         GjVJoRuBj0LGTcC45e4CB7RvbBWMHRmX2+pCnsWQCIGRLISGg86k8Du85phJHBJdojYj
         4hxprxO2k5q9z3Wf6Qvj3vQZtHatxfLFJshGLKXOOZIJDopMIOCg5h8eHj93ybV3Yba/
         /rxJ0euGwpQO114Do2IueWPGbOXan8OZomOMWk9lgCMoQa46z8cuFib4B9pc37GrI5Ku
         sKTg==
X-Gm-Message-State: ANoB5plFbV2VkBaY6O9gj/plO6vsr7Lr4u1aHHE5+jOjcuo/5EfirZXo
	M/B8BjdhQaXo4kx2QPTmKOwJIUGHGEFkZR6HfD4=
X-Google-Smtp-Source: AA0mqf4QoWxvCzWRsRTp0PvP1pSS70z3LSPhA5x4wbfTZmWepsOLqym0zZitGlWZ95Z20ekzgvlJ4eIxGMijR8Vsf9I=
X-Received: by 2002:a17:90a:e551:b0:219:aa91:d689 with SMTP id
 ei17-20020a17090ae55100b00219aa91d689mr10806324pjb.180.1670243635346; Mon, 05
 Dec 2022 04:33:55 -0800 (PST)
MIME-Version: 1.0
References: <20221201151336.8044-1-suagrfillet@gmail.com> <Y4jICn5oxLozsv6m@wendy>
 <Y4jtfrJt+/Q5nMOz@spud>
In-Reply-To: <Y4jtfrJt+/Q5nMOz@spud>
From: Song Shuai <suagrfillet@gmail.com>
Date: Mon, 5 Dec 2022 12:33:43 +0000
Message-ID: <CAAYs2=gF7FetnJh2UE=1uFS6RChn4eTG5gdasn3KL4Uj2=bMag@mail.gmail.com>
Subject: Re: [PATCH v3] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, apatel@ventanamicro.com, 
	atishp@atishpatra.org, heiko@sntech.de, anshuman.khandual@arm.com, 
	liaochang1@huawei.com, juerg.haefliger@canonical.com, 
	wangkefeng.wang@huawei.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_043357_961980_E289311B 
X-CRM114-Status: GOOD (  22.75  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiDkuo4yMDIy5bm0MTLmnIgx5pel5ZGo5Zub
IDE4OjA45YaZ6YGT77yaCj4KPiBPbiBUaHUsIERlYyAwMSwgMjAyMiBhdCAwMzoyODoxMFBNICsw
MDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAwMSwgMjAyMiBhdCAxMTox
MzozNlBNICswODAwLCBTb25nIFNodWFpIHdyb3RlOgo+ID4gPiBJbiBSSVNDLVYsIC1mcGF0Y2hh
YmxlLWZ1bmN0aW9uLWVudHJ5IG9wdGlvbiBpcyB1c2VkIHRvIHN1cHBvcnQKPiA+ID4gZHluYW1p
YyBmdHJhY2UgaW4gdGhpcyBjb21taXQgYWZjNzZiOGI4MDExICgicmlzY3Y6IFVzaW5nCj4gPiA+
IFBBVENIQUJMRV9GVU5DVElPTl9FTlRSWSBpbnN0ZWFkIG9mIE1DT1VOVCIpLiBTbyByZWNvcmRt
Y291bnQKPiA+ID4gZG9uJ3QgaGF2ZSB0byBiZSBjYWxsZWQgdG8gY3JlYXRlIHRoZSBfX21jb3Vu
dF9sb2Mgc2VjdGlvbiBiZWZvcmUKPiA+ID4gdGhlIHZtbGludXggbGlua2luZy4KPiA+ID4KPiA+
ID4gSGVyZSBzZWxlY3RzIEZUUkFDRV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRS
WSB0byB0ZWxsCj4gPiA+IE1ha2VmaWxlIG5vdCB0byBydW4gcmVjb3JkbWNvdW50Lgo+ID4gPgo+
ID4gPiBMaW5rX3YxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQUFZczI9
ajNFYWs5dlU2eGJBdzB6UHVvaDAwcmg4djVDMlUzZmVQa29rWkZpYldzMmdAbWFpbC5nbWFpbC5j
b20vVC8jdAo+ID4gPiBMaW5rX3YyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di9DQUFZczI9aVluOHNMUUI4b2grUnpUS2QyVktzOE1YT0xYNk13cGFteDVnZFZWTjZta0FAbWFp
bC5nbWFpbC5jb20vVC8jbTYyMTM4ZDdhNzY2NjQ3OThkMDAwNTE4MThhNDM4YTYwMWVmZjRjZjEK
PiA+Cj4gPiBIZXkgU29uZyBTaHVhaSwKPiA+Cj4gPiBGb3IgZnV0dXJlIHBhdGNoZXMsIHBsZWFz
ZSB1c2Ugbm9ybWFsICJMaW5rOiIgdGFncy4gSWYgeW91J3JlIGp1c3QKPiA+IGxpbmtpbmcgdG8g
cHJpb3IgdmVyc2lvbnMgb2YgdGhlIHBhdGNoLCBqdXN0IHB1dCB0aGVtIGJlbG93IHRoZSAtLS0K
PiA+IGxpbmUgc28gdGhleSBkb24ndCBlbmQgdXAgaW4gdGhlIGdpdCBoaXN0b3J5Lgo+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+ID4g
VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBh
cmNoL3Jpc2N2L0tjb25maWcgfCAxICsKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9y
aXNjdi9LY29uZmlnCj4gPiA+IGluZGV4IDU3Mjk3MzEwM2Q3My4uYzE5Y2RkYjhmZWI5IDEwMDY0
NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gPiA+IEBAIC0yNzcsNiArMjc3LDcgQEAgY29uZmlnIEFSQ0hfUlY2NEkKPiA+ID4g
ICAgIHNlbGVjdCA2NEJJVAo+ID4gPiAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSU5UMTI4IGlm
IENDX0hBU19JTlQxMjgKPiA+ID4gICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFIGlmICFY
SVBfS0VSTkVMICYmIE1NVSAmJiAkKGNjLW9wdGlvbiwtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRy
eT04KQo+ID4gPiArICAgc2VsZWN0IEZUUkFDRV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElP
Tl9FTlRSWSBpZiBEWU5BTUlDX0ZUUkFDRQo+Cj4gQWxzbywgd2h5IGFyZSB0aGVzZSBub3QgYWRk
ZWQgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLCBsaWtlIHRoZSBjdXJyZW50Cj4gbGlzdCBpcz8gSSBk
b24ndCBzZWUgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpbiBsaW51eC1uZXh0IGZyb20gdGhlIG90aGVy
Cj4gZGF5IHNvIHRoYXQgcHJvYmFibHkgbmVlZHMgZml4aW5nIGluIHRoZSBzZXJpZXMgeW91IGFy
ZSBiYXNlZCBvbiB0b28uCj4KU29ycnkgZm9yIGJvdGhlcmluZyB5b3Ugd2l0aCB0aGlzIGRpc29y
ZGVybHkgQ09ORklHICBhbmQgdGhlICdMaW5rJyB0YWdzCkknbGwgdGlkeSB0aGVtIHVwIHdpdGgg
R3VvIFJlbiBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiA+ID4gICAgIHNlbGVjdCBIQVZFX0RZTkFN
SUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFNSUNfRlRSQUNFCj4gPiA+ICAgICBzZWxl
Y3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUwo+ID4gPiAgICAgc2VsZWN0
IEhBVkVfU0FNUExFX0ZUUkFDRV9ESVJFQ1QKPiA+ID4gLS0KPiA+ID4gMi4yMC4xCj4gPiA+CgoK
Ci0tClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
