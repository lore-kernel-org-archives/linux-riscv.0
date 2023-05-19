Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A2AC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P2VTgYdNK3oHYcDxsQHw6fg+8hxm7n8IqqwLgm8lrIk=; b=QbDds8Lhw9YMPuZgv8nKzZnrrG
	4Cm3vxasvk6rI8Vb/SF4w88FffK8XbUT/jz4czlfsabjpN4sTyrQWRmmPKleC39AT1d6AVyDQmBqu
	sFSmS0YJzGlxQkd9pt91wdDuKOTFhG+fBGXepEY6uMiEubKJwDZTDWeqI4qZQ4qTSfua7h/mvhwWQ
	sRD3cfj6ucX3yR6Hd7tu+xnoUIqdTlN0ZCjwda/yN58MaDoJhXWB8NlIZerMUhanOcBb5YVw2Bt/Z
	0R37O334VG3HtX1MtX0wjumNyIwqUCQFUAdLzFTIKaxa3ud9ILSpFPuryuVuZ6m7W5QhuMbQgm7IA
	s7IKkmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q03km-00Gpyq-0j;
	Fri, 19 May 2023 17:18:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q03ki-00Gpx4-2h
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 17:18:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ae4d1d35e6so26374145ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684516730; x=1687108730;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cP/N2yy0In7+4hR77Af8fl+Cq9omuuz9NP4NSMstSE=;
        b=oJTQ1xH2esTZ6dC0S08xSuynOquMOIpWw1CET3mwKZJZ8qSJiu/xdMNUmu1Ll9fuEI
         agp84ATECKi0z/b6nnuCgXbY5J2tqimno5Gh/r3t+myryOlD62xe7Lss9IhEofCPYGbo
         IiUiugJsTiCYcKfPh97SVrDkxOen0BTWvk7idHnbSRBMnpt9mRJzgnzWl2wDz7lBvpgX
         MmxRhTbbAfSXRp4Z5BlCiHkgqY9/UCJ/pBjZZ3U+HfI4dqSuluRYnrUwBzMKNx2xfnUb
         9dTB/SeJAQqLg9vyLIc77IRzb5dBFrUQxS18GPNeIeNSmi69qCL/jgaLRJpromRjbqLN
         eK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516730; x=1687108730;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cP/N2yy0In7+4hR77Af8fl+Cq9omuuz9NP4NSMstSE=;
        b=RNypiXGDLjUQds4GZGhoL08xrKsAi0GsmTkq7Y/2NJZGSqqYML8so7wZPUmPOnkYba
         JBqHbg/RYsKf+5yNveEG3wNH8t3UnONM8+S3yMalLhp6i8olS3LGHWt3sHypUbq6/uw+
         o9f/PtCxihlOvkHSWWXRwUw3DcPrI4nrdSSMNfQIsEvxW6ZU56IfpPKjoOBEviKfvedW
         uvr8nqxK5xOIGRf9jvIo8/VZ0vURK6N+nN26zubkcteJGQ6Rzlas1KGmhQznaKQsE/Lv
         g1/VnLU+ANjMjZ4fv2LVFunBkiqifOGMCrPujx33vRheRmpQeVId+rSqZk95gYh3r9en
         BsEQ==
X-Gm-Message-State: AC+VfDzvdnKxk28MkFeEJjxoyusWGgnQUDwKXcYPJzh6rRTwJ5Uy/o85
	w+EHXwlWfbvreNqFi1AXHagShw==
X-Google-Smtp-Source: ACHHUZ6sQqE4NgE4qAtzws4MDh/hCDsJ1+5Bk0BQ/KXNoITPF6sDFxlqLTzrK+z/++9G9i9iakUrMA==
X-Received: by 2002:a17:902:cecb:b0:1ae:8b4b:3273 with SMTP id d11-20020a170902cecb00b001ae8b4b3273mr1666308plg.23.1684516730147;
        Fri, 19 May 2023 10:18:50 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902e74a00b001aae64e9b36sm3694651plf.114.2023.05.19.10.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:18:49 -0700 (PDT)
