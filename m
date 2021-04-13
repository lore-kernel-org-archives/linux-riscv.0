Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277D5C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 10:26:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B2EC61029
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 10:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B2EC61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iG4ckDBwhdvnvsr7V6x/zJAGbpa6kxXplaCJTE0+nQw=; b=lRXlusC21U/PxiaOEfQmzLyvX
	8G0uqAM7kOzTiBPVIVzBYtAQ+K98od3uVs6Rufn/lcH6MqT8uCV+11vzZ4M8poaQmybrLvYwhK/kV
	OaOg15WBZFgW9350KGJpzn7JyK1nvwUf+tkdwaNqCK42OmH7uzgH97IdHx+eWFxy11MSBqaBPn4aq
	ztvNwDPkGIQsmuQZ76f4UQ4qvxUNARbORQwO6c4YeZ5QjfQFoT9U6+kvp4HfZY4//Sp2qSSOwSTH5
	YZ+HJGg8mvIwwBrR1tpRxwckboYA6nej51bMXGg8Jb2HdGj1VbOfnpvgtfYKiAyPCW+aPMSrr1ASR
	4VLXpkJxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWGEo-008rsJ-JO; Tue, 13 Apr 2021 10:25:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGEN-008rov-GD
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 10:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=0lVf0nl5+qZIZ/jwfGQvy92YMy+Bwdb1xbccBw3TFn4=; b=1RapD5m5PdkOQLa5IiG2Gh9WfI
 MHYxnDyCkTjvbsqViDb69AFVWY19+k/lR/ZoQrA9woyVI1d1QuQf8YrMCPeW71j/YbhUM7GXYIox+
 PdDgOFWKn1Pc3mg1FrB6Cj83V7M5SzQnsiS3znsNo8yLvX7dBQPPMvtFLq4izvAZipZcYycuJMtcd
 hbSxJp+nDPwXOF8+2DLvBuSp6Aq+WGEKQrypAR/UgEi7eDb93VsArslqKCZZyz/Hrv+P0L8e5UPYt
 EuiXE8ZbYTGBxy2DJoY/aQD8BFAfVr8Ef8h8mRKHKgfMSgQKDOmV1VKTe20gQ9dse2Mx0q5/wrI53
 g+sxJVcA==;
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGEK-006vP6-RJ
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 10:25:14 +0000
Received: by mail-vs1-xe34.google.com with SMTP id x14so3547590vsc.5
 for <linux-riscv@lists.infradead.org>; Tue, 13 Apr 2021 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0lVf0nl5+qZIZ/jwfGQvy92YMy+Bwdb1xbccBw3TFn4=;
 b=OQucTICyR/tvEMXOZVjDg+CuM65o1aglrPM1pxZwsPXp1hq20Ab1ovqvtWIGG24X+0
 fa8WvN4zl0fWpYqVcXRaQSaRvwZP28mJyVG6tjv6u/oqP5CDONyT4OoUbgqf7iVrzPss
 ZXxDcWSEUkdupAb3uez+3j+IAeZXETzsvlf+0nUM4oQk0RG+7GpkEYm2AiTNMWqQHwe7
 oV079OC27O+PVqHKUUuni8LlJiYch4KoCaksdtWX8vWfpHUeoHDdCWyJp3223DAbe1Y+
 dhuO3xPCWjkggaeGDmyiXboig1YavxvI5GAsv5rrBt5qJR/R6TvavU6R5RFR7hDYmqD+
 NAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lVf0nl5+qZIZ/jwfGQvy92YMy+Bwdb1xbccBw3TFn4=;
 b=rQ8irUr9mgdsFIt724ISjOF1HCt9PPlybiL4lGQTRgjX/8UqxNxcl5UeZLF2buhCZy
 9lgGaLk3ORAliz0fNdChIjimjFxO5kVfymKguklaxkufgRTrDUY/HoZ+/QfzIovviN44
 PiYYZrD2XO39i9n+XcKObml131sHH7SryIIp11yWEZLstIL7JQePXWf/HhpoHq2F3ePd
 f6EEccRB3spR104k29wDy4h4BJGfTGPQHm0uNkSkOb47f7/ETuIB7gPSkep8fz6nvfFi
 j1nT8E+yIeZjGWhrcgbJFXB8rJOyFJwsupV8JdgYCvPqaa1nglO1JysUUT8lDL5VPEtB
 1KOg==
X-Gm-Message-State: AOAM533Bi8snqsKG+4xczDvSD5xu4Oc23Waxvzrt51Sp5kvrBNM42ulA
 6YRlEuFFAq8XqX06wwZF6HoZfVDQMyRhPLt4H+o=
