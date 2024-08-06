Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95586C52D71
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Spl90JWEndOQkdMaZAEn7uxuHv52vdHiucX/JHv0HUc=; b=Aw36+vShSovPqi
	ge7rGOoPoz+d1SwkLSWdqh8AT1JEWA71oGGoX6zyX4FSx+5w9uPu2+XiTqoihji+uLdE/FixRjt2R
	iLbArThItItaTzuGpXLbA1GwSbqT8N6icgtXTOfK06A7U9CNI5d3NvAXgJ3MMaHMPZpOXqn1fGxIa
	0YsjI1jd7xxjfTKZISpd8oLb96wbKPQUqbzKQmESH6C6NxSiepLGoeaLmtc9saAyGslfLm8P9nbZg
	iOzGufi92/117t4SDaUgS4F/iZVfIqPapGIKx5vOGEAvqJU5PBef0L9GnP3spjwDNNRqTfwRxJ+Rq
	IWQ5NRpEcMnEjXThvrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbM4v-00000002AkP-1nJQ;
	Tue, 06 Aug 2024 15:26:25 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbM4I-00000002AaC-4AJs
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 15:25:52 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-39834949f27so3165585ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722957945; x=1723562745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hSFaWzu7k5+i7urG/rB+QN7qlxFaVHDeVcWBVMpJHI=;
        b=G/XwEVXhWEL3c6Jc5E4AFhqThUpBoAkPiQ9Tt0JNGwK7bWJTkPZbmUbJF9Fg7rQ77z
         hKRkc8U7EYXo4HnOBsBWpCLEX+ta142ryU1ts9zUbQ3hig12LgqeyPTVdmqduGGGYbZK
         zHG7DNryqMWRbEKmaAfPQBi0e2Gk+sUu+meNsQoYsRG2q7Y3DEeRQP8YbmzaMprdhdcF
         KpM43UvfqZcAPAOqvtMxvnYmonlUCdyMSbglBQTup+l3w7y0FkwU149kKWAbPMQlOypF
         IoabEPZYp3NJbPvmMAJjQeyVC6qDzsh+2giZNUtUdlkcW6gpT05uaJ0nQaDaJq0EWsbr
         rdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722957945; x=1723562745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hSFaWzu7k5+i7urG/rB+QN7qlxFaVHDeVcWBVMpJHI=;
        b=kB/c0M3d6VIvFlElH2J8tZvs0bSAkql5kHLp2hXusvwww8C8WZ6fiF+nyxH2Qv7I4C
         H2dCWnj8xGIKYP1U4V1GwzCc00IUJm6era88FYEg67LH7X4W8rmst/7M+0WRHctoguLR
         68SKs+VRv/uorn/F1UDBmNtyVzb1Y12fi8e1HFZABAz1RxcDlzYvUw73FoElbvwOjw4V
         nIEloC/EqkqTOdRRBBGaiFxgxZnK7bCqfCynfYXjSeg5dOCdDeQLJcw+k7IkhAdQTYnS
         6MRpsUQNGsqHDJhOFBu/ZJyzk2OcdBTcSmPXGhL27e3kPsBK/M+e+ics4KBYonYYF4ui
         VlIg==
X-Forwarded-Encrypted: i=1; AJvYcCVczXkjtZKSKT9LWOMGomOuIXsKRxQmMfEpGtjUrKwL/Z4wenD3mDDWGWE+ppqAM+kvaIN37DLU6XFTk2iI59fVSbqKY0TGRHWL+SKngSoO
X-Gm-Message-State: AOJu0Yyz61ZoAmBp45qcvIad15nGdN9sO5lgzV/867eFmCldv02SEZHt
	Z0szvU1j0B2FemqT3RBp6Uf9qqDshzUjm75rjng4nqJ3fuP24f2jdR9imPYfN1TMlp9LeRS9BIJ
	JwFesbEIFxDV9i/sZpKOykg886+1DU1qPAaPKHw==
