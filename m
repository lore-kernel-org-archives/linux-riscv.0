Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB2EF5A8C7
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzzJDj9t2i+lm+wATntzjtkdsmRbTroPNigCEN/pVA4=; b=PBvHd1aLWpa0wn
	2T6cn2St6ngXQvwUMkFpTrk09yZFyd6mKLI/Yun8h60XBfvGkxuZrl4sX7nGZtGqwIjr7yYW44RVJ
	2JcEgLPK6tEqk5c6kOJFnDjNsbCkyhWO9KwGPSaMVzNmuKYpv2c2JdezqzIflmSB6yFAZ+0hw0tT2
	ckdzohKwCs0Hlgbh8jUKlrisYEtGFsAyj8LMG3+S20R1xy0WdjVJ/wpOTqq3m1Lh+AVrG4/ZX2rVo
	WdWf7TaZ3WvJBERE0g7/MqwLtP5mEatFgUwdQ9KfvowjkyMUkh3+u1jb11YWM30mU808YaIDn+Ki2
	Y5G0CM/cAsmr/IfP72RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvz9-00000007fBz-2NhS;
	Mon, 20 Apr 2026 21:16:51 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvz6-00000007fBe-2FVQ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7vNfyFBOnLNbtekuQiXkiG2gtWPCS+o1h1We+Flr9lo=; b=HtBKX5/Il95oqVlLVCfX19riBr
	g776peq+rh+OfYNsix46NL1UtKwuYZnaex5rnrF3cuzaIE7k8S6rNIK55Iolw5b08FauIzm73h9c0
	/Ob57V+UtL6X3lmx1DkjhQR2MQawjHwjB1K9zY8wsAU4NeowmqR+xYBkE2z4EMb1gKhtbpWJbCuFt
	zYbeSYp+4G0jdoLOLgNweuBIs0lOZDVDYAH3auT23Qx8R04lWxFwzWMD0onNH10sL9YC1GVYt+HYu
	+gNxIKE6cZVQSKRXCTTXutKBm59tMW/ltoJawkhhqZNpj3iR3hIM1VhVVktrXIOGOBK/Cq1JrhqEX
	wUh1pfvA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wEvyu-0000000DyKx-2dhQ;
	Mon, 20 Apr 2026 23:16:36 +0200
Date: Mon, 20 Apr 2026 23:16:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shuwei Wu <shuwei.wu@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
Message-ID: <aeaXszeaE62rM6BJ@aurel32.net>
Mail-Followup-To: Anand Moon <linux.amoon@gmail.com>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
 <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org>
 <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_141648_730521_65046A22 
X-CRM114-Status: UNSURE (   8.98  )
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

SGkgQW5hbmQsCgpPbiAyMDI2LTA0LTE2IDE3OjA3LCBBbmFuZCBNb29uIHdyb3RlOgo+IEFmdGVy
IHJldmlld2luZyB0aGUgQmFuYW5hIFBpIEYzIHNjaGVtYXRpY3MsIEkgY29uZmlybWVkIHRoYXQg
QnVjazEgYW5kIEJ1Y2syCj4gQm90aCBzdXBwbHkgdGhlIENPUkVfMFY5IHdpdGggMC45VsKxMSUg
cmFpbC4gVG8gcmVzb2x2ZSB0aGUgcmVzdHJpY3Rpb24gZXJyb3JzLAo+IEkgZXhwYW5kZWQgdGhl
IHZvbHRhZ2UgcmFuZ2UgaW4gdGhlIERUUyB0byA1MDAsMDAw4oCTOTUwLDAwMCDCtVYuCj4gCj4g
QWRkaXRpb25hbGx5LCBJIHVwZGF0ZWQgdGhlIERUUyB0byBtYXAgdGhlIHNlY29uZCBDUFUgY2x1
c3RlciAoY29yZXMgNOKAkzcpCj4gdG8gQnVjazIgdG8gYmV0dGVyIGFsaWduIHdpdGggdGhlIGhh
cmR3YXJlJ3MgcG93ZXIgZGlzdHJpYnV0aW9uLgoKQWN0dWFsbHkgdGhlIG91dHB1dCBvZiBCdWNr
MSBhbmQgQnVjazIgYXJlIGNvbm5lY3RlZCB0b2dldGhlciwgc28gdGhleSAKc2hvdWxkIGFsd2F5
cyBiZSBjb25maWd1cmVkIHdpdGggdGhlIHNhbWUgb3V0cHV0IHZvbHRhZ2UuIEFuZCBib3RoIApj
bHVzdGVycyBzaG91bGQgYmUgbWFwcGVkIHRvIGJvdGggb3V0cHV0cy4KCkkgYWxzbyB3b25kZXIg
d2h5IGluIHRoZSBvcmlnaW5hbCBwYXRjaCB0aGUgYnVjazEgcmVndWxhdG9yIGlzIG5hbWVkIApi
dWNrMV8zdjQ1LCBmcm9tIHRoZSBzY2hlbWF0aWNzLCBpdCBzaG91bGQgcmF0aGVyIGJlIGNhbGxl
ZCBidWNrMV8wdjkuCgpSZWdhcmRzCkF1cmVsaWVuCgotLSAKQXVyZWxpZW4gSmFybm8gICAgICAg
ICAgICAgICAgICAgICAgICAgIEdQRzogNDA5NlIvMURERDhDOUIKYXVyZWxpZW5AYXVyZWwzMi5u
ZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
