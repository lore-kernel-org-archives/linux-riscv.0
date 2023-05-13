Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B00C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4Q0dTCM8fWRC0aiZhkInbzCq+X+PW7RWfKvRyOHxeg=; b=4bIUsjOmIVB8Ea
	8GXI9QOgIN6hSHFnNZf5fABTSMA0Yezca7TfwqVJu5/Yyhr+7d7vtjdYoilm8n/KERjjnfWnXIXGz
	hZb8BDSmQP00y/PYOnXKCx1f/YLekrcWHnfUY8IRh5EPsJO9j/aiISzZ+KwVQpOl+hDtasv0D4hET
	W5+ApVjq0y39D0poJlF4jhCT8pT5FzABQRTPID9uilTQ4Y14k7CVT1jTgAjxW5i4kew/1+LSWS7nI
	ZLLuRwte8s3435p1l+RRfrLD+1im4usviaH/BRSHAqXe/2L3MXTohcmlIi64smlvbimx7NxS/y+FS
	MGox6yKJidIlI3YdrHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxwNf-00Fohi-2B;
	Sat, 13 May 2023 21:02:19 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxwNd-00FogF-13;
	Sat, 13 May 2023 21:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1684011649; i=deller@gmx.de;
	bh=S8BdFQeWXnw0k7xb/Pd2AhJXn5drG2VSOAIP2nWf5C4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mcUG47eX0Gn5veG6Ma/ul80RdUo6bsI8PVfZz0zKmUflnHrmh7e47BPa5vNQH5AE5
	 xN8t8csT87bACHCqA8OsuJ2hWYdHBaim0kPYxyJPyGV+wdFIZqdMZ2KWJkGpMA71P/
	 egT+C+AIP++kGZ4bJ4izMXA5xAwpUSXSFsk26PUoT8kKqTDoQAx1/dB+6F6qtKXT3r
	 GvfRk5+vnzNiG67CzR+x13ghBN34jZ4cPRgxhCtav+HMxKP6wiojHtau4ptA6nVxv6
	 cehya8971oTBpuL9wmCK7IO8pT5+JyFocI4nxvSEkGnCMrJGyPpXH1ZFrtHGaJENlu
	 oDzqQ+ljsk/Dw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.158.250]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1puuDq2TVb-0036k5; Sat, 13
 May 2023 23:00:49 +0200