X-Google-Smtp-Source: AGHT+IFRjj14ZK3zQwhUJXXLBufMqLIkirrDvsuwso/YZ1pLiuKaOUUkzxwFjczveLiPrX3RKPs/9rVwHlLGeDyxf6w=
X-Received: by 2002:a05:6e02:1645:b0:39b:375a:f8b7 with SMTP id
 e9e14a558f8ab-39b375afc45mr146160275ab.23.1722957945281; Tue, 06 Aug 2024
 08:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240729142241.733357-1-sunilvl@ventanamicro.com> <20240729142241.733357-15-sunilvl@ventanamicro.com>
In-Reply-To: <20240729142241.733357-15-sunilvl@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Aug 2024 20:55:34 +0530
Message-ID: <CAAhSdy2ATNkx4cpMLpVrBUbxSG+WVbOFpMA8LQcMAE2jGSs4ng@mail.gmail.com>
Subject: Re: [PATCH v7 14/17] irqchip/riscv-imsic-state: Create separate
 function for DT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Drew Fustini <dfustini@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_082550_130085_8FDD49AF 
X-CRM114-Status: GOOD (  21.60  )
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

T24gTW9uLCBKdWwgMjksIDIwMjQgYXQgNzo1NOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdoaWxlIHBvcHVsYXRpbmcgSU1TSUMgZ2xvYmFsIHN0
cnVjdHVyZSwgbWFueSBmaWVsZHMgYXJlIGluaXRpYWxpemVkCj4gdXNpbmcgRFQgcHJvcGVydGll
cy4gTWFrZSB0aGUgY29kZSB3aGljaCB1c2VzIERUIHByb3BlcnRpZXMgYXMgc2VwYXJhdGUKPiBm
dW5jdGlvbiBzbyB0aGF0IGl0IGlzIGVhc2llciB0byBhZGQgQUNQSSBzdXBwb3J0IGxhdGVyLiBO
bwo+IGZ1bmN0aW9uYWxpdHkgYWRkZWQvY2hhbmdlZC4KPgo+IFN1Z2dlc3RlZC1ieTogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBM
IDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgfCA5NyArKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRl
LmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBpbmRleCA1NDc5
Zjg3MmU2MmIuLmY5ZTcwODMyODYzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXN0YXRlLmMKPiBAQCAtNTEwLDYgKzUxMCw2MCBAQCBzdGF0aWMgaW50IF9faW5pdCBpbXNp
Y19tYXRyaXhfaW5pdCh2b2lkKQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMg
aW50IF9faW5pdCBpbXNpY19wb3B1bGF0ZV9nbG9iYWxfZHQoc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KmZ3bm9kZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGltc2ljX2dsb2JhbF9jb25maWcgKmdsb2JhbCwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdTMyICpucl9wYXJlbnRfaXJxcykKPiArewo+ICsgICAgICAg
aW50IHJjOwo+ICsKPiArICAgICAgIC8qIEZpbmQgbnVtYmVyIG9mIGd1ZXN0IGluZGV4IGJpdHMg
aW4gTVNJIGFkZHJlc3MgKi8KPiArICAgICAgIHJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIodG9f
b2Zfbm9kZShmd25vZGUpLCAicmlzY3YsZ3Vlc3QtaW5kZXgtYml0cyIsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMpOwo+ICsgICAg
ICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICBnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMgPSAw
Owo+ICsKPiArICAgICAgIC8qIEZpbmQgbnVtYmVyIG9mIEhBUlQgaW5kZXggYml0cyAqLwo+ICsg
ICAgICAgcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNj
dixoYXJ0LWluZGV4LWJpdHMiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
Z2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMpOwo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAg
ICAgICAgIC8qIEFzc3VtZSBkZWZhdWx0IHZhbHVlICovCj4gKyAgICAgICAgICAgICAgIGdsb2Jh
bC0+aGFydF9pbmRleF9iaXRzID0gX19mbHMoKm5yX3BhcmVudF9pcnFzKTsKPiArICAgICAgICAg
ICAgICAgaWYgKEJJVChnbG9iYWwtPmhhcnRfaW5kZXhfYml0cykgPCAqbnJfcGFyZW50X2lycXMp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMrKzsKPiAr
ICAgICAgIH0KPiArCj4gKyAgICAgICAvKiBGaW5kIG51bWJlciBvZiBncm91cCBpbmRleCBiaXRz
ICovCj4gKyAgICAgICByYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2Rl
KSwgInJpc2N2LGdyb3VwLWluZGV4LWJpdHMiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmZ2xvYmFsLT5ncm91cF9pbmRleF9iaXRzKTsKPiArICAgICAgIGlmIChyYykKPiAr
ICAgICAgICAgICAgICAgZ2xvYmFsLT5ncm91cF9pbmRleF9iaXRzID0gMDsKPiArCj4gKyAgICAg
ICAvKgo+ICsgICAgICAgICogRmluZCBmaXJzdCBiaXQgcG9zaXRpb24gb2YgZ3JvdXAgaW5kZXgu
Cj4gKyAgICAgICAgKiBJZiBub3Qgc3BlY2lmaWVkIGFzc3VtZWQgdGhlIGRlZmF1bHQgQVBMSUMt
SU1TSUMgY29uZmlndXJhdGlvbi4KPiArICAgICAgICAqLwo+ICsgICAgICAgcmMgPSBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNjdixncm91cC1pbmRleC1zaGlm
dCIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZnbG9iYWwtPmdyb3VwX2lu
ZGV4X3NoaWZ0KTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgZ2xvYmFsLT5n
cm91cF9pbmRleF9zaGlmdCA9IElNU0lDX01NSU9fUEFHRV9TSElGVCAqIDI7Cj4gKwo+ICsgICAg
ICAgLyogRmluZCBudW1iZXIgb2YgaW50ZXJydXB0IGlkZW50aXRpZXMgKi8KPiArICAgICAgIHJj
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIodG9fb2Zfbm9kZShmd25vZGUpLCAicmlzY3YsbnVtLWlk
cyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZnbG9iYWwtPm5yX2lkcyk7
Cj4gKyAgICAgICBpZiAocmMpIHsKPiArICAgICAgICAgICAgICAgcHJfZXJyKCIlcGZ3UDogbnVt
YmVyIG9mIGludGVycnVwdCBpZGVudGl0aWVzIG5vdCBmb3VuZFxuIiwgZndub2RlKTsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qIEZpbmQg
bnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBpZGVudGl0aWVzICovCj4gKyAgICAgICByYyA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2RlKSwgInJpc2N2LG51bS1ndWVzdC1p
ZHMiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZ2xvYmFsLT5ucl9ndWVz
dF9pZHMpOwo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICBnbG9iYWwtPm5yX2d1
ZXN0X2lkcyA9IGdsb2JhbC0+bnJfaWRzOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW50IF9faW5pdCBpbXNpY19nZXRfcGFyZW50X2hhcnRpZChzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHUzMiBpbmRleCwgdW5zaWduZWQgbG9uZyAqaGFydGlkKQo+ICB7Cj4gQEAgLTU3OCw1
MCArNjMyLDkgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVjdCBm
d25vZGVfaGFuZGxlICpmd25vZGUsCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ICAgICAgICAgfQo+Cj4gLSAgICAgICAvKiBGaW5kIG51bWJlciBvZiBndWVzdCBpbmRleCBiaXRz
IGluIE1TSSBhZGRyZXNzICovCj4gLSAgICAgICByYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRv
X29mX25vZGUoZndub2RlKSwgInJpc2N2LGd1ZXN0LWluZGV4LWJpdHMiLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRzKTsKPiArICAg
ICAgIHJjID0gaW1zaWNfcG9wdWxhdGVfZ2xvYmFsX2R0KGZ3bm9kZSwgZ2xvYmFsLCBucl9wYXJl
bnRfaXJxcyk7Cj4gICAgICAgICBpZiAocmMpCj4gLSAgICAgICAgICAgICAgIGdsb2JhbC0+Z3Vl
c3RfaW5kZXhfYml0cyA9IDA7Cj4gLQo+IC0gICAgICAgLyogRmluZCBudW1iZXIgb2YgSEFSVCBp
bmRleCBiaXRzICovCj4gLSAgICAgICByYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25v
ZGUoZndub2RlKSwgInJpc2N2LGhhcnQtaW5kZXgtYml0cyIsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZnbG9iYWwtPmhhcnRfaW5kZXhfYml0cyk7Cj4gLSAgICAgICBpZiAo
cmMpIHsKPiAtICAgICAgICAgICAgICAgLyogQXNzdW1lIGRlZmF1bHQgdmFsdWUgKi8KPiAtICAg
ICAgICAgICAgICAgZ2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMgPSBfX2ZscygqbnJfcGFyZW50X2ly
cXMpOwo+IC0gICAgICAgICAgICAgICBpZiAoQklUKGdsb2JhbC0+aGFydF9pbmRleF9iaXRzKSA8
ICpucl9wYXJlbnRfaXJxcykKPiAtICAgICAgICAgICAgICAgICAgICAgICBnbG9iYWwtPmhhcnRf
aW5kZXhfYml0cysrOwo+IC0gICAgICAgfQo+IC0KPiAtICAgICAgIC8qIEZpbmQgbnVtYmVyIG9m
IGdyb3VwIGluZGV4IGJpdHMgKi8KPiAtICAgICAgIHJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
dG9fb2Zfbm9kZShmd25vZGUpLCAicmlzY3YsZ3JvdXAtaW5kZXgtYml0cyIsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMpOwo+IC0g
ICAgICAgaWYgKHJjKQo+IC0gICAgICAgICAgICAgICBnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMg
PSAwOwo+IC0KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBGaW5kIGZpcnN0IGJpdCBwb3NpdGlv
biBvZiBncm91cCBpbmRleC4KPiAtICAgICAgICAqIElmIG5vdCBzcGVjaWZpZWQgYXNzdW1lZCB0
aGUgZGVmYXVsdCBBUExJQy1JTVNJQyBjb25maWd1cmF0aW9uLgo+IC0gICAgICAgICovCj4gLSAg
ICAgICByYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2RlKSwgInJpc2N2
LGdyb3VwLWluZGV4LXNoaWZ0IiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Jmdsb2JhbC0+Z3JvdXBfaW5kZXhfc2hpZnQpOwo+IC0gICAgICAgaWYgKHJjKQo+IC0gICAgICAg
ICAgICAgICBnbG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0ID0gSU1TSUNfTU1JT19QQUdFX1NISUZU
ICogMjsKPiAtCj4gLSAgICAgICAvKiBGaW5kIG51bWJlciBvZiBpbnRlcnJ1cHQgaWRlbnRpdGll
cyAqLwo+IC0gICAgICAgcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9k
ZSksICJyaXNjdixudW0taWRzIiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Jmdsb2JhbC0+bnJfaWRzKTsKPiAtICAgICAgIGlmIChyYykgewo+IC0gICAgICAgICAgICAgICBw
cl9lcnIoIiVwZndQOiBudW1iZXIgb2YgaW50ZXJydXB0IGlkZW50aXRpZXMgbm90IGZvdW5kXG4i
LCBmd25vZGUpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gLSAgICAgICB9Cj4gLQo+
IC0gICAgICAgLyogRmluZCBudW1iZXIgb2YgZ3Vlc3QgaW50ZXJydXB0IGlkZW50aXRpZXMgKi8K
PiAtICAgICAgIHJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIodG9fb2Zfbm9kZShmd25vZGUpLCAi
cmlzY3YsbnVtLWd1ZXN0LWlkcyIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZnbG9iYWwtPm5yX2d1ZXN0X2lkcyk7Cj4gLSAgICAgICBpZiAocmMpCj4gLSAgICAgICAgICAg
ICAgIGdsb2JhbC0+bnJfZ3Vlc3RfaWRzID0gZ2xvYmFsLT5ucl9pZHM7Cj4KPiAgICAgICAgIC8q
IFNhbml0eSBjaGVjayBndWVzdCBpbmRleCBiaXRzICovCj4gICAgICAgICBpID0gQklUU19QRVJf
TE9ORyAtIElNU0lDX01NSU9fUEFHRV9TSElGVDsKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
