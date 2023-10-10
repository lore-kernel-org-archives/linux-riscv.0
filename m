Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46EACD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HImB+YpF4FG9i0vAcCVMRtW+XNT56Mup0oDtqtiSs0E=; b=OUAeoZTLwlTA+g
	UEDVIp0MMR5I5RuYpj+2Nr5yO6ewYutSVmgMMMztBY6ZFQm0CycO89tzC6YWIkhs1rY3khQwfGlav
	iUpK0z8aGksgvIPzrKfMP+5hOn3qt9GZBxRGC5fdVaHYr2LFbYAjzuBkZ0mSkCdllOWc7XZh7fGm+
	nj3K0vMB37HCmuRK6G7MkqJWujPrNRmxZkyF1GF/gWGOmn2lPSpDlulRG5jpv7coyzEXPH7RPjjlk
	P04/DDJRbsSIE1Hr2C4InSuOqizw63CXCCS9QW49t50hp6Jwa8oQoxyHBX2oUyGfaLLlOhXIuQhS1
	p/rXJ0VtG7jMMmMsua0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqERr-00DfFD-1M;
	Tue, 10 Oct 2023 15:15:03 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqERo-00DfCZ-2M
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 15:15:02 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so66116591fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696950893; x=1697555693; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCcV5NZjEORGbKyB67MdOtyv8NmXKoUfF48KF6nNjJo=;
        b=eej3dNz0JArsEhdv60Q4y/S5l1B4T+qDhLI0krGwCQm3+Xz47Ysd91K/ry0xYe7kZV
         GSreSra6r1cPwA2EFEuS5sChdfaoCzMA9rwwyZpBKvxgDIfkmHobEcI/K+hjknNGMBTh
         LTjyh2ua77/NnazC7mMeFRQcheJuzzXbEctY2EhsKCJkhgzrP807pXgUm/uSjmkTK/1l
         aZxThCQXObpHcTM/lcHUVhMdZ0sHyPRfaQLaeF2LcExT8jvlBa0Djp7zeEIuIetfMopn
         wcVJMRz86zHrVGYQENViy/9tcHO1s2xYWZWHybf3iIOn4ze46eeJId/gbkWWlWhVKscR
         e+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696950893; x=1697555693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCcV5NZjEORGbKyB67MdOtyv8NmXKoUfF48KF6nNjJo=;
        b=k2LNZoknaTBEgZ5Vtxcos+JUT5sR8RNe863zafMAVtCnP1Rzxkctlu68Dt4B3PnMcF
         dJQtNZrraT23s6/72YgYZcXu+gMe6p9fNj02zaAaNyW9jp2CFQnazr3M0zVcO3sB7+Bu
         +w2ocFOxsvdWqJjuO8pTh7cU3uUjhLrScUMyTA7K6L5Kiq4hcfcYS1oehj26mbD6bHCp
         XTkcK+DMEXE2M7UlS9fL59RBvVKAIItcf8E345YAjdTCUIuvNDLNL91vlYgWD3aLkeyl
         ZYIOkdYb3zLmcVFsidVfz1oZR40igDKlfYM7v6xxp0JdoO+ReAl9gLel0+xaeimO35tf
         ErCA==
X-Gm-Message-State: AOJu0Yx6TDsCN8lmcub9WwWWS3JwjQVQbVBKdRKszt2ftGtLk9+9l2Xh
	pBu5T9rIOZlkmBqqJLln1dDR4x5LqP7aIeupIRCmqg==
X-Google-Smtp-Source: AGHT+IG3RkYhsvv7WuVbik+w1a1EzkxmW4IF+bhcfVHNVwlXfS3ZNsihiyPC59fKfSF8U4ZEYZyODDvqvKxSxtPztuw=
X-Received: by 2002:a05:6512:ea5:b0:502:f2a4:152f with SMTP id
 bi37-20020a0565120ea500b00502f2a4152fmr20784797lfb.10.1696950892637; Tue, 10
 Oct 2023 08:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230921125518.175428-7-ajones@ventanamicro.com>
 <20230921125518.175428-10-ajones@ventanamicro.com> <CALs-HstCDZK3BPpubW8FqWQ8w4qH-_Zfgv3YhUYOgguv-OWufw@mail.gmail.com>
 <20231005-f530ebe8df5c0880e53fcfa3@orel> <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
 <20231005-5221bab223ee6d8a4c77b23d@orel> <20231009-26f43e41ddc98f0263f4258d@orel>
 <CALs-HsubfzKEzi3BBNH2UHj9Oa77FbkKBxT34P_kqV5gX2OwJw@mail.gmail.com> <20231010-baaa9fc9df51034c98fe0ea3@orel>