X-Google-Smtp-Source: ABdhPJxnF09LZHIgut/aICnbMhcpqGlRpleSNRviOgql/+Uc9Wy5Lxs0pjY/bNLdVZZrBYZ78aDIZG9tURDVo9wKp1s=
X-Received: by 2002:a67:e40b:: with SMTP id d11mr6143063vsf.23.1618309511657; 
 Tue, 13 Apr 2021 03:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
In-Reply-To: <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Tue, 13 Apr 2021 12:25:00 +0200
Message-ID: <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 catalin.marinas@arm.com, will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_032512_910672_707EED29 
X-CRM114-Status: GOOD (  23.63  )
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTE6MzcgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDEzLCAyMDIxIGF0IDExOjIyOjQw
QU0gKzAyMDAsIENocmlzdG9waCBNw7xsbG5lciB3cm90ZToKPgo+ID4gPiBGb3IgdGlja2V0IGxv
Y2tzIHlvdSByZWFsbHkgb25seSBuZWVkcyBhdG9taWNfZmV0Y2hfYWRkKCkgYW5kCj4gPiA+IHNt
cF9zdG9yZV9yZWxlYXNlKCkgYW5kIGFuIGFyY2hpdGVjdHVyYWwgZ3VhcmFudGVlcyB0aGF0IHRo
ZQo+ID4gPiBhdG9taWNfZmV0Y2hfYWRkKCkgaGFzIGZ3ZCBwcm9ncmVzcyB1bmRlciBjb250ZW50
aW9uIGFuZCB0aGF0IGEgc3ViLXdvcmQKPiA+ID4gc3RvcmUgKHRocm91Z2ggc21wX3N0b3JlX3Jl
bGVhc2UoKSkgd2lsbCBmYWlsIHRoZSBTQy4KPiA+ID4KPiA+ID4gVGhlbiB5b3UgY2FuIGRvIHNv
bWV0aGluZyBsaWtlOgo+ID4gPgo+ID4gPiB2b2lkIGxvY2soYXRvbWljX3QgKmxvY2spCj4gPiA+
IHsKPiA+ID4gICAgICAgICB1MzIgdmFsID0gYXRvbWljX2ZldGNoX2FkZCgxPDwxNiwgbG9jayk7
IC8qIFNDLCBnaXZlcyB1cyBSQ3NjICovCj4gPiA+ICAgICAgICAgdTE2IHRpY2tldCA9IHZhbCA+
PiAxNjsKPiA+ID4KPiA+ID4gICAgICAgICBmb3IgKDs7KSB7Cj4gPiA+ICAgICAgICAgICAgICAg
ICBpZiAodGlja2V0ID09ICh1MTYpdmFsKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKPiA+ID4gICAgICAgICAgICAgICAgIGNwdV9yZWxheCgpOwo+ID4gPiAgICAgICAgICAg
ICAgICAgdmFsID0gYXRvbWljX3JlYWRfYWNxdWlyZShsb2NrKTsKPiA+ID4gICAgICAgICB9Cj4g
PiA+IH0KPiA+ID4KPiA+ID4gdm9pZCB1bmxvY2soYXRvbWljX3QgKmxvY2spCj4gPiA+IHsKPiA+
ID4gICAgICAgICB1MTYgKnB0ciA9ICh1MTYgKilsb2NrICsgKCEhX19CSUdfRU5ESUFOX18pOwo+
ID4gPiAgICAgICAgIHUzMiB2YWwgPSBhdG9taWNfcmVhZChsb2NrKTsKPiA+ID4KPiA+ID4gICAg
ICAgICBzbXBfc3RvcmVfcmVsZWFzZShwdHIsICh1MTYpdmFsICsgMSk7Cj4gPiA+IH0KPiA+ID4K
PiA+ID4gVGhhdCdzIF9hbG1vc3RfIGFzIHNpbXBsZSBhcyBhIHRlc3QtYW5kLXNldCA6LSkgSXQg
aXNuJ3QgcXVpdGUgb3B0aW1hbAo+ID4gPiBvbiB4ODYgZm9yIG5vdCBiZWluZyBhbGxvd2VkIHRv
IHVzZSBhIG1lbW9wIG9uIHVubG9jaywgc2luY2UgaXRzIGJlaW5nCj4gPiA+IGZvcmNlZCBpbnRv
IGEgbG9hZC1zdG9yZSBiZWNhdXNlIG9mIGFsbCB0aGUgdm9sYXRpbGUsIGJ1dCB3aGF0ZXZlci4K
PiA+Cj4gPiBXaGF0IGFib3V0IHRyeWxvY2soKT8KPiA+IEkuZS4gb25lIGNvdWxkIGltcGxlbWVu
dCB0cnlsb2NrKCkgd2l0aG91dCBhIGxvb3AsIGJ5IGxldHRpbmcKPiA+IHRyeWxvY2soKSBmYWls
IGlmIHRoZSBTQyBmYWlscy4KPiA+IFRoYXQgbG9va3Mgc2FmZSBvbiBmaXJzdCB2aWV3LCBidXQg
bm9ib2R5IGRvZXMgdGhpcyByaWdodCBub3cuCj4KPiBHZW5lcmljIGNvZGUgaGFzIHRvIHVzZSBj
bXB4Y2hnKCksIGFuZCB0aGVuIHlvdSBnZXQgc29tZXRoaW5nIGxpa2UgdGhpczoKPgo+IGJvb2wg
dHJ5bG9jayhhdG9taWNfdCAqbG9jaykKPiB7Cj4gICAgICAgICB1MzIgb2xkID0gYXRvbWljX3Jl
YWQobG9jayk7Cj4KPiAgICAgICAgIGlmICgob2xkID4+IDE2KSAhPSAob2xkICYgMHhmZmZmKSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAgICAgICByZXR1cm4gYXRvbWlj
X3RyeV9jbXB4Y2hnKGxvY2ssICZvbGQsIG9sZCArICgxPDwxNikpOyAvKiBTQywgZm9yIFJDc2Mg
Ki8KPiB9CgpUaGlzIGFwcHJvYWNoIHJlcXVpcmVzIHR3byBsb2FkcyAoYXRvbWljX3JlYWQoKSBh
bmQgY21weGNoZygpKSwgd2hpY2gKaXMgbm90IHJlcXVpcmVkLgpEZXRlY3RpbmcgdGhpcyBwYXR0
ZXJuIGFuZCBvcHRpbWl6aW5nIGl0IGluIGEgY29tcGlsZXIgaXMgcXVpdGUgdW5saWtlbHkuCgpB
IGJpdCBsZXNzIGdlbmVyaWMgc29sdXRpb24gd291bGQgYmUgdG8gd3JhcCB0aGUgTEwvU0MgKHdv
dWxkIGJlCm1hbmRhdG9yeSBpbiB0aGlzIGNhc2UpCmluc3RydWN0aW9ucyBhbmQgZG8gc29tZXRo
aW5nIGxpa2UgdGhpczoKCnVpbnQzMl90IF9fc21wX2xvYWRfYWNxdWlyZV9yZXNlcnZlZCh2b2lk
Kik7CmludCBfX3NtcF9zdG9yZV9yZWxlYXNlX2NvbmRpdGlvbmFsKHZvaWQqLCB1aW50MzJfdCk7
Cgp0eXBlZGVmIHVuaW9uIHsKICAgIHVpbnQzMl90IHYzMjsKICAgIHN0cnVjdCB7CiAgICAgICAg
dWludDE2X3Qgb3duZXI7CiAgICAgICAgdWludDE2X3QgbmV4dDsKICAgIH07Cn0gYXJjaF9zcGlu
bG9ja190OwoKaW50IHRyeWxvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQp7CiAgICBhcmNoX3Nw
aW5sb2NrX3QgbDsKICAgIGludCBzdWNjZXNzOwogICAgZG8gewogICAgICAgIGwudjMyID0gX19z
bXBfbG9hZF9hY3F1aXJlX3Jlc2VydmVkKGxvY2spOwogICAgICAgIGlmIChsLm93bmVyICE9IGwu
bmV4dCkKICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgbC5uZXh0Kys7CiAgICAgICAgc3Vj
Y2VzcyA9IF9fc21wX3N0b3JlX3JlbGVhc2VfY29uZGl0aW9uYWwobG9jaywgbC52MzIpOwogICAg
fSB3aGlsZSAoIXN1Y2Nlc3MpOwogICAgcmV0dXJuIHN1Y2Nlc3M7Cn0KCkJ1dCBoZXJlIHdlIGNh
bid0IHRlbGwgdGhlIGNvbXBpbGVyIHRvIG9wdGltaXplIHRoZSBjb2RlIGJldHdlZW4gTEwgYW5k
IFNDLi4uCgo+Cj4gVGhhdCB3aWxsIHRyeSBhbmQgZG8gdGhlIGZ1bGwgTEwvU0MgbG9vcCwgYmVj
YXVzZSBpdCB3YW50cyB0byBjb21wbGV0ZQo+IHRoZSBjbXB4Y2hnLCBidXQgaW4gZ2VuZXJpYyBj
b2RlIHdlIGhhdmUgbm8gb3RoZXIgb3B0aW9uLgo+Cj4gKElzIHRoaXMgd2hhdCBDMTEncyB3ZWFr
IGNtcHhjaGcgaXMgZm9yPykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
