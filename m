Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3DCC7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 06:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWajyTHkKHijh7f5lFMm8fBIQJIDacZbue1f8jpYtsU=; b=4yqP2jYYfbN093
	wVJ7oyfp7vhUblxFGlmRVmqgfYW3nP2tiwTetLZ3BPmAkZLDD1KzQVKaRa/7i3+Phk+Uv/aeLulqU
	L2ZKcu9odZh6Vz6tdpWoTPLFALBmH6sRyjTuU9BV94stuM/IvP+qS9CgI1uv6XezPHW/2uXQypxAr
	IvAWiJC74ICWjDpSx5IAD8pkBKMtmqASDfOlmYCByPfaNfAw256ju8XMA89BFNfjM50RIV2HtuwFq
	GQA8+fZLSyxn4dOcI/SH++CszFuLjD0/YC4LhMIiKcHaFvmxX+/G6pghY7bWw4jlgi8dvVWoxpBaL
	hLWiNulLq/DQ4STD71MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYzd-00000000qi1-1uID;
	Thu, 29 Aug 2024 06:50:53 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYya-00000000qPv-47yC
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 06:49:50 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f4f2cda058so12916601fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 23:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724914187; x=1725518987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SJ/S8s6ymwgMOR0oWpgqeaiVzupwAzeqRKGoyGdDvg=;
        b=e5aUZ/wbgwHNYtN9liBi1Nbo+1eapXAdIJLUUokNYfvPSpksM/tyg0aQSCTMV+YOx8
         FqyB5J1v0gPzfWBUAwqdLWLFm5N+ehiuj1jmvrvmGDJYb1H8FgAN8KKeWdHk2mdfvDKC
         B9xGv89xTDNNAJrTAVBOpsemlhBZgjxbpwuSvD5J1ERb5N5VQnFQE2qOc0kKWvAwLodV
         xVwersZVEG4j0zlsKMfGSrZbnHM8NgpitB28+hXqwjWBWYuryMe52ncEM2DL+X5TApoZ
         kGH4WpPQf6ayJniAtx4sMni/OxiKuk0qBCNAuMLNsAwThAKl3eO+dZsegR/KyM5uE1C/
         aT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724914187; x=1725518987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SJ/S8s6ymwgMOR0oWpgqeaiVzupwAzeqRKGoyGdDvg=;
        b=SqqjXoSJ53KiFl7ZBF8gSfyjbMEX8UTPp+5snvEr8ivc+W5vwA/ytxFZ4I6B0ydhVZ
         MNkuSgH3Qwt8tmd5CpxabZHBdeisksoHbzyal9aHNxrMuk3s5I1txcjchDYk8sn/iWxg
         2HotC/NHwLO4P0aBtzK1zNy4GpQX7z1Ba9GamiYpKviGjIcFm3XjR+OCiKDPMLbXCjAV
         FOZXJmO9x1eRusvuq3I0eqFKAlk6CjmeI+4qrQmGy1rBjRwGeBCuzEl6vYHlX2TOil2N
         kjLlii94zR7pWGRKauM5CS7JJGHUGeRHcGEjCqh2DdyO5iBJlmjp2uOpWGe+AxkWz3aA
         02Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6I1xizxVdvmLzw8mhugvImxnUHK5vOV9Fw4eNMm8N2zl+yidTk2UPZmCwQ9xxD/+1Ag8HYG2pWjmHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUuhTKoGjMmVXNt/KBRDyFbE2cX+y+LGkpMTj2WKM1gWqA+ZLz
	VwVxjMiOE5sABqUFY0FanbHW7aIsRalD/2gWLsp42n9fZRSM3df5mcUcfPBmPL64xmJ1TcGItdd
	YPF/o5iMwwhSCadxMDswn3G+64goT4AVGHiMB2g==
X-Google-Smtp-Source: AGHT+IF3BL6bSy6BIFTMgHXF0M9DSfrHTvM8HzubREUgUq0pr1f3k88i+ThXx1hinTdBsAZkIqxHeHHemAumxKwyxQE=
X-Received: by 2002:a05:6512:b1b:b0:52f:30d:526c with SMTP id
 2adb3069b0e04-53540fe8999mr206492e87.5.1724914186368; Wed, 28 Aug 2024
 23:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-3-nick.hu@sifive.com>
 <CAK9=C2Xui8c0b55WrZxCZYqK=AFmiPT+nG8d_E0d7SpamwvO-Q@mail.gmail.com> <CAKddAkCoZy=uid5gVzUg-zwhBxX_EZCbFR18521N3142MPv=jw@mail.gmail.com>
