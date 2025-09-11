Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E5ECAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v780ZNqemaSZG+va8Lk+KULFnzjSkTCnbPeRgdMxZs4=; b=X4ni+Bng0hKyJf
	G5+/ZCY9MyDU0ytANL2qByhdjxfw/XzGx0Wd0R3+BYfEeEnI51y2aELNIYH173hnTRaZuHURjmTau
	bZfZ2Ry13RhGNF6KVtvPCzJiDD8kXR267lgrdnP52JqJXUqgRjdbiyTwL1FNFnsu5BJVKuTjOXF9z
	Bx/rTsv11/cX3xAo4qO/SySkTWAZvUw+pAJOTvUezDMpSS+q9xYI5GHzAFIzXVd61VrR8FUEPWnBd
	QoTs1IZKtbwK+26tJBCgR8TMG8X+5aQPhXvPeCmeeZV6cUHJlJs4gg1T3vQAxqvSXU4VC1dpl+UQm
	39panpCBBNN9yhpYlbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwkHw-00000004FRJ-09hq;
	Thu, 11 Sep 2025 16:36:48 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwkHt-00000004FQn-2Mv8
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 16:36:46 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-408929699eeso4426835ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1757608604; x=1758213404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vIx9TAJKLDgZyZ0KM8pnfuvTopILKycVYmXw44N/kos=;
        b=py3GOgWxCooi/SezFBSADnA+wyXJKqv0+DGMWCDR0Q01fiwcCU859WkTPamPY+z3mz
         Lhd/hdNzwBMVcI1SQqOe7rYsDuAWcmrKQ+pCIj1FW5S6FLyAZjt4ni+53uITXWh1W4hT
         awb7eqN3cWWl/zom8aDeZOjQbeH3rcWMxNAp5zZ4DDFw/rdkBit5uSl++EtE39dYMT1+
         +nFn9xGH0JLyjalkQHMNbdcxoEpcrtj+hPHxzjFJO1HJB1Lg60B8v2vAMOnoqMvjpGeK
         aNIoCJmNf6Oqcy07Rph6My8bt27f42eG/GbHlpPvTt3Ynp0+WhLUTs+7uOiH/DmQQQGo
         5pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608604; x=1758213404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIx9TAJKLDgZyZ0KM8pnfuvTopILKycVYmXw44N/kos=;
        b=lZ1im/ypxu9272fz2NTeOa99EIMVNgfZtfizFj7QrKEti9BJzfyPyphYC6hZitKKf2
         7jIendR8pugW+nE+rz85dZNqLfiX5V33fIpDwOUewss+XyZVRhqkir+EHIjOTPEOMG0e
         zkK7E1paNEQyaHppgVuZIGWBqldfNrgNTSLIrsaKaQCUWn9DHs7ABqDRDap+zjQUgGWP
         0L4ttFXyyOy7UtVdus6kR8Nw/xaKaBmnpEZdXvApMApYe3hXF+AqJQLN74xXDWKsoFjb
         T/hIz17MrRm+MlB99SrEUaykVH43MZ8yV9o1NM68pbV2qPWDeXGGgrHrn1wdxpqfCFqP
         HQCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+2JSg+iqeE65Ao52TSNEyFaq0nB8PivAqugkwcgiKxsQeEwMO+wuRuqQOn2cphFU1H2HFCJkWIvuhiw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmp88MLUUzjQNbegnIuKgI2HmxgeMTTl23AIj7v320yYRR6Ca7
	6vdgisOLhJB200iHxMITCB7PFRBIglpcC4pWBQ8yU41o55sOyec5uiPffgHOXAOfn7s=
X-Gm-Gg: ASbGncv5HoNOrbDqbP8VfhlMP9/0OSsBtUwzgfmKDXxE/a4ltpDlm0tT5qwg+JRVYds
	ttyilFPGap92hiooo+SkyQLTgNZDx0wu9v/rWwkq4yVg2RSQJMZFx+Bt0ryp7e4c4nlIvx78/9t
	SV79uLBRTFkd1z7J/xjDpTcnc7ToTZn8bWkbmfKDRB4L308PHbOgkDuPn18x82HeA7BhAXTMtm1
	b4xGWp9KFKg6taTZKW2WEuI+auxHDopZVWFGMyX5NP8Z0A3io5B0VbPZLI+9sHrT6AnnGQX+Wo2
	QwNS1Qxk82jZdHUb/n4l+rnjGZfXup4NpcjYHYy9qpZuPA8s1ReUxJ8wjUovdENW6CutRy8lfDg
	5MduMBDjrP+5Pa/gWgzo7jQNFdPCChPnp9qkijFWJP+qXXhBmfoBQUCsMhDo0kA==
