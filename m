Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079FAC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLZd2XNNT/Ret/NJAwiJkXMmot56tZ7182FXkKGoRTg=; b=Tqdd0TBDcQwl4k
	vdMGU0dSqZiJIh3RvYuwvOJmS68KzwExbJgFYjxeLa6C11S+2B301s5lb+/1X46ugYuocJzd7rc0d
	ywDA/w9C3qgLT6pH4lppGCpPZiMyWeyhqzpVrnosvRGCMPjSwFrArF9uE8IYoR6WYVVmf32z34n5v
	Qy5to3QgyROBScOnun9sQsX+2DWrssrscHz5QBoRzx4Cspeo8QGCColno4sC23mgzX62Zq1m01QHM
	HM3HJ+thTUTaHlwDDa/YHMT8pNxG+kqxXBtUOnfdeFnNtNInMOv6m5QwdAgyrhS0osdWTg/8ubaLa
	RQcWPsnxUMK/38bnIe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHVu-00A1ye-2r;
	Wed, 17 May 2023 13:48:22 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHVr-00A1wD-1h;
	Wed, 17 May 2023 13:48:20 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-504d149839bso196110a12.1;
        Wed, 17 May 2023 06:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684331296; x=1686923296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktinit9wKE6dNmLgC8Q+hzsuqEwfbXOj0+wtuIuj7PA=;
        b=LUggSp02rATYyPKsku9NCDP+m8jbOKY0BVU981mISjz8XKGoCLVULXY6hykhJ8l/ut
         doocXyUh41nHj0SPt4j5KaD2u+XUIET7CFo+dH/DJYJLrv3fms2zynHDxMt+vgSMNXu2
         cUMGTuPs6oqGarqSiJXS2UOnyGjhcYvZpD86lPETCP4AZxJkhG3YYTW4m+vODa8GFp3M
         EoDZ+lNFixxuPe2NOIJT7ieG5no4K1vuo18pBoYpjyBtQNryZ8kI3Y8aP75Gc6/lH8CW
         zbn9Up1IGBKpnXj54rdWZjuaR95AbOB/hWilQmzIhsuvXKLMjZhivCilI5TrZlyrSx26
         ZqzQ==
X-Gm-Message-State: AC+VfDx3ib6zFFk5AEOaSP1QVqYj96CWDTf1LP6cfc4iuPIdqunW3fPu
	V+qpEq+dqhS3URx22qOzJxnTnCenKEQ4cQIjfmg=
X-Google-Smtp-Source: ACHHUZ6M9EgcbaCbKF8EZaqyFXATppYniPvZEHcewZCPT/QYkFrutGUliTGcVVnKvC2nG18eSQY5J4nCD2m1yx3JtWA=
X-Received: by 2002:a17:906:778a:b0:92e:f520:7762 with SMTP id
 s10-20020a170906778a00b0092ef5207762mr2003855ejm.6.1684331295491; Wed, 17 May
 2023 06:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230517131102.934196-1-arnd@kernel.org> <20230517131102.934196-11-arnd@kernel.org>
In-Reply-To: <20230517131102.934196-11-arnd@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 17 May 2023 15:48:04 +0200
Message-ID: <CAJZ5v0h0spuxK-7LBJSU9BK2TEOUeMjf7hhKScadkxFN_RwStQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] suspend: add a arch_resume_nosmt() prototype
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Eric Paris <eparis@redhat.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, audit@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_064819_565656_007DEDDC 
X-CRM114-Status: GOOD (  18.37  )
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

T24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMzoxMuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gVGhlIGFyY2hfcmVzdW1lX25vc210KCkgaGFzIGEgX193ZWFrIGRlZmluaXRpb24sIHBsdXMg
YW4geDg2Cj4gc3BlY2lmaWMgb3ZlcnJpZGUsIGJ1dCBubyBwcm90b3R5cGUgdGhhdCBlbnN1cmVz
IHRoZSB0d28gaGF2ZQo+IHRoZSBzYW1lIGFyZ3VtZW50cy4gVGhpcyBjYXVzZXMgYSBXPTEgd2Fy
bmluZzoKPgo+IGFyY2gveDg2L3Bvd2VyL2hpYmVybmF0ZS5jOjE4OTo1OiBlcnJvcjogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciAnYXJjaF9yZXN1bWVfbm9zbXQnIFstV2Vycm9yPW1pc3Npbmct
cHJvdG90eXBlc10KPgo+IEFkZCB0aGUgcHJvdG90eXBlIGluIGxpbnV4L3N1c3BlbmQuaCwgd2hp
Y2ggaXMgaW5jbHVkZWQgaW4KPiBib3RoIHBsYWNlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpEbyB5b3Ugd2FudCBtZSB0byBwaWNrIHRoaXMgdXA/
CgpJZiBub3QKCkFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+
Cgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L3N1c3BlbmQuaCB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3VzcGVu
ZC5oIGIvaW5jbHVkZS9saW51eC9zdXNwZW5kLmgKPiBpbmRleCBmMTY2NTNmN2JlMzIuLmJjOTEx
ZmVjYjhlOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3N1c3BlbmQuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvc3VzcGVuZC5oCj4gQEAgLTQ3Miw2ICs0NzIsOCBAQCBzdGF0aWMgaW5saW5l
IGludCBoaWJlcm5hdGVfcXVpZXRfZXhlYyhpbnQgKCpmdW5jKSh2b2lkICpkYXRhKSwgdm9pZCAq
ZGF0YSkgewo+ICB9Cj4gICNlbmRpZiAvKiBDT05GSUdfSElCRVJOQVRJT04gKi8KPgo+ICtpbnQg
YXJjaF9yZXN1bWVfbm9zbXQodm9pZCk7Cj4gKwo+ICAjaWZkZWYgQ09ORklHX0hJQkVSTkFUSU9O
X1NOQVBTSE9UX0RFVgo+ICBpbnQgaXNfaGliZXJuYXRlX3Jlc3VtZV9kZXYoZGV2X3QgZGV2KTsK
PiAgI2Vsc2UKPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
