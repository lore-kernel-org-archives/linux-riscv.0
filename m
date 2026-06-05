Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6126CD6E79
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFbP3INI7K5ZTm57p/JPeXFYSx45zkkOsWiFFqj2wyk=; b=cy/a+IU81Hb1om
	vqk/+6LG9vmJntG9+fZJh4b8QH9Mkj7JlYIzssptipnoN9VdNwTqz+B3CHHJBius3cq8MYJ0CGLob
	vrO61V0ft4xxXtfHHYpjRI8FKWze0GXadVRVK1ugF3HLR1TfqP14c+hyvK51mGPNCqIiYd3f/Gj6B
	a2YYUxPgo9Fq6I9sJp5I6Vz5YULUavsrSVR7EDtuV3dWju5m2xM4avfAbxmqzBxxfqXRm5eT2limu
	YLN7eILKSt65KFbana578xpH5VCZgwrkiYpwyS6uVVUHL4w5tNs9JxftYcrdBMFZmzCYUWosnWLuS
	pk3KIV3XmF7/uAlTU/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTUM-00000000bJZ-2sh8;
	Fri, 05 Jun 2026 12:17:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTUK-00000000bJ8-0lgz
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 12:17:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso12282455ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 05:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780661843; cv=none;
        d=google.com; s=arc-20240605;
        b=T3vBc0DvEFxrLFTAqe51+Ccpkv4nWh1B03WabiyvyRdkNBX6AX6+gUKTMsediQ2b+0
         gnc1GCGsipGwEvFno9OgTGtZY9I6uxE8TNRPaQYkBBDfUGcx1My1pTLE6moWHTB8XZoz
         Q44acyKh9U/zqKHccn8cIJ6LogFw3UHOWozocN3Hdmmwi2+l5WpRU+r+rQSznyuz1PSA
         mJemzOUoyJczFXmLvWi8YYxhvitXbAAO96esUuzP1v2wYvC9PYYS+eoz0FqEUZwLwLwx
         gwCSc4P3UwULqp/QAn2N2mX2YPKTBZL3H4IZm5G21CZopPkrpP2J/Uj2xO4uYiZGd4Py
         d5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1D7q+cAZBnaFGgiAedXXkbxBpbfjB/B2YThNrAJHNA=;
        fh=eQHIlwQXPBLIW/wC/xZNKojZqriDkOlP4mNtVBBPkNQ=;
        b=Ov/skSnlMDaFRl+20B3f/KOuKqE1s2vAtdpiz/X3PAaxGxjQE6HOEWGhlQuJ/F9G6x
         uXezO1qcXXww6RfW+5B2uMwHT+AkmDO6oztczArkrhAW0ky0eJw2lJpNfHbGX5YX6dro
         XZn0xunfoHnsNuxZ+MBN/qwV5B5dpADUT/Vo1kFM3rPUKyUxNrLjmqFqRX0AjA7D9VjB
         I30WbeOcuzGFAINe2HDeGz6XOLDH0XBqilVRRGJgowvPHY4FCzptuK4gGgr4PVQj1xmn
         yyqa9GkW/BwBH3zycPx/6GjxkuI6MFdTDTzP2FMSdbuwsQnniVq2rko0lVp9OWcuS0aq
         99lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780661843; x=1781266643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1D7q+cAZBnaFGgiAedXXkbxBpbfjB/B2YThNrAJHNA=;
        b=X/rwIOBK8ckYzWWpqbixZqCjBrLyecIMtzGU6+m6iMO2zzqwkY6IqP1A7QFOayeYFC
         zu7eypxpJldpFMLAlWNDPyWdQvScybEIv6NG5X3ZGQ9GeqXb9j2+ZRwvVxkhrcOP31Mu
         n9lMPzFA4Hs69WNA4TY02pBQr+00dXaW6bcCuLpBcjSOCk5YsSXLYB1wfN3fPKVHS7m8
         uI07lcOpppWLNGGBIpEahYFBVvbIfqRVzL+ijvwTiLd98+Kr/oojq0OpGjCSL+N3g6fZ
         5srUzAH3tIRiEmRa74SqGkau0jExKH6Ii5vUHDBo20mDFo1IODTrKHQohuGAZrxt1eOj
         Pj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661843; x=1781266643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O1D7q+cAZBnaFGgiAedXXkbxBpbfjB/B2YThNrAJHNA=;
        b=sQ6OcL4rsYCATvS3VZhPhtfyQJQ6HRntZMZkl2fbroisw5jMyper81kgyhUG0Iyx/8
         IlqBzZQc/K1SUcnZWcYBYm7fkVEawuE96lK0jBVZSatw4I4KzVh54Pmf6HUKBW3FwD/v
         Wnv4vwfiNfZfFhBp3HZtTwCiGtCNhkNh52MYSYnid5/6z2C2p9Jb3C2860aljbiqMtLh
         LO8cYA1IdZ/EBUOB/719QKcwrb4j0oqn6IBxUGecljq4unNYuU/77IpPHc0dI4RNQyGL
         Kgn5Jqs6lDBzYxkbBJI2p4ZLXkpxbycQIHBv0pAIuV+exyiaLNy2KQv7wToHnCIwA2Mj
         6FCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9g2ceCvay7Hcfx1CBAMKvAGm58julSh9neV3E3HDtiPW/5spxl60+aj0n9bVLfgOBrqPFc9p4MEXxMAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNZuNtgSZzEp0xzJ2bTllOJI6kPcHDc79izi5cOm5GVlO3b+EQ
	A+te2/tJuIQrpxBzotr+EVDZsWXyV7GKorexBrt9OBfRgCj+cEZ5M+z7jNRLnHPsejMfFed2CUy
	IHTcRsHvIvoy0kSt3oOP3foJF0VFKHv4=
