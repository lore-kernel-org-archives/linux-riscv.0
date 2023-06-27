Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EF9EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njrZzt6LTqCsU7zTrQV4MwF9smY/WaOiRfB0dyEfV94=; b=yi6qNVjHxkHLHZ
	3NhJ6G0KUqghrat+TsTtSyzEstfmzUDEsp/AyUCSKR5xbYGGTRyRmMg6HKy6pr769kl/c2QcLpHKq
	rGn07h1n8zQ4Zv763b/NmSZL8+YRKJ2NfHDIt4dqj7wd+gZDtnNXuwDLJx99xSU4Bb37FenS3sZ8I
	p49CxBcni6D2K5nAiQ3XEhLiBvyvPJkBu5h3Dmxpt+y0HPcBE6vJFQEOHjE/99rcthMA57yhkGH4G
	Y9nfsCWOU9e0UmfIegLR6c7u9obc4jGLJBN5Y2jwqC4ko7q4e6UF7Uux3gjfTHThOfYsxHD/JLlmT
	H9SZRoyq1yWqTZawEY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEE6x-00DupI-02;
	Tue, 27 Jun 2023 19:12:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEE6u-00DunA-0w
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 19:12:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f957a45b10so6692066e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 12:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687893137; x=1690485137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWPaWm/SbxNmO7KGYVPvx1QzoejjqxszCBE87FaJ0SI=;
        b=noqsKYKSyfXlrIAQfs8JJESxdmLsycA+cJDXOWLGOWTw7dpsRxk5p+iuPyy1WJmAzc
         ABpuTdx2zQlB2EF538pu0Ppg/oJw3ZuQVH0Dg9hcOxO/li/+pzkJxuoyS1CIArTczBh2
         +8aWbRPzQNctdM9avQQxMRalsFlx0FMpQ7Z0Xo5DKOolWZlOrx/iig53JK84eSElLpIQ
         BEpTrwFXr1SrEfhEGuwJFELTbMOfQhGk3/hlJn8tg37iHRBaDpBjCW9LatIDbVFnv0jT
         ZEExPdaY0T8VRwEosMBjjTYLCiJKPjdoG3xBkVRFwle9jAxFy6vKSht6vzikRWN1fqnN
         T3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893137; x=1690485137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWPaWm/SbxNmO7KGYVPvx1QzoejjqxszCBE87FaJ0SI=;
        b=WmP+wCE7L9NM+k/k3PBtWvd3n6p3vNH0Jt6RZkv2j2/TB67Zt8hILU7aF3+By5YYj1
         Sp7NO8osm5GTOMgaSEhuENenQ3DvvAoGIab42dwo+sP0LATQC5lyQGx7F4XdeIz88t+K
         HMfvKNj4ffju9HKrNHYR24LOv6hVl85EUPtcdl+5ARBjqss3A54CHEFKRx2+Pj2gbGLH
         F0odtjjP63mdImDC1C91TwmSKLnGOkMrVnvZeqt1PbSzImggS1Kp5Cn0YBTvro/JStkT
         pH9X6x90Zxzo3pZ6qJrFSg1atQqqExKAZRZkm7PT9lF8d0Tn0MSYDQgQl4SK2gyLv1zj
         DMhg==
X-Gm-Message-State: AC+VfDzyfCc5n+S9nwcraf5JA56T8sXF4WZRigTkn32oPET2KL5Ig9lJ
	7yTjmGmRgomLY9ex0rQIj8HOXgHD/QEv8ueifOqaXw==
X-Google-Smtp-Source: ACHHUZ4L9AyGvHHgp1jvCv/pE7ALzx3atTvABCYDswQdNfcJmeP6c+6leOw9ULkc5e2G7l1YkS7Kgyk1Nvp7wralsQc=
X-Received: by 2002:a05:6512:32cb:b0:4fa:f1da:e6b9 with SMTP id
 f11-20020a05651232cb00b004faf1dae6b9mr5929372lfg.42.1687893136983; Tue, 27
 Jun 2023 12:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <20230623222016.3742145-2-evan@rivosinc.com>
 <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com>
