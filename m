Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C41C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMK0dygJku/KYynSKTT6m313MG574kzIp76VcYgD73c=; b=nFByX4/6CBfXc1
	f9S8I0qL3mEWR+nEsrHxIB6LiEPupvqYmSNfy6h4aeDTh5ZP6K8sHSjL8Qv055+S4clg/ZnEmyyTB
	EV6sN3KR0QAAQ3fcl7Mf6ez5xA43nZsz5q4mXda77+Y+8KWlIgbRVsOo6i2oMqzQ/AdmMFCSBdtdR
	3u6oxEgCC2cgfB4quyPAxZKuiLte1mghmuQbN46qrjwLLw9+72HLVWJtHpTSSFIbFeVnRviOWB7fL
	SVOqQH340UIEuixecIkjTEDXnNTaah+Ns3vfwEAQBxk1w1jeAWp1wgzpS9c/dywuEZ7WjI83o8AFu
	3+LHB9S5YbVVjyT6GvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NlA-008B70-1P;
	Fri, 10 Nov 2023 09:25:04 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Nl7-008B5s-1k
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 09:25:02 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5bf58204b7aso18050447b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 01:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608298; x=1700213098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmyygXGlWqHLIcYJDnrqzZMuJVEgqUclqA12kn4gnFE=;
        b=rmlbeePnci97o+VlG2P3U4H+vuXqn16UhCJDvRSVCx6tBYy0vdCWrA8kvL1itiuwtQ
         HXh9c1ju1E41IQDvhPaXVykg4+0QLiR1h7LHyKyMdi95o2H/NMkdKbbQCAqcPy9ZFSYk
         Bgtaco7/tWTjfa8pyBHlY129CR+NWgvOmOY3oj34jt+vD7HlcEtI4B/onFljM/4gY4ZD
         gzl++KqkfDzSo7Fpp0qHbceWYdVRa2caeFBj41jh8l3G3SFoiqOJtuik4aCF+G4vacyA
         SqCDQ02M7Lj6WlGwBCXfJ/v2zeVwFrfbtz9nkCYUUC/OjJTfhylo/c/on7tC1GhmCnBm
         BsWw==
X-Gm-Message-State: AOJu0Yxm2JrMO4exK1jIHVrf4e+JOtbQVsKi7NmivbtbN6qU2rMjQAmJ
	5v8uJtzPeygrEC0QIQKU/B5MwHp3oa22tA==
X-Google-Smtp-Source: AGHT+IGqjeEbjpKyqHHb2a6rG5mxMOgikFxFaevdReN8AEROouSnHmtTfHGvzFTApC1ZZ0yMyf0DMw==
X-Received: by 2002:a0d:c7c4:0:b0:5a7:fd05:2af2 with SMTP id j187-20020a0dc7c4000000b005a7fd052af2mr7273507ywd.2.1699608298507;
        Fri, 10 Nov 2023 01:24:58 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id j68-20020a0df947000000b00582b239674esm8591482ywf.129.2023.11.10.01.24.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 01:24:58 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso2012398276.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 01:24:57 -0800 (PST)
X-Received: by 2002:a25:bc90:0:b0:d9b:4a28:f66 with SMTP id
 e16-20020a25bc90000000b00d9b4a280f66mr7552303ybk.53.1699608297683; Fri, 10
 Nov 2023 01:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20231031064553.2319688-1-xiao.w.wang@intel.com> <20231031064553.2319688-3-xiao.w.wang@intel.com>
In-Reply-To: <20231031064553.2319688-3-xiao.w.wang@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Nov 2023 10:24:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQGtenM=_sNntW4mQ0K-7G=5_OhxG-AgQffMbR276W1w@mail.gmail.com>
Message-ID: <CAMuHMdUQGtenM=_sNntW4mQ0K-7G=5_OhxG-AgQffMbR276W1w@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: Optimize bitops with Zbb extension
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ardb@kernel.org, anup@brainfault.org, haicheng.li@intel.com, 
	ajones@ventanamicro.com, yujie.liu@intel.com, charlie@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_012501_578684_E98F9712 
X-CRM114-Status: GOOD (  24.88  )
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

