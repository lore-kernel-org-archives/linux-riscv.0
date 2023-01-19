Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2CAC46467
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 22:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5d10k135IQqF4oYiVKKdwK3F5cjum/xYvx2y6Il+RWs=; b=NYow4wSeAtphx3
	52+eXlGlVqz+iyEhtrVGT2NUMzn4kc6lvjppgSUS5KZLp1o6Bf8UzAErCtThJBfsgGKzumNb9A+4u
	Cjw5wC7pb7NYkH06RvA1PDc/waudMi6o81N0/ZRg504zSAMeYzoUEXTTkXwhH0ZQrFCRZ9vZeLVcp
	kaeuwDUwVRAd1uO/cPgC1FfZOLB7BbnafpEjHT0OFo8vfnd59nxn1QQDyBq4OjtnqQPopZQoRsdwq
	kYOHkXePW94QzzNLT83t7C+noDUcbbEBGWsl/BkTFzLz38cyMvWtejKXis275Cg7fISYdR3giERrm
	TPEw7RIL+YbLB8gCPjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pId2i-007OTd-0j; Thu, 19 Jan 2023 22:05:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pId2d-007OSl-Pz
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 22:05:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id 207so2596346pfv.5
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 14:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sVai79VyKVjTclfs4QkNn2Z6tiaBVxHfLb2mb+hHHw=;
        b=P7C5Qc5yNlZSvjJ1A93VaunDMlySpnLK9MDNegAHLhpZr7qseEyn+4yRb2P7PKiSqm
         lJ8knp3FEqe2SL6lgd37Arp1mZA2kk2/ea8W4cxljSfoREDVhLSJLtKTs5DaGzmz19T7
         3sL9BdY+GWwB8miGP/TLr89W2Oa+bbOM04hHJoHAw+YfgvAw+KvxoFayyIRc3Gu9swDv
         cfqM0sqwkGE54ukEXzAo+KhsKkvBzzAPsOD9K6jgH2KVHtVpDKCFe/ZdEVQHb9MI3Ukb
         +dMfKjLdUud8S0JAVV2RIrzv8Fm7FKuYVd7qgmgX9x2hQYN8nlbWjKZyq24U4huG8eMq
         EoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sVai79VyKVjTclfs4QkNn2Z6tiaBVxHfLb2mb+hHHw=;
        b=grtHZw9FqV9JCBdA7CsewKNZUoAQHU3ZI4JEBSVodyZYSn50CjvnBJPVqDumNnGmZw
         fWuHp9Dg06Mi7sZHgsPE1Pgj7ZWkjI1rnfsC0nAP0ZKMTv7coW8I88T68DZLucShDCPn
         tJ43TAbPWdvs9F+bbI8FFqlY5AaeSWJ8zq13ayZ/e6/Rl/eBVf3JxSA33aidMpnJj3YT
         4iGr0MeQ1wykgeWFrRigO8w2AnUs2lMhS0QKMwtzOSW5whmmKI+abX2b982gwzjpW9cb
         HykImM3kIN6t7DiqP4Y5DQXTLCdiEaVFLrOW9O3hRVuE/nVExStuWAo0/4pWHlDjAHhP
         1Vpw==
X-Gm-Message-State: AFqh2kp2PnR2yQZjbFe72Uww6H9OXDGAgy3S2n9dvJy/MHVyfv8P/bt/
	t6KUepkmR9a4rQYlTIKPBWZXsg==
X-Google-Smtp-Source: AMrXdXskzOKBgZDhvVuOqyiEkPETrZSj1IAtdFhfCUtpTmunicD6BpXIfkxMquF9ieQHpi0aqRDjRw==
X-Received: by 2002:a62:5341:0:b0:57f:c170:dc6 with SMTP id h62-20020a625341000000b0057fc1700dc6mr11163092pfb.14.1674165949869;
        Thu, 19 Jan 2023 14:05:49 -0800 (PST)
Received: from [10.0.17.151] ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a19-20020aa79713000000b0058e0bad6705sm872274pfg.67.2023.01.19.14.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 14:05:49 -0800 (PST)
Message-ID: <67c50e8d-ae78-076d-cf25-b7781f2209d7@rivosinc.com>
Date: Thu, 19 Jan 2023 14:05:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] riscv: elf: add .riscv.attributes parsing
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com
References: <c2177e4e-e97d-448a-73e7-c50622fdc4bb@rivosinc.com>
 <20230119174357.3550008-1-vineetg@rivosinc.com>
 <EB6B06BB-C65F-41C2-8D9F-F916F3A706FA@jrtc27.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <EB6B06BB-C65F-41C2-8D9F-F916F3A706FA@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_140552_068259_FB246118 
