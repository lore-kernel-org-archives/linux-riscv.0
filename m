Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60C5CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jC1Pfs21nznCftQxEMZEbjusNBbrWFQad+11OSFowxA=; b=174jBIbWgnewTa
	A5ysMyS4r/n2kkUNIQdtsuuhMWwTg2S9z/VTesEZO2E2b9Z0dhUMHpm1rsso3Q31Y5bpPzl4LdGWa
	FELyMllMUrPjUuL2QBnFNZWLWAWRWtc8s8tFQWB+EHMTSDOXaTsf8ic63OSlsMjtSrMTwQiuVRbhC
	ZsggLNLAc34bv1rIyKk+7C59HMtwfjBfCWvRsT0Vr1n1omdim36BNOryvB8AZudeieVdS8pMKRg7J
	bq4Uhro7Lpj8k58ZALChLYTqD+DQAePP5sc7d9WKgFVbHBz9cyIYKFDWpDx276fxI/nNxkAVyC/xk
	X+qZb0a5d43DDuKlkN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEa0j-00000004sVk-1AFM;
	Thu, 30 Oct 2025 21:16:47 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEa0d-00000004sV5-1aM5
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:16:44 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-432fb3a05d1so13427225ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761858996; x=1762463796; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n046el6sn/MYU05rldbKheOWhX/l2k6l2dudBMXzrMQ=;
        b=KmWoCcJK+CwbHNDcYV2RKIADLLDvr4/u7YyAE+KODVOBg2fmNocOCG/ofNWdPuNRB7
         bfgahvaJslSI0miMQm+LB7J1oFb+WJ2HxQ2mGDkFgB3/TNGuxi/e0hlxdLvrTvs5fv0r
         7Qdv7ZCuvYo9l8e3jgMycg6JeXonVPoWUrEiIsEd/CjJ9iQAB3s+FNiSbLL2vMpOuTWJ
         lDqLc86wSjWgd1CNGIc9bVLw1g7nuWeKj5p9EW/pRYZxouWuPiFsZJwZArHY5jw1YGUb
         rHJcEhqdeGlG6nr6wLUzlcCHlabmzYLyXlQeZ2uUaV3h0UyyDbTjLjM6ar8v5u5L3Qrg
         5R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761858996; x=1762463796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n046el6sn/MYU05rldbKheOWhX/l2k6l2dudBMXzrMQ=;
        b=J7W1tZKrRi1UBqNB/pUMsmShqtcgD9Xrl8JagabBg2e7n04MbLeOX8M0j2U4kyLEVu
         ilPeBRV/RBnolUvvtQSJ7LIYi+ejZqVVJ+6QTFE+qWnexcd0J7aRakIINk8PtDXmPiBS
         7IUEhxe2Sex+riqHpZlvl0MeK3JffpopUkT57fIqWFhUdXBQxnZzPwzhm7PJHKkFZq4j
         I4o/xeqvBH5mHoK2DBnA8sdi1wvK6Hvi/gp0Xce5w8Aa9fU+N8cRlk8rEcL3XYY33dEz
         fQtgBBXpfPZWYN0eGAVwt9nJVhJg67n9VqwELDd/AW9zUzoIvv5Q6cjZUbQY7d20l/hV
         yOpA==
X-Forwarded-Encrypted: i=1; AJvYcCWzuIWdLqV8JM2CW+we7SmHDEVvStnlewMT769vkUWMwGoOE4Y1hEkGduXr6uXCXSsV6HseMxTAt/yg4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoyvHu+wjSx2v1adhxDiL+F7XwtC+FX22tC9IaM/zHLcnuBNUx
	5d1lKa0yc5YMElA7HM6KO+x9gI/Npzrl0GJ6PpCzEYMpt4F1X4Kw3vGW1p4qeIlY6qg=
X-Gm-Gg: ASbGncuj/KpPfwxCjY7ftecSJxagxKiCqnoSckccOv8MjDZ0wH06BwVooBlmK7DvRAk
	bW5G3wuroZewD1fjKwHkOUoKCPg1fJBQu5aElbrnKiywyL5KOn+uqttvj/xdl+ECxYgd9t275No
	RE332zYNDT3QmzdmxRjBmbMLFu55fMewwMh8JthaeOpjmkCwyt/k4/0kV6ab3hxqtaa4pwRV3sz
	Btycy7JVyADMQMHyfHJu5lXkLkupJszruFvIc8wdmnx7gBGmb7hBDf4pBKPK3IZQGfkQ52+8oRM
	US8Ro1JhlT6OwoUClX7XMoP1fCgwNZig8zKmO0MKHRg131Ek9JiUSPeKvbQ96+GdziizMuKq6Su
	enveHjhHFpFtTKg6LcHKpzVSsR//QvxhEjwIL9KTAfSVMB/scJJWQg2Bv4lEzxA1/dL4SftIJVl
	HDUg==
X-Google-Smtp-Source: AGHT+IGcDmB7cMvg4ddm9ByxIP9HsB/n5kBYe0Lh8poaDBazZPyPmATszhVqnQa6SFc0vrwo+UWsdw==
X-Received: by 2002:a92:ca46:0:b0:430:a183:7b with SMTP id e9e14a558f8ab-4330d12268emr20926665ab.3.1761858996489;
        Thu, 30 Oct 2025 14:16:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea9e38418sm7130598173.61.2025.10.30.14.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:16:35 -0700 (PDT)
Date: Thu, 30 Oct 2025 16:16:35 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	cleger@rivosinc.com, evan@rivosinc.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, samuel.holland@sifive.com, 
	shuah@kernel.org, zhangyin2018@iscas.ac.cn, zihongyao@outlook.com
