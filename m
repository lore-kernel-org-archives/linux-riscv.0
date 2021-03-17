Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C3CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 02:51:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C8764F45
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 02:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C8764F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYNNawkyoKAxsRy8iZ7ANIQyCDTTdrd8ckKoQPBCsVY=; b=nZ5TZClcRk7u6pzBs3yhcwG7K
	kGjY6pcBaaJ6RZEceszGNtFb4Ug3BXWEFL9/b7/NauNR/0yjQvzyeyydLPuof73VXslTIk8dtxNaB
	pGgJxbyudgaNmkNeEZikXxniKHHNQi3HW/2tp2oLFXEO5UGbm9sVlUXU+ZyO+zHDSoSBsvF9RC8DJ
	won1YglbF2oFWFvevrNQI+K01xT1pdIFrYWLYb+YZQNbFDtpBzpQZITfTHuz3MqsExPnj3W0orKEO
	wXWlZPkmr+fXsXceJhtpCrDrbWQsAoMEuDQietdDFP9Jb2USkpFn5466f4CZy2l0v/rnn2fhhqAZm
	ZP02jOu0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMMGs-002Iy5-GI; Wed, 17 Mar 2021 02:50:54 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMMGm-002IxK-G2
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 02:50:51 +0000
Received: by mail-io1-xd2d.google.com with SMTP id o11so39535061iob.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bS/uiaAtYUP71fJm7AXDoYS4U0c3A2YCe031i4NyOFk=;
 b=sdTW3VJmokHGpolkZoM/MVRBdyMpfVPKGVD+WLQhaO3U7/wjczbwSiA5wp543/Rid4
 52dAMTj1wXMsi1CKbPAnH5MB/VRO/LrunB3JSPdjIb+A/gjNK3WvbOOtWeGAzYsGn/lr
 VtjFCWemiW0uDk9ly8P4lRYpWcCQeG471fr2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bS/uiaAtYUP71fJm7AXDoYS4U0c3A2YCe031i4NyOFk=;
 b=klvBix10NyUyin5bGkT2tBxjfcPPCidzr3y3HxtJV5NWMRF2BNZNRwocsgANIGj5QR
 cdlRpxN0q11IjNhRBkjTQA2TsR/FLQvRS4yWdo/mL9EFfTVy2pBpM+SGa2TGzhSsRgpS
 AoRwj5C//5UN4DkaCKXpb22JvwWeMeYvwqUxv6mv+Ay6oIYfQGk9L9TrSp2Q9Cuw6C1T
 tEbz04KmecbAOUzKSaGbnpPW7VBh7i0dh2x2BdnUnxAu5Kq0fwQxhdM5p2FPLuToZleT
 A7WopHLoFf8JM/yM/SBlQWbnjv+LnGLWvRg36fQPYJjPXUqkYyaNWk3kNblScwHIhPRB
 GMTQ==
X-Gm-Message-State: AOAM532v2XSOKH+/CkHWfXi0rrTaGul0xyl3YsRQoZgDvAKD7PyL2ihr
 r3v9fY0p7rT2daEdtn7SVSFU0Gs6nliH2+lB/VXO
X-Google-Smtp-Source: ABdhPJw3M9QJo4gT/kWFleMGJ5rEQXhIfF4Zs7nszqf3qPHIH8DOVOE7ZAr6MYqPsAvEFDr0hpegSemYNLYr95/j91g=
X-Received: by 2002:a6b:7319:: with SMTP id e25mr5224880ioh.0.1615949446096;
 Tue, 16 Mar 2021 19:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210216221208.2860-1-gary@garyguo.net>
 <e50f40a65f10e40c8d601791c0856cc6@mailhost.ics.forth.gr>
 <LO2P265MB074925F26234B27EF0D96D0AD66B9@LO2P265MB0749.GBRP265.PROD.OUTLOOK.COM>
 <5f829b8bc5d78b8c75dbcfdb5921119a@mailhost.ics.forth.gr>
In-Reply-To: <5f829b8bc5d78b8c75dbcfdb5921119a@mailhost.ics.forth.gr>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 16 Mar 2021 19:50:35 -0700
Message-ID: <CAOnJCU+VKZKmi4fN_hXZDjXjC7UGKGoTxe43eb+8Tn-=oUw52Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: enable TIME CSR in U mode
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Gary Guo <gary@garyguo.net>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_025048_949332_A48D7DC0 
X-CRM114-Status: GOOD (  35.65  )
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