Date: Fri, 19 May 2023 10:18:49 -0700 (PDT)
X-Google-Original-Date: Fri, 19 May 2023 10:18:25 PDT (-0700)
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel on 64-bit supervisor mode
In-Reply-To: <a9fcf1ad-a387-42a7-957a-e5a6a36fb3d7@app.fastmail.com>
CC: guoren@kernel.org, tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, jszhang@kernel.org, chenhuacai@kernel.org,
  apatel@ventanamicro.com, atishp@atishpatra.org, Mark Rutland <mark.rutland@arm.com>, bjorn@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  rppt@kernel.org, anup@brainfault.org, shihua@iscas.ac.cn, jiawei@iscas.ac.cn,
  liweiwei@iscas.ac.cn, luxufan@iscas.ac.cn, chunyu@iscas.ac.cn, tsu.yubo@gmail.com, wefu@redhat.com,
  wangjunqiang@iscas.ac.cn, kito.cheng@sifive.com, andy.chiu@sifive.com, vincent.chen@sifive.com,
  greentime.hu@sifive.com, corbet@lwn.net, wuwei2016@iscas.ac.cn, jrtc27@jrtc27.com,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-073cb75e-0f8d-40b7-9e1c-8cfad53351df@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_101852_895093_F7089C86 
X-CRM114-Status: GOOD (  38.69  )
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

