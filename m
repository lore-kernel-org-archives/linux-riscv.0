Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3FBC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 20:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VFiPSLD92df/f14GIebyDtsYa0nzgm4xTFb2WXM9s64=; b=cd5uyXWwbG8oPM0iOdFUG9wLzH
	hmvckx6PCSuDu6Zw0i/S4dwFuT2VMtGKV9JUZIVdrwQL3dz9IlHVOSLf8K2wc0JBU2ei37qPGpCIt
	BH+PGoLVO6/RSCRxuaOA/OComqSZWeU/yFJ87j+M9S38CgWb93jXH+WDujnGAy7Jg0sZ51VjI3+/9
	w8Y8dskNWT27M94wdxft6XJP2vXqJJ/Rv3w382eIo6KgeAsXTV98h9cHvIIjEze3t+GQe2HM/kINo
	+9Sj81oNbLOjvkvFg6iWQ0Q1NTCYEKOcaud1UYqIXITRSQMkBAGBS/Ba8n1ulVRQq6oszx4Dgirse
	CP61x3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0poP-00AhuX-Fd; Thu, 01 Dec 2022 20:05:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pjl-00Aguq-5X
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 20:00:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id k7so2665921pll.6
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 12:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2tI5HdhCwiN69OAnPTmJeg0B+xd577KH88UEmawIS0=;
        b=ROEeyDLQ0/2mGltxq6Nzk8X5cwWVDcLB2O14n9c4pKZE7r8OXSDufnakDsaeKilEu6
         V4RDXN2fwEzJFF7OVkqXTC1yR40bGt39Jg6nXVQnCUFO+M98GiQjbCac8lG+irfgfPAx
         uYLxMMTxL6TBhCzgFD2uz8dpnoRG7vM9OfIE80iOgBgkc5K51BblbrMGxMlykjhlpTD0
         uUZq8j8FFLTZ6MKkwgSmLhFcVKDs8hJOU9jNrZx2+AxKLgNLUEnspStctVvC+7qfNXed
         b7vEa2ltBRj9czNUBan0MUWjizJe6g2P0/Dzoc4Won8BiRibRfTMTe6En45m4xJnUEwX
         kNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2tI5HdhCwiN69OAnPTmJeg0B+xd577KH88UEmawIS0=;
        b=z1l/9vQHUO9O4rcG61ljYwF9F3Ahx/1ilpvnlJoO1AVb7gjGu9ELTwWIAro/aFErQj
         JbFflb2a+ltB1lRt1mH8NmpixTGAdmHC3l+gcQTt7Lvk4JfFky5wRJKkP3pTffytmPmM
         fVamrkOMxqdHfBUNfQMhA7+8HZK3F1Mry4eD/yDfw/z50YtP8IXhS8dI7mHZ9cfmDXVA
         4yNQO3oGBASJMJa3EQe4Wn0KZPO4yNfnShBv4gC7dmYf/XOeq71G4BPW5B3I4aff1lzm
         VTzi2B+//9mm31+y3SB8jaBLlRAXe0zxVzIUXxJWg79OH5tvsQt3Gzx7S207Yu1SS0fT
         aIOw==
X-Gm-Message-State: ANoB5pkuKwPjMkU9jJlbLqox16PqhmNtNg7zzny7w4iqqniMTtHkF1HT
	nwPlT3Ei3v7zZchKadhBoVw05ZLW4p59tA==
X-Google-Smtp-Source: AA0mqf63UnXMDCarclEpJATkO7Xj2jd5Vk+Mt/6A9rtUCNb7aKrYa4QY4W8An4qOxazR+hukawrAMg==
X-Received: by 2002:a17:902:6904:b0:185:3f7a:50cc with SMTP id j4-20020a170902690400b001853f7a50ccmr48245010plk.99.1669924844446;
        Thu, 01 Dec 2022 12:00:44 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v8-20020a17090abb8800b00218daa55e5fsm3422640pjr.12.2022.12.01.12.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 12:00:43 -0800 (PST)