In-Reply-To: <20231010-baaa9fc9df51034c98fe0ea3@orel>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 10 Oct 2023 08:14:16 -0700
Message-ID: <CALs-HsuoJoLVnEp1Nk-apkvr6TtGryy8xFUDxugtQ69M3=guhA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_081500_794796_85A9A43F 
X-CRM114-Status: GOOD (  37.56  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMzo0NOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMDksIDIwMjMgYXQgMDk6NTA6
MDBBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDksIDIwMjMgYXQg
ODozOeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBPbiBUaHUsIE9jdCAwNSwgMjAyMyBhdCAwODoxMToyNVBNICswMjAwLCBBbmRy
ZXcgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMTA6MTI6MTRB
TSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gPiA+IE9uIFRodSwgT2N0IDUsIDIwMjMg
YXQgNjoyM+KAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3Rl
Ogo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBNb24sIFNlcCAyNSwgMjAyMyBhdCAwOToxNjow
MUFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gPiA+IC4uLgo+ID4gPiA+ID4gPiA+IFNv
IGlmIEkgd3JpdGUgb3V0IHRoaXMgYWxnb3JpdGhtLCBJIGdldCBzb21ldGhpbmcgbGlrZToKPiA+
ID4gPiA+ID4gPiAgKiBDcmVhdGUgYW4gYXJyYXkgb2YgZXZlcnkgcG9zc2libGUga2V5LCBhbmQg
ZGVkdXBlIHRoZSBjYWxsZXIncyBsaXN0Cj4gPiA+ID4gPiA+ID4gb2YgcGFpcnMgaW50byB0aGlz
IGFycmF5Lgo+ID4gPiA+ID4gPiA+ICAqIEZvciBlYWNoIHJlbWFpbmluZyBjcHUsIGdvIHRocm91
Z2ggdGhpcyBhcnJheSBhbmQgZWl0aGVyIGNvbmZpcm0KPiA+ID4gPiA+ID4gPiB0aGUgYmlnIGFy
cmF5J3MgZWxlbWVudCBtYXRjaGVzIHRoaXMgY3B1J3MgdmFsdWUsIG9yIGNsZWFyIHRoZSBjcHUK
PiA+ID4gPiA+ID4gPiBmcm9tIHRoZSByZXN1bHQgc2V0Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gQnV0IHdoeSBkbyB3ZSBnbyB0byBhbGwgdGhlIGVmZm9ydCBvZiBkZS1kdXBpbmcgdGhl
IGNhbGxlcidzIGFycmF5IG9mCj4gPiA+ID4gPiA+ID4gcGFpcnM/IENhbid0IHRoZXkgZG8gdGhh
dCB0aGVtc2VsdmVzIChvciBwYXkgYSBzbWFsbCBwZXJmb3JtYW5jZQo+ID4gPiA+ID4gPiA+IHBl
bmFsdHkgZm9yICJ5ZXMiIHJlc3VsdHMpPyBJbnN0ZWFkLCBjb3VsZG4ndCBpdCBiZSBzb21ldGhp
bmcgbGlrZToKPiA+ID4gPiA+ID4gPiBGb3IgZWFjaCBwYWlyIGluIHRoZSB1c2VyJ3Mgc2V0LCBm
b3IgZWFjaCByZW1haW5pbmcgY3B1IGluIHRoZSBzZXQsCj4gPiA+ID4gPiA+ID4gY29tcGFyZSB0
aGUgdmFsdWVzLCBvciBjbGVhciB0aGUgY3B1IGluIHRoZSByZW1haW5pbmcgc2V0Lgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gRG9pbmcgdGhhdCB3b3VsZCBhbHNvIHRha2UgdGhlIHJ1bnRp
bWUgZnJvbSBPKGtleXNwYWNlICogbmNwdXMpIHRvCj4gPiA+ID4gPiA+ID4gTyhxdWVyeV9sZW5n
aCAqIG5jcHVzKS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB3YW50IHRvIGRlLWR1cGUgZm9y
IHR3byByZWFzb25zOgo+ID4gPiA+ID4gPiAgKiBxdWVyeV9sZW5ndGggaXMgdW5ib3VuZGVkLCBi
dXQga2V5c3BhY2UgaXMgYm91bmRlZCAoYW5kIGlzIGN1cnJlbnRseQo+ID4gPiA+ID4gPiAgICBz
bWFsbCkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPaywgYnV0IHJlbWVtYmVyIHRoYXQgaWYgd2Ugc2hp
cCB0aGlzIGJlaGF2aW9yIHRvZGF5LCB3ZSdyZSBjb21taXR0ZWQKPiA+ID4gPiA+IHRvIGl0IGZv
cmV2ZXIuIFRoZSBrZXlzcGFjZSBpcyBsaWtlbHkgdG8gZ3JvdywgaXQgd291bGQgYmUgdW5mb3J0
dW5hdGUKPiA+ID4gPiA+IGlmIHRoaXMgc3RlcCBzdGFydGVkIHRvIGNhdXNlIGEgbm90aWNlYWJs
ZSBwZXJmb3JtYW5jZSBkZWxheS4KPiA+ID4gPgo+ID4gPiA+IE1heWJlIGl0J3Mgbm90IHRvbyBs
YXRlIHRvIHB1dCBhIGJvdW5kIG9uIHBhaXJzLCBpLmUuIHBhaXJfY291bnQgZ3JlYXRlcgo+ID4g
PiA+IHRoYW4gc29tZSBudW1iZXIgc2hvdWxkIHJldHVybiBFMkJJRy4KPiA+ID4gPgo+ID4gPgo+
ID4gPiBTY3JhdGNoIHRoaXMgaWRlYS4gSSB3ZW50IGxvb2tpbmcgZm9yIHByZWNlZGVudCBmb3Ig
bGltaXRpbmcgdGhlIGxlbmd0aCBvZgo+ID4gPiBpbnB1dCBhcnJheXMgdG8gc3lzY2FsbHMsIGJ1
dCBjb3VsZG4ndCBmaW5kIGFueS4gVG8gdGhlIGNvbnRyYXJ5LCBJIGZvdW5kCj4gPiA+IHRoYXQg
bW92ZV9wYWdlcygpIHVzZWQgdG8gcmV0dXJuIEUyQklHIHdoZW4gdGhlcmUgd2VyZSAidG9vIG1h
bnkgcGFnZXMgdG8KPiA+ID4gbW92ZSIsIGJ1dCBpdCBoYXNuJ3QgZG9uZSBzbyBzaW5jZSAyLjYu
MjkgYW5kLCBldmVuIHRoZW4sIGl0IGFwcGVhcnMgdGhlCj4gPiA+IGNvbmNlcm4gd2FzIG11bHRp
cGxpY2F0aW9uIG92ZXJmbG93LCBub3QgaGF2aW5nICJ0b28gbXVjaCIgd29yay4gU28sIHdlCj4g
PiA+IHNob3VsZCBsZWF2ZSB0aGUgbnVtYmVyIG9mIHBhaXJzIHVuYm91bmRlZCwgYnV0LCB0b28g
bWUsIHRoYXQgbWVhbnMgd2UKPiA+ID4gc2hvdWxkIGRlLWR1cGUsIHNpbmNlIHdlIGNhbiBkbyB0
aGUgY29weV9mcm9tX3VzZXIoKSBvbmNlIGZvciBlYWNoIGF0IHRoYXQKPiA+ID4gdGltZSwgYW5k
IGFueSB1c2VyIHdoaWNoIGRlY2lkZXMgdG8gcHJvdmlkZSBlYWNoIGJpdCBzZXBhcmF0ZWx5IGZv
ciBlYWNoCj4gPiA+IGJpdG1hc2sga2V5IHR5cGUgc2hvdWxkIGdldCB0aW55IHNwZWVkdXAuCj4g
Pgo+ID4gSSBzdGlsbCBkb24ndCBnZXQgdGhlIHVzZWNhc2Ugd2hlcmUgdXNlcm1vZGUgaXMgZ29p
bmcgdG8gYmUgc3VibWl0dGluZwo+ID4gdGhpcyBsYXJnZSBqdW1ibGUgb2Yga2V5cywgcmVwbGV0
ZSB3aXRoIG1hbnkgZHVwbGljYXRlcy4gQW5kIGV2ZW4gaWYKPiA+IHN1Y2ggYSBjYXNlIGRpZCBl
eGlzdCwgd2h5IHNob3VsZCB0aGUga2VybmVsIGJlIHRoZSBvbmUgZGVkdXBpbmcsCj4gPiBkcmFn
Z2luZyBpbiBhIHJ1bnRpbWUgcGVuYWx0eSBmb3IgYWxsIG90aGVyIGNhbGxlcnMgdGhhdCBkaWRu
J3Qgc3VibWl0Cj4gPiBkdXBsaWNhdGVzLiBVc2VybW9kZSBjb3VsZCBkZS1kdXBlIG9uIHRoZWly
IG93biBJJ2QgdGhpbmsuCj4KPiBJdCdzIG5vdCBhYm91dCB1c2VjYXNlcywgYnV0IGFib3V0IGJl
c3QgaGFuZGxpbmcgb2YgYWxsIGFsbG93ZWQgaW5wdXRzLgo+Cj4gSWYgY2FsbGVycyBkb24ndCBz
dWJtaXQgZHVwbGljYXRlcyBvciBtYWtlIHRoZSBjYWxsIHdpdGggYSBzbWFsbAo+IHBhaXJfY291
bnQsIHRoZW4gdGhlIGRlLWR1cGUgbG9vcCB3b3VsZCBoYXZlIG5lZ2xpZ2libGUgb3ZlcmhlYWQg
aW4KPiB0ZXJtcyBvZiB0aW1lLiBIb3dldmVyLCB0aGlua2luZyBhYm91dCB0aGlzIHNvbWUgbW9y
ZSwgd2UgY2FuIGF2b2lkCj4gaXNzdWluZyBjb3B5X2Zyb21fdXNlcigpIG11bHRpcGxlIHRpbWVz
IGJ5IGxvb3Bpbmcgb3ZlciBjcHVzIHdpdGhpbgo+IHRoZSBsb29wIG92ZXIgdXNlciBpbnB1dCBw
YWlycy4gV2UnbGwgZG8gY3B1bWFza19zZXRfY3B1KCkgYW5kCj4gY3B1bWFza19jbGVhcl9jcHUo
KSBvbiB0aGUgb25lX2NwdSBjcHVtYXNrIG1vcmUgdGltZXMgaW5zdGVhZCwgYnV0Cj4gdGhhdCdz
IGp1c3QgYSBjb3VwbGUgbG9hZHMgYW5kIHNvbWUgYXJpdGhtZXRpYy4gSSB0aGluayB0aGlzIHdv
dWxkCj4gYmUgdGhlIGJldHRlciBhcHByb2FjaCwgbm90IGJlY2F1c2Ugb2YgdGltZSBvdmVyaGVh
ZCwgYnV0IGJlY2F1c2UKPiB3ZSB3b24ndCBoYXZlIHRvIHN0b3JlIHBhaXJzIGF0IGFsbCwgYXZv
aWRpbmcgbWVtb3J5IGFsbG9jYXRpb24gb3IKPiB0aGUgYXNzdW1wdGlvbiB0aGF0IHdlIGNhbiBz
dG9yZSBhIHBhaXIgcGVyIHBvc3NpYmxlIGtleSBvbiB0aGUgc3RhY2suCgpUaGF0IHNvdW5kcyBn
b29kIHRvIG1lLiBJZiBJIHVuZGVyc3RhbmQgdGhlIHByb3Bvc2FsIHJpZ2h0LCB5b3UnbGwKYWxz
byBiZSBhYmxlIHRvIGtlZXAgeW91ciBvcHRpbWl6YXRpb24gb2YgbG9vcGluZyBvbmx5IG92ZXIg
dGhlIGNwdXMKdGhhdCBhcmUgInN0aWxsIGluIHRoZSBydW5uaW5nIiwgd2hpY2ggd2FzIGEgbmlj
ZSBlYXJseSBleGl0IGZvcgpjZXJ0YWluICJubyIgYW5zd2Vycy4KLUV2YW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
