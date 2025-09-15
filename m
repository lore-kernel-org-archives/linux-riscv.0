Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D02CAC587
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxOXIl6CpzS/PJkkeUR3mvBkhkQU7GmxEQIzPcq0g+o=; b=ylt2ykl66kQeb+
	teHlUhaxOfIpJjVV5LFORNSX6uOO2/h8fZadOJbPvsd0RPM4b1w1AfkgnZzmPpvrcRYAUntceYCTo
	xVQTM3obbzUtqwWavWQCV8cv9IWD0Xs+9xl4eCGNa0xHm/I9mYBCew4CTGMoHBRoCPR3LhZJ2LUQf
	0jKyBmSDhHMWj9ldetLNClxsKwLc4MIV4pGkAujTedsujbKGVF2Jhc+kf9RXARNe2ARmQgt73lCaf
	yJqjfcdOQV5FNTZuCRssPUp4fpxU8EDCxSsmKyORIl1+LufexcaUm2nkWw/caLmVKOqVheu1mmHb5
	+N3KaGdehpLt7vc5clGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxySQ-00000002W6r-2fqw;
	Mon, 15 Sep 2025 01:56:42 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxySN-00000002W65-1JzP
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 01:56:41 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-3316cc5ba2fso467503fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Sep 2025 18:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1757901394; x=1758506194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BO6IHIraaA33AzZrGgraDPlur/2l0PmDTVZQ4KAkd3I=;
        b=HGN14kcGpEpw73GHXWf3s+1jeh8bl5y+1GYL6mDFTUSHD130zrKgPZGysM4AzGwQkl
         y55ZnfOyAJtcmox3nEPzidLTA1pf6f+p6c0IFCcNe85e7lQylySzcfgIFfiDlS/kxzDC
         K2LQu/IEcQ/Onjyo0sHjVefLSuvgV3oVzWIFJngvNnSqt2qKk6LregcCVgumfzstYgzo
         2F+2uWrtIl+a44zMWU7nhtDH+ALULSi8uWYiVsW7zuvSMnL2UcIdN+W1fb3/5YEwzkYl
         gbiKj5KTYi1arYRchPk0e5N/5UM0V/01SyD3PMUgzI9OH7jIcYE23saxH9IWn9mlbkdu
         G2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901394; x=1758506194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BO6IHIraaA33AzZrGgraDPlur/2l0PmDTVZQ4KAkd3I=;
        b=q2pHzfT4DNLdVvKWuHepdnoTrbiQlnR32FtQZPu7HiaZL+7oNmOVLDOmCDOKIZMF5r
         eDaaWFnobA/Z7tWwWWk+tW3ftAXceziUpX7r7eZNyI4UomGmIE5ROdMuF8o4+OQlpnRb
         y7vNVlbBL+On3WlPlPD135Vx+tuTYBTb0DCX4HeHWuTTgFv5BHQQj4/p3kub8fZOdB4M
         PQDtOm2t7F6ysgWrwJ4vJTkDn3lLPiSl8U2qW4T1qFShJ9hJoXJx7mXf/8wf5qOnm3H1
         7l1DSQ/IqQiiW4gwhR/dbJy4R2jjui0CDXGa0+8OEgQ41OJXl6WKpmJ2BMuQO3W8RwO0
         DuYg==
X-Forwarded-Encrypted: i=1; AJvYcCVuuaujp4NM70JE9NJ/8cAl2/9nvwz+0kYIUAUKvn6WhC3fsgFrwzdSMCfrYxf9QcZHm3DaeREE/E0Q7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+5mOMwsVCXsSCvcuG2AfaJJSzlTUW6J+968o9P6eKgTxyPfxV
	mMPKV+TUJhIMZzpayZTXyFDfwAQP7HektsJNaQDl5+mKp09u21fT6jh/JwU8fFp+rHzjNmjKsve
	P8z0VORVLfNdrk3JovcLIDXt5fre9xhxHBtXMquioOA==