X-Gm-Gg: Acq92OFXlC6Q2Dp7aWFW+Go4hluCK5Ypc024/zIdq/IJWUaM2sZZjyqv4eteVjjuzSo
	EFqiDyvPnn9zPxzYkV+MruRWIiRhM/bu9f+uUpxcUSsWDC/HQCewkMYgiO1Fnr0jw04mVHN5GB7
	J/NOr7aR/ksume0HGek8BIoxiJKpE52PdQHWQ7YHY0GxEXPN300W60OuO9ZPujlRcfefFmajyHh
	ZWHzZNRUyMJywOVvmQ/3hhrNVlRampDeXp3hNBQ0s+VlHzNdNFZOyv3chCqsIjMhF0inkRefyKe
	AnfC63uyauM3AmVJy8T+xa42xIMgiQYcU5W13v0+ErH25vHEFtSEaZX4MMRCqmZAFdUeViiAN2Y
	=
X-Received: by 2002:a17:902:e752:b0:2c1:737:bed9 with SMTP id
 d9443c01a7336-2c1e893d479mr35069085ad.30.1780661842733; Fri, 05 Jun 2026
 05:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260321-th1520-v1-0-ec877197770d@gmail.com> <4180689d3426882dcac2eb74209d398477f88b90.camel@iscas.ac.cn>
In-Reply-To: <4180689d3426882dcac2eb74209d398477f88b90.camel@iscas.ac.cn>
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 5 Jun 2026 20:17:11 +0800
X-Gm-Features: AVHnY4ILOfLjHFNJyQ_dDaX-IoRogY7VjEEX1-rTSKRis09oXxcE00pq7WQJTBw
Message-ID: <CAN4SLj09F+bSQFk4x3POGrh6hh2s8ssk1CmTDvrDzBCswZJBuQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: th1520-dw-hdmi: Two fixes
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_051724_227983_C6C3FB25 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBNYXIgMjEsIDIwMjYgYXQgMTowNeKAr1BNIEljZW5vd3kgWmhlbmcgPHpoZW5neGlu
Z2RhQGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IOWcqCAyMDI2LTAzLTIx5YWt55qEIDAzOjEyICsw
ODAw77yMRmVsaXggR3XlhpnpgZPvvJoKPiA+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3Rj
Lmd1QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gRmVsaXggR3UgKDIpOgo+ID4gICAgICAgZHJtL2Jy
aWRnZTogdGgxNTIwLWR3LWhkbWk6IEZpeCBlcnJvciBjaGVjayBvbiBkd19oZG1pX3Byb2JlKCkK
PiA+IHJldHVybiB2YWx1ZQo+ID4gICAgICAgZHJtL2JyaWRnZTogdGgxNTIwLWR3LWhkbWk6IEZp
eCByZW1vdmUoKSBjYWxsYmFjawo+Cj4gQm90aCBmaXhlcyBsb29rIHRyaXZpYWwgYW5kIGxldCBt
ZSBzdGFydCB0byBkb3VidCBob3cgY291bGQgSSBtYWtlIHN1Y2gKPiBtaXN0YWtlcy4KPgo+IFJl
dmlld2VkLWJ5OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KPgpIaSwK
R2VudGxlIHBpbmcgb24gdGhpcy4KCkJlc3QgcmVnYXJkcywKRmVsaXgKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