T24gRnJpLCAxOSBNYXkgMjAyMyAwOTo1MzozNSBQRFQgKC0wNzAwKSwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBGcmksIE1heSAxOSwgMjAyMywgYXQgMTc6MzEsIEd1byBSZW4gd3JvdGU6Cj4+
IE9uIEZyaSwgTWF5IDE5LCAyMDIzIGF0IDI6MjnigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPj4+IE9uIFRodSwgTWF5IDE4LCAyMDIzLCBhdCAxNzozOCwgUGFsbWVy
IERhYmJlbHQgd3JvdGU6Cj4+PiA+IE9uIFRodSwgMTggTWF5IDIwMjMgMDY6MDk6NTEgUERUICgt
MDcwMCksIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4KPj4+IElmIGZvciBzb21lIGNyYXp5
IHJlYXNvbiB5b3UnZCBzdGlsbCB3YW50IHRoZSA2NGlscDMyIEFCSSBpbiB1c2VyCj4+PiBzcGFj
ZSwgcnVubmluZyB0aGUga2VybmVsIHRoaXMgd2F5IGlzIHByb2JhYmx5IHN0aWxsIGEgYmFkIGlk
ZWEsCj4+PiBidXQgdGhhdCBvbmUgaXMgbGVzcyBjbGVhci4gVGhlcmUgaXMgY2xlYXJseSBhIHNt
YWxsIG1lbW9yeQo+Pj4gcGVuYWx0eSBvZiBydW5uaW5nIGEgNjQtYml0IGtlcm5lbCBmb3IgbGFy
Z2VyIGRhdGEgc3RydWN0dXJlcwo+Pj4gKHBhZ2UsIGlub2RlLCB0YXNrX3N0cnVjdCwgLi4uKSBh
bmQgdm1saW51eCwgYW5kIHRoZXJlIGlzIG5vCj4+IEkgZG9uJ3QgdGhpbmsgaXQncyBhIHNtYWxs
IG1lbW9yeSBwZW5hbHR5LCBvdXIgbWVhc3VyZW1lbnQgaXMgYWJvdXQKPj4gMTYlIHdpdGggZGVm
Y29uZmlnLCBzZWUgIldoeSAzMi1iaXQgTGludXg/IiBzZWN0aW9uLgo+Pgo+PiBUaGlzIHBhdGNo
IHNlcmllcyBkb2Vzbid0IGFkZCA2NGlscDMyIHVzZXJzcGFjZSBhYmksIGJ1dCBpdCBzZWVtcyB5
b3UKPj4gYWxzbyBkb24ndCBsaWtlIHRvIHJ1biAzMi1iaXQgTGludXgga2VybmVsIG9uIDY0LWJp
dCBoYXJkd2FyZSwgcmlnaHQ/Cj4KPiBPaywgSSdtIHNvcnJ5IGZvciBtaXNzaW5nIHRoZSBpbXBv
cnRhbnQgYml0IGhlcmUuIFNvIGlmIHRoaXMgY2FuCj4gc3RpbGwgdXNlIHRoZSBub3JtYWwgMzIt
Yml0IHVzZXIgc3BhY2UsIHRoZSBjb3N0IG9mIHRoaXMgcGF0Y2ggc2V0Cj4gaXMgbm90IGh1Z2Us
IGFuZCBpdCdzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBiZW5lZmljaWFsIGluIGEgZmV3Cj4gY2Fz
ZXMsIHRob3VnaCBJIHN1c3BlY3QgbW9zdCB1c2VycyBhcmUgc3RpbGwgYmV0dGVyIG9mZiBydW5u
aW5nCj4gNjQtYml0IGtlcm5lbHMuCgpSdW5uaW5nIGEgbm9ybWFsIDMyLWJpdCB1c2Vyc3BhY2Ug
d291bGQgcmVxdWlyZSBIVyBzdXBwb3J0IGZvciB0aGUgCjMyLWJpdCBtb2RlIHN3aXRjaCBmb3Ig
dXNlcnNwYWNlLCB0aG91Z2ggKHJ2MzIgaXNuJ3QgYSBzdWJzZXQgb2YgcnY2NCwgCnNvIHRoZXJl
J3Mgbm90aGluZyB3ZSBjYW4gZG8gdG8gbWFrZSB0aG9zZSBiaW5hcmllcyBmdW5jdGlvbiBjb3Jy
ZWN0bHkgCndpdGggdUFCSSkuICBUaGUgdXNlcnNwYWNlLW9ubHkgbW9kZSBzd2l0Y2ggaXMgYSBi
aXQgc2ltcGxlciB0aGFuIHRoZSAKdXNlcitzdXBlcnZpc29yIHN3aXRjaCwgYnV0IGl0IHNlZW1z
IGxpa2UgdmVuZG9ycyB3aG8gcmVhbGx5IHdhbnQgdGhlIAptZW1vcnkgc2F2aW5ncyB3b3VsZCBq
dXN0IGltcGxlbWVudCBib3RoIG1vZGUgc3dpdGNoZXMuCgo+PiBUaGUgbW90aXZhdGlvbiBvZiBz
NjRpbHAzMiAocnVubmluZyAzMi1iaXQgTGludXgga2VybmVsIG9uIDY0LWJpdCBzLW1vZGUpOgo+
PiAgLSBUaGUgdGFyZ2V0IGhhcmR3YXJlIChDYW5hYW4gS2VuZHJ5dGUgazIzMCkgb25seSBzdXBw
b3J0cyBNWEw9NjQsCj4+IFNYTD02NCwgVVhMPTY0LzMyLgo+PiAgLSBUaGUgNjQtYml0IExpbnV4
ICsgY29tcGF0IDMyLWJpdCBhcHAgY2FuJ3Qgc2F0aXNmeSB0aGUgNjQvMTI4TUIgc2NlbmFyaW9z
Lgo+Pgo+Pj4gaHVnZSBhZGRpdGlvbmFsIG1haW50ZW5hbmNlIGNvc3Qgb24gdG9wIG9mIHRoZSBB
QkkgaXRzZWxmCj4+PiB0aGF0IHlvdSdkIG5lZWQgZWl0aGVyIHdheSwgYnV0IHVzaW5nIGEgNjQt
Yml0IGFkZHJlc3Mgc3BhY2UKPj4+IGluIHRoZSBrZXJuZWwgaGFzIHNvbWUgaW1wb3J0YW50IGFk
dmFudGFnZXMgZXZlbiB3aGVuIHJ1bm5pbmcKPj4+IDMyLWJpdCB1c2VybGFuZDogcHJvY2Vzc2Vz
IGNhbiB1c2UgdGhlIGVudGlyZSA0R0IgdmlydHVhbAo+Pj4gc3BhY2UsIHdoaWxlIHRoZSBrZXJu
ZWwgY2FuIGFkZHJlc3MgbW9yZSB0aGFuIDc2OE1CIG9mIGxvd21lbSwKPj4+IGFuZCBLQVNMUiBo
YXMgbW9yZSBiaXRzIHRvIHdvcmsgd2l0aCBmb3IgcmFuZG9taXphdGlvbi4gT24KPj4+IFJJU0NW
LCBzb21lIGFkZGl0aW9uYWwgZmVhdHVyZXMgKFZNQVBfU1RBQ0ssIEtBU0FOLCBLRkVOQ0UsCj4+
PiAuLi4pIGRlcGVuZCBvbiA2NC1iaXQga2VybmVscyBldmVuIHRob3VnaCB0aGV5IGRvbid0Cj4+
PiBzdHJpY3RseSBuZWVkIHRoYXQuCj4+Cj4+IEkgYWdyZWUgdGhhdCB0aGUgNjQtYml0IGxpbnV4
IGtlcm5lbCBoYXMgbW9yZSBmdW5jdGlvbmFsaXRpZXMsIGJ1dDoKPj4gIC0gV2hhdCBkbyB5b3Ug
dGhpbmsgYWJvdXQgbGludXggb24gYSA2NC8xMjhNQiBTb0M/IENvdWxkIGl0IGJlCj4+IGFmZm9y
ZGFibGUgdG8gVk1BUF9TVEFDSywgS0FTQU4sIEtGRU5DRT8KPgo+IEkgd291bGQgZGVmaW5pdGVs
eSByZWNvbW1lbmQgVk1BUF9TVEFDSywgYnV0IHRoYXQgY2FuIGJlIGltcGxlbWVudGVkCj4gYW5k
IGlzIHVzZWQgb24gb3RoZXIgMzItYml0IGFyY2hpdGVjdHVyZXMgKHBwYzMyLCBhcm0zMikgd2l0
aG91dCBhCj4gaHVnZSBjb3N0LiBUaGUgbGFyZ2VyIHZpcnR1YWwgdXNlciBhZGRyZXNzIHNwYWNl
IGNhbiBoZWxwIGV2ZW4gb24KPiBtYWNoaW5lcyB3aXRoIDEyOE1CLCB0aG91Z2ggbW9zdCBhcHBs
aWNhdGlvbnMgcHJvYmFibHkgZG9uJ3QgY2FyZSBhdAo+IHRoYXQgcG9pbnQuCgpBdCBsZWFzdCBo
YXZpbmcgdGhlbSBhcyBhbiBvcHRpb24gc2VlbXMgcmVhc29uYWJsZS4gIEhpc3RvcmljYWxseSB3
ZSAKaGF2ZW4ndCBnYXRlZCBuZXcgYmFzZSBzeXN0ZW1zIG9uIGhhdmluZyBldmVyeSBmZWF0dXJl
IHRoZSBvdGhlcnMgZG8sIAp0aG91Z2ggKCFNTVUsIHJ2MzIsIGV0YykuCgo+PiAgLSBJIHRoaW5r
IDMyLWJpdCBMaW51eCAmIFJUT1MgaGF2ZSBtb25vcG9saXplZCB0aGlzIG1hcmtldCAoNjQvMTI4
TUIKPj4gc2NlbmFyaW9zKSwgcmlnaHQ/Cj4KPiBUaGUgbWluaW11bSBhbW91bnQgb2YgUkFNIHRo
YXQgbWFrZXMgYSBzeXN0ZW0gdXNhYmxlIGZvciBMaW51eCBpcwo+IGNvbnN0YW50bHkgZ29pbmcg
dXAsIHNvIEkgdGhpbmsgd2l0aCA2NE1CLCBtb3N0IG5ldyBwcm9qZWN0cyBhcmUKPiBhbHJlYWR5
IGJldHRlciBvZmYgcnVubmluZyBzb21lIFJUT1Mga2VybmVsIGluc3RlYWQgb2YgTGludXguCj4g
VGhlIG9uZXMgdGhhdCBhcmUgc3RpbGwgdXNhYmxlIHRvZGF5IHByb2JhYmx5IHdvbid0IGxhc3Qg
YSBsb3QKPiBvZiBkaXN0cm8gdXBncmFkZXMgYmVmb3JlIHRoZSBibG9hdCBjYXRjaGVzIHVwIHdp
dGggdGhlbSwgYnV0IEkKPiBjYW4gc2VlIGhvdyB5b3VyIHBhdGNoIHNldCBjYW4gZ2l2ZSB0aGVt
IGEgZmV3IGV4dHJhIHllYXJzIG9mCj4gdXBkYXRlcy4KCldlIGFsc28gaGF2ZSAzMi1iaXQga2Vy
bmVsIHN1cHBvcnQuICBTeXN0ZW1zIHRoYXQgaGF2ZSB0ZW5zIG9mIE1CIG9mIFJBTSAKdGVuZCB0
byBlbmQgdXAgd2l0aCBzb21lIG1lbW9yeSB0ZWNobm9sb2d5IHRoYXQgZG9lc24ndCBzY2FsZSB0
byAKZ2lnYWJ5dGVzIHRoZXNlIGRheXMsIGFuZCBzaW5jZSB0aGF0J3MgZml4ZWQgd2hlbiB0aGUg
Y2hpcCBpcyBidWlsdCBpdCAKc2VlbXMgbGlrZSB0aG9zZSBmb2xrcyB3b3VsZCBiZSBiZXR0ZXIg
b2ZmIGp1c3QgaGF2aW5nIEhXIHN1cHBvcnQgZm9yIAozMi1iaXQga2VybmVscyAoYW5kIG1heWJl
IG5vdCBldmVuIGJvdGhlcmluZyB3aXRoIEhXIHN1cHBvcnQgZm9yIDY0LWJpdCAKa2VybmVscyku
Cgo+IEZvciB0aGUgMjU2TUIrIHN5c3RlbXMsIEkgd291bGQgZXhwZWN0IHRoZSBzZW5zaXRpdmUg
a2VybmVsCj4gYWxsb2NhdGlvbnMgdG8gYmUgc21hbGwgZW5vdWdoIHRoYXQgdGhlIHNlcmllcyBt
YWtlcyBsaXR0bGUKPiBkaWZmZXJlbmNlLiBUaGUgMTI4TUIgc3lzdGVtcyBhcmUgdGhlIG1vc3Qg
aW50ZXJlc3Rpbmcgb25lcwo+IGhlcmUsIGFuZCBJJ20gY3VyaW91cyB0byBzZWUgd2hlcmUgeW91
IHNwb3QgbW9zdCBvZiB0aGUKPiBtZW1vcnkgdXNhZ2UgZGlmZmVyZW5jZXMsIEknbGwgYWxzbyBy
ZXBseSB0byB5b3VyIGluaXRpYWwKPiBtYWlsIGZvciB0aGF0LgoKVGhhbmtzLiAgSSBhZ3JlZSB3
ZSBuZWVkIHRvIHNlZSBzb21lIHJlYWwgc3lzdGVtcyB0aGF0IGJlbmVmaXQgZnJvbSAKdGhpcywg
YXMgaXQncyBhIHByZXR0eSBiaWcgc3VwcG9ydCBjb3N0LiAgSnVzdCBkZWZjb25maWcgc2l6ZXMg
ZG9lc24ndCAKbWVhbiBhIHdob2xlIGxvdCwgYXMgdXNlcnMgb24gdGhlc2UgdmVyeSBjb25zdHJh
aW5lZCBzeXN0ZW1zIGFyZW4ndCAKbGlrZWx5IHRvIHJ1biBkZWZjb25maWcgYW55d2F5LgoKSWYg
c29tZW9uZSdzIGdvaW5nIHRvIHVzZSBpdCB0aGVuIEknbSBmaW5lIHRha2luZyB0aGUgY29kZSwg
aXQganVzdCAKc2VlbXMgbGlrZSBhIHZlcnkgdGhpbiBzZXQgb2YgcG9zc2libGUgdXNlIGNhc2Vz
LiAgV2UndmUgYWxyZWFkeSBnb3QgCmFsbW9zdCBubyB1c2VycyBpbiBSSVNDLVYgbGFuZCwgSSd2
ZSBnb3QgYSBmZWVsaW5nIHRoaXMgaXMgZXNvdGVyaWMgCmVub3VnaCB0byBhY3R1YWxseSBoYXZl
IHplcm8uCgo+Cj4gICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