Subject: Re: [PATCH v3 2/2] selftests/riscv: Add Zicbop prefetch test
Message-ID: <20251030-3c0cafb066281de4dacd4000@orel>
References: <20251021-01a9b77e3d88543581f1a7fb@orel>
 <20251023154841.36007-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023154841.36007-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_141643_307542_D7F0DB46 
X-CRM114-Status: GOOD (  18.24  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMTE6NDg6MThQTSArMDgwMCwgWWFvIFppaG9uZyB3cm90
ZToKPiA+IFVuZGVzaXJlZCByZWZvcm1hdHRpbmcKPiBNeSBiYWQuIEl0IHdpbGwgYmUgZml4ZWQg
aW4gdGhlIG5leHQgdmVyc2lvbi4KPiAKPiA+IFNob3VsZCB3ZSBqdXN0IHVuY29uZGl0aW9uYWxs
eSByZWdpc3RlciBoYW5kbGVycyBmb3IgU0lHU0VHViBhbmQgU0lHQlVTPwo+IEkgdGhpbmsgaXQg
ZGVwZW5kcyBvbiB3aGF0IHRoZSBmbGFncyAtLXNpZ3tzZWd2LGlsbCxidXN9IGFyZSBpbnRlbmRl
ZCB0byBtZWFuOgo+IAo+ICAgYSkgV2UgaW50ZW5kIHRvIGhhbmRsZSB0aGVzZSBmYXVsdHMgdGhh
dCBtaWdodCBiZSByYWlzZWQgaW5zaWRlIHRoZSB0ZXN0Cj4gICAgICAoaS5lLiwgY2F0Y2ggYW5k
IGNvbnZlcnQgdGhlbSBpbnRvIHBhc3MvZmFpbCByZXN1bHRzIHdpdGhvdXQgY3Jhc2hpbmcgdGhl
Cj4gICAgICB0ZXN0IGJpbmFyeSwgcmF0aGVyIHRoYW4gbGV0dGluZyBzb21ldGhpbmcgZWxzZSBo
YW5kbGUgdGhlbSBleHRlcm5hbGx5KS4KPiAgIGIpIFdlIGV4cGVjdCB0aGVzZSBzaWduYWxzIHRv
IGJlIHJhaXNlZCBhcyBwYXJ0IG9mIHRoZSB0ZXN0IHNjZW5hcmlvIGFuZAo+ICAgICAgaGFuZGxl
IHRoZW0gd2l0aGluIHRoZSB0ZXN0IHByb2dyYW0gYWNjb3JkaW5nbHkuCj4gCj4gSSdtIG5vdCBz
dXJlIGlmIChhKSBpcyBhcHByb3ByaWF0ZSwgc2luY2UgaXQgbWlnaHQgbWVzcyB1cCBzb21lb25l
4oCZcyBDSQo+IG9yIG90aGVyIGF1dG9tYXRpb24gc2V0dXBzLgoKVGhlIGludGVudGlvbiBvZiAt
LXNpZ2lsbCBpcyB0byB0ZWxsIHRoZSB0ZXN0IHRoYXQgYSBTSUdJTEwgaXMgZXhwZWN0ZWQKYW5k
IHRlc3RzIHNob3VsZCBiZSBydW4gdG8gZW5zdXJlIHRoZXkgYXJlIHJhaXNlZC4gV2Ugc2hvdWxk
IHByb2JhYmx5CmFsbG93IHRoYXQgZXhwZWN0YXRpb24gdG8gYmUgZXh0ZW5zaW9uIHNwZWNpZmlj
IHRob3VnaCwgaS5lLiBoYXZlIGJvdGggYQotLXppY2JvbS1yYWlzZXMtc2lnaWxsIGFuZCBhIC0t
emljYm96LXJhaXNlcy1zaWdpbGwKCj4gCj4gSWYgd2XigJlyZSBnb2luZyB3aXRoIChiKSwgdGhl
biByZWdpc3RlcmluZyBoYW5kbGVycyBmb3IgU0lHU0VHViBhbmQgU0lHQlVTCj4gYmFzZWQgb24g
ZmxhZ3Mgd291bGQgYmUgaW5jb25zaXN0ZW50IHdpdGggdGhhdCBzZW1hbnRpY3MsIHNpbmNlIHBy
ZWZldGNoLioKPiBzaG91bGQgbmV2ZXIgbGVnaXRpbWF0ZWx5IHJhaXNlIHRoZW0uIEluIHRoYXQg
Y2FzZSwgdGhpcyBkZXNpZ24gcHJvYmFibHkKPiBkb2VzbuKAmXQgbWFrZSBzZW5zZS4gV291bGQg
aXQgYWxzbyBtYWtlIHNlbnNlIHRvIHJlbmFtZSB0aGUgJy0tc2lnaWxsJyBmbGFnCj4gdG8gbWFr
ZSB0aGlzIGNsZWFyZXI/CgpTaW5jZSBTSUdTRUdWIGFuZCBTSUdCVVMgYXJlIG5ldmVyIGV4cGVj
dGVkLCB0aGVuIHdlIGNvdWxkIGFsd2F5cyBoYW5kbGUKdGhvc2UgaW4gb3JkZXIgdG8gcmVwb3J0
IGZhaWx1cmVzLCBidXQgd2Ugc2hvdWxkIG5hcnJvdyB0aGUgdGltZSB0aGUKaGFuZGxlcnMgYXJl
IHJlZ2lzdGVyZWQgdG8gYmUganVzdCBhcm91bmQgdGhlIHVzZSBvZiBpbnN0cnVjdGlvbnMgdW5k
ZXIKdGVzdC4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
