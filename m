Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63602EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWlKkFBOoXpjfJK0SojLkj0tgONoR+MrWQhID37ob6s=; b=EHc1WcZku8FDIk
	QlCKckwwIQpIR/dSPuzyGtNnzOMMdE6TS00kmlxO/UqJLMHaQAwvDoWvGCUt7pNX5IhKP1rLVmU68
	gI21h2oOp8vYFqPU9h4wEdC4Z41XtjkQUIfCFuGDz6DtkHjIyFx5F1lUKAXggIL+v9GnX4HsHkQGO
	ieUaGttFzoVJXsfgQ35g6a7tC8jXg6u+vSjotTTOnQidc/B1tRgRSxcr9QVZVgQYwSLWnqp46XJ8m
	PCUfsGAZ/zWe4f3N20m+s/2cUQolvFFekYtIRPmZLAGcEeqBf+iQ+J2B4a3eW3Otqf11C2sk+v9vd
	EO//woafSR+ROxidg/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0mc-002Qzy-0J;
	Thu, 29 Jun 2023 23:10:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0mY-002QyU-0S
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:10:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso2019784e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688080223; x=1690672223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1fWEnH0sdbyAOEH6UFoh83BPgBAF+lwm2DoFeYlQSk=;
        b=5bGVU2MaUkUfhQDs6c1WAjUyAqUmx30DMW/hAm9jx0x8uDUV1zUNCKaqUSH4hzt1p0
         rN9gCnNRsDgItfj7rs7/aHQvp7m4nT3p7bIJ3YvHwpGpGDJgBpbxcGjYtu1jFbRICPHc
         DV2R0fEicsDIJfQrBL57qdl+3uJ9u7DjebiqGSIl5PZLhEr3LujO6QE63N+pQh9NqVXo
         SnZNLpyLIa423MT1NbXgQ9jR/v4dttdQJKnh53vAaJKGR7Id07yFaS7pM8hmZzvkB9Mx
         zeV3mQxGziBYMqETfztiSTfF8Cyr3dDasRAtzR4atBINHRLBuTh50y6dIVT7pXOH9SSM
         yg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688080223; x=1690672223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1fWEnH0sdbyAOEH6UFoh83BPgBAF+lwm2DoFeYlQSk=;
        b=hCbdYRW6yoxgyjBLx504SEqiAZgXgRM0aKUEEJiTwvnwbMHdAxxf/10TFbaEHS+5wy
         fnutEhkJwnpyemF8EDWznqQ51Lvykw5ar8Txc2cbCyNO3Mcxw6dOyCkDZQLY438RbTkP
         6lsUQKRDnDPfbJFY5NbgVe5yU9xW+dN+2ijWN6a73yTiAMi25kmcD9NF3tFfWt9evArr
         mnSjWILc7XuSwhOgki/NC0bJ5vkN3pk82w3nE9udbqv13Ptmxu90JvIfPaU7YTBHn0j3
         +AEZ4xMDrJsgu6Ps4czRQbna5GzaWUxqFOX1qbGgem/sStVJpMdsKgNYsLUPKMrapGbx
         5pmA==
X-Gm-Message-State: ABy/qLbwYOHgees8V/XUOo5V801SJqdKRFBnolWFOOH6oCd79xF1hWn4
	k+HAqcmwLuOHIT5BEi9BFWXJdIPvxlGbxLyLhrxPzA==
X-Google-Smtp-Source: APBJJlGPLoLbN3j/MYaWDb+BS3m3rP3at/zt6fvbleRSvozMEhN8Jx0lax5nME4zrea3unZFbnd7KR+3GW/NDralX8c=
X-Received: by 2002:a05:6512:314b:b0:4fb:92a9:cbe8 with SMTP id
 s11-20020a056512314b00b004fb92a9cbe8mr845289lfi.18.1688080222801; Thu, 29 Jun
 2023 16:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <20230623222016.3742145-2-evan@rivosinc.com>
 <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com> <CALs-HssZG8daTJaRK8JPT0VRk=23CtO6B_5kq4Xa_DdLELjaZw@mail.gmail.com>
 <53dc6959cc8849d6b66676ad48c1376a@AcuMS.aculab.com>
