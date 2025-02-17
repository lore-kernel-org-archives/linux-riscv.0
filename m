Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A9C021A1
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZdBZ+L2xgtBYGHLHMPxOFUroCV/sO1hK4HPmwAdLYY=; b=4IawZMry1e3Aw8
	qekorCwUsG4u7BkteD3r3P+jSc8MOdoWRU0a4IvRWX9DXw+ZSjUXW6nxM1EQGxCEuS144EAk79OQp
	4aIkbyMf24+Gvo4Jmc27uYKQtNnRm03pqs9xRXQYenKHlCRUwMe1rldgv7GTtqJk77FlUMBhNa3ip
	oE7ldulhsT6JBjPLX37IkmsO3vI5urnIwbWmKoSzedyD6mqg1VjCJzMg6FOM+RK7+iASDJmV7x57x
	RwZ/gjk9Bsr8P2HX3zccU+rqJ5E9gAwLkzABzEiOP2Cv81TJ9tee6HhJ6vrhFmmAl0COkMC2nOJe8
	NIE3NKsscGRFxAD0iB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyli-00000004CbW-3sHA;
	Mon, 17 Feb 2025 10:54:30 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyV4-000000048Y3-0JvZ
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:37:19 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso38930935ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739788637; x=1740393437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/4vfKOluL1Eg686lBWaj194kh5dTDmMHAYz+CjFLAs=;
        b=Ley8qzMyuNWgMYB8I7+TJW8Qi7zrSB5jk7S7F7ecdWi5gv1OEcfPuKEgrw+moRIkEM
         p73gy/4hKMQfHWIXkVZWj0ys6YLJW1cfpFVpzEVFPCv5EmuJJ+ESv4LX4kTm8L11NcvY
         NcE+i/E1l7qiQtWFF07v13er0jPeLElp0A3MzHkrMy0ZyJ85IcwrigANHa3p0qqbuNX5
         kyxVw/bmy/iI3m5xafxbBvYqRuMNtiOxYnaiQeizQk1yCRPl2V8zoEWWdi+xlVde6yYi
         xGWsP5gj51gpZ4IJwCdBzEtZzjcKrvv4MJQpbZmBrIjOA6zrxdjq/ZYDSid1QXUQZhBT
         I1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788637; x=1740393437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/4vfKOluL1Eg686lBWaj194kh5dTDmMHAYz+CjFLAs=;
        b=MJMm5PsMHzs/1Fb+RmPzItFSSjE6hC90SioM+HhC3/GnjA6HSELb9fbWm4PqAj+OdL
         rLllEKipoqn7cheiEOZQnyLxXd10BNvmO0btWDFXx1bEhNtNwBf5kjr3SjoW8ucru6g/
         /C/RoMvQ6fxcBkQuG+U9Xi8jJyYKvQUKM4A4z0r+Mm5NhigtVlKrHfWwlhHjpOuk90+Q
         fTNm2NfXS9i7DZLYPcsGaPuzYzATOc+PpMYC4oy/OrSd3f0fkSqvSXn4ippkxvtyF4BU
         1AXUSEar+URtR/5/AkaTqKpOOGqHiTS5ljB8EtCEC5WwDZZNCSMZ44Nv34xOuWi5h/Uq
         wWNA==
X-Forwarded-Encrypted: i=1; AJvYcCWy1vb/dmaaAg0o2cJZ1QJvzoUXVejaelEeSDJ80HMPIo7y1ONnzsXZZR6KuYEhpXrkTo4N/AhiP9cwbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfBj3tEgqYu4cQflXYPtlL4Wc1KKhf5meBzPEzyNOWbZCyTOee
	E6DdxdYLV+RdmU4s9Kv4PyrcWs4QDGSn18QQGqPTpCHhGPFadwnOOSsYcw7WsjMy0hb61P+yB/2
	6q1OguXt8oaOzAZRzPmGNCwaEMpKeowmYS9Dm7A==
X-Gm-Gg: ASbGnctboZHrECQgVNfhc8I7d7DcQaYmmKqmZCexYxCphs+aSedVtHGKpmpwu4xEcdh
	WOV+nKkbGjntqFptM6CCLxQFJUAUEAuIhTc7aMJr3GW3GUN8o6DT6eTyWpKWJ9VuTofSVTeJ0dw
	==
X-Google-Smtp-Source: AGHT+IGSgdNxJGmNM6uEFns6lOMjpsz78qALluZZkDvBBvFmGCBC14C1R6jfhNyS8tBwA04k2Qxv26XqVPutxJOehyI=
X-Received: by 2002:a05:6e02:330f:b0:3d1:9f4d:131 with SMTP id
 e9e14a558f8ab-3d28077166fmr81057795ab.1.1739788637040; Mon, 17 Feb 2025
 02:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-9-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-9-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:07:04 +0530
X-Gm-Features: AWEUYZm9T-78sMEKcz3AEQRarONAs9iFjfd-t2ah-PgfAHb_xncGPr7rpaa4a5k
Message-ID: <CAAhSdy2NxgiE4O0BV5nivTzhUSDH-vo+zqvxb39hga3K4-DgFQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] riscv: KVM: Fix hart suspend_type use
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_023718_107942_AFBB0D97 
X-CRM114-Status: GOOD (  13.77  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIHNwZWMgc2F5cyBzdXNwZW5kX3R5cGUgaXMg
MzIgYml0cyB3aWRlIGFuZCAiSW4gY2FzZSB0aGUgZGF0YSBpcwo+IGRlZmluZWQgYXMgMzJiaXQg
d2lkZSwgaGlnaGVyIHByaXZpbGVnZSBzb2Z0d2FyZSBtdXN0IGVuc3VyZSB0aGF0IGl0Cj4gb25s
eSB1c2VzIDMyIGJpdCBkYXRhLiIgTWFzayBvZmYgdXBwZXIgYml0cyBvZiBzdXNwZW5kX3R5cGUg
YmVmb3JlCj4gdXNpbmcgaXQuCj4KPiBGaXhlczogNzYzYzhiZWQ4YzA1ICgiUklTQy1WOiBLVk06
IEltcGxlbWVudCBTQkkgSFNNIHN1c3BlbmQgY2FsbCIpCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX2hzbS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMKPiBpbmRl
eCAxM2EzNWViNzdlOGUuLjMwNzBiYjMxNzQ1ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9oc20uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jCj4g
QEAgLTksNiArOSw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgo+ICAjaW5jbHVkZSA8
bGludXgvZXJyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ICsjaW5jbHVkZSA8
bGludXgvd29yZHBhcnQuaD4KPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiAgI2luY2x1ZGUgPGFz
bS9rdm1fdmNwdV9zYmkuaD4KPgo+IEBAIC0xMDksNyArMTEwLDcgQEAgc3RhdGljIGludCBrdm1f
c2JpX2V4dF9oc21faGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVu
ICpydW4sCj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
ICAgICAgICBjYXNlIFNCSV9FWFRfSFNNX0hBUlRfU1VTUEVORDoKPiAtICAgICAgICAgICAgICAg
c3dpdGNoIChjcC0+YTApIHsKPiArICAgICAgICAgICAgICAgc3dpdGNoIChsb3dlcl8zMl9iaXRz
KGNwLT5hMCkpIHsKPiAgICAgICAgICAgICAgICAgY2FzZSBTQklfSFNNX1NVU1BFTkRfUkVUX0RF
RkFVTFQ6Cj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfd2ZpKHZjcHUp
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi40OC4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
