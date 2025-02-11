Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D4C02198
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 01:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrF9+4/fcyxzdN2/R72byrK4lovuXgQC5LaCMTLcoX4=; b=NrglVmc2Mcigji
	+7i11OXmj2GGyzrgLTpLrhcDMoi2SJHkss1HWKquF8SmbxJcZXgdnVWreL6kTGa4T3zHAc1c/rNLI
	fZ/iV8lauhuez4BghWPwOPjRDuMXx+O5druqtKWpb/5f/KIdznCJF2Zr+pakF8hqqa99J9qTc9dUZ
	Xb+UJcoqm4NPpO5pSaP2RmvMAQuwM3FtdCVd1ce3DBCJ6wYlTtGVNsWVfmRUq1lKFw29QvQNRNh3/
	aW15VS64LnvMZBo5IE71+H56E6Eyb1dF9nkVOylAT5eSb8tYoURmN/FTpL7SclreZIeIsga8PS1vN
	NkNFALts75mLJF/3+Q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1theyn-000000025tF-11fL;
	Tue, 11 Feb 2025 01:22:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thexe-000000025fi-3Ll7
	for linux-riscv@bombadil.infradead.org;
	Tue, 11 Feb 2025 01:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MaQFdnDPn6oDlBBV4WvI2w9SEnAIQ/HcPGa1Cc/3bcU=; b=VDYdHh5rxJLaGlt+FtscQPhRgE
	lvxyxYGZsUB/8po/S35Nsf4KLypG3nu57U/rm1WhS0XrmD+rfjo6HeZs+ms/DxEFbcyMK51GFf/Gr
	HERpqTfa5L1zwIA9twjW2HBPYCTju0/FoEOQ+8LfgkbBsw2TpdQDywMqLTT1xzdcrR6cr9sidxK3r
	msusqsz88u1WeGrPbBiYX+drS/A0p0i6vdUiRSRpJDVtGsO0VqBOcm8PMGXjkLfuQ1FUgXDOraLRr
	8ccf7EC/uyYUobK6Eo5z8tdZoRmNMQVP+kGNgBrP6uiukTvGQP1AWFYrOCHN64ZfuVaOzPZHEdj/q
	bhbB3UEw==;
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thexV-00000000QgV-0ipo
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 01:21:07 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2b832eabf39so2341984fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739236861; x=1739841661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaQFdnDPn6oDlBBV4WvI2w9SEnAIQ/HcPGa1Cc/3bcU=;
        b=mUP6kpculDHI0YD8d0FQFdLKbWEl99L8f0OILpUL2iwxw9QHKiMI17BlO0rdsP+28T
         P3ZAEd92cr3re1gsx+o4v7C2Vjccdjf0se9llITJAj5LUi6lFbihCHDd05bR+y3sBKXY
         HRES2Rl0bxy5kZRlwceM1l0chOIwAADszgHct8kD35V3RMVRC2r1k9zLgHp0Afbd0Oa5
         0bUV/NoZjD3+7jSASXyz2x3WsTiMv2XucOgGidFLdcgmqiHz0+pq0YdSLw5sR6EGGJs6
         xe9TFwXWag1ApTu7RZYfSv/2L43gMrOK0jJ9CQ8gayRQke10zXV4nU3upn8iCcuZQGct
         9gcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236861; x=1739841661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaQFdnDPn6oDlBBV4WvI2w9SEnAIQ/HcPGa1Cc/3bcU=;
        b=IzA2D5BQou0Iq/DiyoBtVNVjp71R9SsLcQa8jyhSw4QD6JSP420nMrYNDSH8V/Y0MS
         PjpalnqWbd95/0/EVDTA/lgL2uaTGLQGwLoayeriW/VeASEYJQmEWaBksOhjyxKmrzvP
         dmn+1VdL3WSxRyyGFF0yVayztXrS3paoVHsSDsWzwDSWJqHicK/6PDqybwcRKjDx3oLu
         5GTz8A4DSR40mK49gaFOwHLG4FbS5lhUvmD3y85YfFCFwJtv6y4PQvRyi+tllKXj+lcN
         U3srD/edYnZkGMT97yE6DC5MVi0iXsKc35pE5t4cau8mzkjd9Dp1JtcjoROMRbHqNOMi
         7Z4A==
