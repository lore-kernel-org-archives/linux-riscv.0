Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F4AC43461
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 05:47:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F392074B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 05:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wZClwz/P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eY+okMC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F392074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GXswjbeOyTooeLAiBRKzNvb1cH3QqMH9BUSwPxpSj10=; b=wZClwz/PtTaT8oTDV0FjXvVWF
	U/O/VmiRHe20By/TFnnW65gRf+NQrd33rQqtfVIzZl6RpcMQkVhE+r3cCeMhPGYgdpyHeOfVzl/JH
	6+mG+YYZntKG2bX+kvo1/LBHe/EC5CB4eN8bJw8SU3W5CriA69G8hNBpcPvoQYYnzZJvC2NGceZNf
	MVRhFGTnMip/msIjzXlrOtsNkLQFRDn8qAIlv+wM6BxQcPgrm4PRWMJ/MjwqRjZ/P+tAkXmJd3GJZ
	zggh3x0jTxIgfOQg2v5l93fWdYY5up0pj4S4/AzaqUbrSSleyjwe3DxuRVMIGh1HLsWx7IilmW5j6
	eM+Wv/z/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHhKL-0000Al-7B; Mon, 14 Sep 2020 05:46:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHhKJ-00009z-64
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 05:46:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id w2so9388756wmi.1
 for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2020 22:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sDD9xbXrOHoErjZLRR+/+AtDLaCnVmHRrkVezZM912Y=;
 b=eY+okMC8xfBiRH3cE/90LzCYt3zAjKBnNwVqBIqPfCCKGfS4LiZkI1tz5tVuAKD9Bt
 gHHBuuvOIghEFOViq4ZTL21bCZXni8/Zlat4xIzctM+SS4EZdWsHZhBzUfXknGocvPSZ
 mn+q3/tooHeVkXczfc+2yfawVsDQCwVVlOXbeB0gLAozyKoOoX7PO0KpkOk0jzw0OKiz
 3VTlXVTjQia8VZeLobuuTUCrBFsjKu2CQdjs7vPq06bmvTkCRG7NOvMKj6xW/SGdOY9S
 MQSRrUXP4HCb/O+HyjwfRdOpOfcCETks981G/J9Y+KeI7juc5WC4LpooQ2Fz/esbZE+4
 Vf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sDD9xbXrOHoErjZLRR+/+AtDLaCnVmHRrkVezZM912Y=;
 b=tpL05DSq3yVzYIJpRtFP0aBC6s8jqOXuG5Mmgtg4ySQ7906fY3XVQA6WvQ5OYFt3Wx
 bsrmrUy+llvZ9DGbZUmUPBnqVsQe3hY46PYRlljljZltzXz9PyK6lpirF/Ws1WecuKWG
 HNinYIQRFjHVoIwXdvZ5/nVBt1GzLOVrFkfvQ6dgUDCfIrDneXfqhJWyXbGunzxgyEEP
 WDhUZ2ZAoV1Pr3+mlPGl/4zUX3tNyCvUZ22KBLdfLSWHVG0NdXL6fVPrRdna30b4mIYt
 tdcTi1Eb+0NcsdPbvG5aFz8SD6eniWyygwNrfXRKgrE0qeYfvPM2Zpq8oaQ3xzp0s2gI
 buOg==
X-Gm-Message-State: AOAM533KDBYAWJiQ7pO1KgoaDDd4YkX9Q9eyRZLJahfcXnZ8SqgHe6tc
 yyOC4bGSalEHI+tJBb2QJ0KSXQ==
X-Google-Smtp-Source: ABdhPJyUVCGBR93hL6wzG0lCe51kAZFFaJG76CajpH7T3daMVWhHg+pdihb6Vi5OLEnx0XzSO+6QCg==
X-Received: by 2002:a05:600c:22c5:: with SMTP id
 5mr13272418wmg.34.1600062412115; 
 Sun, 13 Sep 2020 22:46:52 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a402:e7fb:d494:d130?
 ([2a01:e34:ed2f:f020:a402:e7fb:d494:d130])
 by smtp.googlemail.com with ESMTPSA id
 h204sm17849917wmf.35.2020.09.13.22.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 22:46:51 -0700 (PDT)
Subject: Re: [PATCH] cpuidle: add riscv cpuidle driver
To: liush <liush@allwinnertech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rjw@rjwysocki.net,
 anup.patel@wdc.com, atish.patra@wdc.com, damien.lemoal@wdc.com,
 wangkefeng.wang@huawei.com, kernel@esmil.dk, zong.li@sifive.com
