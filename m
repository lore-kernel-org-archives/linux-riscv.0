Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8157C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV4htYRGqw4kJyLdqoxd2ym74yDnnsu0rkU0KFIlfRI=; b=dWn2MMSPGHAuPA
	iC/vAa5UoPFI+UuUYOWE55mW2bysBTL+nN6SCH8732TGHEjw5J3C9sQ2u+M52KTvqH1dJJjoAchT6
	sKkMcjxB+8E1lDCpEp6Qh+Zz/x2anL6ELx/Fp2wNuBYupZPwLGzFzMmJqVj0pVL7lp6Mac1aAzepS
	a2LmuD/6CUvzp2VkOqpPE3tzJyRktsD3MANRhVd7oNnnIyj8zDVIz2Oh5+OqZokWcjZhlRrV0IstM
	Dhoz4rVWCyHQy/7lsdvga0OVso/ffuwx5FouQVA9+WjU3vfrzs8tPqHddwfA5LViH8Zn7ztMyqpn5
	7LsQqcqbuGtdWiUAEklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaRg-00000006PH2-48CS;
	Fri, 22 Mar 2024 08:40:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaRc-00000006PF8-3T4y
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 08:40:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33e672e10cfso873816f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 01:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711096807; x=1711701607; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUFFnhAGNXnbdfWQT9JuyGDPnjuotEzKYstFvhwog9M=;
        b=OCGSXknEafZ6/j43a+lZTbe4Iou/7vBjrVmhuaU0cQT9zNd6hBZOMp47FPhaQPKMlW
         dDws69xgOLULZA1K/JETxqck8gfe9ysFDKz/O1UeTuvlLOsOQBtpIRiVllO2Q11HVhiT
         ddkCs4MLN3JfjGJFtV/3SLRv5X/XxKO8Qis9xh8d6yliHmUNhxgTdA0jtdKKp0qhEU+B
         15LSUQ0divmoy5DiX/u1MSxJKchIj8d0Bj1+6R8AWkK1Zs+FYvyugR0vh5Gpetc1zHm4
         7B5//FDUGKCuQ57A2ea42rDkw0TzaYrglzpfO1uP9pwyHWMhyeCZQpWXVJZTVGCmO/X1
         e1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711096807; x=1711701607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUFFnhAGNXnbdfWQT9JuyGDPnjuotEzKYstFvhwog9M=;
        b=jPQLNke5DIDMg68TZo4AmDmiXY9FJZ78bDptKOR/OG1Xpx3ponWc3vXo940c4cPcUC
         8RRgsQz9k735Nw2Sj8WxfjNJag5diY1SLiBD7WpCe4VV5zz1P+KGi9wueA02/OfaKt3l
         kcwQL8uzLvIo8ovQcMxGhYs5PehPGEaEDgb3b8pE3Pl7AT0FiMXbClDHjRuS2+2VNs10
         VodK39HDlyUL+QdyGPWSGl1Id4/m7L82uBEbzOvJ9GoHUQmQTvyvsGq19n9r6GdaxlME
         qebeHoLrJAM8vCZlakG1sFFAS5+vcW3afV8hNlLHJ9SprzZadoQO/36SFjEoBCD0giv4
         gk/A==
X-Gm-Message-State: AOJu0YwWSICkZnn2H8bKlIk12MZba5H1z647FF3IWG3gHMFT/oiWubQT
	NP6xVaMYFDLLU1+3fUImch0EYTA8VWjbnYRHXZW8hWQFMecGkNuroYjg7jfy/9Q=
X-Google-Smtp-Source: AGHT+IFQyh+tj+CO31qJrDEQbaGBI5xUznMHhoY7bZy5QpyLFWu/NwQaAASbHGFO6FvlxADc+0z7cQ==
X-Received: by 2002:adf:c983:0:b0:33d:c5b5:5796 with SMTP id f3-20020adfc983000000b0033dc5b55796mr1099944wrh.22.1711096806528;
        Fri, 22 Mar 2024 01:40:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x3-20020adfcc03000000b0033e41e1ad93sm1532149wrh.57.2024.03.22.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:40:06 -0700 (PDT)
