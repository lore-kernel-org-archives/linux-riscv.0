Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B14C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1QbRySmNHFDVYqsGwqtwYTiwMyQna7MLGsLrIKYBLU=; b=3aroyHFrDqYExh
	PLDPJ4ah6KalvzzkN4cHaACpQ5cNc0BjcBW2erLV1jFBjleWvWz5pUPlYU/8Hl9eDbJPr8q78XIMl
	K201cBXkaIoXhswm9UmScGEt9bDaPcOsQJf9SZyUacpwKfiqbxXrKWQIENipEhnJ4vgudzORHgNNW
	GtpRtVZUPJXP2NaPCr0ZExq/eKBhfZu6cxbl/zGJZ1zS0BcfznwbYDfluyf19SbyjhoVdhR9FZM1O
	f1nFWXILFUYMsCjuy2kcox7HBhGT6qrVVp6DMufQn7EFhb+US/c0Pi6N2XEg6kSdABujE0yLuWDwW
	TLIV97XlZqlFde0V76uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWF5O-002QJc-N0; Thu, 08 Sep 2022 10:48:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWF5K-002QGW-ID
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 10:48:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id b17so12012819wrq.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=U+0748e6wTbqO9qdFdpd0H2rAEV4r4P6F3Sv0T6tcZw=;
        b=ZTG/Gg9tg0/V+1dHJy/DygifeV2i2RLsnLc6KvmaNez2ju2gLyRjNymO8TNu6AaOiT
         0cPvG8Zu8UGQm2gHugSX2vh43ldra6YruXJoX3+r5P2p++Z4qZ9VPGNWXQYfCG/H4Shr
         m21rLDPsfUxoMHk6t0RCmHXNrfNTAUaWMBRtuvW5S9nQzeTwVfnxO30ZsacDEqY2zMcx
         qMMUeHmz9AHNtpLXphnnBf2UVRtm6WJul8DGvao7Fd9tldkVJ9ScA24Bg39S1c31I6GA
         wvmy2yMGggJfSKx0liMhi7oCnfpBM2JKZEL9dDHGzjFsmVEjyMRLeZ7RhAfTWm6+IDqF
         j7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U+0748e6wTbqO9qdFdpd0H2rAEV4r4P6F3Sv0T6tcZw=;
        b=vWC7BvfuAzOavLHN2m/R36rD1JA4gRSlUZjn+iE//vnkX2IdxtVMT8RDzU0sxGsgft
         3EGOdck5ql0RNvRbJuOZIMxKb3lz+E9NR+5BOIZuIqCHxFVvaucHHH74xFBIrUf8dIV/
         Qd1gqEtoan/leTBBArP+hGvlDU16VMJFwJ2VLC15utF2oNLk7qn3d8EGXcVcSxmlgSHq
         fSTTVCRuB1LjpLgUuCmH63KEpbw+FYLpLq7Z0Ht6riZub7NCjGZaqMJrI0o0Dffd0cQy
         yOHc/JLwKz24HQepK5Rgeb3j4szdtDjHt0cSpvqe3Nc94MloVhoosicoUI9Dya4tf3Kh
         w8Bw==
X-Gm-Message-State: ACgBeo0Kwro+gB4G8ePC2Hab8osu8K8TT4HmhmaEbV4o8Lb7FZYXcEiP
	H1ywDOud1/Bpazh/dZm4gvzXQA==
X-Google-Smtp-Source: AA6agR6HJpIu+lW7FT+qpfS6Ie+qY69wQ87pTWQp67tTm5zkQsBkRipoVKoYB7ahpeMMm+AaOG764Q==
X-Received: by 2002:a5d:4150:0:b0:228:dbc4:d26b with SMTP id c16-20020a5d4150000000b00228dbc4d26bmr4747540wrq.254.1662634113318;
        Thu, 08 Sep 2022 03:48:33 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id h41-20020a05600c49a900b003a604a29a34sm2168456wmp.35.2022.09.08.03.48.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Sep 2022 03:48:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <5505900.JsnAkG3lO3@diego>
