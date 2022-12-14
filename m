Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4466CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tecZZ/WoIahfuCmSvMrLHsqGexV47Jyo5D/Q1qZqUEU=; b=dLHWbv/ty3Xlmc4ycpFaBv3zC1
	f3tdrWiZd+/5vr56Bf0dmIC2w9gRLWXf52yMc0OpTFYHyVb17gjucl+ZaMoyb8uw6m+Kr00luM2ZW
	2EoIPYSDCdj6wgN2GCUgC3aiX/F4pKOv+0E+edtxH3p8galg+MYF1wOEn2X4p6b4hVW2zLKU8KpqP
	gg8sNnvAZURrFFxfZxv4ZO1Duag4ln/3bFPTmL/4b71JVxIieoxQoSdFszc/6/Khay5TL7uUNQa60
	mqcLMWdzVOuKusF8eiSE3G4Ukg1x+6L/orpM1bezZ2SgdGGxNIivp8alY/NElNINyWHkZ6RwslApr
	qXp/uzPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Y27-002Uoa-9Q; Wed, 14 Dec 2022 20:07:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Y22-002Ukq-PL
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 20:07:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id 17so4590177pll.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 12:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H0jYvI03VngWHu7dv8MwY4kRlHri3j1nty37BsCfhkQ=;
        b=46XbYZJeaKRa9E5a8YT6WBW/S5cjoRCJg3WvQEEmcG5KYcc/uzhiaXHwUqzdDVpZsX
         fHPQ9apRLqrATuBdCBihKxeQYIaxRCX9rfYNCqwlWkq1N8Qs4/B1wMFj67vupVddXoZ1
         bwFV0Dud8NTrIXb4LahhAXgaeihIMGWNzZoKBNmyIEs+k1y3sSnpoL6G+y1sclYWBo4H
         rydajxgOARcVlJzK8JFJCt0plT1rBmcjkAghPPgggs/OqkdbuwBd5VoK1gzt3aG534GB
         koIV9aYcXpvJPHX9dtJ/frB7JUHYzjjyC1FJ3uT8tdw+V7yJMi7L3nwKSI0hLO7X7OUn
         Ph5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0jYvI03VngWHu7dv8MwY4kRlHri3j1nty37BsCfhkQ=;
        b=fCrIaorvfSDxugEoRe1PL1LQc9dzTnWVK7ZlCYMbHHgwXf87AXbzBrv2IedwyXsdVu
         nKqe62Ncgo5hHG2YNqOqfky/uu3bSIyy83c57NMI+9lalFS3cNdTF/N8/WodyA7WPAJu
         TVmuA+ZmEsSztH3GyMi8bWdCou933o6sz9vDJHU2u2To4ub/rI9YQrhE+XSEUJLjpmco
         oOvlufoySN7uMb5DwJZpL9phbDU9MipI7hZKd82X6GtNOs3hZhFSjQ7HH44n6oQ58/M6
         bH+kGuQdl0XzJnEL6kCRNZ1rTc+HqjPW6XRqCXoIorkfUC9kHB7fNPw/z9ct9s23FtXq
         kLRQ==
X-Gm-Message-State: ANoB5pkVmlPYE+zcbGZNQEontGojoXZI0gFX3YXNF7gFoMB+UWsNArL8
	ImqEZzDUiNPpCShOLX9/oW2AeQ==
X-Google-Smtp-Source: AA0mqf4GmD3hP0v0HXminWT9iyK39VmpjnKmBUJRfdH6u+Khbcr+wl9iTbxT4trCZ9j1EpYsfw4jEQ==
X-Received: by 2002:a05:6a20:6f08:b0:a2:df6d:e56b with SMTP id gt8-20020a056a206f0800b000a2df6de56bmr9291155pzb.14.1671048425738;
        Wed, 14 Dec 2022 12:07:05 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id o131-20020a62cd89000000b00573eb4a775esm279621pfg.17.2022.12.14.12.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 12:07:05 -0800 (PST)