Date: Fri, 22 Mar 2024 09:40:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Woodrow Shen <woodrow.shen@sifive.com>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH] RISC-V: selftests: cbo: Use exported __cpu_to_le32()
 with uapi header
Message-ID: <20240322-e0102f3abdfc0a1943da3c31@orel>
References: <20240321115250.801731-1-woodrow.shen@sifive.com>
 <CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk+TWSpyO5xvpXpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk+TWSpyO5xvpXpg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_014008_903078_78456161 
X-CRM114-Status: GOOD (  29.06  )
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

T24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgMDg6MTQ6MzRQTSArMDgwMCwgV29vZHJvdyBTaGVuIHdy
b3RlOgo+IFNob3J0IGJhY2tncm91bmQ6IHdoaWxlIEknbSBidWlsZGluZyB0aGUgcmlzY3YvaHdw
cm9iZSB0ZXN0cywgaXQgc2VlbXMKPiBJIGFsd2F5cyBoaXQgdGhlICJlcnJvcjogaW1wb3NzaWJs
ZSBjb25zdHJhaW50IGluICdhc20nIiBldmVuIHRob3VnaAo+IHRoZSBjb21taXQgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0L2Nv
bW1pdC90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jP2lkPTBkZTY1
Mjg4ZDc1ZmY5NmMzMGUyMTY1NTdkOTc5ZmI5MzQyYzQzMjMKPiBpcyBhcHBsaWVkLiBJJ20gbm90
IHN1cmUgaWYgdGhpcyBvbmx5IGhhcHBlbnMgdG8gbWUgYXMgSSB0cmllZCB0bwo+IGJ1aWxkIHRo
ZW0gb24gYSBjbGVhbiBkZWJpYW4gY2hyb290LiBUbyBhcHBseSB0aGlzIHBhdGNoIG1ha2VzIHRo
ZQo+IGJ1aWxkIGhhcHB5LCBidXQgaWYgdGhlcmUgaXMgbm8gbmVlZCB0byBjaGFuZ2UsIHBsZWFz
ZSBpZ25vcmUgdGhpcwo+IHBhdGNoLgoKSXQgbG9va3MgbGlrZSBJIG1hbmFnZWQgdG8gbWVzcyB1
cCBteSBmaXggdG8gbXkgbWVzcyB1cC4gQ2xlYXJseSBJCnNob3VsZG4ndCBzdGlsbCBoYXZlIGEg
cG90ZW50aWFsIGZ1bmN0aW9uIGNhbGwgaW4gYSBtYWNybyB3aGljaCBJIHdhbnQKdG8gYWx3YXlz
IHJlc29sdmUgdG8gYSBsaXRlcmFsLiBJbnN0ZWFkIG9mIHVzaW5nIGNwdV90b19sZTMyIEkgc2hv
dWxkCnVzZSBzb21ldGhpbmcgdGhhdCByZXN1bHRzIGluIF9fX2NvbnN0YW50X3N3YWIzMiwgbGlr
ZSB5b3VyIHN1Z2dlc3Rpb24Kb2YgX19jcHVfdG9fbGUzMi4gSSdtIG5vdCBzdXJlIHdlIHdhbnQg
dG8gZGVwZW5kIG9uIExpbnV4IFVBUEkgdGhhdCBpc24ndAppbiB0aGUgdG9vbHMgZGlyZWN0b3J5
IHRob3VnaCwgc28gbWF5YmUgd2Ugc2hvdWxkIGp1c3QgcmVwcm9kdWNlIGl0IGhlcmUuClNvbWV0
aGluZyBsaWtlCgojaWYgX19CWVRFX09SREVSID09IF9fQklHX0VORElBTgojIGRlZmluZSBjb25z
dGFudF9zd2FiMzIoX3gpICAgICAgICAgICAgICAgICAgICAgXAogICAgKCgoKF94KSAmIDB4MDAw
MDAwZmZVKSA8PCAyNCkgfCAgICAgICAgICAgICAgXAogICAgICgoKF94KSAmIDB4MDAwMGZmMDBV
KSA8PCAgOCkgfCAgICAgICAgICAgICAgXAogICAgICgoKF94KSAmIDB4MDBmZjAwMDBVKSA+PiAg
OCkgfCAgICAgICAgICAgICAgXAogICAgICgoKF94KSAmIDB4ZmYwMDAwMDBVKSA+PiAyNCkpCiNl
bHNlCiMgY29uc3RhbnRfc3dhYjMyKF94KSAoX3gpCiNlbmRpZgoKI2RlZmluZSBNS19DQk8oZm4p
IGNvbnN0YW50X3N3YWIzMigodWludDMyX3QpKGZuKSA8PCAyMCB8IDEwIDw8IDE1IHwgMiA8PCAx
MiB8IDAgPDwgNyB8IDE1KQoKVGhhbmtzLApkcmV3Cgo+IAo+IEFuZCBzb3JyeSB0byBmb3JnZXQg
Y2MgbW9yZSBtYWludGFpbmVycyBmb3IgcmV2aWV3aW5nLgo+IAo+IENoZWVycywKPiBXb29kcm93
Cj4gCj4gCj4gT24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgNzo1MuKAr1BNIDx3b29kcm93LnNoZW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogSHNpZWgtVHNlbmcgU2hlbiA8d29vZHJv
dy5zaGVuQHNpZml2ZS5jb20+Cj4gPgo+ID4gY3B1X3RvX2xlMzIgaXMgbm90IGRlZmluZWQgaW4g
dWFwaSBoZWFkZXJzLCBhbmQgaXQgY291bGQgY2F1c2UgYW4gZXJyb3IKPiA+IG9mIGltcG9zc2li
bGUgY29uc3RyYWludCBpbiAnYXNtJyBkdXJpbmcgY29tcGlsYXRpb24uIEhvd2V2ZXIsCj4gPiB0
aGUgcmVhc29uIGlzIGR1ZSB0byB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGNwdV90b19sZTMyLgo+
ID4gX19jcHVfdG9fbGUzMigpIGRlZmluZWQgZnJvbSBieXRlb3JkZXIuaCBzaG91bGQgYmUgdXNl
ZCBpbnN0ZWFkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhzaWVoLVRzZW5nIFNoZW4gPHdvb2Ry
b3cuc2hlbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvaHdwcm9iZS9jYm8uYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvaHdwcm9iZS9jYm8uYwo+ID4gaW5kZXggYzUzN2Q1MmZhZmM1Li5iMmRkMThiM2UzNjAg
MTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Ni
by5jCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5j
Cj4gPiBAQCAtMTUsMTEgKzE1LDEyIEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gICNpbmNsdWRlIDxhc20vdWNvbnRl
eHQuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPgo+ID4KPiA+ICAjaW5jbHVkZSAi
aHdwcm9iZS5oIgo+ID4gICNpbmNsdWRlICIuLi8uLi9rc2VsZnRlc3QuaCIKPiA+Cj4gPiAtI2Rl
ZmluZSBNS19DQk8oZm4pIGNwdV90b19sZTMyKChmbikgPDwgMjAgfCAxMCA8PCAxNSB8IDIgPDwg
MTIgfCAwIDw8IDcgfCAxNSkKPiA+ICsjZGVmaW5lIE1LX0NCTyhmbikgX19jcHVfdG9fbGUzMigo
Zm4pIDw8IDIwIHwgMTAgPDwgMTUgfCAyIDw8IDEyIHwgMCA8PCA3IHwgMTUpCj4gPgo+ID4gIHN0
YXRpYyBjaGFyIG1lbVs0MDk2XSBfX2FsaWduZWQoNDA5NikgPSB7IFswIC4uLiA0MDk1XSA9IDB4
YTUgfTsKPiA+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
