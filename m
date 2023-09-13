Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22B4EE020A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 19:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bZxqX7Zmbjt3xeqmcL0TwqI1vL4SrEl7fPHS7wAkbro=; b=HiETnJgTGklpuGVLMU5yCvJ+QB
	hIr0zkZVBynd4Ybe2lpvitBNx6mEHF5UwBhQeb1V+52lKMFQNYLeYv465ULJMZ7d/u9qQEFdGoLm1
	q/S7eXa2e23xpHifyjy9NcRRFXETVRenrJ2InKJbh2m30wUFX736oQwssfTzvMFWx1Txmit+nfRkE
	dmgbpnWGEhS3RSe7jpAwN5CetKPeOF2uQwdwTgS7FbDTTIxitZsxiXGd1qO4NCOimCAPnMJvK7tao
	lp8rTUVGRVrQZc9PNF1Q91FTW4mER7E9S5Usy5smESi8kvZK3L9pHUB2jPszyq/VyuWEno2/Xyzfh
	7Oc9abOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVvf-006dOo-2I;
	Wed, 13 Sep 2023 19:53:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVvb-006dOQ-3B
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 19:53:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bf6ea270b2so1399715ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694634815; x=1695239615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9SvNhyrhf06/biCddE0mhgRTAe9HxsppqeIKhJEHHw=;
        b=0w+Pk88xBsOVFSFjU8aUDKQ8uLtm/pLNuwWMNZpAg66hq8amnaFj63W8mKB2MENNVC
         XJnH6zcdDmOLeMyE84z/vDQyGI2ma6p2tRd8oDNV2piwurkI/cTZosYKzifyCGpTVYBU
         Z5yHsTznsNWeUWRbY0I/efG97nZSierM8vyS+DLplU5YbdLC49mTb5oAUSusXlGQyEk4
         Pmq/49IWv1d4Mxq1bV5fJaGvyMIajb+OZIQwn2dPTCh6saOIj2ta+tzJOv6o+0+vJMEW
         WsDJ0GDbFqtxP5y/eURqTkW+DPbcEHVmG/sRoY/hvcAta9xa6n7A3qsMd/yVa8SBcE5E
         MqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694634815; x=1695239615;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9SvNhyrhf06/biCddE0mhgRTAe9HxsppqeIKhJEHHw=;
        b=ppEW1ZcHHFCeufI3gJuEHTMTuRj3EmKo8cUIHdyRPdKJBzp/tvwpMZztWhgpR8dg92
         koilqkvq6fXyGvDcVi3u5byBmd9a8Y0O/x/lOtJMG++NY5eyN0N8sxgGm1+Xs0eeSpJw
         TGD9vKPuBJMjwaRod4fAxNYDiTPjkTGp1U2wKu89Pl1P06knfFkOpwaCMyJy81YF1o/x
         rTwi3rZrr8a9jyzDEAl6HObMhDWvruoqB/fIbxIcP7FdnAd5CrlDcvmOZpqU74AKvkqr
         mx5nRg5DeqQm25IgKHBUBWk+KzhrIBYQSdZnI6L3q3YxWonOhOYwg32805cEAgis/nJn
         uvhg==
X-Gm-Message-State: AOJu0YwMHAR+X3/k33BMJJSl20Q9VQEjWqSFtM5SVlCA4YTgi+DEXZQa
	uIgfTdxsMoU31akGxjvlu2+ocw==
X-Google-Smtp-Source: AGHT+IGN0lfCQvmijbmo/lUZ+6ry8zzWVSas6LrREeVihPX25DD5UletVgl9mC1u252CXPv8aZMaWw==
X-Received: by 2002:a17:903:22cb:b0:1c0:c640:3f3e with SMTP id y11-20020a17090322cb00b001c0c6403f3emr4551140plg.42.1694634814754;
        Wed, 13 Sep 2023 12:53:34 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001b8943b37a5sm12252plb.24.2023.09.13.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 12:53:34 -0700 (PDT)
