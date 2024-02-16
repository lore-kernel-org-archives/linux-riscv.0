Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD09C48BC4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YqErC0ccUYqXF44MHjymcMr352bK5fUW/8ktjyP0mM=; b=OkkLyYvF2tjHrK
	2zYF1AoZbE89cnJT0HBZ2LZpjr2oLNRhL50Z4wPwRzKA49QNTrMMdx/XrcRHok50wiohT10tF2CkB
	d6zoKtlIDqOwBwaAFIJDrgNSlATRWSJ715nYVIHkJxTruHhMQa5kB73WC5qX/HQG3j8/ivveWSoJI
	KtdECe3Dx4+lBYOuBEMApEkiGcwVa34r/ly6P9c/h42CQpkuOyNAgRhfIKQarSaYM25nizoDOFH43
	qzwdxBUJcs0vN3TeVkLD/9vw6uMHEJW+tWR404Az2pl16XHsR+WAi975tD0wH1DX/18VgUYeOmuDw
	fEpYv48lROuRR9sowZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raywY-00000002ZGq-3Kf3;
	Fri, 16 Feb 2024 14:11:58 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raywU-00000002ZEA-3f0L
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:11:56 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607fc3e69adso6322207b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092712; x=1708697512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqGO92Q0ogoosij/1rf7SWylqz3srKBwNAJl+a8awB0=;
        b=O43lcidwGWvzx5nGkxdTHheshU22NIgmjBPL/VLxnJUpA9B9MscGVQhwKxIf8Rh9Gk
         JJDPygXrbZjgc7UUNh9M9TfYkz4EE3x2/5xo2pl7aOYfY+uKXpoZ8ZcN60tQDcCk087N
         XKRudII8cssCvjwQDWfU1ZzuQBPc0Wq5VOfBpXrtMxHLNyG9yzjbWTD9vF5nhnFDw2ki
         Axa8Zb/eLPn8ttR8+JYc4bXKbDPCxYkstj0cInCsQkOe44inKqUHRF77z5Hw8X800X/C
         mu+koMJaP7gQEp3f6JMqdyHnYqvFag2K3pZzV+ULG5gWBmF0hi4J8jksB5xwA+DrGNLy
         Cjeg==
X-Forwarded-Encrypted: i=1; AJvYcCXPDOO4cIhjC1kli+b3e7MzHbFJL1mVvYJ9FQhcmCgcbk2OEoOSWHM9OHQ+2z/9EhdVXu02MZ+rpWp4QMrUNR9PD571VSl3LqLeRw84GJoe
X-Gm-Message-State: AOJu0YzbuGqAvvNE1rU36yNL3zVn7IjGtFVnm+u9am0J0VXxPe1KMsdp
	/yX4OP+OG1ViANmYVJZhTlregJZo64vOwG6ic1V+U0kkapSpQmVWBoThL/uzeDY=
X-Google-Smtp-Source: AGHT+IFRgPLa+5Q9S/6xFH/zPh2OjPRMybq+euc0wCKRznLIE4f+8dcN33Ei5KjvE6rQvKR61Aoz8w==
X-Received: by 2002:a81:60c2:0:b0:5ff:42f2:ef75 with SMTP id u185-20020a8160c2000000b005ff42f2ef75mr5951401ywb.16.1708092712060;
        Fri, 16 Feb 2024 06:11:52 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id y84-20020a0dd657000000b00604b1b977b9sm353251ywd.62.2024.02.16.06.11.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:11:51 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607e707a7f1so15309447b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:11:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPLS7DHfK8uoA/laajdGRSn7JoJ3+MmF+ffYXEsPYEn1m5MxnL71VutOB2HFUfRH0mb8aHmj+5TevAkZk+ROK/4FQdkkRcsSJnRCY/LKgp
X-Received: by 2002:a81:7b41:0:b0:607:7e16:347a with SMTP id
 w62-20020a817b41000000b006077e16347amr5563931ywc.42.1708092711263; Fri, 16
 Feb 2024 06:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-16-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-16-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:11:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbp2mvFyjyr9+qmuAiSip33OaVnxR-hatOtzAjTYtycg@mail.gmail.com>
Message-ID: <CAMuHMdXbp2mvFyjyr9+qmuAiSip33OaVnxR-hatOtzAjTYtycg@mail.gmail.com>
Subject: Re: [PATCH 15/17] arm64: dts: renesas: r9a07g054: Update
 #power-domain-cells = <1>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061155_163786_3B602168 
X-CRM114-Status: GOOD (  17.48  )
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

T24gVGh1LCBGZWIgOCwgMjAyNCBhdCAxOjQ04oCvUE0gQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFA
dHV4b24uZGV2PiB3cm90ZToKPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEu
dWpAYnAucmVuZXNhcy5jb20+Cj4KPiBVcGRhdGUgQ1BHICNwb3dlci1kb21haW4tY2VsbHMgPSA8
MT4gYW5kIG1vdmUgYWxsIHRoZSBJUHMgdG8gYmUgcGFydCBvZiB0aGUKPiBhbHdheXMgb24gcG93
ZXIgZG9tYWluIGFzIHRoZSBkcml2ZXIgaGFzIGJlZW4gbW9kaWZpZWQgdG8gc3VwcG9ydCBtdWx0
aXBsZQo+IHBvd2VyIGRvbWFpbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8
Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cgo+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOWEwN2cwNTQuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOWEwN2cwNTQuZHRzaQo+IEBAIC0yMzgsNyArMjM4LDcgQEAgbXR1MzogdGltZXJA
MTAwMDEyMDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0
Z2lhOCIsICJ0Z2liOCIsICJ0Z2ljOCIsICJ0Z2lkOCIsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgInRjaXY4IiwgInRjaXU4IjsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA1NF9NVFVfWF9NQ0tfTVRVMz47
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmY3BnPjsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZjcGcgUjlBMDdHMDU0X1BEX0FM
V0FZU19PTj47CgpUaGlzIHNob3VsZCBiZSBSOUEwN0cwNTRfUERfTVRVLCBidXQgdGhhdCBkb21h
aW4gaXMgbm90IHlldCBzdXBwb3J0ZWQKYnkgdGhlIGRyaXZlci4gIEluc3RlYWQgb2YgYWRkaW5n
IGluY29ycmVjdCBoYXJkd2FyZSBkZXNjcmlwdGlvbnMsCkknZCByYXRoZXIgZGVmZXIgdGhpcyB1
bnRpbCBhbGwgZG9tYWlucyBhcmUgaGFuZGxlZCBieSB0aGUgZHJpdmVyLgoKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyBSOUEwN0cwNTRfTVRVX1hfUFJFU0VUX01UVTM+
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICNwd20tY2VsbHMgPSA8Mj47Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
