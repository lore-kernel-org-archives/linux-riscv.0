Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A333C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbBb0kdEJNsL1m6yYWtETrxSQgm0Fu4liA0dd9NCn0c=; b=tYCWHnQAn9iQVP
	lztwBlWGDCpQvMW2vGOSt/wajk/vQO1K3qMSSvDa1TPAEmroClTsgepXgQJ8yricsXcQ74h8qPRyh
	eqCOjTt8ayUMBl02I21EuqYPcUv1GV3g8xTwFBPpPHUkN4iTU2EjTjZLyw/NDb2t0Xm3OGZlz8udz
	CSHOw2TU5XlZiVrEru0VUq9LyuXTuyUYH72vs+MxYOClxngqpZI9loCmnu9UkxWOReeCKdDuKvaZW
	1zlbv9MHK+FG9nD7W3Nw7d0tjeSoBQIYxJPZ1Sknkqac+C0Ori9grUNA2M0ewleQLuHt9jCJH3HK9
	Qo3PQH94xdDjvR3/J65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwfn-0000000Cmf6-2X2A;
	Thu, 10 Jul 2025 19:11:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuJd-0000000CTty-0xRo
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Jul 2025 16:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Nrn4nfiPG+tAqCMVAZ7jqIn9oEnuj7dwUbTTAq45dGg=; b=pAYJaz1kVALRgfRMP69JrOr2r7
	Y7z9SGFlp89TIEdUI+lf/bwKAJUI3tOR9Jwqj68EokdnEzEQQU0zeInp7/f7TG1Fp6DUF1BZTR/Jl
	FhWELEo+kMdFiyaBDudLLhzy8Nb8SC8se7yX+X8SKKw63X/4LXSWKNzafBri3ff73TO8a68vkDhcO
	HgH+LqC9yWxmcT9Xpdkc62XSMHgrR32U4LtBQ0sSjbzGNxlHxopc8p3ulo7/sbfuRpnWJ1pEZw6if
	yQJSCVcP9AcPRYdVUhU6PbOezWXuTNCSdB+rhLK2yqcRdSp//2NdqULSsW1Jufyf1GjtOUhQFJKVF
	+o8eXm2w==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuJZ-000000094rj-3L03
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 16:40:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so119033f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752165603; x=1752770403; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nrn4nfiPG+tAqCMVAZ7jqIn9oEnuj7dwUbTTAq45dGg=;
        b=FC9vTtqJMUFNank2SN1Fq9Dn8n4BPmy1C64r1Jtfe5JT+038pHDXtaa4wNwg0txtHr
         OCxhKIAZ2nMrS1QLqCQHO4nlUDCJwudMNzh+bS6rVFWT0gr/76Z4JFGWod1HPUzHYAzc
         d3DTRXZl9Atk3PBxVO2lWZziEPj649Y/PHY8A6iE6T1YV2J3+hfc1wVJtcNeZS83o/sH
         EMDNKymbkLGmVOfqI8FhPG71YEjNhfmCFWo+UFp/lAfzNHaux0X0sQewqnN9Vjxt1DP7
         RLCs/pwgT6quuBGyFsb/USe2OF1d79xCP+ibjqN5odbQvd0s9eSo3jErguUUvLu7B/tz
         1xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752165604; x=1752770404;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nrn4nfiPG+tAqCMVAZ7jqIn9oEnuj7dwUbTTAq45dGg=;
        b=OMoy9pRxgf7x7tJ0tk92cn0ry3/9SHxiFVWFqs8v/i6nIlcJWWmb2eaBuazadEtL3z
         L/Z51GZ7wXQ7FNJiM/SfC/79FlmLyJ4IAv8IJt54Ic07PopBdzjRrRHGuAjBVJITaQGk
         m4eK1Yo8cVtf4b545PrnpqqGIwiArOygOYZsp9MZWSmwBiWZRttKRCocB6bVuXKdBokZ
         E167BtBykOUWzZ7JUDcTknz/jopFAQB9EwXiTAx+11+dcDASlvk9K02wG4EeDWmbYmrU
         rwzOHAsrrsdpo4YixvAhNrikmo0s1kGAJjDIVeCySdcll4gRFJ5SiH2H3a+bhQhdeMYU
         CqWA==
