Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B002C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmVJUvOb6Wdu6DFskfhO3jgx1I9Eh/5uw/a2ktC2ePc=; b=Y5GHM29g2nwgEG
	4BMnw56ezrSVglA18yIlImEeK5cagoW4UJxJh6uSZpAEad5y4tW1UC4xOwmFUHsAx2O1P97uVOUrP
	XUOpvGgh1l9MwnMR+tMIaXyVcNPnTh6RIfhvfKP0gSPSkjZ+F5Tfko6RGPPQhDlNBj7FiK6Gyi/OY
	Vt8UAvAPjxv915C4EytCKYvhj/xyds9iyF0511VW41jYl4Rn6MjCfw357AooJy1UU0VSSw4HmJ40S
	ujjIGEV6Nhyce3TlhhiAUKomdcFYaYkMP8B5SVASiLGoIrMCX5jAlRgfGxfIV2QoTIJi9mn27WoWX
	dhWHjYvc0QK1MiPShKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQZO-0000000GuAu-1Hbu;
	Mon, 10 Feb 2025 09:59:14 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQYe-0000000Gu32-3Pgg
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 09:58:30 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30737db1ab1so37038481fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 01:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739181506; x=1739786306; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz7a8oG84+js9CrDUqiLSZ8YAPcqO5VoUXBzq5EVAfs=;
        b=axKvDv3XBNV37h4ultn27KkKDNaGkkRfOsdhU8IvIXacnx16L0kvVHzdfeq5hjrvIQ
         mHVEH/7zAiveTx3y+cAa0B3Vdg5vO5lRsQh9n8615U+3Lri6Ly4zF0BqP6W/P5gQci9+
         4xneu0ZG/EAtOdzmouCOhJ7a7+9FnfvpAf+x8x9FNZUfY/QwSVTMrJ/ujfTrz2H95urQ
         ew/e0gkrVBftJ3rrsItsky8AZBWQZkiThpHaGAsoqJPIz9JiERkow56OmEe0Lm8TXNH7
         AywuIcxAlbRAaGBP6XleVt7Iy7UlH0aJHD8uNDIkbGiMuap+/bGLseVh5nMHMfKnxR9o
         sUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181506; x=1739786306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz7a8oG84+js9CrDUqiLSZ8YAPcqO5VoUXBzq5EVAfs=;
        b=lDH2k5t0V2p/I6O42+Q1eYJT0NY1+oY4ASC5zYFYFZtyE9pLVGOW1eWKCCivPNWsXK
         L6MEbnJx3ShRcBkzjDk4iZvGoO3p46+Po8wcgo1hF/fpz5M6egtA/2ouj2Dq7vn8Kkae
         QJTlO6RMyIu2Wug+v2RDWgqLOFKmvqC/Owi9GdDg2ssJfb+8a7Z5wuOb06hBKp5d69UT
         8kqc/wALJqcd5j7UuRhHzF3sNjAEVqlsINCDvkAdusBj1wMXE1fHlNU8UWg8aQxgpEjg
         TfPZEM7r2hqoABu/JKcPjQys20hLzUX+A8+CNyy9TTHO2CEDZiTC+NkOM2yQsYzhqM40
         j4fg==
X-Gm-Message-State: AOJu0YwF5wBdKIvPxdF2id86w8tvGUFLv6hyxrJ6JFBAc6n3Xq8Xusnk
	aGClS0g6OPW/UmiMzz7SmErQBvi/R6pk8NkLREC2ATD8sfrbpxnSmHSfkiJm0X6S6u/4CJsGMfP
	ltPuU7USC9m6Tc1oosQxGl4nw+Jc/ZnoUGl3RAw==
X-Gm-Gg: ASbGncvTQVARGkbTBeVBULOlopaoDms7QJweqd1gPaCRQQFTMzq6r9SHFrA04f79DUn
	0+Ar/5QSUWhexjJp0NFivvbmR1iGsKalMQRqucDGqBBMA/1b9qOdvymTlwj8A3RrhnjmF2BFAhA
	==
