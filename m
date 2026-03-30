Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C673FC97E2
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apiP1YFaBlmO+5omJxpitNXHwMAxqE3R2fUCRTUuzmQ=; b=RmajdyPU+qaaUD
	hmomn9yt73mmi5AW5EMpe3M3wcbeMjj9Vm51wSjPSq8Jd1qhnhRk1Pl54XIZwQ7d7TjnNhTggxvdW
	IlZfFUgmMIaaR9rvmyMOJ4BxK0t5lM1tN0dJ4KBOcUFWOt132ixcTHRihXhIkzm/V360MaTq5w+Jp
	5xWYAkFUrAIh5KkMe1vczzJIugXxDMLkg/i9Kj0ansgQPdnYvwcnCjpg5T4mL+9zTqNxHckVKyE7u
	x3lwLX5begd1XpWgbVKFSglitmN/GPld5kQy077i1epmrrElDk8hEBPRdVn31lx2iakK2ybHYDtuP
	Be4vPdjeAsY9JdqXiEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78IK-0000000AuVL-0XPA;
	Mon, 30 Mar 2026 08:48:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78II-0000000AuUc-3tfC
	for linux-riscv@bombadil.infradead.org;
	Mon, 30 Mar 2026 08:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=; b=NpOSTtGLm15j9Z6pIDe3a4UZRw
	hv9douE4lizo2YBkVhfT7e2jAKRWjw5M1SpVPdOfQC0UYkqvRYB1+YMWMjwzgrhUfd7EGPNDw3KAQ
	AwiyiNh4efWhq+Uy/socMN+M85D6B9pDhtGKsrzkkneDIwjtdHaqcM0m5g7kM6dhYl08/A7NagXYb
	OOMDXuaKJAOad4DZrmznttH6mJmHEVzwQQ7kkRwkQtoCsAnUxo7+xcBpYDtCYyCWPBGnQaVpVENjn
	W0V4MjqIZAEEmtDzWsuvCrgoTeqQ/tVHMntcmA4pzLf6bRA6mPELBqiVxBccHCIrX+/uYk24RGEI5
	gxP8qVGg==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78IF-0000000DM62-2Qge
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:48:21 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so754042e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860495; cv=none;
        d=google.com; s=arc-20240605;
        b=hYdcSUvMe7/lTdKaMPl1JTQHC2E8PoLXcMBsvjRnOItOJ3ZuxPYHDZPXotC3RsaVx4
         GIXxhEkV4HRl522WopARfl2reZNFTMhMnX75/MAw2bUsT8gY1sz5fRjHBvteV0yYbjGk
         sctBxUdG/DIVXzT0ULIfAbQ1jsCURywx4VMoF7bRqO2NLT0GN86TLBkggRCa/SxdDYgJ
         Lw9dLpK5KqZy4hBOPmF+XuCi+/KP4OE8E12DwlSDBkUgQv+agwi35zt1QX0KHLLW4NKC
         XiXc/apOhRTkG90v9J5iAsaUpj3qb0/36MbNRHR84Pw+Lid7tca0T44/NZQoJ1Jywexv
         KEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=;
        fh=LQLzLVUU0qM9t+IZ8pV0ccXgMebRelLPyH566gPbC4M=;
        b=cF8zDYtEKI3RXnHVa3myGll6Gu1fVPhi7bvahR2yIqLLNoyhXHxi2hfAQKdXIr84zN
         ZjjFHfl515BRWBh2nuOvKWpYnwIif1obi/20jJkjPwVhEyVonW7vxOJTmvwVU9eH6aP6
         1aJNiH0COU7rO/3F5JgxREc+CpggpcZKJ4Vk7lz1ltzJvZtJ0BqdU/jTkDo6z/gAT+PO
         aY80YWqBUvx5AEfVXr1A7UqADFEQ/4YeH8U9v5xg1LIjynL5KVtZIHtiEaNwgI7C4nex
         msiyix42zVHBOGgh0HewXH23ZXGBp83tOj3ncs17XzzPCA3YI7oAkEGOAG8xYIfpJx50
         hG5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1774860495; x=1775465295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=;
        b=lrb7G9Yz623P8DeKeIhijq6HqYNpj3JnRLFF6rsaYERiD403N5ClnRqMT/HIzoBzdr
         dwAnVAwi2LibruDA/s+NQjvldexKlZBtQlMnLDcr5hEfr+GWYtBlB9LEtV+fP05G+Uav
         KUgUr1NpWrU9N1lQF3wB+3GaAsW6C0ToUm3v6AyQjGH1xG/6wNf92lyQ7fz7+BOp0lp0
         A+rEcOg2N1n9/3PojHWs9whtQE7sVGfqQIYMpJbyNppxl8lpyGWExyLRptIYNhO1FVV6
         poVVt0/AugDG/K2aSFC7Gs0zuunsaOSGzcgW6SKQHWDOrgEw684bL6KivrrI+gVncXxc
         qUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860495; x=1775465295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=;
        b=j0k+8zCwolcnn4+sXuco4ZlTDSlSSZNEISBF3isNZ9iwguV0H+H2WLbjFivM1orQvA
         7/02ByiugdVO4EaxYj7ttCiFwKNtOYJQmy1ov0Y753TZBANLpWU/bt4pOBnm+Qs0qVt3
         q1KUKCjgQi7qbyfIhcxn/I+vCmZ5gPFSas5OOHTin6q3He9/cZjrK9ube+mdT+L35JXb
         71chnYPZ0MPsg3CJcggBksqs1owjIMk06fQqsUlQ5+9z2P6cPEqDro1yDLH3qGI+I56U
         hNwHSYcJaiPiqiXD/vp2kBVILqItRsELI3FMR2Pp/VnqLJ0qG89S+X0L0sQsCBHKWeXd
         cEEw==
