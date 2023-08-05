Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92563C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 01:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykHU4Kwx3sN1Ui+3D9mg7unPDm2BuRJu+3lHibXmkIk=; b=slaAk2h8nOUrTq
	lnTCsO4jWpl4SS6OSb5oZSBkSHGZFt/L8BJkOIV052epqk/N002leSOa+YHG2chhCYlKPJ6AUpeSK
	FPf3A3yol1xgsBS/hJe7KqGRC/Mexe8Wz4vF2Nm3IQcKRMQjXhZEMHFK0sl4TYxY0kQDMCF2XKvr7
	+6v3MzgaCysKUmUeg/6kGOGG3DH5KKObq6skpE+q7Ul0qSx2IS9Y5CbJBPI61vbauGxT/NMJS1ibe
	G8oiF96fGMmpmp3CzTrUkemFX1rikuO1V3ZOFyvbJ5kbAglAw31bh06Ioxaq59z67u0COZd9RyRqH
	v0SCpwXiRDMRRYQ8MBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS6Ba-00DXy3-1V;
	Sat, 05 Aug 2023 01:34:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS6BX-00DXxQ-0G;
	Sat, 05 Aug 2023 01:34:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1DD06218F;
	Sat,  5 Aug 2023 01:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B486DC433CA;
	Sat,  5 Aug 2023 01:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691199264;
	bh=UkkECz0SKKCkivKFDJEqDUQwrEINAh9R2xIlCYeCniA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UYuK+cvjT6nZ/XkMal54FeFjpJlfz7BK6QS5uRKpnm3cycNFTsn815fhr/fohXlRv
	 EgJ19W1Yp90cblx4/CRfsJGPiEnVSVePn6RYo7P48yLDNckNk0gz+lPcBJ/vN7GpuH
	 00fHfm+oyGBcJkoIfvNomr5aP1Wlq8BPu86juXVEdBMiFI/Yj/oBPFJ6kc8syHJaAB
	 11uWu5fR27vq8+Mbe1lHVb0+WRXd1NR0ZXHgrKHbUi2McQzV8lbukhz3RvluBJUujB
	 2Jji5jBers8/YdARIhfd8rnF3XcDVd2j0CAotUn6Bo3xji2e0sNRBSqeg8AH+QGM8C
	 ujLtv9fjHqszg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so44312581fa.1;
        Fri, 04 Aug 2023 18:34:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy0h+rnGnimp5fNR/bi6Oa3y1VSxdWzR+kNQLML+7ddbKA6xNET
	UhA9CVXAeEOfH/NN+mRZa4rULTKr2APqLm2hifw=
X-Google-Smtp-Source: AGHT+IEoJbr4XD191wjGp8jRWLZQF1uUqz0ENjdhQ6LBqGzkNzLSgEtpH+LiRo3dp1tLRPlT1FCSUgi6UKzFod+zQRc=
X-Received: by 2002:ac2:5bca:0:b0:4f9:dac6:2f41 with SMTP id
 u10-20020ac25bca000000b004f9dac62f41mr2128088lfn.2.1691199262701; Fri, 04 Aug
 2023 18:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com> <20230418-elliptic-headboard-6a18fcccdf07@spud>
 <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
 <ZMsCl9LaMvx38zMY@gmail.com> <20230803-12cf578826747ddb63046bff@orel>
