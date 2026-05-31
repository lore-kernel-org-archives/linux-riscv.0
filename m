Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117F3CD6E52
	for <linux-riscv@archiver.kernel.org>; Sun, 31 May 2026 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0nLw89hhNmgygSYz+qcz8TtPlek8d+bW1Q84aU1t0Y=; b=sKwY3fbI/WoMWC
	t7Edp+Qzmd5bqOjcajF/tMOqCzdjzuiXlGl2cTSi3+D+Q1+yrGYergf/YU42hc7oF0suWFjyTWnh1
	Z7nrUHaED7jJloZbMUUdeKybwuc9+NWJ+laYyrz21/6e4HG6++Fv0KdfC3aZaJiDVUTXf/BwInGhR
	1F/v+fYldYunGO6iK3kfca+bd9qRJDM+Q4EhSm7rNgo3qGThI1QBuFrAfsw4M2HGC+nAenbCsyQK9
	9sbi9n7BlmuH2if/+qWx3HwK96GZsNPdMddiYjFK1HqTsh1ZQuyEaDaX7FeOcnhVmYzXsFPm5g3mN
	kIB8g9jcVbhbD8X9hlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThqG-00000009g0R-3pVQ;
	Sun, 31 May 2026 15:12:44 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThqF-00000009fzj-0XuE
	for linux-riscv@lists.infradead.org;
	Sun, 31 May 2026 15:12:44 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-43b78b54dbdso5793550fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 May 2026 08:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780240362; cv=none;
        d=google.com; s=arc-20240605;
        b=IjaxLdJhXKh5hjhwCVjPedJ66MBdv65JaVpsfwNdYInWSSfHN62rr58nkp5Pp1M2c/
         j+6INLLbqTdHovqm9bIa3Iu3LRHuZjEZB99hQnc6eKPtw20UDEv730ZQnH4IRne0QuUo
         yh7rDRmnrah+e+jSWUKAOKEBPladGdsyptZz+u/dR5kUtJl+sIV5NVswI/dlcaOfouNo
         ggFQsA32SuHdMrzlENjvhlRg250ZNkjLBko4ox2FJwUjKUNIQEY7D0JeXnIwZd54XIKE
         dlFEHQ/iediK2I/+PDXvcDTWUrDuaP2y5oLxjJ3WbBY7sfzQlWMQT05Jpka2gsja06V2
         l0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ht2YVEPAer5B0FIawUvEH7O2krIPHZoNfVeG+2PYK1A=;
        fh=qLPHgJ6fPtgehnxRWM/Ksai1OSOPS1RD9hPZa6HFE5M=;
        b=BDhJKEwYtsjR2J4nPaWufmu0PSiQxAckj9zXU1quplSTrsYcHZUjlnYAPRNfaA6EiB
         LZOcJU9a8R3fP2uopW6o+red0G2E7BVf7qHLmxRQG1BnYRimJmfKtmTgmW2PtvCuJt2W
         RSmOtxSrs0B4kNr0modEDRFr2EssnRSIL5C60mvDN8CzQ5pQWcWRBRISf6KefSobVTz5
         qSdXbulgOXv+4ObAbIHBBfW/MGyAhv0D9CI2ABR58AQGLuE32Ffy8DxFaw4x7+ievZMY
         KeFN2/xBJJgEeNwK6Pa3CSJROWhIVtANKxZAUTYDLlKXYJ0743HvKRo/0F6AflAl2Edz
         04PA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780240362; x=1780845162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht2YVEPAer5B0FIawUvEH7O2krIPHZoNfVeG+2PYK1A=;
        b=VPmIsM5jO1eKV1FyE01+Upa+q9w1zuyNEaLwU2VmPUCbBec+h+q185PHsq5iQgS2oL
         yZhejggS5uVswEN97HYghpWdhGyGw/Ahtvi21jJVpyJvjxXvd5lLZSZ5u+gQaSNN5T4B
         YfVtJCvfAZDN/2HjsM6ZPx+vpy8jq7iY97kOjTBLIX8QyOzLFCvcqUktmMh8q7K9DzK2
         HA9NJ8MuAawcK2tkjaO0jhzi6M60TdbemCTWzN6SCUEOJwLKG9VfDhFPR8QrHMXS04SE
         Uyds3u1GbgEGacKaI7tiJt6ZIA4DiYzeaYoQo7yf1f5Mfk9mH6oDTY6NfVyxKioym57Y
         KFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780240362; x=1780845162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ht2YVEPAer5B0FIawUvEH7O2krIPHZoNfVeG+2PYK1A=;
        b=C0Q2HpSJILnqlgha/FgkVDYfuqaicryzX9Vfvhlw29Zv+rr/+bCcSuDI0Hx6BZKyI4
         DBLR0zCio4fUoLI3dF/5FHltkT3YTXHXggp5CuEX7pBF/3cLAqIRt47YN7UrQQh6Tj1j
         BMkkccBVX8t8H82fJuzDI+4cfg9durvMQVbXUnXIREmR8L8WteJWOU5Rc6ifxYPTqrA5
         fzsIPGXu3PxWLD2YYmKg3IYYvLD4Kt3XDrGf1sHUiaPqoCQMdhFCDnPQuqESdIHNrjNi
         fcN1K8aAKvx7+VM+2kz2nX6fijsbaWnfsEAMsJdDhU2+q1pNIO/UEJGWNqRvsjeG7uDJ
         D8+g==
