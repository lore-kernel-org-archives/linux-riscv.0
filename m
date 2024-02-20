Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E300C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsnVipOwkC4JHTEO6lvoEVIP2jKtMcSHpNkChpCYSNQ=; b=bYGMXFJ4Jr/AJ2
	2G8xz1buP25zMY+0j0BqyIyCcYLhyjFzwFbHiamOYPWoBp0SadEn/2V7QwWRjNQc+SKE3h+Fv/JdA
	D0sFaw/5mgQRuKwTUT+ACRA4gGwm4JoNY1tNUFaO21xu1sO1Vz+0J5aDoSCxAAfzm29XnF1LraO3N
	+Ovg2/lj+sFI1kHskWUpEn1cmc1vPdQa5TB5womI5g2+9yuzuTctM4qEkM7Jd2Krdl2ZGD6MOFWh3
	psDmbu7aVoEWGaehWB4FhQCW7XaAdPhNviRo4JU/d1Zbg4fsyl6hMM0QN+pY7T2FQYFTBtcdDKcqE
	41+X+30BFgXAY62mcwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPyg-0000000Eo9d-3aDf;
	Tue, 20 Feb 2024 13:16:06 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPyc-0000000Eo7L-16kd
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 13:16:03 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3652762edcfso8328655ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708434959; x=1709039759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqjOTROjMQYB67bxRQ6W3keFDzFkSXSEKRuI3JlJhrA=;
        b=UBD9FU23swuE3Jfu+RASP3ctWp8bFk8DtIuIFp+Rl6qURRW1eeh5D7OTupnI1TiOtY
         QlcRW7kP+z3aRrlbStZL/09ljXMFM3ypHPahV3jyamHRS+El/UPg4CasRCeSrlH+JaoK
         fOuJHnLAJOb3a9HnkuuTrOSl1neJtQF1nTw0619laWBndc6wNOM3mCYPm0K7/CC4rlSj
         mrB6ybLGjd/j3iiHivx/WgzFniy5eD9o2ZVsp62k0+DJ55uBXQ3jIZqnKvU8OUODEb11
         x9zs/8QoPAnZ7Z0Hq2zSN1xaicbEs/GzkjrZFXeXqgvYhB2X+ULoTcqov+2RrUxDmkxH
         JSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708434959; x=1709039759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqjOTROjMQYB67bxRQ6W3keFDzFkSXSEKRuI3JlJhrA=;
        b=S4VPNaYN4FCA8ez8nydSjHiqEjAUuOPw+vLvc2kOb+h/+VWSkemAcvcDy/Owvz2HmD
         G4m65CACnaGZD7V2FR7lBJO2spI10vSqLegeM8WC1QrzlPBbl/Lv5Jswugt2rM/5mcAJ
         fyJX932q22iY1HqVotcQYOOxdCXeVh4ZsbEsjcWTkE22+F/VGxlpTNOewxKL+yx3tfy2
         2Fme7CjS4cXY6bhsJuv5o/s9OKPQu+DsZeNI3EZpctllJBu6Do0WDyGtSVDCuVEtUQuy
         zpCMRAWm+2ZHdgwqBclZPpNvi+s8fT46NbiXEPGCv3ClqiTlqYvYlhMuqIYorukYEgn6
         b04g==
X-Forwarded-Encrypted: i=1; AJvYcCUhFAacvjLy3g5bVLg1Xds6k2tobutZONmRALp293O2kSFLZ96YOYr0TmtS1cigzN8EMCtXY9j0EIK/h0AAEjyOPjFGfsKslk9Z6f8B67KP
X-Gm-Message-State: AOJu0YxP1fi4tNaJwb6OT43tlielsaM5S14c1ad+PLcLIDEfemjOiM5J
	2lvgDlf0fH+pcY9KDI8T7ZBUGIHgPMx9NmEz23SmJmFn2L6nM0IOP/dlzHzCT2ZCh2y8VSAbRYy
	TLs+/7T+NEUx0RqoR0LLHMQ7Cx3HhzYVzKuv2CA==