X-Gm-Gg: ASbGncuh5R8+o0OqEPixbqjNTEaAKRFqCg/83Cq6NV8Dp+OPPLtnufwS3Z+DmFqgZ+R
	OKTPnjbEMDQFxKVEraKu07G91gnRg75D27ZW7vzbw0Hb8hs3NIkLnDZyRyiLleXcjhP72iXV8VR
	xCT6GQeA2AhDHlxCa4Xo+ZNFZuxUp1FVhFeBBltILSOHPmaZ5PUylsjSQhQza1QrdsxHeYzo3bT
	V974UuNilLOks2y
X-Google-Smtp-Source: AGHT+IEzxKXkgKqnV741v0vWC49ZtgXVeKwHXnAtJZiM2Qjz2M2QceURl7ZTg3slF5Ghl+7/2KbprcKdhFECr+rtPe4=
X-Received: by 2002:a05:6871:4149:b0:31d:8c7b:401d with SMTP id
 586e51a60fabf-32e56dc007dmr4929305fac.46.1757901393993; Sun, 14 Sep 2025
 18:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
 <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com>
 <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
 <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com> <CAP-5=fWkcxvZ0z9FJztbN4EhU+BNEJTNxe2a6_+11EcYhjZQaQ@mail.gmail.com>
In-Reply-To: <CAP-5=fWkcxvZ0z9FJztbN4EhU+BNEJTNxe2a6_+11EcYhjZQaQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 15 Sep 2025 09:56:22 +0800
X-Gm-Features: AS18NWB5q8BMOMaL4qJUD7HTlg6i3YBaukDHZMMVfaFmVYmSZ3j_z8EethM99sE
Message-ID: <CAEEQ3wn2FfgzKq-vwt5m=Xy5NThrGkZaY4=U45QmN4JzJG8Rng@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Ian Rogers <irogers@google.com>
Cc: Doug Anderson <dianders@chromium.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, atish.patra@linux.dev, 
	anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, masahiroy@kernel.org, suzuki.poulose@arm.com, 
	maz@kernel.org, zhanjie9@hisilicon.com, yangyicong@hisilicon.com, 
	mingo@kernel.org, lihuafei1@huawei.com, akpm@linux-foundation.org, 
	jpoimboe@kernel.org, rppt@kernel.org, kees@kernel.org, 
	thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185639_665160_EDCDCA47 
X-CRM114-Status: GOOD (  25.88  )
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