X-CRM114-Status: GOOD (  21.13  )
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

T24gMS8xOS8yMyAxMjozMywgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+ICsKPj4gKy8qCj4+ICsg
KiBQYXJzZSBhIHNpbmdsZSBlbGYgYXR0cmlidXRlLgo+PiArICovCj4+ICtzdGF0aWMgaW50IHJ2
X3BhcnNlX2VsZl9hdHRyX3NhZmUodW5zaWduZWQgY2hhciAqKmRwcCwgdW5zaWduZWQgY2hhciAq
cF9lbmQpCj4+ICt7Cj4+ICsJdW5zaWduZWQgY2hhciAqcCA9ICpkcHA7Cj4+ICsJdW5zaWduZWQg
Y2hhciAqc3RyOwo+PiArCXU2NCB0YWcsIHZhbDsKPj4gKwl1MzIgc19sZW47Cj4+ICsKPj4gKwlp
ZiAoZGVjb2RlX3VsZWIxMjhfc2FmZSgmcCwgJnRhZywgcF9lbmQpKQo+PiArCQlnb3RvIGJhZF9h
dHRyOwo+PiArCj4+ICsJc3dpdGNoICh0YWcpIHsKPj4gKwljYXNlIFJWX0FUVFJfVEFHX3N0YWNr
X2FsaWduOgo+PiArCQlpZiAoZGVjb2RlX3VsZWIxMjhfc2FmZSgmcCwgJnZhbCwgcF9lbmQpKQo+
PiArCQkJZ290byBiYWRfYXR0cjsKPj4gKwkJaWYgKCFFTEZfQVRUUl9UQUdfRVZFTih0YWcpKQo+
PiArCQkJZ290byBiYWRfYXR0cjsKPiBIdWg/IFlvdSBqdXN0IGNoZWNrZWQgaXQgYWdhaW5zdCBh
IGNvbnN0YW50IHNvIHlvdSBrbm93IGV4YWN0bHkgd2hhdCBpdAo+IGlzLiBUaGlzIGlzIGp1c3Qg
U3RhdGljX2Fzc2VydChSVl9BVFRSX1RBR19zdGFja19hbGlnbiAlIDIgPT0gMCkgYnV0IGF0Cj4g
cnVuIHRpbWUuIEFuZCB5b3Uga25vdyB0aGF04oCZcyBnb2luZyB0byBiZSB0aGUgY2FzZSwgYmVj
YXVzZSB0aGUgc3BlYyBpcwo+IHNlbGYtY29uc2lzdGVudCBieSBkZXNpZ24gKHdvdWxkbuKAmXQg
YmUgYSB3b3J0aHdoaWxlIHNwZWMgb3RoZXJ3aXNlKS4KCk1ha2VzIHNlbnNlLgoKPj4gKwkJcnZf
ZWxmX2F0dHJfaW50KHRhZywgdmFsKTsKPj4gKwkJYnJlYWs7Cj4+ICsKPj4gKwljYXNlIFJWX0FU
VFJfVEFHX3VuYWxpZ25lZF9hY2Nlc3M6Cj4+ICsJCWlmIChkZWNvZGVfdWxlYjEyOF9zYWZlKCZw
LCAmdmFsLCBwX2VuZCkpCj4+ICsJCQlnb3RvIGJhZF9hdHRyOwo+PiArCQlpZiAoIUVMRl9BVFRS
X1RBR19FVkVOKHRhZykpCj4+ICsJCQlnb3RvIGJhZF9hdHRyOwo+PiArCQlydl9lbGZfYXR0cl9p
bnQodGFnLCB2YWwpOwo+PiArCQlicmVhazsKPj4gKwo+PiArCWNhc2UgUlZfQVRUUl9UQUdfYXJj
aDoKPj4gKwkJaWYgKEVMRl9BVFRSX1RBR19FVkVOKHRhZykpCj4+ICsJCQlnb3RvIGJhZF9hdHRy
Owo+PiArCQlzdHIgPSBwOwo+PiArCQlzX2xlbiA9IHN0cm5sZW4ocCwgcF9lbmQgLSBwKSArIDE7
Cj4+ICsJCWlmICgocCArIHNfbGVuKSA+IHBfZW5kKQo+PiArCQkJZ290byBiYWRfYXR0cjsKPj4g
KwkJcCArPSBzX2xlbjsKPj4gKwkJcnZfZWxmX2F0dHJfc3RyKHRhZywgc3RyKTsKPj4gKwkJYnJl
YWs7Cj4+ICsKPj4gKwlkZWZhdWx0Ogo+IFRoZSB3aG9sZSBwb2ludCBvZiB0aGUgZXZlbi9vZGQg
c3BsaXQgaXMgc28gdGhhdCB3aGVuIHlvdSAqZG9u4oCZdCoga25vdwo+IHdoYXQgdGhlIHRhZyBt
ZWFucyB5b3UgY2FuIHN0aWxsIGRlY29kZSBpdHMgdmFsdWUgYW5kIHRodXMga25vdyBob3cgdG8K
PiBza2lwIHBhc3QgaXQuIFRoYXQgaXMsICpoZXJlKiBpcyB3aGVyZSB5b3UgbmVlZCB0byBiZSBj
aGVja2luZwo+IGV2ZW4vb2RkLCBhbmQgZGVjaWRpbmcgd2hldGhlciB0byB0cmVhdCBpdCBhcyBh
IHN0cmluZyBvciBhIFVMRUIxMjgsCgpJIHNlZSB0aGUgcG9pbnQuIFdlIGNhbiBpZ25vcmUgdGhl
IHNwZWNpZmljIHRhZ3MgYW5kIGp1c3QgdHJlYXQgb2RkIGFuZCAKZXZlbiB0YWdzIGFzIHN0cmlu
ZyBhbmQgaW50IHJlc3BlY3RpdmVseS4KQW5kIGtlZXAgYSBsb29zZSBjaGVjayBvZiB0aGUga25v
d24gdGFncyB2cy4gdW5rbm93bi4KCj4gd2hpY2ggaXMgd2h5IEkgYW5ub3RhdGVkICpoZXJlKiBu
b3Qgb25lIG9mIHRoZSBvdGhlciBjYXNlIGxhYmVscyBiZWZvcmUuCgpPSy4gSSByZWFsbHkgbmVl
ZCB0byBwYXkgYXR0ZW50aW9uIHRvIHdoYXQgYW5kIHdoZXJlIHRvIHlvdXIgY29tbWVudHMgOi0p
CgoKPgo+PiArCW1lbXNldChidWYsIDAsIFJWX0FUVFJfU0VDX1NaKTsKPj4gKwlwb3MgPSBwaGRy
LT5wX29mZnNldDsKPj4gKwluID0ga2VybmVsX3JlYWQoZiwgJmJ1ZiwgcGhkci0+cF9maWxlc3os
ICZwb3MpOwo+PiArCj4+ICsJaWYgKG4gPD0gMCkKPj4gKwkJcmV0dXJuIC1FSU87Cj4gMCBzaG91
bGQgYmUgRU5PRVhFQyBub3QgRUlPPyBBbmQgc3VyZWx5IGluIHRoZSA8IDAgY2FzZSB5b3Ugd2Fu
dCB0byBiZQo+IGZvcndhcmRpbmcgb24gdGhlIGV4YWN0IGVycm9yIGZyb20ga2VybmVsX3JlYWQs
IG5vdCBzcXVhc2hpbmcgaXQgaW50bwo+IEVJTz8KClJpZ2h0LgoKPgo+PiArLyoKPj4gKyAqIEhv
b2sgaW52b2tlZCBieSBnZW5lcmljIGVsZiBsb2FkZXIgdG8gcGFyc2UgcmlzY3Ygc3BlY2lmaWMg
ZWxmIHNlZ21lbnRzLgo+PiArICovCj4+ICtpbnQgYXJjaF9lbGZfcHRfcHJvYyh2b2lkICpfZWhk
ciwgdm9pZCAqX3BoZHIsIHN0cnVjdCBmaWxlICplbGYsCj4+ICsJCSAgICAgYm9vbCBpc19pbnRl
cnAsIHN0cnVjdCBhcmNoX2VsZl9zdGF0ZSAqc3RhdGUpCj4+ICt7Cj4+ICsJc3RydWN0IGVsZl9w
aGRyICpwaGRyID0gX3BoZHI7Cj4+ICsJaW50IHJldCA9IDA7Cj4+ICsKPj4gKwlpZiAocGhkci0+
cF90eXBlID09IFBUX1JJU0NWX0FUVFJJQlVURVMgJiYgIWlzX2ludGVycCkKPiBCb3RoIHRoZSBl
eGVjdXRhYmxlIGFuZCBpdHMgaW50ZXJwcmV0ZXIgbWF0dGVyLgoKT0suCgpUaHgsCi1WaW5lZXQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