X-Forwarded-Encrypted: i=1; AJvYcCUjAxjJ3vnqvlrXjBSVYQsC4sVKmbRiBL6z/et9oPC4b4ucLWGut4c4M+tYvFcMJoJAnfxh084GdIX+ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB+tL0GuXuxyv5wl8JkGHLJLA+l62AHufQB0wGnmsoALHalRfY
	8unDXaNie8FtxsOyz9mc+kEAqop9J5iaoKhXD6G5jC9195/37O5NRBwRqQBTzn2KbQNzafk5Aqt
	T7WSBb1dYPNM8lv8XlFrlQQ3btPXQU2BpB2QPjThH2Q==
X-Gm-Gg: ATEYQzw/CQwAc772C6TR0Z/IlhAc60nAEpCdFSyl/wbQnokOcr2cJphOmTNkI1R9hBj
	aDy9EPTZD9V5SaRtVUJkaJTYHvpDgf2fxfSeYENQqb5GdABT9Hb+NRY1mLF7zuf9+CObg7nBcRA
	NdZSFbSP5dAw5IsZuLg09OxonM7o0ki6WtlMO7n0N5WTfiKGgGXyP4eof/wRzkNrhQW9lkdnRiJ
	AvTFmByNubwOPAccSFnxhHS2TifOVXkrRE5h4AI/P3VF7M9IcZ0lDkCZCytu1kQkJhf2NhSHOv7
	DWq+jm07x+rvj91/IQuJwJUrb+ccDrSh1JnmWDJG
X-Received: by 2002:a05:6512:108a:b0:5a1:4158:ea9b with SMTP id
 2adb3069b0e04-5a2ab92066fmr3681883e87.22.1774860495167; Mon, 30 Mar 2026
 01:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
In-Reply-To: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 30 Mar 2026 14:18:03 +0530
X-Gm-Features: AQROBzB63KEV8P_Bg0QV0rJAUrTlF3dz8GKfngYrRvwbEkxEjBtIO9GeL0HwnZc
Message-ID: <CAK9=C2Vb73snLT0uEY=5S5dQc6VXc_u4S60+9+sCLpyXZnHTWA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] RISC-V: KVM: Fix hugepage mapping handling during
 dirty logging
To: wang.yechao255@zte.com.cn
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_094819_766023_386BECAE 
X-CRM114-Status: GOOD (  13.69  )
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

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgMTozOOKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgYW4gaXNzdWUgd2hlcmUgZGlydHkgbG9nZ2luZyBm
YWlscyB0byB3b3JrIGNvcnJlY3RseQo+IHdpdGggaHVnZSBwYWdlcy4KPgo+IHYzIC0+IHY0Ogo+
ICAgLSBTcXVhc2ggUEFUQ0gyIGludG8gUEFUQ0gzLCBhbmQgYWRqdXN0IGFjY29yZGluZyB0byBB
bnVwJ3MgY29tbWVudHMuCj4gICAtIExpbmsgdG8gdjM6Cj4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDI2MDMxNjE0MTIzNDAwN3FTQU9zZXN1MmNTUXNqLUxBLXFxM0B6
dGUuY29tLmNuL1QvI3QKPgo+IHYyIC0+IHYzOgo+ICAgLSBwYXRjaDAxOiBBZGQgcmVmZXJlbmNl
IHRvIHRoZSBzcGVjaWZpYyBjb21taXQgYmVpbmcgZml4ZWQKPiAgIC0gcGF0Y2gwMjogRmlsbCB0
aGUgcGFnZSB0YWJsZSBlbnRyeSBiZWZvcmUgcmVwbGFjaW5nIHRoZSBwdGVwIHZhbHVlCj4gICAt
IHBhdGNoMDM6IEFkZCBoYW5kbGluZyBmb3IgZGlydHkgbG9nZ2luZyBkaXNhYmxlIHRvIGF2b2lk
IG1lbW9yeSBsZWFrIGluIGdzdGFnZSBwYWdlIHRhYmxlcwo+ICAgLSBMaW5rIHRvIHYyOgo+ICAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjAzMDQxNzIxMzkxMzFDaER1
Yk1TcEdEVUIwM2xZNFVDYktAenRlLmNvbS5jbi9ULyN0Cj4KPiB2MSAtPiB2MjoKPiAgIC0gZml4
IHRoZSBsb3N0IHdyaXRlIHByb3RlY3Rpb24gb24gaHVnZSBwYWdlcwo+ICAgLSBzcGxpdCBodWdl
IHBhZ2VzIGJlZm9yZSBoYW5kbGluZyB0aGUgd3JpdGUgcHJvdGVjdGlvbiBmYXVsdC4KPgo+ICAg
LSBMaW5rIHRvIHYxOgo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
NjAyMjYxNzIyNDUzNThxVlphdkl5a0xMMlFDMEtvcVRPLUlAenRlLmNvbS5jbi9ULyN1Cj4KPiBX
YW5nIFllY2hhbyAoMik6Cj4gICBSSVNDLVY6IEtWTTogRml4IGxvc3Qgd3JpdGUgcHJvdGVjdGlv
biBvbiBodWdlIHBhZ2VzIGR1cmluZyBkaXJ0eSBsb2dnaW5nCj4gICBSSVNDLVY6IEtWTTogU3Bs
aXQgaHVnZSBwYWdlcyBkdXJpbmcgZmF1bHQgaGFuZGxpbmcgZm9yIGRpcnR5IGxvZ2dpbmcKPgo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCB8ICAgNCArCj4gIGFyY2gvcmlz
Y3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgIHwgMTMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi40Ny4zCj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTcu
MQoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
