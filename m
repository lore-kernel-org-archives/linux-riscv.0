Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01670C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frImKRL9AdN4k4YY3IysGibs/y0x0sGWKmIyik9gIOk=; b=40aUzo8vXI/kI6
	+h2M9MQmAXDJb7QlEY1yQjs6+H6e1gAazEauQ6fmPLfZlsrtSHW0SdmeO51HshTgJhMHfiKQaRyVv
	ziuHK0OCbIG2stdWPduGqAok9nEt2Po2DeaMO8SNRFC/dVEEfNCwOzxkeeR0htq5etbGu0yHUHfrx
	TlXC8412dDFiH9D0tVZjSJ+yazmh6HDTsVTNnwnVkr1bB2I0zSdBJyoTowjY3BXNy9Xsa7aHwoJNW
	MJnvvzDijrLJMDqJy2DgJKPKhI1NryVTVDRCAEq014h3NJ3nWsGH/4cm/3pbvoDJUJgsOMV4V+jcP
	Zgnd0TavjO0DpIBZi02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYwti-00000002911-0dq8;
	Sat, 10 Feb 2024 23:36:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYwte-0000000290I-27Fw;
	Sat, 10 Feb 2024 23:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC8D860BF0;
	Sat, 10 Feb 2024 23:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673E2C43390;
	Sat, 10 Feb 2024 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707608193;
	bh=8C4oWiGJS6yH0qp9Eaxr3aYeI/i7oae3HE05t0tAldw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r6t6/SsaqOeeKJNUPVfZVjJbcNK3RRFmjuHojyVxfSItVDZ2TZuyB0EoFbkGs6cmN
	 fGZld4TdjiPZzaIrvGq0du2QE1WrRIwg1uaqftL/+TqHZD3PNrucg9KdOFYRvRjKht
	 Kk1w763J7dFF4u8iFKmo/Al3fa5jdjRgBZmxwu3QQfGQKxR2EAZ/epiWFzxP2MBMLL
	 6EpLosITDbsxVYxLRJlLLsek+7D2LtphnIXyz/MDB66zxzPmJbFpf348/1QD6IEBDf
	 JkxUs5J1dYgy0PVeh32WpGx+62i+nsng5YkqPRc8G/xgNnSiNVpMiC7yg4l3Cyh7DN
	 UQ+VQmrfIJsvQ==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40efcb37373so17134765e9.2;
        Sat, 10 Feb 2024 15:36:33 -0800 (PST)
X-Gm-Message-State: AOJu0YyBSwcqKyjbyo/RnKtOE2dGES+u3CwZcqusmJe0DK5kMbOO3h1B
	JiKl3R6mhk33mj2BTLWr5Rt3FQNtY6mqVNbbAYnA8Hg4npFBvYWeOK31/ss5hJ7U34rJsO9fMps
	pLOiGaZdnt1RjJb7V2DIR/3UAwwU=
X-Google-Smtp-Source: AGHT+IHoPMgBc81DnEPnPXoeHzmCqVcP4g7071LwOfBl3+AxfjKX8A2egkFqcIRNQszoXkfIPToNa/RR1WwBksr57rI=
X-Received: by 2002:a19:e048:0:b0:511:68d4:1e39 with SMTP id
 g8-20020a19e048000000b0051168d41e39mr2050802lfj.0.1707608171430; Sat, 10 Feb
 2024 15:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20240210074601.5363-1-xtex@envs.net> <20240210074601.5363-2-xtex@envs.net>
 <ZcdP7CC+OMbp5ZMi@shell.armlinux.org.uk> <ZcfoZKJHkdEh5JmV@fjasle.eu>
In-Reply-To: <ZcfoZKJHkdEh5JmV@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 11 Feb 2024 08:35:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPm7PXoKM+id25wX9AtVmmXvE7i8GrGB9etU__EMUwdg@mail.gmail.com>
Message-ID: <CAK7LNAQPm7PXoKM+id25wX9AtVmmXvE7i8GrGB9etU__EMUwdg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Zhang Bingwu <xtex@envs.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Zhang Bingwu <xtexchooser@duck.com>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_153634_655671_A13DE3CD 
X-CRM114-Status: GOOD (  23.96  )
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

