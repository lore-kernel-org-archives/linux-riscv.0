Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967FDC83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGK1vp/7qaS4P+VoFPThOBl8vXBBJLmv1t+kXP6Ngf4=; b=w6G1jDJf04X1hD
	RHa4Rogd4A00fl1+ceFGuzq9ry7aXpqa/lq6Sm8M8FCGD0fs+lsUu7Ze1pTH2Y0gEt0iE57l239kC
	WPwqkAWeBFwIdQZHWJxUewEkjQGC+fcR5bGMq+paZtjGta99GD9YQvTCzJZaKTd8RvRRqsvRgYEzr
	S4LSYZTFejaIPs3QdEjZHLXmFP8ieY+XYfnbcZ5HhJ73Cd5eWh65VibGoDmzH7r/m/j4qrEy98Ou5
	92c/8Sa6KM23M2bUwa+FsOoxWqmag9zbyKzXqu4nRq2h+tqYtgrcra988y6dfx0FxWVKX/gRuLlUv
	xmROlbTyg6+Jb1m1fXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2OV-00ByMd-0R;
	Tue, 29 Aug 2023 17:20:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2OR-00ByIn-1R
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 17:20:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so7418354e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693329640; x=1693934440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20Pmn3uR2c8KDzA5Z4/HQP8CRUu7dujiiXH5BmDnN6E=;
        b=kSDB2WQGUmyFMb01R+p1eOHpA23cK87y235AXbcJfL9G9KFKNf2dIv9ncfHs0rcOmp
         E6uOM3JtZeXY9UukSnhiPvf++gWg6uiXz9RA9Y5ivbckZgSO8etk1R0HhBGZdBhFzNN1
         m+uCPSFl2R9hFaky5j8T9urC+Fb/JcUaHUzR1levW/KcgOyIP+KQ7MkMdeyRiX8hfhU5
         s2ubteSKWoR35PveRgN4UhNXU6ynaq1Nak16x/lljn813szYXM/M6YnI5lryzFKk/5Rc
         5B2KzUWlhtfDA4tbDPChElGbp9jOnhDsYi0b2Bn3JyhsbmE4m+8hJAZwdUjnf0KUCEw9
         Hprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329640; x=1693934440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20Pmn3uR2c8KDzA5Z4/HQP8CRUu7dujiiXH5BmDnN6E=;
        b=BtgRTh4zaQLzIWYZvNmVv4WfXRLFjdJU/8pn0/EhhLBjtJ1Jc9yJq4uky74KxqFxjA
         7+VkXpWXRNvgVXF9TrAQwbx10pX5+RmfcvPKGuvOj1vdNMNPEL1XylnrbvW/yHI5wIJe
         PrlydmlZki/2u/AwHp12ZfUJH8j+LAb0ZANx2hqudAS76csIWiKiEEe9guT25pYeXYkU
         yfnoQqQtipqiiRt/ZCBfkbu4dUL25mGl7QbH6icjk4YDHD/Rtqq151oGkAxxP5sAMEKZ
         0SZNmNzQfCuBIoOpW7BhMAgZZO+rRsoFSUMPi7OyFqtlUjflyDGOtcSDUgh2z63Bmv1h
         OLcg==
X-Gm-Message-State: AOJu0YyqGh+c3J85+6857/HrSbnlqtzZYZl0agqG2bciQ5E/SnqOYEAZ
	VytdmNyRdd2Bj3VbAMwsJdDswEZ7daefN0BeYq1ckg==
X-Google-Smtp-Source: AGHT+IEunguX+29lak9JYuQDp7TQRMvKgwEELQCu8RZRIZrqwbU75qRAqqSDSt/V+9PbVFdflUEqh665Cgkf2rSCUYI=
X-Received: by 2002:a05:6512:7c:b0:500:aed0:cb1b with SMTP id
 i28-20020a056512007c00b00500aed0cb1bmr6295408lfo.24.1693329640476; Tue, 29
 Aug 2023 10:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201831.2695097-1-evan@rivosinc.com> <20230829-e445d0bdff78969cc33a6263@orel>