X-Forwarded-Encrypted: i=1; AJvYcCWl5WAlgi4R663rQduri13meZz6rJ/Xje/tMSaicWX/I1HXDj+bP+/SH/hAkA9PW0YKQ+uM9gj6aFXO6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9UoQdcUeDcvkl9jvhgz3YDEJW45xrMOWuGKsCWFoUvAyG8Uk2
	8NvG8ArI8db6aGbTEjFnJXhmaKrZ82WRC7HQznCUKG/TraY+WFklKy027rBHmJTLKVg=
X-Gm-Gg: ASbGncu0MCplYBCRkGxgJGdd75SHAwUsGxaJXJA8yhSvJZQ1DRsKGL2mzOCgv91F4Vj
	GFK2AoGhDsjckD2KwQE8DWcwEzOmZDrOcKTtZ5zCq6HGiaORRit8zjXeeY2erpKvupQE6U9fSLI
	0+HqRR/4PU5BxQyFfg5mnActTDwg7Y7N3A/2S11EilAF+j6USr6OoKo7yr5rVMlbdNUBrC5BX9Y
	kW0Pvg1xaKhijpJMwijLS7DbSctWpeAlW11zx/QZKh5EuzztNrbYasrFIVX6pSPPLJlx6y3+AII
	Y1bmEEySw2RM7FklVYbE7KX+99Z441k19nY0EutUFNOTZGx5wm8w8ZBX4C7YyFgSKP5E0w==
X-Google-Smtp-Source: AGHT+IFz1D8/12XwlMH9nD/1jWSY5+ZD+bTmwmjROaWHbn7m2/jSD8nUPromTyulLxho5aGATXbK1g==
X-Received: by 2002:a05:6000:18a3:b0:3a3:584b:f5d7 with SMTP id ffacd0b85a97d-3b5f186afb6mr95564f8f.5.1752165603110;
        Thu, 10 Jul 2025 09:40:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:bf57:83e8:7a62:80b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d511b43csm60588395e9.37.2025.07.10.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:40:02 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Jul 2025 18:40:02 +0200
Message-Id: <DB8IV9GMLI6X.25TJF0WMVHZEM@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: [PATCH] RISC-V: store precomputed percpu_offset in the task struct
Cc: <masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas.schier@linux.dev>,
 <dennis@kernel.org>, <tj@kernel.org>, <cl@gentwo.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <andybnac@gmail.com>, <bjorn@rivosinc.com>,
 <cyrilbur@tenstorrent.com>, <rostedt@goodmis.org>, <puranjay@kernel.org>,
 <ben.dooks@codethink.co.uk>, <zhangchunyan@iscas.ac.cn>,
 <ruanjinjie@huawei.com>, <jszhang@kernel.org>, <charlie@rivosinc.com>,
 <cleger@rivosinc.com>, <antonb@tenstorrent.com>, <ajones@ventanamicro.com>,
 <debug@rivosinc.com>, <haibo1.xu@intel.com>, <samuel.holland@sifive.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, <wangziang.ok@bytedance.com>
To: "yunhui cui" <cuiyunhui@bytedance.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
 <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
 <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
 <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
 <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
 <CAEEQ3wmxJ50PZHVpdexeyy1ELqKw+5mrb+8gRCA4KNj9zsrykA@mail.gmail.com>
In-Reply-To: <CAEEQ3wmxJ50PZHVpdexeyy1ELqKw+5mrb+8gRCA4KNj9zsrykA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_174005_972369_C9D211FC 
X-CRM114-Status: GOOD (  23.79  )
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

