Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33710C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ommJcvu7ZWyk4p8svsZu4E9ivHoHA/nTOx4TjR92mPM=; b=NyqFQobaLAf7A4
	o/BWiQRm1sVrpZs3twKKi1AuEL5PP/4hlTGVAMQrAzKvZTmz1VnSo9q8R736I5YBatMtiwFFWaIs2
	rrj+C6zp/OMeB6Fprb9zNpcw1e51LaWcriY/vUHVKmpVeGJ6rX2AyHbqUjb5gRwgccUPPSoc6K0DP
	nHGHNHeTV8dyUFifzO8I7dRPSHoJmDXvfxiEAtIYdQ+KvwRsa0WrS8nHnaTgqYOO0dzWthBSVOe4H
	g4f6RrTVF8YWsHWkQpBdsFehe503Iiy4AuTv1EJDoTOs9Z1P1/5SVMkqodX2035fpJ7FPKBcOB5qi
	zDjd7eDaiXv6JKKfRQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaKR-001aeT-VZ; Tue, 07 Mar 2023 16:38:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaKN-001abM-Du
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 16:38:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id k37so8236008wms.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 08:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678207094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZZguwSSEPzBsonH3p0dNEDuIQs3YTv/Y0IWmQeMQCs=;
        b=w0olMT+4m3Hv3vfB4gX7ikHWrlZVvK+YS9ZnUaBoATd+vQDR6vMRTW7k9BrhtgUMGS
         bPXYrHNuK46Qo/YCfUG4jB/Lw5v6izJ0MHyIFjkWDfP2S3VU0Oxz9W31zmSq/72nfFY/
         9YjC26LM5FbeoL8qSoWPEHXLtmeDcQRlWSRhEJNE5f/Q+SSSdNSEOF6NLcjm57/6kmrD
         TbnCvJVTe14mKh1cZNRTD5qJvTIDUQ4CYCr2SCCQbRmhZLvjMX8sFGvhRISaqwfXBa3i
         ITBYw1FoVe5Qs2FTvHcpcNlpIC8UlhtqYe9m4710aWSAXAjQ6dVVWvw0UJvQeF5RCbZ+
         37Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZZguwSSEPzBsonH3p0dNEDuIQs3YTv/Y0IWmQeMQCs=;
        b=H0kB3p0QZci9u0/yIJ2uPHOQws8Wx8qCC/iDKyJ5YJD0srzQN1h0tN9ybTmT2BfJhJ
         xCPIGQNvRf9L99D54bJYPD+nnIvr9+oNgsv5Yt+cxFiLlHhf8pLK+5qIvLd7AKL3fpMh
         RRCF0oTbQsGFtEAgOPyA6V7BMMxDI1GXHtZkvpP22WN7a03NXh/zDkD4JFU03u7w074L
         7dJ/Mby18jXWzDjbRjKbYzXkwEf1VpEOlfdT5JqUWuzjpsI9DjK77qkhDyR2q/b3wSAD
         twcFyDIwQz+XuU0CEl8XVc5xKCHWfYpO6kPteYr5OvBNVfXabH8nqlrPq+DtOgQ6DZSu
         +4dw==
X-Gm-Message-State: AO0yUKUaFOz26eJfvAyUfkTOBSG9gezJ1NUcw/DA9a2lSRQlJdUGQnll
	41AxemO/iBwYMEPGDNITzXs8rLVfp5lDb9hnqGSQLw==
X-Google-Smtp-Source: AK7set+G4B9uony8qATKSxd7z0X+ALRQtArGSoIZNv+Rn+3CjCVlP2RhZxCNT5vQQdYnnkE4L6yRaf8TBKfYpAm+ryk=
X-Received: by 2002:a05:600c:688:b0:3e1:eaca:db25 with SMTP id
 a8-20020a05600c068800b003e1eacadb25mr3251051wmn.6.1678207094028; Tue, 07 Mar
 2023 08:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20230301082552.274331-1-alexghiti@rivosinc.com>
 <CAK9=C2XAOKbyrbOnDP1GzW1VyO-f-V-oEVcp+PhGHeHKFh4C6A@mail.gmail.com>
 <CAHVXubj9sCEuANsVe0N7YRMg8OPx_eALZfy0vERKU9P6QUDM0Q@mail.gmail.com>
 <CAK9=C2XDkgZuaxO1fOWCxyCsGgiD=B_O4DmuAPwEhC65Mck9eA@mail.gmail.com> <CAHVXubg6dgr9dM1-mR+xh6D+5cmistWmo2dJQaZavcWGcCshag@mail.gmail.com>
