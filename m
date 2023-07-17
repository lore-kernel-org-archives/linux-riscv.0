Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDEDEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNcbD5EtWFe+0/rDS8OUUMy4LDgWoeIxGzx0uCPCcno=; b=mB8sbLTmGzjty+
	N4d1xYlUpztNPix+3PUUScxjD20Rd3aJqb+/sPfLpXhUzMolU6ieCbJZFTjxYeYJxyS+KJzaDJUWJ
	sF2kCFL7bm67GwPDRRrfdQgC4m4Iygxd3GovKxPzTILu6AJTLidc3ZdbMUlvlpm/o9N8VCcMT3V+f
	ec9TrK/aeBa36NA7gSX26ai1V6qt1pSKQ5KW+vqQf1IbYn7zT/QZvA+wmIiX1lel2kprdvmZMAQT2
	Nq0c9v6xwu532/KWnYNnDcSzsH+7l0+ASh4dRXh4WoFEu5XbGaIXer1aZ0nCZVxV+DLnmUw5FXz37
	iHeUEn3qHx0EO2s0tlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQhd-004Ukw-2W;
	Mon, 17 Jul 2023 16:04:01 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQhZ-004UjT-0V
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 16:03:58 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b946602d64so11455421fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689609833; x=1692201833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyTbEXRnNqYUIekFtdZP9GPadruNgRb99Yf2oASUn4M=;
        b=ETLmoWyMX4Vskll4ZLdmAFEFr9Ge+bx6tQ9yUHetBUkP8fitqk63GO6RPy1bJJ32Fu
         dAnCiema0grviJtKi0cKHMa9a66KJlxL8VRErOtZvufwnovQg1w3zGdECzE+3jkeyKU4
         vumAAzJ1Q3r8z6ZPiplt7Teb/OE9jodJdWrazT4pShXoMvhjcAVoh3DawnjNomA69bxn
         sVCh9VmU46wsENgtAACW6MGoTJWwA5MOiyMQ7TNL4PvyEdCMJ2cvtS3rqMfliGDlzbMu
         whOWHss9E1Un2RrLUUce+JIAdc5DkOUbFqlAaRpp5dVW6lnDo6B2bTpZbQIPFDAGSKNM
         aK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689609833; x=1692201833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyTbEXRnNqYUIekFtdZP9GPadruNgRb99Yf2oASUn4M=;
        b=EpNig5BUqbhgsdoeT8GUP3sDBZr/JOtO0LDGaC40dpk5/LZnOrxH3BakHHtVdvGKa9
         SIIroHs/ZVxVFHRdNQPlFU0TETN4QlkdZjSh5CDV/3SaUASS9E16uovqn3eTwNXT2VFH
         ijuIifcCq/NimVVkz4ln9+3wwMGvCDVs4hYnaqr9SyPONdz04H+VtdkDh50VYWll5jCk
         jUi3tDxRKfRrikDKziewZ0MVtomqyLMvUFWQSbrH/BykExc1Xf25jL0Qnq6GeWOiYGfE
         x8MyVGErVlgS6p03R00BTsqhIBqHMw5d+8RfzxPg4yTyHRwue9GCznlrFrqwvynB9BmO
         pa5w==
X-Gm-Message-State: ABy/qLZxhs1Gu1iXOOZHEzSCWIlx6y+F5VlXWcoaDybGX2ql7WToNDXp
	3s4Pz4hz0VZGMBqi0BWfFFjWdSuQlyN/8BCVG5LyIg==
X-Google-Smtp-Source: APBJJlEW1yml8xrRqScDX3Keo/56zBfRNPWE0AjfuFsTLiEX9gSb76RbKDpR6nDnYL/a6kB0MId5UtVuH/Jp6jURFck=
X-Received: by 2002:a2e:9206:0:b0:2b7:15d:24 with SMTP id k6-20020a2e9206000000b002b7015d0024mr9118780ljg.41.1689609832771;
 Mon, 17 Jul 2023 09:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230715150032.6917-1-andy.chiu@sifive.com> <20230715150032.6917-2-andy.chiu@sifive.com>
 <20230717-rearview-rural-2bafe2536270@wendy>
In-Reply-To: <20230717-rearview-rural-2bafe2536270@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 18 Jul 2023 00:03:41 +0800
Message-ID: <CABgGipVdewhFvAQF5nWk3ozkCUiDhTu6u-mTpXihrgsphOAbpg@mail.gmail.com>
Subject: Re: [v1, 1/6] riscv: sched: defer restoring Vector context for user
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, vineetg@rivosinc.com, 
	bjorn@kernel.org, greentime.hu@sifive.com, paul.walmsley@sifive.com, 
	guoren@linux.alibaba.com, anup@brainfault.org, atishp@atishpatra.org, 
	heiko.stuebner@vrull.eu, Albert Ou <aou@eecs.berkeley.edu>, 
	Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Bresticker <abrestic@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_090357_270051_1B4D5907 