MjAyNS0wNy0xMFQxOTo0NzoyNyswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+IE9uIFRodSwgSnVsIDEwLCAyMDI1IGF0IDI6MzXigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+IEl0IHdvdWxkIGJlIHRvIHN0
b3JlIHRoZSBwZXJjcHUgb2Zmc2V0IGluIENTUl9TQ1JBVENIIHBlcm1hbmVudGx5LCBkbwo+PiB0
aGUgZWFybHkgZXhjZXB0aW9uIHJlZ2lzdGVyIHNodWZmbGluZyB3aXRoIGEgcGVyY3B1IGFyZWEg
c3RvcmFnZSwgYW5kCj4+IGxvYWQgdGhlIHRocmVhZCBwb2ludGVyIGZyb20gdGhlcmUgYXMgd2Vs
bC4KPj4gVGhhdCBtZXRob2Qgd291bGQgYWxzbyBlbGltaW5hdGUgd3JpdGluZyBDU1JfU0NSQVRD
SCBvbiBldmVyeSBleGNlcHRpb24KPj4gZW50cnkrZXhpdCwgc28gbWF5YmUgaXQgbWFrZXMgc2Vu
c2UgdG8gdHJ5IGl0IGV2ZW4gaWYgQ1NScyBhcmUgc2xvdy4uLgo+Cj4gQmFzZWQgb24gdGhlIHBh
dGNoLCBvcHRpbWl6YXRpb25zIGZvciBwZXJjcHUgb2Zmc2V0IGhhdmUgYmVlbiBhZGRlZCwKPiB3
aXRoIHRoZSBmb2xsb3dpbmcgZGF0YToKPiA2Ljk4OSA3LjA0NiA2Ljk3NiA2Ljk4NiA3LjAwMSA3
LjAxNyA3LjAwNyA3LjA2NCA3LjAwOCA3LjAzOQo+IEdlb21ldHJpYyBtZWFuOiA3LjAxMzI0ODMw
Mwo+IENvbXBhcmVkIHRvIHJldXNpbmcgdGhlIHNjcmF0Y2ggcmVnaXN0ZXIsIHRoZSBwZXJmb3Jt
YW5jZSBoYXMgaW1wcm92ZWQKPiBieSBhcHByb3hpbWF0ZWx5IDAuNyUuCgpOaWNlLCB0aGFua3Mu
ICBUaGUgQ1NSX1NDUkFUQ0ggYWNjZXNzZXMgc2VlbSBtdWNoIHNsb3dlciB0aGFuIEdQUnMsIGFu
ZApwb3NzaWJseSBldmVuIHNsb3dlciB0aGFuIEwxIGhpdCAtLSB3ZSBtaWdodCBnYWluIG1vcmUg
Ynkgc3RvcmluZyB0aGUKcHJlY29tcHV0ZWQgb2Zmc2V0IGluIHRoZSB0YXNrIHN0cnVjdC4KCkNh
biB5b3UgY2hlY2sgdGhpcyBwYXRjaCBhcyB3ZWxsPwoKKEl0IHNob3VsZCBiZSBjb21wYXJlZCBh
Z2FpbnN0IGEgdmFyaWFudCBvZiBDU1JfU0NSQVRDSCB0aGF0IHVzZXMgdGhlCiBUQVNLX1RJX1BF
UkNQVV9PRkZTRVQgb3B0aW1pemF0aW9ucywgYnV0IHdlIGNhbiB0cnkgdG8gaW50ZXJwb2xhdGUu
IDpdKQoKLS0tODwtLS0KUklTQy1WOiBzdG9yZSBwcmVjb21wdXRlZCBwZXJjcHVfb2Zmc2V0IGlu
IHRoZSB0YXNrIHN0cnVjdAoKRXhwbG9yaW5nIHRoZSBtZW1vaXphdGlvbiB0cmFkZS1vZmYuLi4g
aG9waW5nIHRoYXQgX19zZXRfdGFza19jcHUgY292ZXJzCmV2ZXJ5dGhpbmcuIDopCgpJIGRpZG4n
dCBwdXQgYW55IHRob3VnaCBpbnRvIHdoZXJlIHRoZSBwZXJjcHVfb2Zmc2V0IHNob3VsZCBsaXZl
LCBhbmQKdGhlIG5haXZlIGFwcHJvYWNoIGlzIHRvIHB1dCBpdCBuZXh0IHRvIGNwdS4KVGhpcyBu
ZWVkcyBtb3JlIHdvcmsgdG8gbm90IGJyZWFrIGJ1aWxkIG9uIG90aGVyIGFyY2hlcywgYmVjYXVz
ZSBJCmRpcmVjdGx5IGFkZGVkIFJJU0MtViBzcGVjaWZpYyBjb2RlIHRvIF9fc2V0X3Rhc2tfY3B1
LCB0byBzYXZlIHRpbWUKZmlndXJpbmcgb3V0IHdoZXJlIGVsc2UgaXQgY291bGQgYmUuCi0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCAgICAgICAgIHwgNiArLS0tLS0KIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGVyY3B1LmggICAgICB8IDggKysrKysrKysKIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDMgKystCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zm
c2V0cy5jICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyAgICAgICAgICB8
IDYgKysrKysrCiBrZXJuZWwvc2NoZWQvc2NoZWQuaCAgICAgICAgICAgICAgICAgfCAxICsKIDYg
ZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmNwdS5oCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNt
LmgKaW5kZXggYThhMmFmNmRmZTlkLi4yYTZiODMxZDljZGYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vYXNtLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaApA
QCAtOTEsMTEgKzkxLDcgQEAKICNlbmRpZgogCiAubWFjcm8gYXNtX3Blcl9jcHUgZHN0IHN5bSB0
bXAKLQlSRUdfTCBcdG1wLCBUQVNLX1RJX0NQVV9OVU0odHApCi0Jc2xsaSAgXHRtcCwgXHRtcCwg
UEVSX0NQVV9PRkZTRVRfU0hJRlQKLQlsYSAgICBcZHN0LCBfX3Blcl9jcHVfb2Zmc2V0Ci0JYWRk
ICAgXGRzdCwgXGRzdCwgXHRtcAotCVJFR19MIFx0bXAsIDAoXGRzdCkKKwlSRUdfTCBcdG1wLCBU
QVNLX1RJX1BFUkNQVV9PRkZTRVQodHApCiAJbGEgICAgXGRzdCwgXHN5bQogCWFkZCAgIFxkc3Qs
IFxkc3QsIFx0bXAKIC5lbmRtCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bl
cmNwdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZXJjcHUuaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmMzN2EwZmNlNmViYwotLS0gL2Rldi9udWxsCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyY3B1LmgKQEAgLTAsMCArMSw4IEBACisjaWZuZGVm
IF9fQVNNX1BFUkNQVV9ICisjZGVmaW5lIF9fQVNNX1BFUkNQVV9ICisKKyNkZWZpbmUgX19teV9j
cHVfb2Zmc2V0IChjdXJyZW50X3RocmVhZF9pbmZvKCktPnBlcmNwdV9vZmZzZXQpCisKKyNpbmNs
dWRlIDxhc20tZ2VuZXJpYy9wZXJjcHUuaD4KKworI2VuZGlmCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ro
cmVhZF9pbmZvLmgKaW5kZXggZjU5MTZhNzA4NzlhLi5kYTc3NmI3YTFkMDIgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKQEAgLTYwLDggKzYwLDkgQEAgc3RydWN0IHRocmVhZF9p
bmZvIHsKIAkgKi8KIAlsb25nCQkJa2VybmVsX3NwOwkvKiBLZXJuZWwgc3RhY2sgcG9pbnRlciAq
LwogCWxvbmcJCQl1c2VyX3NwOwkvKiBVc2VyIHN0YWNrIHBvaW50ZXIgKi8KLQlpbnQJCQljcHU7
CisJaW50CQkJY3B1OwkJLy8gVE9ETzogY291bGQgYmUgcGFja2VkIGJldHRlcgogCXVuc2lnbmVk
IGxvbmcJCXN5c2NhbGxfd29yazsJLyogU1lTQ0FMTF9XT1JLXyBmbGFncyAqLworCXVuc2lnbmVk
IGxvbmcJCXBlcmNwdV9vZmZzZXQ7CS8vIFhYWDogcmFuZG9tbHkgcGxhY2VkIGhlcmUKICNpZmRl
ZiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0sKIAl2b2lkCQkJKnNjc19iYXNlOwogCXZvaWQJCQkq
c2NzX3NwOwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKaW5kZXggNmU4YzBkNmZlYWU5Li45YzdiYjRk
N2UzYjMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwpAQCAtNTAsNiArNTAsNyBAQCB2b2lkIGFz
bV9vZmZzZXRzKHZvaWQpCiAjZW5kaWYKIAogCU9GRlNFVChUQVNLX1RJX0NQVV9OVU0sIHRhc2tf
c3RydWN0LCB0aHJlYWRfaW5mby5jcHUpOworCU9GRlNFVChUQVNLX1RJX1BFUkNQVV9PRkZTRVQs
IHRhc2tfc3RydWN0LCB0aHJlYWRfaW5mby5wZXJjcHVfb2Zmc2V0KTsKIAlPRkZTRVQoVEFTS19U
SFJFQURfRjAsICB0YXNrX3N0cnVjdCwgdGhyZWFkLmZzdGF0ZS5mWzBdKTsKIAlPRkZTRVQoVEFT
S19USFJFQURfRjEsICB0YXNrX3N0cnVjdCwgdGhyZWFkLmZzdGF0ZS5mWzFdKTsKIAlPRkZTRVQo
VEFTS19USFJFQURfRjIsICB0YXNrX3N0cnVjdCwgdGhyZWFkLmZzdGF0ZS5mWzJdKTsKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Nt
cGJvb3QuYwppbmRleCA2MDFhMzIxZTBmMTcuLjNjMDljOGYzZTMwYyAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3Qu
YwpAQCAtNDEsNiArNDEsMTEgQEAKIAogc3RhdGljIERFQ0xBUkVfQ09NUExFVElPTihjcHVfcnVu
bmluZyk7CiAKK3ZvaWQgX19pbml0IHNtcF9wcmVwYXJlX2Jvb3RfY3B1KHZvaWQpCit7CisJY3Vy
cmVudF90aHJlYWRfaW5mbygpLT5wZXJjcHVfb2Zmc2V0ID0gcGVyX2NwdV9vZmZzZXQoc21wX3By
b2Nlc3Nvcl9pZCgpKTsKK30KKwogdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1cyh1bnNpZ25l
ZCBpbnQgbWF4X2NwdXMpCiB7CiAJaW50IGNwdWlkOwpAQCAtMTgzLDYgKzE4OCw3IEBAIGludCBf
X2NwdV91cCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKQogewog
CWludCByZXQgPSAwOwogCXRpZGxlLT50aHJlYWRfaW5mby5jcHUgPSBjcHU7CisJdGlkbGUtPnRo
cmVhZF9pbmZvLnBlcmNwdV9vZmZzZXQgPSBwZXJfY3B1X29mZnNldChjcHUpOwogCiAJcmV0ID0g
c3RhcnRfc2Vjb25kYXJ5X2NwdShjcHUsIHRpZGxlKTsKIAlpZiAoIXJldCkgewpkaWZmIC0tZ2l0
IGEva2VybmVsL3NjaGVkL3NjaGVkLmggYi9rZXJuZWwvc2NoZWQvc2NoZWQuaAppbmRleCA0NzVi
YjU5OTgyOTUuLjIxODBhODViMTQwMyAxMDA2NDQKLS0tIGEva2VybmVsL3NjaGVkL3NjaGVkLmgK
KysrIGIva2VybmVsL3NjaGVkL3NjaGVkLmgKQEAgLTIxOTksNiArMjE5OSw3IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBfX3NldF90YXNrX2NwdShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIHVuc2lnbmVk
IGludCBjcHUpCiAJICovCiAJc21wX3dtYigpOwogCVdSSVRFX09OQ0UodGFza190aHJlYWRfaW5m
byhwKS0+Y3B1LCBjcHUpOworCVdSSVRFX09OQ0UodGFza190aHJlYWRfaW5mbyhwKS0+cGVyY3B1
X29mZnNldCwgcGVyX2NwdV9vZmZzZXQoY3B1KSk7CiAJcC0+d2FrZV9jcHUgPSBjcHU7CiAjZW5k
aWYKIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
