Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF875C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8CEJ46rs4KhU+koU/5x4gIbwwiYMpYK9VOwI7UR2og=; b=HjrgkCIjseWeGC
	ppvqh4r/b/c0BQXKPjbV9or6wvfuoCr/2mhtmGbbEqOY39huSYgSPeoBR53Niv1r44MdCKsrjrg7r
	C42bi4FUZTxpsLdMTXrIR6FqKFQf7L4AmVKK9I9BfoaGEzvqsmN9WzF9SP1BiNUKP5NfYGbXoAhaU
	/MEwwiGV8kEvJ0gfaDjA/QHr7wvcKHxfABvgnBnIks8avGkqYVCkm1uIRD3ACv4q2GKnqlyn+dYLD
	DWDTD2O1ZRmCS2GEgzuf5ZdcAsT2KpOatqWIynG3j7jZQ9sYu+nNI8igomE/CXklMbGru4FB/SjlY
	W7Fg7KHPJ6QxiLFE/09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayvO-00000002Ypf-2f25;
	Fri, 16 Feb 2024 14:10:46 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayvM-00000002Yo2-07io
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:10:45 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso81485539f.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092640; x=1708697440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5usblB72Tc1YxnB07a2CG6x3FmS/CzmUo8QJlADnigw=;
        b=CIaBIC0n7PZCPNttu8DdnJwUgLPQ1/a5RHmvYP15MoejRdtW4RrBrPmbTQSNHZBl2K
         ewe/H8eFXrwnDfdRxvQVIflmiqJ5OIrz5lrxnMMGSodJjCwl5WAnFQfu0gyMfOFSbkhZ
         roD98GfPwqC9oxpq+eHuU8fXHMHo/bfk+IrvFJBcDI3nxhpkplCT+JUT5CYB3Ha0n+zU
         kmDQ0LXAwyxBGCgU+AWyTV0ezpLSFeWfd0+nc3xvo+wzM5w36uaVICFzOhsFpaIeUUy5
         FljGpF0GH6SAV8xgfZgRJFXHG3Psmuy1V2gtsPMaERiqNKdtndMQIINw/7+YnmuhL3Uv
         bR9w==
X-Forwarded-Encrypted: i=1; AJvYcCUrLZrHkuPwoUYBsZxHz1+2jZPHNFfwQ4g53tFAHCEN+I2vC/vhPtAjVF5u1XOVvonOb3EKcGDxZCwO+4cTTiu79gKrryCEtcMFSwbkthT2
X-Gm-Message-State: AOJu0YxyzAsO8C0whXoA+IsHa2LZPLxnrpuDFiPOoOOUF3gZEM+yyi0x
	csXyJVc/b44YdODp91enmle/cOuhS4e2R3pOvgiQtQSpRG9xXvBkeCX0N2ynAFg=
X-Google-Smtp-Source: AGHT+IE3GEZxFEUL31hRP05oxlf/71ujO87BRvgUyJ0GyV24L+CzPliS2py9j0vnD+bHqAJmdwi5iw==
X-Received: by 2002:a6b:d812:0:b0:7c4:80f9:f0c8 with SMTP id y18-20020a6bd812000000b007c480f9f0c8mr5390275iob.9.1708092640490;
        Fri, 16 Feb 2024 06:10:40 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id v14-20020a25fc0e000000b00dc254858399sm318840ybd.2.2024.02.16.06.10.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:10:39 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc74435c428so1878821276.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:10:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVb6OqNZTZ1C0yl0fFqlU4kkTpRL80kwePmgi1i83hnuhgH60Ta3NdYJFe15MngmG8S6VasMkzGZZZeFxcS7q/etsn8U9lWYYL+gs9j9wVq
X-Received: by 2002:a25:f903:0:b0:dc6:c617:7ca with SMTP id
 q3-20020a25f903000000b00dc6c61707camr4827717ybe.29.1708092639183; Fri, 16 Feb
 2024 06:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-12-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-12-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:10:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVi4UZUwYYK-RerZdtj+ozJbCYnxoi9kPT=safOBg1Y+A@mail.gmail.com>
Message-ID: <CAMuHMdVi4UZUwYYK-RerZdtj+ozJbCYnxoi9kPT=safOBg1Y+A@mail.gmail.com>
Subject: Re: [PATCH 11/17] clk: renesas: r9a09g011: Add initial support for
 power domains
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061044_088264_A4676DE2 
X-CRM114-Status: GOOD (  14.59  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gSW5zdGFudGlhdGUgYWx3YXlzLW9u
IHBvd2VyIGRvbWFpbiBmb3IgUjlBMDlHMDExIFNvQy4gQXQgdGhlIG1vbWVudCwgYWxsCj4gdGhl
IElQcyBhcmUgcGFydCBvZiB0aGlzIGRvbWFpbi4KPgo+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KCkFzIG5vdCBhbGwgSVBz
IGFyZSBwYXJ0IG9mIHRoZSBhbHdheXMtb24gZG9tYWluLCBJJ2QgcmF0aGVyIGRlZmVyIHRoaXMK
dW50aWwgYWxsIGRvbWFpbnMgYXJlIGhhbmRsZWQgaW4gdGhlIGRyaXZlci4KTm90ZSB0aGF0IFJa
L1YyTSBkb2VzIG5vdCBoYXZlIENQR19CVVNfKl9NU1RPUCByZWdpc3RlcnMsCmJ1dCB1c2VzIHRo
ZSBJbnRlcm5hbCBQb3dlciBEb21haW4gQ29udHJvbGxlciAoUE1DKS4KCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