SGkgWGlhbywKCk9uIFR1ZSwgT2N0IDMxLCAyMDIzIGF0IDc6MzfigK9BTSBYaWFvIFdhbmcgPHhp
YW8udy53YW5nQGludGVsLmNvbT4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBsZXZlcmFnZXMgdGhlIGFs
dGVybmF0aXZlIG1lY2hhbmlzbSB0byBkeW5hbWljYWxseSBvcHRpbWl6ZQo+IGJpdG9wcyAoaW5j
bHVkaW5nIF9fZmZzLCBfX2ZscywgZmZzLCBmbHMpIHdpdGggWmJiIGluc3RydWN0aW9ucy4gV2hl
bgo+IFpiYiBleHQgaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgcnVudGltZSBDUFUsIGxlZ2FjeSBp
bXBsZW1lbnRhdGlvbiBpcwo+IHVzZWQuIElmIFpiYiBpcyBzdXBwb3J0ZWQsIHRoZW4gdGhlIG9w
dGltaXplZCB2YXJpYW50cyB3aWxsIGJlIHNlbGVjdGVkCj4gdmlhIGFsdGVybmF0aXZlIHBhdGNo
aW5nLgo+Cj4gVGhlIGxlZ2FjeSBiaXRvcHMgc3VwcG9ydCBpcyB0YWtlbiBmcm9tIHRoZSBnZW5l
cmljIEMgaW1wbGVtZW50YXRpb24gYXMKPiBmYWxsYmFjay4KPgo+IElmIHRoZSBwYXJhbWV0ZXIg
aXMgYSBidWlsZC10aW1lIGNvbnN0YW50LCB3ZSBsZXZlcmFnZSBjb21waWxlciBidWlsdGluIHRv
Cj4gY2FsY3VsYXRlIHRoZSByZXN1bHQgZGlyZWN0bHksIHRoaXMgYXBwcm9hY2ggaXMgaW5zcGly
ZWQgYnkgeDg2IGJpdG9wcwo+IGltcGxlbWVudGF0aW9uLgo+Cj4gRUZJIHN0dWIgcnVucyBiZWZv
cmUgdGhlIGtlcm5lbCwgc28gYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHNob3VsZCBub3QgYmUKPiB1
c2VkIHRoZXJlLCB0aGlzIHBhdGNoIGludHJvZHVjZXMgYSBtYWNybyBOT19BTFRFUk5BVElWRSBm
b3IgdGhpcyBwdXJwb3NlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbyBXYW5nIDx4aWFvLncud2Fu
Z0BpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZv
c2luYy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgNDU3
OTI2YjI1MzIwMGJkOSAoInJpc2N2OgpPcHRpbWl6ZSBiaXRvcHMgd2l0aCBaYmIgZXh0ZW5zaW9u
IikgaW4gcmlzY3YvZm9yLW5leHQuCgo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0
b3BzLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JpdG9wcy5oCj4gQEAgLTE1LDEz
ICsxNSwyNjEgQEAKPiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gICNpbmNsdWRlIDxhc20v
Yml0c3BlcmxvbmcuaD4KPgo+ICsjaWYgIWRlZmluZWQoQ09ORklHX1JJU0NWX0lTQV9aQkIpIHx8
IGRlZmluZWQoTk9fQUxURVJOQVRJVkUpCj4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9iaXRvcHMv
X19mZnMuaD4KPiAtI2luY2x1ZGUgPGFzbS1nZW5lcmljL2JpdG9wcy9mZnouaD4KPiAtI2luY2x1
ZGUgPGFzbS1nZW5lcmljL2JpdG9wcy9mbHMuaD4KPiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL2Jp
dG9wcy9fX2Zscy5oPgo+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvYml0b3BzL2Zmcy5oPgo+ICsj
aW5jbHVkZSA8YXNtLWdlbmVyaWMvYml0b3BzL2Zscy5oPgo+ICsKPiArI2Vsc2UKPiArI2luY2x1
ZGUgPGFzbS9hbHRlcm5hdGl2ZS1tYWNyb3MuaD4KPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+
ICsKPiArI2lmIChCSVRTX1BFUl9MT05HID09IDY0KQo+ICsjZGVmaW5lIENUWlcgICAiY3R6dyAi
Cj4gKyNkZWZpbmUgQ0xaVyAgICJjbHp3ICIKPiArI2VsaWYgKEJJVFNfUEVSX0xPTkcgPT0gMzIp
Cj4gKyNkZWZpbmUgQ1RaVyAgICJjdHogIgo+ICsjZGVmaW5lIENMWlcgICAiY2x6ICIKPiArI2Vs
c2UKPiArI2Vycm9yICJVbmV4cGVjdGVkIEJJVFNfUEVSX0xPTkciCj4gKyNlbmRpZgo+ICsKPiAr
c3RhdGljIF9fYWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25nIHZhcmlhYmxlX19mZnModW5zaWdu
ZWQgbG9uZyB3b3JkKQo+ICt7Cj4gKyAgICAgICBpbnQgbnVtOwo+ICsKPiArICAgICAgIGFzbV92
b2xhdGlsZV9nb3RvKEFMVEVSTkFUSVZFKCJqICVsW2xlZ2FjeV0iLCAibm9wIiwgMCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJJU0NWX0lTQV9FWFRfWkJCLCAxKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgOiA6IDogOiBsZWdhY3kpOwo+ICsKPiArICAgICAg
IGFzbSB2b2xhdGlsZSAoIi5vcHRpb24gcHVzaFxuIgo+ICsgICAgICAgICAgICAgICAgICAgICAi
Lm9wdGlvbiBhcmNoLCt6YmJcbiIKPiArICAgICAgICAgICAgICAgICAgICAgImN0eiAlMCwgJTFc
biIKPiArICAgICAgICAgICAgICAgICAgICAgIi5vcHRpb24gcG9wXG4iCj4gKyAgICAgICAgICAg
ICAgICAgICAgIDogIj1yIiAod29yZCkgOiAiciIgKHdvcmQpIDopOwo+ICsKPiArICAgICAgIHJl
dHVybiB3b3JkOwo+ICsKPiArbGVnYWN5Ogo+ICsgICAgICAgbnVtID0gMDsKPiArI2lmIEJJVFNf
UEVSX0xPTkcgPT0gNjQKPiArICAgICAgIGlmICgod29yZCAmIDB4ZmZmZmZmZmYpID09IDApIHsK
PiArICAgICAgICAgICAgICAgbnVtICs9IDMyOwo+ICsgICAgICAgICAgICAgICB3b3JkID4+PSAz
MjsKPiArICAgICAgIH0KPiArI2VuZGlmCj4gKyAgICAgICBpZiAoKHdvcmQgJiAweGZmZmYpID09
IDApIHsKPiArICAgICAgICAgICAgICAgbnVtICs9IDE2Owo+ICsgICAgICAgICAgICAgICB3b3Jk
ID4+PSAxNjsKPiArICAgICAgIH0KPiArICAgICAgIGlmICgod29yZCAmIDB4ZmYpID09IDApIHsK
PiArICAgICAgICAgICAgICAgbnVtICs9IDg7Cj4gKyAgICAgICAgICAgICAgIHdvcmQgPj49IDg7
Cj4gKyAgICAgICB9Cj4gKyAgICAgICBpZiAoKHdvcmQgJiAweGYpID09IDApIHsKPiArICAgICAg
ICAgICAgICAgbnVtICs9IDQ7Cj4gKyAgICAgICAgICAgICAgIHdvcmQgPj49IDQ7Cj4gKyAgICAg
ICB9Cj4gKyAgICAgICBpZiAoKHdvcmQgJiAweDMpID09IDApIHsKPiArICAgICAgICAgICAgICAg
bnVtICs9IDI7Cj4gKyAgICAgICAgICAgICAgIHdvcmQgPj49IDI7Cj4gKyAgICAgICB9Cj4gKyAg
ICAgICBpZiAoKHdvcmQgJiAweDEpID09IDApCj4gKyAgICAgICAgICAgICAgIG51bSArPSAxOwo+
ICsgICAgICAgcmV0dXJuIG51bTsKPiArfQoKU3VyZWx5IHdlIGNhbiBkbyBiZXR0ZXIgdGhhbiBk
dXBsaWNhdGluZyBpbmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9fX2Zmcy5oPwoKRS5nLiByZW5h
bWUgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gdG8gZ2VuZXJpY19fX2ZmcygpOgoKICAgIC1z
dGF0aWMgX19hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgX19mZnModW5zaWduZWQgbG9uZyB3
b3JkKQogICAgK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZyBnZW5lcmljX19m
ZnModW5zaWduZWQgbG9uZyB3b3JkKQogICAgIHsKICAgICAgICAgICAgIC4uLgogICAgIH0KCiAg
ICArI2lmbmRlZiBfX2ZmcwogICAgKyNkZWZpbmUgX19mZnMoeCkgZ2VuZXJpY19fZmZzKHgpCiAg
ICArI2VuZGlmCgphbmQgZXhwbGljaXRseSBjYWxsaW5nIHRoZSBnZW5lcmljIG9uZSBoZXJlPwoK
U2FtZSBjb21tZW50IGZvciB0aGUgb3RoZXIgZnVuY3Rpb25zLgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
