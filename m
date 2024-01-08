Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF79C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZwmjgL0N9FyVIHpOYY5W5KOnO1+ayNnSEGicZMPm/A=; b=fLTXOIVFMJMSo1
	3PXTz3lZ01MHfYzVnPWdu7AR4aV1Qz/SZPDoe78WGaUE4QKp402mKvCv0XtuqKUf9yMdLdowp30Le
	t9yCbudUIYpuUa7Hflogu+RFFGQ5s5HlJgrSgVYH5tDibjR+D5jhDa+Ycq36Nq5JFvE9J7PM2WkWW
	157v5IYSV4iT2Bdof8jIKW6hpHsovKMHmsYpP4r2In+m0i0+vNAR9tMiSchEo11JAzp6tZZsP5rtB
	yj97LjvPucxVflH6G2kOy5RX1WiiwRc2sinbz4+s2mY7uruVVucppb/kLIJkQERhNcKHuO26jmAfU
	zH7ZUKHoj91+6xS5QXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqBO-005Hnc-1q;
	Mon, 08 Jan 2024 14:00:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqBL-005Hl8-2e
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 14:00:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso1649110a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 06:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1704722441; x=1705327241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsHjtSAD7CR/Uw67tDyZXUJsMA+vgb2Il2+MXiGde7A=;
        b=VWtNUyxmdg2acYVXrpMLFiFsNIB+tB1GlGhg8KHNJqyLIsgRT/jxYh13EdIMlFPcUu
         LkelnXdqvW2DrhTSt0YtjFCNASo42EMr8eY6OvIDJ0c1qbjNJxRRRL6uUrzIvVDDts07
         YVrbc7UtBFWZo9Wnctdqz7Dxpt/oo89E+eK3nXYSnKvgiqCH3hD/uDCD029akdVE8dHG
         C52rhYnyJ3gvPLq9MNE1Tu0qT40Zc3S1Ro7y9QwyEE912Tpoubpd4pSJTLe2vGzNHPPJ
         nNHUpFE403AGt1CYagD0zbf7ZNXScWMM2DF7ngPsGotXcpCub0AU3MEfbuDXB1qWPphu
         XQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704722441; x=1705327241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsHjtSAD7CR/Uw67tDyZXUJsMA+vgb2Il2+MXiGde7A=;
        b=GA2LeJgt3CzDQ5urZ+mmwPTrA8FXEKyoczPfuFZfkxA+OpiJIbyPogx1/00cYuNDXI
         0jbLzaKp8ltWUiTGbL2xXxSir1LQSakH4z3bg5I6JWy6uN0bAenGBjKyUqu0Ra2EJyrJ
         ge9bWK74cdh32yZpHIYe9b/Hry0atnNv4oUTk1Sf57P73bJv3QF86Z8pE5/6CiOKW2oa
         m96Yhz/ERRysmsZIssOdeTi1Kc2RQo9xT8tTOaMz7KbPtyEnOwapQm0Og2yr9wWRg3+b
         TxqLSgN69g0L1HAfJbNAxJsosi1ldUhEbreCt+vm5zH4j2IFTJ0DJfHsebtdiVcGelvf
         DHQA==
X-Gm-Message-State: AOJu0Yw68FihYSSkh6fYk+fbBq1lsZerE/8fM4j8zvfKQbORpQCfrwIA
	OZwF5iwzLY+lyJFK6jdW5kGgaZtE6GOJOFQHgLSn4266va1RNQ==
X-Google-Smtp-Source: AGHT+IG6M5/HPL5z2iu+bv+cDT8okM9t+0Kb9SYQo0HU3bi50MXU6tg3bagSrM1h0jjNwpnrNJpAS5jTVZd+AmduFM4=
X-Received: by 2002:a17:90a:474e:b0:28c:25d9:cc08 with SMTP id
 y14-20020a17090a474e00b0028c25d9cc08mr1737979pjg.82.1704722441110; Mon, 08
 Jan 2024 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <ZTE7eUyrb8+J+ORB@andrea> <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
 <ZTJUOji+B+dDbMKh@andrea> <20240108-a56ba0dfd1779e4ab6893d16@orel>
In-Reply-To: <20240108-a56ba0dfd1779e4ab6893d16@orel>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 8 Jan 2024 15:00:29 +0100
Message-ID: <CAEg0e7g34qXbtaGbQftqucRxopFKHvErm=DWx8N65kueDo2n4w@mail.gmail.com>
Subject: Re: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Andrea Parri <parri.andrea@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	linux-kernel@vger.kernel.org, David.Laight@aculab.com, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_060047_858626_7542C1A2 
X-CRM114-Status: GOOD (  26.31  )
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

