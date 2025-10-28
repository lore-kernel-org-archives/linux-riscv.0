Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87015CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeGs74RbFefsKMi4Z6c/e5B5blViPoMhtr90r88itmg=; b=vlX28rG2eK/3ur
	lnAHOWXy3PUX31XTOgQ0L8obm8ytBdbRrYg7mYvz03k1Qb3yeJ2TKcTMfnKprLGSAKMwJnOetOj4i
	qfErbSKA8djF/0zErpibte23p3bh4E2+zoWu9oYIiPWZJ7HP5fO6dTG3nMYJU1Bf3rJ4PvTpGeuP1
	hD/VE6RPdspuA38K0W0oH/Mocsg8nLI43je0TPSjTUZEaPg6AfqOs2QRBRgJrtbhJrbIx46gAae0D
	O+dTzsAMuYtZnbiLoqqXpkOY4VEsDXP3kSJ/vUdhXYwwO5VXxcAnJf5GgRr13ePTOWqpDAvJknkT6
	XiysKPdf2/BlXoor0qLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfO5-0000000FZdH-0Wyu;
	Tue, 28 Oct 2025 08:49:05 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfO2-0000000FZcv-1LvI
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 08:49:03 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-430c773eec6so55218345ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761641341; x=1762246141; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Nqa5RbaqHXJiWr4JVVo/GVQ9sZBLUjp7DYkmXle1AE=;
        b=pLILnJd/axSAWOgPdEhOzSD7laXs61cAbK8l4YiOBNegCIa4XVtd1QhhyShVciJKK0
         qJgep5IBwwiw57u+rxzLztxtzeRPz+b9EDPSdPT49nKuoSvnhEgmfG7/MspYAjVjQiZe
         2j9eVPV08V78XbPgWpJvruKf9ehDUen1irzNi4Jamd9bVBVNYlxRThAQt8qDPTArLk16
         RNnBdnGVA8MsNQUARx6W8X0eXmakOucb4/mFrYfMkRuVxkeae/02mnv9g1ZRuvSyx/Hs
         5FQdcT2aGHCeo1qn6vO4tKoZu4LJewG7fqgdqm6NIRCtfWuq7DeFDfD02+e6hUcrgUgz
         gdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761641341; x=1762246141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Nqa5RbaqHXJiWr4JVVo/GVQ9sZBLUjp7DYkmXle1AE=;
        b=X27WCDFTpXGiSlb9iuDzapFgbf/S8Qd8Per9quKPQFfUICJFhID1qwK+rci8ia15fl
         QrtHSB8sAMEaFUgQjiUKC8YghoOxe9D6JZnYMqT059j1TXpJ6iWyHg+SUp6Bw83vLqMX
         a6YoM2DkE2hLFVDlakpBJprwrCGwRQ8/+c9kIXoyeh0v34LpBWzhehXNjEP5ciX0nl3m
         5ZlG1mlryLUg0nJWQMWSPsnrK0qPDHvN1C1UOzQVBDkHSVbuO3eTUzCFiaFSuArYdujR
         ah018BzqBibWUoBs8lYrAiTVD2jrv9lbrXeXuONXTjN2/XKnXY9PdiPSAlXVIfWDdszF
         KULA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6Kq+mkUAvYnFmz5h0LoM8xoCi8TERP/TOSFe6lBRx0EjGm0U0YI4btI5XZ/byfiUpbdRTK2jZT62tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS6gz3sf+WFoi2FJfEbqxPZLz8Mx2tBDZjTZpvmOdrn3GA5ANK
	VAvjDcSR0moaA75xYzGzY6xf2sqTb+13zYfLRNvQl8qDojxjZexV4pcTI6vzrSuVyBqxVsXcH4t
	92BlxSwYt/6vdB2/4HV5tb2DDiqnDFd+pEE69/galuA==
X-Gm-Gg: ASbGncu4n0fmgYBjMs+DkPN6eKPjj8zBMbO1T81ld+x1zXPfC3IMbaxBUKeToEaafXD
	p3XZyeDf5UcyoyJ1wCeHDnX14Gj+WIEZdf9OaO3xo00sAwcmFsZZCdc7EXnSZQSiO2Pv+65A26S
	OU8YN6/FQgk01ExB3rTlctc+x8jPqKLywrPTsT/WlIXrquwYg1rTcTc4c7KBgh+W/x5JAGijZ4E
	2GhIBMJURE1PRl3zgHbGJrQioYFdKKW61rCk+0yFEiaLva8L9b7cQPntZpMYFDvjPJDzgXfRrAY
	bfJA4YVHTik5rP7NCfnAG5Jekhf8
X-Google-Smtp-Source: AGHT+IEH7J7U7ktX4Uis4xGlSf/2jzsm1a9LrCcJPxeHAMh+NGwOe+bFbXW6utxN1p2P8zORVmeyzMyyBWVM07iRlGU=
X-Received: by 2002:a05:6e02:240c:b0:423:fcd6:5488 with SMTP id
 e9e14a558f8ab-4320f7bbbadmr48796285ab.12.1761641341073; Tue, 28 Oct 2025
 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250905122512.71684-1-apatel@ventanamicro.com> <0f7e6be5-f9ac-4019-93c6-295a068046a8@linux.dev>