X-CRM114-Status: GOOD (  19.66  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgNTo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFuZHksCj4gU21hbGwgYml0IG9mIG1p
bm9yIG5pdHBpY2tlcnkuLgo+Cj4gT24gU2F0LCBKdWwgMTUsIDIwMjMgYXQgMDM6MDA6MjdQTSAr
MDAwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gVXNlcidzIHdpbGwgdXNlIGl0cyBWZWN0b3IgcmVn
aXN0ZXJzIG9ubHkgYWZ0ZXIgdGhlIGtlcm5lbCByZWFsbHkKPgo+IExvb2tzIGxpa2UgdGhlICcg
aGVyZSBjYW4gYmUgcmVtb3ZlZC4KPgo+ID4gcmV0dXJucyB0byB0aGUgdXNlcnNwYWNlLiBTbyB3
ZSBjYW4gZGVsYXkgcmVzdG9yaW5nIFZlY3RvciByZWdpc3RlcnMgYXMKPiA+IGxvbmcgYXMgd2Ug
YXJlIHN0aWxsIHJ1bm5pbmcgaW4ga2VybmVsIG1vZGUuIFNvLCBhZGQgYSB0aHJlYWQgZmxhZyB0
bwo+ID4gaW5kaWNhdGVzIHRoZSBuZWVkIG9mIHJlc3RvcmluZyBWZWN0b3IgYW5kIGRvIHRoZSBy
ZXN0b3JlIGF0IHRoZSBsYXN0Cj4gPiBhcmNoLXNwZWNpZmljIGV4aXQtdG8tdXNlciBob29rLiBU
aGlzIHNhdmUgdGhlIGNvbnRleHQgcmVzdG9yaW5nIGNvc3QKPiA+IHdoZW4gd2Ugc3dpdGNoIG92
ZXIgbXVsdGlwbGUgcHJvY2Vzc2VzIHRoYXQgcnVuIFYgaW4ga2VybmVsIG1vZGUuIEZvcgo+ID4g
ZXhhbXBsZSwgaWYgdGhlIGtlcm5lbCBwZXJmb3JtcyBjb250ZXh0IHN3aWN0aCBmcm9tIEEtPkIt
PkMsIGFuZCByZXR1cm5zCj4KPiAiYSBjb250ZXh0IHN3aXRjaCIKPgo+ID4gdG8gQydzIHVzZXJz
cGFjZSwgdGhlbiB0aGVyZSBpcyBubyBuZWVkIGZvciByZXN0b3JpbmcgQidzIFYtcmVnaXN0ZXIu
Cj4KPiAidG8gcmVzdG9yZSIKClNvcnJ5IGZvciB0aGUgcG9vciBlbmdsaXNoLiBMZXQgbWUgZml4
IGl0IGluIHRoZSBuZXh0IHNwaW4uCgo+Cj4gPgo+ID4gQmVzaWRlcywgdGhpcyBhbHNvIHByZXZl
bnRzIHVzIGZyb20gcmVwZWF0ZWRseSByZXN0b3JpbmcgViBjb250ZXh0IHdoZW4KPiA+IGV4ZWN1
dGluZyBrZXJuZWwtbW9kZSBWZWN0b3IgbXVsdGlwbGUgdGltZXMgZm9yIHRoZSB1cGNvbWluZyBr
ZW5lbC1tb2RlCj4gPiBWZWN0b3IgcGF0Y2hlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5
IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gLS0tCj4KPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3RocmVhZF9pbmZvLmgKPiA+IGluZGV4IDk3ZTZmNjVlYzE3Ni4uZDgzOTc1ZWZlODY2IDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiA+IEBAIC0xMDEsMTIg
KzEwMSwxNCBAQCBpbnQgYXJjaF9kdXBfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICpk
c3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsKPiA+ICAjZGVmaW5lIFRJRl9OT1RJRllfU0lH
TkFMICAgIDkgICAgICAgLyogc2lnbmFsIG5vdGlmaWNhdGlvbnMgZXhpc3QgKi8KPiA+ICAjZGVm
aW5lIFRJRl9VUFJPQkUgICAgICAgICAgIDEwICAgICAgLyogdXByb2JlIGJyZWFrcG9pbnQgb3Ig
c2luZ2xlc3RlcCAqLwo+ID4gICNkZWZpbmUgVElGXzMyQklUICAgICAgICAgICAgMTEgICAgICAv
KiBjb21wYXQtbW9kZSAzMmJpdCBwcm9jZXNzICovCj4gPiArI2RlZmluZSBUSUZfUklTQ1ZfVl9E
RUZFUl9SRVNUT1JFICAgIDEyCj4KPiBUaGUgcmVzdCBvZiB0aGVzZSBoYXZlIGEgY29tbWVudCwg
c2hvdWxkIHRoZSBuZXcgYWRkaXRpb24/CgpZZXMsIGl0IHNob3VsZC4gSG93IGFib3V0IHRoaXMg
ImRlZmVyIHJlc3RvcmluZyBwcm9jZXNzJ3MgVi1jb250ZXh0IgoKPgo+IEFueXdheSwgbm8gbWVh
bmluZ2Z1bCBjb21tZW50cyBmcm9tIG1lIGhlcmUgQW5keSwKPiBBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IFRoYW5rcywKPiBDb25vci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