In-Reply-To: <20230829-e445d0bdff78969cc33a6263@orel>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 29 Aug 2023 10:20:04 -0700
Message-ID: <CALs-HsuTySr0ZojRtBeU3F6hd82UeNWNupaQpEULVqxf2jqzww@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_102043_684151_34E196DA 
X-CRM114-Status: GOOD (  37.24  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMTo0OOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gSGkgRXZhbiwKPgo+IEhlcmUncyBteSBzdGFiIGF0
IG5ldyB3b3JkaW5nLgo+Cj4gT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMDE6MTg6MzBQTSAtMDcw
MCwgRXZhbiBHcmVlbiB3cm90ZToKPiAuLi4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3Jpc2N2L3VhYmkucnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi91YWJpLnJzdAo+ID4gaW5kZXgg
ODk2MGZhYzQyYzQwLi5hZmRkYTU4MGU1YTIgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3Jpc2N2L3VhYmkucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3VhYmkucnN0Cj4g
PiBAQCAtNDIsNiArNDIsMTYgQEAgQW4gZXhhbXBsZSBzdHJpbmcgZm9sbG93aW5nIHRoZSBvcmRl
ciBpczo6Cj4gPgo+ID4gICAgIHJ2NjRpbWFkY196aWZvb196aWdvb196YWZvb19zYmFyX3NjYXJf
enhtYmF6X3hxdXhfeHJ1eAo+ID4KPiA+ICsiaXNhIiB2cyAiaGFydCBpc2EiIGxpbmVzIGluIC9w
cm9jL2NwdWluZm8KPiA+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+ICsKPiA+ICtUaGUgImlzYSIgbGluZSBpbiAvcHJvYy9jcHVpbmZvIGRlc2NyaWJlcyB0
aGUgbG93ZXN0IGNvbW1vbiBkZW5vbWluYXRvciBvZgo+ID4gK1JJU0MtViBJU0EgZXh0ZW5zaW9u
cyB1bmRlcnN0b29kIGJ5IHRoZSBrZXJuZWwgYW5kIGltcGxlbWVudGVkIG9uIGFsbCBoYXJ0cy4g
VGhlCj4gPiArImhhcnQgaXNhIiBsaW5lLCBpbiBjb250cmFzdCwgZGVzY3JpYmVzIHRoZSBzZXQg
b2YgZXh0ZW5zaW9ucyB1bmRlcnN0b29kIGJ5IHRoZQo+ID4gK2tlcm5lbCBvbiB0aGUgcGFydGlj
dWxhciBoYXJ0IGJlaW5nIGRlc2NyaWJlZCwgZXZlbiBpZiB0aG9zZSBleHRlbnNpb25zIG1heSBu
b3QKPiA+ICtiZSBwcmVzZW50IG9uIGFsbCBoYXJ0cyBpbiB0aGUgc3lzdGVtLiBUaGUgImhhcnQg
aXNhIiBsaW5lIGlzIGNvbnNpc3RlbnQgd2l0aAo+ID4gK3doYXQncyByZXR1cm5lZCBieSBfX3Jp
c2N2X2h3cHJvYmUoKSB3aGVuIHF1ZXJ5aW5nIGZvciB0aGF0IHNwZWNpZmljIENQVS4KPiA+ICsK
Pgo+IFRoZSAiaXNhIiBhbmQgImhhcnQgaXNhIiBsaW5lcyBpbiAvcHJvYy9jcHVpbmZvIGxpc3Qg
UklTQy1WIElTQSBleHRlbnNpb25zCj4gd2hpY2ggdGhlIGtlcm5lbCBjYW4gaWRlbnRpZnkgKHRo
ZSBrZXJuZWwgcmVjb2duaXplcyB0aGUgZXh0ZW5zaW9uJ3MgbmFtZSkKPiBhbmQgaGF2ZSBub3Qg
YmVlbiBmaWx0ZXJlZCBvdXQgZHVlIHRvIGVmZmVjdGl2ZWx5IG5vdCBiZWluZyBwcmVzZW50LiAg
QW4KPiBleHRlbnNpb24gaXMgZWZmZWN0aXZlbHkgbm90IHByZXNlbnQgd2hlbiBpdCBpcyB1bnVz
YWJsZSwgZWl0aGVyIGR1ZSB0bwo+IGRlZmVjdHMgKHdoaWNoIHRoZSBrZXJuZWwgaXMgYXdhcmUg
b2YpLCBkdWUgdG8gbWlzc2luZyBpbmZvcm1hdGlvbiB3aGljaAo+IGlzIG5lY2Vzc2FyeSB0byBj
b21wbGV0ZSB0aGUgZXh0ZW5zaW9uJ3MgZGVzY3JpcHRpb24sIG9yIGR1ZSB0byBiZWluZwo+IGV4
cGxpY2l0bHkgImhpZGRlbiIsIHN1Y2ggYXMgd2hlbiBhIGtlcm5lbCBjb21tYW5kIGxpbmUgcGFy
YW1ldGVyCj4gaW5zdHJ1Y3RzIHRoZSBrZXJuZWwgdG8gcHJldGVuZCB0aGUgZXh0ZW5zaW9uIGlz
IG5vdCBwcmVzZW50LiAgTm90ZSwgYW4KPiBleHRlbnNpb24ncyBwcmVzZW5jZSBpbiBhIGxpc3Qg
ZG9lcyBub3QgaW1wbHkgdGhlIGtlcm5lbCBpcyB1c2luZyB0aGUKPiBleHRlbnNpb24sIG5vciBk
b2VzIGl0IGltcGx5IHRoYXQgdXNlcnNwYWNlIG9yIGd1ZXN0IGtlcm5lbHMgbWF5IHVzZSB0aGUK
PiBleHRlbnNpb24gKF9fcmlzY3ZfaHdwcm9iZSgpIHNob3VsZCBiZSBxdWVyaWVkIGZvciB1c2Vy
c3BhY2UgdXNhYmlsaXR5Lgo+IFRoZSBoeXBlcnZpc29yIHNob3VsZCBiZSBxdWVyaWVkLCB1c2lu
ZyBoeXBlcnZpc29yLXNwZWNpZmljIEFQSXMsIHRvCj4gY2hlY2sgZ3Vlc3Qga2VybmVsIHVzYWJp
bGl0eS4pCj4KPiBUaGUgImlzYSIgbGluZSBkZXNjcmliZXMgdGhlIGxvd2VzdCBjb21tb24gZGVu
b21pbmF0b3Igb2YgZXh0ZW5zaW9ucywKPiB3aGljaCBhcmUgdGhlIGV4dGVuc2lvbnMgaW1wbGVt
ZW50ZWQgb24gYWxsIGhhcnRzLiAgSW4gY29udHJhc3QsIHRoZQo+IGV4dGVuc2lvbnMgbGlzdGVk
IGluIHRoZSAiaGFydCBpc2EiIGxpbmUgbmVlZCBub3QgYmUgaW1wbGVtZW50ZWQgYnkKPiBhbnkg
b3RoZXIgaGFydCB0aGFuIHRoZSBoYXJ0IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGxpbmUuCj4KPiAt
LS0KPgo+IEkndmUgc3BlY2lmaWNhbGx5IGRyb3BwZWQgdGhlICdUaGUgImhhcnQgaXNhIiBsaW5l
IGlzIGNvbnNpc3RlbnQgd2l0aAo+IHdoYXQncyByZXR1cm5lZCBieSBfX3Jpc2N2X2h3cHJvYmUo
KS4uLicgcGFydCBiZWNhdXNlIEkgc3VzcGVjdCBod3Byb2JlCj4gY291bGQgYXQgbGVhc3QgbGFn
IHdoYXQgZ2V0cyBwdXQgaW4gImhhcnQgaXNhIiwgc2luY2UgdGhlIGtlcm5lbCBtYXkgYmUKPiB0
YXVnaHQgYWJvdXQgYW4gZXh0ZW5zaW9uIGZvciBhIGRpZmZlcmVudCBwdXJwb3NlIGZpcnN0LCBu
ZWdsZWN0aW5nCj4gaHdwcm9iZS4gQW5kLCB0aGVyZSBtYXkgYmUgY2FzZXMgdGhhdCBod3Byb2Jl
IG5ldmVyIGVudW1lcmF0ZXMgYW4KPiBleHRlbnNpb24gd2hpY2ggdGhlIGtlcm5lbCBkb2VzLgoK
VGhhbmtzIGZvciB0aGlzLiBNeSB2NSBoYWQgYWxzbyBkcm9wcGVkIHRoZSBod3Byb2JlIHBhcnQu
IEEgZmV3IHRob3VnaHRzOgoKICogSXQgc2VlbXMgbGlrZSB5b3Ugd2FudCB0byBtYWtlIHN1cmUg
d2UgY2FsbCBvdXQgdGhlIGZhY3QgdGhhdCB0aGUKa2VybmVsIG1heSB0cmltIG91dCwgZm9yIHZh
cmlvdXMgcmVhc29ucywgSVNBIGV4dGVuc2lvbnMgdGhhdCB0aGUKaGFyZHdhcmUgZG9lcyBpbiBm
YWN0IHN1cHBvcnQuIFRoaXMgc2VlbXMgcmVhc29uYWJsZSwgYnV0IEkgZG9uJ3QKdGhpbmsgd2Ug
bmVlZCB0byBlbnVtZXJhdGUgdGhlIGNvbXBsZXRlIGxpc3Qgb2YgIndoeSIgdGhpcyBtaWdodApo
YXBwZW4sIGFzIHRoYXQgbGlzdCBpcyBsaWtlbHkgdG8gZ28gc3RhbGUuCiAqIFRoZSAia2VybmVs
IGlzIHVzaW5nIHRoZSBleHRlbnNpb24iIHBhcnQgaXMgYSBzbGlnaHRseSBjb25mdXNpbmcKcGVy
c3BlY3RpdmUgaW4gdGhpcyBjb250ZXh0LCBhcyBpdCBzb3J0IG9mIGltcGxpZXMgdGhlIGtlcm5l
bCBoYXMgaXRzCm93biBhZ2VuZGEgOikuIEknZCBleHBlY3QgdXNlcnMgbG9va2luZyBhdCAvcHJv
Yy9jcHVpbmZvIGFyZSBtb3N0bHkKdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBleHRlbnNpb25z
IHRoZXkgdGhlbXNlbHZlcyBjYW4gdXNlLCBhbmQgdGhlCmtlcm5lbCdzIGJlaGF2aW9yIGZhY3Rv
cnMgaW4gb25seSBpbnNvZmFyIGFzIGl0J3MgcmVxdWlyZWQgdG8gc3VwcG9ydAp0aGUgdXNlciBp
biB1c2luZyBhIGZlYXR1cmUuIE1vc3RseSBJIGd1ZXNzIHRoaXMgaXMgYSBwaHJhc2luZyBuaXQu
CiAqIFRoZSBicmluZ2luZyB1cCBvZiBndWVzdCBrZXJuZWxzIGFsc28gc2VlbXMgY29uZnVzaW5n
IHRvIG1lIGluIHRoZQpjb250ZXh0IG9mIC9wcm9jL2NwdWluZm8uIEknZCBleHBlY3QgZGlzY3Vz
c2lvbnMgb24gaG93IGhvc3QgSVNBCmV4dGVuc2lvbnMgZmlsdGVyIGludG8gZ3Vlc3QgT1NlcyB0
byBiZSBpbiBhIGh5cGVydmlzb3Itc3BlY2lmYwpkb2N1bWVudCwgb3IgYXQgbGVhc3QgYSBzZWN0
aW9uIGRlZGljYXRlZCB0byB2aXJ0dWFsaXphdGlvbi4KICogSSBoZXNpdGF0ZWQgaW4gYWRkaW5n
IHByZXNjcmlwdGl2ZSBndWlkYW5jZSBvbiB3aGF0IHVzZXJzIHNob3VsZApkbywgYXMgSSB0aGlu
ayB0aGlzIHNlY3Rpb24gd2lsbCBob2xkIHVwIGJldHRlciBvdmVyIHRpbWUgaWYgaXQganVzdApk
ZXNjcmliZXMgY3VycmVudCBjaGFyYWN0ZXJpc3RpY3MsIHJhdGhlciB0aGFuIGF0dGVtcHRpbmcg
dG8gcHJlc2NyaWJlCmJlaGF2aW9yLiBJZiB3ZSB3YW50IGEgcHJlc2NyaXB0aXZlIGRvY3VtZW50
YXRpb24gb24gInVzZSB0aGlzIGZvcgp0aGF0IiwgdGhhdCBzaG91bGQgcHJvYmFibHkgYmUgaXRz
IG93biBzZWN0aW9uCgpJZiBJIHRyeSB0byBmb2xkIHRoZSBnaXN0IG9mIHdoYXQgeW91IHdyb3Rl
IGludG8gdjUsIEkgZ2V0IHNvbWV0aGluZwpsaWtlIHRoaXMgKGFsc28gd2l0aCBhIHZlcnkgc2xp
Z2h0IHNlY3Rpb24gaGVhZGluZyBjaGFuZ2UpLiBMZXQgbWUKa25vdyB3aGF0IHlvdSB0aGluazoK
CiJpc2EiIGFuZCAiaGFydCBpc2EiIGxpbmVzIGluIC9wcm9jL2NwdWluZm8KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpUaGUgImlzYSIgbGluZSBpbiAvcHJvYy9j
cHVpbmZvIGRlc2NyaWJlcyB0aGUgbG93ZXN0IGNvbW1vbiBkZW5vbWluYXRvciBvZgpSSVNDLVYg
SVNBIGV4dGVuc2lvbnMgcmVjb2duaXplZCBieSB0aGUga2VybmVsIGFuZCBpbXBsZW1lbnRlZCBv
biBhbGwgaGFydHMuIFRoZQoiaGFydCBpc2EiIGxpbmUsIGluIGNvbnRyYXN0LCBkZXNjcmliZXMg
dGhlIHNldCBvZiBleHRlbnNpb25zIHJlY29nbml6ZWQgYnkgdGhlCmtlcm5lbCBvbiB0aGUgcGFy
dGljdWxhciBoYXJ0IGJlaW5nIGRlc2NyaWJlZCwgZXZlbiBpZiB0aG9zZSBleHRlbnNpb25zIG1h
eSBub3QKYmUgcHJlc2VudCBvbiBhbGwgaGFydHMgaW4gdGhlIHN5c3RlbS4KCkluIGJvdGggbGlu
ZXMsIHRoZSBwcmVzZW5jZSBvZiBhbiBleHRlbnNpb24gZ3VhcmFudGVlcyBvbmx5IHRoYXQgdGhl
CmhhcmR3YXJlIGhhcyB0aGUgZGVzY3JpYmVkIGNhcGFiaWxpdHkuCkFkZGl0aW9uYWwga2VybmVs
IHN1cHBvcnQgb3IgcG9saWN5IGNoYW5nZXMgbWF5IGJlIHJlcXVpcmVkIGJlZm9yZSBhbgpleHRl
bnNpb24ncyBjYXBhYmlsaXR5IGlzIGZ1bGx5IHVzYWJsZSBieSB1c2Vyc3BhY2UgcHJvZ3JhbXMu
CgpJbnZlcnNlbHksIHRoZSBhYnNlbmNlIG9mIGFuIGV4dGVuc2lvbiBpbiB0aGVzZSBsaW5lcyBk
b2VzIG5vdApuZWNlc3NhcmlseSBtZWFuIHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBzdXBwb3J0IHRo
YXQgZmVhdHVyZS4gVGhlCnJ1bm5pbmcga2VybmVsIG1heSBub3QgcmVjb2duaXplIHRoZSBleHRl
bnNpb24sIG9yIG1heSBoYXZlCmRlbGliZXJhdGVseSBkaXNhYmxlZCBhY2Nlc3MgdG8gaXQuCgot
RXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