Message-ID: <f918a8af-5a9b-1309-e19a-4f3f09ebab7f@gmx.de>
Date: Sat, 13 May 2023 23:00:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [patch V4 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20230512203426.452963764@linutronix.de>
 <12207466.O9o76ZdvQC@natalenko.name>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <12207466.O9o76ZdvQC@natalenko.name>
X-Provags-ID: V03:K1:RpgEId2B9D5HBcL9fBRb+3JWwwhOteIZ1nytZcasaTAmfarvNwn
 fMFgkrHHFQUTus1MzALvRPziABh8c3qvbp7zrAUgbDN6l4imCV7IS4gxdfOdNFI3zgs3XcO
 11oz6jBIU+1Ra6lyKd+YTydDGuvPMiAY0/gQGWH75WYI+9H8qnSK0e5rvRvnBk3gV+e2mh4
 /Iype0ZePC7XiPoEhVRJQ==
UI-OutboundReport: notjunk:1;M01:P0:ea8O6TsDxRo=;lqMJCETSNInGwiqOiM4sQMSPd/7
 etoWsuDh2oxQRCTcOm6dNI+74udQOMfHHsm5ViBWq91/zE7BHjEibpBxtH5P3frWwqkILGDJY
 77TFvDyNXPxd7F47SPcZN1Y3tC0PxkAf8D2O4cXgxGzfXcqh6ZU5OdAWofsVnHmYksoaSdtQK
 /sdWCcq3GNm8Op/iz5sawvt5qV1caIjxirPF8NcX0+HOQDWTmdrgC3KQzahSNe6sgpUYU6A0L
 mj7+P2ZJAxwQSxuoPapXn3E9fK1sETKVzH5EkA2MRPR0BSWfZGm58+nvXtGRoh46V31D9fD3Q
 NgyF0MBkq1h5MMqm1cehrsOqM2fbQUc0mMtImW91/3B0tJVWvww1nAEia9y/XTCE6oKIP/2gr
 +84+DVNsM/OlplgxXAFgsPN0eCrTWdSERofcLepJeNo96NsytLDtOEC7en5zvPV0KkUQe00QS
 7rl6hFiJ2MYRqfAsgTAw+jmhG8FlpDZPBv8Qq+5EkCGTbFJhfELHNgSJGuuUlUFEGFIKg7jXn
 TbfcaEF6rc4H+WtmaiTMOKNj/SAINwPT+rP+dvyLp2D+729pu0fnQ5k2EkmED+YwXds8vE225
 wFJ3/ZTMghskjLsZVfA+2lbtPTtpXWJ2p2zBBziSEqo2Kk1sKdgS8zq+73wIqibIA4jML/dNg
 OjnqB1D1UaKpKshMSbg63O+5KVXRw0oSgTABWdEzITLhLZrpla6aYa+4BT2wx4mVopNigTidP
 6HmdhUQpPsfRRdKs/r4DivnIBsaKGWFyGuHjs39P1LTXCnQY+bq7LDx/BcQ49EV022T0FmVHP
 KfxdeSRzDf8VaI7h0Pu+Db96WH9ssPLUVoP+CljJisx2W/IBROPWWx2uhxuL/WIb5UkL14enC
 X/qSeD3BduOA1I9b5VZJterCRzLCiAvjZkN8LbeJOzVdVWMV4EDWlFIivJLXJf7C5BFFtiTfU
 ffX/dDZ8QuTU2qdmz3lPDMkbZx0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_140217_671912_8AC3BED7 
X-CRM114-Status: GOOD (  11.36  )
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

SGkgVGhvbWFzLAo+IE9uIHDDoXRlayAxMi4ga3bEm3RuYSAyMDIzIDIzOjA2OjU2IENFU1QgVGhv
bWFzIEdsZWl4bmVyIHdyb3RlOgo+PiBUaGlzIGlzIHZlcnNpb24gNCBvZiB0aGUgcmV3b3JrZWQg
cGFyYWxsZWwgYnJpbmd1cCBzZXJpZXMuIFZlcnNpb24gMyBjYW4gYmUKPj4gZm91bmQgaGVyZToK
Pj4KPj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA1MDgxODE2MzMuMDg5
ODA0OTA1QGxpbnV0cm9uaXguZGUKPj4gLi4uCj4+Cj4+IE90aGVyIHRoYW4gdGhhdCB0aGVyZSBh
cmUgbm8gY2hhbmdlcyBhbmQgdGhlIG90aGVyIGRldGFpbHMgYXJlIGFsbCB0aGUgc2FtZQo+PiBh
cyBpbiBWMyBhbmQgVjIuCj4+Cj4+IEl0J3MgYWxzbyBhdmFpbGFibGUgZnJvbSBnaXQ6Cj4+Cj4+
ICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RnbHgv
ZGV2ZWwuZ2l0IGhvdHBsdWcKCkkgdGVzdGVkIHlvdXIgc2VyaWVzIG9uIHRoZSBwYXJpc2MgYXJj
aGl0ZWN0dXJlIGp1c3QgdG8gbWFrZSBzdXJlIHRoYXQgaXQgc3RpbGwgd29ya3MKd2l0aCB5b3Vy
IHBhdGNoIGFwcGxpZWQuCk9uIHBhcmlzYyB0aGUgQ1BVIGJyaW5ndXAgaGFwcGVucyBsYXRlciBp
biB0aGUgYm9vdCBwcm9jZXNzIChhZnRlciB0aGUgaW52ZW50b3J5KSwKc28geW91ciBwYXRjaCB3
b24ndCBoYXZlIGFuIGRpcmVjdCBpbXBhY3QgYW55d2F5LgpCdXQgYXQgbGVhc3QgZXZlcnl0aGlu
ZyBzdGlsbCB3b3JrcywgaW5jbC4gbWFudWFsIENQVSBlbmFibGUvZGlzYWJsZS4KClNvLCB5b3Ug
bWF5IGFkZApUZXN0ZWQtYnk6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT4gIyBwYXJpc2MK
ClRoYW5rcyEKSGVsZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
