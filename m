Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C7EC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS5X644ttrhbEsiPV3QmDJk9E/gsZoQx2RWagY9NE/w=; b=eyD347rurojFOF
	c59oM8uQm3Idkd6GHHhzm82AYDJCS2LLNH07CASycPiNJZnyEYrmLnOKI/6YRp8BGOn5Z9XuqYkIC
	fr3oyoBwRn0dEMZqTUoZJVsvNIcxfTiJvLCnp1pw3n5lezAUeFxwnXUjMJzR3SjZsW0dSkM41qvJe
	6e8ePkbuLF0fpnd5p6XRbedcpSd2LCKpgjh2TD4nwcBa9WINudm8GVE4IhqYikfWmglIiShF450AR
	fCBMmRzzS2yxB/16jgTum2oiJvEiGdsXYut681IzY/JXFZwpynjeZl7IqOPcTvmez/L0e9A/vDiNb
	ROlrhVMTeLjI/NoIg9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4wS-00HKUZ-1m;
	Wed, 22 Mar 2023 20:20:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4wO-00HKTa-1L;
	Wed, 22 Mar 2023 20:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C04F9622AF;
	Wed, 22 Mar 2023 20:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB27C433EF;
	Wed, 22 Mar 2023 20:20:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PIpcYJJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679516405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5+SwuPswYL3502uLq6hayJyZoDC1sf3E/Ormc16ROU=;
	b=PIpcYJJX9hptjh826y5Zn1hijTEsvDVh/1kxhA5t7yY8jKbnkGW/3rbZoRKDCRTbCTys4P
	3QZp7sJr5kpsH2zTiTTlMjtJqloSLUXN+PQif21I15YKfofGKoVtnBSR+AkwAO7vyKxz9L
	MfjhDwRthXZ3JvuQdpcHb0/LNa2VkB8=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6bab4339 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 22 Mar 2023 20:20:05 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id p204so11381709ybc.12;
        Wed, 22 Mar 2023 13:20:03 -0700 (PDT)
X-Gm-Message-State: AAQBX9ePAAbsyYUxidlufyb8JKhbGdnmFy4wh47fyREOWWRuJe0KbfrQ
	rABU/XiiEv616mALRdsJ0y9nhU8MekghSuh1VRk=
X-Google-Smtp-Source: AKy350bWxTp/xybNZinLNHP3Psjfx3ze++rR/f/Zifi7U6qVfp5MpEnhwyDwi6qNcOLgfT72uieS4Q5S4dRvTCc87PU=
X-Received: by 2002:a05:6902:1081:b0:b21:a3b8:45cd with SMTP id
 v1-20020a056902108100b00b21a3b845cdmr765321ybu.0.1679516401893; Wed, 22 Mar
 2023 13:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <ZBruFRwt3rUVngPu@zx2c4.com> <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel> <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel> <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
In-Reply-To: <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Mar 2023 21:19:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
Message-ID: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU support
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_132012_752373_0B5D4F09 
X-CRM114-Status: GOOD (  21.64  )
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

T24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgOTowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1hciAyMiwgMjAyMyBhdCAwNzo0NDoxM1BNICsw
MDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBXZWQsIE1hciAyMiwgMjAyMyBhdCAwODoy
NjoxMFBNICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgTWFyIDIyLCAy
MDIzIGF0IDAzOjE3OjEzUE0gKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gPiBPbiBX
ZWQsIE1hciAyMiwgMjAyMyBhdCAwMTo0NjozMVBNICswMTAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6
Cj4gPgo+ID4gPiA+ID4gKEl0J3MgdGVtcHRpbmcgdG8ganVzdCBzZWxlY3QgUklTQ1ZfQUxURVJO
QVRJVkUgZnJvbSBSSVNDViwgYnV0IG1heWJlIHdlCj4gPiA+ID4gPiAgY2FuIGRlZmVyIHRoYXQg
d2VkZGluZyBhIGJpdCBsb25nZXIuKQo+ID4gPiA+Cj4gPiA+ID4gQXQgdGhhdCBwb2ludCwgdGhl
IGNvbmZpZyBvcHRpb24gc2hvdWxkIGp1c3QgZ28gYXdheSBlbnRpcmVseSwgbm8/Cj4gPiA+Cj4g
PiA+IEFoLCB5ZXMsIGFuZCB0aGF0IG1ha2VzIHRoZSBpZGVhIGV2ZW4gbW9yZSBhdHRyYWN0aXZl
LCBhcyB3ZSBjb3VsZCByZW1vdmUKPiA+ID4gc2V2ZXJhbCBpZmRlZnMuCj4gPgo+ID4gSSB3ZW50
IGFuZCBkaWQgdGhlIGN1cnNvcnkgY2hlY2ssIGl0J3Mgbm90IGNvbXBhdGlibGUgd2l0aCBYSVBf
S0VSTkVMIHNvCj4gPiBkcm9wcGluZyB0aGUgb3B0aW9uIGVudGlyZWx5IHByb2JhYmx5IGlzbid0
IGEgcG9zc2liaWxpdHkgOi8KPgo+IFdoYXQgSSBzYWlkIGlzIG9ubHkgbm93IHNpbmtpbmcgaW4u
IFdlJ3JlIG5vdyBnb2luZyB0byBiZSBkaXNhYmxpbmcgRlBVCj4gc3VwcG9ydCBvbiBYSVAga2Vy
bmVscyB3aXRoIHRoaXMgcGF0Y2guCj4gV2VsbCwgdGVjaG5pY2FsbHkgbm90IHRoaXMgcGF0Y2gg
c2luY2UgaXQgd291bGRuJ3QgaGF2ZSBidWlsdCB3aXRob3V0Cj4gSmFzb24ncyBjaGFuZ2VzLCBi
dXQgdGhhdCBkb2Vzbid0IHNlZW0gbGlrZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uLi4KCkkgc3Vw
cG9zZSB5b3UgY291bGQgaGF2ZSByaXNjdl9oYXNfZXh0ZW5zaW9uXyooKSBmYWxsIGJhY2sgdG8K
c29tZXRoaW5nIHRoYXQgZG9lc24ndCB1c2UgYWx0ZXJuYXRpdmVzIG9uIFhJUCBrZXJuZWxzLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