In-Reply-To: <0f7e6be5-f9ac-4019-93c6-295a068046a8@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 14:18:50 +0530
X-Gm-Features: AWmQ_bmTYrN-PytsOBqPCeZ_JizA4VaPwRHendFWQXuSdLMWDi1UfvXqBxHKNLI
Message-ID: <CAAhSdy1uGQaPc2SkcX5oHF-aP4dOS1gu5iHor5O8zmz-XWUtBA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
To: Atish Patra <atish.patra@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_014902_479382_721F4E5B 
X-CRM114-Status: GOOD (  27.46  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgMjowNeKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4KPiBPbiA5LzUvMjUgNToyNSBBTSwgQW51cCBQYXRlbCB3
cm90ZToKPiA+IFRoZSBjb3JlIGtlcm5lbCBhbHJlYWR5IHN1cHBvcnRzIHBhcmFsbGVsIGJyaW5n
dXAgb2Ygc2Vjb25kYXJ5Cj4gPiBDUFVzIChha2EgSE9UUExVR19QQVJBTExFTCkuIFRoZSB4ODYg
YW5kIE1JUFMgYXJjaGl0ZWN0dXJlcwo+ID4gYWxyZWFkeSB1c2UgSE9UUExVR19QQVJBTExFTCBh
bmQgQVJNIGlzIGFsc28gbW92aW5nIHRvd2FyZCBpdC4KPiA+Cj4gPiBPbiBSSVNDLVYsIHRoZXJl
IGlzIG5vIGFyY2ggc3BlY2lmaWMgZ2xvYmFsIGRhdGEgYWNjZXNzZWQgaW4gdGhlCj4gPiBSSVND
LVYgc2Vjb25kYXJ5IENQVSBicmluZ3VwIHBhdGggc28gZW5hYmxpbmcgSE9UUExVR19QQVJBTExF
TCBmb3IKPiA+IFJJU0MtViB3b3VsZCBvbmx5IHJlcXVpcmVzOgo+ID4gMSkgUHJvdmlkaW5nIFJJ
U0MtViBzcGVjaWZpYyBhcmNoX2NwdWhwX2tpY2tfYXBfYWxpdmUoKQo+ID4gMikgQ2FsbGluZyBj
cHVocF9hcF9zeW5jX2FsaXZlKCkgZnJvbSBzbXBfY2FsbGluKCkKPiA+Cj4gPiBUaGlzIHBhdGNo
IGlzIHRlc3RlZCBuYXRpdmVseSB3aXRoIE9wZW5TQkkgb24gUUVNVSBSVjY0IHZpcnQgbWFjaGlu
ZQo+ID4gd2l0aCA2NCBjb3JlcyBhbmQgYWxzbyB0ZXN0ZWQgd2l0aCBLVk0gUklTQy1WIGd1ZXN0
IHdpdGggMzIgVkNQVXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICAgIHwgIDIgKy0KPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIHwgMTUgKysrKysr
KysrKysrKysrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiA+IGluZGV4IGE0YjIzM2EwNjU5ZS4uZDU4MDBkNmY5YTE1IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IEBAIC0xOTYsNyArMTk2LDcgQEAgY29uZmlnIFJJU0NWCj4gPiAgICAgICBzZWxlY3QgSEFW
RV9TQU1QTEVfRlRSQUNFX0RJUkVDVF9NVUxUSQo+ID4gICAgICAgc2VsZWN0IEhBVkVfU1RBQ0tQ
Uk9URUNUT1IKPiA+ICAgICAgIHNlbGVjdCBIQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFMKPiA+IC0g
ICAgIHNlbGVjdCBIT1RQTFVHX0NPUkVfU1lOQ19ERUFEIGlmIEhPVFBMVUdfQ1BVCj4gPiArICAg
ICBzZWxlY3QgSE9UUExVR19QQVJBTExFTCBpZiBIT1RQTFVHX0NQVQo+ID4gICAgICAgc2VsZWN0
IElSUV9ET01BSU4KPiA+ICAgICAgIHNlbGVjdCBJUlFfRk9SQ0VEX1RIUkVBRElORwo+ID4gICAg
ICAgc2VsZWN0IEtBU0FOX1ZNQUxMT0MgaWYgS0FTQU4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiA+IGlu
ZGV4IDYwMWEzMjFlMGYxNy4uZDg1OTE2YTM2NjBjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc21wYm9vdC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMK
PiA+IEBAIC0zOSw3ICszOSw5IEBACj4gPgo+ID4gICAjaW5jbHVkZSAiaGVhZC5oIgo+ID4KPiA+
ICsjaWZuZGVmIENPTkZJR19IT1RQTFVHX1BBUkFMTEVMCj4gPiAgIHN0YXRpYyBERUNMQVJFX0NP
TVBMRVRJT04oY3B1X3J1bm5pbmcpOwo+ID4gKyNlbmRpZgo+ID4KPiA+ICAgdm9pZCBfX2luaXQg
c21wX3ByZXBhcmVfY3B1cyh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCj4gPiAgIHsKPiA+IEBAIC0x
NzksNiArMTgxLDEyIEBAIHN0YXRpYyBpbnQgc3RhcnRfc2Vjb25kYXJ5X2NwdShpbnQgY3B1LCBz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKQo+ID4gICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+
ID4gICB9Cj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfSE9UUExVR19QQVJBTExFTAo+ID4gK2ludCBh
cmNoX2NwdWhwX2tpY2tfYXBfYWxpdmUodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHRhc2tfc3Ry
dWN0ICp0aWRsZSkKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gc3RhcnRfc2Vjb25kYXJ5X2NwdShj
cHUsIHRpZGxlKTsKPiA+ICt9Cj4gPiArI2Vsc2UKPiA+ICAgaW50IF9fY3B1X3VwKHVuc2lnbmVk
IGludCBjcHUsIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGlkbGUpCj4gPiAgIHsKPiA+ICAgICAgIGlu
dCByZXQgPSAwOwo+ID4gQEAgLTE5OSw2ICsyMDcsNyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQg
aW50IGNwdSwgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKPiA+Cj4gPiAgICAgICByZXR1cm4g
cmV0Owo+ID4gICB9Cj4gPiArI2VuZGlmCj4gPgo+ID4gICB2b2lkIF9faW5pdCBzbXBfY3B1c19k
b25lKHVuc2lnbmVkIGludCBtYXhfY3B1cykKPiA+ICAgewo+ID4gQEAgLTIyNSw2ICsyMzQsMTAg
QEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBzbXBfY2FsbGluKHZvaWQpCj4gPiAgICAgICBt
bWdyYWIobW0pOwo+ID4gICAgICAgY3VycmVudC0+YWN0aXZlX21tID0gbW07Cj4gPgo+ID4gKyNp
ZmRlZiBDT05GSUdfSE9UUExVR19QQVJBTExFTAo+ID4gKyAgICAgY3B1aHBfYXBfc3luY19hbGl2
ZSgpOwo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gICAgICAgc3RvcmVfY3B1X3RvcG9sb2d5KGN1cnJf
Y3B1aWQpOwo+ID4gICAgICAgbm90aWZ5X2NwdV9zdGFydGluZyhjdXJyX2NwdWlkKTsKPiA+Cj4g
PiBAQCAtMjQzLDcgKzI1Niw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgc21wX2NhbGxp
bih2b2lkKQo+ID4gICAgICAgICovCj4gPiAgICAgICBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7
Cj4gPiAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4gPiArI2lmbmRlZiBDT05GSUdfSE9U
UExVR19QQVJBTExFTAo+ID4gICAgICAgY29tcGxldGUoJmNwdV9ydW5uaW5nKTsKPiA+ICsjZW5k
aWYKPgo+IExHVE0uCj4KPiBSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2lu
Yy5jb20+Cj4KPiBIYXZlIHlvdSB0cmllZCB3aXRoIDEyOCBoYXJ0cyA/IEkgd2FzIG5vdCBhYmxl
IHRvIGJvb3QgMTI4IGhhcnRzIGluIFFlbXUKPiB3aXRoIE5SX0NQVVM9MjU2Lgo+IFRoaXMgaXMg
dW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2ggdGhvdWdoLiBJIGNhbiByZXByb2R1Y2UgdGhlIGlzc3Vl
IG9uCj4gdXBzdHJlYW0gd2l0aCA2LjE4LXJjMy4KCkkgaGF2ZSB0cmllZCB1cHRvIDk2IGhhcnRz
IGFuZCB0aGF0IHdvcmtzIGZpbmUuCgpGb3IgMTI4IGhhcnRzLCB0aGUgbWVtb3J5IHVzZWQgYnkg
T3BlblNCSSBnb2VzIGJleW9uZCAyTUIgc28KT3BlblNCSSBjYW4ndCBydW4gZnJvbSB0aGUgZmly
c3QgMk1CIG9mIERSQU0gKDB4ODAwMDAwMDApIGFzIHRoZQpmaXJzdCBib290aW5nIHN0YWdlLiBU
cnkgd2l0aCBVLUJvb3QgU1BMIGxvYWRpbmcgT3BlblNCSSBmcm9tIEZJVCBpbWFnZS4KClJlZ2Fy
ZHMsCkFudXAKCj4KPgo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIERpc2FibGUgcHJlZW1wdGlv
biBiZWZvcmUgZW5hYmxpbmcgaW50ZXJydXB0cywgc28gd2UgZG9uJ3QgdHJ5IHRvCj4gPiAgICAg
ICAgKiBzY2hlZHVsZSBhIENQVSB0aGF0IGhhc24ndCBhY3R1YWxseSBzdGFydGVkIHlldC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
