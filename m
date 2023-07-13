Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28587C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nbe+xYv+JfyfaYcaSW5ZRjE/a8S4GO0YsE5R1QUblvE=; b=IegdOocmkcv31y
	tSg0wctkW2p1iipchaZT9KxHLbFlgRKR5GsCUQFDT8S3aS8c3cTeLY6W35m7VOwvCHFjXFPlA1Bnd
	6Q3OM6Yu0hwA3JKUAXrFTv0lp4zBcQMtWVjTPGsYRZC6+cZywddeenj8CjrHFEqVDCme4OgNtpWXc
	4tSWmhP6rxUn7Pn910QMclmeM+tcYNwb6yw/2x0QLw5yvhg850fan+/4GnsOlmzwMKwurVyC8CahV
	X8o2Jf1fpLY/vXvmuzAtlSQgYp8DGnbsjmQphrDvzUMUyrw8wh6camiFyuIy12+s45UjmrwuqQLIb
	xA7M5fceaika4VwZoNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1S0-004B2P-25;
	Thu, 13 Jul 2023 18:54:04 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Rw-004Azh-00
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 18:54:03 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55bc29a909dso632036a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689274437; x=1691866437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/Rh3N7Hpk2RvvFOi7xZjggtoYOkILDnWZuYI4DoA10=;
        b=HW5cIj8f6UrrRKqCSEGCEMigQIuAtz5FZOoyenrcfjQXnkfk3x91KqAgmOfMu8rjb0
         Ck7tu7PddO79GoM9qYGS7C5Xmp7NtD3l3Ns10x1+yAakLRUN0IwG4ffbzHFORM5JjEK7
         XoqNvaQKUfKQuOFxG8WDYi3aM5Mwe7+AaPuBKK9Iih+Z8SC1e7KILlhVi9WuzfQdrHlp
         tX9sJsE4pQET7vVqcOht85rsQOHTeT9LGfxwrSPrzw69KHgZP3dH4E01yzu5A0S6DWwQ
         7EBTGYF8Cw5Pp86VOfuv5xYomnc9HKvK9VUJmyCveJoOvbxWORxNPPNzkQ1CVAsvt35m
         O2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689274437; x=1691866437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/Rh3N7Hpk2RvvFOi7xZjggtoYOkILDnWZuYI4DoA10=;
        b=XzBgSbj8JHDyxgj1rIwiSFrEY1bWoRviB8nsTlO2wlXZLWXyZSnqXDpSBibZ87QYJn
         7XDlvcNyrgcvLNUTL6Ofv7V2X7rwOsDN1Y0D8/ZeLevzIw5ppweTrOZxDeIfiB6stviF
         geGXAvny3TocjPPB07cSJ8Fw7rc03W6fs2uo7voKhYgz/okE1FBZopqQghitATlYoZmA
         h1uXjLdevunVToIg6Rl6OqFdbrhl78zziEOlPmoPi1PYE6hl2Bii3kq2dEFiAhaBq+nL
         jUAsJNt2mFpY5V9DJF3Zcvk7mhKPJb7Duh+sDJWfyZx4ywxfGD+gQtE1QQu5BDtfaN8k
         ilrw==
X-Gm-Message-State: ABy/qLYMJ8nLDT9Yp7rQ26RP3bPGvChOSPMm9q+Ccu50084Jh4xiSgnN
	ERrFeboEBDaAJWyj4asaqY0=
X-Google-Smtp-Source: APBJJlH+ZBRMwsng5OvfXU8dbB3Xd4jXwQ7bYsHQHvrkPh/St/88lWUsQjEONL/kaZAV4BM6m8npqA==
X-Received: by 2002:a17:90a:43c3:b0:260:d8c0:ae79 with SMTP id r61-20020a17090a43c300b00260d8c0ae79mr1339393pjg.35.1689274436784;
        Thu, 13 Jul 2023 11:53:56 -0700 (PDT)
Received: from localhost (dhcp-72-235-13-41.hawaiiantel.net. [72.235.13.41])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090a2a4d00b00262eccfa29fsm13036699pjg.33.2023.07.13.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 11:53:56 -0700 (PDT)
Date: Thu, 13 Jul 2023 08:53:55 -1000
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZLBIQ550U-PhkuKJ@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <20230712080504.GA3100107@hirez.programming.kicks-ass.net>
 <CAMuHMdUMRS9_nJXp3rrWQrODRQcBQggze0k=0GjSScCknFmmgQ@mail.gmail.com>
 <20230712122745.GH3100107@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712122745.GH3100107@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_115400_037649_140083C1 
