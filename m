Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF05C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlP+wuyqRUkV4ddQg/hySmcBPwAkkmzr6BC1UtbIcIA=; b=JJ1Hl8Mt7wblp3
	kKTmq5S6ZITZKAovvd/2kcef/s562pBgWCAli2WcNVt1QOzpJWoyACgVoJd58zRZY0T0a0z089Zn+
	rED8k2syxDbmHbr8WRyufAlle4VFZuLjy0Zo0o47HdaRA8IqU3RvVrOy5v2MOj0t9+6B+OlqpMGFP
	ldeuylf5l6M7hOLCmnJIlVP8Ugaq0MADSj6h0LdkMQS8HyAas5vMUWkmzyDbvG6tebQAEdVsFfaRb
	FT0360Dse4LP26dQEUXjUDfV5LuMzvEfts+OWSfRSYoRzeaN6LdVTlhb7tilPOJuPEzicS+5wys3O
	Fi1G+jYwavPfAtUS2NAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mtw-00000006NVF-49ec;
	Tue, 30 Apr 2024 12:48:05 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mtt-00000006NUU-1j5j
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 12:48:02 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5aa1bf6cb40so3945808eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714481276; x=1715086076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vx2HDwioP7peM3ybXUghDUkmAaCsk3IUVZemvfs29EA=;
        b=j6oeKR1BSHHuULGrdgZKsogVOpVF2nkxVCYkPR1U7Riyo5lU4HDgM0gScnh73TJTQl
         8k+7XlijqHpI/j7wtvcZ79oZcxjbfVd6754SsdRp+XlyKZ2iqHnH9nHMj8p2fLPfe3Tj
         gvJKhhzvyXQvINiAOuUbR7BQ8Hu0v+Da3gMwYSYgaAukUf2W4S1htQRlOhoPWm47qCQX
         JuZ/ZkD4p95f21O5rpoNXeZsI0af8Laglq3t4+tfpuKl/YNjgh763qxaIThxUqIvn05e
         m5GZZVWFS7/7nY2JsdyRCNpMp9Xa5g+shYIXcjrBtP3HWgtcnCaKBymGulAkIHlU8EPT
         xqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481276; x=1715086076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx2HDwioP7peM3ybXUghDUkmAaCsk3IUVZemvfs29EA=;
        b=kfuxf9qT7N7O4TLczVQPPuHnfYN2U0wCO3D01TQ3fO0sE89L8UKkHGMOsTvtcypS5w
         j88c4hes0KIeG+MFWjI+gwcHQYltun2x04ZocOO1avGpjylH8E6/HKViianyX7HMB2Vw
         R6oDqeKfYAwsXwBqM6SIYbI1d7eIe9ez+KKx2MjTt7rVDxDKsbX9aQjpJ7WR9KUuNrt4
         1ukS2qdeFe23es1qqV8K0MYY/h5wZ6dZUNoWxy/YaqXoOBi31dsKIDkNz5KICO8NEJA0
         polSautMWuCzNYNTNKE9O9FZTp41yRCcq9c8NHfuDcHpqiSTDn+YWGHXuH6Q31FJIpZM
         lDMw==
X-Forwarded-Encrypted: i=1; AJvYcCXwv2Y1y7+mpQ29FVdDCdab/zzDIiAHykXK2CYkCLH2NB3mTwCNOt4ls6p+xrS+drbHfeK0Sem/tsWklt6fKm7LGip1z02mBJW3k7/DX+VE
X-Gm-Message-State: AOJu0Yy1pxHmGnwKzOT5C1khmeAd0uVTpDTEqNvEf0+KtPxBmC/ZVcnF
	6W1s492vLekwMHjs3WHloJ7EM/EJFQ8GOnGJ1VdeXp/wpoSwl2ISM6pENeB2wDvc4NuC3LKTLUc
	NJLbP/x6u5ExiqZWWEmhMDZe+S3A=