X-Google-Smtp-Source: AGHT+IH3sd2iWumk0wk3iOPbZueUud59Dn5DSY5S0aDVJ1BDCzM6fwAq4LDmJmPd5QjvGfifb6c/WQK/vtvKlCb8xd0=
X-Received: by 2002:a2e:9fc5:0:b0:308:eabd:297a with SMTP id
 38308e7fff4ca-308eabd2eb1mr16802441fa.17.1739181506482; Mon, 10 Feb 2025
 01:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com> <20250210-d575562e04d84ca570e26f5d@orel>
In-Reply-To: <20250210-d575562e04d84ca570e26f5d@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 10 Feb 2025 15:28:13 +0530
X-Gm-Features: AWEUYZmECa7UuKoGzvOCu3WthryUNQTBxalJl0J0QbjchfqKlrFJBDvtCle-H5c
Message-ID: <CAK9=C2X5Hu_LQHmXUea7Xhq5cHaJqtcncgwUeb2+2uMvbTiW3w@mail.gmail.com>
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and skipping
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, 
	jesse@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_015828_853597_A5424276 
X-CRM114-Status: GOOD (  27.25  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMjo1NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMDgsIDIwMjUgYXQgMDE6Mjk6
NDJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDcsIDIwMjUgYXQg
OTo0OeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBUaGUgZmlyc3Qgc2l4IHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgYXJlIGZpeGVz
IGFuZCBjbGVhbnVwcyBvZiB0aGUKPiA+ID4gdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBwcm9iaW5n
IGNvZGUuIFRoZSBuZXh0IHR3byBwYXRjaGVzIGludHJvZHVjZQo+ID4gPiBzdXBwb3J0IHRvIHNr
aXAgcHJvYmluZyBieSBtYXRjaGluZyB2ZW5kb3IvYXJjaC9pbXAgaWRzIGFuZCBjaGVja2luZyBh
Cj4gPiA+IHRhYmxlIGZvciB0aGUgYWNjZXNzIHNwZWVkIHR5cGUuIFRoZSBsYXN0IHBhdGNoIGFw
cGxpZXMgdGhlIG5ldyBza2lwCj4gPiA+IHN1cHBvcnQgdG8gVmVudGFuYSBoYXJ0cy4KPiA+Cj4g
PiBBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gYWxzbyBza2lwIHByb2JpbmcgbWlzYWxpZ25lZCBhY2Nl
c3Mgd2hlbiBaaWNjbHNtCj4gPiBleHRlbnNpb24gaXMgcHJlc2VudCBpbiB0aGUgSVNBIHN0cmlu
Zy4gVGhlIFppY2Nsc20gZXh0ZW5zaW9uIGlzIGRlZmluZWQKPiA+IGFzIHBhcnQgb2YgdGhlIHJh
dGlmaWVkIFJWQTIzIHByb2ZpbGUuCj4KPiBUaGUgZGVmaW5pdGlvbiBvZiBaaWNjbHNtIGRvZXNu
J3QgZXhwbGljaXRseSBzdGF0ZSB0aGF0IG1pc2FsaWduZWQgd29yZAo+IGFjY2Vzc2VzIHdpbGwg
YmUgZmFzdGVyIHRoYW4gYnl0ZSBhY2Nlc3NlcyB0byB0aGUgc2FtZSBhZGRyZXNzZXMuIFRoZXJl
J3MKPiBhbHNvIHRoaXMgc3BlYyBpc3N1ZVsxXSB3aGljaCBhcHBlYXJzIHRvIHN0YXRlIHRoYXQg
WmljY2xzbSBjYW5ub3QgYmUgdXNlZAo+IHRvIGluZmVyIGZhc3QgbWlzYWxpZ25lZCBhY2Nlc3Nl
cy4KPgo+IEJ1dCwgbGlrZSBDaGFybGllIHN1Z2dlc3RzLCBtYXliZSB3ZSBzaG91bGQgYWR2b2Nh
dGUgdGhlIGNyZWF0aW9uIG9mIGFuCj4gZXh0ZW5zaW9uIChvciAibmFtZWQgZmVhdHVyZSIpIHdo
aWNoIGFsbG93cyBzcGVjaWZpY2FsbHkgYWR2ZXJ0aXNpbmcgdGhhdAo+IG1pc2FsaWduZWQgYWNj
ZXNzZXMgYXJlIGZhc3QuCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlz
YS1tYW51YWwvaXNzdWVzLzE2MTEKCkkgYW0gbm90IHN1cmUgd2hlbiBzdWNoIGFuIGV4dGVuc2lv
biB3b3VsZCBzaG93IHVwIHNvIGZvciBub3cKc2tpcHBpbmcgdW5hbGlnbmVkIHRlc3RzIGJhc2Vk
IG9uIGltcGxlbWVudGF0aW9uIElEIHNlZW1zCnJlYXNvbmFibGUuCgpBbHNvLCBpdCBzZWVtcyB0
aGlzIHNlcmllcyBpcyB0b3RhbGx5IHNraXBwaW5nIHRoZSBleGlzdGluZyBib290LXRpbWUKcHJp
bnQgZm9yIGZhc3QgdW5hbGlnbmVkIGFjY2Vzcy4gUGxlYXNlIHRyeSB0byBrZWVwIHRoZSBib290
LXRpbWUKcHJpbnQgaW4gc29tZSBmb3JtLgoKUmVnYXJkcywKQW51cAoKPgo+IFRoYW5rcywKPiBk
cmV3Cj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+ID4KPiA+ID4gKEknZCBiZSBo
YXBweSB0byBzcGxpdCB0aGUgZml4ZXMgZnJvbSB0aGUgbmV3IHNraXAgc3VwcG9ydCBpZiB3ZSB3
YW50IHRvCj4gPiA+IGRpc2N1c3MgdGhlIHNraXAgc3VwcG9ydCBpbmRlcGVuZGVudGx5LCBidXQg
SSB3YW50IHRvIGJhc2Ugb24gdGhlIGZpeGVzCj4gPiA+IGFuZCBJJ20gbm90IHN1cmUgaWYgcGF0
Y2h3b3JrIHN1cHBvcnRzIEJhc2VkLW9uOiAkTUVTU0FHRV9JRC8kTE9SRV9VUkwKPiA+ID4gb3Ig
bm90IGF0IHRoZSBtb21lbnQsIHNvIEknbSBqdXN0IHBvc3RpbmcgdG9nZXRoZXIgZm9yIG5vdyBp
biBvcmRlciB0bwo+ID4gPiBiZSBhYmxlIHRvIGNoZWNrIGZvciBteSBwYXRjaHdvcmsgZ3JlZW4g
bGlnaHRzISkKPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBkcmV3Cj4gPiA+Cj4gPiA+IEFuZHJl
dyBKb25lcyAoOSk6Cj4gPiA+ICAgcmlzY3Y6IEFubm90YXRlIHVuYWxpZ25lZCBhY2Nlc3MgaW5p
dCBmdW5jdGlvbnMKPiA+ID4gICByaXNjdjogRml4IHJpc2N2X29ubGluZV9jcHVfdmVjCj4gPiA+
ICAgcmlzY3Y6IEZpeCBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzCj4gPiA+ICAgcmlz
Y3Y6IENoYW5nZSBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzIHRvIHZvaWQK
PiA+ID4gICByaXNjdjogRml4IHNldCB1cCBvZiBjcHUgaG90cGx1ZyBjYWxsYmFja3MKPiA+ID4g
ICByaXNjdjogRml4IHNldCB1cCBvZiB2ZWN0b3IgY3B1IGhvdHBsdWcgY2FsbGJhY2sKPiA+ID4g
ICByaXNjdjogUHJlcGFyZSBmb3IgdW5hbGlnbmVkIGFjY2VzcyB0eXBlIHRhYmxlIGxvb2t1cHMK
PiA+ID4gICByaXNjdjogSW1wbGVtZW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfdGFibGUKPiA+
ID4gICByaXNjdjogQWRkIFZlbnRhbmEgdW5hbGlnbmVkIGFjY2VzcyB0YWJsZSBlbnRyaWVzCj4g
PiA+Cj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgICAgICAgfCAg
IDQgKy0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yaWRfbGlzdC5oICAgICB8
ICAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgICAgICAg
fCAgMTQgKy0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQu
YyB8IDI3OCArKysrKysrKysrKysrKy0tLS0tLS0KPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMjAw
IGluc2VydGlvbnMoKyksIDk3IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiAtLQo+ID4gPiAyLjQ4
LjEKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