In-Reply-To: <CAKddAkCoZy=uid5gVzUg-zwhBxX_EZCbFR18521N3142MPv=jw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 29 Aug 2024 12:19:34 +0530
Message-ID: <CAK9=C2VbF2JKSfJLVEV4SYQFxr+gmpBTjtK6DuVFSbEAjRmFOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_234949_053463_F91959CB 
X-CRM114-Status: GOOD (  26.82  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMTE6NTPigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cAo+Cj4gT24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMTox
OOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBUaHUsIEF1ZyAyOSwgMjAyNCBhdCA5OjEw4oCvQU0gTmljayBIdSA8bmljay5odUBzaWZp
dmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gU3RvcCB0aGUgc3RpbWVjbXAgd2hlbiB0aGUgY3B1
IGlzIGdvaW5nIHRvIGJlIG9mZiBvdGhlcndpc2UgdGhlIHRpbWVyCj4gPiA+IGludGVycnVwdCBt
YXkgcGVuZGluZyB3aGlsZSBwZXJmb3JtaW5nIHBvd2VyIGRvd24gb3BlcmF0aW9uLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMjIgKysrKysrKysr
KysrKysrLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNl
L3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+ID4g
aW5kZXggNDhjZTUwYzVmNWU2Li45YTZhY2FhOGRmYjAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291
cmNlL3RpbWVyLXJpc2N2LmMKPiA+ID4gQEAgLTMyLDE1ICszMiwxOSBAQAo+ID4gPiAgc3RhdGlj
IERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKHJpc2N2X3NzdGNfYXZhaWxhYmxlKTsKPiA+ID4gIHN0
YXRpYyBib29sIHJpc2N2X3RpbWVyX2Nhbm5vdF93YWtlX2NwdTsKPiA+ID4KPiA+ID4gK3N0YXRp
YyB2b2lkIHJpc2N2X2Nsb2NrX3N0b3Bfc3RpbWVjbXAodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+ID4gPiArICAgICAgIGlm
IChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gPiA+ICsgICAgICAgICAgICAgICBjc3Jfd3Jp
dGUoQ1NSX1NUSU1FQ01QSCwgVUxPTkdfTUFYKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgc3Rh
dGljIHZvaWQgcmlzY3ZfY2xvY2tfZXZlbnRfc3RvcCh2b2lkKQo+ID4gPiAgewo+ID4gPiAtICAg
ICAgIGlmIChzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKSB7Cj4g
PiA+IC0gICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+
ID4gPiAtICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIFVMT05HX01B
WCk7Cj4gPiA+IC0gICAgICAgfSBlbHNlIHsKPiA+ID4gKyAgICAgICBpZiAoc3RhdGljX2JyYW5j
aF9saWtlbHkoJnJpc2N2X3NzdGNfYXZhaWxhYmxlKSkKPiA+ID4gKyAgICAgICAgICAgICAgIHJp
c2N2X2Nsb2NrX3N0b3Bfc3RpbWVjbXAoKTsKPiA+ID4gKyAgICAgICBlbHNlCj4gPiA+ICAgICAg
ICAgICAgICAgICBzYmlfc2V0X3RpbWVyKFU2NF9NQVgpOwo+ID4gPiAtICAgICAgIH0KPiA+ID4g
IH0KPiA+ID4KPiA+ID4gIHN0YXRpYyBpbnQgcmlzY3ZfY2xvY2tfbmV4dF9ldmVudCh1bnNpZ25l
ZCBsb25nIGRlbHRhLAo+ID4gPiBAQCAtMTI2LDcgKzEzMCwxMSBAQCBzdGF0aWMgaW50IHJpc2N2
X3RpbWVyX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gPgo+ID4gPiAgc3RhdGlj
IGludCByaXNjdl90aW1lcl9keWluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+ID4gIHsKPiA+
ID4gLSAgICAgICBkaXNhYmxlX3BlcmNwdV9pcnEocmlzY3ZfY2xvY2tfZXZlbnRfaXJxKTsKPiA+
ID4gKyAgICAgICBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNfYXZhaWxhYmxl
KSkKPiA+ID4gKyAgICAgICAgICAgICAgIHJpc2N2X2Nsb2NrX3N0b3Bfc3RpbWVjbXAoKTsKPiA+
ID4gKyAgICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgICBkaXNhYmxlX3BlcmNwdV9pcnEo
cmlzY3ZfY2xvY2tfZXZlbnRfaXJxKTsKPiA+ID4gKwo+ID4KPiA+IE5vdCBkaXNhYmxpbmcgcmlz
Y3ZfY2xvY2tfZXZlbnRfaXJxIGhlcmUgZm9yIFNzdGMgd291bGQgbm93Cj4gPiBjYXVzZSByaXNj
dl90aW1lcl9zdGFydGluZ19jcHUoKSB0byB1bm5lY2Vzc2FyaWx5IGVuYWJsZSBpdAo+ID4gd2hl
biB0aGUgQ1BVIGlzIHBvd2VyZWQtdXAuCj4gPgo+ID4gSSB0aGluayB0aGUgYmVsb3cgY2hhbmdl
IGlzIHN1ZmZpY2llbnQgZm9yIHRoaXMgcGF0Y2g6Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2LmMKPiA+IGluZGV4IDQ4Y2U1MGM1ZjVlNi4uNTQ2ZmQyNDhmNGZmIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPiArKysgYi9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+IEBAIC0xMjcsNiArMTI3LDExIEBAIHN0
YXRpYyBpbnQgcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gPiAg
c3RhdGljIGludCByaXNjdl90aW1lcl9keWluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+ICB7
Cj4gPiAgICAgICAgIGRpc2FibGVfcGVyY3B1X2lycShyaXNjdl9jbG9ja19ldmVudF9pcnEpOwo+
ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBTdG9wIHRoZSB0aW1lciB3aGVuIHRoZSBjcHUg
aXMgZ29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UKPiA+ICsgICAgICAgICogdGhlIHRpbWVy
IGludGVycnVwdCBtYXkgYmUgcGVuZGluZyB3aGlsZSBwZXJmb3JtaW5nIHBvd2VyLWRvd24uCj4g
PiArICAgICAgICAqLwo+ID4gKyAgICAgICByaXNjdl9jbG9ja19ldmVudF9zdG9wKCk7Cj4gPiAg
ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gVGhlIHNiaV9leGl0KCkgb2YgT3BlblNCSSB3
aWxsIGRpc2FibGUgbXRpbWVjbXAgd2hlbgo+IHNiaV9oc21faGFydF9zdG9wKCkgc28gdGhlIG10
aW1lY21wIHdpbGwgYmUgZGlzYWJsZWQgdHdpY2UgaWYgdGhlcmUgaXMKPiBubyBTU1RDLgo+IEhv
dyBhYm91dCBhZGRpbmcgYSBTU1RDIGF2YWlsYWJsZSBjaGVjayBiZWZvcmUgdGhlIHJpc2N2X2Ns
b2NrX2V2ZW50X3N0b3A/CgpDdXJyZW50bHksIE9wZW5TQkkgdXNlcyBtdGltZWNtcCBvbmx5IGZv
ciBpbXBsZW1lbnRpbmcKU0JJIHRpbWUgZXh0ZW5zaW9uIGJ1dCBpbiB0aGUgZnV0dXJlLCBPcGVu
U0JJIG1pZ2h0IGltcGxlbWVudAphIHBlci1oYXJ0IHRpbWVyIGV2ZW50IGxpc3QgdG8gYWxsb3cg
TS1tb2RlIHRpbWVyIGV2ZW50cy4KCkRvbid0IGFzc3VtZSBpbiB3aGF0IGVudmlyb25tZW50IHRo
ZSBkcml2ZXIgaXMgcnVubmluZy4KCkl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIGRyaXZlciBpcyBy
dW5uaW5nIHVuZGVyIGEgaHlwZXJ2aXNvcgp3aGljaCBvbmx5IHByb3ZpZGVzIFNCSSB0aW1lIGV4
dGVuc2lvbiBhbmQgZG9lcyBub3QgdmlydHVhbGl6ZQpTc3RjIGV4dGVuc2lvbi4KCj4KPiAgIC8q
Cj4gICAgKiBTdG9wIHRoZSB0aW1lciB3aGVuIHRoZSBjcHUgaXMgZ29pbmcgdG8gYmUgb2ZmbGlu
ZSBvdGhlcndpc2UKPiAgICAqIHRoZSB0aW1lciBpbnRlcnJ1cHQgbWF5IGJlIHBlbmRpbmcgd2hp
bGUgcGVyZm9ybWluZyBwb3dlci1kb3duLgo+ICAgICovCj4gaWYgKHN0YXRpY19icmFuY2hfbGlr
ZWx5KCZyaXNjdl9zc3RjX2F2YWlsYWJsZSkpCj4gICAgIHJpc2N2X2Nsb2NrX2V2ZW50X3N0b3Ao
KTsKPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