SGksCgpPbiBNb24sIFNlcCA4LCAyMDI1IGF0IDc6MTXigK9BTSBJYW4gUm9nZXJzIDxpcm9nZXJz
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgNSwgMjAyNSBhdCA0OjU34oCvUE0g
RG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwK
PiA+Cj4gPiBPbiBXZWQsIFNlcCAzLCAyMDI1IGF0IDQ6NTbigK9BTSB5dW5odWkgY3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+IEnigJl2ZSByZWFkIHlvdXIgbGlua2Vk
IGNvbnRlbnQsIHdoaWNoIGRldGFpbHMgdGhlIHByb3MgYW5kIGNvbnMgb2YgcGVyZgo+ID4gPiB3
YXRjaGRvZyBhbmQgYnVkZHkgd2F0Y2hkb2cuCj4gPiA+IEkgdGhpbmsgZXZlcnlvbmUgd2lsbCBh
Z3JlZSBvbiBjaG9vc2luZyBvbmUgYXMgdGhlIGRlZmF1bHQuCj4gPiA+IEl0IHNlZW1zIHRoZXJl
4oCZcyBubyBrZXJuZWwvd2F0Y2hkb2cgZW50cnkgaW4gTUFJTlRBSU5FUlPigJR3aGF04oCZcyBu
ZXh0Cj4gPiA+IGZvciB0aGVzZSB0d28gYXBwcm9hY2hlcz8KPiA+Cj4gPiBJIGd1ZXNzIHRvIHN0
YXJ0LCBzb21lb25lICh5b3U/KSBzaG91bGQgc2VuZCBzb21lIHBhdGNoZXMgdG8gdGhlIGxpc3Qu
Cj4gPiBNYXliZSBvbmUgcGF0Y2ggdG8gbWFrZSBidWRkeSB0aGUgZGVmYXVsdCBhbmQgb25lIHRv
IGNoYW5nZSB0aGUKPiA+IGRlc2NyaXB0aW9uIG9mIHRoZSAicGVyZiIgbG9ja3VwIGRldGVjdG9y
IHNheSB0aGF0IGl0cyB1c2FnZSBpcwo+ID4gZGlzY291cmFnZWQsIHRoYXQgaXQgbWlnaHQgYmUg
cmVtb3ZlZCwgdGhhdCBwZW9wbGUgc2hvdWxkIHVzZSB0aGUKPiA+ICJidWRkeSIgZGV0ZWN0b3Ig
aW5zdGVhZCwgYW5kIHRoYXQgaWYgdGhlcmUncyBhIHJlYXNvbiBzb21lb25lIG5lZWRzCj4gPiB0
aGUgInBlcmYiIGRldGVjdG9yIGluc3RlYWQgb2YgdGhlIGJ1ZGR5IG9uZSB0aGVuIHRoZXkgc2hv
dWxkIG1ha2UKPiA+IHNvbWUgbG91ZCBub2lzZXMuCj4gPgo+ID4gWW91J2Qgd2FudCB0byBDQyBm
b2xrcyB3aG8gd2VyZSBpbnZvbHZlZCBpbiByZWNlbnQgd2F0Y2hkb2cgY2hhbmdlcwo+ID4gYW5k
IG1ha2Ugc3VyZSB0byBDQyBBbmRyZXcgKGFrcG0pLiBJZiBmb2xrcyByZWFjdCBwb3NpdGl2ZSBh
bmQgQW5kcmV3Cj4gPiBhZ3JlZXMgdGhlbiBoZSdsbCBsaWtlbHkgbGFuZCB0aGUgdGhlIHBhdGNo
ZXMgYW5kIHdlJ2xsIGhhdmUgbWFkZQo+ID4gZm9yd2FyZCBwcm9ncmVzcy4gOi0pCj4KPiArMQoK
T2theSwgSSBpbnRlbmQgdG8gZGlyZWN0bHkgc2VuZCBhIHBhdGNoIHRoYXQgcmVtb3ZlcwpIQVJE
TE9DS1VQX0RFVEVDVE9SX1BFUkYsIGFuZCB0aGVuIHdlIGNhbiBkaXNjdXNzIG9uIHRoYXQgcGF0
Y2guCgo+Cj4gVGhlcmUgYXJlIGFsc28gdGhpbmdzIGxpa2UgL3Byb2Mvc3lzL2tlcm5lbC9ubWlf
d2F0Y2hkb2cgYmVpbmcgdXNlZCB0bwo+IGVuYWJsZS9kaXNhYmxlIHRoZSBoYXJkIGxvb2t1cCBk
ZXRlY3Rvci4gSWYgd2UgY291bGQgbW92ZSB0aGF0IHRvIGEKPiB1bmlxdWUgZmlsZSBzbyB0aGF0
IHBlcmYgaXMgbGVzcyBjb25mdXNlZCBpbiBwbGFjZXMgbGlrZToKPiBodHRwczovL3dlYi5naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvdG9vbHMvcGVyZi91dGlsL3V0aWwuYyNuNzAKPiBpZS4gcGVyZiBzaG91bGRuJ3Qgd2FybiBh
Ym91dCB0aGUgTk1JIHdhdGNoZG9nIGJlaW5nIGVuYWJsZWQgYW5kCj4gdGFraW5nIGEgcGVyZiBl
dmVudCB3aGVuIGl0IGRvZXNuJ3QuCgpPa2F5LCBsZXQncyBmaXJzdCB0YWtlIGEgbG9vayBhdCB0
aGUgc3RhdHVzIG9mIHRoZSBkaXNjdXNzaW9uIG9uIHRoZQpwYXRjaCBmb3IgcmVtb3ZpbmcgSEFS
RExPQ0tVUF9ERVRFQ1RPUl9QRVJGLCBhbmQgdGhlbiB3ZSdsbCBtb2RpZnkKdGhpcyBwYXJ0LgoK
Pgo+IFRoYW5rcywKPiBJYW4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
