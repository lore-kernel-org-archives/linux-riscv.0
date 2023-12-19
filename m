Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE6BC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BwCbQFCz2UU3BvB+R1jZdED/FCGpV39yUGKx5ndQ68=; b=b6qQvajD/pF2kU
	MZrQB9bjj+pC2GjWNV22CE694Kb07uqVcDEg/50sr+8DFKnX4i1wWeU02rNBMp35RbuRE1AIAr4tI
	UmmvuoQA3XstVlH5jZD79iAWvWua5S1QBtD68aLtAFl+rQKqMkClceg0XlwXHD2GZlwHzk7boCyJG
	zxZHw4xksVqvFskpKqKKgMl3K0vcmloWH5avblD3V2JJVWuht28DPoRS7j43dpo/v0uSz5eCg/Z+v
	5waHXxgUE1cbX3Vz7/XtrX7cemTyx/ajhWsJyMScckHCmOXpPBvZ1Gl+TnV6uX1h4A2Uf9gmYXkjI
	T72wimDcON3a9EUcXq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFb6k-00EN25-0Y;
	Tue, 19 Dec 2023 14:30:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFb6h-00EN02-0G
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 14:30:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a2330a92ae6so372072866b.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 06:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702996200; x=1703601000; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LmB6XvSqGvAwRBDdkbtoIzjwp96a7xR5GmSDPtFeoNg=;
        b=Fak8LRl0nEbFM9O+4ejTBLEmt2ZHVLEV0WcBuTdKWphelK0qZahNK2XuXpgFOsTTX/
         h/ABU48O0ILWRhY2E6gTQLdf/p/mSrCbsWJf74QPouClLhMlyMbx1S3FRBX2Gn02tSgB
         bZh3AxZ9HD0ubWEO2juVIaox2rO7hOsyjZ6y2c08qoEIPSy+grPP37HCEB78RBw2wx+t
         sVnmxRs1rhUp3HFEPr5HS4qpvtblT/JI6i6FxBQKp1WFlG8SMX9jfOWiSxVZ6/4EsAME
         b5TH8hE8QfOoMm+hLoMlSUWprr1PbNQbTt+Ap9pQrg3CANUJvwuhXN2KQOZr9P9Ep4V+
         zCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996200; x=1703601000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmB6XvSqGvAwRBDdkbtoIzjwp96a7xR5GmSDPtFeoNg=;
        b=o7Tv0HOk8rDTvzupFNFmcSvW9rQ1vDvPzQn+mRFi2AcQOOCCJbiT3y8cWQZb0Z5kmQ
         hwC+cQ4hRaYR9bJspMZV7gpls+hiekDKRJrHZGASosCMmXDSsBFijIp9b0eOd6FfZIRz
         AOPSM8VDrWPio7tT59AkSwVI3hCdsmslOzSV85r5mGPYJf1uT8RXR7xD3K06XD+wnzfa
         TnSG6DMNR4lx+VYhXyMIXcEQ7VyjCJqoyd6iyNXqFyhFkwOJ0cEi6KBKzRZ1cTZtmtzM
         NCLRPYZvx4PNk2aRawS/VdkMLHEnGrdD9ERvCbbmOVZLmIHLb0mbuIfTlXCVIlHW/YZq
         IK8A==
X-Gm-Message-State: AOJu0Yx/hu6O84ZO84sV2yqcs1oL+Kqn9dJa1U56yVBNXcDewGiAPs6U
	MHCcapng9Zf//hUonSVp3i6Sfw==
X-Google-Smtp-Source: AGHT+IHwNjxs5OhEsK3+Gz90Sq6b7RCFum4m3Y7neFzvc/yieqcSn85ljedasiaSoZ8JlNEfAqxM/g==
X-Received: by 2002:a17:906:c0cc:b0:a1f:612a:d3b5 with SMTP id bn12-20020a170906c0cc00b00a1f612ad3b5mr9645315ejb.141.1702996199984;
        Tue, 19 Dec 2023 06:29:59 -0800 (PST)
Received: from localhost (cst-prg-1-247.cust.vodafone.cz. [46.135.1.247])
        by smtp.gmail.com with ESMTPSA id th18-20020a1709078e1200b00a1f8df4e2d5sm13346430ejc.178.2023.12.19.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:29:59 -0800 (PST)
Date: Tue, 19 Dec 2023 15:29:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, pbonzini@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	srivatsa@csail.mit.edu, guoren@kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v3 01/13] RISC-V: paravirt: Add skeleton for pv-time
 support
Message-ID: <20231219-3ed5ceb6bcb61fcfebc4a342@orel>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
 <20231217204019.36492-16-ajones@ventanamicro.com>
 <CAOnJCULYeMz63LA-MR-Y9HqCU+dhBQdXf7Shwhu1FXFuck5gWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULYeMz63LA-MR-Y9HqCU+dhBQdXf7Shwhu1FXFuck5gWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_063003_151355_F88A8816 
