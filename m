Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AD8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e61bSXdKq9LegdSNH43Rr7/AEZXMY2cEefiQOw1JqSM=; b=qESLGv1jAhHsUS
	AtR8f94w84unIBHp6JcHKEsmr70JFsN5oh/zyEPVL4zRBPrt+kGuGj0Rm92mkjTg7UOztAsaGBfSP
	oxmnapAEzuwJRvlYEuZGjy3OoLSzOvaTDnBPwWo1mG6OSYagVgPfj6yWA037uSZhJiBRtLyfrchh/
	+n/EkBDvM1F26Jf7LjX+WwUf274hBAZ9CoVZzgw4ttNxlKISGpp8bww0oZbMlXWbeiA5FMtfeiQTL
	vVS25UahIp1T4gap3NBAvxktv3qsRJVpBEIpSZWkVAvrD2zZdFPamTgXeE9Sds8svEDyQTApirVYh
	VByofV1l27A8rqUdpbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSxu-00FaUQ-2Y;
	Wed, 13 Dec 2023 17:24:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSxr-00FaSY-26
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:24:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28b02567a05so50119a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702488243; x=1703093043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTaZ/ZTUIzRm59gutXfEySTFXSl+1pYs2k0RhPKuD7s=;
        b=HHZpY09vwIEmb+U2sQLR0L5/jiaVs+X1X57kS+ttawFDztEFtTR5toRkPlzaE/DIph
         Xn027VDklla3VsuV0g+ERyajgbF5Xbv1IYVlUPsjggWRGe6Gcj8X+NamrQsmbO+Od01j
         X/n2Ww5Vpl21/IpwC2DkyrtLQ6M6euyBxE9EszNEEqlfNLseQKv/+dOpWT1HMNU4L1As
         9wWo7QPsB4/5PrSGIE82pteKag2rXRQM5t2b2ru9ywHBeJQRpTWZTleMbfLn1y88KeeW
         m5/fW3Ko2uyiNlo1Yj1wWvK8ZSUcMGCUSSNArPn0IuT+RdMHZnXVTHXNRkQymvES79Oz
         lPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702488243; x=1703093043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTaZ/ZTUIzRm59gutXfEySTFXSl+1pYs2k0RhPKuD7s=;
        b=YS9bd8pOpH8FXKZQBsx+mBQtoWuZLsrwYv/YqIpF3UMCgntRZsx/Ba4rTdvi9hNSte
         RrymZB3BJoZsbX9ngWHo+dMeEF8Dl6uk3eNqFZcnmimawvEDgYoQAVHgJXvEnWOCmoWs
         Fp9oDpxYgUfAfWAyShAmERlhna9ElHhUfyAp1Og0v7srDiAwU2qudn5QWZ0kVfvSu11w
         K0ts5h+Z8GmGX+hk9GcId1c0AD+h6AfDZl+ZnPmkcFTLyPl70j+q+ZtkWlp+nzX+fdnP
         h+pGwNu+yST7YvnDLWEqWloKB+5x3I6B6GaxQjrgm/j8CHVXl4nyQEiyLAQYoTbfaWvG
         L6aQ==
X-Gm-Message-State: AOJu0YxDy4G+b+EuRzG1LELuQ+JJrtAmwh+cbSUPTOeSZ5j9MNxGBQeo
	cZq5+O7GTr7VgJxpJXCbq4s+H1trzz6MWqvSQYL9skLKL7t3Wmqn04c=
X-Google-Smtp-Source: AGHT+IG1KERzhj2BpZqoeJLdhSqIKK1rtTuXdjCKV7QT8uHEOcwkkRP1XMI03hI2fwqPzmUPfiaRnwK3O4bsUMon8Ec=
X-Received: by 2002:a17:90b:3a82:b0:286:6cc0:8863 with SMTP id
 om2-20020a17090b3a8200b002866cc08863mr3985337pjb.80.1702488243515; Wed, 13
 Dec 2023 09:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20231213170951.93453-8-ajones@ventanamicro.com> <20231213170951.93453-9-ajones@ventanamicro.com>
