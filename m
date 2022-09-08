Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F350FC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqQLhjR59XUwW6Bxg7Wv1jUWXsUxugZ9cDSpSiLa418=; b=uDY/yj3oirU01x
	5U6JUlAicIVU/LBoLA5zA3ZxYP1bodH1Iuag5DHrzWyrja3tZw9FGJvIRzfdIt8Wh7YuhA7Rc0+Q0
	RZepvm60v6/FEKkCzEg5IP4209d+fjfAVHD8tWfMz+OMxt2c/L2mwhtlRL5BDN2A2egOK0n4nkCbY
	4jGBQfq4WljEzg4G/FZk1RfuuXUE4AyZVG0DnmewQhj0r1i2gge88QIB2vRDefvanZ5/skhX+UXJJ
	caI/YKUKkTgQ0uUoCz395C0EKBf1zsnLA2otl//JyjbSuLz1T8Lmt/ejPi8qW0R21D5Ri4iC8vob3
	YMV2NvbUWM9aAQm9nMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLmy-006Uzb-23; Thu, 08 Sep 2022 17:58:08 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLmv-006UzB-54
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 17:58:06 +0000
Received: by mail-io1-xd29.google.com with SMTP id n202so14730385iod.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 10:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=cjQVYTniTqgzqfrukqi6hLPu3RboGT9wMH0OhsNDTfE=;
        b=fr5c+zMQuZ0mQMovmgq3PHP1JnZTfaSU9mjUYwzGH7oy4dTyWgAe+dTfj2MP2FnT4L
         CWV12bEEQSW6QWswhvBh550XxOmMEJna6QKHNx9dJSEZIT4MSXx8xk4nua/0jIWRuYmM
         BCp/4B4tB008tBwMoYVAf+3pg8brXbGNttVnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cjQVYTniTqgzqfrukqi6hLPu3RboGT9wMH0OhsNDTfE=;
        b=1Vggj0/1R1/nkjJ3liQYrFQxKmzq2qpycPvRLT7f0ggicqgDrzKsMT4uief9q+kWbu
         bnnSsmoNHNwS1tEx1HcZpesRSBbcQG5qqFudrhDj/RD0iD+zgijTPRE4EtwrwnuFdYWa
         WL0dbD01FjH+9iFtI6jsI5Ie0cKr994wGSE1zaluhiizV/k4SG7nX/tVvNoqJ+Itt8/8
         CqCNcKP8k8YGn2YfldQlTMCX+4YZana8iecMIZuZd/932K+DlWsYWQMyMPoTCMiKuSiI
         xxRCd1dUJvKCfTyZWtIzX1q+2PtlQgEk1nqLhBRUpAfCEoURYZvW+ryKj1fU63CYW5fx
         +j/Q==
X-Gm-Message-State: ACgBeo1LGNZVZUoT3k2uniQu6darWnGNs1j2ChKXT8nQKe0SzwMxqDwD
	Di9T4UOW3C0xwj9EhY581oEC5eRoqvs1skN28mlH
X-Google-Smtp-Source: AA6agR7vGjvvxAJMKb7n340i/6ko9v7w+lu0o5X+PKyqWMdVYFkln6VA5TTXdOUMj2A0R6D9qYWSBmXgqXUDn5Ch37Y=
X-Received: by 2002:a05:6638:2042:b0:34c:f22:25b3 with SMTP id
 t2-20020a056638204200b0034c0f2225b3mr5548311jaj.75.1662659883337; Thu, 08 Sep
 2022 10:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
 <20220908071157.ajjascv5ebhbwhv4@kamzik> <5505900.JsnAkG3lO3@diego>
 <426C27B0-F750-4CE4-B056-EA580C67046C@jrtc27.com> <20220908112210.kfaxzuwlxmmipkm2@kamzik>
In-Reply-To: <20220908112210.kfaxzuwlxmmipkm2@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 8 Sep 2022 10:57:52 -0700
Message-ID: <CAOnJCUL0GOh0sUQvDmhrfdJQ1c6rwMKZ4=MXT=JFpZH4nZn41w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_105805_329253_11DAFE8E 
X-CRM114-Status: GOOD (  41.14  )
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