In-Reply-To: <CAHVXubg6dgr9dM1-mR+xh6D+5cmistWmo2dJQaZavcWGcCshag@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 7 Mar 2023 17:38:02 +0100
Message-ID: <CAHVXubhRtDRwm3AQAio6cUJ5vRxDbLerc0ys7H0dgpzx01iCpQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_083815_727861_57D2C5EA 
X-CRM114-Status: GOOD (  26.71  )
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAyOjM24oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFyIDcsIDIwMjMgYXQgMjoxOeKA
r1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBBbGV4LAo+ID4KPiA+IE9uIFR1ZSwgTWFyIDcsIDIwMjMgYXQgMTI6MjLigK9BTSBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBB
bnVwLAo+ID4gPgo+ID4gPiBPbiBNb24sIE1hciA2LCAyMDIzIGF0IDU6MzPigK9QTSBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBX
ZWQsIE1hciAxLCAyMDIzIGF0IDE6NTbigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUBy
aXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgcGF0Y2hzZXQgaW50
ZW5kcyB0byBpbXByb3ZlIHRsYiB1dGlsaXphdGlvbiBieSB1c2luZyBodWdlcGFnZXMgZm9yCj4g
PiA+ID4gPiB0aGUgbGluZWFyIG1hcHBpbmcuCj4gPiA+ID4gPgo+ID4gPiA+ID4gYmFzZS1jb21t
aXQtdGFnOiB2Ni4yLXJjNwo+ID4gPiA+ID4KPiA+ID4gPiA+IHY2Ogo+ID4gPiA+ID4gLSBxdWll
dCBMTFZNIHdhcm5pbmcgYnkgY2FzdGluZyBwaHlzX3JhbV9iYXNlIGludG8gYW4gdW5zaWduZWQg
bG9uZwo+ID4gPiA+ID4KPiA+ID4gPiA+IHY1Ogo+ID4gPiA+ID4gLSBGaXggbm9tbXUgYnVpbGRz
IGJ5IGdldHRpbmcgcmlkIG9mIHJpc2N2X3Bmbl9iYXNlIGluIHBhdGNoIDEsIHRoYW5rcwo+ID4g
PiA+ID4gICBDb25vcgo+ID4gPiA+ID4gLSBBZGQgUkIgZnJvbSBBbmRyZXcKPiA+ID4gPiA+Cj4g
PiA+ID4gPiB2NDoKPiA+ID4gPiA+IC0gUmViYXNlIG9uIHRvcCBvZiB2Ni4yLXJjMywgYXMgbm90
ZWQgYnkgQ29ub3IKPiA+ID4gPiA+IC0gQWRkIEFja2VkLWJ5IFJvYgo+ID4gPiA+ID4KPiA+ID4g
PiA+IHYzOgo+ID4gPiA+ID4gLSBDaGFuZ2UgdGhlIGNvbW1lbnQgYWJvdXQgaW5pdHJkX3N0YXJ0
IFZBIGNvbnZlcnNpb24gc28gdGhhdCBpdCBmaXRzCj4gPiA+ID4gPiAgIEFSTTY0IGFuZCBSSVND
VjY0IChhbmQgb3RoZXJzIGluIHRoZSBmdXR1cmUgaWYgbmVlZGVkKSwgYXMgc3VnZ2VzdGVkCj4g
PiA+ID4gPiAgIGJ5IFJvYgo+ID4gPiA+ID4KPiA+ID4gPiA+IHYyOgo+ID4gPiA+ID4gLSBBZGQg
YSBjb21tZW50IG9uIHdoeSBSSVNDVjY0IGRvZXMgbm90IG5lZWQgdG8gc2V0IGluaXRyZF9zdGFy
dC9lbmQgdGhhdAo+ID4gPiA+ID4gICBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzLCBhcyBhc2tl
ZCBieSBSb2IKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbGV4YW5kcmUgR2hpdGkgKDIpOgo+ID4gPiA+
ID4gICByaXNjdjogR2V0IHJpZCBvZiByaXNjdl9wZm5fYmFzZSB2YXJpYWJsZQo+ID4gPiA+ID4g
ICByaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmcKPiA+
ID4gPgo+ID4gPiA+IEkgdHJpZWQgdGhpcyBzZXJpZXMgYnV0IGl0IGlzIGdldHRpbmcgc3R1Y2sg
YWZ0ZXIgcmVhY2hpbmcgdXNlciBzcGFjZS4KPiA+ID4gPgo+ID4gPiA+IERvZXMgdGhpcyBzZXJp
ZXMgcmVxdWlyZSBzb21lIG90aGVyIGRlcGVuZGVudCBwYXRjaGVzID8KPiA+ID4KPiA+ID4gTm8g
aXQgc2hvdWxkIG5vdC4gTGV0IG1lIHRha2UgYSBsb29rOiB3aGF0J3MgeW91ciBjb25maWcgYW5k
IHRoZSBiYXNlIGNvbW1pdD8KPiA+Cj4gPiBQbGVhc2UgdHJ5IHRoZSBhbGV4Z2hpdGlfdGVzdCBi
cmFuY2ggYXQ6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPiA+Cj4g
PiBDb21waWxlIHRoZSBrZXJuZWwgd2l0aCBkZWZjb25maWcgYW5kIGxhdW5jaCBRRU1VIGFzIGZv
bGxvd3M6Cj4gPiBxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQgLW0gMUcgLW5vZ3JhcGhpYyAt
Ymlvcwo+ID4gb3BlbnNiaS9idWlsZC9wbGF0Zm9ybS9nZW5lcmljL2Zpcm13YXJlL2Z3X2p1bXAu
YmluIC1rZXJuZWwKPiA+IC4vYnVpbGQtcmlzY3Y2NC9hcmNoL3Jpc2N2L2Jvb3QvSW1hZ2UgLWFw
cGVuZCAicm9vdD0vZGV2L3JhbSBydwo+ID4gY29uc29sZT10dHlTMCBlYXJseWNvbiIgLWluaXRy
ZCAuL3Jvb3Rmc19yaXNjdjY0LmltZwo+ID4KPiA+IEluIHRoZSBhYm92ZSBjb21tYW5kLCByb290
ZnNfcmlzY3Y2NC5pbWcgaXMgYSBidXN5Ym94IGJhc2VkIHJvb3Rmcy4KPgo+IE9rIEkgY2FuIHJl
cHJvZHVjZSB0aGUgcHJvYmxlbS4gSSdsbCBkZWJ1ZyB0aGF0IGEgYml0IGZ1cnRoZXIgYnV0Cj4g
aW5jcmVhc2luZyBtZW1vcnkgYWxsb3dzIGJvb3RpbmcgdG8gdXNlcnNwYWNlLgo+CgpUaGlzIGlz
IGEgcmVhbCBidWcgYW5kIHRoYXQncyBiZWNhdXNlIEkgc2hvdWxkIHNwbGl0IHRoZSAxRyBwYWdl
IHRoYXQKY29udGFpbnMgdGhlIGtlcm5lbCB0ZXh0IGFsaWFzIChhbmQgYW55dGhpbmcgdGhhdCB3
ZSBtYXAgd2l0aCBzdHJpY3RlcgpyaWdodHMpIG9yIHNvbWV0aGluZyBzaW1pbGFyLiBJJ2xsIGdl
dCBiYWNrIHNvb24gd2l0aCBhIGZpeC4KClRoYW5rcyBBbnVwIGZvciB0aGUgcmVwb3J0LAoKQWxl
eAoKPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFJl
Z2FyZHMsCj4gPiA+ID4gQW51cAo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGFnZS5oIHwgMTkgKysrKysrKysrKysrKysrKystLQo+ID4gPiA+ID4g
IGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLQo+ID4gPiA+ID4gIGFyY2gvcmlzY3YvbW0vcGh5c2FkZHIuYyAgICAgIHwgMTYgKysr
KysrKysrKysrKysrKwo+ID4gPiA+ID4gIGRyaXZlcnMvb2YvZmR0LmMgICAgICAgICAgICAgIHwg
MTEgKysrKysrLS0tLS0KPiA+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMo
KyksIDE3IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAyLjM3
LjIKPiA+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