References: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <80bc85f5-fba3-5f08-4d73-372b5f495833@linaro.org>
Date: Mon, 14 Sep 2020 07:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_014655_531600_0D6F975F 
X-CRM114-Status: GOOD (  19.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMDkvMjAyMCAwMzo1MiwgbGl1c2ggd3JvdGU6Cj4gVGhpcyBwYXRjaCBhZGRzIGEgY3B1
aWRsZSBkcml2ZXIgZm9yIHN5c3RlbXMgYmFzZWQgUklTQ1YgYXJjaGl0ZWN0dXJlLgo+IFRoaXMg
cGF0Y2ggc3VwcG9ydHMgc3RhdGUgV0ZJLiBPdGhlciBzdGF0ZXMgd2lsbCBiZSBzdXBwb3J0ZWQg
aW4gdGhlCj4gZnV0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IGxpdXNoIDxsaXVzaEBhbGx3aW5u
ZXJ0ZWNoLmNvbT4KPiAtLS0KClsgLi4uIF0KCj4gIAo+ICBvYmotJChDT05GSUdfUklTQ1ZfTV9N
T0RFKQkrPSB0cmFwc19taXNhbGlnbmVkLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1aWRsZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1aWRsZS5jCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMC4uYTMyODllNwo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVpZGxlLmMKPiBAQCAtMCwwICsxLDggQEAKPiArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArI2luY2x1ZGUgPGFzbS9jcHVpZGxlLmg+
Cj4gKwo+ICt2b2lkIGNwdV9kb19pZGxlKHZvaWQpCj4gK3sKPiArCV9fYXNtX18gX192b2xhdGls
ZV9fICgid2ZpIik7Cj4gKwoKZXh0cmEgbGluZQoKPiArfQoKQXMgZm9yIHRoZSBuZXh0IGRlZXBl
ciBzdGF0ZXMgc2hvdWxkIGVuZCB1cCB3aXRoIHRoZSBjcHVfZG9faWRsZQpmdW5jdGlvbiwgaXNu
J3QgdGhlcmUgYW4gZXh0cmEgb3BlcmF0aW9uIHdpdGggdGhlIHdmaSgpIGxpa2UgZmx1c2hpbmcK
dGhlIGwxIGNhY2hlPwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL0tjb25maWcgYi9k
cml2ZXJzL2NwdWlkbGUvS2NvbmZpZwo+IGluZGV4IGMwYWVlZGQuLmY2YmUwZmQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9jcHVpZGxlL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2NwdWlkbGUvS2Nv
bmZpZwo+IEBAIC02Miw2ICs2MiwxMSBAQCBkZXBlbmRzIG9uIFBQQwo+ICBzb3VyY2UgImRyaXZl
cnMvY3B1aWRsZS9LY29uZmlnLnBvd2VycGMiCj4gIGVuZG1lbnUKPiAgCj4gK21lbnUgIlJJU0NW
IENQVSBJZGxlIERyaXZlcnMiCj4gK2RlcGVuZHMgb24gUklTQ1YKPiArc291cmNlICJkcml2ZXJz
L2NwdWlkbGUvS2NvbmZpZy5yaXNjdiIKPiArZW5kbWVudQo+ICsKPiAgY29uZmlnIEhBTFRQT0xM
X0NQVUlETEUKPiAgCXRyaXN0YXRlICJIYWx0IHBvbGwgY3B1aWRsZSBkcml2ZXIiCj4gIAlkZXBl
bmRzIG9uIFg4NiAmJiBLVk1fR1VFU1QKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL0tj
b25maWcucmlzY3YgYi9kcml2ZXJzL2NwdWlkbGUvS2NvbmZpZy5yaXNjdgo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLmU4NmQzNmIKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvZHJpdmVycy9jcHVpZGxlL0tjb25maWcucmlzY3YKPiBAQCAtMCwwICsxLDExIEBACj4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICsjCj4gKyMgUklTQ1YgQ1BV
IElkbGUgZHJpdmVycwo+ICsjCj4gK2NvbmZpZyBSSVNDVl9DUFVJRExFCj4gKyAgICAgICAgYm9v
bCAiR2VuZXJpYyBSSVNDViBDUFUgaWRsZSBEcml2ZXIiCj4gKyAgICAgICAgc2VsZWN0IERUX0lE
TEVfU1RBVEVTCj4gKwlzZWxlY3QgQ1BVX0lETEVfTVVMVElQTEVfRFJJVkVSUwo+ICsgICAgICAg
IGhlbHAKPiArICAgICAgICAgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgZ2VuZXJpYyBj
cHVpZGxlIGRyaXZlciBmb3IgUklTQ1YuCj4gKwkgIE5vdyBvbmx5IHN1cHBvcnQgQzAgU3RhdGUu
CgpJZGVudGF0aW9uCgpSZXN0IGxvb2tzIG9rIGZvciBtZS4KCgotLSAKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