X-Forwarded-Encrypted: i=1; AFNElJ9DaD4fYxpPcxqqCWyD+RA1GGTzl8Ux1QwkcTkfalpRVW/isJBQ0gVvyX2EeJuOFDvDtgjfrlrsaCHkLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEs7bh9kuu5ynFj9UB63oaUN6jIY/Qd8FU9B3iVTSVeekbb8GT
	GKZWDJsCVQ59G4R3dn4he3rz3c6zzDDLnK7HkHE7E4sqWWpcvP4twf0YwctD5eaqzgAWsWtSuh7
	l7ANuyPZ18IYuUn09Q6pLYR223VjhgnFMVhuefS+L771N0q5ipGoY
X-Gm-Gg: Acq92OEmZgnoMxmfv2BwZbhsS0bKVbOeX7P8qOK1NW8usOCIryE/l5oLDudOWT2R8xz
	Oku/weURqQBilrDGPGeMyZTA1dhNDcrsMwVD0cqvYs8c43jJmlpkCxfmaEhwwcMAZ1BicxHWnpW
	1VRnghSqK/36slHirtOi2b7LYjOVQ9Ex0ISbWh0pZRYl71J3sm69v3klQmo8K//DwtLBwhUpNZ0
	4e/ZJjMEgXIu2cwE+wMUY/b8rl5EfIqXUxuVY2jSzDI5Hy87BtfPIizVW+97YR9DDs11pCOj+Tq
	QNwBV+/1D20naJ9DXantZB+fezA2IRaa2YswXqcJ+INH1FEKmQSiYyKV4mU3Qfr3WOnsbgTtb+H
	4E75oIGhUH4uTuopC9k84TBrVLA4p03cWy3mSxA==
X-Received: by 2002:a05:6820:1a0b:b0:69d:f749:7d91 with SMTP id
 006d021491bc7-69e102c9f6dmr3770256eaf.7.1780240362243; Sun, 31 May 2026
 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260525095930.3924905-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260525095930.3924905-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 31 May 2026 20:42:31 +0530
X-Gm-Features: AVHnY4LvLumKC5bI-Kcv9TET475eaFGsQW_NjeCOc_gBN7nA1GLTHdnMHDbUw7s
Message-ID: <CAAhSdy3fVaLOWhBYNOPdrsQziPQ6wsyeodrjjwE7ftvqty=2bg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix ebreak self test failure
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_081243_173579_5B140F0F 
X-CRM114-Status: GOOD (  14.90  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMzoyOeKAr1BNIE1heXVyZXNoIENoaXRhbGUKPG1heXVy
ZXNoLmNoaXRhbGVAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZWJyZWFrIHNlbGYg
dGVzdCBlbmFibGVzL2Rpc2FibGVzIGd1ZXN0IGRlYnVnZ2luZyBhcyBhIHBhcnQgb2YgdGhlCj4g
dGVzdC4gSG93ZXZlciB0aGUgS1ZNX1NFVF9HVUVTVF9ERUJVRyBpb2N0bCBkb2Vzbid0IGFjdHVh
bGx5IGRvIGl0Lgo+IEZpeGluZyBpdCBieSBjYWxsaW5nIGt2bV9yaXNjdl92Y3B1X2NvbmZpZ19n
dWVzdF9kZWJ1Zy4KPgo+IEZpeGVzOiA2ZWQ1MjNlMmI2MTIgKCJSSVNDLVY6IEtWTTogRmFjdG9y
LW91dCBWQ1BVIGNvbmZpZyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMiKQo+IFNpZ25lZC1vZmYtYnk6
IE1heXVyZXNoIENoaXRhbGUgPG1heXVyZXNoLmNoaXRhbGVAb3NzLnF1YWxjb21tLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVl
ZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjIKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYwo+IGluZGV4IGE3MzY5MGVkYTg0Yi4uY2Y2ZTIzMWU3NmUyIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC01
MzgsNiArNTM4LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X2d1ZXN0X2RlYnVnKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgdmNw
dS0+Z3Vlc3RfZGVidWcgPSAwOwo+Cj4gKyAgICAgICBrdm1fcmlzY3ZfdmNwdV9jb25maWdfZ3Vl
c3RfZGVidWcodmNwdSk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjQzLjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
