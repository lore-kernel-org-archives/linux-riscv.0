Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B463C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDrp+5NauTyVlp4DrFaQPljKhUsAMACdFwW/9Z788PI=; b=ANNFFd0Asr4glG
	5hdIcyTxvM+BpGJAtkAvHJKz8Q7NioeoyPQolgdnsk3QahWV3svt7Mq6FUg1GZpwWf0fUI4DaCurn
	Y1+F8WC7tZTciOP70kKiTK1ESak4RfvjuyGuHq/S6oyon0vI3MWgMTzxRwzhVfHoQ9selzgTGU1cS
	oQLp23OGBfi0tejBy2EUcxevdtqG43oNATbP8qzyB7+YjB5BZ7xU/+xvJNvx2wc6/LoZPzMJVqCNQ
	c4uhU/ThdtVyUeA/g0M/+KAg5n2qneY8Ysua213Lf656vWaWdGKBbSz969k3y/PxHC6rma/TkfzaC
	WHxQeaVcm6UYTfWDvcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSgL-00000001rQP-22bu;
	Tue, 04 Feb 2025 23:50:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSgI-00000001rPE-2eaW
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 23:50:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38632b8ae71so5167106f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 15:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738713013; x=1739317813; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=movgnZFwy/uwDjbn3e7Uu1TimlyTHx+d3CJsskGk2DUPPeQ6OPXWNRcGuPCoPCLmnp
         G2BRMtbLvan5SRKFszbVgwKIAuEGgxdIGWM9Gjk5VmpV6cdkQzZCFjgIkMur4YXZOi70
         HHP6N+UAktZ8T3O5uT+j/knhI5AICZYIH/0fz5bjAcYeTf3KF41b9s8pPTMrCusfZ769
         RxOA4QzY7mpvEcfwuCLgSZ1kM9GWGA6Iq6fgWZBoI6wcYh9fZYUOjdAuVzZX0REc/Kff
         N1DPgg8POTFQZdk0lqVCPC9oVgJ6wcJLKXXXD/4RtH9LtGcHDBYAygLY69f8WaRF/M1O
         Ww8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738713013; x=1739317813;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=ux7Tz4+VbZw9ur1htI6hCTqyAP3X6c1EGHyNWlVlOBQExgmft5HDYy+93TYSd0iYFH
         9nU5IHWBr9y4HlvRXb/tlyZHgdUj0NsvO2sgPYkYQMBjoYgABMrSC7bxdRStae9aKWE/
         73x+vcZAOlSJN/Bq+AgPQb05FxUkntyE0nwHQDcdfEhbh9C1ftUoZ+Xc00yKbGKL0Rr2
         4cX8yEU10e+D2aoFLI+NEdQq8wvxCG8Om8Y8oLYJFL9Ph2Lb74IRWH74d7A/huGtS3Bf
         CX8oTEHgeBVaWgpClL33QC+MYf6PNXHVoq2pbjgzB7PkMLIEA+Sj7FwS1HkdVAGSQMiy
         DHcA==
X-Forwarded-Encrypted: i=1; AJvYcCXkMf2Vv7t/yGQFRj9Yhvrg+Eb5f+HnXqbovfaEKNPL+lZX5F93l6fmPlInCw9Nph0xThn7eW4jNtuHwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDcVkXZJEwuUQrJLTAotUSPummwZxTmJI73Fo7Ci/MYv5Eu/wb
	zlFV5O2poSP0Vk0ctLPoG7XLw7Q4SfsGagx8xOLbfTxUh7nETs2O4m2ABR5ZUL8=
X-Gm-Gg: ASbGncuLM/kzBPHA49r+2cp4AW0aiSB/1mLvAhsZAIZh6PmChlXeCY81z9oyR6CqKDK
	h+57RxUWKT4eoPfmpk+9u6VSB3HgO9DCFC1RSt2Ck3nAGwfnKSsSkFsGh5UDcHNFcYQxxgNclJ0
	1vYXfUHP9jkdW897WIm7X2MBkA/lPMUTpQNKms4ehQwqcGoImKACuNchGZlsjQN9k+C0ts+e9fV
	1hPQ6Ttm6e/4+dzTrwOOraLlCuLFMoMsjPOX4V+g3LmzQbtq+D+C1JqB+6Jb+iPsCGgdhdALErS
	7M3ZFq/YYljGdPP6+Jwwe8azfOxr