In-Reply-To: <20230803-12cf578826747ddb63046bff@orel>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 5 Aug 2023 09:34:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRjZAE4O60bL_hbugwHX9=-7jKXBKqPzE4fTyFShTctbA@mail.gmail.com>
Message-ID: <CAJF2gTRjZAE4O60bL_hbugwHX9=-7jKXBKqPzE4fTyFShTctbA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Juergen Gross <jgross@suse.com>, "Srivatsa S . Bhat" <srivatsa@csail.mit.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_183427_212637_168B0A00 
X-CRM114-Status: GOOD (  27.89  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCAyOjQ44oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAwMiwgMjAyMyBhdCAwOToyNzo1
MVBNIC0wNDAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMTA6
MTU6NTRBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEFwciAxOCwg
MjAyMyBhdCAwNzo0Mzo1MVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4gT24g
TW9uLCBBcHIgMTcsIDIwMjMgYXQgMTI6MzM6NTBQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3Rl
Ogo+ID4gPiA+ID4gVGhlIFNCSSBTVEEgZXh0ZW5zaW9uIGVuYWJsZXMgc3RlYWwtdGltZSBhY2Nv
dW50aW5nLiBBZGQgdGhlCj4gPiA+ID4gPiBkZWZpbml0aW9ucyBpdCBzcGVjaWZpZXMuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFu
YW1pY3JvLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggfCAxNSArKysrKysrKysrKysrKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4g
PiA+ID4gaW5kZXggOTQ1YjdiZTI0OWMxLi40ODViOWVjMjAzOTkgMTAwNjQ0Cj4gPiA+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+ID4gPiBAQCAtMzAsNiArMzAsNyBAQCBlbnVtIHNi
aV9leHRfaWQgewo+ID4gPiA+ID4gICAgICAgICBTQklfRVhUX0hTTSA9IDB4NDg1MzRELAo+ID4g
PiA+ID4gICAgICAgICBTQklfRVhUX1NSU1QgPSAweDUzNTI1MzU0LAo+ID4gPiA+ID4gICAgICAg
ICBTQklfRVhUX1BNVSA9IDB4NTA0RDU1LAo+ID4gPiA+ID4gKyAgICAgICBTQklfRVhUX1NUQSA9
IDB4NTM1NDQxLAo+ID4gPiA+Cj4gPiA+ID4gV2hhdCBpcyB0aGUgc29ydCBvcmRlciBvZiB0aGlz
PyBNYXRjaGluZyB0aGUgc3BlYyBvcmRlcmluZywgb3IganVzdAo+ID4gPiA+IGFwcGVuZC1hdC10
aGUtZW5kPwo+ID4gPgo+ID4gPiBJIGRvbid0IGJlbGlldmUgdGhlcmUncyBhbiBlc3RhYmxpc2hl
ZCBvcmRlci4gSSd2ZSBiZWVuIGdvaW5nIGZvciBzcGVjCj4gPiA+IG9yZGVyLCBJIHRoaW5rLgo+
ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVW5yZWxhdGVkLCBidXQgaW4gY2hlY2tpbmcgdGhhdCBJIHNh
dyB0aGF0IHlvdXIgU1VTUCBzdHVmZiBpcyBpbgo+ID4gPiA+IG1hc3RlciAtIHlvdSBwbGFubmlu
ZyBvbiByZXNlbmRpbmcgdGhhdCBzZXJpZXM/Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgSSBuZWVkIHRv
IHdhaXQgdW50aWwgaXQncyBiZWVuIHJhdGlmaWVkLgo+ID4gRGlkIHlvdSBkaXNjdXNzIHRoZSBT
QklfRVhUX1NUQSBudW1iZXIgb2YgdGhlIFNCSSBzcGVjPyBDb3VsZCB5b3Ugc2hhcmUKPiA+IHRo
ZSBsaW5rIHRvIG1lPyBUaHguCj4gPgo+Cj4gVGhlIG51bWJlciBpcyBqdXN0ICJTVEEiIGluIGhl
eCwgYXMgYWxsIFNCSSBleHRlbnNpb25zIGFyZSBudW1iZXJlZC4gQWxsCj4gZGlzY3Vzc2lvbiBv
ZiB0aGUgc3BlYyB3YXMgb24gdGhlIHRlY2gtcHJzIG1haWxpbmcgbGlzdFsxXS4gU2VhcmNoaW5n
IGZvcgo+ICJzdGVhbCIgaW4gdGhlIGFyY2hpdmVzIGFwcGVhcnMgdG8gcHVsbCB1cCByZWxldmFu
dCB0aHJlYWRzLgo+Cj4gWzFdIGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcnMvbWVz
c2FnZXMKVGh4IGZvciB0aGUgaW5mb3JtYXRpb247IEl0IGNvdWxkIGd1aWRlIG1lIHRvIHNlbmQg
dGhlIFNCSV9FWFRfUFZMT0NLIHJlcXVlc3QuCgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+CgoKLS0g
CkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
