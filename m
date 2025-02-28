Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA46FC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71SFH/kxI7dXRzGM75Ukx0djlOv6ACre+e/uDK6e2AI=; b=Pj5tSxgAulVfur
	PCpacvz/PYq7exfiSJD49bvXZ075saIq9yj6AjUXPK7/QaUDHUMbG9onHNiuL6/oUhG3IYpcX+kXv
	4Qe+iUPygY2bCDF+TC4d60wEaOMsfNR6ru2GU3QszvKZr/M4QLjP59w7cOF0gJsu/uQvY6/oEa77h
	Qc0HeNjTctOStYcahqKR86kaG+EesE/4ayUrJMhAjvRhB6SyukeraVvPLE5CQiW608gwh6bWhfV+M
	EyyNeWvdp20WyyIZOjojbnJPICE4rNJAT8avnpxal13rngdfJuBGJRdRE5CEeMRokwXtTzrHKolMi
	9btUCkIazOtrp7B6a+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuFK-00000009uYT-34sC;
	Fri, 28 Feb 2025 06:53:18 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu4A-00000009tFL-21dA
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 06:41:48 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2b2b6019a74so858864fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 22:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740724905; x=1741329705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEgij+vFUKJr4iFrcQiCT4KMIk6Vb5FvOpq9/ONScgg=;
        b=FKFd/3y0dFtD6s7+DyppexMsTAU0OWBzi1Y/gTR+JlG8CyCpwBbexKkr7xyDEkle5d
         afouaOFRv4Jzu/v+4tXGALS3VJw8SvWIcf2gRc2k3Mk0B2dZB8d46ydbn7wLyzR+nJIA
         NLu22PVD5FGopKoq1YBUt4uJxoYMadcCCQh2WVdPKUrcNQe8mcii+pykTM2ARoP+FRh+
         zq1cLrsPPXoivgaqo0xRiEEWW68Q+Po5OE3NoWY9MasnJqx724bCzWLjgkf9Efne5zwm
         wItrH8he6i1uaymngaBuW31U3DbzaDnBFC1pvKD/+t+8NWMefQTZtJiPZ42Nb6PBM+if
         givg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740724905; x=1741329705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEgij+vFUKJr4iFrcQiCT4KMIk6Vb5FvOpq9/ONScgg=;
        b=DMqm5dfhPfymiEt3u9jkjbBD26hjgpQxQadCIpPkcq5sWf6IsjxiVBg6OExDy6CZDd
         zVVPfrzsIxHvJa0wQZPN3zbTf6L9srBkfr1HHRgctDdjUlLXBq+Vz3RnPOY6mQvvcKsh
         uBbB+VIDA6+4t6knMbVZxylWss6Cy0ixORHoFM+glGg7jDmpWT9bHlwbjrZiVe5AYWa7
         J+RF6m/51GM77jdyt2cBdKqIaTQe3T6TxTHHOy+oMdLXZaUUjyk2curOGI75nQeHptNJ
         taJ9Ub91wciwXpo/4IRcjhkM8M6ECI0UPMkD8ccJdiYqNW93Hz+pe5sOmwj76rQ9qHpk
         7L2w==
X-Forwarded-Encrypted: i=1; AJvYcCVdv5u/a302G45H1bqsm9lr63k/4A9rwHvCan+9nKAGTZ/z8IvW6IX57xnN17cDrHLYa66B+ka2hq7wzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfjRYjac/tgYYMCU7X2mCiYqkimMEnVtkuG8kjTSZfYZuZEyI5
	Eaza5CqenpL7zOra44RvOn0Adpq5KSnO/9+WlJ2rXVpQuFUojbCKDa/xiDAnoEqYZu+bdQYOSgy
	btVWOfEB6IvaG0M8ttjvntVpLbgt8/JYGW1yokg==
X-Gm-Gg: ASbGnct43esfG7F//SWnJFlxCDjmD3xgWuHJfCp1zMnCQUAEpPmv1oChNVW1Aa86plP
	h5bn7RtYTwD6/iE3G2NDBkYYnk8MmqiZhPLL7yvzdUHBSX30phTcnRVejY7MUHtp3AXqfgS6Dox
	+zvn5ztbg0i4N7YB84jtzPbViF
X-Google-Smtp-Source: AGHT+IGpsWGXU4pi9mwh3NHOtEFtRPpdEJclCzQQN3B727Qh8UvZFHsiuMJ2yff1nT/VAt/UJKc28gLWXxaF0LPMHi0=
X-Received: by 2002:a05:6871:521f:b0:2bc:7d6f:fa85 with SMTP id
 586e51a60fabf-2c178381b32mr1335889fac.16.1740724905127; Thu, 27 Feb 2025
 22:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20250201110607.34766-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=uYad7UAedSU4M_L277v=RQGWHpJQwOW-p7W6=hcijsQ@mail.gmail.com> <CAHVXubhW9b6fw8ZvHtn7zmyRSUVt-3JjmFbE-_L42wZ9W6=vKA@mail.gmail.com>
In-Reply-To: <CAHVXubhW9b6fw8ZvHtn7zmyRSUVt-3JjmFbE-_L42wZ9W6=vKA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 28 Feb 2025 14:41:34 +0800
X-Gm-Features: AQ5f1Joi8eei6BIPpr2-NDt1LLv0lzxhe-reOSOYQ5fHESUpc5vKkKxs7O0Ed-8
Message-ID: <CAEEQ3wmAxF=PkRt_pKFZE5-r9w1SMY7YQtco2mCyE+vus7vufg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: print hartid on bringup
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: apatel@ventanamicro.com, atishp@rivosinc.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com, 
	jassisinghbrar@gmail.com, takakura@valinux.co.jp, 
	valentina.fernandezalanis@microchip.com, ruanjinjie@huawei.com, 
	charlie@rivosinc.com, conor.dooley@microchip.com, haibo1.xu@intel.com, 
	andybnac@gmail.com, ke.zhao@shingroup.cn, tglx@linutronix.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_224146_531142_218D2E24 