X-CRM114-Status: GOOD (  20.61  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMDQ6NDg6MDRQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKLi4uCj4gPiAraW50IF9faW5pdCBwdl90aW1l
X2luaXQodm9pZCkKPiA+ICt7Cj4gPiArICAgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICAg
IGlmICghaGFzX3B2X3N0ZWFsX2Nsb2NrKCkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gPiArCj4gPiArICAgICAgIHJldCA9IGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQX09OTElO
RV9EWU4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyaXNjdi9wdl90aW1l
Om9ubGluZSIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB2X3RpbWVfY3B1
X29ubGluZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHZfdGltZV9jcHVf
ZG93bl9wcmVwYXJlKTsKPiA+ICsgICAgICAgaWYgKHJldCA8IDApCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsgICAgICAgc3RhdGljX2NhbGxfdXBkYXRlKHB2X3N0
ZWFsX2Nsb2NrLCBwdl90aW1lX3N0ZWFsX2Nsb2NrKTsKPiA+ICsKPiA+ICsgICAgICAgc3RhdGlj
X2tleV9zbG93X2luYygmcGFyYXZpcnRfc3RlYWxfZW5hYmxlZCk7Cj4gPiArICAgICAgIGlmIChz
dGVhbF9hY2MpCj4gPiArICAgICAgICAgICAgICAgc3RhdGljX2tleV9zbG93X2luYygmcGFyYXZp
cnRfc3RlYWxfcnFfZW5hYmxlZCk7Cj4gPiArCj4gPiArICAgICAgIHByX2luZm8oInVzaW5nIHBh
cmF2aXJ0IHN0ZWFsLXRpbWVcbiIpOwo+ID4gKwo+IAo+IE5pdCBjb21tZW50Ogo+IElmIHRoZSBz
Y2hlZHVsZXIgZG9lc24ndCB0YWtlIHN0b2xlbiB0aW1lIGludG8gY29uc2lkZXJhdGlvbiAod2hl
biBJZgo+IG5vLXN0ZWFsLWFjYyBpcyBzcGVjaWZpZWQgaW4gdGhlIGNvbW1hbmQgbGluZSksCj4g
dGhlIGFib3ZlIGxvZyBpcyBhIGJpdCBtaXNsZWFkaW5nID8gQVJNNjQgYWxzbyBzZWVtcyB0byBi
ZSBkb2luZyB0aGUKPiBzYW1lIHRoaW5nLgo+IAo+IE1heWJlIHRoZSBpbnRlbnRpb24gb2YgdGhl
IGxvZyBpcyB0byBzdGVhbCB0aW1lIGV4dGVuc2lvbiBwcmVzZW5jZQo+IHJhdGhlciB0aGFuIGFj
dHVhbCB1c2FnZSBpbiBwbGFjZSA/CgpZb3UncmUgcmlnaHQgdGhhdCB0aGUgd29yZCAidXNpbmci
IGlzbid0IGdyZWF0LiAiQ29tcHV0aW5nIiB3b3VsZCBiZQpiZXR0ZXIgYXMsIGV2ZW4gd2l0aCBu
by1zdGVhbC1hY2MsIHN0ZWFsIHRpbWUgZ2V0cyBjb21wdXRlZCBhbmQgc2hvd3MKdXAgaW4gL3By
b2Mvc3RhdC4KCj4gCj4gPiArICAgICAgIHJldHVybiAwOwo+ID4gK30KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMKPiA+
IGluZGV4IDIzNjQxZTgyYTlkZi4uYmEzNDc3MTk3Nzg5IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvdGltZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90aW1lLmMKPiA+
IEBAIC0xMiw2ICsxMiw3IEBACj4gPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ICAjaW5jbHVk
ZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ID4gICNpbmNsdWRlIDxhc20vdGltZXguaD4KPiA+ICsjaW5j
bHVkZSA8YXNtL3BhcmF2aXJ0Lmg+Cj4gPgo+ID4gIHVuc2lnbmVkIGxvbmcgcmlzY3ZfdGltZWJh
c2UgX19yb19hZnRlcl9pbml0Owo+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKHJpc2N2X3RpbWViYXNl
KTsKPiA+IEBAIC00NSw0ICs0Niw2IEBAIHZvaWQgX19pbml0IHRpbWVfaW5pdCh2b2lkKQo+ID4g
ICAgICAgICB0aW1lcl9wcm9iZSgpOwo+ID4KPiA+ICAgICAgICAgdGlja19zZXR1cF9ocnRpbWVy
X2Jyb2FkY2FzdCgpOwo+ID4gKwo+ID4gKyAgICAgICBwdl90aW1lX2luaXQoKTsKPiA+ICB9Cj4g
PiAtLQo+ID4gMi40My4wCj4gPgo+IAo+IE90aGVyIHRoYW4gdGhhdCwgbGd0bS4KPiAKPiBSZXZp
ZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgpUaGFua3MsCmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