Date: Wed, 13 Sep 2023 12:53:34 -0700 (PDT)
X-Google-Original-Date: Wed, 13 Sep 2023 12:53:32 PDT (-0700)
Subject: Re: boot time regressed a lot due to misaligned access probe
In-Reply-To: <CALs-HssesyM7RJVaoHhPFk6SQP-J1pHF79rseYDZp=A++Cuy3g@mail.gmail.com>
CC: jszhang@kernel.org, ben.dooks@codethink.co.uk, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-9359993d-6872-4134-83ce-c97debe1cf9a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_125336_252417_1A2E68DF 
X-CRM114-Status: GOOD (  36.41  )
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

T24gV2VkLCAxMyBTZXAgMjAyMyAxMjo1MDo1NCBQRFQgKC0wNzAwKSwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCA4OjIz4oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6
aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTE6
NDY6MjhBTSArMDEwMCwgQmVuIERvb2tzIHdyb3RlOgo+PiA+IE9uIDEzLzA5LzIwMjMgMDE6MTQs
IEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+ID4gPiBIaSBhbGwsCj4+ID4gPgo+PiA+ID4gUHJvYmlu
ZyBvbmUgY3B1IGZvciBtaXNhbGlnbmVkIGFjY2VzcyBjb3N0IGFib3V0IDAuMDZzLCBzbyBpdCB3
aWxsIGNvc3QKPj4gPiA+IGFib3V0IDMuOHMgb24gcGxhdGZvcm1zIHdpdGggNjQgQ1BVcywgZm9y
IGV4YW1wbGUsIG1pbGt2IHBpb25lZXIgd2hpY2gKPj4gPiA+IGlzIHBvd2VyZWQgYnkgc2cyMDQy
Lgo+PiA+ID4KPj4gPiA+IEknbSBub3Qgc3VyZSB0aGUgcmVhc29uIG9mIHByb2JpbmcgbWlzYWxp
Z25lZCBhY2Nlc3MgZm9yIGFsbCBDUFVzLiBJZgo+PiA+ID4gdGhlIEhXIGRvZXNuJ3QgYmVoYXZl
IGFzIFNNUCBmcm9tIG1pc2FsbGlnbmVkIGFjY2VzcyBzaWRlLCB0aGVuIHVubGVzcwo+PiA+ID4g
dXNlcnNwYWNlIHByb2Nlc3NlcyBmb3JjZSBjcHUgYWZmaW5pdHksIHRoZXkgYWx3YXlzIHN1ZmZl
ciBmcm9tIHRoaXMKPj4gPiA+IG5vbi1TTVAgcGFpbi4KPj4gPiA+Cj4+ID4gPiBTbywgY2FuIHdl
IG9ubHkgcHJvYmUgdGhlIGJvb3QgY3B1Pwo+Cj4gSGkgSmlzaGVuZywKPiBUaGFua3MgZm9yIGlk
ZW50aWZ5aW5nIHRoaXMgcmVncmVzc2lvbi4gSSdkIHByZWZlciB0byBrZWVwIHRoZSBwcm9iaW5n
Cj4gb24gZWFjaCBjcHUsIGFzIEkgZG9uJ3QgdGhpbmsgaXQncyBzYWZlIHRvIGFzc3VtZSBiZWhh
dmlvciBpcyB0aGUgc2FtZQo+IGFjcm9zcyBhbGwgY29yZXMuIEJ1dCB0aGVyZSdzIG5vIHJlYXNv
biB0aGlzIG5lZWRzIHRvIGJlIGRvbmUKPiBzZXJpYWxseSwgd2Ugc2hvdWxkIGJlIGFibGUgdG8g
ZG8gdGhlIGNoZWNraW5nIGluIHBhcmFsbGVsIG9uIGVhY2gKPiBjcHUuIEkgZG9uJ3QgaGF2ZSBh
IHBoeXNpY2FsIDY0LWNvcmUgc3lzdGVtLCBidXQgSSBleHBlcmltZW50ZWQgd2l0aAo+IHFlbXUg
YSBiaXQ6Cj4KPiBXaXRoIG1pc2FsaWduZWQgcHJvYmluZwo+IFsgICAgMC41NTg5MzBdIHNtcDog
QnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQVXMgLi4uCj4gWyAgICA3LjYzNTU4MF0gc21wOiBCcm91
Z2h0IHVwIDEgbm9kZSwgNjQgQ1BVcwo+Cj4gV2l0aCBubyBtaXNhbGlnbmVkIHByb2JpbmcKPiBb
ICAgIDAuNDczMDEyXSBzbXA6IEJyaW5naW5nIHVwIHNlY29uZGFyeSBDUFVzIC4uLgo+IFsgICAg
NS40Mzg0NTBdIHNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDY0IENQVXMKPgo+IFdpdGggY2hhbmdl
IGJlbG93Ogo+IFsgICAgMC42MTU2ODRdIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQVXMg
Li4uCj4gWyAgICA1LjQ4OTA0NV0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgNjQgQ1BVcwo+Cj4g
SSBhbHNvIGNvbW1lbnRlZCBvdXQgdGhlIHByX2luZm8oKSBpbiBteSB0ZXN0aW5nLCBtb3N0bHkg
dG8ga2VlcCB0aGUKPiBVQVJUIG91dCBvZiB0aGUgd2F5LiBXZSBzaG91bGQgc3RyaXZlIHRvIGlt
cHJvdmUgdGhlIHNtcCBjb3JlIGJyaW5ndXAKPiB0aW1lIGluIGdlbmVyYWwsIGJ1dCBob3BlZnVs
bHkgd2l0aCB0aGlzIHRoZSBtaXNhbGlnbmVkIHByb2Jpbmcgd29uJ3QKPiBiZSBtYWtpbmcgaXQg
d29yc2UuIElmIHRoaXMgd29ya3MgZm9yIHlvdSBJIGNhbiBjbGVhbiBpdCB1cCBhbmQgc3VibWl0
Cj4gYSBwYXRjaCAoc29ycnkgZ21haWwgbWFuZ2xlcyB0aGUgZGlmZik6CgpUaGFua3MuICBJIHRo
aW5rIHdlIGNhbiBjYWxsIHNvbWV0aGluZyBsaWtlIHRoaXMgYSBmaXguCgo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJv
b3QuYwo+IGluZGV4IDFiOGRhNGU0MGE0ZC4uN2RjZTMwYjdjODY4IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJv
b3QuYwo+IEBAIC0yMjMsOCArMjIzLDE4IEBAIGludCBfX2NwdV91cCh1bnNpZ25lZCBpbnQgY3B1
LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKQo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+
Cj4gK3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfY3B1KHZvaWQgKnVudXNlZCkK
PiArewo+ICsgICAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiAr
Cj4gKyAgICAgICAvKiBTb21lb25lIGhhcyB0byBzdGF5IGJlaGluZCBhbmQgdGVuZCB0aGUgamlm
Zmllcy4gKi8KPiArICAgICAgIGlmIChjcHUgIT0gMCkKPiArICAgICAgICAgICAgICAgY2hlY2tf
dW5hbGlnbmVkX2FjY2VzcyhjcHUpOwo+ICt9Cj4gKwo+ICB2b2lkIF9faW5pdCBzbXBfY3B1c19k
b25lKHVuc2lnbmVkIGludCBtYXhfY3B1cykKPiAgewo+ICsgICAgICAgb25fZWFjaF9jcHUoY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19jcHUsIE5VTEwsIDApOwo+ICB9Cj4KPiAgLyoKPiBAQCAtMjQ2
LDcgKzI1Niw2IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+
Cj4gICAgICAgICBudW1hX2FkZF9jcHUoY3Vycl9jcHVpZCk7Cj4gICAgICAgICBzZXRfY3B1X29u
bGluZShjdXJyX2NwdWlkLCAxKTsKPiAtICAgICAgIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoY3Vy
cl9jcHVpZCk7Cj4KPiAgICAgICAgIGlmIChoYXNfdmVjdG9yKCkpIHsKPiAgICAgICAgICAgICAg
ICAgaWYgKHJpc2N2X3Zfc2V0dXBfdnNpemUoKSkKPgo+IC1FdmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