In-Reply-To: <20231213170951.93453-9-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 22:53:51 +0530
Message-ID: <CAAhSdy0Moex5DnpDUZWTOOKDRbr9GF7NDRCf+x78pLqh=ZLRzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] RISC-V: KVM: Don't add SBI multi regs in get-reg-list
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, palmer@dabbelt.com, haibo1.xu@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_092407_691179_D93C8D93 
X-CRM114-Status: GOOD (  16.79  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTA6MznigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBtdWx0aSByZWdzIGFyZSBkZXJpdmVkIGZy
b20gdGhlIHNpbmdsZSByZWdpc3RlcnMuIE9ubHkgbGlzdCB0aGUKPiBzaW5nbGUgcmVnaXN0ZXJz
IGluIGdldC1yZWctbGlzdC4gVGhpcyBhbHNvIG1ha2VzIHRoZSBTQkkgZXh0ZW5zaW9uCj4gcmVn
aXN0ZXIgbGlzdGluZyBjb25zaXN0ZW50IHdpdGggdGhlIElTQSBleHRlbnNpb24gcmVnaXN0ZXIg
bGlzdGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgoK
TG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYyB8IDM2ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYwo+IGluZGV4IGY4YzlmYTBjMDNjNS4uZjliZmE4YTVkYjIxIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jCj4gQEAgLTkzMywyMCArOTMzLDEyIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyBudW1faXNhX2V4dF9yZWdzKGNvbnN0IHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbnVtX3NiaV9leHRfcmVncyh2b2lkKQo+ICB7Cj4gLSAg
ICAgICAvKgo+IC0gICAgICAgICogbnVtYmVyIG9mIEtWTV9SRUdfUklTQ1ZfU0JJX1NJTkdMRSAr
Cj4gLSAgICAgICAgKiAyIHggKG51bWJlciBvZiBLVk1fUkVHX1JJU0NWX1NCSV9NVUxUSSkKPiAt
ICAgICAgICAqLwo+IC0gICAgICAgcmV0dXJuIEtWTV9SSVNDVl9TQklfRVhUX01BWCArIDIqKEtW
TV9SRUdfUklTQ1ZfU0JJX01VTFRJX1JFR19MQVNUKzEpOwo+ICsgICAgICAgcmV0dXJuIEtWTV9S
SVNDVl9TQklfRVhUX01BWDsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgY29weV9zYmlfZXh0X3JlZ19p
bmRpY2VzKHU2NCBfX3VzZXIgKnVpbmRpY2VzKQo+ICB7Cj4gLSAgICAgICBpbnQgbjsKPiAtCj4g
LSAgICAgICAvKiBjb3B5IEtWTV9SRUdfUklTQ1ZfU0JJX1NJTkdMRSAqLwo+IC0gICAgICAgbiA9
IEtWTV9SSVNDVl9TQklfRVhUX01BWDsKPiAtICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgbjsg
aSsrKSB7Cj4gKyAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IEtWTV9SSVNDVl9TQklfRVhUX01B
WDsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHU2NCBzaXplID0gSVNfRU5BQkxFRChDT05GSUdf
MzJCSVQpID8KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUkVHX1NJWkVfVTMyIDog
S1ZNX1JFR19TSVpFX1U2NDsKPiAgICAgICAgICAgICAgICAgdTY0IHJlZyA9IEtWTV9SRUdfUklT
Q1YgfCBzaXplIHwgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwKPiBAQCAtOTU5LDMwICs5NTEsNiBA
QCBzdGF0aWMgaW50IGNvcHlfc2JpX2V4dF9yZWdfaW5kaWNlcyh1NjQgX191c2VyICp1aW5kaWNl
cykKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gLSAgICAgICAvKiBjb3B5IEtW
TV9SRUdfUklTQ1ZfU0JJX01VTFRJICovCj4gLSAgICAgICBuID0gS1ZNX1JFR19SSVNDVl9TQklf
TVVMVElfUkVHX0xBU1QgKyAxOwo+IC0gICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBuOyBpKysp
IHsKPiAtICAgICAgICAgICAgICAgdTY0IHNpemUgPSBJU19FTkFCTEVEKENPTkZJR18zMkJJVCkg
Pwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIEtWTV9SRUdfU0laRV9VMzIgOiBLVk1fUkVH
X1NJWkVfVTY0Owo+IC0gICAgICAgICAgICAgICB1NjQgcmVnID0gS1ZNX1JFR19SSVNDViB8IHNp
emUgfCBLVk1fUkVHX1JJU0NWX1NCSV9FWFQgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
S1ZNX1JFR19SSVNDVl9TQklfTVVMVElfRU4gfCBpOwo+IC0KPiAtICAgICAgICAgICAgICAgaWYg
KHVpbmRpY2VzKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHB1dF91c2VyKHJlZywg
dWluZGljZXMpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFV
TFQ7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgdWluZGljZXMrKzsKPiAtICAgICAgICAgICAg
ICAgfQo+IC0KPiAtICAgICAgICAgICAgICAgcmVnID0gS1ZNX1JFR19SSVNDViB8IHNpemUgfCBL
Vk1fUkVHX1JJU0NWX1NCSV9FWFQgfAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX1JF
R19SSVNDVl9TQklfTVVMVElfRElTIHwgaTsKPiAtCj4gLSAgICAgICAgICAgICAgIGlmICh1aW5k
aWNlcykgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChwdXRfdXNlcihyZWcsIHVpbmRp
Y2VzKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHVpbmRpY2VzKys7Cj4gLSAgICAgICAgICAgICAgIH0K
PiAtICAgICAgIH0KPiAtCj4gICAgICAgICByZXR1cm4gbnVtX3NiaV9leHRfcmVncygpOwo+ICB9
Cj4KPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