In-Reply-To: <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 27 Jun 2023 12:11:40 -0700
Message-ID: <CALs-HssZG8daTJaRK8JPT0VRk=23CtO6B_5kq4Xa_DdLELjaZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Probe for unaligned access speed
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-doc@vger.kernel.org, 
	Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, 
	Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_121220_326607_35155430 
X-CRM114-Status: GOOD (  19.98  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMjo0MuKAr1BNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMyBKdW4gMjAyMywgYXQgMjM6MjAsIEV2YW4gR3Jl
ZW4gPGV2YW5Acml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBSYXRoZXIgdGhhbiBkZWZlcnJp
bmcgbWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgZGV0ZXJtaW5hdGlvbnMgdG8gYSB2ZW5kb3IKPiA+
IGZ1bmN0aW9uLCBsZXQncyBwcm9iZSB0aGVtIGFuZCBmaW5kIG91dCBob3cgZmFzdCB0aGV5IGFy
ZS4gSWYgd2UKPiA+IGRldGVybWluZSB0aGF0IGEgbWlzYWxpZ25lZCB3b3JkIGFjY2VzcyBpcyBm
YXN0ZXIgdGhhbiBOIGJ5dGUgYWNjZXNzZXMsCj4gPiBtYXJrIHRoZSBoYXJkd2FyZSdzIG1pc2Fs
aWduZWQgYWNjZXNzIGFzICJmYXN0Ii4KPgo+IEhvdyBzdXJlIGFyZSB5b3UgdGhhdCB5b3VyIG1l
YXN1cmVtZW50cyBjYW4gYmUgZXh0cmFwb2xhdGVkIGFuZCBhcmVu4oCZdAo+IGFuIGFydGVmYWN0
IG9mIHRoZSB0ZXN0aW5nIHByb2Nlc3M/IEZvciBleGFtcGxlLCBvZmYgdGhlIHRvcCBvZiBteSBo
ZWFkOgo+Cj4gKiBUaGUgZmlyc3QgcnVuIHdpbGwgcG90ZW50aWFsbHkgYmUgcGVuYWxpc2VkIGJ5
IGRhdGEgY2FjaGUgbWlzc2VzLAo+ICAgdW50cmFpbmVkIHByZWZldGNoZXJzLCBUTEIgbWlzc2Vz
LCBicmFuY2ggcHJlZGljdG9ycywgZXRjLiBjb21wYXJlZAo+ICAgd2l0aCBsYXRlciBydW5zLiBZ
b3UgaGF2ZSBvbmUgd2FybXVwLCBidXQgd2hvIGtub3dzIGhvdyBtYW55Cj4gICBpdGVyYXRpb25z
IGl0IHdpbGwgdGFrZSB0byBjb252ZXJnZT8KCkknZCBleHBlY3QgdGhlIGNhY2hlIHBlbmFsdGll
cyB0byBiZSByZWFzb25hYmx5IGNvdmVyZWQgYnkgYSBzaW5nbGUKd2FybXVwLiBZb3UncmUgcmln
aHQgYWJvdXQgYnJhbmNoIHByZWRpY3Rpb24sIHdoaWNoIGlzIHdoeSBJIHRyaWVkIHRvCnVzZSBh
IGxhcmdlLWlzaCBidWZmZXIgc2l6ZSwgbWluaW1pemUgdGhlIHJhdGlvIG9mIGNvbmRpdGlvbmFs
cyB0bwpsb2Fkcy9zdG9yZXMsIGFuZCBkbyB0aGUgdGVzdCBmb3IgYSBkZWNlbnQgbnVtYmVyIG9m
IGl0ZXJhdGlvbnMgKG9uIG15ClRIZWFkLCBhYm91dCAxODAwIGFuZCA0MDAgZm9yIHdvcmRzIGFu
ZCBieXRlcykuCgpXaGVuIEkgcmFuIHRoZSB0ZXN0IGEgaGFuZGZ1bCBvZiB0aW1lcywgSSBkaWQg
c2VlIHZhcmlhdGlvbiBvbiB0aGUKb3JkZXIgb2YgfjUlLiBCdXQgdGhlIGNvbXBhcmlzb24gb2Yg
dGhlIHR3byBudW1iZXJzIGRvZXNuJ3Qgc2VlbSB0byBiZQphbnl3aGVyZSBuZWFyIHRoYXQgbWFy
Z2luIChUSGVhZCBDOTA2IHdhcyB+NHggZmFzdGVyIGRvaW5nIG1pc2FsaWduZWQKd29yZCBhY2Nl
c3Nlcywgb3RoZXJzIHdpdGggc2xvdyBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFsc28gcmVwb3J0aW5n
Cm51bWJlcnMgbm90IGFueXdoZXJlIGNsb3NlIHRvIGVhY2ggb3RoZXIpLgoKPgo+ICogVGhlIGNv
ZGUgYmVpbmcgYmVuY2htYXJrZWQgaXNu4oCZdCB0aGUgY29kZSBiZWluZyBydW4sIHNvIGRpZmZl
cmVuY2VzCj4gICBpbiBhY2Nlc3MgcGF0dGVybnMsIGxvb3AgdW5yb2xsaW5nLCBsb29wIGFsaWdu
bWVudCwgZXRjLiBtYXkgY2F1c2UgdGhlCj4gICByZWFsIGNvZGUgdG8gYmVoYXZlIGRpZmZlcmVu
dGx5IChhbmQgcGVyaGFwcyBjaGFuZ2Ugd2hpY2ggaXMgYmV0dGVyKS4KCkknbSBub3QgdHJ5aW5n
IHRvIG1ha2Ugc3RhdGVtZW50cyBhYm91dCBtZW1jcHkgc3BlY2lmaWNhbGx5LCBidXQKKG9ubHkp
IGFib3V0IG1pc2FsaWduZWQgYWNjZXNzZXMsIHdoaWNoIGlzIHdoeSBJIHRyaWVkIHRvIHdyaXRl
IGxvb3BzCnRoYXQgaXNvbGF0ZWQgdGhhdCBlbGVtZW50IGFzIG11Y2ggYXMgcG9zc2libGUuCgo+
Cj4gVGhlIG5vbi1kZXRlcm1pbmlzbSB0aGF0IGNvdWxkIGluIHRoZW9yeSByZXN1bHQgZnJvbSB0
aGlzIGFsc28gc2VlbXMKPiBsaWtlIGEgbm90IGdyZWF0IGlkZWEgdG8gaGF2ZS4KClRoaXMgaXMg
ZmFpciwgaWYgd2UgaGF2ZSBtYWNoaW5lcyB3aGVyZSB0aGlzIHdhZmZsZXMgZnJvbSBib290IHRv
IGJvb3QKdGhhdCdzIG5vdCBncmVhdC4gSW4gdGhlb3J5IGlmIG1pc2FsaWduZWQgd29yZCBhY2Nl
c3NlcyBjb21lIG91dCB0bwpiZWluZyBhbG1vc3QgZXhhY3RseSBlcXVhbCB0byBOIGJ5dGUgYWNj
ZXNzZXMsIHRoZW4gaXQgZG9lc24ndCBtYXR0ZXIKd2hpY2ggeW91IGNob29zZSwgdGhvdWdoIG9m
IGNvdXJzZSBpdCBjb3VsZCBzdGlsbCBtYWtlIGEgZGlmZmVyZW5jZSBpbgpwcmFjdGljZS4gVGhl
IGFsdGVybmF0aXZlIHRob3VnaCBvZiBwcm92aWRpbmcgbm8gaW5mbyBqdXN0IHB1c2hlcyB0aGUK
c2FtZSBwcm9ibGVtIG91dCBpbnRvIHVzZXJzcGFjZSwgd2hpY2ggc2VlbXMgd29yc2UuCi1FdmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
