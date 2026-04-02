Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C97D39420
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2qY5CVIBt9UWCRri4bwl4A/UlVhfOMnU5CO27DfpQc=; b=WPYDYJrQVXydiI
	IAMRzZi/QwnlplD2sbOidzHauJv2Qak7WjA8ewWGavAZ2zH1DJobvwD9b2BuwQ12AHaKHxMKNtymb
	aoQfFPKMv6tho8iphnGacnNKcL8I6ja1LSFarYeIhZKTprgf8t2y9QfHtVNVIqDlaWQIHHJO54/tE
	ZI1rUJLSREJlSXI3/pxZnNzKpPmP0wqVvok3VOMvZG+qW1JxaMvVvJyWoFJyBsrqzxuP3Fhsc7HAy
	VBouimEb9n6ACoL/NGwCG5O2lvWFwcNUaxapEQMYI9W3XaC5D96qaUzcrN7CadSi7lu2mjptZ6V6z
	h3+nULJ1Z8r0yo+tUwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I5p-00000000BGY-0OdB;
	Thu, 02 Apr 2026 13:28:17 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I5m-00000000BG9-45Jv
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 13:28:16 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-67cf1bfc73eso279566eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 06:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775136493; cv=none;
        d=google.com; s=arc-20240605;
        b=aA1qhu2Vm3M4/S8yFSho1EkWD7byW85lQ0qg6PcadM4+7zP3jE4FnzzmvM1yvto6aM
         kLxuMGm5YW/dpUYJWGtU49exWL3ti41Cya5aqngoZS5jt5snyirumhruUR/bc+hBAIOm
         CKH3xBOQfy8j+D7Bzo/ylDDxMr3yu5aku4puirmQVtYS5EXQseGbI2nLmGMZxTeumimx
         yO8alG3KaHoGfV1qg+0kVEuMvRrzUVD1xgNn4PWqa95G5CtDHHbV5ElG1LtyghKJ7/Se
         jXJR4LHxZ63BAaEjuE2+tliDE0kL0vi3FYSVRm0uHLLiOUOCq1/pINB1H9RS5ixjz1cI
         SPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=;
        fh=cuDsWboN/08m6PNf9G37VJGRF3ksaEl8KfHAqzOd3bQ=;
        b=FK7RneWLMC07m0Tz7Ge74xW0n5ZQTY+H8RWtNEZ4wQjkNdNXe6TSChFRLrRtVMngQB
         dVCXruFpWpyb9mXYqHnpa4CvBsLY53iJoLSt2UcbiI174mjP7PmnluOWXrVLSdyuJ8Q0
         rhjB3xityxwke9374cEpQFkdFUT4Ip0NebXP1KdXckFwfLFkS1sq3ifP14RDoMgavWXP
         dynADIpbK9zxFIjl0sXnViNnduoMPXCBR2jFyNnYGbpC9qjWW0PdCh00foU9/2ECJnC3
         HPNQAY0PLigTISDcNTWfBEzv0VxfvtjvbQJ+WA9/F8Tw2Vp4xzHtLFBhhegBYAKEi5K6
         0oNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775136493; x=1775741293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=;
        b=oZ1Db2sSJyoRxsZ9l1Bg+tb4H/5Oum+Dov0DjQMT68EiwavBHTMph4GGl5/yDDsn5C
         PABpLL2JCMc6qaWfVkol6cRZsVlIwstC8LaZwqdQSUFZUMKO6AWKbXeEAXR2tf4LtMoN
         IdC0Jj7fJr2zdDaR4YprZLxC+lQBx29vtoY8fmhLmGdOsovKgNqLYLhUNTB8K3/0PLqt
         lRcA6gp1/JJ4YPuteWlxi7z9cytr0EU0iRtw5+4+uOFCbpGKkvTlUokkQVUI42GXmUqt
         3rKUXdW2H/2x2AjLoBZJhZDf1L3FbmhRqkBG9vV9+FpfqjgzuldmGzXp7umkcgjuZPjp
         HjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136493; x=1775741293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwo7+tgUOrb+SJWwjSXGHYxxEG4gJRnUrJiDAJE/ZOA=;
        b=MQTY4Mrjl02jGAZaKdC+A0IhQzDYTg6MhbO8hgiKVw+PYheHzbEJU5Bi/Onb7d4AXW
         pfMSDl+R5OrhPs40I+uvH7XZqFKR0P3DNl5Y7nLDQNrVvMSVkffKArcQtOZHN78zfRTL
         U+0DTaeMIqYqXLRNSLii5c3zKmfcXYiTJHIWlwirAMYmhLPwXrSaWvb/Iv2RoTkAtKr9
         4fV5itRfBf6HIZZ8CJDluHSbgFsLTZG92+2bgXWlPds1xVqCJDCTIL3DtkRzEhrlgbZF
         vjqrAqKpkLRHgZc5t31KB1ViifWGg6B2roLczZ9dKVQFK5zktppmkAMpnRM0GM5K2o4+
         hyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6nM8ay6RlcO/GL/3+D/MB40iOroV9pbXqZ6hJYdaR4RPtuNCwpVygQBC1q2zhTmL0Z6X1uSQZp6vtfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1bla662nEIFmoL2h/RtIzWhsKckw2z/g8+kVIykxbJHfMaCmG
	cZP7ycwtu1fQiBe+UBbfeUmD/sov1dEGJE67gomzNz3HkG9TCH1CeJlJs264oeCunhFPiLNZW7K
	bMVo8iF3+iMAU8upzL3LgPRLDHi+EHKXmom2S07mPXQ==