In-Reply-To: <53dc6959cc8849d6b66676ad48c1376a@AcuMS.aculab.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 29 Jun 2023 16:09:46 -0700
Message-ID: <CALs-HstgcnK=prSHm9D7bqWc05q52ObA5kozmxzr-euR=CFfKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Probe for unaligned access speed
To: David Laight <David.Laight@aculab.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Anup Patel <apatel@ventanamicro.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161034_182626_E746E14D 
X-CRM114-Status: GOOD (  27.34  )
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

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgNTowNeKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRXZhbiBHcmVlbgo+ID4gU2VudDogMjcg
SnVuZSAyMDIzIDIwOjEyCj4gPgo+ID4gT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMjo0MuKAr1BN
IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9u
IDIzIEp1biAyMDIzLCBhdCAyMzoyMCwgRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+IHdy
b3RlOgo+ID4gPiA+Cj4gPiA+ID4gUmF0aGVyIHRoYW4gZGVmZXJyaW5nIG1pc2FsaWduZWQgYWNj
ZXNzIHNwZWVkIGRldGVybWluYXRpb25zIHRvIGEgdmVuZG9yCj4gPiA+ID4gZnVuY3Rpb24sIGxl
dCdzIHByb2JlIHRoZW0gYW5kIGZpbmQgb3V0IGhvdyBmYXN0IHRoZXkgYXJlLiBJZiB3ZQo+ID4g
PiA+IGRldGVybWluZSB0aGF0IGEgbWlzYWxpZ25lZCB3b3JkIGFjY2VzcyBpcyBmYXN0ZXIgdGhh
biBOIGJ5dGUgYWNjZXNzZXMsCj4gPiA+ID4gbWFyayB0aGUgaGFyZHdhcmUncyBtaXNhbGlnbmVk
IGFjY2VzcyBhcyAiZmFzdCIuCj4gPiA+Cj4gPiA+IEhvdyBzdXJlIGFyZSB5b3UgdGhhdCB5b3Vy
IG1lYXN1cmVtZW50cyBjYW4gYmUgZXh0cmFwb2xhdGVkIGFuZCBhcmVu4oCZdAo+ID4gPiBhbiBh
cnRlZmFjdCBvZiB0aGUgdGVzdGluZyBwcm9jZXNzPyBGb3IgZXhhbXBsZSwgb2ZmIHRoZSB0b3Ag
b2YgbXkgaGVhZDoKPiA+ID4KPiA+ID4gKiBUaGUgZmlyc3QgcnVuIHdpbGwgcG90ZW50aWFsbHkg
YmUgcGVuYWxpc2VkIGJ5IGRhdGEgY2FjaGUgbWlzc2VzLAo+ID4gPiAgIHVudHJhaW5lZCBwcmVm
ZXRjaGVycywgVExCIG1pc3NlcywgYnJhbmNoIHByZWRpY3RvcnMsIGV0Yy4gY29tcGFyZWQKPiA+
ID4gICB3aXRoIGxhdGVyIHJ1bnMuIFlvdSBoYXZlIG9uZSB3YXJtdXAsIGJ1dCB3aG8ga25vd3Mg
aG93IG1hbnkKPiA+ID4gICBpdGVyYXRpb25zIGl0IHdpbGwgdGFrZSB0byBjb252ZXJnZT8KPiA+
Cj4gPiBJJ2QgZXhwZWN0IHRoZSBjYWNoZSBwZW5hbHRpZXMgdG8gYmUgcmVhc29uYWJseSBjb3Zl
cmVkIGJ5IGEgc2luZ2xlCj4gPiB3YXJtdXAuIFlvdSdyZSByaWdodCBhYm91dCBicmFuY2ggcHJl
ZGljdGlvbiwgd2hpY2ggaXMgd2h5IEkgdHJpZWQgdG8KPiA+IHVzZSBhIGxhcmdlLWlzaCBidWZm
ZXIgc2l6ZSwgbWluaW1pemUgdGhlIHJhdGlvIG9mIGNvbmRpdGlvbmFscyB0bwo+ID4gbG9hZHMv
c3RvcmVzLCBhbmQgZG8gdGhlIHRlc3QgZm9yIGEgZGVjZW50IG51bWJlciBvZiBpdGVyYXRpb25z
IChvbiBteQo+ID4gVEhlYWQsIGFib3V0IDE4MDAgYW5kIDQwMCBmb3Igd29yZHMgYW5kIGJ5dGVz
KS4KPiA+Cj4gPiBXaGVuIEkgcmFuIHRoZSB0ZXN0IGEgaGFuZGZ1bCBvZiB0aW1lcywgSSBkaWQg
c2VlIHZhcmlhdGlvbiBvbiB0aGUKPiA+IG9yZGVyIG9mIH41JS4gQnV0IHRoZSBjb21wYXJpc29u
IG9mIHRoZSB0d28gbnVtYmVycyBkb2Vzbid0IHNlZW0gdG8gYmUKPiA+IGFueXdoZXJlIG5lYXIg
dGhhdCBtYXJnaW4gKFRIZWFkIEM5MDYgd2FzIH40eCBmYXN0ZXIgZG9pbmcgbWlzYWxpZ25lZAo+
ID4gd29yZCBhY2Nlc3Nlcywgb3RoZXJzIHdpdGggc2xvdyBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFs
c28gcmVwb3J0aW5nCj4gPiBudW1iZXJzIG5vdCBhbnl3aGVyZSBjbG9zZSB0byBlYWNoIG90aGVy
KS4KPgo+IElzbid0IHRoZSBFTVVMQVRFRCBjYXNlIHNvIG11Y2ggc2xvd2VyIHRoYW4gYW55dGhp
bmcgZWxzZSB0aGF0Cj4gaXQgaXMgZXZlbiBwcmV0dHkgb2J2aW91cyBmcm9tIGEgc2luZ2xlIGFj
Y2Vzcz8KPiAoUG9zc2libHkgdGhlIDJuZCBhY2Nlc3MgdG8gYXZvaWQgJ2NvbGQgY2FjaGUnLikK
Pgo+IE9uZSBvZiB0aGUgdGhpbmdzIHRoYXQgY2FuIHBlcnR1cmIgbWVhc3VyZW1lbnRzIGlzIGhh
cmR3YXJlCj4gaW50ZXJydXB0cy4gVGhhdCBjYW4gYmUgbWl0aWdhdGVkIGJ5IGNvdW50aW5nIGNs
b2NrcyBmb3IgYSBmZXcKPiAoMTAgaXMgcGxlbnR5KSBpdGVyYXRpb25zIG9mIGEgc2hvcnQgcmVx
dWVzdCBhbmQgdGFraW5nIHRoZQo+IGZhc3Rlc3QgdmFsdWUuCj4gRm9yIHNob3J0IGhvdC1jYWNo
ZSBjb2RlIHNlcXVlbmNlcyB5b3UgY2FuIGFjdHVhbGx5IGNvbXBhcmUgdGhlCj4gYWN0dWFsIGNs
b2NrIGNvdW50cyB3aXRoIHRoZW9yZXRpY2FsIG1pbmltdW0gdmFsdWVzLgoKWWVhaCwgb25lIHRo
aW5nIEkgY291bGQgZG8gaXMgZGlzYWJsZSBpbnRlcnJ1cHRzLCBtZWFzdXJlIHRoZSBjeWNsZQpj
b3VudCBvZiBkb2luZyBhbiBpbmRpdmlkdWFsIGl0ZXJhdGlvbiwgZG8gdGhpcyBOIHRpbWVzLCBh
bmQgdGFrZSB0aGUKbWluaW11bSB2YWx1ZSBhcyB0aGUgdGltZSB0byBjb21wYXJlLiBJbiB0aGUg
ZW5kIEknbGwgdGhlbiBoYXZlIHR3bwpudW1iZXJzIHRvIGNvbXBhcmUsIGxpa2UgSSBkbyBpbiB0
aGlzIHBhdGNoLiBJbiB0aGVvcnkgdGhlIHZhcmlhbmNlIG9uCnRoYXQgc2hvdWxkIGJlIHJlYWxs
eSB0aWdodC4gTiB3aWxsIGhhdmUgdG8gZGVwZW5kIG9uIHRoZSBvdmVyYWxsCmFtb3VudCBvZiB0
aW1lIEknbSB0YWtpbmcgc28gYXMgbm90IHRvIHNodXQgaW50ZXJydXB0cyBvZmYgZm9yIHZlcnkK
bG9uZy4gTGV0IG1lIGV4cGVyaW1lbnQgd2l0aCB0aGlzIGFuZCBzZWUgaG93IHRoZSByZXN1bHRz
IGxvb2suCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