X-Google-Smtp-Source: AGHT+IHuU2EFqO3qBtDOYpGlwBQry7VD96vfjBoybk6US74z5b+idG7yq5Aj41hjxx25uwbHdcArZcpU51UaP9ZGscw=
X-Received: by 2002:a4a:98ab:0:b0:5a9:cef4:fcea with SMTP id
 a40-20020a4a98ab000000b005a9cef4fceamr15127289ooj.1.1714481275480; Tue, 30
 Apr 2024 05:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240406063413.3334639-1-qiujingbao.dlmu@gmail.com>
 <20240406063413.3334639-3-qiujingbao.dlmu@gmail.com> <njsvev4dxjln2guw3lr5zwvytzvvmj7qcuduo2v56dhvuxujs4@eqm4cmh6ddva>
 <CAJRtX8So3PifNFfsnq1BmP3+8kevhM6Fk6moMp=wFX4o8q89SQ@mail.gmail.com> <vxolfkvbquiy2jllncjy3vbfl2jr26wkdvpxv65uz4dneln5jb@ozg6ejzgmj6f>
In-Reply-To: <vxolfkvbquiy2jllncjy3vbfl2jr26wkdvpxv65uz4dneln5jb@ozg6ejzgmj6f>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 30 Apr 2024 20:47:44 +0800
Message-ID: <CAJRtX8TOSXey0Q3ZZ_GRSMYg5CgX1trHXu7+2bAMWBuN5d9aTg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] pwm: sophgo: add pwm support for Sophgo CV1800 SoC
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_054801_472986_E5920CC4 
X-CRM114-Status: GOOD (  13.47  )
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

T24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgNDowNuKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSGVsbG8gSmluZ2JhbywKPgo+
IE9uIFR1ZSwgQXByIDMwLCAyMDI0IGF0IDEyOjM2OjU2UE0gKzA4MDAsIEppbmdiYW8gUWl1IHdy
b3RlOgo+ID4gT24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMTA6NTTigK9QTSBVd2UgS2xlaW5lLUvD
tm5pZwo+ID4gPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+IE9u
IFNhdCwgQXByIDA2LCAyMDI0IGF0IDAyOjM0OjEzUE0gKzA4MDAsIEppbmdiYW8gUWl1IHdyb3Rl
Ogo+ID4gPiA+ICsgKiBMaW1pdGF0aW9uczoKPiA+ID4gPiArICogLSBJdCBvdXRwdXQgbG93IHdo
ZW4gUFdNIGNoYW5uZWwgZGlzYWJsZWQuCj4gPiA+Cj4gPiA+IEp1c3QgdG8gYmUgc3VyZTogdGhl
IG91dHB1dCBpcyBsb3cgaW5kZXBlbmRhbnQgb2YgdGhlIFBPTEFSSVRZIHJlZ2lzdGVyPwo+ID4K
PiA+IFdoZW4gdGhlIHZhbHVlIG9mIHRoZSBQT0xBUklUWSByZWdpc3RlciBpcyAxLCB0aGUgUFdN
IG91dHB1dHMgYSBoaWdoIGxldmVsLgo+ID4gV2hlbiB0aGUgdmFsdWUgb2YgdGhlIFBPTEFSSVRZ
IHJlZ2lzdGVyIGlzIDAsIHRoZSBQV00gb3V0cHV0IGlzIGxvdy4KPiA+IFNob3VsZCBJIG1ha2Ug
dGhpcyBwb2ludCBoZXJlPwo+Cj4gU28gdGhhdCdzOiBUaGUgaGFyZHdhcmUgZW1pdHMgdGhlIGlu
YWN0aXZlIGxldmVsIHdoZW4gZGlzYWJsZWQuCj4KCkkgd2lsbCBkbyB0aGF0LgoKQmVzdCByZWdh
cmRzCkppbmdiYW8gUWl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