T24gVGh1LCBTZXAgOCwgMjAyMiBhdCA0OjIyIEFNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMDgsIDIwMjIgYXQgMTE6NDg6MzFB
TSArMDEwMCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4gPiBPbiA4IFNlcHQgMjAyMiwgYXQgMDk6
MTAsIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBB
bSBEb25uZXJzdGFnLCA4LiBTZXB0ZW1iZXIgMjAyMiwgMDk6MTE6NTcgQ0VTVCBzY2hyaWViIEFu
ZHJldyBKb25lczoKPiA+ID4+IE9uIFdlZCwgU2VwIDA3LCAyMDIyIGF0IDAzOjQ3OjA5UE0gLTA3
MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPj4+IE9uIFR1ZSwgU2VwIDYsIDIwMjIgYXQgMTI6
NDUgQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4+PiB3cm90
ZToKPiA+ID4+Pgo+ID4gPj4+PiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPiA+ID4+Pj4KPiA+ID4+Pj4gVGhpcyBmaXhlcyB0d28gaXNzdWVzOiBJIHRydW5jYXRl
ZCB0aGUgd2FybmluZydzIGhhcnQgSUQgd2hlbiBwb3J0aW5nIHRvCj4gPiA+Pj4+IHRoZSA2NC1i
aXQgaGFydCBJRCBjb2RlLCBhbmQgdGhlIG9yaWdpbmFsIGNvZGUncyB3YXJuaW5nIGhhbmRsaW5n
IGNvdWxkCj4gPiA+Pj4+IGZpcmUgb24gYW4gdW5pbml0aWFsaXplZCBoYXJ0IElELgo+ID4gPj4+
Pgo+ID4gPj4+PiBUaGUgYmlnZ2VzdCBjaGFuZ2UgaGVyZSBpcyB0aGF0IHJpc2N2X2Nib21fYmxv
Y2tfc2l6ZSBpcyBubyBsb25nZXIKPiA+ID4+Pj4gaW5pdGlhbGl6ZWQsIGFzIElNTyB0aGUgZGVm
YXVsdCBpc24ndCBzYW5lOiB0aGVyZSdzIG5vdGhpbmcgaW4gdGhlIElTQQo+ID4gPj4+PiB0aGF0
IG1hbmRhdGVzIGFueSBzcGVjaWZpYyBjYWNoZSBibG9jayBzaXplLCBzbyBmYWxsaW5nIGJhY2sg
dG8gb25lIHdpbGwKPiA+ID4+Pj4ganVzdCBzaWxlbnRseSBwcm9kdWNlIHRoZSB3cm9uZyBhbnN3
ZXIgb24gc29tZSBzeXN0ZW1zLiBUaGlzIGFsc28KPiA+ID4+Pj4gY2hhbmdlcyB0aGUgcHJvYmlu
ZyBvcmRlciBzbyB0aGUgY2FjaGUgYmxvY2sgc2l6ZSBpcyBrbm93biBiZWZvcmUKPiA+ID4+Pj4g
ZW5hYmxpbmcgWmljYm9tIHN1cHBvcnQuCj4gPiA+Pj4+Cj4gPiA+Pj4+IEZpeGVzOiAzYWVmYjJl
ZTViZGQgKCJyaXNjdjogaW1wbGVtZW50IFppY2JvbS1iYXNlZCBDTU8gaW5zdHJ1Y3Rpb25zICsg
dGhlCj4gPiA+Pj4+IHQtaGVhZCB2YXJpYW50IikKPiA+ID4+Pj4gRml4ZXM6IDE2MzFiYTEyNTlk
NiAoInJpc2N2OiBBZGQgc3VwcG9ydCBmb3Igbm9uLWNvaGVyZW50IGRldmljZXMgdXNpbmcKPiA+
ID4+Pj4gemljYm9tIGV4dGVuc2lvbiIpCj4gPiA+Pj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiA+Pj4+IFJldmlld2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPj4+PiBbUmViYXNlZCBvbiBB
bnVwJ3MgbW92ZSBwYXRjaCBhbmQgYXBwbGllZCBDb25vciBEb29sZXkncyBhbmQgSGVpa28KPiA+
ID4+Pj4gU3R1ZWJuZXIncyBjaGFuZ2VzLl0KPiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4+Pj4gLS0tCj4gPiA+Pj4+IGFy
Y2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIHwgMSArCj4gPiA+Pj4+IGFyY2gvcmlzY3Yv
a2VybmVsL3NldHVwLmMgfCAyICstCj4gPiA+Pj4+IGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5j
IHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCj4gPiA+Pj4+IGFyY2gvcmlzY3YvbW0vZG1hLW5v
bmNvaGVyZW50LmMgfCAyICsrCj4gPiA+Pj4+IDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+ID4gPj4+PiBiL2FyY2gvcmlzY3YvZXJyYXRh
L3RoZWFkL2VycmF0YS5jCj4gPiA+Pj4+IGluZGV4IDIwMmM4M2Y2NzdiMi4uOTY2NDhjMTc2ZjM3
IDEwMDY0NAo+ID4gPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+
ID4gPj4+PiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+ID4gPj4+PiBA
QCAtMzcsNiArMzcsNyBAQCBzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfY21vKHVuc2lnbmVkIGlu
dCBzdGFnZSwKPiA+ID4+Pj4gaWYgKHN0YWdlID09IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9C
T09UKQo+ID4gPj4+PiByZXR1cm4gZmFsc2U7Cj4gPiA+Pj4+Cj4gPiA+Pj4+ICsgcmlzY3ZfY2Jv
bV9ibG9ja19zaXplID0gTDFfQ0FDSEVfQllURVM7Cj4gPiA+Pj4+IHJpc2N2X25vbmNvaGVyZW50
X3N1cHBvcnRlZCgpOwo+ID4gPj4+PiByZXR1cm4gdHJ1ZTsKPiA+ID4+Pj4gI2Vsc2UKPiA+ID4+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zZXR1cC5jCj4gPiA+Pj4+IGluZGV4IDk1ZWY2ZTJiZjQ1Yy4uMmRmYzQ2M2I4NmJiIDEw
MDY0NAo+ID4gPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPiA+Pj4+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+ID4+Pj4gQEAgLTI5Niw4ICsyOTYsOCBA
QCB2b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCj4gPiA+Pj4+IHNldHVw
X3NtcCgpOwo+ID4gPj4+PiAjZW5kaWYKPiA+ID4+Pj4KPiA+ID4+Pj4gLSByaXNjdl9maWxsX2h3
Y2FwKCk7Cj4gPiA+Pj4+IHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUoKTsKPiA+ID4+Pj4gKyBy
aXNjdl9maWxsX2h3Y2FwKCk7Cj4gPiA+Pj4+IGFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCk7Cj4g
PiA+Pj4+IH0KPiA+ID4+Pj4KPiA+ID4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY2Fj
aGVmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+ID4+Pj4gaW5kZXggMzM2
YzVkZWVhODcwLi5lNWIwODdiZTE1NzcgMTAwNjQ0Cj4gPiA+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yv
bW0vY2FjaGVmbHVzaC5jCj4gPiA+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5j
Cj4gPiA+Pj4+IEBAIC04OSwzOSArODksNDAgQEAgdm9pZCBmbHVzaF9pY2FjaGVfcHRlKHB0ZV90
IHB0ZSkKPiA+ID4+Pj4gfQo+ID4gPj4+PiAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+ID4gPj4+
Pgo+ID4gPj4+PiAtdW5zaWduZWQgaW50IHJpc2N2X2Nib21fYmxvY2tfc2l6ZSA9IEwxX0NBQ0hF
X0JZVEVTOwo+ID4gPj4+PiArdW5zaWduZWQgaW50IHJpc2N2X2Nib21fYmxvY2tfc2l6ZTsKPiA+
ID4+Pj4KPiA+ID4+Pj4gI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfWklDQk9NCj4gPiA+Pj4+IHZv
aWQgcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZSh2b2lkKQo+ID4gPj4+PiB7Cj4gPiA+Pj4+IHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsKPiA+ID4+Pj4gKyB1bnNpZ25lZCBsb25nIGNib21faGFy
dGlkOwo+ID4gPj4+PiArIHUzMiB2YWwsIHByb2JlZF9ibG9ja19zaXplOwo+ID4gPj4+PiBpbnQg
cmV0Owo+ID4gPj4+PiAtIHUzMiB2YWw7Cj4gPiA+Pj4+Cj4gPiA+Pj4+ICsgcHJvYmVkX2Jsb2Nr
X3NpemUgPSAwOwo+ID4gPj4+PiBmb3JfZWFjaF9vZl9jcHVfbm9kZShub2RlKSB7Cj4gPiA+Pj4+
IHVuc2lnbmVkIGxvbmcgaGFydGlkOwo+ID4gPj4+PiAtIGludCBjYm9tX2hhcnRpZDsKPiA+ID4+
Pj4KPiA+ID4+Pj4gcmV0ID0gcmlzY3Zfb2ZfcHJvY2Vzc29yX2hhcnRpZChub2RlLCAmaGFydGlk
KTsKPiA+ID4+Pj4gaWYgKHJldCkKPiA+ID4+Pj4gY29udGludWU7Cj4gPiA+Pj4+Cj4gPiA+Pj4+
IC0gaWYgKGhhcnRpZCA8IDApCj4gPiA+Pj4+IC0gY29udGludWU7Cj4gPiA+Pj4+IC0KPiA+ID4+
Pj4gLyogc2V0IGJsb2NrLXNpemUgZm9yIGNib20gZXh0ZW5zaW9uIGlmIGF2YWlsYWJsZSAqLwo+
ID4gPj4+PiByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmlzY3YsY2JvbS1ibG9j
ay1zaXplIiwKPiA+ID4+Pj4gJnZhbCk7Cj4gPiA+Pj4+IGlmIChyZXQpCj4gPiA+Pj4+IGNvbnRp
bnVlOwo+ID4gPj4+Pgo+ID4gPj4+PiAtIGlmICghcmlzY3ZfY2JvbV9ibG9ja19zaXplKSB7Cj4g
PiA+Pj4+IC0gcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gdmFsOwo+ID4gPj4+PiArIGlmICghcHJv
YmVkX2Jsb2NrX3NpemUpIHsKPiA+ID4+Pj4gKyBwcm9iZWRfYmxvY2tfc2l6ZSA9IHZhbDsKPiA+
ID4+Pj4gY2JvbV9oYXJ0aWQgPSBoYXJ0aWQ7Cj4gPiA+Pj4+IH0gZWxzZSB7Cj4gPiA+Pj4+IC0g
aWYgKHJpc2N2X2Nib21fYmxvY2tfc2l6ZSAhPSB2YWwpCj4gPiA+Pj4+IC0gcHJfd2FybigiY2Jv
bS1ibG9jay1zaXplIG1pc21hdGNoZWQKPiA+ID4+Pj4gYmV0d2VlbiBoYXJ0cyAlZCBhbmQgJWx1
XG4iLAo+ID4gPj4+PiArIGlmIChwcm9iZWRfYmxvY2tfc2l6ZSAhPSB2YWwpCj4gPiA+Pj4+ICsg
cHJfd2FybigiY2JvbS1ibG9jay1zaXplIG1pc21hdGNoZWQKPiA+ID4+Pj4gYmV0d2VlbiBoYXJ0
cyAlbHUgYW5kICVsdVxuIiwKPiA+ID4+Pj4gY2JvbV9oYXJ0aWQsIGhhcnRpZCk7Cj4gPiA+Pj4+
Cj4gPiA+Pj4KPiA+ID4+PiBNYXliZSBhZGQgbW9yZSBpbmZvIHNheWluZyB0aGUgZmlyc3Qgb25l
IHdpbGwgYmUgc2VsZWN0ZWQgaW4gdGhhdCBjYXNlIGFzCj4gPiA+Pj4gaXQgaXMganVzdCBhIHdh
cm5pbmcuCj4gPiA+Pgo+ID4gPj4gSWYgd2UgZGV0ZWN0IGEgbWlzbWF0Y2ggdGhlbiBzaG91bGQg
d2UgZGlzYWJsZSB0aGUgQ01PIGV4dGVuc2lvbj8KPiA+ID4KPiA+ID4gRnJvbSBhIHVzZXIncyBw
b3YgSSdkIHRoaW5rIHRoZWlyIHN5c3RlbSBtaWdodCBzdG9wIHdvcmtpbmcgd2l0aCBkaXNhYmxl
ZAo+ID4gPiBjbW8gLSBmb3IgdGhpbmdzIGxpa2UgbmV0d29ya2luZyAvIG1hc3Mgc3RvcmFnZSBv
ciBzby4KPiA+ID4KPiA+ID4gQWxzbyB0aGUgYW1vdW50IG9mIG1pc2JlaGF2aW91ciBtaWdodCBk
ZXBlbmQgb24gd2VhdGhlciB0aGUgdmFsdWUgaXMKPiA+ID4gc2hyaW5raW5nIG9yIGV4cGFuZGlu
Zy4KPiA+ID4KPiA+ID4gR29pbmcgZnJvbSBibG9ja19zaXplIHggLT4geC8yIHdpbGwgImp1c3Qi
IHJlc3VsdCBpbiBzb21lIGFyZWFzIGJlaW5nCj4gPiA+IGhhbmRsZWQgdHdpY2UsIHdoZXJlIGdv
aW5nIGZyb20geCAtPiAyeCB3aWxsIGxlYXZlIG91dCBzb21lIGFyZWFzLAo+ID4gPiB3aGVuIHRo
ZSBjcHUgaXRzZWxmIHN0aWxsIGp1c3QgZG9lcyAieCIgLgo+ID4gPgo+ID4gPgo+ID4gPiBBbiBl
eHBlcmltZW50IG9uIHRoZSBEMSBzdXBwb3J0cyB0aGF0IHRob3VnaHQgOy0pCj4gPiA+IHdpdGgg
TDFfQ0FDSEVfQllURVMgLyAyLCBuZXR3b3JraW5nIGtlZXBzIHdvcmtpbmcKPiA+ID4gd2l0aCBM
MV9DQUNIRV9CWVRFUyAqIDIgKHBsdXMgYWRhcHRpbmcgTUlOQUxJR04pIGJyZWFrcyBuZXR3b3Jr
aW5nLgo+ID4gPgo+ID4gPgo+ID4gPiBTbyBJJ2QgdGhpbmssIHdlIHNob3VsZCBsb3VkbHkgd2Fy
biBhYm91dCBtaXNjb25maWd1cmF0aW9uIGFueXdheSwKPiA+ID4gYnV0IGNvdWxkIGp1c3QgdXNl
IHRoZSBzbWFsbGVzdCB2YWx1ZSBhcyBibG9ja19zaXplIChpbiBhIGZ1dHVyZSBwYXRjaCkKPiA+
ID4gdG8ga2VlcCB0aGUgbW9zdCBhbW91bnRzIG9mIHN5c3RlbXMgcnVubmluZyBpbiBzdWNoIGEg
Y2FzZS4KPiA+Cj4gPiBZb3UgbmVlZCB0byB1c2UgdGhlIHNtYWxsZXN0IHNpemUgZm9yIHlvdXIg
c3RyaWRlIGluIFppY2JvbSBpbnN0cnVjdGlvbgo+ID4gbG9vcHMsIGJ1dCB0aGUgbGFyZ2VzdCBz
aXplIGFzIHlvdXIgYWxpZ25tZW50IGFuZCBwYWRkaW5nIGdyYW51bGFyaXR5Cj4gPiBmb3IgYWxs
b2NhdGlvbnMsIG90aGVyd2lzZSB5b3XigJlsbCBoYXZlIGNhY2hlIGxpbmUgYWxpYXNpbmcgb24g
c29tZSBvZgo+ID4gdGhlIGNvcmVzIGFuZCBoYXZlIGNvcnJlY3RuZXNzIGlzc3VlcyAoaW52YWxp
ZGF0aW5nIHRoaW5ncyBvdXRzaWRlIHlvdXIKPiA+IGFsbG9jYXRpb24gaXMgdGhlIG9idmlvdXMg
cHJvYmxlbSwgYnV0IG90aGVyIGFsbG9jYXRpb25zIHB1bGxpbmcgaW4KPiA+IGNhY2hlIGxpbmVz
IHlvdeKAmXZlIGp1c3QgZmx1c2hlZCBpcyBhbHNvIGEgcHJvYmxlbSkuCj4gPgo+Cj4gVGhpcyBz
b3VuZHMgbGlrZSBhIGdvb2QgYXJndW1lbnQgdG8gbWUgdG8ganVzdCBCVUcgb24gYSBEVCB3aXRo
Cj4gbWlzbWF0Y2hlcywgZm9yY2luZyB0aGUgRFQgdG8gZ2V0IGZpeGVkLgo+CgpZZWFoLiBUaGF0
J3MgZXZlbiBiZXR0ZXIgOikuCgo+IFRoYW5rcywKPiBkcmV3CgoKCi0tIApSZWdhcmRzLApBdGlz
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