T24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgNjoyMeKAr0FNIE5pY29sYXMgU2NoaWVyIDxuaWNvbGFz
QGZqYXNsZS5ldT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEZlYiAxMCwgMjAyNCBhdCAxMDoyOTowMEFN
ICswMDAwIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+IE9uIFNhdCwgRmViIDEwLCAy
MDI0IGF0IDAzOjQ2OjAwUE0gKzA4MDAsIFpoYW5nIEJpbmd3dSB3cm90ZToKPiA+ID4gRnJvbTog
WmhhbmcgQmluZ3d1IDx4dGV4Y2hvb3NlckBkdWNrLmNvbT4KPiA+ID4KPiA+ID4gU2V0dGluZyAn
LWUnIGZsYWcgdGVsbHMgc2hlbGxzIHRvIGV4aXQgd2l0aCBlcnJvciBleGl0IGNvZGUgaW1tZWRp
YXRlbHkKPiA+ID4gYWZ0ZXIgYW55IG9mIGNvbW1hbmRzIGZhaWxzLCBhbmQgY2F1c2VzIG1ha2Uo
MSkgdG8gcmVnYXJkIHJlY2lwZXMgYXMKPiA+ID4gZmFpbGVkLgo+ID4gPgo+ID4gPiBCZWZvcmUg
dGhpcywgbWFrZSB3aWxsIHN0aWxsIGNvbnRpbnVlIHRvIHN1Y2NlZWQgZXZlbiBhZnRlciB0aGUK
PiA+ID4gaW5zdGFsbGF0aW9uIGZhaWxlZCwgZm9yIGV4YW1wbGUsIGZvciBpbnN1ZmZpY2llbnQg
cGVybWlzc2lvbiBvcgo+ID4gPiBkaXJlY3RvcnkgZG9lcyBub3QgZXhpc3QuCj4gPiA+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IFpoYW5nIEJpbmd3dSA8eHRleGNob29zZXJAZHVjay5jb20+Cj4gPiA+
IC0tLQo+Cj4gVGhhbmtzIGZvciBmaXhpbmchCj4KPiBbLi4uXQo+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9pbnN0YWxsLnNoIGIvYXJjaC9hcm0vYm9vdC9pbnN0YWxsLnNoCj4gPiA+
IGluZGV4IDllYzExZmFjN2Q4ZC4uMzRlMmM2ZTMxZmQxIDEwMDc1NQo+ID4gPiAtLS0gYS9hcmNo
L2FybS9ib290L2luc3RhbGwuc2gKPiA+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9pbnN0YWxsLnNo
Cj4gPiA+IEBAIC0xNyw2ICsxNyw4IEBACj4gPiA+ICAjICAgJDMgLSBrZXJuZWwgbWFwIGZpbGUK
PiA+ID4gICMgICAkNCAtIGRlZmF1bHQgaW5zdGFsbCBwYXRoIChibGFuayBpZiByb290IGRpcmVj
dG9yeSkKPiA+ID4KPiA+ID4gK3NldCAtZQo+ID4gPiArCj4gPgo+ID4gV2hhdCBhYm91dCAjIS9i
aW4vc2ggLWUgb24gdGhlIGZpcnN0IGxpbmUsIHdoaWNoIGlzIHRoZSBtb3JlIG5vcm1hbCB3YXkK
PiA+IHRvIGRvIHRoaXMgZm9yIGFuIGVudGlyZSBzY3JpcHQ/Cj4KPiBhcmUgeW91IHN1cmU/ICBJ
IGNhbiBmaW5kIG1hbnkgbW9yZSBvY2N1cnJlbmNlcyBvZiAnc2V0IC1lJyB0aGFuIHRoZQo+IHNo
ZWJhbmcgdmVyc2lvbiBpbiB0aGUgTGludXggdHJlZSwgZXNwZWNpYWxseSBpbiB0aGUga2J1aWxk
IHNjcmlwdHMsIHRodXMKPiBpdCdzIGJpa2Utc2hlZGRpbmcsIGlzbid0IGl0Pwo+Cj4gUmV2aWV3
ZWQtYnk6IE5pY29sYXMgU2NoaWVyIDxuaWNvbGFzQGZqYXNsZS5ldT4KPgo+IEtpbmQgcmVnYXJk
cywKPiBOaWNvbGFzCgoKCgoKCldoZW4geW91IHB1dCAtZSBvbiB0aGUgc2hlYmFuZyBsaW5lLCBs
aWtlCgogICAgIyEvYmluL3NoIC1lCgp0aGUgb3B0aW9uIC1lIGlzIHNldCB3aGVuIHlvdSBkbzoK
CiAgICAkIGFyY2gvYXJtL2Jvb3QvaW5zdGFsbC5zaAoKCkJ1dCwgLWUgaXMgbm90IHNldCB3aGVu
IHlvdSBkbzoKCiAgICAkIHNoIGFyY2gvYXJtL2Jvb3QvaW5zdGFsbC5zaAoKCgpUaGUgcmVhc29u
IGlzIG9idmlvdXMgYmVjYXVzZSB0aGUgbGF0dGVyIGNhc2UKZG9lcyBub3QgdXNlIHRoZSBzaGVi
YW5nIGxpbmUuCgoKCgpJbiBLYnVpbGQsIHNvbWUgcGxhY2VzIHJ1biB0aGUgc2NyaXB0IGRpcmVj
dGx5IGxpa2UgdGhlIGZvcm1lciBjYXNlLAphbmQgb3RoZXJzIHVzZSBDT05GSUdfU0hFTEwgbGlr
ZQoKICAgJChDT05GSUdfU0hFTEwpIGFyY2gvYXJtL2Jvb3QvaW5zdGFsbC5zaAoKClRoZSBpbmNv
bnNpc3RlbmN5IGlzIG5vdCBuaWNlLCBidXQgdGhhdCBpcyBhIGRpZmZlcmVudCBpc3N1ZS4KCgpU
aGUgc2VwYXJhdGUgJ3NldCAtZScgc3RhdGVtZW50IHdvcmtzIGZvciBib3RoIGNhc2VzLApzbyBJ
IHRoaW5rIHRoaXMgaXMgc2FmZXIsIHRob3VnaCBpdCBpcyBraW5kIG9mIGJpa2Utc2hlZGRpbmcu
CgoKCgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