X-CRM114-Status: GOOD (  19.95  )
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

T24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMDI6Mjc6NDVQTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgMTE6MDQ6MTZBTSArMDIwMCwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gSG9pIFBldGVyLAo+ID4gCj4gPiBPbiBXZWQsIEp1bCAx
MiwgMjAyMyBhdCAxMDowNeKAr0FNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9y
Zz4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDExLCAyMDIzIGF0IDExOjM5OjE3QU0gLTEwMDAs
IFRlanVuIEhlbyB3cm90ZToKPiA+ID4gPiBJIHdvbmRlciB3aGV0aGVyIHRoZSByaWdodCB0aGlu
ZyB0byBkbyBoZXJlIGlzIHNvbWVob3cgc2NhbGluZyB0aGUgdGhyZXNob2xkCj4gPiA+ID4gYWNj
b3JkaW5nIHRvIHRoZSByZWxhdGl2ZSBwcm9jZXNzaW5nIHBvd2VyLiBJdCdzIGRpZmZpY3VsdCB0
byBjb21lIHVwIHdpdGggYQo+ID4gPiA+IHRocmVzaG9sZCB3aGljaCB3b3JrcyB3ZWxsIGFjcm9z
cyB0aGUgbGF0ZXN0ICYgZmFzdGVzdCBhbmQgcmVhbGx5IHRpbnkgQ1BVcy4KPiA+ID4gPiBJJ2xs
IHRoaW5rIGFib3V0IGl0IHNvbWUgbW9yZSBidXQgaWYgeW91IGhhdmUgc29tZSBpZGVhcywgcGxl
YXNlIGZlZWwgZnJlZQo+ID4gPiA+IHRvIHN1Z2dlc3QuCj4gPiA+Cj4gPiA+IFdlIGNvdWxkIHNj
YWxlIGJ5IEJvZ29NSVBTIEkgc3VwcG9zZSwgaXQncyBhIGJvZ3VzIG1lYXN1cmVtZW50LCBhcyBw
ZXIKPiA+ID4gdGhlIG5hbWUsIGJ1dCBpdCBkb2VzIGhhdmUgc29tZSByZWxhdGlvbiB0byBob3cg
ZmFzdCB0aGUgbWFjaGluZSBpcy4KPiA+IAo+ID4gVGhhdCdzIGdvbm5hIGZhaWwgbWlzZXJhYmx5
IG9uIGUuZy4gQVJNIGFuZCBSSVNDLVYsIHdoZXJlIEJvZ29NSVBTCj4gPiBkZXBlbmRzIG9uIHNv
bWUgdGltZXIgZnJlcXVlbmN5Lgo+ID4gCj4gPiBSLUNhciBNMi1XIHdpdGggMS41IEdIeiBDb3J0
ZXgtQTE1OiA0MC4wMCBCb2dvTUlQUwo+ID4gUi1DYXIgVjRIIHdpdGggMS44IEdIeiBDb3J0ZXgt
QTc2OiAzMy4zMyBCb2dvTUlQUwo+ID4gCj4gPiB3aGlsZSB0aGUgcmVhbCBzbG93IDQ4IE1IeiBW
ZXhSaXNjViBnZXRzIDEyOCBCb2dvTUlQUy4KPiAKPiBIZWhlLCBPSywgcmVhbGx5IGJvZ3VzIHRo
ZW4uIExldHMgZmlsZSB0aGlzIGlkZWEgaW4gdGhlIGJpdC1idWNrZXQgdGhlbi4KCkkgdGhpbmsg
aXQgY2FuIHN0aWxsIGJlIHVzZWZ1bC4gT24gcnl6ZW4gMzk3NXd4LCBpdCdzIDY5ODkuOTIsIHNv
IHdoaWxlIGl0Cm1heSBiZSBvZmYgYnkgc29tZSBodW5kcmVkcyBvZiBwZXJjZW50cywgdGhlcmUg
YXJlIHN0aWxsIG9yZGVycyBvZiBtYWduaXR1ZGUKc2lnbmFsIHJhbmdlIGFuZCB0aGF0IHNob3Vs
ZCBiZSBlbm91Z2ggdG8gc3VwcHJlc3MgbW9zdCBzcHVyaW91cyB3YXJuaW5ncy4KSSdsbCBwb3N0
IHNvbWV0aGluZyBsYXRlciB0b2RheS4KClRoYW5rcy4KCi0tIAp0ZWp1bgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