Message-ID: <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
Date: Wed, 14 Dec 2022 12:07:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, fweimer@redhat.com,
 Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
 atishp@atishpatra.org, guoren@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 bjorn@kernel.org, libc-alpha@sourceware.org, christoph.muellner@vrull.eu,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
 <Y5irn63DQkwumfvW@bruce.bluespec.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y5irn63DQkwumfvW@bruce.bluespec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_120711_063838_8A6892B6 
X-CRM114-Status: GOOD (  30.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMTMvMjIgMDg6NDMsIERhcml1cyBSYWQgd3JvdGU6Cj4gT24gRnJpLCBEZWMgMDksIDIw
MjIgYXQgMTE6NDI6MTlBTSAtMDgwMCwgVmluZWV0IEd1cHRhIHdyb3RlOgo+PiBCdXQga2VlcGlu
ZyB0aGUgViB1bml0IGRpc2FibGVkIGJ5IGRlZmF1bHQgYW5kIHVzaW5nIHByY3RsIGFzIGEgZ2F0
ZWtlZXBlcgo+PiB0byBlbmFibGUgaXQgZmVlbHMgdW5uZWNlc3NhcnkgYW5kIHRlZGlvdXMuCj4+
IEhlcmUncyBteSByZWFzb25pbmcgYmVsb3cgKEknbSBjb2xsYXRpbmcgY29tbWVudHMgZnJvbSBw
cmlvciBtc2dzIGFzIHdlbGwpLgo+IFBsZWFzZSByZWZlcmVuY2UgdGhlIHByZXZpb3VzIGRpc2N1
c3Npb24gWzFdIHdoaWNoIGhhcyBjb3ZlcmVkIHRvcGljcyB0aGF0Cj4gaGF2ZSBub3QgYmVlbiBk
aXNjdXNzZWQgcmVjZW50bHkuCj4KPiBbMV0gaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3Bp
cGVybWFpbC9saW51eC1yaXNjdi8yMDIxLVNlcHRlbWJlci90aHJlYWQuaHRtbCM4MzYxCgpJIHN1
cmUgcmVhZCB0aHJ1IHRoYXQgdGhyZWFkLCBhbmQgbWFueSBtb3JlIDotKSB0byBnZXQgY29udGV4
dC4KVGhlIGhpZ2hsaWdodCBpcyB3ZSBzaG91bGQgc29tZXRoaW5nIGJlY2F1c2UgQVZYL0FNWCBk
byBzbyAob3IgZmFpbGVkIHRvIApkbyBzbykuCkJ1dCBvbiB0aGUgZmxpcCBzaWRlIEFSTSBTVkUg
aXMgbm90IGRpc2FibGluZyB0aGlzIGJ5IGRlZmF1bHQuCllvdXIgb3RoZXIgY29uY2VybnMgc2Vl
bXMgdG8gYmUgcG90ZW50aWFsIHBvd2VyIGltcGxpY2F0aW9ucyBmb3IgbGVhdmluZyAKaXQgb24g
YW5kIHNoYXJpbmcgb2YgViB1bml0IGFjcm9zcyBoYXJ0cyAoc2VlIG1vcmUgb24gdGhhdCBiZWxv
dykKTWF5YmUgbGVhdmluZyBpdCBvbiBhbGwgdGhlIHRpbWUgd2lsbCBiZSBtb3RpdmF0aW9uIGZv
ciBodyBkZXNpZ25lcnMgdG8gCmJlIG1vcmUgY29uc2lkZXJhdGUgb2YgdGhlIGlkbGUgcG93ZXIg
ZHJhdy4KCj4KPj4gMi4gUGVvcGxlIHdhbnQgdGhlIHByY3RsIGdhdGVrZWVwaW5nIGZvciBhYmls
aXR5IHRvIGdyYWNlZnVsbHkgaGFuZGxlIG1lbW9yeQo+PiBhbGxvY2F0aW9uIGZhaWx1cmUgZm9y
IHRoZSBleHRyYSBWLXN0YXRlIHdpdGhpbiBrZXJuZWwuIEJ1dCB0aGF0IGlzIG9ubHkKPj4gYWRk
aXRpb25hbCA0SyAoZm9yIHR5cGljYWwgMTI4IHdpZGUgViByZWdzKSBwZXIgdGFzay4KPiBCdXQg
dmVjdG9yIHN0YXRlIHNjYWxlcyB1cCB0byBhcyBtdWNoIGFzIDI1NmsuICBBcmUgeW91IHN1Z2dl
c3RpbmcgdGhhdAo+IHRoZXJlIGlzIG5vIHBvc3NpYmlsaXR5IHRoYXQgZnV0dXJlIHN5c3RlbXMg
d291bGQgc3VwcG9ydCBtb3JlIHRoYW4KPiBWTEVOPTEyOD8KCkkgbWVudGlvbmVkICJ0eXBpY2Fs
Ii4gQW5kIGJlbG93IGFsc28gc2FpZCB0aGF0IG1lbW9yeSBhbGxvY2F0aW9uIApjb25jZXJucyBh
cmUgbW9vdCwgc2luY2UgZm9yay9leGVjdmUgZmFpbHVyZXMgZHVlIHRvIGZhaWxpbmcgdG8gYWxs
b2NhdGUgCndvdWxkIHRha2UgY2FyZSBvZiB0aG9zZSBhbnl3YXlzLgoKPj4gSWYgdGhhdCBpcyBm
YWlsaW5nLAo+PiB0aGUgc3lzdGVtIGlzIG5vdCBkb2luZyB3ZWxsIGFueXdheXMuIEJlc2lkZXMg
aXQgaXMgbm90IGFuIGlzc3VlIGF0IGFsbAo+PiBzaW5jZSBFTk9NRU0gaW4gY2xvbmUvZXhlY3Zl
IGZvciB0aGUgYWRkaXRpb25hbCBzcGFjZSBzaG91bGQgaGFuZGxlIHRoZQo+PiBmYWlsdXJlIGFu
eXdheXMuIE9ubHkgdmVyeSBzb3BoaXN0aWNhdGVkIGFwcHMgd291bGQgZG93bmdyYWRlIGZyb20g
ZXhlY3V0aW5nCj4+IFYgdG8gU2NhbGFyIGNvZGUgaWYgdGhlIHByY3RsIGZhaWxlZC4KPiBUaGlz
IHNlZW1zIHVubGlrZWx5LiAgQXMgdmVjdG9yIHN1cHBvcnQgZG9lcyBub3QgZXhpc3QgaW4gYW55
IHByZXNlbnQKPiBoYXJkd2FyZSwgYW5kIHRoZSB2ZWN0b3IgZXh0ZW5zaW9uIGlzIG9ubHkgb3B0
aW9uYWwgaW4gdGhlIFJJU0MtViBwcm9maWxlcwo+IHRoYXQgaW5jbHVkZSBpdCwgSSB3b3VsZCB0
aGluayB0aGF0IGl0IGlzIGFsbW9zdCBjZXJ0YWluIHRoYXQgYW55Cj4gYXBwbGljYXRpb24gdGhh
dCBzdXBwb3J0cyBWIHdvdWxkIGhhdmUgYSBmYWxsYmFjayBwYXRoIGZvciB3aGVuIHRoZSBWCj4g
ZXh0ZW5zaW9uIGlzIG5vdCBhdmFpbGFibGUuCgpGb3Igc3BlY2lhbGl6ZWQgY2FzZXMgc3VyZSB3
ZSB3b3VsZCBleHBlY3QgZmF0IGJpbmFyaWVzIHdpdGggSUZVTkMgYmFzZWQgCmRpc3BhdGNoZXMg
KGdsaWJjIG1lbSovc3RyKiBhcmUgb2J2aW91cyBleGFtcGxlcykuIEJ1dCB3aXRoIG5ld2VyIApj
b21waWxlcnMgYXV0b3ZlYyBpcyBpbmNyZWFzaW5nIGJlY29taW5nIGRlZmF1bHQgZXZlbiBhdCBt
ZWRpdW0gCm9wdGltaXphdGlvbiBsZXZlbHMgc3VjaCBhcyAtTzIuIFNvIFYgY29kZSBsaXR0ZXJl
ZCBhbGwgb3ZlciBpcyBqdXN0IGEgCm1hdHRlciBvZiB0aW1lIGZvciB0aGUgcHJvZmlsZXMvdmFy
aWFudHMgd2hpY2ggYWxsb3cgVi4gRm9yIGxlc3MgY2FwYWJsZSAKc3lzdGVtcyB3L28gViB0aGlz
IGlzIGFsbCBidXQgbW9vdCBkaXNjdXNzaW9uIHNpbmNlIGtlcm5lbCBpdHNlbGYgbmVlZCAKbm90
IGJlIGJ1aWx0IHdpdGggViBlbmFibGVkLgoKCj4gQW5vdGhlciBtb3RpdmF0aW9uIGZvciByZXF1
aXJpbmcgdGhhdCB1c2VyIHNwYWNlIHJlcXVlc3QgdXNlIG9mIHRoZSB2ZWN0b3IKPiBleHRlbnNp
b24gaXMgdGhhdCB0aGUgdmVjdG9yIHVuaXQgbWF5IGJlIHNoYXJlZCBiZXR3ZWVuIG11bHRpcGxl
IGhhcnRzCj4gYW5kL29yIGhhdmUgcG93ZXIgb3IgcGVyZm9ybWFuY2UgaW1wbGljYXRpb25zIGlu
IHRoZSBzeXN0ZW0uICBCeSByZXF1aXJpbmcKPiB0aGF0IHVzZXIgc3BhY2UgcmVxdWVzdCBhY2Nl
c3MsIGl0IGFsbG93cyB0aGUgc3lzdGVtIHRvIGRlY2xpbmUgdGhhdAo+IGFjY2VzcywgYW5kIHVz
ZXIgc3BhY2UgY2FuIGhhbmRsZSB0aGlzIGdyYWNlZnVsbHkuCgpCdXQgaW4gdGhpcyBzcGVjaWZp
YyBleGFtcGxlIHdvbid0IHRoZSBwcmN0bCBjYXVzZSBtb3JlIHBhaW4uIFNvIDIgCmNvbmN1cnJl
bnQgcHJvY2Vzc2VzIG9uIDIgZGlmZmVyZW50IGhhcnRzIHdpdGggc2hhcmVkIFYgdW5pdC4gT25l
IHNlbmRzIApwcmN0bCB0byBlbmFibGUgYW5kIG90aGVyIHdhbnRzIHRvIGRpc2FibGUsIHdoYXQg
d291bGQgdGhlIGtlcm5lbCBkby4gCldpbGwgaXQganVzdCBiZSB3aG9ldmVyIGVuZHMgdXAgcnVu
bmluZyBsYXRlciB3aW5zLiBHcmFudGVkIEknbSBub3QgdG9vIApmYW1pbGlhciB3aXRoIGhvdyBz
dWNoIGEgY3Jvc3MtaGFydCBzaGFyaW5nIHdvdWxkIHdvcmsgaW4gYSBWZWN0b3IgCmluc3RydWN0
aW9ucyBiZWluZyBwYXJ0IG9mIElTQcKgICh2cy4gVmVjdG9yIGFjY2VsZXJhdG9yIHdpdGggam9i
IApwdXNoL3B1bGwgYXBwcm9hY2gpCgpIb25lc3RseSBJJ20gc3ltcGF0aGV0aWMgdG8geW91ciBw
b3dlciBjb25jZXJucyB3aXRoIGtlZXBpbmcgViBlbmFibGVkIAphbGwgdGhlIHRpbWUuIEJ1dCB0
aGUgbWVjaGFuaWNzIG9mIGltcGxlbWVudGluZyB0aGlzIHByY3RsIG1ha2VzIG1lIAp3YXJ5LiBB
c3N1bWluZyB0aGlzIGlzIGRvbmUgZnJvbSBkeW5hbWljIGxvYWRlciwgaXQgaW1wbGllcyBsb2Fk
ZXIgCml0c2VsZiBuZWVkcyB0byBiZSBidWlsdCB3aXRoIFYgZGlzYWJsZWQuIFRoaXMgYWxzbyBs
ZWF2ZXMgYnVuY2ggb2YgcGVyZiAKb24gdGFibGUgc2luY2UgbG9hZGVyIGRvZXMgdG9ucyBvZiBv
ZiBzdHJpbmcgYW5kIG1lbW9yeSBvcGVyYXRpb25zIHdoaWNoIApjb3VsZCBwb3RlbnRpYWxseSBi
ZW5lZml0IGZyb20gViBlbmFibGVkIGNvZGUsIGdyYW50ZWQgaXQgaXMgbm90IGRlYWwgCmJyZWFr
ZXIuCgoKCj4gSWYgd2UgYWRkIGEgbWVjaGFuaXNtIGZvciB1c2VyIHNwYWNlIHRvIHJlcXVlc3Qg
YWNjZXNzIHRvIHRoZSB2ZWN0b3IKPiBleHRlbnNpb24sIGFuZCBpdCB0dXJucyBvdXQgdGhhdCBp
dCB3YXMgdW5uZWNlc3NhcnksIHRoZSB3b3JzdCB0aGF0IGhhcwo+IGhhcHBlbmVkIGlzIGEgc2xp
Z2h0IGluY29udmVuaWVuY2UuCj4KPiBJZiB3ZSBkbyBub3QgYWRkIHN1Y2ggYSBtZWNoYW5pc20s
IGFuZCBsYXRlciBkZXRlcm1pbmUgdGhhdCBpdCBpcwo+IG5lY2Vzc2FyeSwgd2UgaGF2ZSBhIG11
Y2ggZ3JlYXRlciBwcm9ibGVtLiAgVGhlcmUgd291bGQgYmUgYmFja3dhcmQKPiBjb21wYXRpYmls
aXR5IGlzc3VlcyB3aXRoIHRoZSBBQkksIGFuZCBzdWNoIGEgbWVjaGFuaXNtIGNvdWxkIHByb2Jh
Ymx5IG5vdAo+IGJlIGZ1bGx5IGltcGxlbWVudGVkIGF0IGFsbCBkdWUgdG8gdGhlIGRlc2lyZSB0
byBzdXBwb3J0IHBvdGVudGlhbCBmdXR1cmUKPiBsZWdhY3kgdmVjdG9yIGNvZGUuCgpWZXJ5IHRy
dWUsIGJ1dCB0aGlzIGluIGl0c2VsZiBpcyBub3Qgc3VmZmljaWVudCBvZiBhIHJlYXNvbiB0byB3
YXJyYW50IAphZGRpbmcgaXQgbm93LgoKPiBUaGlzIGlzIGEgc2ltaWxhciBwcm9ibGVtIG9uIHg4
Ni4gIEFjY29yZGluZyB0byBzb21lLCBpdCB3YXMgaGFuZGxlZCBwb29ybHkKPiB3aXRoIEFWWC01
MTIgYnkgbWlzc2luZyB0aGlzIHR5cGUgb2YgbWVjaGFuaXNtLCBhbmQgaW1wcm92ZWQgd2l0aCBB
TVggWzJdLgo+IFRoZXJlIGlzIG9wcG9ydHVuaXR5IHRvIGxlYXJuIGZyb20gdGhhdCBleHBlcmll
bmNlIGFuZCBkbyB0aGluZ3MgYmV0dGVyIG9uCj4gUklTQy1WLgo+Cj4gWzJdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvODdrMG50YXp5bi5mZnNAbmFub3MudGVjLmxpbnV0cm9uaXguZGUv
CgpSaWdodCwgYnV0IHRoZW4gd2h5IGRpZCBBUk0gU1ZFIGd1eXMgY2hvc2UgdG8gbm90IHRha2Ug
dGhpcyBwYXRoLgoKLVZpbmVldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