T24gTW9uLCBKYW4gOCwgMjAyNCBhdCAxMjozNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMTI6MTk6
MzhQTSArMDIwMCwgQW5kcmVhIFBhcnJpIHdyb3RlOgo+ID4gKFJlbW92aW5nIEhlaWtvJ3MgQHZy
dWxsIGFkZHJlc3MgZnJvbSBDYzosIHNpbmNlIGl0IHNlZW1lZCB0byBib3VuY2UsIGtlZXBpbmcK
PiA+ICBoaXMgQHNudGVjaCBhZGRyZXNzLikKPiA+Cj4gPiA+IEkgaGFkIGEgcXVpY2sgbG9vayBh
dCB5b3VyIGNoYW5nZXMsIGFuZCB0aGV5IGxvb2sgZ29vZCB0byBtZS4KPiA+Cj4gPiBHcmVhdC4g
IFRoYW5rIHlvdSBmb3IgbG9va2luZyB0aGVtIG92ZXIuCj4gPgo+ID4gPiBEaWQgeW91IGFncmVl
IHdpdGggUGFsbWVyIGFib3V0IHRlc3RpbmcgcmVxdWlyZW1lbnRzPwo+ID4gPiBJLmUuLCBkbyB3
ZSBuZWVkIHRvIHJ1biB0aGlzIG9uIGhhcmR3YXJlIHRoYXQgaW1wbGVtZW50cyBaYXdycyBpbiBh
Cj4gPiA+IG5vbi10cml2aWFsIHdheT8KPiA+Cj4gPiBJIGRpZG4ndCBxdWl0ZSBkaXNjdXNzIHN1
Y2ggc3BlY2lmaWMgcmVxdWlyZW1lbnRzIG9yIGhhcmR3YXJlIGltcGxlbWVudGF0aW9ucywKPiA+
IGJ1dCBJIGFncmVlIHRoYXQncyBhIHZhbGlkIGNvbmNlcm4uICBOb3QgdGhhdCBJIGN1cnJlbnRs
eSBoYXZlIGFjY2VzcyB0byBzdWNoCj4gPiBoYXJkd2FyZTsgYW55IGZ1cnRoZXIgaW5wdXRzL2Rh
dGEgd2lsbCBiZSBhcHByZWNpYXRlZC4KPiA+Cj4gPiA+IEkgY2FuIHRyeSB0byByYWlzZSB0aGUg
cHJpb3JpdHkgb24gdGhpcyBoZXJlLCBidXQgY2FuJ3QgcHJvbWlzZSBhbnl0aGluZy4KPiA+ID4g
Rm9yIG1lIGl0IGlzIGFsc28gb2sgaWYgeW91IHRha2Ugb3ZlciB0aGlzIHBhdGNoc2V0Lgo+ID4K
PiA+IFRoYW5rcy4gIEVpdGhlciB3YXkgd29ya3MgZm9yIG1lLiAgTm8gdXJnZW5jeSBmcm9tIG15
IHNpZGUuICBJJ2Qgc2F5IC0gbGV0IHVzCj4gPiBsZWF2ZSB0aGlzIHVwIHRvIHRoZSBjb21tdW5p
dHkvb3RoZXIgcmV2aWV3ZXJzLiAgKElJVUMsIFBhbG1lciB3YXMgcmVjb3ZlcmluZwo+ID4gZnJv
bSBhIGNlcnRhaW4gZmx1IGFuZCBtaWdodCBuZWVkIG1vcmUgdGltZSB0aGFuIHVzdWFsIHRvIGdl
dCBiYWNrIGhlcmUuKQo+ID4KPgo+IEhpIGV2ZXJ5b25lLAo+Cj4gSSdtIGFsc28gaW50ZXJlc3Rl
ZCBpbiBzZWVpbmcgdGhpcyBzZXJpZXMgcmVzdXJyZWN0ZWQgYW5kIG1ha2luZyBwcm9ncmVzcwo+
IGFnYWluLiBJJ2QgYmUgaGFwcHkgdG8gaGVscCBvdXQgaW4gYW55IHdheS4gSXQncyBub3QgY2xl
YXIgdG8gbWUgaWYgaXQgaGFzCj4gYSBjdXJyZW50IG93bmVyLiBJZiBub3QsIHRoZW4gSSBjb3Vs
ZCBzdGFydCBzaGVwaGVyZGluZyB0aGUgcGF0Y2hlcyB3aXRoCj4gdGhlaXIgYXV0aG9yc2hpcHMg
aW50YWN0LgoKU291bmRzIGdvb2QgdG8gbWUhClRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzIQoK
Pgo+IEkgbWF5IGJlIGFibGUgdG8gZG8gc29tZSB0ZXN0aW5nIG9uIGFuIEZQR0EgdG9vLgo+Cj4g
VGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