T24gVHVlLCBNYXIgMTYsIDIwMjEgYXQgMTo1MyBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IFRoZW4gd2UgYWxzbyBuZWVkIHRvIG1vZGlmeSB0aGUgY3Vy
cmVudCBwZXJmIGNvZGUgdGhhdCBhc3N1bWVzIGUuZy4gdGhhdAo+IGluc3RyZXQgaXMgZW5hYmxl
ZC4gSSdkIHN1Z2dlc3QgdGhhdCB1bnRpbCB3ZSBoYXZlIGFuIFNCSSBpbnRlcmZhY2UKPiAoc2lu
Y2Ugd2UgYWxzbyBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBlbmFibGVkIGNvdW50ZXJzIGFy
ZSBhbHNvIHNldAo+IG9uIG1jb3VudGVyZW4pIGZvciBlbmFibGluZyAvIGRpc2FibGluZyBjb3Vu
dGVycywgd2UgbGVhdmUgdGhpcyB0byB0aGUKPiBmaXJtd2FyZS4KPgoKSnVzdCBGWUk6CkkganVz
dCBzZW50IHRoZSByZXZpc2VkIHZlcnNpb24gb2YgU0JJIFBNVSBleHRlbnNpb24gcGF0Y2ggdG8g
dGhlIHVuaXgKcGxhdGZvcm0gbWFpbGluZyBsaXN0LgpodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9n
L3RlY2gtdW5peHBsYXRmb3Jtc3BlYy9tZXNzYWdlLzU5OAoKSSBhbSBtb3N0bHkgZG9uZSB3aXRo
IE9wZW5TQkkvTGludXgga2VybmVsIGltcGxlbWVudGF0aW9uIGFzIHdlbGwgYW5kCndpbGwgYmUg
c2VuZGluZyBwYXRjaGVzCnNvbWV0aW1lIHRoaXMgd2Vlay4KCj4gUmVnYXJkcywKPiBOaWNrCj4K
PiDOo8+EzrnPgiAyMDIxLTAzLTE2IDA4OjI0LCBHYXJ5IEd1byDOrc6zz4HOsc+IzrU6Cj4gPiBJ
IGRvbid0IHRoaW5rIHdlIHNob3VsZCBsZXQgdGhlIGZpcm13YXJlIHRvIGRlY2lkZSB3aGljaCBw
ZXJmb3JtYW5jZQo+ID4gY291bnRlciBDU1JzIGNhbiBiZSB1c2VkIGJ5IHRoZSB1c2Vyc3BhY2Uu
IE5vIGNvdW50ZXIgc2hvdWxkIGJlCj4gPiBhbGxvd2VkIHVubGVzcyB0aGVyZSBpcyBhIHJlYXNv
biB0byBhbGxvdyBpdCwgbGlrZSB0aGUgdGltZXIgQ1NSLgo+ID4gQWxzbywgT3BlblNCSSBpcyBu
b3QgdGhlIG9ubHkgU0JJIGltcGxlbWVudGF0aW9uLDsgdGhlcmUgY291bGQgYmUgbm8KPiA+IFNC
SXMgYXQgYWxsIChpLmUuIE0gbW9kZSkgb3IgaGF2ZSBvdGhlciBTQklzIHRoYXQgaGF2ZSBkaWZm
ZXJlbnQKPiA+IGRlZmF1bHRzLgo+ID4KPiA+IEJlc3QsCj4gPiBHYXJ5Cj4gPgo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3Mu
Zm9ydGguZ3I+Cj4gPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggNCwgMjAyMSA1OjM1IFBNCj4gPiBU
bzogR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+Cj4gPiBDYzogbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gcmlzY3Y6IGVuYWJsZSBUSU1F
IENTUiBpbiBVIG1vZGUKPiA+Cj4gPiDOo8+EzrnPgiAyMDIxLTAyLTE3IDAwOjEyLCBHYXJ5IEd1
byDOrc6zz4HOsc+IzrU6Cj4gPj4gQWZ0ZXIgYWQ1ZDExMiB3ZSBsZXQgdGhlIHVzZXIgbW9kZSB0
byB1c2UgcmR0aW1lIGRpcmVjdGx5IGZvciB0aW1lCj4gPj4gYWNjZXNzLiBUaGlzIHdvcmtzIGlm
IHRoZSBoYXJkd2FyZSBkb2VzIG5vdCBpbXBsZW1lbnQgdGhlIFRJTUUgQ1NSIGFuZAo+ID4+IHRy
YXBzIHRvIHRoZSBmaXJtd2FyZS4gVGhlIHNwZWMgaG93ZXZlciBkb2VzIGFsbG93IGEgaGFyZHdh
cmUKPiA+PiBpbXBsZW1lbnRhdGlvbiB0byByZWRpcmVjdCB0aGUgQ1NSIGFjY2VzcyB0byB0aGUg
bWVtb3J5LW1hcHBlZCBNVElNRQo+ID4+IENTUiwgYW5kIGlmIHRoaXMgaXMgcGVyZm9ybWVkIGl0
IHdpbGwgY2hlY2sge00sU31DT1VOVEVSRU4gQ1NSIHRvIHNlZQo+ID4+IGlmIGl0IGlzIGFsbG93
ZWQuCj4gPj4KPiA+PiBUbyBwcmV2ZW50IHVuaGFuZGxlZCBpbGxlZ2FsIGluc3RydWN0aW9uIGZh
dWx0IG9uIHRoZXNlIHBsYXRmb3Jtcywgd2UKPiA+PiBjYW4gcmVxdWVzdCB0aGVzZSBDU1JzIHRv
IGJlIGVuYWJsZWQgaW4gVS1tb2RlLiBGb3IgcGxhdGZvcm1zIHRoYXQKPiA+PiBkb2VzIG5vdCBz
dXBwb3J0IHRoZSBUSU1FIENTUiB0byBNVElNRSBDU1IgY29udmVyc2lvbiwgdGhleSB3aWxsCj4g
Pj4gaGFyZHdpcmUgY29ycmVzcG9uZGluZyBiaXQgaW4gQ09VTlRFUkVOIHRvIHplcm8gYW5kIHRo
aXMgd291bGQgYmUgYQo+ID4+IG5vLW9wLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogR2FyeSBH
dW8gPGdhcnlAZ2FyeWd1by5uZXQ+Cj4gPj4gLS0tCj4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL2hl
YWQuUyB8IDYgKysrKysrCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMgaW5kZXgKPiA+PiAwYTRlODFiOGRjNzkuLjVhN2E2MjE5MDM0MiAxMDA2
NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPiA+PiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9oZWFkLlMKPiA+PiBAQCAtMTkwLDYgKzE5MCw5IEBAIEVOVFJZKF9zdGFydF9r
ZXJuZWwpICAuYWxpZ24gMgo+ID4+ICBwbXBfZG9uZToKPiA+Pgo+ID4+ICsgICAgLyogQWxsb3cg
dXNlci1tb2RlIHRvIGFjY2VzcyB0aW1lIENTUiAqLwo+ID4+ICsgICAgY3NydywgQ1NSX01DT1VO
VEVSRU4sIDIKPiA+PiArCj4gPj4gICAgICAvKgo+ID4+ICAgICAgICogVGhlIGhhcnRpZCBpbiBh
MCBpcyBleHBlY3RlZCBsYXRlciBvbiwgYW5kIHdlIGhhdmUgbm8gZmlybXdhcmUKPiA+PiAgICAg
ICAqIHRvIGhhbmQgaXQgdG8gdXMuCj4gPj4gQEAgLTE5Nyw2ICsyMDAsOSBAQCBwbXBfZG9uZToK
PiA+PiAgICAgIGNzcnIgYTAsIENTUl9NSEFSVElECj4gPj4gICNlbmRpZiAvKiBDT05GSUdfUklT
Q1ZfTV9NT0RFICovCj4gPj4KPiA+PiArICAgIC8qIEFsbG93IHVzZXItbW9kZSB0byBhY2Nlc3Mg
dGltZSBDU1IgKi8KPiA+PiArICAgIGNzcncgQ1NSX1NDT1VOVEVSRU4sIDIKPiA+PiArCj4gPj4g
ICAgICAvKiBMb2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLwo+ID4+ICAub3B0aW9uIHB1c2gKPiA+
PiAgLm9wdGlvbiBub3JlbGF4Cj4gPgo+ID4gU2hvdWxkbid0IHdlIHVzZSBjc3JycyBoZXJlIHRv
IHByZXNlcnZlIGN1cnJlbnQgc2V0dGluZ3MgZnJvbSB0aGUKPiA+IGZpcm13YXJlID8gQWxzbyBP
cGVuU0JJIGF0IHRoaXMgcG9pbnQgc2V0cyBib3RoIE1DT1VOVEVSRU4vU0NPVU5URVJFTgo+ID4g
dG8gLTEsIGRvZXMgYW55b25lIGVsc2UgbW9kaWZ5IHRoYXQgdmFsdWUgPwo+ID4KPiA+IFJlZ2Fy
ZHMsCj4gPiBOaWNrCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