X-Gm-Gg: ATEYQzzO3MOzukeFKCTTu605+MXBZFZ5a5+YFWj1olbTkvxiQQDpUuKlwdCKZ+4TXf7
	FN5u0BAvhXbBbE/nMw/1/iWP2UZZE94VVwCGwLkYbZeQ5vZzs8PtKj+HGjFxq/aeKxg8vuw8wH2
	VxwgPuyIXdY6LbOqyYCLJn4TrnKOg0cHXis9KnG1nbeuEvmSJ4UP8LEqeJRarVklOg0fi0KtRtJ
	SPkUsS6JsDtmCPMy8BBV4a+Uf4PgNFTXUzz886O8F9WvNh+Byjdu4krR1qCHM8IqZP8/Tbiz5AA
	domagc8XWRFWOymPZo4uiQiPNs+p0h2shoA7Dqc1/3DRJD6UYlo9zEikIHmBlFv/ljjosw+9HGr
	9zf36a3Otfu63qVKcRNGZlMig4Q==
X-Received: by 2002:a05:6820:2f01:b0:67f:ac08:d78b with SMTP id
 006d021491bc7-67fac08d9a1mr2937060eaf.25.1775136493375; Thu, 02 Apr 2026
 06:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260227121008.442241-1-tjytimi@163.com>