Date: Thu, 8 Sep 2022 11:48:31 +0100
Cc: Atish Patra <atishp@atishpatra.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Anup Patel <anup@brainfault.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>
Message-Id: <426C27B0-F750-4CE4-B056-EA580C67046C@jrtc27.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
 <20220908071157.ajjascv5ebhbwhv4@kamzik> <5505900.JsnAkG3lO3@diego>
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_034838_744092_139508E6 
X-CRM114-Status: GOOD (  25.83  )
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

T24gOCBTZXB0IDIwMjIsIGF0IDA5OjEwLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRl
PiB3cm90ZToKPiAKPiBBbSBEb25uZXJzdGFnLCA4LiBTZXB0ZW1iZXIgMjAyMiwgMDk6MTE6NTcg
Q0VTVCBzY2hyaWViIEFuZHJldyBKb25lczoKPj4gT24gV2VkLCBTZXAgMDcsIDIwMjIgYXQgMDM6
NDc6MDlQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+PiBPbiBUdWUsIFNlcCA2LCAyMDIy
IGF0IDEyOjQ1IEFNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4+PiB3
cm90ZToKPj4+IAo+Pj4+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pgo+Pj4+IAo+Pj4+IFRoaXMgZml4ZXMgdHdvIGlzc3VlczogSSB0cnVuY2F0ZWQgdGhlIHdhcm5p
bmcncyBoYXJ0IElEIHdoZW4gcG9ydGluZyB0bwo+Pj4+IHRoZSA2NC1iaXQgaGFydCBJRCBjb2Rl
LCBhbmQgdGhlIG9yaWdpbmFsIGNvZGUncyB3YXJuaW5nIGhhbmRsaW5nIGNvdWxkCj4+Pj4gZmly
ZSBvbiBhbiB1bmluaXRpYWxpemVkIGhhcnQgSUQuCj4+Pj4gCj4+Pj4gVGhlIGJpZ2dlc3QgY2hh
bmdlIGhlcmUgaXMgdGhhdCByaXNjdl9jYm9tX2Jsb2NrX3NpemUgaXMgbm8gbG9uZ2VyCj4+Pj4g
aW5pdGlhbGl6ZWQsIGFzIElNTyB0aGUgZGVmYXVsdCBpc24ndCBzYW5lOiB0aGVyZSdzIG5vdGhp
bmcgaW4gdGhlIElTQQo+Pj4+IHRoYXQgbWFuZGF0ZXMgYW55IHNwZWNpZmljIGNhY2hlIGJsb2Nr
IHNpemUsIHNvIGZhbGxpbmcgYmFjayB0byBvbmUgd2lsbAo+Pj4+IGp1c3Qgc2lsZW50bHkgcHJv
ZHVjZSB0aGUgd3JvbmcgYW5zd2VyIG9uIHNvbWUgc3lzdGVtcy4gVGhpcyBhbHNvCj4+Pj4gY2hh
bmdlcyB0aGUgcHJvYmluZyBvcmRlciBzbyB0aGUgY2FjaGUgYmxvY2sgc2l6ZSBpcyBrbm93biBi
ZWZvcmUKPj4+PiBlbmFibGluZyBaaWNib20gc3VwcG9ydC4KPj4+PiAKPj4+PiBGaXhlczogM2Fl
ZmIyZWU1YmRkICgicmlzY3Y6IGltcGxlbWVudCBaaWNib20tYmFzZWQgQ01PIGluc3RydWN0aW9u
cyArIHRoZQo+Pj4+IHQtaGVhZCB2YXJpYW50IikKPj4+PiBGaXhlczogMTYzMWJhMTI1OWQ2ICgi
cmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBub24tY29oZXJlbnQgZGV2aWNlcyB1c2luZwo+Pj4+IHpp
Y2JvbSBleHRlbnNpb24iKQo+Pj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJp
dm9zaW5jLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPj4+PiBbUmViYXNlZCBvbiBBbnVwJ3MgbW92ZSBwYXRjaCBhbmQgYXBw
bGllZCBDb25vciBEb29sZXkncyBhbmQgSGVpa28KPj4+PiBTdHVlYm5lcidzIGNoYW5nZXMuXQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4+Pj4gLS0tCj4+Pj4gYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgfCAxICsKPj4+
PiBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgMiArLQo+Pj4+IGFyY2gvcmlzY3YvbW0vY2Fj
aGVmbHVzaC5jIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCj4+Pj4gYXJjaC9yaXNjdi9tbS9k
bWEtbm9uY29oZXJlbnQuYyB8IDIgKysKPj4+PiA0IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+Pj4+IGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmMKPj4+PiBpbmRleCAyMDJjODNmNjc3YjIuLjk2NjQ4YzE3NmYzNyAxMDA2NDQKPj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+Pj4+ICsrKyBiL2FyY2gvcmlz
Y3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4+Pj4gQEAgLTM3LDYgKzM3LDcgQEAgc3RhdGljIGJv
b2wgZXJyYXRhX3Byb2JlX2Ntbyh1bnNpZ25lZCBpbnQgc3RhZ2UsCj4+Pj4gaWYgKHN0YWdlID09
IFJJU0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09UKQo+Pj4+IHJldHVybiBmYWxzZTsKPj4+PiAK
Pj4+PiArIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSA9IEwxX0NBQ0hFX0JZVEVTOwo+Pj4+IHJpc2N2
X25vbmNvaGVyZW50X3N1cHBvcnRlZCgpOwo+Pj4+IHJldHVybiB0cnVlOwo+Pj4+ICNlbHNlCj4+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zZXR1cC5jCj4+Pj4gaW5kZXggOTVlZjZlMmJmNDVjLi4yZGZjNDYzYjg2YmIgMTAwNjQ0
Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3NldHVwLmMKPj4+PiBAQCAtMjk2LDggKzI5Niw4IEBAIHZvaWQgX19pbml0IHNl
dHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKPj4+PiBzZXR1cF9zbXAoKTsKPj4+PiAjZW5kaWYK
Pj4+PiAKPj4+PiAtIHJpc2N2X2ZpbGxfaHdjYXAoKTsKPj4+PiByaXNjdl9pbml0X2Nib21fYmxv
Y2tzaXplKCk7Cj4+Pj4gKyByaXNjdl9maWxsX2h3Y2FwKCk7Cj4+Pj4gYXBwbHlfYm9vdF9hbHRl
cm5hdGl2ZXMoKTsKPj4+PiB9Cj4+Pj4gCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0v
Y2FjaGVmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPj4+PiBpbmRleCAzMzZj
NWRlZWE4NzAuLmU1YjA4N2JlMTU3NyAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2Nh
Y2hlZmx1c2guYwo+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4+Pj4gQEAg
LTg5LDM5ICs4OSw0MCBAQCB2b2lkIGZsdXNoX2ljYWNoZV9wdGUocHRlX3QgcHRlKQo+Pj4+IH0K
Pj4+PiAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+Pj4+IAo+Pj4+IC11bnNpZ25lZCBpbnQgcmlz
Y3ZfY2JvbV9ibG9ja19zaXplID0gTDFfQ0FDSEVfQllURVM7Cj4+Pj4gK3Vuc2lnbmVkIGludCBy
aXNjdl9jYm9tX2Jsb2NrX3NpemU7Cj4+Pj4gCj4+Pj4gI2lmZGVmIENPTkZJR19SSVNDVl9JU0Ff
WklDQk9NCj4+Pj4gdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKHZvaWQpCj4+Pj4gewo+
Pj4+IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsKPj4+PiArIHVuc2lnbmVkIGxvbmcgY2JvbV9o
YXJ0aWQ7Cj4+Pj4gKyB1MzIgdmFsLCBwcm9iZWRfYmxvY2tfc2l6ZTsKPj4+PiBpbnQgcmV0Owo+
Pj4+IC0gdTMyIHZhbDsKPj4+PiAKPj4+PiArIHByb2JlZF9ibG9ja19zaXplID0gMDsKPj4+PiBm
b3JfZWFjaF9vZl9jcHVfbm9kZShub2RlKSB7Cj4+Pj4gdW5zaWduZWQgbG9uZyBoYXJ0aWQ7Cj4+
Pj4gLSBpbnQgY2JvbV9oYXJ0aWQ7Cj4+Pj4gCj4+Pj4gcmV0ID0gcmlzY3Zfb2ZfcHJvY2Vzc29y
X2hhcnRpZChub2RlLCAmaGFydGlkKTsKPj4+PiBpZiAocmV0KQo+Pj4+IGNvbnRpbnVlOwo+Pj4+
IAo+Pj4+IC0gaWYgKGhhcnRpZCA8IDApCj4+Pj4gLSBjb250aW51ZTsKPj4+PiAtCj4+Pj4gLyog
c2V0IGJsb2NrLXNpemUgZm9yIGNib20gZXh0ZW5zaW9uIGlmIGF2YWlsYWJsZSAqLwo+Pj4+IHJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJyaXNjdixjYm9tLWJsb2NrLXNpemUiLAo+
Pj4+ICZ2YWwpOwo+Pj4+IGlmIChyZXQpCj4+Pj4gY29udGludWU7Cj4+Pj4gCj4+Pj4gLSBpZiAo
IXJpc2N2X2Nib21fYmxvY2tfc2l6ZSkgewo+Pj4+IC0gcmlzY3ZfY2JvbV9ibG9ja19zaXplID0g
dmFsOwo+Pj4+ICsgaWYgKCFwcm9iZWRfYmxvY2tfc2l6ZSkgewo+Pj4+ICsgcHJvYmVkX2Jsb2Nr
X3NpemUgPSB2YWw7Cj4+Pj4gY2JvbV9oYXJ0aWQgPSBoYXJ0aWQ7Cj4+Pj4gfSBlbHNlIHsKPj4+
PiAtIGlmIChyaXNjdl9jYm9tX2Jsb2NrX3NpemUgIT0gdmFsKQo+Pj4+IC0gcHJfd2FybigiY2Jv
bS1ibG9jay1zaXplIG1pc21hdGNoZWQKPj4+PiBiZXR3ZWVuIGhhcnRzICVkIGFuZCAlbHVcbiIs
Cj4+Pj4gKyBpZiAocHJvYmVkX2Jsb2NrX3NpemUgIT0gdmFsKQo+Pj4+ICsgcHJfd2FybigiY2Jv
bS1ibG9jay1zaXplIG1pc21hdGNoZWQKPj4+PiBiZXR3ZWVuIGhhcnRzICVsdSBhbmQgJWx1XG4i
LAo+Pj4+IGNib21faGFydGlkLCBoYXJ0aWQpOwo+Pj4+IAo+Pj4gCj4+PiBNYXliZSBhZGQgbW9y
ZSBpbmZvIHNheWluZyB0aGUgZmlyc3Qgb25lIHdpbGwgYmUgc2VsZWN0ZWQgaW4gdGhhdCBjYXNl
IGFzCj4+PiBpdCBpcyBqdXN0IGEgd2FybmluZy4KPj4gCj4+IElmIHdlIGRldGVjdCBhIG1pc21h
dGNoIHRoZW4gc2hvdWxkIHdlIGRpc2FibGUgdGhlIENNTyBleHRlbnNpb24/Cj4gCj4gRnJvbSBh
IHVzZXIncyBwb3YgSSdkIHRoaW5rIHRoZWlyIHN5c3RlbSBtaWdodCBzdG9wIHdvcmtpbmcgd2l0
aCBkaXNhYmxlZAo+IGNtbyAtIGZvciB0aGluZ3MgbGlrZSBuZXR3b3JraW5nIC8gbWFzcyBzdG9y
YWdlIG9yIHNvLgo+IAo+IEFsc28gdGhlIGFtb3VudCBvZiBtaXNiZWhhdmlvdXIgbWlnaHQgZGVw
ZW5kIG9uIHdlYXRoZXIgdGhlIHZhbHVlIGlzCj4gc2hyaW5raW5nIG9yIGV4cGFuZGluZy4KPiAK
PiBHb2luZyBmcm9tIGJsb2NrX3NpemUgeCAtPiB4LzIgd2lsbCAianVzdCIgcmVzdWx0IGluIHNv
bWUgYXJlYXMgYmVpbmcKPiBoYW5kbGVkIHR3aWNlLCB3aGVyZSBnb2luZyBmcm9tIHggLT4gMngg
d2lsbCBsZWF2ZSBvdXQgc29tZSBhcmVhcywKPiB3aGVuIHRoZSBjcHUgaXRzZWxmIHN0aWxsIGp1
c3QgZG9lcyAieCIgLgo+IAo+IAo+IEFuIGV4cGVyaW1lbnQgb24gdGhlIEQxIHN1cHBvcnRzIHRo
YXQgdGhvdWdodCA7LSkKPiB3aXRoIEwxX0NBQ0hFX0JZVEVTIC8gMiwgbmV0d29ya2luZyBrZWVw
cyB3b3JraW5nCj4gd2l0aCBMMV9DQUNIRV9CWVRFUyAqIDIgKHBsdXMgYWRhcHRpbmcgTUlOQUxJ
R04pIGJyZWFrcyBuZXR3b3JraW5nLgo+IAo+IAo+IFNvIEknZCB0aGluaywgd2Ugc2hvdWxkIGxv
dWRseSB3YXJuIGFib3V0IG1pc2NvbmZpZ3VyYXRpb24gYW55d2F5LAo+IGJ1dCBjb3VsZCBqdXN0
IHVzZSB0aGUgc21hbGxlc3QgdmFsdWUgYXMgYmxvY2tfc2l6ZSAoaW4gYSBmdXR1cmUgcGF0Y2gp
Cj4gdG8ga2VlcCB0aGUgbW9zdCBhbW91bnRzIG9mIHN5c3RlbXMgcnVubmluZyBpbiBzdWNoIGEg
Y2FzZS4KCllvdSBuZWVkIHRvIHVzZSB0aGUgc21hbGxlc3Qgc2l6ZSBmb3IgeW91ciBzdHJpZGUg
aW4gWmljYm9tIGluc3RydWN0aW9uCmxvb3BzLCBidXQgdGhlIGxhcmdlc3Qgc2l6ZSBhcyB5b3Vy
IGFsaWdubWVudCBhbmQgcGFkZGluZyBncmFudWxhcml0eQpmb3IgYWxsb2NhdGlvbnMsIG90aGVy
d2lzZSB5b3XigJlsbCBoYXZlIGNhY2hlIGxpbmUgYWxpYXNpbmcgb24gc29tZSBvZgp0aGUgY29y
ZXMgYW5kIGhhdmUgY29ycmVjdG5lc3MgaXNzdWVzIChpbnZhbGlkYXRpbmcgdGhpbmdzIG91dHNp
ZGUgeW91cgphbGxvY2F0aW9uIGlzIHRoZSBvYnZpb3VzIHByb2JsZW0sIGJ1dCBvdGhlciBhbGxv
Y2F0aW9ucyBwdWxsaW5nIGluCmNhY2hlIGxpbmVzIHlvdeKAmXZlIGp1c3QgZmx1c2hlZCBpcyBh
bHNvIGEgcHJvYmxlbSkuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