Date: Thu, 01 Dec 2022 12:00:43 -0800 (PST)
X-Google-Original-Date: Thu, 01 Dec 2022 12:00:19 PST (-0800)
Subject: Re: [PATCH v4] riscv: fix race when vmap stack overflow
In-Reply-To: <Y4gSJnVh1/lUSnWo@andrea>
CC: jrtc27@jrtc27.com, guoren@kernel.org, jszhang@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Andrea Parri <andrea@rivosinc.com>
Message-ID: <mhng-e1799ed5-c012-40a1-b730-c20627cdb3f9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_120049_464606_00989B54 
X-CRM114-Status: GOOD (  20.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAzMCBOb3YgMjAyMiAxODo0MzozMiBQU1QgKC0wODAwKSwgQW5kcmVhIFBhcnJpIHdy
b3RlOgo+PiA+Pj4gQEAgLTIzLDYgKzIzLDcgQEAKPj4gPj4+ICNkZWZpbmUgUkVHX0wgICAgICAg
ICAgX19SRUdfU0VMKGxkLCBsdykKPj4gPj4+ICNkZWZpbmUgUkVHX1MgICAgICAgICAgX19SRUdf
U0VMKHNkLCBzdykKPj4gPj4+ICNkZWZpbmUgUkVHX1NDICAgICAgICAgX19SRUdfU0VMKHNjLmQs
IHNjLncpCj4+ID4+PiArI2RlZmluZSBSRUdfQU1PU1dBUF9BUSBfX1JFR19TRUwoYW1vc3dhcC5k
LmFxLCBhbW9zd2FwLncuYXEpCj4+ID4+IEJlbG93IGlzIHRoZSByZWFzb24gd2h5IEkgdXNlIHRo
ZSByZWxheCB2ZXJzaW9uIGhlcmU6Cj4+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9D
QUpGMmdUUkFFWF9qUV93NUgwNWR5YWZaekhxK1A1ajA1VEo9Qyt2K09MX19HUWFtNEFAbWFpbC5n
bWFpbC5jb20vVC8jdQo+PiA+Cj4+ID4gU29ycnksIEkgaGFkbid0IHNlZW4gdGhhdCBvbmUuICBB
ZGRpbmcgQW5kcmVhLiAgSU1PIHRoZSBhY3F1aXJlL3JlbGVhc2UgcGFpciBpcyBuZWNlc3Nhcnkg
aGVyZSwgd2l0aCBqdXN0IHJlbGF4ZWQgdGhlIHN0YWNrIHN0b3JlcyBpbnNpZGUgdGhlIGxvY2sg
Y291bGQgc2hvdyB1cCBvbiB0aGUgbmV4dCBoYXJ0IHRyeWluZyB0byB1c2UgdGhlIHN0YWNrLgo+
Pgo+PiBJIHRoaW5rIHdoYXQgeW91IHJlYWxseSB3YW50IGlzIGEgKmNvbnN1bWUqIGJhcnJpZXIs
IGFuZCBzaW5jZSB5b3UgaGF2ZQo+PiB0aGUgZGF0YSBkZXBlbmRlbmN5IGJldHdlZW4gdGhlIGFt
b3N3YXAgYW5kIHRoZSBtZW1vcnkgYWNjZXNzZXMgKGFuZAo+PiB0aGlzIGlzbuKAmXQgQWxwaGEp
IHlvdeKAmXJlIHRlY2huaWNhbGx5IGZpbmUgd2l0aG91dCB0aGUgYWNxdWlyZSwgc2luY2UKPj4g
eW914oCZcmUgd3JpdGluZyBhc3NlbWJseSBhbmQgaGF2ZSB0aGUgZGF0YSBkZXBlbmRlbmN5IGFz
IHN5bnRhY3RpYy4KPj4gVGhvdWdoIHlvdSBtYXkgc3RpbGwgd2FudCAobmVlZD8pIHRoZSBhY3F1
aXJlIHNvIGxvYWRzL3N0b3JlcyB1bnJlbGF0ZWQKPj4gdG8gdGhlIHN0YWNrIHBvaW50ZXIgdGhh
dCBoYXBwZW4gbGF0ZXIgaW4gcHJvZ3JhbSBvcmRlciBnZXQgb3JkZXJlZAo+PiBhZnRlciB0aGUg
bG9hZCBvZiB0aGUgbmV3IHN0YWNrIHBvaW50ZXIgaW4gY2FzZSB0aGVyZSBjb3VsZCBiZSB3ZWly
ZAo+PiBpc3N1ZXMgKnRoZXJlKi4KPgo+IEFncmVlZC4KPgo+IEp1c3QgdGhlIGZhY3QgdGhhdCB0
aGlzIGlzIHRoZSA0dGggaXRlcmF0aW9uIG9mIHRoaXMgZGlzY3Vzc2lvbiBzdHJvbmdseQo+IHN1
Z2dlc3RzIHRvIHN0aWNrIHRvIHRoZSBhY3F1aXJlIGFuZCB0aGVzZSBpbmxpbmUgY29tbWVudHMg
dG8gbWUuICA7KQoKSSBzcGVudCBhIGxpdHRsZSB0aW1lIGxhc3QgbmlnaHQgdHJ5aW5nIHRvIHJl
YXNvbiBhYm91dCB0aGUgbm8tQVEgCnZlcnNpb24gYW5kIEkgdGhpbmsgaXQgbWlnaHQgYWN0dWFs
bHkgYmUgY29ycmVjdDogdGhlIEFNT1NXQVAgaXMgb24gdGhlIApsb2NrIGFuZCBTUCBpcyBvdmVy
d3JpdHRlbiB3aGVuIGxvYWRpbmcgdXAgdGhlIGFjdHVhbCBzdGFjayBzbyBJIGRvbid0IAp0aGlu
ayB0aGF0J3MgZW5vdWdoIGFsb25lLCBidXQgdGhlIG5vLXNwZWN1bGF0aXZlLWFjY2Vzc2VzIHJ1
bGUgbWlnaHQgYmUgCmVub3VnaCBoZXJlLiAgQWxzbyBJIHRoaW5rIG1hYnllIG5vbmUgb2YgdGhh
dCBldmVuIG1hdHRlcnMsIGJlY2F1c2UgdGhlIApzYW1lLWFkZHJlc3MgcnVsZXMgbWlnaHQgYmFp
bCB1cyBvdXQgZHVlIHRvIHRoZSBuYXR1cmUgb2Ygc3RhY2sgCmFjY2Vzc2VzLgoKVGhhdCBzYWlk
LCB0aGlzIGlzIHNvbWUgY29tcGxpY2F0ZWQgYW5kIHN1YnRsZSByZWFzb25pbmcuICBUaGUgCnBl
cmZvcm1hbmNlIGhlcmUgZG9lc24ndCBtYXR0ZXIgc28gSSdtIGp1c3QgZ29pbmcgdG8gZXJyIG9u
IHRoZSBzaWRlIG9mIApjYXV0aW9uLCBidXQgaWYgc29tZW9uZSBjYXJlcyBlbm91Z2ggdG8gY29t
ZSB1cCB3aXRoIGNvbmNyZXRlIHJlYXNvbmluZyAKYXMgdG8gd2h5IHRoZSBiYXJyaWVyIGlzbid0
IG5lY2Vzc2FyeSBJJ2xsIGF0IGxlYXN0IGxvb2sgYXQgdGhlIHBhdGNoIAoodGhvdWdoIEknbGwg
cHJvYmFibHkgZ251bWJsZSB0aGUgd2hvbGUgdGltZSwgYXMgSSBoYXRlIGJlaW5nIHRyaWNrZWQg
CmludG8gdGhpbmtpbmcpLgoKVGhhdCdkIGJlIGZvci1uZXh0IG1hdGVyaWFsIGFueXdheSwgc28g
dGhlIHllcy1BUSB2ZXJpc29uIGlzIG9uIGZpeGVzIApiZWFjdXNlIHRoZXJlJ3MgYSBjb25jcmV0
ZSBicmVha2FnZSBiZWluZyBmaXhlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
