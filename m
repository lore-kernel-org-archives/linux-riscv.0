Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BEBECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Gok7v8KNZ9y0OrupBT9fUl8Wn4nA2VCY+wF4Eqg4uE=; b=m3rgHlehMI54sY
	9I1jIkYvBQBQu8XWENxwWeJ/SInvfLeFWIN+qDclHV0R7pX0KxZ373GwkPtgCUMqqW9s7Z2QNkfS+
	rDf1/RNgG8/c+LPwcyIWTM2DphmCtWoxRYJRWVOAuU1eAYPFWJz1R9FVHYoSpCfDjG/PNosc2+s+p
	PzF1U+gTlaGEyI6/5xaZ6k/E2Sd5KGVdqRs7DK0Q34vTU3bxw2b2GYpufnJh0u2+Ao0A048fkYQGb
	3SdNlWJp05oF9gfG8+QBCwoaj2qrhZKboI2YA4VOL6oh0f4obWtU9CJc5l6yz9CdPBrkDC9HLWeRi
	LTsu0S4Fm3avj5AWyuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNlG-001U2v-GK; Tue, 06 Sep 2022 01:52:22 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNlD-001U1C-76
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:52:20 +0000
Received: by mail-io1-xd32.google.com with SMTP id 10so7885128iou.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=qJmkGipThwGzIFiU+LRn5B9WXocUD44Aq+0ge6lB0Lc=;
        b=Uq+vlrBKD7CNndPYkoO/ekKoQ8VutFkcj2rOCG7dFGMSfegzTOeU/fCcEbpeatbnXm
         i9HlZnAbpcMY3VVo6UHEVocFs/GJOhZHc3QykcFP2/mV/4tPKw4HTeWSgcCsxifc2mcz
         l5IcUAC7I6AUfVH+bSTBZNSqfAIwxsViLeU/zoO9icV2uitqiKA3zWZCnw3K4/5WBf6a
         Xmp3wKN65fRl2N/oTBJVNpXVr8TxBqcApYcMGGotDl8YKI7axTY/QYWcmJfEuJxx8Err
         5PwwjXNK8gG7KCQ2EQ+8+NFvbeBcxZ89yB8bEl1qOU7pMLg06g2xZh5aXXrSen9n9TBN
         Mzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qJmkGipThwGzIFiU+LRn5B9WXocUD44Aq+0ge6lB0Lc=;
        b=7dxISIgxgm7w5hEzkAJ68L3GXmVIR+nTxwM+Ns1KbJ4z5TsKFnLRLoFebj6XCHPxoV
         Bf3bHjtj/1O3rBd0WQ1EJylrGncAVU01Ttb4Gf/KjjHaCBIXz5Dn+ZjddRha/54DyhA+
         MlJsdgaAR0k9V87t685orjl/kwA5J2Vpfrm6m7pJvYPu6ALlrkOs07A3xVGJXiSsi/EN
         gWDG8KyfNN7SWAfaAaXR5kvt+KoD81NXPsJzo2Uc7cU6l1kayJyp/b/u3Kh9ckAn5ysM
         MvStJReKMhGLMo+zRGES4QVSIjEp0yOduoTYzG1Tm4Zu7k9xoNtddzrswMJbWTssTD2/
         Mbpw==
X-Gm-Message-State: ACgBeo3w4fqKecDh78cDb5GWxbFxb1N0IRQ5BRYcME5qUuLp8dLhr4Oo
	TxriRXRd209EU+2diuCP0DJIWrnnFc4zmUCBIYE=
X-Google-Smtp-Source: AA6agR5WNaJa2yCRJ3xsKiXdF7U/oiPzlvI/p72iLAy/RV9nQ3e4J9BYJMa99Fve//Mgf2N7CBsafxHEt95UWMQdGQ8=
X-Received: by 2002:a05:6638:3047:b0:341:de2b:e489 with SMTP id
 u7-20020a056638304700b00341de2be489mr27916981jak.273.1662429137540; Mon, 05
 Sep 2022 18:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083125.29426-1-zong.li@sifive.com> <20220905083125.29426-3-zong.li@sifive.com>
 <26246d03-a0dc-8f36-2ac1-daa60d47a057@microchip.com>
In-Reply-To: <26246d03-a0dc-8f36-2ac1-daa60d47a057@microchip.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 6 Sep 2022 09:52:05 +0800
Message-ID: <CA+ZOyaip+HFQiyHmX5fF+aMWtUK-kKnjhN-1VMk96DiXaQjQrA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
To: Conor.Dooley@microchip.com
Cc: zong.li@sifive.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, ben.dooks@sifive.com, bp@alien8.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_185219_273717_B42D8171 
X-CRM114-Status: GOOD (  23.39  )
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

PENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwgMjAyMuW5tDnmnIg25pelIOmAseS6jCDl
h4zmmagyOjQ25a+r6YGT77yaCj4KPiBIZXkgWm9uZyBMaSwKPiBDb3VwbGUgY29tbWVudHMgb24g
dGhpcyBwYXRjaC4KPgo+IE9uIDA1LzA5LzIwMjIgMDk6MzEsIFpvbmcgTGkgd3JvdGU6Cj4gPiBF
WFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPiA+Cj4gPiBGcm9tOiBHcmVlbnRpbWUg
SHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4KPiA+IFNpbmNlIGNvbXBvc2FibGUgY2Fj
aGUgbWF5IGJlIEwzIGNhY2hlIGlmIHBMMiBjYWNoZSBleGlzdHMsIHdlIHNob3VsZCB1c2UKPgo+
IFdoYXQgaXMgYSBwTDIgY2FjaGU/CgpUaGUgcEwyIGlzIHN0YW5kIGZvciBwcml2YXRlIEwyIGNh
Y2hlLCBpdCBpcyBhIEwyIGNhY2hlIGluIG91ciBzeXN0ZW0uClBlcmhhcHMgSSBzaG91bGQgY2hh
bmdlIHRoZSBwTDIgdG8gTDIgaW4gdGhlIGRlc2NyaXB0aW9uIGZvciBtb3JlCmdlbmVyaWMuCgo+
Cj4gPiBpdHMgb3JpZ2luYWwgbmFtZSBjb21wb3NhYmxlIGNhY2hlIHRvIHByZXZlbnQgY29uZnVz
aW9uLgo+ID4KPiA+IEFwYXJ0IGZyb20gcmVuYW1pbmcsIHdlIGFsc28gYWRkIHRoZSBjb21wYXRp
YmxlICJzaWZpdmUsY2NhY2hlMCIgaW50byBJRAo+ID4gdGFibGUuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
c29jL3NpZml2ZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQo+ID4gIGRyaXZl
cnMvc29jL3NpZml2ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ID4gIC4u
Li97c2lmaXZlX2wyX2NhY2hlLmMgPT4gc2lmaXZlX2NjYWNoZS5jfSAgICB8IDE2MyArKysrKysr
KystLS0tLS0tLS0KPiA+ICAuLi4ve3NpZml2ZV9sMl9jYWNoZS5oID0+IHNpZml2ZV9jY2FjaGUu
aH0gICAgfCAgMTYgKy0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKyksIDkz
IGRlbGV0aW9ucygtKQo+ID4gIHJlbmFtZSBkcml2ZXJzL3NvYy9zaWZpdmUve3NpZml2ZV9sMl9j
YWNoZS5jID0+IHNpZml2ZV9jY2FjaGUuY30gKDM1JSkKPiA+ICByZW5hbWUgaW5jbHVkZS9zb2Mv
c2lmaXZlL3tzaWZpdmVfbDJfY2FjaGUuaCA9PiBzaWZpdmVfY2NhY2hlLmh9ICgxMiUpCj4KPiBJ
ZiB5b3UncmUgZ29pbmcgdG8gcmVuYW1lIHRoZSBoZWFkZXIsIHlvdSBuZWVkIHRvIHVwZGF0ZSBh
bGwgcmVmZXJlbmNlcyB0bwo+IGl0IHRvbywgb3RoZXJ3aXNlIHRoZSBvdGhlciB1c2VyICh0aGUg
RURBQykgaXMgZ29pbmcgdG8gaGF2ZSBidWlsZCBpc3N1ZXMsCj4gaS5lLiBwYXRjaCA2IG5lZWRz
IHRvIGdldCBzcXVhc2hlZCBpbnRvIHRoaXMgb25lLgo+CgpPaywgbGV0IG1lIG1lcmdlIHRoZXNl
IHR3byBwYXRjaGVzLCBhcyB5b3UgbWVudGlvbmVkLCB3ZSBwcm9iYWJseQpkb24ndCB3YW50IHRv
IHNlZSB0aGUgYnVpbGQgaXMgYnJva2VuIGluIGdpdCBiaXNlY3QgYXMgd2VsbC4KCj4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2wyX2NhY2hlLmMgYi9kcml2ZXJz
L3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNoZS5jCj4gPiBzaW1pbGFyaXR5IGluZGV4IDM1JQo+ID4g
cmVuYW1lIGZyb20gZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9sMl9jYWNoZS5jCj4gPiByZW5h
bWUgdG8gZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYwo+ID4gaW5kZXggNTk2NDBh
MWQwYjI4Li4xYjE2YTE5NjU0N2YgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9zaWZpdmUv
c2lmaXZlX2wyX2NhY2hlLmMKPiA+ICsrKyBiL2RyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2Nh
Y2hlLmMKPgo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNpZml2ZV9sMl9p
ZHNbXSA9IHsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzaWZpdmVfY2Nh
Y2hlX2lkc1tdID0gewo+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1j
MDAwLWNjYWNoZSIgfSwKPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJzaWZpdmUsZnU3NDAt
YzAwMC1jY2FjaGUiIH0sCj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAic2lmaXZlLGNjYWNo
ZTAiIH0sCj4gPiAgICAgICAgIHsgLyogZW5kIG9mIHRhYmxlICovIH0sCj4KPiBGb3IgdjMsIEkg
dGhpbmsgeW91IHNob3VsZCBkcm9wIHRoZSAsIGZyb20gdGhlIGVuZCBvZiB0aGUgdGFibGUgd2hp
bGUKPiB3ZSBhcmUgYWxyZWFkeSBlZGl0aW5nIGl0LgoKVGhhbmtzLCBJIHdpbGwgcmVtb3ZlIGl0
LgoKPiBUaGFua3MsCj4gQ29ub3IuCj4KPiA+ICB9Owo+ID4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