X-Google-Smtp-Source: AGHT+IGBHyxhOfx+rHBkUEIb+UN9EusJtSraJpbfRqOa1twSLXdPbfjomfAe1MpQwps5BmFOHpbz4M0jqq6MI7Pf8d0=
X-Received: by 2002:a92:cf0f:0:b0:365:1785:88f6 with SMTP id
 c15-20020a92cf0f000000b00365178588f6mr10945548ilo.3.1708434959388; Tue, 20
 Feb 2024 05:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com> <87a5nvfj2s.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87a5nvfj2s.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Feb 2024 18:45:47 +0530
Message-ID: <CAAhSdy187H0E1-V4uhrik42qHoZrk-w499YWFzR13EWX-Wyu=g@mail.gmail.com>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_051602_331172_56FCC286 
X-CRM114-Status: GOOD (  13.04  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNToyM+KAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gVGhlIFJJU0MtViBhZHZhbmNlZCBpbnRlcnJ1cHQgYXJjaGl0ZWN0dXJl
IChBSUEpIHNwZWNpZmljYXRpb24KPiA+IGRlZmluZXMgYSBuZXcgTVNJIGNvbnRyb2xsZXIgY2Fs
bGVkIGluY29taW5nIG1lc3NhZ2Ugc2lnbmFsbGVkCj4gPiBpbnRlcnJ1cHQgY29udHJvbGxlciAo
SU1TSUMpIHdoaWNoIG1hbmFnZXMgTVNJIG9uIHBlci1IQVJUIChvcgo+ID4gcGVyLUNQVSkgYmFz
aXMuIEl0IGFsc28gc3VwcG9ydHMgSVBJcyBhcyBzb2Z0d2FyZSBpbmplY3RlZCBNU0lzLgo+ID4g
KEZvciBtb3JlIGRldGFpbHMgcmVmZXIgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFp
YSkKPiA+Cj4gPiBMZXQgdXMgYWRkIGFuIGVhcmx5IGlycWNoaXAgZHJpdmVyIGZvciBSSVNDLVYg
SU1TSUMgd2hpY2ggc2V0cwo+ID4gdXAgdGhlIElNU0lDIHN0YXRlIGFuZCBwcm92aWRlIElQSXMu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4KPiBUaGlzIHBhdGNoIGhhcyBhIGNvdXBsZSBvZiBjaGVja3BhdGNoIGlzc3VlczoKPgo+
IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKPiBDSEVDSzog
UGxlYXNlIGRvbid0IHVzZSBtdWx0aXBsZSBibGFuayBsaW5lcwo+IENIRUNLOiBQbGVhc2UgdXNl
IGEgYmxhbmsgbGluZSBhZnRlciBmdW5jdGlvbi9zdHJ1Y3QvdW5pb24vZW51bSBkZWNsYXJhdGlv
bnMKPiBDSEVDSzogVW5uZWNlc3NhcnkgcGFyZW50aGVzZXMgYXJvdW5kICdnbG9iYWwtPm5yX2d1
ZXN0X2lkcyA8IElNU0lDX01JTl9JRCcKPiBDSEVDSzogVW5uZWNlc3NhcnkgcGFyZW50aGVzZXMg
YXJvdW5kICdnbG9iYWwtPm5yX2d1ZXN0X2lkcyA+PSBJTVNJQ19NQVhfSUQnCj4gQ0hFQ0s6IFVu
bmVjZXNzYXJ5IHBhcmVudGhlc2VzIGFyb3VuZCAnZ2xvYmFsLT5ucl9pZHMgPCBJTVNJQ19NSU5f
SUQnCj4gQ0hFQ0s6IFVubmVjZXNzYXJ5IHBhcmVudGhlc2VzIGFyb3VuZCAnZ2xvYmFsLT5ucl9p
ZHMgPj0gSU1TSUNfTUFYX0lEJwo+IENIRUNLOiBVbm5lY2Vzc2FyeSBwYXJlbnRoZXNlcyBhcm91
bmQgZ2xvYmFsLT5sb2NhbAo+IENIRUNLOiBVbm5lY2Vzc2FyeSBwYXJlbnRoZXNlcyBhcm91bmQg
aW1zaWMtPmxwcml2Cj4gQ0hFQ0s6IGV4dGVybiBwcm90b3R5cGVzIHNob3VsZCBiZSBhdm9pZGVk
IGluIC5oIGZpbGVzCj4KCk9rYXksIEkgd2lsbCBhZGRyZXNzIHRoZXNlIGluIHRoZSBuZXh0IHJl
dmlzaW9uLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