X-Google-Smtp-Source: AGHT+IESTZWlrQ1ZzOp78ng5g4AamFP7UoV30m4Ba+h4YJCV6xC2C6gMfXuIzAo8ydU1NiPZGPw6eg==
X-Received: by 2002:a05:6e02:17ca:b0:405:5e08:a3e4 with SMTP id e9e14a558f8ab-4209d40ff0emr3215465ab.1.1757608604054;
        Thu, 11 Sep 2025 09:36:44 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-511f2efc55dsm735646173.1.2025.09.11.09.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 09:36:43 -0700 (PDT)
Message-ID: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
Date: Thu, 11 Sep 2025 11:36:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
To: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_093645_720002_D5A021D6 
X-CRM114-Status: GOOD (  10.38  )
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

T24gOS8zLzI1IDc6MTkgQU0sIExlZSBKb25lcyB3cm90ZToKPiBPbiBNb24sIDI1IEF1ZyAyMDI1
IDEyOjIwOjQ5IC0wNTAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBUaGUgU3BhY2VtaVQgUDEgaXMg
YW4gSTJDLWNvbnRyb2xsZWQgUE1JQyB0aGF0IGltcGxlbWVudHMgNiBidWNrCj4+IGNvbnZlcnRl
cnMgYW5kIDEyIExET3MuICBJdCBjb250YWlucyBhIGxvYWQgc3dpdGNoLCBBREMgY2hhbm5lbHMs
Cj4+IEdQSU9zLCBhIHJlYWwtdGltZSBjbG9jaywgYW5kIGEgd2F0Y2hkb2cgdGltZXIuCj4+Cj4+
IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgYSBtdWx0aWZ1bmN0aW9uIGRyaXZlciBmb3IgdGhlIFAx
IFBNSUMgYXMKPj4gd2VsbCBhcyBkcml2ZXJzIGZvciBpdHMgcmVndWxhdG9ycyBhbmQgUlRDLgo+
Pgo+PiBbLi4uXQo+IAo+IEFwcGxpZWQsIHRoYW5rcyEKPiAKPiBbMS83XSBkdC1iaW5kaW5nczog
bWZkOiBhZGQgc3VwcG9ydCB0aGUgU3BhY2VtaVQgUDEgUE1JQwo+ICAgICAgICBjb21taXQ6IGJh
YWM2NzU1ZDNlOGRkZjQ3ZWVlMmJlM2NhNzJmZTE0ZWJhZTIxNDMKPiBbMi83XSBtZmQ6IHNpbXBs
ZS1tZmQtaTJjOiBhZGQgU3BhY2VtaVQgUDEgc3VwcG9ydAo+ICAgICAgICBjb21taXQ6IDQ5ODMz
NDk1Yzg1ZjI2ZDA3MGU3MDE0OGZkOTYwN2M2ZmJmOTI3ZmQKPiAKPiAtLQo+IExlZSBKb25lcyBb
5p2O55C85pavXQo+IAoKWWl4dW4gTGFuIHBsYW5zIHRvIG1lcmdlIHBhdGNoZXMgNS03IG9mIHRo
aXMgc2VyaWVzLgoKVGhhdCBsZWF2ZXMgcGF0Y2ggMywgd2hpY2ggZW5hYmxlcyByZWd1bGF0b3Ig
c3VwcG9ydCwgYW5kIHBhdGNoCjQsIHdoaWNoIGFkZHMgUlRDIHN1cHBvcnQuCgpIb3cgc2hvdWxk
IHRoZXNlIHR3byBwYXRjaGVzIGJlIG1lcmdlZD8gIE1hcmsgaGFzIHJldmlld2VkIHRoZQpyZWd1
bGF0b3IgcGF0Y2ggMyBhbmQgQWxleGFuZHJlIGhhcyBhY2tlZCB0aGUgUlRDIHBhdGNoIDQuCgpU
aGFuayB5b3UuCgoJCQkJCS1BbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