In-Reply-To: <20260227121008.442241-1-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 18:58:01 +0530
X-Gm-Features: AQROBzCdorpmHyQHBiu4oSiym1sKMdsAQ59SLSIP6DWXbg54kifkZBvpDdbltSk
Message-ID: <CAAhSdy0M6+1w0FbqzmpQ2gkv4sXgo9+WcbW-TB9mBLvD7=GXDw@mail.gmail.com>
Subject: Re: [PATCH v7] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
To: Jinyu Tang <tjytimi@163.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_062815_219184_9BF5216C 
X-CRM114-Status: GOOD (  36.75  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgNTo0MOKAr1BNIEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIGt2bV9hcmNoX3ZjcHVfbG9hZCgpIHVuY29uZGl0
aW9uYWxseSByZXN0b3JlcyBndWVzdCBDU1JzLAo+IEhHQVRQLCBhbmQgQUlBIHN0YXRlLiBIb3dl
dmVyLCB3aGVuIGEgVkNQVSBpcyBsb2FkZWQgYmFjayBvbiB0aGUgc2FtZQo+IHBoeXNpY2FsIENQ
VSwgYW5kIG5vIG90aGVyIEtWTSBWQ1BVIGhhcyBydW4gb24gdGhpcyBDUFUgc2luY2UgaXQgd2Fz
Cj4gbGFzdCBwdXQsIHRoZSBoYXJkd2FyZSBDU1JzIGFuZCBBSUEgcmVnaXN0ZXJzIGFyZSBzdGls
bCB2YWxpZC4KPgo+IFRoaXMgcGF0Y2ggb3B0aW1pemVzIHRoZSB2Y3B1X2xvYWQgcGF0aCBieSBz
a2lwcGluZyB0aGUgZXhwZW5zaXZlIENTUgo+IGFuZCBBSUEgd3JpdGVzIGlmIGFsbCB0aGUgZm9s
bG93aW5nIGNvbmRpdGlvbnMgYXJlIG1ldDoKPiAxLiBJdCBpcyBiZWluZyByZWxvYWRlZCBvbiB0
aGUgc2FtZSBDUFUgKHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpLgo+IDIuIFRoZSBD
U1JzIGFyZSBub3QgZGlydHkgKCF2Y3B1LT5hcmNoLmNzcl9kaXJ0eSkuCj4gMy4gTm8gb3RoZXIg
VkNQVSB1c2VkIHRoaXMgQ1BVICh2Y3B1ID09IF9fdGhpc19jcHVfcmVhZChrdm1fZm9ybWVyX3Zj
cHUpKS4KPgo+IFRvIGVuc3VyZSB0aGlzIGZhc3QtcGF0aCBkb2Vzbid0IGJyZWFrIGNvcm5lciBj
YXNlczoKPiAtIExpdmUgbWlncmF0aW9uIGFuZCBWQ1BVIHJlc2V0IGFyZSBuYXR1cmFsbHkgc2Fm
ZS4gS1ZNIGluaXRpYWxpemVzCj4gICBsYXN0X2V4aXRfY3B1IHRvIC0xLCB3aGljaCBndWFyYW50
ZWVzIHRoZSBmYXN0LXBhdGggd29uJ3QgdHJpZ2dlci4KPiAtIFRoZSAnY3NyX2RpcnR5JyBmbGFn
IHRyYWNrcyBydW50aW1lIHVzZXJzcGFjZSBpbnRlcnZlbnRpb25zLiBJZgo+ICAgdXNlcnNwYWNl
IG1vZGlmaWVzIGd1ZXN0IGNvbmZpZ3VyYXRpb25zIChlLmcuLCBoZWRlbGVnIHZpYQo+ICAgS1ZN
X1NFVF9HVUVTVF9ERUJVRywgb3IgQ1NScyBpbmNsdWRpbmcgQUlBIHZpYSBLVk1fU0VUX09ORV9S
RUcpLAo+ICAgdGhlIGZsYWcgaXMgc2V0IHRvIHNraXAgdGhlIGZhc3QgcGF0aC4KPgo+IFdpdGgg
dGhlICdjc3JfZGlydHknIHNhZmVndWFyZCBwcm92ZW4gZWZmZWN0aXZlLCBpdCBpcyBzYWZlIHRv
Cj4gaW5jbHVkZSBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCgpIGluc2lkZSB0aGUgc2tpcCBsb2dp
YyBub3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+CgpR
dWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4xCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIHY2
IC0+IHY3Ogo+ICAtIE1vdmVkIGt2bV9yaXNjdl92Y3B1X2FpYV9sb2FkKCkgaW50byB0aGUgZmFz
dC1wYXRoIHNraXAgbG9naWMsIGFzCj4gICAgc3VnZ2VzdGVkIGJ5IFJhZGltIEtyxI1tw6HFmS4K
PiAgLSBWZXJpZmllZCB0aGUgZml4IGZvciB0aGUgSU1TSUMgaW5zdGFiaWxpdHkgaXNzdWUgcmVw
b3J0ZWQgaW4gdjMuCj4gICAgVGVzdGluZyB3YXMgY29uZHVjdGVkIG9uIFFFTVUgMTAuMC4yIHdp
dGggZXhwbGljaXRseSBlbmFibGVkIEFJQQo+ICAgIChgLW1hY2hpbmUgdmlydCxhaWE9YXBsaWMt
aW1zaWNgKS4gVGhlIGd1ZXN0IGJvb3RzIHN1Y2Nlc3NmdWxseQo+ICAgIHVzaW5nIHZpcnRpby1t
bWlvIGRldmljZXMgbGlrZSB2aXJ0aW8tYmxrIGFuZCB2aXJ0aW8tbmV0Lgo+Cj4gIHY1IC0+IHY2
Ogo+ICBBcyBzdWdnZXN0ZWQgYnkgQW5kcmV3IEpvbmVzLCBjaGVja2luZyAnbGFzdF9leGl0X2Nw
dScgZmlyc3QgKG1vc3QKPiAgbGlrZWx5IHRvIGZhaWwgb24gYnVzeSBob3N0cykgYW5kIHBsYWNp
bmcgdGhlIGV4cGVuc2l2ZQo+ICBfX3RoaXNfY3B1X3JlYWQoKSBsYXN0LCBza2lwcGluZyBfX3Ro
aXNfY3B1X3dyaXRlKCkgaW4ga3ZtX2FyY2hfdmNwdV9wdXQoKQo+ICBpZiBrdm1fZm9ybWVyX3Zj
cHUgaXMgYWxyZWFkeSBzZXQgdG8gdGhlIGN1cnJlbnQgVkNQVS4KPgo+ICB2NCAtPiB2NToKPiAg
LSBEcm9wcGVkIHRoZSAndmNwdS0+c2NoZWR1bGVkX291dCcgY2hlY2sgYXMgQW5kcmV3IEpvbmVz
IHBvaW50ZWQgb3V0LAo+ICAgIHJlbHlpbmcgb24gJ2xhc3RfZXhpdF9jcHUnLCAnZm9ybWVyX3Zj
cHUnLCBhbmQgJyFjc3JfZGlydHknCj4gICAgaXMgc3VmZmljaWVudCBhbmQgc2FmZS4gVGhpcyBl
eHBhbmRzIHRoZSBvcHRpbWl6YXRpb24gdG8gY292ZXIgbWFueQo+ICAgIHVzZXJzcGFjZSBleGl0
cyAoZS5nLiwgTU1JTykgYXMgd2VsbC4KPiAgLSBBZGRlZCBhIGJsb2NrIGNvbW1lbnQgaW4ga3Zt
X2FyY2hfdmNwdV9sb2FkKCkgdG8gd2FybiBmdXR1cmUKPiAgICBkZXZlbG9wZXJzIGFib3V0IG1h
aW50YWluaW5nIHRoZSAnY3NyX2RpcnR5JyBkZXBlbmRlbmN5LCBhcyBBbmRyZXcncwo+ICAgIHN1
Z2dlc3Rpb24gdG8gcmVkdWNlIGZyYWdpbGl0eS4KPiAgLSBSZW1vdmVkIHVubmVjZXNzYXJ5IHNp
bmdsZS1saW5lIGNvbW1lbnRzIGFuZCBmaXhlZCBpbmRlbnRhdGlvbiBuaXRzLgo+Cj4gIHYzIC0+
IHY0Ogo+ICAtIEFkZHJlc3NlZCBBbnVwIFBhdGVsJ3MgcmV2aWV3IHJlZ2FyZGluZyBoYXJkd2Fy
ZSBzdGF0ZSBpbmNvbnNpc3RlbmN5Lgo+ICAtIEludHJvZHVjZWQgJ2Nzcl9kaXJ0eScgZmxhZyB0
byB0cmFjayBkeW5hbWljIHVzZXJzcGFjZSBDU1IvQ09ORklHCj4gICAgbW9kaWZpY2F0aW9ucyAo
S1ZNX1NFVF9PTkVfUkVHLCBLVk1fU0VUX0dVRVNUX0RFQlVHKSwgZm9yY2luZyBhIGZ1bGwKPiAg
ICByZXN0b3JlIHdoZW4gZGVidWdnaW5nIG9yIG1vZGlmeWluZyBzdGF0ZXMgYXQgdXNlcnNwYWNl
Lgo+ICAtIEtlcHQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQoKSBvdXQgb2YgdGhlIHNraXAgYmxv
Y2sgdG8gcmVzb2x2ZSBJTVNJQwo+ICAgIFZTLWZpbGUgaW5zdGFiaWxpdHkuCj4KPiAgdjIgLT4g
djM6Cj4gIHYyIHdhcyBtaXNzaW5nIGEgY3JpdGljYWwgY2hlY2sgYmVjYXVzZSBJIGdlbmVyYXRl
ZCB0aGUgcGF0Y2ggZnJvbSBteQo+ICB3cm9uZyAoZXhwZXJpbWVudGFsKSBicmFuY2guIFRoaXMg
aXMgZml4ZWQgaW4gdjMuIFNvcnJ5IGZvciBteSB0cm91YmxlLgo+Cj4gIHYxIC0+IHYyOgo+ICBB
cHBseSB0aGUgbG9naWMgdG8gYWlhIGNzciBsb2FkLiBUaGFua3MgZm9yIEFuZHJldyBKb25lcydz
IGFkdmljZS4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDMg
KysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysr
KysrKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAgMiAr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXggMjQ1ODUzMDRjLi43ZWU0N2I4M2Mg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gQEAgLTI3Myw2ICsyNzMsOSBAQCBz
dHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7Cj4gICAgICAgICAvKiAnc3RhdGljJyBjb25maWd1cmF0aW9u
cyB3aGljaCBhcmUgc2V0IG9ubHkgb25jZSAqLwo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2Nv
bmZpZyBjZmc7Cj4KPiArICAgICAgIC8qIEluZGljYXRlcyBtb2RpZmllZCBndWVzdCBDU1JzICov
Cj4gKyAgICAgICBib29sIGNzcl9kaXJ0eTsKPiArCj4gICAgICAgICAvKiBTQkkgc3RlYWwtdGlt
ZSBhY2NvdW50aW5nICovCj4gICAgICAgICBzdHJ1Y3Qgewo+ICAgICAgICAgICAgICAgICBncGFf
dCBzaG1lbTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdS5jCj4gaW5kZXggYTU1YTk1ZGE1Li4yZTRkZmZmMDcgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAg
LTI0LDYgKzI0LDggQEAKPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRTCj4gICNpbmNsdWRl
ICJ0cmFjZS5oIgo+Cj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3Qga3ZtX3ZjcHUgKiwg
a3ZtX2Zvcm1lcl92Y3B1KTsKPiArCj4gIGNvbnN0IHN0cnVjdCBfa3ZtX3N0YXRzX2Rlc2Mga3Zt
X3ZjcHVfc3RhdHNfZGVzY1tdID0gewo+ICAgICAgICAgS1ZNX0dFTkVSSUNfVkNQVV9TVEFUUygp
LAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGVjYWxsX2V4aXRfc3RhdCksCj4g
QEAgLTUzNyw2ICs1MzksOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRfZ3Vlc3RfZGVi
dWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLmNm
Zy5oZWRlbGVnIHw9IEJJVChFWENfQlJFQUtQT0lOVCk7Cj4gICAgICAgICB9Cj4KPiArICAgICAg
IHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gdHJ1ZTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPiAg
fQo+Cj4gQEAgLTU4MSw2ICs1ODUsMjEgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X2xvYWQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2NzciAq
Y3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X2Nv
bmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
SWYgVkNQVSBpcyBiZWluZyByZWxvYWRlZCBvbiB0aGUgc2FtZSBwaHlzaWNhbCBDUFUgYW5kIG5v
Cj4gKyAgICAgICAgKiBvdGhlciBLVk0gVkNQVSBoYXMgcnVuIG9uIHRoaXMgQ1BVIHNpbmNlIGl0
IHdhcyBsYXN0IHB1dCwKPiArICAgICAgICAqIHdlIGNhbiBza2lwIHRoZSBleHBlbnNpdmUgQ1NS
IGFuZCBIR0FUUCB3cml0ZXMuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogTm90ZTogSWYgYSBu
ZXcgQ1NSIGlzIGFkZGVkIHRvIHRoaXMgZmFzdC1wYXRoIHNraXAgYmxvY2ssCj4gKyAgICAgICAg
KiBtYWtlIHN1cmUgdGhhdCAnY3NyX2RpcnR5JyBpcyBzZXQgdG8gdHJ1ZSBpbiBhbnkKPiArICAg
ICAgICAqIGlvY3RsIChlLmcuLCBLVk1fU0VUX09ORV9SRUcpIHRoYXQgbW9kaWZpZXMgaXQuCj4g
KyAgICAgICAgKi8KPiArICAgICAgIGlmICh2Y3B1ICE9IF9fdGhpc19jcHVfcmVhZChrdm1fZm9y
bWVyX3ZjcHUpKQo+ICsgICAgICAgICAgICAgICBfX3RoaXNfY3B1X3dyaXRlKGt2bV9mb3JtZXJf
dmNwdSwgdmNwdSk7Cj4gKyAgICAgICBlbHNlIGlmICh2Y3B1LT5hcmNoLmxhc3RfZXhpdF9jcHUg
PT0gY3B1ICYmICF2Y3B1LT5hcmNoLmNzcl9kaXJ0eSkKPiArICAgICAgICAgICAgICAgZ290byBj
c3JfcmVzdG9yZV9kb25lOwo+ICsKPiArICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gZmFs
c2U7Cj4gICAgICAgICBpZiAoa3ZtX3Jpc2N2X25hY2xfc3luY19jc3JfYXZhaWxhYmxlKCkpIHsK
PiAgICAgICAgICAgICAgICAgbnNoID0gbmFjbF9zaG1lbSgpOwo+ICAgICAgICAgICAgICAgICBu
YWNsX2Nzcl93cml0ZShuc2gsIENTUl9WU1NUQVRVUywgY3NyLT52c3N0YXR1cyk7Cj4gQEAgLTYy
NCw2ICs2NDMsOSBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGludCBjcHUpCj4KPiAgICAgICAgIGt2bV9yaXNjdl9tbXVfdXBkYXRlX2hnYXRwKHZjcHUp
Owo+Cj4gKyAgICAgICBrdm1fcmlzY3ZfdmNwdV9haWFfbG9hZCh2Y3B1LCBjcHUpOwo+ICsKPiAr
Y3NyX3Jlc3RvcmVfZG9uZToKPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc3RvcmUo
dmNwdSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X2hvc3RfZnBfc2F2ZSgmdmNwdS0+YXJj
aC5ob3N0X2NvbnRleHQpOwo+IEBAIC02MzMsOCArNjU1LDYgQEAgdm9pZCBrdm1fYXJjaF92Y3B1
X2xvYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAga3ZtX3Jpc2N2
X3ZjcHVfZ3Vlc3RfdmVjdG9yX3Jlc3RvcmUoJnZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guaXNh
KTsKPgo+IC0gICAgICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX2xvYWQodmNwdSwgY3B1KTsKPiAtCj4g
ICAgICAgICBrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFfU1RFQUxfVVBEQVRFLCB2Y3B1KTsKPgo+
ICAgICAgICAgdmNwdS0+Y3B1ID0gY3B1Owo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IGU3YWI2
Y2IwMC4uZmMwOGJmODMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVn
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTY1Miw2ICs2NTIs
OCBAQCBzdGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X3NldF9yZWdfY3NyKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
Cj4gKyAgICAgICB2Y3B1LT5hcmNoLmNzcl9kaXJ0eSA9IHRydWU7Cj4gKwo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