X-Google-Smtp-Source: AGHT+IEypTIpZh6mfBdWNl0Yo6S1z/L0NXKr61jortReoHSuVGBqrXhoBHP93m2FnFAjaJ4GCP4WRQ==
X-Received: by 2002:a5d:5f56:0:b0:385:df43:2179 with SMTP id ffacd0b85a97d-38db48bccf9mr352139f8f.17.1738713011907;
        Tue, 04 Feb 2025 15:50:11 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cee41sm16885326f8f.81.2025.02.04.15.50.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2025 15:50:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
Date: Tue, 4 Feb 2025 23:36:23 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Message-Id: <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_155014_666652_00FDBE03 
X-CRM114-Status: GOOD (  16.46  )
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

T24gNCBGZWIgMjAyNSwgYXQgMTg6NTgsIENocmlzdG9waCBMYW1ldGVyIChBbXBlcmUpIDxjbEBn
ZW50d28ub3JnPiB3cm90ZToKPiBBUk02NCBzdXBwb3J0cyBNVEUgd2hpY2ggaXMgaGFyZHdhcmUg
c3VwcG9ydCBmb3IgdGFnZ2luZyAxNiBieXRlIGdyYW51bGVzCj4gYW5kIHZlcmlmaWNhdGlvbiBv
ZiB0YWdzIGluIHBvaW50ZXJzIGFsbCBpbiBoYXJkd2FyZSBhbmQgb24gc29tZSBwbGF0Zm9ybXMK
PiB3aXRoICpubyogcGVyZm9ybWFuY2UgcGVuYWx0eSBzaW5jZSB0aGUgdGFnIGlzIHN0b3JlZCBp
biB0aGUgRUNDIGFyZWFzIG9mCj4gRFJBTSBhbmQgdmVyaWZpZWQgYXQgdGhlIHNhbWUgdGltZSBh
cyB0aGUgRUNDLgo+IAo+IENvdWxkIHdlIGdldCBzdXBwb3J0IGZvciB0aGF0PyBUaGlzIHdvdWxk
IGFsbG93IHVzIHRvIGVuYWJsZSB0YWcgY2hlY2tpbmcKPiBpbiBwcm9kdWN0aW9uIHN5c3RlbXMg
d2l0aG91dCBwZXJmb3JtYW5jZSBwZW5hbHR5IGFuZCBubyBtZW1vcnkgb3ZlcmhlYWQuCgpJdOKA
mXMgbm90IOKAnG5vIHBlcmZvcm1hbmNlIHBlbmFsdHnigJ0sIHRoZXJlIGlzIGEgY29zdCB0byB0
cmFja2luZyB0aGUgTVRFCnRhZ3MgZm9yIGNoZWNraW5nLiBJbiBhc3luY2hyb25vdXMgKG9yIGFz
eW1tZXRyaWMpIG1vZGUgdGhhdOKAmXMgbm90IHRvbwpiYWQsIGJ1dCBpbiBzeW5jaHJvbm91cyBt
b2RlIHRoZXJlIGlzIGEgc2lnbmlmaWNhbnQgb3ZlcmhlYWQgZXZlbiB3aXRoCkVDQy4gTm9ybWFs
bHkgb24gYSBzdG9yZSwgb25jZSB5b3XigJl2ZSB0cmFuc2xhdGVkIGl0IGFuZCBoYXZlIHRoZSBk
YXRhLAp5b3UgY2FuIGJ1ZmZlciBpdCB1cCBhbmQgZGVmZXIgdGhlIGFjdHVhbCB3cml0ZSB1bnRp
bCBzb21lIHRpbWUgbGF0ZXIuCklmIHlvdSBoaXQgaW4gdGhlIEwxIGNhY2hlIHRoZW4gdGhhdCB3
aWxsIHByb2JhYmx5IGJlIHF1aXRlIHNvb24sIGJ1dAppZiB5b3UgbWlzcyB0aGVuIHlvdSBoYXZl
IHRvIHdhaXQgZm9yIHRoZSBkYXRhIHRvIGNvbWUgYmFjayBmcm9tIGxvd2VyCmxldmVscyBvZiB0
aGUgaGllcmFyY2h5LCBwb3RlbnRpYWxseSBhbGwgdGhlIHdheSBvdXQgdG8gRFJBTS4gT3IgaWYg
eW91CmhhdmUgYSB3cml0ZS1hcm91bmQgY2FjaGUgdGhlbiB5b3UganVzdCBzZW5kIGl0IG91dCB0
byB0aGUgbmV4dCBsZXZlbAp3aGVuIGl04oCZcyByZWFkeS4gQnV0IG5vdywgaWYgeW91IGhhdmUg
c3luY2hyb25vdXMgTVRFLCB5b3UgY2Fubm90CnJldGlyZSB5b3VyIHN0b3JlIGluc3RydWN0aW9u
IHVudGlsIHlvdSBrbm93IHdoYXQgdGhlIHRhZyBmb3IgdGhlCmxvY2F0aW9uIHlvdeKAmXJlIHN0
b3JpbmcgdG8gaXM7IGVmZmVjdGl2ZWx5IHlvdSBoYXZlIHRvIHdhaXQgdW50aWwgeW91CmNhbiBk
byB0aGUgZnVsbCBjYWNoZSBsb29rdXAsIGFuZCBwb3RlbnRpYWxseSBtaXNzLCB1bnRpbCBpdCBj
YW4KcmV0aXJlLiBUaGlzIHB1dHMgcHJlc3N1cmUgb24gdGhlIHZhcmlvdXMgbWljcm9hcmNoaXRl
Y3R1cmFsIHN0cnVjdHVyZXMKdGhhdCB0cmFjayBpbnN0cnVjdGlvbnMgYXMgdGhleSBnZXQgZXhl
Y3V0ZWQsIGFzIGluc3RydWN0aW9ucyBhcmUgbm93CmluIGZsaWdodCBmb3IgbG9uZ2VyLiBZZXMs
IGl0IG1heSB3ZWxsIGJlIHRoYXQgaXQgaXMgcXVpY2tlciBmb3IgdGhlCm1lbW9yeSBjb250cm9s
bGVyIHRvIGdldCB0aGUgdGFncyBmcm9tIEVDQyBiaXRzIHRoYW4gdmlhIHNvbWUgb3RoZXIKbWVh
bnMsIGJ1dCB5b3XigJlyZSBhbHJlYWR5IHBheWluZyBtYW55IG1hbnkgY3ljbGVzIGF0IHRoYXQg
cG9pbnQsIHdpdGgKdGhlIHJlbGV2YW50IHN0b3JlIGJlaW5nIHN0dWNrIHVuYWJsZSB0byByZXRp
cmUgKGFuZCB0aHVzIGV2ZXJ5Cmluc3RydWN0aW9uIGFmdGVyIGl0IGluIHRoZSBpbnN0cnVjdGlv
biBzdHJlYW0pIHRoYXQgd2hvbGUgdGltZSwgYW5kIG5vCndyaXRlIGFsbG9jYXRlIG9yIHdyaXRl
IGFyb3VuZCBzY2hlbWVzIGNhbiBoZWxwIHlvdSwgYmVjYXVzZSB5b3UKZnVuZGFtZW50YWxseSBo
YXZlIHRvIHdhaXQgZm9yIHRoZSB0YWdzIHRvIGJlIHJlYWQgYmVmb3JlIHlvdSBrbm93IGlmCnRo
ZSBpbnN0cnVjdGlvbiBpcyBnb2luZyB0byB0cmFwLgoKTm93LCB5b3UgY2FuIGNob29zZSB0byBu
b3QgdXNlIHN5bmNocm9ub3VzIG1vZGUgZHVlIHRvIHRoYXQgb3ZlcmhlYWQsCmJ1dCB0aGF04oCZ
cyBudWFuY2UgdGhhdCBpc27igJl0IGNvbnNpZGVyZWQgYnkgeW91ciByZXBseSBoZXJlIGFuZCBo
YXMgc29tZQpjb25zZXF1ZW5jZXMuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