X-Forwarded-Encrypted: i=1; AJvYcCU6HfaBV3pdQphMMXWZr7OihAKaO0guuRL+2MjKbMfzLJyj7mGdzrvJDvBpvulE5ypWdCHIhNDZc5U9fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4bECesi4RkS6Mno7h18btEAeIFCbDMTLlediEbLXEUKPxj9fF
	D5nFEJshBsBVVTmzVXy+oamlAK9wxTDuyLmdnsLL9vAWhaK7mXJdgH1kqvdsK1aCBlycGVRgs12
	TaAkDxhNJmORTSePR6dzoR0BBlHWOVpOM
X-Gm-Gg: ASbGncsf993zUDgLZSRRXsKuDZ/Q7SUHDoWCFUkzDXVre3p/WLF5F2CSMZrOTLq7X1e
	q+uIRXcNKtaUzgLArAWscqSlkT1PII//VHMWg+NgkhD+i0Mgseq3AOxs8cnFCp4KDBVyQNdA=
X-Google-Smtp-Source: AGHT+IGm048wWiFiLM3RnwF5VP9mdTr1NFDjC4UyHl5DciC8UMYJ0TxacQ6z8oYB1tJinGY/z+rTq+yN8/oOxkM5FtY=
X-Received: by 2002:a05:6870:8a08:b0:29e:63c3:3392 with SMTP id
 586e51a60fabf-2b83ed3354fmr9621320fac.15.1739236861596; Mon, 10 Feb 2025
 17:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn> <87frl0snf6.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87frl0snf6.fsf@all.your.base.are.belong.to.us>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 11 Feb 2025 09:20:22 +0800
X-Gm-Features: AWEUYZlvl4mGCqJJI-gBI3cTxlXAt19H2Jtwaartczfba4mVGW4RfhZKYAMKh-E
Message-ID: <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_012105_385241_C28338FC 
X-CRM114-Status: GOOD (  11.25  )
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

T24gVGh1LCAzMCBKYW4gMjAyNSBhdCAxNjo0MiwgQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBDaHVueWFuIFpoYW5nIDx6aGFuZ2NodW55YW5AaXNjYXMuYWMuY24+
IHdyaXRlczoKPgo+ID4gVGhlIFBURSBiaXQoOSkgb24gUklTQy1WIGlzIHJlc2VydmVkIGZvciBz
b2Z0d2FyZSwgaXQgaXMgdXNlZCBieSBkZXZtYXAKPiA+IG5vdyB3aGljaCBoYXMgdG8gYmUgZGlz
YWJsZWQgaWYgd2Ugd2FudCB0byB1c2UgYml0KDkpIGZvciBvdGhlciBmZWF0dXJlcywKPiA+IHNp
bmNlIHRoZXJlJ3Mgbm8gbW9yZSBmcmVlIFBURSBiaXQgb24gUklTQy1WIG5vdy4KPiA+Cj4gPiBT
byB0byBtYWtlIEFSQ0hfSEFTX1BURV9ERVZNQVAgc2VsZWN0YWJsZSwgdGhpcyBwYXRjaCB1c2Vz
IGl0IGFzCj4gPiB0aGUgYnVpbGQgY29uZGl0aW9uIG9mIGRldm1hcCBkZWZpbml0aW9ucy4KPgo+
IEhlYWRzLXVwOiBJdCBzZWVtcyBsaWtlIEFsaXN0YWlyJ3Mgc2VyaWVzIFsxXSB0aGF0IHJlbW92
ZXMgdGhlIGRldm1hcAo+IFBURSBiaXQgd2lsbCBtb3N0IGxpa2VseSBsYW5kIGluIDYuMTUuCgpZ
ZXMsIEkndmUgYmVlbiBrZWVwaW5nIGFuIGV5ZSBvbiBBbGlzdGFpcidzIHNlcmllcywgaW50ZW5k
ZWQgdG8gdXBkYXRlCnRoaXMgcGF0Y2hzZXQgYWZ0ZXIgQWxpc3RhaXIncyBwYXRjaCB0aGF0IHJl
bW92ZXMgdGhlIGRldm1hcCBQVEUgYml0CmdvdCBtZXJnZWQuCgpUaGFua3MsCkNodW55YW4KPgo+
Cj4gQmrDtnJuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vY292ZXIu
MTExODk4NjQ2ODRlMzEyNjBkMTQwODc3OWZhYzlkYjgwMTIyMDQ3Yi4xNzM2NDg4Nzk5LmdpdC1z
ZXJpZXMuYXBvcHBsZUBudmlkaWEuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