X-CRM114-Status: GOOD (  18.55  )
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

SGkgQWxleCwKCk9uIFdlZCwgRmViIDI2LCAyMDI1IGF0IDEwOjU44oCvUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFl1bmh1aSwKPgo+IE9u
IFRodSwgRmViIDIwLCAyMDI1IGF0IDE6NTTigK9QTSB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQWxsLAo+ID4KPiA+IEdlbnRsZSBwaW5nLiBB
bnkgY29tbWVudHMgb24gdGhpcyBwYXRjaD8KPiA+Cj4gPiBPbiBTYXQsIEZlYiAxLCAyMDI1IGF0
IDc6MDbigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IEZpcm13YXJlIHJhbmRvbWx5IHJlbGVhc2VzIGNvcmVzLCBzbyBDUFUgbnVtYmVy
cyBkb24ndCBsaW5lYXJseSBtYXAKPiA+ID4gdG8gaGFydGlkcy4gV2hlbiB0aGUgc3lzdGVtIGhh
cyBhbiBleGNlcHRpb24sIHdlIGNhcmUgbW9yZSBhYm91dCBoYXJ0aWRzLgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4g
LS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyAgICAgfCAyICsrCj4gPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zbXBib290LmMgfCA0ICsrKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zbXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gPiA+IGluZGV4IGQ1OGI1ZTc1MTI4
Ni4uZTY1MGRlYzQ0ODE3IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAu
Ywo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ID4gPiBAQCAtNDgsNiArNDgs
OCBAQCBFWFBPUlRfU1lNQk9MX0dQTChfX2NwdWlkX3RvX2hhcnRpZF9tYXApOwo+ID4gPiAgdm9p
ZCBfX2luaXQgc21wX3NldHVwX3Byb2Nlc3Nvcl9pZCh2b2lkKQo+ID4gPiAgewo+ID4gPiAgICAg
ICAgIGNwdWlkX3RvX2hhcnRpZF9tYXAoMCkgPSBib290X2NwdV9oYXJ0aWQ7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICBwcl9pbmZvKCJCb290aW5nIExpbnV4IG9uIGhhcnRpZCAlbHVcbiIsIGJvb3Rf
Y3B1X2hhcnRpZCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgREVGSU5FX1BFUl9DUFVf
UkVBRF9NT1NUTFkoaW50LCBpcGlfZHVtbXlfZGV2KTsKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+ID4g
PiBpbmRleCBlMzZkMjAyMDViZDcuLmJlYmEwZWZiMDBiOSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Nt
cGJvb3QuYwo+ID4gPiBAQCAtMjMxLDYgKzIzMSwxMCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSB2
b2lkIHNtcF9jYWxsaW4odm9pZCkKPiA+ID4gICAgICAgICByaXNjdl9pcGlfZW5hYmxlKCk7Cj4g
PiA+Cj4gPiA+ICAgICAgICAgbnVtYV9hZGRfY3B1KGN1cnJfY3B1aWQpOwo+ID4gPiArCj4gPiA+
ICsgICAgICAgcHJfaW5mbygiQ1BVJXU6IEJvb3RlZCBzZWNvbmRhcnkgaGFydGlkICVsdVxuIiwg
Y3Vycl9jcHVpZCwKPiA+ID4gKyAgICAgICAgICAgICAgIGNwdWlkX3RvX2hhcnRpZF9tYXAoY3Vy
cl9jcHVpZCkpOwo+ID4gPiArCj4gPiA+ICAgICAgICAgc2V0X2NwdV9vbmxpbmUoY3Vycl9jcHVp
ZCwgdHJ1ZSk7Cj4gPiA+Cj4gPiA+ICAgICAgICAgLyoKPiA+ID4gLS0KPiA+ID4gMi4zOS4yCj4g
PiA+Cj4gPgo+ID4gVGhhbmtzLAo+ID4gWXVuaHVpCj4KPiBJSVJDIHRoYXQncyBhIGRlYnVnIGZl
YXR1cmUgd2hlbiB5b3UgY2FuJ3QgcmVhY2ggdXNlcnNwYWNlIGFuZCB1c2UKPiBjcHVpbmZvLCBz
byB3aGF0IGFib3V0IHVzaW5nIHByX2RlYnVnKCkgaW5zdGVhZD8KClVzaW5nIHByX2RlYnVnIG5l
ZWRzIGVuYWJsaW5nICNkZWZpbmUgREVCVUcgaW4KYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5j
IGFuZCBhZGRpbmcgbG9nbGV2ZWw9OCB0byBjbWRsaW5lLCBub3QKY29udmVuaWVudC4gQ2FuJ3Qg
YWx3YXlzIGNhdCAvcHJvYy9jcHVpbmZvIGJlZm9yZSBydW5uaW5nIGluIHVzZXIKbW9kZS4KSXQn
cyB0cnVlIHRoYXQgcHJfaW5mbyBwcmludHMgYSBsYXJnZSBhbW91bnQgb2YgaW5mb3JtYXRpb24g
aW4gdGhlCnN0YXJ0dXAgbG9ncywgZXNwZWNpYWxseSB3aGVuIHRoZXJlIGFyZSBtYW55IENQVSBj
b3Jlcy4KCkRvIHlvdSBoYXZlIGEgYmV0dGVyIHNvbHV0aW9uPwoKCj4gVGhhbmtzLAo+Cj4gQWxl
eAoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
